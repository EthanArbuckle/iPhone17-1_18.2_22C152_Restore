@interface WebCoreLocationUpdateThreadingProxy
@end

@implementation WebCoreLocationUpdateThreadingProxy

uint64_t __71___WebCoreLocationUpdateThreadingProxy_geolocationAuthorizationGranted__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) geolocationAuthorizationGranted];
}

uint64_t __70___WebCoreLocationUpdateThreadingProxy_geolocationAuthorizationDenied__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) geolocationAuthorizationDenied];
}

uint64_t __56___WebCoreLocationUpdateThreadingProxy_positionChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) positionChanged:*(void *)(a1 + 40)];
}

uint64_t __54___WebCoreLocationUpdateThreadingProxy_errorOccurred___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) errorOccurred:*(void *)(a1 + 40)];
}

uint64_t __56___WebCoreLocationUpdateThreadingProxy_resetGeolocation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) resetGeolocation];
}

@end