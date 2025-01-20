@interface SSUSBApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)setupWindowWithNewRoot;
- (int64_t)pnpDeviceTypeForType:(unint64_t)a3;
- (unint64_t)pendingOperation;
- (void)acquireHUDTransaction;
- (void)activate;
- (void)didRequestEnablingBluetooth;
- (void)didTapToPairPencil;
- (void)dismissBTPrompt;
- (void)dismissBanner;
- (void)dismissChargingStatus;
- (void)dismissUIAnimated:(BOOL)a3;
- (void)dismissUnlockPrompt;
- (void)displayBannerWithModel:(id)a3;
- (void)releaseHUDTransaction;
- (void)setPendingOperation:(unint64_t)a3;
- (void)showChargingStatus;
- (void)showEnableBluetoothPill;
- (void)showPairConsentPrompt;
- (void)showPairingFailure;
- (void)showPairingStarted;
- (void)showSubsequentPairSuccess;
- (void)showUnlockPrompt;
- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(unint64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9;
- (void)updatePairedUnlockBannerToUnlocked;
- (void)viewControllerDidDismiss:(id)a3;
@end

@implementation SSUSBApplicationDelegate

- (void)activate
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "activate called.", buf, 2u);
  }

  if (gInitialTransaction) {
    v4 = (OS_os_transaction *)(id)gInitialTransaction;
  }
  else {
    v4 = (OS_os_transaction *)os_transaction_create();
  }
  transaction = self->_transaction;
  self->_transaction = v4;

  v6 = (void *)gInitialTransaction;
  gInitialTransaction = 0;

  v7 = objc_alloc_init(SHUDBannerManager);
  bannerManager = self->_bannerManager;
  self->_bannerManager = v7;

  v9 = objc_alloc_init(SHUDManager);
  hudManager = self->_hudManager;
  self->_hudManager = v9;

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id location = 0;
  objc_initWeak(&location, self->_hudManager);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000067E4;
  v37[3] = &unk_100014500;
  objc_copyWeak(&v38, &location);
  [(SHUDBannerManager *)self->_bannerManager setBannerDidDismissHandler:v37];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100006834;
  v35[3] = &unk_100014500;
  objc_copyWeak(&v36, &location);
  [(SHUDBannerManager *)self->_bannerManager setBannerButtonDidTap:v35];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100006884;
  v33[3] = &unk_100014528;
  objc_copyWeak(&v34, (id *)buf);
  [(SHUDManager *)self->_hudManager setBannerRequestHandler:v33];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100006990;
  v31[3] = &unk_1000143F8;
  objc_copyWeak(&v32, (id *)buf);
  [(SHUDManager *)self->_hudManager setUpdatePairedUnlockHandler:v31];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100006A60;
  v29[3] = &unk_1000143F8;
  objc_copyWeak(&v30, (id *)buf);
  [(SHUDManager *)self->_hudManager setDismissBannerHandler:v29];
  v11 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v11;

  id v13 = &_dispatch_main_q;
  [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:&_dispatch_main_q];

  id from = 0;
  objc_initWeak(&from, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100006B30;
  v26[3] = &unk_1000143F8;
  objc_copyWeak(&v27, &from);
  [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v26];
  [(CUSystemMonitor *)self->_systemMonitor activateWithCompletion:0];
  v14 = [(SHUDManager *)self->_hudManager currentBannerRequest];
  v15 = v14;
  if (v14 && [v14 type] != (id)2)
  {
    [(SSUSBApplicationDelegate *)self displayBannerWithModel:v15];
  }
  else
  {
    v16 = +[UIDevice currentDevice];
    unsigned int v17 = [v16 _supportsPencil];

    if (v17)
    {
      v18 = (FBSOrientationObserver *)objc_opt_new();
      orientationObserver = self->_orientationObserver;
      self->_orientationObserver = v18;

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100006C24;
      v25[3] = &unk_100014550;
      v25[4] = self;
      v20 = objc_retainBlock(v25);
      [(FBSOrientationObserver *)self->_orientationObserver activeInterfaceOrientationWithCompletion:v20];
      [(FBSOrientationObserver *)self->_orientationObserver setHandler:v20];
      v21 = (SFB332SetupObserver *)objc_opt_new();
      b332Observer = self->_b332Observer;
      self->_b332Observer = v21;

      [(SFB332SetupObserver *)self->_b332Observer setDispatchQueue:&_dispatch_main_q];
      [(SFB332SetupObserver *)self->_b332Observer setDelegate:self];
      [(SFB332SetupObserver *)self->_b332Observer activate];
    }
    else
    {
      v23 = b332_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SharingHUDService - This device type doesn't need to use SharingHUDService.", v24, 2u);
      }
    }
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = b332_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didFinishLaunchingWithOptions...", buf, 2u);
  }

  v6 = b332_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "calling block", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007014;
  v9[3] = &unk_1000144D8;
  v9[4] = self;
  [UIApp _performBlockAfterCATransactionCommits:v9];
  v7 = b332_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didFinish!", buf, 2u);
  }

  return 1;
}

- (void)dismissUIAnimated:(BOOL)a3
{
  v4 = b332_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = [(SSUSBApplicationDelegate *)self pendingOperation];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dismissUI. pendingOperation: (%lu)", (uint8_t *)&v8, 0xCu);
  }

  v5 = [(B332PillWindow *)self->_b332ChargingWindow rootViewController];
  [v5 dismissViewControllerAnimated:1 completion:&stru_100014570];

  objc_storeWeak((id *)&self->_enableBluetoothVC, 0);
  objc_storeWeak((id *)&self->_lockVC, 0);
  objc_storeWeak((id *)&self->_displayViewController, 0);
  objc_storeWeak((id *)&self->_displayViewControllerPendingDismiss, 0);
  b332ChargingWindow = self->_b332ChargingWindow;
  self->_b332ChargingWindow = 0;

  self->_currentOperation = [(SSUSBApplicationDelegate *)self pendingOperation];
  switch([(SSUSBApplicationDelegate *)self pendingOperation])
  {
    case 1uLL:
      [(SSUSBApplicationDelegate *)self showUnlockPrompt];
      break;
    case 2uLL:
      [(SSUSBApplicationDelegate *)self showChargingStatus];
      break;
    case 3uLL:
      [(SSUSBApplicationDelegate *)self showPairingStarted];
      break;
    case 4uLL:
      [(SSUSBApplicationDelegate *)self showPairConsentPrompt];
      break;
    default:
      break;
  }
  v7 = b332_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setPendingOperation: PendingOperationTypeNone", (uint8_t *)&v8, 2u);
  }

  self->_pendingOperation = 0;
}

- (void)setPendingOperation:(unint64_t)a3
{
  v5 = b332_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentOperation = self->_currentOperation;
    int v7 = 134218240;
    unint64_t v8 = a3;
    __int16 v9 = 2048;
    unint64_t v10 = currentOperation;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setPendingOperation: (%lu), currentOperation: (%lu)", (uint8_t *)&v7, 0x16u);
  }

  if (self->_currentOperation != a3) {
    self->_pendingOperation = a3;
  }
}

- (void)showChargingStatus
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showChargingStatus", buf, 2u);
  }

  deviceState = self->_deviceState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained setDeviceState:deviceState];

  v6 = self->_deviceState;
  int v7 = v6;
  if (v6 && ([(PNPDeviceState *)v6 batteryLevelUnknown] & 1) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_displayViewController);
    [v8 showGenericBatteryUI];
  }
  id v9 = objc_loadWeakRetained((id *)&self->_displayViewController);

  if (!v9)
  {
    unint64_t v10 = [(SSUSBApplicationDelegate *)self setupWindowWithNewRoot];
    if (v10)
    {
      self->_unint64_t currentOperation = 2;
      off_10001CCA8();
      v11 = objc_opt_new();
      [v11 setDelegate:self];
      [v11 setAppearanceDelegate:self];
      [v11 setDeviceState:self->_deviceState];
      objc_storeWeak((id *)&self->_displayViewController, v11);
      [v10 presentViewController:v11 animated:1 completion:&stru_100014590];
      v12 = self->_deviceState;
      id v13 = v12;
      if (v12)
      {
        if ([(PNPDeviceState *)v12 batteryLevelUnknown]) {
          [v11 showGenericBatteryUI];
        }
        else {
          [v11 pairingSucceededSubsequently];
        }
      }
    }
    else
    {
      [(SSUSBApplicationDelegate *)self setPendingOperation:2];
      v11 = b332_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "showChargingStatus - bailing", v14, 2u);
      }
    }
  }
}

- (void)dismissChargingStatus
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dismissChargingStatus", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained pairingFailed];

  if (self->_pendingOperation == 2) {
    self->_pendingOperation = 0;
  }
}

- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(unint64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  v16 = (Class (__cdecl *)())off_10001CCB0;
  id v17 = a9;
  id v18 = objc_alloc_init(v16());
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v18, "setDeviceType:", -[SSUSBApplicationDelegate pnpDeviceTypeForType:](self, "pnpDeviceTypeForType:", a3));
  }
  [v18 setEdge:a6];
  [v18 setOrientation:a7];
  [v18 setIdentifier:v17];

  [v18 setBatteryLevelUnknown:!v12];
  [v18 setBatteryLevel:a4];
  [v18 setIsCharging:v9];
  v19 = b332_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109120;
    v24[1] = [v18 batteryLevelUnknown];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updateDeviceInfoWithName. batteryLevelUnknown: %i", (uint8_t *)v24, 8u);
  }

  deviceState = self->_deviceState;
  self->_deviceState = (PNPDeviceState *)v18;
  id v21 = v18;

  v22 = self->_deviceState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained setDeviceState:v22];
}

- (int64_t)pnpDeviceTypeForType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_10000EB00[a3 - 1];
  }
}

- (void)showUnlockPrompt
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained pairingFailed];

  v4 = b332_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    unint64_t v8 = [(SSUSBApplicationDelegate *)self pendingOperation];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "showUnlockPrompt. Pending type? %lu", (uint8_t *)&v7, 0xCu);
  }

  v5 = [(SSUSBApplicationDelegate *)self setupWindowWithNewRoot];
  if (v5)
  {
    self->_unint64_t currentOperation = 1;
    off_10001CCB8();
    v6 = objc_opt_new();
    objc_storeWeak((id *)&self->_lockVC, v6);
    [v6 setAppearanceDelegate:self];
    [v6 setDeviceState:self->_deviceState];
    [v5 presentViewController:v6 animated:0 completion:0];
  }
  else
  {
    [(SSUSBApplicationDelegate *)self setPendingOperation:1];
    v6 = b332_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "showUnlockPrompt - bail", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)showPairConsentPrompt
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    unint64_t v19 = [(SSUSBApplicationDelegate *)self pendingOperation];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showPairConsentPrompt. Pending type? %lu", (uint8_t *)&v18, 0xCu);
  }

  deviceState = self->_deviceState;
  p_displayViewController = &self->_displayViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained setDeviceState:deviceState];

  id v7 = objc_loadWeakRetained((id *)&self->_lockVC);
  if (v7 || (id v7 = objc_loadWeakRetained((id *)&self->_enableBluetoothVC)) != 0)
  {

    goto LABEL_6;
  }
  if (self->_b332ChargingWindow)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_displayViewController);
    if (!v9
      || (unint64_t v10 = v9,
          id v11 = objc_loadWeakRetained((id *)&self->_displayViewControllerPendingDismiss),
          v11,
          v10,
          v11))
    {
LABEL_6:
      unint64_t v8 = b332_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "showPairConsentPrompt - bail", (uint8_t *)&v18, 2u);
      }

      [(SSUSBApplicationDelegate *)self setPendingOperation:4];
      return;
    }
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)&self->_displayViewControllerPendingDismiss);

    if (v12) {
      goto LABEL_6;
    }
  }
  self->_unint64_t currentOperation = 4;
  id v13 = [(SSUSBApplicationDelegate *)self setupWindowWithNewRoot];
  if (v13)
  {
    off_10001CCA8();
    v14 = objc_opt_new();
    objc_storeWeak((id *)&self->_displayViewController, v14);
    [v14 setAppearanceDelegate:self];
    [v14 setDelegate:self];
    [v14 setDeviceState:self->_deviceState];
    [v13 presentViewController:v14 animated:0 completion:0];
  }
  id v15 = objc_loadWeakRetained((id *)&self->_displayViewController);
  [v15 showPairingPrompt];

  v16 = self->_deviceState;
  id v17 = objc_loadWeakRetained((id *)p_displayViewController);
  [v17 setDeviceState:v16];
}

- (void)didRequestEnablingBluetooth
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "didRequestEnablingBluetooth.", v4, 2u);
  }

  [(SFB332SetupObserver *)self->_b332Observer enableBluetoothTapped];
}

- (void)didTapToPairPencil
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "didTapToPairPencil.", v5, 2u);
  }

  [(SFB332SetupObserver *)self->_b332Observer pairTapped];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained showGenericBatteryUI];
}

- (void)showEnableBluetoothPill
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showEnableBluetoothPill.", buf, 2u);
  }

  v4 = [(SSUSBApplicationDelegate *)self setupWindowWithNewRoot];
  if (v4)
  {
    [(B332PillWindow *)self->_b332ChargingWindow makeKeyAndVisible];
    off_10001CCC0();
    v5 = objc_opt_new();
    objc_storeWeak((id *)&self->_enableBluetoothVC, v5);
    [v5 setAppearanceDelegate:self];
    [v5 setDeviceState:self->_deviceState];
    [v5 setDelegate:self];
    [v4 presentViewController:v5 animated:0 completion:0];
  }
  else
  {
    v5 = b332_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "showEnableBluetoothPill - bail", v6, 2u);
    }
  }
}

- (void)dismissUnlockPrompt
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dismissUnlockPrompt", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockVC);
  [WeakRetained dismissPill];

  objc_storeWeak((id *)&self->_lockVC, 0);
  if (self->_pendingOperation == 1) {
    self->_pendingOperation = 0;
  }
}

- (void)dismissBTPrompt
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dismissBTPrompt", v6, 2u);
  }

  p_enableBluetoothVC = &self->_enableBluetoothVC;
  id WeakRetained = objc_loadWeakRetained((id *)p_enableBluetoothVC);
  [WeakRetained dismissPill];

  objc_storeWeak((id *)p_enableBluetoothVC, 0);
}

- (void)acquireHUDTransaction
{
  transaction = self->_transaction;
  v4 = b332_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "yes";
    if (!transaction) {
      v5 = "no";
    }
    int v8 = 136315138;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "acquireHUDTransaction - exists? %s", (uint8_t *)&v8, 0xCu);
  }

  if (!transaction)
  {
    v6 = (OS_os_transaction *)os_transaction_create();
    id v7 = self->_transaction;
    self->_transaction = v6;
  }
}

- (void)releaseHUDTransaction
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    transaction = self->_transaction;
    *(_DWORD *)buf = 134217984;
    id v11 = transaction;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "releaseHUDTransaction - %p", buf, 0xCu);
  }

  v5 = self->_transaction;
  if (v5)
  {
    v6 = v5;
    dispatch_time_t v7 = dispatch_time(0, 20000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008120;
    block[3] = &unk_1000144D8;
    block[4] = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  int v8 = self->_transaction;
  self->_transaction = 0;
}

- (id)setupWindowWithNewRoot
{
  if (qword_10001D0A0 != -1) {
    dispatch_once(&qword_10001D0A0, &stru_1000145B0);
  }
  if (self->_b332ChargingWindow)
  {
    v3 = 0;
  }
  else
  {
    v4 = (B332PillWindow *)objc_opt_new();
    b332ChargingWindow = self->_b332ChargingWindow;
    self->_b332ChargingWindow = v4;

    v6 = b332_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t orientation = self->_orientation;
      int v18 = 134217984;
      int64_t v19 = orientation;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "--setting orientation (%li)...", (uint8_t *)&v18, 0xCu);
    }

    int v8 = b332_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(B332PillWindow *)self->_b332ChargingWindow interfaceOrientation];
      int v18 = 134217984;
      int64_t v19 = (int64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "--new orientation (%li)...", (uint8_t *)&v18, 0xCu);
    }

    unint64_t v10 = b332_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(B332PillWindow *)self->_b332ChargingWindow _windowInterfaceOrientation];
      int v18 = 134217984;
      int64_t v19 = (int64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "--new window orientation (%li)...", (uint8_t *)&v18, 0xCu);
    }

    [(B332PillWindow *)self->_b332ChargingWindow setAutorotates:1];
    id v12 = +[UIScreen mainScreen];
    [(B332PillWindow *)self->_b332ChargingWindow setScreen:v12];

    [(B332PillWindow *)self->_b332ChargingWindow setHidden:0];
    id v13 = +[UIColor clearColor];
    [(B332PillWindow *)self->_b332ChargingWindow setBackgroundColor:v13];

    [(B332PillWindow *)self->_b332ChargingWindow setWindowLevel:UIScreenshotServicesWindowLevel + -1.0];
    [(B332PillWindow *)self->_b332ChargingWindow _setWindowControlsStatusBarOrientation:0];
    v3 = objc_opt_new();
    v14 = [v3 view];
    [v14 setUserInteractionEnabled:0];

    id v15 = +[UIColor clearColor];
    v16 = [v3 view];
    [v16 setBackgroundColor:v15];

    [(B332PillWindow *)self->_b332ChargingWindow setRootViewController:v3];
    [(B332PillWindow *)self->_b332ChargingWindow _setRotatableViewOrientation:self->_orientation duration:1 force:self->_duration];
    [(B332PillWindow *)self->_b332ChargingWindow resignKeyWindow];
  }
  return v3;
}

- (void)showPairingStarted
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showPairingStarted", v14, 2u);
  }

  deviceState = self->_deviceState;
  p_displayViewController = &self->_displayViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained setDeviceState:deviceState];

  id v7 = objc_loadWeakRetained((id *)&self->_lockVC);
  if (v7 || (id v7 = objc_loadWeakRetained((id *)&self->_enableBluetoothVC)) != 0)
  {

LABEL_6:
    [(SSUSBApplicationDelegate *)self setPendingOperation:3];
    return;
  }
  if (self->_b332ChargingWindow)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_displayViewController);

    if (!v8) {
      goto LABEL_6;
    }
  }
  self->_unint64_t currentOperation = 3;
  id v9 = [(SSUSBApplicationDelegate *)self setupWindowWithNewRoot];
  if (v9)
  {
    off_10001CCA8();
    unint64_t v10 = objc_opt_new();
    objc_storeWeak((id *)&self->_displayViewController, v10);
    [v10 setAppearanceDelegate:self];
    [v10 setDelegate:self];
    [v10 setDeviceState:self->_deviceState];
    [v10 setModalPresentationStyle:0];
    [v9 presentViewController:v10 animated:0 completion:0];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_displayViewController);
  [v11 pairingStarted];

  id v12 = self->_deviceState;
  id v13 = objc_loadWeakRetained((id *)p_displayViewController);
  [v13 setDeviceState:v12];
}

- (void)showPairingFailure
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showPairingFailure, if view controller exists. (This is not necessarily an error, this is just the name of the method in the PencilPairingUI framework to dismiss the view controller.)", v6, 2u);
  }

  self->_unint64_t currentOperation = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained pairingFailed];

  id v5 = objc_loadWeakRetained((id *)&self->_displayViewController);
  objc_storeWeak((id *)&self->_displayViewControllerPendingDismiss, v5);

  [(SSUSBApplicationDelegate *)self dismissBTPrompt];
}

- (void)showSubsequentPairSuccess
{
  v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "showSubsequentPairSuccess", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayViewController);
  [WeakRetained pairingSucceededSubsequently];
}

- (void)viewControllerDidDismiss:(id)a3
{
  v4 = b332_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PNPViewControllerAppearanceDelegate viewControllerDidDismiss", v5, 2u);
  }

  [(SSUSBApplicationDelegate *)self dismissUIAnimated:0];
}

- (void)displayBannerWithModel:(id)a3
{
}

- (void)updatePairedUnlockBannerToUnlocked
{
  id v6 = [(SHUDManager *)self->_hudManager currentBannerRequest];
  bannerManager = self->_bannerManager;
  v4 = [v6 watchName];
  id v5 = +[SFHUDBannerModel pairedUnlockModelWithWatchName:needsLockButton:needsUpdate:](SFHUDBannerModel, "pairedUnlockModelWithWatchName:needsLockButton:needsUpdate:", v4, [v6 needsLockButton], 0);
  [(SHUDBannerManager *)bannerManager postBannerWithModel:v5];
}

- (void)dismissBanner
{
}

- (unint64_t)pendingOperation
{
  return self->_pendingOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_hudManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
  objc_destroyWeak((id *)&self->_enableBluetoothVC);
  objc_destroyWeak((id *)&self->_lockVC);
  objc_destroyWeak((id *)&self->_displayViewControllerPendingDismiss);
  objc_destroyWeak((id *)&self->_displayViewController);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_b332ChargingWindow, 0);
  objc_storeStrong((id *)&self->_b332Observer, 0);
}

@end