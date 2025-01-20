@interface PKSubcredentialInvitationActivationViewController
- (PKSubcredentialInvitationActivationViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialInvitationFlowControllerContext)provisioningContext;
- (PKSubcredentialInvitationFlowControllerProtocol)flowController;
- (unint64_t)operation;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKSubcredentialInvitationActivationViewController

- (PKSubcredentialInvitationActivationViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKExplanationViewController *)self initWithContext:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = [(PKSubcredentialInvitationActivationViewController *)v10 navigationItem];
    [v11 setHidesBackButton:1];
  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
}

- (unint64_t)operation
{
  return 1;
}

- (void)viewDidLoad
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PKSubcredentialInvitationActivationViewController;
  [(PKExplanationViewController *)&v41 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setTopBackgroundColor:v4];

  v5 = PKLocalizedCredentialString(&cfstr_CarKeyAddedTit.isa);
  [v3 setTitleText:v5];

  v6 = [(PKSubcredentialInvitationFlowControllerContext *)self->_provisioningContext localDeviceInvitation];
  v37 = [v6 originalInvitationMessage];

  id v7 = [v37 activationOptions];
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F848C8]);
    v9 = [MEMORY[0x1E4F848C0] vehicleEnteredPin];
    v42[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    id v7 = (void *)[v8 initWithOptions:v10];
  }
  v36 = [v7 primaryOption];
  v11 = [v36 localizationKeyPostfix];
  v35 = [@"SHARE_ACTIVATION_OVERVIEW_TITLE_" stringByAppendingString:v11];

  v12 = PKLocalizedShareableCredentialString(v35);
  [v3 setTitleText:v12];

  v13 = [v7 localizationKeyPostfix];
  v14 = [@"SHARE_ACTIVATION_REDEMPTION_BODY_" stringByAppendingString:v13];

  v15 = PKLocalizedShareableCredentialString(v14);
  [v3 setBodyText:v15];

  v16 = PKLocalizedString(&cfstr_Done.isa);
  v17 = [v3 dockView];
  v18 = [v17 primaryButton];
  [v18 setTitle:v16 forState:0];

  v19 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
  heroCardView = self->_heroCardView;
  self->_heroCardView = v19;

  [(PKHeroCardExplanationHeaderView *)self->_heroCardView setPadding:1];
  v21 = self->_heroCardView;
  v22 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKHeroCardExplanationHeaderView *)v21 setBackgroundColor:v22];

  [(PKHeroCardExplanationHeaderView *)self->_heroCardView setSize:4];
  [v3 setHeroView:self->_heroCardView];
  objc_initWeak(&location, self);
  v23 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedPass];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext provisionedRemotePass];
  }
  v26 = v25;

  v27 = [(PKHeroCardExplanationHeaderView *)self->_heroCardView cardImage];
  if (v27) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = v26 == 0;
  }
  int v29 = !v28;

  if (v29)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v31 = v30;
    double v33 = v32;
    v34 = +[PKPassSnapshotter sharedInstance];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke;
    v38[3] = &unk_1E59CBB80;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v34, "snapshotWithPass:size:completion:", v26, v38, v31, v33);

    objc_destroyWeak(&v39);
  }

  objc_destroyWeak(&location);
}

void __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[130] setCardImage:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(PKSubcredentialInvitationActivationViewController *)self view];
  [v5 setUserInteractionEnabled:0];

  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  flowController = self->_flowController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PKSubcredentialInvitationActivationViewController_explanationViewDidSelectContinue___block_invoke;
  v7[3] = &unk_1E59CBA68;
  objc_copyWeak(&v8, &location);
  [(PKSubcredentialInvitationFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __86__PKSubcredentialInvitationActivationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained view];
    [v5 setUserInteractionEnabled:1];

    if (v7)
    {
      id v6 = [v4 navigationController];
      objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:delay:completion:", v7, 1, 2000000000, 0);
    }
    else
    {
      [v4[132] provisioningFinishedWithOperation:v4];
    }
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

  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end