@interface PKPeerPaymentIdentityVerificationExplanationViewController
- (CGSize)_snapshotSize;
- (PKPeerPaymentIdentityVerificationExplanationViewController)initWithContext:(int64_t)a3 setupDelegate:(id)a4 identityVerificationController:(id)a5;
- (id)_bodyButtonText;
- (id)_bodyText;
- (id)_titleText;
- (void)_cancel;
- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4;
- (void)_processNextViewController;
- (void)_reportAnalyticsAuthEnded:(id)a3 result:(id)a4;
- (void)_reportAnalyticsAuthStarted;
- (void)_sendAnalyticsButtonTapped:(id)a3;
- (void)_sendAnalyticsEvent:(id)a3;
- (void)_terminateFlow;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)setShowSpinner:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentIdentityVerificationExplanationViewController

- (PKPeerPaymentIdentityVerificationExplanationViewController)initWithContext:(int64_t)a3 setupDelegate:(id)a4 identityVerificationController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  v10 = [(PKExplanationViewController *)&v25 initWithContext:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_controller, a5);
    objc_storeWeak((id *)&v11->_setupDelegate, v8);
    v12 = [v9 webService];
    v13 = [v12 peerPaymentService];
    v14 = [v13 account];
    v15 = [v14 associatedPassUniqueID];

    if ([v15 length])
    {
      v16 = [MEMORY[0x1E4F84898] sharedInstance];
      v17 = [v16 passWithUniqueID:v15];
      [v17 loadImageSetSync:0 preheat:1];
      v18 = [[PKPassView alloc] initWithPass:v17 content:5 suppressedContent:512];
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)v11 _snapshotSize];
      v19 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:");
      v20 = [(PKExplanationViewController *)v11 explanationView];
      [v20 setImage:v19];
      [v20 setShowPrivacyView:0];
      v21 = [v20 imageView];
      [v21 setAccessibilityIgnoresInvertColors:1];
    }
    v22 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)v11 navigationItem];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v11 action:sel__cancel];
    [v22 setLeftBarButtonItem:v23];
  }
  return v11;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  [(PKExplanationViewController *)&v9 loadView];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  v4 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _titleText];
  [v3 setTitleText:v4];

  v5 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _bodyText];
  [v3 setBodyText:v5];

  v6 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _bodyButtonText];
  [v3 setBodyButtonText:v6];

  [v3 setTopMargin:12.0];
  v7 = [(PKPeerPaymentIdentityVerificationController *)self->_controller response];

  if (!v7)
  {
    id v8 = [v3 dockView];
    [v8 setPrimaryButton:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)&v5 viewDidAppear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsEvent:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)&v5 viewWillDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsEvent:v4];
}

- (void)setShowSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowSpinner:v3];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:v4 completion:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 0uLL:
    case 1uLL:
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsButtonTapped:*MEMORY[0x1E4F861B8]];
      objc_initWeak(location, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke;
      v21[3] = &unk_1E59D22A8;
      objc_copyWeak(&v22, location);
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _performAuthenticationLocationBased:1 withCompletion:v21];
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
      goto LABEL_11;
    case 2uLL:
      uint64_t v6 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      v7 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      id v8 = PKDisplayableErrorCustom();

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_50;
      v20[3] = &unk_1E59CA7D0;
      v20[4] = self;
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      v10 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self navigationController];
      [v10 presentViewController:v9 animated:1 completion:0];

      goto LABEL_10;
    case 3uLL:
      v11 = [v4 dockView];
      [v11 setButtonsEnabled:0];

      v12 = [v5 dockView];
      v13 = [v12 primaryButton];
      [v13 setShowSpinner:1];

      v14 = [v5 dockView];
      v15 = [v14 footerView];
      [v15 setButtonsEnabled:0];

      goto LABEL_5;
    case 4uLL:
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _terminateFlow];
      goto LABEL_11;
    case 5uLL:
      id v8 = [(PKPeerPaymentIdentityVerificationController *)self->_controller webService];
      v16 = [v8 peerPaymentService];
      id v9 = [v16 account];

      id v17 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      v18 = [[PKPeerPaymentAccountResolutionController alloc] initWithAccount:v9 webService:v8 context:[(PKExplanationViewController *)self context] delegate:self passLibraryDataProvider:v17];
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", (uint8_t *)location, 2u);
      }

      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E70], 0);
      [(PKPeerPaymentAccountResolutionController *)v18 presentFlowForAccountResolution:3 configuration:0 completion:&__block_literal_global_68];

LABEL_10:
      goto LABEL_11;
    default:
LABEL_5:
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _processNextViewController];
LABEL_11:

      return;
  }
}

void __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || v5)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 localizedDescription];
        int v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Auth error during peer payment personalization: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      [WeakRetained _processNextViewController];
    }
  }
}

void __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_36(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (a2) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_50(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v4 = [(PKPeerPaymentIdentityVerificationController *)self->_controller response];
  int v5 = [v4 learnMore];
  id v9 = [v5 buttonURL];

  if (v9)
  {
    uint64_t v6 = [v9 scheme];
    int v7 = [v6 containsString:@"http"];

    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v9];
      [v8 setModalPresentationStyle:2];
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)self presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v8 openSensitiveURL:v9 withOptions:0];
    }
  }
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsButtonTapped:*MEMORY[0x1E4F86A00]];
}

- (void)_processNextViewController
{
  controller = self->_controller;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke;
  v3[3] = &unk_1E59D22F8;
  v3[4] = self;
  [(PKPeerPaymentIdentityVerificationController *)controller nextViewControllerWithCompletion:v3];
}

void __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_2;
  block[3] = &unk_1E59D22D0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = a5;
  block[4] = v12;
  id v17 = v9;
  id v18 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1056) = *(void *)(a1 + 64);
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) navigationController];
    objc_msgSend(v7, "pushViewController:animated:", *(void *)(a1 + 40), 1, v7);
LABEL_3:

    return;
  }
  if (*(void *)(a1 + 48))
  {
    v2 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_3;
    v10[3] = &unk_1E59CA7D0;
    v10[4] = *(void *)(a1 + 32);
    id v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, v10, 0);
    id v4 = [*(id *)(a1 + 32) navigationController];
    [v4 presentViewController:v3 animated:1 completion:0];

    return;
  }
  int v5 = *(void **)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = [v5 explanationView];
    [v6 setDelegate:*(void *)(a1 + 32)];

    id v9 = [*(id *)(a1 + 32) navigationController];
    objc_msgSend(v9, "pushViewController:animated:", *(void *)(a1 + 56), 1, v9);
    goto LABEL_3;
  }
}

uint64_t __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained viewControllerDidCancelSetupFlow:self];
  }
  else {
    [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _terminateFlow];
  }
  [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsButtonTapped:*MEMORY[0x1E4F86148]];
}

- (void)_terminateFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKPeerPaymentIdentityVerificationExplanationViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_titleText
{
  v2 = [(PKPeerPaymentIdentityVerificationController *)self->_controller response];
  id v3 = [v2 title];

  if (![v3 length])
  {
    uint64_t v4 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_1.isa);

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)_bodyText
{
  v2 = [(PKPeerPaymentIdentityVerificationController *)self->_controller response];
  id v3 = [v2 subtitle];

  return v3;
}

- (id)_bodyButtonText
{
  v2 = [(PKPeerPaymentIdentityVerificationController *)self->_controller response];
  id v3 = [v2 learnMore];

  uint64_t v4 = [v3 buttonTitle];
  if (v4)
  {
    id v5 = [v3 buttonURL];

    if (v5) {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (CGSize)_snapshotSize
{
  double v2 = 220.0;
  double v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    if (v4) {
      uint64_t v7 = 1025;
    }
    else {
      uint64_t v7 = 2;
    }
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__14;
    uint64_t v20 = __Block_byref_object_dispose__14;
    id v21 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v22[0] = &unk_1EF2B8E68;
    id v8 = PKLocalizedString(&cfstr_Wallet_0.isa);
    v22[1] = &unk_1EF2B8E80;
    v23[0] = v8;
    v23[1] = MEMORY[0x1E4F1CC38];
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

    [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _reportAnalyticsAuthStarted];
    objc_initWeak(&location, self);
    id v10 = (void *)v17[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113__PKPeerPaymentIdentityVerificationExplanationViewController__performAuthenticationLocationBased_withCompletion___block_invoke;
    v11[3] = &unk_1E59D2320;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = &v16;
    [v10 evaluatePolicy:v7 options:v9 reply:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v16, 8);
  }
}

void __113__PKPeerPaymentIdentityVerificationExplanationViewController__performAuthenticationLocationBased_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _reportAnalyticsAuthEnded:v5 result:v10];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v10 || v5) {
    id v9 = *(void (**)(void))(v8 + 16);
  }
  else {
    id v9 = *(void (**)(void))(v8 + 16);
  }
  v9();
}

- (void)_reportAnalyticsAuthStarted
{
}

- (void)_reportAnalyticsAuthEnded:(id)a3 result:(id)a4
{
}

- (void)_sendAnalyticsButtonTapped:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F86120];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v4;
  v9[0] = *MEMORY[0x1E4F86380];
  v9[1] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:v8 count:2];

  [(PKPeerPaymentIdentityVerificationExplanationViewController *)self _sendAnalyticsEvent:v7];
}

- (void)_sendAnalyticsEvent:(id)a3
{
  id v3 = (id)[a3 mutableCopy];
  [v3 setObject:*MEMORY[0x1E4F86AA8] forKey:*MEMORY[0x1E4F86730]];
  [v3 setObject:*MEMORY[0x1E4F869F0] forKey:*MEMORY[0x1E4F864C8]];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87000] sendEvent:v3];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end