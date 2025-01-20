@interface COSAirplaneModeController
+ (BOOL)isMirroring;
- (BOOL)airplaneModeSettingsLoaded;
- (BOOL)bluetoothWithAirplaneMode;
- (BOOL)wifiWithAirplaneMode;
- (COSAirplaneModeController)init;
- (NSSManager)nssManager;
- (id)bluetoothOn:(id)a3;
- (id)disableAPMSettings:(id)a3;
- (id)specifiers;
- (id)wifiOn:(id)a3;
- (void)_recheckAPMSettings;
- (void)changeAirplaneModeSettings;
- (void)dealloc;
- (void)hideSettingsForMirrorOn;
- (void)retrieveAirplaneModeSettings;
- (void)setAirplaneModeSettingsLoaded:(BOOL)a3;
- (void)setBluetoothOn:(id)a3 specifier:(id)a4;
- (void)setBluetoothWithAirplaneMode:(BOOL)a3;
- (void)setMirror:(id)a3 specifier:(id)a4;
- (void)setNssManager:(id)a3;
- (void)setWifiOn:(id)a3 specifier:(id)a4;
- (void)setWifiWithAirplaneMode:(BOOL)a3;
- (void)updateSettingsSpecifiersForChanges:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSAirplaneModeController

- (COSAirplaneModeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)COSAirplaneModeController;
  v2 = [(COSAirplaneModeController *)&v7 init];
  if (v2)
  {
    v3 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
    nssManager = v2->_nssManager;
    v2->_nssManager = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000ED624, NSSAirplaneModeSettingsChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, NSSAirplaneModeSettingsChangedNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)COSAirplaneModeController;
  [(COSAirplaneModeController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(COSAirplaneModeController *)self loadSpecifiersFromPlistName:@"AirplaneMode" target:self];
    BOOL v6 = [(COSAirplaneModeController *)self airplaneModeSettingsLoaded];
    if (+[COSAirplaneModeController isMirroring])
    {
      objc_super v7 = [v5 objectAtIndexedSubscript:0];
      v35[0] = v7;
      v8 = [v5 objectAtIndexedSubscript:1];
      v35[1] = v8;
      v9 = +[NSArray arrayWithObjects:v35 count:2];
      uint64_t v10 = +[NSMutableArray arrayWithArray:v9];

      uint64_t v11 = v10;
    }
    else
    {
      SFLocalizableWAPIStringKeyForKey();
      uint64_t v12 = v30 = v6;
      v34 = v5;
      uint64_t v13 = +[PSSpecifier groupSpecifierWithID:@"NANO_WIFI_AIRPLANE_MODE_GROUP"];
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v33 = (void *)v12;
      v15 = [v14 localizedStringForKey:v12 value:&stru_100249230 table:@"AirplaneMode"];
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setWifiOn:specifier:" get:"wifiOn:" detail:0 cell:6 edit:0];

      v17 = +[NSNumber numberWithBool:v6];
      uint64_t v29 = PSEnabledKey;
      [v16 setProperty:v17 forKey:];

      [v16 setIdentifier:@"WIFI_ON"];
      v32 = (void *)v13;
      [v34 addObject:v13];
      v31 = v16;
      [v34 addObject:v16];
      v18 = +[PSSpecifier groupSpecifierWithID:@"NANO_BLUETOOTH_AIRPLANE_MODE_GROUP"];
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"NANO_BLUETOOTH_AIRPLANE_MODE_FOOTER" value:&stru_100249230 table:@"AirplaneMode"];
      [v18 setProperty:v20 forKey:PSFooterTextGroupKey];

      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"NANO_BLUETOOTH_AIRPLANE_MODE" value:&stru_100249230 table:@"AirplaneMode"];
      v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"setBluetoothOn:specifier:" get:"bluetoothOn:" detail:0 cell:6 edit:0];

      uint64_t v11 = (uint64_t)v34;
      v24 = +[NSNumber numberWithBool:v30];
      [v23 setProperty:v24 forKey:v29];

      [v23 setIdentifier:@"BLUETOOTH_ON"];
      [v34 addObject:v18];
      [v34 addObject:v23];
      if (!v30)
      {
        [(COSAirplaneModeController *)self setBluetoothWithAirplaneMode:0];
        [(COSAirplaneModeController *)self setWifiWithAirplaneMode:0];
        v25 = [(COSAirplaneModeController *)self disableAPMSettings:v34];
        id v26 = [v25 mutableCopy];

        uint64_t v11 = (uint64_t)v26;
      }
    }
    v27 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v11;

    objc_super v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSAirplaneModeController;
  [(COSAirplaneModeController *)&v4 viewWillAppear:a3];
  [(COSAirplaneModeController *)self setAirplaneModeSettingsLoaded:0];
  [(COSAirplaneModeController *)self retrieveAirplaneModeSettings];
}

- (void)setMirror:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  sub_100031E00(@"com.apple.nano", @"mirror-airplane", v5);
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    [(COSAirplaneModeController *)self hideSettingsForMirrorOn];
  }
  else
  {
    [(COSAirplaneModeController *)self addSettingsForMirrorOff];
  }
}

- (void)hideSettingsForMirrorOn
{
  uint64_t v3 = [(COSAirplaneModeController *)self specifierForID:@"WIFI_ON"];
  [(COSAirplaneModeController *)self removeSpecifier:v3 animated:1];

  objc_super v4 = [(COSAirplaneModeController *)self specifierForID:@"BLUETOOTH_ON"];
  [(COSAirplaneModeController *)self removeSpecifier:v4 animated:1];

  id v5 = [(COSAirplaneModeController *)self specifierForID:@"NANO_BLUETOOTH_AIRPLANE_MODE_GROUP"];
  [(COSAirplaneModeController *)self removeSpecifier:v5 animated:1];

  id v6 = [(COSAirplaneModeController *)self specifierForID:@"NANO_WIFI_AIRPLANE_MODE_GROUP"];
  [(COSAirplaneModeController *)self removeSpecifier:v6 animated:1];
}

- (id)bluetoothOn:(id)a3
{
  BOOL v3 = [(COSAirplaneModeController *)self bluetoothWithAirplaneMode];

  return +[NSNumber numberWithBool:v3];
}

- (void)setBluetoothOn:(id)a3 specifier:(id)a4
{
  -[COSAirplaneModeController setBluetoothWithAirplaneMode:](self, "setBluetoothWithAirplaneMode:", [a3 BOOLValue]);
  -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"48DB09AC-404A-4F1D-8952-61DCA0277C32"];
  unsigned int v6 = [v8 supportsCapability:v5];

  if (v6)
  {
    if ([(COSAirplaneModeController *)self bluetoothWithAirplaneMode]) {
      objc_super v7 = @"on";
    }
    else {
      objc_super v7 = @"off";
    }
    sub_100031E00(@"com.apple.BTServer", @"defaultAirplaneModePowerState", v7);
  }
  else
  {
    [(COSAirplaneModeController *)self changeAirplaneModeSettings];
  }
}

- (id)wifiOn:(id)a3
{
  BOOL v3 = [(COSAirplaneModeController *)self wifiWithAirplaneMode];

  return +[NSNumber numberWithBool:v3];
}

- (void)setWifiOn:(id)a3 specifier:(id)a4
{
  -[COSAirplaneModeController setWifiWithAirplaneMode:](self, "setWifiWithAirplaneMode:", [a3 BOOLValue]);
  -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"48DB09AC-404A-4F1D-8952-61DCA0277C32"];
  unsigned int v6 = [v8 supportsCapability:v5];

  if (v6)
  {
    objc_super v7 = +[NSNumber numberWithBool:[(COSAirplaneModeController *)self wifiWithAirplaneMode]];
    sub_100031E00(@"com.apple.nanosystemsettings", @"NanoSettingsWifiAirplaneModeKey", v7);
  }
  else
  {
    [(COSAirplaneModeController *)self changeAirplaneModeSettings];
  }
}

- (void)retrieveAirplaneModeSettings
{
  BOOL v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"48DB09AC-404A-4F1D-8952-61DCA0277C32"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000EE0C0;
    v11[3] = &unk_100245B10;
    v11[4] = self;
    sub_100032108(@"com.apple.nanosystemsettings", @"NanoSettingsWifiAirplaneModeKey", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EE0F8;
    v10[3] = &unk_100245B10;
    v10[4] = self;
    sub_100032108(@"com.apple.BTServer", @"defaultAirplaneModePowerState", v10);
  }
  else
  {
    objc_initWeak(&location, self);
    nssManager = self->_nssManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000EE1B8;
    v7[3] = &unk_100243F08;
    objc_copyWeak(&v8, &location);
    [(NSSManager *)nssManager retrieveAirplaneModeSettingsWithCompletionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_recheckAPMSettings
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asked by gizmo to retrieve apm settings for a change", v4, 2u);
  }

  [(COSAirplaneModeController *)self retrieveAirplaneModeSettings];
}

- (void)changeAirplaneModeSettings
{
  v12[0] = kNSSAirplaneModeBluetoothKey;
  BOOL v3 = +[NSNumber numberWithBool:[(COSAirplaneModeController *)self bluetoothWithAirplaneMode]];
  v13[0] = v3;
  v12[1] = kNSSAirplaneModeWifiKey;
  id v4 = +[NSNumber numberWithBool:[(COSAirplaneModeController *)self wifiWithAirplaneMode]];
  v13[1] = v4;
  v12[2] = kNSSAirplaneModeCellularKey;
  v13[2] = &__kCFBooleanFalse;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  objc_initWeak(&location, self);
  unsigned int v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Change apm settings", buf, 2u);
  }

  nssManager = self->_nssManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EE680;
  v8[3] = &unk_100243F08;
  objc_copyWeak(&v9, &location);
  [(NSSManager *)nssManager setAirplaneModeSettings:v5 withCompletionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateSettingsSpecifiersForChanges:(id)a3
{
  uint64_t v4 = kNSSAirplaneModeBluetoothKey;
  id v5 = a3;
  unsigned int v6 = [v5 objectForKey:v4];
  id v7 = [v6 BOOLValue];

  id v8 = [v5 objectForKey:kNSSAirplaneModeWifiKey];

  id v9 = [v8 BOOLValue];
  if (v7 != [(COSAirplaneModeController *)self bluetoothWithAirplaneMode])
  {
    [(COSAirplaneModeController *)self setBluetoothWithAirplaneMode:v7];
    uint64_t v10 = [(COSAirplaneModeController *)self specifierForID:@"BLUETOOTH_ON"];
    if (v10) {
      [(COSAirplaneModeController *)self reloadSpecifier:v10];
    }
  }
  if (v9 != [(COSAirplaneModeController *)self wifiWithAirplaneMode])
  {
    [(COSAirplaneModeController *)self setWifiWithAirplaneMode:v9];
    uint64_t v11 = [(COSAirplaneModeController *)self specifierForID:@"WIFI_ON"];
    if (v11)
    {
      uint64_t v12 = v11;
      [(COSAirplaneModeController *)self reloadSpecifier:v11];
      uint64_t v11 = v12;
    }
  }
}

- (id)disableAPMSettings:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = PSIDKey;
    uint64_t v7 = PSEnabledKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 propertyForKey:v6];
        if ([v10 isEqualToString:@"WIFI_ON"])
        {
        }
        else
        {
          uint64_t v11 = [v9 propertyForKey:v6];
          unsigned int v12 = [v11 isEqualToString:@"BLUETOOTH_ON"];

          if (!v12) {
            continue;
          }
        }
        [v9 setProperty:&__kCFBooleanFalse forKey:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return obj;
}

+ (BOOL)isMirroring
{
  char v7 = 0;
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano"];
  id v3 = [v2 synchronize];
  unsigned __int8 v4 = [v2 BOOLForKey:@"mirror-airplane" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (BOOL)bluetoothWithAirplaneMode
{
  return self->_bluetoothWithAirplaneMode;
}

- (void)setBluetoothWithAirplaneMode:(BOOL)a3
{
  self->_bluetoothWithAirplaneMode = a3;
}

- (BOOL)wifiWithAirplaneMode
{
  return self->_wifiWithAirplaneMode;
}

- (void)setWifiWithAirplaneMode:(BOOL)a3
{
  self->_wifiWithAirplaneMode = a3;
}

- (BOOL)airplaneModeSettingsLoaded
{
  return self->_airplaneModeSettingsLoaded;
}

- (void)setAirplaneModeSettingsLoaded:(BOOL)a3
{
  self->_airplaneModeSettingsLoaded = a3;
}

- (void).cxx_destruct
{
}

@end