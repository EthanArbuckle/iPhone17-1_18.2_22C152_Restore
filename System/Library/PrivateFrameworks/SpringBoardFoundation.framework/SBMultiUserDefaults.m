@interface SBMultiUserDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBMultiUserDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"forceLoginWindow"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBForceLoginWindow" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v5 = [NSString stringWithUTF8String:"disablesInternalDebugBlockingTasksUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBDisablesInternalDebugBlockingTasksUI" toDefaultValue:v4 options:1];
}

@end