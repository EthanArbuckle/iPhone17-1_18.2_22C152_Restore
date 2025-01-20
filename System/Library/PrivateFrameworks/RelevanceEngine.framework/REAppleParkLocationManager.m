@interface REAppleParkLocationManager
@end

@implementation REAppleParkLocationManager

uint64_t __46___REAppleParkLocationManager_currentLocation__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:37.3353672 longitude:-122.011737];
  uint64_t v1 = currentLocation_AppleParkLocation;
  currentLocation_AppleParkLocation = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __63___REAppleParkLocationManager_startLocationUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) currentLocation];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

@end