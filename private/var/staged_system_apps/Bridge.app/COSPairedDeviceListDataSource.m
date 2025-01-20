@interface COSPairedDeviceListDataSource
- (BOOL)_deviceRequiresUpdate:(id)a3;
- (BOOL)tinkerOnly;
- (COSMigrationManager)migrationManager;
- (COSPairedDeviceListDataSource)init;
- (NRDevice)loadingDevice;
- (NSArray)pairedDeviceSpecifiers;
- (NSArray)tinkerDeviceSpecifiers;
- (PSSpecifier)finishPairing;
- (PSSpecifier)pairNew;
- (PSSpecifier)pairedDevicesGroupSpecifier;
- (PSSpecifier)tinkerDevicesGroupSpecifier;
- (id)_fakeList;
- (id)_fakeWatchName:(unint64_t)a3;
- (id)displaySoftwareUpdate;
- (id)newDeviceSpecifierForNRDevice:(id)a3 enableCell:(BOOL)a4 deviceState:(id)a5;
- (void)_updateSelectedWatchInGroupSpecifier:(id)a3 deviceSpecifiers:(id)a4;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)deviceBecameActive;
- (void)loadSpecifiers;
- (void)presentInternalFlow;
- (void)presentNewPairingFlowIfPossible;
- (void)setDisplaySoftwareUpdate:(id)a3;
- (void)setFinishPairing:(id)a3;
- (void)setLoadingDevice:(id)a3;
- (void)setMigrationManager:(id)a3;
- (void)setPairNew:(id)a3;
- (void)setPairedDeviceSpecifiers:(id)a3;
- (void)setPairedDevicesGroupSpecifier:(id)a3;
- (void)setTinkerDeviceSpecifiers:(id)a3;
- (void)setTinkerDevicesGroupSpecifier:(id)a3;
- (void)setTinkerOnly:(BOOL)a3;
- (void)startMigration;
- (void)updateSelectedWatch;
@end

@implementation COSPairedDeviceListDataSource

- (COSPairedDeviceListDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSPairedDeviceListDataSource;
  v2 = [(COSPairedDeviceListDataSource *)&v10 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_reloadForDeviceStateChange:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_reloadForDeviceStateChange:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_reloadForDeviceStateChange:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_reloadForDeviceStateChange:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_reloadForDeviceStateChange:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000D41C8, @"com.apple.NanoRegistry.MagicSwitchSettingsChanged", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.NanoRegistry.MagicSwitchSettingsChanged", 0);
  v5.receiver = self;
  v5.super_class = (Class)COSPairedDeviceListDataSource;
  [(COSPairedDeviceListDataSource *)&v5 dealloc];
}

- (id)_fakeWatchName:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8) {
    CFStringRef v3 = @"Apple Watch Edition";
  }
  else {
    CFStringRef v3 = @"Apple Watch";
  }
  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  objc_super v5 = +[NSString stringWithFormat:@"Some Userʼs %@ %@", v3, v4];

  return v5;
}

- (id)_fakeList
{
  v2 = objc_opt_new();
  unint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(@"fakePairedWatches", @"com.apple.Bridge", 0);
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  if (AppIntegerValue <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = AppIntegerValue;
  }
  uint64_t v24 = NRDevicePropertyIsActive;
  uint64_t v23 = NRDevicePropertyProductType;
  uint64_t v22 = NRDevicePropertyDmin;
  uint64_t v21 = NRDevicePropertyName;
  uint64_t v7 = NRDevicePropertyIsPaired;
  uint64_t v8 = NRDevicePropertyPairedDate;
  if (AppIntegerValue) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 4;
  }
  do
  {
    id v10 = objc_alloc((Class)NRDevice);
    v11 = dispatch_get_global_queue(-2, 0);
    id v12 = [v10 initWithQueue:v11];

    v13 = +[NSNumber numberWithInt:v5 == 0];
    [v12 setValue:v13 forProperty:@"COSIsActiveHack"];

    v14 = +[NSNumber numberWithInt:v5 == 0];
    [v12 setValue:v14 forProperty:v24];

    if (v5) {
      CFStringRef v15 = @"Watch1,2";
    }
    else {
      CFStringRef v15 = @"Watch1,1";
    }
    [v12 setValue:v15 forProperty:v23];
    v26 = &off_10025C298;
    v16 = +[NSNumber numberWithUnsignedInteger:v5];
    v27 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v12 setValue:v17 forProperty:v22];

    v18 = [(COSPairedDeviceListDataSource *)self _fakeWatchName:v5];
    [v12 setValue:v18 forProperty:v21];

    [v12 setValue:&__kCFBooleanTrue forProperty:v7];
    v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v4];
    [v12 setValue:v19 forProperty:v8];

    [v2 addObject:v12];
    ++v5;
    v4 += 1000;
  }
  while (v9 != v5);

  return v2;
}

- (id)newDeviceSpecifierForNRDevice:(id)a3 enableCell:(BOOL)a4 deviceState:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = NRDevicePropertyName;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 valueForProperty:v8];
  id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:-1 edit:0];

  [v12 setProperty:v10 forKey:@"COSAssociatedDevice"];
  [v12 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v12 setProperty:self->_migrationManager forKey:@"COSMigrationManager"];
  id v13 = objc_retainBlock(self->_displaySoftwareUpdate);
  [v12 setProperty:v13 forKey:@"COSDisplaySoftwareUpdate"];

  id v14 = [v9 integerValue];
  CFStringRef v15 = [v10 valueForProperty:NRDevicePropertyIsAltAccount];

  unsigned int v16 = [v15 BOOLValue];
  if (v14 == (id)6) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16 | v5;
  }
  v18 = +[NSNumber numberWithBool:v17];
  [v12 setProperty:v18 forKey:@"COSPairedDeviceListTableCellEnabled"];

  v19 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
  [v12 setProperty:v19 forKey:PSTableCellHeightKey];

  [v12 setProperty:&off_10025C2B0 forKey:PSAccessoryKey];
  [v12 setProperty:objc_opt_class() forKey:@"COSCellDetailButtonControllerClass"];
  [v12 setProperty:v9 forKey:@"COSDeviceState"];

  return v12;
}

- (void)loadSpecifiers
{
  CFStringRef v3 = [(COSPairedDeviceListDataSource *)self specifiers];
  v108 = self;
  if ([UIApp launchedToTest])
  {
    unint64_t v4 = [(COSPairedDeviceListDataSource *)self _fakeList];
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v4 = sub_100005DC4();
    BOOL v5 = sub_10001284C();
  }
  uint64_t v6 = +[NSMutableArray array];
  uint64_t v7 = [v4 sortedArrayUsingComparator:&stru_100246A48];

  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"STANDARD_PAIRED_GROUP_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
  id v10 = +[PSSpecifier groupSpecifierWithID:@"DeviceListGroup" name:v9];

  v104 = v10;
  [v10 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  BOOL v11 = sub_100033860();
  id v12 = [v7 count];
  id v13 = [v5 count];
  long long v118 = 0u;
  long long v119 = 0u;
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = (unint64_t)v12 >= 2;
  }
  int v15 = !v14;
  long long v120 = 0uLL;
  long long v121 = 0uLL;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v118 objects:v127 count:16];
  id obj = v16;
  v107 = v6;
  v102 = v5;
  v103 = v3;
  if (!v17)
  {
LABEL_37:

    v34 = (id *)v108;
    goto LABEL_38;
  }
  id v18 = v17;
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v119;
  uint64_t v105 = NRDevicePropertyMaxPairingCompatibilityVersion;
  if (v13) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = !v11;
  }
  uint64_t v22 = NRDevicePropertyIsAltAccount;
  do
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(void *)v119 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void **)(*((void *)&v118 + 1) + 8 * i);
      if (v15)
      {
        v25 = pbb_bridge_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Single watch", buf, 2u);
        }

        if (![(COSPairedDeviceListDataSource *)v108 _deviceRequiresUpdate:v24])
        {
          uint64_t v28 = 3;
          goto LABEL_32;
        }
        uint64_t v126 = v105;
        v26 = +[NSArray arrayWithObjects:&v126 count:1];
        [v24 addPropertyObserver:v108 forPropertyChanges:v26];
      }
      else
      {
        if (![(COSPairedDeviceListDataSource *)v108 _deviceRequiresUpdate:*(void *)(*((void *)&v118 + 1) + 8 * i)])
        {
          v26 = pbb_bridge_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not single watch - Normal", buf, 2u);
          }
          uint64_t v28 = 1;
          goto LABEL_31;
        }
        uint64_t v125 = v105;
        v27 = +[NSArray arrayWithObjects:&v125 count:1];
        [v24 addPropertyObserver:v108 forPropertyChanges:v27];

        v26 = pbb_bridge_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not single watch - needs update", buf, 2u);
        }
      }
      uint64_t v28 = 6;
LABEL_31:

LABEL_32:
      v29 = +[NSNumber numberWithInteger:v28];
      id v30 = [(COSPairedDeviceListDataSource *)v108 newDeviceSpecifierForNRDevice:v24 enableCell:v21 deviceState:v29];

      v31 = [v24 valueForProperty:v22];
      unsigned int v32 = [v31 BOOLValue];

      v19 += v32 ^ 1;
      [v107 addObject:v30];
    }
    id v18 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
  }
  while (v18);

  BOOL v33 = v19 < 2;
  BOOL v5 = v102;
  CFStringRef v3 = v103;
  uint64_t v6 = v107;
  v34 = (id *)v108;
  if (!v33 && ![(COSPairedDeviceListDataSource *)v108 tinkerOnly])
  {
    id v16 = +[PSSpecifier emptyGroupSpecifier];
    v35 = +[NSBundle mainBundle];
    v36 = [v35 localizedStringForKey:@"MAGIC_SWITCH_FOOTER" value:&stru_100249230 table:@"Pairing"];
    [v16 setProperty:v36 forKey:PSFooterTextGroupKey];

    [v103 addObject:v16];
    v37 = +[NSBundle mainBundle];
    v38 = [v37 localizedStringForKey:@"MAGIC_SWITCH" value:&stru_100249230 table:@"Pairing"];
    v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:v108 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v39 setIdentifier:@"MagicSwitchSpecifier"];
    [v39 setProperty:@"com.apple.NanoRegistry" forKey:PSDefaultsKey];
    [v39 setProperty:@"EnableMagicSwitch" forKey:PSKeyNameKey];
    v40 = +[NSNumber numberWithBool:1];
    [v39 setProperty:v40 forKey:PSDefaultValueKey];

    [v39 setProperty:@"com.apple.NanoRegistry.MagicSwitchSettingsChanged" forKey:PSValueChangedNotificationKey];
    [v103 addObject:v39];

    goto LABEL_37;
  }
LABEL_38:
  if ([v6 count] && (objc_msgSend(v34, "tinkerOnly") & 1) == 0)
  {
    [v3 addObject:v104];
    [v3 addObjectsFromArray:v6];
  }
  [v34 setPairedDevicesGroupSpecifier:v104];
  [v34 setPairedDeviceSpecifiers:v6];
  v101 = [v34[7] migratableDevices];
  if ([v101 count] && (objc_msgSend(v34, "tinkerOnly") & 1) == 0)
  {
    v41 = +[NSMutableArray array];
    v42 = +[PSSpecifier emptyGroupSpecifier];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v43 = v101;
    id v44 = [v43 countByEnumeratingWithState:&v113 objects:v124 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v114;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v114 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v113 + 1) + 8 * (void)j);
          BOOL v49 = [(COSMigrationManager *)v108->_migrationManager currentState] != 0;
          v50 = +[NSNumber numberWithInteger:4];
          id v51 = [(COSPairedDeviceListDataSource *)v108 newDeviceSpecifierForNRDevice:v48 enableCell:v49 deviceState:v50];

          [v41 addObject:v51];
        }
        id v45 = [v43 countByEnumeratingWithState:&v113 objects:v124 count:16];
      }
      while (v45);
    }

    CFStringRef v3 = v103;
    [v103 addObject:v42];
    [v103 addObjectsFromArray:v41];

    BOOL v5 = v102;
    v34 = (id *)v108;
  }
  if ([v5 count])
  {
    if (![obj count])
    {
      v52 = +[PSSpecifier groupSpecifierWithID:@"ONLY_TINKER_INFO"];
      v53 = +[NSBundle mainBundle];
      v54 = [v53 localizedStringForKey:@"ONLY_TINKER_FOOTER" value:&stru_100249230 table:@"Localizable-tinker"];
      [v52 setProperty:v54 forKey:PSFooterTextGroupKey];

      [v3 addObject:v52];
    }
    v55 = +[NSMutableArray array];
    v56 = +[NSBundle mainBundle];
    v57 = [v56 localizedStringForKey:@"SATELLITE_PAIRED_GROUP_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
    v100 = +[PSSpecifier groupSpecifierWithID:@"SatellitePairedDeviceListGroup" name:v57];

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v58 = v5;
    id v59 = [v58 countByEnumeratingWithState:&v109 objects:v123 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v110;
      uint64_t v62 = NRDevicePropertyIsArchived;
      uint64_t v63 = NRDevicePropertyMaxPairingCompatibilityVersion;
      do
      {
        for (k = 0; k != v60; k = (char *)k + 1)
        {
          if (*(void *)v110 != v61) {
            objc_enumerationMutation(v58);
          }
          v65 = *(void **)(*((void *)&v109 + 1) + 8 * (void)k);
          v66 = [v65 valueForProperty:v62];
          unsigned __int8 v67 = [v66 BOOLValue];

          if (v67)
          {
            uint64_t v68 = 5;
          }
          else if ([(COSPairedDeviceListDataSource *)v108 _deviceRequiresUpdate:v65])
          {
            uint64_t v122 = v63;
            v69 = +[NSArray arrayWithObjects:&v122 count:1];
            [v65 addPropertyObserver:v108 forPropertyChanges:v69];

            uint64_t v68 = 6;
          }
          else
          {
            uint64_t v68 = 1;
          }
          v70 = +[NSNumber numberWithInteger:v68];
          id v71 = [(COSPairedDeviceListDataSource *)v108 newDeviceSpecifierForNRDevice:v65 enableCell:0 deviceState:v70];

          [v55 addObject:v71];
        }
        id v60 = [v58 countByEnumeratingWithState:&v109 objects:v123 count:16];
      }
      while (v60);
    }

    CFStringRef v3 = v103;
    [v103 addObject:v100];
    [v103 addObjectsFromArray:v55];
    v34 = (id *)v108;
    [(COSPairedDeviceListDataSource *)v108 setTinkerDevicesGroupSpecifier:v100];
    [(COSPairedDeviceListDataSource *)v108 setTinkerDeviceSpecifiers:v55];

    BOOL v5 = v102;
  }
  else
  {
    [v34 setTinkerDevicesGroupSpecifier:0];
    [v34 setTinkerDeviceSpecifiers:0];
  }
  [v34 updateSelectedWatch];
  v72 = [v34[7] migratableDevices];
  id v73 = [v72 count];

  if (v73)
  {
    v74 = +[PSSpecifier emptyGroupSpecifier];
    v75 = +[NSBundle mainBundle];
    v76 = [v75 localizedStringForKey:@"FINISH_PAIRING_FOOTER" value:&stru_100249230 table:@"Localizable-tinker"];
    uint64_t v77 = PSFooterTextGroupKey;
    [v74 setProperty:v76 forKey:PSFooterTextGroupKey];

    [v3 addObject:v74];
    v78 = +[NSBundle mainBundle];
    v79 = [v78 localizedStringForKey:@"FINISH_PAIRING" value:&stru_100249230 table:@"Pairing"];
    uint64_t v80 = +[PSSpecifier preferenceSpecifierNamed:v79 target:v108 set:0 get:0 detail:0 cell:13 edit:0];
    finishPairing = v108->_finishPairing;
    v108->_finishPairing = (PSSpecifier *)v80;

    v34 = (id *)v108;
    [(PSSpecifier *)v108->_finishPairing setButtonAction:"startMigration"];
    [(PSSpecifier *)v108->_finishPairing setIdentifier:@"FinishPairing"];
    v82 = &__kCFBooleanTrue;
    if ([(COSMigrationManager *)v108->_migrationManager currentState]
      && (id)[(COSMigrationManager *)v108->_migrationManager currentState] != (id)4)
    {
      v82 = &__kCFBooleanFalse;
    }
    [(PSSpecifier *)v108->_finishPairing setProperty:v82 forKey:PSEnabledKey];
    [v3 addObject:v108->_finishPairing];
  }
  else
  {
    uint64_t v77 = PSFooterTextGroupKey;
  }
  v83 = +[PSSpecifier emptyGroupSpecifier];
  v84 = +[NSBundle mainBundle];
  v85 = [v84 localizedStringForKey:@"PAIR_NEW_WATCH_FOOTER" value:&stru_100249230 table:@"Localizable-tinker"];
  [v83 setProperty:v85 forKey:v77];

  [v3 addObject:v83];
  int v86 = sub_100033338();
  v87 = @"PAIR_A_NEW_APPLE_WATCH";
  if (v86) {
    v87 = @"PAIR_A_NEW_APPLE_WATCH_GT";
  }
  v88 = v87;
  v89 = +[NSBundle mainBundle];
  v90 = [v89 localizedStringForKey:v88 value:&stru_100249230 table:@"Pairing"];

  uint64_t v91 = +[PSSpecifier preferenceSpecifierNamed:v90 target:v34 set:0 get:0 detail:objc_opt_class() cell:13 edit:0];
  id v92 = v34[8];
  v34[8] = (id)v91;

  [v34[8] setButtonAction:"presentNewPairingFlowIfPossible"];
  [v34[8] setIdentifier:@"PairNewWatchSpecifier"];
  if ([v34[7] currentState])
  {
    id v93 = [v34[7] currentState];
    uint64_t v94 = PSEnabledKey;
    v95 = v107;
    if (v93 != (id)4)
    {
      id v96 = v34[8];
      v97 = &__kCFBooleanFalse;
      goto LABEL_81;
    }
  }
  else
  {
    uint64_t v94 = PSEnabledKey;
    v95 = v107;
  }
  id v96 = v34[8];
  v97 = &__kCFBooleanTrue;
LABEL_81:
  [v96 setProperty:v97 forKey:v94];
  [v3 addObject:v34[8]];
  if (sub_100032420())
  {
    v98 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v98];
    v99 = +[PSSpecifier preferenceSpecifierNamed:@"Automation" target:v34 set:0 get:0 detail:0 cell:13 edit:0];
    [v99 setButtonAction:"presentInternalFlow"];
    [v3 addObject:v99];
  }
}

- (BOOL)_deviceRequiresUpdate:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 valueForProperty:_NRDevicePropertyCompatibilityState];
    unsigned int v6 = [v5 intValue];

    if (v6 == 2)
    {
      uint64_t v7 = pbb_setupflow_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v4 pairingID];
        int v14 = 138412290;
        int v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device: %@ has compatibility state NRCompatibilityStateUpdate, requires update", (uint8_t *)&v14, 0xCu);
      }
      char v9 = 1;
    }
    else
    {
      id v10 = [v4 valueForProperty:NRDevicePropertyMaxPairingCompatibilityVersion];
      [v10 integerValue];

      uint64_t v7 = [v4 valueForProperty:NRDevicePropertyChipID];
      char v11 = _BPSIsPairingCompatible();
      if ((v11 & 1) == 0)
      {
        id v12 = pbb_setupflow_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1001742AC(v4, v12);
        }
      }
      char v9 = v11 ^ 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)updateSelectedWatch
{
  id v3 = [(COSPairedDeviceListDataSource *)self pairedDevicesGroupSpecifier];

  if (v3)
  {
    unint64_t v4 = [(COSPairedDeviceListDataSource *)self pairedDevicesGroupSpecifier];
    BOOL v5 = [(COSPairedDeviceListDataSource *)self pairedDeviceSpecifiers];
    [(COSPairedDeviceListDataSource *)self _updateSelectedWatchInGroupSpecifier:v4 deviceSpecifiers:v5];
  }
  unsigned int v6 = [(COSPairedDeviceListDataSource *)self tinkerDevicesGroupSpecifier];

  if (v6)
  {
    id v8 = [(COSPairedDeviceListDataSource *)self tinkerDevicesGroupSpecifier];
    uint64_t v7 = [(COSPairedDeviceListDataSource *)self tinkerDeviceSpecifiers];
    [(COSPairedDeviceListDataSource *)self _updateSelectedWatchInGroupSpecifier:v8 deviceSpecifiers:v7];
  }
}

- (void)_updateSelectedWatchInGroupSpecifier:(id)a3 deviceSpecifiers:(id)a4
{
  id v28 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  char v27 = 0;
  uint64_t v8 = *(void *)v31;
  uint64_t v9 = NRDevicePropertyIsActive;
  uint64_t v25 = PSTableCellKey;
  uint64_t v26 = PSRadioGroupCheckedSpecifierKey;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(obj);
      }
      char v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      id v12 = [v11 propertyForKey:@"COSAssociatedDevice"];
      id v13 = [(COSPairedDeviceListDataSource *)self loadingDevice];
      unsigned __int8 v14 = [v13 isEqual:v12];

      if (v14)
      {
        CFStringRef v15 = @"LOADING_WATCH_ITEM";
      }
      else
      {
        id v16 = [v12 valueForProperty:v9];
        unsigned int v17 = [v16 BOOLValue];

        CFStringRef v15 = @"INACTIVE_WATCH_ITEM";
        if (v17)
        {
          [v28 setProperty:v11 forKey:v26];
          id v18 = [v11 propertyForKey:v25];
          char v27 = 1;
          [v18 setChecked:1];

          CFStringRef v15 = @"ACTIVE_WATCH_ITEM";
        }
      }
      [v11 setIdentifier:v15];
    }
    id v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v7);
  if ((v27 & 1) == 0)
  {
LABEL_13:
    uint64_t v19 = pbb_bridge_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v28 identifier];
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No active watch found in group with ID: %{public}@. Setting no selected watch.", buf, 0xCu);
    }
    uint64_t v21 = PSRadioGroupCheckedSpecifierKey;
    uint64_t v22 = [v28 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = [v22 propertyForKey:PSTableCellKey];
      [v24 setChecked:0];
    }
    [v28 setProperty:0 forKey:v21];
  }
}

- (void)deviceBecameActive
{
  loadingDevice = self->_loadingDevice;
  if (loadingDevice)
  {
    unint64_t v4 = [(NRDevice *)loadingDevice valueForProperty:NRDevicePropertyIsAltAccount];
    unsigned __int8 v5 = [v4 BOOLValue];

    if (v5) {
      return;
    }
    id v6 = self->_loadingDevice;
  }
  else
  {
    id v6 = 0;
  }
  self->_loadingDevice = 0;

  [(COSPairedDeviceListDataSource *)self updateSelectedWatch];
}

- (void)presentNewPairingFlowIfPossible
{
  +[PBBridgeCAReporter incrementSuccessType:20];
  id v2 = +[UIApplication sharedApplication];
  [v2 presentNewPairingFlowIfPossible];
}

- (void)presentInternalFlow
{
  id v2 = +[UIApplication sharedApplication];
  [v2 tappedStartInternal];
}

- (void)startMigration
{
  [(COSMigrationManager *)self->_migrationManager startMigration];

  [(COSPairedDeviceListDataSource *)self reloadSpecifiers];
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "self: (%p); device: (%@); property: (%@); fromValue: (%@)",
      buf,
      0x2Au);
  }

  uint64_t v12 = NRDevicePropertyMaxPairingCompatibilityVersion;
  if ([v9 isEqualToString:NRDevicePropertyMaxPairingCompatibilityVersion])
  {
    uint64_t v14 = v12;
    id v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v8 removePropertyObserver:self forPropertyChanges:v13];

    [(COSPairedDeviceListDataSource *)self reloadSpecifiers];
  }
}

- (BOOL)tinkerOnly
{
  return self->_tinkerOnly;
}

- (void)setTinkerOnly:(BOOL)a3
{
  self->_tinkerOnly = a3;
}

- (NRDevice)loadingDevice
{
  return self->_loadingDevice;
}

- (void)setLoadingDevice:(id)a3
{
}

- (PSSpecifier)pairedDevicesGroupSpecifier
{
  return self->_pairedDevicesGroupSpecifier;
}

- (void)setPairedDevicesGroupSpecifier:(id)a3
{
}

- (NSArray)pairedDeviceSpecifiers
{
  return self->_pairedDeviceSpecifiers;
}

- (void)setPairedDeviceSpecifiers:(id)a3
{
}

- (PSSpecifier)tinkerDevicesGroupSpecifier
{
  return self->_tinkerDevicesGroupSpecifier;
}

- (void)setTinkerDevicesGroupSpecifier:(id)a3
{
}

- (NSArray)tinkerDeviceSpecifiers
{
  return self->_tinkerDeviceSpecifiers;
}

- (void)setTinkerDeviceSpecifiers:(id)a3
{
}

- (COSMigrationManager)migrationManager
{
  return self->_migrationManager;
}

- (void)setMigrationManager:(id)a3
{
}

- (PSSpecifier)pairNew
{
  return self->_pairNew;
}

- (void)setPairNew:(id)a3
{
}

- (PSSpecifier)finishPairing
{
  return self->_finishPairing;
}

- (void)setFinishPairing:(id)a3
{
}

- (id)displaySoftwareUpdate
{
  return self->_displaySoftwareUpdate;
}

- (void)setDisplaySoftwareUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displaySoftwareUpdate, 0);
  objc_storeStrong((id *)&self->_finishPairing, 0);
  objc_storeStrong((id *)&self->_pairNew, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_tinkerDeviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_tinkerDevicesGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_pairedDeviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_pairedDevicesGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_loadingDevice, 0);
}

@end