@interface COSPairingDataSource
+ (BOOL)useConnectedDevice;
- (BOOL)allowsMarkAsMissing;
- (BOOL)enableUnpairButtons;
- (BOOL)migrationDevice;
- (BOOL)shouldQueryWatchForDetails;
- (BOOL)tinkerDevice;
- (FAFamilyMember)deviceUser;
- (id)deviceUserAppleID:(id)a3;
- (id)specifiersForSpecifier:(id)a3 observer:(id)a4;
- (void)confirmUnpairingForSpecifier:(id)a3;
- (void)confirmUnpairingMissingForSpecifier:(id)a3;
- (void)jumpToFindMyApp;
- (void)loadSpecifiers;
- (void)setAllowsMarkAsMissing:(BOOL)a3;
- (void)setDeviceUser:(id)a3;
- (void)setEnableUnpairButtons:(BOOL)a3;
- (void)setMigrationDevice:(BOOL)a3;
- (void)setTinkerDevice:(BOOL)a3;
- (void)tinkeriForgot;
@end

@implementation COSPairingDataSource

+ (BOOL)useConnectedDevice
{
  return 0;
}

- (BOOL)shouldQueryWatchForDetails
{
  return !self->_migrationDevice;
}

- (void)setDeviceUser:(id)a3
{
  p_deviceUser = &self->_deviceUser;
  objc_storeStrong((id *)&self->_deviceUser, a3);
  if (*p_deviceUser)
  {
    [(COSPairingDataSource *)self reloadSpecifiers];
  }
}

- (void)setAllowsMarkAsMissing:(BOOL)a3
{
  self->_allowsMarkAsMissing = a3;
  [(COSPairingDataSource *)self reloadSpecifiers];
}

- (void)setEnableUnpairButtons:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enableUnpairButtons = a3;
  v5 = [(COSPairingDataSource *)self specifiers];
  id v11 = [v5 specifierForID:@"unpair"];

  v6 = [(COSPairingDataSource *)self specifiers];
  v7 = [v6 specifierForID:@"unpair-missing"];

  v8 = +[NSNumber numberWithBool:v3];
  uint64_t v9 = PSEnabledKey;
  [v11 setProperty:v8 forKey:PSEnabledKey];

  v10 = +[NSNumber numberWithBool:v3];
  [v7 setProperty:v10 forKey:v9];

  [(COSPairingDataSource *)self reloadSpecifiers];
}

- (void)jumpToFindMyApp
{
  sub_1000232A4((id *)self);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 jumpToFindMyApp];
}

- (void)tinkeriForgot
{
  sub_1000232A4((id *)self);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 tinkeriForgot];
}

- (void)confirmUnpairingMissingForSpecifier:(id)a3
{
  id v4 = a3;
  sub_1000232A4((id *)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 confirmUnpairingMissingForSpecifier:v4];
}

- (id)deviceUserAppleID:(id)a3
{
  BOOL v3 = [(COSPairingDataSource *)self deviceUser];
  id v4 = [v3 appleID];

  return v4;
}

- (void)confirmUnpairingForSpecifier:(id)a3
{
  id v4 = a3;
  sub_1000232A4((id *)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 confirmUnpairingForSpecifier:v4];
}

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 propertyForKey:@"COSAssociatedDevice"];
  [(COSAboutDataSource *)self setDevice:v8];

  [(COSAboutDataSource *)self checkDeviceHasCellularCapability];
  v11.receiver = self;
  v11.super_class = (Class)COSPairingDataSource;
  uint64_t v9 = [(COSAboutDataSource *)&v11 specifiersForSpecifier:v7 observer:v6];

  return v9;
}

- (void)loadSpecifiers
{
  v84.receiver = self;
  v84.super_class = (Class)COSPairingDataSource;
  [(COSAboutDataSource *)&v84 loadSpecifiers];
  BOOL v3 = [(COSPairingDataSource *)self specifiers];
  id v4 = ASDPurchase_ptr;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"GIZMO_HEADER" value:&stru_100249230 table:@"Pairing"];
  uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"PairingGroup" name:v6];

  v82 = (void *)v7;
  [v3 insertObject:v7 atIndex:0];
  v8 = sub_100014784();
  id v9 = [v8 count];

  v10 = &selRef_initWithStyle_reuseIdentifier_specifier_updateIcon_showLearnMore_delegate_;
  if ((v9 || self->_migrationDevice)
    && (+[NRPairedDeviceRegistry sharedInstance],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 status],
        v11,
        v12 == (id)2))
  {
    unsigned int v80 = 1;
  }
  else
  {
    v13 = pbb_manualunpairing_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[NSNumber numberWithInt:v9 != 0];
      v15 = +[NRPairedDeviceRegistry sharedInstance];
      v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 status]);
      v17 = +[NRPairedDeviceRegistry sharedInstance];
      v18 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v17 compatibilityState]);
      BOOL migrationDevice = self->_migrationDevice;
      *(_DWORD *)buf = 136316162;
      v86 = "-[COSPairingDataSource loadSpecifiers]";
      __int16 v87 = 2112;
      v88 = v14;
      __int16 v89 = 2112;
      v90 = v16;
      __int16 v91 = 2112;
      v92 = v18;
      __int16 v93 = 1024;
      BOOL v94 = migrationDevice;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unpair Buttons Disabled (%s) IsPaired: %@ / NR Status %@ / NR Compatibility State %@ MigrationDevice: %{BOOL}d", buf, 0x30u);

      id v4 = ASDPurchase_ptr;
    }

    unsigned int v80 = 0;
  }
  if (self->_tinkerDevice)
  {
    v20 = +[NSFileManager defaultManager];
    unsigned int v21 = [v20 fileExistsAtPath:@"/System/Library/NanoPreferenceBundles/General/SchoolTimePhoneSettings.bundle"];

    uint64_t v22 = +[PSSpecifier emptyGroupSpecifier];
    v23 = (void *)v22;
    if (v21)
    {
      v24 = (void *)v22;
      v25 = v3;
      v26 = +[NSBundle bundleWithPath:@"/System/Library/NanoPreferenceBundles/General/SchoolTimePhoneSettings.bundle"];
      if (([v26 isLoaded] & 1) == 0) {
        [v26 load];
      }
      v27 = +[NSBundle mainBundle];
      v28 = [v27 localizedStringForKey:@"SCHOOLTIME" value:&stru_100249230 table:@"Localizable-tinker"];
      v29 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, 0, [v26 principalClass], 2, 0);

      id v4 = ASDPurchase_ptr;
      [v29 setIdentifier:@"SCHOOLTIME"];
      v30 = [(COSAboutDataSource *)self device];
      [v29 setProperty:v30 forKey:@"COSAssociatedDevice"];

      BOOL v3 = v25;
      v23 = v24;
      [v25 addObject:v24];
      v83 = v29;
      [v25 addObject:v29];

      v10 = &selRef_initWithStyle_reuseIdentifier_specifier_updateIcon_showLearnMore_delegate_;
    }
    else
    {
      v83 = 0;
    }
  }
  else
  {
    v83 = 0;
    v23 = 0;
  }
  v81 = v23;
  if (+[COSFindMyController isDeviceLocatorEnabled])
  {
    v31 = [(COSAboutDataSource *)self device];
    int HasCapabilityForString = BPSDeviceHasCapabilityForString();

    if (HasCapabilityForString)
    {
      v33 = [v4[223] groupSpecifierWithID:@"FIND_MY_WATCH_GROUP_ID"];
      v34 = +[NSBundle mainBundle];
      [v34 localizedStringForKey:@"FIND_MY_WATCH_GROUP_FOOTER" value:&stru_100249230 table:@"Pairing"];
      v36 = v35 = v3;
      [v33 setProperty:v36 forKey:PSFooterTextGroupKey];

      [v35 addObject:v33];
      v37 = v4[223];
      v38 = +[NSBundle mainBundle];
      v39 = [v38 localizedStringForKey:@"FIND_MY_WATCH" value:&stru_100249230 table:@"Pairing"];
      v40 = [v37 preferenceSpecifierNamed:v39 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v40 setButtonAction:"jumpToFindMyApp"];
LABEL_21:
      [v35 addObject:v40];

      BOOL v3 = v35;
      id v4 = ASDPurchase_ptr;
      v23 = v81;
      goto LABEL_22;
    }
    if (self->_allowsMarkAsMissing)
    {
      v41 = [(COSAboutDataSource *)self device];
      int v42 = BPSDeviceHasCapabilityForString();

      if (v42)
      {
        v33 = [v4[223] groupSpecifierWithID:@"UNPAIR_MISSING_GROUP_ID"];
        [v3 addObject:v33];
        v43 = v4[223];
        v44 = +[NSBundle mainBundle];
        [v44 localizedStringForKey:@"UNPAIR_MISSING" value:&stru_100249230 table:@"Pairing"];
        v45 = v35 = v3;
        v40 = [v43 preferenceSpecifierNamed:v45 target:self set:0 get:0 detail:0 cell:1 edit:0];

        [v40 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v40 setProperty:&__kCFBooleanTrue forKey:PSHidesDisclosureIndicatorKey];
        [v40 setControllerLoadAction:"confirmUnpairingMissingForSpecifier:"];
        v46 = +[NSNumber numberWithBool:v80];
        [v40 setProperty:v46 forKey:PSEnabledKey];

        [v40 setIdentifier:@"unpair-missing"];
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v47 = *((int *)v10 + 203);
  if (self->super.PSSpecifierDataSource_opaque[v47] && v23) {
    [v83 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  if (self->_tinkerDevice)
  {
    v48 = [(COSPairingDataSource *)self deviceUser];

    v49 = v4[223];
    if (v48)
    {
      v50 = +[NSBundle mainBundle];
      v51 = [v50 localizedStringForKey:@"TINKER_IFORGOT_HEADER" value:&stru_100249230 table:@"Localizable-tinker"];
      v79 = [v49 groupSpecifierWithID:@"TinkeriForgotGroup" name:v51];

      v52 = +[NSBundle mainBundle];
      v53 = [v52 localizedStringForKey:@"TINKER_IFORGOT_FOOTER" value:&stru_100249230 table:@"Localizable-tinker"];
      v54 = [(COSPairingDataSource *)self deviceUser];
      v55 = [v54 firstName];
      [v55 capitalizedString];
      uint64_t v56 = v47;
      v58 = v57 = v3;
      v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v58);

      BOOL v3 = v57;
      uint64_t v47 = v56;
      v60 = v79;

      id v4 = ASDPurchase_ptr;
      [v79 setProperty:v59 forKey:PSFooterTextGroupKey];
      [v3 addObject:v79];
      v61 = [(COSPairingDataSource *)self deviceUser];
      v62 = [v61 fullName];
      v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:self set:0 get:"deviceUserAppleID:" detail:0 cell:4 edit:0];

      [v63 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v3 addObject:v63];
      v64 = +[NSBundle mainBundle];
      v65 = [v64 localizedStringForKey:@"TINKER_IFORGOT_DEVICE" value:&stru_100249230 table:@"Localizable-tinker"];
      v66 = +[PSSpecifier preferenceSpecifierNamed:v65 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v66 setButtonAction:"tinkeriForgot"];
      [v66 setIdentifier:@"tinker-iforgot"];
      [v3 addObject:v66];
    }
    else
    {
      v60 = [v4[223] groupSpecifierWithID:@"TinkeriForgotGroup"];
      [v3 addObject:v60];
      v67 = v4[223];
      v68 = +[NSBundle mainBundle];
      v69 = [v68 localizedStringForKey:@"TINKER_IFORGOT_DEVICE_NO_MEMBER_FOUND" value:&stru_100249230 table:@"Localizable-tinker"];
      v59 = [v67 preferenceSpecifierNamed:v69 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v59 setButtonAction:"tinkeriForgot"];
      [v59 setIdentifier:@"tinker-iforgot"];
      [v3 addObject:v59];
    }

    v23 = v81;
  }
  if (PBStoreDemoContentIsFrozen())
  {
    v70 = pbb_bridge_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Hiding Unpairing Options for Retail Better Together device", buf, 2u);
    }
  }
  else
  {
    v70 = [v4[223] groupSpecifierWithID:@"UnpairGroup"];
    [v3 addObject:v70];
    v71 = v4[223];
    int v72 = self->super.PSSpecifierDataSource_opaque[v47];
    v73 = +[NSBundle mainBundle];
    v74 = v73;
    if (v72) {
      CFStringRef v75 = @"FORGET_MIGRATION_DEVICE";
    }
    else {
      CFStringRef v75 = @"UNPAIR";
    }
    v76 = [v73 localizedStringForKey:v75 value:&stru_100249230 table:@"Pairing"];
    v77 = [v71 preferenceSpecifierNamed:v76 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v77 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v77 setProperty:&__kCFBooleanTrue forKey:PSHidesDisclosureIndicatorKey];
    [v77 setControllerLoadAction:"confirmUnpairingForSpecifier:"];
    v78 = +[NSNumber numberWithBool:v80];
    [v77 setProperty:v78 forKey:PSEnabledKey];

    [v77 setIdentifier:@"unpair"];
    [v3 addObject:v77];
  }
}

- (FAFamilyMember)deviceUser
{
  return self->_deviceUser;
}

- (BOOL)allowsMarkAsMissing
{
  return self->_allowsMarkAsMissing;
}

- (BOOL)tinkerDevice
{
  return self->_tinkerDevice;
}

- (void)setTinkerDevice:(BOOL)a3
{
  self->_tinkerDevice = a3;
}

- (BOOL)migrationDevice
{
  return self->_migrationDevice;
}

- (void)setMigrationDevice:(BOOL)a3
{
  self->_BOOL migrationDevice = a3;
}

- (BOOL)enableUnpairButtons
{
  return self->_enableUnpairButtons;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingController);

  objc_storeStrong((id *)&self->_deviceUser, 0);
}

@end