@interface PSAppleIDSplashViewController
- (AKAppleIDAuthenticationController)authenticationController;
- (BOOL)_runningInMail;
- (BOOL)_shouldAnchorCreateAccountButton;
- (BOOL)_shouldShowCancelDone;
- (BOOL)isPresentedModally;
- (BOOL)shouldShowCreateAppleIDButton;
- (double)_heightForCreateNewAccountFooterWithWidth:(double)a3;
- (double)_heightForCreateNewAccountSpecifierWithWidth:(double)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_passwordForSpecifier:(id)a3;
- (id)_silhouetteMonogram;
- (id)_specifierForGroupWithiForgotLink;
- (id)_specifierForLoginPasswordForm;
- (id)_specifierForLoginUserForm;
- (id)_specifiersForCreateNewAccount;
- (id)_specifiersForSignInButton;
- (id)_usernameForSpecifier:(id)a3;
- (id)serviceDescription;
- (id)serviceFooter;
- (id)serviceIcon;
- (id)serviceName;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_beginiCloudCreationFlowWithContinuationData:(id)a3 completion:(id)a4;
- (void)_cancelButtonWasTapped:(id)a3;
- (void)_cancelPasswordDelegateIfNecessary;
- (void)_createICloudMailButtonWasTapped:(id)a3;
- (void)_createNewAppleIDButtonWasTapped:(id)a3;
- (void)_enableICloudMailButtonWasTapped:(id)a3;
- (void)_iForgotButtonWasTapped:(id)a3;
- (void)_openWebBasedCredentialRecoveryFlow;
- (void)_presentAppleIDPrivacyInformationPane;
- (void)_presentInvalidUsernameAlert;
- (void)_reloadPasswordSpecifier;
- (void)_setInteractionEnabled:(BOOL)a3;
- (void)_setPassword:(id)a3 withSpecifier:(id)a4;
- (void)_setUsername:(id)a3 withSpecifier:(id)a4;
- (void)_signInButtonWasTapped:(id)a3;
- (void)_signInWithUsername:(id)a3 password:(id)a4;
- (void)_textFieldValueDidChange:(id)a3;
- (void)_updateSignInButton;
- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4;
- (void)createNewAppleIDWithCompletion:(id)a3;
- (void)dealloc;
- (void)didFinishAuthWithContext:(id)a3 results:(id)a4 error:(id)a5;
- (void)hideBusyUI;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)returnPressedAtEnd;
- (void)setPresentedModally:(BOOL)a3;
- (void)setShouldShowCreateAppleIDButton:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setUsernameEnabled:(BOOL)a3;
- (void)showBusyUI;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PSAppleIDSplashViewController

- (id)serviceName
{
  return 0;
}

- (id)serviceDescription
{
  return 0;
}

- (id)serviceIcon
{
  return 0;
}

- (id)serviceFooter
{
  return 0;
}

- (id)_silhouetteMonogram
{
  v2 = (void *)MEMORY[0x1E4F42A80];
  v3 = PSPreferencesFrameworkBundle();
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  v5 = [v4 traitCollection];
  v6 = [v2 imageNamed:@"PaddedSilhouetteMonogram" inBundle:v3 compatibleWithTraitCollection:v5];
  v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v8 = [v6 imageWithTintColor:v7];

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(RemoteUIController *)self->_remoteUIController setDelegate:0];
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PSAppleIDSplashViewController;
  [(PSListController *)&v5 dealloc];
}

- (id)specifiers
{
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v5 = [(PSAppleIDSplashViewController *)self _specifierForGroupWithiForgotLink];
    [(NSArray *)v4 addObject:v5];

    v6 = [(PSAppleIDSplashViewController *)self _specifierForLoginUserForm];
    userSpecifier = self->_userSpecifier;
    self->_userSpecifier = v6;

    [(NSArray *)v4 addObject:self->_userSpecifier];
    v8 = [(PSAppleIDSplashViewController *)self _specifierForLoginPasswordForm];
    passwordSpecifier = self->_passwordSpecifier;
    self->_passwordSpecifier = v8;

    if (self->_passwordHandler) {
      [(NSArray *)v4 addObject:self->_passwordSpecifier];
    }
    if (!self->_isPresentedModally)
    {
      v10 = [(PSAppleIDSplashViewController *)self _specifiersForSignInButton];
      [(NSArray *)v4 addObjectsFromArray:v10];
    }
    v11 = [(PSAppleIDSplashViewController *)self _specifiersForCreateNewAccount];
    [(NSArray *)v4 addObjectsFromArray:v11];

    v12 = self->super._specifiers;
    self->super._specifiers = v4;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (id)_specifierForLoginUserForm
{
  v3 = +[PSTextFieldSpecifier preferenceSpecifierNamed:&stru_1EFB51FD0 target:self set:sel__setUsername_withSpecifier_ get:sel__usernameForSpecifier_ detail:0 cell:8 edit:0];
  [v3 setKeyboardType:7 autoCaps:0 autoCorrection:1];
  v4 = PS_LocalizedStringForAppleID(@"EXAMPLE_APPLE_ID");
  [v3 setPlaceholder:v4];

  [v3 setProperty:@"PSSpecifierUsername" forKey:@"key"];
  objc_super v5 = [(PSAppleIDSplashViewController *)self _silhouetteMonogram];
  [v3 setProperty:v5 forKey:@"iconImage"];

  [v3 setProperty:*MEMORY[0x1E4F43E18] forKey:@"textContentType"];
  [v3 setIdentifier:@"LOGIN_USER"];
  return v3;
}

- (id)_specifierForLoginPasswordForm
{
  v2 = +[PSTextFieldSpecifier preferenceSpecifierNamed:&stru_1EFB51FD0 target:self set:sel__setPassword_withSpecifier_ get:sel__passwordForSpecifier_ detail:0 cell:8 edit:0];
  [v2 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  [v2 setProperty:@"PSSpecifierPassword" forKey:@"key"];
  [v2 setCellType:12];
  v3 = PS_LocalizedStringForAppleID(@"PASSWORD_FIELD_PLACEHOLDER_REQUIRED");
  [v2 setPlaceholder:v3];

  [v2 setIdentifier:@"LOGIN_PASSWORD"];
  return v2;
}

- (void)_reloadPasswordSpecifier
{
  if (self->_passwordHandler)
  {
    if (![(PSListController *)self containsSpecifier:self->_passwordSpecifier])
    {
      [(PSListController *)self insertSpecifier:self->_passwordSpecifier afterSpecifier:self->_userSpecifier animated:1];
      [(PSSpecifier *)self->_signInButtonSpecifier setProperty:MEMORY[0x1E4F1CC38] forKey:@"enabled"];
      [(PSListController *)self reloadSpecifier:self->_signInButtonSpecifier];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__PSAppleIDSplashViewController__reloadPasswordSpecifier__block_invoke;
      block[3] = &unk_1E5C5D680;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      return;
    }
    if (self->_passwordHandler) {
      return;
    }
  }
  if ([(PSListController *)self containsSpecifier:self->_passwordSpecifier])
  {
    [(PSListController *)self removeSpecifier:self->_passwordSpecifier animated:1];
    [(PSSpecifier *)self->_signInButtonSpecifier setProperty:MEMORY[0x1E4F1CC28] forKey:@"enabled"];
    signInButtonSpecifier = self->_signInButtonSpecifier;
    [(PSListController *)self reloadSpecifier:signInButtonSpecifier];
  }
}

void __57__PSAppleIDSplashViewController__reloadPasswordSpecifier__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1456) propertyForKey:@"cellObject"];
  [v1 becomeFirstResponder];
}

- (id)_specifiersForSignInButton
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  objc_super v5 = [(PSAppleIDSplashViewController *)self serviceFooter];
  [v4 setObject:v5 forKeyedSubscript:@"footerText"];

  [v3 addObject:v4];
  v6 = PS_LocalizedStringForAppleID(@"SIGN_IN_BUTTON");
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];
  signInButtonSpecifier = self->_signInButtonSpecifier;
  self->_signInButtonSpecifier = v7;

  [(PSSpecifier *)self->_signInButtonSpecifier setProperty:MEMORY[0x1E4F1CC28] forKey:@"enabled"];
  [(PSSpecifier *)self->_signInButtonSpecifier setButtonAction:sel__signInButtonWasTapped_];
  [v3 addObject:self->_signInButtonSpecifier];

  return v3;
}

- (id)_specifiersForCreateNewAccount
{
  v3 = [MEMORY[0x1E4F179C8] defaultStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (([MEMORY[0x1E4F42738] isRunningInStoreDemoMode] & 1) != 0
    || [(PSAppleIDSplashViewController *)self _runningInMail])
  {
    if (([MEMORY[0x1E4F42738] isRunningInStoreDemoMode] & 1) == 0
      && [(PSAppleIDSplashViewController *)self _runningInMail]
      && objc_msgSend(v4, "aa_needsEmailConfiguration")
      && _os_feature_enabled_impl())
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = PS_RebrandedKeyForAppleID(@"CREATE_ICLOUD_MAIL_ACCOUNT_EXPLANATION_FOOTER");
      v7 = PS_LocalizedStringForAppleID(v6);

      v8 = PS_LocalizedStringForAppleID(@"CREATE_ICLOUD_MAIL_ACCOUNT_FOOTER_LEARN_MORE_BUTTON");
      v9 = [NSString stringWithFormat:@"%@\n%@", v7, v8];
      v10 = +[PSSpecifier groupSpecifierWithID:@"CREATE_MAIL_ACCOUNT_GROUP"];
      createNewAccountGroupSpecifier = self->_createNewAccountGroupSpecifier;
      self->_createNewAccountGroupSpecifier = v10;

      v12 = self->_createNewAccountGroupSpecifier;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      [(PSSpecifier *)v12 setProperty:v14 forKey:@"footerCellClass"];

      [(PSSpecifier *)self->_createNewAccountGroupSpecifier setProperty:v9 forKey:@"footerText"];
      v15 = self->_createNewAccountGroupSpecifier;
      v64.location = [v9 rangeOfString:v8];
      v16 = NSStringFromRange(v64);
      [(PSSpecifier *)v15 setProperty:v16 forKey:@"footerHyperlinkRange"];

      v17 = self->_createNewAccountGroupSpecifier;
      v18 = PS_LocalizedStringForAppleID(@"CREATE_ICLOUD_MAIL_ACCOUNT_FOOTER_LEARN_MORE_KB_LINK");
      [(PSSpecifier *)v17 setProperty:v18 forKey:@"headerFooterHyperlinkButtonURL"];

      [v5 addObject:self->_createNewAccountGroupSpecifier];
      v19 = PS_LocalizedStringForAppleID(@"CREATE_ICLOUD_MAIL_ACCOUNT_BUTTON");
      v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:13 edit:0];
      createNewAccountButtonSpecifier = self->_createNewAccountButtonSpecifier;
      self->_createNewAccountButtonSpecifier = v20;

      [(PSSpecifier *)self->_createNewAccountButtonSpecifier setButtonAction:sel__createICloudMailButtonWasTapped_];
      [v5 addObject:self->_createNewAccountButtonSpecifier];
    }
    else if (([MEMORY[0x1E4F42738] isRunningInStoreDemoMode] & 1) != 0 {
           || ![(PSAppleIDSplashViewController *)self _runningInMail]
    }
           || (objc_msgSend(v4, "aa_needsEmailConfiguration") & 1) != 0
           || ([v4 isEnabledForDataclass:*MEMORY[0x1E4F175C8]] & 1) != 0
           || !_os_feature_enabled_impl())
    {
      objc_super v5 = 0;
    }
    else
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] array];
      v22 = +[PSSpecifier groupSpecifierWithID:@"ENABLE_MAIL_ACCOUNT_GROUP"];
      v23 = self->_createNewAccountGroupSpecifier;
      self->_createNewAccountGroupSpecifier = v22;

      v24 = self->_createNewAccountGroupSpecifier;
      v25 = PS_LocalizedStringForAppleID(@"ENABLE_ICLOUD_MAIL_ACCOUNT_FOOTER");
      [(PSSpecifier *)v24 setProperty:v25 forKey:@"footerText"];

      [v5 addObject:self->_createNewAccountGroupSpecifier];
      v26 = PS_LocalizedStringForAppleID(@"ENABLE_ICLOUD_MAIL_ACCOUNT_BUTTON");
      v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];
      v28 = self->_createNewAccountButtonSpecifier;
      self->_createNewAccountButtonSpecifier = v27;

      [(PSSpecifier *)self->_createNewAccountButtonSpecifier setProperty:objc_opt_class() forKey:@"cellClass"];
      v29 = self->_createNewAccountButtonSpecifier;
      v30 = objc_msgSend(v4, "aa_childMailAccount");
      v31 = [v30 accountPropertyForKey:@"defaultAddress"];
      [(PSSpecifier *)v29 setProperty:v31 forKey:@"cellSubtitleText"];

      v32 = self->_createNewAccountButtonSpecifier;
      v33 = [MEMORY[0x1E4F428B8] grayColor];
      [(PSSpecifier *)v32 setProperty:v33 forKey:@"cellSubtitleColor"];

      [(PSSpecifier *)self->_createNewAccountButtonSpecifier setButtonAction:sel__enableICloudMailButtonWasTapped_];
      [v5 addObject:self->_createNewAccountButtonSpecifier];
    }
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v34 = (void *)getOBBundleClass_softClass;
    uint64_t v62 = getOBBundleClass_softClass;
    if (!getOBBundleClass_softClass)
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __getOBBundleClass_block_invoke;
      v58[3] = &unk_1E5C5D4D8;
      v58[4] = &v59;
      __getOBBundleClass_block_invoke((uint64_t)v58);
      v34 = (void *)v60[3];
    }
    id v35 = v34;
    _Block_object_dispose(&v59, 8);
    v36 = getOBPrivacyAppleIDIdentifier();
    v57 = [v35 bundleWithIdentifier:v36];

    v37 = [v57 privacyFlow];
    v38 = [v37 localizedButtonCaption];
    v39 = [v37 localizedButtonTitle];
    v40 = [NSString stringWithFormat:@"%@\n%@", v38, v39];
    v41 = +[PSSpecifier groupSpecifierWithID:@"Create"];
    v42 = self->_createNewAccountGroupSpecifier;
    self->_createNewAccountGroupSpecifier = v41;

    v43 = self->_createNewAccountGroupSpecifier;
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    [(PSSpecifier *)v43 setProperty:v45 forKey:@"footerCellClass"];

    [(PSSpecifier *)self->_createNewAccountGroupSpecifier setProperty:v40 forKey:@"footerText"];
    v46 = self->_createNewAccountGroupSpecifier;
    v65.location = [v40 rangeOfString:v39];
    v47 = NSStringFromRange(v65);
    [(PSSpecifier *)v46 setProperty:v47 forKey:@"footerHyperlinkRange"];

    v48 = self->_createNewAccountGroupSpecifier;
    v49 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [(PSSpecifier *)v48 setProperty:v49 forKey:@"footerHyperlinkTarget"];

    v50 = self->_createNewAccountGroupSpecifier;
    v51 = NSStringFromSelector(sel__presentAppleIDPrivacyInformationPane);
    [(PSSpecifier *)v50 setProperty:v51 forKey:@"footerHyperlinkAction"];

    [v5 addObject:self->_createNewAccountGroupSpecifier];
    v52 = PS_RebrandedKeyForAppleID(@"CREATE_ACCOUNT_BUTTON");
    v53 = PS_LocalizedStringForAppleID(v52);
    v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:self set:0 get:0 detail:0 cell:13 edit:0];
    v55 = self->_createNewAccountButtonSpecifier;
    self->_createNewAccountButtonSpecifier = v54;

    [(PSSpecifier *)self->_createNewAccountButtonSpecifier setButtonAction:sel__createNewAppleIDButtonWasTapped_];
    [v5 addObject:self->_createNewAccountButtonSpecifier];
  }
  return v5;
}

- (id)_specifierForGroupWithiForgotLink
{
  v3 = PS_RebrandedKeyForAppleID(@"IFORGOT_BUTTON");
  v4 = PS_LocalizedStringForAppleID(v3);

  id v5 = v4;
  v6 = +[PSSpecifier groupSpecifierWithID:@"iForgot"];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 setProperty:v8 forKey:@"footerCellClass"];

  [v6 setProperty:v5 forKey:@"headerFooterHyperlinkButtonTitle"];
  NSUInteger v9 = [v5 rangeOfString:v5];
  NSUInteger v11 = v10;

  v17.location = v9;
  v17.length = v11;
  v12 = NSStringFromRange(v17);
  [v6 setProperty:v12 forKey:@"footerHyperlinkRange"];

  v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v6 setProperty:v13 forKey:@"footerHyperlinkTarget"];

  v14 = NSStringFromSelector(sel__iForgotButtonWasTapped_);
  [v6 setProperty:v14 forKey:@"footerHyperlinkAction"];

  return v6;
}

- (void)_presentAppleIDPrivacyInformationPane
{
  uint64_t v8 = 0;
  NSUInteger v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getOBPrivacyPresenterClass_softClass_1;
  uint64_t v11 = getOBPrivacyPresenterClass_softClass_1;
  if (!getOBPrivacyPresenterClass_softClass_1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getOBPrivacyPresenterClass_block_invoke_1;
    v7[3] = &unk_1E5C5D4D8;
    v7[4] = &v8;
    __getOBPrivacyPresenterClass_block_invoke_1((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = getOBPrivacyAppleIDIdentifier();
  v6 = [v4 presenterForPrivacySplashWithIdentifier:v5];

  [v6 setPresentingViewController:self];
  [v6 present];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PSAppleIDSplashViewController;
  [(PSListController *)&v15 viewDidLoad];
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v3;

  id v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:self->_spinner];
  spinnerBarItem = self->_spinnerBarItem;
  self->_spinnerBarItem = v5;

  if (self->_isPresentedModally)
  {
    v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonWasTapped_];
    cancelButtonBarItem = self->_cancelButtonBarItem;
    self->_cancelButtonBarItem = v7;

    NSUInteger v9 = [(PSAppleIDSplashViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:self->_cancelButtonBarItem];

    id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
    uint64_t v11 = PS_LocalizedStringForAppleID(@"NEXT_BUTTON");
    v12 = (UIBarButtonItem *)[v10 initWithTitle:v11 style:2 target:self action:sel__signInButtonWasTapped_];
    nextButtonBarItem = self->_nextButtonBarItem;
    self->_nextButtonBarItem = v12;

    v14 = [(PSAppleIDSplashViewController *)self navigationItem];
    [v14 setRightBarButtonItem:self->_nextButtonBarItem];
  }
  self->_isPasswordDirty = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSAppleIDSplashViewController;
  [(PSListController *)&v9 viewWillAppear:a3];
  [(PSAppleIDSplashViewController *)self _updateSignInButton];
  if (!self->_isPresentedModally)
  {
    id v4 = [(PSAppleIDSplashViewController *)self navigationItem];
    id v5 = [v4 title];

    if (!v5)
    {
      v6 = PS_RebrandedKeyForAppleID(@"APPLE_ID_TITLE");
      v7 = PS_LocalizedStringForAppleID(v6);
      uint64_t v8 = [(PSAppleIDSplashViewController *)self navigationItem];
      [v8 setTitle:v7];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (+[PSListController instancesRespondToSelector:sel_traitCollectionDidChange_])
  {
    v5.receiver = self;
    v5.super_class = (Class)PSAppleIDSplashViewController;
    [(PSAppleIDSplashViewController *)&v5 traitCollectionDidChange:v4];
  }
  if ([(PSAppleIDSplashViewController *)self _shouldAnchorCreateAccountButton]) {
    [(UITableView *)self->super._table reloadData];
  }
}

- (BOOL)_shouldAnchorCreateAccountButton
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v4 = (objc_msgSend(v3, "sf_isiPad") & 1) == 0 && self->_createNewAccountButtonSpecifier != 0;

  return v4;
}

- (double)_heightForCreateNewAccountSpecifierWithWidth:(double)a3
{
  BOOL v4 = [(PSSpecifier *)self->_createNewAccountButtonSpecifier propertyForKey:@"cellObject"];
  v7 = v4;
  if (v4)
  {
    LODWORD(v5) = 1148846080;
    LODWORD(v6) = 1112014848;
    objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x1E4F43B90] + 8), v5, v6);
    double v9 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F43D20];
  }

  return v9;
}

- (double)_heightForCreateNewAccountFooterWithWidth:(double)a3
{
  BOOL v4 = [[PSFooterHyperlinkView alloc] initWithSpecifier:self->_createNewAccountGroupSpecifier];
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[PSFooterHyperlinkView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x1E4F43B90] + 8), v5, v6);
  double v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PSAppleIDSplashViewController;
  [(PSListController *)&v37 tableView:v6 heightForHeaderInSection:a4];
  double v8 = v7;
  if ([(PSAppleIDSplashViewController *)self _shouldAnchorCreateAccountButton])
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    [(PSListController *)self getGroup:&v36 row:&v35 ofSpecifier:self->_createNewAccountButtonSpecifier];
    if (a4 >= 1 && v36 == a4)
    {
      [v6 rectForSection:a4 - 1];
      double MaxY = CGRectGetMaxY(v38);
      id v10 = [(PSAppleIDSplashViewController *)self view];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      v19 = [(PSAppleIDSplashViewController *)self view];
      [v19 safeAreaInsets];
      CGFloat v21 = v12 + v20;
      CGFloat v23 = v14 + v22;
      CGFloat v25 = v16 - (v20 + v24);
      CGFloat v27 = v18 - (v22 + v26);

      v39.origin.x = v21;
      v39.origin.y = v23;
      v39.size.width = v25;
      v39.size.height = v27;
      double Width = CGRectGetWidth(v39);
      v40.origin.x = v21;
      v40.origin.y = v23;
      v40.size.width = v25;
      v40.size.height = v27;
      double Height = CGRectGetHeight(v40);
      [(PSAppleIDSplashViewController *)self _heightForCreateNewAccountSpecifierWithWidth:Width];
      double v31 = v30;
      [(PSAppleIDSplashViewController *)self _heightForCreateNewAccountFooterWithWidth:Width];
      double v33 = Height - MaxY - v31 - v32 + -20.0;
      if (v33 >= 0.0) {
        double v8 = v33;
      }
      else {
        double v8 = 0.0;
      }
    }
  }

  return v8;
}

- (id)_usernameForSpecifier:(id)a3
{
  return self->_username;
}

- (void)_setUsername:(id)a3 withSpecifier:(id)a4
{
  objc_storeStrong((id *)&self->_username, a3);
  id v6 = a3;
  password = self->_password;
  self->_password = 0;

  [(PSAppleIDSplashViewController *)self _cancelPasswordDelegateIfNecessary];
  [(PSAppleIDSplashViewController *)self _reloadPasswordSpecifier];
}

- (id)_passwordForSpecifier:(id)a3
{
  return self->_password;
}

- (void)_setPassword:(id)a3 withSpecifier:(id)a4
{
  self->_isPasswordDirty = 1;
  objc_storeStrong((id *)&self->_password, a3);
}

- (void)_signInWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  passwordHandler = (void (**)(id, id, void))self->_passwordHandler;
  if (passwordHandler)
  {
    passwordHandler[2](passwordHandler, v7, 0);
    id v9 = self->_passwordHandler;
    self->_passwordHandler = 0;
  }
  else
  {
    id v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "User asked to sign. Calling out to AuthKit...", buf, 2u);
    }

    id v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
    [v11 _setPasswordDelegate:self];
    [v11 setPresentingViewController:self];
    [v11 setAuthenticationType:0];
    [v11 setIsUsernameEditable:1];
    [v11 setShouldUpdatePersistentServiceTokens:1];
    [v11 setFirstTimeLogin:1];
    if (v6)
    {
      [v11 setUsername:v6];
      [v11 setIsUsernameEditable:0];
    }
    if (v7) {
      [v11 _setPassword:v7];
    }
    [(PSAppleIDSplashViewController *)self willBeginAuthWithContext:v11];
    double v12 = dispatch_get_global_queue(25, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke;
    v14[3] = &unk_1E5C5DDD0;
    v14[4] = self;
    id v15 = v11;
    id v13 = v11;
    dispatch_async(v12, v14);
  }
}

void __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) authenticationController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke_2;
  v4[3] = &unk_1E5C5DDA8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 authenticateWithContext:v5 completion:v4];
}

uint64_t __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didFinishAuthWithContext:*(void *)(a1 + 40) results:a2 error:a3];
}

- (void)didFinishAuthWithContext:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = _PSLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_DEFAULT, "No dice with auth: %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_147;
    v13[3] = &unk_1E5C5DDF8;
    v13[4] = self;
    double v12 = &v14;
    id v14 = v9;
    id v15 = v10;
    id v16 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke;
    block[3] = &unk_1E5C5DDD0;
    block[4] = self;
    double v12 = &v18;
    id v18 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAuthCompletionWithResults:*(void *)(a1 + 40)];
}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_147(uint64_t a1)
{
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_2;
  v22[3] = &unk_1E5C5DE20;
  v22[4] = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1AD0BE2A0](v22);
  v3 = *(void **)(a1 + 40);
  BOOL v4 = getAKAuthenticationNewAppleIDSetupInfoKey();
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = (void *)v5;
  id v7 = [*(id *)(a1 + 48) domain];
  id v8 = getAKAppleIDAuthenticationErrorDomain();
  if (![v7 isEqualToString:v8])
  {

LABEL_8:
LABEL_9:
    if ([*(id *)(a1 + 56) needsCredentialRecovery])
    {
      id v15 = [*(id *)(a1 + 48) domain];
      id v16 = getAKAppleIDAuthenticationErrorDomain();
      if ([v15 isEqualToString:v16])
      {
        uint64_t v17 = [*(id *)(a1 + 48) code];

        if (v17 == -7017)
        {
          [*(id *)(a1 + 32) hideBusyUI];
          [*(id *)(a1 + 32) _openWebBasedCredentialRecoveryFlow];
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    if ([*(id *)(a1 + 56) needsNewAppleID])
    {
      id v18 = [*(id *)(a1 + 48) domain];
      v19 = getAKAppleIDAuthenticationErrorDomain();
      if ([v18 isEqualToString:v19])
      {
        uint64_t v20 = [*(id *)(a1 + 48) code];

        if (v20 == -7016)
        {
          [*(id *)(a1 + 32) createNewAppleIDWithCompletion:v2];
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    [*(id *)(a1 + 32) hideBusyUI];
    goto LABEL_20;
  }
  uint64_t v9 = [*(id *)(a1 + 48) code];

  if (v9 != -7043) {
    goto LABEL_9;
  }
  id v10 = _PSLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "AuthKit wants us to start the U-13 flow.", v21, 2u);
  }

  double v12 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v13 = getAKAuthenticationNewAppleIDSetupInfoKey();
  id v14 = [v11 objectForKey:v13];
  [v12 _beginiCloudCreationFlowWithContinuationData:v14 completion:v2];

LABEL_20:
}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_3;
  v14[3] = &unk_1E5C5DDF8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) hideBusyUI];
    v2 = (void *)MEMORY[0x1E4F42728];
    v3 = PS_RebrandedKeyForAppleID(@"CREATE_ACCOUNT_FAILED_TITLE");
    BOOL v4 = PS_LocalizedStringForAppleID(v3);
    uint64_t v5 = [*(id *)(a1 + 32) localizedDescription];
    id v11 = [v2 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

    id v6 = (void *)MEMORY[0x1E4F42720];
    id v7 = PS_LocalizedStringForAppleID(@"OK_BUTTON");
    id v8 = [v6 actionWithTitle:v7 style:1 handler:0];
    [v11 addAction:v8];

    [*(id *)(a1 + 40) presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    if (*(void *)(a1 + 48))
    {
      objc_msgSend(v9, "_signInWithUsername:password:");
    }
    else
    {
      [v9 hideBusyUI];
      uint64_t v10 = _PSLoggingFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "PSAppleIDSplashViewController: missing password for Apple ID creation!", buf, 2u);
      }
    }
  }
}

- (void)_beginiCloudCreationFlowWithContinuationData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PSAppleIDSplashViewController__beginiCloudCreationFlowWithContinuationData_completion___block_invoke;
  block[3] = &unk_1E5C5DE48;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__PSAppleIDSplashViewController__beginiCloudCreationFlowWithContinuationData_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = 0;
  double v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v2 = (void *)getAADeviceInfoClass_softClass;
  uint64_t v35 = getAADeviceInfoClass_softClass;
  if (!getAADeviceInfoClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getAADeviceInfoClass_block_invoke;
    double v30 = &unk_1E5C5D4D8;
    double v31 = &v32;
    __getAADeviceInfoClass_block_invoke((uint64_t)&v27);
    v2 = (void *)v33[3];
  }
  v3 = v2;
  _Block_object_dispose(&v32, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v32 = 0;
  double v33 = &v32;
  uint64_t v34 = 0x2050000000;
  id v6 = (void *)getAAURLConfigurationClass_softClass;
  uint64_t v35 = getAAURLConfigurationClass_softClass;
  if (!getAAURLConfigurationClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getAAURLConfigurationClass_block_invoke;
    double v30 = &unk_1E5C5D4D8;
    double v31 = &v32;
    __getAAURLConfigurationClass_block_invoke((uint64_t)&v27);
    id v6 = (void *)v33[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v32, 8);
  id v8 = [v7 urlConfiguration];
  id v9 = [v8 repairCloudAccountUIURL];
  uint64_t v10 = [v5 URLWithString:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v10 cachePolicy:1 timeoutInterval:30.0];
  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  [v11 setValue:*(void *)(a1 + 32) forHTTPHeaderField:@"X-Apple-AK-Continuation-Data"];
  id v12 = [v4 clientInfoHeader];
  [v11 setValue:v12 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v14 = [v13 objectForKey:*MEMORY[0x1E4F1C400]];
  id v15 = [v14 uppercaseString];
  [v11 setValue:v15 forHTTPHeaderField:@"X-MMe-Country"];

  uint64_t v32 = 0;
  double v33 = &v32;
  uint64_t v34 = 0x2050000000;
  uint64_t v16 = (void *)getRemoteUIControllerClass_softClass;
  uint64_t v35 = getRemoteUIControllerClass_softClass;
  if (!getRemoteUIControllerClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getRemoteUIControllerClass_block_invoke;
    double v30 = &unk_1E5C5D4D8;
    double v31 = &v32;
    __getRemoteUIControllerClass_block_invoke((uint64_t)&v27);
    uint64_t v16 = (void *)v33[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v32, 8);
  id v18 = objc_alloc_init(v17);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void **)(v19 + 1520);
  *(void *)(v19 + 1520) = v18;

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1520), "setDelegate:");
  uint64_t v21 = *(void **)(a1 + 40);
  double v22 = (void *)v21[190];
  CGFloat v23 = [v21 navigationController];
  [v22 setNavigationController:v23];

  uint64_t v24 = [*(id *)(a1 + 48) copy];
  uint64_t v25 = *(void *)(a1 + 40);
  double v26 = *(void **)(v25 + 1528);
  *(void *)(v25 + 1528) = v24;

  [*(id *)(*(void *)(a1 + 40) + 1520) loadRequest:v11 completion:0];
}

- (void)createNewAppleIDWithCompletion:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"This feature is not supported yet.";
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = [v4 errorWithDomain:v5 code:0 userInfo:v8];
  (*((void (**)(id, void, void, void *))a3 + 2))(v7, 0, 0, v9);
}

- (void)_openWebBasedCredentialRecoveryFlow
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://iforgot.apple.com"];
  [v3 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)_textFieldValueDidChange:(id)a3
{
  if ([(NSArray *)self->super._specifiers count])
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0x1E5C5C000uLL;
    do
    {
      id v6 = [(NSArray *)self->super._specifiers objectAtIndex:v4];
      id v7 = [(PSListController *)self indexPathForIndex:v4];
      id v8 = [(UITableView *)self->super._table cellForRowAtIndexPath:v7];
      int v9 = [v8 isEditing];

      if (v9)
      {
        uint64_t v10 = [(UITableView *)self->super._table cellForRowAtIndexPath:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v11 = v5;
          id v12 = [v6 propertyForKey:@"key"];
          id v13 = [v10 textField];
          id v14 = [v13 text];

          if ([v12 isEqualToString:@"PSSpecifierPassword"])
          {
            [(PSAppleIDSplashViewController *)self _setPassword:v14 withSpecifier:v6];
          }
          else if ([v12 isEqualToString:@"PSSpecifierUsername"])
          {
            [(PSAppleIDSplashViewController *)self _setUsername:v14 withSpecifier:v6];
          }

          unint64_t v5 = v11;
        }
      }
      ++v4;
    }
    while ([(NSArray *)self->super._specifiers count] > v4);
  }
  [(PSAppleIDSplashViewController *)self _updateSignInButton];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PSAppleIDSplashViewController;
  id v8 = [(PSListController *)&v24 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  int v9 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
  uint64_t v10 = [v9 propertyForKey:@"key"];
  if ([v10 isEqualToString:@"PSSpecifierPassword"])
  {
    unint64_t v11 = PS_LocalizedStringForAppleID(@"PASSWORD_LABEL");
    [v8 setAccessibilityLabel:v11];
LABEL_6:

    goto LABEL_7;
  }
  if ([v10 isEqualToString:@"PSSpecifierUsername"])
  {
    unint64_t v11 = PS_RebrandedKeyForAppleID(@"APPLE_ID_LABEL");
    id v12 = PS_LocalizedStringForAppleID(v11);
    [v8 setAccessibilityLabel:v12];

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v8, "setSeparatorInset:", 0.0, 70.0, 0.0, 0.0);
  id v13 = [v8 textField];
  if (v13)
  {
    id v14 = (uint64_t *)MEMORY[0x1E4F43E28];
    if (self->_textFieldTextDidChangeObserver)
    {
      id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 removeObserver:self->_textFieldTextDidChangeObserver name:*v14 object:v13];
    }
    objc_initWeak(&location, self);
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *v14;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__PSAppleIDSplashViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v21[3] = &unk_1E5C5DE70;
    objc_copyWeak(&v22, &location);
    id v18 = [v16 addObserverForName:v17 object:v13 queue:0 usingBlock:v21];
    id textFieldTextDidChangeObserver = self->_textFieldTextDidChangeObserver;
    self->_id textFieldTextDidChangeObserver = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

LABEL_12:
  return v8;
}

void __65__PSAppleIDSplashViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _textFieldValueDidChange:v3];
}

- (void)_updateSignInButton
{
  NSUInteger v3 = [(NSString *)self->_username length];
  if (self->_isPresentedModally)
  {
    BOOL v4 = v3 != 0;
    id v6 = [(PSAppleIDSplashViewController *)self navigationItem];
    unint64_t v5 = [v6 rightBarButtonItem];
    [v5 setEnabled:v4];
  }
}

- (void)showBusyUI
{
  [(PSSpecifier *)self->_createNewAccountButtonSpecifier setProperty:MEMORY[0x1E4F1CC28] forKey:@"enabled"];
  [(PSListController *)self reloadSpecifier:self->_createNewAccountButtonSpecifier];
  NSUInteger v3 = [(PSAppleIDSplashViewController *)self navigationItem];
  BOOL v4 = PS_LocalizedStringForAppleID(@"VERIFYING_TITLE");
  [v3 setTitle:v4];

  LODWORD(v4) = self->_isPresentedModally;
  unint64_t v5 = [(PSAppleIDSplashViewController *)self navigationItem];
  id v6 = v5;
  if (v4) {
    [v5 setLeftBarButtonItem:0 animated:1];
  }
  else {
    [v5 setHidesBackButton:1 animated:1];
  }

  id v7 = [(PSAppleIDSplashViewController *)self navigationItem];
  [v7 setRightBarButtonItem:self->_spinnerBarItem animated:1];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  [(PSAppleIDSplashViewController *)self _setInteractionEnabled:0];
}

- (void)hideBusyUI
{
  [(PSSpecifier *)self->_createNewAccountButtonSpecifier setProperty:MEMORY[0x1E4F1CC38] forKey:@"enabled"];
  [(PSListController *)self reloadSpecifier:self->_createNewAccountButtonSpecifier];
  NSUInteger v3 = [(PSAppleIDSplashViewController *)self navigationItem];
  BOOL v4 = [(PSAppleIDSplashViewController *)self serviceName];
  [v3 setTitle:v4];

  LODWORD(v4) = self->_isPresentedModally;
  unint64_t v5 = [(PSAppleIDSplashViewController *)self navigationItem];
  id v6 = v5;
  if (v4) {
    [v5 setLeftBarButtonItem:self->_cancelButtonBarItem animated:1];
  }
  else {
    [v5 setHidesBackButton:0 animated:1];
  }

  id v7 = [(PSAppleIDSplashViewController *)self navigationItem];
  [v7 setRightBarButtonItem:self->_nextButtonBarItem animated:1];

  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(PSAppleIDSplashViewController *)self _setInteractionEnabled:1];
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
  [(PSAppleIDSplashViewController *)self _updateSignInButton];
  [(PSAppleIDSplashViewController *)self _cancelPasswordDelegateIfNecessary];
  [(PSAppleIDSplashViewController *)self _reloadPasswordSpecifier];
}

- (void)setUsernameEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PSListController *)self specifierForID:@"PSSpecifierUsername"];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v5 setProperty:v4 forKey:@"enabled"];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSAppleIDSplashViewController;
  -[PSAppleIDSplashViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(PSAppleIDSplashViewController *)self _setInteractionEnabled:1];
  }
}

- (void)_setInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PSAppleIDSplashViewController *)self view];
  [v5 setUserInteractionEnabled:v3];

  id v8 = [(PSAppleIDSplashViewController *)self splitViewController];
  id v6 = [v8 masterViewController];
  id v7 = [v6 view];
  [v7 setUserInteractionEnabled:v3];
}

- (void)_iForgotButtonWasTapped:(id)a3
{
  id v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
  [v4 setUsername:self->_username];
  [v4 setNeedsCredentialRecovery:1];
  [v4 setPresentingViewController:self];
  [(PSAppleIDSplashViewController *)self willBeginAuthWithContext:v4];
  objc_super v5 = [(PSAppleIDSplashViewController *)self authenticationController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PSAppleIDSplashViewController__iForgotButtonWasTapped___block_invoke;
  v7[3] = &unk_1E5C5DDA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 authenticateWithContext:v6 completion:v7];
}

uint64_t __57__PSAppleIDSplashViewController__iForgotButtonWasTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didFinishAuthWithContext:*(void *)(a1 + 40) results:a2 error:a3];
}

- (void)_createNewAppleIDButtonWasTapped:(id)a3
{
  id v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
  [v4 setNeedsNewAppleID:1];
  [v4 setPresentingViewController:self];
  [(PSAppleIDSplashViewController *)self willBeginAuthWithContext:v4];
  objc_super v5 = [(PSAppleIDSplashViewController *)self authenticationController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PSAppleIDSplashViewController__createNewAppleIDButtonWasTapped___block_invoke;
  v7[3] = &unk_1E5C5DDA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 authenticateWithContext:v6 completion:v7];
}

uint64_t __66__PSAppleIDSplashViewController__createNewAppleIDButtonWasTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didFinishAuthWithContext:*(void *)(a1 + 40) results:a2 error:a3];
}

- (void)_createICloudMailButtonWasTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F179C8] defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v7 = (void *)getiCloudMailAccountProviderClass_softClass;
  uint64_t v17 = getiCloudMailAccountProviderClass_softClass;
  if (!getiCloudMailAccountProviderClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getiCloudMailAccountProviderClass_block_invoke;
    v13[3] = &unk_1E5C5D4D8;
    v13[4] = &v14;
    __getiCloudMailAccountProviderClass_block_invoke((uint64_t)v13);
    id v7 = (void *)v15[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);
  int v9 = (void *)[[v8 alloc] initWithAccountStore:v5 appleAccount:v6 presenter:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __66__PSAppleIDSplashViewController__createICloudMailButtonWasTapped___block_invoke;
  v11[3] = &unk_1E5C5DDD0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 presentWithAlert:0 completionHandler:v11];
}

uint64_t __66__PSAppleIDSplashViewController__createICloudMailButtonWasTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteCreateiCloudMailAccount:*(void *)(a1 + 40)];
}

- (void)_enableICloudMailButtonWasTapped:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F179C8], "defaultStore", a3);
  objc_super v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  [v5 setEnabled:1 forDataclass:*MEMORY[0x1E4F175C8]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke;
  v7[3] = &unk_1E5C5DE98;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v4 saveAccount:v6 withDataclassActions:0 doVerify:0 completion:v7];
}

void __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke_2;
    v3[3] = &unk_1E5C5DDD0;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

uint64_t __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteCreateiCloudMailAccount:*(void *)(a1 + 40)];
}

- (void)returnPressedAtEnd
{
}

- (void)_cancelButtonWasTapped:(id)a3
{
  id v3 = [(PSAppleIDSplashViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_signInButtonWasTapped:(id)a3
{
  id v4 = [(UITableView *)self->super._table firstResponder];
  [v4 resignFirstResponder];

  [(PSAppleIDSplashViewController *)self showBusyUI];
  username = self->_username;
  password = self->_password;
  [(PSAppleIDSplashViewController *)self _signInWithUsername:username password:password];
}

- (void)_presentInvalidUsernameAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = PS_RebrandedKeyForAppleID(@"INVALID_USERNAME_TITLE");
  objc_super v5 = PS_LocalizedStringForAppleID(v4);
  id v6 = PS_RebrandedKeyForAppleID(@"INVALID_USERNAME_MESSAGE");
  id v7 = PS_LocalizedStringForAppleID(v6);
  id v14 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v8 = (void *)MEMORY[0x1E4F42720];
  int v9 = PS_LocalizedStringForAppleID(@"OK_BUTTON");
  id v10 = [v8 actionWithTitle:v9 style:0 handler:0];
  [v14 addAction:v10];

  unint64_t v11 = (void *)MEMORY[0x1E4F42720];
  id v12 = PS_LocalizedStringForAppleID(@"LEARN_MORE_BUTTON");
  id v13 = [v11 actionWithTitle:v12 style:1 handler:&__block_literal_global_10];
  [v14 addAction:v13];

  [(PSAppleIDSplashViewController *)self presentViewController:v14 animated:1 completion:0];
}

void __61__PSAppleIDSplashViewController__presentInvalidUsernameAlert__block_invoke()
{
  id v1 = [MEMORY[0x1E4F42738] sharedApplication];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.me.com/findmyiphone/account"];
  [v1 openURL:v0 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (AKAppleIDAuthenticationController)authenticationController
{
  authController = self->_authController;
  if (!authController)
  {
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    uint64_t v13 = getAKAppleIDAuthenticationControllerClass_softClass;
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
      v9[3] = &unk_1E5C5D4D8;
      v9[4] = &v10;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    objc_super v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (AKAppleIDAuthenticationController *)objc_alloc_init(v5);
    id v7 = self->_authController;
    self->_authController = v6;

    authController = self->_authController;
  }
  return authController;
}

- (BOOL)_runningInMail
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilemail"];

  return v4;
}

- (BOOL)_shouldShowCancelDone
{
  return self->_isPresentedModally;
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id remoteUICompletion = self->_remoteUICompletion;
  if (remoteUICompletion)
  {
    (*((void (**)(id, void, void, void))remoteUICompletion + 2))(remoteUICompletion, 0, 0, 0);
    id v5 = self->_remoteUICompletion;
    self->_id remoteUICompletion = 0;
  }
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    [(PSAppleIDSplashViewController *)self hideBusyUI];
    id v6 = (void *)MEMORY[0x1AD0BE2A0](v5);

    id passwordHandler = self->_passwordHandler;
    self->_id passwordHandler = v6;

    [(PSAppleIDSplashViewController *)self _reloadPasswordSpecifier];
  }
}

- (void)_cancelPasswordDelegateIfNecessary
{
  id passwordHandler = (void (**)(id, void, void *))self->_passwordHandler;
  if (passwordHandler)
  {
    char v4 = (void *)MEMORY[0x1E4F28C58];
    id v5 = getAKAppleIDAuthenticationErrorDomain();
    id v6 = [v4 errorWithDomain:v5 code:-7003 userInfo:0];
    passwordHandler[2](passwordHandler, 0, v6);

    id v7 = self->_passwordHandler;
    self->_id passwordHandler = 0;

    password = self->_password;
    self->_password = 0;
  }
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (BOOL)shouldShowCreateAppleIDButton
{
  return self->_shouldShowCreateAppleIDButton;
}

- (void)setShouldShowCreateAppleIDButton:(BOOL)a3
{
  self->_shouldShowCreateAppleIDButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteUICompletion, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_idleJiggleTimer, 0);
  objc_storeStrong(&self->_textFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_signInButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_createNewAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_createNewAccountButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_cancelButtonBarItem, 0);
  objc_storeStrong((id *)&self->_nextButtonBarItem, 0);
  objc_storeStrong((id *)&self->_spinnerBarItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_authController, 0);
}

@end