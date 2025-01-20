@interface PKOrderPhysicalCardViewController
- (NSString)bodyOverride;
- (NSString)primaryButtonTitleOverride;
- (NSString)secondaryButtonTitleOverride;
- (NSString)titleOverride;
- (PKOrderPhysicalCardViewController)initWithController:(id)a3;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (void)_handleNextStep;
- (void)_terminateSetupFlow;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setBodyOverride:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryButtonTitleOverride:(id)a3;
- (void)setSecondaryButtonTitleOverride:(id)a3;
- (void)setTitleOverride:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKOrderPhysicalCardViewController

- (PKOrderPhysicalCardViewController)initWithController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKOrderPhysicalCardViewController;
  v6 = [(PKExplanationViewController *)&v12 init];
  if (v6)
  {
    v6->_context = [v5 paymentSetupContext];
    objc_storeStrong((id *)&v6->_controller, a3);
    v6->_featureIdentifier = [v5 featureIdentifier];
    uint64_t v7 = [v5 nameOnCard];
    nameOnCard = v6->_nameOnCard;
    v6->_nameOnCard = (NSString *)v7;

    uint64_t v9 = [v5 selectedArtworkOption];
    artworkOption = v6->_artworkOption;
    v6->_artworkOption = (PKPhysicalCardArtworkOption *)v9;

    v6->_unavailableToOrder = [(PKPhysicalCardArtworkOption *)v6->_artworkOption optionUnavailable];
  }

  return v6;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PKOrderPhysicalCardViewController;
  [(PKExplanationViewController *)&v29 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKOrderPhysicalCardViewController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setDelegate:self];
  [v4 setShowPrivacyView:0];
  [v4 setForceShowSetupLaterButton:1];
  [v4 setTitleHyphenationFactor:0.1];
  [v4 setImageIgnoresTopSafeArea:1];
  id v5 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  physicalCardHeroView = self->_physicalCardHeroView;
  self->_physicalCardHeroView = v5;

  uint64_t v7 = [(PKOrderPhysicalCardHeroView *)self->_physicalCardHeroView artworkView];
  v8 = [(PKOrderPhysicalCardController *)self->_controller nameOnCard];
  [v7 setNameOnCard:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
  v10 = [(PKPhysicalCardArtworkOption *)self->_artworkOption frontFaceImage];
  v11 = [v9 imageWithPKImage:v10];
  [v7 setArtworkImage:v11];

  [v4 setHeroView:self->_physicalCardHeroView];
  if (self->_unavailableToOrder)
  {
    objc_super v12 = PKLocalizedFeatureString();
    v13 = PKLocalizedFeatureString();
LABEL_3:
    PKLocalizedFeatureString();
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  titleOverride = self->_titleOverride;
  if (titleOverride)
  {
    v16 = titleOverride;
  }
  else
  {
    PKLocalizedFeatureString();
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  objc_super v12 = v16;
  bodyOverride = self->_bodyOverride;
  if (bodyOverride)
  {
    v18 = bodyOverride;
  }
  else
  {
    PKLocalizedFeatureString();
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v18;
  primaryButtonTitleOverride = self->_primaryButtonTitleOverride;
  if (!primaryButtonTitleOverride) {
    goto LABEL_3;
  }
  v14 = primaryButtonTitleOverride;
LABEL_12:
  v20 = v14;
  [v4 setTitleText:v12];
  [v4 setBodyText:v13];
  v21 = [v4 dockView];
  v22 = [v21 primaryButton];
  [v22 setTitle:v20 forState:0];

  v23 = [v4 dockView];
  v24 = [v23 footerView];

  [v24 setSkipCardButton:0];
  [v24 setManualEntryButton:0];
  [v24 setForceShowSetupLaterButton:!self->_unavailableToOrder];
  if (!self->_unavailableToOrder)
  {
    v25 = [v24 setupLaterButton];
    v26 = v25;
    secondaryButtonTitleOverride = self->_secondaryButtonTitleOverride;
    if (secondaryButtonTitleOverride)
    {
      [v25 setTitle:secondaryButtonTitleOverride forState:0];
    }
    else
    {
      v28 = PKLocalizedFeatureString();
      [v26 setTitle:v28 forState:0];
    }
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (self->_unavailableToOrder)
  {
    [(PKOrderPhysicalCardViewController *)self _handleNextStep];
  }
  else
  {
    v4 = [[PKOrderPhysicalCardAddressConfirmationViewController alloc] initWithOrderPhysicalCardController:self->_controller];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(PKOrderPhysicalCardAddressConfirmationViewController *)v4 setDelegate:WeakRetained];

    v6 = [(PKOrderPhysicalCardViewController *)self navigationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PKOrderPhysicalCardViewController_explanationViewDidSelectContinue___block_invoke;
    v7[3] = &unk_1E59CB6D8;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v4, 1, v7);
  }
}

uint64_t __70__PKOrderPhysicalCardViewController_explanationViewDidSelectContinue___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _handleNextStep];
  }
  return result;
}

- (void)_handleNextStep
{
  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke;
  v4[3] = &unk_1E59CB6B0;
  v4[4] = self;
  [(PKOrderPhysicalCardController *)controller nextViewControllerWithCompletion:v4];
}

void __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    id v5 = [*(id *)(a1 + 32) navigationController];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke_2;
    v6[3] = &unk_1E59CB6D8;
    v6[4] = *(void *)(a1 + 32);
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v4, 1, v6);
  }
  else
  {
    [*(id *)(a1 + 32) showNavigationBarSpinner:0];
    [*(id *)(a1 + 32) _terminateSetupFlow];
  }
}

uint64_t __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateSetupFlow];
  }
  return result;
}

- (void)_terminateSetupFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    v4 = [(PKOrderPhysicalCardViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  artworkOption = self->_artworkOption;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CB778;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPhysicalCardArtworkOption *)artworkOption artworkImage:v8];
}

void __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
}

- (NSString)bodyOverride
{
  return self->_bodyOverride;
}

- (void)setBodyOverride:(id)a3
{
}

- (NSString)primaryButtonTitleOverride
{
  return self->_primaryButtonTitleOverride;
}

- (void)setPrimaryButtonTitleOverride:(id)a3
{
}

- (NSString)secondaryButtonTitleOverride
{
  return self->_secondaryButtonTitleOverride;
}

- (void)setSecondaryButtonTitleOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitleOverride, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitleOverride, 0);
  objc_storeStrong((id *)&self->_bodyOverride, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicalCardHeroView, 0);
  objc_storeStrong((id *)&self->_artworkOption, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end