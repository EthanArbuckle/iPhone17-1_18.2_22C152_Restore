@interface COSHeadphoneHearingProtectionController
- (ADASManager)audioSettingsManager;
- (BOOL)isLocalChange;
- (COSHeadphoneHearingProtectionController)init;
- (HKHealthStore)healthStore;
- (NSArray)weeklyNotificationData;
- (NSDateFormatter)monthFormatter;
- (NSDateFormatter)monthNumberFormatter;
- (NSNumber)levelLimitThreshold;
- (NSNumberFormatter)numberFormatter;
- (id)creatNotificationDataStructure:(id)a3 toDate:(id)a4;
- (id)endDate;
- (id)getHeadphoneLevelLimitEnabled;
- (id)getHeadphoneLevelLimitSetting;
- (id)getHeadphoneNotificationsEnabled;
- (id)headphoneLevelLimitDescriptionSpecifier;
- (id)headphoneLevelLimitGroupSpecifier;
- (id)headphoneLevelLimitSliderSpecifier;
- (id)headphoneLevelLimitSwitchSpecifier;
- (id)headphoneNotificationsGroupSpecifier;
- (id)headphoneNotificationsSwitchSpecifier;
- (id)headphoneWeeklyNotificationDescriptionSpecifier;
- (id)hkQueryForSampleType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 notificationData:(id)a6;
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
- (void)setHeadphoneLevelLimitEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setHeadphoneLevelLimitValue:(id)a3 forSpecifier:(id)a4;
- (void)setHeadphoneNotificationsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setLevelLimitThreshold:(id)a3;
- (void)setLocalChange:(BOOL)a3;
- (void)setMonthFormatter:(id)a3;
- (void)setMonthNumberFormatter:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setWeeklyNotificationCount:(int)a3;
- (void)setWeeklyNotificationData:(id)a3;
- (void)updateNotificationCountsForData:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSHeadphoneHearingProtectionController

- (COSHeadphoneHearingProtectionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSHeadphoneHearingProtectionController;
  v2 = [(COSHeadphoneHearingProtectionController *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = (const __CFString *)sub_10009E720();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10009E6C8, v4, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)sub_10009E720();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)COSHeadphoneHearingProtectionController;
  [(COSHeadphoneHearingProtectionController *)&v5 dealloc];
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)COSHeadphoneHearingProtectionController;
  [(COSHeadphoneHearingProtectionController *)&v21 loadView];
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"HEADPHONE_HEARING_PROTECTION" value:&stru_100249230 table:@"Sounds"];
  [(COSHeadphoneHearingProtectionController *)self setTitle:v4];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  objc_super v5 = (void *)qword_10029B150;
  uint64_t v26 = qword_10029B150;
  if (!qword_10029B150)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000A1B10;
    v22[3] = &unk_1002436A8;
    v22[4] = &v23;
    sub_1000A1B10((uint64_t)v22);
    objc_super v5 = (void *)v24[3];
  }
  objc_super v6 = v5;
  _Block_object_dispose(&v23, 8);
  v7 = (ADASManager *)objc_alloc_init(v6);
  audioSettingsManager = self->_audioSettingsManager;
  self->_audioSettingsManager = v7;

  v9 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v10 = sub_10009EB7C();
  v11 = [v9 getPreferenceFor:v10];
  [(COSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v11];

  id v12 = objc_alloc_init((Class)NSNumberFormatter);
  [v12 setNumberStyle:1];
  [v12 setMaximumFractionDigits:0];
  v13 = +[NSNumber numberWithInt:0];
  v14 = [v12 stringFromNumber:v13];
  [v12 setNotANumberSymbol:v14];

  [(COSHeadphoneHearingProtectionController *)self setNumberFormatter:v12];
  id v15 = objc_alloc_init((Class)NSDateFormatter);
  v16 = +[NSLocale currentLocale];
  [v15 setLocale:v16];

  [v15 setDateFormat:@"MMM"];
  [(COSHeadphoneHearingProtectionController *)self setMonthFormatter:v15];
  id v17 = objc_alloc_init((Class)NSDateFormatter);
  v18 = +[NSLocale currentLocale];
  [v17 setLocale:v18];

  [v17 setDateFormat:@"M"];
  [(COSHeadphoneHearingProtectionController *)self setMonthNumberFormatter:v17];
  v19 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
  healthStore = self->_healthStore;
  self->_healthStore = v19;

  self->_weeklyNotificationCount = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)COSHeadphoneHearingProtectionController;
  [(COSHeadphoneHearingProtectionController *)&v9 viewWillAppear:a3];
  CFStringRef v4 = [(COSHeadphoneHearingProtectionController *)self startDate];
  objc_super v5 = [(COSHeadphoneHearingProtectionController *)self endDate];
  [(COSHeadphoneHearingProtectionController *)self queryNotificationCountsFromDate:v4 toDate:v5];

  objc_super v6 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v7 = sub_10009EB7C();
  v8 = [v6 getPreferenceFor:v7];
  [(COSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v8];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  CFStringRef v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_11;
  }
  objc_super v5 = objc_opt_new();
  objc_super v6 = [(COSHeadphoneHearingProtectionController *)self headphoneNotificationsGroupSpecifier];
  [v5 addObject:v6];

  v7 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v8 = sub_10009EFE0();
  objc_super v9 = [v7 getNanoPreferenceFor:v8];
  unsigned __int8 v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    v11 = [(COSHeadphoneHearingProtectionController *)self headphoneNotificationsSwitchSpecifier];
    [v5 addObject:v11];
  }
  id v12 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v13 = sub_10009F0E8();
  v14 = [v12 getNanoPreferenceFor:v13];
  if ([v14 BOOLValue])
  {

LABEL_7:
    v19 = [(COSHeadphoneHearingProtectionController *)self headphoneWeeklyNotificationDescriptionSpecifier];
    [v5 addObject:v19];

    goto LABEL_8;
  }
  id v15 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v16 = sub_10009EFE0();
  id v17 = [v15 getNanoPreferenceFor:v16];
  unsigned int v18 = [v17 BOOLValue];

  if (v18) {
    goto LABEL_7;
  }
LABEL_8:
  v20 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitGroupSpecifier];
  [v5 addObject:v20];

  objc_super v21 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitSwitchSpecifier];
  [v5 addObject:v21];

  v22 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  uint64_t v23 = sub_10009F1F0();
  v24 = [v22 getNanoPreferenceFor:v23];
  unsigned int v25 = [v24 BOOLValue];

  if (v25)
  {
    uint64_t v26 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitDescriptionSpecifier];
    [v5 addObject:v26];

    v27 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitSliderSpecifier];
    [v5 addObject:v27];
  }
  v28 = *(void **)&self->BPSListController_opaque[v3];
  *(void *)&self->BPSListController_opaque[v3] = v5;

  CFStringRef v4 = *(void **)&self->BPSListController_opaque[v3];
LABEL_11:

  return v4;
}

- (id)headphoneNotificationsGroupSpecifier
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"COSHeadphoneNotificationsGroupKey"];
  CFStringRef v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"HEADPHONE_LEVEL_NOTIFICATIONS_FOOTER" value:&stru_100249230 table:@"Sounds"];

  uint64_t v6 = PSFooterHyperlinkViewActionKey;
  [v3 setProperty:@"openAboutHeadphoneNotifications" forKey:PSFooterHyperlinkViewActionKey];
  v7 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v8 = sub_10009EFE0();
  objc_super v9 = [v7 getNanoPreferenceFor:v8];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"HEADPHONE_LEVEL_NOTIFICATIONS_GROUP" value:&stru_100249230 table:@"Sounds"];
    [v3 setName:v12];

    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"HEADPHONE_LEVEL_NOTIFICATIONS_MANDATORY" value:&stru_100249230 table:@"Sounds"];
    +[NSBundle mainBundle];
    v16 = id v15 = self;
    CFStringRef v17 = @"LEARN_MORE_IN_HEALTH_LINK";
    unsigned int v18 = [v16 localizedStringForKey:@"LEARN_MORE_IN_HEALTH_LINK" value:&stru_100249230 table:@"Sounds"];
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v18);
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v19);

    objc_super v21 = ASDPurchase_ptr;
    self = v15;
  }
  else
  {
    v22 = +[NSBundle mainBundle];
    CFStringRef v17 = @"LEARN_MORE_IN_HEALTH_LINK";
    uint64_t v23 = [v22 localizedStringForKey:@"LEARN_MORE_IN_HEALTH_LINK" value:&stru_100249230 table:@"Sounds"];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v23);

    v24 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
    unsigned int v25 = sub_10009F788();
    uint64_t v26 = [v24 getNanoPreferenceFor:v25];
    unsigned __int8 v27 = [v26 BOOLValue];

    if ((v27 & 1) == 0)
    {
      v28 = +[NSBundle mainBundle];
      [v28 localizedStringForKey:@"HEADPHONE_LEVEL_NOTIFICATIONS_DISABLED_FOOTER" value:&stru_100249230 table:@"Sounds"];
      v29 = v40 = self;
      v30 = +[NSBundle mainBundle];
      CFStringRef v17 = @"HEALTH_PRIVACY_SETTINGS_LINK";
      v31 = [v30 localizedStringForKey:@"HEALTH_PRIVACY_SETTINGS_LINK" value:&stru_100249230 table:@"Sounds"];
      uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v31);

      self = v40;
      [v3 setProperty:@"openHealthPrivacySettings" forKey:v6];
      v20 = (void *)v32;
    }
    objc_super v21 = ASDPurchase_ptr;
  }
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  [v3 setProperty:v34 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v20 forKey:PSFooterHyperlinkViewTitleKey];
  v35 = [v21[116] mainBundle];
  v36 = [v35 localizedStringForKey:v17 value:&stru_100249230 table:@"Sounds"];
  v42.location = (NSUInteger)[v20 rangeOfString:v36];
  v37 = NSStringFromRange(v42);
  [v3 setProperty:v37 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v38 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v38 forKey:PSFooterHyperlinkViewTargetKey];

  return v3;
}

- (id)headphoneNotificationsSwitchSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"HEADPHONE_LEVEL_NOTIFICATIONS_SWITCH" value:&stru_100249230 table:@"Sounds"];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setHeadphoneNotificationsEnabled:forSpecifier:" get:"getHeadphoneNotificationsEnabled" detail:0 cell:6 edit:0];

  [v5 setProperty:@"COSHeadphoneNotificationsSwitchKey" forKey:PSIDKey];
  uint64_t v6 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v7 = sub_10009F788();
  v8 = [v6 getNanoPreferenceFor:v7];
  objc_super v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 BOOLValue]);
  [v5 setProperty:v9 forKey:PSEnabledKey];

  return v5;
}

- (id)headphoneWeeklyNotificationDescriptionSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS" value:&stru_100249230 table:@"Sounds"];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"weeklyNotificationCount:" detail:0 cell:4 edit:0];

  [v5 setProperty:self->_weeklyNotificationData forKey:@"NotificationDataKey"];
  [v5 setProperty:@"COSHeadphoneWeeklyNotificationsKey" forKey:PSIDKey];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v5;
}

- (id)headphoneLevelLimitGroupSpecifier
{
  v2 = +[PSSpecifier groupSpecifierWithID:@"COSHeadphoneLevelLimitGroupKey"];
  uint64_t v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER" value:&stru_100249230 table:@"Sounds"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  objc_super v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER" value:&stru_100249230 table:@"Sounds"];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"LEARN_MORE_IN_HEALTH_LINK" value:&stru_100249230 table:@"Sounds"];
  objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

  unsigned int v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v2 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v2 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  id v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"LEARN_MORE_IN_HEALTH_LINK" value:&stru_100249230 table:@"Sounds"];
  v19.location = (NSUInteger)[v9 rangeOfString:v13];
  v14 = NSStringFromRange(v19);
  [v2 setProperty:v14 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v15 = +[NSValue valueWithNonretainedObject:self];
  [v2 setProperty:v15 forKey:PSFooterHyperlinkViewTargetKey];

  [v2 setProperty:@"openHealthArticleSafeListening" forKey:PSFooterHyperlinkViewActionKey];

  return v2;
}

- (id)headphoneLevelLimitSwitchSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"HEADPHONE_LEVEL_LIMIT_LABEL" value:&stru_100249230 table:@"Sounds"];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setHeadphoneLevelLimitEnabled:forSpecifier:" get:"getHeadphoneLevelLimitEnabled" detail:0 cell:6 edit:0];

  [v5 setProperty:@"COSHeadphoneLevelLimitSwitchKey" forKey:PSIDKey];

  return v5;
}

- (id)headphoneLevelLimitDescriptionSpecifier
{
  uint64_t v3 = [(COSHeadphoneHearingProtectionController *)self updateHeadphoneLevelLimitText];
  CFStringRef v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"updateHeadphoneLevelLimitDescriptionText" detail:0 cell:4 edit:0];

  [v4 setProperty:@"COSHeadphoneLevelLimitDescriptionKey" forKey:PSIDKey];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v4;
}

- (id)headphoneLevelLimitSliderSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setHeadphoneLevelLimitValue:forSpecifier:" get:"getHeadphoneLevelLimitSetting" detail:0 cell:5 edit:0];
  [v2 setProperty:@"COSHeadphoneLevelLimitSliderKey" forKey:PSIDKey];
  [v2 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v2 setProperty:&__kCFBooleanTrue forKey:PSSliderIsSegmented];
  [v2 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
  [v2 setProperty:&off_10025C0B8 forKey:PSSliderSegmentCount];
  [v2 setProperty:&off_10025C0D0 forKey:PSControlMinimumKey];
  [v2 setProperty:&off_10025C0E8 forKey:PSControlMaximumKey];
  uint64_t v3 = +[UIImage systemImageNamed:@"speaker.2.fill"];
  CFStringRef v4 = +[UIColor systemGrayColor];
  objc_super v5 = [v3 imageWithTintColor:v4 renderingMode:1];
  [v2 setProperty:v5 forKey:PSSliderLeftImageKey];

  uint64_t v6 = +[UIImage systemImageNamed:@"speaker.3.fill"];
  v7 = +[UIColor systemGrayColor];
  v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  [v2 setProperty:v8 forKey:PSSliderRightImageKey];

  [v2 setProperty:&__kCFBooleanTrue forKey:PSIconImageShouldFlipForRightToLeftKey];

  return v2;
}

- (id)updateHeadphoneLevelLimitText
{
  uint64_t v3 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  CFStringRef v4 = sub_10009EB7C();
  objc_super v5 = [v3 getNanoPreferenceFor:v4];

  uint64_t v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"HEADPHONE_LEVEL_LIMIT_SET_LEVEL" value:&stru_100249230 table:@"Sounds"];
  v8 = [(COSHeadphoneHearingProtectionController *)self numberFormatter];
  objc_super v9 = [v8 stringFromNumber:v5];
  unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

  return v10;
}

- (id)updateHeadphoneLevelLimitDescriptionText
{
  v2 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  uint64_t v3 = sub_10009EB7C();
  CFStringRef v4 = [v2 getNanoPreferenceFor:v3];

  objc_super v5 = [v4 stringValue];
  uint64_t v6 = +[NSString stringWithFormat:@"HEADPHONE_LEVEL_LIMIT_%@_INFO", v5];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:v6 value:&stru_100249230 table:@"Sounds"];

  return v8;
}

- (void)openHealthPrivacySettings
{
  +[NSURL URLWithString:@"Bridge:root=PRIVACY_ID&path=HeadphoneAudio"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync();
}

- (void)openAboutHeadphoneNotifications
{
  uint64_t v3 = objc_alloc_init(COSHeadphoneNotificationsController);
  id v4 = objc_alloc_init((Class)UINavigationItem);
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismiss"];
  [v4 setRightBarButtonItem:v5];
  id v6 = objc_alloc((Class)UINavigationBar);
  v7 = [(COSHeadphoneHearingProtectionController *)self view];
  [v7 frame];
  double v9 = v8;
  unsigned int v10 = [(COSHeadphoneHearingProtectionController *)self navigationController];
  v11 = [v10 navigationBar];
  [v11 frame];
  id v12 = [v6 initWithFrame:0.0, 0.0, v9];

  id v16 = v4;
  v13 = +[NSArray arrayWithObjects:&v16 count:1];
  [v12 setItems:v13];

  v14 = +[UIColor systemBackgroundColor];
  [v12 setBarTintColor:v14];

  [v12 setTranslucent:0];
  [v12 _setHidesShadow:1];
  id v15 = [(COSHeadphoneNotificationsController *)v3 view];
  [v15 addSubview:v12];

  [(COSHeadphoneHearingProtectionController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)dismiss
{
}

- (void)openHealthArticleSafeListening
{
  id v2 = (void *)UIApp;
  id v3 = +[NSURL URLWithString:@"x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening"];
  [v2 openURL:v3 withCompletionHandler:0];
}

- (void)setHeadphoneLevelLimitEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  [(COSHeadphoneHearingProtectionController *)self setLocalChange:1];
  if ([v5 BOOLValue])
  {
    id v6 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitDescriptionSpecifier];
    v12[0] = v6;
    v7 = [(COSHeadphoneHearingProtectionController *)self headphoneLevelLimitSliderSpecifier];
    v12[1] = v7;
    double v8 = +[NSArray arrayWithObjects:v12 count:2];
    [(COSHeadphoneHearingProtectionController *)self insertContiguousSpecifiers:v8 afterSpecifierID:@"COSHeadphoneLevelLimitSwitchKey" animated:1];
  }
  else
  {
    [(COSHeadphoneHearingProtectionController *)self removeSpecifierID:@"COSHeadphoneLevelLimitDescriptionKey" animated:1];
    [(COSHeadphoneHearingProtectionController *)self removeSpecifierID:@"COSHeadphoneLevelLimitSliderKey" animated:1];
  }
  double v9 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  unsigned int v10 = sub_10009F1F0();
  id v11 = [v9 setNanoPreferenceFor:v10 value:v5];
}

- (id)getHeadphoneLevelLimitEnabled
{
  id v2 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = sub_10009F1F0();
  id v4 = [v2 getNanoPreferenceFor:v3];

  return v4;
}

- (void)setHeadphoneLevelLimitValue:(id)a3 forSpecifier:(id)a4
{
  id v13 = a3;
  [(COSHeadphoneHearingProtectionController *)self setLocalChange:1];
  id v5 = [(COSHeadphoneHearingProtectionController *)self levelLimitThreshold];

  if (v5 != v13)
  {
    [(COSHeadphoneHearingProtectionController *)self setLevelLimitThreshold:v13];
    id v6 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
    v7 = sub_10009EB7C();
    id v8 = [v6 setNanoPreferenceFor:v7 value:v13];

    uint64_t v9 = OBJC_IVAR___PSListController__specifiers;
    unsigned int v10 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:@"COSHeadphoneLevelLimitDescriptionKey"];
    id v11 = [(COSHeadphoneHearingProtectionController *)self updateHeadphoneLevelLimitText];
    [v10 setName:v11];

    id v12 = [*(id *)&self->BPSListController_opaque[v9] specifierForID:@"COSHeadphoneLevelLimitDescriptionKey"];
    [(COSHeadphoneHearingProtectionController *)self reloadSpecifier:v12];
  }
}

- (id)getHeadphoneLevelLimitSetting
{
  id v2 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = sub_10009EB7C();
  id v4 = [v2 getNanoPreferenceFor:v3];

  return v4;
}

- (void)setHeadphoneNotificationsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  [(COSHeadphoneHearingProtectionController *)self setLocalChange:1];
  if ([v9 BOOLValue])
  {
    id v5 = [(COSHeadphoneHearingProtectionController *)self headphoneWeeklyNotificationDescriptionSpecifier];
    [(COSHeadphoneHearingProtectionController *)self insertSpecifier:v5 afterSpecifierID:@"COSHeadphoneNotificationsSwitchKey" animated:1];
  }
  else
  {
    [(COSHeadphoneHearingProtectionController *)self removeSpecifierID:@"COSHeadphoneWeeklyNotificationsKey" animated:1];
  }
  id v6 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  v7 = sub_10009F0E8();
  id v8 = [v6 setNanoPreferenceFor:v7 value:v9];
}

- (id)getHeadphoneNotificationsEnabled
{
  id v2 = [(COSHeadphoneHearingProtectionController *)self audioSettingsManager];
  id v3 = sub_10009F0E8();
  id v4 = [v2 getNanoPreferenceFor:v3];

  return v4;
}

- (id)weeklyNotificationCount:(id)a3
{
  id v4 = [(COSHeadphoneHearingProtectionController *)self numberFormatter];
  id v5 = +[NSNumber numberWithInt:self->_weeklyNotificationCount];
  id v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (void)updateNotificationCountsForData:(id)a3
{
  id v3 = a3;
  uint64_t v26 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  id v4 = [v3 objectAtIndex:0];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [v3 objectAtIndex:1];
      id v8 = [v7 objectAtIndexedSubscript:v6];
      unsigned __int8 v27 = v8;

      v32[0] = @"month";
      v31 = [v3 objectAtIndex:0];
      v30 = [v31 objectAtIndexedSubscript:v6];
      v33[0] = v30;
      v32[1] = @"count";
      v29 = [v3 objectAtIndex:1];
      v28 = [v29 objectAtIndexedSubscript:v6];
      v33[1] = v28;
      v32[2] = @"order";
      id v9 = +[NSNumber numberWithInt:v6];
      unsigned int v10 = [v9 stringValue];
      v33[2] = v10;
      v32[3] = @"desc";
      id v11 = [v8 integerValue];
      id v12 = +[NSBundle mainBundle];
      id v13 = v12;
      if (v11 == (id)1) {
        CFStringRef v14 = @"HEADPHONE_LEVEL_NOTIFICATION_DESCRIPTION_SINGULAR";
      }
      else {
        CFStringRef v14 = @"HEADPHONE_LEVEL_NOTIFICATIONS_DESCRIPTION_PLURAL";
      }
      id v15 = [v12 localizedStringForKey:v14 value:&stru_100249230 table:@"Sounds"];
      id v16 = +[NSString stringWithFormat:@"%@ %@", v8, v15];
      v33[3] = v16;
      v32[4] = @"date";
      CFStringRef v17 = [v3 objectAtIndex:2];
      unsigned int v18 = [v17 objectAtIndexedSubscript:v6];
      v33[4] = v18;
      NSRange v19 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
      [(NSArray *)v26 setObject:v19 atIndexedSubscript:v6];

      ++v6;
      v20 = [v3 objectAtIndex:0];
      id v21 = [v20 count];
    }
    while ((unint64_t)v21 > v6);
  }
  weeklyNotificationData = self->_weeklyNotificationData;
  self->_weeklyNotificationData = v26;

  uint64_t v23 = [v3 objectAtIndex:1];
  v24 = [v23 valueForKeyPath:@"@sum.self"];
  -[COSHeadphoneHearingProtectionController setWeeklyNotificationCount:](self, "setWeeklyNotificationCount:", [v24 intValue]);
}

- (id)startDate
{
  id v2 = +[NSDate date];
  id v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 components:2097404 fromDate:v2];
  [v4 setMonth:((char *)[v4 month]) - 5];
  [v4 setDay:1];
  id v5 = [v3 dateFromComponents:v4];
  unint64_t v6 = [v3 startOfDayForDate:v5];

  return v6;
}

- (id)endDate
{
  return +[NSDate date];
}

- (void)queryNotificationCountsFromDate:(id)a3 toDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = +[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHeadphoneAudioExposureEvent];
  id v8 = +[HKQuery predicateForSamplesWithStartDate:v7 endDate:v6 options:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:HKSampleSortIdentifierEndDate ascending:0];
  unsigned int v10 = [(COSHeadphoneHearingProtectionController *)self creatNotificationDataStructure:v7 toDate:v6];

  id v11 = [(COSHeadphoneHearingProtectionController *)self hkQueryForSampleType:v12 predicate:v8 sortDescriptors:v9 notificationData:v10];

  [(HKHealthStore *)self->_healthStore executeQuery:v11];
}

- (id)hkQueryForSampleType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 notificationData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = objc_alloc((Class)HKSampleQuery);
  id v23 = v12;
  id v15 = +[NSArray arrayWithObjects:&v23 count:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A1228;
  v19[3] = &unk_100245C30;
  id v16 = v13;
  id v20 = v16;
  objc_copyWeak(&v21, &location);
  id v17 = [v14 initWithSampleType:v10 predicate:v11 limit:0 sortDescriptors:v15 resultsHandler:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

- (id)creatNotificationDataStructure:(id)a3 toDate:(id)a4
{
  id v22 = a3;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[NSCalendar currentCalendar];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  for (uint64_t i = 0; i != 6; ++i)
  {
    [v7 setMonth:i];
    id v9 = [v6 dateByAddingComponents:v7 toDate:v22 options:0];
    [v5 addObject:v9];
    id v10 = [(COSHeadphoneHearingProtectionController *)self monthFormatter];
    id v11 = [v10 stringFromDate:v9];

    id v12 = [(COSHeadphoneHearingProtectionController *)self monthNumberFormatter];
    id v13 = [v12 stringFromDate:v9];
    id v14 = +[NSString stringWithFormat:@"MONTH_%@", v13];

    id v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:v14 value:&stru_100249230 table:@"Sounds"];

    [v19 addObject:v11];
    [v20 addObject:v16];
    [v21 addObject:&off_10025C100];
  }
  id v17 = objc_alloc_init((Class)NSMutableArray);
  [v17 insertObject:v19 atIndex:0];
  [v17 insertObject:v21 atIndex:1];
  [v17 insertObject:v5 atIndex:2];

  return v17;
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
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

- (NSDateFormatter)monthFormatter
{
  return self->_monthFormatter;
}

- (void)setMonthFormatter:(id)a3
{
}

- (NSDateFormatter)monthNumberFormatter
{
  return self->_monthNumberFormatter;
}

- (void)setMonthNumberFormatter:(id)a3
{
}

- (BOOL)isLocalChange
{
  return self->_localChange;
}

- (void)setLocalChange:(BOOL)a3
{
  self->_localChange = a3;
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
  objc_storeStrong((id *)&self->_monthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_weeklyNotificationData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end