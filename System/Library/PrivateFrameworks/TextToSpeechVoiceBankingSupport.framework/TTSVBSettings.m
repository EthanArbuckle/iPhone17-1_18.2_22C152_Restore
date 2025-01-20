@interface TTSVBSettings
+ (id)sharedInstance;
- (BOOL)allowAppUsage;
- (BOOL)allowAppUsageDuringCalls;
- (NSUserDefaults)defaults;
- (TTSVBSettings)init;
- (void)setAllowAppUsage:(BOOL)a3;
- (void)setDefaults:(id)a3;
@end

@implementation TTSVBSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_Shared;

  return v2;
}

uint64_t __31__TTSVBSettings_sharedInstance__block_invoke()
{
  sharedInstance_Shared = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (TTSVBSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)TTSVBSettings;
  v2 = [(TTSVBSettings *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Accessibility"];
    [(TTSVBSettings *)v2 setDefaults:v3];
  }
  return v2;
}

- (BOOL)allowAppUsage
{
  v2 = [(TTSVBSettings *)self defaults];
  char v3 = [v2 BOOLForKey:@"kTTSVBAllowVoiceBankingAppUsage"];

  return v3;
}

- (void)setAllowAppUsage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TTSVBSettings *)self defaults];
  [v4 setBool:v3 forKey:@"kTTSVBAllowVoiceBankingAppUsage"];
}

- (BOOL)allowAppUsageDuringCalls
{
  return 1;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end