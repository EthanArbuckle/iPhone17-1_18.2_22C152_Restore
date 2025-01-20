@interface WFAppInBackgroundTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFAppInBackgroundTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (id)contextStorePredicate
{
  v2 = [a1 selectedBundleIdentifiers];
  v3 = [a1 contextStoreKeyPathForCurrentState];
  v4 = (void *)MEMORY[0x1E4F5B6E8];
  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [MEMORY[0x1E4F5B6B8] appUsageBundleID];
  v7 = [v5 predicateWithFormat:@"SUBQUERY(SELF.%@.value, $values, $values.%K  IN %@).@count == 0", v3, v6, v2];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [MEMORY[0x1E4F5B6B8] appUsageBundleID];
  v10 = [v8 predicateWithFormat:@"SUBQUERY(SELF.value, $values, $values.%K  IN %@).@count > 0", v9, v2];
  v11 = [v4 predicateForKeyPath:v3 withPredicate:v7 withPredicateForPreviousState:v10 withMinimumDurationInPreviousState:0.0];

  return v11;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForAppUsageDataDictionaries];
}

@end