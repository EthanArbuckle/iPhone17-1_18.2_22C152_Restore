@interface TCPreferences
+ (id)defaultPreferences;
+ (id)userPreferences;
+ (void)setOverridePreferences:(id)a3;
- (NSMutableDictionary)properties;
- (TCPreferences)initWithDefaults;
- (TCPreferences)initWithProperties:(id)a3;
- (int64_t)devicePolicy;
- (void)setDevicePolicy:(int64_t)a3;
- (void)setProperties:(id)a3;
@end

@implementation TCPreferences

+ (void)setOverridePreferences:(id)a3
{
}

+ (id)defaultPreferences
{
  if (defaultPreferences_onceToken != -1) {
    dispatch_once(&defaultPreferences_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultPreferences_defaults;
  return v2;
}

void __35__TCPreferences_defaultPreferences__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = DevicePolicyToString(0);
  v4 = @"DevicePolicy";
  v5[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)defaultPreferences_defaults;
  defaultPreferences_defaults = v2;
}

+ (id)userPreferences
{
  if (gPreferenceOverride)
  {
    uint64_t v2 = (TCPreferences *)(id)gPreferenceOverride;
  }
  else
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.TuriCore"];
    v4 = +[TCPreferences defaultPreferences];
    [v3 registerDefaults:v4];

    v5 = [v3 dictionaryRepresentation];
    uint64_t v2 = [[TCPreferences alloc] initWithProperties:v5];
  }
  return v2;
}

- (TCPreferences)initWithDefaults
{
  v3 = +[TCPreferences defaultPreferences];
  v4 = [(TCPreferences *)self initWithProperties:v3];

  return v4;
}

- (TCPreferences)initWithProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCPreferences;
  v5 = [(TCPreferences *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (int64_t)devicePolicy
{
  uint64_t v2 = [(TCPreferences *)self properties];
  v3 = [v2 objectForKeyedSubscript:@"DevicePolicy"];
  int64_t v4 = DevicePolicyFromString(v3);

  return v4;
}

- (void)setDevicePolicy:(int64_t)a3
{
  DevicePolicyToString(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v4 = [(TCPreferences *)self properties];
  [v4 setObject:v5 forKeyedSubscript:@"DevicePolicy"];
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end