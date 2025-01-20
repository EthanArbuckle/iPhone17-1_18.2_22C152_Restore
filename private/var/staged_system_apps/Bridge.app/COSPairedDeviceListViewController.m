@interface COSPairedDeviceListViewController
- (BOOL)_activeWatchNeedsUpdate;
- (BOOL)launchedByNanoRegistry;
- (BOOL)showTinkerSwitchCancelOption;
- (BOOL)swuPaneDisplayed;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)userInitiatedTinkerSwitch;
- (BPSTinkerConnectionTracker)connectionTracker;
- (COSMigrationManager)migrationManager;
- (COSPairedDeviceListTableCell)migratingDeviceCell;
- (COSPairedDeviceListViewController)init;
- (COSSoftwareUpdateController)updateController;
- (COSWatchUnpairInstructionsController)unpairInstructionsController;
- (NSIndexPath)selectedIndexPath;
- (OS_dispatch_source)tinkerConnectionTimeout;
- (PSSpecifier)selectedDeviceSpecifierPriorToUpdate;
- (SUBManager)subManager;
- (id)_specifierForActiveWatch;
- (id)findMigratingDeviceCell:(id)a3;
- (unint64_t)currentBackButtonBehavior;
- (void)_configureBackButtonBehavior;
- (void)_doneButtonTapped;
- (void)_showBackButtonBehavior:(unint64_t)a3 animated:(BOOL)a4;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_switchToDeviceWithSpecifier:(id)a3 atIndex:(id)a4 successCompletion:(id)a5;
- (void)_tinkerConnectionFinished;
- (void)beginMigrationWithAltDevice:(id)a3;
- (void)cancelTinkerConnectionTimeout;
- (void)cancelTinkerSwitchAttempt:(id)a3;
- (void)dealloc;
- (void)deviceBecameActive:(id)a3;
- (void)didBTConnectDevice:(id)a3;
- (void)didIDSConnectDevice:(id)a3;
- (void)didUpdateAsDisconnectedDevice:(id)a3;
- (void)disableBackButton;
- (void)displaySoftwareUpdatePane:(id)a3;
- (void)handleTinkerMigrationFailureCase:(unint64_t)a3 forDevice:(id)a4;
- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFinishInstallation:(id)a4;
- (void)migrationProgressUpdate:(unint64_t)a3 percentageComplete:(double)a4 migratingDevice:(id)a5;
- (void)nanoRegistryStatusCodeChanged:(id)a3;
- (void)presentGenericMigrationFailureMessage:(id)a3;
- (void)presentSoftwareUpdatePane;
- (void)presentTinkerConnectFailedAlert:(id)a3;
- (void)presentTinkerMigrationAvailabilityFailure:(id)a3 title:(id)a4 detail:(id)a5;
- (void)presentUnpairInstructionsController;
- (void)pushActiveDeviceDetails;
- (void)pushCellDetailForRowWithIndexPath:(id)a3 animate:(BOOL)a4;
- (void)reloadSpecifiers;
- (void)selectDeviceWithSpecifier:(id)a3 successCompletion:(id)a4;
- (void)selectRowWithSpecifier:(id)a3;
- (void)setConnectionTracker:(id)a3;
- (void)setCurrentBackButtonBehavior:(unint64_t)a3;
- (void)setLaunchedByNanoRegistry:(BOOL)a3;
- (void)setMigratingDeviceCell:(id)a3;
- (void)setMigrationManager:(id)a3;
- (void)setSelectedDeviceSpecifierPriorToUpdate:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setShowTinkerSwitchCancelOption:(BOOL)a3;
- (void)setSpecifierDataSource:(id)a3;
- (void)setSubManager:(id)a3;
- (void)setSwuPaneDisplayed:(BOOL)a3;
- (void)setTinkerConnectionTimeout:(id)a3;
- (void)setUnpairInstructionsController:(id)a3;
- (void)setUpdateController:(id)a3;
- (void)setUserInitiatedTinkerSwitch:(BOOL)a3;
- (void)showBlockSwitchDialog:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDeviceStates;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSPairedDeviceListViewController

- (COSPairedDeviceListViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)COSPairedDeviceListViewController;
  v2 = [(COSPairedDeviceListViewController *)&v13 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"nanoRegistryStatusCodeChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"deviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"deviceBecameInactive:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    id v6 = objc_alloc_init((Class)HKHealthStore);
    id v7 = [objc_alloc((Class)HKNanoSyncControl) initWithHealthStore:v6];
    [v7 forceLastChanceNanoSyncWithCompletion:&stru_100246A68];

    v2->_userInitiatedTinkerSwitch = 0;
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"familyCircleUpdated:" name:BPSTinkerSupportFamilyCircleUpdatedNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"profilePicturesUpdated:" name:BPSTinkerSupportProfilePicturesUpdatedNotification object:0];

    v10 = objc_alloc_init(COSMigrationManager);
    migrationManager = v2->_migrationManager;
    v2->_migrationManager = v10;

    [(COSMigrationManager *)v2->_migrationManager setDelegate:v2];
  }
  return v2;
}

- (void)setSpecifierDataSource:(id)a3
{
  id v4 = a3;
  [v4 setMigrationManager:self->_migrationManager];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D6478;
  v6[3] = &unk_100246A90;
  objc_copyWeak(&v7, &location);
  [v4 setDisplaySoftwareUpdate:v6];
  v5.receiver = self;
  v5.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v5 setSpecifierDataSource:v4];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v4 dealloc];
}

- (void)showBlockSwitchDialog:(id)a3
{
  id v4 = a3;
  objc_super v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[COSPairedDeviceListViewController showBlockSwitchDialog:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Displaying alert.", buf, 0xCu);
  }

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"GUARDIAN_SIGNED_OUT_BLOCK_SWITCH_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"GUARDIAN_SIGNED_OUT_BLOCK_SWITCH_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4);

  v11 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:1];

  v12 = +[NSBundle mainBundle];
  objc_super v13 = [v12 localizedStringForKey:@"OPEN_SETTINGS" value:&stru_100249230 table:@"Localizable"];
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&stru_100246AB0];
  [v11 addAction:v14];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Pairing"];
  v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];
  [v11 addAction:v17];

  [(COSPairedDeviceListViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v9 viewDidLoad];
  v3 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  unsigned int v4 = [v3 tinkerOnly];
  objc_super v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"DEVICE_PICKER_FAMILY_WATCHES_ONLY_TITLE";
  }
  else {
    CFStringRef v7 = @"DEVICE_PICKER_TITLE";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_100249230 table:@"Pairing"];
  [(COSPairedDeviceListViewController *)self setTitle:v8];

  [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:0 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v25 viewWillAppear:a3];
  updateController = self->_updateController;
  self->_updateController = 0;

  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;

  if ([(COSPairedDeviceListViewController *)self _activeWatchNeedsUpdate])
  {
    id v6 = [(COSPairedDeviceListViewController *)self _specifierForActiveWatch];
    selectedDeviceSpecifierPriorToUpdate = self->_selectedDeviceSpecifierPriorToUpdate;
    self->_selectedDeviceSpecifierPriorToUpdate = v6;

    if (!self->_subManager)
    {
      v8 = (SUBManager *)[objc_alloc((Class)SUBManager) initWithDelegate:self];
      subManager = self->_subManager;
      self->_subManager = v8;
    }
    objc_initWeak((id *)location, self);
    v10 = self->_subManager;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1000D6BF0;
    v22 = &unk_100246AD8;
    objc_copyWeak(&v24, (id *)location);
    v23 = self;
    [(SUBManager *)v10 managerState:&v19];
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
  [(COSPairedDeviceListViewController *)self _configureBackButtonBehavior];
  if (self->_selectedDeviceSpecifierPriorToUpdate)
  {
    v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_selectedDeviceSpecifierPriorToUpdate;
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[COSPairedDeviceListViewController viewWillAppear:]";
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Found device to switch to: %@", location, 0x16u);
    }

    objc_super v13 = self->_selectedDeviceSpecifierPriorToUpdate;
    v14 = self->_selectedDeviceSpecifierPriorToUpdate;
    self->_selectedDeviceSpecifierPriorToUpdate = 0;

    v15 = [(PSSpecifier *)v13 propertyForKey:@"COSDeviceState"];
    id v16 = [v15 integerValue];

    if (v16 == (id)6)
    {
      v17 = pbb_bridge_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315138;
        *(void *)&location[4] = "-[COSPairedDeviceListViewController viewWillAppear:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Skipping switch due to watch needing update", location, 0xCu);
      }
    }
    else
    {
      [(COSPairedDeviceListViewController *)self selectDeviceWithSpecifier:v13 successCompletion:0];
    }
  }
  else
  {
    [(COSPairedDeviceListViewController *)self updateDeviceStates];
    v18 = [(COSPairedDeviceListViewController *)self specifierDataSource];
    [v18 reloadSpecifiers];

    [(COSPairedDeviceListViewController *)self is_addGestureRecognizer];
  }
}

- (void)_configureBackButtonBehavior
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 status];

  if (v4 != (id)2)
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 136315394;
      *(void *)&v11[4] = "-[COSPairedDeviceListViewController _configureBackButtonBehavior]";
      *(_WORD *)&v11[12] = 2048;
      *(void *)&v11[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - Paired device registry not ready. State: %lu.", v11, 0x16u);
    }
    uint64_t v8 = 1;
    goto LABEL_17;
  }
  objc_super v5 = sub_10000DCF4();

  if (!v5)
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 136315138;
      *(void *)&v11[4] = "-[COSPairedDeviceListViewController _configureBackButtonBehavior]";
      CFStringRef v7 = "%s - No active paired device.";
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v8 = 2;
    goto LABEL_17;
  }
  if ([(COSPairedDeviceListViewController *)self _activeWatchNeedsUpdate])
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 136315138;
      *(void *)&v11[4] = "-[COSPairedDeviceListViewController _configureBackButtonBehavior]";
      CFStringRef v7 = "%s - Active watch needs update";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v11, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if ((id)[(COSMigrationManager *)self->_migrationManager currentState] == (id)2
    || (id)[(COSMigrationManager *)self->_migrationManager currentState] == (id)3)
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      uint64_t v8 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Block back button migration sync", v11, 2u);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v8 = 0;
LABEL_18:
  -[COSPairedDeviceListViewController _showBackButtonBehavior:animated:](self, "_showBackButtonBehavior:animated:", v8, 0, *(_OWORD *)v11);
  objc_super v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = +[NSNumber numberWithUnsignedInteger:v8];
    *(_DWORD *)v11 = 136315394;
    *(void *)&v11[4] = "-[COSPairedDeviceListViewController _configureBackButtonBehavior]";
    *(_WORD *)&v11[12] = 2112;
    *(void *)&v11[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - %@", v11, 0x16u);
  }
}

- (BOOL)_activeWatchNeedsUpdate
{
  v2 = [(COSPairedDeviceListViewController *)self _specifierForActiveWatch];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 propertyForKey:@"COSDeviceState"];
    unint64_t v5 = (unint64_t)[v4 integerValue];

    BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 6;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_doneButtonTapped
{
  [UIApp setDevicePickerPresented:0];

  [(COSPairedDeviceListViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)presentTinkerConnectFailedAlert:(id)a3
{
  id v4 = a3;
  unint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v18 = "-[COSPairedDeviceListViewController presentTinkerConnectFailedAlert:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Displaying alert.", buf, 0xCu);
  }

  BOOL v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
  uint64_t v8 = +[NSBundle mainBundle];
  objc_super v9 = [v8 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_MESSAGE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4);
  v11 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:1];

  objc_initWeak((id *)buf, self);
  v12 = +[NSBundle mainBundle];
  objc_super v13 = [v12 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Pairing"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D751C;
  v15[3] = &unk_100245AA0;
  objc_copyWeak(&v16, (id *)buf);
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];
  [v11 addAction:v14];

  [(COSPairedDeviceListViewController *)self presentViewController:v11 animated:1 completion:0];
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (id)_specifierForActiveWatch
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = NRDevicePropertyIsActive;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v8, "propertyForKey:", @"COSAssociatedDevice", (void)v14);
        v10 = [v9 valueForProperty:v6];
        unsigned int v11 = [v10 BOOLValue];

        if (v11)
        {
          id v12 = v8;

          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)selectDeviceWithSpecifier:(id)a3 successCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tinkerConnectionTimeout)
  {
    uint64_t v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[COSPairedDeviceListViewController selectDeviceWithSpecifier:successCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: We had a switch transaction going on. Cancel it.", buf, 0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_tinkerConnectionTimeout);
    tinkerConnectionTimeout = self->_tinkerConnectionTimeout;
    self->_tinkerConnectionTimeout = 0;
  }
  connectionTracker = self->_connectionTracker;
  self->_connectionTracker = 0;

  unsigned int v11 = [v6 propertyForKey:@"COSAssociatedDevice"];
  id v12 = [v6 propertyForKey:@"COSDeviceState"];
  id v13 = [v12 integerValue];

  long long v14 = pbb_bridge_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v11 _bridgeConciseDebugDescription];
    *(_DWORD *)buf = 136315650;
    v50 = "-[COSPairedDeviceListViewController selectDeviceWithSpecifier:successCompletion:]";
    __int16 v51 = 2112;
    v52 = v15;
    __int16 v53 = 2048;
    id v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Select Device -> %@ (specifier=%p)", buf, 0x20u);
  }
  long long v16 = [v11 valueForProperty:NRDevicePropertyIsAltAccount];
  long long v17 = [v11 valueForProperty:NRDevicePropertyIsActive];
  unsigned __int8 v18 = [v17 BOOLValue];

  if (v13 == (id)6) {
    char v19 = v18;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    uint64_t v20 = [(COSPairedDeviceListViewController *)self _specifierForActiveWatch];
    selectedDeviceSpecifierPriorToUpdate = self->_selectedDeviceSpecifierPriorToUpdate;
    self->_selectedDeviceSpecifierPriorToUpdate = v20;
  }
  unsigned int v22 = [v16 BOOLValue];
  v23 = self->_connectionTracker;
  id v24 = &OBJC_INSTANCE_METHODS_COSWristSelectionViewController;
  if (v22)
  {
    if (!v23)
    {
      objc_super v25 = (BPSTinkerConnectionTracker *)[objc_alloc((Class)BPSTinkerConnectionTracker) initWithDevice:0];
      v26 = self->_connectionTracker;
      self->_connectionTracker = v25;

      [(BPSTinkerConnectionTracker *)self->_connectionTracker setDelegate:self];
    }
    self->_userInitiatedTinkerSwitch = 1;
    if (!self->_tinkerConnectionTimeout)
    {
      __int16 v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      dispatch_time_t v28 = dispatch_time(0, 0xA7A358000);
      dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000D7C6C;
      handler[3] = &unk_100243908;
      handler[4] = self;
      id v48 = v11;
      dispatch_source_set_event_handler(v27, handler);
      dispatch_resume(v27);
      id v29 = v7;
      v30 = self->_tinkerConnectionTimeout;
      self->_tinkerConnectionTimeout = (OS_dispatch_source *)v27;
      v31 = v27;

      id v7 = v29;
      id v24 = &OBJC_INSTANCE_METHODS_COSWristSelectionViewController;
    }
    [(BPSTinkerConnectionTracker *)self->_connectionTracker setSelectedDevice:v11];
    [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:1 animated:0];
  }
  else
  {
    self->_connectionTracker = 0;
  }
  v32 = pbb_bridge_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[COSPairedDeviceListViewController selectDeviceWithSpecifier:successCompletion:]";
    __int16 v51 = 2112;
    v52 = v11;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Connecting to device %@.", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v33 = +[UIApplication sharedApplication];
  v41 = _NSConcreteStackBlock;
  __objc2_meth_list v42 = v24[257];
  v43 = sub_1000D7E78;
  v44 = &unk_100245550;
  objc_copyWeak(&v46, (id *)buf);
  id v34 = v11;
  id v45 = v34;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = v42;
  v37[2] = sub_1000D7FA0;
  v37[3] = &unk_100246B00;
  objc_copyWeak(&v40, (id *)buf);
  id v35 = v34;
  id v38 = v35;
  id v36 = v7;
  id v39 = v36;
  [v33 setActiveWatch:v35 startedBlock:&v41 completionBlock:v37];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  if (a3)
  {
    id v3 = [a3 propertyForKey:PSTableCellKey];
    if (v3)
    {
      id v5 = v3;
      id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v5 setAccessoryView:v4];
      [v4 startAnimating];
      [v5 layoutSubviews];

      id v3 = v5;
    }
  }
}

- (void)selectRowWithSpecifier:(id)a3
{
  id v5 = [(COSPairedDeviceListViewController *)self indexPathForSpecifier:a3];
  id v4 = [(COSPairedDeviceListViewController *)self table];
  [(COSPairedDeviceListViewController *)self tableView:v4 didSelectRowAtIndexPath:v5];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(COSPairedDeviceListViewController *)self specifierAtIndex:[(COSPairedDeviceListViewController *)self indexForIndexPath:a4]];
  id v5 = [v4 propertyForKey:@"COSPairedDeviceListTableCellEnabled"];
  unsigned __int8 v6 = [v5 BOOLValue];
  if (v5) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v30 tableView:a3 didSelectRowAtIndexPath:v6];
  BOOL v7 = [(COSPairedDeviceListViewController *)self specifierAtIndexPath:v6];
  uint64_t v8 = [v7 propertyForKey:@"COSAssociatedDevice"];
  objc_super v9 = [v8 valueForProperty:NRDevicePropertyIsArchived];
  v10 = [v8 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v11 = [v8 valueForProperty:NRDevicePropertyName];
  id v12 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  unsigned int v13 = [v12 _deviceRequiresUpdate:v8];

  long long v14 = [v7 identifier];
  unsigned int v15 = [v14 isEqualToString:@"PairNewWatchSpecifier"];

  if (v15)
  {
    long long v16 = pbb_bridge_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v17 = "Selected pair new watch button.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unsigned __int8 v18 = [v7 identifier];
  unsigned int v19 = [v18 isEqualToString:@"MagicSwitchSpecifier"];

  if (v19)
  {
    long long v16 = pbb_bridge_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v17 = "Selected magic switch row.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v20 = [v7 identifier];
  unsigned int v21 = [v20 isEqualToString:@"FinishPairing"];

  if (v21)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D8690;
    block[3] = &unk_100243908;
    block[4] = self;
    id v29 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (([v10 BOOLValue] & v13) == 1 {
         && ([v9 BOOLValue] & 1) == 0)
  }
  {
    long long v16 = pbb_bridge_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    long long v17 = "Selected tinker watch that requires update";
    goto LABEL_7;
  }
  unsigned int v22 = pbb_bridge_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Select ip=%@", buf, 0xCu);
  }

  if ([v9 BOOLValue] && objc_msgSend(v10, "BOOLValue"))
  {
    v23 = +[NRMigrator sharedMigrator];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D869C;
    v24[3] = &unk_100246B28;
    id v25 = v8;
    v26 = self;
    id v27 = v11;
    [v23 isPhoneReadyToMigrateDevice:v25 withCompletion:v24];
  }
  else
  {
    [(COSPairedDeviceListViewController *)self _switchToDeviceWithSpecifier:v7 atIndex:v6 successCompletion:0];
  }
LABEL_9:
}

- (void)_switchToDeviceWithSpecifier:(id)a3 atIndex:(id)a4 successCompletion:(id)a5
{
  id v7 = a3;
  id obj = a4;
  uint64_t v8 = (NSIndexPath *)a4;
  id v9 = a5;
  v10 = [v7 propertyForKey:@"COSDeviceState"];
  unint64_t v11 = (unint64_t)[v10 integerValue];

  id v12 = [v7 propertyForKey:@"COSAssociatedDevice"];
  unsigned int v13 = [v12 valueForProperty:NRDevicePropertyIsActive];
  unsigned int v28 = [v13 BOOLValue];

  long long v14 = [v12 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v15 = [v14 BOOLValue];

  long long v16 = [v12 valueForProperty:_NRDevicePropertyPairingParentAltDSID];
  long long v17 = [v12 valueForProperty:_NRDevicePropertyPairingParentAccountIdentifier];
  if (!v15)
  {
    int v20 = 0;
    goto LABEL_16;
  }
  unsigned __int8 v18 = +[COSiCloudAuthController iCloudAccountInAccountStore];
  if (!v18)
  {
    unsigned int v19 = 0;
    goto LABEL_9;
  }
  unsigned int v19 = +[COSiCloudAuthController altDSIDForiCloudAccount:v18];
  if (!v19) {
    goto LABEL_9;
  }
  if (!v16)
  {
    if (sub_100008380())
    {
      v26 = +[NRPairedDeviceRegistry sharedInstance];
      unsigned int v22 = +[COSiCloudAuthController usernameForiCloudAccount:v18];
      [v26 pairingClientSetPairingParentName:v22 pairingParentAltDSID:v19 forDevice:v12 completion:&stru_100246B48];
    }
    goto LABEL_14;
  }
  if (([v16 isEqualToString:v19] & 1) == 0)
  {
LABEL_9:
    unsigned int v21 = pbb_bridge_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v16;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Blocking switch for alt account watch because %@ != %@", buf, 0x16u);
    }

    int v20 = 1;
    goto LABEL_15;
  }
LABEL_14:
  int v20 = 0;
LABEL_15:

LABEL_16:
  v23 = pbb_bridge_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = "NO";
    if (v28) {
      id v24 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    v31 = v24;
    __int16 v32 = 2048;
    unint64_t v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "watchIsAlreadyActive: %s deviceState %ld", buf, 0x16u);
  }

  if (v20)
  {
    [(COSPairedDeviceListViewController *)self showBlockSwitchDialog:v17];
  }
  else if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    [(COSPairedDeviceListViewController *)self pushCellDetailForRowWithIndexPath:v8 animate:1];
  }
  else if ((v28 & 1) == 0 && self->_selectedIndexPath != v8)
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, obj);
    id v25 = [(COSPairedDeviceListViewController *)self specifierDataSource];
    [v25 setLoadingDevice:v12];

    [(COSPairedDeviceListViewController *)self updateDeviceStates];
    [(COSPairedDeviceListViewController *)self selectDeviceWithSpecifier:v7 successCompletion:v9];
  }
}

- (void)handleTinkerMigrationFailureCase:(unint64_t)a3 forDevice:(id)a4
{
  id v21 = a4;
  switch(a3)
  {
    case 1uLL:
      id v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"ENABLE_KEYCHAIN_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

      uint64_t v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"ENABLE_KEYCHAIN_BODY";
      goto LABEL_7;
    case 2uLL:
      unint64_t v11 = +[NSBundle mainBundle];
      id v7 = [v11 localizedStringForKey:@"ENABLE_BLUETOOTH_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

      uint64_t v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"ENABLE_BLUETOOTH_BODY";
      goto LABEL_7;
    case 3uLL:
      id v12 = +[NSBundle mainBundle];
      unsigned int v13 = [v12 localizedStringForKey:@"CANNOT_MIGRATE_YET_TITLE_%@_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      long long v14 = +[UIDevice currentDevice];
      unsigned int v15 = [v14 name];
      id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v21, v15);

      uint64_t v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"CANNOT_MIGRATE_YET_BODY";
      goto LABEL_7;
    case 5uLL:
      long long v17 = +[NSBundle mainBundle];
      unsigned __int8 v18 = [v17 localizedStringForKey:@"ALREADY_MIGRATING_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v21);

      uint64_t v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"ALREADY_MIGRATING_BODY";
LABEL_7:
      long long v16 = [v8 localizedStringForKey:v10 value:&stru_100249230 table:@"Localizable-tinker"];
      break;
    default:
      id v9 = +[NSBundle mainBundle];
      id v7 = [v9 localizedStringForKey:@"CANNOT_MIGRATE_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
      long long v16 = 0;
      break;
  }

  if (sub_100008380())
  {
    unsigned int v19 = sub_1000D8F48(a3);
    uint64_t v20 = +[NSString stringWithFormat:@"%@ - [Internal] availability code %lu : %@", v16, a3, v19];

    long long v16 = (void *)v20;
  }
  [(COSPairedDeviceListViewController *)self presentTinkerMigrationAvailabilityFailure:v21 title:v7 detail:v16];
}

- (void)presentGenericMigrationFailureMessage:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"[Internal] error: %@", a3];
  BPSPresentGizmoUnreachableOrLockedServiceAlertWithDismissalHandler();
}

- (void)presentTinkerMigrationAvailabilityFailure:(id)a3 title:(id)a4 detail:(id)a5
{
  id v9 = +[UIAlertController alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  uint64_t v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:&stru_100246B88];

  [v9 addAction:v8];
  [(COSPairedDeviceListViewController *)self presentViewController:v9 animated:1 completion:&stru_100246BA8];
}

- (void)presentUnpairInstructionsController
{
  unpairInstructionsController = self->_unpairInstructionsController;
  if (!unpairInstructionsController)
  {
    id v4 = objc_alloc_init(COSWatchUnpairInstructionsController);
    id v5 = self->_unpairInstructionsController;
    self->_unpairInstructionsController = v4;

    [(COSWatchUnpairInstructionsController *)self->_unpairInstructionsController setInstructionsContext:1];
    unpairInstructionsController = self->_unpairInstructionsController;
  }

  [(COSWatchUnpairInstructionsController *)unpairInstructionsController presentWithController:self];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
}

- (void)pushCellDetailForRowWithIndexPath:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(COSPairedDeviceListViewController *)self indexForIndexPath:a3];
  id v7 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v6];
  id v8 = objc_alloc_init(*(Class *)&v7[OBJC_IVAR___PSSpecifier_detailControllerClass]);
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__rootController]);
    [v8 setRootController:WeakRetained];

    [v8 setParentController:self];
    [v8 setSpecifier:v7];
    CFStringRef v10 = [v7 propertyForKey:@"COSAssociatedDevice"];
    unint64_t v11 = [v10 valueForProperty:NRDevicePropertyIsAltAccount];
    +[PBBridgeCAReporter recordAllWatchesDetailButtonVisit:](PBBridgeCAReporter, "recordAllWatchesDetailButtonVisit:", [v11 BOOLValue]);
    [(COSPairedDeviceListViewController *)self showController:v8 animate:v4];
  }
  else
  {
    id v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)&v7[OBJC_IVAR___PSSpecifier_detailControllerClass];
      int v14 = 136315394;
      unsigned int v15 = "-[COSPairedDeviceListViewController pushCellDetailForRowWithIndexPath:animate:]";
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to create controller %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)beginMigrationWithAltDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NRMigrator sharedMigrator];
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  [(COSMigrationManager *)self->_migrationManager tinkerMigrationStarted:v4];
  id v6 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  [v6 setLoadingDevice:v4];

  [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:1 animated:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9648;
  block[3] = &unk_100243D28;
  objc_copyWeak(&v16, &from);
  id v7 = v4;
  id v15 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D96EC;
  v9[3] = &unk_100246BD0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  id v8 = v7;
  id v10 = v8;
  unint64_t v11 = self;
  [v5 setMigrationConsented:1 forDevice:v8 withBlock:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)cancelTinkerSwitchAttempt:(id)a3
{
  id v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    id v9 = "-[COSPairedDeviceListViewController cancelTinkerSwitchAttempt:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  tinkerConnectionTimeout = self->_tinkerConnectionTimeout;
  if (tinkerConnectionTimeout)
  {
    dispatch_source_cancel(tinkerConnectionTimeout);
    id v6 = self->_tinkerConnectionTimeout;
    self->_tinkerConnectionTimeout = 0;
  }
  id v7 = +[UIApplication sharedApplication];
  [v7 cancelTinkerSwitch:self];

  [(COSPairedDeviceListViewController *)self setShowTinkerSwitchCancelOption:0];
  self->_userInitiatedTinkerSwitch = 0;
}

- (void)setShowTinkerSwitchCancelOption:(BOOL)a3
{
  BOOL showTinkerSwitchCancelOption = self->_showTinkerSwitchCancelOption;
  self->_BOOL showTinkerSwitchCancelOption = a3;
  if (showTinkerSwitchCancelOption != a3) {
    [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:self->_currentBackButtonBehavior animated:0];
  }
}

- (void)_showBackButtonBehavior:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!+[NSThread isMainThread])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D9EE8;
    block[3] = &unk_100245388;
    void block[4] = self;
    void block[5] = a3;
    BOOL v33 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    unint64_t v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting back button to %{public}lu", buf, 0xCu);
  }

  self->_currentBackButtonBehavior = a3;
  int v8 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  id v9 = [v8 loadingDevice];

  if (a3 != 1)
  {
    if (!v9) {
      goto LABEL_21;
    }
LABEL_22:
    unsigned int v19 = pbb_bridge_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Paired device list wants to clear spinner but a loading device was still specified, clearing.", buf, 2u);
    }

    id v16 = [(COSPairedDeviceListViewController *)self specifierDataSource];
    [v16 setLoadingDevice:0];
    char v17 = 0;
    goto LABEL_25;
  }
  unsigned __int8 v10 = sub_100005814();
  if ((v10 & 1) == 0 && !v9)
  {
    unint64_t v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Paired device list wants to show spinner but no loading device was specified, using active device.", buf, 2u);
    }

    id v9 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    if (!v9)
    {
      id v12 = sub_100005DC4();
      id v13 = [v12 sortedArrayUsingComparator:&stru_100246BF0];

      id v9 = [v13 lastObject];
      int v14 = pbb_bridge_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v9 valueForProperty:NRDevicePropertyName];
        *(_DWORD *)buf = 138412290;
        unint64_t v35 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No active device, using last active standard paired device as loading device: %@", buf, 0xCu);
      }
    }
    id v16 = [(COSPairedDeviceListViewController *)self specifierDataSource];
    [v16 setLoadingDevice:v9];
    char v17 = 1;
LABEL_25:

LABEL_26:
    [(COSPairedDeviceListViewController *)self updateDeviceStates];
    goto LABEL_27;
  }
  char v18 = v10 ^ 1;
  if (!v9) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0) {
    goto LABEL_22;
  }
  if ((v10 & 1) == 0)
  {
    char v17 = 1;
    goto LABEL_26;
  }
LABEL_21:
  char v17 = 0;
LABEL_27:
  uint64_t v20 = pbb_bridge_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v35 = (unint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device picker loading device: %@", buf, 0xCu);
  }

  if (a3 == 2) {
    char v21 = 1;
  }
  else {
    char v21 = v17;
  }
  if (v21)
  {
    unsigned int v22 = [(COSPairedDeviceListViewController *)self navigationController];
    [v22 setModalInPresentation:1];
    id v23 = 0;
  }
  else
  {
    id v24 = objc_alloc((Class)UIBarButtonItem);
    id v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"DONE" value:&stru_100249230 table:@"Localizable"];
    id v23 = [v24 initWithTitle:v26 style:0 target:self action:"_doneButtonTapped"];

    unsigned int v22 = [(COSPairedDeviceListViewController *)self navigationController];
    [v22 setModalInPresentation:0];
  }

  if (self->_showTinkerSwitchCancelOption)
  {
    id v27 = objc_alloc((Class)UIBarButtonItem);
    unsigned int v28 = +[NSBundle mainBundle];
    id v29 = [v28 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];
    id v30 = [v27 initWithTitle:v29 style:0 target:self action:"cancelTinkerSwitchAttempt:"];

    id v23 = v30;
  }
  v31 = [(COSPairedDeviceListViewController *)self navigationItem];
  [v31 setLeftBarButtonItem:v23 animated:v4];
}

- (void)nanoRegistryStatusCodeChanged:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    int v14 = "-[COSPairedDeviceListViewController nanoRegistryStatusCodeChanged:]";
    __int16 v15 = 2112;
    CFStringRef v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v13, 0x16u);
  }

  id v6 = [(__CFString *)v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryStatusKey];
  id v8 = [v7 integerValue];

  id v9 = sub_10000DCF4();

  unsigned __int8 v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v8 == (id)2) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    int v13 = 136446722;
    int v14 = "-[COSPairedDeviceListViewController nanoRegistryStatusCodeChanged:]";
    __int16 v15 = 2114;
    CFStringRef v16 = v12;
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    __int16 v17 = 2114;
    CFStringRef v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - isReady %{public}@; hasActiveDevice %{public}@;",
      (uint8_t *)&v13,
      0x20u);
  }

  if (!self->_connectionTracker) {
    [(COSPairedDeviceListViewController *)self _configureBackButtonBehavior];
  }
}

- (void)updateDeviceStates
{
  id v3 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  [v3 updateSelectedWatch];

  [(COSPairedDeviceListViewController *)self reloadSpecifiers];
}

- (void)deviceBecameActive:(id)a3
{
  BOOL v4 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  [v4 deviceBecameActive];

  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deviceBecameActive , configure backbutton", v6, 2u);
  }

  [(COSPairedDeviceListViewController *)self _configureBackButtonBehavior];
}

- (void)pushActiveDeviceDetails
{
  id v3 = [(COSPairedDeviceListViewController *)self specifierForID:@"ACTIVE_WATCH_ITEM"];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = +[NSIndexPath indexPathForRow:(char *)[(COSPairedDeviceListViewController *)self indexOfSpecifier:v3] - 1 inSection:0];
    [(COSPairedDeviceListViewController *)self pushCellDetailForRowWithIndexPath:v4 animate:0];

    id v3 = v5;
  }
}

- (void)disableBackButton
{
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[COSPairedDeviceListViewController disableBackButton]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:2 animated:0];
}

- (void)cancelTinkerConnectionTimeout
{
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    id v7 = "-[COSPairedDeviceListViewController cancelTinkerConnectionTimeout]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  tinkerConnectionTimeout = self->_tinkerConnectionTimeout;
  if (tinkerConnectionTimeout)
  {
    dispatch_source_cancel(tinkerConnectionTimeout);
    id v5 = self->_tinkerConnectionTimeout;
    self->_tinkerConnectionTimeout = 0;
  }
}

- (void)_tinkerConnectionFinished
{
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[COSPairedDeviceListViewController _tinkerConnectionFinished]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  self->_userInitiatedTinkerSwitch = 0;
  int v4 = [(COSPairedDeviceListViewController *)self specifierDataSource];
  [v4 setLoadingDevice:0];

  [(COSPairedDeviceListViewController *)self updateDeviceStates];
  [(COSPairedDeviceListViewController *)self _showBackButtonBehavior:0 animated:1];
}

- (void)didIDSConnectDevice:(id)a3
{
  id v4 = a3;
  connectionTracker = self->_connectionTracker;
  self->_connectionTracker = 0;

  [(COSPairedDeviceListViewController *)self setShowTinkerSwitchCancelOption:0];
  int v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 pairingID];
    int v8 = 136315394;
    id v9 = "-[COSPairedDeviceListViewController didIDSConnectDevice:]";
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v8, 0x16u);
  }
  [(COSPairedDeviceListViewController *)self cancelTinkerConnectionTimeout];
  [(COSPairedDeviceListViewController *)self _tinkerConnectionFinished];
}

- (void)didBTConnectDevice:(id)a3
{
  id v3 = a3;
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 pairingID];
    int v6 = 136315394;
    id v7 = "-[COSPairedDeviceListViewController didBTConnectDevice:]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didUpdateAsDisconnectedDevice:(id)a3
{
  id v3 = a3;
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 pairingID];
    int v6 = 136315394;
    id v7 = "-[COSPairedDeviceListViewController didUpdateAsDisconnectedDevice:]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)findMigratingDeviceCell:(id)a3
{
  id v19 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    id v18 = 0;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        __int16 v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [v8 propertyForKey:@"COSAssociatedDevice"];
        __int16 v10 = [v9 pairingID];
        CFStringRef v11 = [v19 pairingID];
        unsigned int v12 = [v10 isEqual:v11];

        if (v12)
        {
          int v13 = [(COSPairedDeviceListViewController *)self indexPathForSpecifier:v8];
          int v14 = [(COSPairedDeviceListViewController *)self table];
          uint64_t v15 = [(COSPairedDeviceListViewController *)self tableView:v14 cellForRowAtIndexPath:v13];

          id v18 = (id)v15;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)migrationProgressUpdate:(unint64_t)a3 percentageComplete:(double)a4 migratingDevice:(id)a5
{
  id v8 = a5;
  id v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [v8 pairingID];
    *(_DWORD *)buf = 134218498;
    double v28 = a4;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migration progress update(COSPairedDeviceListViewController) %f %lu %@", buf, 0x20u);
  }
  if (a3 != 4)
  {
    [(COSPairedDeviceListViewController *)self _configureBackButtonBehavior];
    CFStringRef v11 = [(COSPairedDeviceListViewController *)self specifierDataSource];
    unsigned int v12 = [v11 pairNew];

    unint64_t v13 = [(COSMigrationManager *)self->_migrationManager currentState];
    uint64_t v14 = PSEnabledKey;
    uint64_t v15 = [v12 propertyForKey:PSEnabledKey];
    unsigned int v16 = [v15 BOOLValue];

    if (v13)
    {
      if (v16)
      {
        [v12 setProperty:&__kCFBooleanFalse forKey:v14];
        __int16 v17 = v25;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        id v18 = sub_1000DADAC;
LABEL_10:
        v17[2] = v18;
        v17[3] = &unk_100243908;
        v17[4] = self;
        v17[5] = v12;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
      }
    }
    else if ((v16 & 1) == 0)
    {
      [v12 setProperty:&__kCFBooleanTrue forKey:v14];
      __int16 v17 = v24;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      id v18 = sub_1000DADB8;
      goto LABEL_10;
    }
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000DADC4;
    v20[3] = &unk_100246C18;
    objc_copyWeak(v23, (id *)buf);
    id v19 = v8;
    v23[1] = (id)a3;
    v23[2] = *(id *)&a4;
    id v21 = v19;
    long long v22 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);

    goto LABEL_12;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAD0C;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_12:
}

- (void)reloadSpecifiers
{
  migratingDeviceCell = self->_migratingDeviceCell;
  self->_migratingDeviceCell = 0;

  v4.receiver = self;
  v4.super_class = (Class)COSPairedDeviceListViewController;
  [(COSPairedDeviceListViewController *)&v4 reloadSpecifiers];
}

- (void)displaySoftwareUpdatePane:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"COSAssociatedDevice"];
  uint64_t v6 = [v5 valueForProperty:NRDevicePropertyIsActive];
  unsigned __int8 v7 = [v6 BOOLValue];

  id v8 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  [v8 BOOLValue];

  if (v7)
  {
    [(COSPairedDeviceListViewController *)self presentSoftwareUpdatePane];
  }
  else
  {
    id v9 = [(COSPairedDeviceListViewController *)self indexPathForSpecifier:v4];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DB008;
    v10[3] = &unk_1002438A0;
    v10[4] = self;
    [(COSPairedDeviceListViewController *)self _switchToDeviceWithSpecifier:v4 atIndex:v9 successCompletion:v10];
  }
}

- (void)presentSoftwareUpdatePane
{
  id v3 = [(COSPairedDeviceListViewController *)self updateController];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [(COSPairedDeviceListViewController *)self setUpdateController:v4];
  }
  objc_initWeak(&location, self);
  id v5 = [(COSPairedDeviceListViewController *)self updateController];
  uint64_t v6 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  unsigned __int8 v7 = [(COSPairedDeviceListViewController *)self navigationController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DB1CC;
  v8[3] = &unk_100243C00;
  objc_copyWeak(&v9, &location);
  [v5 presentModalForDevice:v6 userForcedUpdate:0 withController:v7 unpairOnExit:0 animated:1 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  uint64_t v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v10 = "-[COSPairedDeviceListViewController manager:didFailInstallation:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB33C;
  block[3] = &unk_1002439E0;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[COSPairedDeviceListViewController manager:didFinishInstallation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB4C0;
  block[3] = &unk_1002439E0;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  uint64_t v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v10 = "-[COSPairedDeviceListViewController manager:didFailDownload:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB644;
  block[3] = &unk_1002439E0;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (unint64_t)currentBackButtonBehavior
{
  return self->_currentBackButtonBehavior;
}

- (void)setCurrentBackButtonBehavior:(unint64_t)a3
{
  self->_currentBackButtonBehavior = a3;
}

- (BPSTinkerConnectionTracker)connectionTracker
{
  return self->_connectionTracker;
}

- (void)setConnectionTracker:(id)a3
{
}

- (OS_dispatch_source)tinkerConnectionTimeout
{
  return self->_tinkerConnectionTimeout;
}

- (void)setTinkerConnectionTimeout:(id)a3
{
}

- (BOOL)userInitiatedTinkerSwitch
{
  return self->_userInitiatedTinkerSwitch;
}

- (void)setUserInitiatedTinkerSwitch:(BOOL)a3
{
  self->_userInitiatedTinkerSwitch = a3;
}

- (BOOL)showTinkerSwitchCancelOption
{
  return self->_showTinkerSwitchCancelOption;
}

- (BOOL)launchedByNanoRegistry
{
  return self->_launchedByNanoRegistry;
}

- (void)setLaunchedByNanoRegistry:(BOOL)a3
{
  self->_launchedByNanoRegistry = a3;
}

- (BOOL)swuPaneDisplayed
{
  return self->_swuPaneDisplayed;
}

- (void)setSwuPaneDisplayed:(BOOL)a3
{
  self->_swuPaneDisplayed = a3;
}

- (PSSpecifier)selectedDeviceSpecifierPriorToUpdate
{
  return self->_selectedDeviceSpecifierPriorToUpdate;
}

- (void)setSelectedDeviceSpecifierPriorToUpdate:(id)a3
{
}

- (COSSoftwareUpdateController)updateController
{
  return self->_updateController;
}

- (void)setUpdateController:(id)a3
{
}

- (COSWatchUnpairInstructionsController)unpairInstructionsController
{
  return self->_unpairInstructionsController;
}

- (void)setUnpairInstructionsController:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (COSMigrationManager)migrationManager
{
  return self->_migrationManager;
}

- (void)setMigrationManager:(id)a3
{
}

- (COSPairedDeviceListTableCell)migratingDeviceCell
{
  return self->_migratingDeviceCell;
}

- (void)setMigratingDeviceCell:(id)a3
{
}

- (SUBManager)subManager
{
  return self->_subManager;
}

- (void)setSubManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subManager, 0);
  objc_storeStrong((id *)&self->_migratingDeviceCell, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_unpairInstructionsController, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_selectedDeviceSpecifierPriorToUpdate, 0);
  objc_storeStrong((id *)&self->_tinkerConnectionTimeout, 0);

  objc_storeStrong((id *)&self->_connectionTracker, 0);
}

@end