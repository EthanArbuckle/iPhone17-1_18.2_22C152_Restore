@interface NTKRelevanceEngineLocationManager
@end

@implementation NTKRelevanceEngineLocationManager

uint64_t __70___NTKRelevanceEngineLocationManager_startLocationUpdatesWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

@end