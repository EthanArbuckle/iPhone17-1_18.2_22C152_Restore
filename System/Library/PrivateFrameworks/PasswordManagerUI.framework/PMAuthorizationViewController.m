@interface PMAuthorizationViewController
- (ASAuthorizationViewControllerDelegate)delegate;
- (BOOL)_shouldPresentCABLEAsInitialViewControllerForRequestTypes:(unint64_t)a3 shouldAllowSecurityKeysFromCABLEView:(BOOL)a4;
- (PMAuthorizationViewController)initWithPresentationContext:(id)a3 activity:(id)a4;
- (id)_cableClientViewControllerWithLoginChoice:(id)a3;
- (id)_cancelBarButtonItem;
- (id)_initialViewControllerForPresentationContext:(id)a3;
- (id)_initialViewControllerForPresentationContext:(id)a3 expandingOtherLoginChoices:(BOOL)a4;
- (id)_securityKeyRequestViewController;
- (id)_securityKeyRequestViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4;
- (id)_setUpContainerViewControllerWithCredentialRequestViewController:(id)a3;
- (id)_setUpInitialViewController;
- (id)_signInBarButtonItem;
- (id)navigationController;
- (int64_t)modalPresentationStyle;
- (void)_cancelButtonSelected:(id)a3;
- (void)_enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice:(id)a3;
- (void)_enableBluetoothAndShowCABLEConnectingViewController;
- (void)_presentManualPasswordEntryInterface;
- (void)_presentPINEntryInterface;
- (void)_pushActivateSecurityKeyAgainViewController;
- (void)_pushCABLEAuthenticatingViewController;
- (void)_pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext:(id)a3;
- (void)_pushCABLEClientViewControllerForCABLELoginChoice:(id)a3;
- (void)_pushCABLEConnectingViewController;
- (void)_pushSecurityKeyViewController;
- (void)_pushSecurityKeyViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4;
- (void)_replaceRequestPaneViewControllerWithExpandedLoginChoiceList:(BOOL)a3;
- (void)_showCABLEAuthenticatorError:(id)a3;
- (void)_showEnableBluetoothViewControllerForCABLEAuthenticator;
- (void)_showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:(id)a3;
- (void)_startCABLEAuthenticator;
- (void)_startCABLEAuthenticatorOnInitialPresentationIfNeeded;
- (void)_startCABLEClientForSingleLoginChoiceIfNeeded;
- (void)_startCABLEClientWithLoginChoice:(id)a3;
- (void)_updateOrPushPlatformKeyViewControllerWithSubtitle:(id)a3;
- (void)passwordAuthenticationViewController:(id)a3 completedWithManuallyEnteredPasswordCredential:(id)a4;
- (void)passwordAuthenticationViewController:(id)a3 completedWithUserEnteredPIN:(id)a4;
- (void)performConditionalRegistrationIfPossible;
- (void)presentPINEntryInterface;
- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3;
- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3 overrideUserVisibleErrorMessage:(id)a4;
- (void)requestPaneViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6;
- (void)requestPaneViewController:(id)a3 dismissWithCredential:(id)a4 error:(id)a5;
- (void)requestPaneViewControllerNeedsReload:(id)a3;
- (void)requestPaneViewControllerPresentExpandedLoginChoiceInterface:(id)a3;
- (void)requestPaneViewControllerStartCABLEAuthentication:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateInterfaceWithLoginChoices:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMAuthorizationViewController

- (PMAuthorizationViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PMAuthorizationViewController;
  v9 = [(PMAuthorizationViewController *)&v24 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    p_presentationContext = (id *)&v9->_presentationContext;
    objc_storeStrong((id *)&v9->_presentationContext, a3);
    objc_storeStrong((id *)&v10->_authorizationActivity, a4);
    v12 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x263F6C2E8]);
    wirelessSettingsController = v10->_wirelessSettingsController;
    v10->_wirelessSettingsController = v12;

    v10->_BOOL biometricsEnabled = [MEMORY[0x263F29440] isBiometricAuthenticationAvailable];
    v14 = [MEMORY[0x263F662C8] sharedMonitor];
    if ([v14 isKeychainSyncEnabled])
    {
      uint64_t v15 = [*p_presentationContext iCloudKeychainPasskeyLoginChoiceCount];

      if (v15)
      {
        int v16 = 0;
        BOOL v17 = [*p_presentationContext externalPasskeyLoginChoiceCount] != 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
    BOOL v17 = 0;
    int v16 = 1;
LABEL_7:
    v10->_BOOL hasInternalAndExternalPasskeyLoginChoices = v17;
    if ((([*p_presentationContext hasPlatformCredentialRequest] & 1) != 0
       || ([*p_presentationContext requestTypes] & 0x40) != 0)
      && (v10->_biometricsEnabled || v16 && [*p_presentationContext externalPasskeyLoginChoiceCount]))
    {
      BOOL hasInternalAndExternalPasskeyLoginChoices = v10->_hasInternalAndExternalPasskeyLoginChoices;
      p_includePasskeySymbolInTitleView = &v10->_includePasskeySymbolInTitleView;
      v10->_includePasskeySymbolInTitleView = !hasInternalAndExternalPasskeyLoginChoices;
      if (!hasInternalAndExternalPasskeyLoginChoices)
      {
        BOOL biometricsEnabled = 1;
LABEL_18:
        BOOL *p_includePasskeySymbolInTitleView = biometricsEnabled;
        v21 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
        v10->_forceLegacySignInSheet = objc_msgSend(v21, "safari_BOOLForKey:defaultValue:", @"forceLegacySignInSheet", 0);

        v22 = v10;
        goto LABEL_19;
      }
    }
    else
    {
      p_includePasskeySymbolInTitleView = &v10->_includePasskeySymbolInTitleView;
      v10->_includePasskeySymbolInTitleView = 0;
    }
    if ([*p_presentationContext _passkeyURLType]) {
      BOOL biometricsEnabled = v10->_biometricsEnabled;
    }
    else {
      BOOL biometricsEnabled = 0;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(ASCAuthorizationPresentationContext *)self->_presentationContext updateLoginChoices:v4];
    v5 = [(ASNavigationController *)self->_navigationController topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 reloadLoginChoices];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_9;
      block[3] = &unk_265439F78;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global);
  }
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_cold_1();
  }
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_9(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _initialViewControllerForPresentationContext:*(void *)(*(void *)(a1 + 32) + 976) expandingOtherLoginChoices:1];
  v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v2)
  {
    [v2 setDelegate:v4];
    [*(id *)(*(void *)(a1 + 32) + 984) pushViewController:v3 animated:1];
    v6[0] = v3;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [*(id *)(*(void *)(a1 + 32) + 984) setViewControllers:v5];
  }
  else
  {
    os_activity_apply(*(os_activity_t *)(v4 + 992), &__block_literal_global_11);
  }
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2_cold_1();
  }
}

- (void)presentPINEntryInterface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController_presentPINEntryInterface__block_invoke;
  block[3] = &unk_265439F78;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__PMAuthorizationViewController_presentPINEntryInterface__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentPINEntryInterface];
}

- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3
{
}

- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3 overrideUserVisibleErrorMessage:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke;
  aBlock[3] = &unk_265439FC8;
  aBlock[4] = self;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_3;
  v13[3] = &unk_265439F78;
  v13[4] = self;
  id v8 = (void (**)(void))_Block_copy(v13);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_5;
  v12[3] = &unk_265439FC8;
  v12[4] = self;
  v9 = _Block_copy(v12);
  v10 = (void (**)(void, void))v9;
  switch(a3)
  {
    case 4:
      v11 = descriptionForErrorCode();
      v7[2](v7, v11);
      goto LABEL_4;
    case 5:
      v8[2](v8);
      break;
    case 6:
    case 7:
    case 13:
      v11 = descriptionForErrorCode();
      ((void (**)(void, void *))v10)[2](v10, v11);
LABEL_4:

      break;
    case 16:
      (*((void (**)(void *, id))v9 + 2))(v9, v6);
      break;
    default:
      break;
  }
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_2;
  v5[3] = &unk_265439FA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushSecurityKeyViewControllerWithOverrideSubtitle:*(void *)(a1 + 40) overrideTitle:0];
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_4;
  block[3] = &unk_265439F78;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_4(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 976) overrideNoCredentialsErrorTitle];
  if (![v8 length])
  {
    uint64_t v2 = _WBSLocalizedString();

    id v8 = (id)v2;
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 976) overrideNoCredentialsErrorMessage];
  if (![v3 length])
  {
    id v4 = NSString;
    v5 = _WBSLocalizedString();
    id v6 = [*(id *)(*(void *)(a1 + 32) + 976) serviceName];
    uint64_t v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

    id v3 = (void *)v7;
  }
  [*(id *)(a1 + 32) _pushSecurityKeyViewControllerWithOverrideSubtitle:v3 overrideTitle:v8];
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_6;
  v5[3] = &unk_265439FA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOrPushPlatformKeyViewControllerWithSubtitle:*(void *)(a1 + 40)];
}

- (id)navigationController
{
  return self->_navigationController;
}

- (void)performConditionalRegistrationIfPossible
{
  id v3 = [(PMAuthorizationViewController *)self _initialViewControllerForPresentationContext:self->_presentationContext];
  conditionalRegistrationViewController = self->_conditionalRegistrationViewController;
  self->_conditionalRegistrationViewController = v3;

  [(ASCredentialPickerViewControllerProtocol *)self->_conditionalRegistrationViewController setDelegate:self];
  v5 = self->_conditionalRegistrationViewController;

  [(ASCredentialPickerViewControllerProtocol *)v5 performConditionalRegistrationIfPossible];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = objc_opt_class();
    _os_log_impl(&dword_258906000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will appear", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)PMAuthorizationViewController;
  [(PMAuthorizationViewController *)&v10 viewWillAppear:v3];
  if ([(PMAuthorizationViewController *)self isBeingPresented])
  {
    uint64_t v7 = [(PMAuthorizationViewController *)self _setUpInitialViewController];
    if (v7)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __48__PMAuthorizationViewController_viewWillAppear___block_invoke;
      v9[3] = &unk_265439F78;
      v9[4] = self;
      [(PMAuthorizationViewController *)self presentViewController:v7 animated:1 completion:v9];
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[PMAuthorizationViewController viewWillAppear:]();
    }
  }
}

uint64_t __48__PMAuthorizationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1032));
  [WeakRetained authorizationViewControllerDidCompleteInitialPresentation:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _startCABLEClientForSingleLoginChoiceIfNeeded];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 _startCABLEAuthenticatorOnInitialPresentationIfNeeded];
}

- (id)_signInBarButtonItem
{
  v22[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = [MEMORY[0x263F81708] systemFontOfSize:20.0 weight:*MEMORY[0x263F81840]];
  [v4 setFont:v5];

  id v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext overrideHeader];

  presentationContext = self->_presentationContext;
  if (v6)
  {
    uint64_t v8 = [(ASCAuthorizationPresentationContext *)presentationContext overrideHeader];
  }
  else
  {
    if ([(ASCAuthorizationPresentationContext *)presentationContext requestTypes] == 2) {
      [MEMORY[0x263F662A0] isAppleAccountBrandingEnabled];
    }
    uint64_t v8 = _WBSLocalizedString();
  }
  v9 = (void *)v8;
  [v4 setText:v8];

  if (self->_includePasskeySymbolInTitleView)
  {
    id v10 = objc_alloc(MEMORY[0x263F82828]);
    v11 = (void *)MEMORY[0x263F827E8];
    uint64_t v12 = [MEMORY[0x263F82818] configurationWithPointSize:7 weight:1 scale:20.0];
    uint64_t v13 = [v11 systemImageNamed:@"person.badge.key.fill" withConfiguration:v12];
    v14 = [MEMORY[0x263F825C8] labelColor];
    uint64_t v15 = [v13 imageWithTintColor:v14 renderingMode:1];
    int v16 = (void *)[v10 initWithImage:v15];

    id v17 = objc_alloc(MEMORY[0x263F82BF8]);
    v22[0] = v16;
    v22[1] = v4;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v19 = (void *)[v17 initWithArrangedSubviews:v18];

    [v19 setDistribution:3];
    [v19 setAlignment:2];
    [v19 setSpacing:4.0];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v19];
  }
  else
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v4];
  }

  return v20;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (id)_setUpInitialViewController
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(PMAuthorizationViewController *)self _initialViewControllerForPresentationContext:self->_presentationContext];
  if (v3)
  {
    id v4 = [(PMAuthorizationViewController *)self _setUpContainerViewControllerWithCredentialRequestViewController:v3];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_42);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F29388];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"No view controller specified for request.";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [v6 errorWithDomain:v7 code:1 userInfo:v8];
    [WeakRetained authorizationViewController:self didCompleteWithCredential:0 error:v9];

    id v4 = 0;
  }

  return v4;
}

void __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke_cold_1();
  }
}

- (id)_initialViewControllerForPresentationContext:(id)a3
{
  return [(PMAuthorizationViewController *)self _initialViewControllerForPresentationContext:a3 expandingOtherLoginChoices:0];
}

- (id)_initialViewControllerForPresentationContext:(id)a3 expandingOtherLoginChoices:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 cableAuthenticatorURL];

  if (v7)
  {
    if ([v6 shouldRequireCABLEAuthenticatorConsent]) {
      uint64_t v8 = [objc_alloc(MEMORY[0x263EFC3F8]) initWithPresentationContext:v6];
    }
    else {
      uint64_t v8 = [objc_alloc(MEMORY[0x263EFC3F0]) initRequiringTableView:0];
    }
    v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)v8;
    uint64_t v15 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
    int v16 = [(PMCredentialPickerViewController *)v14 as_navigationItem];
    [v16 setRightBarButtonItem:v15];

    id v10 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
    uint64_t v11 = [(PMCredentialPickerViewController *)v14 as_navigationItem];
    [v11 setLeftBarButtonItem:v10];
    goto LABEL_31;
  }
  uint64_t v9 = [v6 requestTypes];
  id v10 = [v6 loginChoices];
  uint64_t v11 = [MEMORY[0x263F662C8] sharedMonitor];
  if (([v11 isKeychainSyncEnabled] & 1) == 0 && (objc_msgSend(v11, "canKeychainSyncBeEnabled") & 1) == 0)
  {
    uint64_t v12 = [v6 externalPasskeyLoginChoiceCount];
    uint64_t v13 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_52);

    if (!v12) {
      v9 &= 0xFFFFFFFFFFFFFFF3;
    }
    id v10 = (void *)v13;
  }
  if (v9 == 32)
  {
    id v17 = [v10 firstObject];
    if ([v10 count] == 1
      && [v17 loginChoiceKind] == 3
      && [v17 credentialKind] == 2)
    {
      v14 = [(PMAuthorizationViewController *)self _securityKeyRequestViewController];
    }
    else
    {
      v14 = 0;
    }
LABEL_22:

    if (v14) {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  if (v9 == 16)
  {
    v14 = [(PMAuthorizationViewController *)self _securityKeyRequestViewController];
    if (v14) {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  if (-[PMAuthorizationViewController _shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:](self, "_shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:", v9, [v6 shouldAllowSecurityKeysFromCABLEView]))
  {
    id v17 = [v10 firstObject];
    v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)[objc_alloc(MEMORY[0x263EFC3E8]) initWithPresentationContext:self->_presentationContext loginChoice:v17 activity:self->_authorizationActivity];
    self->_includePasskeySymbolInTitleView = 0;
    goto LABEL_22;
  }
LABEL_23:
  v18 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  if ([v18 count])
  {
  }
  else
  {
    int v19 = [(ASCAuthorizationPresentationContext *)self->_presentationContext isProxiedRequest];

    if (v19)
    {
      v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)[objc_alloc(MEMORY[0x263EFC458]) initWithPersona:1 presentationContext:v6];
      [(ASCredentialRequestPaneViewController *)v14 setDelegate:self];
      [(PMCredentialPickerViewController *)v14 setAuthenticationDelegate:self];
      goto LABEL_30;
    }
  }
  if (self->_forceLegacySignInSheet)
  {
    v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)[objc_alloc(MEMORY[0x263EFC3D8]) initWithPresentationContext:v6 shouldExpandOtherLoginChoices:v4 activity:self->_authorizationActivity];
  }
  else
  {
    v14 = [[_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc] initWithPresentationContext:v6 shouldExpandOtherLoginChoices:v4 activity:self->_authorizationActivity];
    if (!v14) {
      goto LABEL_31;
    }
  }
LABEL_30:
  v20 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  v21 = [(PMCredentialPickerViewController *)v14 navigationItem];
  [v21 setLeftBarButtonItem:v20];

  v22 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  v23 = [(PMCredentialPickerViewController *)v14 as_navigationItem];
  [v23 setRightBarButtonItem:v22];

LABEL_31:

  return v14;
}

uint64_t __105__PMAuthorizationViewController__initialViewControllerForPresentationContext_expandingOtherLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2) {
    uint64_t v3 = [v2 isExternal];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (BOOL)_shouldPresentCABLEAsInitialViewControllerForRequestTypes:(unint64_t)a3 shouldAllowSecurityKeysFromCABLEView:(BOOL)a4
{
  BOOL v4 = a3 == 96 && a4;
  return a3 == 64 || v4;
}

- (id)_securityKeyRequestViewController
{
  return [(PMAuthorizationViewController *)self _securityKeyRequestViewControllerWithOverrideSubtitle:0 overrideTitle:0];
}

- (id)_securityKeyRequestViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263EFC430] titleWithPresentationContext:self->_presentationContext];
  }
  uint64_t v9 = v8;
  if ([v6 length])
  {
    id v10 = v6;
  }
  else
  {
    id v10 = [MEMORY[0x263EFC430] messageWithPresentationContext:self->_presentationContext];
  }
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext useAlternativeSecurityKeysIcon])
  {
    uint64_t v11 = [MEMORY[0x263EFC420] alternativeSecurityKeysIcon];
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263EFC420] systemSecurityKeysIcon];
    uint64_t v12 = 2;
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFC3E0]) initWithTitle:v9 titleStyle:2 subtitle:v10 subtitleStyle:3 icon:v11 iconStyle:v12];

  return v13;
}

- (void)_presentPINEntryInterface
{
  id v7 = (id)[objc_alloc(MEMORY[0x263EFC458]) initWithPersona:0 presentationContext:self->_presentationContext];
  [v7 setDelegate:self];
  [v7 setAuthenticationDelegate:self];
  uint64_t v3 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  BOOL v4 = objc_msgSend(v7, "as_navigationItem");
  [v4 setLeftBarButtonItem:v3];

  v5 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v6 = objc_msgSend(v7, "as_navigationItem");
  [v6 setRightBarButtonItem:v5];

  [(ASNavigationController *)self->_navigationController pushViewController:v7 animated:0];
}

- (void)_presentManualPasswordEntryInterface
{
  id v5 = (id)[objc_alloc(MEMORY[0x263EFC458]) initWithPersona:1 presentationContext:self->_presentationContext];
  [v5 setDelegate:self];
  [v5 setAuthenticationDelegate:self];
  uint64_t v3 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  BOOL v4 = [v5 navigationItem];
  [v4 setRightBarButtonItem:v3];

  [(ASNavigationController *)self->_navigationController pushViewController:v5 animated:0];
}

- (id)_cancelBarButtonItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:24 target:self action:sel__cancelButtonSelected_];

  return v2;
}

- (void)_cancelButtonSelected:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:2 userInfo:0];
  [WeakRetained authorizationViewController:self didCompleteWithCredential:0 error:v4];
}

- (id)_setUpContainerViewControllerWithCredentialRequestViewController:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFC440];
  id v5 = a3;
  id v6 = (ASNavigationController *)[[v4 alloc] initWithRootViewController:v5];

  navigationController = self->_navigationController;
  self->_navigationController = v6;

  id v8 = (void *)[objc_alloc(MEMORY[0x263EFC408]) initWithRootViewController:self->_navigationController];
  [v8 setPaneDelegate:self];
  [(ASNavigationController *)self->_navigationController setDelegate:v8];

  return v8;
}

- (void)_pushSecurityKeyViewController
{
}

- (void)_pushSecurityKeyViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4
{
  id v7 = [(PMAuthorizationViewController *)self _securityKeyRequestViewControllerWithOverrideSubtitle:a3 overrideTitle:a4];
  id v5 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v6 = objc_msgSend(v7, "as_navigationItem");
  [v6 setRightBarButtonItem:v5];

  [(ASNavigationController *)self->_navigationController pushViewController:v7 animated:1];
}

- (void)_updateOrPushPlatformKeyViewControllerWithSubtitle:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(ASNavigationController *)self->_navigationController visibleViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 updateSubtitle:v9];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263EFC3E0]);
    id v6 = _WBSLocalizedString();
    id v7 = [MEMORY[0x263EFC420] headerIconForPresentationContext:self->_presentationContext];
    id v8 = (void *)[v5 initWithTitle:v6 subtitle:v9 icon:v7];

    [(ASNavigationController *)self->_navigationController pushViewController:v8 animated:1];
  }
}

- (void)_pushActivateSecurityKeyAgainViewController
{
  uint64_t v3 = [MEMORY[0x263EFC430] activateSecurityKeyAgainMessageText];
  id v8 = [(PMAuthorizationViewController *)self _securityKeyRequestViewControllerWithOverrideSubtitle:v3 overrideTitle:0];

  BOOL v4 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  id v5 = objc_msgSend(v8, "as_navigationItem");
  [v5 setLeftBarButtonItem:v4];

  id v6 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v7 = objc_msgSend(v8, "as_navigationItem");
  [v7 setRightBarButtonItem:v6];

  [(ASNavigationController *)self->_navigationController pushViewController:v8 animated:1];
}

- (id)_cableClientViewControllerWithLoginChoice:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFC3E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithPresentationContext:self->_presentationContext loginChoice:v5 activity:self->_authorizationActivity];

  id v7 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v8 = objc_msgSend(v6, "as_navigationItem");
  [v8 setRightBarButtonItem:v7];

  return v6;
}

- (void)_pushCABLEClientViewControllerForCABLELoginChoice:(id)a3
{
  id v4 = [(PMAuthorizationViewController *)self _cableClientViewControllerWithLoginChoice:a3];
  [(ASNavigationController *)self->_navigationController pushViewController:v4 animated:1];
}

- (void)_pushCABLEConnectingViewController
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFC3F0]) initRequiringTableView:0];
  id v4 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v5 = objc_msgSend(v3, "as_navigationItem");
  [v5 setRightBarButtonItem:v4];

  id v6 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  id v7 = [v3 navigationItem];
  [v7 setLeftBarButtonItem:v6];

  navigationController = self->_navigationController;
  v10[0] = v3;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [(ASNavigationController *)navigationController setViewControllers:v9 animated:1];
}

- (void)_pushCABLEAuthenticatingViewController
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFC420] passwordManagerIcon];
  [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest];
  id v4 = NSString;
  id v5 = _WBSLocalizedString();
  id v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

  id v8 = (void *)[objc_alloc(MEMORY[0x263EFC3E0]) initWithTitle:v7 subtitle:0 icon:v3];
  id v9 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v10 = objc_msgSend(v8, "as_navigationItem");
  [v10 setRightBarButtonItem:v9];

  uint64_t v11 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  uint64_t v12 = [v8 navigationItem];
  [v12 setLeftBarButtonItem:v11];

  navigationController = self->_navigationController;
  v15[0] = v8;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(ASNavigationController *)navigationController setViewControllers:v14 animated:1];
}

- (void)_startCABLEClientWithLoginChoice:(id)a3
{
  id v4 = a3;
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__PMAuthorizationViewController__startCABLEClientWithLoginChoice___block_invoke;
  block[3] = &unk_265439F78;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  if (([(SFWirelessSettingsController *)self->_wirelessSettingsController isBluetoothEnabled] & 1) == 0) {
    [(PMAuthorizationViewController *)self _showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained authorizationViewController:self didRequestCredentialForLoginChoice:v4 authenticatedContext:0 completionHandler:&__block_literal_global_75];
}

void __66__PMAuthorizationViewController__startCABLEClientWithLoginChoice___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1000);
    id v4 = v2;
    v5[0] = 67109120;
    v5[1] = [v3 isBluetoothEnabled];
    _os_log_impl(&dword_258906000, v4, OS_LOG_TYPE_DEFAULT, "Starting caBLE client: bluetoothEnabled: %{BOOL}d", (uint8_t *)v5, 8u);
  }
}

- (void)_startCABLEClientForSingleLoginChoiceIfNeeded
{
  if ([(PMAuthorizationViewController *)self _shouldPresentCABLEAsInitialViewControllerForRequestTypes:[(ASCAuthorizationPresentationContext *)self->_presentationContext requestTypes] shouldAllowSecurityKeysFromCABLEView:[(ASCAuthorizationPresentationContext *)self->_presentationContext shouldAllowSecurityKeysFromCABLEView]])
  {
    uint64_t v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_77);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v5;
    if (v5)
    {
      [(PMAuthorizationViewController *)self _startCABLEClientWithLoginChoice:v5];
      id v4 = v5;
    }
  }
}

BOOL __78__PMAuthorizationViewController__startCABLEClientForSingleLoginChoiceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginChoiceKind] == 4;
}

- (void)_showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFC410]) initWithPresentationContext:self->_presentationContext activity:self->_authorizationActivity];
  uint64_t v6 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  id v7 = [v5 navigationItem];
  [v7 setLeftBarButtonItem:v6];

  id v8 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v9 = objc_msgSend(v5, "as_navigationItem");
  [v9 setRightBarButtonItem:v8];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __97__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEClientWithLoginChoice___block_invoke;
  v14 = &unk_265439FA0;
  uint64_t v15 = self;
  id v16 = v4;
  id v10 = v4;
  [v5 setEnableBluetoothHandler:&v11];
  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, 1, v11, v12, v13, v14, v15);
}

uint64_t __97__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEClientWithLoginChoice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice:*(void *)(a1 + 40)];
}

- (void)_enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice:(id)a3
{
  id v4 = (id)[(ASNavigationController *)self->_navigationController popViewControllerAnimated:1];
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_80);
  wirelessSettingsController = self->_wirelessSettingsController;

  [(SFWirelessSettingsController *)wirelessSettingsController setBluetoothEnabled:1];
}

void __97__PMAuthorizationViewController__enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_258906000, v0, OS_LOG_TYPE_DEFAULT, "Enabling Bluetooth", v1, 2u);
  }
}

- (void)_pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_presentationContext, a3);
  if (self->_forceLegacySignInSheet)
  {
    id WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)[objc_alloc(MEMORY[0x263EFC3D8]) initWithPresentationContext:v5 activity:self->_authorizationActivity];
  }
  else
  {
    id WeakRetained = [[_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc] initWithPresentationContext:v5 shouldExpandOtherLoginChoices:0 activity:self->_authorizationActivity];
    if (!WeakRetained)
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_82);
      id WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F29388];
      uint64_t v17 = *MEMORY[0x263F08338];
      v18[0] = @"No view controller specified for request.";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v15 = [v13 errorWithDomain:v14 code:1 userInfo:v12];
      [(PMCredentialPickerViewController *)WeakRetained authorizationViewController:self didCompleteWithCredential:0 error:v15];

      goto LABEL_5;
    }
  }
  id v7 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  id v8 = [(PMCredentialPickerViewController *)WeakRetained navigationItem];
  [v8 setLeftBarButtonItem:v7];

  id v9 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v10 = [(PMCredentialPickerViewController *)WeakRetained navigationItem];
  [v10 setRightBarButtonItem:v9];

  navigationController = self->_navigationController;
  id v16 = WeakRetained;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  [(ASNavigationController *)navigationController setViewControllers:v12 animated:1];
LABEL_5:
}

void __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1();
  }
}

- (void)_showCABLEAuthenticatorError:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [MEMORY[0x263F66568] sharedManager];
  uint64_t v6 = [v5 getEnabledExtensionsSynchronously];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v38;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(id *)(*((void *)&v37 + 1) + 8 * v11);

        uint64_t v13 = [MEMORY[0x263F66568] sharedManager];
        char v14 = [v13 extensionSupportsPasskeys:v9];

        if (v14)
        {
          int v15 = 1;
          goto LABEL_12;
        }
        ++v11;
        uint64_t v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    int v15 = 0;
  }
  else
  {
    int v15 = 0;
    id v9 = 0;
  }
LABEL_12:

  if (objc_msgSend(v4, "safari_matchesErrorDomain:andCode:", *MEMORY[0x263F29388], 5))
  {
    id v16 = [MEMORY[0x263F662C8] sharedMonitor];
    int v17 = [v16 isKeychainSyncEnabled];

    if ((v15 | v17) != 1)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFC418]);
      v32 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
      v33 = [v19 navigationItem];
      [v33 setLeftBarButtonItem:v32];

      v34 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
      v35 = [v19 navigationItem];
      [v35 setRightBarButtonItem:v34];

      navigationController = self->_navigationController;
      id v42 = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
      [(ASNavigationController *)navigationController setViewControllers:v20 animated:1];
      goto LABEL_23;
    }
    v18 = [v4 userInfo];
    id v19 = [v18 objectForKeyedSubscript:*MEMORY[0x263F08338]];
  }
  else
  {
    _WBSLocalizedString();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([MEMORY[0x263F662A0] hasInternalContent])
  {
    v20 = [NSString localizedStringWithFormat:@"(Internal only: %@)", v4];
  }
  else
  {
    v20 = 0;
  }
  v21 = [MEMORY[0x263EFC420] passwordManagerIcon];
  if (v15)
  {
    v22 = (void *)MEMORY[0x263EFC420];
    v23 = objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");
    [MEMORY[0x263EFC478] headerIconSize];
    uint64_t v24 = objc_msgSend(v22, "iconForApplicationIdentifier:size:", v23);

    v21 = (void *)v24;
  }
  v25 = (void *)[objc_alloc(MEMORY[0x263EFC3E0]) initWithTitle:v19 subtitle:v20 icon:v21];
  v26 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  v27 = [v25 navigationItem];
  [v27 setLeftBarButtonItem:v26];

  v28 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  v29 = [v25 navigationItem];
  [v29 setRightBarButtonItem:v28];

  v30 = self->_navigationController;
  v41 = v25;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
  [(ASNavigationController *)v30 setViewControllers:v31 animated:1];

LABEL_23:
}

- (void)_startCABLEAuthenticatorOnInitialPresentationIfNeeded
{
  uint64_t v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorURL];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldRequireCABLEAuthenticatorConsent];

    if ((v5 & 1) == 0)
    {
      [(PMAuthorizationViewController *)self _startCABLEAuthenticator];
    }
  }
}

- (void)_startCABLEAuthenticator
{
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke;
  block[3] = &unk_265439F78;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  if (([(SFWirelessSettingsController *)self->_wirelessSettingsController isBluetoothEnabled] & 1) == 0) {
    [(PMAuthorizationViewController *)self _showEnableBluetoothViewControllerForCABLEAuthenticator];
  }
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_92;
  v5[3] = &unk_26543A058;
  objc_copyWeak(&v6, &location);
  [WeakRetained authorizationViewController:self startCABLEAuthenticationWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1000);
    id v4 = v2;
    v5[0] = 67109120;
    v5[1] = [v3 isBluetoothEnabled];
    _os_log_impl(&dword_258906000, v4, OS_LOG_TYPE_DEFAULT, "Starting caBLE authenticator: bluetoothEnabled: %{BOOL}d", (uint8_t *)v5, 8u);
  }
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_2;
  block[3] = &unk_26543A030;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(void *)(a1 + 32)) {
      objc_msgSend(WeakRetained, "_pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext:");
    }
    else {
      [WeakRetained _showCABLEAuthenticatorError:*(void *)(a1 + 40)];
    }
    id WeakRetained = v3;
  }
}

- (void)_showEnableBluetoothViewControllerForCABLEAuthenticator
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFC410]) initWithPresentationContext:self->_presentationContext activity:self->_authorizationActivity];
  id v4 = [(PMAuthorizationViewController *)self _signInBarButtonItem];
  id v5 = [v3 navigationItem];
  [v5 setLeftBarButtonItem:v4];

  id v6 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v7 = [v3 navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEAuthenticator__block_invoke;
  v8[3] = &unk_265439F78;
  v8[4] = self;
  [v3 setEnableBluetoothHandler:v8];
  [(ASNavigationController *)self->_navigationController pushViewController:v3 animated:1];
}

uint64_t __88__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEAuthenticator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableBluetoothAndShowCABLEConnectingViewController];
}

- (void)_enableBluetoothAndShowCABLEConnectingViewController
{
  [(PMAuthorizationViewController *)self _pushCABLEConnectingViewController];
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_95);
  wirelessSettingsController = self->_wirelessSettingsController;

  [(SFWirelessSettingsController *)wirelessSettingsController setBluetoothEnabled:1];
}

void __85__PMAuthorizationViewController__enableBluetoothAndShowCABLEConnectingViewController__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_258906000, v0, OS_LOG_TYPE_DEFAULT, "Enabling Bluetooth", v1, 2u);
  }
}

- (void)requestPaneViewController:(id)a3 dismissWithCredential:(id)a4 error:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authorizationViewController:self didCompleteWithCredential:v9 error:v8];
}

- (void)requestPaneViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v14 loginChoiceKind] == 3)
  {
    id v12 = v14;
    uint64_t v13 = [v12 credentialKind];
    if (v13 == 2)
    {
      [(PMAuthorizationViewController *)self _pushSecurityKeyViewController];
      if (![(ASCAuthorizationPresentationContext *)self->_presentationContext shouldAllowSecurityKeysFromCABLEView])
      {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
        goto LABEL_11;
      }
    }
    else if (v13 != 1)
    {
      if (v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      [(PMAuthorizationViewController *)self _pushSecurityKeyViewController];
    }
    [WeakRetained authorizationViewController:self didRequestCredentialForLoginChoice:v12 authenticatedContext:v9 completionHandler:v10];
    goto LABEL_11;
  }
  if ([v14 loginChoiceKind] == 4)
  {
    [(PMAuthorizationViewController *)self _pushCABLEClientViewControllerForCABLELoginChoice:v14];
    [(PMAuthorizationViewController *)self _startCABLEClientWithLoginChoice:v14];
  }
  else
  {
    [WeakRetained authorizationViewController:self didRequestCredentialForLoginChoice:v14 authenticatedContext:v9 completionHandler:v10];
  }
LABEL_12:
}

- (void)requestPaneViewControllerPresentExpandedLoginChoiceInterface:(id)a3
{
}

- (void)requestPaneViewControllerNeedsReload:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissAndPresentAgain:self];
}

- (void)_replaceRequestPaneViewControllerWithExpandedLoginChoiceList:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x263EF8340];
  if (self->_forceLegacySignInSheet)
  {
    id WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)[objc_alloc(MEMORY[0x263EFC3D8]) initWithPresentationContext:self->_presentationContext shouldExpandOtherLoginChoices:a3 activity:self->_authorizationActivity];
  }
  else
  {
    id WeakRetained = [[_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc] initWithPresentationContext:self->_presentationContext shouldExpandOtherLoginChoices:a3 activity:self->_authorizationActivity];
    if (!WeakRetained)
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_97);
      id WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F29388];
      uint64_t v14 = *MEMORY[0x263F08338];
      v15[0] = @"No view controller specified for request.";
      id v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v12 = [v10 errorWithDomain:v11 code:1 userInfo:v9];
      [(PMCredentialPickerViewController *)WeakRetained authorizationViewController:self didCompleteWithCredential:0 error:v12];

      goto LABEL_5;
    }
  }
  [(ASCredentialRequestPaneViewController *)WeakRetained setDelegate:self];
  id v6 = [(PMAuthorizationViewController *)self _cancelBarButtonItem];
  id v7 = [(PMCredentialPickerViewController *)WeakRetained as_navigationItem];
  [v7 setRightBarButtonItem:v6];

  navigationController = self->_navigationController;
  uint64_t v13 = WeakRetained;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [(ASNavigationController *)navigationController setViewControllers:v9 animated:v3];
LABEL_5:
}

void __94__PMAuthorizationViewController__replaceRequestPaneViewControllerWithExpandedLoginChoiceList___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1();
  }
}

- (void)requestPaneViewControllerStartCABLEAuthentication:(id)a3
{
  [(PMAuthorizationViewController *)self _pushCABLEConnectingViewController];

  [(PMAuthorizationViewController *)self _startCABLEAuthenticator];
}

- (void)passwordAuthenticationViewController:(id)a3 completedWithUserEnteredPIN:(id)a4
{
  id v5 = a4;
  [(PMAuthorizationViewController *)self _pushActivateSecurityKeyAgainViewController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke;
  v7[3] = &unk_26543A0A8;
  v7[4] = self;
  [WeakRetained authorizationViewController:self validateUserEnteredPIN:v5 completionHandler:v7];
}

void __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke_2;
  block[3] = &unk_26543A080;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1032));
    [WeakRetained authorizationViewController:*(void *)(a1 + 40) didCompleteWithCredential:*(void *)(a1 + 32) error:0];
  }
  else
  {
    [*(id *)(a1 + 48) code];
    descriptionForErrorCode();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:");
  }
}

- (void)passwordAuthenticationViewController:(id)a3 completedWithManuallyEnteredPasswordCredential:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authorizationViewController:self didCompleteWithCredential:v6 error:0];
}

- (ASAuthorizationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASAuthorizationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conditionalRegistrationViewController, 0);
  objc_storeStrong((id *)&self->_wirelessSettingsController, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258906000, v0, v1, "Rejecting update with no login choices.", v2, v3, v4, v5, v6);
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258906000, v0, v1, "Couldn't update interface because a new request view controller could not be created for the new login choices.", v2, v3, v4, v5, v6);
}

- (void)viewWillAppear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_258906000, v0, OS_LOG_TYPE_FAULT, "Not being presented.", v1, 2u);
}

void __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258906000, v0, v1, "No request view controller specified for credential request.", v2, v3, v4, v5, v6);
}

void __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258906000, v0, v1, "Unable to create PMCredentialPickerViewController for credential request.", v2, v3, v4, v5, v6);
}

@end