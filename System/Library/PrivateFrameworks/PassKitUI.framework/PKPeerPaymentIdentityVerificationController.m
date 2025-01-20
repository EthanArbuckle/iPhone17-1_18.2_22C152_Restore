@interface PKPeerPaymentIdentityVerificationController
- (BOOL)_hasRequiredFields;
- (PKPaymentSetupFieldsModel)fieldsModel;
- (PKPeerPaymentDocumentSubmissionController)captureController;
- (PKPeerPaymentIdentityVerificationController)init;
- (PKPeerPaymentIdentityVerificationController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 hideInitialSplashScreen:(BOOL)a6 context:(int64_t)a7;
- (PKPeerPaymentIdentityVerificationResponse)response;
- (PKPeerPaymentWebService)webService;
- (UIViewController)firstViewController;
- (id)_accountLockedErrorViewController;
- (id)_accountRestrictedErrorViewController;
- (id)_generateFieldsModel;
- (id)_nextLocalViewController;
- (id)_verificationErrorViewControllerWithError:(id)a3;
- (int64_t)context;
- (void)_formViewControllersWithExplanationView:(BOOL)a3;
- (void)_identityVerificationResquestWithCompletion:(id)a3;
- (void)_resetViewControllers;
- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4;
- (void)didDismissViewController;
- (void)nextViewControllerWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentIdentityVerificationController

- (PKPeerPaymentIdentityVerificationController)init
{
  return [(PKPeerPaymentIdentityVerificationController *)self initWithPeerPaymentWebService:0 identityVerificationResponse:0 setupDelegate:0 hideInitialSplashScreen:0 context:0];
}

- (PKPeerPaymentIdentityVerificationController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 hideInitialSplashScreen:(BOOL)a6 context:(int64_t)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentIdentityVerificationController;
  v16 = [(PKPeerPaymentIdentityVerificationController *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_webService, a3);
    objc_storeStrong((id *)&v17->_response, a4);
    objc_storeWeak((id *)&v17->_setupDelegate, v15);
    v17->_viewControllerIndex = 0;
    v17->_context = a7;
    if (v17->_response)
    {
      [(PKPeerPaymentIdentityVerificationController *)v17 _formViewControllersWithExplanationView:!v8];
      uint64_t v18 = [(PKPeerPaymentIdentityVerificationController *)v17 _nextLocalViewController];
      firstViewController = v17->_firstViewController;
      v17->_firstViewController = (UIViewController *)v18;
    }
    [(PKPeerPaymentWebService *)v17->_webService prewarmDeviceScoreForEndpoint:*MEMORY[0x1E4F87C58] recipientAddress:0 quoteDestinationType:0];
  }

  return v17;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t, void, unint64_t))a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20;
  v23 = __Block_byref_object_dispose__20;
  id v24 = [(PKPeerPaymentIdentityVerificationController *)self _nextLocalViewController];
  uint64_t v5 = v20[5];
  if (v5)
  {
    if (v4)
    {
      if ((self->_fatalError & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v7 = v20[5];
        if (isKindOfClass)
        {
          uint64_t v8 = 0;
          unint64_t fatalError = self->_fatalError;
        }
        else
        {
          unint64_t fatalError = 1;
          uint64_t v8 = v20[5];
          uint64_t v7 = 0;
        }
        v4[2](v4, v8, v7, 0, fatalError);
      }
      else
      {
        v4[2](v4, v5, 0, 0, 1uLL);
      }
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59D3578;
    aBlock[4] = self;
    uint64_t v18 = &v19;
    v10 = v4;
    id v17 = v10;
    v11 = _Block_copy(aBlock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke_2;
    v13[3] = &unk_1E59D35A0;
    v13[4] = self;
    id v14 = v10;
    id v12 = v11;
    id v15 = v12;
    [(PKPeerPaymentIdentityVerificationController *)self _identityVerificationResquestWithCompletion:v13];
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _formViewControllersWithExplanationView:0];
  uint64_t v2 = [*(id *)(a1 + 32) _nextLocalViewController];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = v3;
  if (v3 || (v4 = *(void **)(*(void *)(a1 + 32) + 32)) == 0)
  {
    uint64_t v8 = [v3 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F289A0]];

    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E78], 0);
    if (!v9)
    {
      v6 = [*(id *)(a1 + 32) _verificationErrorViewControllerWithError:v18];
      [*(id *)(a1 + 32) _resetViewControllers];
      if (*(void *)(a1 + 40))
      {
        if ([v18 code] == 40331) {
          uint64_t v12 = 6;
        }
        else {
          uint64_t v12 = 3;
        }
        (*(void (**)(void, void, void *, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v6, 0, v12);
      }
      goto LABEL_26;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = v18;
    if (!v10) {
      goto LABEL_28;
    }
    (*(void (**)(uint64_t, void, void, void *, uint64_t))(v10 + 16))(v10, 0, 0, v18, 2);
  }
  else
  {
    if ([v4 complete])
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) account];
      v6 = v5;
      if (v5)
      {
        uint64_t v7 = [v5 state];
        if ([v6 identityVerificationRequired])
        {
          [*(id *)(a1 + 32) _resetViewControllers];
          [*(id *)(a1 + 32) nextViewControllerWithCompletion:*(void *)(a1 + 40)];
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v13 = *MEMORY[0x1E4F85E90];
        if (v7 == 3)
        {
          MEMORY[0x1A6220EC0](v13, 0);
          MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E80], 0);
          id v14 = [*(id *)(a1 + 32) _accountLockedErrorViewController];
          [*(id *)(a1 + 32) _resetViewControllers];
          uint64_t v17 = *(void *)(a1 + 40);
          if (v17)
          {
            v16 = *(void (**)(void))(v17 + 16);
            goto LABEL_22;
          }
LABEL_23:

          goto LABEL_26;
        }
        if (v7 == 2)
        {
          MEMORY[0x1A6220EC0](v13, 0);
          MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E88], 0);
          id v14 = [*(id *)(a1 + 32) _accountRestrictedErrorViewController];
          [*(id *)(a1 + 32) _resetViewControllers];
          uint64_t v15 = *(void *)(a1 + 40);
          if (v15)
          {
            v16 = *(void (**)(void))(v15 + 16);
LABEL_22:
            v16();
            goto LABEL_23;
          }
          goto LABEL_23;
        }
        MEMORY[0x1A6220EC0](v13, 0);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_26;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_27:
  v11 = v18;
LABEL_28:
}

- (void)didDismissViewController
{
}

- (void)_identityVerificationResquestWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84DA0]);
  uint64_t v6 = *MEMORY[0x1E4F87CC0];
  uint64_t v7 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel submissionValuesForDestination:*MEMORY[0x1E4F87CC0]];
  [v5 setOverlayParameters:v7];
  uint64_t v8 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel secureSubmissionValuesForDestination:v6];
  [v5 setSecureOverlayParameters:v8];
  int v9 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response encryptionCertificates];
  [v5 setCertificates:v9];

  webService = self->_webService;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke;
  v12[3] = &unk_1E59D35C8;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  id v11 = v4;
  id v13 = v11;
  [(PKPeerPaymentWebService *)webService peerPaymentIdentityVerificationRequest:v5 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke_2;
    v8[3] = &unk_1E59CE9B0;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v11 = *(id *)(a1 + 40);
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_resetViewControllers
{
  viewControllers = self->_viewControllers;
  self->_viewControllers = 0;

  self->_viewControllerIndex = 0;
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = 0;
}

- (id)_verificationErrorViewControllerWithError:(id)a3
{
  id v4 = a3;
  id v5 = [[PKExplanationViewController alloc] initWithContext:self->_context];
  [(PKExplanationViewController *)v5 setShowDoneButton:0];
  [(PKExplanationViewController *)v5 setShowCancelButton:0];
  uint64_t v6 = [v4 code];
  uint64_t v7 = [v4 domain];
  v38 = v4;
  if (![v7 isEqualToString:*MEMORY[0x1E4F87CD8]]
    || ((unint64_t)(v6 - 40320) > 0xB || ((1 << (v6 + 0x80)) & 0xC01) == 0) && v6 != 40014)
  {

    uint64_t v8 = 0;
    id v10 = 0;
LABEL_9:
    uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_2.isa);

    uint64_t v12 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_3.isa);

    id v10 = (void *)v12;
    uint64_t v8 = (void *)v11;
    goto LABEL_10;
  }

  uint64_t v8 = [v4 localizedFailureReason];
  uint64_t v9 = [v4 localizedRecoverySuggestion];
  id v10 = (void *)v9;
  if (!v8 || !v9) {
    goto LABEL_9;
  }
LABEL_10:
  id v13 = [(PKExplanationViewController *)v5 explanationView];
  [v13 setTitleText:v8];
  [v13 setBodyText:v10];
  [v13 setTitleLineBreakStrategy:1];
  [v13 setShowPrivacyView:0];
  id v14 = [v13 dockView];
  uint64_t v15 = [v14 footerView];
  if (v6 == 40331)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = v10;
    v37 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_4.isa);
    v35 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_5.isa, &stru_1EF1B5770.isa, v19, v37);

    v36 = [[PKTextRangeHyperlink alloc] initWithLinkText:v37 action:&__block_literal_global_84];
    id v20 = v18;
    [v18 addObject:v36];
    uint64_t v21 = objc_alloc_init(PKMultiHyperlinkView);
    [(PKMultiHyperlinkView *)v21 setText:v35];
    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(PKMultiHyperlinkView *)v21 setTextColor:v22];

    [(PKMultiHyperlinkView *)v21 setTextAlignment:1];
    v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(PKMultiHyperlinkView *)v21 setTextFont:v23];

    id v24 = v20;
    [(PKMultiHyperlinkView *)v21 setSources:v20];
    [v13 setBodyView:v21];
    [v13 setBodyText:0];
    [v13 setForceShowSetupLaterButton:1];
    v25 = [v14 primaryButton];
    v26 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_6.isa);
    [v25 setTitle:v26 forState:0];

    v27 = [v15 setupLaterButton];
    v28 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_7.isa);
    [v27 setTitle:v28 forState:0];

    [v15 setManualEntryButton:0];
  }
  else
  {
    if (v6 == 40330)
    {
      v16 = [v14 primaryButton];
      uint64_t v17 = PKLocalizedString(&cfstr_Done.isa);
      [v16 setTitle:v17 forState:0];

      [v15 setSetupLaterButton:0];
    }
    else
    {
      [v13 setForceShowSetupLaterButton:1];
      v29 = [v14 primaryButton];
      v30 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi.isa);
      [v29 setTitle:v30 forState:0];

      v31 = [v15 setupLaterButton];
      v32 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_8.isa);
      [v31 setTitle:v32 forState:0];
    }
    [v15 setManualEntryButton:0];
  }
  v33 = [(PKExplanationViewController *)v5 navigationItem];
  [v33 setHidesBackButton:1];

  return v5;
}

void __89__PKPeerPaymentIdentityVerificationController__verificationErrorViewControllerWithError___block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/102636"];
  if (v1)
  {
    v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v0 openURL:v1 configuration:0 completionHandler:0];
  }
}

- (id)_accountRestrictedErrorViewController
{
  uint64_t v2 = [[PKExplanationViewController alloc] initWithContext:self->_context];
  [(PKExplanationViewController *)v2 setShowDoneButton:0];
  [(PKExplanationViewController *)v2 setShowCancelButton:0];
  id v3 = [(PKExplanationViewController *)v2 explanationView];
  id v4 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_2.isa);
  [v3 setTitleText:v4];

  PKDeviceSpecificLocalizedStringKeyForKey(@"IDENTITY_VERIFICATION_FAILED_SPEND_DOWN_MESSAGE", 0);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = PKLocalizedPeerPaymentString(v5);
  [v3 setBodyText:v6];

  [v3 setShowPrivacyView:0];
  uint64_t v7 = [v3 dockView];
  uint64_t v8 = [v7 primaryButton];
  uint64_t v9 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_10.isa);
  [v8 setTitle:v9 forState:0];

  id v10 = [(PKExplanationViewController *)v2 navigationItem];
  [v10 setHidesBackButton:1];

  return v2;
}

- (id)_accountLockedErrorViewController
{
  uint64_t v2 = [[PKExplanationViewController alloc] initWithContext:self->_context];
  [(PKExplanationViewController *)v2 setShowDoneButton:0];
  [(PKExplanationViewController *)v2 setShowCancelButton:0];
  id v3 = [(PKExplanationViewController *)v2 explanationView];
  id v4 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_2.isa);
  [v3 setTitleText:v4];

  id v5 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_11.isa);
  [v3 setBodyText:v5];

  [v3 setShowPrivacyView:0];
  [v3 setForceShowSetupLaterButton:1];
  uint64_t v6 = [v3 dockView];
  uint64_t v7 = [v6 primaryButton];
  uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_6.isa);
  [v7 setTitle:v8 forState:0];

  uint64_t v9 = [v6 footerView];
  id v10 = [v9 setupLaterButton];
  uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_12.isa);
  [v10 setTitle:v11 forState:0];

  [v9 setManualEntryButton:0];
  uint64_t v12 = [(PKExplanationViewController *)v2 navigationItem];
  [v12 setHidesBackButton:1];

  return v2;
}

- (void)_formViewControllersWithExplanationView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v92 = [MEMORY[0x1E4F1CA48] array];
  if ([(PKPeerPaymentIdentityVerificationResponse *)self->_response complete])
  {
    id v5 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response account];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 state];
      if (v7 == 3)
      {
        self->_unint64_t fatalError = 5;
        uint64_t v8 = [(PKPeerPaymentIdentityVerificationController *)self _accountLockedErrorViewController];
        goto LABEL_63;
      }
      if (v7 == 2)
      {
        self->_unint64_t fatalError = 4;
        uint64_t v8 = [(PKPeerPaymentIdentityVerificationController *)self _accountRestrictedErrorViewController];
LABEL_63:
        v73 = (void *)v8;
        [v92 addObject:v8];
      }
    }

    goto LABEL_65;
  }
  if ([(PKPeerPaymentIdentityVerificationController *)self _hasRequiredFields])
  {
    BOOL v81 = v3;
    uint64_t v9 = [(PKPeerPaymentIdentityVerificationController *)self _generateFieldsModel];
    fieldsModel = self->_fieldsModel;
    self->_fieldsModel = v9;

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = [(PKPeerPaymentIdentityVerificationResponse *)self->_response requiredFieldsByPage];
    uint64_t v84 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (!v84) {
      goto LABEL_57;
    }
    int v85 = 0;
    uint64_t v83 = *(void *)v99;
    id location = (id *)&self->_setupDelegate;
    uint64_t v87 = *MEMORY[0x1E4F87CA8];
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v99 != v83) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v98 + 1) + 8 * v11);
        id v13 = [MEMORY[0x1E4F1CA48] array];
        id v14 = [v12 localizedTitle];
        uint64_t v15 = [v14 length];
        response = (PKPeerPaymentIdentityVerificationResponse *)v12;
        if (!v15) {
          response = self->_response;
        }
        uint64_t v86 = v11;
        v93 = [(PKPeerPaymentIdentityVerificationResponse *)response localizedTitle];

        uint64_t v17 = [v12 localizedDescription];
        uint64_t v18 = [v17 length];
        id v19 = (PKPeerPaymentIdentityVerificationResponse *)v12;
        if (!v18) {
          id v19 = self->_response;
        }
        v89 = [(PKPeerPaymentIdentityVerificationResponse *)v19 localizedDescription];

        id v20 = [v12 requiredFields];
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v94 objects:v102 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v95;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v95 != v24) {
                objc_enumerationMutation(v21);
              }
              if ([*(id *)(*((void *)&v94 + 1) + 8 * i) supportsAddressAutofill])
              {
                int v26 = 0;
                goto LABEL_26;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v94 objects:v102 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
        int v26 = 1;
LABEL_26:

        int v27 = v26 | v85 | [(PKPeerPaymentIdentityVerificationResponse *)self->_response useDeviceValidation] ^ 1;
        if ((v27 & 1) == 0)
        {
          v28 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response account];
          uint64_t v29 = [v28 countryCode];
          v30 = (void *)v29;
          v31 = @"US";
          if (v29) {
            v31 = (__CFString *)v29;
          }
          v32 = v31;

          v33 = [PKAddressSearcherViewController alloc];
          id WeakRetained = objc_loadWeakRetained(location);
          int v85 = 1;
          v35 = [(PKAddressSearcherViewController *)v33 initWithIdentityVerificationController:self setupDelegate:WeakRetained style:1];

          v36 = [v12 localizedTitle];
          [(PKAddressSearcherViewController *)v35 setHeaderTitle:v36];

          v37 = [v12 localizedDescription];
          [(PKAddressSearcherViewController *)v35 setHeaderSubtitle:v37];

          v38 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
          [(PKAddressSearcherViewController *)v35 setBackgroundColor:v38];

          [(PKAddressSearcherViewController *)v35 setSupportsSearchBarCancelButton:0];
          v39 = [MEMORY[0x1E4F1CAD0] setWithObject:v32];

          [(PKAddressSearcherViewController *)v35 setSupportedCountryCodes:v39];
          [(PKAddressSearcherViewController *)v35 setDelegate:self];
          [v92 addObject:v35];
        }
        char v90 = v27 ^ 1;
        if ([v21 count])
        {
          unint64_t v40 = 0;
          v88 = v13;
          do
          {
            v41 = [v21 objectAtIndex:v40];
            v42 = [v41 identifier];
            if ([v41 isFieldTypePicker])
            {
              v43 = [v41 pickerFieldObject];
              uint64_t v44 = [v43 pickerType];

              if ((unint64_t)(v44 - 1) < 2)
              {
                if ([v13 count])
                {
                  v45 = [PKPeerPaymentIdentityVerificationViewController alloc];
                  id v46 = objc_loadWeakRetained(location);
                  v47 = (void *)[v13 copy];
                  v48 = [(PKPeerPaymentIdentityVerificationViewController *)v45 initWithController:self setupDelegate:v46 visibleFieldIdentifiers:v47];

                  [(PKPeerPaymentIdentityVerificationViewController *)v48 setHeaderTitle:v93];
                  [(PKPeerPaymentIdentityVerificationViewController *)v48 setHeaderSubtitle:v89];
                  if (v90) {
                    [(PKPeerPaymentIdentityVerificationViewController *)v48 setShowCancelButton:0];
                  }
                  [v92 addObject:v48];

                  char v90 = 0;
                }
                if (v40 + 1 >= [v21 count])
                {
                  id v53 = 0;
                }
                else
                {
                  v49 = [v21 objectAtIndex:v40 + 1];
                  v50 = [v49 identifier];
                  v51 = [v50 lowercaseString];
                  int v52 = [v51 isEqualToString:v87];

                  if (v52)
                  {
                    id v53 = v49;
                    ++v40;
                  }
                  else
                  {
                    id v53 = 0;
                  }
                }
                v54 = [PKPeerPaymentIdentityVerificationPickerViewController alloc];
                id v55 = objc_loadWeakRetained(location);
                v56 = [v53 defaultValue];
                v57 = [(PKPeerPaymentIdentityVerificationPickerViewController *)v54 initWithController:self setupDelegate:v55 pickerField:v41 footerText:v56];

                [(PKPeerPaymentIdentityVerificationPickerViewController *)v57 setHeaderTitle:v93];
                v58 = [v41 localizedDisplayName];
                [(PKPeerPaymentIdentityVerificationPickerViewController *)v57 setHeaderSubtitle:v58];

                [v92 addObject:v57];
                id v13 = v88;
                [v88 removeAllObjects];

                goto LABEL_50;
              }
              if (!v44 || v44 == 3) {
LABEL_38:
              }
                [v13 addObject:v42];
            }
            else if (([v41 isFieldTypeFooter] & 1) == 0)
            {
              goto LABEL_38;
            }
LABEL_50:

            ++v40;
          }
          while (v40 < [v21 count]);
        }
        if ([v13 count])
        {
          v59 = [PKPeerPaymentIdentityVerificationViewController alloc];
          id v60 = objc_loadWeakRetained(location);
          v61 = (void *)[v13 copy];
          v62 = [(PKPeerPaymentIdentityVerificationViewController *)v59 initWithController:self setupDelegate:v60 visibleFieldIdentifiers:v61];

          [(PKPeerPaymentIdentityVerificationViewController *)v62 setHeaderTitle:v93];
          [(PKPeerPaymentIdentityVerificationViewController *)v62 setHeaderSubtitle:v89];
          if (v90) {
            [(PKPeerPaymentIdentityVerificationViewController *)v62 setShowCancelButton:0];
          }
          [v92 addObject:v62];
        }
        uint64_t v11 = v86 + 1;
      }
      while (v86 + 1 != v84);
      uint64_t v84 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
      if (!v84)
      {
LABEL_57:

        BOOL v3 = v81;
        goto LABEL_65;
      }
    }
  }
  v63 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response acceptableDocuments];
  uint64_t v64 = [v63 count];

  if (v64)
  {
    BOOL v65 = v3;
    v66 = [PKPeerPaymentDocumentSubmissionController alloc];
    webService = self->_webService;
    v68 = self->_response;
    id v69 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v70 = [(PKPeerPaymentDocumentSubmissionController *)v66 initWithPeerPaymentWebService:webService identityVerificationResponse:v68 setupDelegate:v69 context:self->_context];
    captureController = self->_captureController;
    self->_captureController = v70;

    v72 = [(PKPaymentDocumentSubmissionController *)self->_captureController nextViewController];
    if (v72) {
      [v92 addObject:v72];
    }

    BOOL v3 = v65;
  }
LABEL_65:
  uint64_t v74 = [v92 count];
  if (v3 && v74)
  {
    v75 = [PKPeerPaymentIdentityVerificationExplanationViewController alloc];
    int64_t context = self->_context;
    id v77 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v78 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)v75 initWithContext:context setupDelegate:v77 identityVerificationController:self];

    [v92 insertObject:v78 atIndex:0];
LABEL_69:
    [(PKPeerPaymentWebService *)self->_webService prewarmDeviceScoreForEndpoint:*MEMORY[0x1E4F87C58] recipientAddress:0 quoteDestinationType:0];
    goto LABEL_70;
  }
  if (v74) {
    goto LABEL_69;
  }
LABEL_70:
  v79 = (NSArray *)[v92 copy];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v79;

  self->_viewControllerIndex = 0;
}

- (id)_generateFieldsModel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response requiredFieldsByPage];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) requiredFields];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84C88]) initWithPaymentSetupFields:v3];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)_nextLocalViewController
{
  unint64_t viewControllerIndex = self->_viewControllerIndex;
  if (viewControllerIndex >= [(NSArray *)self->_viewControllers count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    viewControllers = self->_viewControllers;
    ++self->_viewControllerIndex;
    uint64_t v5 = -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:");
  }

  return v5;
}

- (BOOL)_hasRequiredFields
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(PKPeerPaymentIdentityVerificationResponse *)self->_response requiredFieldsByPage];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) requiredFields];
        uint64_t v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "postalAddresses", a3);
  uint64_t v6 = [v5 firstObject];
  id v8 = [v6 value];

  uint64_t v7 = v8;
  if (v8)
  {
    [(PKPaymentSetupFieldsModel *)self->_fieldsModel prefillDefaultValuesWithPostalAddress:v8];
    uint64_t v7 = v8;
  }
}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (int64_t)context
{
  return self->_context;
}

- (UIViewController)firstViewController
{
  return self->_firstViewController;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPeerPaymentIdentityVerificationResponse)response
{
  return self->_response;
}

- (PKPeerPaymentDocumentSubmissionController)captureController
{
  return self->_captureController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_firstViewController, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);

  objc_destroyWeak((id *)&self->_setupDelegate);
}

@end