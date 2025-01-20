@interface TSProximityPINCodeViewController
- (BOOL)isIdleTimerDisabled;
- (NSString)pin;
- (TSProximityPINCodeViewController)initWithPIN:(id)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (UILabel)pinCodeLabel;
- (void)setDelegate:(id)a3;
- (void)setIsIdleTimerDisabled:(BOOL)a3;
- (void)setPin:(id)a3;
- (void)setPinCodeLabel:(id)a3;
- (void)updatePIN:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSProximityPINCodeViewController

- (TSProximityPINCodeViewController)initWithPIN:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"PROXIMITY_TRANSFER_PIN_CODE_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"PROXIMITY_TRANSFER_PIN_CODE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v12.receiver = self;
  v12.super_class = (Class)TSProximityPINCodeViewController;
  v10 = [(TSProximityPINCodeViewController *)&v12 initWithTitle:v9 detailText:v7 icon:0 contentLayout:2];

  if (v10) {
    objc_storeStrong((id *)&v10->_pin, a3);
  }

  return v10;
}

- (void)updatePIN:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pin, a3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__TSProximityPINCodeViewController_updatePIN___block_invoke;
  v7[3] = &unk_264827A70;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __46__TSProximityPINCodeViewController_updatePIN___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) pinCodeLabel];
  [v2 setText:v1];
}

- (void)viewDidLoad
{
  v27[3] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)TSProximityPINCodeViewController;
  [(TSOBWelcomeController *)&v26 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  pinCodeLabel = self->_pinCodeLabel;
  self->_pinCodeLabel = v4;

  [(UILabel *)self->_pinCodeLabel setNumberOfLines:0];
  id v6 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)self->_pinCodeLabel setTextColor:v6];

  v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(UILabel *)self->_pinCodeLabel setBackgroundColor:v7];

  id v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835E0]];
  [(UILabel *)self->_pinCodeLabel setFont:v8];

  [(UILabel *)self->_pinCodeLabel setTextAlignment:1];
  [(UILabel *)self->_pinCodeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_pinCodeLabel setContentHuggingPriority:1 forAxis:v9];
  [(UILabel *)self->_pinCodeLabel setText:self->_pin];
  v10 = [(TSProximityPINCodeViewController *)self contentView];
  [v10 addSubview:self->_pinCodeLabel];

  v21 = (void *)MEMORY[0x263F08938];
  v24 = [(UILabel *)self->_pinCodeLabel centerXAnchor];
  v25 = [(TSProximityPINCodeViewController *)self contentView];
  v23 = [v25 centerXAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v11 = [(UILabel *)self->_pinCodeLabel centerYAnchor];
  objc_super v12 = [(TSProximityPINCodeViewController *)self view];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13];
  v27[1] = v14;
  v15 = [(UILabel *)self->_pinCodeLabel topAnchor];
  v16 = [(TSProximityPINCodeViewController *)self headerView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintGreaterThanOrEqualToAnchor:v17];
  v27[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  [v21 activateConstraints:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setDefaultNavigationItems:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  self->_isIdleTimerDisabled = [v5 isIdleTimerDisabled];

  id v6 = [MEMORY[0x263F82438] sharedApplication];
  [v6 setIdleTimerDisabled:1];

  v7.receiver = self;
  v7.super_class = (Class)TSProximityPINCodeViewController;
  [(TSProximityPINCodeViewController *)&v7 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  [v5 setIdleTimerDisabled:self->_isIdleTimerDisabled];

  v6.receiver = self;
  v6.super_class = (Class)TSProximityPINCodeViewController;
  [(TSProximityPINCodeViewController *)&v6 viewDidDisappear:v3];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)pin
{
  return (NSString *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setPin:(id)a3
{
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
}

- (BOOL)isIdleTimerDisabled
{
  return self->_isIdleTimerDisabled;
}

- (void)setIsIdleTimerDisabled:(BOOL)a3
{
  self->_isIdleTimerDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end