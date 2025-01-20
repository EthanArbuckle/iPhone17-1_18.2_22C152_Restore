@interface PRChronoDefaultsDomain
- (PRChronoDefaultsDomain)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation PRChronoDefaultsDomain

- (PRChronoDefaultsDomain)init
{
  return (PRChronoDefaultsDomain *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.chronod"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"shouldShowInternalWidgets"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"showInternalWidgets" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end