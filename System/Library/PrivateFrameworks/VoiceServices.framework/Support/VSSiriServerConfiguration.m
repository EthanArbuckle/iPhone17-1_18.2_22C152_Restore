@interface VSSiriServerConfiguration
+ (id)defaultConfig;
- (BOOL)shouldDelayVoiceUpdate;
- (NSArray)allowedAppID;
- (double)deviceWaitTimeForAppId:(id)a3;
- (double)timeoutForAppId:(id)a3;
- (id)experimentIdentifier;
@end

@implementation VSSiriServerConfiguration

- (NSArray)allowedAppID
{
  return (NSArray *)&unk_26DADB030;
}

- (id)experimentIdentifier
{
  return 0;
}

- (BOOL)shouldDelayVoiceUpdate
{
  return 0;
}

- (double)deviceWaitTimeForAppId:(id)a3
{
  return 0.0;
}

- (double)timeoutForAppId:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x263F84EB8], "isHomeHub", a3);
  double result = 5.0;
  if ((v3 & 1) == 0)
  {
    int v5 = objc_msgSend(MEMORY[0x263F84EB8], "isWatch", 5.0);
    double result = 1.0;
    if (v5) {
      return 5.0;
    }
  }
  return result;
}

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1) {
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_2228);
  }
  v2 = (void *)defaultConfig___defaultConfig;
  return v2;
}

uint64_t __42__VSSiriServerConfiguration_defaultConfig__block_invoke()
{
  defaultConfig___defaultConfig = objc_alloc_init(VSSiriServerConfiguration);
  return MEMORY[0x270F9A758]();
}

@end