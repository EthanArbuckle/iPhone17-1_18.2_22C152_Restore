@interface COSGeneralSettingsController
+ (id)_dictationAutoPunctuationSupportedLanguages;
+ (id)_dictationPrivacyTextWithUnsupportedLanguages:(id)a3 supportedInstalledLanguages:(id)a4 supportedWaitingLanguages:(id)a5 supportedInstallingLanguages:(id)a6 andLanguageMapping:(id)a7;
+ (id)_displayNamesForLanguageIDs:(id)a3;
+ (id)_enabledDictationLanguageCodes;
+ (id)_footerTextForAutoPunctuationLanguages:(id)a3 withLanguageMapping:(id)a4;
+ (id)_localizedListForLanguageCodes:(id)a3 andLanguageMapping:(id)a4;
+ (id)_pendingLanguagesFooterTextForWaitingLanguages:(id)a3 installingLanguages:(id)a4 andLanguageMapping:(id)a5;
- (BOOL)allowLogCollection;
- (BOOL)alwaysInstall;
- (BOOL)reloadingSpecifiersUpdatesSearchModel;
- (COSGeneralSettingsController)init;
- (id)automaticDownloadsEnabled:(id)a3;
- (id)dictationAutoPunctuationEnabled;
- (id)dictationEnabled;
- (id)getGizmoWristChoice:(id)a3;
- (id)specifiers;
- (void)_gotAutomaticAppInstallState:(BOOL)a3;
- (void)_prepareDictationFooterForSpecifier:(id)a3;
- (void)dealloc;
- (void)dumpLogs:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)presentPrivacySheet:(id)a3;
- (void)setAlwaysInstall:(BOOL)a3;
- (void)setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4;
- (void)setDictationAutoPunctuationEnabled:(id)a3;
- (void)setDictationEnabled:(id)a3;
@end

@implementation COSGeneralSettingsController

- (COSGeneralSettingsController)init
{
  v29.receiver = self;
  v29.super_class = (Class)COSGeneralSettingsController;
  v2 = [(COSGeneralSettingsController *)&v29 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"refreshSoftwareUpdateBadge:" name:@"com.apple.Bridge.badgeUpdate" object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"versionOrCapabilitiesChanged:" name:@"COSActiveDeviceEssentialPropertiesChanged" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v6 = (void *)qword_10029B320;
    uint64_t v35 = qword_10029B320;
    if (!qword_10029B320)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_10012F60C;
      location[3] = &unk_1002436A8;
      v31 = &v32;
      v7 = (void *)sub_10012F65C();
      v8 = dlsym(v7, "AFNanoPreferencesDidChangeNotification");
      *(void *)(v31[1] + 24) = v8;
      qword_10029B320 = *(void *)(v31[1] + 24);
      v6 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v6)
    {
      v23 = (_Unwind_Exception *)sub_100171A7C();
      _Block_object_dispose(&v32, 8);
      _Unwind_Resume(v23);
    }
    [v5 addObserver:v2 selector:"assistantPreferencesDidChange:" name:*v6 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10012CAA4, @"com.apple.Carousel.CSLDisableNightstand", 0, (CFNotificationSuspensionBehavior)0);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v2, (CFNotificationCallback)sub_10012CAB4, @"CSLScreenshotEnabledChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)sub_10012CAC4, @"CSLDisableBackgroundAppUpdatesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_10012CAD4, @"CSLWorkoutSportWatchModePreferenceChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)sub_10012CAE4, @"com.apple.nanosystemsettings.continuityEnabledChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v14 = +[MCProfileConnection sharedConnection];
    [v14 addObserver:v2];

    objc_initWeak(location, v2);
    v15 = +[UIApplication sharedApplication];
    v16 = [v15 activeWatch];

    v17 = +[ACXDeviceConnection sharedDeviceConnection];
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_10012CAF4;
    v27 = &unk_100243810;
    objc_copyWeak(&v28, location);
    [v17 getAlwaysInstallForPairedDevice:v16 completion:&v24];

    id v18 = objc_alloc_init((Class)HKHealthStore);
    id v19 = objc_alloc((Class)_HKWheelchairUseCharacteristicCache);
    v20 = [_HKWheelchairUseCharacteristicCache initWithHealthStore:v18];
    wheelchairUseCharacteristicCache = v2->_wheelchairUseCharacteristicCache;
    v2->_wheelchairUseCharacteristicCache = v20;

    [(_HKWheelchairUseCharacteristicCache *)v2->_wheelchairUseCharacteristicCache addObserver:v2];
    objc_destroyWeak(&v28);

    objc_destroyWeak(location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5 = +[MCProfileConnection sharedConnection];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)COSGeneralSettingsController;
  [(COSGeneralSettingsController *)&v6 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(COSGeneralSettingsController *)self loadSpecifiersFromPlistName:@"General" target:self];
    objc_super v6 = +[NRPairedDeviceRegistry sharedInstance];
    v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
    v9 = [v8 firstObject];

    if (+[COSPreferencesAppController hasUpdateAvailable])
    {
      v10 = [v5 specifierForID:@"SOFTWARE_UPDATE_LINK"];
      [v10 setProperty:&off_10025C358 forKey:PSBadgeNumberKey];
    }
    if (sub_10000F71C())
    {
      v11 = [v5 specifierForID:@"SOFTWARE_UPDATE_LINK"];
      [v5 removeObject:v11];

      v12 = [v5 specifierForID:@"AIRPLANE_AND_DND_GROUP_ID"];
      [v5 removeObject:v12];

      v13 = [v5 specifierForID:@"AIRPLANE_MODE_ID"];
      [v5 removeObject:v13];

      v14 = [v5 specifierForID:@"DO_NOT_DISTURB_ID"];
      [v5 removeObject:v14];

      v15 = [v5 specifierForID:@"FOCUS_ID"];
      [v5 removeObject:v15];

      v16 = [v5 specifierForID:@"USAGE_LINK"];
      [v5 removeObject:v16];

      v17 = [v5 specifierForID:@"PROFILES"];
      [v5 removeObject:v17];

      id v18 = [v5 specifierForID:@"RESET"];
      [v5 removeObject:v18];
    }
    id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"FFDA9C57-8508-4B50-B6D8-EEE862251FC0"];
    unsigned int v20 = [v9 supportsCapability:v19];

    if (v20) {
      CFStringRef v21 = @"DO_NOT_DISTURB_ID";
    }
    else {
      CFStringRef v21 = @"FOCUS_ID";
    }
    v22 = [v5 specifierForID:v21];
    [v5 removeObject:v22];

    v23 = +[MCProfileConnection sharedConnection];
    unsigned int v24 = [v23 effectiveBoolValueForSetting:MCFeatureScreenShotAllowed];

    if (v24 == 2)
    {
      uint64_t v25 = [v5 specifierForID:@"BUTTON_CHORD_CELL_ID"];
      [v5 removeObject:v25];

      v26 = [v5 specifierForID:@"BUTTON_CHORD_GROUP_ID"];
      [v5 removeObject:v26];
    }
    else
    {
      v27 = +[UIApplication sharedApplication];
      v26 = [v27 activeWatch];

      id v28 = [v26 valueForProperty:NRDevicePropertyIsInternalInstall];
      unsigned int v29 = [v28 BOOLValue];

      if (v29)
      {
        v30 = [v5 specifierForID:@"BUTTON_CHORD_CELL_ID"];
        [v30 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];
      }
    }

    v31 = [v5 specifierForID:@"LOGS_CELL_ID"];
    uint64_t v32 = +[NSNumber numberWithInt:!self->_logsAreDumping];
    [v31 setProperty:v32 forKey:PSEnabledKey];

    v33 = [v5 specifierForID:@"DICTATION_GROUP_ID"];
    if (!_os_feature_enabled_impl()
      || (+[COSGeneralSettingsController _dictationAutoPunctuationSupportedLanguages], uint64_t v34 = objc_claimAutoreleasedReturnValue(), v34, !v34))
    {
      uint64_t v35 = [v5 specifierForID:@"DICTATION_AUTO_PUNCTUATION_CELL_ID"];
      [v5 removeObject:v35];
    }
    [(COSGeneralSettingsController *)self _prepareDictationFooterForSpecifier:v33];
    if (PBShouldOfferBetterTogetherFlow())
    {
      v36 = pbb_bridge_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Hiding Reset Options for Retail Better Together device", v40, 2u);
      }

      v37 = [v5 specifierForID:@"RESET"];
      [v5 removeObject:v37];
    }
    v38 = *(void **)&self->super.BPSListController_opaque[v3];
    *(void *)&self->super.BPSListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.BPSListController_opaque[v3];
  }

  return v4;
}

- (BOOL)allowLogCollection
{
  if (CFPreferencesGetAppBooleanValue(@"allowLogCollection", @"com.apple.Bridge", 0)) {
    return 1;
  }
  uint64_t v3 = +[UIDevice currentDevice];
  unsigned __int8 v4 = [v3 sf_isDeveloperModeEnabled];

  return v4;
}

- (void)dumpLogs:(id)a3
{
  id v4 = a3;
  if (!self->_logsAreDumping)
  {
    self->_logsAreDumping = 1;
    [(COSListController *)self reloadSpecifiers];
    PBDumpLogsWithBlock();
  }
  if (qword_10029B318 != -1) {
    dispatch_once(&qword_10029B318, &stru_100247D80);
  }
  dispatch_async((dispatch_queue_t)qword_10029B310, &stru_100247DA0);
}

- (id)getGizmoWristChoice:(id)a3
{
  return +[COSGizmoOrientationController wristChoice];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  [(COSListController *)self reloadSpecifiers];
  v6.receiver = self;
  v6.super_class = (Class)COSGeneralSettingsController;
  [(COSGeneralSettingsController *)&v6 handleURL:v5 withCompletion:0];
}

- (void)_gotAutomaticAppInstallState:(BOOL)a3
{
  self->_alwaysInstall = a3;
  [(COSGeneralSettingsController *)self reloadSpecifierID:@"AUTO_APP_INSTALL_SWITCH_ID"];
}

- (id)automaticDownloadsEnabled:(id)a3
{
  return +[NSNumber numberWithBool:self->_alwaysInstall];
}

- (void)setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  self->_alwaysInstall = [v5 BOOLValue];
  objc_super v6 = +[ACXDeviceConnection sharedDeviceConnection];
  [v6 setAlwaysInstall:v5];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"COSAlwaysInstallSettingChangedNotification" object:0];
}

- (BOOL)reloadingSpecifiersUpdatesSearchModel
{
  return 1;
}

- (id)dictationEnabled
{
  v2 = [sub_10012D89C() sharedPreferences];
  id v3 = [v2 nanoDictationEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setDictationEnabled:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = +[NSBundle mainBundle];
  objc_super v6 = v5;
  if (v4)
  {
    id v7 = [v5 localizedStringForKey:@"DICTATION_ENABLE_TITLE" value:&stru_100249230 table:@"General"];

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"DICTATION_ENABLE_WARNING" value:&stru_100249230 table:@"General"];

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"DICTATION_ENABLE_TITLE" value:&stru_100249230 table:@"General"];
    uint64_t v12 = 0;
  }
  else
  {
    id v7 = [v5 localizedStringForKey:@"DICTATION_DISABLE_TITLE" value:&stru_100249230 table:@"General"];

    v13 = +[NSBundle mainBundle];
    v11 = [v13 localizedStringForKey:@"DICTATION_DISABLE_CONFIRMATION" value:&stru_100249230 table:@"General"];

    v14 = [sub_10012D89C() sharedPreferences];
    LODWORD(v13) = [v14 nanoAssistantEnabled];

    v15 = +[NSBundle mainBundle];
    v10 = v15;
    if (v13) {
      CFStringRef v16 = @"DICTATION_DISABLE_WARNING_ASSISTANT_ENABLED";
    }
    else {
      CFStringRef v16 = @"DICTATION_DISABLE_WARNING_ASSISTANT_DISABLED";
    }
    v9 = [v15 localizedStringForKey:v16 value:&stru_100249230 table:@"General"];
    uint64_t v12 = 2;
  }

  v17 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10012DCC4;
  v23[3] = &unk_100247DC0;
  char v24 = v4;
  id v18 = +[UIAlertAction actionWithTitle:v11 style:v12 handler:v23];
  [v17 addAction:v18];

  id v19 = +[NSBundle mainBundle];
  unsigned int v20 = [v19 localizedStringForKey:@"DICTATION_ENABLE_DISABLE_CANCEL" value:&stru_100249230 table:@"General"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10012DD18;
  v22[3] = &unk_100243AE0;
  v22[4] = self;
  CFStringRef v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v22];
  [v17 addAction:v21];

  [(COSGeneralSettingsController *)self presentViewController:v17 animated:1 completion:0];
}

- (id)dictationAutoPunctuationEnabled
{
  v2 = [sub_10012D89C() sharedPreferences];
  id v3 = [v2 nanoDictationAutoPunctuationEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setDictationAutoPunctuationEnabled:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = [sub_10012D89C() sharedPreferences];
  [v4 setNanoDictationAutoPunctuationEnabled:v3];
}

- (void)_prepareDictationFooterForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [sub_10012D89C() sharedPreferences];
  unsigned int v6 = [v5 nanoDictationEnabled];

  if (v6)
  {
    v46 = self;
    uint64_t v7 = +[COSGeneralSettingsController _enabledDictationLanguageCodes];
    v8 = [sub_10012D89C() sharedPreferences];
    v9 = [v8 nanoOfflineDictationStatus];

    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v13 = objc_alloc_init((Class)NSMutableArray);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10012E290;
    v50[3] = &unk_100247DE8;
    id v45 = v9;
    id v51 = v45;
    id v14 = v10;
    id v52 = v14;
    id v15 = v13;
    CFStringRef v16 = (void *)v7;
    id v17 = v15;
    id v53 = v15;
    id v18 = v12;
    id v54 = v18;
    id v19 = v11;
    id v55 = v19;
    [v16 enumerateObjectsUsingBlock:v50];
    uint64_t v20 = +[COSGeneralSettingsController _displayNamesForLanguageIDs:v16];
    CFStringRef v21 = +[NSBundle mainBundle];
    uint64_t v22 = [v21 localizedStringForKey:@"DICTATION_ON_DEVICE_ABOUT_LINK" value:&stru_100249230 table:@"General"];

    v48 = v17;
    v49 = v14;
    v23 = +[COSGeneralSettingsController _dictationPrivacyTextWithUnsupportedLanguages:v14 supportedInstalledLanguages:v17 supportedWaitingLanguages:v19 supportedInstallingLanguages:v18 andLanguageMapping:v20];
    char v24 = +[COSGeneralSettingsController _pendingLanguagesFooterTextForWaitingLanguages:v19 installingLanguages:v18 andLanguageMapping:v20];
    v44 = (void *)v22;
    uint64_t v25 = +[NSString stringWithFormat:@"%@ %@", v23, v22];

    v47 = (void *)v20;
    if ([v24 length])
    {
      v26 = +[NSString stringWithFormat:@"\n\n%@", v24];
      uint64_t v27 = [v25 stringByAppendingString:v26];

      uint64_t v25 = (void *)v27;
    }
    if (_os_feature_enabled_impl())
    {
      id v28 = +[COSGeneralSettingsController _dictationAutoPunctuationSupportedLanguages];
      if ([v28 count])
      {
        v43 = v16;
        uint64_t v29 = +[COSGeneralSettingsController _displayNamesForLanguageIDs:v28];
        v30 = [v28 allObjects];
        v31 = +[COSGeneralSettingsController _footerTextForAutoPunctuationLanguages:v30 withLanguageMapping:v29];

        v42 = (void *)v29;
        if ([v31 length])
        {
          uint64_t v32 = +[NSString stringWithFormat:@"\n\n%@", v31];
          uint64_t v33 = [v25 stringByAppendingString:v32];

          uint64_t v25 = (void *)v33;
        }
        uint64_t v35 = v45;
        uint64_t v34 = v46;
        v36 = v44;

        CFStringRef v16 = v43;
      }
      else
      {
        uint64_t v35 = v45;
        uint64_t v34 = v46;
        v36 = v44;
      }
    }
    else
    {
      uint64_t v35 = v45;
      uint64_t v34 = v46;
      v36 = v44;
    }
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    [v4 setProperty:v38 forKey:PSFooterCellClassGroupKey];

    [v4 setProperty:v25 forKey:PSFooterHyperlinkViewTitleKey];
    v56.location = (NSUInteger)[v25 rangeOfString:v36];
    v39 = NSStringFromRange(v56);
    [v4 setProperty:v39 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v40 = +[NSValue valueWithNonretainedObject:v34];
    [v4 setProperty:v40 forKey:PSFooterHyperlinkViewTargetKey];

    v41 = NSStringFromSelector("presentPrivacySheet:");
    [v4 setProperty:v41 forKey:PSFooterHyperlinkViewActionKey];
  }
}

- (void)presentPrivacySheet:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

+ (id)_enabledDictationLanguageCodes
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  id v4 = [v3 valueForPreferenceKey:UIDictationLanguagesEnabled];

  id v5 = [v4 keysOfEntriesPassingTest:&stru_100247E28];

  return v5;
}

+ (id)_dictationAutoPunctuationSupportedLanguages
{
  v2 = +[COSGeneralSettingsController _enabledDictationLanguageCodes];
  id v3 = [sub_10012D89C() sharedPreferences];
  id v4 = [v3 nanoDictationAutoPunctuationSupportedLanguages];

  id v5 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v6 = [sub_10012D89C() sharedPreferences];
  uint64_t v7 = [v6 nanoLanguageCode];

  if (v7)
  {
    v8 = [sub_10012D89C() sharedPreferences];
    if ([v8 nanoAssistantEnabled])
    {
      unsigned int v9 = [v4 containsObject:v7];

      if (v9)
      {
        uint64_t v10 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

        [v5 addObject:v10];
        uint64_t v7 = (void *)v10;
      }
    }
    else
    {
    }
  }
  CFStringRef v21 = v7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    char v14 = 1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v17 = [v16 stringByReplacingOccurrencesOfString:@"_" withString:@"-" v21];
        if ([v4 containsObject:v17]) {
          [v5 addObject:v16];
        }
        else {
          char v14 = 0;
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
  else
  {
    char v14 = 1;
  }

  if (![v5 count])
  {
    id v19 = 0;
    id v18 = v21;
    goto LABEL_24;
  }
  id v18 = v21;
  if (v14) {
    [v5 removeAllObjects];
  }
  if (v5)
  {
    id v19 = +[NSSet setWithSet:v5];
LABEL_24:

    goto LABEL_26;
  }
  id v19 = 0;
LABEL_26:

  return v19;
}

+ (id)_dictationPrivacyTextWithUnsupportedLanguages:(id)a3 supportedInstalledLanguages:(id)a4 supportedWaitingLanguages:(id)a5 supportedInstallingLanguages:(id)a6 andLanguageMapping:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = (unint64_t)[v11 count];
  id v17 = [v12 count];
  id v18 = (char *)[v13 count];
  id v19 = [v14 count];
  if (!v17)
  {
    uint64_t v20 = +[NSBundle mainBundle];
    CFStringRef v21 = v20;
    if (v16) {
      CFStringRef v22 = @"DICTATION_ON_DEVICE_NO_SUPPORTED_LANGUAGES";
    }
    else {
      CFStringRef v22 = @"DICTATION_ON_DEVICE_SUPPORT_PENDING_WITH_NO_LANGUAGE";
    }
    goto LABEL_20;
  }
  if (!&v18[(void)v19 + v16])
  {
    uint64_t v20 = +[NSBundle mainBundle];
    CFStringRef v21 = v20;
    CFStringRef v22 = @"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_NO_LANGUAGE";
LABEL_20:
    id v28 = [v20 localizedStringForKey:v22 value:&stru_100249230 table:@"General"];
    goto LABEL_33;
  }
  long long v23 = +[NSBundle mainBundle];
  long long v24 = v23;
  if ((unint64_t)v17 >= 2) {
    CFStringRef v25 = @"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGES";
  }
  else {
    CFStringRef v25 = @"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE";
  }
  long long v26 = [v23 localizedStringForKey:v25 value:&stru_100249230 table:@"General"];

  uint64_t v27 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v12 andLanguageMapping:v15];
  id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);

  uint64_t v29 = [v13 arrayByAddingObjectsFromArray:v14];
  id v30 = [v29 count];
  unint64_t v31 = (unint64_t)v30;
  v49 = v29;
  if (v16)
  {
    if (v30)
    {
      id v32 = [v29 count];
      uint64_t v33 = +[NSBundle mainBundle];
      uint64_t v34 = v33;
      CFStringRef v35 = @"DICTATION_ON_DEVICE_UNSUPPORTED_LANGUAGES_AND_PENDING_LANGUAGES";
      if (v16 < 2) {
        CFStringRef v35 = @"DICTATION_ON_DEVICE_UNSUPPORTED_LANGUAGE_AND_PENDING_LANGUAGES";
      }
      CFStringRef v36 = @"DICTATION_ON_DEVICE_UNSUPPORTED_LANGUAGE_AND_PENDING_LANGUAGE";
      if (v16 >= 2) {
        CFStringRef v36 = @"DICTATION_ON_DEVICE_UNSUPPORTED_LANGUAGES_AND_PENDING_LANGUAGE";
      }
      if ((unint64_t)v32 <= 1) {
        CFStringRef v37 = v36;
      }
      else {
        CFStringRef v37 = v35;
      }
      v38 = [v33 localizedStringForKey:v37 value:&stru_100249230 table:@"General"];

      v39 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v11 andLanguageMapping:v15];
      v40 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v29 andLanguageMapping:v15];
      CFStringRef v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v39, v40);

      goto LABEL_30;
    }
    v44 = +[NSBundle mainBundle];
    id v45 = v44;
    if (v16 >= 2) {
      CFStringRef v46 = @"DICTATION_ON_DEVICE_SUPPORT_WITH_UNSUPPORTED_LANGUAGES";
    }
    else {
      CFStringRef v46 = @"DICTATION_ON_DEVICE_SUPPORT_WITH_UNSUPPORTED_LANGUAGE";
    }
    v38 = [v44 localizedStringForKey:v46 value:&stru_100249230 table:@"General"];

    v39 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v11 andLanguageMapping:v15];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v39);
  }
  else
  {
    v41 = +[NSBundle mainBundle];
    v42 = v41;
    if (v31 >= 2) {
      CFStringRef v43 = @"DICTATION_ON_DEVICE_SUPPORT_PENDING_WITH_LANGUAGES";
    }
    else {
      CFStringRef v43 = @"DICTATION_ON_DEVICE_SUPPORT_PENDING_WITH_LANGUAGE";
    }
    v38 = [v41 localizedStringForKey:v43 value:&stru_100249230 table:@"General"];

    v39 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v29 andLanguageMapping:v15];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v39);
  CFStringRef v21 = };
LABEL_30:

  if ([v21 length])
  {
    uint64_t v47 = +[NSString stringWithFormat:@"%@ %@", v28, v21];

    id v28 = (void *)v47;
  }

LABEL_33:

  return v28;
}

+ (id)_pendingLanguagesFooterTextForWaitingLanguages:(id)a3 installingLanguages:(id)a4 andLanguageMapping:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = [v7 count];
    id v11 = +[NSBundle mainBundle];
    id v12 = v11;
    if ((unint64_t)v10 >= 2) {
      CFStringRef v13 = @"DICTATION_ON_DEVICE_SUPPORT_WILL_DOWNLOAD_WITH_LANGUAGES";
    }
    else {
      CFStringRef v13 = @"DICTATION_ON_DEVICE_SUPPORT_WILL_DOWNLOAD_WITH_LANGUAGE";
    }
    id v14 = [v11 localizedStringForKey:v13 value:&stru_100249230 table:@"General"];

    id v15 = v7;
LABEL_11:
    uint64_t v20 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v15 andLanguageMapping:v9];
    CFStringRef v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v20);

    goto LABEL_12;
  }
  if ([v8 count])
  {
    id v16 = [v8 count];
    id v17 = +[NSBundle mainBundle];
    id v18 = v17;
    if ((unint64_t)v16 >= 2) {
      CFStringRef v19 = @"DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING_WITH_LANGUAGES";
    }
    else {
      CFStringRef v19 = @"DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING_WITH_LANGUAGE";
    }
    id v14 = [v17 localizedStringForKey:v19 value:&stru_100249230 table:@"General"];

    id v15 = v8;
    goto LABEL_11;
  }
  CFStringRef v21 = 0;
LABEL_12:

  return v21;
}

+ (id)_footerTextForAutoPunctuationLanguages:(id)a3 withLanguageMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 count];
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    if ((unint64_t)v7 >= 2) {
      CFStringRef v10 = @"DICTATION_AUTO_PUNCTUATION_AVAILABLE_WITH_LANGUAGES";
    }
    else {
      CFStringRef v10 = @"DICTATION_AUTO_PUNCTUATION_AVAILABLE_WITH_LANGUAGE";
    }
    id v11 = [v8 localizedStringForKey:v10 value:&stru_100249230 table:@"General"];

    id v12 = +[COSGeneralSettingsController _localizedListForLanguageCodes:v5 andLanguageMapping:v6];
    CFStringRef v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
  }
  else
  {
    CFStringRef v13 = 0;
  }

  return v13;
}

+ (id)_localizedListForLanguageCodes:(id)a3 andLanguageMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        CFStringRef v13 = [v6 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i) v16];
        if (v13 && ([v7 containsObject:v13] & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = +[NSListFormatter localizedStringByJoiningStrings:v7];

  return v14;
}

+ (id)_displayNamesForLanguageIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCountedSet set];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        uint64_t v11 = [v10 languageCode];

        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        long long v18 = +[NSLocale localeWithLocaleIdentifier:v17];
        long long v19 = [v18 languageCode];

        if ((unint64_t)[v4 countForObject:v19] > 1
          || [v19 isEqualToString:@"pt"])
        {
          uint64_t v20 = +[NSLocale currentLocale];
          uint64_t v21 = [v20 localizedStringForLocaleIdentifier:v17];
        }
        else
        {
          uint64_t v20 = +[NSLocale currentLocale];
          uint64_t v21 = [v20 localizedStringForLanguageCode:v19];
        }
        CFStringRef v22 = (void *)v21;

        if (v22) {
          [v24 setValue:v22 forKey:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  return v24;
}

- (BOOL)alwaysInstall
{
  return self->_alwaysInstall;
}

- (void)setAlwaysInstall:(BOOL)a3
{
  self->_alwaysInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);

  objc_storeStrong((id *)&self->_unlockConnection, 0);
}

@end