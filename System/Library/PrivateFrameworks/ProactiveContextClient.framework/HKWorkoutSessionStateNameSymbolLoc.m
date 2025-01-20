@interface HKWorkoutSessionStateNameSymbolLoc
@end

@implementation HKWorkoutSessionStateNameSymbolLoc

void *__get_HKWorkoutSessionStateNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "_HKWorkoutSessionStateName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKWorkoutSessionStateNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end