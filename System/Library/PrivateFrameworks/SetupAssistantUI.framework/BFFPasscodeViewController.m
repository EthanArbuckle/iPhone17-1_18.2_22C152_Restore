@interface BFFPasscodeViewController
+ (BOOL)allowSkip;
- (BFFPasscodeCreationManager)passcodeManager;
- (BFFPasscodeViewControllerDelegate)passcodeCreationDelegate;
- (BOOL)_allowSkip;
- (id)_firstEntryInstructions;
- (id)_passcodeInputViewForState:(unint64_t)a3;
- (id)instructionsForState:(unint64_t)a3;
- (id)passcodeInputView;
- (id)passcodeOptionAlertController;
- (id)titleForState:(unint64_t)a3;
- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4;
- (void)_commitPasscodeEntryTypeChange;
- (void)_finishedWithPasscode:(id)a3;
- (void)_setupFirstEntry;
- (void)_showPasscodeOptionsSheet;
- (void)_showSkipPasscodeAlert;
- (void)_showWeakWarningAlert;
- (void)_updateNextButton;
- (void)_updateNextButtonForPasscode:(id)a3;
- (void)clear;
- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)nextButtonPressed;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5;
- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)passcodeManagerWillSetPasscode:(id)a3;
- (void)setPasscodeCreationDelegate:(id)a3;
- (void)setPasscodeManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BFFPasscodeViewController

+ (BOOL)allowSkip
{
  if (PSHasStockholmPass())
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v3 = [MEMORY[0x263F53C50] sharedConnection];
    int v2 = [v3 isPasscodeRequired] ^ 1;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(BFFPasscodeViewController *)self passcodeManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v4 dealloc];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v7 loadView];
  v3 = [BFFPasscodeView alloc];
  objc_super v4 = -[BFFPasscodeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(BFFPasscodeView *)v4 setAutoresizingMask:18];
  [(BFFPasscodeView *)v4 setPasscodeViewController:self];
  [(BFFPasscodeViewController *)self setView:v4];
  v5 = +[BFFStyle sharedStyle];
  v6 = [(BFFPasscodeViewController *)self navigationItem];
  [v5 applyAutomaticScrollToEdgeBehaviorOnNavigationItem:v6];
}

- (void)_setupFirstEntry
{
  v3 = +[BFFPasscodeCreationManager sharedPasscodeManager];
  [(BFFPasscodeViewController *)self setPasscodeManager:v3];

  objc_super v4 = [(BFFPasscodeViewController *)self passcodeManager];
  [v4 reset];

  v5 = [(BFFPasscodeViewController *)self passcodeManager];
  [v5 setDelegate:self];

  int v21 = 0;
  v6 = [MEMORY[0x263F53C50] sharedConnection];
  int v7 = [v6 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v21];

  if (v7)
  {
    v8 = [(BFFPasscodeViewController *)self passcodeManager];
    [v8 setNumericPasscodeEntry:0];

    v9 = [(BFFPasscodeViewController *)self passcodeManager];
    [v9 setSimplePasscodeEntryLength:0];
  }
  else
  {
    if (PSSupportsMesa()) {
      int v10 = 1;
    }
    else {
      int v10 = MGGetBoolAnswer();
    }
    if (v21 == 1) {
      int v11 = 1;
    }
    else {
      int v11 = v10;
    }
    v12 = [(BFFPasscodeViewController *)self passcodeManager];
    v13 = v12;
    if (v11) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = 4;
    }
    [v12 setSimplePasscodeEntryLength:v14];

    v9 = [(BFFPasscodeViewController *)self passcodeManager];
    [v9 setNumericPasscodeEntry:1];
  }

  [(BFFPasscodeViewController *)self configurePasscodeTypeUsingAnimations:0];
  v15 = [(BFFPasscodeViewController *)self passcodeManager];
  uint64_t v16 = [v15 passcodeState];

  v17 = [(BFFPasscodeViewController *)self view];
  v18 = [(BFFPasscodeViewController *)self titleForState:v16];
  [v17 setTitle:v18];

  v19 = [(BFFPasscodeViewController *)self _passcodeInputViewForState:v16];
  v20 = [(BFFPasscodeViewController *)self view];
  [v20 transitionToPasscodeInput:v19 delegate:self];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v3 viewDidLoad];
  [(BFFPasscodeViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  [(BFFPasscodeViewController *)self _setupFirstEntry];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(BFFPasscodeViewController *)self view];
  v5 = [v4 passcodeInputView];

  [v5 becomeFirstResponder];
  v6 = [v5 passcode];
  [(BFFPasscodeViewController *)self _updateNextButtonForPasscode:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v11 viewDidAppear:a3];
  objc_super v4 = [(BFFPasscodeViewController *)self view];
  [v4 contentSize];
  double v6 = v5;
  objc_super v7 = [(BFFPasscodeViewController *)self view];
  [v7 frame];
  double v9 = v8;

  if (v6 > v9)
  {
    int v10 = [(BFFPasscodeViewController *)self view];
    [v10 flashScrollIndicators];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(BFFPasscodeViewController *)self view];
  double v5 = [v4 passcodeInputView];

  [v5 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  [(BFFPasscodeViewController *)&v7 viewDidDisappear:a3];
  if (self->_showingSpinner)
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
    self->_showingSpinner = 0;
  }
  objc_super v4 = +[BFFPasscodeCreationManager sharedPasscodeManager];
  uint64_t v5 = [v4 passcodeState];

  if (v5 == 4)
  {
    [(BFFPasscodeViewController *)self clear];
  }
  else
  {
    objc_super v6 = +[BFFPasscodeCreationManager sharedPasscodeManager];
    [v6 reset];
  }
}

- (void)nextButtonPressed
{
  objc_super v3 = [(BFFPasscodeViewController *)self view];
  objc_super v4 = [v3 passcodeInputView];
  id v6 = [v4 passcode];

  uint64_t v5 = [(BFFPasscodeViewController *)self passcodeManager];
  [v5 transitionToNextPasscodeStateForInput:v6];
}

- (void)_updateNextButton
{
  objc_super v3 = [(BFFPasscodeViewController *)self view];
  id v5 = [v3 passcodeInputView];

  objc_super v4 = [v5 passcode];
  [(BFFPasscodeViewController *)self _updateNextButtonForPasscode:v4];
}

- (void)_updateNextButtonForPasscode:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    objc_super v4 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v5 = [v4 passcode:v9 meetsCurrentConstraintsOutError:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(BFFPasscodeViewController *)self navigationItem];
  objc_super v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];

  double v8 = [MEMORY[0x263F828A0] activeKeyboard];
  [v8 setReturnKeyEnabled:v5];
}

- (BOOL)_allowSkip
{
  objc_super v3 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
    char v6 = [v5 passcodeViewControllerAllowSkip:self];

    return v6;
  }
  else
  {
    return +[BFFPasscodeViewController allowSkip];
  }
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
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__BFFPasscodeViewController_passcodeInput_enteredPasscode___block_invoke;
  v10[3] = &unk_26454AAF0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], v10);
}

void __59__BFFPasscodeViewController_passcodeInput_enteredPasscode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passcodeManager];
  [v2 transitionToNextPasscodeStateForInput:*(void *)(a1 + 40)];
}

- (id)passcodeInputView
{
  objc_super v3 = [(BFFPasscodeViewController *)self passcodeManager];
  int v4 = [v3 isSimplePasscodeEntry];

  if (v4)
  {
    uint64_t v5 = [BFFSimplePasscodeInputView alloc];
    id v6 = [(BFFPasscodeViewController *)self passcodeManager];
    uint64_t v7 = [v6 simplePasscodeEntryLength];
    dispatch_time_t v8 = -[BFFSimplePasscodeInputView initWithFrame:numberOfEntryFields:](v5, "initWithFrame:numberOfEntryFields:", v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

    [(BFFSimplePasscodeInputView *)v8 setLimitCharactersToNumbers:0];
  }
  else
  {
    id v9 = [BFFComplexPasscodeInputView alloc];
    int v10 = [(BFFPasscodeViewController *)self passcodeManager];
    uint64_t v11 = [v10 isNumericPasscodeEntry];
    dispatch_time_t v8 = -[BFFComplexPasscodeInputView initWithFrame:numericOnly:](v9, "initWithFrame:numericOnly:", v11, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  return v8;
}

- (id)_passcodeInputViewForState:(unint64_t)a3
{
  uint64_t v5 = [(BFFPasscodeViewController *)self passcodeInputView];
  if (a3 == 3 || !a3)
  {
    id v6 = [(BFFPasscodeViewController *)self passcodeOptionAlertController];
    uint64_t v7 = [v6 actions];

    if ([v7 count] == 2)
    {
      BOOL v8 = [(BFFPasscodeViewController *)self _allowSkip];
      self->_footerButtonIsSkip = v8;
      if (v8)
      {
        id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v10 = v9;
        uint64_t v11 = @"DO_NOT_ADD_PASSCODE";
        goto LABEL_9;
      }
    }
    else
    {
      self->_footerButtonIsSkip = 0;
    }
    if ((unint64_t)[v7 count] < 2)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v10 = v9;
    uint64_t v11 = @"PASSCODE_OPTIONS";
LABEL_9:
    v12 = [v9 localizedStringForKey:v11 value:&stru_26D1D0C18 table:@"Localizable"];
    [v5 setFooterButtonText:v12];

    goto LABEL_10;
  }
LABEL_11:
  v13 = [v5 instructions];
  uint64_t v14 = [(BFFPasscodeViewController *)self instructionsForState:a3];
  [v13 setText:v14];

  return v5;
}

- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4
{
  id v7 = [(BFFPasscodeViewController *)self _passcodeInputViewForState:a3];
  id v6 = [(BFFPasscodeViewController *)self view];
  [v6 animateTransitionToPasscodeInput:v7 animation:a4];
}

- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  BOOL v8 = [(BFFPasscodeViewController *)self view];
  id v9 = [(BFFPasscodeViewController *)self titleForState:a5];
  [v8 setTitle:v9];

  if (!a5)
  {
    v13 = [(BFFPasscodeViewController *)self view];
    uint64_t v14 = [v13 passcodeInputView];
    [v14 setPasscode:&stru_26D1D0C18];

    if (a4 == 1) {
      goto LABEL_10;
    }
    uint64_t v11 = self;
    unint64_t v12 = 0;
    uint64_t v10 = 3;
    goto LABEL_9;
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (a5 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    uint64_t v11 = self;
    unint64_t v12 = a5;
LABEL_9:
    [(BFFPasscodeViewController *)v11 _animatedPasscodeViewTransitionToState:v12 animation:v10];
    goto LABEL_10;
  }
  if (a5 == 4)
  {
    v15 = [(BFFPasscodeViewController *)self passcodeManager];
    uint64_t v16 = [v15 passcode];
    [(BFFPasscodeViewController *)self _finishedWithPasscode:v16];
  }
  else if (a5 == 1)
  {
    [(BFFPasscodeViewController *)self _showWeakWarningAlert];
  }
LABEL_10:
  [(BFFPasscodeViewController *)self _updateNextButton];
}

- (void)passcodeManagerWillSetPasscode:(id)a3
{
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:self identifier:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
  self->_showingSpinner = 1;
  int v4 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
    [v6 passcodeViewControllerWillSetPasscode:self];
  }
}

- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  if (self->_showingSpinner)
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
    self->_showingSpinner = 0;
  }
  if (v6)
  {
    id v9 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
      unint64_t v12 = [v13 passcode];
      [v11 passcodeViewController:self didSetPasscode:v12];
    }
  }
}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  if (self->_footerButtonIsSkip) {
    [(BFFPasscodeViewController *)self _showSkipPasscodeAlert];
  }
  else {
    [(BFFPasscodeViewController *)self _showPasscodeOptionsSheet];
  }
}

- (void)clear
{
  objc_super v3 = [(BFFPasscodeViewController *)self view];
  [v3 transitionToPasscodeInput:0 delegate:0];

  int v4 = [(BFFPasscodeViewController *)self passcodeManager];
  [v4 setDelegate:0];

  [(BFFPasscodeViewController *)self setPasscodeManager:0];
}

- (void)_finishedWithPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
  [v5 passcodeViewController:self didFinishWithPasscodeCreation:v4];
}

- (id)titleForState:(unint64_t)a3
{
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CREATE_PASSCODE"];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_26D1D0C18 table:@"Localizable"];

  return v5;
}

- (id)instructionsForState:(unint64_t)a3
{
  if (a3 == 3)
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v7;
    id v8 = @"PASSCODES_FAILED_TO_MATCH";
LABEL_9:
    uint64_t v6 = [(__CFString *)v7 localizedStringForKey:v8 value:&stru_26D1D0C18 table:@"Localizable"];
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v7;
    id v8 = @"RE_ENTER_PASSCODE";
    goto LABEL_9;
  }
  if (a3)
  {
    id v5 = &stru_26D1D0C18;
  }
  else
  {
    id v4 = [(BFFPasscodeViewController *)self passcodeManager];
    id v5 = [v4 constraintInstructions];

    if (!v5 || ![(__CFString *)v5 length])
    {
      uint64_t v6 = [(BFFPasscodeViewController *)self _firstEntryInstructions];
LABEL_10:
      id v9 = (__CFString *)v6;

      id v5 = v9;
    }
  }
  return v5;
}

- (id)_firstEntryInstructions
{
  objc_super v3 = [(BFFPasscodeViewController *)self passcodeCreationDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ([(BFFPasscodeViewController *)self passcodeCreationDelegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 passcodeViewControllerCustomFirstEntryInstructions:self],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PASSCODE_DESCRIPTION"];
    uint64_t v6 = [v7 localizedStringForKey:v8 value:&stru_26D1D0C18 table:@"Localizable"];
  }
  return v6;
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BFFPasscodeViewController *)self passcodeManager];
  int v6 = [v5 isSimplePasscodeEntry];

  if (v6)
  {
    id v11 = [(BFFPasscodeViewController *)self navigationItem];
    [v11 setRightBarButtonItem:0 animated:v3];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F824A8]);
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"NEXT" value:&stru_26D1D0C18 table:@"Localizable"];
    id v11 = (id)[v7 initWithTitle:v9 style:2 target:self action:sel_nextButtonPressed];

    char v10 = [(BFFPasscodeViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v11 animated:v3];

    [(BFFPasscodeViewController *)self _updateNextButton];
  }
}

- (void)_showWeakWarningAlert
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"WEAK_PASSCODE_DETAILS"];
  v17 = [v3 localizedStringForKey:v4 value:&stru_26D1D0C18 table:@"Localizable"];

  id v5 = (void *)MEMORY[0x263F82418];
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"WEAK_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
  id v8 = [v5 alertControllerWithTitle:v7 message:v17 preferredStyle:1];

  id v9 = (void *)MEMORY[0x263F82400];
  char v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CHANGE_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke;
  v19[3] = &unk_26454ABB8;
  v19[4] = self;
  unint64_t v12 = [v9 actionWithTitle:v11 style:1 handler:v19];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"USE_WEAK_PASSCODE_ANYWAY" value:&stru_26D1D0C18 table:@"Localizable"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke_2;
  v18[3] = &unk_26454ABB8;
  v18[4] = self;
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v18];
  [v8 addAction:v16];

  [(BFFPasscodeViewController *)self presentViewController:v8 animated:1 completion:0];
}

void __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) passcodeManager];
  [v1 acceptWeakPasscode:0];
}

void __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke_2(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "User accepted weak passcode", v4, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) passcodeManager];
  [v3 acceptWeakPasscode:1];
}

- (void)_showSkipPasscodeAlert
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SKIP_PASSCODE_DESCRIPTION"];
  char v4 = [v2 localizedStringForKey:v3 value:&stru_26D1D0C18 table:@"Localizable"];

  id v5 = (void *)MEMORY[0x263F82418];
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SKIP_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
  id v8 = [v5 alertControllerWithTitle:v7 message:v4 preferredStyle:1];

  id v9 = (void *)MEMORY[0x263F82400];
  char v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"SKIP_OPTION_CREATE_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
  unint64_t v12 = [v9 actionWithTitle:v11 style:1 handler:0];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"SKIP_OPTION_DONT_USE_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__BFFPasscodeViewController__showSkipPasscodeAlert__block_invoke;
  v18[3] = &unk_26454ABB8;
  v18[4] = self;
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v18];
  [v8 addAction:v16];

  [(BFFPasscodeViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __51__BFFPasscodeViewController__showSkipPasscodeAlert__block_invoke(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "User opted out of passcode", v4, 2u);
  }

  return [*(id *)(a1 + 32) _finishedWithPasscode:0];
}

- (void)_commitPasscodeEntryTypeChange
{
  [(BFFPasscodeViewController *)self configurePasscodeTypeUsingAnimations:1];
  id v3 = [(BFFPasscodeViewController *)self passcodeManager];
  [v3 setPasscodeState:0];
}

- (id)passcodeOptionAlertController
{
  int v45 = 0;
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  unsigned int v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v45];

  id v5 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  int v6 = [(BFFPasscodeViewController *)self passcodeManager];
  int v7 = [v6 isNumericPasscodeEntry];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F82400];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = [v9 localizedStringForKey:@"CUSTOM_ALPHANUMERIC_CODE" value:&stru_26D1D0C18 table:@"Localizable"];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke;
    v44[3] = &unk_26454ABB8;
    v44[4] = self;
    id v11 = [v8 actionWithTitle:v10 style:0 handler:v44];
    [v5 addAction:v11];
  }
  if (v4 <= 1)
  {
    unint64_t v12 = [(BFFPasscodeViewController *)self passcodeManager];
    if ([v12 isNumericPasscodeEntry])
    {
      id v13 = [(BFFPasscodeViewController *)self passcodeManager];
      uint64_t v14 = [v13 simplePasscodeEntryLength];

      if (v14 < 1)
      {
        if (v4) {
          goto LABEL_15;
        }
LABEL_10:
        v19 = [(BFFPasscodeViewController *)self passcodeManager];
        uint64_t v20 = [v19 simplePasscodeEntryLength];

        if (v20 != 6)
        {
          int v21 = (void *)MEMORY[0x263F82400];
          v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v23 = [v22 localizedStringForKey:@"6_DIGIT_CODE" value:&stru_26D1D0C18 table:@"Localizable"];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_3;
          v42[3] = &unk_26454ABB8;
          v42[4] = self;
          v24 = [v21 actionWithTitle:v23 style:0 handler:v42];
          [v5 addAction:v24];
        }
        if (!v45)
        {
          v25 = [(BFFPasscodeViewController *)self passcodeManager];
          uint64_t v26 = [v25 simplePasscodeEntryLength];

          if (v26 != 4)
          {
            v27 = (void *)MEMORY[0x263F82400];
            v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v29 = [v28 localizedStringForKey:@"4_DIGIT_CODE" value:&stru_26D1D0C18 table:@"Localizable"];
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_4;
            v41[3] = &unk_26454ABB8;
            v41[4] = self;
            v30 = [v27 actionWithTitle:v29 style:0 handler:v41];
            [v5 addAction:v30];
          }
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    v15 = (void *)MEMORY[0x263F82400];
    uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CUSTOM_NUMERIC_CODE" value:&stru_26D1D0C18 table:@"Localizable"];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_2;
    v43[3] = &unk_26454ABB8;
    v43[4] = self;
    v18 = [v15 actionWithTitle:v17 style:0 handler:v43];
    [v5 addAction:v18];

    if (v4) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
LABEL_15:
  if ([(BFFPasscodeViewController *)self _allowSkip])
  {
    v31 = (void *)MEMORY[0x263F82400];
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"DO_NOT_ADD_PASSCODE" value:&stru_26D1D0C18 table:@"Localizable"];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_5;
    v40[3] = &unk_26454ABB8;
    v40[4] = self;
    v34 = [v31 actionWithTitle:v33 style:0 handler:v40];
    [v5 addAction:v34];
  }
  v35 = (void *)MEMORY[0x263F82400];
  v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"CANCEL" value:&stru_26D1D0C18 table:@"Localizable"];
  v38 = [v35 actionWithTitle:v37 style:1 handler:0];
  [v5 addAction:v38];

  return v5;
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passcodeManager];
  [v2 setNumericPasscodeEntry:0];

  id v3 = [*(id *)(a1 + 32) passcodeManager];
  [v3 setSimplePasscodeEntryLength:0];

  unsigned int v4 = *(void **)(a1 + 32);
  return [v4 _commitPasscodeEntryTypeChange];
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passcodeManager];
  [v2 setNumericPasscodeEntry:1];

  id v3 = [*(id *)(a1 + 32) passcodeManager];
  [v3 setSimplePasscodeEntryLength:0];

  unsigned int v4 = *(void **)(a1 + 32);
  return [v4 _commitPasscodeEntryTypeChange];
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passcodeManager];
  [v2 setNumericPasscodeEntry:1];

  id v3 = [*(id *)(a1 + 32) passcodeManager];
  [v3 setSimplePasscodeEntryLength:6];

  unsigned int v4 = *(void **)(a1 + 32);
  return [v4 _commitPasscodeEntryTypeChange];
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passcodeManager];
  [v2 setNumericPasscodeEntry:1];

  id v3 = [*(id *)(a1 + 32) passcodeManager];
  [v3 setSimplePasscodeEntryLength:4];

  unsigned int v4 = *(void **)(a1 + 32);
  return [v4 _commitPasscodeEntryTypeChange];
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSkipPasscodeAlert];
}

- (void)_showPasscodeOptionsSheet
{
  id v7 = [(BFFPasscodeViewController *)self passcodeOptionAlertController];
  if (BFFIsiPad())
  {
    [v7 setModalPresentationStyle:7];
    id v3 = [v7 popoverPresentationController];
    unsigned int v4 = [(BFFPasscodeViewController *)self view];
    id v5 = [v4 passcodeInputView];
    int v6 = [v5 footerButton];

    [v3 setPermittedArrowDirections:2];
    [v3 setSourceView:v6];
    [v6 bounds];
    objc_msgSend(v3, "setSourceRect:");
  }
  [(BFFPasscodeViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (BFFPasscodeViewControllerDelegate)passcodeCreationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeCreationDelegate);
  return (BFFPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setPasscodeCreationDelegate:(id)a3
{
}

- (BFFPasscodeCreationManager)passcodeManager
{
  return self->_passcodeManager;
}

- (void)setPasscodeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeManager, 0);
  objc_destroyWeak((id *)&self->_passcodeCreationDelegate);
}

@end