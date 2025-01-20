@interface PKPeerPaymentGraduationExplanationViewController
- (BOOL)allowsManualEntry;
- (PKPeerPaymentGraduationExplanationViewController)initWithPeerPaymentWebService:(id)a3 peerPaymentAccount:(id)a4 passLibraryDataProvider:(id)a5 setupDelegate:(id)a6 context:(int64_t)a7;
- (void)_presentGenericError;
- (void)_presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:(BOOL)a3;
- (void)_presentTermsWithTermsResponse:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentGraduationExplanationViewController

- (PKPeerPaymentGraduationExplanationViewController)initWithPeerPaymentWebService:(id)a3 peerPaymentAccount:(id)a4 passLibraryDataProvider:(id)a5 setupDelegate:(id)a6 context:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentGraduationExplanationViewController;
  v17 = [(PKExplanationViewController *)&v33 initWithContext:a7];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerPaymentWebService, a3);
    objc_storeStrong((id *)&v18->_peerPaymentAccount, a4);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
    objc_storeWeak((id *)&v18->_passLibraryDataProvider, v15);
    v19 = [(PKPeerPaymentAccount *)v18->_peerPaymentAccount associatedPassUniqueID];
    if ([v19 length])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v18->_passLibraryDataProvider);
      v21 = [WeakRetained passWithUniqueID:v19];

      [v21 loadImageSetSync:0 preheat:1];
      v22 = [[PKPassView alloc] initWithPass:v21 content:5 suppressedContent:512];
      -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v22, "snapshotOfFrontFaceWithRequestedSize:", 257.0, 157.0);
      v32 = v19;
      id v23 = v16;
      id v24 = v15;
      id v25 = v14;
      v27 = id v26 = v13;
      v28 = [(PKExplanationViewController *)v18 explanationView];
      [v28 setImage:v27];
      v29 = [v28 imageView];
      [v29 setAccessibilityIgnoresInvertColors:1];

      id v13 = v26;
      id v14 = v25;
      id v15 = v24;
      id v16 = v23;
      v19 = v32;
    }
    v30 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 2);
    [(PKExplanationViewController *)v18 setPrivacyLinkController:v30];

    [(PKExplanationViewController *)v18 setShowDoneButton:0];
    [(PKExplanationViewController *)v18 setShowCancelButton:1];
    [(PKExplanationViewController *)v18 setExplanationViewControllerDelegate:v18];
  }
  return v18;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentGraduationExplanationViewController;
  [(PKExplanationViewController *)&v8 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_1.isa);
  [v3 setTitleText:v4];

  v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentGra.isa);
  [v3 setBodyText:v5];

  [v3 setShowPrivacyView:1];
  [v3 setTopMargin:12.0];
  [v3 setBodyDataDetectorTypes:0];
  v6 = [v3 dockView];
  v7 = [v6 footerView];
  [v7 setSetupLaterButton:0];
  [v7 setManualEntryButton:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
}

- (void)_presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84DA0]);
  v6 = v5;
  if (v3) {
    [v5 setPrerequisiteIdentifier:*MEMORY[0x1E4F87C80]];
  }
  v7 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService context];
  objc_msgSend(v6, "setDevSigned:", objc_msgSend(v7, "devSigned"));

  [(PKPeerPaymentGraduationExplanationViewController *)self _showSpinner:1];
  peerPaymentWebService = self->_peerPaymentWebService;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke;
  v9[3] = &unk_1E59D6D18;
  v9[4] = self;
  [(PKPeerPaymentWebService *)peerPaymentWebService peerPaymentIdentityVerificationRequest:v6 completion:v9];
}

void __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSpinner:0];
  if (PKPeerPaymentWebServiceErrorIsTermsAcceptanceRequiredError())
  {
    id v19 = *(id *)(a1 + 40);
    v2 = [v19 domain];
    int v3 = [v2 isEqualToString:*MEMORY[0x1E4F871A0]];

    if (v3)
    {
      v4 = [v19 userInfo];
      uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      id v6 = (void *)v5;
    }
    else
    {
      id v6 = v19;
    }
    id v20 = v6;
    id v8 = [v6 userInfo];
    v9 = [v8 objectForKey:*MEMORY[0x1E4F87EF8]];

    [*(id *)(a1 + 32) _presentTermsWithTermsResponse:v9];
  }
  else if (*(void *)(a1 + 48) && !*(void *)(a1 + 40))
  {
    id v10 = [PKPeerPaymentIdentityVerificationController alloc];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 1040);
    uint64_t v13 = *(void *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(v11 + 1056));
    id v15 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:](v10, "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", v12, v13, WeakRetained, 1, [*(id *)(a1 + 32) context]);

    id v16 = [(PKPeerPaymentIdentityVerificationController *)v15 firstViewController];
    if (v16)
    {
      v17 = [[PKNavigationController alloc] initWithRootViewController:v16];
      [(PKNavigationController *)v17 setModalInPresentation:1];
      [(PKNavigationController *)v17 setSupportedInterfaceOrientations:2];
      PKPaymentSetupApplyContextAppearance([*(id *)(a1 + 32) context], v17);
      [*(id *)(a1 + 32) presentViewController:v17 animated:1 completion:0];
    }
    else
    {
      v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Error: no view controller defined for identity verification flow", buf, 2u);
      }

      [*(id *)(a1 + 32) _presentGenericError];
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    [v7 _presentGenericError];
  }
}

- (void)_presentTermsWithTermsResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 termsURL];
  uint64_t v6 = [v4 termsIdentifier];
  id v7 = (void *)v6;
  if (!v5 || !v6)
  {
    uint64_t v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsURL];

    uint64_t v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsIdentifier];

    id v7 = (void *)v9;
    uint64_t v5 = (void *)v8;
  }
  id v10 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
  if (v5 && v7)
  {
    [(PKPeerPaymentGraduationExplanationViewController *)self _showSpinner:1];
    uint64_t v11 = [PKPeerPaymentTermsController alloc];
    uint64_t v12 = v11;
    if (self->_peerPaymentWebService)
    {
      uint64_t v13 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v11, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v5, v7, v10);
    }
    else
    {
      id v15 = [MEMORY[0x1E4F84E10] sharedService];
      uint64_t v13 = [(PKPeerPaymentTermsController *)v12 initWithTermsURL:v5 termsIdentifier:v7 passUniqueID:v10 webService:v15];
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke;
    v16[3] = &unk_1E59CC670;
    objc_copyWeak(&v17, (id *)buf);
    [(PKPeerPaymentTermsController *)v13 presentTermsOverController:self showInterstitialViewController:0 withCompletionHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Error cannot present terms for url %@ and terms identifier %@", buf, 0x16u);
    }

    [(PKPeerPaymentGraduationExplanationViewController *)self _presentGenericError];
  }
}

void __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showSpinner:0];
    if (a2 == 1)
    {
      uint64_t v5 = &v7;
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v6 = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_3;
      goto LABEL_6;
    }
    if (a2 == 2)
    {
      uint64_t v5 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      uint64_t v6 = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_2;
LABEL_6:
      v5[2] = (uint64_t)v6;
      v5[3] = (uint64_t)&unk_1E59CA7D0;
      v5[4] = (uint64_t)v4;
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v7, v8);
    }
  }
}

uint64_t __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:0];
}

void __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
  [WeakRetained viewControllerDidCancelSetupFlow:*(void *)(a1 + 32)];
}

- (void)_presentGenericError
{
  int v3 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPeerPaymentGraduationExplanationViewController__presentGenericError__block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, v6, 0);
  if (v4)
  {
    [(PKPeerPaymentGraduationExplanationViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
}

void __72__PKPeerPaymentGraduationExplanationViewController__presentGenericError__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
  [WeakRetained viewControllerDidTerminateSetupFlow:*(void *)(a1 + 32)];
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKExplanationViewController *)self explanationView];
  id v11 = [v5 dockView];

  uint64_t v6 = [v11 primaryButton];
  [v6 setShowSpinner:v3];

  uint64_t v7 = v3 ^ 1;
  [v11 setButtonsEnabled:v7];
  uint64_t v8 = [(PKPeerPaymentGraduationExplanationViewController *)self navigationItem];
  uint64_t v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:v7];

  id v10 = [v8 rightBarButtonItem];
  [v10 setEnabled:v7];
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);

  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
}

@end