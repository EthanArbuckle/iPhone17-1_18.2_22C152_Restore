@interface WAProviderAttributionManager
+ (WAProviderAttributionManager)sharedManager;
- (NSString)providerName;
- (NSUserDefaults)weatherUserDefaults;
- (WAProviderAttributionManager)init;
@end

@implementation WAProviderAttributionManager

+ (WAProviderAttributionManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedManager_sharedManager;
  return (WAProviderAttributionManager *)v2;
}

uint64_t __45__WAProviderAttributionManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedManager_sharedManager;
  sharedManager_sharedManager = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WAProviderAttributionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WAProviderAttributionManager;
  v2 = [(WAProviderAttributionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"group.com.apple.weather"];
    weatherUserDefaults = v2->_weatherUserDefaults;
    v2->_weatherUserDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (NSString)providerName
{
  v2 = [(WAProviderAttributionManager *)self weatherUserDefaults];
  uint64_t v3 = [v2 stringForKey:@"WeatherProviderName"];

  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"The Weather Channel";
  }
  return (NSString *)v4;
}

- (NSUserDefaults)weatherUserDefaults
{
  return self->_weatherUserDefaults;
}

- (void).cxx_destruct
{
}

@end