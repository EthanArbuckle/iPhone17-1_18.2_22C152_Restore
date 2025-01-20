@interface MSDTestPreferences
+ (id)sharedInstance;
- (BOOL)bailOnStashedStagingRestoreFailure;
- (BOOL)disableParallelProcessing;
- (BOOL)disassociateWiFiBeforeCheckIn;
- (BOOL)enableAIModelAutoUpdate;
- (BOOL)enablePeerDemoService;
- (BOOL)fakeActivationDemoBit;
- (BOOL)mockForBetterTogetherDemo;
- (BOOL)pauseContentUpdateOnError;
- (BOOL)skipMarkAsNotDemo;
- (BOOL)skipVerifyHashBeforeStaging;
- (double)appUsagePollingInterval;
- (double)caLogsUploadInterval;
- (double)cachingHubRetryInterval;
- (id)LSMeasurementsFilePath;
- (id)contentSyncTimeoutInterval;
- (id)demoUnitServerURL;
- (id)getValueFromTestPreferencesForKey:(id)a3;
- (id)mockAccountSettingsFile;
- (id)mockOSUpdateRequestFile;
- (id)mockPeerProtocolVersion;
- (id)pressDemoTestTarget;
- (id)pressDemoXCTestProductsPath;
- (id)screenSaverIdleDelay;
- (int64_t)concurrentDownloadOperation;
- (int64_t)concurrentDownloadRequest;
- (int64_t)concurrentSession;
- (int64_t)deviceActivationFlag;
- (int64_t)findMyHubRetryDelay;
- (int64_t)storePickerUIMode;
- (unsigned)rebootDelayForStaging;
- (unsigned)systemAppPollingInterval;
- (unsigned)systemAppTimeoutInterval;
- (unsigned)timeShowingFatalError;
@end

@implementation MSDTestPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __36__MSDTestPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MSDTestPreferences);
  uint64_t v1 = sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)fakeActivationDemoBit
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"FakeActivationDemoBit"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)demoUnitServerURL
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"DemoUnitServerURL"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v3 = [NSURL URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)findMyHubRetryDelay
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"FMHRetryDelay"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (unsigned)rebootDelayForStaging
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"RebootDelayForStaging"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)timeShowingFatalError
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"TimeShowingFatalError"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)disableParallelProcessing
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"DisableParallelProcessing"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)pauseContentUpdateOnError
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"PauseContentUpdateOnError"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"BailOnStashedStagingRestoreFailure"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)concurrentDownloadRequest
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"ConcurrentDownloadRequest"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)concurrentDownloadOperation
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"ConcurrentDownloadOperation"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)concurrentSession
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"ConcurrentSession"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (double)cachingHubRetryInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"CachingHubRetryInterval"];
  double v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)[v2 integerValue];
    }
  }

  return v3;
}

- (double)caLogsUploadInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"CALogsUploadInterval"];
  double v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)[v2 integerValue];
    }
  }

  return v3;
}

- (double)appUsagePollingInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"AppUsagePollingInterval"];
  double v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)[v2 integerValue];
    }
  }

  return v3;
}

- (unsigned)systemAppTimeoutInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"SystemAppTimeoutInterval"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)systemAppPollingInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"SystemAppPollingInterval"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (int64_t)deviceActivationFlag
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"DeviceActivationFlag"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = -1;
  }

  return v3;
}

- (BOOL)mockForBetterTogetherDemo
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"MockForBetterTogetherDemo"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)mockAccountSettingsFile
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"MockAccountSettingsFile"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)mockOSUpdateRequestFile
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"MockOSUpdateRequestFile"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)screenSaverIdleDelay
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"ScreenSaverIdleDelay"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)mockPeerProtocolVersion
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"MockPeerProtocolVersion"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)enableAIModelAutoUpdate
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"EnableAIModelAutoUpdate"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)contentSyncTimeoutInterval
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"ContentSyncTimeoutInterval"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)storePickerUIMode
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"StorePickerUIMode"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (BOOL)skipMarkAsNotDemo
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipMarkAsNotDemo"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)enablePeerDemoService
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"EnablePeerDemoService"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)pressDemoXCTestProductsPath
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"PressDemoXCTestProductsPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)pressDemoTestTarget
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"PressDemoTestTarget"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)LSMeasurementsFilePath
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"LSMeasurementsFilePath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)disassociateWiFiBeforeCheckIn
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"DisassociateWiFiBeforeCheckIn"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)skipVerifyHashBeforeStaging
{
  v2 = [(MSDTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipVerifyHashBeforeStaging"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  char v3 = (__CFString *)a3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE68];
  if (!CFPreferencesSynchronize(@"com.apple.MobileStoreDemo.test", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]))
  {
    v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDTestPreferences getValueFromTestPreferencesForKey:](v6);
    }
  }
  v7 = (void *)CFPreferencesCopyValue(v3, @"com.apple.MobileStoreDemo.test", v4, v5);

  return v7;
}

- (void)getValueFromTestPreferencesForKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

@end