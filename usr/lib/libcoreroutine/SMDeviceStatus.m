@interface SMDeviceStatus
@end

@implementation SMDeviceStatus

void __66__SMDeviceStatus_RTCoreDataTransformable__createWithDeviceStatus___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99858]);
  id v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = (int)[*(id *)(a1 + 32) batteryRemaining];
  uint64_t v4 = (int)[*(id *)(a1 + 32) cellularStrength];
  v5 = [*(id *)(a1 + 32) date];
  uint64_t v6 = [v2 initWithIdentifier:v9 batteryRemaining:v3 cellularStrength:v4 date:v5 wifiStrength:[*(id *)(a1 + 32) wifiStrength]];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end