@interface COSTritiumDetailController
- (COSTritiumDetailController)init;
- (id)specifiers;
- (id)tritiumEnabled:(id)a3;
- (id)tritiumPrivacyEnabled:(id)a3;
- (void)_updatePrivacyRowVisibility;
- (void)dealloc;
- (void)setTritiumEnabled:(id)a3 specifier:(id)a4;
- (void)setTritiumPrivacyEnabled:(id)a3 specifier:(id)a4;
@end

@implementation COSTritiumDetailController

- (COSTritiumDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTritiumDetailController;
  v2 = [(COSTritiumDetailController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000E80B4, @"NanoAlwaysOnTimePreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)COSTritiumDetailController;
  [(COSTritiumDetailController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v45 = OBJC_IVAR___PSListController__specifiers;
    v44 = [(COSTritiumDetailController *)self loadSpecifiersFromPlistName:@"Tritium" target:self];
    objc_super v4 = [v44 specifierForID:@"TRITIUM_PRIVACY_GROUP_ID"];
    privacyGroupSpecifier = self->_privacyGroupSpecifier;
    self->_privacyGroupSpecifier = v4;

    v71[0] = PSTitleKey;
    uint64_t v6 = PSTitleKey;
    uint64_t v52 = PSTitleKey;
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"APPS_COMPLICATIONS_PRIVACY_LABEL" value:&stru_100249230 table:@"Tritium"];
    uint64_t v50 = PSTableCellClassKey;
    v72[0] = v8;
    v72[1] = @"PSLinkCell";
    v71[1] = PSTableCellClassKey;
    v71[2] = PSBundlePathKey;
    uint64_t v9 = PSBundlePathKey;
    uint64_t v51 = PSBundlePathKey;
    uint64_t v10 = PSBundleIsControllerKey;
    v72[2] = @"NTKCTritiumSettings";
    v72[3] = &__kCFBooleanTrue;
    uint64_t v49 = PSSearchNanoSettingsBundlePath;
    v71[3] = PSBundleIsControllerKey;
    v71[4] = PSSearchNanoSettingsBundlePath;
    v72[4] = &__kCFBooleanTrue;
    uint64_t v48 = BPSForbiddenWatchCapabilitiesKey;
    v71[5] = BPSForbiddenWatchCapabilitiesKey;
    uint64_t v11 = BPSTinkerCapabilityKey;
    uint64_t v70 = BPSTinkerCapabilityKey;
    v12 = +[NSArray arrayWithObjects:&v70 count:1];
    uint64_t v53 = PSAllowMultilineTitleKey;
    v71[6] = PSAllowMultilineTitleKey;
    v72[5] = v12;
    v72[6] = &__kCFBooleanTrue;
    v55 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:7];

    v68[0] = v6;
    v46 = +[NSBundle mainBundle];
    v13 = [v46 localizedStringForKey:@"APPS_LIVE_ACTIVITIES_PRIVACY_LABEL" value:&stru_100249230 table:@"Tritium"];
    v69[0] = v13;
    v69[1] = @"PSLinkCell";
    v68[1] = v50;
    v68[2] = v9;
    v69[2] = @"CompanionAppBacklightPrivacySettings";
    v69[3] = &__kCFBooleanTrue;
    uint64_t v47 = v10;
    v68[3] = v10;
    v68[4] = v49;
    v69[4] = &__kCFBooleanTrue;
    v68[5] = v48;
    uint64_t v14 = v11;
    uint64_t v67 = v11;
    v15 = +[NSArray arrayWithObjects:&v67 count:1];
    v69[5] = v15;
    v69[6] = @"activities";
    v68[6] = @"CSLPRFAppBacklightPrivacyType";
    v68[7] = v53;
    v69[7] = &__kCFBooleanTrue;
    v54 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:8];

    v65[0] = v52;
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"APPS_APPS_PRIVACY_LABEL" value:&stru_100249230 table:@"Tritium"];
    v66[0] = v17;
    v66[1] = @"PSLinkCell";
    v65[1] = v50;
    v65[2] = v51;
    v66[2] = @"CompanionAppBacklightPrivacySettings";
    v66[3] = &__kCFBooleanTrue;
    v65[3] = v10;
    v65[4] = v49;
    v66[4] = &__kCFBooleanTrue;
    v65[5] = v48;
    uint64_t v64 = v14;
    v18 = +[NSArray arrayWithObjects:&v64 count:1];
    v66[5] = v18;
    v66[6] = @"apps";
    v65[6] = @"CSLPRFAppBacklightPrivacyType";
    v65[7] = v53;
    v66[7] = &__kCFBooleanTrue;
    v19 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:8];

    v62[0] = v52;
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"APPS_NOTIFICATIONS_PRIVACY_LABEL" value:&stru_100249230 table:@"Tritium"];
    v63[0] = v21;
    v63[1] = @"PSLinkCell";
    v62[1] = v50;
    v62[2] = v51;
    v63[2] = @"CompanionAppBacklightPrivacySettings";
    v63[3] = &__kCFBooleanTrue;
    v63[4] = &__kCFBooleanTrue;
    v62[3] = v47;
    v62[4] = v49;
    v62[5] = v48;
    uint64_t v61 = v14;
    v22 = +[NSArray arrayWithObjects:&v61 count:1];
    v63[5] = v22;
    v63[6] = @"notifications";
    v62[6] = @"CSLPRFAppBacklightPrivacyType";
    v62[7] = v53;
    v63[7] = &__kCFBooleanTrue;
    v23 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:8];

    v58[3] = v19;
    CFStringRef v59 = @"items";
    v58[0] = v55;
    v58[1] = v54;
    v58[2] = v23;
    v24 = +[NSArray arrayWithObjects:v58 count:4];
    v60 = v24;
    v25 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    v26 = +[NSBundle mainBundle];
    v27 = SpecifiersFromPlist();

    [v27 objectAtIndex:0];
    v28 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    complicationsPrivacySpecifier = self->_complicationsPrivacySpecifier;
    self->_complicationsPrivacySpecifier = v28;

    v30 = [v27 objectAtIndex:1];
    liveActivitiesPrivacySpecifier = self->_liveActivitiesPrivacySpecifier;
    self->_liveActivitiesPrivacySpecifier = v30;

    v32 = [v27 objectAtIndex:2];
    appsPrivacySpecifier = self->_appsPrivacySpecifier;
    self->_appsPrivacySpecifier = v32;

    v34 = [v27 objectAtIndex:3];
    notificationsPrivacySpecifier = self->_notificationsPrivacySpecifier;
    self->_notificationsPrivacySpecifier = v34;

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat || AppBooleanValue)
    {
      v38 = self->_liveActivitiesPrivacySpecifier;
      v39 = self->_notificationsPrivacySpecifier;
      v57[0] = self->_complicationsPrivacySpecifier;
      v57[1] = v38;
      v40 = self->_appsPrivacySpecifier;
      v57[2] = v39;
      v57[3] = v40;
      v41 = +[NSArray arrayWithObjects:v57 count:4];
      v37 = v44;
      [v44 addObjectsFromArray:v41];
    }
    else
    {
      v37 = v44;
      [v44 removeObject:self->_privacyGroupSpecifier];
    }
    v42 = *(void **)&self->BPSListController_opaque[v45];
    *(void *)&self->BPSListController_opaque[v45] = v37;

    v3 = *(void **)&self->BPSListController_opaque[v45];
  }

  return v3;
}

- (void)_updatePrivacyRowVisibility
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    Boolean v7 = 0;
    int v5 = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", &v7);
    if (v7
      && !v5
      && [(COSTritiumDetailController *)self containsSpecifier:self->_privacyGroupSpecifier])
    {
      [(COSTritiumDetailController *)self removeSpecifier:self->_privacyGroupSpecifier animated:1];
      [(COSTritiumDetailController *)self removeSpecifier:self->_complicationsPrivacySpecifier animated:1];
      [(COSTritiumDetailController *)self removeSpecifier:self->_liveActivitiesPrivacySpecifier animated:1];
      [(COSTritiumDetailController *)self removeSpecifier:self->_notificationsPrivacySpecifier animated:1];
      [(COSTritiumDetailController *)self removeSpecifier:self->_appsPrivacySpecifier animated:1];
    }
  }
  else if (([(COSTritiumDetailController *)self containsSpecifier:self->_privacyGroupSpecifier] & 1) == 0)
  {
    [(COSTritiumDetailController *)self addSpecifier:self->_privacyGroupSpecifier animated:1];
    [(COSTritiumDetailController *)self addSpecifier:self->_complicationsPrivacySpecifier animated:1];
    [(COSTritiumDetailController *)self addSpecifier:self->_liveActivitiesPrivacySpecifier animated:1];
    [(COSTritiumDetailController *)self addSpecifier:self->_notificationsPrivacySpecifier animated:1];
    [(COSTritiumDetailController *)self addSpecifier:self->_appsPrivacySpecifier animated:1];
  }
}

- (void)setTritiumEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"AOTEnabled", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue]), @"com.apple.system.prefs");
  CFPreferencesAppSynchronize(@"com.apple.system.prefs");
  int v5 = objc_opt_new();
  CFStringRef v8 = @"AOTEnabled";
  uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
  Boolean v7 = +[NSSet setWithArray:v6];
  [v5 synchronizeUserDefaultsDomain:@"com.apple.system.prefs" keys:v7];

  [(COSTritiumDetailController *)self _updatePrivacyRowVisibility];
}

- (id)tritiumEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  uint64_t v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setTritiumPrivacyEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"AOTPrivacyEnabled", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue]), @"com.apple.system.prefs");
  CFPreferencesAppSynchronize(@"com.apple.system.prefs");
  BOOL v4 = objc_opt_new();
  CFStringRef v7 = @"AOTPrivacyEnabled";
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  uint64_t v6 = +[NSSet setWithArray:v5];
  [v4 synchronizeUserDefaultsDomain:@"com.apple.system.prefs" keys:v6];
}

- (id)tritiumPrivacyEnabled:(id)a3
{
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"AOTPrivacyEnabled", @"com.apple.system.prefs", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveActivitiesPrivacySpecifier, 0);
  objc_storeStrong((id *)&self->_notificationsPrivacySpecifier, 0);
  objc_storeStrong((id *)&self->_appsPrivacySpecifier, 0);
  objc_storeStrong((id *)&self->_complicationsPrivacySpecifier, 0);

  objc_storeStrong((id *)&self->_privacyGroupSpecifier, 0);
}

@end