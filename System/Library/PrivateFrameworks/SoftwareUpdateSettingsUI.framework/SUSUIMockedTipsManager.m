@interface SUSUIMockedTipsManager
+ (id)sharedManager;
- (SUSUIMockedTipsManager)init;
- (void)contentDidBecomeAvailableWithTitle:(id)a3 andContent:(id)a4 learnMoreLinkUrl:(id)a5;
- (void)setup;
@end

@implementation SUSUIMockedTipsManager

+ (id)sharedManager
{
  v5 = (dispatch_once_t *)&sharedManager_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

void __39__SUSUIMockedTipsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SUSUIMockedTipsManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;
}

- (SUSUIMockedTipsManager)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUIMockedTipsManager;
  v6 = [(SUSettingsTipsManager *)&v4 init];
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setup
{
}

- (void)contentDidBecomeAvailableWithTitle:(id)a3 andContent:(id)a4 learnMoreLinkUrl:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  os_log_t oslog = (os_log_t)_SUSUIInternalLoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v6 = type;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v12 = v7;
    __os_log_helper_16_2_4_8_64_8_66_8_66_8_66((uint64_t)v19, (uint64_t)v12, (uint64_t)location[0], (uint64_t)v16, (uint64_t)v15);
    _os_log_impl(&dword_228401000, log, v6, "[XCUI correlationId: %@] XCUI Testing - Displaying Coming Soon Tip:\n\tTitle: %{public}@\n\tContent: %{public}@\n\tLearn More URL: %{public}@", v19, 0x2Au);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSettingsTipsManager *)v18 configureManualComingSoonTipWithTitle:location[0] andContent:v16 learnMoreLink:v15];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

@end