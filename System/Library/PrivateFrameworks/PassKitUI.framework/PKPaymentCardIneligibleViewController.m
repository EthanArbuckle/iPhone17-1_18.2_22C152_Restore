@interface PKPaymentCardIneligibleViewController
- (BOOL)preloadLearnMoreWebView;
- (NSURL)learnMoreURL;
- (PKPaymentCardIneligibleViewController)initWithReason:(int64_t)a3 context:(int64_t)a4;
- (PKPaymentProvisioningController)provisioningController;
- (id)_alertWithReason:(int64_t)a3 learnMoreURL:(id)a4 isPreloaded:(BOOL)a5;
- (id)continueActionHandler;
- (id)learnMorePresentationHandler;
- (id)terminateFlowHandler;
- (id)webView;
- (int64_t)context;
- (int64_t)reason;
- (void)_webViewDidLoad:(BOOL)a3 withError:(id)a4;
- (void)dealloc;
- (void)handleDone:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setContinueActionHandler:(id)a3;
- (void)setLearnMorePresentationHandler:(id)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setPreloadLearnMoreWebView:(BOOL)a3;
- (void)setProvisioningController:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setTerminateFlowHandler:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PKPaymentCardIneligibleViewController

- (PKPaymentCardIneligibleViewController)initWithReason:(int64_t)a3 context:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCardIneligibleViewController;
  result = [(PKPaymentCardIneligibleViewController *)&v7 init];
  if (result)
  {
    result->_reason = a3;
    result->_context = a4;
    result->_preloadLearnMoreWebView = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentCardIneligibleViewController;
  [(PKPaymentCardIneligibleViewController *)&v11 viewDidLoad];
  v3 = [(PKPaymentCardIneligibleViewController *)self view];
  v4 = [(PKPaymentCardIneligibleViewController *)self webView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v5];

  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v6];

  objc_super v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v7];

  v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_handleDone_];
  v10 = [(PKPaymentCardIneligibleViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentCardIneligibleViewController;
  [(PKPaymentCardIneligibleViewController *)&v2 dealloc];
}

- (id)webView
{
  webView = self->_webView;
  if (!webView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F466F0]);
    v5 = (WKWebView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_webView;
    self->_webView = v5;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    webView = self->_webView;
  }

  return webView;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPaymentCardIneligibleViewController *)self learnMoreURL];
  if (!v5)
  {
    objc_super v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "No Learn More URL was available";
      v15 = v7;
      uint32_t v16 = 2;
LABEL_10:
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_11:

    v17 = [(PKPaymentCardIneligibleViewController *)self _alertWithReason:self->_reason learnMoreURL:v5 isPreloaded:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__PKPaymentCardIneligibleViewController_preflightWithCompletion___block_invoke;
    v18[3] = &unk_1E59CAD68;
    id v19 = v17;
    id v20 = v4;
    id v11 = v17;
    dispatch_async(MEMORY[0x1E4F14428], v18);

    v12 = v20;
    goto LABEL_12;
  }
  BOOL preloadLearnMoreWebView = self->_preloadLearnMoreWebView;
  objc_super v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!preloadLearnMoreWebView)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      v14 = "Skipped pre-load of the Learn More URL %@";
      v15 = v7;
      uint32_t v16 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Pre-loading the learn more URL %@", buf, 0xCu);
  }

  v9 = (void *)[v4 copy];
  id preflightCompletion = self->_preflightCompletion;
  self->_id preflightCompletion = v9;

  id v11 = [MEMORY[0x1E4F290D0] requestWithURL:v5];
  v12 = [(PKPaymentCardIneligibleViewController *)self webView];
  id v13 = (id)[v12 loadRequest:v11];
LABEL_12:
}

uint64_t __65__PKPaymentCardIneligibleViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)_alertWithReason:(int64_t)a3 learnMoreURL:(id)a4 isPreloaded:(BOOL)a5
{
  id v8 = a4;
  v38 = v8;
  if (!self->_learnMorePresentationHandler) {
    goto LABEL_4;
  }
  if (v8)
  {
    if (a3 == 5)
    {
LABEL_4:
      BOOL v9 = 0;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = 0;
  if (a3 != 5 && a5) {
LABEL_7:
  }
    BOOL v9 = a3 != 6;
LABEL_8:
  int IsBridge = PKPaymentSetupContextIsBridge();
  if (PKPaymentSetupContextIsIssuerApp())
  {
    id v11 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    v12 = [v11 targetDevice];

    id v13 = [v12 deviceClass];
    int IsBridge = PKDeviceClassIsWatch();
  }
  switch(a3)
  {
    case 1:
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityUnk.isa);
      if (v9) {
        v15 = @"ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE";
      }
      else {
        v15 = @"ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE_NO_URL";
      }
      goto LABEL_24;
    case 2:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DF8], 0);
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityIne.isa);
      if (v9) {
        v15 = @"ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE";
      }
      else {
        v15 = @"ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE_NO_URL";
      }
      goto LABEL_24;
    case 3:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E00], 0);
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityUna.isa);
      v15 = @"ELIGIBILITY_UNAVAILABLE_ERROR_MESSAGE";
      goto LABEL_24;
    case 4:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DE8], 0);
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityAlr.isa);
      uint32_t v16 = 0;
      goto LABEL_26;
    case 5:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E08], 0);
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityNew.isa);
      v17 = @"ELIGIBILITY_NEWER_OS_VERSION_REQUIRED_ERROR_MESSAGE";
      goto LABEL_20;
    case 6:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DF0], 0);
      v14 = PKLocalizedPaymentString(&cfstr_EligibilityHar.isa);
      v17 = @"ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_MESSAGE";
LABEL_20:
      PKDeviceSpecificLocalizedStringKeyForKey(v17, IsBridge);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint32_t v16 = PKLocalizedPaymentString(v18);

      goto LABEL_26;
    case 7:
      v14 = PKLocalizedLynxString(&cfstr_EligibilityErr.isa);
      uint64_t v19 = PKLocalizedLynxString(&cfstr_EligibilityErr_0.isa);
      goto LABEL_25;
    default:
      v14 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
      v15 = @"COULD_NOT_ADD_CARD_MESSAGE";
LABEL_24:
      uint64_t v19 = PKLocalizedPaymentString(&v15->isa);
LABEL_25:
      uint32_t v16 = (void *)v19;
LABEL_26:
      id v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
      if (PKPaymentSetupContextIsSetupAssistant()
        && (-[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue"), v21 = objc_claimAutoreleasedReturnValue(), unint64_t v22 = [v21 count], v21, v22 <= 1))
      {
        uint64_t v23 = (void *)MEMORY[0x1E4FB1410];
        v24 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke;
        v47[3] = &unk_1E59CB1F0;
        v47[4] = self;
        v25 = [v23 actionWithTitle:v24 style:0 handler:v47];
        [v20 addAction:v25];

        v26 = @"COULD_NOT_ADD_CARD_TRY_ANOTHER_CARD";
      }
      else if (a3 == 5)
      {
        v26 = @"ELIGIBILITY_CANCEL_BUTTON_TITLE";
      }
      else
      {
        v26 = @"ELIGIBILITY_OK_BUTTON_TITLE";
      }
      v27 = PKLocalizedPaymentString(&v26->isa);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_2;
      aBlock[3] = &unk_1E59CB1F0;
      aBlock[4] = self;
      v28 = _Block_copy(aBlock);
      if (v9)
      {
        v29 = (void *)MEMORY[0x1E4FB1410];
        v30 = PKLocalizedPaymentString(&cfstr_EligibilityLea.isa);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_3;
        v41[3] = &unk_1E59D2A40;
        BOOL v45 = a5;
        id v42 = v38;
        v43 = self;
        id v44 = v28;
        v31 = [v29 actionWithTitle:v30 style:0 handler:v41];
        [v20 addAction:v31];
      }
      v32 = [MEMORY[0x1E4FB1410] actionWithTitle:v27 style:1 handler:v28];
      [v20 addAction:v32];

      char IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
      if (a3 == 5 && (IsSetupAssistant & 1) == 0)
      {
        v34 = (void *)MEMORY[0x1E4FB1410];
        v35 = PKLocalizedPaymentString(&cfstr_EligibilitySof.isa);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_4;
        v39[3] = &unk_1E59D0C60;
        v39[4] = self;
        id v40 = v28;
        v36 = [v34 actionWithTitle:v35 style:0 handler:v39];
        [v20 addAction:v36];
      }
      return v20;
  }
}

uint64_t __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1048);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1040);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(void *)(a1 + 32) && !*(unsigned char *)(a1 + 56))
  {
    v3 = [*(id *)(a1 + 40) webView];
    id v4 = [MEMORY[0x1E4F290D0] requestWithURL:*(void *)(a1 + 32)];
    id v5 = (id)[v3 loadRequest:v4];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:*(void *)(a1 + 40)];
  [v6 setModalPresentationStyle:2];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 1032) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  int IsBridge = PKPaymentSetupContextIsBridge();
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  if (IsBridge) {
    id v5 = @"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK";
  }
  else {
    id v5 = @"prefs:root=General&path=SOFTWARE_UPDATE_LINK";
  }
  v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  [v4 openSensitiveURL:v6 withOptions:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_webViewDidLoad:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_preflightCompletion)
  {
    id v8 = [(PKPaymentCardIneligibleViewController *)self _alertWithReason:self->_reason learnMoreURL:0 isPreloaded:v4];
    BOOL v9 = _Block_copy(self->_preflightCompletion);
    id preflightCompletion = self->_preflightCompletion;
    self->_id preflightCompletion = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke;
    block[3] = &unk_1E59D2A68;
    id v23 = v9;
    id v21 = v8;
    id v22 = v7;
    id v11 = v8;
    id v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_6:
    goto LABEL_7;
  }
  if (v6 && !v4)
  {
    id v13 = (void *)MEMORY[0x1E4FB1418];
    v14 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
    v15 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
    id v12 = [v13 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

    uint32_t v16 = (void *)MEMORY[0x1E4FB1410];
    v17 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke_2;
    v19[3] = &unk_1E59CB1F0;
    v19[4] = self;
    v18 = [v16 actionWithTitle:v17 style:1 handler:v19];

    [v12 addAction:v18];
    [(PKPaymentCardIneligibleViewController *)self presentViewController:v12 animated:1 completion:0];

    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Learn More webview finished loading", v6, 2u);
  }

  [(PKPaymentCardIneligibleViewController *)self _webViewDidLoad:1 withError:0];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Learn More webview failed to load with error %@", (uint8_t *)&v8, 0xCu);
  }

  [(PKPaymentCardIneligibleViewController *)self _webViewDidLoad:0 withError:v6];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v12 = a4;
  id v6 = (void (**)(id, uint64_t))a5;
  uint64_t v7 = [v12 navigationType];
  if (v7 == -1)
  {
    uint64_t v11 = 1;
  }
  else
  {
    if (!v7 && (PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      int v8 = [v12 request];
      id v9 = [v8 URL];

      uint64_t v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v10 openURL:v9 configuration:0 completionHandler:0];
    }
    uint64_t v11 = 0;
  }
  v6[2](v6, v11);
}

- (void)handleDone:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (id)learnMorePresentationHandler
{
  return self->_learnMorePresentationHandler;
}

- (void)setLearnMorePresentationHandler:(id)a3
{
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
}

- (id)terminateFlowHandler
{
  return self->_terminateFlowHandler;
}

- (void)setTerminateFlowHandler:(id)a3
{
}

- (BOOL)preloadLearnMoreWebView
{
  return self->_preloadLearnMoreWebView;
}

- (void)setPreloadLearnMoreWebView:(BOOL)a3
{
  self->_BOOL preloadLearnMoreWebView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_terminateFlowHandler, 0);
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong(&self->_learnMorePresentationHandler, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong(&self->_preflightCompletion, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end