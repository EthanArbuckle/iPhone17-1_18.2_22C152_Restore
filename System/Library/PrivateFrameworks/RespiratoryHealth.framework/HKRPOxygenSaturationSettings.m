@interface HKRPOxygenSaturationSettings
+ (id)standardSettings;
- (BOOL)backgroundRecordingsDuringSleepMode;
- (BOOL)backgroundRecordingsDuringTheaterMode;
- (BOOL)backgroundRecordingsEnabled;
- (BOOL)overrideIsRemoteDisabled;
- (BOOL)oxygenSaturationDisabled;
- (HKRPOxygenSaturationSettings)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4;
- (NSString)aboutBloodOxygenFooter;
- (NSString)aboutBloodOxygenFooterWithLearnMore;
- (NSString)backgroundRecordingsDetailOptionsFooter;
- (NSString)backgroundRecordingsDetailOptionsTitle;
- (NSString)backgroundRecordingsDetailSleepTitle;
- (NSString)backgroundRecordingsDetailTheaterTitle;
- (NSString)backgroundRecordingsFooter;
- (NSString)backgroundRecordingsHeader;
- (NSString)backgroundRecordingsTitle;
- (NSString)backgroundRecordingsWithAgeGatingEnabledHeader;
- (NSString)bloodOxygenLocalizedPaneTitle;
- (NSString)bloodOxygenRecordingsTitle;
- (NSString)bloodOxygenSectionTitle;
- (NSString)featureActiveStatusDescription;
- (NSString)featureActiveStatusTitle;
- (NSString)featureInactiveStatusDescription;
- (NSString)featureInactiveStatusTitle;
- (NSString)howToTakeARecordingEducationTitle;
- (NSString)learnMoreAboutBloodOxygenURL;
- (NSString)recordingInactiveDescription;
- (id)_settingsToObserve;
- (void)_notifySettingsDidChange;
- (void)_setBackgroundRecordingsDuringSleepMode:(BOOL)a3;
- (void)_setBackgroundRecordingsDuringTheaterMode:(BOOL)a3;
- (void)_setBackgroundRecordingsEnabled:(BOOL)a3;
- (void)_setOxygenSaturationDisabled:(BOOL)a3;
- (void)_startObservingDefaults;
- (void)_stopObservingAllDefaults;
- (void)activateDefaultValuesIfNeeded;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)setBackgroundRecordingsDuringSleepMode:(BOOL)a3;
- (void)setBackgroundRecordingsDuringTheaterMode:(BOOL)a3;
- (void)setBackgroundRecordingsEnabled:(BOOL)a3;
- (void)setOverrideIsRemoteDisabled:(BOOL)a3;
- (void)setOxygenSaturationDisabled:(BOOL)a3;
@end

@implementation HKRPOxygenSaturationSettings

- (void)_startObservingDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HKRPOxygenSaturationSettings *)self _settingsToObserve];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSUserDefaults *)self->_userDefaults addObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) options:3 context:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)standardSettings
{
  v2 = objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults");
  v3 = [HKRPUserDefaultsSyncProvider alloc];
  uint64_t v4 = [(HKRPUserDefaultsSyncProvider *)v3 initWithUserDefaultsDomain:*MEMORY[0x263F09F70]];
  uint64_t v5 = [[HKRPOxygenSaturationSettings alloc] initWithUserDefaults:v2 userDefaultsSyncProvider:v4];

  return v5;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  if (a4) {
    -[HKObserverSet registerObserver:queue:](observers, "registerObserver:queue:", a3);
  }
  else {
    [(HKObserverSet *)observers registerObserver:a3];
  }
}

- (id)_settingsToObserve
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"OxygenSaturationDisabled";
  v4[1] = @"BackgroundMeasurementsEnabled";
  v4[2] = @"BackgroundMeasurementsDuringSleepMode";
  v4[3] = @"BackgroundMeasurementsDuringTheaterMode";
  v4[4] = @"OverrideIsRemoteDisabled";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];

  return v2;
}

- (HKRPOxygenSaturationSettings)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKRPOxygenSaturationSettings;
  long long v9 = [(HKRPOxygenSaturationSettings *)&v15 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    id v11 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v12 = [v11 initWithName:@"HKRPOxygenSaturationSettingsObservers" loggingCategory:*MEMORY[0x263F09950]];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v12;

    objc_storeStrong((id *)&v10->_userDefaultsSyncProvider, a4);
    [(HKRPOxygenSaturationSettings *)v10 _startObservingDefaults];
  }

  return v10;
}

- (void)dealloc
{
  [(HKRPOxygenSaturationSettings *)self _stopObservingAllDefaults];
  v3.receiver = self;
  v3.super_class = (Class)HKRPOxygenSaturationSettings;
  [(HKRPOxygenSaturationSettings *)&v3 dealloc];
}

- (BOOL)oxygenSaturationDisabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"OxygenSaturationDisabled"];
}

- (void)setOxygenSaturationDisabled:(BOOL)a3
{
  [(HKRPOxygenSaturationSettings *)self _setOxygenSaturationDisabled:a3];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"OxygenSaturationDisabled"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v5];
}

- (void)_setOxygenSaturationDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = NSNumber;
    id v9 = v7;
    long long v10 = [v8 numberWithBool:v3];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting oxygen saturation sensor disabled: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"OxygenSaturationDisabled"];
}

- (BOOL)backgroundRecordingsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BackgroundMeasurementsEnabled"];
}

- (void)setBackgroundRecordingsEnabled:(BOOL)a3
{
  [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsEnabled:a3];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"BackgroundMeasurementsEnabled"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v5];
}

- (void)_setBackgroundRecordingsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = NSNumber;
    id v9 = v7;
    long long v10 = [v8 numberWithBool:v3];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings enabled: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"BackgroundMeasurementsEnabled"];
}

- (BOOL)backgroundRecordingsDuringSleepMode
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BackgroundMeasurementsDuringSleepMode"];
}

- (void)setBackgroundRecordingsDuringSleepMode:(BOOL)a3
{
  [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsDuringSleepMode:a3];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"BackgroundMeasurementsDuringSleepMode"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v5];
}

- (void)_setBackgroundRecordingsDuringSleepMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = NSNumber;
    id v9 = v7;
    long long v10 = [v8 numberWithBool:v3];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings during sleep mode: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"BackgroundMeasurementsDuringSleepMode"];
}

- (BOOL)backgroundRecordingsDuringTheaterMode
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BackgroundMeasurementsDuringTheaterMode"];
}

- (void)setBackgroundRecordingsDuringTheaterMode:(BOOL)a3
{
  [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsDuringTheaterMode:a3];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"BackgroundMeasurementsDuringTheaterMode"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v5];
}

- (void)_setBackgroundRecordingsDuringTheaterMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = NSNumber;
    id v9 = v7;
    long long v10 = [v8 numberWithBool:v3];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings during theater mode: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"BackgroundMeasurementsDuringTheaterMode"];
}

- (void)activateDefaultValuesIfNeeded
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"BackgroundMeasurementsEnabled"];

  if (!v3)
  {
    [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsEnabled:1];
    [v6 addObject:@"BackgroundMeasurementsEnabled"];
  }
  uint64_t v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"BackgroundMeasurementsDuringSleepMode"];

  if (!v4)
  {
    [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsDuringSleepMode:1];
    [v6 addObject:@"BackgroundMeasurementsDuringSleepMode"];
  }
  id v5 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"BackgroundMeasurementsDuringTheaterMode"];

  if (!v5)
  {
    [(HKRPOxygenSaturationSettings *)self _setBackgroundRecordingsDuringTheaterMode:0];
    [v6 addObject:@"BackgroundMeasurementsDuringTheaterMode"];
  }
  [v6 addObject:@"HKRPBloodOxygenSaturationEnabled"];
  [(HKRPUserDefaultsSyncProviding *)self->_userDefaultsSyncProvider synchronizeKeys:v6];
}

- (void)reset
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:*MEMORY[0x263F09F70]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v22;
    id v8 = (os_log_t *)MEMORY[0x263F09950];
    *(void *)&long long v5 = 138543618;
    long long v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", @"HKRP", v20) & 1) == 0)
        {
          [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v10];
          int v11 = [(NSUserDefaults *)self->_userDefaults objectForKey:v10];

          _HKInitializeLogging();
          os_log_t v12 = *v8;
          BOOL v13 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (!v13) {
              continue;
            }
            v14 = v12;
            uint64_t v15 = objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v15;
            __int16 v27 = 2114;
            v28 = v10;
            id v16 = v15;
            v17 = v14;
            v18 = "[%{public}@] Attempted to remove key \"%{public}@\" but it's still present, maybe it lives in the global domain?";
          }
          else
          {
            if (!v13) {
              continue;
            }
            v14 = v12;
            v19 = objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v19;
            __int16 v27 = 2114;
            v28 = v10;
            id v16 = v19;
            v17 = v14;
            v18 = "[%{public}@] Removed key \"%{public}@\"";
          }
          _os_log_impl(&dword_21D42F000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
}

- (BOOL)overrideIsRemoteDisabled
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"OverrideIsRemoteDisabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOverrideIsRemoteDisabled:(BOOL)a3
{
  [(NSUserDefaults *)self->_userDefaults setBool:a3 forKey:@"OverrideIsRemoteDisabled"];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"OverrideIsRemoteDisabled"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v5];
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifySettingsDidChange
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__HKRPOxygenSaturationSettings__notifySettingsDidChange__block_invoke;
  v3[3] = &unk_264447358;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __56__HKRPOxygenSaturationSettings__notifySettingsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 oxygenSaturationSettingsDidChange:*(void *)(a1 + 32)];
  }
}

- (void)_stopObservingAllDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HKRPOxygenSaturationSettings *)self _settingsToObserve];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _HKInitializeLogging();
  uint64_t v13 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = *MEMORY[0x263F081C8];
    id v17 = v15;
    v18 = [v12 objectForKeyedSubscript:v16];
    v19 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    *(_DWORD *)buf = 138544130;
    long long v24 = v15;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2114;
    v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    _os_log_impl(&dword_21D42F000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ change to: %{public}@ -> %{public}@", buf, 0x2Au);
  }
  long long v20 = [(HKRPOxygenSaturationSettings *)self _settingsToObserve];
  int v21 = [v20 containsObject:v10];

  if (v21)
  {
    [(HKRPOxygenSaturationSettings *)self _notifySettingsDidChange];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKRPOxygenSaturationSettings;
    [(HKRPOxygenSaturationSettings *)&v22 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (NSString)bloodOxygenLocalizedPaneTitle
{
  return (NSString *)HKRPLocalizedString(@"APP_NAME");
}

- (NSString)bloodOxygenSectionTitle
{
  return (NSString *)HKRPLocalizedString(@"RECORDINGS_SECTION_TITLE");
}

- (NSString)backgroundRecordingsWithAgeGatingEnabledHeader
{
  return (NSString *)HKRPLocalizedString(@"RECORDINGS_DESCRIPTION_AGE_GATING_ENABLED");
}

- (NSString)backgroundRecordingsHeader
{
  return (NSString *)HKRPLocalizedString(@"RECORDINGS_DESCRIPTION");
}

- (NSString)bloodOxygenRecordingsTitle
{
  return (NSString *)HKRPLocalizedString(@"BLOOD_OXYGEN_RECORDINGS");
}

- (NSString)backgroundRecordingsTitle
{
  return (NSString *)HKRPLocalizedString(@"BLOOD_OXYGEN_RECORDINGS");
}

- (NSString)featureActiveStatusTitle
{
  return (NSString *)HKRPLocalizedString(@"OXYGEN_SATURATION_FEATURE_ACTIVE_STATUS");
}

- (NSString)featureActiveStatusDescription
{
  return (NSString *)HKRPLocalizedString(@"OXYGEN_SATURATION_FEATURE_ACTIVE_DESCRIPTION");
}

- (NSString)featureInactiveStatusTitle
{
  return (NSString *)HKRPLocalizedString(@"OXYGEN_SATURATION_FEATURE_INACTIVE_STATUS");
}

- (NSString)featureInactiveStatusDescription
{
  return (NSString *)HKRPLocalizedString(@"OXYGEN_SATURATION_FEATURE_ACTIVE_DESCRIPTION");
}

- (NSString)backgroundRecordingsFooter
{
  return (NSString *)HKRPLocalizedString(@"BACKGROUND_RECORDING_DESCRIPTION");
}

- (NSString)learnMoreAboutBloodOxygenURL
{
  return (NSString *)HKRPLocalizedString(@"LEARN_MORE_ABOUT_BLOOD_OXYGEN_LINK_URL");
}

- (NSString)aboutBloodOxygenFooter
{
  return (NSString *)HKRPLocalizedString(@"ABOUT_BLOOD_OXYGEN");
}

- (NSString)aboutBloodOxygenFooterWithLearnMore
{
  return (NSString *)HKRPLocalizedString(@"LEARN_MORE_ABOUT_BLOOD_OXYGEN");
}

- (NSString)backgroundRecordingsDetailOptionsTitle
{
  return (NSString *)HKRPLocalizedString(@"BACKGROUND_RECORDING_OPTION_TITLE");
}

- (NSString)backgroundRecordingsDetailSleepTitle
{
  return (NSString *)HKRPLocalizedString(@"BACKGROUND_RECORDING_DURING_SLEEP");
}

- (NSString)backgroundRecordingsDetailTheaterTitle
{
  return (NSString *)HKRPLocalizedString(@"BACKGROUND_RECORDING_DURING_THEATER_MODE");
}

- (NSString)backgroundRecordingsDetailOptionsFooter
{
  if ([MEMORY[0x263F0A950] isWristDetectEnabled])
  {
    v2 = HKRPLocalizedString(@"BACKGROUND_RECORDING_OPTION_FOOTER");
  }
  else
  {
    id v3 = NSString;
    uint64_t v4 = HKRPLocalizedString(@"BACKGROUND_RECORDING_OPTION_FOOTER_WRIST_DETECT_TURNED_OFF_%@");
    uint64_t v5 = HKRPLocalizedString(@"PASSCODE_SETTINGS_LINK_TITLE");
    v2 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  }

  return (NSString *)v2;
}

- (NSString)howToTakeARecordingEducationTitle
{
  return (NSString *)HKRPLocalizedString(@"HOW_TO_MAKE_A_RECORDING");
}

- (NSString)recordingInactiveDescription
{
  return (NSString *)HKRPLocalizedString(@"OXYGEN_SATURATION_FEATURE_INACTIVE_DESCRIPTION");
}

@end