@interface PRComplicationDefaultsDomain
- (PRComplicationDefaultsDomain)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation PRComplicationDefaultsDomain

- (PRComplicationDefaultsDomain)init
{
  return (PRComplicationDefaultsDomain *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"hasShownPortraitEducation"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"PRPortraitEducationPresented" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v5 = [NSString stringWithUTF8String:"hasShownLandscapeEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"PRLandscapeEducationPresented" toDefaultValue:v4 options:1];
}

@end