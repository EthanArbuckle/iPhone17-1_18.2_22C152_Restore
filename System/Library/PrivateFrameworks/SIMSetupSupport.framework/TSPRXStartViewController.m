@interface TSPRXStartViewController
- (PRXAction)action;
- (SSProximityDevice)client;
- (TSPRXStartViewController)initWithBtDevice:(id)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (UIImageView)radioImageView;
- (void)_startClientFlow;
- (void)setAction:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRadioImageView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSPRXStartViewController

- (TSPRXStartViewController)initWithBtDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPRXStartViewController;
  v6 = [(TSPRXStartViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v60[5] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)TSPRXStartViewController;
  [(TSPRXStartViewController *)&v59 viewDidLoad];
  BOOL v3 = +[TSUtilities isPad];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    v6 = @"TRANSFER_SIM";
  }
  else {
    v6 = @"PRXCARD_START_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26DBE8E78 table:@"Localizable"];
  [(TSPRXStartViewController *)self setTitle:v7];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v9 = [v8 localizedStringForKey:@"PRXCARD_START_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  [(TSPRXStartViewController *)self setSubtitle:v9];

  [(TSPRXStartViewController *)self setDismissalType:3];
  v55 = [MEMORY[0x263F827E8] systemImageNamed:@"antenna.radiowaves.left.and.right"];
  v10 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v55];
  radioImageView = self->_radioImageView;
  self->_radioImageView = v10;

  v12 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIImageView *)self->_radioImageView setTintColor:v12];

  [(UIImageView *)self->_radioImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(TSPRXStartViewController *)self contentView];
  [v13 addSubview:self->_radioImageView];

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x263F62360];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __39__TSPRXStartViewController_viewDidLoad__block_invoke;
  v56[3] = &unk_264827C58;
  objc_copyWeak(&v57, &location);
  v17 = [v14 actionWithTitle:v16 style:0 handler:v56];
  action = self->_action;
  self->_action = v17;

  id v19 = (id)[(TSPRXStartViewController *)self addAction:self->_action];
  v20 = [(TSPRXStartViewController *)self contentView];
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
  v54 = [(TSPRXStartViewController *)self contentView];
  v53 = [v54 mainContentGuide];
  v51 = [v53 topAnchor];
  v50 = [v52 constraintGreaterThanOrEqualToAnchor:v51];
  v60[0] = v50;
  v47 = [(UIImageView *)self->_radioImageView centerXAnchor];
  v49 = [(TSPRXStartViewController *)self contentView];
  v48 = [v49 mainContentGuide];
  v46 = [v48 centerXAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v60[1] = v45;
  v34 = [(UIImageView *)self->_radioImageView centerYAnchor];
  v35 = [(TSPRXStartViewController *)self contentView];
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

void __39__TSPRXStartViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startClientFlow];
}

- (void)_startClientFlow
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(PRXAction *)self->_action setEnabled:0];
  [(TSPRXStartViewController *)self showActivityIndicatorWithStatus:&stru_26DBE8E78];
  BOOL v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[TSPRXStartViewController _startClientFlow]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "activate client @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  client = self->_client;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TSPRXStartViewController__startClientFlow__block_invoke;
  v5[3] = &unk_264828110;
  objc_copyWeak(&v6, (id *)buf);
  [(SSProximityDevice *)client activate:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__TSPRXStartViewController__startClientFlow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__TSPRXStartViewController__startClientFlow__block_invoke_cold_1((uint64_t)v3, v4);
    }

    id v5 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v5);
    v7 = [WeakRetained delegate];
    id v8 = objc_loadWeakRetained(v5);
    [v7 viewControllerDidComplete:v8];
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
  return (PRXAction *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setAction:(id)a3
{
}

- (SSProximityDevice)client
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setClient:(id)a3
{
}

- (UIImageView)radioImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setRadioImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioImageView, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__TSPRXStartViewController__startClientFlow__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSPRXStartViewController _startClientFlow]_block_invoke";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]activate bt client failed : %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end