@interface COSSoundsController
- (ADASManager)audioSettingsManager;
- (BOOL)shouldReloadSpecifiersOnResume;
- (COSSoundsController)init;
- (NACVolumeController)volumeController;
- (NPSDomainAccessor)carouselDomain;
- (NPSDomainAccessor)coreaudioDomain;
- (NPSDomainAccessor)gizmoGlobalDomain;
- (NSNumberFormatter)numberFormatter;
- (PSSpecifier)audioMuteSwitch;
- (PSSpecifier)audioSlider;
- (PSSpecifier)hapticSlider;
- (PSSpecifier)prominentHapticSwitch;
- (UIImage)hapticSliderDownDisabled;
- (UIImage)hapticSliderDownEnabled;
- (UIImage)volumeSliderDownDisabled;
- (UIImage)volumeSliderDownEnabled;
- (id)audioVolume:(id)a3;
- (id)detailTextForToneWithSpecifier:(id)a3;
- (id)getHeadphoneLevelLimitSetting;
- (id)hapticIntensity:(id)a3;
- (id)hapticState:(id)a3;
- (id)hapticsValueText;
- (id)isAudioMuted:(id)a3;
- (id)jackrabbitState:(id)a3;
- (id)prominentHapticsEnabled:(id)a3;
- (id)specifiers;
- (id)systemHapticsState:(id)a3;
- (void)_handleTonePreferencesDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setAudioMuteSwitch:(id)a3;
- (void)setAudioMuted:(id)a3 specifier:(id)a4;
- (void)setAudioSettingsManager:(id)a3;
- (void)setAudioSlider:(id)a3;
- (void)setAudioVolume:(id)a3 specifier:(id)a4;
- (void)setCarouselDomain:(id)a3;
- (void)setCoreaudioDomain:(id)a3;
- (void)setGizmoGlobalDomain:(id)a3;
- (void)setHapticIntensity:(id)a3 specifier:(id)a4;
- (void)setHapticSlider:(id)a3;
- (void)setHapticSliderDownDisabled:(id)a3;
- (void)setHapticSliderDownEnabled:(id)a3;
- (void)setHapticState:(id)a3 specifier:(id)a4;
- (void)setHapticStateValue:(int64_t)a3;
- (void)setJackrabbitState:(id)a3 specifier:(id)a4;
- (void)setNumberFormatter:(id)a3;
- (void)setProminentHapticSwitch:(id)a3;
- (void)setProminentHapticsEnabled:(id)a3 specifier:(id)a4;
- (void)setSystemHapticsState:(id)a3 specifier:(id)a4;
- (void)setVolumeController:(id)a3;
- (void)setVolumeSliderDownDisabled:(id)a3;
- (void)setVolumeSliderDownEnabled:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAudioMuteSwitch;
- (void)updateAudioVolumeSlider;
- (void)updateHapticIntensitySlider;
- (void)updateHapticSliderWithHighlightedDownGlyph:(BOOL)a3;
- (void)updateProminentHapticSwitch;
- (void)updateVolumeSliderWithHighlightedDownGlyph:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)volumeControllerDidUpdateHapticIntensity:(id)a3;
- (void)volumeControllerDidUpdateProminentHapticState:(id)a3;
- (void)volumeControllerDidUpdateSystemMutedState:(id)a3;
- (void)volumeControllerDidUpdateVolumeControlAvailibility:(id)a3;
- (void)volumeControllerDidUpdateVolumeValue:(id)a3;
@end

@implementation COSSoundsController

- (COSSoundsController)init
{
  v29.receiver = self;
  v29.super_class = (Class)COSSoundsController;
  v2 = [(COSSoundsController *)&v29 init];
  if (v2)
  {
    uint64_t v3 = +[NACVolumeController proxyVolumeControllerWithAudioCategory:@"Ringtone"];
    volumeController = v2->_volumeController;
    v2->_volumeController = (NACVolumeController *)v3;

    [(NACVolumeController *)v2->_volumeController setDelegate:v2];
    v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
    gizmoGlobalDomain = v2->_gizmoGlobalDomain;
    v2->_gizmoGlobalDomain = v5;

    v7 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
    carouselDomain = v2->_carouselDomain;
    v2->_carouselDomain = v7;

    v9 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.coreaudio"];
    coreaudioDomain = v2->_coreaudioDomain;
    v2->_coreaudioDomain = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100069E80, @"com.apple.Carousel.CSLDisableDetentsNotification", 0, (CFNotificationSuspensionBehavior)0);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_100069E80, @"NanoAccessibilityDefaultsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)sub_100069E80, @"CSLCoverToMuteChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v2, (CFNotificationCallback)sub_100069E80, @"com.apple.coreaudio.disable_watch_ui_haptics_did_change", 0, (CFNotificationSuspensionBehavior)0);
    v15 = [UIApp activeWatch];
    id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"];
    unsigned int v17 = [v15 supportsCapability:v16];

    if (v17)
    {
      v18 = +[NSNotificationCenter defaultCenter];
      uint64_t v19 = TLTonePreferencesDidChangeNotification;
      v20 = +[TLToneManager sharedToneManager];
      [v18 addObserver:v2 selector:"_handleTonePreferencesDidChangeNotification:" name:v19 object:v20];
    }
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v21 = (void *)qword_10029B078;
    uint64_t v34 = qword_10029B078;
    if (!qword_10029B078)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10006BE20;
      v30[3] = &unk_1002436A8;
      v30[4] = &v31;
      sub_10006BE20((uint64_t)v30);
      v21 = (void *)v32[3];
    }
    v22 = v21;
    _Block_object_dispose(&v31, 8);
    v23 = (ADASManager *)objc_alloc_init(v22);
    audioSettingsManager = v2->_audioSettingsManager;
    v2->_audioSettingsManager = v23;

    id v25 = objc_alloc_init((Class)NSNumberFormatter);
    [v25 setNumberStyle:1];
    [v25 setMaximumFractionDigits:0];
    v26 = +[NSNumber numberWithInt:0];
    v27 = [v25 stringFromNumber:v26];
    [v25 setNotANumberSymbol:v27];

    [(COSSoundsController *)v2 setNumberFormatter:v25];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)COSSoundsController;
  [(COSSoundsController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(COSSoundsController *)self loadSpecifiersFromPlistName:@"Sounds" target:self];
    v6 = [v5 specifierForID:@"audio_slider"];
    audioSlider = self->_audioSlider;
    self->_audioSlider = v6;

    v8 = [v5 specifierForID:@"audio_mute_switch"];
    audioMuteSwitch = self->_audioMuteSwitch;
    self->_audioMuteSwitch = v8;

    v10 = [v5 specifierForID:@"haptic_slider"];
    hapticSlider = self->_hapticSlider;
    self->_hapticSlider = v10;

    v12 = [v5 specifierForID:@"prominent_haptic_switch"];
    prominentHapticSwitch = self->_prominentHapticSwitch;
    self->_prominentHapticSwitch = v12;

    v14 = [UIApp activeWatch];
    v98 = (char *)[v5 indexOfSpecifierWithID:@"haptic_group_id"];
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5DA2E6C5-2C4D-444E-B3E8-CCDEF7AB41AB"];
    unsigned int v16 = [v14 supportsCapability:v15];

    v102 = v14;
    if (v16)
    {
      unsigned int v17 = [v5 specifierForID:@"haptic_group_id"];
      [v5 removeObject:v17];

      v18 = [v5 specifierForID:@"haptic_slider"];
      [v5 removeObject:v18];

      uint64_t v19 = [v5 specifierForID:@"prominent_haptic_group_id"];
      [v5 removeObject:v19];

      [v5 removeObject:self->_prominentHapticSwitch];
      v20 = self->_prominentHapticSwitch;
      self->_prominentHapticSwitch = 0;

      id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"];
      unsigned __int8 v22 = [v14 supportsCapability:v21];

      if ((v22 & 1) == 0)
      {
        uint64_t v96 = v3;
        uint64_t v99 = (uint64_t)[(NACVolumeController *)self->_volumeController hapticState];
        v23 = +[NSBundle mainBundle];
        v24 = [v23 localizedStringForKey:@"HAPTIC_ALERTS_GROUP_TITLE" value:&stru_100249230 table:@"Sounds"];
        uint64_t v25 = +[PSSpecifier groupSpecifierWithName:v24];

        v26 = +[NSBundle mainBundle];
        v27 = [v26 localizedStringForKey:@"HAPTIC_ALERTS_TITLE" value:&stru_100249230 table:@"Sounds"];
        v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setHapticState:specifier:" get:"hapticState:" detail:0 cell:6 edit:0];

        v94 = (void *)v25;
        [v5 insertObject:v25 atIndex:v98];
        objc_super v29 = v98 + 2;
        [v5 insertObject:v28 atIndex:v98 + 1];
        if (v99 >= 1)
        {
          +[PSSpecifier emptyGroupSpecifier];
          v30 = v92 = v28;
          [v30 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
          uint64_t v31 = +[NSBundle mainBundle];
          v32 = [v31 localizedStringForKey:@"DEFAULTS_HAPTIC_RADIO_TITLE" value:&stru_100249230 table:@"Sounds"];
          uint64_t v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v33 setIdentifier:@"DEFAULTS_HAPTIC_RADIO_ID"];
          uint64_t v34 = +[NSBundle mainBundle];
          v35 = [v34 localizedStringForKey:@"PROMINENT_HAPTIC_RADIO_TITLE" value:&stru_100249230 table:@"Sounds"];
          v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v36 setIdentifier:@"PROMINENT_HAPTIC_RADIO_ID"];
          if (v99 == 1) {
            v37 = v33;
          }
          else {
            v37 = v36;
          }
          [v30 setProperty:v37 forKey:PSRadioGroupCheckedSpecifierKey];
          [v5 insertObject:v30 atIndex:v98 + 2];
          [v5 insertObject:v33 atIndex:v98 + 3];
          objc_super v29 = v98 + 5;
          [v5 insertObject:v36 atIndex:v98 + 4];

          v28 = v92;
        }

        v98 = v29;
        uint64_t v3 = v96;
      }
    }
    else
    {
      [(PSSpecifier *)self->_hapticSlider setProperty:&off_10025BF80 forKey:PSControlMaximumKey];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__parentController]);

    if (WeakRetained)
    {
      v39 = BPSAccessoryHighlightColor();
      v40 = BPSTintedSymbol();
      uint64_t v41 = [v40 imageFlippedForRightToLeftLayoutDirection];

      v42 = BPSAccessoryHighlightColor();
      uint64_t v43 = BPSTintedSymbol();

      v44 = BPSAccessoryHighlightColor();
      v45 = BPSTintedSymbol();
      v46 = [v45 imageFlippedForRightToLeftLayoutDirection];
      volumeSliderDownEnabled = self->_volumeSliderDownEnabled;
      self->_volumeSliderDownEnabled = v46;

      v48 = BPSAccessoryColor();
      v49 = BPSTintedSymbol();
      v50 = [v49 imageFlippedForRightToLeftLayoutDirection];
      volumeSliderDownDisabled = self->_volumeSliderDownDisabled;
      self->_volumeSliderDownDisabled = v50;

      v52 = BPSAccessoryHighlightColor();
      BPSTintedSymbol();
      v53 = (UIImage *)objc_claimAutoreleasedReturnValue();
      hapticSliderDownEnabled = self->_hapticSliderDownEnabled;
      self->_hapticSliderDownEnabled = v53;

      v55 = BPSAccessoryColor();
      BPSTintedSymbol();
      v56 = (UIImage *)objc_claimAutoreleasedReturnValue();
      hapticSliderDownDisabled = self->_hapticSliderDownDisabled;
      self->_hapticSliderDownDisabled = v56;
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v41 = 0;
    }
    uint64_t v58 = PSSliderRightImageKey;
    v100 = (void *)v41;
    [(PSSpecifier *)self->_audioSlider setProperty:v41 forKey:PSSliderRightImageKey];
    [(NACVolumeController *)self->_volumeController volumeValue];
    float v60 = v59;
    id v61 = [(NACVolumeController *)self->_volumeController isVolumeControlAvailable];
    id v62 = v61;
    if (v60 > 0.0635) {
      uint64_t v63 = v61;
    }
    else {
      uint64_t v63 = 0;
    }
    -[COSSoundsController updateVolumeSliderWithHighlightedDownGlyph:](self, "updateVolumeSliderWithHighlightedDownGlyph:", v63, v60);
    v64 = self->_audioSlider;
    v65 = +[NSNumber numberWithBool:v62];
    [(PSSpecifier *)v64 setProperty:v65 forKey:PSEnabledKey];

    [(PSSpecifier *)self->_hapticSlider setProperty:self->_hapticSliderDownDisabled forKey:PSSliderLeftImageKey];
    v66 = (void *)v43;
    [(PSSpecifier *)self->_hapticSlider setProperty:v43 forKey:v58];
    v67 = self->_audioMuteSwitch;
    v68 = +[NSNumber numberWithBool:[(NACVolumeController *)self->_volumeController isMuted]];
    [(PSSpecifier *)v67 setProperty:v68 forKey:PSValueKey];

    id v69 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1E189BE1-6A71-44AA-B116-0066A83035E8"];
    v70 = v102;
    LODWORD(v68) = [v102 supportsCapability:v69];

    if (v68)
    {
      id v71 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"];
      v95 = v66;
      uint64_t v97 = v3;
      if ([v102 supportsCapability:v71])
      {
        v72 = +[NSBundle mainBundle];
        v73 = [v72 localizedStringForKey:@"SYSTEM_SOUNDS_AND_HAPTICS_GROUP_TITLE" value:&stru_100249230 table:@"Sounds"];
        v74 = +[PSSpecifier groupSpecifierWithID:@"JACKRABBIT_GROUP_ID" name:v73];
      }
      else
      {
        v74 = +[PSSpecifier groupSpecifierWithID:@"JACKRABBIT_GROUP_ID" name:0];
      }
      v101 = v74;

      v75 = +[NSBundle mainBundle];
      v76 = [v75 localizedStringForKey:@"JACKRABBIT_GROUP_FOOTER" value:&stru_100249230 table:@"JackRabbitLocalizable-n1y1"];
      uint64_t v93 = PSFooterTextGroupKey;
      [v74 setProperty:v76 forKey:];

      v77 = +[NSBundle mainBundle];
      v78 = [v77 localizedStringForKey:@"JACKRABBIT_TITLE" value:&stru_100249230 table:@"JackRabbitLocalizable-n1y1"];
      v79 = +[PSSpecifier preferenceSpecifierNamed:v78 target:self set:"setJackrabbitState:specifier:" get:"jackrabbitState:" detail:0 cell:6 edit:0];

      [v79 setIdentifier:@"JACKRABBIT_ID"];
      [v5 insertObject:v74 atIndex:v98];
      [v5 insertObject:v79 atIndex:v98 + 1];
      v80 = +[PSSpecifier groupSpecifierWithID:@"SYSTEM_HAPTICS_GROUP_ID"];
      v81 = +[NSBundle mainBundle];
      v82 = [v81 localizedStringForKey:@"SYSTEM_HAPTICS_DESCRIPTION" value:&stru_100249230 table:@"Sounds"];
      [v80 setProperty:v82 forKey:v93];

      v83 = +[NSBundle mainBundle];
      v84 = [v83 localizedStringForKey:@"SYSTEM_HAPTICS_LABEL" value:&stru_100249230 table:@"Sounds"];
      v85 = +[PSSpecifier preferenceSpecifierNamed:v84 target:self set:"setSystemHapticsState:specifier:" get:"systemHapticsState:" detail:0 cell:6 edit:0];

      [v85 setIdentifier:@"SYSTEM_HAPTICS_ID"];
      [v85 setProperty:@"com.apple.coreaudio.disable_watch_ui_haptics_did_change" forKey:PSValueChangedNotificationKey];
      [v5 insertObject:v80 atIndex:v98 + 2];
      [v5 insertObject:v85 atIndex:v98 + 3];

      v66 = v95;
      uint64_t v3 = v97;
      v70 = v102;
    }
    id v86 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"78E1881C-F6E1-421F-BC90-A1EBF1784BB1"];
    unsigned int v87 = [v70 supportsCapability:v86];

    if (v87)
    {
      v88 = [v5 specifierForID:@"tap_to_speak_group"];
      [v5 removeObject:v88];

      v89 = [v5 specifierForID:@"tap_to_speak_switch"];
      [v5 removeObject:v89];
    }
    v90 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSSoundsController;
  [(COSSoundsController *)&v4 viewWillAppear:a3];
  [(NACVolumeController *)self->_volumeController beginObservingVolume];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSSoundsController;
  [(COSSoundsController *)&v4 viewWillDisappear:a3];
  [(NACVolumeController *)self->_volumeController endObservingVolume];
}

- (id)hapticsValueText
{
  id v2 = [(NACVolumeController *)self->_volumeController hapticState];
  if (v2 == (id)2)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    objc_super v4 = v3;
    CFStringRef v5 = @"PROMINENT_ITEM_TITLE";
    goto LABEL_7;
  }
  if (v2 == (id)1)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    objc_super v4 = v3;
    CFStringRef v5 = @"DEFAULT_ITEM_TITLE";
    goto LABEL_7;
  }
  if (!v2)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    objc_super v4 = v3;
    CFStringRef v5 = @"OFF_ITEM_TITLE";
LABEL_7:
    v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Haptics"];

    goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (void)setHapticState:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];

  [(COSSoundsController *)self setHapticStateValue:v5];
}

- (id)hapticState:(id)a3
{
  id v3 = [(NACVolumeController *)self->_volumeController hapticState];

  return +[NSNumber numberWithInteger:v3];
}

- (void)setHapticStateValue:(int64_t)a3
{
  [(NACVolumeController *)self->_volumeController setHapticState:a3];

  [(COSSoundsController *)self reloadSpecifiers];
}

- (void)updateAudioVolumeSlider
{
  [(NACVolumeController *)self->_volumeController volumeValue];
  float v4 = v3;
  id v5 = [(NACVolumeController *)self->_volumeController isVolumeControlAvailable];
  audioSlider = self->_audioSlider;
  v7 = +[NSNumber numberWithBool:v5];
  [(PSSpecifier *)audioSlider setProperty:v7 forKey:PSEnabledKey];

  if (v4 > 0.0635) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  -[COSSoundsController updateVolumeSliderWithHighlightedDownGlyph:](self, "updateVolumeSliderWithHighlightedDownGlyph:", v8, v4);
  v9 = self->_audioSlider;

  [(COSSoundsController *)self reloadSpecifier:v9];
}

- (void)updateHapticIntensitySlider
{
  [(NACVolumeController *)self->_volumeController hapticIntensity];
  [(COSSoundsController *)self updateHapticSliderWithHighlightedDownGlyph:v3 > 0.001];
  hapticSlider = self->_hapticSlider;

  [(COSSoundsController *)self reloadSpecifier:hapticSlider];
}

- (void)updateVolumeSliderWithHighlightedDownGlyph:(BOOL)a3
{
  float v3 = &OBJC_IVAR___COSSoundsController__volumeSliderDownDisabled;
  if (a3) {
    float v3 = &OBJC_IVAR___COSSoundsController__volumeSliderDownEnabled;
  }
  [(PSSpecifier *)self->_audioSlider setProperty:*(void *)&self->BPSListController_opaque[*v3] forKey:PSSliderLeftImageKey];
}

- (void)updateHapticSliderWithHighlightedDownGlyph:(BOOL)a3
{
  float v3 = &OBJC_IVAR___COSSoundsController__hapticSliderDownDisabled;
  if (a3) {
    float v3 = &OBJC_IVAR___COSSoundsController__hapticSliderDownEnabled;
  }
  [(PSSpecifier *)self->_hapticSlider setProperty:*(void *)&self->BPSListController_opaque[*v3] forKey:PSSliderLeftImageKey];
}

- (void)updateAudioMuteSwitch
{
}

- (void)updateProminentHapticSwitch
{
}

- (id)audioVolume:(id)a3
{
  [(NACVolumeController *)self->_volumeController volumeValue];

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setAudioVolume:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(NACVolumeController *)self->_volumeController isVolumeControlAvailable])
  {
    [v9 floatValue];
    float v8 = v7;
    -[NACVolumeController setVolumeValue:](self->_volumeController, "setVolumeValue:");
    -[COSSoundsController updateVolumeSliderWithHighlightedDownGlyph:](self, "updateVolumeSliderWithHighlightedDownGlyph:", v8 > 0.0635, v8);
    [(COSSoundsController *)self reloadSpecifier:v6];
  }
}

- (id)hapticIntensity:(id)a3
{
  [(NACVolumeController *)self->_volumeController hapticIntensity];

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setHapticIntensity:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  [a3 floatValue];
  float v7 = v6;
  -[NACVolumeController setHapticIntensity:](self->_volumeController, "setHapticIntensity:");
  -[COSSoundsController updateHapticSliderWithHighlightedDownGlyph:](self, "updateHapticSliderWithHighlightedDownGlyph:", v7 > 0.001, v7);
  [(COSSoundsController *)self reloadSpecifier:v8];
}

- (void)setAudioMuted:(id)a3 specifier:(id)a4
{
  volumeController = self->_volumeController;
  id v5 = [a3 BOOLValue];

  [(NACVolumeController *)volumeController setSystemMuted:v5];
}

- (id)isAudioMuted:(id)a3
{
  id v3 = [(NACVolumeController *)self->_volumeController isSystemMuted];

  return +[NSNumber numberWithBool:v3];
}

- (id)prominentHapticsEnabled:(id)a3
{
  id v3 = [(NACVolumeController *)self->_volumeController isProminentHapticEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setProminentHapticsEnabled:(id)a3 specifier:(id)a4
{
  volumeController = self->_volumeController;
  id v5 = [a3 BOOLValue];

  [(NACVolumeController *)volumeController setProminentHapticEnabled:v5];
}

- (id)getHeadphoneLevelLimitSetting
{
  return 0;
}

- (void)volumeControllerDidUpdateVolumeValue:(id)a3
{
}

- (void)volumeControllerDidUpdateVolumeControlAvailibility:(id)a3
{
}

- (void)volumeControllerDidUpdateHapticIntensity:(id)a3
{
}

- (void)volumeControllerDidUpdateSystemMutedState:(id)a3
{
}

- (void)volumeControllerDidUpdateProminentHapticState:(id)a3
{
}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"alertType"];
  uint64_t v4 = TLAlertTypeFromString();

  id v5 = +[TLToneManager sharedToneManager];
  float v6 = [v5 currentWatchToneIdentifierForAlertType:v4];

  float v7 = +[TLToneManager sharedToneManager];
  id v8 = [v7 nameForToneIdentifier:v6];

  return v8;
}

- (void)_handleTonePreferencesDidChangeNotification:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006B3B4;
  v3[3] = &unk_1002439E0;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setJackrabbitState:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  -[NPSDomainAccessor setBool:forKey:](self->_carouselDomain, "setBool:forKey:", [v5 BOOLValue] ^ 1, @"CSLDisableDetents");
  id v6 = [(NPSDomainAccessor *)self->_carouselDomain synchronize];
  float v7 = objc_opt_new();
  CFStringRef v17 = @"CSLDisableDetents";
  id v8 = +[NSArray arrayWithObjects:&v17 count:1];
  id v9 = +[NSSet setWithArray:v8];
  [v7 synchronizeNanoDomain:@"com.apple.Carousel" keys:v9];

  v10 = pbb_setup_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v5 BOOLValue];
    CFStringRef v12 = @"Disabled";
    if (v11) {
      CFStringRef v12 = @"Enabled";
    }
    int v13 = 136315394;
    v14 = "-[COSSoundsController setJackrabbitState:specifier:]";
    __int16 v15 = 2112;
    CFStringRef v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -> Haptic Crown %@", (uint8_t *)&v13, 0x16u);
  }
}

- (id)jackrabbitState:(id)a3
{
  id v4 = [(NPSDomainAccessor *)self->_carouselDomain synchronize];
  id v5 = [(NPSDomainAccessor *)self->_carouselDomain objectForKey:@"CSLDisableDetents"];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue] ^ 1;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = pbb_setup_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"Disabled";
    if (v7) {
      CFStringRef v9 = @"Enabled";
    }
    int v12 = 136315394;
    int v13 = "-[COSSoundsController jackrabbitState:]";
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -> Haptic Crown %@", (uint8_t *)&v12, 0x16u);
  }

  v10 = +[NSNumber numberWithBool:v7];

  return v10;
}

- (void)setSystemHapticsState:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  -[NPSDomainAccessor setBool:forKey:](self->_coreaudioDomain, "setBool:forKey:", [v5 BOOLValue] ^ 1, @"disable_watch_ui_haptics");
  id v6 = [(NPSDomainAccessor *)self->_coreaudioDomain synchronize];
  uint64_t v7 = objc_opt_new();
  CFStringRef v17 = @"disable_watch_ui_haptics";
  id v8 = +[NSArray arrayWithObjects:&v17 count:1];
  CFStringRef v9 = +[NSSet setWithArray:v8];
  [v7 synchronizeNanoDomain:@"com.apple.coreaudio" keys:v9];

  v10 = pbb_setup_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v5 BOOLValue];
    CFStringRef v12 = @"Disabled";
    if (v11) {
      CFStringRef v12 = @"Enabled";
    }
    int v13 = 136315394;
    __int16 v14 = "-[COSSoundsController setSystemHapticsState:specifier:]";
    __int16 v15 = 2112;
    CFStringRef v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -> System Haptics %@", (uint8_t *)&v13, 0x16u);
  }
}

- (id)systemHapticsState:(id)a3
{
  id v4 = [(NPSDomainAccessor *)self->_coreaudioDomain synchronize];
  id v5 = [(NPSDomainAccessor *)self->_coreaudioDomain objectForKey:@"disable_watch_ui_haptics"];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue] ^ 1;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = pbb_setup_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"Disabled";
    if (v7) {
      CFStringRef v9 = @"Enabled";
    }
    int v12 = 136315394;
    int v13 = "-[COSSoundsController systemHapticsState:]";
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -> System Haptics %@", (uint8_t *)&v12, 0x16u);
  }

  v10 = +[NSNumber numberWithBool:v7];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COSSoundsController *)self indexForIndexPath:v7];
  CFStringRef v9 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  unsigned int v11 = [v10 isEqualToString:@"DEFAULTS_HAPTIC_RADIO_ID"];

  int v12 = [v9 identifier];
  unsigned int v13 = [v12 isEqualToString:@"PROMINENT_HAPTIC_RADIO_ID"];

  if ((v11 & 1) != 0 || v13)
  {
    if (v11) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    [(COSSoundsController *)self setHapticStateValue:v14];
  }
  v15.receiver = self;
  v15.super_class = (Class)COSSoundsController;
  [(COSSoundsController *)&v15 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (NACVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (UIImage)volumeSliderDownDisabled
{
  return self->_volumeSliderDownDisabled;
}

- (void)setVolumeSliderDownDisabled:(id)a3
{
}

- (UIImage)volumeSliderDownEnabled
{
  return self->_volumeSliderDownEnabled;
}

- (void)setVolumeSliderDownEnabled:(id)a3
{
}

- (UIImage)hapticSliderDownDisabled
{
  return self->_hapticSliderDownDisabled;
}

- (void)setHapticSliderDownDisabled:(id)a3
{
}

- (UIImage)hapticSliderDownEnabled
{
  return self->_hapticSliderDownEnabled;
}

- (void)setHapticSliderDownEnabled:(id)a3
{
}

- (PSSpecifier)audioSlider
{
  return self->_audioSlider;
}

- (void)setAudioSlider:(id)a3
{
}

- (PSSpecifier)audioMuteSwitch
{
  return self->_audioMuteSwitch;
}

- (void)setAudioMuteSwitch:(id)a3
{
}

- (PSSpecifier)hapticSlider
{
  return self->_hapticSlider;
}

- (void)setHapticSlider:(id)a3
{
}

- (PSSpecifier)prominentHapticSwitch
{
  return self->_prominentHapticSwitch;
}

- (void)setProminentHapticSwitch:(id)a3
{
}

- (NPSDomainAccessor)gizmoGlobalDomain
{
  return self->_gizmoGlobalDomain;
}

- (void)setGizmoGlobalDomain:(id)a3
{
}

- (NPSDomainAccessor)carouselDomain
{
  return self->_carouselDomain;
}

- (void)setCarouselDomain:(id)a3
{
}

- (NPSDomainAccessor)coreaudioDomain
{
  return self->_coreaudioDomain;
}

- (void)setCoreaudioDomain:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
  objc_storeStrong((id *)&self->_coreaudioDomain, 0);
  objc_storeStrong((id *)&self->_carouselDomain, 0);
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, 0);
  objc_storeStrong((id *)&self->_prominentHapticSwitch, 0);
  objc_storeStrong((id *)&self->_hapticSlider, 0);
  objc_storeStrong((id *)&self->_audioMuteSwitch, 0);
  objc_storeStrong((id *)&self->_audioSlider, 0);
  objc_storeStrong((id *)&self->_hapticSliderDownEnabled, 0);
  objc_storeStrong((id *)&self->_hapticSliderDownDisabled, 0);
  objc_storeStrong((id *)&self->_volumeSliderDownEnabled, 0);
  objc_storeStrong((id *)&self->_volumeSliderDownDisabled, 0);

  objc_storeStrong((id *)&self->_volumeController, 0);
}

@end