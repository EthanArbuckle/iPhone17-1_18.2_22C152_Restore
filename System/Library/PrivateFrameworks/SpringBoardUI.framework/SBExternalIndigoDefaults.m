@interface SBExternalIndigoDefaults
+ (id)defaults;
- (BOOL)indigoConfigurationFlagOne;
- (BOOL)indigoConfigurationFlagThree;
- (BOOL)indigoConfigurationFlagTwo;
- (SBExternalIndigoDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalIndigoDefaults

+ (id)defaults
{
  if (defaults___once != -1) {
    dispatch_once(&defaults___once, &__block_literal_global_6);
  }
  v2 = (void *)defaults___instance;

  return v2;
}

uint64_t __36__SBExternalIndigoDefaults_defaults__block_invoke()
{
  v0 = objc_alloc_init(SBExternalIndigoDefaults);
  uint64_t v1 = defaults___instance;
  defaults___instance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (SBExternalIndigoDefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBExternalIndigoDefaults;
  return (SBExternalIndigoDefaults *)[(BSAbstractDefaultDomain *)&v3 _initWithDomain:@"com.apple.indigo"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"indigoConfigurationFlagsBitmask"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"IndigoConfigurationFlags" toDefaultValue:&unk_26D3F6C60 options:1];
}

- (BOOL)indigoConfigurationFlagOne
{
  return [(SBExternalIndigoDefaults *)self indigoConfigurationFlagsBitmask] & 1;
}

- (BOOL)indigoConfigurationFlagTwo
{
  return ((unint64_t)[(SBExternalIndigoDefaults *)self indigoConfigurationFlagsBitmask] >> 1) & 1;
}

- (BOOL)indigoConfigurationFlagThree
{
  return ((unint64_t)[(SBExternalIndigoDefaults *)self indigoConfigurationFlagsBitmask] >> 2) & 1;
}

@end