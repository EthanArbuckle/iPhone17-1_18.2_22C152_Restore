@interface PKSubcredentialPairingCompletedViewController
- (BOOL)suppressFieldDetect;
- (PKSubcredentialPairingCompletedViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (unint64_t)operation;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKSubcredentialPairingCompletedViewController

- (PKSubcredentialPairingCompletedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKExplanationViewController *)self initWithContext:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
    heroCardView = v10->_heroCardView;
    v10->_heroCardView = v11;

    v13 = [(PKSubcredentialPairingCompletedViewController *)v10 navigationItem];
    [v13 setHidesBackButton:1 animated:0];
  }
  return v10;
}

- (unint64_t)operation
{
  return 4;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  v5 = dispatch_group_create();
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting pairing completed view controller", buf, 2u);
  }

  if (self->_flowController)
  {
    dispatch_group_enter(v5);
    flowController = self->_flowController;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke;
    v26[3] = &unk_1E59CD960;
    objc_copyWeak(&v28, location);
    v27 = v5;
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v26];

    objc_destroyWeak(&v28);
  }
  id v8 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  if (v8)
  {
    dispatch_group_enter(v5);
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v10 = v9;
    double v12 = v11;
    v13 = +[PKPassSnapshotter sharedInstance];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2;
    v23[3] = &unk_1E59D0588;
    objc_copyWeak(&v25, location);
    v14 = v5;
    v24 = v14;
    objc_msgSend(v13, "snapshotWithPass:size:completion:", v8, v23, v10, v12);

    v15 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext localDeviceWebService];
    v16 = [v15 targetDevice];
    if (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(v14);
      v17 = [v8 uniqueID];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_65;
      v20[3] = &unk_1E59CB268;
      objc_copyWeak(&v22, location);
      v21 = v14;
      [v16 paymentWebService:v15 isPassExpressWithUniqueIdentifier:v17 completion:v20];

      objc_destroyWeak(&v22);
    }

    objc_destroyWeak(&v25);
    if (v4)
    {
LABEL_9:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_70;
      block[3] = &unk_1E59CAA98;
      id v19 = v4;
      dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting pairing completed view controller with no pass", buf, 2u);
    }

    if (v4) {
      goto LABEL_9;
    }
  }

  objc_destroyWeak(location);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 132, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[131] setCardImage:*(void *)(a1 + 32)];
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

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_65(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2_66;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2_66(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 1040) = *(unsigned char *)(a1 + 48);
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

uint64_t __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_70(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Pairing completed view controller preflight completed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)PKSubcredentialPairingCompletedViewController;
  [(PKExplanationViewController *)&v48 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  id v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  id v4 = PKProvisioningSecondaryBackgroundColor();
  [v3 setTopBackgroundColor:v4];

  id v5 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  int v6 = [v5 devicePrimaryPaymentApplication];

  v44 = v6;
  char v7 = [v6 supportsUWB];
  if (self->_isPassExpress)
  {
    if (v7)
    {
      uint64_t v8 = @"EXPRESS_CAR_KEY_ADDED_FACEID_UWB_PHONE_BODY";
      goto LABEL_11;
    }
    int IsAvailable = PKPearlIsAvailable();
    double v10 = @"EXPRESS_CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY";
    double v11 = @"EXPRESS_CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY";
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = @"CAR_KEY_ADDED_FACEID_UWB_AND_NFC_PHONE_ONLY_BODY";
      goto LABEL_11;
    }
    int IsAvailable = PKPearlIsAvailable();
    double v10 = @"CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY";
    double v11 = @"CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY";
  }
  if (IsAvailable) {
    double v10 = v11;
  }
  uint64_t v8 = v10;
LABEL_11:
  double v12 = [MEMORY[0x1E4F84EC8] sharedInstance];
  v13 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  v14 = [v13 provisioningTemplateIdentifier];

  v15 = [v12 provisioningString:@"CAR_KEY_ADDED_TITLE" templateIdentifier:v14];
  if (v15)
  {
    [v3 setTitleText:v15];
  }
  else
  {
    v16 = PKLocalizedCredentialString(&cfstr_CarKeyAddedTit.isa);
    [v3 setTitleText:v16];
  }
  v17 = [v12 provisioningString:v8 templateIdentifier:v14];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    PKLocalizedCredentialString(&v8->isa);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  v43 = v8;
  if ([v44 blockingSupportedUWBDueToHardware])
  {
    v42 = v12;
    v21 = PKLocalizedCredentialString(&cfstr_CarKeyAddedNfc.isa);
    id v22 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v23 = [v20 rangeOfCharacterFromSet:v22];
    uint64_t v25 = v24;

    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v26 = [v20 stringByAppendingFormat:@" %@", v21];
    }
    else
    {
      uint64_t v27 = objc_msgSend(v20, "substringWithRange:", v23, v25);
      id v28 = [NSString stringWithFormat:@" %@%@", v21, v27];
      uint64_t v26 = objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v23, v25, v28);

      v20 = (void *)v27;
    }
    double v12 = v42;

    v20 = (void *)v26;
  }
  [v3 setBodyText:v20];
  v29 = [v12 provisioningString:@"CONTINUE" templateIdentifier:v14];
  v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_Continue.isa);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v31;

  v33 = [v3 dockView];
  v34 = [v33 primaryButton];
  [v34 setTitle:v32 forState:0];

  objc_initWeak(&location, self);
  v35 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  v36 = [(PKHeroCardExplanationHeaderView *)self->_heroCardView cardImage];

  if (!v36 && v35)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v38 = v37;
    double v40 = v39;
    v41 = +[PKPassSnapshotter sharedInstance];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke;
    v45[3] = &unk_1E59CBB80;
    objc_copyWeak(&v46, &location);
    objc_msgSend(v41, "snapshotWithPass:size:completion:", v35, v45, v38, v40);

    objc_destroyWeak(&v46);
  }
  [v3 setHeroView:self->_heroCardView];

  objc_destroyWeak(&location);
}

void __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[131] setCardImage:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialPairingCompletedViewController;
  [(PKSubcredentialPairingCompletedViewController *)&v3 viewDidAppear:a3];
  +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:3];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (self->_nextVC)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:0 page:3];
    id v5 = [(PKSubcredentialPairingCompletedViewController *)self navigationController];
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);
  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:3 page:3];
    flowController = self->_flowController;
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController provisioningFinishedWithOperation:self];
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
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