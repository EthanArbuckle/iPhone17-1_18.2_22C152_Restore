@interface WFWorkoutTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
- (uint64_t)contextStoreRegistrationIsForWatch;
@end

@implementation WFWorkoutTrigger(CoreDuetContext)

- (uint64_t)contextStoreRegistrationIsForWatch
{
  return 1;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v2 = objc_opt_new();
  if ([a1 onStart])
  {
    v3 = softLink_HKWorkoutSessionStateName(2);
    [v2 addObject:v3];
  }
  if ([a1 onEnd])
  {
    v4 = softLink_HKWorkoutSessionStateName(3);
    [v2 addObject:v4];
  }
  uint64_t v5 = [a1 selection];
  if (v5 == 1)
  {
    uint64_t v6 = [a1 selectedWorkoutTypes];
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v6 = [(objc_class *)getHKWorkoutClass() _allWorkoutActivityTypes];
LABEL_9:
    v7 = (void *)v6;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_11:
  v8 = (void *)MEMORY[0x1E4F5B6F8];
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  v10 = [v8 predicateForFirstPartyWorkoutMatchingTypes:v9 states:v2];

  return v10;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForWorkoutDataDictionary];
}

@end