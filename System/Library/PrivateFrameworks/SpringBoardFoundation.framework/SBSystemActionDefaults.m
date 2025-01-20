@interface SBSystemActionDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBSystemActionDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"configuredActionArchive"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBSystemActionConfiguredActionArchive" toDefaultValue:0 options:1];
}

@end