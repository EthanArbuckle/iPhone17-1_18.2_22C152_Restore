@interface OBPasscodeViewController
- (BOOL)requiresCompletion;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (OBPasscodeInputView)passcodeInputView;
- (OBPasscodeViewControllerDelegate)delegate;
- (double)_verticalPaddingForInputView;
- (void)_completionTapped:(id)a3;
- (void)_updateCompletionButtonEnabledStateForPasscode:(id)a3;
- (void)clearPasscodeEntry;
- (void)configureForPasscodeEntry:(unint64_t)a3 length:(int64_t)a4;
- (void)loadView;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscodeInputView:(id)a3;
- (void)setRequiresCompletion:(BOOL)a3;
- (void)shakePasscodeEntry;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation OBPasscodeViewController

- (void)setPasscodeInputView:(id)a3
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(OBPasscodeViewController *)self passcodeInputView];
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  [v6 setDelegate:0];
  [v5 setDelegate:self];
  v7 = [(OBWelcomeController *)self contentView];
  [v7 addSubview:v5];

  v8 = [(OBPasscodeViewController *)self presentingViewController];

  if (v8)
  {
    if ([v6 isFirstResponder])
    {
      v9 = (void *)MEMORY[0x1E4FB1EB0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __49__OBPasscodeViewController_setPasscodeInputView___block_invoke;
      v42[3] = &unk_1E58AE998;
      id v43 = v5;
      [v9 performWithoutAnimation:v42];
    }
    else
    {
      [v5 becomeFirstResponder];
    }
  }
  [v6 removeFromSuperview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v5 leadingAnchor];
    v11 = [(OBWelcomeController *)self contentView];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [v5 trailingAnchor];
    v15 = [(OBWelcomeController *)self contentView];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];
  }
  v41 = v6;
  [(OBPasscodeViewController *)self _verticalPaddingForInputView];
  double v19 = v18;
  v20 = [v5 topAnchor];
  v21 = [(OBWelcomeController *)self contentView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:v19];

  v24 = [(OBWelcomeController *)self contentView];
  v25 = [v24 bottomAnchor];
  v26 = [v5 bottomAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26 constant:v19];

  v28 = [(OBPasscodeViewController *)self contentViewTopConstraint];

  if (v28)
  {
    v29 = [(OBPasscodeViewController *)self contentViewTopConstraint];
    [v29 constant];
    objc_msgSend(v23, "setConstant:");
  }
  [(OBPasscodeViewController *)self setContentViewTopConstraint:v23];
  [(OBPasscodeViewController *)self setContentViewBottomConstraint:v27];
  v30 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [v5 centerXAnchor];
  v32 = [(OBWelcomeController *)self contentView];
  v33 = [v32 centerXAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v44[0] = v34;
  [(OBPasscodeViewController *)self contentViewTopConstraint];
  v35 = v40 = v23;
  v44[1] = v35;
  v36 = [(OBPasscodeViewController *)self contentViewBottomConstraint];
  v44[2] = v36;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v37 = v5;
  v39 = v38 = (void *)v27;
  [v30 activateConstraints:v39];
}

uint64_t __49__OBPasscodeViewController_setPasscodeInputView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

- (void)configureForPasscodeEntry:(unint64_t)a3 length:(int64_t)a4
{
  if (a3 == 1) {
    goto LABEL_5;
  }
  if (!a3)
  {
    if (a4 >= 1)
    {
      v7 = [OBSimplePasscodeInputView alloc];
      v16 = -[OBSimplePasscodeInputView initWithFrame:numberOfEntryFields:](v7, "initWithFrame:numberOfEntryFields:", a4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(OBSimplePasscodeInputView *)v16 setLimitCharactersToNumbers:0];
LABEL_6:
      v9 = v16;
      goto LABEL_8;
    }
LABEL_5:
    v8 = [OBComplexPasscodeInputView alloc];
    v16 = -[OBComplexPasscodeInputView initWithFrame:numericOnly:](v8, "initWithFrame:numericOnly:", a3 == 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(OBPasscodeViewController *)self setRequiresCompletion:1];
    goto LABEL_6;
  }
  v9 = 0;
LABEL_8:
  v17 = v9;
  [(OBSimplePasscodeInputView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBPasscodeViewController *)self setPasscodeInputView:v17];
  if ([(OBPasscodeViewController *)self requiresCompletion])
  {
    v10 = [(OBPasscodeViewController *)self delegate];
    v11 = [v10 completionButtonTitleForPasscodeViewController:self];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v11 style:2 target:self action:sel__completionTapped_];
    v13 = [(OBBaseWelcomeController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];

    v14 = [(OBPasscodeViewController *)self passcodeInputView];
    v15 = [v14 passcode];
    [(OBPasscodeViewController *)self _updateCompletionButtonEnabledStateForPasscode:v15];
  }
  else
  {
    v11 = [(OBBaseWelcomeController *)self navigationItem];
    [v11 setRightBarButtonItem:0];
  }
}

- (void)clearPasscodeEntry
{
  id v2 = [(OBPasscodeViewController *)self passcodeInputView];
  [v2 setPasscode:&stru_1EEC28768];
}

- (void)shakePasscodeEntry
{
  id v2 = [(OBPasscodeViewController *)self passcodeInputView];
  [v2 shake];
}

- (void)loadView
{
  [(OBWelcomeController *)self setIncludePaddingAboveContentView:0];
  v3.receiver = self;
  v3.super_class = (Class)OBPasscodeViewController;
  [(OBWelcomeController *)&v3 loadView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBPasscodeViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(OBWelcomeController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
  [(OBWelcomeController *)self setShouldAdjustButtonTrayForKeyboard:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBPasscodeViewController;
  [(OBWelcomeController *)&v8 viewWillAppear:a3];
  v4 = [(OBPasscodeViewController *)self presentedViewController];

  if (!v4)
  {
    id v5 = [(OBPasscodeViewController *)self passcodeInputView];
    [v5 becomeFirstResponder];
  }
  v6 = [(OBPasscodeViewController *)self passcodeInputView];
  v7 = [v6 passcode];
  [(OBPasscodeViewController *)self _updateCompletionButtonEnabledStateForPasscode:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeViewController;
  [(OBWelcomeController *)&v5 viewWillDisappear:a3];
  v4 = [(OBPasscodeViewController *)self passcodeInputView];
  [v4 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeViewController;
  [(OBWelcomeController *)&v5 viewDidDisappear:a3];
  v4 = [(OBPasscodeViewController *)self passcodeInputView];
  [v4 resignFirstResponder];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OBPasscodeViewController;
  id v7 = a4;
  -[OBWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__OBPasscodeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E58AEC58;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __79__OBPasscodeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _verticalPaddingForInputView];
  double v3 = v2;
  v4 = [*(id *)(a1 + 32) contentViewTopConstraint];
  [v4 setConstant:v3];

  id v5 = [*(id *)(a1 + 32) contentViewBottomConstraint];
  [v5 setConstant:v3];
}

- (void)_completionTapped:(id)a3
{
  id v6 = [(OBPasscodeViewController *)self delegate];
  v4 = [(OBPasscodeViewController *)self passcodeInputView];
  id v5 = [v4 passcode];
  [v6 passcodeViewController:self didEnterPasscode:v5];
}

- (void)_updateCompletionButtonEnabledStateForPasscode:(id)a3
{
  id v9 = a3;
  if ([(OBPasscodeViewController *)self requiresCompletion])
  {
    v4 = [(OBPasscodeViewController *)self delegate];
    uint64_t v5 = [v4 passcodeViewController:self shouldEnableCompletionButtonForPasscode:v9];

    id v6 = [(OBBaseWelcomeController *)self navigationItem];
    id v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:v5];

    objc_super v8 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v8 setReturnKeyEnabled:v5];
  }
}

- (double)_verticalPaddingForInputView
{
  double v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 type];

  double result = 20.0;
  if (v3 != 2)
  {
    uint64_t v5 = +[OBDevice currentDevice];
    uint64_t v6 = [v5 templateType];

    if ((unint64_t)(v6 - 5) > 5) {
      return 37.0;
    }
    else {
      return dbl_19BF4D228[v6 - 5];
    }
  }
  return result;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v5 = a4;
  id v6 = [(OBPasscodeViewController *)self delegate];
  [v6 passcodeViewController:self didEnterPasscode:v5];
}

- (OBPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OBPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBPasscodeInputView)passcodeInputView
{
  return self->_passcodeInputView;
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (BOOL)requiresCompletion
{
  return self->_requiresCompletion;
}

- (void)setRequiresCompletion:(BOOL)a3
{
  self->_requiresCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end