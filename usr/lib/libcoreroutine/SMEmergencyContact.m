@interface SMEmergencyContact
@end

@implementation SMEmergencyContact

void __75__SMEmergencyContact_RTCoreDataTransformable__createWithEmergenecyContact___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99868]);
  id v8 = [*(id *)(a1 + 32) identifier];
  v3 = [*(id *)(a1 + 32) name];
  v4 = [*(id *)(a1 + 32) phoneNumber];
  uint64_t v5 = [v2 initWithIdentifier:v8 name:v3 phoneNumber:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end