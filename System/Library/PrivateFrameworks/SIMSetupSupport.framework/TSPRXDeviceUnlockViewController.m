@interface TSPRXDeviceUnlockViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (CUSystemMonitor)systemMonitor;
- (PRXAction)action;
- (TSPRXDeviceUnlockViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (UIImageView)radioImageView;
- (void)_handleLockState:(int)a3;
- (void)_registerLockState;
- (void)_screenStateChanged;
- (void)_startSystemMonitor;
- (void)_stopSystemMonitor;
- (void)_unlockScreen;
- (void)_unregisterLockState;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRadioImageView:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSPRXDeviceUnlockViewController

- (TSPRXDeviceUnlockViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSPRXDeviceUnlockViewController;
  v2 = [(TSPRXDeviceUnlockViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TSPRXDeviceUnlockViewController *)v2 _registerLockState];
    [(TSPRXDeviceUnlockViewController *)v3 _startSystemMonitor];
  }
  return v3;
}

- (void)dealloc
{
  [(TSPRXDeviceUnlockViewController *)self _stopSystemMonitor];
  [(TSPRXDeviceUnlockViewController *)self _unregisterLockState];
  v3.receiver = self;
  v3.super_class = (Class)TSPRXDeviceUnlockViewController;
  [(TSPRXDeviceUnlockViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v60[5] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)TSPRXDeviceUnlockViewController;
  [(TSPRXDeviceUnlockViewController *)&v59 viewDidLoad];
  BOOL v3 = +[TSUtilities isPad];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = v4;
  if (v3) {
    v6 = @"TRANSFER_SIM";
  }
  else {
    v6 = @"PRXCARD_START_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26DBE8E78 table:@"Localizable"];
  [(TSPRXDeviceUnlockViewController *)self setTitle:v7];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"PRXCARD_START_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  [(TSPRXDeviceUnlockViewController *)self setSubtitle:v9];

  [(TSPRXDeviceUnlockViewController *)self setDismissalType:3];
  v55 = [MEMORY[0x263F827E8] systemImageNamed:@"antenna.radiowaves.left.and.right"];
  v10 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v55];
  radioImageView = self->_radioImageView;
  self->_radioImageView = v10;

  v12 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIImageView *)self->_radioImageView setTintColor:v12];

  [(UIImageView *)self->_radioImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(TSPRXDeviceUnlockViewController *)self contentView];
  [v13 addSubview:self->_radioImageView];

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x263F62360];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"DEVICE_UNLOCK_TO_CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __46__TSPRXDeviceUnlockViewController_viewDidLoad__block_invoke;
  v56[3] = &unk_264827C58;
  objc_copyWeak(&v57, &location);
  v17 = [v14 actionWithTitle:v16 style:0 handler:v56];
  action = self->_action;
  self->_action = v17;

  id v19 = (id)[(TSPRXDeviceUnlockViewController *)self addAction:self->_action];
  v20 = [(TSPRXDeviceUnlockViewController *)self contentView];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;

  [v55 size];
  double v26 = v25;
  [v55 size];
  double v28 = v24 * 0.3 / v27;
  if (v22 * 0.3 / v26 >= v28) {
    double v29 = v28;
  }
  else {
    double v29 = v22 * 0.3 / v26;
  }
  [v55 size];
  double v31 = v30;
  [v55 size];
  double v33 = v32;
  v44 = (void *)MEMORY[0x263F08938];
  v52 = [(UIImageView *)self->_radioImageView topAnchor];
  v54 = [(TSPRXDeviceUnlockViewController *)self contentView];
  v53 = [v54 mainContentGuide];
  v51 = [v53 topAnchor];
  v50 = [v52 constraintGreaterThanOrEqualToAnchor:v51];
  v60[0] = v50;
  v47 = [(UIImageView *)self->_radioImageView centerXAnchor];
  v49 = [(TSPRXDeviceUnlockViewController *)self contentView];
  v48 = [v49 mainContentGuide];
  v46 = [v48 centerXAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v60[1] = v45;
  v34 = [(UIImageView *)self->_radioImageView centerYAnchor];
  v35 = [(TSPRXDeviceUnlockViewController *)self contentView];
  v36 = [v35 mainContentGuide];
  v37 = [v36 centerYAnchor];
  v38 = [v34 constraintEqualToAnchor:v37];
  v60[2] = v38;
  v39 = [(UIImageView *)self->_radioImageView widthAnchor];
  v40 = [v39 constraintEqualToConstant:v29 * v31];
  v60[3] = v40;
  v41 = [(UIImageView *)self->_radioImageView heightAnchor];
  v42 = [v41 constraintEqualToConstant:v29 * v33];
  v60[4] = v42;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:5];
  [v44 activateConstraints:v43];

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
}

void __46__TSPRXDeviceUnlockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unlockScreen];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)_unlockScreen
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TSPRXDeviceUnlockViewController _unlockScreen]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "requesting unlock @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SBSRequestPasscodeUnlockUI();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __48__TSPRXDeviceUnlockViewController__unlockScreen__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2 || !+[TSUtilities isDeviceLocked])
  {
    if (!+[TSUtilities isDeviceLocked])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _unregisterLockState];

      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v7 = [v8 delegate];
      [v7 viewControllerDidComplete:*(void *)(a1 + 32)];
    }
  }
  else
  {
    BOOL v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TSPRXDeviceUnlockViewController _unlockScreen]_block_invoke";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "unlock canceled @%s", buf, 0xCu);
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_super v5 = [v4 delegate];
    [v5 userDidTapCancel];
  }
}

- (void)_registerLockState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_springBoardLockStateNotifyToken = &self->springBoardLockStateNotifyToken;
  self->springBoardLockStateNotifyToken = -1;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__TSPRXDeviceUnlockViewController__registerLockState__block_invoke;
  v9[3] = &unk_264827CA8;
  objc_copyWeak(&v10, &location);
  BOOL v3 = (void (**)(void, void))MEMORY[0x22A683B20](v9);
  id v4 = (const char *)*MEMORY[0x263F796A8];
  objc_super v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  uint32_t v7 = notify_register_dispatch(v4, p_springBoardLockStateNotifyToken, v5, v3);

  if (v7)
  {
    id v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      uint32_t v13 = v7;
      __int16 v14 = 2080;
      v15 = v4;
      __int16 v16 = 2080;
      v17 = "-[TSPRXDeviceUnlockViewController _registerLockState]";
      _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "Error %u settingup notification handler for %s @%s", buf, 0x1Cu);
    }
  }
  else
  {
    v3[2](v3, *p_springBoardLockStateNotifyToken);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __53__TSPRXDeviceUnlockViewController__registerLockState__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLockState:a2];
}

- (void)_unregisterLockState
{
  int springBoardLockStateNotifyToken = self->springBoardLockStateNotifyToken;
  if (springBoardLockStateNotifyToken != -1)
  {
    notify_cancel(springBoardLockStateNotifyToken);
    self->int springBoardLockStateNotifyToken = -1;
  }
}

- (void)_handleLockState:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = state64 == 0;
  }
  int v5 = v4;
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v7 = "locked";
    if (v5) {
      uint32_t v7 = "unlocked";
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = state64;
    __int16 v14 = 2080;
    v15 = "-[TSPRXDeviceUnlockViewController _handleLockState:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "SB lock state : %s, raw state : %llu @%s", buf, 0x20u);
  }

  if (v5)
  {
    [(TSPRXDeviceUnlockViewController *)self _unregisterLockState];
    id v8 = [(TSPRXDeviceUnlockViewController *)self delegate];
    [v8 viewControllerDidComplete:self];
  }
}

- (void)_startSystemMonitor
{
  if (!self->_systemMonitor)
  {
    BOOL v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x263F385E0]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:MEMORY[0x263EF83A0]];
    objc_initWeak(&location, self);
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint32_t v7 = __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke;
    id v8 = &unk_264827A20;
    objc_copyWeak(&v9, &location);
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:&v5];
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", &__block_literal_global_1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _screenStateChanged];
}

void __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _TSLogDomain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    v2 = "-[TSPRXDeviceUnlockViewController _startSystemMonitor]_block_invoke_2";
    _os_log_impl(&dword_227A17000, v0, OS_LOG_TYPE_INFO, "[I] screen on monitor activated @%s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_stopSystemMonitor
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[TSPRXDeviceUnlockViewController _stopSystemMonitor]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_INFO, "[I] stop screen on monitor @%s", (uint8_t *)&v5, 0xCu);
  }

  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;
}

- (void)_screenStateChanged
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (([(CUSystemMonitor *)self->_systemMonitor screenOn] & 1) == 0)
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[TSPRXDeviceUnlockViewController _screenStateChanged]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "app enter background, dismiss. @%s", (uint8_t *)&v5, 0xCu);
    }

    BOOL v4 = [(TSPRXDeviceUnlockViewController *)self delegate];
    [v4 viewControllerDidComplete:self];
  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRXAction)action
{
  return (PRXAction *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setAction:(id)a3
{
}

- (UIImageView)radioImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setRadioImageView:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return (CUSystemMonitor *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_radioImageView, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end