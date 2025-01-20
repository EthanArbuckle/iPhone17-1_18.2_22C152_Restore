@interface TSCellularSetupActivatingViewController
- (TSCellularSetupActivatingViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (UIActivityIndicatorView)spinner;
- (UILabel)label;
- (void)_setUpLabel;
- (void)_setUpSpinner;
- (void)_spinnerStartAnimating;
- (void)_spinnerStopAnimating;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCellularSetupActivatingViewController

- (TSCellularSetupActivatingViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSCellularSetupActivatingViewController;
  return [(OBTableWelcomeController *)&v3 initWithTitle:&stru_26DBE8E78 detailText:0 icon:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSCellularSetupActivatingViewController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(TSCellularSetupActivatingViewController *)self _spinnerStartAnimating];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupActivatingViewController;
  [(TSOBTableWelcomeController *)&v10 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  objc_super v4 = [(TSCellularSetupActivatingViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  if (!+[TSUtilities inBuddy])
  {
    v6 = [(TSCellularSetupActivatingViewController *)self navigationController];
    v7 = [v6 navigationBar];
    v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v7 setBackgroundColor:v8];
  }
  [(TSCellularSetupActivatingViewController *)self _setUpSpinner];
  [(TSCellularSetupActivatingViewController *)self _setUpLabel];
  v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setHidesBackButton:1 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[TSCellularSetupActivatingViewController viewDidDisappear:]";
    __int16 v9 = 2080;
    objc_super v10 = "-[TSCellularSetupActivatingViewController viewDidDisappear:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "dismiss %s  @%s", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)TSCellularSetupActivatingViewController;
  [(TSCellularSetupActivatingViewController *)&v6 viewDidDisappear:v3];
  [(TSCellularSetupActivatingViewController *)self _spinnerStopAnimating];
}

- (void)_setUpSpinner
{
  v18[2] = *MEMORY[0x263EF8340];
  BOOL v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v3;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v5 = [MEMORY[0x263F825C8] clearColor];
  [(UIActivityIndicatorView *)self->_spinner setBackgroundColor:v5];

  objc_super v6 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UIActivityIndicatorView *)self->_spinner setColor:v6];

  [(UIActivityIndicatorView *)self->_spinner setClipsToBounds:1];
  v7 = [(TSCellularSetupActivatingViewController *)self contentView];
  [v7 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setIsAccessibilityElement:1];
  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = (void *)MEMORY[0x263F08938];
  v8 = [(UIActivityIndicatorView *)self->_spinner topAnchor];
  __int16 v9 = [(TSCellularSetupActivatingViewController *)self contentView];
  objc_super v10 = [v9 topAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10 constant:100.0];
  v18[0] = v11;
  v12 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v13 = [(TSCellularSetupActivatingViewController *)self contentView];
  v14 = [v13 centerXAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v18[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v17 activateConstraints:v16];

  [(TSCellularSetupActivatingViewController *)self _spinnerStartAnimating];
}

- (void)_setUpLabel
{
  v31[5] = *MEMORY[0x263EF8340];
  BOOL v3 = (UILabel *)objc_opt_new();
  label = self->_label;
  self->_label = v3;

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"ACTIVATE_SPINNER_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
  [(UILabel *)self->_label setText:v6];

  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_label setLineBreakMode:0];
  [(UILabel *)self->_label setTextAlignment:1];
  v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_label setFont:v7];

  v8 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UILabel *)self->_label setTextColor:v8];

  -[UILabel setFrame:](self->_label, "setFrame:", 5.0, 5.0, 40.0, 20.0);
  __int16 v9 = [(TSCellularSetupActivatingViewController *)self contentView];
  [v9 addSubview:self->_label];

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (void *)MEMORY[0x263F08938];
  v29 = [(UILabel *)self->_label topAnchor];
  v30 = [(TSCellularSetupActivatingViewController *)self contentView];
  v28 = [v30 topAnchor];
  v27 = [v29 constraintGreaterThanOrEqualToAnchor:v28];
  v31[0] = v27;
  v25 = [(UILabel *)self->_label centerXAnchor];
  v26 = [(TSCellularSetupActivatingViewController *)self contentView];
  v24 = [v26 centerXAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v31[1] = v23;
  v20 = [(UILabel *)self->_label centerYAnchor];
  v21 = [(TSCellularSetupActivatingViewController *)self contentView];
  objc_super v10 = [v21 centerYAnchor];
  uint64_t v11 = [v20 constraintEqualToAnchor:v10];
  v31[2] = v11;
  v12 = [(UILabel *)self->_label widthAnchor];
  v13 = [(TSCellularSetupActivatingViewController *)self contentView];
  v14 = [v13 widthAnchor];
  v15 = [v12 constraintLessThanOrEqualToAnchor:v14 multiplier:1.0];
  v31[3] = v15;
  v16 = [(UILabel *)self->_label heightAnchor];
  v17 = [MEMORY[0x263F82770] defaultMetrics];
  [v17 scaledValueForValue:350.0];
  v18 = objc_msgSend(v16, "constraintEqualToConstant:");
  v31[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  [v22 activateConstraints:v19];
}

- (void)_spinnerStartAnimating
{
  BOOL v3 = [(TSCellularSetupActivatingViewController *)self spinner];
  char v4 = [v3 isAnimating];

  if ((v4 & 1) == 0)
  {
    id v5 = [(TSCellularSetupActivatingViewController *)self spinner];
    [v5 startAnimating];
  }
}

- (void)_spinnerStopAnimating
{
  BOOL v3 = [(TSCellularSetupActivatingViewController *)self spinner];
  int v4 = [v3 isAnimating];

  if (v4)
  {
    id v5 = [(TSCellularSetupActivatingViewController *)self spinner];
    [v5 stopAnimating];
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

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end