@interface WBWebFilterSettings
+ (WBWebFilterSettings)sharedWebFilterSettings;
- (BOOL)isWebFilterEnabled;
- (BOOL)usesAllowedSitesOnly;
- (WBWebFilterSettings)init;
- (WFUserSettings)userSettings;
- (void)dealloc;
- (void)reloadSettings;
- (void)userSettings;
@end

@implementation WBWebFilterSettings

+ (WBWebFilterSettings)sharedWebFilterSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WBWebFilterSettings_sharedWebFilterSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedWebFilterSettings_onceToken != -1) {
    dispatch_once(&sharedWebFilterSettings_onceToken, block);
  }
  v2 = (void *)sharedWebFilterSettings_settings;
  return (WBWebFilterSettings *)v2;
}

- (BOOL)usesAllowedSitesOnly
{
  v2 = [(WBWebFilterSettings *)self userSettings];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 restrictionType] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isWebFilterEnabled
{
  v2 = [(WBWebFilterSettings *)self userSettings];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 restrictionType] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (WFUserSettings)userSettings
{
  userSettings = self->_userSettings;
  if (!userSettings)
  {
    if (WebContentAnalysisLibraryCore())
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2050000000;
      BOOL v4 = (void *)getWFUserSettingsClass_softClass;
      uint64_t v16 = getWFUserSettingsClass_softClass;
      if (!getWFUserSettingsClass_softClass)
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __getWFUserSettingsClass_block_invoke;
        v12[3] = &unk_2643DAEE8;
        v12[4] = &v13;
        __getWFUserSettingsClass_block_invoke((uint64_t)v12);
        BOOL v4 = (void *)v14[3];
      }
      v5 = v4;
      _Block_object_dispose(&v13, 8);
      id v6 = [v5 alloc];
      v7 = NSUserName();
      v8 = (WFUserSettings *)[v6 initWithUserName:v7];
      v9 = self->_userSettings;
      self->_userSettings = v8;
    }
    userSettings = self->_userSettings;
    if (!userSettings)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBWebFilterSettings userSettings](v10);
      }
      userSettings = self->_userSettings;
    }
  }
  return userSettings;
}

uint64_t __46__WBWebFilterSettings_sharedWebFilterSettings__block_invoke(uint64_t a1)
{
  sharedWebFilterSettings_settings = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (WBWebFilterSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBWebFilterSettings;
  v2 = [(WBWebFilterSettings *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)webFilterConfigurationChanged, @"com.apple.ManagedConfiguration.webContentFilterChanged", 0, (CFNotificationSuspensionBehavior)1024);
    BOOL v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WBWebFilterSettings;
  [(WBWebFilterSettings *)&v4 dealloc];
}

- (void)reloadSettings
{
  self->_userSettings = 0;
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

- (void)userSettings
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Could not construct WFUserSettings. Default values will be used", v1, 2u);
}

@end