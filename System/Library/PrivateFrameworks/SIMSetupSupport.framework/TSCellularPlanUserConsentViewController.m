@interface TSCellularPlanUserConsentViewController
+ (void)calculateTitleAndDetailsWithName:(id)a3 consentType:(unint64_t)a4 title:(id *)a5 details:(id *)a6;
- (BOOL)animating;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)customizeSpinner;
- (NSArray)cachedButtons;
- (SSOBBoldTrayButton)acceptButton;
- (SSSpinner)spinner;
- (TSCellularPlanUserConsentViewController)initWithConfirmationCode:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5 confirmationCode:(id)a6 acceptButtonTapped:(BOOL)a7;
- (TSCellularPlanUserConsentViewController)initWithName:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5;
- (TSSIMSetupFlowDelegate)delegate;
- (UIView)spinnerContainer;
- (unint64_t)consentType;
- (void)_acceptButtonTapped;
- (void)_cancelButtonTapped;
- (void)_declineButtonTapped;
- (void)_setNavigationItems;
- (void)setAcceptButton:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setCachedButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerContainer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSCellularPlanUserConsentViewController

+ (void)calculateTitleAndDetailsWithName:(id)a3 consentType:(unint64_t)a4 title:(id *)a5 details:(id *)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 0uLL:
      v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:](v10);
      }

      goto LABEL_5;
    case 1uLL:
LABEL_5:
      v11 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"ACTIVATE_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v11 stringWithFormat:v13];

      if (!v9) {
        goto LABEL_20;
      }
      v14 = NSString;
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = v15;
      v17 = @"APP_USER_CONSENT_DETAIL_%@";
      goto LABEL_14;
    case 2uLL:
      v18 = NSString;
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"CONSENT_NEW_PROFILE_POLICY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v18 stringWithFormat:v20];

      v21 = NSString;
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v9)
      {
        v23 = @"CONSENT_NEW_PLAN_CANNOT_BE_DELETED_%@_%@";
        goto LABEL_11;
      }
      v32 = @"CONSENT_NEW_PLAN_CANNOT_BE_DELETED_NO_NAME";
      goto LABEL_17;
    case 3uLL:
      v24 = NSString;
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"CONSENT_NEW_PROFILE_POLICY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v24 stringWithFormat:v26];

      v21 = NSString;
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v9)
      {
        v23 = @"CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_%@_%@";
LABEL_11:
        v27 = [v22 localizedStringForKey:v23 value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v21, "stringWithFormat:", v27, v9, v9);
      }
      else
      {
        v32 = @"CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_NO_NAME";
LABEL_17:
        v27 = [v22 localizedStringForKey:v32 value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v21, "stringWithFormat:", v27, v33, v34);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    case 4uLL:
      v28 = NSString;
      v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v30 = [v29 localizedStringForKey:@"ACTIVATE_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v28 stringWithFormat:v30];

      if (v9)
      {
        v14 = NSString;
        v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v16 = v15;
        v17 = @"GENERAL_USER_CONSENT_COMMON_DETAIL_%@";
LABEL_14:
        v31 = [v15 localizedStringForKey:v17 value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v14, "stringWithFormat:", v31, v9);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        *a6 = [v22 localizedStringForKey:@"GENERAL_USER_CONSENT_COMMON_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_19:
      }
LABEL_20:

      return;
    default:
      goto LABEL_20;
  }
}

- (TSCellularPlanUserConsentViewController)initWithName:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5
{
  id v14 = 0;
  id v15 = 0;
  +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:a3 consentType:a4 title:&v15 details:&v14];
  id v8 = v15;
  id v9 = v14;
  v13.receiver = self;
  v13.super_class = (Class)TSCellularPlanUserConsentViewController;
  v10 = [(TSCellularPlanUserConsentViewController *)&v13 initWithTitle:v8 detailText:v9 symbolName:@"antenna.radiowaves.left.and.right"];
  v11 = v10;
  if (v10)
  {
    [(TSCellularPlanUserConsentViewController *)v10 setModalInPresentation:1];
    v11->_consentType = a4;
    v11->_requireAdditionalConsent = a5;
  }

  return v11;
}

- (TSCellularPlanUserConsentViewController)initWithConfirmationCode:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5 confirmationCode:(id)a6 acceptButtonTapped:(BOOL)a7
{
  id v13 = a6;
  id v20 = 0;
  id v21 = 0;
  +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:a3 consentType:a4 title:&v21 details:&v20];
  id v14 = v21;
  id v15 = v20;
  v19.receiver = self;
  v19.super_class = (Class)TSCellularPlanUserConsentViewController;
  v16 = [(TSCellularPlanUserConsentViewController *)&v19 initWithTitle:v14 detailText:v15 symbolName:@"antenna.radiowaves.left.and.right"];
  v17 = v16;
  if (v16)
  {
    v16->_consentType = a4;
    v16->_requireAdditionalConsent = a5;
    objc_storeStrong((id *)&v16->_confirmationCode, a6);
    v17->_acceptButtonTapped = a7;
  }

  return v17;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)TSCellularPlanUserConsentViewController;
  [(TSOBWelcomeController *)&v22 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateTrayButtonText_ name:@"esim.install.state.changed" object:0];

  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [(TSCellularPlanUserConsentViewController *)self navigationController];
  v6 = [v5 view];
  [v6 setBackgroundColor:v4];

  switch(self->_consentType)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      int v7 = 0;
      id v8 = @"CONTINUE";
      break;
    case 2uLL:
    case 3uLL:
      int v7 = 1;
      id v8 = @"CONSENT_POLICY_ALLOW";
      break;
    default:
      id v8 = 0;
      int v7 = 0;
      break;
  }
  id v9 = +[OBBoldTrayButton boldButton];
  acceptButton = self->_acceptButton;
  self->_acceptButton = v9;

  v11 = self->_acceptButton;
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];
  [(SSOBBoldTrayButton *)v11 setTitle:v13 forState:0];

  [(SSOBBoldTrayButton *)self->_acceptButton addTarget:self action:sel__acceptButtonTapped forControlEvents:64];
  if (self->_acceptButtonTapped) {
    [(TSCellularPlanUserConsentViewController *)self _acceptButtonTapped];
  }
  id v14 = [(TSCellularPlanUserConsentViewController *)self buttonTray];
  [v14 addButton:self->_acceptButton];

  if (v7)
  {
    id v15 = [MEMORY[0x263F5B8D0] linkButton];
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CONSENT_POLICY_DECLINE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v15 setTitle:v17 forState:0];

    [v15 addTarget:self action:sel__declineButtonTapped forControlEvents:64];
    v18 = [(TSCellularPlanUserConsentViewController *)self buttonTray];
    [v18 addButton:v15];
  }
  [(TSCellularPlanUserConsentViewController *)self _setNavigationItems];
  if (!+[TSUtilities inBuddy])
  {
    objc_super v19 = [(TSCellularPlanUserConsentViewController *)self navigationController];
    id v20 = [v19 navigationBar];
    id v21 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v20 setBackgroundColor:v21];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TSCellularPlanUserConsentViewController;
  [(TSCellularPlanUserConsentViewController *)&v16 viewWillDisappear:a3];
  if (!self->_didReceiveResponse)
  {
    v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanUserConsentViewController viewWillDisappear:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    unint64_t consentType = self->_consentType;
    id v13 = +[TSCellularPlanManagerCache sharedInstance];
    id v14 = v13;
    if (consentType == 1) {
      [v13 resumePlanProvisioning:0 userConsent:0];
    }
    else {
      [v13 provideUserResponse:2 confirmationCode:&stru_26DBE8E78];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained receivedResponse];
}

- (void)_setNavigationItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setDefaultNavigationItems:self];

  id v6 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  if (+[TSUtilities isPad])
  {
    if (!+[TSUtilities inBuddy] && !self->_acceptButtonTapped)
    {
      v4 = [(OBBaseWelcomeController *)self navigationItem];
      [v4 setRightBarButtonItem:v6];
    }
    uint64_t v5 = [(OBBaseWelcomeController *)self navigationItem];
    [v5 setHidesBackButton:1 animated:0];
  }
  else
  {
    if (self->_acceptButtonTapped) {
      goto LABEL_9;
    }
    uint64_t v5 = [(OBBaseWelcomeController *)self navigationItem];
    [v5 setLeftBarButtonItem:v6];
  }

LABEL_9:
}

- (void)_acceptButtonTapped
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 1208)) {
    v2 = "Yes";
  }
  else {
    v2 = "No";
  }
  int v3 = 136315394;
  v4 = v2;
  __int16 v5 = 2080;
  id v6 = "-[TSCellularPlanUserConsentViewController _acceptButtonTapped]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db] more consent: %s @%s", (uint8_t *)&v3, 0x16u);
}

- (void)_declineButtonTapped
{
}

- (void)_cancelButtonTapped
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)customizeSpinner
{
  return self->_animating;
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
  return (NSArray *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setCachedButtons:(id)a3
{
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setSpinnerContainer:(id)a3
{
}

- (unint64_t)consentType
{
  return self->_consentType;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSOBBoldTrayButton)acceptButton
{
  return (SSOBBoldTrayButton *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setAcceptButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

+ (void)calculateTitleAndDetailsWithName:(os_log_t)log consentType:title:details:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]No conent type, default to general consent @%s", (uint8_t *)&v1, 0xCu);
}

- (void)viewWillDisappear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end