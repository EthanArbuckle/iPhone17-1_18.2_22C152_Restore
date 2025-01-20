@interface PSKeychainSyncSecurityCodeController
- (BOOL)showsAdvancedSettings;
- (Class)textEntryCellClass;
- (NSString)firstPasscodeEntry;
- (PSKeychainSyncSecurityCodeController)init;
- (id)_configureTextEntryCell;
- (id)placeholderText;
- (id)specifiers;
- (int)mode;
- (int)securityCodeType;
- (void)animatePasscodeFieldLeft:(BOOL)a3;
- (void)dealloc;
- (void)didFinishEnteringText:(id)a3;
- (void)dismissAlerts;
- (void)forgotSecurityCode;
- (void)generateRandomCode;
- (void)keyboardWillShow:(id)a3;
- (void)setFirstPasscodeEntry:(id)a3;
- (void)setMode:(int)a3;
- (void)setSecurityCodeType:(int)a3;
- (void)setShowsAdvancedSettings:(BOOL)a3;
- (void)showAdvancedOptions;
- (void)textEntryViewDidChange:(id)a3;
- (void)updateNextButton;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSKeychainSyncSecurityCodeController

- (PSKeychainSyncSecurityCodeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSKeychainSyncSecurityCodeController;
  v2 = [(PSKeychainSyncTextEntryController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(PSKeychainSyncTextEntryController *)v2 setTextEntryType:1];
    [(PSKeychainSyncTextEntryController *)v3 setSecureTextEntry:1];
    [(PSKeychainSyncTextEntryController *)v3 setHidesNextButton:1];
    [(PSKeychainSyncSecurityCodeController *)v3 setMode:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  [(PSKeychainSyncTextEntryController *)&v4 dealloc];
}

- (Class)textEntryCellClass
{
  if ([(PSKeychainSyncTextEntryController *)self textEntryType] == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSKeychainSyncSecurityCodeController;
    v3 = [(PSKeychainSyncTextEntryController *)&v5 textEntryCellClass];
  }
  else
  {
    v3 = (objc_class *)objc_opt_class();
  }
  return v3;
}

- (id)_configureTextEntryCell
{
  v14.receiver = self;
  v14.super_class = (Class)PSKeychainSyncSecurityCodeController;
  v3 = [(PSKeychainSyncTextEntryController *)&v14 textEntryCell];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "setMode:", -[PSKeychainSyncSecurityCodeController mode](self, "mode"));
    objc_msgSend(v3, "setSecurityCodeType:", -[PSKeychainSyncSecurityCodeController securityCodeType](self, "securityCodeType"));
    objc_super v4 = [(PSKeychainSyncSecurityCodeController *)self firstPasscodeEntry];
    [v3 setFirstPasscodeEntry:v4];

    if (self->_securityCodeType == 1)
    {
      objc_super v5 = +[PSKeychainSyncManager sharedManager];
      if ([v5 isRunningInBuddy])
      {
        objc_super v6 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE");
      }
      else
      {
        objc_super v6 = 0;
      }
    }
    else
    {
      objc_super v6 = 0;
    }
    [v3 setBulletText:v6];
    v7 = [v3 textField];
    v8 = v7;
    if (self->_securityCodeType == 2)
    {
      if (self->_firstPasscodeEntry) {
        uint64_t v9 = 4;
      }
      else {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 4;
    }
    [v7 setTextAlignment:v9];

    v10 = [v3 textField];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = [v3 textField];
    [v11 setMinimumFontSize:8.0];

    if (self->_securityCodeType == 2)
    {
      v12 = [v3 textField];
      [v12 setDisplaySecureTextUsingPlainText:1];
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PSKeychainSyncSecurityCodeController;
  [(PSListController *)&v12 viewDidLoad];
  if (self->_securityCodeType)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
    objc_super v4 = PS_LocalizedStringForKeychainSync(@"NEXT");
    objc_super v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_nextPressed];
  }
  else
  {
    objc_super v5 = 0;
  }
  objc_super v6 = [(PSKeychainSyncSecurityCodeController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(PSKeychainSyncViewController *)self headerView];
  v8 = v7;
  if (self->_mode == 1)
  {
    uint64_t v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [v9 _referenceBounds];
    if (v10 == 480.0)
    {
      v11 = +[PSKeychainSyncManager sharedManager];
      objc_msgSend(v8, "setUsesCompactLayout:", objc_msgSend(v11, "isRunningInBuddy"));
    }
    else
    {
      [v8 setUsesCompactLayout:0];
    }
  }
  else
  {
    [v7 setUsesCompactLayout:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  [(PSKeychainSyncTextEntryController *)&v4 viewWillAppear:a3];
  [(PSKeychainSyncTextEntryController *)self becomeFirstResponder];
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  double v7 = v6;

  self->_keyboardHeight = v7;
  id v8 = [(PSKeychainSyncSecurityCodeController *)self view];
  [v8 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)PSKeychainSyncSecurityCodeController;
  [(PSListController *)&v59 viewDidLayoutSubviews];
  double v58 = 25.0;
  double v3 = 5.0;
  if (self->_mode == 1)
  {
    objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 _referenceBounds];
    if (v5 == 480.0)
    {
      double v6 = +[PSKeychainSyncManager sharedManager];
      if ([v6 isRunningInBuddy]) {
        double v3 = -21.0;
      }
      else {
        double v3 = 5.0;
      }
    }
    if (self->_mode == 1)
    {
      double v7 = [MEMORY[0x1E4F42D90] mainScreen];
      [v7 _referenceBounds];
      if (v8 == 480.0)
      {
        uint64_t v9 = +[PSKeychainSyncManager sharedManager];
        int v10 = [v9 isRunningInBuddy];
        double v11 = 25.0;
        if (v10) {
          double v11 = 15.0;
        }
        double v58 = v11;
      }
      else
      {
        double v58 = 25.0;
      }
    }
  }
  objc_super v12 = [(PSListController *)self table];
  v13 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  objc_super v14 = [v12 cellForRowAtIndexPath:v13];

  v15 = [(PSListController *)self table];
  [v15 bounds];
  CGFloat v56 = v17;
  CGFloat v57 = v16;
  double v19 = v18;
  CGFloat rect = v20;

  -[UILabel sizeThatFits:](self->_footerLabel, "sizeThatFits:", v19 + -40.0, 1.79769313e308);
  double v22 = v21;
  double v24 = v23;
  CGFloat v54 = v21;
  *(float *)&double v21 = (v19 - v21) * 0.5;
  CGFloat v25 = floorf(*(float *)&v21);
  [v14 frame];
  double v26 = v3 + CGRectGetMaxY(v60);
  CGFloat v27 = v25;
  -[UILabel setFrame:](self->_footerLabel, "setFrame:", v25, v26, v22, v24);
  v28 = (void *)MEMORY[0x1E4F1CA60];
  v29 = [MEMORY[0x1E4F428B8] _systemInteractionTintColor];
  uint64_t v30 = *MEMORY[0x1E4F42510];
  v31 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v32 = objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v29, v30, v31, *MEMORY[0x1E4F42508], 0);

  if (self->_mode == 2) {
    v33 = @"FORGOT_SECURITY_CODE";
  }
  else {
    v33 = @"ADVANCED_OPTIONS";
  }
  v34 = PS_LocalizedStringForKeychainSync(v33);
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v34 attributes:v32];
  [(UIButton *)self->_footerButton setAttributedTitle:v35 forState:0];
  v36 = [MEMORY[0x1E4F428B8] blackColor];
  [v32 setObject:v36 forKey:v30];

  v37 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v34 attributes:v32];
  [(UIButton *)self->_footerButton setAttributedTitle:v37 forState:1];
  [(UIButton *)self->_footerButton sizeToFit];
  [(UIButton *)self->_footerButton frame];
  double v39 = v38;
  double v41 = v40;
  float v42 = (v19 - v38) * 0.5;
  double v53 = floorf(v42);
  v61.origin.y = v56;
  v61.origin.x = v57;
  v61.size.width = v19;
  v61.size.height = rect;
  double v43 = CGRectGetMaxY(v61) - self->_keyboardHeight - v41 - v58;
  v62.origin.x = v27;
  v62.origin.y = v26;
  v62.size.width = v54;
  v62.size.height = v24;
  double v44 = CGRectGetMaxY(v62) + 10.0;
  if (v43 >= v44) {
    double v45 = v43;
  }
  else {
    double v45 = v44;
  }
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v53, v45, v39, v41);
  v46 = [(PSListController *)self table];
  [v46 contentSize];
  double v48 = v47;
  double v50 = v49;

  v63.origin.x = v27;
  v63.origin.y = v26;
  v63.size.width = v54;
  v63.size.height = v24;
  double v51 = v58 + v41 + CGRectGetMaxY(v63) + 10.0;
  if (v50 < v51)
  {
    v52 = [(PSListController *)self table];
    objc_msgSend(v52, "setContentSize:", v48, v51);
  }
}

- (id)specifiers
{
  v68.receiver = self;
  v68.super_class = (Class)PSKeychainSyncSecurityCodeController;
  double v3 = [(PSKeychainSyncTextEntryController *)&v68 specifiers];
  if (!self->_footerButton)
  {
    objc_super v4 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    footerButton = self->_footerButton;
    self->_footerButton = v4;

    double v6 = [(PSListController *)self table];
    [v6 addSubview:self->_footerButton];
  }
  if (!self->_footerLabel)
  {
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v7;

    uint64_t v9 = self->_footerLabel;
    int v10 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
    [(UILabel *)v9 setFont:v10];

    [(UILabel *)self->_footerLabel setTextAlignment:1];
    [(UILabel *)self->_footerLabel setNumberOfLines:0];
    double v11 = [(PSListController *)self table];
    [v11 addSubview:self->_footerLabel];
  }
  [(UIButton *)self->_footerButton setAlpha:0.0];
  [(UIButton *)self->_footerButton removeTarget:self action:0 forControlEvents:64];
  objc_super v12 = +[PSKeychainSyncManager sharedManager];
  int v13 = [v12 isRunningInBuddy];

  int mode = self->_mode;
  if (mode == 2)
  {
    [(UILabel *)self->_footerLabel setText:0];
    CGFloat v25 = [(PSKeychainSyncViewController *)self headerView];
    [v25 setDetailText:0];

    double v26 = [(PSKeychainSyncViewController *)self groupSpecifier];
    [v26 setProperty:0 forKey:@"footerText"];

    if (v13) {
      CGFloat v27 = @"ICLOUD_SECURITY_CODE";
    }
    else {
      CGFloat v27 = @"SECURITY_CODE";
    }
    if (v13) {
      v28 = @"ENTER_YOUR_SECURITY_CODE";
    }
    else {
      v28 = @"ENTER_YOUR_ICLOUD_SECURITY_CODE";
    }
    v29 = PS_LocalizedStringForKeychainSync(v27);
    [(PSKeychainSyncViewController *)self setTitle:v29];

    uint64_t v30 = [(PSKeychainSyncViewController *)self headerView];
    v31 = PS_LocalizedStringForKeychainSync(v28);
    [v30 setDetailText:v31];

    [(UIButton *)self->_footerButton addTarget:self action:sel_forgotSecurityCode forControlEvents:64];
    [(UIButton *)self->_footerButton setAlpha:1.0];
    goto LABEL_90;
  }
  if (mode == 1)
  {
    v15 = +[PSKeychainSyncManager sharedManager];
    char v16 = [v15 isRunningInBuddy];

    if ((v16 & 1) == 0)
    {
      double v17 = [(PSKeychainSyncSecurityCodeController *)self navigationItem];
      double v18 = PS_LocalizedStringForKeychainSync(@"KEYCHAIN_SETUP");
      [v17 setTitle:v18];
    }
    if (self->_showsAdvancedSettings && !self->_firstPasscodeEntry)
    {
      [(UIButton *)self->_footerButton addTarget:self action:sel_showAdvancedOptions forControlEvents:64];
      [(UIButton *)self->_footerButton setAlpha:1.0];
    }
    int securityCodeType = self->_securityCodeType;
    if (securityCodeType == 2)
    {
      firstPasscodeEntry = self->_firstPasscodeEntry;
      BOOL v33 = firstPasscodeEntry == 0;
      if (firstPasscodeEntry) {
        v34 = @"CONFIRM_RANDOM_CODE_DESCRIPTION";
      }
      else {
        v34 = @"COMPLEX_CODE_DESCRIPTION";
      }
      v35 = @"CONFIRM_SECURITY_CODE_BUDDY";
      if (v33) {
        v35 = @"RANDOM_SECURITY_CODE_BUDDY";
      }
      v66 = v35;
      if (v33) {
        double v23 = @"RANDOM_CODE";
      }
      else {
        double v23 = @"CONFIRM_CODE";
      }
      if (v13)
      {
        double v21 = 0;
      }
      else
      {
        v34 = 0;
        double v21 = @"COMPLEX_CODE_DESCRIPTION";
      }
      double v22 = v34;
      goto LABEL_58;
    }
    if (securityCodeType == 1)
    {
      v36 = self->_firstPasscodeEntry;
      v37 = @"REENTER_YOUR_SECURITY_CODE";
      if (v13)
      {
        double v38 = @"COMPLEX_CODE_DESCRIPTION";
      }
      else
      {
        v37 = 0;
        double v38 = 0;
      }
      if (v13) {
        double v21 = 0;
      }
      else {
        double v21 = @"COMPLEX_CODE_DESCRIPTION";
      }
      BOOL v39 = v36 == 0;
      if (v36) {
        double v40 = v37;
      }
      else {
        double v40 = v38;
      }
      if (v39) {
        double v23 = @"COMPLEX_CODE";
      }
      else {
        double v23 = @"CONFIRM_CODE";
      }
      double v22 = v40;
      double v24 = @"COMPLEX_SECURITY_CODE_BUDDY";
    }
    else
    {
      if (securityCodeType)
      {
        v66 = 0;
        double v22 = 0;
        v67 = 0;
        double v41 = 0;
        goto LABEL_59;
      }
      if (!self->_firstPasscodeEntry)
      {
        float v42 = @"CREATE_AN_ICLOUD_SECURITY_CODE";
        v66 = @"CREATE_AN_ICLOUD_SECURITY_CODE";
        if (v13)
        {
          float v42 = 0;
          double v21 = @"SECURITY_CODE_DESCRIPTION";
        }
        else
        {
          double v21 = 0;
        }
        double v22 = v42;
        double v23 = @"CREATE_SECURITY_CODE";
        goto LABEL_58;
      }
      double v20 = @"REENTER_YOUR_ICLOUD_SECURITY_CODE";
      if (v13)
      {
        double v20 = 0;
        double v21 = @"REENTER_YOUR_SECURITY_CODE";
      }
      else
      {
        double v21 = 0;
      }
      double v22 = v20;
      double v23 = @"CREATE_SECURITY_CODE";
      double v24 = @"CREATE_AN_ICLOUD_SECURITY_CODE";
    }
    v66 = v24;
LABEL_58:
    v67 = v23;
    double v41 = v21;
LABEL_59:
    double v43 = [(PSKeychainSyncTextEntryController *)self textEntryView];
    if (self->_firstPasscodeEntry || self->_securityCodeType != 2)
    {
      double v44 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v48 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
        [v43 setFont:v48];
      }
      v46 = [(PSKeychainSyncSecurityCodeController *)self textEntryCell];
      uint64_t v47 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    else
    {
      double v44 = v3;
      [(PSKeychainSyncSecurityCodeController *)self generateRandomCode];
      double v45 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
      [v43 setFont:v45];

      v46 = [(PSKeychainSyncSecurityCodeController *)self textEntryCell];
      uint64_t v47 = [MEMORY[0x1E4F428B8] clearColor];
    }
    double v49 = (void *)v47;
    [v46 setBackgroundColor:v47];

    if (v13)
    {
      int v50 = self->_securityCodeType;
      if (v50 == 1) {
        BOOL v51 = 1;
      }
      else {
        BOOL v51 = v50 == 2 && self->_firstPasscodeEntry != 0;
      }
      double v3 = v44;
      double v53 = v67;
      [(PSKeychainSyncTextEntryController *)self setTextFieldHasRoundBorder:v51];
      if (v66) {
        int v54 = v13;
      }
      else {
        int v54 = 0;
      }
      v52 = v22;
      if (v54 == 1)
      {
        v55 = [(PSKeychainSyncViewController *)self headerView];
        CGFloat v56 = PS_LocalizedStringForKeychainSync(v66);
        [v55 setTitleText:v56];
      }
    }
    else
    {
      [(PSKeychainSyncTextEntryController *)self setTextFieldHasRoundBorder:0];
      double v3 = v44;
      v52 = v22;
      double v53 = v67;
    }
    if (v52)
    {
      CGFloat v57 = [(PSKeychainSyncViewController *)self headerView];
      double v58 = PS_LocalizedStringForKeychainSync(v52);
      [v57 setDetailText:v58];
    }
    if (v53) {
      char v59 = v13;
    }
    else {
      char v59 = 1;
    }
    if ((v59 & 1) == 0)
    {
      CGRect v60 = [(PSKeychainSyncSecurityCodeController *)self navigationItem];
      CGRect v61 = PS_LocalizedStringForKeychainSync(v53);
      [v60 setTitle:v61];
    }
    if (v41)
    {
      if (v13)
      {
        CGRect v62 = self->_footerLabel;
        CGRect v63 = PS_LocalizedStringForKeychainSync(v41);
        [(UILabel *)v62 setText:v63];
      }
      else
      {
        CGRect v63 = [(PSKeychainSyncViewController *)self groupSpecifier];
        v64 = PS_LocalizedStringForKeychainSync(v41);
        [v63 setProperty:v64 forKey:@"footerText"];
      }
    }
  }
LABEL_90:
  [(PSKeychainSyncSecurityCodeController *)self updateNextButton];
  return v3;
}

- (id)placeholderText
{
  int securityCodeType = self->_securityCodeType;
  if (securityCodeType == 2)
  {
    double v6 = @"RANDOM_SECURITY_CODE_PLACEHOLDER";
  }
  else
  {
    if (securityCodeType != 1)
    {
      double v7 = 0;
      goto LABEL_11;
    }
    objc_super v4 = +[PSKeychainSyncManager sharedManager];
    char v5 = [v4 isRunningInBuddy];

    if (v5)
    {
      double v6 = @"REQUIRED_LOWERCASE";
    }
    else if (self->_firstPasscodeEntry)
    {
      double v6 = @"CONFIRM_SECURITY_CODE_LOWERCASE";
    }
    else
    {
      double v6 = @"SECURITY_CODE_LOWERCASE";
    }
  }
  double v7 = PS_LocalizedStringForKeychainSync(v6);
LABEL_11:
  return v7;
}

- (void)animatePasscodeFieldLeft:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PSListController *)self table];
  [v5 bounds];
  double v7 = v6;
  UIKeyboardDisableAutomaticAppearance();
  id v8 = objc_alloc_init(MEMORY[0x1E4F42DF8]);
  [v5 frame];
  objc_msgSend(v8, "setFrame:");
  [v8 captureSnapshotOfView:v5 withSnapshotType:1];
  uint64_t v9 = [v5 superview];
  [v9 addSubview:v8];

  if (v3 || self->_securityCodeType != 2) {
    generatedCode = &stru_1EFB51FD0;
  }
  else {
    generatedCode = (__CFString *)self->_generatedCode;
  }
  [(PSKeychainSyncTextEntryController *)self setTextEntryText:generatedCode];
  if (v3) {
    double v11 = 1.0;
  }
  else {
    double v11 = -1.0;
  }
  [(PSListController *)self reloadSpecifiers];
  [v5 frame];
  [v5 setFrame:v12 + v11 * v7];
  int v13 = (void *)MEMORY[0x1E4F42FF0];
  [MEMORY[0x1E4F42FD8] defaultDurationForTransition:1];
  double v15 = v14;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke;
  v21[3] = &unk_1E5C5DA70;
  id v22 = v5;
  double v24 = v11;
  double v25 = v7;
  id v23 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke_2;
  v18[3] = &unk_1E5C5EF70;
  id v19 = v23;
  double v20 = self;
  id v16 = v23;
  id v17 = v5;
  [v13 animateWithDuration:v21 animations:v18 completion:v15];
}

uint64_t __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 frame];
  CGRect v7 = CGRectOffset(v6, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)), 0.0);
  objc_msgSend(v2, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  BOOL v3 = *(void **)(a1 + 40);
  [v3 frame];
  CGRect v9 = CGRectOffset(v8, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)), 0.0);
  return objc_msgSend(v3, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

uint64_t __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  UIKeyboardEnableAutomaticAppearance();
  v2 = *(void **)(a1 + 40);
  return [v2 becomeFirstResponder];
}

- (void)didFinishEnteringText:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int securityCodeType = self->_securityCodeType;
  if (!securityCodeType)
  {
    CGRect v6 = [MEMORY[0x1E4F42948] currentDevice];
    int v7 = objc_msgSend(v6, "sf_isiPad");

    if (v7)
    {
      CGRect v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
      CGRect v9 = [v8 invertedSet];
      uint64_t v10 = [v4 rangeOfCharacterFromSet:v9];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        self->_int securityCodeType = 1;
      }
    }
  }
  v39[0] = v4;
  v38[0] = @"securityCode";
  v38[1] = @"securityCodeType";
  double v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_securityCodeType];
  v39[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  if (self->_mode == 2)
  {
    int v13 = [(PSKeychainSyncViewController *)self delegate];
    [(NSString *)v13 keychainSyncController:self didFinishWithResult:v12 error:0];
  }
  else
  {
    firstPasscodeEntry = self->_firstPasscodeEntry;
    if (firstPasscodeEntry)
    {
      int v13 = firstPasscodeEntry;
      if (securityCodeType == 2)
      {
        uint64_t v15 = [v4 uppercaseString];

        uint64_t v16 = [(NSString *)v13 uppercaseString];

        int v13 = (NSString *)v16;
        id v4 = (id)v15;
      }
      int v17 = [v4 isEqualToString:v13];
      [(PSKeychainSyncSecurityCodeController *)self setFirstPasscodeEntry:0];
      if (v17)
      {
        double v18 = [(PSKeychainSyncViewController *)self delegate];
        [v18 keychainSyncController:self didFinishWithResult:v12 error:0];
      }
      else
      {
        if (securityCodeType == 2) {
          v28 = @"INCORRECT_SECURITY_CODE";
        }
        else {
          v28 = @"SECURITY_CODES_DID_NOT_MATCH";
        }
        double v18 = PS_LocalizedStringForKeychainSync(v28);
        v29 = (void *)MEMORY[0x1E4F42728];
        uint64_t v30 = PS_LocalizedStringForKeychainSync(@"ENTER_SECURITY_CODE_AGAIN");
        v31 = [v29 alertControllerWithTitle:v18 message:v30 preferredStyle:1];

        v32 = (void *)MEMORY[0x1E4F42720];
        BOOL v33 = PS_LocalizedStringForKeychainSync(@"OK");
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_3;
        v35[3] = &unk_1E5C5DAE8;
        v35[4] = self;
        v34 = [v32 actionWithTitle:v33 style:0 handler:v35];
        [v31 addAction:v34];

        [(PSKeychainSyncSecurityCodeController *)self presentViewController:v31 animated:1 completion:0];
      }
    }
    else
    {
      [(PSKeychainSyncSecurityCodeController *)self setFirstPasscodeEntry:v4];
      if ((unint64_t)[v4 length] >= 6
        && (securityCodeType == 2 || !SecPasswordIsPasswordWeak2()))
      {
        [(PSKeychainSyncSecurityCodeController *)self animatePasscodeFieldLeft:1];
        goto LABEL_22;
      }
      id v19 = (void *)MEMORY[0x1E4F42728];
      double v20 = PS_LocalizedStringForKeychainSync(@"WEAK_SECURITY_CODE");
      double v21 = PS_LocalizedStringForKeychainSync(@"WEAK_SECURITY_CODE_DETAILS");
      int v13 = [v19 alertControllerWithTitle:v20 message:v21 preferredStyle:1];

      id v22 = (void *)MEMORY[0x1E4F42720];
      id v23 = PS_LocalizedStringForKeychainSync(@"CHANGE");
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke;
      v37[3] = &unk_1E5C5DAE8;
      v37[4] = self;
      double v24 = [v22 actionWithTitle:v23 style:0 handler:v37];
      [(NSString *)v13 addAction:v24];

      double v25 = (void *)MEMORY[0x1E4F42720];
      double v26 = PS_LocalizedStringForKeychainSync(@"USE_CODE");
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_2;
      v36[3] = &unk_1E5C5DAE8;
      v36[4] = self;
      CGFloat v27 = [v25 actionWithTitle:v26 style:0 handler:v36];
      [(NSString *)v13 addAction:v27];

      [(PSKeychainSyncSecurityCodeController *)self presentViewController:v13 animated:1 completion:0];
    }
  }

LABEL_22:
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTextEntryText:&stru_1EFB51FD0];
  v2 = *(void **)(a1 + 32);
  return [v2 setFirstPasscodeEntry:0];
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) animatePasscodeFieldLeft:1];
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) animatePasscodeFieldLeft:0];
}

- (void)updateNextButton
{
  BOOL v3 = [(PSKeychainSyncSecurityCodeController *)self navigationItem];
  id v13 = [v3 rightBarButtonItem];

  int securityCodeType = self->_securityCodeType;
  if (securityCodeType == 2)
  {
    if (self->_mode == 1 && !self->_firstPasscodeEntry)
    {
      [v13 setEnabled:1];
    }
    else
    {
      generatedCode = self->_generatedCode;
      if (generatedCode)
      {
        uint64_t v10 = [(NSString *)generatedCode length];
        double v11 = [(PSKeychainSyncTextEntryController *)self textEntryText];
        BOOL v12 = [v11 length] == v10;
      }
      else
      {
        double v11 = [(PSKeychainSyncTextEntryController *)self textEntryText];
        BOOL v12 = [v11 length] != 0;
      }
      [v13 setEnabled:v12];
    }
  }
  else
  {
    char v5 = v13;
    if (securityCodeType != 1) {
      goto LABEL_14;
    }
    CGRect v6 = [(PSKeychainSyncTextEntryController *)self textEntryText];
    unint64_t v7 = [v6 length];
    unint64_t v8 = 6;
    if (self->_mode != 1) {
      unint64_t v8 = 1;
    }
    [v13 setEnabled:v7 >= v8];
  }
  char v5 = v13;
LABEL_14:
}

- (void)setFirstPasscodeEntry:(id)a3
{
  char v5 = (NSString *)a3;
  p_firstPasscodeEntry = &self->_firstPasscodeEntry;
  if (self->_firstPasscodeEntry != v5)
  {
    unint64_t v8 = v5;
    objc_storeStrong((id *)p_firstPasscodeEntry, a3);
    unint64_t v7 = [(PSKeychainSyncSecurityCodeController *)self textEntryCell];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setFirstPasscodeEntry:v8];
    }

    char v5 = v8;
  }
  MEMORY[0x1F41817F8](p_firstPasscodeEntry, v5);
}

- (void)setMode:(int)a3
{
  if (self->_mode != a3)
  {
    self->_int mode = a3;
    id v4 = [(PSKeychainSyncSecurityCodeController *)self _configureTextEntryCell];
    if (self->_mode == 1)
    {
      [(PSKeychainSyncTextEntryController *)self setNumberOfPasscodeFields:6];
    }
  }
}

- (void)setSecurityCodeType:(int)a3
{
  self->_int securityCodeType = a3;
  if (a3 <= 2) {
    [(PSKeychainSyncTextEntryController *)self setTextEntryType:dword_1A667F548[a3]];
  }
  if ([(PSKeychainSyncSecurityCodeController *)self isViewLoaded])
  {
    id v4 = [(PSKeychainSyncSecurityCodeController *)self view];
    [v4 setNeedsLayout];

    [(PSKeychainSyncTextEntryController *)self becomeFirstResponder];
  }
  id v5 = [(PSKeychainSyncSecurityCodeController *)self _configureTextEntryCell];
}

- (void)generateRandomCode
{
  p_generatedCode = &self->_generatedCode;
  generatedCode = self->_generatedCode;
  if (!generatedCode)
  {
    id v5 = (void *)SecPasswordGenerate();
    objc_storeStrong((id *)p_generatedCode, v5);
    CGRect v6 = [(PSKeychainSyncSecurityCodeController *)self navigationItem];
    unint64_t v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:1];

    generatedCode = *p_generatedCode;
  }
  [(PSKeychainSyncTextEntryController *)self setTextEntryText:generatedCode];
}

- (void)textEntryViewDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  [(PSKeychainSyncTextEntryController *)&v4 textEntryViewDidChange:a3];
  [(PSKeychainSyncSecurityCodeController *)self updateNextButton];
}

- (void)showAdvancedOptions
{
  [(PSKeychainSyncSecurityCodeController *)self setFirstPasscodeEntry:0];
  id v3 = [(PSKeychainSyncViewController *)self delegate];
  [v3 keychainSyncController:self didFinishWithResult:@"advancedOptions" error:0];
}

- (void)forgotSecurityCode
{
  char v22 = 0;
  PSKeychainSyncGetCircleMembershipStatus(&v22, 0);
  id v3 = (void *)MEMORY[0x1E4F42728];
  objc_super v4 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE_REQUIRED");
  if (v22) {
    id v5 = @"FORGOT_SECURITY_CODE_DETAILS_WITH_CIRCLE";
  }
  else {
    id v5 = @"FORGOT_SECURITY_CODE_DETAILS";
  }
  CGRect v6 = PS_LocalizedStringForKeychainSync(v5);
  unint64_t v7 = [v3 alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  unint64_t v8 = (void *)MEMORY[0x1E4F42720];
  if (v22) {
    CGRect v9 = @"APPROVE_FROM_OTHER_DEVICE";
  }
  else {
    CGRect v9 = @"SET_UP_LATER";
  }
  uint64_t v10 = PS_LocalizedStringForKeychainSync(v9);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke;
  v20[3] = &unk_1E5C5EF98;
  char v21 = v22;
  v20[4] = self;
  double v11 = [v8 actionWithTitle:v10 style:0 handler:v20];
  [v7 addAction:v11];

  BOOL v12 = (void *)MEMORY[0x1E4F42720];
  id v13 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_2;
  v19[3] = &unk_1E5C5DAE8;
  v19[4] = self;
  double v14 = [v12 actionWithTitle:v13 style:0 handler:v19];
  [v7 addAction:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F42720];
  uint64_t v16 = PS_LocalizedStringForKeychainSync(@"CANCEL");
  int v17 = [v15 actionWithTitle:v16 style:1 handler:0];
  [v7 addAction:v17];

  [(PSKeychainSyncSecurityCodeController *)self presentViewController:v7 animated:1 completion:0];
  double v18 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v18, &__block_literal_global_17);
}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) delegate];
  id v5 = v3;
  if (v2) {
    objc_super v4 = @"usePeerApproval";
  }
  else {
    objc_super v4 = @"setUpLater";
  }
  [v3 keychainSyncController:*(void *)(a1 + 32) didFinishWithResult:v4 error:0];
}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v26 = 0;
  objc_super v4 = PSSecureBackupAccountInfo(&v26, 1);
  id v5 = v26;
  uint64_t v32 = 0;
  BOOL v33 = &v32;
  uint64_t v34 = 0x2020000000;
  CGRect v6 = (void *)getkSecureBackupIsEnabledKeySymbolLoc_ptr_1;
  v35 = (void *)getkSecureBackupIsEnabledKeySymbolLoc_ptr_1;
  if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr_1)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getkSecureBackupIsEnabledKeySymbolLoc_block_invoke_1;
    uint64_t v30 = &unk_1E5C5D4D8;
    v31 = &v32;
    __getkSecureBackupIsEnabledKeySymbolLoc_block_invoke_1((uint64_t)&v27);
    CGRect v6 = (void *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v6)
  {
    -[PSContactsAuthorizationLevelController dealloc]();
    goto LABEL_15;
  }
  unint64_t v7 = [v4 objectForKey:*v6];
  int v8 = [v7 BOOLValue];

  uint64_t v32 = 0;
  BOOL v33 = &v32;
  uint64_t v34 = 0x2020000000;
  CGRect v9 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  v35 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
    uint64_t v30 = &unk_1E5C5D4D8;
    v31 = &v32;
    __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)&v27);
    CGRect v9 = (uint64_t (*)(void))v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v9)
  {
LABEL_15:
    double v24 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v32, 8);
    _Unwind_Resume(v24);
  }
  int v10 = v9();
  double v11 = @"REPLACE_ICLOUD_KEYCHAIN_DETAILS";
  if (v8) {
    double v11 = @"REPLACE_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY";
  }
  BOOL v12 = @"RESET_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY";
  if (!v8) {
    BOOL v12 = @"RESET_ICLOUD_KEYCHAIN_DETAILS";
  }
  if (!v10) {
    double v11 = v12;
  }
  id v13 = v11;
  double v14 = (void *)MEMORY[0x1E4F42728];
  uint64_t v15 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN_QUESTION");
  uint64_t v16 = PS_LocalizedStringForKeychainSync(v13);
  int v17 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

  double v18 = (void *)MEMORY[0x1E4F42720];
  id v19 = PS_LocalizedStringForKeychainSync(@"CANCEL");
  double v20 = [v18 actionWithTitle:v19 style:1 handler:0];
  [v17 addAction:v20];

  char v21 = (void *)MEMORY[0x1E4F42720];
  char v22 = PS_LocalizedStringForKeychainSync(@"RESET");
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_3;
  v25[3] = &unk_1E5C5DAE8;
  v25[4] = *(void *)(a1 + 32);
  id v23 = [v21 actionWithTitle:v22 style:0 handler:v25];
  [v17 addAction:v23];

  [*(id *)(a1 + 32) presentViewController:v17 animated:1 completion:0];
}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 keychainSyncController:*(void *)(a1 + 32) didFinishWithResult:@"resetKeychain" error:0];
}

id __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_4()
{
  return PSSecureBackupAccountInfo(0, 0);
}

- (void)dismissAlerts
{
  id v3 = [(PSKeychainSyncSecurityCodeController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(PSKeychainSyncSecurityCodeController *)self dismissViewControllerAnimated:0 completion:0];
  }
}

- (int)mode
{
  return self->_mode;
}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (BOOL)showsAdvancedSettings
{
  return self->_showsAdvancedSettings;
}

- (void)setShowsAdvancedSettings:(BOOL)a3
{
  self->_showsAdvancedSettings = a3;
}

- (NSString)firstPasscodeEntry
{
  return self->_firstPasscodeEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPasscodeEntry, 0);
  objc_storeStrong((id *)&self->_generatedCode, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end