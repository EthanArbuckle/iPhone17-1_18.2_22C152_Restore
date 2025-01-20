@interface WFDNDTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFDNDTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v2 = objc_opt_new();
  if ([a1 onEnable]) {
    [v2 addObject:MEMORY[0x1E4F1CC38]];
  }
  if ([a1 onDisable]) {
    [v2 addObject:MEMORY[0x1E4F1CC28]];
  }
  v3 = [a1 contextStoreKeyPathForCurrentState];
  v4 = (void *)MEMORY[0x1E4F5B6E8];
  v5 = [MEMORY[0x1E4F5B6B8] doNotDisturbState];
  v6 = [v4 predicateForKeyPath:v3, @"SELF.%@.value.%K IN %@", v3, v5, v2 withFormat];

  return v6;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForDoNotDisturbStatusDataDictionary];
}

@end