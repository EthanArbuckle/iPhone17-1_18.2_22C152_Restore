@interface PKPaymentSetupVerificationCompletionViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupVerificationCompletionViewController)initWithVerificationController:(id)a3 mode:(int64_t)a4 offerOtherMethods:(BOOL)a5;
- (PKPaymentSetupVerificationCompletionViewControllerFlowItemDelegate)flowItemDelegate;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPaymentVerificationController)verificationController;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_disableUI;
- (void)_enableUI;
- (void)_handleNextStep;
- (void)_handlePassVerifiedNotification:(id)a3;
- (void)_showActivationError:(id)a3;
- (void)_showCompletedUIForPass:(id)a3;
- (void)_showCompletedUIWithNextHandler:(id)a3;
- (void)_startVerificationObserver;
- (void)_stopVerificationObserver;
- (void)_submitVerificationCode;
- (void)_terminateFlow;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)handleVerifyLater:(id)a3;
- (void)loadView;
- (void)next:(id)a3;
- (void)selectOtherVerificationMethod;
- (void)setFlowItemDelegate:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setReporter:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4;
- (void)verificationObserverDidTimeout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentSetupVerificationCompletionViewController

- (PKPaymentSetupVerificationCompletionViewController)initWithVerificationController:(id)a3 mode:(int64_t)a4 offerOtherMethods:(BOOL)a5
{
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  v10 = -[PKPaymentSetupTableViewController initWithContext:](&v30, sel_initWithContext_, [v9 context]);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_verificationController, a3);
    v11->_mode = a4;
    v11->_offerOtherMethods = a5;
    v11->_verificationCodeAccepted = v11->_mode == 1;
    v12 = [(PKPaymentSetupVerificationCompletionViewController *)v11 navigationItem];
    v13 = [v9 webService];
    v14 = [v9 pass];
    v15 = [v13 context];
    v16 = [v14 uniqueID];
    v17 = [v15 verificationRequestRecordForUniqueID:v16];

    v18 = NSString;
    v19 = [v14 uniqueID];
    v20 = [v18 stringWithFormat:@"UI-%@", v19];

    id v21 = objc_alloc(MEMORY[0x1E4F84D38]);
    v22 = [v17 channel];
    uint64_t v23 = [v21 initWithPaymentPass:v14 verificationChannel:v22 identifier:v20];
    verificationObserver = v11->_verificationObserver;
    v11->_verificationObserver = (PKPaymentVerificationObserver *)v23;

    [(PKPaymentVerificationObserver *)v11->_verificationObserver setDelegate:v11];
    id v25 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v26 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v27 = (void *)[v25 initWithTitle:v26 style:2 target:v11 action:sel_next_];

    [v27 setEnabled:0];
    [v12 setRightBarButtonItem:v27];
    v11->_verificationAlreadyHandled = 0;
    v28 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v28 addObserver:v11 selector:sel__handlePassVerifiedNotification_ name:*MEMORY[0x1E4F87C28] object:0];

    [(PKPaymentSetupVerificationCompletionViewController *)v11 setModalInPresentation:1];
  }

  return v11;
}

- (void)_handlePassVerifiedNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__PKPaymentSetupVerificationCompletionViewController__handlePassVerifiedNotification___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __86__PKPaymentSetupVerificationCompletionViewController__handlePassVerifiedNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopVerificationObserver];
  *(unsigned char *)(*(void *)(a1 + 32) + 1155) = 1;
  v2 = [*(id *)(a1 + 40) userInfo];
  id v6 = [v2 objectForKey:@"uniqueID"];

  v3 = [*(id *)(*(void *)(a1 + 32) + 1160) pass];
  id v4 = [v3 uniqueID];
  int v5 = [v6 isEqualToString:v4];

  if (v5) {
    [*(id *)(a1 + 32) _handleNextStep];
  }
}

- (void)dealloc
{
  [(PKPaymentSetupVerificationCompletionViewController *)self _stopVerificationObserver];
  v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 unregisterObserver:self];

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  [(PKPaymentSetupTableViewController *)&v6 dealloc];
}

- (void)loadView
{
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  [(PKPaymentSetupTableViewController *)&v33 loadView];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 setRowHeight:60.0];
  id v4 = [PKTableHeaderView alloc];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v9 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  tableHeader = self->_tableHeader;
  self->_tableHeader = v9;

  v11 = [(PKPaymentVerificationController *)self->_verificationController passSnapshot];
  if (v11) {
    [(PKTableHeaderView *)self->_tableHeader setPassSnapshotUsingDefaultSize:v11 animated:0 needsCorners:0];
  }
  v12 = [(PKPaymentVerificationController *)self->_verificationController pass];
  char v13 = [v12 supportsBarcodePayment];

  if (v13) {
    PKLocalizedAquamanString(&cfstr_AccountVerific.isa);
  }
  else {
  v14 = PKLocalizedPaymentString(&cfstr_CardVerificati.isa);
  }
  v15 = [(PKTableHeaderView *)self->_tableHeader titleLabel];
  [v15 setText:v14];

  v16 = [(PKTableHeaderView *)self->_tableHeader subtitleLabel];
  v17 = [(PKPaymentVerificationController *)self->_verificationController pass];
  v18 = [v17 organizationName];
  v19 = PKLocalizedPaymentString(&cfstr_EnterCodeText.isa, &stru_1EF1B4C70.isa, v18);
  [v16 setText:v19];

  [v3 setTableHeaderView:self->_tableHeader];
  v20 = -[PKPaymentSetupFooterView initWithFrame:context:]([PKPaymentSetupFooterView alloc], "initWithFrame:context:", [(PKPaymentSetupTableViewController *)self context], v5, v6, v7, v8);
  tableFooter = self->_tableFooter;
  self->_tableFooter = v20;

  [(PKPaymentSetupFooterView *)self->_tableFooter setSetupLaterButton:0];
  v22 = [(PKPaymentSetupFooterView *)self->_tableFooter skipCardButton];
  uint64_t v23 = PKLocalizedPaymentString(&cfstr_ActivationVeri.isa);
  [v22 setTitle:v23 forState:0];

  [v22 addTarget:self action:sel_handleVerifyLater_ forControlEvents:0x2000];
  v24 = [(PKPaymentVerificationController *)self->_verificationController alternateMethodButtonTitle];
  if (v24 && (BOOL offerOtherMethods = self->_offerOtherMethods, v24, offerOtherMethods))
  {
    v26 = [(PKPaymentSetupFooterView *)self->_tableFooter manualEntryButton];
    v27 = [(PKPaymentVerificationController *)self->_verificationController alternateMethodButtonTitle];
    [v26 setTitle:v27 forState:0];

    [v26 addTarget:self action:sel_selectOtherVerificationMethod forControlEvents:64];
  }
  else
  {
    [(PKPaymentSetupFooterView *)self->_tableFooter setManualEntryButton:0];
  }
  v28 = [(PKPaymentSetupTableViewController *)self tableView];
  [v28 setTableFooterView:self->_tableFooter];

  v29 = +[PKUIForegroundActiveArbiter sharedInstance];
  objc_super v30 = v29;
  if (v29)
  {
    self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)[v29 registerObserver:self];
  }
  else
  {
    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:self selector:sel__applicationWillResignActive name:*MEMORY[0x1E4FB2738] object:0];

    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:self selector:sel__applicationDidBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
  }
  [(PKPaymentSetupVerificationCompletionViewController *)self _startVerificationObserver];
}

- (void)viewWillLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  [(PKPaymentSetupTableViewController *)&v23 viewWillLayoutSubviews];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 bounds];
  double v5 = v4;
  [(PKTableHeaderView *)self->_tableHeader frame];
  double v7 = v6;
  double v9 = v8;
  -[PKTableHeaderView sizeThatFits:](self->_tableHeader, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    tableHeader = self->_tableHeader;
    [v3 _rectForTableHeaderView];
    -[PKTableHeaderView setFrame:](tableHeader, "setFrame:");
    [v3 setTableHeaderView:0];
    [v3 setTableHeaderView:self->_tableHeader];
  }
  [(PKPaymentSetupFooterView *)self->_tableFooter frame];
  double v15 = v14;
  double v17 = v16;
  -[PKPaymentSetupFooterView sizeThatFits:](self->_tableFooter, "sizeThatFits:", v5, 1.79769313e308);
  if (v15 != v19 || v17 != v18)
  {
    double v21 = v18;
    tableFooter = self->_tableFooter;
    [v3 _rectForTableFooterView];
    -[PKPaymentSetupFooterView setFrame:](tableFooter, "setFrame:");
    [v3 _tableFooterHeightDidChangeToHeight:v21];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  [(PKPaymentSetupTableViewController *)&v6 viewWillAppear:a3];
  if (!self->_mode && self->_resignedResponder)
  {
    verificationCodeCell = self->_verificationCodeCell;
    if (verificationCodeCell)
    {
      double v5 = [(PKActivityTableCell *)verificationCodeCell editableTextField];
      if (([v5 isFirstResponder] & 1) == 0) {
        [v5 becomeFirstResponder];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  [(PKPaymentSetupTableViewController *)&v6 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  int64_t mode = self->_mode;
  if (mode == 1)
  {
    [(PKPaymentSetupVerificationCompletionViewController *)self _handleNextStep];
  }
  else if (!mode)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentSetupVerificationCompletionViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __68__PKPaymentSetupVerificationCompletionViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1096) editableTextField];
  [v1 becomeFirstResponder];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return !self->_verificationCodeAccepted;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return !self->_verificationCodeAccepted;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  verificationCodeCell = self->_verificationCodeCell;
  if (!verificationCodeCell)
  {
    objc_super v6 = [[PKActivityTableCell alloc] initWithStyle:1000 reuseIdentifier:0];
    double v7 = self->_verificationCodeCell;
    self->_verificationCodeCell = v6;

    [(PKActivityTableCell *)self->_verificationCodeCell setSelectionStyle:0];
    double v8 = self->_verificationCodeCell;
    double v9 = PKProvisioningSecondaryBackgroundColor();
    [(PKActivityTableCell *)v8 setBackgroundColor:v9];

    double v10 = [(PKActivityTableCell *)self->_verificationCodeCell textLabel];
    double v11 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
    [v10 setFont:v11];

    [v10 setMinimumScaleFactor:0.7];
    [v10 setBaselineAdjustment:1];
    [v10 setAdjustsFontSizeToFitWidth:1];
    v12 = PKLocalizedPaymentString(&cfstr_VerificationCo.isa);
    [v10 setText:v12];

    char v13 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];
    double v14 = PKLocalizedPaymentString(&cfstr_EnterCodeButto.isa);
    [v13 setPlaceholder:v14];

    [v13 setDelegate:self];
    [v13 setKeyboardType:11];
    double v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v13 setFont:v15];

    [v13 setAdjustsFontSizeToFitWidth:0];
    [v13 setClearButtonMode:1];
    [v13 setSecureTextEntry:1];
    [v13 setDisplaySecureTextUsingPlainText:1];
    objc_msgSend(v13, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:self selector:sel_textFieldDidChange_ name:*MEMORY[0x1E4FB3018] object:v13];

    verificationCodeCell = self->_verificationCodeCell;
  }

  return verificationCodeCell;
}

- (void)next:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  if (self->_verificationCodeAccepted)
  {
    [(PKPaymentSetupVerificationCompletionViewController *)self _handleNextStep];
  }
  else
  {
    [(PKPaymentSetupVerificationCompletionViewController *)self _stopVerificationObserver];
    [(PKPaymentSetupVerificationCompletionViewController *)self _submitVerificationCode];
  }
}

- (void)handleVerifyLater:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];

  [(PKPaymentSetupVerificationCompletionViewController *)self _handleNextStep];
}

- (void)selectOtherVerificationMethod
{
  [(PKPaymentSetupVerificationCompletionViewController *)self _stopVerificationObserver];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    [v5 showVerificationMethodsForVerificationCompletionViewController:self];
  }
  else
  {
    verificationController = self->_verificationController;
    [(PKPaymentVerificationController *)verificationController selectOtherVerificationMethod];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = objc_msgSend(v5, "indexPathForRowAtPoint:", v7, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentSetupVerificationCompletionViewController_textFieldDidBeginEditing___block_invoke;
  v13[3] = &unk_1E59CA870;
  id v14 = v5;
  id v15 = v10;
  id v11 = v10;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __79__PKPaymentSetupVerificationCompletionViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollToRowAtIndexPath:*(void *)(a1 + 40) atScrollPosition:3 animated:1];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];

  if (v11 == v9 && [v10 length])
  {
    char v13 = [v9 text];
    id v14 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    BOOL v12 = (unint64_t)[v14 length] < 9;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];

  if (v4 == v5)
  {
    id v9 = [(PKPaymentSetupVerificationCompletionViewController *)self navigationItem];
    double v6 = [v9 rightBarButtonItem];
    double v7 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];
    double v8 = [v7 text];
    objc_msgSend(v6, "setEnabled:", (unint64_t)objc_msgSend(v8, "length") > 3);
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];

  if (v5 == v4)
  {
    double v6 = [v4 text];
    unint64_t v7 = [v6 length];

    if (v7 >= 4) {
      [(PKPaymentSetupVerificationCompletionViewController *)self _submitVerificationCode];
    }
  }

  return 1;
}

- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentSetupVerificationCompletionViewController_verificationObserver_didObserveVerificationCode___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __102__PKPaymentSetupVerificationCompletionViewController_verificationObserver_didObserveVerificationCode___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "OTP captured - updating UI", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 1112) stop];
  v3 = [*(id *)(*(void *)(a1 + 32) + 1096) editableTextField];
  [v3 setText:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 48) verificationChannel];
  char v5 = [v4 requiresUserInteraction];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) navigationItem];
    id v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:1];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Verification requires no user interaction, performing next step automatically", v8, 2u);
    }

    [*(id *)(a1 + 32) next:0];
  }
}

- (void)verificationObserverDidTimeout:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Verification observer timed out...", v6, 2u);
  }

  verificationObserver = self->_verificationObserver;
  self->_verificationObserver = 0;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  id v6 = a3;
  BOOL foregroundActive = self->_foregroundActiveState.foregroundActive;
  self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)a4;
  if (!foregroundActive && (*(_WORD *)&a4 & 0x100) != 0)
  {
    id v8 = v6;
    [(PKPaymentSetupVerificationCompletionViewController *)self _startVerificationObserver];
LABEL_7:
    id v6 = v8;
    goto LABEL_8;
  }
  if (foregroundActive && (*(_WORD *)&a4 & 0x100) == 0)
  {
    id v8 = v6;
    [(PKPaymentSetupVerificationCompletionViewController *)self _stopVerificationObserver];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    [(PKPaymentSetupVerificationCompletionViewController *)self _disableUI];
  }
  else {
    [(PKPaymentSetupVerificationCompletionViewController *)self _enableUI];
  }
}

- (void)_startVerificationObserver
{
  if (self->_verificationAlreadyHandled)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Pass verification already handled, so skipping starting observer", buf, 2u);
    }
  }
  else
  {
    id v4 = [(PKPaymentVerificationController *)self->_verificationController webService];
    id v5 = [v4 targetDevice];

    if (objc_opt_respondsToSelector()) {
      [v5 noteForegroundVerificationObserverActive:1];
    }
    [(PKPaymentVerificationObserver *)self->_verificationObserver setDelegate:self];
    [(PKPaymentVerificationObserver *)self->_verificationObserver startObservingVerificationSourceWithTimeout:0.0];
  }
}

- (void)_stopVerificationObserver
{
  [(PKPaymentVerificationObserver *)self->_verificationObserver setDelegate:0];
  [(PKPaymentVerificationObserver *)self->_verificationObserver stop];
  v3 = [(PKPaymentVerificationController *)self->_verificationController webService];
  id v4 = [v3 targetDevice];

  if (objc_opt_respondsToSelector()) {
    [v4 noteForegroundVerificationObserverActive:0];
  }
}

- (void)_handleNextStep
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_verificationCodeAccepted) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupVerificationCompletionViewController: handling next step with accepted code: %@", buf, 0xCu);
  }

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportPageCompleted:self->_verificationCodeAccepted context:0];
  if (self->_verificationCodeAccepted)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PKPaymentSetupVerificationCompletionViewController__handleNextStep__block_invoke;
    v6[3] = &unk_1E59CA7D0;
    v6[4] = self;
    [(PKPaymentSetupVerificationCompletionViewController *)self _showCompletedUIWithNextHandler:v6];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    [WeakRetained verificationCompletionViewControllerDidFinish:self];
  }
}

void __69__PKPaymentSetupVerificationCompletionViewController__handleNextStep__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1184));
  [WeakRetained verificationCompletionViewControllerDidFinish:*(void *)(a1 + 32)];
}

- (void)_showCompletedUIWithNextHandler:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Showing completed UI for verified pass", buf, 2u);
  }

  id v6 = [(PKActivityTableCell *)self->_verificationCodeCell activityIndicator];
  [v6 stopAnimating];
  [v6 removeFromSuperview];
  [(PKActivityTableCell *)self->_verificationCodeCell setAccessoryType:3];
  [(PKActivityTableCell *)self->_verificationCodeCell setNeedsLayout];
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke;
  v9[3] = &unk_1E59CAD18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);
}

void __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1160) pass];
  [*(id *)(a1 + 32) _showCompletedUIForPass:v2];
  if (*(void *)(a1 + 40))
  {
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v9 = *(id *)(a1 + 40);
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = PKLocalizedString(&cfstr_Done.isa);
    id v6 = (void *)[v4 initWithTitle:v5 style:2 target:*(void *)(a1 + 32) action:sel__terminateFlow];

    [v6 setEnabled:1];
    dispatch_time_t v7 = [*(id *)(a1 + 32) navigationItem];
    [v7 setRightBarButtonItem:v6 animated:1];
  }
}

uint64_t __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Completed UI presentation finished handleing next action", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_submitVerificationCode
{
  [(PKPaymentSetupVerificationCompletionViewController *)self _disableUI];
  objc_initWeak(&location, self);
  dispatch_time_t v3 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];
  id v4 = [v3 text];
  id v5 = objc_msgSend(v4, "pk_zString");

  verificationController = self->_verificationController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke;
  v7[3] = &unk_1E59E0DB0;
  objc_copyWeak(&v8, &location);
  [(PKPaymentVerificationController *)verificationController submitVerificationCode:v5 completion:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke_2;
    block[3] = &unk_1E59CC648;
    uint64_t v12 = a2;
    id v10 = WeakRetained;
    id v11 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  dispatch_time_t v3 = (unsigned char *)a1[4];
  if (v2 == 1)
  {
    v3[1104] = 1;
    id v4 = (void *)a1[4];
    return [v4 _handleNextStep];
  }
  else
  {
    [v3 _showActivationError:a1[5]];
    id v6 = (void *)a1[4];
    return [v6 _enableUI];
  }
}

- (void)_disableUI
{
  [(PKPaymentSetupFooterView *)self->_tableFooter setButtonsEnabled:0];
  p_verificationCodeCell = &self->_verificationCodeCell;
  id v4 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];
  id v5 = [v4 text];
  objc_msgSend(v5, "pk_zString");
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v19 length];
  p_tableHeader = (id *)&self->_verificationCodeCell;
  if (!v6)
  {
    p_tableHeader = (id *)&self->_verificationCodeCell;
    if (!self->_verificationCodeAccepted) {
      p_tableHeader = (id *)&self->_tableHeader;
    }
  }
  id v8 = [*p_tableHeader activityIndicator];
  [v8 startAnimating];

  id v9 = [(PKActivityTableCell *)*p_verificationCodeCell editableTextField];
  id v10 = v9;
  if (!self->_resignedResponder) {
    self->_resignedResponder = [v9 isFirstResponder];
  }
  [v10 resignFirstResponder];
  id v11 = [(PKActivityTableCell *)*p_verificationCodeCell editableTextField];
  [v11 setEnabled:0];

  if (!self->_editableTextFieldColor)
  {
    uint64_t v12 = [v10 textColor];
    editableTextFieldColor = self->_editableTextFieldColor;
    self->_editableTextFieldColor = v12;

    id v14 = [MEMORY[0x1E4FB1618] placeholderTextColor];
    [v10 setTextColor:v14];
  }
  id v15 = [(PKActivityTableCell *)*p_verificationCodeCell textLabel];
  [v15 setEnabled:0];

  double v16 = [(PKPaymentSetupVerificationCompletionViewController *)self navigationItem];
  double v17 = [v16 rightBarButtonItem];
  [v17 setEnabled:0];

  double v18 = [v16 leftBarButtonItem];
  [v18 setEnabled:0];

  [v16 setHidesBackButton:1];
}

- (void)_enableUI
{
  [(PKPaymentSetupFooterView *)self->_tableFooter setButtonsEnabled:1];
  dispatch_time_t v3 = [(PKActivityTableCell *)self->_verificationCodeCell activityIndicator];
  [v3 stopAnimating];

  id v4 = [(PKTableHeaderView *)self->_tableHeader activityIndicator];
  [v4 stopAnimating];

  id v10 = [(PKActivityTableCell *)self->_verificationCodeCell editableTextField];
  [v10 setEnabled:1];
  if (self->_editableTextFieldColor)
  {
    objc_msgSend(v10, "setTextColor:");
    editableTextFieldColor = self->_editableTextFieldColor;
    self->_editableTextFieldColor = 0;
  }
  uint64_t v6 = [(PKActivityTableCell *)self->_verificationCodeCell textLabel];
  [v6 setEnabled:1];

  dispatch_time_t v7 = [(PKPaymentSetupVerificationCompletionViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:1];

  id v9 = [v7 leftBarButtonItem];
  [v9 setEnabled:1];

  [v7 setHidesBackButton:0];
}

- (void)_terminateFlow
{
  [(PKPaymentSetupVerificationCompletionViewController *)self _stopVerificationObserver];
  id v7 = [(PKPaymentVerificationController *)self->_verificationController setupDelegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    [v4 verificationCompletionViewControllerDidFinish:self];
  }
  if (v7)
  {
    [v7 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v5 = [(PKPaymentSetupVerificationCompletionViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v6 = [(PKPaymentSetupVerificationCompletionViewController *)self navigationItem];
  [v6 setHidesBackButton:0];
}

- (void)_showCompletedUIForPass:(id)a3
{
  id v22 = a3;
  id v4 = [(PKPaymentVerificationController *)self->_verificationController webService];
  id v5 = [v4 targetDevice];
  uint64_t v6 = [v5 secureElementIdentifiers];

  id v7 = [v22 primaryPaymentApplicationForSecureElementIdentifiers:v6];
  if ([v7 state] == 2)
  {
    id v8 = PKLocalizedPaymentString(&cfstr_CodeAcceptedTi.isa);
    id v9 = @"WAITING_FOR_ACTIVATION_FORMAT";
  }
  else
  {
    int v10 = [v22 supportsBarcodePayment];
    int v11 = v10;
    if (v10) {
      PKLocalizedAquamanString(&cfstr_AccountActivat_1.isa);
    }
    else {
    id v8 = PKLocalizedPaymentString(&cfstr_CardActivatedT.isa);
    }
    if ([v22 isAccessPass])
    {
      id v9 = @"GENERIC_READY_TO_USE_FORMAT";
    }
    else
    {
      if ([v22 hasActiveVirtualCard])
      {
        uint64_t v12 = PKLocalizedVirtualCardString(&cfstr_VirtualCardPay.isa);
        goto LABEL_15;
      }
      if (v11) {
        id v9 = @"PAYMENT_READY_TO_USE_WALLET_FORMAT";
      }
      else {
        id v9 = @"PAYMENT_READY_TO_USE_FORMAT";
      }
    }
  }
  uint64_t v12 = PKLocalizedPaymentString(&v9->isa);
LABEL_15:
  char v13 = (void *)v12;
  id v14 = [(PKPaymentSetupVerificationCompletionViewController *)self navigationItem];
  [v14 setLeftBarButtonItem:0];
  [v14 setHidesBackButton:1];
  id v15 = [(PKPaymentSetupTableViewController *)self tableView];
  double v16 = [v15 tableHeaderView];
  double v17 = [v16 titleLabel];
  [v17 setText:v8];

  double v18 = [v16 subtitleLabel];
  id v19 = [v22 localizedDescription];
  v20 = PKStringWithValidatedFormat();
  objc_msgSend(v18, "setText:", v20, v19);

  [v16 setNeedsLayout];
  [v15 setTableHeaderView:v16];
  [v15 setTableFooterView:0];
  if ([v15 numberOfSections] >= 1)
  {
    [v15 beginUpdates];
    double v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v15 deleteSections:v21 withRowAnimation:0];

    [v15 endUpdates];
  }
}

- (void)_showActivationError:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLocalizedPaymentString(&cfstr_ActivationFail.isa);
  uint64_t v6 = PKLocalizedPaymentString(&cfstr_ActivationFail_0.isa);
  id v7 = [v4 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v8)
  {
    uint64_t v9 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);

    uint64_t v10 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
LABEL_3:
    int v11 = v6;
    uint64_t v6 = (void *)v10;
    id v5 = (void *)v9;
LABEL_4:

LABEL_5:
    uint64_t v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    objc_initWeak(location, self);
    char v13 = (void *)MEMORY[0x1E4FB1410];
    id v14 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__PKPaymentSetupVerificationCompletionViewController__showActivationError___block_invoke;
    v22[3] = &unk_1E59CCFF0;
    objc_copyWeak(&v23, location);
    id v15 = [v13 actionWithTitle:v14 style:1 handler:v22];
    [v12 addAction:v15];

    [(PKPaymentSetupVerificationCompletionViewController *)self presentViewController:v12 animated:1 completion:0];
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
    goto LABEL_6;
  }
  double v16 = [v4 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F88098]];

  if (!v17)
  {
    int v11 = [v4 domain];
    if (![v11 isEqualToString:*MEMORY[0x1E4F87C30]]) {
      goto LABEL_4;
    }
    v20 = [v4 localizedFailureReason];

    if (!v20) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  uint64_t v18 = [v4 code];
  if ((unint64_t)(v18 - 2) < 4)
  {
LABEL_9:
    id v19 = [v4 localizedFailureReason];

    if (!v19) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v9 = [v4 localizedFailureReason];

    uint64_t v10 = [v4 localizedRecoverySuggestion];
    goto LABEL_3;
  }
  if (v18 != 1)
  {
    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    double v21 = [v4 description];
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v21;
    _os_log_error_impl(&dword_19F450000, v12, OS_LOG_TYPE_ERROR, "Skipping alert for error :%{public}@", (uint8_t *)location, 0xCu);
  }
LABEL_6:
}

void __75__PKPaymentSetupVerificationCompletionViewController__showActivationError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((unsigned char *)WeakRetained + 1105))
  {
    dispatch_time_t v3 = WeakRetained;
    uint64_t v2 = [WeakRetained[137] editableTextField];
    [v2 becomeFirstResponder];

    id WeakRetained = v3;
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (PKPaymentVerificationController)verificationController
{
  return self->_verificationController;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPaymentSetupVerificationCompletionViewControllerFlowItemDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentSetupVerificationCompletionViewControllerFlowItemDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_editableTextFieldColor, 0);
  objc_storeStrong((id *)&self->_tableFooter, 0);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_verificationObserver, 0);

  objc_storeStrong((id *)&self->_verificationCodeCell, 0);
}

@end