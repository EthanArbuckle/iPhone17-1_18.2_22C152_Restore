@interface TSMidOperationFailureViewController
- (BOOL)isContinueByUser;
- (BOOL)isStartOverRequiredOnBackButtonTapped;
- (TSMidOperationFailureViewController)initWithPlanItemError:(id)a3 updatePlanItem:(id)a4 withBackButton:(BOOL)a5 forCarrier:(id)a6 withCarrierErrorCode:(id)a7;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_buttonAction;
- (void)_disableMismatchedPlan;
- (void)_doneButtonTapped;
- (void)_locationServiceButtonAction;
- (void)_userDidTapCancel;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSMidOperationFailureViewController

- (TSMidOperationFailureViewController)initWithPlanItemError:(id)a3 updatePlanItem:(id)a4 withBackButton:(BOOL)a5 forCarrier:(id)a6 withCarrierErrorCode:(id)a7
{
  id v13 = a3;
  id obj = a4;
  id v41 = a4;
  id v14 = a6;
  id v15 = a7;
  v40 = v14;
  v16 = +[TSUtilities getErrorTitleDetail:v13 forCarrier:v14];
  v17 = [v16 objectForKeyedSubscript:@"ErrorHeader"];
  v18 = [v16 objectForKeyedSubscript:@"ErrorDetail"];
  id v38 = a3;
  id v39 = a6;
  if (v15 && [v15 length])
  {
    v19 = NSString;
    id v36 = v13;
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"ERROR_CODE" value:&stru_26DBE8E78 table:@"Localizable"];
    v22 = [v19 stringWithFormat:@"%@: %@", v21, v15];

    uint64_t v23 = [NSString stringWithFormat:@"%@\n\n%@", v18, v22];

    v18 = (void *)v23;
    id v13 = v36;
  }
  else
  {
    v22 = 0;
  }
  v42.receiver = self;
  v42.super_class = (Class)TSMidOperationFailureViewController;
  v24 = [(TSMidOperationFailureViewController *)&v42 initWithTitle:v17 detailText:v18 icon:0];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_updatePlanItem, obj);
    objc_storeStrong((id *)&v25->_planItemError, v38);
    objc_storeStrong((id *)&v25->_carrierName, v39);
    uint64_t v26 = [NSDictionary dictionaryWithDictionary:v16];
    errorHeaderDetail = v25->_errorHeaderDetail;
    v25->_errorHeaderDetail = (NSDictionary *)v26;

    v25->_withBackButton = a5;
    v25->_isContinueByUser = 0;
    id v28 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v29 = [v28 initWithQueue:MEMORY[0x263EF83A0]];
    client = v25->_client;
    v25->_client = (CoreTelephonyClient *)v29;

    cancelButton = v25->_cancelButton;
    v25->_cancelButton = 0;

    if (+[TSUtilities isRegRestActiveLocationServiceOff:](TSUtilities, "isRegRestActiveLocationServiceOff:", v25->_planItemError)|| +[TSUtilities isRegRestActiveLocationAuthorizedOff:v25->_planItemError])
    {
      if (+[TSUtilities isPad])
      {
        uint64_t v32 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v25 action:sel__userDidTapCancel];
        v33 = v25->_cancelButton;
        v25->_cancelButton = (UIBarButtonItem *)v32;
      }
    }
  }
  if (v22 && [v22 length])
  {
    v34 = [(TSMidOperationFailureViewController *)v25 headerView];
    [v34 addDetailLabel:v18 withErrorCodeSubstr:v22];
  }
  return v25;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)TSMidOperationFailureViewController;
  [(TSOBWelcomeController *)&v13 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSMidOperationFailureViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  [v6 addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  v7 = [(NSDictionary *)self->_errorHeaderDetail objectForKeyedSubscript:@"ErrorButton"];
  [v6 setTitle:v7 forState:0];

  v8 = [(TSMidOperationFailureViewController *)self buttonTray];
  [v8 addButton:v6];

  [v6 setEnabled:1];
  if (!self->_withBackButton)
  {
    v9 = [(OBBaseWelcomeController *)self navigationItem];
    [v9 setHidesBackButton:1 animated:0];
  }
  [(TSMidOperationFailureViewController *)self setDefaultNavigationItems:self];
  if (!+[TSUtilities inBuddy])
  {
    v10 = [(TSMidOperationFailureViewController *)self navigationController];
    v11 = [v10 navigationBar];
    v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v11 setBackgroundColor:v12];
  }
}

- (void)_locationServiceButtonAction
{
  if (+[TSUtilities isPad])
  {
    if (+[TSUtilities isGreenTeaCapable])
    {
      v3 = [(NSError *)self->_planItemError domain];
      int v4 = [v3 isEqualToString:*MEMORY[0x263F31920]];

      if (v4)
      {
        NSInteger v5 = [(NSError *)self->_planItemError code];
        if (v5 == 63)
        {
          id v9 = [MEMORY[0x263F01880] defaultWorkspace];
          v6 = NSURL;
          v7 = @"prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES";
        }
        else
        {
          if (v5 != 62) {
            return;
          }
          id v9 = [MEMORY[0x263F01880] defaultWorkspace];
          v6 = NSURL;
          v7 = @"prefs:root=Privacy&path=LOCATION";
        }
        v8 = [v6 URLWithString:v7];
        [v9 openSensitiveURL:v8 withOptions:0];
      }
    }
  }
}

- (void)_disableMismatchedPlan
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  __int16 v8 = 2080;
  id v9 = "-[TSMidOperationFailureViewController _disableMismatchedPlan]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Failed to disable plan: %@, error: %@ @%s", (uint8_t *)&v4, 0x20u);
}

- (void)_userDidTapCancel
{
  self->_isContinueByUser = 1;
  id v2 = [(TSMidOperationFailureViewController *)self delegate];
  [v2 userDidTapCancel];
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v5 = a3;
  if (+[TSUtilities isRegRestActiveLocationServiceOff:](TSUtilities, "isRegRestActiveLocationServiceOff:", self->_planItemError)|| +[TSUtilities isRegRestActiveLocationAuthorizedOff:self->_planItemError])
  {
    int v4 = [v5 navigationItem];
    [v4 setRightBarButtonItem:self->_cancelButton];
  }
}

- (void)_buttonAction
{
  planItemError = self->_planItemError;
  if (planItemError)
  {
    int v4 = [(NSError *)planItemError domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F31920]];

    if (v5)
    {
      NSInteger v6 = [(NSError *)self->_planItemError code];
      if ((unint64_t)(v6 - 62) >= 2)
      {
        if (v6 == 46)
        {
          [(TSMidOperationFailureViewController *)self _disableMismatchedPlan];
        }
      }
      else
      {
        [(TSMidOperationFailureViewController *)self _locationServiceButtonAction];
      }
    }
  }
}

- (void)_doneButtonTapped
{
  [(TSMidOperationFailureViewController *)self _buttonAction];
  self->_isContinueByUser = 1;
  id v3 = [(TSMidOperationFailureViewController *)self delegate];
  [v3 attemptFailed];
}

- (BOOL)isStartOverRequiredOnBackButtonTapped
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isContinueByUser
{
  return self->_isContinueByUser;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_errorHeaderDetail, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_planItemError, 0);
  objc_storeStrong((id *)&self->_updatePlanItem, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end