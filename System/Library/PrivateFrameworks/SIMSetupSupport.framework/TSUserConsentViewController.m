@interface TSUserConsentViewController
+ (void)calculateTitleAndDetailsWithName:(id)a3 consentType:(unint64_t)a4 title:(id *)a5 details:(id *)a6;
- (BOOL)canBeShownFromSuspendedState;
- (TSSIMSetupFlowDelegate)delegate;
- (TSUserConsentViewController)initWithConsentType:(unint64_t)a3 name:(id)a4;
- (unint64_t)userConsentResponse;
- (void)_acceptButtonTapped;
- (void)_cancelButtonTapped;
- (void)_declineButtonTapped;
- (void)_setNavigationItems;
- (void)setDelegate:(id)a3;
- (void)setUserConsentResponse:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation TSUserConsentViewController

+ (void)calculateTitleAndDetailsWithName:(id)a3 consentType:(unint64_t)a4 title:(id *)a5 details:(id *)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 0uLL:
      v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[TSUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:](v10);
      }

      goto LABEL_5;
    case 1uLL:
    case 4uLL:
LABEL_5:
      v11 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"GENERAL_USER_CONSENT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v11 stringWithFormat:v13];

      if (v9)
      {
        v14 = NSString;
        v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v16 = [v15 localizedStringForKey:@"GENERAL_USER_CONSENT_COMMON_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v14, "stringWithFormat:", v16, v9);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      *a6 = [v17 localizedStringForKey:@"GENERAL_USER_CONSENT_COMMON_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
      goto LABEL_17;
    case 2uLL:
      v18 = NSString;
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"CONSENT_NEW_PROFILE_POLICY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v18 stringWithFormat:v20];

      v21 = NSString;
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v9)
      {
        v22 = @"CONSENT_NEW_PLAN_CANNOT_BE_DELETED_%@_%@";
        goto LABEL_12;
      }
      v27 = @"CONSENT_NEW_PLAN_CANNOT_BE_DELETED_NO_NAME";
      goto LABEL_15;
    case 3uLL:
      v23 = NSString;
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"CONSENT_NEW_PROFILE_POLICY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      *a5 = [v23 stringWithFormat:v25];

      v21 = NSString;
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v9)
      {
        v22 = @"CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_%@_%@";
LABEL_12:
        v26 = [v17 localizedStringForKey:v22 value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v21, "stringWithFormat:", v26, v9, v9);
      }
      else
      {
        v27 = @"CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_NO_NAME";
LABEL_15:
        v26 = [v17 localizedStringForKey:v27 value:&stru_26DBE8E78 table:@"Localizable"];
        objc_msgSend(v21, "stringWithFormat:", v26, v28, v29);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

      return;
    default:
      goto LABEL_18;
  }
}

- (TSUserConsentViewController)initWithConsentType:(unint64_t)a3 name:(id)a4
{
  id v12 = 0;
  id v13 = 0;
  +[TSUserConsentViewController calculateTitleAndDetailsWithName:a4 consentType:a3 title:&v13 details:&v12];
  id v6 = v13;
  id v7 = v12;
  v11.receiver = self;
  v11.super_class = (Class)TSUserConsentViewController;
  v8 = [(TSUserConsentViewController *)&v11 initWithTitle:v6 detailText:v7 icon:0];
  id v9 = v8;
  if (v8)
  {
    [(TSUserConsentViewController *)v8 setModalInPresentation:1];
    v9->_consentType = a3;
    v9->_userConsentResponse = 0;
  }

  return v9;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)TSUserConsentViewController;
  [(TSOBWelcomeController *)&v19 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSUserConsentViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  switch(self->_consentType)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      int v6 = 0;
      id v7 = @"ACTIVATE_ESIM";
      break;
    case 2uLL:
    case 3uLL:
      int v6 = 1;
      id v7 = @"CONSENT_POLICY_ALLOW";
      break;
    default:
      id v7 = 0;
      int v6 = 0;
      break;
  }
  v8 = [MEMORY[0x263F5B898] boldButton];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:v7 value:&stru_26DBE8E78 table:@"Localizable"];
  [v8 setTitle:v10 forState:0];

  [v8 addTarget:self action:sel__acceptButtonTapped forControlEvents:64];
  objc_super v11 = [(TSUserConsentViewController *)self buttonTray];
  [v11 addButton:v8];

  if (v6)
  {
    id v12 = [MEMORY[0x263F5B8D0] linkButton];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CONSENT_POLICY_DECLINE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v12 setTitle:v14 forState:0];

    [v12 addTarget:self action:sel__declineButtonTapped forControlEvents:64];
    v15 = [(TSUserConsentViewController *)self buttonTray];
    [v15 addButton:v12];
  }
  [(TSUserConsentViewController *)self _setNavigationItems];
  if (!+[TSUtilities inBuddy])
  {
    v16 = [(TSUserConsentViewController *)self navigationController];
    v17 = [v16 navigationBar];
    v18 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v17 setBackgroundColor:v18];
  }
}

- (void)_setNavigationItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setDefaultNavigationItems:self];

  id v7 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  BOOL v4 = +[TSUtilities isPad];
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  int v6 = v5;
  if (v4)
  {
    [v5 setRightBarButtonItem:v7];

    int v6 = [(OBBaseWelcomeController *)self navigationItem];
    [v6 setHidesBackButton:1 animated:0];
  }
  else
  {
    [v5 setLeftBarButtonItem:v7];
  }
}

- (void)_acceptButtonTapped
{
  self->_userConsentResponse = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
}

- (void)_declineButtonTapped
{
  self->_userConsentResponse = 2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
}

- (void)_cancelButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (unint64_t)userConsentResponse
{
  return self->_userConsentResponse;
}

- (void)setUserConsentResponse:(unint64_t)a3
{
  self->_userConsentResponse = a3;
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
}

+ (void)calculateTitleAndDetailsWithName:(os_log_t)log consentType:title:details:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[TSUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]No conent type, default to general consent @%s", (uint8_t *)&v1, 0xCu);
}

@end