@interface NTKFastFaceSwitchingSettings
+ (id)sharedInstance;
- (BOOL)fastFaceSwitchingEnabled;
- (NTKFastFaceSwitchingSettings)init;
- (void)_handlePrefsChanged;
- (void)_notifyClientsOfChange;
- (void)_readValue;
- (void)dealloc;
@end

@implementation NTKFastFaceSwitchingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1) {
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_117);
  }
  v2 = (void *)sharedInstance_fastFaceSettings;
  return v2;
}

void __46__NTKFastFaceSwitchingSettings_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_fastFaceSettings;
  sharedInstance_fastFaceSettings = v0;
}

- (NTKFastFaceSwitchingSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFastFaceSwitchingSettings;
  v2 = [(NTKFastFaceSwitchingSettings *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleSettingsChanged, @"FaceSupportFastSwitching", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(NTKFastFaceSwitchingSettings *)v2 _readValue];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"FaceSupportFastSwitching", self);
  v4.receiver = self;
  v4.super_class = (Class)NTKFastFaceSwitchingSettings;
  [(NTKFastFaceSwitchingSettings *)&v4 dealloc];
}

- (void)_readValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit.face"];
  id v4 = (id)[v3 synchronize];
  char v9 = 0;
  char v5 = [v3 BOOLForKey:@"FaceSupportFastSwitching" keyExistsAndHasValidFormat:&v9];
  if (v9) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  self->_fastFaceSwitchingEnabled = v6;
  v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithBool:self->_fastFaceSwitchingEnabled];
    *(_DWORD *)buf = 136315394;
    v11 = "-[NTKFastFaceSwitchingSettings _readValue]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "%s - fastFaceSwitchingEnabled:%@", buf, 0x16u);
  }
}

- (void)_handlePrefsChanged
{
  [(NTKFastFaceSwitchingSettings *)self _readValue];
  [(NTKFastFaceSwitchingSettings *)self _notifyClientsOfChange];
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKFastFaceSwitchingEnabledChanged" object:self];
}

- (BOOL)fastFaceSwitchingEnabled
{
  return self->_fastFaceSwitchingEnabled;
}

@end