@interface MOSettingsManager
+ (id)sharedInstance;
- (BOOL)getStateForSetting:(unint64_t)a3;
- (MOSettingsManager)init;
- (MOSettingsManagerDelegate)delegate;
- (id)getSettingsControllers;
- (void)setDelegate:(id)a3;
- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4;
@end

@implementation MOSettingsManager

- (MOSettingsManagerDelegate)delegate
{
  v2 = +[MOOnboardingAndSettingsManager sharedInstance];
  v3 = [v2 settingsManagerDelegate];

  return (MOSettingsManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v4 setSettingsManagerDelegate:v3];
}

- (MOSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOSettingsManager;
  return [(MOSettingsManager *)&v3 init];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MOSettingsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_shared_1;
  return v2;
}

uint64_t __35__MOSettingsManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BOOL)getStateForSetting:(unint64_t)a3
{
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  LOBYTE(a3) = [v4 getStateForSetting:a3];

  return a3;
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v6 setState:v5 forSetting:a4];
}

- (id)getSettingsControllers
{
  return &unk_270628FD8;
}

@end