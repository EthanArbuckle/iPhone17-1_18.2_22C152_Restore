@interface TUDialAssist
+ (TUDialAssist)sharedInstance;
- (TUDialAssist)init;
- (int)dialAssistUserSettingsChangedToken;
- (void)dealloc;
@end

@implementation TUDialAssist

+ (TUDialAssist)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (TUDialAssist *)v2;
}

uint64_t __30__TUDialAssist_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(TUDialAssist);

  return MEMORY[0x1F41817F8]();
}

- (TUDialAssist)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUDialAssist;
  v2 = [(TUDialAssist *)&v5 init];
  if (v2)
  {
    v3 = (const char *)[TUDialAssistUserSettingChanged UTF8String];
    notify_register_dispatch(v3, &v2->_dialAssistUserSettingsChangedToken, MEMORY[0x1E4F14428], &__block_literal_global_4_0);
    CFPreferencesAppSynchronize(TUDialAssistDomain);
    CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  }
  return v2;
}

uint64_t __20__TUDialAssist_init__block_invoke()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "Dial assist value changed. Synchronizing prefs", v2, 2u);
  }

  return CFPreferencesAppSynchronize(TUDialAssistDomain);
}

- (void)dealloc
{
  notify_cancel(self->_dialAssistUserSettingsChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)TUDialAssist;
  [(TUDialAssist *)&v3 dealloc];
}

- (int)dialAssistUserSettingsChangedToken
{
  return self->_dialAssistUserSettingsChangedToken;
}

@end