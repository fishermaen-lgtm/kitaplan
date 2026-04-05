// ─────────────────────────────────────────────
// KitaShift·KI — Service Worker (PWA Offline)
// © 2026 BDS Bieler Distribution Service
// ─────────────────────────────────────────────

const CACHE_NAME = 'kitashift-v1.2';
const ASSETS_TO_CACHE = [
  '/app.html',
  '/index.html',
  '/legal.html',
  '/manifest.json',
  '/icon-192.png',
  '/icon-512.png',
  '/fonts/dm-sans-v15-latin-regular.woff2',
  '/fonts/dm-sans-v15-latin-500.woff2',
  '/fonts/dm-sans-v15-latin-700.woff2',
  'https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js'
];

// Install: Cache alle Kern-Assets
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('[SW] Caching app assets');
      return cache.addAll(ASSETS_TO_CACHE);
    }).catch(err => {
      console.warn('[SW] Cache failed for some assets:', err);
    })
  );
  self.skipWaiting();
});

// Activate: Alte Caches löschen
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.filter(k => k !== CACHE_NAME).map(k => {
          console.log('[SW] Deleting old cache:', k);
          return caches.delete(k);
        })
      );
    })
  );
  self.clients.claim();
});

// Fetch: Network-first für HTML, Cache-first für Assets
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // API-Calls nicht cachen (Anthropic API)
  if (url.hostname === 'api.anthropic.com') {
    return;
  }

  // HTML-Seiten: Network first, dann Cache
  if (event.request.mode === 'navigate' || url.pathname.endsWith('.html')) {
    event.respondWith(
      fetch(event.request).then(response => {
        const clone = response.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
        return response;
      }).catch(() => {
        return caches.match(event.request) || caches.match('/app.html');
      })
    );
    return;
  }

  // Andere Assets: Cache first, dann Network
  event.respondWith(
    caches.match(event.request).then(cached => {
      if (cached) return cached;
      return fetch(event.request).then(response => {
        if (response.ok) {
          const clone = response.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
        }
        return response;
      });
    }).catch(() => {
      // Offline-Fallback
      if (event.request.destination === 'image') {
        return new Response('<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"><text x="50%" y="50%" text-anchor="middle" dy=".3em" font-size="32">🏡</text></svg>', 
          { headers: { 'Content-Type': 'image/svg+xml' } });
      }
    })
  );
});
