@interface SBSetupDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBSetupDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"inSetupModeForActivationChange"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBInBuddyForActivationChange" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];
}

@end