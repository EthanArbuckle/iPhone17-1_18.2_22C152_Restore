@interface COSSOSSettingsViewController
- (BOOL)canEditMedicalIDContacts;
- (BOOL)isTinker;
- (BOOL)showKappaInfo;
- (BOOL)showNewtonInfo;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)useMedicalEmergencyContacts;
- (BOOL)wristDetectionEnabled;
- (COSSOSSettingsViewController)init;
- (COSSOSSettingsViewControllerDelegate)navBarDelegate;
- (HKHealthStore)healthStore;
- (NSArray)kappaAPISpecifiers;
- (NSCalendar)calendar;
- (NSSet)tccAppIDs;
- (NSString)kappaApiAppName;
- (_HKMedicalIDData)medicalIDData;
- (_NSRange)rangeOfReplacementString:(id)a3 inFormatString:(id)a4;
- (id)_createKappaSpecifiers;
- (id)_createNewtonSpecifiers;
- (id)_descriptionOfNumberOfFallDetectionApps:(id)a3;
- (id)getContactDestination:(id)a3;
- (id)kappaThirdPartyName:(id)a3;
- (id)kappaTriggersEmergencySOS:(id)a3;
- (id)longPressTriggersEmergencySOS:(id)a3;
- (id)newtonTriggersEmergencySOS:(id)a3;
- (id)specifiers;
- (unint64_t)newtonEligibility;
- (void)_addFooterFormat:(id)a3 footerLink:(id)a4 toSpecifier:(id)a5 withAction:(id)a6;
- (void)_createKappaAPISpecifiers;
- (void)_didSelectFallDetectionDataSharing:(id)a3;
- (void)_dismissMedicalID;
- (void)_editMedicalID;
- (void)_setNewtonModeChangeForSpecifier:(id)a3;
- (void)_updateSOSContactsList;
- (void)addEmergencyContactsToSpecifiers:(id)a3;
- (void)addSOSContactsToSpecifiers:(id)a3;
- (void)dealloc;
- (void)learnMore;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidFinish:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)presentConfirmationWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 cancelHandler:(id)a6 confirmTitle:(id)a7 confirmHandler:(id)a8;
- (void)setCalendar:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setKappaAPISpecifiers:(id)a3;
- (void)setKappaApiAppName:(id)a3;
- (void)setKappaTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4;
- (void)setLongPressTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4;
- (void)setMedicalIDData:(id)a3;
- (void)setNavBarDelegate:(id)a3;
- (void)setNewtonEligibility:(unint64_t)a3;
- (void)setNewtonTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4;
- (void)setTccAppIDs:(id)a3;
- (void)setWristDetectionEnabled:(BOOL)a3;
- (void)sosContactsChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSSOSSettingsViewController

- (BOOL)useMedicalEmergencyContacts
{
  if (!self->_haveSetUseMedicalEmergencyContacts)
  {
    self->_useMedicalEmergencyContacts = 1;
    v3 = +[UIApplication sharedApplication];
    v4 = [v3 activeWatch];

    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CCBCAB2C-F590-4386-BC88-BFBEE2C2F7F4"];
    self->_deviceSupportsMedicalContacts = [v4 supportsCapability:v5];

    if (self->_deviceSupportsMedicalContacts)
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2050000000;
      v6 = (void *)qword_10029B230;
      uint64_t v14 = qword_10029B230;
      if (!qword_10029B230)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000E7704;
        v10[3] = &unk_1002436A8;
        v10[4] = &v11;
        sub_1000E7704((uint64_t)v10);
        v6 = (void *)v12[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v11, 8);
      v8 = [v7 sharedInstance];
      self->_useMedicalEmergencyContacts = [v8 isAllowedToMessageSOSContacts];
    }
    else
    {
      self->_useMedicalEmergencyContacts = 0;
    }
    self->_haveSetUseMedicalEmergencyContacts = 1;
  }
  return self->_useMedicalEmergencyContacts;
}

- (COSSOSSettingsViewController)init
{
  v26.receiver = self;
  v26.super_class = (Class)COSSOSSettingsViewController;
  v2 = [(COSSOSSettingsViewController *)&v26 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)HKHealthStore);
    [(COSSOSSettingsViewController *)v2 setHealthStore:v3];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v4 = (void *)qword_10029B240;
    uint64_t v31 = qword_10029B240;
    if (!qword_10029B240)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000E78D0;
      v27[3] = &unk_1002436A8;
      v27[4] = &v28;
      sub_1000E78D0((uint64_t)v27);
      v4 = (void *)v29[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v28, 8);
    uint64_t v6 = objc_opt_new();
    sosLegacyContactsManager = v2->_sosLegacyContactsManager;
    v2->_sosLegacyContactsManager = (SOSLegacyContactsManager *)v6;

    v8 = +[NSNotificationCenter defaultCenter];
    v9 = sub_1000E4980();
    [v8 addObserver:v2 selector:"sosContactsChanged:" name:v9 object:0];

    v2->_wristDetectionEnabled = 1;
    v2->_newtonEligibility = 1;
    id v10 = UIApp;
    uint64_t v11 = [v10 activeWatch];
    id v12 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel" pairedDevice:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      LOBYTE(v27[0]) = 0;
      unsigned __int8 v14 = [v12 BOOLForKey:@"DisableWristDetection" keyExistsAndHasValidFormat:v27];
      if (LOBYTE(v27[0])) {
        v2->_wristDetectionEnabled = v14 ^ 1;
      }
    }
    v15 = (NSCalendar *)[objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar = v2->_calendar;
    v2->_calendar = v15;

    v17 = [v11 valueForProperty:NRDevicePropertyIsAltAccount];
    v2->_isTinker = [v17 BOOLValue];

    if (v2->_isTinker)
    {
      v18 = [v11 pairingID];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000E4A88;
      v24[3] = &unk_100246D90;
      v25 = v2;
      sub_100033958(v18, &_dispatch_main_q, v24);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000E4A94, @"SOSNewtonStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v20 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v20, v2, (CFNotificationCallback)sub_1000E4A94, @"SOSLongPressTriggersEmergencyStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v21 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v21, v2, (CFNotificationCallback)sub_1000E4A94, @"SOSKappaStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v2 selector:"reloadSpecifiers" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SOSLongPressTriggersEmergencyStateChangedNotification", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"SOSNewtonStateChangedNotification", 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"SOSKappaStateChangedNotification", 0);
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  id v7 = sub_1000E4980();
  [v6 removeObserver:self name:v7 object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v9.receiver = self;
  v9.super_class = (Class)COSSOSSettingsViewController;
  [(COSSOSSettingsViewController *)&v9 dealloc];
}

- (void)sosContactsChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4C0C;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateSOSContactsList
{
  if ([(COSSOSSettingsViewController *)self useMedicalEmergencyContacts])
  {
    sosContactsManager = self->_sosContactsManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000E4CA4;
    v4[3] = &unk_100245A30;
    v4[4] = self;
    [(SOSContactsManager *)sosContactsManager SOSContactsWithTimeout:v4 andCompletion:5.0];
  }
}

- (void)setHealthStore:(id)a3
{
  id v5 = a3;
  p_healthStore = &self->_healthStore;
  objc_storeStrong((id *)&self->_healthStore, a3);
  if ([(COSSOSSettingsViewController *)self canEditMedicalIDContacts])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v7 = (void *)qword_10029B250;
    uint64_t v24 = qword_10029B250;
    if (!qword_10029B250)
    {
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_1000E7978;
      v19 = &unk_1002436A8;
      v20 = &v21;
      sub_1000E7978((uint64_t)&v16);
      id v7 = (void *)v22[3];
    }
    v8 = v7;
    _Block_object_dispose(&v21, 8);
    objc_super v9 = (SOSContactsManager *)[[v8 alloc] initWithHealthStore:*p_healthStore];
    sosContactsManager = self->_sosContactsManager;
    self->_sosContactsManager = v9;
  }
  [(COSSOSSettingsViewController *)self _updateSOSContactsList];
  uint64_t v11 = *p_healthStore;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E500C;
  v15[3] = &unk_100246DB8;
  v15[4] = self;
  [(HKHealthStore *)v11 fetchMedicalIDDataWithCompletion:v15];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  id v12 = (void *)qword_10029B258;
  uint64_t v24 = qword_10029B258;
  if (!qword_10029B258)
  {
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1000E79D0;
    v19 = &unk_1002436A8;
    v20 = &v21;
    sub_1000E79D0((uint64_t)&v16);
    id v12 = (void *)v22[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v21, 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E512C;
  v14[3] = &unk_100243708;
  v14[4] = self;
  [v13 newtonEligibilityWithHealthStore:v5 completion:v14];
}

- (BOOL)showNewtonInfo
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 activeWatch];

  if (BPSDeviceHasCapabilityForString())
  {
    v4 = [sub_1000E5274() newtonTriggersEmergencySOSNumber];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)showKappaInfo
{
  unsigned int v2 = [sub_1000E5274() isKappaDetectionSupportedOnActiveWatch];
  if (v2)
  {
    id v3 = sub_1000E5274();
    LOBYTE(v2) = _[v3 isKappaVisible];
  }
  return v2;
}

- (id)_createKappaSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier groupSpecifierWithID:@"CRASH_DETECT_TRIGGERS_SOS_GROUP_ID"];
  BOOL v5 = [sub_1000E5274() crashDetectionTitleDescription];
  [v4 setName:v5];

  uint64_t v6 = [sub_1000E5274() crashDetectionWatchFooterDescription];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  id v7 = [sub_1000E5274() crashDetectionSwitchDescription];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setKappaTriggersEmergencySOS:forSpecifier:" get:"kappaTriggersEmergencySOS:" detail:0 cell:6 edit:0];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v8 setIdentifier:@"CRASH_DETECT_TRIGGERS_SOS_ID"];
  [v3 addObject:v8];
  if (self->_kappaAPISpecifiers) {
    [v3 addObjectsFromArray:];
  }

  return v3;
}

- (void)_createKappaAPISpecifiers
{
  id v3 = [sub_1000E5274() getKappaThirdPartyApp];
  if (v3)
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E56A8;
    v6[3] = &unk_100246E08;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    [v7 getLocalizedNameForPairedDeviceWithCompletion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    kappaApiAppName = self->_kappaApiAppName;
    self->_kappaApiAppName = 0;

    kappaAPISpecifiers = self->_kappaAPISpecifiers;
    self->_kappaAPISpecifiers = 0;

    self->_needsReloadSpecifiers = 1;
  }
}

- (id)kappaThirdPartyName:(id)a3
{
  return self->_kappaApiAppName;
}

- (void)setKappaTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = sub_1000E5274();
  id v7 = [v5 BOOLValue];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E59FC;
  v8[3] = &unk_100244CE0;
  v8[4] = self;
  [v6 setKappaTriggersEmergencySOS:v7 isWristDetectionEnabled:[self wristDetectionEnabled] confirmationDelegate:self completion:v8];
}

- (id)kappaTriggersEmergencySOS:(id)a3
{
  unsigned __int8 v3 = [(COSSOSSettingsViewController *)self isTinker];
  id v4 = sub_1000E5274();
  if (v3) {
    id v5 = [v4 kappaTriggersEmergencySOSTinker];
  }
  else {
    id v5 = [v4 kappaTriggersEmergencySOS];
  }
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)addEmergencyContactsToSpecifiers:(id)a3
{
  id v4 = a3;
  id v5 = [v4 specifierForID:@"SOS_CONTACTS_GROUP_ID"];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SOS_EMERGENCY_CONTACTS_HEADER" value:&stru_100249230 table:@"SOSSettings"];
  [v5 setName:v7];

  if ([(NSArray *)self->_emergencyContacts count])
  {
    uint64_t v17 = v5;
    id v8 = (char *)[v4 indexOfObject:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obj = self->_emergencyContacts;
    id v9 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v12);
          unsigned __int8 v14 = [v13 name];
          v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"getContactDestination:" detail:0 cell:4 edit:0];

          v16 = [v13 phoneNumber];
          [v15 setProperty:v16 forKey:@"COSEmergencySOSFormattedDestination"];

          [v15 setProperty:v13 forKey:@"COSEmergencyContactObj"];
          id v12 = (char *)v12 + 1;
          [v4 insertObject:v15 atIndex:&v8[(void)v12]];
        }
        while (v10 != v12);
        id v10 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v8 = (char *)v12 + (void)v8;
      }
      while (v10);
    }

    id v5 = v17;
  }
  else
  {
    [v5 setName:0];
  }
}

- (void)addSOSContactsToSpecifiers:(id)a3
{
  id v4 = a3;
  id v5 = [v4 specifierForID:@"SOS_CONTACTS_GROUP_ID"];
  id v6 = [(SOSLegacyContactsManager *)self->_sosLegacyContactsManager SOSLegacyContacts];
  if ([v6 count])
  {
    uint64_t v17 = v5;
    id v7 = (char *)[v4 indexOfObject:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v16 = v6;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
          id v13 = [v12 name];
          unsigned __int8 v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"getContactDestination:" detail:0 cell:4 edit:0];

          v15 = [v12 phoneNumber];
          [v14 setProperty:v15 forKey:@"COSEmergencySOSFormattedDestination"];

          uint64_t v11 = (char *)v11 + 1;
          [v4 insertObject:v14 atIndex:&v7[(void)v11]];
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v7 = (char *)v11 + (void)v7;
      }
      while (v9);
    }

    id v6 = v16;
    id v5 = v17;
  }
  else
  {
    [v5 setName:0];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(COSSOSSettingsViewController *)self loadSpecifiersFromPlistName:@"SOSSettings" target:self];
    id v6 = [v5 specifierForID:@"SOS_TRIGGER_ANIMATION_GROUP"];
    id v7 = [sub_1000E5274() watchTriggerAnimationFooterDescription];
    uint64_t v8 = PSFooterTextGroupKey;
    v29 = v6;
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    id v9 = [v5 specifierForID:@"SOS_TRIGGER_ANIMATION"];
    [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
    +[COSSOSTriggerAnimationCell preferredCellHeight];
    uint64_t v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v9 setProperty:v10 forKey:PSTableCellHeightKey];

    uint64_t v11 = [v5 specifierForID:@"LONG_PRESS_TRIGGERS_SOS_GROUP_ID"];
    id v12 = [sub_1000E5274() holdSideButtonFooterDescription];
    [v11 setProperty:v12 forKey:v8];

    id v13 = [v5 specifierForID:@"LONG_PRESS_TRIGGERS_SOS_ID"];
    unsigned __int8 v14 = [sub_1000E5274() holdSideButtonTitleDescription];
    [v13 setName:v14];

    [v13 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    if ([(COSSOSSettingsViewController *)self showKappaInfo])
    {
      v15 = [(COSSOSSettingsViewController *)self _createKappaSpecifiers];
      id v16 = [v5 indexOfSpecifierWithID:@"SOS_CONTACTS_GROUP_ID"];
      if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v16, [v15 count]);
        [v5 insertObjects:v15 atIndexes:v17];
      }
    }
    if ([(COSSOSSettingsViewController *)self showNewtonInfo])
    {
      v18 = [(COSSOSSettingsViewController *)self _createNewtonSpecifiers];
      id v19 = [v5 indexOfSpecifierWithID:@"SOS_CONTACTS_GROUP_ID"];
      if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        long long v20 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v19, [v18 count]);
        [v5 insertObjects:v18 atIndexes:v20];
      }
    }
    if ([(COSSOSSettingsViewController *)self useMedicalEmergencyContacts]) {
      [(COSSOSSettingsViewController *)self addEmergencyContactsToSpecifiers:v5];
    }
    else {
      [(COSSOSSettingsViewController *)self addSOSContactsToSpecifiers:v5];
    }
    if (![(COSSOSSettingsViewController *)self canEditMedicalIDContacts])
    {
      id v21 = [v5 indexOfSpecifierWithID:@"SOS_OPEN_HEALTH_ID"];
      if (v21 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [v5 removeObjectAtIndex:v21];
      }
    }
    long long v22 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v23 = [v22 localizedStringForKey:@"SOS_CONTACTS_GROUP_FOOTER" value:&stru_100249230 table:@"SOSSettings"];

    uint64_t v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"SOS_ADD_EMERGENCY_CONTACT_LINK" value:&stru_100249230 table:@"SOSSettings"];
    objc_super v26 = [v5 specifierForID:@"SOS_CONTACTS_GROUP_ID"];
    [(COSSOSSettingsViewController *)self _addFooterFormat:v23 footerLink:v25 toSpecifier:v26 withAction:@"learnMore"];

    v27 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)_createNewtonSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier groupSpecifierWithID:@"FALL_DETECT_TRIGGERS_SOS_GROUP_ID"];
  id v5 = [sub_1000E5274() fallDetectionTitleDescription];
  [v4 setName:v5];

  id v6 = [sub_1000E5274() fallDetectionFooterDescription];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  id v7 = [sub_1000E5274() fallDetectionTitleDescription];
  uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setNewtonTriggersEmergencySOS:forSpecifier:" get:"newtonTriggersEmergencySOS:" detail:0 cell:6 edit:0];

  [v8 setIdentifier:@"FALL_DETECT_TRIGGERS_SOS_ID"];
  [v3 addObject:v8];
  id v9 = +[UIApplication sharedApplication];
  uint64_t v10 = [v9 activeWatch];

  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"98409C1B-D02D-400B-9F63-33784EFEDA85"];
  unsigned int v12 = [v10 supportsCapability:v11];

  if (v12 && [sub_1000E5274() newtonTriggersEmergencySOS])
  {
    id v13 = [sub_1000E5274() fallDetectionOnlyDuringWorkoutsTitleDescription];
    unsigned __int8 v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setIdentifier:@"FALL_DETECT_TRIGGERS_SOS_WORKOUTS_ID"];
    [v14 setButtonAction:"_setNewtonModeChangeForSpecifier:"];
    uint64_t v15 = PSAllowMultilineTitleKey;
    [v14 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    id v16 = [sub_1000E5274() fallDetectionAlwaysOnTitleDescription];
    uint64_t v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v17 setIdentifier:@"FALL_DETECT_TRIGGERS_SOS_ALL_DAY_ID"];
    [v17 setButtonAction:"_setNewtonModeChangeForSpecifier:"];
    [v17 setProperty:&__kCFBooleanTrue forKey:v15];
    if ([sub_1000E5274() newtonTriggersEmergencySOSWorkouts]) {
      v18 = v14;
    }
    else {
      v18 = v17;
    }
    uint64_t v19 = PSRadioGroupCheckedSpecifierKey;
    id v20 = v18;
    [v4 setProperty:v20 forKey:v19];
    [v3 addObject:v17];
    [v3 addObject:v14];
  }
  if (![(COSSOSSettingsViewController *)self isTinker])
  {
    if ([(NSSet *)self->_tccAppIDs count])
    {
      id v21 = [(COSSOSSettingsViewController *)self newtonTriggersEmergencySOS:v8];
      unsigned int v22 = [v21 BOOLValue];

      if (v22)
      {
        uint64_t v23 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v24 = [v23 localizedStringForKey:@"SOS_FALL_DETECTION_DATA_SHARING" value:&stru_100249230 table:@"SOSSettings"];
        v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:"_descriptionOfNumberOfFallDetectionApps:" detail:0 cell:2 edit:0];

        [v25 setIdentifier:@"FALL_DATA_SHARING_SOS_ID"];
        [v25 setControllerLoadAction:"_didSelectFallDetectionDataSharing:"];
        [v25 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
        [v3 addObject:v25];
      }
    }
  }

  return v3;
}

- (id)_descriptionOfNumberOfFallDetectionApps:(id)a3
{
  id v3 = [(NSSet *)self->_tccAppIDs count];
  if (v3)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"SOS_FALL_DETECTION_DATA_SHARING_APPS_COUNT" value:&stru_100249230 table:@"SOSSettings"];
    id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }

  return v3;
}

- (void)_didSelectFallDetectionDataSharing:(id)a3
{
  id v5 = objc_alloc_init(COSSOSSettingsFallDataSharingViewController);
  id v4 = [(COSSOSSettingsViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)_addFooterFormat:(id)a3 footerLink:(id)a4 toSpecifier:(id)a5 withAction:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v12);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  [v11 setProperty:v15 forKey:PSFooterCellClassGroupKey];

  [v11 setProperty:v21 forKey:PSFooterHyperlinkViewTitleKey];
  id v16 = [(COSSOSSettingsViewController *)self rangeOfReplacementString:v12 inFormatString:v13];
  NSUInteger v18 = v17;

  v23.id location = (NSUInteger)v16;
  v23.length = v18;
  uint64_t v19 = NSStringFromRange(v23);
  [v11 setProperty:v19 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v20 = +[NSValue valueWithNonretainedObject:self];
  [v11 setProperty:v20 forKey:PSFooterHyperlinkViewTargetKey];

  [v11 setProperty:v10 forKey:PSFooterHyperlinkViewActionKey];
}

- (_NSRange)rangeOfReplacementString:(id)a3 inFormatString:(id)a4
{
  id v5 = a3;
  id v6 = [a4 rangeOfString:@"%@"];
  id v7 = [v5 length];

  NSUInteger v8 = (NSUInteger)v6;
  NSUInteger v9 = (NSUInteger)v7;
  result.length = v9;
  result.id location = v8;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSSOSSettingsViewController;
  [(COSSOSSettingsViewController *)&v5 viewWillAppear:a3];
  if ([(COSSOSSettingsViewController *)self showNewtonInfo])
  {
    id v4 = +[COSSOSSettingsFallDataSharingViewController fallDetectionAppIDs];
    [(COSSOSSettingsViewController *)self setTccAppIDs:v4];

    [(COSSOSSettingsViewController *)self reloadSpecifiers];
  }
  [(COSSOSSettingsViewController *)self _createKappaAPISpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSSOSSettingsViewController;
  [(COSSOSSettingsViewController *)&v4 viewDidAppear:a3];
  if (self->_needsReloadSpecifiers)
  {
    [(COSSOSSettingsViewController *)self reloadSpecifiers];
    self->_needsReloadSpecifiers = 0;
  }
}

- (BOOL)canEditMedicalIDContacts
{
  if (![(COSSOSSettingsViewController *)self isTinker]) {
    return 1;
  }
  id v3 = [(COSSOSSettingsViewController *)self healthStore];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getContactDestination:(id)a3
{
  return [a3 propertyForKey:@"COSEmergencySOSFormattedDestination"];
}

- (void)setLongPressTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = sub_1000E5274();
  id v7 = [v5 BOOLValue];

  [v6 setLongPressTriggersEmergencySOS:v7];

  [(COSSOSSettingsViewController *)self reloadSpecifiers];
}

- (void)setNewtonTriggersEmergencySOS:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = sub_1000E5274();
  id v7 = [v5 BOOLValue];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E6CA8;
  v8[3] = &unk_100244CE0;
  v8[4] = self;
  [v6 setNewtonTriggersEmergencySOS:v7 isWristDetectionEnabled:[self wristDetectionEnabled] newtonEligibility:[self newtonEligibility] confirmationDelegate:self completion:v8];
}

- (id)newtonTriggersEmergencySOS:(id)a3
{
  id v3 = [sub_1000E5274() newtonTriggersEmergencySOS];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setNewtonModeChangeForSpecifier:(id)a3
{
  BOOL v4 = [a3 identifier];
  id v5 = [v4 isEqualToString:@"FALL_DETECT_TRIGGERS_SOS_WORKOUTS_ID"];

  id v6 = sub_1000E5274();
  BOOL v7 = [(COSSOSSettingsViewController *)self wristDetectionEnabled];
  unint64_t v8 = [(COSSOSSettingsViewController *)self newtonEligibility];

  _[v6 setNewtonTriggersEmergencySOSWorkoutsOnly:v5 isWristDetectionEnabled:v7 newtonEligibility:v8 confirmationDelegate:self completion:&stru_100246E28];
}

- (id)longPressTriggersEmergencySOS:(id)a3
{
  id v3 = [sub_1000E5274() longPressTriggersEmergencySOS];

  return +[NSNumber numberWithBool:v3];
}

- (void)_editMedicalID
{
  if (_os_feature_enabled_impl())
  {
    id v17 = +[MIUIDisplayConfiguration standardConfiguration];
    [v17 setAccessPoint:8];
    [v17 setEntryPoint:1];
    [v17 setSuggestHealthData:1];
    id v3 = objc_alloc((Class)MIUIMedicalIDViewController);
    BOOL v4 = [(COSSOSSettingsViewController *)self healthStore];
    id v5 = [(COSSOSSettingsViewController *)self medicalIDData];
    id v6 = [v3 initWithHealthStore:v4 medicalIDData:v5 displayConfiguration:v17];

    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissMedicalID"];
    unint64_t v8 = [v6 navigationItem];
    [v8 setRightBarButtonItem:v7];

    id v9 = [objc_alloc((Class)sub_1000E70F4()) initWithRootViewController:v6];
    [(COSSOSSettingsViewController *)self presentViewController:v9 animated:1 completion:0];

LABEL_3:

    return;
  }
  id v10 = [(COSSOSSettingsViewController *)self medicalIDData];

  if (!v10)
  {
    if ([(COSSOSSettingsViewController *)self isTinker]) {
      return;
    }
    +[NSURL URLWithString:@"prefs:root=HEALTH&path=MEDICAL_ID_ITEM"];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    BPSOpenSensitiveURLAsync();
    goto LABEL_3;
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v11 = (void *)qword_10029B278;
  uint64_t v22 = qword_10029B278;
  if (!qword_10029B278)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E7C48;
    v18[3] = &unk_1002436A8;
    v18[4] = &v19;
    sub_1000E7C48((uint64_t)v18);
    id v11 = (void *)v20[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v19, 8);
  id v13 = [[v12 alloc] initInEditMode:1 inBuddy:0 organDonationSignupAvailable:0];
  unsigned __int8 v14 = [(COSSOSSettingsViewController *)self healthStore];
  [v13 setHealthStore:v14];

  uint64_t v15 = [(COSSOSSettingsViewController *)self medicalIDData];
  [v13 setMedicalID:v15];

  [v13 setIsSecondaryProfileMedicalID:[self isTinker]];
  [v13 setDelegate:self];
  [v13 setAllowsEditing:1];
  [v13 setShowsDeleteButton:0];
  id v16 = [objc_alloc((Class)sub_1000E70F4()) initWithRootViewController:v13];
  [(COSSOSSettingsViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_dismissMedicalID
{
}

- (void)learnMore
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v3 = (void *)qword_10029B280;
  uint64_t v10 = qword_10029B280;
  if (!qword_10029B280)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E7CA0;
    v6[3] = &unk_1002436A8;
    void v6[4] = &v7;
    sub_1000E7CA0((uint64_t)v6);
    id v3 = (void *)v8[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  id v5 = [v4 presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.emergencysos"];
  [v5 setDarkMode:1];
  [v5 setPresentingViewController:self];
  [v5 present];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v5 = a3;
  id v4 = [v5 medicalID];
  [(COSSOSSettingsViewController *)self setMedicalIDData:v4];

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
}

- (void)presentConfirmationWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 cancelHandler:(id)a6 confirmTitle:(id)a7 confirmHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  [sub_1000E5274() presentConfirmationOnViewController:self title:v19 message:v18 cancelTitle:v17 cancelHandler:v16 confirmTitle:v15 confirmHandler:v14];
}

- (COSSOSSettingsViewControllerDelegate)navBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBarDelegate);

  return (COSSOSSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setNavBarDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (BOOL)wristDetectionEnabled
{
  return self->_wristDetectionEnabled;
}

- (void)setWristDetectionEnabled:(BOOL)a3
{
  self->_wristDetectionEnabled = a3;
}

- (unint64_t)newtonEligibility
{
  return self->_newtonEligibility;
}

- (void)setNewtonEligibility:(unint64_t)a3
{
  self->_newtonEligibility = a3;
}

- (BOOL)isTinker
{
  return self->_isTinker;
}

- (NSSet)tccAppIDs
{
  return self->_tccAppIDs;
}

- (void)setTccAppIDs:(id)a3
{
}

- (NSArray)kappaAPISpecifiers
{
  return self->_kappaAPISpecifiers;
}

- (void)setKappaAPISpecifiers:(id)a3
{
}

- (NSString)kappaApiAppName
{
  return self->_kappaApiAppName;
}

- (void)setKappaApiAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kappaApiAppName, 0);
  objc_storeStrong((id *)&self->_kappaAPISpecifiers, 0);
  objc_storeStrong((id *)&self->_tccAppIDs, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_navBarDelegate);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_sosLegacyContactsManager, 0);

  objc_storeStrong((id *)&self->_sosContactsManager, 0);
}

@end