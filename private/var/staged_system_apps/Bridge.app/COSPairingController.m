@interface COSPairingController
+ (Class)aboutDataSourceClass;
- (AKAppleIDAuthenticationController)authController;
- (AKAppleIDAuthenticationInAppContext)authContext;
- (COSPairingController)init;
- (NRDevice)device;
- (NSString)activelyLoadingSpecifierIdentifier;
- (PSSpecifier)specifierBeingConfirmed;
- (id)aboutDataSource;
- (id)selectSpecifier:(id)a3;
- (void)_applicationResumed:(id)a3;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopSpinnerInActiveSpecifier;
- (void)cancelledUnpair;
- (void)confirmUnpairingForSpecifier:(id)a3;
- (void)confirmUnpairingMissingForSpecifier:(id)a3;
- (void)confirmedUnpair;
- (void)confirmedUnpairAndMarkAsMissing:(BOOL)a3;
- (void)confirmedUnpairMissing;
- (void)enableDisableUnpairButton:(unint64_t)a3;
- (void)handleUnpairNotification:(id)a3;
- (void)jumpToFindMyApp;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)setActivelyLoadingSpecifierIdentifier:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setDevice:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setSpecifierBeingConfirmed:(id)a3;
- (void)tinkeriForgot;
@end

@implementation COSPairingController

+ (Class)aboutDataSourceClass
{
  return (Class)objc_opt_class();
}

- (id)aboutDataSource
{
  return +[COSPairingDataSource sharedInstance];
}

- (COSPairingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSPairingController;
  v2 = [(COSPairingController *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_applicationResumed:" name:UIApplicationResumedNotification object:0];
  }
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:PSDataSourceClassKey];

  v24.receiver = self;
  v24.super_class = (Class)COSPairingController;
  [(COSPairingController *)&v24 setSpecifier:v4];
  v7 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSAssociatedDevice"];
  device = self->_device;
  self->_device = v7;

  v9 = [(COSPairingController *)self navigationItem];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"TITLE" value:&stru_100249230 table:@"Pairing"];
  [v9 setTitle:v11];

  v12 = [(COSPairingController *)self device];
  v13 = [v12 valueForProperty:NRDevicePropertyIsAltAccount];
  LODWORD(v11) = [v13 BOOLValue];

  if (v11)
  {
    v14 = [(COSPairingController *)self aboutDataSource];
    [v14 setTinkerDevice:1];

    v15 = [(COSPairingController *)self device];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100110644;
    v23[3] = &unk_100244B80;
    v23[4] = self;
    +[BPSAppleIDDevices fetchFamilyMemberForDevice:v15 withCompletion:v23];
  }
  v16 = [(COSPairingController *)self device];
  if (sub_100032560(v16))
  {
    unsigned int v17 = +[COSFindMyController isDeviceLocatorEnabled];

    if (!v17) {
      goto LABEL_7;
    }
    v18 = [(COSPairingController *)self device];
    v16 = [v18 valueForProperty:NRDevicePropertyUDID];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100110730;
    v22[3] = &unk_100244CE0;
    v22[4] = self;
    +[COSFindMyController allowsMarkAsMissingForUDID:v16 completion:v22];
  }

LABEL_7:
  v19 = [v4 propertyForKey:@"COSDeviceState"];
  unint64_t v20 = (unint64_t)[v19 integerValue];

  if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v21 = [(COSPairingController *)self aboutDataSource];
    [v21 setMigrationDevice:1];
  }
}

- (id)selectSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)COSPairingController;
  id v4 = [(COSPairingController *)&v8 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
    objc_super v6 = [(COSPairingController *)self device];
    [v5 setDevice:v6];
  }

  return v4;
}

- (void)jumpToFindMyApp
{
  id v4 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyUDID];
  v2 = [@"fmip1://bridgemissingdevice/device?id=" stringByAppendingString:v4];
  v3 = +[NSURL URLWithString:v2];

  BPSOpenSensitiveURLAsync();
}

- (void)confirmUnpairingMissingForSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifierBeingConfirmed, a3);
  id v17 = a3;
  v16 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyName];
  id v5 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v18[0] = PSConfirmationTitleKey;
  v15 = +[NSBundle mainBundle];
  v14 = [v15 localizedStringForKey:@"UNPAIR_CONFIRMATION_TITLE_MISSING" value:&stru_100249230 table:@"Pairing"];
  objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v16);
  v19[0] = v6;
  v18[1] = PSConfirmationPromptKey;
  v7 = +[NSBundle mainBundle];
  objc_super v8 = [v7 localizedStringForKey:@"UNPAIR_CONFIRMATION_DESCRIPTION_MISSING" value:&stru_100249230 table:@"Pairing"];
  v19[1] = v8;
  v18[2] = PSConfirmationOKKey;
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"UNPAIR_CONFIRMATION_BUTTON_MISSING" value:&stru_100249230 table:@"Pairing"];
  v19[2] = v10;
  v18[3] = PSConfirmationCancelKey;
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"CANCEL_MISSING" value:&stru_100249230 table:@"Pairing"];
  v19[3] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  [v5 setupWithDictionary:v13];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v5 setTarget:self];
  [v5 setConfirmationAction:"confirmedUnpairMissing"];
  [v5 setConfirmationCancelAction:"cancelledUnpair"];

  [(COSPairingController *)self showConfirmationViewForSpecifier:v5];
}

- (void)confirmedUnpairMissing
{
}

- (void)tinkeriForgot
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tinker iForgot flow", v13, 2u);
  }

  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  id v5 = [(COSPairingController *)self aboutDataSource];
  objc_super v6 = [v5 deviceUser];

  v7 = [v6 appleID];

  if (v7)
  {
    objc_super v8 = [v6 appleID];
    [v4 setUsername:v8];
  }
  [v4 setIsUsernameEditable:1];
  [v4 setNeedsCredentialRecovery:1];
  [v4 setNeedsNewAppleID:0];
  [v4 setIsEphemeral:1];
  [v4 setPresentingViewController:self];
  authContext = self->_authContext;
  self->_authContext = (AKAppleIDAuthenticationInAppContext *)v4;
  id v10 = v4;

  v11 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authController = self->_authController;
  self->_authController = v11;

  [(AKAppleIDAuthenticationController *)self->_authController authenticateWithContext:self->_authContext completion:&stru_100247758];
}

- (void)confirmedUnpairAndMarkAsMissing:(BOOL)a3
{
  BOOL v3 = a3;
  [(COSPairingController *)self _startSpinnerInSpecifier:self->_specifierBeingConfirmed];
  specifierBeingConfirmed = self->_specifierBeingConfirmed;
  self->_specifierBeingConfirmed = 0;

  objc_super v6 = [(COSPairingController *)self view];
  [v6 setUserInteractionEnabled:0];

  v7 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyIsPaired];
  objc_super v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"handleUnpairNotification:" name:NRPairedDeviceRegistryUnmigratedDeviceDidUnpairNotification object:0];

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100111270;
  v24[3] = &unk_100245550;
  objc_copyWeak(&v26, &location);
  id v9 = v7;
  id v25 = v9;
  id v10 = objc_retainBlock(v24);
  v11 = [(COSPairingController *)self aboutDataSource];
  if ([v11 migrationDevice])
  {
  }
  else
  {
    unsigned __int8 v12 = [v9 BOOLValue];

    if (v12)
    {
      v13 = objc_alloc_init(COSUnpairActionsHelperContext);
      [(COSUnpairActionsHelperContext *)v13 setDevice:self->_device];
      [(COSUnpairActionsHelperContext *)v13 setMarkAsMissing:v3];
      [(COSUnpairActionsHelperContext *)v13 setPresentingViewController:self];
      v14 = +[NSBundle mainBundle];
      v15 = [v14 localizedStringForKey:@"CONFIRM_REMOVE_ACTIVATION_LOCK" value:&stru_100249230 table:@"Pairing"];
      [(COSUnpairActionsHelperContext *)v13 setActivationLockRemovalTitle:v15];

      v16 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyName];
      id v17 = +[NSBundle mainBundle];
      v18 = [v17 localizedStringForKey:@"UNPAIR_FAILURE_MESSAGE" value:&stru_100249230 table:@"Pairing"];
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16);
      [(COSUnpairActionsHelperContext *)v13 setFailureMessage:v19];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10011187C;
      v22[3] = &unk_1002477A8;
      v22[4] = self;
      v23 = v10;
      +[COSUnpairActionsHelper applyUnpairActionsForContext:v13 withCompletion:v22];

      goto LABEL_8;
    }
  }
  unint64_t v20 = pbb_manualunpairing_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [v9 BOOLValue];
    *(_DWORD *)buf = 67109120;
    unsigned int v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Forgetting migration device. isPaired: %d", buf, 8u);
  }

  ((void (*)(void *, void))v10[2])(v10, 0);
LABEL_8:

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)confirmedUnpair
{
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_activelyLoadingSpecifierIdentifier)
  {
    id v9 = v4;
    id v5 = [v4 propertyForKey:PSTableCellKey];
    if (v5)
    {
      id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v6 startAnimating];
      [v5 setAccessoryView:v6];
      v7 = [v9 identifier];
      activelyLoadingSpecifierIdentifier = self->_activelyLoadingSpecifierIdentifier;
      self->_activelyLoadingSpecifierIdentifier = v7;
    }
    id v4 = v9;
  }
}

- (void)handleUnpairNotification:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100111B8C;
  v3[3] = &unk_1002439E0;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_stopSpinnerInActiveSpecifier
{
  if (self->_activelyLoadingSpecifierIdentifier)
  {
    -[COSPairingController specifierForID:](self, "specifierForID:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [v6 propertyForKey:PSTableCellKey];
    if (v3)
    {
      id v4 = [v6 propertyForKey:PSControlKey];
      [v3 setAccessoryView:v4];
    }
    activelyLoadingSpecifierIdentifier = self->_activelyLoadingSpecifierIdentifier;
    self->_activelyLoadingSpecifierIdentifier = 0;
  }
}

- (void)cancelledUnpair
{
  specifierBeingConfirmed = self->_specifierBeingConfirmed;
  self->_specifierBeingConfirmed = 0;
}

- (void)confirmUnpairingForSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifierBeingConfirmed, a3);
  id v5 = a3;
  id v6 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyName];
  v7 = +[NSBundle mainBundle];
  objc_super v8 = [v7 localizedStringForKey:@"UNPAIR_CONFIRMATION_TITLE" value:&stru_100249230 table:@"Pairing"];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);

  id v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"UNPAIR_CONFIRMATION_DESCRIPTION" value:&stru_100249230 table:@"Pairing"];

  unsigned __int8 v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"UNPAIR_CONFIRMATION_BUTTON" value:&stru_100249230 table:@"Pairing"];

  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Pairing"];

  id v16 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v18[0] = PSConfirmationTitleKey;
  v18[1] = PSConfirmationPromptKey;
  v19[0] = v9;
  v19[1] = v11;
  v18[2] = PSConfirmationOKKey;
  v18[3] = PSConfirmationCancelKey;
  v19[2] = v13;
  v19[3] = v15;
  id v17 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  [v16 setupWithDictionary:v17];

  [v16 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v16 setTarget:self];
  [v16 setConfirmationAction:"confirmedUnpair"];
  [v16 setConfirmationCancelAction:"cancelledUnpair"];

  [(COSPairingController *)self showConfirmationViewForSpecifier:v16];
}

- (void)enableDisableUnpairButton:(unint64_t)a3
{
  id v5 = sub_100014784();
  id v6 = [v5 count];

  BOOL v7 = a3 != 2 || v6 == 0;
  uint64_t v8 = !v7;
  if (v7)
  {
    id v9 = pbb_manualunpairing_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = +[NSNumber numberWithInt:v6 != 0];
      v11 = +[NRPairedDeviceRegistry sharedInstance];
      [v11 status];
      unsigned __int8 v12 = NRPairedDeviceRegistryStatusCodeString();
      v13 = +[NRPairedDeviceRegistry sharedInstance];
      v14 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v13 compatibilityState]);
      int v16 = 136315906;
      id v17 = "-[COSPairingController enableDisableUnpairButton:]";
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      unsigned int v21 = v12;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unpair Buttons Disabled (%s) IsPaired: %@ / NR Status %@ / NR Compatibility State %@", (uint8_t *)&v16, 0x2Au);
    }
  }
  v15 = [(COSPairingController *)self aboutDataSource];
  [v15 setEnableUnpairButtons:v8];
}

- (void)_applicationResumed:(id)a3
{
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    BOOL v7 = [v6 objectForKey:NRPairedDeviceRegistryStatusKey];
    id v8 = [v7 unsignedLongValue];
  }
  else
  {
    id v6 = +[NRPairedDeviceRegistry sharedInstance];
    id v8 = [v6 status];
  }

  id v9 = pbb_manualunpairing_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NR Status Changed to %lu", (uint8_t *)&v10, 0xCu);
  }

  if (v8) {
    [(COSPairingController *)self enableDisableUnpairButton:v8];
  }
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (NSString)activelyLoadingSpecifierIdentifier
{
  return self->_activelyLoadingSpecifierIdentifier;
}

- (void)setActivelyLoadingSpecifierIdentifier:(id)a3
{
}

- (PSSpecifier)specifierBeingConfirmed
{
  return self->_specifierBeingConfirmed;
}

- (void)setSpecifierBeingConfirmed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierBeingConfirmed, 0);
  objc_storeStrong((id *)&self->_activelyLoadingSpecifierIdentifier, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end