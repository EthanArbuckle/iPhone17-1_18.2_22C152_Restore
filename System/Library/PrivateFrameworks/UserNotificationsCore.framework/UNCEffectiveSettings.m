@interface UNCEffectiveSettings
- (BOOL)_isFaceIDEnrolled;
- (BOOL)_queue_hasPairedVehiclesForCarPlay;
- (BOOL)_queue_isAnnounceSupportedForCarPlay;
- (BOOL)_queue_isAnnounceSupportedForHeadphones;
- (BOOL)_supportsFaceID;
- (BOOL)hasDestinationForRemoteNotifications;
- (BOOL)hasPairedVehiclesForCarPlay;
- (NSArray)effectiveGlobalScheduledDeliveryTimes;
- (UNCEffectiveSettings)init;
- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3;
- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3 biometricResource:(id)a4;
- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3;
- (id)_queue_globalScheduledDeliveryTimes;
- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3;
- (int64_t)_queue_defaultGlobalContentPreviewSetting;
- (int64_t)_queue_effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)_queue_effectiveGlobalAnnounceHeadphoneSetting;
- (int64_t)_queue_effectiveGlobalAnnounceSetting;
- (int64_t)_queue_effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (int64_t)_queue_globalAnnounceCarPlaySetting;
- (int64_t)_queue_globalAnnounceHeadphonesSetting;
- (int64_t)_queue_globalAnnounceSetting;
- (int64_t)_queue_globalContentPreviewsSetting;
- (int64_t)_queue_globalNotificationListDisplayStyleSetting;
- (int64_t)_queue_globalScheduledDeliverySetting;
- (int64_t)effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)effectiveGlobalAnnounceHeadphoneSetting;
- (int64_t)effectiveGlobalAnnounceSetting;
- (int64_t)effectiveGlobalContentPreviewSetting;
- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)effectiveGlobalScheduledDeliverySetting;
- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (void)_biometricResourceStateChanged;
- (void)_fetchAllVehiclesForCarPlay;
- (void)_pairedVehiclesForCarPlayDidChange:(id)a3;
- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3;
- (void)_queue_loadCarPlayCapabilities;
- (void)_queue_loadSiriCapabilities;
- (void)_queue_setAnnounceSupportedForCarPlay:(BOOL)a3;
- (void)_queue_setAnnounceSupportedForHeadphones:(BOOL)a3;
- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3;
- (void)_queue_setGlobalContentPreviewsSetting:(int64_t)a3;
- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3;
- (void)_queue_setPairedVehiclesForCarPlay:(BOOL)a3;
- (void)_queue_updateAllSectionInfos;
- (void)_queue_updateAnnounceControlCenterModuleAvailability;
- (void)_queue_updateAnnounceSettings;
- (void)_queue_updateGlobalSettings;
- (void)_queue_updateSiriPreferences;
- (void)_saveGlobalAnnounceSettingEnabledEvent;
- (void)_siriPreferencesDidChange:(id)a3;
- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setGlobalAnnounceHeadphoneSetting:(int64_t)a3;
- (void)setGlobalAnnounceSetting:(int64_t)a3;
- (void)setGlobalContentPreviewSetting:(int64_t)a3;
- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryTimes:(id)a3;
@end

@implementation UNCEffectiveSettings

- (UNCEffectiveSettings)init
{
  v3 = +[UNCBulletinDefaults standardDefaults];
  v4 = objc_alloc_init(UNCBiometricResource);
  v5 = [(UNCEffectiveSettings *)self initWithBulletinDefaults:v3 biometricResource:v4];

  return v5;
}

- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(UNCBiometricResource);
  v6 = [(UNCEffectiveSettings *)self initWithBulletinDefaults:v4 biometricResource:v5];

  return v6;
}

- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3 biometricResource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UNCEffectiveSettings;
  v9 = [(UNCEffectiveSettings *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bulletinDefaults, a3);
    v11 = [MEMORY[0x263F285A0] sharedPreferences];
    v10->_siriEnabled = [v11 assistantIsEnabled];

    v12 = [MEMORY[0x263F285A0] sharedPreferences];
    v10->_siriAllowedWhenLocked = [v12 disableAssistantWhilePasscodeLocked] ^ 1;

    v13 = [MEMORY[0x263F285A0] sharedPreferences];
    v10->_announceOnHearingAidsEnabled = [v13 announceNotificationsOnHearingAidsEnabled];

    v14 = [MEMORY[0x263F285A0] sharedPreferences];
    v10->_announceOnHearingAidsSupported = [v14 announceNotificationsOnHearingAidsSupported];

    v15 = [MEMORY[0x263F285A0] sharedPreferences];
    v10->_announceOnBuiltInSpeakerEnabled = [v15 announceNotificationsOnBuiltInSpeakerEnabled];

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.usernotifications.effectiveSettingsQueue", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.usernotifications.effectiveSettingsGateway", v19);

    v21 = [[UNCBulletinServerConnection alloc] initWithQueue:v20];
    bbServerConnection = v10->_bbServerConnection;
    v10->_bbServerConnection = v21;

    objc_storeStrong((id *)&v10->_biometricResource, a4);
    if ([(UNCBiometricResource *)v10->_biometricResource hasPearlCapability])
    {
      v23 = [MEMORY[0x263F08A00] defaultCenter];
      [v23 addObserver:v10 selector:sel__biometricResourceStateChanged name:@"BBBiometricResourceStateChanged" object:v10->_biometricResource];
    }
    v24 = v10->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__UNCEffectiveSettings_initWithBulletinDefaults_biometricResource___block_invoke;
    block[3] = &unk_265567728;
    v27 = v10;
    dispatch_sync(v24, block);
  }
  return v10;
}

uint64_t __67__UNCEffectiveSettings_initWithBulletinDefaults_biometricResource___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadSiriCapabilities");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_loadCarPlayCapabilities");
}

- (void)_queue_loadSiriCapabilities
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = (AFSiriAnnouncementRequestCapabilityManager *)[objc_alloc(MEMORY[0x263F28600]) initWithPlatform:1];
  announcementCapabilityManagerForHeadphones = self->_announcementCapabilityManagerForHeadphones;
  self->_announcementCapabilityManagerForHeadphones = v3;

  BOOL v5 = [(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForHeadphones];
  v6 = (os_log_t *)MEMORY[0x263F1E070];
  id v7 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v29 = v5;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  id v8 = self->_announcementCapabilityManagerForHeadphones;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke;
  v27[3] = &unk_2655684D8;
  v27[4] = self;
  [(AFSiriAnnouncementRequestCapabilityManager *)v8 fetchEligibleAnnouncementRequestTypesWithCompletion:v27];
  v9 = (AFSiriAnnouncementRequestCapabilityManager *)[objc_alloc(MEMORY[0x263F28600]) initWithPlatform:2];
  announcementCapabilityManagerForCarPlay = self->_announcementCapabilityManagerForCarPlay;
  self->_announcementCapabilityManagerForCarPlay = v9;

  BOOL v11 = [(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForCarPlay];
  v12 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v29 = v11;
    _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  v13 = self->_announcementCapabilityManagerForCarPlay;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_31;
  v26[3] = &unk_2655684D8;
  v26[4] = self;
  [(AFSiriAnnouncementRequestCapabilityManager *)v13 fetchEligibleAnnouncementRequestTypesWithCompletion:v26];
  v14 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL siriEnabled = [v14 assistantIsEnabled];

  v15 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL siriAllowedWhenLocked = [v15 disableAssistantWhilePasscodeLocked] ^ 1;

  v16 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnHearingAidsEnabled = [v16 announceNotificationsOnHearingAidsEnabled];

  dispatch_queue_t v17 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnHearingAidsSupported = [v17 announceNotificationsOnHearingAidsSupported];

  v18 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnBuiltInSpeakerEnabled = [v18 announceNotificationsOnBuiltInSpeakerEnabled];

  v19 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL siriEnabled = self->_siriEnabled;
    BOOL siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    BOOL announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    BOOL announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    BOOL announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    *(_DWORD *)buf = 67110144;
    BOOL v29 = siriEnabled;
    __int16 v30 = 1024;
    BOOL v31 = siriAllowedWhenLocked;
    __int16 v32 = 1024;
    BOOL v33 = announceOnHearingAidsEnabled;
    __int16 v34 = 1024;
    BOOL v35 = announceOnHearingAidsSupported;
    __int16 v36 = 1024;
    BOOL v37 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_2608DB000, v19, OS_LOG_TYPE_DEFAULT, "[UNCES] Siri preferences did load [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d Announce On Hearing Aids Enabled: %{BOOL}d, Announce on Hearing Aids Supported: %{BOOL}d, Announce on Built-In Speaker: %{BOOL}d]", buf, 0x20u);
  }
  v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 addObserver:self selector:sel__siriPreferencesDidChange_ name:*MEMORY[0x263F28318] object:0];

  [(AFSiriAnnouncementRequestCapabilityManager *)self->_announcementCapabilityManagerForHeadphones addObserver:self];
  [(AFSiriAnnouncementRequestCapabilityManager *)self->_announcementCapabilityManagerForCarPlay addObserver:self];
}

void __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a2 & 1;
  id v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Fetched value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_29;
  v7[3] = &unk_265567FA0;
  v7[4] = v5;
  char v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(a1 + 40));
}

void __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_31(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a2 & 1;
  id v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Fetched value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_32;
  v7[3] = &unk_265567FA0;
  v7[4] = v5;
  char v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_siriPreferencesDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UNCEffectiveSettings__siriPreferencesDidChange___block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__UNCEffectiveSettings__siriPreferencesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSiriPreferences");
}

- (void)_queue_updateSiriPreferences
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  int siriEnabled = self->_siriEnabled;
  BOOL v6 = siriEnabled != v4;
  if (siriEnabled != v4) {
    self->_int siriEnabled = v4;
  }
  id v7 = [MEMORY[0x263F285A0] sharedPreferences];
  int v8 = [v7 disableAssistantWhilePasscodeLocked] ^ 1;

  if (self->_siriAllowedWhenLocked != v8)
  {
    self->_BOOL siriAllowedWhenLocked = v8;
    BOOL v6 = 1;
  }
  v9 = [MEMORY[0x263F285A0] sharedPreferences];
  int v10 = [v9 announceNotificationsOnHearingAidsEnabled];

  if (self->_announceOnHearingAidsEnabled != v10)
  {
    self->_BOOL announceOnHearingAidsEnabled = v10;
    BOOL v6 = 1;
  }
  uint64_t v11 = [MEMORY[0x263F285A0] sharedPreferences];
  int v12 = [v11 announceNotificationsOnHearingAidsSupported];

  if (self->_announceOnHearingAidsSupported != v12)
  {
    self->_BOOL announceOnHearingAidsSupported = v12;
    BOOL v6 = 1;
  }
  v13 = [MEMORY[0x263F285A0] sharedPreferences];
  int v14 = [v13 announceNotificationsOnBuiltInSpeakerEnabled];

  if (self->_announceOnBuiltInSpeakerEnabled == v14)
  {
    if (!v6) {
      return;
    }
  }
  else
  {
    self->_BOOL announceOnBuiltInSpeakerEnabled = v14;
  }
  v15 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = self->_siriEnabled;
    BOOL siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    BOOL announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    BOOL announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    BOOL announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    v21[0] = 67110144;
    v21[1] = v16;
    __int16 v22 = 1024;
    BOOL v23 = siriAllowedWhenLocked;
    __int16 v24 = 1024;
    BOOL v25 = announceOnHearingAidsEnabled;
    __int16 v26 = 1024;
    BOOL v27 = announceOnHearingAidsSupported;
    __int16 v28 = 1024;
    BOOL v29 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_2608DB000, v15, OS_LOG_TYPE_DEFAULT, "[UNCES] Siri preferences did change [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d, Announce on hearing aids enabled: %{BOOL}d, Announce on hearing aids supported: %{BOOL}d, Announce on built in speaker enabled: %{BOOL}d]", (uint8_t *)v21, 0x20u);
  }
  [(UNCEffectiveSettings *)self _queue_updateAnnounceSettings];
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__UNCEffectiveSettings_availableAnnouncementRequestTypesChanged_onPlatform___block_invoke;
  block[3] = &unk_265568500;
  char v6 = a3 & 1;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __76__UNCEffectiveSettings_availableAnnouncementRequestTypesChanged_onPlatform___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(result + 40);
  if (v2 == 2)
  {
    uint64_t v5 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(v1 + 48);
      int v7 = 67109120;
      int v8 = v6;
      _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of eligible setup for announce for CarPlay: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_queue_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(v1 + 48));
  }
  else if (v2 == 1)
  {
    int v3 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(v1 + 48);
      int v7 = 67109120;
      int v8 = v4;
      _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of eligible setup for announce for headphones: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_queue_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(v1 + 48));
  }
  return result;
}

- (void)_queue_updateAnnounceSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bbServerConnection = self->_bbServerConnection;

  [(UNCBulletinServerConnection *)bbServerConnection refreshAnnounceSettings];
}

- (void)_queue_updateGlobalSettings
{
}

- (void)_queue_updateAllSectionInfos
{
}

- (void)_queue_updateAnnounceControlCenterModuleAvailability
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v3 = [(UNCEffectiveSettings *)self _queue_effectiveGlobalAnnounceSetting];
  if ((v3 == 2) == (CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.siri.SpokenNotificationsModule", 0) == 0))
  {
    int v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
    if (v3 != 2) {
      int v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
    }
    CFPreferencesSetAppValue(@"SBIconVisibility", *v4, @"com.apple.siri.SpokenNotificationsModule");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
  }
}

- (int64_t)_queue_globalAnnounceSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t result = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceSetting];
  if (result == -1)
  {
    [(UNCEffectiveSettings *)self _queue_setGlobalAnnounceSetting:0];
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceSetting];
  if (a3 != -1 && v5 != a3)
  {
    int v6 = (void *)*MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      int v8 = UNCStringFromUNCAnnounceSetting(a3);
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setGlobalAnnounceSetting:a3];
    [(UNCEffectiveSettings *)self _queue_updateAnnounceControlCenterModuleAvailability];
    if (a3 == 2) {
      [(UNCEffectiveSettings *)self _saveGlobalAnnounceSettingEnabledEvent];
    }
    [(UNCEffectiveSettings *)self _queue_updateGlobalSettings];
    [(UNCEffectiveSettings *)self _queue_updateAllSectionInfos];
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceSetting
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForHeadphones]
    || [(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForCarPlay]
    && [(UNCEffectiveSettings *)self _queue_hasPairedVehiclesForCarPlay]
    || self->_announceOnHearingAidsSupported
    || self->_announceOnBuiltInSpeakerEnabled)
  {
    if (self->_siriEnabled && self->_siriAllowedWhenLocked)
    {
      unint64_t v3 = [(UNCEffectiveSettings *)self _queue_globalAnnounceSetting];
      if (v3 <= 1) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = v3;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = -1;
  }
  uint64_t v5 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    int v7 = UNCStringFromUNCAnnounceSetting(v4);
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__UNCEffectiveSettings_effectiveGlobalAnnounceSetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__UNCEffectiveSettings_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__UNCEffectiveSettings_setGlobalAnnounceSetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __49__UNCEffectiveSettings_setGlobalAnnounceSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceSetting:", *(void *)(a1 + 40));
}

- (void)_saveGlobalAnnounceSettingEnabledEvent
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F35098] eventStreamWithName:@"/discoverability/signals"];
  int64_t v3 = [MEMORY[0x263F35000] type];
  uint64_t v4 = [MEMORY[0x263F350A0] identifierWithString:@"com.apple.siri.spoken-notifications.enabled" type:v3];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [MEMORY[0x263F35088] eventWithStream:v2 startDate:v5 endDate:v5 value:v4 confidence:0 metadata:1.0];
  if (v6)
  {
    int v7 = [MEMORY[0x263F350B8] knowledgeStore];
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v7 saveObjects:v8 responseQueue:0 withCompletion:&__block_literal_global_22];

    uint64_t v9 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "[UNCES] Told CoreDuet about global announce setting change", v10, 2u);
    }
  }
}

void __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  else if (a2)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    [v6 setObject:@"com.apple.siri.spoken-notifications.enabled" forKeyedSubscript:@"signalIdentifier"];
    int v7 = [MEMORY[0x263F351F0] keyPathWithKey:@"/discoverability/signals/dataDictionary"];
    uint64_t v8 = [MEMORY[0x263F351B8] userContext];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
}

- (BOOL)_queue_isAnnounceSupportedForHeadphones
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults isAnnounceSupportedForHeadphones];
}

- (void)_queue_setAnnounceSupportedForHeadphones:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForHeadphones] != v3)
  {
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setAnnounceSupportedForHeadphones:v3];
    [(UNCEffectiveSettings *)self _queue_updateAnnounceSettings];
  }
}

- (int64_t)_queue_globalAnnounceHeadphonesSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t result = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceHeadphonesSetting];
  if (result == -1)
  {
    [(UNCEffectiveSettings *)self _queue_setGlobalAnnounceHeadphonesSetting:0];
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceHeadphonesSetting];
  if (a3 != -1 && v5 != a3)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      uint64_t v8 = UNCStringFromUNCAnnounceSetting(a3);
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setGlobalAnnounceHeadphonesSetting:a3];
    [(UNCEffectiveSettings *)self _queue_updateGlobalSettings];
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceHeadphoneSetting
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForHeadphones])
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && [(UNCEffectiveSettings *)self _queue_effectiveGlobalAnnounceSetting] == 2)
    {
      int64_t v3 = [(UNCEffectiveSettings *)self _queue_globalAnnounceHeadphonesSetting];
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = -1;
  }
  uint64_t v5 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    int v7 = UNCStringFromUNCAnnounceSetting(v4);
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceHeadphoneSetting
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__UNCEffectiveSettings_effectiveGlobalAnnounceHeadphoneSetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__UNCEffectiveSettings_effectiveGlobalAnnounceHeadphoneSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceHeadphoneSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceHeadphoneSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__UNCEffectiveSettings_setGlobalAnnounceHeadphoneSetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __58__UNCEffectiveSettings_setGlobalAnnounceHeadphoneSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceHeadphonesSetting:", *(void *)(a1 + 40));
}

- (void)_pairedVehiclesForCarPlayDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__UNCEffectiveSettings__pairedVehiclesForCarPlayDidChange___block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__UNCEffectiveSettings__pairedVehiclesForCarPlayDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllVehiclesForCarPlay];
}

- (void)_queue_loadCarPlayCapabilities
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = [(UNCEffectiveSettings *)self _queue_hasPairedVehiclesForCarPlay];
  uint64_t v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of vehicles for CarPlay: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  [(UNCEffectiveSettings *)self _fetchAllVehiclesForCarPlay];
  uint64_t v5 = [MEMORY[0x263F087C8] defaultCenter];
  [v5 addObserver:self selector:sel__pairedVehiclesForCarPlayDidChange_ name:@"CRPairedVehiclesDidChangeNotification" object:0];
}

- (void)_fetchAllVehiclesForCarPlay
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  BOOL v3 = (void *)getCRPairedVehicleManagerClass_softClass_0;
  uint64_t v11 = getCRPairedVehicleManagerClass_softClass_0;
  if (!getCRPairedVehicleManagerClass_softClass_0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getCRPairedVehicleManagerClass_block_invoke_0;
    v7[3] = &unk_2655675A0;
    v7[4] = &v8;
    __getCRPairedVehicleManagerClass_block_invoke_0((uint64_t)v7);
    BOOL v3 = (void *)v9[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = objc_alloc_init(v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke;
  v6[3] = &unk_265568570;
  v6[4] = self;
  [v5 fetchAllVehiclesWithCompletion:v6];
}

void __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 count];
  uint64_t v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3 != 0;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke_73;
  v7[3] = &unk_265567FA0;
  v7[4] = v5;
  BOOL v8 = v3 != 0;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke_73(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPairedVehiclesForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_queue_hasPairedVehiclesForCarPlay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults hasPairedVehiclesForCarPlay];
}

- (void)_queue_setPairedVehiclesForCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_hasPairedVehiclesForCarPlay] != v3)
  {
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setPairedVehiclesForCarPlay:v3];
    [(UNCEffectiveSettings *)self _queue_updateAnnounceSettings];
  }
}

- (BOOL)_queue_isAnnounceSupportedForCarPlay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults isAnnounceSupportedForCarPlay];
}

- (void)_queue_setAnnounceSupportedForCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForCarPlay] != v3)
  {
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setAnnounceSupportedForCarPlay:v3];
    [(UNCEffectiveSettings *)self _queue_updateAnnounceSettings];
  }
}

- (int64_t)_queue_globalAnnounceCarPlaySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t result = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceCarPlaySetting];
  if (result == -1)
  {
    [(UNCEffectiveSettings *)self _queue_setGlobalAnnounceCarPlaySetting:0];
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalAnnounceCarPlaySetting];
  if (a3 != -1 && v5 != a3)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      BOOL v8 = UNCStringFromUNCAnnounceCarPlaySetting(a3);
      int v9 = 138543362;
      BOOL v10 = v8;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set GlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setGlobalAnnounceCarPlaySetting:a3];
    [(UNCEffectiveSettings *)self _queue_updateGlobalSettings];
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceCarPlaySetting
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_isAnnounceSupportedForCarPlay]
    && [(UNCEffectiveSettings *)self _queue_hasPairedVehiclesForCarPlay])
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && [(UNCEffectiveSettings *)self _queue_effectiveGlobalAnnounceSetting] == 2)
    {
      int64_t v3 = [(UNCEffectiveSettings *)self _queue_globalAnnounceCarPlaySetting];
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 3;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = -1;
  }
  uint64_t v5 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = UNCStringFromUNCAnnounceCarPlaySetting(v4);
    int v9 = 138543362;
    BOOL v10 = v7;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__UNCEffectiveSettings_effectiveGlobalAnnounceCarPlaySetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__UNCEffectiveSettings_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceCarPlaySetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__UNCEffectiveSettings_setGlobalAnnounceCarPlaySetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __56__UNCEffectiveSettings_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) globalAnnounceCarPlaySetting];
  uint64_t v3 = *(void *)(a1 + 40);
  if (result != v3 && v3 != -1)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setGlobalAnnounceCarPlaySetting:");
    uint64_t v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "_queue_updateGlobalSettings");
  }
  return result;
}

- (int64_t)_queue_globalScheduledDeliverySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults globalScheduledDeliverySetting];
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__UNCEffectiveSettings_effectiveGlobalScheduledDeliverySetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __63__UNCEffectiveSettings_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting")) {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  }
  else {
    uint64_t v2 = -1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  int64_t v3 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v5 = v3;
    uint64_t v6 = UNCStringFromUNCScheduledDeliverySetting(v4);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__UNCEffectiveSettings_setGlobalScheduledDeliverySetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __58__UNCEffectiveSettings_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  if (result != *(void *)(a1 + 40))
  {
    int64_t v3 = (void *)*MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = v3;
      uint64_t v6 = UNCStringFromUNCScheduledDeliverySetting(v4);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 8) setGlobalScheduledDeliverySetting:*(void *)(a1 + 40)];
    return objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
  }
  return result;
}

- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "hour", (void)v14));
        [v4 addObject:v11];

        int v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "minute"));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    for (unint64_t i = 0; i < v6; i += 2)
    {
      if (v6 <= i + 1) {
        break;
      }
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      uint64_t v9 = [v3 objectAtIndex:i];
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

      BOOL v10 = [v3 objectAtIndex:i + 1];
      objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

      [v4 addObject:v8];
    }
  }

  return v4;
}

- (id)_queue_globalScheduledDeliveryTimes
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalScheduledDeliveryTimes];
  id v4 = [(UNCEffectiveSettings *)self _scheduledDeliveryTimesForEncodedDeliveryTimes:v3];

  return v4;
}

- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(UNCEffectiveSettings *)self _queue_globalScheduledDeliveryTimes];

  if (v5 != v4)
  {
    unint64_t v6 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] setEffectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [(UNCEffectiveSettings *)self _encodedScheduledDeliveryTimesForDeliveryTimes:v4];
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setGlobalScheduledDeliveryTimes:v7];
    [(UNCEffectiveSettings *)self _queue_updateGlobalSettings];
  }
}

- (NSArray)effectiveGlobalScheduledDeliveryTimes
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__13;
  uint64_t v11 = __Block_byref_object_dispose__13;
  id v12 = [MEMORY[0x263EFF8C0] array];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __61__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryTimes__block_invoke;
  v6[3] = &unk_265567600;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __61__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryTimes");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__UNCEffectiveSettings_setGlobalScheduledDeliveryTimes___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __56__UNCEffectiveSettings_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryTimes:", *(void *)(a1 + 40));
}

- (int64_t)_queue_effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults globalScheduledDeliveryShowNextSummarySetting];
  uint64_t v3 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = UNCStringFromUNCSystemSetting(v2);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v2;
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalScheduledDeliveryShowNextSummarySetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__UNCEffectiveSettings_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __73__UNCEffectiveSettings_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = v2;
    id v5 = UNCStringFromUNCSystemSetting(v3);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setGlobalScheduledDeliveryShowNextSummarySetting:*(void *)(a1 + 40)];
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
}

- (BOOL)_supportsFaceID
{
  return [(UNCBiometricResource *)self->_biometricResource hasPearlCapability];
}

- (BOOL)_isFaceIDEnrolled
{
  return [(UNCBiometricResource *)self->_biometricResource isPearlEnabledAndEnrolled];
}

- (void)_biometricResourceStateChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UNCEffectiveSettings__biometricResourceStateChanged__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __54__UNCEffectiveSettings__biometricResourceStateChanged__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewsSetting");
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_updateAllSectionInfos");
  }
  return result;
}

- (int64_t)_queue_defaultGlobalContentPreviewSetting
{
  if ([(UNCEffectiveSettings *)self _supportsFaceID]
    && [(UNCEffectiveSettings *)self _isFaceIDEnrolled])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (int64_t)_queue_globalContentPreviewsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults globalContentPreviewSetting];
}

- (void)_queue_setGlobalContentPreviewsSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(UNCEffectiveSettings *)self _queue_globalContentPreviewsSetting] != a3)
  {
    id v5 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalContentPreviewsSetting", v6, 2u);
    }
    [(UNCBulletinDefaultsInterface *)self->_bulletinDefaults setGlobalContentPreviewSetting:a3];
    [(UNCEffectiveSettings *)self _queue_updateGlobalSettings];
    [(UNCEffectiveSettings *)self _queue_updateAllSectionInfos];
  }
}

- (int64_t)effectiveGlobalContentPreviewSetting
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__UNCEffectiveSettings_effectiveGlobalContentPreviewSetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__UNCEffectiveSettings_effectiveGlobalContentPreviewSetting__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewsSetting");
  int64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t result = objc_msgSend(v3, "_queue_globalContentPreviewsSetting");
  }
  else {
    uint64_t result = objc_msgSend(v3, "_queue_defaultGlobalContentPreviewSetting");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__UNCEffectiveSettings_setGlobalContentPreviewSetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __55__UNCEffectiveSettings_setGlobalContentPreviewSetting___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == objc_msgSend(v2, "_queue_defaultGlobalContentPreviewSetting")) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  objc_msgSend(v2, "_queue_setGlobalContentPreviewsSetting:", v4);
  id v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalContentPreviewsSetting", v6, 2u);
  }
}

- (int64_t)_queue_globalNotificationListDisplayStyleSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  bulletinDefaults = self->_bulletinDefaults;

  return [(UNCBulletinDefaultsInterface *)bulletinDefaults globalNotificationListDisplayStyleSetting];
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__UNCEffectiveSettings_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__UNCEffectiveSettings_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting")) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting");
  }
  else {
    uint64_t result = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__UNCEffectiveSettings_setGlobalNotificationListDisplayStyleSetting___block_invoke;
  v4[3] = &unk_265568528;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __69__UNCEffectiveSettings_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) globalNotificationListDisplayStyleSetting];
  if (result != *(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setGlobalNotificationListDisplayStyleSetting:");
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
    int64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:v4];
  }
  return result;
}

- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
  id v5 = [v4 source];
  id v6 = objc_alloc(MEMORY[0x263F2A780]);
  uint64_t v10 = @"notificationListDisplayStyleSetting";
  int v7 = UNCStringFromUNCNotificationListDisplayStyleSetting(a3);
  v11[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = (void *)[v6 initWithIdentifier:@"com.apple.SpringBoard.notificationListDisplayStyleSetting.changed" bundleID:@"com.apple.SpringBoard" context:@"NotificationListDisplayStyleSetting" userInfo:v8];

  [v5 sendEvent:v9];
}

- (BOOL)hasPairedVehiclesForCarPlay
{
  return self->_hasPairedVehiclesForCarPlay;
}

- (BOOL)hasDestinationForRemoteNotifications
{
  return self->_hasDestinationForRemoteNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bbServerConnection, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForCarPlay, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForHeadphones, 0);

  objc_storeStrong((id *)&self->_bulletinDefaults, 0);
}

void __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "[UNCES] Error saving spoken notification setting change to Duet: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end