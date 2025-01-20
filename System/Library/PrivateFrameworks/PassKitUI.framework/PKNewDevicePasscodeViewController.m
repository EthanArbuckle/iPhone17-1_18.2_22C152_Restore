@interface PKNewDevicePasscodeViewController
- (PKNewDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3 minimumPasscodeLength:(int64_t)a4 withCurrentPasscode:(id)a5;
- (PKNewDevicePasscodeViewControllerDelegate)delegate;
- (id)_instructionsForState:(unint64_t)a3;
- (id)_passcodeInputViewForPasscodeInputState:(unint64_t)a3 passcodeInputScreenType:(unint64_t)a4;
- (id)_passcodeOptionAlertController;
- (id)_titleForState:(unint64_t)a3;
- (unint64_t)_passcodeInputScreenTypeForUnlockScreenType:(int)a3;
- (unint64_t)onPresentationRemoveViewControllersAfterMarker;
- (void)_applyPasscode;
- (void)_configureNavigationItemForPasscodeInputScreenType:(unint64_t)a3 animated:(BOOL)a4;
- (void)_handleTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)_nextButtonPressed;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_setPasscodeInputState:(unint64_t)a3 forceUpdate:(BOOL)a4;
- (void)_transitionToNextStateForPasscodeInput:(id)a3;
- (void)_transitionToPasscodeInputScreenType:(unint64_t)a3;
- (void)_updateNextButton;
- (void)_updateNextButtonForPasscode:(id)a3;
- (void)loadView;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKNewDevicePasscodeViewController

- (PKNewDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3 minimumPasscodeLength:(int64_t)a4 withCurrentPasscode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKNewDevicePasscodeViewController;
  v10 = [(PKNewDevicePasscodeViewController *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_flowController, v8);
    v11->_minimumPasscodeLength = a4;
    uint64_t v12 = objc_msgSend(v9, "pk_zString");
    currentPasscode = v11->_currentPasscode;
    v11->_currentPasscode = (NSString *)v12;

    v11->_passcodeInputState = 0;
    v11->_context = [v8 context];
    v14 = [(PKNewDevicePasscodeViewController *)v11 navigationItem];
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v11->_paymentService;
    v11->_paymentService = v15;
  }
  return v11;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v5 loadView];
  v3 = (BFFPasscodeView *)objc_msgSend(objc_alloc(getBFFPasscodeViewClass()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  passcodeView = self->_passcodeView;
  self->_passcodeView = v3;

  [(BFFPasscodeView *)self->_passcodeView setAutoresizingMask:18];
  [(BFFPasscodeView *)self->_passcodeView setPasscodeViewController:self];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts]&& (PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
  {
    [(BFFPasscodeView *)self->_passcodeView setScrollEnabled:0];
  }
  [(PKNewDevicePasscodeViewController *)self setView:self->_passcodeView];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:0];

  self->_passcodeInputScreenType = [(PKNewDevicePasscodeViewController *)self _passcodeInputScreenTypeForUnlockScreenType:v4];
  -[PKNewDevicePasscodeViewController _configureNavigationItemForPasscodeInputScreenType:animated:](self, "_configureNavigationItemForPasscodeInputScreenType:animated:");
  passcodeView = self->_passcodeView;
  v6 = [(PKNewDevicePasscodeViewController *)self _titleForState:self->_passcodeInputState];
  [(BFFPasscodeView *)passcodeView setTitle:v6];

  v7 = [(PKNewDevicePasscodeViewController *)self _passcodeInputViewForPasscodeInputState:self->_passcodeInputState passcodeInputScreenType:self->_passcodeInputScreenType];
  [(BFFPasscodeView *)self->_passcodeView transitionToPasscodeInput:v7 delegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v5 viewWillAppear:a3];
  if (!self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained beginShowingViewController];

    self->_viewHasAppeared = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
  [v4 becomeFirstResponder];
  objc_super v5 = [v4 passcode];
  [(PKNewDevicePasscodeViewController *)self _updateNextButtonForPasscode:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
  [v4 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKNewDevicePasscodeViewController;
  [(PKNewDevicePasscodeViewController *)&v7 viewDidDisappear:a3];
  [(BFFPasscodeView *)self->_passcodeView transitionToPasscodeInput:0 delegate:0];
  currentPasscode = self->_currentPasscode;
  self->_currentPasscode = 0;

  newPasscode = self->_newPasscode;
  self->_newPasscode = 0;

  if (self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained endedShowingViewController];

    self->_viewHasAppeared = 0;
  }
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 5;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 passcodeField];
  [v7 forceDisplayIfNeeded];

  dispatch_time_t v8 = dispatch_time(0, 76000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PKNewDevicePasscodeViewController_passcodeInput_enteredPasscode___block_invoke;
  v10[3] = &unk_1E59CA870;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);
}

void __67__PKNewDevicePasscodeViewController_passcodeInput_enteredPasscode___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pk_zString");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _transitionToNextStateForPasscodeInput:v2];
}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  id v8 = [(PKNewDevicePasscodeViewController *)self _passcodeOptionAlertController];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [v8 setModalPresentationStyle:7];
    objc_super v5 = [v8 popoverPresentationController];
    id v6 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
    objc_super v7 = [v6 footerButton];

    [v5 setPermittedArrowDirections:2];
    [v5 setSourceView:v7];
    [v7 bounds];
    objc_msgSend(v5, "setSourceRect:");
  }
  [(PKNewDevicePasscodeViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_nextButtonPressed
{
  v3 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
  uint64_t v4 = [v3 passcode];
  objc_msgSend(v4, "pk_zString");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(PKNewDevicePasscodeViewController *)self _transitionToNextStateForPasscodeInput:v5];
}

- (void)_updateNextButton
{
  id v4 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
  v3 = [v4 passcode];
  [(PKNewDevicePasscodeViewController *)self _updateNextButtonForPasscode:v3];
}

- (void)_updateNextButtonForPasscode:(id)a3
{
  id v9 = a3;
  if ((unint64_t)[v9 length] >= self->_minimumPasscodeLength)
  {
    id v5 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v4 = [v5 passcode:v9 meetsCurrentConstraintsOutError:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v6 = [(PKNewDevicePasscodeViewController *)self navigationItem];
  objc_super v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v4];

  id v8 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v8 setReturnKeyEnabled:v4];
}

- (void)_transitionToNextStateForPasscodeInput:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  unint64_t passcodeInputState = self->_passcodeInputState;
  switch(passcodeInputState)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      if (![(NSString *)self->_newPasscode isEqualToString:v5])
      {
        unint64_t passcodeInputState = 2;
        break;
      }
      id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v8];
      v13 = [(PKNewDevicePasscodeViewController *)self navigationItem];
      [v13 setRightBarButtonItem:v12];

      [v8 startAnimating];
      [(PKNewDevicePasscodeViewController *)self _setNavigationBarEnabled:0];
      [(PKNewDevicePasscodeViewController *)self _applyPasscode];

      goto LABEL_12;
    case 0uLL:
LABEL_4:
      if ((unint64_t)[v5 length] < self->_minimumPasscodeLength)
      {
        id v8 = 0;
        goto LABEL_6;
      }
      v14 = [MEMORY[0x1E4F74230] sharedConnection];
      id v21 = 0;
      int v15 = [v14 passcode:v6 meetsCurrentConstraintsOutError:&v21];
      id v8 = v21;

      if (!v15)
      {
        if (v8)
        {
          v17 = [v8 domain];
          int v18 = [v17 isEqualToString:*MEMORY[0x1E4F741E0]];

          if (v18)
          {
            v19 = [v8 localizedDescription];
            constraintFailedInstructions = self->_constraintFailedInstructions;
            self->_constraintFailedInstructions = v19;

            goto LABEL_7;
          }
        }
LABEL_6:
        id v9 = [MEMORY[0x1E4F74230] sharedConnection];
        v10 = [v9 localizedDescriptionOfCurrentPasscodeConstraints];
        id v11 = self->_constraintFailedInstructions;
        self->_constraintFailedInstructions = v10;

LABEL_7:
        unint64_t passcodeInputState = 0;
        break;
      }
      objc_storeStrong((id *)&self->_newPasscode, a3);
      v16 = self->_constraintFailedInstructions;
      self->_constraintFailedInstructions = 0;

LABEL_12:
      unint64_t passcodeInputState = 1;
      break;
  }
  [(PKNewDevicePasscodeViewController *)self _setPasscodeInputState:passcodeInputState forceUpdate:0];
}

- (void)_handleTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  passcodeView = self->_passcodeView;
  objc_super v7 = [(PKNewDevicePasscodeViewController *)self _titleForState:a4];
  [(BFFPasscodeView *)passcodeView setTitle:v7];

  if (!a4)
  {
    v14 = [(BFFPasscodeView *)self->_passcodeView passcodeInputView];
    [v14 setPasscode:&stru_1EF1B5B50];

    int v15 = self->_passcodeView;
    v10 = [(PKNewDevicePasscodeViewController *)self _passcodeInputViewForPasscodeInputState:0 passcodeInputScreenType:self->_passcodeInputScreenType];
    id v11 = v15;
    uint64_t v12 = v10;
    uint64_t v13 = 3;
LABEL_8:
    [(BFFPasscodeView *)v11 animateTransitionToPasscodeInput:v12 animation:v13];
LABEL_9:

    goto LABEL_10;
  }
  if (a4 <= 2)
  {
    if (a4 == 1) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    id v9 = self->_passcodeView;
    v10 = [(PKNewDevicePasscodeViewController *)self _passcodeInputViewForPasscodeInputState:a4 passcodeInputScreenType:self->_passcodeInputScreenType];
    id v11 = v9;
    uint64_t v12 = v10;
    uint64_t v13 = v8;
    goto LABEL_8;
  }
  if (a4 == 3)
  {
    v10 = [(PKNewDevicePasscodeViewController *)self navigationItem];
    [v10 setRightBarButtonItem:0];
    goto LABEL_9;
  }
LABEL_10:

  [(PKNewDevicePasscodeViewController *)self _updateNextButton];
}

- (void)_setPasscodeInputState:(unint64_t)a3 forceUpdate:(BOOL)a4
{
  unint64_t passcodeInputState = self->_passcodeInputState;
  self->_unint64_t passcodeInputState = a3;
  if (passcodeInputState != a3 || a4) {
    -[PKNewDevicePasscodeViewController _handleTransitionFromState:toState:](self, "_handleTransitionFromState:toState:");
  }
}

- (id)_passcodeInputViewForPasscodeInputState:(unint64_t)a3 passcodeInputScreenType:(unint64_t)a4
{
  if (a4) {
    uint64_t v6 = objc_msgSend(objc_alloc(off_1EC34A018()), "initWithFrame:numericOnly:", a4 == 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else {
    uint64_t v6 = objc_msgSend(objc_alloc(_MergedGlobals_3_13()), "initWithFrame:numberOfEntryFields:", 6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  objc_super v7 = (void *)v6;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    uint64_t v8 = [(PKNewDevicePasscodeViewController *)self _passcodeOptionAlertController];
    id v9 = [v8 actions];

    if ((unint64_t)[v9 count] >= 2)
    {
      v10 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad.isa);
      [v7 setFooterButtonText:v10];
    }
  }
  id v11 = [v7 instructions];
  uint64_t v12 = [(PKNewDevicePasscodeViewController *)self _instructionsForState:self->_passcodeInputState];
  [v11 setText:v12];

  return v7;
}

- (void)_configureNavigationItemForPasscodeInputScreenType:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    objc_super v7 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_0.isa);
    id v9 = (id)[v6 initWithTitle:v7 style:2 target:self action:sel__nextButtonPressed];

    uint64_t v8 = [(PKNewDevicePasscodeViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v9 animated:v4];

    [(PKNewDevicePasscodeViewController *)self _updateNextButton];
  }
  else
  {
    id v9 = [(PKNewDevicePasscodeViewController *)self navigationItem];
    [v9 setRightBarButtonItem:0 animated:v4];
  }
}

- (id)_passcodeOptionAlertController
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:0];

  unint64_t v5 = [(PKNewDevicePasscodeViewController *)self _passcodeInputScreenTypeForUnlockScreenType:v4];
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  if (v5)
  {
    if (v5 > 2) {
      goto LABEL_11;
    }
  }
  else if (self->_passcodeInputScreenType)
  {
    objc_super v7 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_1.isa);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke;
    v22[3] = &unk_1E59CB1F0;
    v22[4] = self;
    id v9 = [v7 actionWithTitle:v8 style:0 handler:v22];
    [v6 addAction:v9];
  }
  if (self->_passcodeInputScreenType != 2)
  {
    v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_2.isa);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_2;
    v21[3] = &unk_1E59CB1F0;
    v21[4] = self;
    uint64_t v12 = [v10 actionWithTitle:v11 style:0 handler:v21];
    [v6 addAction:v12];
  }
  if (v5 <= 1 && self->_passcodeInputScreenType != 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
    v14 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_3.isa);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_3;
    v20[3] = &unk_1E59CB1F0;
    v20[4] = self;
    int v15 = [v13 actionWithTitle:v14 style:0 handler:v20];
    [v6 addAction:v15];
  }
LABEL_11:
  v16 = (void *)MEMORY[0x1E4FB1410];
  v17 = PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_4.isa);
  int v18 = [v16 actionWithTitle:v17 style:1 handler:0];
  [v6 addAction:v18];

  return v6;
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToPasscodeInputScreenType:0];
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToPasscodeInputScreenType:2];
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToPasscodeInputScreenType:1];
}

- (void)_transitionToPasscodeInputScreenType:(unint64_t)a3
{
  if (self->_passcodeInputScreenType != a3)
  {
    self->_passcodeInputScreenType = a3;
    -[PKNewDevicePasscodeViewController _configureNavigationItemForPasscodeInputScreenType:animated:](self, "_configureNavigationItemForPasscodeInputScreenType:animated:");
    [(PKNewDevicePasscodeViewController *)self _setPasscodeInputState:0 forceUpdate:1];
  }
}

- (void)_applyPasscode
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  uint64_t v6 = 0;
  block[6] = MEMORY[0x1E4F143A8];
  block[7] = 3221225472;
  block[8] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke;
  block[9] = &unk_1E59CB4B0;
  block[10] = v5;
  uint64_t v6 = PKBeginBackgroundTask();
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_2;
  block[3] = &unk_1E59D0A90;
  block[4] = self;
  block[5] = v5;
  dispatch_async(v3, block);

  _Block_object_dispose(v5, 8);
}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v3 = *MEMORY[0x1E4F870E0];
  if (result != *MEMORY[0x1E4F870E0])
  {
    uint64_t result = PKEndBackgroundTask();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  }
  return result;
}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_2(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[131];
  uint64_t v4 = v2[127];
  uint64_t v5 = v2[128];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_3;
  v7[3] = &unk_1E59D0A68;
  long long v8 = v1;
  return [v3 changePasscodeFrom:v4 toPasscode:v5 completion:v7];
}

void __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_4;
  v8[3] = &unk_1E59D0A40;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    [v2 saveDeviceUnlockPasscodeInputModes];
  }
  [*(id *)(a1 + 32) _setPasscodeInputState:3 forceUpdate:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
  [WeakRetained newDevicePasscodeViewController:*(void *)(a1 + 32) didFinishSettingPasscode:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (result != *MEMORY[0x1E4F870E0])
  {
    return PKEndBackgroundTask();
  }
  return result;
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKNewDevicePasscodeViewController *)self navigationController];
  id v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  uint64_t v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  id v7 = [(PKNewDevicePasscodeViewController *)self navigationItem];
  long long v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  id v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (unint64_t)_passcodeInputScreenTypeForUnlockScreenType:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  if (a3 == 1) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  return self->_minimumPasscodeLength > 6;
}

- (id)_titleForState:(unint64_t)a3
{
  if (a3 <= 3)
  {
    PKLocalizedPaymentString(&off_1E59D0AB0[a3]->isa);
    self = (PKNewDevicePasscodeViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_instructionsForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = @"PASSCODE_UPGRADE_PASSCODES_FAILED_TO_MATCH";
LABEL_8:
    PKLocalizedPaymentString(&v5->isa);
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    id v5 = @"PASSCODE_UPGRADE_RE_ENTER_PASSCODE";
    goto LABEL_8;
  }
  if (a3)
  {
    uint64_t v6 = &stru_1EF1B5B50;
  }
  else
  {
    if ([(NSString *)self->_constraintFailedInstructions length])
    {
      uint64_t v4 = self->_constraintFailedInstructions;
LABEL_9:
      uint64_t v6 = (__CFString *)v4;
      goto LABEL_12;
    }
    id v7 = (void *)MEMORY[0x1E4F28EE0];
    long long v8 = [NSNumber numberWithUnsignedInteger:self->_minimumPasscodeLength];
    id v9 = [v7 localizedStringFromNumber:v8 numberStyle:5];

    PKDeviceSpecificLocalizedStringKeyForKey(@"PASSCODE_UPGRADE_REQUIRED_BODY", 0);
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v10, &stru_1EF1B4C70.isa, v9);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v6;
}

- (PKNewDevicePasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKNewDevicePasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_constraintFailedInstructions, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_currentPasscode, 0);

  objc_destroyWeak((id *)&self->_flowController);
}

@end