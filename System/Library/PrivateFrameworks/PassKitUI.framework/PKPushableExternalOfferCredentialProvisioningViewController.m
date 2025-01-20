@interface PKPushableExternalOfferCredentialProvisioningViewController
- (BOOL)isRunningInForeground;
- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator;
- (PKPushableExternalOfferCredentialProvisioningViewController)initWithContext:(int64_t)a3 credential:(id)a4 reporter:(id)a5;
- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4;
- (int64_t)_accessPassType;
- (void)_loadPassThumbnail;
- (void)_setContinueButtonText;
- (void)_setTitleAndBodyText;
- (void)_showExitingLostModeUI;
- (void)_startProvisioning;
- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4;
- (void)cancelButtonPressed;
- (void)continueButtonPressed;
- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4;
- (void)setCoordinator:(id)a3;
- (void)setIsRunningInForeground:(BOOL)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)showLoadingUI;
- (void)showStartingUI;
- (void)showSuccessUI;
- (void)showWithProvisioningError:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPushableExternalOfferCredentialProvisioningViewController

- (PKPushableExternalOfferCredentialProvisioningViewController)initWithContext:(int64_t)a3 credential:(id)a4 reporter:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  v11 = [(PKPassShareRedemptionViewController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_context = a3;
    objc_storeStrong((id *)&v11->_credential, a4);
    objc_storeStrong((id *)&v12->_reporter, a5);
    v12->_isRunningInForeground = 1;
    v12->_autoProvision = 1;
    unint64_t v13 = [(PKPaymentExternalOfferCredential *)v12->_credential cardType];
    if (v13 <= 4) {
      a5 = **((id **)&unk_1E59CF6A0 + v13);
    }
    [(PKProvisioningAnalyticsSessionUIReporter *)v12->_reporter setProductType:a5 subtype:0];
  }
  return v12;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 viewDidLoad];
  if (self->_autoProvision) {
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self showLoadingUI];
  }
  else {
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self showStartingUI];
  }
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self _loadPassThumbnail];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  if (self->_autoProvision)
  {
    self->_autoProvision = 0;
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self continueButtonPressed];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPushableExternalOfferCredentialProvisioningViewController *)&v4 viewDidDisappear:a3];
  if ([(PKPushableExternalOfferCredentialProvisioningViewController *)self isMovingFromParentViewController])[(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter resetProductTypes]; {
}
  }

- (void)cancelButtonPressed
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v4 cancelButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  objc_super v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self _terminateSetupFlowWithPasses:0 error:v3];
}

- (void)continueButtonPressed
{
  v3.receiver = self;
  v3.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 continueButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self _startProvisioning];
}

- (void)_startProvisioning
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - starting provisioning", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v7[0] = self->_credential;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [WeakRetained startProvisioningWithCredentials:v5];
}

- (void)_loadPassThumbnail
{
  objc_super v3 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  [v3 showLoadingContent];
  objc_super v4 = [(PKPaymentExternalOfferCredential *)self->_credential passThumbnailImageURL];
  v5 = PKUIImageNamed(@"PlaceholderCardArt_Large");
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__PKPushableExternalOfferCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
    v6[3] = &unk_1E59CF680;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    PKCommonCachedImageFromURL(v4, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self setPassThumbnailImage:v5];
  }
}

void __81__PKPushableExternalOfferCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v4 = (id *)(a1 + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = v5;
  if (!v5) {
    id v7 = *(id *)(a1 + 32);
  }
  id v8 = WeakRetained;
  [WeakRetained setPassThumbnailImage:v7];
}

- (void)setPassThumbnailImage:(id)a3
{
  p_passThumbnailImage = &self->_passThumbnailImage;
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
  id v6 = a3;
  id v7 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  [v7 setCardImage:*p_passThumbnailImage];

  [v7 hideLoadingContent];
}

- (void)showStartingUI
{
  v5.receiver = self;
  v5.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v5 showStartingUI];
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self _setTitleAndBodyText];
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self _setContinueButtonText];
  objc_super v3 = [(PKPushableExternalOfferCredentialProvisioningViewController *)self navigationItem];
  objc_super v4 = [v3 leftBarButtonItem];
  [v4 setEnabled:1];
}

- (void)_setTitleAndBodyText
{
  PKLocalizedPaymentOffersString(&cfstr_ProvisionPassT.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];
}

- (void)_setContinueButtonText
{
  PKLocalizedIdentityString(&cfstr_AddPushableIde.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPassShareRedemptionViewController *)self setContinueButtonText:v3];
}

- (void)_showExitingLostModeUI
{
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self showLoadingUI];
  PKLocalizedShareableCredentialString(&cfstr_ExitingLostMod.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];
}

- (void)showLoadingUI
{
  v6.receiver = self;
  v6.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v6 showLoadingUI];
  id v3 = PKLocalizedPaymentOffersString(&cfstr_ProvisionAddin.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  objc_super v4 = [(PKPushableExternalOfferCredentialProvisioningViewController *)self navigationItem];
  objc_super v5 = [v4 leftBarButtonItem];
  [v5 setEnabled:0];
}

- (void)showSuccessUI
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87020];
  uint64_t v8 = *MEMORY[0x1E4F86308];
  v9[0] = *MEMORY[0x1E4F86448];
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 subject:v4 sendEvent:v5];

  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
  objc_super v6 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v6 setShowCheckmark:1];

  id v7 = PKLocalizedPaymentOffersString(&cfstr_ProvisionCardA.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v7];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    objc_super v6 = [v4 underlyingError];
    objc_super v5 = [(PKPushableExternalOfferCredentialProvisioningViewController *)self _provisioningErrorWithNumberOfPassesFailed:1 error:v6];
  }
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v9[3] = &unk_1E59CA7D0;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v8[3] = &unk_1E59CA7D0;
  id v7 = [MEMORY[0x1E4FB1418] alertForErrorWithError:v4 acknowledgeButtonText:0 exitButtonText:0 onAcknowledge:&__block_literal_global_51 onExit:v9 onTryAgain:v8];
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87020];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F86440];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 subject:v3 sendEvent:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1408));
  [WeakRetained cancel];
}

uint64_t __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueButtonPressed];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1)
    {
      [(PKPushableExternalOfferCredentialProvisioningViewController *)self _showExitingLostModeUI];
      return;
    }
LABEL_7:
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self showLoadingUI];
    return;
  }
  if (a3 == 8)
  {
    [(PKPushableExternalOfferCredentialProvisioningViewController *)self showSuccessUI];
    return;
  }
  if (self->_autoProvision) {
    goto LABEL_7;
  }
  [(PKPushableExternalOfferCredentialProvisioningViewController *)self showStartingUI];
}

- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = [v6 count];
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Pushable External Offer Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
  }

  id v9 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  uint64_t v14 = *MEMORY[0x1E4F86F40];
  if (v10) {
    v11 = (uint64_t *)MEMORY[0x1E4F86440];
  }
  else {
    v11 = (uint64_t *)MEMORY[0x1E4F86448];
  }
  uint64_t v15 = *v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  objc_msgSend(v9, "sendEventForPage:error:specifics:", 2, v7, v12, v14);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  [WeakRetained pushableViewController:self didFailWithError:v7];
}

- (int64_t)_accessPassType
{
  return 0;
}

- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  char v16 = 1;
  uint64_t v7 = [(PKPushableExternalOfferCredentialProvisioningViewController *)self _accessPassType];
  uint64_t v8 = PKAddSEPassDisplayableError(v6, a3, v7, &v16);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    PKAddSEPassGenericDisplayableError(a3, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (v16) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 4;
  }
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = v6;
  }
  uint64_t v14 = [MEMORY[0x1E4F84ED8] errorWithUnderlyingError:v13 defaultSeverity:v12];

  return v14;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
}

- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (PKPushableCredentialProvisioningViewControllerCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)isRunningInForeground
{
  return self->_isRunningInForeground;
}

- (void)setIsRunningInForeground:(BOOL)a3
{
  self->_isRunningInForeground = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_reporter, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end