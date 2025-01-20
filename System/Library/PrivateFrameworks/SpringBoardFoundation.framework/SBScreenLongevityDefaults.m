@interface SBScreenLongevityDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBScreenLongevityDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"dimInterval"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBScreenLongevityDimInterval" toDefaultValue:&unk_1ED89E608 options:1];
}

@end