@interface DMDEffectivePolicy
- (NSSet)excludedIdentifiers;
- (void)setExcludedIdentifiers:(id)a3;
@end

@implementation DMDEffectivePolicy

- (NSSet)excludedIdentifiers
{
  return 0;
}

- (void)setExcludedIdentifiers:(id)a3
{
  v3 = DMFPolicyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_100083D08(v3);
  }
}

@end