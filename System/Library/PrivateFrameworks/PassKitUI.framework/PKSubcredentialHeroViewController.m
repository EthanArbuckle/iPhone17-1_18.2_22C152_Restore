@interface PKSubcredentialHeroViewController
- (BOOL)suppressFieldDetect;
- (PKSubcredentialHeroViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (unint64_t)operation;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKSubcredentialHeroViewController

- (PKSubcredentialHeroViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKExplanationViewController *)self initWithContext:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    [(PKExplanationViewController *)v10 setExplanationViewControllerDelegate:v10];
  }

  return v10;
}

- (unint64_t)operation
{
  return 1;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PKSubcredentialHeroViewController;
  [(PKExplanationViewController *)&v19 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:1];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:1];
  v4 = [MEMORY[0x1E4F84EC8] sharedInstance];
  v5 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  v6 = [v5 provisioningTemplateIdentifier];

  id v7 = [v4 provisioningString:@"CAR_KEY_HERO_VIEW_TITLE" templateIdentifier:v6];
  if (v7)
  {
    [v3 setTitleText:v7];
  }
  else
  {
    id v8 = PKLocalizedCredentialString(&cfstr_CarKeyHeroView.isa);
    [v3 setTitleText:v8];
  }
  v9 = [v4 provisioningString:@"CAR_KEY_HERO_VIEW_BODY" templateIdentifier:v6];
  if (v9)
  {
    [v3 setBodyText:v9];
  }
  else
  {
    v10 = PKLocalizedCredentialString(&cfstr_CarKeyHeroView_0.isa);
    [v3 setBodyText:v10];
  }
  v11 = [v3 dockView];
  v12 = [v11 primaryButton];
  v13 = [v4 provisioningString:@"CONTINUE" templateIdentifier:v6];
  if (v13)
  {
    [v12 setTitle:v13 forState:0];
  }
  else
  {
    v14 = PKLocalizedPaymentString(&cfstr_Continue.isa);
    [v12 setTitle:v14 forState:0];
  }
  v15 = [PKCredentialPairingExplanationHeaderView alloc];
  v16 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  v17 = [(PKCredentialPairingExplanationHeaderView *)v15 initWithConfiguration:v16];
  [v3 setHeroView:v17];

  v18 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [(PKSubcredentialHeroViewController *)self addChildViewController:v18];
  [(PKExplanationViewController *)self setPrivacyLinkController:v18];
  [v18 didMoveToParentViewController:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSubcredentialHeroViewController;
  [(PKSubcredentialHeroViewController *)&v7 viewDidAppear:a3];
  v4 = self->_provisioningContext;
  uint64_t v5 = [(PKSubcredentialPairingFlowControllerContext *)v4 referralSource];
  v6 = [(PKSubcredentialPairingFlowControllerContext *)v4 brandId];

  +[PKSubcredentialPairingAnalyticsReporter beginSubcredentialPairingSessionWithReferralSource:v5 brandId:v6 page:0];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:1 page:0];
  flowController = self->_flowController;

  [(PKSubcredentialPairingFlowControllerProtocol *)flowController provisioningWasCanceledWithOperation:self];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (self->_flowController)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:0 page:0];
    [(PKExplanationViewController *)self showNavigationBarSpinner:1];
    uint64_t v5 = [(PKExplanationViewController *)self explanationView];
    v6 = [v5 dockView];
    [v6 setButtonsEnabled:0];

    flowController = self->_flowController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke;
    v9[3] = &unk_1E59CBA68;
    objc_copyWeak(&v10, &location);
    [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v9];
    objc_destroyWeak(&v10);
  }
  else
  {
    id v8 = [(PKSubcredentialHeroViewController *)self presentingViewController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
  objc_destroyWeak(&location);
}

void __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_super v7 = [WeakRetained navigationController];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke_2;
      v8[3] = &unk_1E59CB100;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      [WeakRetained[131] provisioningFinishedWithOperation:WeakRetained];
    }
  }
}

void __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    v2 = [v4 explanationView];
    id v3 = [v2 dockView];
    [v3 setButtonsEnabled:1];

    id WeakRetained = v4;
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
}

@end