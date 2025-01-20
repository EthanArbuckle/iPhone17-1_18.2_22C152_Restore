@interface PKSubcredentialInvitationAcceptedViewController
- (PKSubcredentialInvitationAcceptedViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialInvitationFlowControllerContext)provisioningContext;
- (PKSubcredentialInvitationFlowControllerProtocol)flowController;
- (unint64_t)operation;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKSubcredentialInvitationAcceptedViewController

- (PKSubcredentialInvitationAcceptedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKExplanationViewController *)self initWithContext:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = [(PKSubcredentialInvitationAcceptedViewController *)v10 navigationItem];
    [v11 setHidesBackButton:1];
  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  objc_initWeak(&location, self);
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller...", buf, 2u);
  }

  v5 = dispatch_group_create();
  v6 = v5;
  if (self->_flowController)
  {
    dispatch_group_enter(v5);
    flowController = self->_flowController;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke;
    v42[3] = &unk_1E59CD960;
    objc_copyWeak(&v44, &location);
    v43 = v6;
    [(PKSubcredentialInvitationFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v42];

    objc_destroyWeak(&v44);
  }
  id v8 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedRemotePass];
  }
  v11 = v10;

  v12 = [v11 secureElementPass];
  v13 = [v12 paymentApplications];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v14);
        }
        self->_radioTechnologyType |= [*(id *)(*((void *)&v38 + 1) + 8 * i) supportedRadioTechnologies];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v15);
  }

  if (v11)
  {
    dispatch_group_enter(v6);
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v19 = v18;
    double v21 = v20;
    v22 = +[PKPassSnapshotter sharedInstance];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2;
    v35[3] = &unk_1E59D0588;
    objc_copyWeak(&v37, &location);
    v23 = v6;
    v36 = v23;
    objc_msgSend(v22, "snapshotWithPass:size:completion:", v11, v35, v19, v21);

    v24 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext localDeviceWebService];
    v25 = [v24 targetDevice];
    if (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(v23);
      v26 = [v11 uniqueID];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_14;
      v32[3] = &unk_1E59CB268;
      objc_copyWeak(&v34, &location);
      v33 = v23;
      [v25 paymentWebService:v24 isPassExpressWithUniqueIdentifier:v26 completion:v32];

      objc_destroyWeak(&v34);
    }

    objc_destroyWeak(&v37);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller with no pass", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_19;
  block[3] = &unk_1E59CAA98;
  id v31 = v29;
  id v27 = v29;
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&location);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 133, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[130] setCardImage:*(void *)(a1 + 32)];
  }
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Loaded pass image: %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_14(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2_15;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2_15(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 1048) = *(unsigned char *)(a1 + 48);
  }
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 48)) {
      id v5 = "Yes";
    }
    else {
      id v5 = "No";
    }
    int v6 = 136315138;
    char v7 = v5;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Pass is express: %s", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_19(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller completed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (unint64_t)operation
{
  return 2;
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)PKSubcredentialInvitationAcceptedViewController;
  [(PKExplanationViewController *)&v32 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  unint64_t radioTechnologyType = self->_radioTechnologyType;
  if (self->_isPassExpress)
  {
    if ((radioTechnologyType & 2) != 0)
    {
      char v7 = @"EXPRESS_CAR_KEY_ADDED_FACEID_UWB_PHONE_BODY";
      goto LABEL_11;
    }
    int IsAvailable = PKPearlIsAvailable();
    id v5 = @"EXPRESS_CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY";
    int v6 = @"EXPRESS_CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY";
  }
  else
  {
    if ((radioTechnologyType & 2) != 0)
    {
      char v7 = @"CAR_KEY_ADDED_FACEID_UWB_AND_NFC_PHONE_ONLY_BODY";
      goto LABEL_11;
    }
    int IsAvailable = PKPearlIsAvailable();
    id v5 = @"CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY";
    int v6 = @"CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY";
  }
  if (IsAvailable) {
    id v5 = v6;
  }
  char v7 = v5;
LABEL_11:
  uint64_t v8 = [(PKExplanationViewController *)self explanationView];
  [v8 setDelegate:self];
  [v8 setShowPrivacyView:0];
  v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setTopBackgroundColor:v9];

  id v10 = PKLocalizedCredentialString(&cfstr_CarKeyAddedTit.isa);
  [v8 setTitleText:v10];

  v11 = PKLocalizedCredentialString(&v7->isa);
  [v8 setBodyText:v11];

  v12 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  v13 = [v8 dockView];
  id v14 = [v13 primaryButton];
  [v14 setTitle:v12 forState:0];

  uint64_t v15 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
  heroCardView = self->_heroCardView;
  self->_heroCardView = v15;

  [(PKHeroCardExplanationHeaderView *)self->_heroCardView setPadding:1];
  v17 = self->_heroCardView;
  double v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKHeroCardExplanationHeaderView *)v17 setBackgroundColor:v18];

  [(PKHeroCardExplanationHeaderView *)self->_heroCardView setSize:4];
  [v8 setHeroView:self->_heroCardView];
  objc_initWeak(&location, self);
  double v19 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  double v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedRemotePass];
  }
  v22 = v21;

  v23 = [(PKHeroCardExplanationHeaderView *)self->_heroCardView cardImage];

  if (!v23 && v22)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v25 = v24;
    double v27 = v26;
    id v28 = +[PKPassSnapshotter sharedInstance];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke;
    v29[3] = &unk_1E59CBB80;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v28, "snapshotWithPass:size:completion:", v22, v29, v25, v27);

    objc_destroyWeak(&v30);
  }

  objc_destroyWeak(&location);
}

void __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[130] setCardImage:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "User acknowledged provisioning, flow completed successfully.", v7, 2u);
  }

  if (self->_nextVC)
  {
    id v6 = [(PKSubcredentialInvitationAcceptedViewController *)self navigationController];
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);
  }
  else
  {
    [(PKSubcredentialInvitationFlowControllerProtocol *)self->_flowController provisioningFinishedWithOperation:self];
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
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
  objc_storeStrong((id *)&self->_nextVC, 0);

  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end