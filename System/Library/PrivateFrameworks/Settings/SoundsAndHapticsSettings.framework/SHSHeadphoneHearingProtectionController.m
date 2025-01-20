@interface SHSHeadphoneHearingProtectionController
- (ADASManager)audioSettingsManager;
- (BOOL)headphoneLevelLimitLockedByRestrictions;
- (BOOL)isDeviceInRetailKioskMode;
- (BOOL)isDeviceiPad;
- (BOOL)isDeviceiPod;
- (BOOL)shouldShowHeadphoneNotificationsSection;
- (BOOL)shouldShowHealthFeatures;
- (HKHealthStore)healthStore;
- (NSArray)weeklyNotificationData;
- (NSNumber)levelLimitThreshold;
- (NSNumberFormatter)numberFormatter;
- (SHSHeadphoneHearingProtectionController)init;
- (id)deviceTypeString;
- (id)endDate;
- (id)getHeadphoneLevelLimitEnabled;
- (id)getHeadphoneLevelLimitSetting;
- (id)getHeadphoneNotificationsEnabled;
- (id)headphoneAudioDevicesSpecifier;
- (id)headphoneLevelLimitDescriptionSpecifier;
- (id)headphoneLevelLimitGroupSpecifier;
- (id)headphoneLevelLimitSliderSpecifier;
- (id)headphoneLevelLimitSwitchSpecifier;
- (id)headphoneNotificationsGroupSpecifier;
- (id)headphoneNotificationsSwitchSpecifier;
- (id)headphoneWeeklyNotificationDescriptionSpecifier;
- (id)specifiers;
- (id)startDate;
- (id)updateHeadphoneLevelLimitDescriptionText;
- (id)updateHeadphoneLevelLimitText;
- (id)weeklyNotificationCount:(id)a3;
- (int)weeklyNotificationCount;
- (void)dealloc;
- (void)dismiss;
- (void)loadView;
- (void)openAboutHeadphoneNotifications;
- (void)openHealthArticleSafeListening;
- (void)openHealthPrivacySettings;
- (void)queryNotificationCountsFromDate:(id)a3 toDate:(id)a4;
- (void)setAudioSettingsManager:(id)a3;
- (void)setDeviceInRetailKioskMode:(BOOL)a3;
- (void)setDeviceiPad:(BOOL)a3;
- (void)setDeviceiPod:(BOOL)a3;
- (void)setHeadphoneLevelLimitEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setHeadphoneLevelLimitValue:(id)a3 forSpecifier:(id)a4;
- (void)setHeadphoneNotificationsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setLevelLimitThreshold:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setWeeklyNotificationCount:(int)a3;
- (void)setWeeklyNotificationData:(id)a3;
- (void)updateMonthlyNotificationCounts:(id)a3 withNames:(id)a4 forDates:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SHSHeadphoneHearingProtectionController

- (SHSHeadphoneHearingProtectionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHSHeadphoneHearingProtectionController;
  v2 = [(SHSHeadphoneHearingProtectionController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)unknownWiredDeviceStatusChanged_0, (CFStringRef)*MEMORY[0x263F28B80], 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F28B80], 0);
  v4.receiver = self;
  v4.super_class = (Class)SHSHeadphoneHearingProtectionController;
  [(SHSHeadphoneHearingProtectionController *)&v4 dealloc];
}

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)SHSHeadphoneHearingProtectionController;
  [(SHSHeadphoneHearingProtectionController *)&v17 loadView];
  if (_os_feature_enabled_impl()) {
    v3 = @"HEADPHONE_HEARING_PROTECTION";
  }
  else {
    v3 = @"HEADPHONE_LEVEL_LIMIT_TITLE";
  }
  objc_super v4 = SHS_LocalizedStringForSounds(v3);
  [(SHSHeadphoneHearingProtectionController *)self setTitle:v4];

  objc_super v5 = (ADASManager *)objc_alloc_init(MEMORY[0x263F28C30]);
  audioSettingsManager = self->_audioSettingsManager;
  self->_audioSettingsManager = v5;

  v7 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v8 = [v7 getPreferenceFor:*MEMORY[0x263F28C18]];
  [(SHSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v9 setNumberStyle:1];
  [v9 setMaximumFractionDigits:0];
  v10 = [NSNumber numberWithInt:0];
  v11 = [v9 stringFromNumber:v10];
  [v9 setNotANumberSymbol:v11];

  [(SHSHeadphoneHearingProtectionController *)self setNumberFormatter:v9];
  [(SHSHeadphoneHearingProtectionController *)self setDeviceiPad:PSGetCapabilityBoolAnswer()];
  char v12 = PSGetCapabilityBoolAnswer();
  uint64_t v13 = 0;
  if ((v12 & 1) == 0) {
    uint64_t v13 = PSGetCapabilityBoolAnswer() ^ 1;
  }
  [(SHSHeadphoneHearingProtectionController *)self setDeviceiPod:v13];
  v14 = [MEMORY[0x263F82670] currentDevice];
  -[SHSHeadphoneHearingProtectionController setDeviceInRetailKioskMode:](self, "setDeviceInRetailKioskMode:", objc_msgSend(v14, "sf_inRetailKioskMode"));

  if ([(SHSHeadphoneHearingProtectionController *)self shouldShowHealthFeatures]
    || _os_feature_enabled_impl())
  {
    v15 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
    healthStore = self->_healthStore;
    self->_healthStore = v15;

    self->_weeklyNotificationCount = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SHSHeadphoneHearingProtectionController;
  [(SHSHeadphoneHearingProtectionController *)&v8 viewWillAppear:a3];
  objc_super v4 = [(SHSHeadphoneHearingProtectionController *)self startDate];
  objc_super v5 = [(SHSHeadphoneHearingProtectionController *)self endDate];
  [(SHSHeadphoneHearingProtectionController *)self queryNotificationCountsFromDate:v4 toDate:v5];

  v6 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v7 = [v6 getPreferenceFor:*MEMORY[0x263F28C18]];
  [(SHSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SHSHeadphoneHearingProtectionController;
  [(SHSHeadphoneHearingProtectionController *)&v12 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Sounds/HEADPHONE_LEVEL_LIMIT_SETTING"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  objc_super v8 = [v7 bundleURL];
  id v9 = (void *)[v5 initWithKey:@"HEADPHONE_HEARING_PROTECTION" table:@"Sounds" locale:v6 bundleURL:v8];

  v10 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
  v13[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(SHSHeadphoneHearingProtectionController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v9 localizedNavigationComponents:v11 deepLink:v4];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_18;
  }
  id v5 = objc_opt_new();
  if (_os_feature_enabled_impl()
    && ([(SHSHeadphoneHearingProtectionController *)self shouldShowHealthFeatures]
     || _os_feature_enabled_impl()))
  {
    v6 = [(SHSHeadphoneHearingProtectionController *)self headphoneNotificationsGroupSpecifier];
    [v5 addObject:v6];

    v7 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
    uint64_t v8 = *MEMORY[0x263F28BE8];
    id v9 = [v7 getPreferenceFor:*MEMORY[0x263F28BE8]];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0)
    {
      v11 = [(SHSHeadphoneHearingProtectionController *)self headphoneNotificationsSwitchSpecifier];
      [v5 addObject:v11];
    }
    objc_super v12 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
    uint64_t v13 = [v12 getPreferenceFor:*MEMORY[0x263F28BE0]];
    if ([v13 BOOLValue])
    {

LABEL_10:
      objc_super v17 = [(SHSHeadphoneHearingProtectionController *)self headphoneWeeklyNotificationDescriptionSpecifier];
      [v5 addObject:v17];

      goto LABEL_11;
    }
    v14 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
    v15 = [v14 getPreferenceFor:v8];
    int v16 = [v15 BOOLValue];

    if (v16) {
      goto LABEL_10;
    }
  }
LABEL_11:
  v18 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitGroupSpecifier];
  [v5 addObject:v18];

  v19 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitSwitchSpecifier];
  [v5 addObject:v19];

  v20 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v21 = [v20 getPreferenceFor:*MEMORY[0x263F28C10]];
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    v23 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitDescriptionSpecifier];
    [v5 addObject:v23];

    v24 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitSliderSpecifier];
    [v5 addObject:v24];
  }
  v25 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v26 = [v25 getPreferenceFor:*MEMORY[0x263F28BD0]];

  if ([(SHSHeadphoneHearingProtectionController *)self shouldShowHealthFeatures])
  {
    if ([v26 count]
      || ([(SHSHeadphoneHearingProtectionController *)self audioSettingsManager],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v27 getPreferenceFor:*MEMORY[0x263F28BA0]],
          v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          v27,
          v28))
    {
      v29 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SHSHeadphoneAudioDevicesGroupKey"];
      [v5 addObject:v29];

      v30 = [(SHSHeadphoneHearingProtectionController *)self headphoneAudioDevicesSpecifier];
      [v5 addObject:v30];
    }
  }
  v31 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_18:
  return v4;
}

- (id)deviceTypeString
{
  if ([(SHSHeadphoneHearingProtectionController *)self isDeviceiPad]) {
    uint64_t v3 = @"IPAD";
  }
  else {
    uint64_t v3 = @"IPHONE";
  }
  if ([(SHSHeadphoneHearingProtectionController *)self isDeviceiPod]) {
    return @"IPOD";
  }
  else {
    return v3;
  }
}

- (BOOL)shouldShowHealthFeatures
{
  if (![(SHSHeadphoneHearingProtectionController *)self isDeviceiPad]
    || (int v3 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v3) = ![(SHSHeadphoneHearingProtectionController *)self isDeviceInRetailKioskMode];
  }
  return v3;
}

- (id)headphoneNotificationsGroupSpecifier
{
  int v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SHSHeadphoneNotificationsGroupKey"];
  objc_super v4 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_FOOTER");
  uint64_t v5 = *MEMORY[0x263F600C8];
  [v3 setProperty:@"openAboutHeadphoneNotifications" forKey:*MEMORY[0x263F600C8]];
  v6 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v7 = [v6 getPreferenceFor:*MEMORY[0x263F28BE8]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_GROUP");
    [v3 setName:v9];

    char v10 = NSString;
    v11 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_MANDATORY");
    objc_super v12 = @"LEARN_MORE_IN_HEALTH_LINK";
    uint64_t v13 = SHS_LocalizedStringForSounds(@"LEARN_MORE_IN_HEALTH_LINK");
    v14 = objc_msgSend(v10, "stringWithFormat:", v11, v13);
    v15 = objc_msgSend(v10, "stringWithFormat:", v4, v14);
  }
  else
  {
    int v16 = NSString;
    objc_super v12 = @"LEARN_MORE_IN_HEALTH_LINK";
    objc_super v17 = SHS_LocalizedStringForSounds(@"LEARN_MORE_IN_HEALTH_LINK");
    v15 = objc_msgSend(v16, "stringWithFormat:", v4, v17);

    v18 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
    v19 = [v18 getPreferenceFor:*MEMORY[0x263F28BA8]];
    char v20 = [v19 BOOLValue];

    if ((v20 & 1) == 0)
    {
      v21 = NSString;
      int v22 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_DISABLED_FOOTER");
      objc_super v12 = @"HEALTH_PRIVACY_SETTINGS_LINK";
      v23 = SHS_LocalizedStringForSounds(@"HEALTH_PRIVACY_SETTINGS_LINK");
      uint64_t v24 = objc_msgSend(v21, "stringWithFormat:", v22, v23);

      [v3 setProperty:@"openHealthPrivacySettings" forKey:v5];
      v15 = (void *)v24;
    }
  }
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  [v3 setProperty:v26 forKey:*MEMORY[0x263F600C0]];

  [v3 setProperty:v15 forKey:*MEMORY[0x263F600E8]];
  v27 = SHS_LocalizedStringForSounds(v12);
  v32.location = [v15 rangeOfString:v27];
  v28 = NSStringFromRange(v32);
  [v3 setProperty:v28 forKey:*MEMORY[0x263F600D0]];

  v29 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v3 setProperty:v29 forKey:*MEMORY[0x263F600E0]];

  return v3;
}

- (id)headphoneNotificationsSwitchSpecifier
{
  int v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_SWITCH");
  uint64_t v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setHeadphoneNotificationsEnabled_forSpecifier_ get:sel_getHeadphoneNotificationsEnabled detail:0 cell:6 edit:0];

  [v5 setProperty:@"SHSHeadphoneNotificationsSwitchKey" forKey:*MEMORY[0x263F60138]];
  v6 = NSNumber;
  v7 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  int v8 = [v7 getPreferenceFor:*MEMORY[0x263F28BA8]];
  id v9 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
  [v5 setProperty:v9 forKey:*MEMORY[0x263F600A8]];

  return v5;
}

- (id)headphoneWeeklyNotificationDescriptionSpecifier
{
  int v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS");
  uint64_t v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:sel_weeklyNotificationCount_ detail:0 cell:4 edit:0];

  [v5 setProperty:self->_weeklyNotificationData forKey:@"NotificationDataKey"];
  [v5 setProperty:@"SHSHeadphoneWeeklyNotificationsKey" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v5;
}

- (id)headphoneLevelLimitGroupSpecifier
{
  int v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SHSHeadphoneLevelLimitKey"];
  if ([(SHSHeadphoneHearingProtectionController *)self shouldShowHealthFeatures]
    || (_os_feature_enabled_impl() & 1) != 0)
  {
    objc_super v4 = NSString;
    uint64_t v5 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER");
    v6 = SHS_LocalizedStringForSounds(@"LEARN_MORE_IN_HEALTH_LINK");
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v3 setProperty:v9 forKey:*MEMORY[0x263F600C0]];

    [v3 setProperty:v7 forKey:*MEMORY[0x263F600E8]];
    char v10 = SHS_LocalizedStringForSounds(@"LEARN_MORE_IN_HEALTH_LINK");
    v18.location = [(__CFString *)v7 rangeOfString:v10];
    v11 = NSStringFromRange(v18);
    [v3 setProperty:v11 forKey:*MEMORY[0x263F600D0]];

    objc_super v12 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v3 setProperty:v12 forKey:*MEMORY[0x263F600E0]];

    uint64_t v13 = *MEMORY[0x263F600C8];
    v14 = @"openHealthArticleSafeListening";
    v15 = v3;
  }
  else
  {
    SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = *MEMORY[0x263F600F8];
    v15 = v3;
    v14 = v7;
  }
  [v15 setProperty:v14 forKey:v13];

  return v3;
}

- (id)headphoneLevelLimitSwitchSpecifier
{
  int v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_LABEL");
  uint64_t v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setHeadphoneLevelLimitEnabled_forSpecifier_ get:sel_getHeadphoneLevelLimitEnabled detail:0 cell:6 edit:0];

  [v5 setProperty:@"SHSHeadphoneLevelLimitSwitchKey" forKey:*MEMORY[0x263F60138]];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[SHSHeadphoneHearingProtectionController headphoneLevelLimitLockedByRestrictions](self, "headphoneLevelLimitLockedByRestrictions") ^ 1);
  [v5 setProperty:v6 forKey:*MEMORY[0x263F600A8]];

  return v5;
}

- (id)headphoneLevelLimitDescriptionSpecifier
{
  int v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = [(SHSHeadphoneHearingProtectionController *)self updateHeadphoneLevelLimitText];
  uint64_t v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:sel_updateHeadphoneLevelLimitDescriptionText detail:0 cell:4 edit:0];

  [v5 setProperty:@"SHSHeadphoneLevelLimitDescriptionKey" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v5;
}

- (id)headphoneLevelLimitSliderSpecifier
{
  int v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setHeadphoneLevelLimitValue_forSpecifier_ get:sel_getHeadphoneLevelLimitSetting detail:0 cell:5 edit:0];
  [v3 setProperty:@"SHSHeadphoneLevelLimitSliderKey" forKey:*MEMORY[0x263F60138]];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v4 = MEMORY[0x263EFFA88];
  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60238]];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F60230]];
  [v3 setProperty:&unk_26EA46B28 forKey:*MEMORY[0x263F60258]];
  [v3 setProperty:&unk_26EA46B40 forKey:*MEMORY[0x263F60038]];
  [v3 setProperty:&unk_26EA46B58 forKey:*MEMORY[0x263F60030]];
  uint64_t v5 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.2.fill"];
  v6 = [MEMORY[0x263F825C8] systemGrayColor];
  v7 = [v5 imageWithTintColor:v6 renderingMode:1];
  [v3 setProperty:v7 forKey:*MEMORY[0x263F60240]];

  int v8 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.3.fill"];
  id v9 = [MEMORY[0x263F825C8] systemGrayColor];
  char v10 = [v8 imageWithTintColor:v9 renderingMode:1];
  [v3 setProperty:v10 forKey:*MEMORY[0x263F60250]];

  [v3 setProperty:v4 forKey:*MEMORY[0x263F60148]];
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[SHSHeadphoneHearingProtectionController headphoneLevelLimitLockedByRestrictions](self, "headphoneLevelLimitLockedByRestrictions") ^ 1);
  [v3 setProperty:v11 forKey:*MEMORY[0x263F600A8]];

  return v3;
}

- (id)headphoneAudioDevicesSpecifier
{
  if (MGGetBoolAnswer()) {
    int v3 = @"HEADPHONE_USB_AUDIO_ACCESSORIES";
  }
  else {
    int v3 = @"HEADPHONE_LIGHTNING_ADAPTERS";
  }
  uint64_t v4 = (void *)MEMORY[0x263F5FC40];
  uint64_t v5 = SHS_LocalizedStringForSounds(v3);
  v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v6 setIdentifier:v3];
  return v6;
}

- (id)updateHeadphoneLevelLimitText
{
  int v3 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  uint64_t v4 = [v3 getPreferenceFor:*MEMORY[0x263F28C18]];

  uint64_t v5 = NSString;
  v6 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_LIMIT_SET_LEVEL");
  v7 = [(SHSHeadphoneHearingProtectionController *)self numberFormatter];
  int v8 = [v7 stringFromNumber:v4];
  id v9 = objc_msgSend(v5, "stringWithFormat:", v6, v8);

  return v9;
}

- (id)updateHeadphoneLevelLimitDescriptionText
{
  v2 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  int v3 = [v2 getPreferenceFor:*MEMORY[0x263F28C18]];

  uint64_t v4 = NSString;
  uint64_t v5 = [v3 stringValue];
  v6 = [v4 stringWithFormat:@"HEADPHONE_LEVEL_LIMIT_%@_INFO", v5];
  v7 = SHS_LocalizedStringForSounds(v6);

  return v7;
}

- (void)openHealthPrivacySettings
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"prefs:root=Privacy&path=HEALTH/HEADPHONE_AUDIO_LEVELS"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)openAboutHeadphoneNotifications
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(SHSHeadphoneNotificationsController);
  id v4 = objc_alloc_init(MEMORY[0x263F829C8]);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
  [v4 setRightBarButtonItem:v5];
  id v6 = objc_alloc(MEMORY[0x263F829A0]);
  v7 = [(SHSHeadphoneHearingProtectionController *)self view];
  [v7 frame];
  double v9 = v8;
  char v10 = [(SHSHeadphoneHearingProtectionController *)self navigationController];
  v11 = [v10 navigationBar];
  [v11 frame];
  objc_super v12 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v9);

  v16[0] = v4;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v12 setItems:v13];

  v14 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v12 setBarTintColor:v14];

  [v12 setTranslucent:0];
  [v12 _setHidesShadow:1];
  v15 = [(SHSHeadphoneNotificationsController *)v3 view];
  [v15 addSubview:v12];

  [(SHSHeadphoneHearingProtectionController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)dismiss
{
}

- (void)openHealthArticleSafeListening
{
  if (_os_feature_enabled_impl()) {
    v2 = @"x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening";
  }
  else {
    v2 = @"x-apple-Health://HearingAppPlugin.healthplugin/WhyHearingHealthMatters";
  }
  id v3 = (void *)*MEMORY[0x263F83300];
  id v4 = [NSURL URLWithString:v2];
  [v3 openURL:v4 withCompletionHandler:0];
}

- (void)setHeadphoneLevelLimitEnabled:(id)a3 forSpecifier:(id)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 BOOLValue])
  {
    id v6 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitDescriptionSpecifier];
    v11[0] = v6;
    v7 = [(SHSHeadphoneHearingProtectionController *)self headphoneLevelLimitSliderSpecifier];
    v11[1] = v7;
    double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    [(SHSHeadphoneHearingProtectionController *)self insertContiguousSpecifiers:v8 afterSpecifierID:@"SHSHeadphoneLevelLimitSwitchKey" animated:1];
  }
  else
  {
    [(SHSHeadphoneHearingProtectionController *)self removeSpecifierID:@"SHSHeadphoneLevelLimitDescriptionKey" animated:1];
    [(SHSHeadphoneHearingProtectionController *)self removeSpecifierID:@"SHSHeadphoneLevelLimitSliderKey" animated:1];
  }
  double v9 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v10 = (id)[v9 setPreferenceFor:*MEMORY[0x263F28C10] value:v5];
}

- (id)getHeadphoneLevelLimitEnabled
{
  v2 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28C10]];

  return v3;
}

- (void)setHeadphoneLevelLimitValue:(id)a3 forSpecifier:(id)a4
{
  id v12 = a3;
  id v5 = [(SHSHeadphoneHearingProtectionController *)self levelLimitThreshold];

  if (v5 != v12)
  {
    [(SHSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v12];
    id v6 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
    id v7 = (id)[v6 setPreferenceFor:*MEMORY[0x263F28C18] value:v12];

    uint64_t v8 = (int)*MEMORY[0x263F5FDB8];
    double v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) specifierForID:@"SHSHeadphoneLevelLimitDescriptionKey"];
    id v10 = [(SHSHeadphoneHearingProtectionController *)self updateHeadphoneLevelLimitText];
    [v9 setName:v10];

    v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) specifierForID:@"SHSHeadphoneLevelLimitDescriptionKey"];
    [(SHSHeadphoneHearingProtectionController *)self reloadSpecifier:v11];
  }
}

- (id)getHeadphoneLevelLimitSetting
{
  v2 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28C18]];

  return v3;
}

- (void)setHeadphoneNotificationsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v8 = a3;
  if ([v8 BOOLValue])
  {
    id v5 = [(SHSHeadphoneHearingProtectionController *)self headphoneWeeklyNotificationDescriptionSpecifier];
    [(SHSHeadphoneHearingProtectionController *)self insertSpecifier:v5 afterSpecifierID:@"SHSHeadphoneNotificationsSwitchKey" animated:1];
  }
  else
  {
    [(SHSHeadphoneHearingProtectionController *)self removeSpecifierID:@"SHSHeadphoneWeeklyNotificationsKey" animated:1];
  }
  id v6 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v7 = (id)[v6 setPreferenceFor:*MEMORY[0x263F28BE0] value:v8];
}

- (id)getHeadphoneNotificationsEnabled
{
  v2 = [(SHSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28BE0]];

  return v3;
}

- (BOOL)headphoneLevelLimitLockedByRestrictions
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  char v3 = [v2 containsObject:@"volumeLimit"];

  return v3;
}

- (id)weeklyNotificationCount:(id)a3
{
  id v4 = [(SHSHeadphoneHearingProtectionController *)self numberFormatter];
  id v5 = [NSNumber numberWithInt:self->_weeklyNotificationCount];
  id v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (void)updateMonthlyNotificationCounts:(id)a3 withNames:(id)a4 forDates:(id)a5
{
  v27[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v22 = objc_alloc_init(MEMORY[0x263F08790]);
  [v22 setDateFormat:@"M"];
  uint64_t v24 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v8 count])
  {
    unint64_t v10 = 0;
    do
    {
      v26[0] = @"month";
      v25 = [v8 objectAtIndexedSubscript:v10];
      v27[0] = v25;
      v26[1] = @"date";
      v11 = [v9 objectAtIndexedSubscript:v10];
      v27[1] = v11;
      v26[2] = @"count";
      id v12 = [v7 objectAtIndexedSubscript:v10];
      v27[2] = v12;
      v26[3] = @"desc";
      uint64_t v13 = NSString;
      v14 = SHS_LocalizedStringForSounds(@"HEADPHONE_LEVEL_NOTIFICATIONS_VOICE_OVER_DESCRIPTION");
      [v7 objectAtIndexedSubscript:v10];
      id v15 = v7;
      objc_super v17 = v16 = v9;
      NSRange v18 = objc_msgSend(v13, "stringWithFormat:", v14, objc_msgSend(v17, "integerValue"));
      v27[3] = v18;
      v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
      [(NSArray *)v24 setObject:v19 atIndexedSubscript:v10];

      id v9 = v16;
      id v7 = v15;

      ++v10;
    }
    while ([v8 count] > v10);
  }
  weeklyNotificationData = self->_weeklyNotificationData;
  self->_weeklyNotificationData = v24;

  v21 = [v7 valueForKeyPath:@"@sum.self"];
  -[SHSHeadphoneHearingProtectionController setWeeklyNotificationCount:](self, "setWeeklyNotificationCount:", [v21 intValue]);
}

- (id)startDate
{
  v2 = [MEMORY[0x263EFF910] date];
  char v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [v3 components:2097404 fromDate:v2];
  objc_msgSend(v4, "setMonth:", objc_msgSend(v4, "month") - 5);
  [v4 setDay:1];
  id v5 = [v3 dateFromComponents:v4];
  id v6 = [v3 startOfDayForDate:v5];

  return v6;
}

- (id)endDate
{
  return (id)[MEMORY[0x263EFF910] date];
}

- (void)queryNotificationCountsFromDate:(id)a3 toDate:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v28 = a4;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = objc_alloc_init(MEMORY[0x263F08790]);
  unint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
  [v9 setLocale:v10];

  [v9 setDateFormat:@"MMM"];
  id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
  for (uint64_t i = 0; i != 6; ++i)
  {
    [v11 setMonth:i];
    uint64_t v13 = [v8 dateByAddingComponents:v11 toDate:v30 options:0];
    [v7 addObject:v13];
    v14 = [v9 stringFromDate:v13];
    [v5 addObject:v14];
    [v6 addObject:&unk_26EA46B70];
  }
  uint64_t v15 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09300]];
  uint64_t v16 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v30 endDate:v28 options:0];
  id v17 = objc_alloc(MEMORY[0x263F08B30]);
  v27 = (void *)[v17 initWithKey:*MEMORY[0x263F09F80] ascending:0];
  objc_initWeak(&location, self);
  id v26 = objc_alloc(MEMORY[0x263F0A6E0]);
  v38[0] = v27;
  NSRange v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke;
  v31[3] = &unk_264CD0298;
  id v25 = v5;
  id v32 = v25;
  id v19 = v9;
  id v33 = v19;
  id v20 = v6;
  id v34 = v20;
  objc_copyWeak(&v36, &location);
  v21 = (void *)v15;
  id v22 = (void *)v16;
  id v23 = v7;
  id v35 = v23;
  uint64_t v24 = (void *)[v26 initWithSampleType:v21 predicate:v16 limit:0 sortDescriptors:v18 resultsHandler:v31];

  [(HKHealthStore *)self->_healthStore executeQuery:v24];
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
}

void __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v11 = *(void **)(a1 + 32);
          id v12 = *(void **)(a1 + 40);
          uint64_t v13 = objc_msgSend(v10, "endDate", v20);
          v14 = [v12 stringFromDate:v13];
          int v15 = [v11 indexOfObject:v14];

          if ([v10 value] == 1)
          {
            uint64_t v16 = NSNumber;
            id v17 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v15];
            NSRange v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
            [*(id *)(a1 + 48) setObject:v18 atIndexedSubscript:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained updateMonthlyNotificationCounts:*(void *)(a1 + 48) withNames:*(void *)(a1 + 32) forDates:*(void *)(a1 + 56)];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke_2;
    block[3] = &unk_264CD0220;
    objc_copyWeak(&v22, (id *)(a1 + 64));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v22);
    id v4 = v20;
  }
}

void __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
}

- (BOOL)isDeviceiPad
{
  return self->_DeviceiPad;
}

- (void)setDeviceiPad:(BOOL)a3
{
  self->_DeviceiPad = a3;
}

- (BOOL)isDeviceiPod
{
  return self->_DeviceiPod;
}

- (void)setDeviceiPod:(BOOL)a3
{
  self->_DeviceiPod = a3;
}

- (BOOL)isDeviceInRetailKioskMode
{
  return self->_DeviceInRetailKioskMode;
}

- (void)setDeviceInRetailKioskMode:(BOOL)a3
{
  self->_DeviceInRetailKioskMode = a3;
}

- (BOOL)shouldShowHeadphoneNotificationsSection
{
  return self->_shouldShowHeadphoneNotificationsSection;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSArray)weeklyNotificationData
{
  return self->_weeklyNotificationData;
}

- (void)setWeeklyNotificationData:(id)a3
{
}

- (int)weeklyNotificationCount
{
  return self->_weeklyNotificationCount;
}

- (void)setWeeklyNotificationCount:(int)a3
{
  self->_weeklyNotificationCount = a3;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSNumber)levelLimitThreshold
{
  return self->_levelLimitThreshold;
}

- (void)setLevelLimitThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelLimitThreshold, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_weeklyNotificationData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end