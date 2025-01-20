@interface COSResetController
- (COSResetController)init;
- (NRDevice)device;
- (NSSManager)manager;
- (id)specifiers;
- (void)_eraseCellularPlans;
- (void)confirmationSpecifierConfirmed:(id)a3;
- (void)didAcceptEnteredPIN;
- (void)eraseSettingsAndContent:(BOOL)a3;
- (void)onEraseConfirmationAction:(id)a3;
- (void)presentPasscodePrompt;
- (void)resetAppLayoutConfirmed:(id)a3;
- (void)resetCalendarSyncState:(id)a3;
- (void)resetCellularPlans:(id)a3;
- (void)resetContactsSyncState:(id)a3;
- (void)resetSyncState:(id)a3;
- (void)setDevice:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation COSResetController

- (COSResetController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSResetController;
  v2 = [(COSResetController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = sub_10000DCF4();
    device = v2->_device;
    v2->_device = (NRDevice *)v3;

    id v5 = objc_alloc_init((Class)HKHealthStore);
    id v6 = [objc_alloc((Class)HKNanoSyncControl) initWithHealthStore:v5];
    [v6 forceLastChanceNanoSyncWithCompletion:&stru_100246F48];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    id v6 = [(COSResetController *)self loadSpecifiersFromPlistName:@"Reset" target:self];
    id v7 = [v5 initWithArray:v6];

    objc_super v8 = [UIApp activeWatch];
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
    unsigned __int8 v10 = [v8 supportsCapability:v9];

    if ((v10 & 1) == 0)
    {
      v11 = [v7 specifierForID:@"RESET_CELLULAR_GROUP_ID"];
      [v7 removeObject:v11];

      v12 = [v7 specifierForID:@"RESET_CELLULAR_PLANS_ID"];
      [v7 removeObject:v12];
    }
    if (BPSDeviceHasCapabilityForString())
    {
      v13 = [v7 specifierForID:@"RESET_APP_LAYOUT_GROUP_ID"];
      [v7 removeObject:v13];

      v14 = [v7 specifierForID:@"RESET_APP_LAYOUT_ID"];
      [v7 removeObject:v14];

      v15 = [v7 specifierForID:@"RESET_ALL_SYNC_STATE_GROUP_ID"];
      [v7 removeObject:v15];

      v16 = [v7 specifierForID:@"RESET_ALL_SYNC_STATE_ID"];
      [v7 removeObject:v16];
    }
    v17 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v7;
    id v18 = v7;

    v19 = (NSSManager *)objc_opt_new();
    manager = self->_manager;
    self->_manager = v19;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)confirmationSpecifierConfirmed:(id)a3
{
  id v4 = a3;
  id v14 = +[PSConfirmationSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"FULL_ERASE_CONFIRMATION_CANCEL" value:&stru_100249230 table:@"Reset"];
  [v14 setCancelButton:v6];

  [v14 setProperty:kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  id v7 = [v4 identifier];

  LODWORD(v4) = [v7 isEqualToString:@"FULL_ERASE_CELL_ID"];
  if (v4)
  {
    [v14 setConfirmationAction:"onEraseConfirmationAction:"];
    objc_super v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"FULL_ERASE_CONFIRMATION_ACCEPT" value:&stru_100249230 table:@"Reset"];
    [v14 setOkButton:v9];

    unsigned __int8 v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"FULL_ERASE_TITLE" value:&stru_100249230 table:@"Reset"];
    [v14 setTitle:v11];

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"FULL_ERASE_MSG_2" value:&stru_100249230 table:@"Reset"];
    [v14 setPrompt:v13];
  }
  [(COSResetController *)self showConfirmationViewForSpecifier:v14];
}

- (void)onEraseConfirmationAction:(id)a3
{
  id v4 = objc_alloc_init(COSUnpairActionsHelperContext);
  [(COSUnpairActionsHelperContext *)v4 setDevice:self->_device];
  [(COSUnpairActionsHelperContext *)v4 setPresentingViewController:self];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"FULL_ERASE_CONFIRMATION_ACCEPT" value:&stru_100249230 table:@"Reset"];
  [(COSUnpairActionsHelperContext *)v4 setActivationLockRemovalTitle:v6];

  id v7 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyName];
  objc_super v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"RESET_FAILURE_MESSAGE" value:&stru_100249230 table:@"Reset"];
  unsigned __int8 v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
  [(COSUnpairActionsHelperContext *)v4 setFailureMessage:v10];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F2450;
  v11[3] = &unk_100246F70;
  v11[4] = self;
  +[COSUnpairActionsHelper applyUnpairActionsForContext:v4 withCompletion:v11];
}

- (void)eraseSettingsAndContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(COSResetController *)self specifierForID:@"FULL_ERASE_CELL_ID"];
  [v5 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  [(COSResetController *)self reloadSpecifier:v5];
  id v6 = +[UIApplication sharedApplication];
  [v6 setNetworkActivityIndicatorVisible:1];

  manager = self->_manager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F2634;
  v9[3] = &unk_1002447A0;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  [(NSSManager *)manager obliterateGizmoPreservingeSIM:v3 completionHandler:v9];
}

- (void)resetAppLayoutConfirmed:(id)a3
{
  BOOL v3 = +[NSBundle bundleWithPath:@"/System/Library/NanoPreferenceBundles/Customization/CarouselLayoutSettings.bundle"];
  id v4 = pbb_bridge_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found Layout Bundle!", buf, 2u);
    }

    id v4 = objc_alloc_init((Class)[v3 principalClass]);
    if (objc_opt_respondsToSelector())
    {
      [v4 resetIconPositions];
    }
    else
    {
      id v6 = pbb_bridge_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reset Layout Method Not Found!", v8, 2u);
      }
    }
  }
  else if (v5)
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did Not Find Layout Bundle!", v7, 2u);
  }
}

- (void)resetSyncState:(id)a3
{
  id v4 = a3;
  [(COSResetController *)self resetContactsSyncState:v4];
  [(COSResetController *)self resetCalendarSyncState:v4];
}

- (void)resetCellularPlans:(id)a3
{
  id v4 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v5 = [v4 isPasscodeSet];

  if (v5)
  {
    [(COSResetController *)self presentPasscodePrompt];
  }
  else
  {
    [(COSResetController *)self _eraseCellularPlans];
  }
}

- (void)resetContactsSyncState:(id)a3
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posted Contacts fullsync", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.addressbooksync.fullsync", 0, 0, 0);
}

- (void)resetCalendarSyncState:(id)a3
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posted Calendar fullsync", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.eventkitsync.fullsync", 0, 0, 0);
}

- (void)presentPasscodePrompt
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Present Passcode Prompt", v13, 2u);
  }

  id v4 = objc_alloc_init((Class)PSSpecifier);
  unsigned __int8 v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:PSSetupCustomClassKey];

  [v4 setEditPaneClass:objc_opt_class()];
  [v4 setProperty:&off_10025C2C8 forKey:@"mode"];
  [v4 setProperty:self forKey:kDevicePINControllerDelegate];
  [(COSResetController *)self showPINSheet:v4];
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 windows];
  id v9 = [v8 firstObject];
  id v10 = [v9 rootViewController];

  v11 = [v10 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 navigationBar];
    BPSApplyStyleToNavBar();
  }
}

- (void)_eraseCellularPlans
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)qword_10029B2A0;
  uint64_t v9 = qword_10029B2A0;
  if (!qword_10029B2A0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000F2F1C;
    v5[3] = &unk_1002436A8;
    v5[4] = &v6;
    sub_1000F2F1C((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = [v3 sharedManager];
  [v4 eraseAllRemotePlansWithCompletion:&stru_100246F90];
}

- (void)didAcceptEnteredPIN
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did Accept Entered PIN", v4, 2u);
  }

  [(COSResetController *)self _eraseCellularPlans];
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSSManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end