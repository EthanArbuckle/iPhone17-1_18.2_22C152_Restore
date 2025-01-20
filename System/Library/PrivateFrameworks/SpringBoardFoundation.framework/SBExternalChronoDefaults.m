@interface SBExternalChronoDefaults
+ (id)sharedInstance;
- (SBExternalChronoDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalChronoDefaults

- (SBExternalChronoDefaults)init
{
  return (SBExternalChronoDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.chronod"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"showInternalWidgets"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"showInternalWidgets" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

+ (id)sharedInstance
{
  v2 = (void *)__shared;
  if (!__shared)
  {
    id v3 = objc_alloc_init(SBExternalChronoDefaults);
    v4 = (void *)__shared;
    __shared = (uint64_t)v3;

    v2 = (void *)__shared;
  }
  return v2;
}

@end