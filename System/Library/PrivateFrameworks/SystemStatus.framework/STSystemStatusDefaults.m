@interface STSystemStatusDefaults
+ (id)standardDefaults;
- (STSystemStatusDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation STSystemStatusDefaults

+ (id)standardDefaults
{
  if (qword_1EB5A3608 != -1) {
    dispatch_once(&qword_1EB5A3608, &__block_literal_global_21);
  }
  v2 = (void *)_MergedGlobals_17;

  return v2;
}

uint64_t __42__STSystemStatusDefaults_standardDefaults__block_invoke()
{
  v0 = objc_alloc_init(STSystemStatusDefaults);
  uint64_t v1 = _MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (STSystemStatusDefaults)init
{
  return (STSystemStatusDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.systemstatus"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"shouldEnableInternalBundles"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"STEnableInternalBundles" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v4 = [NSString stringWithUTF8String:"shouldEnableUnknownBundles"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"STEnableUnknownBundles" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v6 = [NSString stringWithUTF8String:"shouldEnableUnknownBackgroundActivities"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"STEnableUnknownBackgroundActivities" toDefaultValue:v5 options:1];

  id v7 = [NSString stringWithUTF8String:"shouldEnableUnknownStatusItems"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"STEnableUnknownStatusItems" toDefaultValue:v5 options:1];
}

@end