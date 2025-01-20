@interface SBStateDumpDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBStateDumpDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"remoteDumpEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBRemoteDumpEnabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v4 = [NSString stringWithUTF8String:"remoteDumpTimeout"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBRemoteDumpTimeout" toDefaultValue:0 options:1];
}

@end