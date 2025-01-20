@interface TSUserResponseFlow
- (TSUserResponseFlow)initWithConfirmationCodeRequired:(BOOL)a3;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (unint64_t)userConsentType;
- (void)firstViewController:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setUserConsentType:(unint64_t)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSUserResponseFlow

- (TSUserResponseFlow)initWithConfirmationCodeRequired:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSUserResponseFlow;
  v4 = [(TSSIMSetupFlow *)&v8 init];
  v4->_confirmationCodeRequired = a3;
  uint64_t v5 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v4 action:sel_userDidTapCancel];
  cancelButton = v4->_cancelButton;
  v4->_cancelButton = (UIBarButtonItem *)v5;

  v4->_userConsentType = 0;
  return v4;
}

- (id)firstViewController
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = +[TSCellularPlanManagerCache sharedInstance];
  v4 = [v3 planItems];

  uint64_t v5 = +[TSCellularPlanManagerCache sharedInstance];
  uint64_t v6 = [v5 calculateInstallConsentTextTypeFor:v4];

  switch(v6)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (!self->_confirmationCodeRequired)
      {
        v7 = _TSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315138;
          v16 = "-[TSUserResponseFlow firstViewController]";
          _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Invalid consent - General install @%s", (uint8_t *)&v15, 0xCu);
        }
        unint64_t v8 = 4;
        goto LABEL_12;
      }
      break;
    case 1:
      v7 = _TSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[TSUserResponseFlow firstViewController]";
        _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", (uint8_t *)&v15, 0xCu);
      }
      unint64_t v8 = 3;
      goto LABEL_12;
    case 2:
      v7 = _TSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[TSUserResponseFlow firstViewController]";
        _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", (uint8_t *)&v15, 0xCu);
      }
      unint64_t v8 = 2;
LABEL_12:

      self->_userConsentType = v8;
      break;
    default:
      break;
  }
  if (self->_confirmationCodeRequired) {
    v9 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:0];
  }
  else {
    v9 = [[TSUserConsentViewController alloc] initWithConsentType:self->_userConsentType name:0];
  }
  v10 = v9;
  [(TSUserConsentViewController *)v9 setDelegate:self];
  v11 = _TSLogDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (char *)objc_opt_class();
    int v15 = 138412546;
    v16 = v12;
    __int16 v17 = 2080;
    v18 = "-[TSUserResponseFlow firstViewController]";
    v13 = v12;
    _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v15, 0x16u);
  }
  [(TSSIMSetupFlow *)self setTopViewController:v10];

  return v10;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSUserResponseFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && self->_userConsentType) {
    id v6 = [[TSUserConsentViewController alloc] initWithConsentType:self->_userConsentType name:0];
  }
  else {
    id v6 = 0;
  }
  return v6;
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 confirmationCode];
    confirmationCode = self->_confirmationCode;
    self->_confirmationCode = v5;

    if (!self->_userConsentType)
    {
      v7 = +[TSCellularPlanManagerCache sharedInstance];
      unint64_t v8 = v7;
      v9 = self->_confirmationCode;
      uint64_t v10 = 1;
LABEL_6:
      [v7 sendUserResponse:v10 confirmationCode:v9];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = +[TSCellularPlanManagerCache sharedInstance];
      uint64_t v10 = [v4 userConsentResponse];
      v9 = self->_confirmationCode;
      v7 = v8;
      goto LABEL_6;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TSUserResponseFlow;
  [(TSSIMSetupFlow *)&v11 viewControllerDidComplete:v4];
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v5 = a3;
  if (+[TSUtilities isPad])
  {
    id v4 = [v5 navigationItem];
    [v4 setRightBarButtonItem:self->_cancelButton];
  }
}

- (unint64_t)userConsentType
{
  return self->_userConsentType;
}

- (void)setUserConsentType:(unint64_t)a3
{
  self->_userConsentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

@end