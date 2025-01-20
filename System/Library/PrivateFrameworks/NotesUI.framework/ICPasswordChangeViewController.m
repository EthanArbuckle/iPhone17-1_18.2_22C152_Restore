@interface ICPasswordChangeViewController
- (BOOL)didAttemptToSubmitWithoutHint;
- (BOOL)didAuthenticateWithBiometrics;
- (BOOL)isInSettings;
- (BOOL)isSettingInitialPassword;
- (BOOL)isSetupForChangePassword;
- (BOOL)passwordAndVerifyTextFieldsMatch;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usingLargerAXSizes;
- (BOOL)validateInput;
- (ICAccountPassphraseManager)passphraseManager;
- (ICPasswordChangeViewController)initWithCompletionHandler:(id)a3;
- (ICPasswordUtilities)passwordUtilities;
- (ICScrollViewKeyboardResizer)scrollViewResizer;
- (NSArray)alternateConstraintsForAXLargerTextSizes;
- (NSArray)defaultConstraints;
- (NSArray)orderedTextFields;
- (NSArray)textBackgroundViews;
- (NSLayoutConstraint)oldPasswordHeightConstraint;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UILabel)headerLabel;
- (UILabel)hintLabel;
- (UILabel)oldPasswordLabel;
- (UILabel)passwordLabel;
- (UILabel)verifyLabel;
- (UILabel)warningLabel;
- (UIScrollView)scrollView;
- (UITextField)firstResponderTextField;
- (UITextField)hintTextField;
- (UITextField)oldPasswordTextField;
- (UITextField)passwordTextField;
- (UITextField)verifyTextField;
- (UIView)headerBackground;
- (id)completionHandler;
- (id)disclaimerAttributedString;
- (int64_t)incorrectPasswordAttempts;
- (void)cancelButtonPressed:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)dismissKeyboardIfNeeded;
- (void)dismissWithResult:(unint64_t)a3;
- (void)doneButtonPressed:(id)a3;
- (void)registerForTraitChanges;
- (void)resetTextFields;
- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setDidAttemptToSubmitWithoutHint:(BOOL)a3;
- (void)setDidAuthenticateWithBiometrics:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setHeaderBackground:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHintLabel:(id)a3;
- (void)setHintTextField:(id)a3;
- (void)setIncorrectPasswordAttempts:(int64_t)a3;
- (void)setIsInSettings:(BOOL)a3;
- (void)setIsSettingInitialPassword:(BOOL)a3;
- (void)setIsSetupForChangePassword:(BOOL)a3;
- (void)setOldPasswordHeightConstraint:(id)a3;
- (void)setOldPasswordLabel:(id)a3;
- (void)setOldPasswordTextField:(id)a3;
- (void)setOrderedTextFields:(id)a3;
- (void)setPassphraseManager:(id)a3;
- (void)setPasswordLabel:(id)a3;
- (void)setPasswordTextField:(id)a3;
- (void)setPasswordUtilities:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewResizer:(id)a3;
- (void)setTextBackgroundViews:(id)a3;
- (void)setUpForAddingPasswordWithAccount:(id)a3;
- (void)setUpForChangePasswordWithAccount:(id)a3 didAuthenticateWithBiometrics:(BOOL)a4;
- (void)setUpNavigationBar;
- (void)setUsingLargerAXSizes:(BOOL)a3;
- (void)setVerifyLabel:(id)a3;
- (void)setVerifyTextField:(id)a3;
- (void)setWarningLabel:(id)a3;
- (void)setupAccessibility;
- (void)updateFonts;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICPasswordChangeViewController

- (ICPasswordChangeViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)ICPasswordChangeViewController;
  v6 = [(ICPasswordChangeViewController *)&v9 initWithNibName:0 bundle:v5];

  if (v6)
  {
    v7 = (void *)[v4 copy];
    [(ICPasswordChangeViewController *)v6 setCompletionHandler:v7];

    [(ICPasswordChangeViewController *)v6 registerForTraitChanges];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(ICPasswordChangeViewController *)self scrollViewResizer];
  [v3 stopAutoResizing];

  v4.receiver = self;
  v4.super_class = (Class)ICPasswordChangeViewController;
  [(ICPasswordChangeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v56[4] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)ICPasswordChangeViewController;
  [(ICPasswordChangeViewController *)&v53 viewDidLoad];
  [(ICPasswordChangeViewController *)self resetTextFields];
  [(ICPasswordChangeViewController *)self setUpNavigationBar];
  v3 = [[ICScrollViewKeyboardResizer alloc] initWithDelegate:self];
  [(ICPasswordChangeViewController *)self setScrollViewResizer:v3];

  objc_super v4 = [(ICPasswordChangeViewController *)self scrollView];
  [v4 setContentInsetAdjustmentBehavior:0];

  v5 = [MEMORY[0x1E4FB1618] ICGroupedBackgroundColor];
  v6 = [(ICPasswordChangeViewController *)self scrollView];
  [v6 setBackgroundColor:v5];

  v7 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  v56[0] = v7;
  v8 = [(ICPasswordChangeViewController *)self passwordTextField];
  v56[1] = v8;
  objc_super v9 = [(ICPasswordChangeViewController *)self verifyTextField];
  v56[2] = v9;
  v10 = [(ICPasswordChangeViewController *)self hintTextField];
  v56[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
  [(ICPasswordChangeViewController *)self setOrderedTextFields:v11];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v12 = [(ICPasswordChangeViewController *)self orderedTextFields];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * v16++) setDelegate:self];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v14);
  }

  [(ICPasswordChangeViewController *)self setUsingLargerAXSizes:ICAccessibilityAccessibilityLargerTextSizesEnabled()];
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  v18 = [(ICPasswordChangeViewController *)self passwordLabel];
  [v18 setTextColor:v17];

  v19 = [MEMORY[0x1E4FB1618] labelColor];
  v20 = [(ICPasswordChangeViewController *)self oldPasswordLabel];
  [v20 setTextColor:v19];

  v21 = [MEMORY[0x1E4FB1618] labelColor];
  v22 = [(ICPasswordChangeViewController *)self verifyLabel];
  [v22 setTextColor:v21];

  v23 = [MEMORY[0x1E4FB1618] labelColor];
  v24 = [(ICPasswordChangeViewController *)self hintLabel];
  [v24 setTextColor:v23];

  v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v26 = [(ICPasswordChangeViewController *)self headerLabel];
  [v26 setTextColor:v25];

  v27 = [MEMORY[0x1E4FB1618] labelColor];
  v28 = [(ICPasswordChangeViewController *)self passwordTextField];
  [v28 setTextColor:v27];

  v29 = [MEMORY[0x1E4FB1618] labelColor];
  v30 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v30 setTextColor:v29];

  v31 = [MEMORY[0x1E4FB1618] labelColor];
  v32 = [(ICPasswordChangeViewController *)self verifyTextField];
  [v32 setTextColor:v31];

  v33 = [MEMORY[0x1E4FB1618] labelColor];
  v34 = [(ICPasswordChangeViewController *)self hintTextField];
  [v34 setTextColor:v33];

  v35 = [MEMORY[0x1E4FB1618] redColor];
  v36 = [(ICPasswordChangeViewController *)self warningLabel];
  [v36 setTextColor:v35];

  v37 = [(ICPasswordChangeViewController *)self warningLabel];
  [v37 setHidden:1];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v38 = [(ICPasswordChangeViewController *)self textBackgroundViews];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v45 + 1) + 8 * v42);
        if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision"))
        {
          [v43 setBackgroundColor:0];
        }
        else
        {
          v44 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
          [v43 setBackgroundColor:v44];
        }
        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v40);
  }
}

- (void)setUpNavigationBar
{
  v3 = [(ICPasswordChangeViewController *)self navigationController];
  [v3 setModalPresentationStyle:2];

  objc_super v4 = [(ICPasswordChangeViewController *)self navigationController];
  [v4 setNavigationBarHidden:0];

  v5 = [(ICPasswordChangeViewController *)self cancelButton];
  v6 = [(ICPasswordChangeViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v8 = [(ICPasswordChangeViewController *)self doneButton];
  v7 = [(ICPasswordChangeViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICPasswordChangeViewController;
  [(ICPasswordChangeViewController *)&v11 viewWillAppear:a3];
  if ([(ICPasswordChangeViewController *)self isSetupForChangePassword])
  {
    if ([(ICPasswordChangeViewController *)self didAuthenticateWithBiometrics]) {
      float v4 = 999.0;
    }
    else {
      float v4 = 1.0;
    }
  }
  else
  {
    float v4 = 999.0;
  }
  v5 = [(ICPasswordChangeViewController *)self oldPasswordHeightConstraint];
  *(float *)&double v6 = v4;
  [v5 setPriority:v6];

  if ([(ICPasswordChangeViewController *)self isSetupForChangePassword]
    && ![(ICPasswordChangeViewController *)self didAuthenticateWithBiometrics])
  {
    uint64_t v7 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  }
  else
  {
    uint64_t v7 = [(ICPasswordChangeViewController *)self passwordTextField];
  }
  id v8 = (void *)v7;
  if (!UIAccessibilityIsVoiceOverRunning()) {
    [v8 becomeFirstResponder];
  }
  [(ICPasswordChangeViewController *)self updateFonts];
  objc_super v9 = [(ICPasswordChangeViewController *)self scrollViewResizer];
  [v9 startAutoResizing];

  v10 = [(ICPasswordChangeViewController *)self view];
  [v10 layoutIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICPasswordChangeViewController;
  [(ICPasswordChangeViewController *)&v5 viewWillDisappear:a3];
  float v4 = [(ICPasswordChangeViewController *)self scrollViewResizer];
  [v4 stopAutoResizing];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICPasswordChangeViewController;
  [(ICPasswordChangeViewController *)&v7 viewDidAppear:a3];
  float v4 = [(ICPasswordChangeViewController *)self view];
  objc_super v5 = [v4 window];
  double v6 = [(ICPasswordChangeViewController *)self passphraseManager];
  [v6 setWindow:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(ICPasswordChangeViewController *)self firstResponderTextField];
  v12.receiver = self;
  v12.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__ICPasswordChangeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E5FDDD68;
  id v11 = v8;
  id v9 = v8;
  [v7 animateAlongsideTransition:&__block_literal_global_82 completion:v10];
}

void *__85__ICPasswordChangeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result becomeFirstResponder];
  }
  return result;
}

- (UITextField)firstResponderTextField
{
  v2 = [(ICPasswordChangeViewController *)self orderedTextFields];
  v3 = objc_msgSend(v2, "ic_objectPassingTest:", &__block_literal_global_26_0);

  return (UITextField *)v3;
}

uint64_t __57__ICPasswordChangeViewController_firstResponderTextField__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFirstResponder];
}

- (BOOL)validateInput
{
  if ([(ICPasswordChangeViewController *)self isSetupForChangePassword])
  {
    if (![(ICPasswordChangeViewController *)self didAuthenticateWithBiometrics])
    {
      v3 = [(ICPasswordChangeViewController *)self passphraseManager];
      float v4 = [v3 account];
      objc_super v5 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
      double v6 = [v5 text];
      char v7 = [v4 isPassphraseCorrect:v6];

      if ((v7 & 1) == 0)
      {
        BOOL v19 = [(ICPasswordChangeViewController *)self incorrectPasswordAttempts] >= 2;
        v20 = [(ICPasswordChangeViewController *)self passphraseManager];
        v21 = [v20 account];
        id v11 = +[ICAuthenticationAlert incorrectCustomPasswordInfoAlertWithObject:v21 showHint:v19];

        v22 = [(ICPasswordChangeViewController *)self view];
        v23 = [v22 window];
        [v11 presentInWindow:v23 completionHandler:0];

        [(ICPasswordChangeViewController *)self setIncorrectPasswordAttempts:[(ICPasswordChangeViewController *)self incorrectPasswordAttempts] + 1];
        goto LABEL_11;
      }
    }
  }
  id v8 = [(ICPasswordChangeViewController *)self passwordTextField];
  id v9 = [v8 text];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    uint64_t v14 = +[ICAuthenticationAlert missingCustomPasswordInfoAlert];
LABEL_10:
    id v11 = (void *)v14;
    uint64_t v15 = [(ICPasswordChangeViewController *)self view];
    uint64_t v16 = [v15 window];
    [v11 presentInWindow:v16 completionHandler:0];

LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  if (![(ICPasswordChangeViewController *)self passwordAndVerifyTextFieldsMatch])
  {
    uint64_t v14 = +[ICAuthenticationAlert mismatchedCustomPasswordInfoAlert];
    goto LABEL_10;
  }
  id v11 = [(ICPasswordChangeViewController *)self hintTextField];
  objc_super v12 = [v11 text];
  if ([v12 length])
  {

    BOOL v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v24 = [(ICPasswordChangeViewController *)self didAttemptToSubmitWithoutHint];

  if (!v24)
  {
    v25 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"A hint is strongly recommended." value:@"A hint is strongly recommended." table:0 allowSiri:1];
    v26 = [(ICPasswordChangeViewController *)self warningLabel];
    [v26 setText:v25];

    v27 = [(ICPasswordChangeViewController *)self warningLabel];
    [v27 setHidden:0];

    [(ICPasswordChangeViewController *)self setDidAttemptToSubmitWithoutHint:1];
    return 0;
  }
  BOOL v13 = 1;
LABEL_13:
  v17 = [(ICPasswordChangeViewController *)self warningLabel];
  [v17 setHidden:1];

  return v13;
}

- (void)cancelButtonPressed:(id)a3
{
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = a3;
  if ([(ICPasswordChangeViewController *)self validateInput])
  {
    [(ICPasswordChangeViewController *)self dismissKeyboardIfNeeded];
    if ([(ICPasswordChangeViewController *)self didAuthenticateWithBiometrics])
    {
      objc_super v5 = 0;
    }
    else
    {
      double v6 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
      objc_super v5 = [v6 text];
    }
    char v7 = [(ICPasswordChangeViewController *)self passwordTextField];
    uint64_t v8 = [v7 text];
    id v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    else {
      uint64_t v10 = &stru_1F0973378;
    }
    id v11 = v10;

    objc_super v12 = [(ICPasswordChangeViewController *)self hintTextField];
    uint64_t v13 = [v12 text];
    uint64_t v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    else {
      uint64_t v15 = &stru_1F0973378;
    }
    uint64_t v16 = v15;

    if ([(ICPasswordChangeViewController *)self isSetupForChangePassword])
    {
      objc_initWeak(&location, self);
      v17 = [(ICPasswordChangeViewController *)self passphraseManager];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __52__ICPasswordChangeViewController_doneButtonPressed___block_invoke;
      v23[3] = &unk_1E5FDDFF8;
      objc_copyWeak(&v24, &location);
      [v17 changePassphrase:v5 toPassphrase:v11 hint:v16 completion:v23];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = [(ICPasswordChangeViewController *)self passphraseManager];
      int v19 = [v18 setPassphrase:v11 hint:v16];

      if (v19)
      {
        [(ICPasswordChangeViewController *)self dismissWithResult:2];
      }
      else
      {
        v20 = +[ICAuthenticationAlert cannotSetCustomPasswordInfoAlert];
        v21 = [(ICPasswordChangeViewController *)self view];
        v22 = [v21 window];
        [v20 presentInWindow:v22 completionHandler:0];
      }
    }
  }
}

void __52__ICPasswordChangeViewController_doneButtonPressed___block_invoke(uint64_t a1, int a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (a2)
  {
    [WeakRetained dismissWithResult:2];
  }
  else
  {

    if (!v8) {
      return;
    }
    id v8 = +[ICAuthenticationAlert cannotSetCustomPasswordInfoAlert];
    id v5 = objc_loadWeakRetained(v3);
    double v6 = [v5 view];
    char v7 = [v6 window];
    [v8 presentInWindow:v7 completionHandler:0];
  }
}

- (void)dismissWithResult:(unint64_t)a3
{
  [(ICPasswordChangeViewController *)self dismissKeyboardIfNeeded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICPasswordChangeViewController_dismissWithResult___block_invoke;
  v5[3] = &unk_1E5FD9B40;
  v5[4] = self;
  v5[5] = a3;
  [(ICPasswordChangeViewController *)self dismissViewControllerAnimated:1 completion:v5];
}

void __52__ICPasswordChangeViewController_dismissWithResult___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (BOOL)passwordAndVerifyTextFieldsMatch
{
  v3 = [(ICPasswordChangeViewController *)self passwordTextField];
  id v4 = [v3 text];
  id v5 = [v4 precomposedStringWithCanonicalMapping];
  double v6 = [(ICPasswordChangeViewController *)self verifyTextField];
  char v7 = [v6 text];
  id v8 = [v7 precomposedStringWithCanonicalMapping];
  char v9 = [v5 isEqualToString:v8];

  return v9;
}

- (void)setUpForAddingPasswordWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [[ICAccountPassphraseManager alloc] initWithAccount:v4];
  [(ICPasswordChangeViewController *)self setPassphraseManager:v5];

  [(ICPasswordChangeViewController *)self resetTextFields];
  [(ICPasswordChangeViewController *)self setUpNavigationBar];
  double v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Set Password" value:@"Set Password" table:0 allowSiri:1];
  [(ICPasswordChangeViewController *)self setTitle:v6];

  [(ICPasswordChangeViewController *)self setModalInPresentation:1];
  char v7 = (void *)MEMORY[0x1E4F83278];
  id v8 = [MEMORY[0x1E4F83428] sharedContext];
  char v9 = [v8 managedObjectContext];
  uint64_t v10 = [v7 allActiveAccountsInContext:v9];
  unint64_t v11 = [v10 count];

  objc_super v12 = [v4 accountName];

  objc_msgSend(v12, "ic_trimmedString");
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 >= 2 && [v25 length])
  {
    uint64_t v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Create a password for all your locked notes in your “%@” account." value:@"Create a password for all your locked notes in your “%@” account." table:0 allowSiri:1];
    uint64_t v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v25);
    uint64_t v16 = [(ICPasswordChangeViewController *)self headerLabel];
    [v16 setText:v15];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Create a password for all your locked notes." value:@"Create a password for all your locked notes." table:0 allowSiri:1];
    uint64_t v15 = [(ICPasswordChangeViewController *)self headerLabel];
    [v15 setText:v14];
  }

  v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Password" value:@"Password" table:0 allowSiri:1];
  v18 = [(ICPasswordChangeViewController *)self passwordLabel];
  [v18 setText:v17];

  int v19 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Verify" value:@"Verify" table:0 allowSiri:1];
  v20 = [(ICPasswordChangeViewController *)self verifyLabel];
  [v20 setText:v19];

  v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Hint" value:@"Hint" table:0 allowSiri:1];
  v22 = [(ICPasswordChangeViewController *)self hintLabel];
  [v22 setText:v21];

  v23 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Done" value:@"Done" table:0 allowSiri:1];
  id v24 = [(ICPasswordChangeViewController *)self doneButton];
  [v24 setTitle:v23];

  [(ICPasswordChangeViewController *)self setIsSetupForChangePassword:0];
  [(ICPasswordChangeViewController *)self setupAccessibility];
}

- (void)setUpForChangePasswordWithAccount:(id)a3 didAuthenticateWithBiometrics:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [[ICAccountPassphraseManager alloc] initWithAccount:v6];

  [(ICPasswordChangeViewController *)self setPassphraseManager:v7];
  [(ICPasswordChangeViewController *)self resetTextFields];
  [(ICPasswordChangeViewController *)self setUpNavigationBar];
  id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Change Password" value:@"Change Password" table:0 allowSiri:1];
  [(ICPasswordChangeViewController *)self setTitle:v8];

  char v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Old Password" value:@"Old Password" table:0 allowSiri:1];
  uint64_t v10 = [(ICPasswordChangeViewController *)self oldPasswordLabel];
  [v10 setText:v9];

  unint64_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Password" value:@"New Password" table:0 allowSiri:1];
  objc_super v12 = [(ICPasswordChangeViewController *)self passwordLabel];
  [v12 setText:v11];

  uint64_t v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Verify" value:@"Verify" table:0 allowSiri:1];
  uint64_t v14 = [(ICPasswordChangeViewController *)self verifyLabel];
  [v14 setText:v13];

  uint64_t v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Hint" value:@"Hint" table:0 allowSiri:1];
  uint64_t v16 = [(ICPasswordChangeViewController *)self hintLabel];
  [v16 setText:v15];

  v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Done" value:@"Done" table:0 allowSiri:1];
  v18 = [(ICPasswordChangeViewController *)self doneButton];
  [v18 setTitle:v17];

  [(ICPasswordChangeViewController *)self setIsSetupForChangePassword:1];
  [(ICPasswordChangeViewController *)self setDidAuthenticateWithBiometrics:v4];
  [(ICPasswordChangeViewController *)self setupAccessibility];
}

- (void)resetTextFields
{
  v3 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v3 setText:&stru_1F0973378];

  BOOL v4 = [(ICPasswordChangeViewController *)self passwordTextField];
  [v4 setText:&stru_1F0973378];

  id v5 = [(ICPasswordChangeViewController *)self verifyTextField];
  [v5 setText:&stru_1F0973378];

  id v6 = [(ICPasswordChangeViewController *)self hintTextField];
  [v6 setText:&stru_1F0973378];
}

- (id)disclaimerAttributedString
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  v3 = objc_msgSend(v2, "ic_fontWithSingleLineA");

  uint64_t v4 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v4;
  v18[0] = v3;
  id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v18[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  char v7 = (void *)MEMORY[0x1E4F83278];
  id v8 = [MEMORY[0x1E4F83428] sharedContext];
  char v9 = [v8 managedObjectContext];
  uint64_t v10 = [v7 allActiveAccountsInContext:v9];
  unint64_t v11 = [v10 count];

  if (v11 < 2) {
    objc_super v12 = @"IMPORTANT: If you forget this password, you won’t be able to view your locked notes.";
  }
  else {
    objc_super v12 = @"IMPORTANT: If you forget this password, you won’t be able to view the locked notes that use it.";
  }
  uint64_t v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13 attributes:v6];
  id v15 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v15 setAlignment:4];
  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v15, 0, objc_msgSend(v14, "length"));

  return v14;
}

- (void)dismissKeyboardIfNeeded
{
  id v2 = [(ICPasswordChangeViewController *)self firstResponderTextField];
  [v2 resignFirstResponder];
}

- (void)registerForTraitChanges
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ICPasswordChangeViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5FDB620;
  v5[4] = self;
  id v4 = (id)[(ICPasswordChangeViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __57__ICPasswordChangeViewController_registerForTraitChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentSizeCategoryDidChange];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(ICPasswordChangeViewController *)self orderedTextFields];
  uint64_t v6 = [v5 indexOfObject:v4];

  unint64_t v7 = v6 + 1;
  id v8 = [(ICPasswordChangeViewController *)self orderedTextFields];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    [(ICPasswordChangeViewController *)self doneButtonPressed:0];
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = [(ICPasswordChangeViewController *)self orderedTextFields];
    unint64_t v11 = [v10 objectAtIndexedSubscript:v7];
    objc_super v12 = ICDynamicCast();

    [v12 becomeFirstResponder];
  }
  return 1;
}

- (void)contentSizeCategoryDidChange
{
  [(ICPasswordChangeViewController *)self updateFonts];
  id v3 = [(ICPasswordChangeViewController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)updateFonts
{
  id v16 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
  id v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  id v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
  id v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:0.0];
  uint64_t v6 = [(ICPasswordChangeViewController *)self headerLabel];
  [v6 setFont:v5];

  unint64_t v7 = [(ICPasswordChangeViewController *)self warningLabel];
  [v7 setFont:v5];

  id v8 = [(ICPasswordChangeViewController *)self oldPasswordLabel];
  [v8 setFont:v4];

  unint64_t v9 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v9 setFont:v4];

  uint64_t v10 = [(ICPasswordChangeViewController *)self passwordLabel];
  [v10 setFont:v4];

  unint64_t v11 = [(ICPasswordChangeViewController *)self passwordTextField];
  [v11 setFont:v4];

  objc_super v12 = [(ICPasswordChangeViewController *)self verifyLabel];
  [v12 setFont:v4];

  uint64_t v13 = [(ICPasswordChangeViewController *)self verifyTextField];
  [v13 setFont:v4];

  uint64_t v14 = [(ICPasswordChangeViewController *)self hintLabel];
  [v14 setFont:v4];

  id v15 = [(ICPasswordChangeViewController *)self hintTextField];
  [v15 setFont:v4];
}

- (void)setupAccessibility
{
  id v3 = [(ICPasswordChangeViewController *)self headerLabel];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x1E4FB2550] | v4];

  BOOL v5 = [(ICPasswordChangeViewController *)self isSetupForChangePassword];
  uint64_t v6 = [(ICPasswordChangeViewController *)self oldPasswordLabel];
  [v6 setIsAccessibilityElement:v5];

  BOOL v7 = [(ICPasswordChangeViewController *)self isSetupForChangePassword];
  id v8 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v8 setIsAccessibilityElement:v7];

  unint64_t v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Old Password" value:@"Old Password" table:0 allowSiri:1];
  uint64_t v10 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v10 setAccessibilityLabel:v9];

  unint64_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter your old password first in order to set a new password." value:@"Enter your old password first in order to set a new password." table:0 allowSiri:1];
  objc_super v12 = [(ICPasswordChangeViewController *)self oldPasswordTextField];
  [v12 setAccessibilityHint:v11];

  uint64_t v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Password" value:@"New Password" table:0 allowSiri:1];
  uint64_t v14 = [(ICPasswordChangeViewController *)self passwordTextField];
  [v14 setAccessibilityLabel:v13];

  id v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter a new password to use for your protected notes." value:@"Enter a new password to use for your protected notes." table:0 allowSiri:1];
  id v16 = [(ICPasswordChangeViewController *)self passwordTextField];
  [v16 setAccessibilityHint:v15];

  v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Confirm Password" value:@"Confirm Password" table:0 allowSiri:1];
  v18 = [(ICPasswordChangeViewController *)self verifyTextField];
  [v18 setAccessibilityLabel:v17];

  int v19 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter your new password again for confirmation." value:@"Enter your new password again for confirmation." table:0 allowSiri:1];
  v20 = [(ICPasswordChangeViewController *)self verifyTextField];
  [v20 setAccessibilityHint:v19];

  v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Password Hint" value:@"Password Hint" table:0 allowSiri:1];
  v22 = [(ICPasswordChangeViewController *)self hintTextField];
  [v22 setAccessibilityLabel:v21];

  id v24 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter a hint for your new password." value:@"Enter a hint for your new password." table:0 allowSiri:1];
  v23 = [(ICPasswordChangeViewController *)self hintTextField];
  [v23 setAccessibilityHint:v24];
}

- (BOOL)isSetupForChangePassword
{
  return self->_isSetupForChangePassword;
}

- (void)setIsSetupForChangePassword:(BOOL)a3
{
  self->_isSetupForChangePassword = a3;
}

- (BOOL)didAuthenticateWithBiometrics
{
  return self->_didAuthenticateWithBiometrics;
}

- (void)setDidAuthenticateWithBiometrics:(BOOL)a3
{
  self->_didAuthenticateWithBiometrics = a3;
}

- (BOOL)isInSettings
{
  return self->_isInSettings;
}

- (void)setIsInSettings:(BOOL)a3
{
  self->_isInSettings = a3;
}

- (BOOL)isSettingInitialPassword
{
  return self->_isSettingInitialPassword;
}

- (void)setIsSettingInitialPassword:(BOOL)a3
{
  self->_isSettingInitialPassword = a3;
}

- (ICAccountPassphraseManager)passphraseManager
{
  return self->_passphraseManager;
}

- (void)setPassphraseManager:(id)a3
{
}

- (NSArray)textBackgroundViews
{
  return self->_textBackgroundViews;
}

- (void)setTextBackgroundViews:(id)a3
{
}

- (UIView)headerBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerBackground);
  return (UIView *)WeakRetained;
}

- (void)setHeaderBackground:(id)a3
{
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (ICPasswordUtilities)passwordUtilities
{
  return self->_passwordUtilities;
}

- (void)setPasswordUtilities:(id)a3
{
}

- (UILabel)headerLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerLabel);
  return (UILabel *)WeakRetained;
}

- (void)setHeaderLabel:(id)a3
{
}

- (UILabel)oldPasswordLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oldPasswordLabel);
  return (UILabel *)WeakRetained;
}

- (void)setOldPasswordLabel:(id)a3
{
}

- (UILabel)passwordLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPasswordLabel:(id)a3
{
}

- (UILabel)verifyLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_verifyLabel);
  return (UILabel *)WeakRetained;
}

- (void)setVerifyLabel:(id)a3
{
}

- (UILabel)hintLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hintLabel);
  return (UILabel *)WeakRetained;
}

- (void)setHintLabel:(id)a3
{
}

- (UILabel)warningLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_warningLabel);
  return (UILabel *)WeakRetained;
}

- (void)setWarningLabel:(id)a3
{
}

- (UITextField)oldPasswordTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oldPasswordTextField);
  return (UITextField *)WeakRetained;
}

- (void)setOldPasswordTextField:(id)a3
{
}

- (UITextField)passwordTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordTextField);
  return (UITextField *)WeakRetained;
}

- (void)setPasswordTextField:(id)a3
{
}

- (UITextField)verifyTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_verifyTextField);
  return (UITextField *)WeakRetained;
}

- (void)setVerifyTextField:(id)a3
{
}

- (UITextField)hintTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hintTextField);
  return (UITextField *)WeakRetained;
}

- (void)setHintTextField:(id)a3
{
}

- (NSArray)orderedTextFields
{
  return self->_orderedTextFields;
}

- (void)setOrderedTextFields:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_doneButton);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (NSLayoutConstraint)oldPasswordHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oldPasswordHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setOldPasswordHeightConstraint:(id)a3
{
}

- (int64_t)incorrectPasswordAttempts
{
  return self->_incorrectPasswordAttempts;
}

- (void)setIncorrectPasswordAttempts:(int64_t)a3
{
  self->_incorrectPasswordAttempts = a3;
}

- (BOOL)didAttemptToSubmitWithoutHint
{
  return self->_didAttemptToSubmitWithoutHint;
}

- (void)setDidAttemptToSubmitWithoutHint:(BOOL)a3
{
  self->_didAttemptToSubmitWithoutHint = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)usingLargerAXSizes
{
  return self->_usingLargerAXSizes;
}

- (void)setUsingLargerAXSizes:(BOOL)a3
{
  self->_usingLargerAXSizes = a3;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_oldPasswordHeightConstraint);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_destroyWeak((id *)&self->_doneButton);
  objc_storeStrong((id *)&self->_orderedTextFields, 0);
  objc_destroyWeak((id *)&self->_hintTextField);
  objc_destroyWeak((id *)&self->_verifyTextField);
  objc_destroyWeak((id *)&self->_passwordTextField);
  objc_destroyWeak((id *)&self->_oldPasswordTextField);
  objc_destroyWeak((id *)&self->_warningLabel);
  objc_destroyWeak((id *)&self->_hintLabel);
  objc_destroyWeak((id *)&self->_verifyLabel);
  objc_destroyWeak((id *)&self->_passwordLabel);
  objc_destroyWeak((id *)&self->_oldPasswordLabel);
  objc_destroyWeak((id *)&self->_headerLabel);
  objc_storeStrong((id *)&self->_passwordUtilities, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_destroyWeak((id *)&self->_headerBackground);
  objc_storeStrong((id *)&self->_textBackgroundViews, 0);
  objc_storeStrong((id *)&self->_passphraseManager, 0);
}

@end