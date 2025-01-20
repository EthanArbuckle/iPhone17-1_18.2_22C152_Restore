@interface SHSSoundsPrefController
+ (id)BOOLeanCapabilitiesToTest;
- (ADASManager)audioSettingsManager;
- (BOOL)_isKeyHapticsSupported;
- (BOOL)_isVolumeSliderVisible;
- (CoreTelephonyClient)_client;
- (NSNumber)_cachedShouldHideValue;
- (NSNumberFormatter)numberFormatter;
- (PSSpecifier)_audioGroupSpecifier;
- (PSSpecifier)_headphoneLevelLimitingSpecifier;
- (PSSpecifier)_voiceMailSpecifier;
- (SHSAudioPlayback)_audioPlayback;
- (SHSRingerControl)_ringerControl;
- (SHSSoundsPrefController)init;
- (id)_keyboardClicksTitle:(id)a3;
- (id)_keyboardFeedbackSpecifier;
- (id)_volumeSliderCell;
- (id)canChangeRingtoneWithButtons:(id)a3;
- (id)detailTextForToneWithSpecifier:(id)a3;
- (id)getFixedVolumeControlsFooterWithSwitch:(BOOL)a3;
- (id)getHeadphoneLevelLimitSetting;
- (id)getSelectedHapticsOptionTitleWithSpecifier:(id)a3;
- (id)getSilentModeFooterWithSwitch:(BOOL)a3;
- (id)getSilentModeIconWithSwitch:(BOOL)a3;
- (id)silentModeEnabled:(id)a3;
- (id)soundEffects:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)volume:(id)a3;
- (int)_deviceType;
- (int64_t)_voiceMailSpecifierIndex;
- (int64_t)getSelectedHapticsOption;
- (unint64_t)ageOfToggleForSilentModeOn:(BOOL)a3;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)didLock;
- (void)endInterruption;
- (void)handleSilentModeNotification:(id)a3;
- (void)hapticsOptionsDidChange:(int64_t)a3;
- (void)presentHapticsController:(id)a3;
- (void)refreshShouldHideAllVoicemailUI;
- (void)ringerControl:(id)a3 volumeValueDidChange:(float)a4;
- (void)ringerControlDidObserveEffectiveSystemVolumeChange:(id)a3;
- (void)serverDiedNotificationHandler:(id)a3;
- (void)setAudioSettingsManager:(id)a3;
- (void)setCanChangeRingtoneWithButtons:(id)a3 specifier:(id)a4;
- (void)setFixedVolumeControls:(id)a3 specifier:(id)a4;
- (void)setNumberFormatter:(id)a3;
- (void)setPlayKeyboardSound:(id)a3 specifier:(id)a4;
- (void)setPlayLockSound:(id)a3 specifier:(id)a4;
- (void)setShowInStatusBarEnabled:(id)a3 specifier:(id)a4;
- (void)setSilentModeEnabled:(id)a3 specifier:(id)a4;
- (void)setSilentModeOff:(BOOL)a3;
- (void)setSilentModeOn:(BOOL)a3;
- (void)setSoundEffects:(id)a3 specifier:(id)a4;
- (void)setSystemHapticsEnabled:(id)a3 specifier:(id)a4;
- (void)setUpSilentModeNotifications;
- (void)setVolume:(id)a3 specifier:(id)a4;
- (void)setVolumeHUDsuppression:(BOOL)a3;
- (void)set_audioGroupSpecifier:(id)a3;
- (void)set_audioPlayback:(id)a3;
- (void)set_cachedShouldHideValue:(id)a3;
- (void)set_client:(id)a3;
- (void)set_headphoneLevelLimitingSpecifier:(id)a3;
- (void)set_ringerControl:(id)a3;
- (void)set_voiceMailSpecifier:(id)a3;
- (void)set_voiceMailSpecifierIndex:(int64_t)a3;
- (void)set_volumeSliderVisible:(BOOL)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)startRingtonePreview;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)unregisterSilentModeNotifications;
- (void)updateVoiceMailVisibility;
- (void)updateVolume;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willHideSlider;
- (void)willResignActive;
- (void)willShowSlider;
@end

@implementation SHSSoundsPrefController

- (id)canChangeRingtoneWithButtons:(id)a3
{
  v3 = NSNumber;
  v4 = [(SHSSoundsPrefController *)self _ringerControl];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "canChangeRingtoneWithButtons"));

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SHSSoundsPrefController;
  [(SHSSoundsPrefController *)&v5 viewWillAppear:a3];
  v4 = [(SHSSoundsPrefController *)self _ringerControl];
  [v4 canChangeRingtoneWithButtons];

  if ([(SHSSoundsPrefController *)self _isVolumeSliderVisible]) {
    [(SHSSoundsPrefController *)self willShowSlider];
  }
  [(SHSSoundsPrefController *)self updateVolume];
  if (!_os_feature_enabled_impl()
    || PSGetCapabilityBoolAnswer() && (_os_feature_enabled_impl() & 1) == 0)
  {
    [(SHSSoundsPrefController *)self reloadSpecifierID:@"HEADPHONE_LEVEL_LIMIT_SETTING" animated:1];
  }
}

- (void)willShowSlider
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[SHSSoundsPrefController willShowSlider]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(SHSSoundsPrefController *)self _ringerControl];
  -[SHSSoundsPrefController setVolumeHUDsuppression:](self, "setVolumeHUDsuppression:", [v4 canChangeRingtoneWithButtons]);
}

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3) {
    goto LABEL_57;
  }
  uint64_t v73 = (int)*MEMORY[0x263F5FDB8];
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  v74.receiver = self;
  v74.super_class = (Class)SHSSoundsPrefController;
  int v5 = [(SHSSoundsPrefController *)&v74 loadSpecifiersFromPlistName:@"Sounds" target:self];
  v6 = (void *)[v4 initWithArray:v5];

  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  int v8 = objc_msgSend(v7, "sf_inRetailKioskMode");

  v9 = objc_opt_new();
  if ((v8 & 1) == 0)
  {
    if ((PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x263F5FC40];
      v11 = SHS_LocalizedStringForSounds(@"SILENT_MODE");
      v12 = [v10 preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      uint64_t v13 = *MEMORY[0x263F60138];
      [v12 setProperty:@"SILENT_MODE_GROUP" forKey:*MEMORY[0x263F60138]];
      v14 = (void *)MEMORY[0x263F5FC40];
      v15 = SHS_LocalizedStringForSounds(@"SILENT_MODE");
      v16 = [v14 preferenceSpecifierNamed:v15 target:self set:sel_setSilentModeEnabled_specifier_ get:sel_silentModeEnabled_ detail:0 cell:6 edit:0];

      [v16 setProperty:@"SILENT_MODE" forKey:v13];
      v17 = [(SHSSoundsPrefController *)self silentModeEnabled:0];
      v18 = -[SHSSoundsPrefController getSilentModeIconWithSwitch:](self, "getSilentModeIconWithSwitch:", [v17 BOOLValue]);

      [v16 setProperty:v18 forKey:*MEMORY[0x263F60140]];
      [v9 addObject:v12];
      [v9 addObject:v16];
    }
    if ((PSGetCapabilityBoolAnswer() & 1) == 0 && (PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      v20 = (void *)MEMORY[0x263F5FC40];
      v21 = SHS_LocalizedStringForSounds(@"SHOW_IN_STATUS_BAR");
      v22 = [v20 preferenceSpecifierNamed:v21 target:self set:sel_setShowInStatusBarEnabled_specifier_ get:sel_showInStatusBarEnabled_ detail:0 cell:6 edit:0];

      [v22 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
      [v22 setProperty:@"com.apple.springboard" forKey:*MEMORY[0x263F60070]];
      [v22 setProperty:@"SBShowRingerState" forKey:*MEMORY[0x263F60170]];
      [v9 addObject:v19];
      [v9 addObject:v22];
    }
  }
  if ([v9 count])
  {
    uint64_t v23 = [v9 count];
    v24 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v23);
    [v6 insertObjects:v9 atIndexes:v24];
  }
  if ((v8 & 1) == 0)
  {
    v25 = [v6 specifierForID:@"HAPTICS"];
    if ([v6 indexOfObject:v25] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v25 setButtonAction:sel_presentHapticsController_];
      [v25 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    }
  }
  v26 = [v6 specifierForID:@"Voicemail"];
  [(SHSSoundsPrefController *)self set_voiceMailSpecifier:v26];

  v27 = [(SHSSoundsPrefController *)self _voiceMailSpecifier];
  -[SHSSoundsPrefController set_voiceMailSpecifierIndex:](self, "set_voiceMailSpecifierIndex:", [v6 indexOfObject:v27]);

  v28 = [(SHSSoundsPrefController *)self _cachedShouldHideValue];

  if (!v28) {
    [(SHSSoundsPrefController *)self refreshShouldHideAllVoicemailUI];
  }
  int v71 = v8;
  v29 = [(SHSSoundsPrefController *)self _cachedShouldHideValue];
  int v30 = [v29 BOOLValue];

  if (v30)
  {
    v31 = [(SHSSoundsPrefController *)self _voiceMailSpecifier];
    [v6 removeObject:v31];
  }
  int v32 = [(SHSSoundsPrefController *)self _deviceType];
  v33 = [v6 specifierForID:@"RING_VOLUME_SLIDER"];
  uint64_t v34 = [MEMORY[0x263F82818] configurationWithPointSize:17.0];
  v35 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.fill" withConfiguration:v34];
  v36 = [MEMORY[0x263F825C8] systemGrayColor];
  v37 = [v35 imageWithTintColor:v36 renderingMode:1];
  [v33 setProperty:v37 forKey:*MEMORY[0x263F60240]];

  v72 = (void *)v34;
  v38 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.wave.3.fill" withConfiguration:v34];
  v39 = [MEMORY[0x263F825C8] systemGrayColor];
  v40 = [v38 imageWithTintColor:v39 renderingMode:1];
  [v33 setProperty:v40 forKey:*MEMORY[0x263F60250]];

  if ((v32 - 1) <= 1)
  {
    v41 = [v6 specifierForID:@"RINGER_AND_ALERT_GROUP"];
    v42 = v41;
    if (v71)
    {
      [v41 setProperty:&stru_26EA42AA8 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v43 = [(SHSSoundsPrefController *)self _ringerControl];
      int v44 = [v43 canChangeRingtoneWithButtons];

      if (v44) {
        v45 = @"RING_VOL_CAN_BE_ADJUSTED";
      }
      else {
        v45 = @"RING_VOL_CANNOT_BE_ADJUSTED";
      }
      v46 = SHS_LocalizedStringForSounds(v45);
      [v42 setProperty:v46 forKey:*MEMORY[0x263F600F8]];
    }
    uint64_t v47 = [v6 indexOfObject:v42];
    if (v32 == 1 && v42 && (uint64_t v48 = v47, v47 != 0x7FFFFFFFFFFFFFFFLL))
    {
      [v6 removeObject:v33];
      [v6 insertObject:v33 atIndex:v48 + 1];
    }
    else if (v32 != 1)
    {
LABEL_35:

      goto LABEL_36;
    }
    if (_os_feature_enabled_impl()
      && +[SHSDualSIMToneHelper shouldShowSIMBasedToneCustomizationForAlertType:1])
    {
      v49 = [v6 specifierForID:@"Ringtone"];
      if (v49) {
        [v49 setDetailControllerClass:objc_opt_class()];
      }
    }
    goto LABEL_35;
  }
LABEL_36:
  v50 = [v6 specifierForID:@"SOUND_SWITCHES"];
  if ((PSGetCapabilityBoolAnswer() & 1) != 0 || (PSGetCapabilityBoolAnswer() & 1) == 0)
  {
    if (v50)
    {
      v51 = SHS_LocalizedStringForSounds(@"SOUND_ONLY_SWITCHES_FOOTER");
      [v50 setProperty:v51 forKey:*MEMORY[0x263F600F8]];
    }
    v52 = [v6 specifierForID:@"RING_VOLUME_SLIDER"];
    v53 = [NSNumber numberWithInt:0];
    [v52 setProperty:v53 forKey:*MEMORY[0x263F60038]];
  }
  if (PSGetCapabilityBoolAnswer())
  {
    if ((PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      v54 = SHS_LocalizedStringForSounds(@"SOUNDS_AND_HAPTICS");
      [(SHSSoundsPrefController *)self setTitle:v54];

      uint64_t v55 = [v6 indexOfSpecifierWithID:@"LOCK_SOUND_SWITCH"];
      if (v55 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v56 = v55;
        v57 = [v6 specifierForID:@"SOUND_SWITCHES"];
        if (v57)
        {
          v58 = SHS_LocalizedStringForSounds(@"SYSTEM_HAPTICS_FOOTER");
          [v57 setProperty:v58 forKey:*MEMORY[0x263F600F8]];
        }
        v59 = (void *)MEMORY[0x263F5FC40];
        v60 = SHS_LocalizedStringForSounds(@"SYSTEM_HAPTICS");
        v61 = [v59 preferenceSpecifierNamed:v60 target:self set:sel_setSystemHapticsEnabled_specifier_ get:sel_systemHapticsEnabled_ detail:0 cell:6 edit:0];

        [v61 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
        [v61 setProperty:@"com.apple.preferences.sounds" forKey:*MEMORY[0x263F60070]];
        [v61 setProperty:@"effects-haptic" forKey:*MEMORY[0x263F60170]];
        [v6 insertObject:v61 atIndex:v56 + 1];
      }
    }
  }
  if (_os_feature_enabled_impl()
    && (!PSGetCapabilityBoolAnswer() || _os_feature_enabled_impl()))
  {
    v62 = [v6 specifierForID:@"HEADPHONE_LEVEL_LIMIT_SETTING"];
    v63 = SHS_LocalizedStringForSounds(@"HEADPHONE_HEARING_PROTECTION");
    [v62 setName:v63];
  }
  if ([(SHSSoundsPrefController *)self _isKeyHapticsSupported])
  {
    uint64_t v64 = [v6 specifierForID:@"KEYBOARD_SOUND_SWITCH"];
    if (v64)
    {
      v65 = (void *)v64;
      uint64_t v66 = [v6 indexOfObject:v64];
      v67 = [(SHSSoundsPrefController *)self _keyboardFeedbackSpecifier];

      [v6 replaceObjectAtIndex:v66 withObject:v67];
    }
  }
  if (_os_feature_enabled_impl())
  {
    v68 = [MEMORY[0x263F428F0] profileManagementSpecifier];
    [v6 addObject:v68];
  }
  v69 = *(Class *)((char *)&self->super.super.super.super.super.isa + v73);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v73) = (Class)v6;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v73);
LABEL_57:
  return v3;
}

- (SHSRingerControl)_ringerControl
{
  return self->__ringerControl;
}

- (NSNumber)_cachedShouldHideValue
{
  return self->__cachedShouldHideValue;
}

- (void)set_voiceMailSpecifierIndex:(int64_t)a3
{
  self->__voiceMailSpecifierIndex = a3;
}

- (void)set_voiceMailSpecifier:(id)a3
{
}

- (void)refreshShouldHideAllVoicemailUI
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[SHSSoundsPrefController refreshShouldHideAllVoicemailUI]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)&v2, 0x16u);
}

- (PSSpecifier)_voiceMailSpecifier
{
  return self->__voiceMailSpecifier;
}

- (int)_deviceType
{
  int result = _deviceType___deviceType;
  if (!_deviceType___deviceType)
  {
    v3 = (void *)MGCopyAnswer();
    __int16 v4 = [v3 lowercaseString];
    if ([v4 isEqualToString:@"iphone"])
    {
      int v5 = 1;
    }
    else if (PSGetCapabilityBoolAnswer())
    {
      int v5 = 2;
    }
    else
    {
      int v5 = 3;
    }
    _deviceType___deviceType = v5;

    return _deviceType___deviceType;
  }
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)SHSSoundsPrefController;
  [(SHSSoundsPrefController *)&v7 viewWillDisappear:a3];
  __int16 v4 = SHSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SHSSoundsPrefController viewWillDisappear:]";
    _os_log_impl(&dword_237305000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v5 = [(SHSSoundsPrefController *)self _audioPlayback];
  LODWORD(v6) = 0.5;
  [v5 stopRingtoneWithFadeOut:v6];

  [(SHSSoundsPrefController *)self willHideSlider];
}

- (SHSAudioPlayback)_audioPlayback
{
  return self->__audioPlayback;
}

+ (id)BOOLeanCapabilitiesToTest
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"any-telephony";
  v4[1] = @"ipad";
  v4[2] = @"ringer-switch";
  v4[3] = @"gqDnklGQnpv5ilgh5uHckw";
  v4[4] = @"AirDropCapability";
  int v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

- (SHSSoundsPrefController)init
{
  v18.receiver = self;
  v18.super_class = (Class)SHSSoundsPrefController;
  int v2 = [(SHSSoundsPrefController *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(SHSRingerControl);
    ringerControl = v2->__ringerControl;
    v2->__ringerControl = v3;

    int v5 = [(SHSSoundsPrefController *)v2 _ringerControl];
    [v5 setDelegate:v2];

    double v6 = objc_alloc_init(SHSAudioPlayback);
    audioPlayback = v2->__audioPlayback;
    v2->__audioPlayback = v6;

    v2->_hasTelephony = PSGetCapabilityBoolAnswer();
    int v8 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x263F02D30]);
    client = v2->__client;
    v2->__client = v8;

    [(CoreTelephonyClient *)v2->__client setDelegate:v2];
    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_didBackground name:*MEMORY[0x263F83330] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_willForeground name:*MEMORY[0x263F833B8] object:0];

    [(SHSSoundsPrefController *)v2 setUpSilentModeNotifications];
    v12 = (ADASManager *)objc_alloc_init(MEMORY[0x263F28C30]);
    audioSettingsManager = v2->_audioSettingsManager;
    v2->_audioSettingsManager = v12;

    id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v14 setNumberStyle:1];
    [v14 setMaximumFractionDigits:0];
    v15 = [NSNumber numberWithInt:0];
    v16 = [v14 stringFromNumber:v15];
    [v14 setNotANumberSymbol:v16];

    [(SHSSoundsPrefController *)v2 setNumberFormatter:v14];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      [(SHSSoundsPrefController *)v2 removeSpecifierID:@"BUILT_IN_SPEAKER_GROUP"];
      [(SHSSoundsPrefController *)v2 removeSpecifierID:@"VOLUME_LIMIT"];
    }
  }
  return v2;
}

- (void)willHideSlider
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[SHSSoundsPrefController willHideSlider]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(SHSSoundsPrefController *)self setVolumeHUDsuppression:0];
  __int16 v4 = [(SHSSoundsPrefController *)self _ringerControl];
  [v4 setAppWantsVolumeChangeEvents:0];
}

- (void)setVolumeHUDsuppression:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = SHSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [NSNumber numberWithBool:self->_volumeHUDsuppressed];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    int v14 = 136315650;
    v15 = "-[SHSSoundsPrefController setVolumeHUDsuppression:]";
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: current: '%{public}@', proposed: '%{public}@'.", (uint8_t *)&v14, 0x20u);
  }
  if (self->_volumeHUDsuppressed != v3)
  {
    self->_volumeHUDsuppressed = v3;
    int v8 = [MEMORY[0x263F82438] sharedApplication];
    v9 = [v8 windows];
    uint64_t v10 = [v9 firstObject];
    v11 = [v10 windowScene];

    uint64_t v12 = v3 ^ 1;
    [v11 _setSystemVolumeHUDEnabled:v12];
    if (PSGetCapabilityBoolAnswer())
    {
      [v11 _setSystemVolumeHUDEnabled:v12 forAudioCategory:@"RingtonePreview"];
      uint64_t v13 = @"Ringtone";
    }
    else
    {
      uint64_t v13 = @"Audio/Video";
    }
    [v11 _setSystemVolumeHUDEnabled:v12 forAudioCategory:v13];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)SHSSoundsPrefController;
  id v6 = a4;
  uint64_t v7 = [(SHSSoundsPrefController *)&v32 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[SHSSoundsPrefController indexForIndexPath:](self, "indexForIndexPath:", v6, v32.receiver, v32.super_class);

  v9 = [(SHSSoundsPrefController *)self specifierAtIndex:v8];
  uint64_t v10 = [v9 identifier];
  int v11 = [v10 isEqualToString:@"RING_VOLUME_SLIDER"];

  if (v11)
  {
    uint64_t v12 = [v7 control];
    uint64_t v13 = [v12 _minValueView];
    int v14 = [MEMORY[0x263F5FBC0] appearance];
    v15 = [v14 textColor];
    [v13 setTintColor:v15];

    __int16 v16 = [v12 _maxValueView];
    v17 = [MEMORY[0x263F5FBC0] appearance];
    __int16 v18 = [v17 textColor];
    [v16 setTintColor:v18];

    [(SHSSoundsPrefController *)self willShowSlider];
  }
  else
  {
    v19 = [v9 identifier];
    int v20 = [v19 isEqualToString:@"SILENT_MODE"];

    if (v20)
    {
      uint64_t v12 = [v7 control];
      v21 = [MEMORY[0x263F825C8] colorWithRed:0.996078431 green:0.274509804 blue:0.156862745 alpha:1.0];
      [v12 setOnTintColor:v21];

      v22 = -[SHSSoundsPrefController getSilentModeIconWithSwitch:](self, "getSilentModeIconWithSwitch:", [v12 isOn]);
      [v9 setProperty:v22 forKey:*MEMORY[0x263F60140]];
      uint64_t v23 = [(SHSSoundsPrefController *)self specifiers];
      v24 = [v23 specifierForID:@"SILENT_MODE_GROUP"];

      v25 = -[SHSSoundsPrefController getSilentModeFooterWithSwitch:](self, "getSilentModeFooterWithSwitch:", [v12 isOn]);
      [v24 setProperty:v25 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v26 = [v9 identifier];
      int v27 = [v26 isEqualToString:@"FIXED_POSITION_VOLUME"];

      if (!v27) {
        goto LABEL_8;
      }
      uint64_t v12 = [v7 control];
      v28 = [(SHSSoundsPrefController *)self specifiers];
      v29 = [v28 specifierForID:@"FIXED_POSITION_VOLUME_CONTROLS"];

      int v30 = -[SHSSoundsPrefController getFixedVolumeControlsFooterWithSwitch:](self, "getFixedVolumeControlsFooterWithSwitch:", [v12 isOn]);
      [v29 setProperty:v30 forKey:*MEMORY[0x263F600F8]];
    }
  }

LABEL_8:
  return v7;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v9 specifier];
    uint64_t v7 = [v6 identifier];
    int v8 = [v7 isEqualToString:@"RING_VOLUME_SLIDER"];

    if (v8) {
      [(SHSSoundsPrefController *)self willHideSlider];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)updateVoiceMailVisibility
{
  BOOL v3 = [(SHSSoundsPrefController *)self _cachedShouldHideValue];

  if (!v3) {
    [(SHSSoundsPrefController *)self refreshShouldHideAllVoicemailUI];
  }
  __int16 v4 = [(SHSSoundsPrefController *)self _cachedShouldHideValue];
  int v5 = [v4 BOOLValue];

  id v6 = [(SHSSoundsPrefController *)self _voiceMailSpecifier];
  int v7 = [(SHSSoundsPrefController *)self containsSpecifier:v6];

  if (v7 && v5)
  {
    id v8 = [(SHSSoundsPrefController *)self _voiceMailSpecifier];
    -[SHSSoundsPrefController removeSpecifier:](self, "removeSpecifier:");
  }
  else
  {
    if ((v7 | v5)) {
      return;
    }
    id v8 = [(SHSSoundsPrefController *)self _voiceMailSpecifier];
    [(SHSSoundsPrefController *)self insertSpecifier:v8 atIndex:[(SHSSoundsPrefController *)self _voiceMailSpecifierIndex]];
  }
}

- (void)setUpSilentModeNotifications
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "Failed to subscribe for notifications from AVSystemController with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)serverDiedNotificationHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = SHSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SHSSoundsPrefController serverDiedNotificationHandler:]";
    _os_log_impl(&dword_237305000, v4, OS_LOG_TYPE_DEFAULT, "%s: audiomxd died. Re-subscribing notifications.", (uint8_t *)&v5, 0xCu);
  }

  [(SHSSoundsPrefController *)self unregisterSilentModeNotifications];
  [(SHSSoundsPrefController *)self setUpSilentModeNotifications];
}

- (void)handleSilentModeNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x263F54480]];

  id v6 = SHSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    id v8 = @"OFF";
    if (v7) {
      id v8 = @"ON";
    }
    *(_DWORD *)buf = 136315394;
    int v11 = "-[SHSSoundsPrefController handleSilentModeNotification:]";
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_237305000, v6, OS_LOG_TYPE_DEFAULT, "%s: Silent mode is %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SHSSoundsPrefController_handleSilentModeNotification___block_invoke;
  block[3] = &unk_264CD01F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__SHSSoundsPrefController_handleSilentModeNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifierID:@"SILENT_MODE_GROUP" animated:1];
  int v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifierID:@"SILENT_MODE" animated:1];
}

- (void)unregisterSilentModeNotifications
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F54478] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F54470] object:0];
}

- (void)setSilentModeEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke;
  block[3] = &unk_264CD02C0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F544E0] sharedInstance];
  objc_msgSend(v2, "setSilentMode:untilTime:reason:clientType:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), 0, @"User toggled in Sound and Haptics in Settings", 7);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke_2;
  block[3] = &unk_264CD02C0;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "getSilentModeIconWithSwitch:", objc_msgSend(a1[5], "BOOLValue"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1[6] setProperty:v5 forKey:*MEMORY[0x263F60140]];
  int v2 = [a1[4] specifiers];
  id v3 = [v2 specifierForID:@"SILENT_MODE_GROUP"];

  int8x16_t v4 = objc_msgSend(a1[4], "getSilentModeFooterWithSwitch:", objc_msgSend(a1[5], "BOOLValue"));
  [v3 setProperty:v4 forKey:*MEMORY[0x263F600F8]];

  [a1[4] reloadSpecifierID:@"SILENT_MODE_GROUP" animated:1];
  [a1[4] reloadSpecifierID:@"SILENT_MODE" animated:1];
}

- (id)silentModeEnabled:(id)a3
{
  id v3 = NSNumber;
  int8x16_t v4 = objc_msgSend(MEMORY[0x263F544E0], "sharedInstance", a3);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "getSilentMode"));

  return v5;
}

- (void)setShowInStatusBarEnabled:(id)a3 specifier:(id)a4
{
  [(SHSSoundsPrefController *)self setPreferenceValue:a3 specifier:a4];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F08660] object:0];
}

- (void)presentHapticsController:(id)a3
{
  id v4 = a3;
  id v7 = +[SHSViewControllerFactory createHapticsOptionsViewController:[(SHSSoundsPrefController *)self getSelectedHapticsOption] delegate:self];
  id v5 = [v4 name];

  [v7 setTitle:v5];
  int8x16_t v6 = [(SHSSoundsPrefController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (id)getSilentModeIconWithSwitch:(BOOL)a3
{
  id v4 = [MEMORY[0x263F82818] configurationWithPointSize:17.0];
  if (a3)
  {
    id v5 = [MEMORY[0x263F825C8] colorWithRed:0.996078431 green:0.274509804 blue:0.156862745 alpha:1.0];
    int8x16_t v6 = @"bell.slash.fill";
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] systemGrayColor];
    int8x16_t v6 = @"bell.fill";
  }
  id v7 = [MEMORY[0x263F827E8] systemImageNamed:v6 withConfiguration:v4];
  id v8 = [v7 imageWithTintColor:v5 renderingMode:1];

  return v8;
}

- (id)getSilentModeFooterWithSwitch:(BOOL)a3
{
  if (a3) {
    id v3 = @"SILENT_MODE_ON_FOOTER";
  }
  else {
    id v3 = @"SILENT_MODE_OFF_FOOTER";
  }
  id v4 = SHS_LocalizedStringForSounds(v3);
  return v4;
}

- (id)getFixedVolumeControlsFooterWithSwitch:(BOOL)a3
{
  if (a3) {
    id v3 = @"FIXED_POSITION_VOLUME_ON_FOOTER";
  }
  else {
    id v3 = @"FIXED_POSITION_VOLUME_OFF_FOOTER";
  }
  id v4 = SHS_LocalizedStringForSounds(v3);
  return v4;
}

- (void)setFixedVolumeControls:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  [(SHSSoundsPrefController *)self setPreferenceValue:v6 specifier:a4];
  id v7 = [(SHSSoundsPrefController *)self specifiers];
  id v10 = [v7 specifierForID:@"FIXED_POSITION_VOLUME_CONTROLS"];

  uint64_t v8 = [v6 BOOLValue];
  id v9 = [(SHSSoundsPrefController *)self getFixedVolumeControlsFooterWithSwitch:v8];
  [v10 setProperty:v9 forKey:*MEMORY[0x263F600F8]];

  [(SHSSoundsPrefController *)self reloadSpecifierID:@"FIXED_POSITION_VOLUME_CONTROLS" animated:1];
}

- (void)setSystemHapticsEnabled:(id)a3 specifier:(id)a4
{
  [(SHSSoundsPrefController *)self setPreferenceValue:a3 specifier:a4];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F08660] object:0];
}

- (void)didLock
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SHSSoundsPrefController didLock]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Requesting ringtone playback to end.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(SHSSoundsPrefController *)self _audioPlayback];
  [v4 playRingtoneWithIdentifier:0 loop:0];
}

- (void)updateVolume
{
  id v2 = [(SHSSoundsPrefController *)self _ringerControl];
  [v2 reload];
}

- (void)endInterruption
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SHSSoundsPrefController endInterruption]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Requesting ringtone playback to end.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(SHSSoundsPrefController *)self _audioPlayback];
  [v4 playRingtoneWithIdentifier:0 loop:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHSSoundsPrefController;
  [(SHSSoundsPrefController *)&v6 viewDidAppear:a3];
  id v4 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
  int v5 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Sounds"];
  [(SHSSoundsPrefController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v4 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v5];
}

- (void)willResignActive
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SHSSoundsPrefController willResignActive]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [MEMORY[0x263F82438] sharedApplication];
  char v5 = [v4 isSuspendedUnderLock];

  if ((v5 & 1) == 0) {
    [(SHSSoundsPrefController *)self endInterruption];
  }
  [(SHSSoundsPrefController *)self willHideSlider];
}

- (void)willBecomeActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[SHSSoundsPrefController willBecomeActive]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(SHSSoundsPrefController *)self _ringerControl];
  [v4 canChangeRingtoneWithButtons];

  [(SHSSoundsPrefController *)self updateVolume];
  if ([(SHSSoundsPrefController *)self _isVolumeSliderVisible]) {
    [(SHSSoundsPrefController *)self willShowSlider];
  }
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = SHSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[SHSSoundsPrefController showController:animate:]";
    _os_log_impl(&dword_237305000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v8 = [(SHSSoundsPrefController *)self _audioPlayback];
  [v8 playRingtoneWithIdentifier:0 loop:0];

  v9.receiver = self;
  v9.super_class = (Class)SHSSoundsPrefController;
  [(SHSSoundsPrefController *)&v9 showController:v6 animate:v4];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(SHSSoundsPrefController *)self endInterruption];
  v4.receiver = self;
  v4.super_class = (Class)SHSSoundsPrefController;
  [(SHSSoundsPrefController *)&v4 dealloc];
}

- (void)setSoundEffects:(id)a3 specifier:(id)a4
{
  int v4 = [a3 intValue];
  if (v4 == 3)
  {
    id v6 = (const void *)*MEMORY[0x263EFFB40];
    int v5 = (const void *)*MEMORY[0x263EFFB40];
  }
  else
  {
    int v5 = (const void *)*MEMORY[0x263EFFB38];
    if (v4 == 2)
    {
      id v6 = (const void *)*MEMORY[0x263EFFB40];
    }
    else
    {
      id v6 = (const void *)*MEMORY[0x263EFFB38];
      if (v4 == 1) {
        int v5 = (const void *)*MEMORY[0x263EFFB40];
      }
    }
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"sound-effects-speaker", v5, @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSetValue(@"sound-effects-headphones", v6, @"com.apple.springboard", v7, v8);
  CFPreferencesSynchronize(@"com.apple.springboard", v7, v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.sound-effects-speaker.changed", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.sound-effects-headphones.changed", 0, 0, 1u);
}

- (id)soundEffects:(id)a3
{
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"sound-effects-speaker", @"com.apple.springboard", &keyExistsAndHasValidFormat[1]);
  int v4 = CFPreferencesGetAppBooleanValue(@"sound-effects-headphones", @"com.apple.springboard", keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat[1])
  {
    CFPreferencesSetValue(@"sound-effects-speaker", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    int AppBooleanValue = 1;
  }
  int v5 = keyExistsAndHasValidFormat[0];
  if (!keyExistsAndHasValidFormat[0])
  {
    CFPreferencesSetValue(@"sound-effects-headphones", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    int v5 = keyExistsAndHasValidFormat[0];
    int v4 = 1;
  }
  if (!keyExistsAndHasValidFormat[1] || !v5) {
    CFPreferencesSynchronize(@"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  }
  if (AppBooleanValue | v4)
  {
    if (!AppBooleanValue || v4)
    {
      if (AppBooleanValue || !v4)
      {
        if (v4) {
          BOOL v7 = AppBooleanValue == 0;
        }
        else {
          BOOL v7 = 1;
        }
        if (v7) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = 3;
        }
      }
      else
      {
        uint64_t v6 = 2;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CFStringRef v8 = [NSNumber numberWithInt:v6];
  return v8;
}

- (void)startRingtonePreview
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[SHSSoundsPrefController startRingtonePreview]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  int v4 = (void *)MEMORY[0x263F8C6D0];
  int v5 = [(SHSSoundsPrefController *)self _audioPlayback];
  [v4 cancelPreviousPerformRequestsWithTarget:v5 selector:sel_stopPlayback object:0];

  if (self->_hasTelephony)
  {
    uint64_t v6 = [(SHSSoundsPrefController *)self _audioPlayback];
    char v7 = [v6 isPlayingRingtone];

    if ((v7 & 1) == 0)
    {
      CFStringRef v8 = SHSLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v9 = NSStringFromTLAlertType();
        int v14 = 136315394;
        v15 = "-[SHSSoundsPrefController startRingtonePreview]";
        __int16 v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s: Requesting playback of current ringtone for alert type '%{public}@'.", (uint8_t *)&v14, 0x16u);
      }
      id v10 = [MEMORY[0x263F7FC90] sharedToneManager];
      int v11 = [v10 currentToneIdentifierForAlertType:1];

      uint64_t v12 = [(SHSSoundsPrefController *)self _audioPlayback];
      [v12 playRingtoneWithIdentifier:v11 loop:1];
    }
  }
  uint64_t v13 = [(SHSSoundsPrefController *)self _audioPlayback];
  [v13 performSelector:sel_stopPlayback withObject:0 afterDelay:2.0];
}

- (id)volume:(id)a3
{
  id v3 = NSNumber;
  int v4 = [(SHSSoundsPrefController *)self _ringerControl];
  [v4 volume];
  int v5 = objc_msgSend(v3, "numberWithFloat:");

  return v5;
}

- (void)setVolume:(id)a3 specifier:(id)a4
{
  id v14 = a3;
  int v5 = [(SHSSoundsPrefController *)self _ringerControl];
  [v5 volume];
  float v7 = v6;
  [v14 floatValue];
  float v9 = v8;

  if (v7 != v9)
  {
    [v14 floatValue];
    int v11 = v10;
    uint64_t v12 = [(SHSSoundsPrefController *)self _ringerControl];
    LODWORD(v13) = v11;
    [v12 setVolume:v13];

    [(SHSSoundsPrefController *)self startRingtonePreview];
  }
}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  id v4 = a3;
  int v5 = [v4 propertyForKey:@"alertType"];
  uint64_t v6 = TLAlertTypeFromString();

  if ([(SHSSoundsPrefController *)self _deviceType] == 1
    && _os_feature_enabled_impl()
    && +[SHSDualSIMToneHelper shouldShowSIMBasedToneCustomizationForAlertType:v6])
  {
    float v7 = 0;
    goto LABEL_12;
  }
  float v8 = [v4 propertyForKey:@"accountIdentifier"];
  float v9 = [MEMORY[0x263F7FC90] sharedToneManager];
  int v10 = [v9 currentToneIdentifierForAlertType:v6 topic:v8];

  if ((PSGetCapabilityBoolAnswer() & 1) == 0 && PSGetCapabilityBoolAnswer())
  {
    int v11 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    uint64_t v12 = [v11 currentVibrationIdentifierForAlertType:v6 topic:v8];

    if ([v10 isEqualToString:*MEMORY[0x263F7FD70]]
      && ![v12 isEqualToString:*MEMORY[0x263F7FD78]])
    {
      float v7 = SHS_LocalizedStringForSounds(@"VIBRATE_ONLY");

      if (v7) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  double v13 = [MEMORY[0x263F7FC90] sharedToneManager];
  float v7 = [v13 nameForToneIdentifier:v10];

LABEL_11:
LABEL_12:

  return v7;
}

- (void)setPlayKeyboardSound:(id)a3 specifier:(id)a4
{
  [(SHSSoundsPrefController *)self setPreferenceValue:a3 specifier:a4];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F08660];
  int v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 postNotificationName:v4 object:v5];
}

- (void)setPlayLockSound:(id)a3 specifier:(id)a4
{
  [(SHSSoundsPrefController *)self setPreferenceValue:a3 specifier:a4];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F08660];
  int v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 postNotificationName:v4 object:v5];
}

- (void)setCanChangeRingtoneWithButtons:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(SHSSoundsPrefController *)self _ringerControl];
  [v6 setCanChangeRingtoneWithButtons:v5];

  [(SHSSoundsPrefController *)self setVolumeHUDsuppression:v5];
  [(SHSSoundsPrefController *)self reloadSpecifiers];
}

- (id)getHeadphoneLevelLimitSetting
{
  if (_os_feature_enabled_impl()
    && (!PSGetCapabilityBoolAnswer() || (_os_feature_enabled_impl() & 1) != 0))
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(SHSSoundsPrefController *)self audioSettingsManager];
    uint64_t v5 = [v4 getPreferenceFor:*MEMORY[0x263F28C10]];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      float v7 = [(SHSSoundsPrefController *)self audioSettingsManager];
      float v8 = [v7 getPreferenceFor:*MEMORY[0x263F28C18]];

      float v9 = NSString;
      int v10 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_SET_LEVEL");
      int v11 = [(SHSSoundsPrefController *)self numberFormatter];
      uint64_t v12 = [v11 stringFromNumber:v8];
      id v3 = objc_msgSend(v9, "stringWithFormat:", v10, v12);
    }
    else
    {
      id v3 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_SET_OFF");
    }
  }
  return v3;
}

- (BOOL)_isVolumeSliderVisible
{
  id v2 = [(SHSSoundsPrefController *)self _volumeSliderCell];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_volumeSliderCell
{
  BOOL v3 = [(SHSSoundsPrefController *)self specifierForID:@"RING_VOLUME_SLIDER"];
  uint64_t v4 = [(SHSSoundsPrefController *)self indexPathForSpecifier:v3];

  uint64_t v5 = [(SHSSoundsPrefController *)self table];
  int v6 = [v5 cellForRowAtIndexPath:v4];

  return v6;
}

- (void)ringerControlDidObserveEffectiveSystemVolumeChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x263F08B88] isMainThread])
  {
    int v6 = [(SHSSoundsPrefController *)self view];
    float v7 = [v6 window];

    if (v7)
    {
      if ([(SHSSoundsPrefController *)self _isVolumeSliderVisible])
      {
        float v8 = [(SHSSoundsPrefController *)self _volumeSliderCell];
        float v9 = [v8 control];
        int v10 = [v9 isTracking];

        if (!v10)
        {
          [(SHSSoundsPrefController *)self startRingtonePreview];
          goto LABEL_16;
        }
        int v11 = SHSLogForCategory(0);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315138;
        __int16 v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        uint64_t v12 = "%s: Volume slider is active and in use, ignoring.";
        goto LABEL_14;
      }
      int v11 = SHSLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        uint64_t v12 = "%s: Volume slider not on screen, ignoring.";
        goto LABEL_14;
      }
    }
    else
    {
      int v11 = SHSLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        uint64_t v12 = "%s: View is not on screen, ignoring.";
LABEL_14:
        _os_log_impl(&dword_237305000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__SHSSoundsPrefController_ringerControlDidObserveEffectiveSystemVolumeChange___block_invoke;
  v13[3] = &unk_264CD02E8;
  v13[4] = self;
  id v14 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v13);

LABEL_16:
}

uint64_t __78__SHSSoundsPrefController_ringerControlDidObserveEffectiveSystemVolumeChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) ringerControlDidObserveEffectiveSystemVolumeChange:*(void *)(a1 + 40)];
}

- (void)ringerControl:(id)a3 volumeValueDidChange:(float)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    float v7 = SHSLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SHSSoundsPrefController ringerControl:volumeValueDidChange:]";
      _os_log_impl(&dword_237305000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if ([(SHSSoundsPrefController *)self _isVolumeSliderVisible])
    {
      float v8 = [(SHSSoundsPrefController *)self _volumeSliderCell];
      *(float *)&double v9 = a4;
      int v10 = [NSNumber numberWithFloat:v9];
      [v8 setValue:v10];
    }
    else
    {
      [(SHSSoundsPrefController *)self reloadSpecifierID:@"RING_VOLUME_SLIDER"];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SHSSoundsPrefController_ringerControl_volumeValueDidChange___block_invoke;
    block[3] = &unk_264CD0310;
    void block[4] = self;
    id v12 = v6;
    float v13 = a4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__SHSSoundsPrefController_ringerControl_volumeValueDidChange___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) ringerControl:*(void *)(a1 + 40) volumeValueDidChange:a2];
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(SHSSoundsPrefController *)self set_cachedShouldHideValue:0];
    [(SHSSoundsPrefController *)self updateVoiceMailVisibility];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__SHSSoundsPrefController_carrierBundleChange___block_invoke;
    v5[3] = &unk_264CD02E8;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __47__SHSSoundsPrefController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (void)hapticsOptionsDidChange:(int64_t)a3
{
  BOOL v4 = (unint64_t)a3 < 3;
  BOOL v5 = (a3 & 1) == 0;
  uint64_t v6 = v4 & (3u >> (a3 & 7));
  BOOL v7 = v5 && v4;
  [(SHSSoundsPrefController *)self setSilentModeOn:v6];
  [(SHSSoundsPrefController *)self setSilentModeOff:v7];
  [(SHSSoundsPrefController *)self reloadSpecifierID:@"HAPTICS" animated:1];
}

- (void)setSilentModeOff:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v5 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"ring-vibrate", *v5, @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSynchronize(@"com.apple.springboard", v6, v7);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.ring-vibrate.changed", 0, 0, 1u);
  unint64_t v9 = [(SHSSoundsPrefController *)self ageOfToggleForSilentModeOn:0];
  +[SHSAnalytics trackingVibrateOnRingValueChanged:v3 age:v9];
}

- (void)setSilentModeOn:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v5 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"silent-vibrate", *v5, @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSynchronize(@"com.apple.springboard", v6, v7);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.silent-vibrate.changed", 0, 0, 1u);
  unint64_t v9 = [(SHSSoundsPrefController *)self ageOfToggleForSilentModeOn:1];
  +[SHSAnalytics trackingVibrateOnSilentValueChanged:v3 age:v9];
}

- (id)getSelectedHapticsOptionTitleWithSpecifier:(id)a3
{
  unint64_t v3 = [(SHSSoundsPrefController *)self getSelectedHapticsOption];
  if (v3 > 2) {
    BOOL v4 = @"NEVER_PLAY";
  }
  else {
    BOOL v4 = off_264CD0330[v3];
  }
  BOOL v5 = SHS_LocalizedStringForSounds(v4);
  return v5;
}

- (int64_t)getSelectedHapticsOption
{
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"silent-vibrate", @"com.apple.springboard", &keyExistsAndHasValidFormat[1]);
  int v3 = CFPreferencesGetAppBooleanValue(@"ring-vibrate", @"com.apple.springboard", keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat[1])
  {
    CFPreferencesSetValue(@"silent-vibrate", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    int AppBooleanValue = 1;
  }
  int v4 = keyExistsAndHasValidFormat[0];
  if (!keyExistsAndHasValidFormat[0])
  {
    CFPreferencesSetValue(@"ring-vibrate", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    int v4 = keyExistsAndHasValidFormat[0];
    int v3 = 1;
  }
  if (keyExistsAndHasValidFormat[1] && v4)
  {
    if (!AppBooleanValue) {
      goto LABEL_12;
    }
  }
  else
  {
    CFPreferencesSynchronize(@"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    if (!AppBooleanValue) {
      goto LABEL_12;
    }
  }
  if (v3) {
    return 0;
  }
LABEL_12:
  int64_t v6 = 2;
  if (!v3) {
    int64_t v6 = 3;
  }
  if (AppBooleanValue) {
    return 1;
  }
  else {
    return v6;
  }
}

- (BOOL)_isKeyHapticsSupported
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 _feedbackSupportLevel];

  if (v3 != 2) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (id)_keyboardFeedbackSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  int v4 = SHS_LocalizedStringForSounds(@"KEYBOARD_FEEDBACK");
  BOOL v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:sel__keyboardClicksTitle_ detail:objc_opt_class() cell:2 edit:0];

  [v5 setIdentifier:@"KEYBOARD_FEEDBACK"];
  return v5;
}

- (id)_keyboardClicksTitle:(id)a3
{
  return +[SHSKeyboardClicksControllerViewController combinedDescription];
}

- (unint64_t)ageOfToggleForSilentModeOn:(BOOL)a3
{
  int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v5 = [MEMORY[0x263EFF910] date];
  if (a3) {
    int64_t v6 = @"AgeOfVibrateWhenRing";
  }
  else {
    int64_t v6 = @"AgeOfVibrateWhenSilent";
  }
  CFStringRef v7 = [v4 objectForKey:v6];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF8F0]);
    unint64_t v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    int v10 = [v9 components:16 fromDate:v7 toDate:v5 options:0];
    unint64_t v11 = [v10 day] + 1;
  }
  else
  {
    unint64_t v11 = 1;
  }
  [v4 setObject:v5 forKey:v6];

  uint64_t v12 = 0;
  uint64_t v13 = 8u;
  unint64_t v14 = 365;
  while (v11 >= *(void *)((char *)&unk_2373248A0 + v13))
  {
    v13 += 8;
    v12 += 0x100000000;
    if (v13 == 56) {
      goto LABEL_12;
    }
  }
  unint64_t v14 = *(void *)((char *)&unk_2373248A0 + (v12 >> 29));
LABEL_12:

  return v14;
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (void)set_audioPlayback:(id)a3
{
}

- (void)set_volumeSliderVisible:(BOOL)a3
{
  self->__volumeSliderVisible = a3;
}

- (void)set_ringerControl:(id)a3
{
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (PSSpecifier)_audioGroupSpecifier
{
  return self->__audioGroupSpecifier;
}

- (void)set_audioGroupSpecifier:(id)a3
{
}

- (PSSpecifier)_headphoneLevelLimitingSpecifier
{
  return self->__headphoneLevelLimitingSpecifier;
}

- (void)set_headphoneLevelLimitingSpecifier:(id)a3
{
}

- (int64_t)_voiceMailSpecifierIndex
{
  return self->__voiceMailSpecifierIndex;
}

- (void)set_cachedShouldHideValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedShouldHideValue, 0);
  objc_storeStrong((id *)&self->__headphoneLevelLimitingSpecifier, 0);
  objc_storeStrong((id *)&self->__audioGroupSpecifier, 0);
  objc_storeStrong((id *)&self->__voiceMailSpecifier, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->__ringerControl, 0);
  objc_storeStrong((id *)&self->__audioPlayback, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end