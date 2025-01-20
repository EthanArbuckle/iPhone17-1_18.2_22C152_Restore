@interface SSUserConsentViewController
- (BOOL)animating;
- (BOOL)customizeSpinner;
- (NSArray)cachedButtons;
- (SSSpinner)spinner;
- (SSUserConsentViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (UIView)spinnerContainer;
- (void)_cancelButtonTapped;
- (void)_continueButtonTapped;
- (void)_setNavigationItems;
- (void)setAnimating:(BOOL)a3;
- (void)setCachedButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerContainer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SSUserConsentViewController

- (SSUserConsentViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ACTIVATE_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"INSTALL_ESIM_CONSENT_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  v10.receiver = self;
  v10.super_class = (Class)SSUserConsentViewController;
  v7 = [(SSUserConsentViewController *)&v10 initWithTitle:v4 detailText:v6 symbolName:@"antenna.radiowaves.left.and.right"];
  v8 = v7;
  if (v7) {
    [(SSUserConsentViewController *)v7 setModalInPresentation:1];
  }

  return v8;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SSUserConsentViewController;
  [(TSOBWelcomeController *)&v11 viewDidLoad];
  v3 = [(SSUserConsentViewController *)self navigationController];
  v4 = [v3 navigationBar];
  v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  v6 = +[OBBoldTrayButton boldButton];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [v6 setTitle:v8 forState:0];

  [v6 addTarget:self action:sel__continueButtonTapped forControlEvents:64];
  v9 = [(SSUserConsentViewController *)self buttonTray];
  [v9 addButton:v6];

  objc_super v10 = [(OBBaseWelcomeController *)self navigationItem];
  [v10 setHidesBackButton:1 animated:0];

  [(SSUserConsentViewController *)self _continueButtonTapped];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSUserConsentViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(SSUserConsentViewController *)self _setNavigationItems];
}

- (BOOL)customizeSpinner
{
  return self->_animating;
}

- (void)_continueButtonTapped
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"CONNECTING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v4];

  id v6 = +[TSCellularPlanManagerCache sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "resumePlanProvisioning:userConsent:", 1, objc_msgSend(WeakRetained, "signupUserConsentResponse"));
}

- (void)_cancelButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_setNavigationItems
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  BOOL v3 = +[TSUtilities isPad];
  objc_super v4 = [(OBBaseWelcomeController *)self navigationItem];
  v5 = v4;
  if (v3) {
    [v4 setRightBarButtonItem:v6];
  }
  else {
    [v4 setLeftBarButtonItem:v6 animated:0];
  }
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setCachedButtons:(id)a3
{
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setSpinnerContainer:(id)a3
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
}

@end