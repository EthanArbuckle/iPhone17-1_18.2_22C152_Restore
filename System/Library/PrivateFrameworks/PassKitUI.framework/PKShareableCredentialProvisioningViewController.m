@interface PKShareableCredentialProvisioningViewController
- (BOOL)isRunningInForeground;
- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator;
- (PKShareableCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6;
- (PKSharingPushProvisioningInvitation)invitation;
- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4;
- (void)_continueProvisioning;
- (void)_loadPassThumbnail;
- (void)_showExitingLostModeUI;
- (void)_startProvisioning;
- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4;
- (void)activationCodeDidChangeToCode:(id)a3;
- (void)cancelButtonPressed;
- (void)continueButtonPressed;
- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4;
- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3;
- (void)setCoordinator:(id)a3;
- (void)setInvitation:(id)a3;
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

@implementation PKShareableCredentialProvisioningViewController

- (PKShareableCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKShareableCredentialProvisioningViewController;
  v14 = [(PKPassShareRedemptionViewController *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    p_credentials = (id *)&v14->_credentials;
    objc_storeStrong((id *)&v14->_credentials, a4);
    objc_storeStrong((id *)&v15->_configuration, a5);
    objc_storeStrong((id *)&v15->_reporter, a6);
    v15->_isRunningInForeground = 1;
    uint64_t v17 = [(PKAddShareablePassConfiguration *)v15->_configuration credentialsMetadata];
    uint64_t v18 = [(id)v17 firstObject];
    v19 = [(id)v18 preview];
    uint64_t v20 = [v19 provisioningTemplateIdentifier];
    provisioningTemplateIdentifier = v15->_provisioningTemplateIdentifier;
    v15->_provisioningTemplateIdentifier = (NSString *)v20;

    LOBYTE(v17) = objc_msgSend(*p_credentials, "pk_containsObjectPassingTest:", &__block_literal_global_235);
    id v22 = [(PKAddShareablePassConfiguration *)v15->_configuration credentialsMetadata];
    LOBYTE(v18) = objc_msgSend(v22, "pk_containsObjectPassingTest:", &__block_literal_global_55_0);

    v15->_isUnifiedAccessPass = v17 | v18;
    v23 = [*p_credentials firstObject];
    unint64_t v24 = [v23 cardType];
    if (v24 <= 4) {
      id v22 = **((id **)&unk_1E59DFEC8 + v24);
    }

    [(PKProvisioningAnalyticsSessionUIReporter *)v15->_reporter setProductType:v22 subtype:0];
  }

  return v15;
}

BOOL __102__PKShareableCredentialProvisioningViewController_initWithContext_credentials_configuration_reporter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source] == 5;
}

BOOL __102__PKShareableCredentialProvisioningViewController_initWithContext_credentials_configuration_reporter___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 accountHash];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 viewDidLoad];
  [(PKShareableCredentialProvisioningViewController *)self showStartingUI];
  [(PKShareableCredentialProvisioningViewController *)self _loadPassThumbnail];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKShareableCredentialProvisioningViewController *)&v4 viewDidDisappear:a3];
  if ([(PKShareableCredentialProvisioningViewController *)self isMovingFromParentViewController])[(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter resetProductTypes]; {
}
  }

- (void)setInvitation:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_invitation, a3);
  v5 = [(PKSharingPushProvisioningInvitation *)self->_invitation activationOptions];
  [(PKPassShareRedemptionViewController *)self setActivationOptions:v5];

  v6 = [(PKSharingPushProvisioningInvitation *)self->_invitation proprietaryData];
  v7 = [v6 displayableSharedEntitlements];
  [(PKPassShareRedemptionViewController *)self setDisplayableSharedEntitlements:v7];

  [(PKPassShareRedemptionViewController *)self setAnalyticsEnabled:1];
  v8 = [(PKSharingPushProvisioningInvitation *)self->_invitation proprietaryData];
  unint64_t v9 = [v8 accessType];

  id v10 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
  [v10 setAccessPassType:v9];

  id v11 = [(NSArray *)self->_credentials firstObject];
  unint64_t v12 = [v11 cardType];
  if (v12 <= 4) {
    id v10 = **((id **)&unk_1E59DFEC8 + v12);
  }

  if (v9 >= 7) {
    id v13 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
  }
  else {
    id v13 = off_1E59DFEF0[v9];
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter setProductType:v10 subtype:v13];
}

- (void)cancelButtonPressed
{
  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v4 cancelButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  objc_super v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  [(PKShareableCredentialProvisioningViewController *)self _terminateSetupFlowWithPasses:0 error:v3];
}

- (void)continueButtonPressed
{
  v3.receiver = self;
  v3.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v3 continueButtonPressed];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  if (self->_hasConfiguredCredential) {
    [(PKShareableCredentialProvisioningViewController *)self _continueProvisioning];
  }
  else {
    [(PKShareableCredentialProvisioningViewController *)self _startProvisioning];
  }
}

- (void)activationCodeDidChangeToCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(PKAddShareablePassConfiguration *)self->_configuration credentialsMetadata];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * i) provisioningTarget];
        [v10 setVerificationCode:v4];

        self->_hasConfiguredCredential = 0;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_startProvisioning
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - starting provisioning", (uint8_t *)buf, 2u);
  }

  if ([(PKAddShareablePassConfiguration *)self->_configuration primaryAction])
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - presenting PKShareableCredentialsMessageComposeViewController", (uint8_t *)buf, 2u);
    }

    id v4 = [[PKShareableCredentialsMessageComposeViewController alloc] initWithConfiguration:self->_configuration];
    messageComposeViewController = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    [(PKShareableCredentialsMessageComposeViewController *)self->_messageComposeViewController setDelegate:self];
    [(PKShareableCredentialProvisioningViewController *)self showStartingUI];
    [(PKShareableCredentialProvisioningViewController *)self presentViewController:self->_messageComposeViewController animated:1 completion:0];
  }
  else if ([(NSArray *)self->_credentials count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    [WeakRetained startProvisioningWithCredentials:self->_credentials];
  }
  else if (self->_configuration)
  {
    [(PKShareableCredentialProvisioningViewController *)self showLoadingUI];
    objc_initWeak(buf, self);
    id v7 = objc_alloc_init(MEMORY[0x1E4F84518]);
    if (([(PKAddShareablePassConfiguration *)self->_configuration hasRequiredDataForProvisioning] & 1) == 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke;
      v12[3] = &unk_1E59D0108;
      v12[4] = self;
      objc_copyWeak(&v13, buf);
      [v7 addOperation:v12];
      objc_destroyWeak(&v13);
    }
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_5;
    v10[3] = &unk_1E59D5420;
    objc_copyWeak(&v11, buf);
    v10[4] = self;
    id v9 = (id)[v7 evaluateWithInput:v8 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PKShareableCredentialProvisioningViewController *)self showStartingUI];
  }
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 1376);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_2;
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 shareablePassConfiguration];
  id v7 = (id *)(*(void *)(a1 + 32) + 1376);
  if (v5 || !v6)
  {
    id v8 = *v7;
    id *v7 = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_3;
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_3(uint64_t a1)
{
  v2 = PKSharingDisplayableError(*(NSError **)(a1 + 32));
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_4;
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _terminateSetupFlowWithPasses:0 error:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_6;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_6(uint64_t a1)
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
      *((unsigned char *)v4 + 1385) = 1;
      id v3 = objc_loadWeakRetained(v4 + 179);
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
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - continuing provisioning", v5, 2u);
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
  aBlock[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
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
    v8[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3;
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

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[172];
  if (v3)
  {
    id v4 = [v3 credentialsMetadata];
    id v5 = [v4 firstObject];

    uint64_t v6 = [v5 preview];
    id v7 = [v6 thumbnailURL];

    id v8 = [v5 preview];
    uint64_t v9 = [v8 passThumbnailImage];

    if (v7)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2;
      v17[3] = &unk_1E59D5448;
      objc_copyWeak(&v18, &location);
      PKCommonCachedImageFromURL(v7, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v13 = *(void **)(a1 + 32);
      if (v9)
      {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v9];
      }
      else
      {
        uint64_t v14 = PKUIImageNamed(@"Generic-Shared-Key");
      }
      v15 = (void *)v14;
      [v13 setPassThumbnailImage:v14];
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v16 = [*(id *)(*(void *)(a1 + 32) + 1368) firstObject];
    id v11 = [v16 passThumbnailImageData];
    id v12 = (void *)[v10 initWithData:v11];
    [v2 setPassThumbnailImage:v12];
  }
}

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPassThumbnailImage:v4];
}

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3(uint64_t a1, void *a2)
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
  v59.receiver = self;
  v59.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v59 showStartingUI];
  PKAddShareablePassConfigurationPrimaryAction v3 = [(PKAddShareablePassConfiguration *)self->_configuration primaryAction];
  configuration = self->_configuration;
  if (configuration)
  {
    id v5 = [(PKAddShareablePassConfiguration *)configuration credentialsMetadata];
    unint64_t v6 = [v5 count];
  }
  else
  {
    unint64_t v6 = [(NSArray *)self->_credentials count];
  }
  uint64_t v7 = [(PKAddShareablePassConfiguration *)self->_configuration credentialsMetadata];
  id v8 = (void *)v7;
  if (v3 == PKAddShareablePassConfigurationPrimaryActionShare)
  {
    uint64_t v9 = [MEMORY[0x1E4F84EC8] sharedInstance];
    id v10 = v9;
    provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
    if (v6 < 2)
    {
      v21 = [v9 provisioningString:@"SHARE_ONE_SHAREABLE_CREDENTIAL_PASS" templateIdentifier:provisioningTemplateIdentifier];
      id v22 = v21;
      unint64_t v23 = v6;
      if (v21)
      {
        id v24 = v21;
      }
      else
      {
        PKLocalizedShareableCredentialString(&cfstr_ShareOneSharea_1.isa);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v24;

      v37 = [v8 objectAtIndexedSubscript:0];
      v38 = [v37 preview];
      v39 = [v38 ownerDisplayName];
      PKStringWithValidatedFormat();
      v41 = v40 = v8;
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v41, v39);

      id v8 = v40;
      unint64_t v6 = v23;
    }
    else
    {
      id v12 = [v9 provisioningString:@"SHARE_CREDENTIAL_MULTIPLE_PASS_TITLE" templateIdentifier:provisioningTemplateIdentifier];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        PKLocalizedShareableCredentialString(&cfstr_ShareCredentia_0.isa);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v14;

      v37 = PKStringWithValidatedFormat();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v37, v6);
    }

    v42 = [MEMORY[0x1E4F84EC8] sharedInstance];
    v43 = [v42 provisioningString:@"SHARE_CREDENTIAL_EXPLANATION" templateIdentifier:self->_provisioningTemplateIdentifier];
    v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      PKLocalizedShareableCredentialString(&cfstr_ShareCredentia.isa);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v45;

    unint64_t v56 = v6;
    v35 = PKStringWithValidatedFormat();
  }
  else
  {
    invitation = self->_invitation;
    PKAddShareablePassConfigurationPrimaryAction v57 = v3;
    unint64_t v58 = v6;
    id v16 = (void *)v7;
    if (invitation)
    {
      id v17 = [(PKSharingPushProvisioningInvitation *)invitation proprietaryData];
      unint64_t v18 = [v17 accessType];

      if (v18 >= 7)
      {
        v19 = 0;
        uint64_t v20 = 0;
      }
      else
      {
        v19 = off_1E59DFF28[v18];
        uint64_t v20 = off_1E59DFF60[v18];
      }
    }
    else
    {
      if (v6 == 1) {
        v19 = @"ADD_SHAREABLE_CREDENTIAL_PASS_TITLE";
      }
      else {
        v19 = @"ADD_SHAREABLE_CREDENTIAL_PASS";
      }
      if (v6 == 1) {
        uint64_t v20 = @"ADD_TO_WALLET_EXPLANATION";
      }
      else {
        uint64_t v20 = @"ADD_TO_WALLET_EXPLANATION_MULTIPLE";
      }
    }
    v25 = [MEMORY[0x1E4F84EC8] sharedInstance];
    objc_super v26 = [v25 provisioningString:v19 templateIdentifier:self->_provisioningTemplateIdentifier];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      PKLocalizedShareableCredentialString(&v19->isa);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;

    if (invitation)
    {
      [(PKPaymentSetupOptionsViewController *)self setTitleText:v29];
    }
    else
    {
      v30 = PKStringWithValidatedFormat();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v30, v58);
    }
    id v8 = v16;
    PKAddShareablePassConfigurationPrimaryAction v3 = v57;
    v31 = [MEMORY[0x1E4F84EC8] sharedInstance];
    v32 = [v31 provisioningString:v20 templateIdentifier:self->_provisioningTemplateIdentifier];
    v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      PKLocalizedShareableCredentialString(&v20->isa);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v34;

    unint64_t v6 = v58;
  }
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v35, v56);

  v46 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:v46];
  if (v3 == PKAddShareablePassConfigurationPrimaryActionShare)
  {
    v47 = [MEMORY[0x1E4F84EC8] sharedInstance];
    v48 = v47;
    v49 = self->_provisioningTemplateIdentifier;
    if (v6 < 2)
    {
      v50 = [v47 provisioningString:@"SHARE_SHAREABLE_CREDENTIAL_PASS_TITLE" templateIdentifier:v49];
      if (!v50)
      {
        v51 = @"SHARE_SHAREABLE_CREDENTIAL_PASS_TITLE";
        goto LABEL_47;
      }
    }
    else
    {
      v50 = [v47 provisioningString:@"SHARE_SHAREABLE_CREDENTIAL_PASSES_TITLE" templateIdentifier:v49];
      if (!v50)
      {
        v51 = @"SHARE_SHAREABLE_CREDENTIAL_PASSES_TITLE";
LABEL_47:
        v53 = PKLocalizedShareableCredentialString(&v51->isa);
        id v52 = 0;
        goto LABEL_48;
      }
    }
  }
  else
  {
    v48 = [MEMORY[0x1E4F84EC8] sharedInstance];
    v50 = [v48 provisioningString:@"ADD_SHAREABLE_CREDENTIAL_PASS_CONTINUE_TITLE" templateIdentifier:self->_provisioningTemplateIdentifier];
    if (!v50)
    {
      v51 = @"ADD_SHAREABLE_CREDENTIAL_PASS_CONTINUE_TITLE";
      goto LABEL_47;
    }
  }
  id v52 = v50;
  v53 = v52;
LABEL_48:

  [(PKPassShareRedemptionViewController *)self setContinueButtonText:v53];
  v54 = [(PKShareableCredentialProvisioningViewController *)self navigationItem];
  v55 = [v54 leftBarButtonItem];
  [v55 setEnabled:1];
}

- (void)_showExitingLostModeUI
{
  [(PKShareableCredentialProvisioningViewController *)self showLoadingUI];
  PKAddShareablePassConfigurationPrimaryAction v3 = [MEMORY[0x1E4F84EC8] sharedInstance];
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
  v15.receiver = self;
  v15.super_class = (Class)PKShareableCredentialProvisioningViewController;
  [(PKPassShareRedemptionViewController *)&v15 showLoadingUI];
  configuration = self->_configuration;
  if (configuration)
  {
    id v4 = [(PKAddShareablePassConfiguration *)configuration credentialsMetadata];
    unint64_t v5 = [v4 count];
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_credentials count];
  }
  id v6 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v7 = v6;
  provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
  if (v5 < 2)
  {
    uint64_t v9 = [v6 provisioningString:@"ADDING_SHAREABLE_CREDENTIAL_PASS" templateIdentifier:provisioningTemplateIdentifier];
    if (!v9)
    {
      id v10 = @"ADDING_SHAREABLE_CREDENTIAL_PASS";
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = [v6 provisioningString:@"ADDING_SHAREABLE_CREDENTIAL_PASSES" templateIdentifier:provisioningTemplateIdentifier];
    if (!v9)
    {
      id v10 = @"ADDING_SHAREABLE_CREDENTIAL_PASSES";
LABEL_10:
      id v12 = PKLocalizedShareableCredentialString(&v10->isa);
      id v11 = 0;
      goto LABEL_11;
    }
  }
  id v11 = v9;
  id v12 = v11;
LABEL_11:

  [(PKPaymentSetupOptionsViewController *)self setTitleText:v12];
  id v13 = [(PKShareableCredentialProvisioningViewController *)self navigationItem];
  id v14 = [v13 leftBarButtonItem];
  [v14 setEnabled:0];
}

- (void)showSuccessUI
{
  v8[1] = *MEMORY[0x1E4F143B8];
  PKAddShareablePassConfigurationPrimaryAction v3 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
  uint64_t v7 = *MEMORY[0x1E4F86F40];
  v8[0] = *MEMORY[0x1E4F86448];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 sendEventForPage:2 specifics:v4];

  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
  unint64_t v5 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v5 setShowCheckmark:1];

  id v6 = PKLocalizedShareableCredentialString(&cfstr_DoneAddingShar.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    double v6 = (double)[(NSArray *)self->_credentials count];
    uint64_t v7 = [(PKAddShareablePassConfiguration *)self->_configuration credentialsMetadata];
    unint64_t v8 = (unint64_t)fmax(v6, (double)(unint64_t)[v7 count]);

    uint64_t v9 = [v4 underlyingError];
    unint64_t v5 = [(PKShareableCredentialProvisioningViewController *)self _provisioningErrorWithNumberOfPassesFailed:v8 error:v9];
  }
  id v10 = (void *)MEMORY[0x1E4FB1418];
  v13[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v14[3] = &unk_1E59CA870;
  v14[4] = self;
  id v15 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v13[3] = &unk_1E59CA7D0;
  id v11 = v4;
  id v12 = [v10 alertForErrorWithError:v11 acknowledgeButtonText:0 exitButtonText:0 onAcknowledge:&__block_literal_global_168 onExit:v14 onTryAgain:v13];
  [(PKShareableCredentialProvisioningViewController *)self presentViewController:v12 animated:1 completion:0];
}

void __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) analyticsReporter];
  PKAddShareablePassConfigurationPrimaryAction v3 = [*(id *)(a1 + 40) underlyingError];
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  uint64_t v7 = *MEMORY[0x1E4F86F40];
  v8[0] = *MEMORY[0x1E4F86440];
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 sendEventForPage:2 error:v4 specifics:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1432));
  [WeakRetained cancel];
}

uint64_t __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueButtonPressed];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1) {
      [(PKShareableCredentialProvisioningViewController *)self _showExitingLostModeUI];
    }
    else {
      [(PKShareableCredentialProvisioningViewController *)self showLoadingUI];
    }
  }
  else if (a3 == 8)
  {
    [(PKShareableCredentialProvisioningViewController *)self showSuccessUI];
  }
  else
  {
    [(PKShareableCredentialProvisioningViewController *)self showStartingUI];
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
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
  }

  uint64_t v9 = [(PKPassShareRedemptionViewController *)self analyticsReporter];
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

- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  char v17 = 1;
  id v7 = [(PKSharingPushProvisioningInvitation *)self->_invitation proprietaryData];
  uint64_t v8 = [v7 accessType];

  uint64_t v9 = PKAddSEPassDisplayableError(v6, a3, v8, &v17);
  BOOL v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    PKAddSEPassGenericDisplayableError(a3, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  if (v17) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = 4;
  }
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  uint64_t v15 = [MEMORY[0x1E4F84ED8] errorWithUnderlyingError:v14 defaultSeverity:v13];

  return v15;
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - Terminate Setup flow", v7, 2u);
  }

  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  }
  [(PKShareableCredentialProvisioningViewController *)self _terminateSetupFlowWithPasses:0 error:v6];
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

- (PKSharingPushProvisioningInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_credentials, 0);
}

@end