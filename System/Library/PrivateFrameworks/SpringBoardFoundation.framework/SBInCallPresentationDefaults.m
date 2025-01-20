@interface SBInCallPresentationDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBInCallPresentationDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"assertNoZombieInCallScenes"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBAssertNoZombieInCallScenes" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v5 = [NSString stringWithUTF8String:"skipPromptUnlockEntitlementCheck"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBSkipPromptUnlockEntitlementCheck" toDefaultValue:v4 options:1];
}

@end