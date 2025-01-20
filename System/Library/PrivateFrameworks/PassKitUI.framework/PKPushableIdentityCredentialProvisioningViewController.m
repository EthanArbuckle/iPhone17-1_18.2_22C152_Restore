@interface PKPushableIdentityCredentialProvisioningViewController
- (BOOL)_unifiedAccessPassStatus;
- (BOOL)isRunningInForeground;
- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator;
- (PKPushableIdentityCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6;
- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4;
- (int64_t)_accessPassType;
- (void)_continueProvisioning;
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

@implementation PKPushableIdentityCredentialProvisioningViewController

- (PKPushableIdentityCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6
{
  id v8 = a4;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  v14 = [(PKPassShareRedemptionViewController *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_credentials, v8);
    objc_storeStrong((id *)&v15->_configuration, a5);
    objc_storeStrong((id *)&v15->_reporter, a6);
    v15->_isRunningInForeground = 1;
    v15->_isUnifiedAccessPass = [(PKPushableIdentityCredentialProvisioningViewController *)v15 _unifiedAccessPassStatus];
    v16 = [(NSArray *)v15->_credentials firstObject];
    unint64_t v17 = [v16 cardType];
    if (v17 <= 4) {
      id v8 = **((id **)&unk_1E59D5490 + v17);
    }

    [(PKProvisioningAnalyticsSessionUIReporter *)v15->_reporter setProductType:v8 subtype:0];
  }

  return v15;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 viewDidLoad];
  [(PKPushableIdentityCredentialProvisioningViewController *)self showStartingUI];
  [(PKPushableIdentityCredentialProvisioningViewController *)self _loadPassThumbnail];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPushableIdentityCredentialProvisioningViewController *)&v4 viewDidDisappear:a3];
  if ([(PKPushableIdentityCredentialProvisioningViewController *)self isMovingFromParentViewController])[(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter resetProductTypes]; {
}
  }

- (BOOL)_unifiedAccessPassStatus
{
  return [(NSArray *)self->_credentials pk_containsObjectPassingTest:&__block_literal_global_107];
}

BOOL __82__PKPushableIdentityCredentialProvisioningViewController__unifiedAccessPassStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 source] == 5;
}

- (void)cancelButtonPressed
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v4 cancelButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  objc_super v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  [(PKPushableIdentityCredentialProvisioningViewController *)self _terminateSetupFlowWithPasses:0 error:v3];
}

- (void)continueButtonPressed
{
  v3.receiver = self;
  v3.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 continueButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  if (self->_hasConfiguredCredential) {
    [(PKPushableIdentityCredentialProvisioningViewController *)self _continueProvisioning];
  }
  else {
    [(PKPushableIdentityCredentialProvisioningViewController *)self _startProvisioning];
  }
}

- (void)_startProvisioning
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - starting provisioning", (uint8_t *)buf, 2u);
  }

  if ([(NSArray *)self->_credentials count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    [WeakRetained startProvisioningWithCredentials:self->_credentials];
  }
  else if (self->_configuration)
  {
    [(PKPushableIdentityCredentialProvisioningViewController *)self showLoadingUI];
    objc_initWeak(buf, self);
    id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
    if (([(PKAddIdentityDocumentConfiguration *)self->_configuration hasRequiredDataForProvisioning] & 1) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke;
      v10[3] = &unk_1E59D0108;
      v10[4] = self;
      objc_copyWeak(&v11, buf);
      [v5 addOperation:v10];
      objc_destroyWeak(&v11);
    }
    v6 = [MEMORY[0x1E4F1CA98] null];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_5;
    v8[3] = &unk_1E59D5420;
    objc_copyWeak(&v9, buf);
    v8[4] = self;
    id v7 = (id)[v5 evaluateWithInput:v6 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PKPushableIdentityCredentialProvisioningViewController *)self showStartingUI];
  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 1376);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_2;
  v15[3] = &unk_1E59D53F8;
  v15[4] = v11;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v16 = v14;
  [v10 configurePushProvisioningConfigurationV2:v12 completion:v15];

  objc_destroyWeak(&v18);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 identityDocumentConfiguration];
  id v7 = (id *)(*(void *)(a1 + 32) + 1376);
  if (v5 || !v6)
  {
    id v8 = *v7;
    *id v7 = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_3;
    block[3] = &unk_1E59D1400;
    id v10 = v5;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v12);
  }
  else
  {
    objc_storeStrong(v7, v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_3(uint64_t a1)
{
  v2 = PKSharingDisplayableError(*(NSError **)(a1 + 32));
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_4;
  id v8 = &unk_1E59CB010;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v3 = v2;
  id v9 = v3;
  id v4 = PKAlertForDisplayableErrorWithHandlers(v3, &v5, 0, 0);
  if (v4) {
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);
  }

  objc_destroyWeak(&v10);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _terminateSetupFlowWithPasses:0 error:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_6;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([*(id *)(a1 + 32) isCanceled])
    {
      [v4 showStartingUI];
    }
    else
    {
      *((unsigned char *)v4 + 1393) = 1;
      id v3 = objc_loadWeakRetained(v4 + 178);
      [v3 startProvisioningWithConfiguration:*(void *)(*(void *)(a1 + 40) + 1376)];
    }
    id WeakRetained = v4;
  }
}

- (void)_continueProvisioning
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - continuing provisioning", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  [WeakRetained continueProvisioning];
}

- (void)_loadPassThumbnail
{
  id v3 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  [v3 showLoadingContent];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  id v5 = v4;
  if (self->_provisioningTemplateIdentifier)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [MEMORY[0x1E4F84EC8] sharedInstance];
    provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3;
    v8[3] = &unk_1E59D5470;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    [v6 cardArtworkForTemplateIdentifier:provisioningTemplateIdentifier completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[172];
  if (v3)
  {
    id v4 = [v3 metadata];
    id v5 = [v4 underlyingPreview];

    uint64_t v6 = [v5 thumbnailURL];
    uint64_t v7 = [v5 passThumbnailImage];
    if (v6)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2;
      v15[3] = &unk_1E59D5448;
      objc_copyWeak(&v16, &location);
      PKCommonCachedImageFromURL(v6, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      id v11 = *(void **)(a1 + 32);
      if (v7)
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v7];
      }
      else
      {
        uint64_t v12 = PKUIImageNamed(@"Generic-Shared-Key");
      }
      id v13 = (void *)v12;
      [v11 setPassThumbnailImage:v12];
    }
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v14 = [*(id *)(*(void *)(a1 + 32) + 1368) firstObject];
    id v9 = [v14 passThumbnailImageData];
    id v10 = (void *)[v8 initWithData:v9];
    [v2 setPassThumbnailImage:v10];
  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPassThumbnailImage:v4];
}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v3];
    [WeakRetained setPassThumbnailImage:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
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
  v6.receiver = self;
  v6.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v6 showStartingUI];
  id v3 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:v3];
  [(PKPushableIdentityCredentialProvisioningViewController *)self _setTitleAndBodyText];
  [(PKPushableIdentityCredentialProvisioningViewController *)self _setContinueButtonText];
  id v4 = [(PKPushableIdentityCredentialProvisioningViewController *)self navigationItem];
  id v5 = [v4 leftBarButtonItem];
  [v5 setEnabled:1];
}

- (void)_setTitleAndBodyText
{
  id v3 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v4 = [v3 provisioningString:@"PROVISION_PUSHABLE_IDENTITY_PASS_TITLE" templateIdentifier:self->_provisioningTemplateIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKLocalizedIdentityString(&cfstr_ProvisionPusha.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v6;

  [(PKPaymentSetupOptionsViewController *)self setTitleText:v12];
  id v7 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v8 = [v7 provisioningString:@"PROVISION_PUSHABLE_IDENTITY_PASS_BODY" templateIdentifier:self->_provisioningTemplateIdentifier];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    PKLocalizedIdentityString(&cfstr_ProvisionPusha_0.isa);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v11];
}

- (void)_setContinueButtonText
{
  id v3 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v4 = [v3 provisioningString:@"ADD_PUSHABLE_IDENTITY_PASS_CONTINUE_TITLE" templateIdentifier:self->_provisioningTemplateIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKLocalizedIdentityString(&cfstr_AddPushableIde.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  [(PKPassShareRedemptionViewController *)self setContinueButtonText:v7];
}

- (void)_showExitingLostModeUI
{
  [(PKPushableIdentityCredentialProvisioningViewController *)self showLoadingUI];
  id v3 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v4 = [v3 provisioningString:@"EXITING_LOST_MODE_SHAREABLE_CREDENTIAL_PASS" templateIdentifier:self->_provisioningTemplateIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKLocalizedShareableCredentialString(&cfstr_ExitingLostMod.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  [(PKPaymentSetupOptionsViewController *)self setTitleText:v7];
}

- (void)showLoadingUI
{
  v10.receiver = self;
  v10.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v10 showLoadingUI];
  id v3 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v4 = [v3 provisioningString:@"ADDING_SHAREABLE_CREDENTIAL_PASS" templateIdentifier:self->_provisioningTemplateIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKLocalizedShareableCredentialString(&cfstr_AddingShareabl.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  [(PKPaymentSetupOptionsViewController *)self setTitleText:v7];
  id v8 = [(PKPushableIdentityCredentialProvisioningViewController *)self navigationItem];
  id v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:0];
}

- (void)showSuccessUI
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
  uint64_t v7 = *MEMORY[0x1E4F86F40];
  v8[0] = *MEMORY[0x1E4F86448];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 sendEventForPage:2 specifics:v4];

  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
  id v5 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v5 setShowCheckmark:1];

  id v6 = PKLocalizedShareableCredentialString(&cfstr_DoneAddingShar.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    double v6 = (double)[(NSArray *)self->_credentials count];
    uint64_t v7 = [(PKAddIdentityDocumentConfiguration *)self->_configuration metadataProviders];
    unint64_t v8 = (unint64_t)fmax(v6, (double)(unint64_t)[v7 count]);

    id v9 = [v4 underlyingError];
    id v5 = [(PKPushableIdentityCredentialProvisioningViewController *)self _provisioningErrorWithNumberOfPassesFailed:v8 error:v9];
  }
  objc_super v10 = (void *)MEMORY[0x1E4FB1418];
  v13[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v14[3] = &unk_1E59CA870;
  v14[4] = self;
  id v15 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v13[3] = &unk_1E59CA7D0;
  id v11 = v4;
  id v12 = [v10 alertForErrorWithError:v11 acknowledgeButtonText:0 exitButtonText:0 onAcknowledge:&__block_literal_global_104 onExit:v14 onTryAgain:v13];
  [(PKPushableIdentityCredentialProvisioningViewController *)self presentViewController:v12 animated:1 completion:0];
}

void __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) analyticsReporter];
  id v3 = [*(id *)(a1 + 40) underlyingError];
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  uint64_t v7 = *MEMORY[0x1E4F86F40];
  v8[0] = *MEMORY[0x1E4F86440];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 sendEventForPage:2 error:v4 specifics:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1424));
  [WeakRetained cancel];
}

uint64_t __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueButtonPressed];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1) {
      [(PKPushableIdentityCredentialProvisioningViewController *)self _showExitingLostModeUI];
    }
    else {
      [(PKPushableIdentityCredentialProvisioningViewController *)self showLoadingUI];
    }
  }
  else if (a3 == 8)
  {
    [(PKPushableIdentityCredentialProvisioningViewController *)self showSuccessUI];
  }
  else
  {
    [(PKPushableIdentityCredentialProvisioningViewController *)self showStartingUI];
  }
}

- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = [v6 count];
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
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
    id v11 = (uint64_t *)MEMORY[0x1E4F86440];
  }
  else {
    id v11 = (uint64_t *)MEMORY[0x1E4F86448];
  }
  uint64_t v15 = *v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
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
  uint64_t v7 = [(PKPushableIdentityCredentialProvisioningViewController *)self _accessPassType];
  unint64_t v8 = PKAddSEPassDisplayableError(v6, a3, v7, &v16);
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
  id v11 = v10;

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
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_credentials, 0);
}

@end