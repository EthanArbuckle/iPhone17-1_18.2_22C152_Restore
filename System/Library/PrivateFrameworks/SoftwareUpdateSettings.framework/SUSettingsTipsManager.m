@interface SUSettingsTipsManager
+ (id)sharedManager;
- (SUSettingsTipsManager)init;
- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5;
- (void)setup;
- (void)setup:(BOOL)a3;
- (void)setupForManualControl;
@end

@implementation SUSettingsTipsManager

+ (id)sharedManager
{
  v5 = (dispatch_once_t *)&sharedManager_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

void __38__SUSettingsTipsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SUSettingsTipsManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;
}

- (SUSettingsTipsManager)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSettingsTipsManager;
  v6 = [(SUSettingsTipsManager *)&v4 init];
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setup
{
}

- (void)setupForManualControl
{
}

- (void)setup:(BOOL)a3
{
  BOOL v4 = a3;
  v3 = +[SUSettingsSwiftTipsManager sharedManager];
  [(SUSettingsSwiftTipsManager *)v3 setupForManualControl:v4];
}

- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = +[SUSettingsSwiftTipsManager sharedManager];
  [(SUSettingsSwiftTipsManager *)v7 configureManualComingSoonTipWithTitle:location[0] andContent:v9 learnMoreLink:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end