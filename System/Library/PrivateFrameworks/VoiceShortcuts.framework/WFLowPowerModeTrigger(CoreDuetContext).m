@interface WFLowPowerModeTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFLowPowerModeTrigger(CoreDuetContext)

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
  v4 = [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value IN %@", v3, v2 withFormat];

  return v4;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForLowPowerModeStatus];
}

@end