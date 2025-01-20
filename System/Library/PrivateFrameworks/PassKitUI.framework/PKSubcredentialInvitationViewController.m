@interface PKSubcredentialInvitationViewController
- (PKSubcredentialInvitationFlowControllerContext)provisioningContext;
- (PKSubcredentialInvitationFlowControllerProtocol)flowController;
- (PKSubcredentialInvitationViewController)initWithFlowController:(id)a3 context:(id)a4;
- (id)_bodyTextForContext:(id)a3;
- (id)_titleTextForContext:(id)a3;
- (id)contactKeysToFetch;
- (id)sharingSessionWithDelegate:(id)a3 startSession:(BOOL)a4;
- (unint64_t)operation;
- (void)activationCodeDidChangeToCode:(id)a3;
- (void)advanceToNextState;
- (void)continueButtonPressed;
- (void)continueLaterButtonPressed;
- (void)preflightWithCompletion:(id)a3;
- (void)resetState;
- (void)setProvisioningContext:(id)a3;
- (void)startLocalDeviceProvisioning;
- (void)startRemoteDeviceProvisioning;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4;
- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5;
- (void)viewDidLoad;
@end

@implementation PKSubcredentialInvitationViewController

- (PKSubcredentialInvitationViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKPassShareRedemptionViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F845E8]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v13 = [(PKSubcredentialInvitationViewController *)v10 contactKeysToFetch];
    uint64_t v14 = [v11 initWithContactStore:v12 keysToFetch:v13];
    contactResolver = v10->_contactResolver;
    v10->_contactResolver = (PKContactResolver *)v14;

    [(PKPassShareRedemptionViewController *)v10 setAnalyticsEnabled:1];
    v16 = [(PKPassShareRedemptionViewController *)v10 analyticsReporter];
    [v16 setAccessPassType:4];
  }
  return v10;
}

- (unint64_t)operation
{
  return 0;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PKSubcredentialInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v28 viewDidLoad];
  v3 = [(PKSubcredentialInvitationViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  v4 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = PKPassKitUIBundle();
  id v7 = [v5 imageNamed:@"SubcredentialInvitation" inBundle:v6];

  id v8 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
  v9 = [v8 originalInvitationMessage];
  v10 = [v9 displayInformation];
  id v11 = [v10 imageURL];

  if (v11)
  {
    [v4 showLoadingContent];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __54__PKSubcredentialInvitationViewController_viewDidLoad__block_invoke;
    v25 = &unk_1E59CC3C8;
    id v26 = v4;
    id v27 = v7;
    PKCommonCachedImageFromURL(v11, &v22);
  }
  else
  {
    [v4 setCardImage:v7];
  }
  id v12 = -[PKSubcredentialInvitationViewController _titleTextForContext:](self, "_titleTextForContext:", self->_provisioningContext, v22, v23, v24, v25);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v12];

  v13 = [(PKSubcredentialInvitationViewController *)self _bodyTextForContext:self->_provisioningContext];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v13];

  uint64_t v14 = PKLocalizedCredentialString(&cfstr_AddCarKey.isa);
  [(PKPassShareRedemptionViewController *)self setContinueButtonText:v14];

  v15 = PKLocalizedCredentialString(&cfstr_NotNow.isa);
  [(PKPassShareRedemptionViewController *)self setContinueLaterText:v15];

  v16 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
  v17 = [v16 originalInvitationMessage];

  v18 = [v17 proprietaryData];
  v19 = [v18 displayableSharedEntitlements];
  [(PKPassShareRedemptionViewController *)self setDisplayableSharedEntitlements:v19];

  v20 = [v17 activationOptions];
  [(PKPassShareRedemptionViewController *)self setActivationOptions:v20];

  v21 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:v21];
  [(PKPassShareRedemptionViewController *)self showStartingUI];
}

uint64_t __54__PKSubcredentialInvitationViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  [v4 setCardImage:a3];
  v5 = *(void **)(a1 + 32);

  return [v5 hideLoadingContent];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting accept invitation view controller...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  id v7 = objc_opt_class();
  provisioningContext = self->_provisioningContext;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke;
  v27[3] = &unk_1E59CBA18;
  objc_copyWeak(&v29, buf);
  v9 = v6;
  objc_super v28 = v9;
  [v7 canAttemptLocalDeviceProvisioningWithContext:provisioningContext completion:v27];
  dispatch_group_enter(v9);
  v10 = objc_opt_class();
  id v11 = self->_provisioningContext;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_36;
  v24[3] = &unk_1E59CBA18;
  objc_copyWeak(&v26, buf);
  id v12 = v9;
  v25 = v12;
  [v10 canAttemptRemoteDeviceProvisioningWithContext:v11 completion:v24];
  if (self->_contactResolver)
  {
    dispatch_group_enter(v12);
    v13 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
    uint64_t v14 = [v13 originatorIDSHandle];
    contactResolver = self->_contactResolver;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_37;
    v20[3] = &unk_1E59D6D70;
    objc_copyWeak(&v23, buf);
    id v16 = v14;
    id v21 = v16;
    uint64_t v22 = v12;
    [(PKContactResolver *)contactResolver contactForHandle:v16 withCompletion:v20];

    objc_destroyWeak(&v23);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_3;
  v18[3] = &unk_1E59CAA98;
  id v19 = v4;
  id v17 = v4;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], v18);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(buf);
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a2;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Should attempt to accept invite on local device: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[176] setAcceptLocalDeviceInvitation:a2];
    [v8[176] setAcceptLocalDeviceInvitationDisplayableError:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_36(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a2;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Should attempt to accept invite on remote device: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[176] setAcceptRemoteDeviceInvitation:a2];
    [v8[176] setAcceptRemoteDeviceInvitationDisplayableError:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_37(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:*(void *)(a1 + 32) contact:*(void *)(a1 + 40)];
    id v3 = (void *)WeakRetained[173];
    WeakRetained[173] = v2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Preflighting accept invitation view controller finished", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)resetState
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Reseting state of accept invitaiton view controller", v7, 2u);
  }

  provisioningViewModel = self->_provisioningViewModel;
  self->_provisioningViewModel = 0;

  remoteProvisioningViewModel = self->_remoteProvisioningViewModel;
  self->_remoteProvisioningViewModel = 0;

  [(PKAppletSubcredentialSharingSession *)self->_session endSession];
  session = self->_session;
  self->_session = 0;

  [(PKPassShareRedemptionViewController *)self showStartingUI];
}

- (id)_titleTextForContext:(id)a3
{
  id v3 = a3;
  if ([v3 isShareActivation])
  {
    id v4 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_1.isa);
  }
  else
  {
    id v5 = [v3 localDeviceInvitation];
    id v6 = [v5 issuer];

    if (v6) {
      PKLocalizedCredentialString(&cfstr_InvitationTitl_0.isa, &stru_1EF1B4C70.isa, v6);
    }
    else {
    id v4 = PKLocalizedCredentialString(&cfstr_InvitationTitl.isa);
    }
  }

  return v4;
}

- (id)_bodyTextForContext:(id)a3
{
  if ([a3 isShareActivation])
  {
    id v4 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_2.isa);
    goto LABEL_24;
  }
  id v5 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
  [v5 entitlement];
  unint64_t v6 = PKAppletSubcredentialEntitlementTypeFromValue();
  id v7 = [v5 deviceModel];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_FallbackDevice.isa);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v5 originatorIDSHandle];
  id v12 = [(PKContactResolver *)self->_contactResolver contactForHandle:v11];

  if (v12)
  {
    v13 = @"_CONTACT";
  }
  else if (PKIsEmailAddress())
  {
    v13 = @"_EMAIL";
  }
  else
  {
    v13 = @"_PHONE";
  }
  BOOL v14 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptRemoteDeviceInvitation];
  if ([(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptLocalDeviceInvitation]&& v14)
  {
    if (v6 < 7)
    {
      v15 = off_1E59D6DB8;
      goto LABEL_18;
    }
LABEL_20:
    id v16 = 0;
    if (!v11) {
      goto LABEL_21;
    }
LABEL_22:
    id v16 = [(__CFString *)v16 stringByAppendingString:v13];
    contactName = self->_contactName;
    goto LABEL_23;
  }
  v15 = off_1E59D6E28;
  if (v14) {
    v15 = off_1E59D6DF0;
  }
  if (v6 > 6) {
    goto LABEL_20;
  }
LABEL_18:
  id v16 = v15[v6];
  if (v11) {
    goto LABEL_22;
  }
LABEL_21:
  contactName = self->_contactName;
  if (contactName) {
    goto LABEL_22;
  }
LABEL_23:
  id v4 = PKLocalizedCredentialString(&v16->isa, &stru_1EF1B5770.isa, contactName, v10);

LABEL_24:

  return v4;
}

- (id)sharingSessionWithDelegate:(id)a3 startSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  session = self->_session;
  if (!session)
  {
    if (v4) {
      [MEMORY[0x1E4F84438] createSessionWithDelegate:v6];
    }
    else {
    id v8 = [MEMORY[0x1E4F84438] createPendingSessionWithDelegate:v6];
    }
    id v9 = self->_session;
    self->_session = v8;

    session = self->_session;
  }
  uint64_t v10 = session;

  return v10;
}

- (void)startLocalDeviceProvisioning
{
  if (!self->_provisioningViewModel)
  {
    id v3 = [(PKSubcredentialInvitationFlowControllerProtocol *)self->_flowController localDeviceProvisioningViewModelForOperation:self];
    provisioningViewModel = self->_provisioningViewModel;
    self->_provisioningViewModel = v3;

    id v5 = self->_provisioningViewModel;
    [(PKSubcredentialProvisioningViewModelProtocol *)v5 startProvisioning];
  }
}

- (void)startRemoteDeviceProvisioning
{
  if (!self->_remoteProvisioningViewModel)
  {
    id v3 = [(PKSubcredentialInvitationFlowControllerProtocol *)self->_flowController remoteDeviceProvisioningViewModelForOperation:self];
    remoteProvisioningViewModel = self->_remoteProvisioningViewModel;
    self->_remoteProvisioningViewModel = v3;

    id v5 = self->_remoteProvisioningViewModel;
    [(PKSubcredentialProvisioningViewModelProtocol *)v5 startProvisioning];
  }
}

- (void)advanceToNextState
{
  objc_initWeak(&location, self);
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Finished accepting all invitations", buf, 2u);
  }

  flowController = self->_flowController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKSubcredentialInvitationViewController_advanceToNextState__block_invoke;
  v5[3] = &unk_1E59CBA68;
  objc_copyWeak(&v6, &location);
  [(PKSubcredentialInvitationFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__PKSubcredentialInvitationViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained showSuccessUI];
    if (v6)
    {
      id v5 = [v4 navigationController];
      objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:delay:completion:", v6, 1, 2000000000, 0);
    }
    else
    {
      [v4[177] provisioningFinishedWithOperation:v4];
    }
  }
}

- (id)contactKeysToFetch
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v3 = *MEMORY[0x1E4F1ADC8];
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = *MEMORY[0x1E4F1AEE0];
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  return v4;
}

- (void)continueButtonPressed
{
  v15.receiver = self;
  v15.super_class = (Class)PKSubcredentialInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v15 continueButtonPressed];
  [(PKPassShareRedemptionViewController *)self showLoadingUI];
  if ([(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptLocalDeviceInvitation])
  {
    [(PKSubcredentialInvitationViewController *)self startLocalDeviceProvisioning];
  }
  else if ([(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptRemoteDeviceInvitation])
  {
    uint64_t v3 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];

    if (!v3)
    {
      BOOL v4 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
      id v5 = [v4 pairedReaderIdentifier];

      id v6 = [(id)objc_opt_class() localDevicePassMatchingPairedTerminalIdentifier:v5];
      if (v6 && [(id)objc_opt_class() isPassPersonalizedOrPersonalizing:v6]) {
        [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext setProvisionedPass:v6];
      }
    }
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Attempting remote device provisioning.", buf, 2u);
    }

    self->_shouldSurfaceRemoteDeviceProvisioningErrors = ![(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptLocalDeviceInvitation];
    [(PKSubcredentialInvitationViewController *)self startRemoteDeviceProvisioning];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Selected continue but neither local nor remote devices can attempt provisioning.", buf, 2u);
    }

    id v9 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptLocalDeviceInvitationDisplayableError];
    if (!v9)
    {
      id v9 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext acceptRemoteDeviceInvitationDisplayableError];
      if (!v9)
      {
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87EC8] code:16 userInfo:0];
      }
    }
    flowController = self->_flowController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = self;
    uint64_t v11 = [(PKSubcredentialInvitationFlowControllerProtocol *)flowController alertForOperation:self withError:v9 retryHandler:0 cancelationHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke_2;
    v12[3] = &unk_1E59CA7D0;
    v12[4] = self;
    [(PKSubcredentialInvitationViewController *)self presentViewController:v11 animated:1 completion:v12];
  }
}

uint64_t __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1416), "provisioningWasCanceledWithOperation:");
}

uint64_t __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showFailureUI];
}

- (void)continueLaterButtonPressed
{
  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v3 continueLaterButtonPressed];
  [(PKSubcredentialInvitationFlowControllerProtocol *)self->_flowController provisioningWasCanceledWithOperation:self];
}

- (void)activationCodeDidChangeToCode:(id)a3
{
  provisioningContext = self->_provisioningContext;
  id v5 = a3;
  id v6 = [(PKSubcredentialInvitationFlowControllerContext *)provisioningContext localDeviceInvitation];
  [v6 setActivationCode:v5];

  id v7 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext remoteDeviceInvitation];
  [v7 setActivationCode:v5];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  v8[3] = &unk_1E59CA870;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void *)(v2 + 1368) != 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2;
  aBlock[3] = &unk_1E59CD7B0;
  BOOL v35 = v3;
  aBlock[4] = v2;
  id v34 = *(id *)(a1 + 40);
  BOOL v4 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3;
  v30[3] = &unk_1E59CD7B0;
  BOOL v32 = v3;
  id v5 = *(void **)(a1 + 40);
  v30[4] = *(void *)(a1 + 32);
  id v31 = v5;
  id v6 = (void (**)(void))_Block_copy(v30);
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 1368))
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v9;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Failed to accept local invitation with error: %@", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 1368);
    *(void *)(v10 + 1368) = 0;

    id v12 = (void **)(*(void *)(a1 + 32) + 1360);
    BOOL v13 = 1;
  }
  else
  {
    if (!*(void *)(v7 + 1376))
    {
      BOOL v13 = 1;
      goto LABEL_10;
    }
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v15;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Failed to accepted remote invitation with error: %@", buf, 0xCu);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    BOOL v13 = *(unsigned char *)(v16 + 1400) != 0;
    id v12 = (void **)(v16 + 1376);
  }
  id v17 = *v12;
  *id v12 = 0;

  uint64_t v7 = *(void *)(a1 + 32);
LABEL_10:
  [*(id *)(v7 + 1408) setError:*(void *)(a1 + 40)];
  if (!v13) {
    goto LABEL_14;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 1408) shouldExitFlowOnError]) {
    goto LABEL_14;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  v20 = *(void **)(v18 + 1416);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_111;
  v28[3] = &unk_1E59CAD68;
  id v21 = v4;
  v28[4] = *(void *)(a1 + 32);
  id v29 = v21;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2_112;
  v26[3] = &unk_1E59CAD68;
  uint64_t v22 = v6;
  v26[4] = *(void *)(a1 + 32);
  id v27 = v22;
  id v23 = [v20 alertForOperation:v18 withError:v19 retryHandler:v28 cancelationHandler:v26];

  if (v23)
  {
    v24 = *(void **)(a1 + 32);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3_113;
    v25[3] = &unk_1E59CA7D0;
    v25[4] = v24;
    [v24 presentViewController:v23 animated:1 completion:v25];
  }
  else
  {
LABEL_14:
    v6[2](v6);
    [*(id *)(a1 + 32) advanceToNextState];
  }
}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) analyticsReporter];
    [v2 sendEventForPage:0 error:*(void *)(a1 + 40) specifics:0];
  }
}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) analyticsReporter];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = *MEMORY[0x1E4F86F40];
    v6[0] = *MEMORY[0x1E4F86440];
    BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [v2 sendEventForPage:2 error:v3 specifics:v4];
  }
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_111(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 showStartingUI];
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2_112(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(*(void *)(a1 + 32) + 1416);

  return objc_msgSend(v2, "provisioningWasCanceledWithOperation:");
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3_113(uint64_t a1)
{
  return [*(id *)(a1 + 32) showFailureUI];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __97__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) analyticsReporter];
  uint64_t v16 = *MEMORY[0x1E4F86F40];
  v17[0] = *MEMORY[0x1E4F86448];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v2 sendEventForPage:2 specifics:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 1368))
  {
    if (!*(void *)(v4 + 1376)) {
      return;
    }
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Successfully accepted remote invitation.", v15, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 1408) setProvisionedRemotePass:*(void *)(a1 + 40)];
    uint64_t v13 = *(void *)(a1 + 32);
    BOOL v14 = *(void **)(v13 + 1376);
    *(void *)(v13 + 1376) = 0;

    goto LABEL_12;
  }
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Successfully accepted local invitation.", v15, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 1408) setProvisionedPass:*(void *)(a1 + 40)];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 1408) acceptRemoteDeviceInvitation];
  char v7 = v6;
  if (v6) {
    [*(id *)(a1 + 32) startRemoteDeviceProvisioning];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1368);
  *(void *)(v8 + 1368) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 1360);
  *(void *)(v10 + 1360) = 0;

  if ((v7 & 1) == 0) {
LABEL_12:
  }
    [*(id *)(a1 + 32) advanceToNextState];
}

- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = [v9 domain];
  char v12 = PKEqualObjects();

  if ((v12 & 1) == 0)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected error while checking for hard failure: %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  uint64_t v13 = [v9 code];
  if (v13 != 19 && v13 != 7)
  {
LABEL_11:
    v10[2](v10, 1);
    goto LABEL_12;
  }
  BOOL v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Asking if registration error should cause failure.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke;
  block[3] = &unk_1E59CE110;
  block[4] = self;
  id v17 = v9;
  uint64_t v18 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_12:
}

void __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v3 = a1[4];
  id v2 = a1[5];
  uint64_t v4 = (void *)v3[177];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2;
  v14[3] = &unk_1E59CAD18;
  id v5 = v2;
  id v15 = v5;
  id v16 = a1[6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_114;
  v10[3] = &unk_1E59D6D98;
  id v11 = a1[5];
  objc_copyWeak(&v13, &location);
  id v12 = a1[6];
  int v6 = [v4 alertForOperation:v3 withError:v5 retryHandler:v14 cancelationHandler:v10];
  if (v6)
  {
    char v7 = [a1[4] analyticsReporter];
    [v7 sendEventForPage:0 error:a1[5] specifics:0];

    [a1[4] presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "No alert for registration error", (uint8_t *)v9, 2u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try accepting again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_114(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User choose to cancel accepting after error: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = [WeakRetained provisioningContext];
  [v5 setShouldExitFlowOnError:1];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PKSubcredentialInvitationFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
}

- (PKSubcredentialInvitationFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_remoteProvisioningViewModel, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end