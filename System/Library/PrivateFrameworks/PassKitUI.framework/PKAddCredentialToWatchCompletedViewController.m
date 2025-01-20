@interface PKAddCredentialToWatchCompletedViewController
- (BOOL)suppressFieldDetect;
- (PKAddCredentialToWatchCompletedViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (id)bodyText;
- (unint64_t)operation;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)preflightWithCompletion:(id)a3;
- (void)setProvisioningContext:(id)a3;
@end

@implementation PKAddCredentialToWatchCompletedViewController

- (PKAddCredentialToWatchCompletedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", [v8 setupContext]);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
    heroCardView = v10->_heroCardView;
    v10->_heroCardView = v11;

    v13 = [(PKAddCredentialToWatchCompletedViewController *)v10 navigationItem];
    [v13 setHidesBackButton:1 animated:0];
  }
  return v10;
}

- (unint64_t)operation
{
  return 6;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting add to watch completed view controller", buf, 2u);
  }

  v6 = dispatch_group_create();
  id v7 = v6;
  if (self->_flowController)
  {
    dispatch_group_enter(v6);
    flowController = self->_flowController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke;
    v21[3] = &unk_1E59CD960;
    objc_copyWeak(&v23, &location);
    v22 = v7;
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v21];

    objc_destroyWeak(&v23);
  }
  v9 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  if (v9)
  {
    dispatch_group_enter(v7);
    [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView recommendedCardImageSize];
    double v11 = v10;
    double v13 = v12;
    v14 = +[PKPassSnapshotter sharedInstance];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_2;
    v18[3] = &unk_1E59D0588;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    objc_msgSend(v14, "snapshotWithPass:size:completion:", v9, v18, v11, v13);

    objc_destroyWeak(&v20);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting Add to watch completed view controller with no pass", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_14;
  block[3] = &unk_1E59CAA98;
  id v17 = v4;
  id v15 = v4;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&location);
}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 131, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
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

uint64_t __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_14(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)PKAddCredentialToWatchCompletedViewController;
  [(PKExplanationViewController *)&v24 loadView];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  id v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  [v3 setTopMargin:0.0];
  id v4 = PKLocalizedCredentialString(&cfstr_CarKeyAddedTit_0.isa);
  [v3 setTitleText:v4];

  uint64_t v5 = [(PKAddCredentialToWatchCompletedViewController *)self bodyText];
  [v3 setBodyText:v5];

  int v6 = [v3 dockView];
  uint64_t v7 = [v6 primaryButton];
  uint64_t v8 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v7 setTitle:v8 forState:0];

  objc_initWeak(&location, self);
  v9 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  double v10 = [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView cardImage];

  if (!v10 && v9)
  {
    [(PKHeroCardWatchExplainationHeaderView *)self->_heroCardView recommendedCardImageSize];
    double v12 = v11;
    double v14 = v13;
    id v15 = +[PKPassSnapshotter sharedInstance];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke;
    v21 = &unk_1E59CBB80;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v15, "snapshotWithPass:size:completion:", v9, &v18, v12, v14);

    objc_destroyWeak(&v22);
  }
  objc_msgSend(v3, "setHeroView:", self->_heroCardView, v18, v19, v20, v21);
  v16 = [v3 dockView];
  id v17 = [v16 footerView];

  [v17 setSkipCardButton:0];
  [v17 setManualEntryButton:0];
  [v17 setSetupLaterButton:0];

  objc_destroyWeak(&location);
}

void __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[130] setCardImage:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (id)bodyText
{
  v2 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedRemotePass];
  id v3 = [v2 devicePrimaryContactlessPaymentApplication];
  id v4 = [v3 subcredentials];
  uint64_t v5 = [v4 anyObject];

  id v6 = [v5 entitlement];
  uint64_t v7 = [v6 carKeyEntitlementType];

  uint64_t v8 = @"FULL_ACCESS_CAR_KEY_ADDED_BODY_WATCH";
  if (v7 == 1) {
    uint64_t v8 = @"UNLOCK_ACCESS_CAR_KEY_ADDED_BODY_WATCH";
  }
  if (v7 == 6) {
    v9 = @"PROPRIETARY_ACCESS_CAR_KEY_ADDED_BODY_WATCH";
  }
  else {
    v9 = v8;
  }
  double v10 = PKLocalizedCredentialString(&v9->isa);

  return v10;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (self->_nextVC)
  {
    id v5 = [(PKAddCredentialToWatchCompletedViewController *)self navigationController];
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);
  }
  else
  {
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