@interface COSRestoreSelectionViewController
+ (BOOL)controllerNeedsToRun;
+ (void)tellLinkUpgradeMonitorAboutBackupStepCompletion;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSRestoreSelectionViewController)init;
- (COSSetupSoftwareUpdateManager)setupUpdateManager;
- (NRDevice)device;
- (NSArray)backups;
- (NSArray)pairedDevices;
- (NSIndexPath)selectedIndex;
- (NSMutableArray)restoreInstances;
- (OBBoldTrayButton)continueButton;
- (OBLinkTrayButton)setupAsNewButton;
- (UITableView)backupsTableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)backupIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_restoreCompletedWithSuccess;
- (void)_restoreFailedWithError:(id)a3;
- (void)_skipRestoreFromBackup;
- (void)_triggerRestoreFromBackupIndex:(int64_t)a3;
- (void)_triggerRestoreFromDeviceIndex:(int64_t)a3;
- (void)_triggerRestoreFromIndex:(int64_t)a3;
- (void)_triggerUpdate:(int64_t)a3;
- (void)backupsChanged:(unint64_t)a3;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)setBackupIndex:(int64_t)a3;
- (void)setBackups:(id)a3;
- (void)setBackupsTableView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDevice:(id)a3;
- (void)setPairedDevices:(id)a3;
- (void)setRestoreInstances:(id)a3;
- (void)setSelectedIndex:(id)a3;
- (void)setSetupAsNewButton:(id)a3;
- (void)setSetupUpdateManager:(id)a3;
- (void)tappedContinueButton:(id)a3;
- (void)tappedNewButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSRestoreSelectionViewController

- (COSRestoreSelectionViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)COSRestoreSelectionViewController;
  v2 = [(COSSetupPageViewController *)&v13 init];
  if (v2)
  {
    v3 = +[UIApplication sharedApplication];
    uint64_t v4 = [v3 activeWatch];
    device = v2->_device;
    v2->_device = (NRDevice *)v4;

    v6 = +[COSBackupManager sharedBackupManager];
    uint64_t v7 = [v6 backups];
    backups = v2->_backups;
    v2->_backups = (NSArray *)v7;

    v9 = +[COSBackupManager sharedBackupManager];
    uint64_t v10 = [v9 pairedDevices];
    pairedDevices = v2->_pairedDevices;
    v2->_pairedDevices = (NSArray *)v10;
  }
  return v2;
}

- (void)dealloc
{
  device = self->_device;
  uint64_t v6 = NRDevicePropertyLocalPairingDataStorePath;
  uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [(NRDevice *)device removePropertyObserver:self forPropertyChanges:v4];

  v5.receiver = self;
  v5.super_class = (Class)COSRestoreSelectionViewController;
  [(COSRestoreSelectionViewController *)&v5 dealloc];
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];

  return v3 ^ 1;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)COSRestoreSelectionViewController;
  [(COSRestoreSelectionViewController *)&v27 viewDidLoad];
  unsigned __int8 v3 = [(COSRestoreSelectionViewController *)self headerView];
  uint64_t v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"RESTORE_TITLE" value:&stru_100249230 table:@"Localizable"];
  [v3 setTitle:v5];

  uint64_t v6 = [(COSRestoreSelectionViewController *)self headerView];
  uint64_t v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"RESTORE_INSTRUCTION" value:&stru_100249230 table:@"Localizable"];
  [v6 setDetailText:v8];

  v9 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v9;

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:"tappedContinueButton:" forControlEvents:64];
  v11 = self->_continueButton;
  v12 = +[NSBundle mainBundle];
  objc_super v13 = [v12 localizedStringForKey:@"CONTINUE_SETUP" value:&stru_100249230 table:@"Localizable"];
  [(OBBoldTrayButton *)v11 setTitle:v13 forState:0];

  v14 = self->_continueButton;
  v15 = BPSPillSelectedColor();
  [(OBBoldTrayButton *)v14 setTintColor:v15];

  v16 = [(COSRestoreSelectionViewController *)self buttonTray];
  [v16 addButton:self->_continueButton];

  [(OBBoldTrayButton *)self->_continueButton setHidden:1];
  v17 = +[OBLinkTrayButton linkButton];
  setupAsNewButton = self->_setupAsNewButton;
  self->_setupAsNewButton = v17;

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"SETUP_NEW_%@" value:&stru_100249230 table:@"Localizable"];
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
  v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v22);

  [(OBLinkTrayButton *)self->_setupAsNewButton setTitle:v23 forState:0];
  [(OBLinkTrayButton *)self->_setupAsNewButton addTarget:self action:"tappedNewButton:" forControlEvents:64];
  v24 = [(COSRestoreSelectionViewController *)self buttonTray];
  [v24 addButton:self->_setupAsNewButton];

  v25 = -[COSContentSizedTableView initWithFrame:style:]([COSContentSizedTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  backupsTableView = self->_backupsTableView;
  self->_backupsTableView = &v25->super;

  [(UITableView *)self->_backupsTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_backupsTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"COSRestoreTableViewCellID"];
  [(UITableView *)self->_backupsTableView setDelegate:self];
  [(UITableView *)self->_backupsTableView setDataSource:self];
  [(COSRestoreSelectionViewController *)self setTableView:self->_backupsTableView];
}

- (void)tappedContinueButton:(id)a3
{
  uint64_t v4 = [(UITableView *)self->_backupsTableView indexPathForSelectedRow];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = [v4 row];
    uint64_t v7 = [(UITableView *)self->_backupsTableView cellForRowAtIndexPath:v5];
    unsigned int v8 = [v7 updateRequired];
    v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Continuing with backup at index: %li", (uint8_t *)&v10, 0xCu);
    }

    [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
    [(UITableView *)self->_backupsTableView setUserInteractionEnabled:0];
    if (v8) {
      [(COSRestoreSelectionViewController *)self _triggerUpdate:v6];
    }
    else {
      [(COSRestoreSelectionViewController *)self _triggerRestoreFromIndex:v6];
    }
  }
  else
  {
    uint64_t v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100171EC0(v7);
    }
  }
}

- (void)tappedNewButton:(id)a3
{
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 156.0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_selectedIndex = &self->_selectedIndex;
  if ([(NSIndexPath *)self->_selectedIndex isEqual:v7])
  {
    v9 = [v6 cellForRowAtIndexPath:v7];
    [v9 setSelected:0];

    [(OBLinkTrayButton *)self->_setupAsNewButton setEnabled:1];
    [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
    int v10 = *p_selectedIndex;
    *p_selectedIndex = 0;
  }
  else
  {
    if (*p_selectedIndex)
    {
      id v11 = [v6 cellForRowAtIndexPath:];
      [v11 setSelected:0];
    }
    v12 = [v6 cellForRowAtIndexPath:v7];
    [v12 setSelected:1];

    objc_storeStrong((id *)&self->_selectedIndex, a4);
    [(OBLinkTrayButton *)self->_setupAsNewButton setEnabled:0];
    [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
    [(OBBoldTrayButton *)self->_continueButton setHidden:0];
  }

  return v7;
}

- (void)_triggerRestoreFromIndex:(int64_t)a3
{
  uint64_t v5 = NRDevicePropertyLocalPairingDataStorePath;
  id v6 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (v6)
  {
    if ([(NSArray *)self->_pairedDevices count] <= a3) {
      [(COSRestoreSelectionViewController *)self _triggerRestoreFromBackupIndex:a3 - [(NSArray *)self->_pairedDevices count]];
    }
    else {
      [(COSRestoreSelectionViewController *)self _triggerRestoreFromDeviceIndex:a3];
    }
  }
  else
  {
    self->_backupIndex = a3;
    id v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100171F04(v7);
    }

    device = self->_device;
    uint64_t v10 = v5;
    v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [(NRDevice *)device addPropertyObserver:self forPropertyChanges:v9];
  }
}

- (void)_triggerUpdate:(int64_t)a3
{
  uint64_t v5 = [UIApp setupController];
  id v6 = [v5 setupSoftwareUpdateManager];
  setupUpdateManager = self->_setupUpdateManager;
  self->_setupUpdateManager = v6;

  objc_initWeak(&location, self);
  unsigned int v8 = self->_setupUpdateManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004FCB4;
  v9[3] = &unk_100244778;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  [(COSSetupSoftwareUpdateManager *)v8 startUpdateInSetupWithController:self forcedUpdateOrUpdateInBackup:1 completion:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_triggerRestoreFromBackupIndex:(int64_t)a3
{
  uint64_t v4 = [(NSArray *)self->_backups objectAtIndex:a3];
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin Restore from Backup (%@)", buf, 0xCu);
  }

  id v6 = +[COSBackupManager sharedBackupManager];
  device = self->_device;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000500CC;
  v9[3] = &unk_1002447A0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 restoreFromBackup:v8 toDevice:device completionHandler:v9];
}

- (void)_triggerRestoreFromDeviceIndex:(int64_t)a3
{
  uint64_t v4 = [(NSArray *)self->_pairedDevices objectAtIndex:a3];
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 _bridgeConciseDebugDescription];
    *(_DWORD *)buf = 138412290;
    objc_super v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin Restore from Other Paired Device (%@)", buf, 0xCu);
  }
  id v7 = +[COSBackupManager sharedBackupManager];
  device = self->_device;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_1000503F8;
  v10[3] = &unk_1002447A0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v7 restoreFromDevice:v9 toDevice:device completionHandler:v10];
}

- (void)_restoreFailedWithError:(id)a3
{
  backupsTableView = self->_backupsTableView;
  id v4 = a3;
  [(UITableView *)backupsTableView setUserInteractionEnabled:1];
  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"RESTORE_FAILED" value:&stru_100249230 table:@"Localizable"];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"PAIRING_FAILED_ERR_%@" value:&stru_100249230 table:@"Localizable"];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  id v10 = +[UIAlertController alertControllerWithTitle:v6 message:v9 preferredStyle:1];

  id v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  objc_super v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
  [v10 addAction:v13];

  v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting 'restore failed' alert", buf, 2u);
  }

  [(COSRestoreSelectionViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)_restoreCompletedWithSuccess
{
  [(UITableView *)self->_backupsTableView setUserInteractionEnabled:1];
  if (PBLogPerformanceMetrics())
  {
    unsigned __int8 v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v3 beginMacroActivity:@"COSPostWristChoiceUserWaitPhase" beginTime:CFAbsoluteTimeGetCurrent()];
  }
  [(id)objc_opt_class() tellLinkUpgradeMonitorAboutBackupStepCompletion];
  id v4 = +[COSBackupManager sharedBackupManager];
  [v4 setDelegate:0];

  id v5 = [(COSSetupPageViewController *)self delegate];
  [v5 buddyControllerDone:self];
}

- (void)_skipRestoreFromBackup
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User chose to setup as new", v9, 2u);
  }

  [(id)objc_opt_class() tellLinkUpgradeMonitorAboutBackupStepCompletion];
  id v4 = +[COSBackupManager sharedBackupManager];
  [v4 setDelegate:0];

  id v5 = [UIApp setupController];
  unsigned int v6 = [v5 wristChoicesDetected];

  id v7 = [(COSSetupPageViewController *)self delegate];
  id v8 = v7;
  if (v6) {
    [v7 buddyControllerDone:self];
  }
  else {
    [v7 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
}

+ (void)tellLinkUpgradeMonitorAboutBackupStepCompletion
{
  id v3 = [UIApp setupController];
  v2 = [v3 linkUpgradeMonitor];
  [v2 indicateBackupRestoreStepCompleted];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSUInteger v5 = [(NSArray *)self->_backups count];
  unsigned int v6 = +[COSBackupManager sharedBackupManager];
  unsigned __int8 v7 = [v6 recordedPairingTimeBackupsCount];

  if ((v7 & 1) == 0)
  {
    +[PBBridgeCAReporter recordPairingTimeBackupsCount:v5];
    id v8 = +[COSBackupManager sharedBackupManager];
    [v8 setRecordedPairingTimeBackupsCount:1];
  }
  return [(NSArray *)self->_pairedDevices count] + v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a3 dequeueReusableCellWithIdentifier:@"COSRestoreTableViewCellID"];
  id v8 = [v6 row];

  NSUInteger v9 = [(NSArray *)self->_pairedDevices count];
  pairedDevices = self->_pairedDevices;
  if ((unint64_t)v8 >= v9)
  {
    id v11 = [(NSArray *)self->_backups objectAtIndex:v8 - (unsigned char *)[(NSArray *)pairedDevices count]];
    [v7 setRestoreDetailsFromBackup:v11];
  }
  else
  {
    id v11 = [(NSArray *)pairedDevices objectAtIndex:v8];
    [v7 setRestoreDetailsFromDevice:v11];
  }

  return v7;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned int v2 = [UIApp newTinkerAccountCreated];
  if (v2) {
    [(id)objc_opt_class() tellLinkUpgradeMonitorAboutBackupStepCompletion];
  }
  return v2 ^ 1;
}

- (BOOL)holdBeforeDisplaying
{
  id v3 = +[COSBackupManager sharedBackupManager];
  id v4 = [UIApp bridgeController];
  unsigned int v5 = [v4 isTinkerPairing];

  if (v5) {
    [v3 reloadBackups];
  }
  id v6 = [v3 shouldOfferToRestore];
  if (v6)
  {
    unsigned __int8 v7 = +[COSBackupManager sharedBackupManager];
    id v8 = [v7 backups];
    backups = self->_backups;
    self->_backups = v8;
  }
  else
  {
    [v3 setDelegate:self];
  }

  return v6 == 0;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (id)localizedWaitScreenDescription
{
  unsigned int v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"TINKER_BACKUP_LOAD_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
}

- (id)holdActivityIdentifier
{
  return @"TinkerRestoreBackups";
}

- (void)backupsChanged:(unint64_t)a3
{
  unsigned int v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "backups changed with status: %lu", buf, 0xCu);
  }

  id v6 = +[COSBackupManager sharedBackupManager];
  unsigned __int8 v7 = [v6 backups];
  backups = self->_backups;
  self->_backups = v7;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100050F20;
  v9[3] = &unk_1002437D0;
  void v9[4] = self;
  void v9[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  uint64_t v8 = NRDevicePropertyLocalPairingDataStorePath;
  if ([a4 isEqualToString:NRDevicePropertyLocalPairingDataStorePath])
  {
    NSUInteger v9 = [v7 valueForProperty:v8];

    if (v9)
    {
      uint64_t v11 = v8;
      id v10 = +[NSArray arrayWithObjects:&v11 count:1];
      [v7 removePropertyObserver:self forPropertyChanges:v10];

      [(COSRestoreSelectionViewController *)self _triggerRestoreFromIndex:self->_backupIndex];
    }
  }
}

- (NSMutableArray)restoreInstances
{
  return self->_restoreInstances;
}

- (void)setRestoreInstances:(id)a3
{
}

- (int64_t)backupIndex
{
  return self->_backupIndex;
}

- (void)setBackupIndex:(int64_t)a3
{
  self->_backupIndex = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)backups
{
  return self->_backups;
}

- (void)setBackups:(id)a3
{
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (UITableView)backupsTableView
{
  return self->_backupsTableView;
}

- (void)setBackupsTableView:(id)a3
{
}

- (OBLinkTrayButton)setupAsNewButton
{
  return self->_setupAsNewButton;
}

- (void)setSetupAsNewButton:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (NSIndexPath)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(id)a3
{
}

- (COSSetupSoftwareUpdateManager)setupUpdateManager
{
  return self->_setupUpdateManager;
}

- (void)setSetupUpdateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupUpdateManager, 0);
  objc_storeStrong((id *)&self->_selectedIndex, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_setupAsNewButton, 0);
  objc_storeStrong((id *)&self->_backupsTableView, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_backups, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_restoreInstances, 0);
}

@end