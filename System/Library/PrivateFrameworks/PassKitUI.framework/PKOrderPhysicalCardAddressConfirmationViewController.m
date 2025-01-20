@interface PKOrderPhysicalCardAddressConfirmationViewController
- (BOOL)_shouldShowCancelNavigationButton;
- (PKOrderPhysicalCardAddressConfirmationViewController)initWithOrderPhysicalCardController:(id)a3;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (id)_addressBodyStringWithPostalAddress:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_presentNextViewControllerOrTerminate;
- (void)_presentViewController:(id)a3;
- (void)_showDisplayableError:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_terminateFlow;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKOrderPhysicalCardAddressConfirmationViewController

- (PKOrderPhysicalCardAddressConfirmationViewController)initWithOrderPhysicalCardController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v15, sel_initWithContext_, [v5 paymentSetupContext]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = [v5 featureIdentifier];
    uint64_t v8 = [v5 shippingAddress];
    shippingAddress = v7->_shippingAddress;
    v7->_shippingAddress = (CNPostalAddress *)v8;

    uint64_t v10 = [v5 selectedArtworkOption];
    artworkOption = v7->_artworkOption;
    v7->_artworkOption = (PKPhysicalCardArtworkOption *)v10;

    v7->_supportsAddressChange = +[PKBusinessChatController deviceSupportsBusinessChat];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v12 configureWithTransparentBackground];
    v13 = [(PKOrderPhysicalCardAddressConfirmationViewController *)v7 navigationItem];
    [v13 setStandardAppearance:v12];

    [(PKExplanationViewController *)v7 setExplanationViewControllerDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  [(PKOrderPhysicalCardAddressConfirmationViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  [(PKExplanationViewController *)&v21 viewDidLoad];
  [(PKExplanationViewController *)self setShowCancelButton:[(PKOrderPhysicalCardAddressConfirmationViewController *)self _shouldShowCancelNavigationButton]];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v3 = [(PKOrderPhysicalCardAddressConfirmationViewController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setDelegate:self];
  [v4 setShowPrivacyView:0];
  [v4 setForceShowSetupLaterButton:1];
  [v4 setImageIgnoresTopSafeArea:1];
  objc_super v5 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  physicalCardHeroView = self->_physicalCardHeroView;
  self->_physicalCardHeroView = v5;

  v7 = [(PKOrderPhysicalCardHeroView *)self->_physicalCardHeroView artworkView];
  uint64_t v8 = [(PKOrderPhysicalCardController *)self->_controller nameOnCard];
  [v7 setNameOnCard:v8];

  v9 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v10 = [(PKPhysicalCardArtworkOption *)self->_artworkOption frontFaceImage];
  v11 = [v9 imageWithPKImage:v10];
  [v7 setArtworkImage:v11];

  [v4 setHeroView:self->_physicalCardHeroView];
  id v12 = PKLocalizedFeatureString();
  [v4 setTitleText:v12];

  v13 = [(PKOrderPhysicalCardAddressConfirmationViewController *)self _addressBodyStringWithPostalAddress:self->_shippingAddress];
  [v4 setBodyText:v13];

  v14 = [v4 dockView];
  objc_super v15 = [v14 primaryButton];
  v16 = PKLocalizedFeatureString();
  [v15 setTitle:v16 forState:0];

  v17 = [v4 dockView];
  v18 = [v17 footerView];

  [v18 setSkipCardButton:0];
  [v18 setManualEntryButton:0];
  if (self->_supportsAddressChange)
  {
    v19 = [v18 setupLaterButton];
    v20 = PKLocalizedFeatureString();
    [v19 setTitle:v20 forState:0];
  }
  else
  {
    [v18 setSetupLaterButton:0];
  }
}

- (BOOL)_shouldShowCancelNavigationButton
{
  v2 = [(PKOrderPhysicalCardAddressConfirmationViewController *)self navigationController];
  BOOL v3 = [v2 modalPresentationStyle] != 3;

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  [(PKOrderPhysicalCardAddressConfirmationViewController *)&v6 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    objc_super v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (id)_addressBodyStringWithPostalAddress:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [(PKPhysicalCardArtworkOption *)self->_artworkOption minimumEstimatedShippingTime];
  uint64_t v7 = [(PKPhysicalCardArtworkOption *)self->_artworkOption maximumEstimatedShippingTime];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = PKLocalizedFeatureString();
  }
  else
  {
    uint64_t v10 = v7;
    unint64_t v11 = [(PKPhysicalCardArtworkOption *)self->_artworkOption shippingTimeUnit];
    if (v11 > 2)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = PKLocalizedString(&off_1E59CB798[v11]->isa);
    }
    uint64_t v19 = v6;
    uint64_t v20 = v10;
    v9 = PKStringWithValidatedFormat();
  }
  objc_msgSend(v5, "appendString:", v9, v19, v20);
  if (self->_supportsAddressChange)
  {
    if (!v4) {
      goto LABEL_18;
    }
  }
  else
  {
    id v13 = [NSString alloc];
    v14 = PKLocalizedFeatureString();
    objc_super v15 = (void *)[v13 initWithFormat:@"\n%@", v14];
    [v5 appendString:v15];

    if (!v4) {
      goto LABEL_18;
    }
  }
  v16 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v4 style:0];
  if (v16)
  {
    [v5 appendString:@"\n\n"];
    [v5 appendString:v16];
  }

LABEL_18:
  v17 = (void *)[v5 copy];

  return v17;
}

- (void)_presentNextViewControllerOrTerminate
{
  controller = self->_controller;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__PKOrderPhysicalCardAddressConfirmationViewController__presentNextViewControllerOrTerminate__block_invoke;
  v3[3] = &unk_1E59CB6B0;
  v3[4] = self;
  [(PKOrderPhysicalCardController *)controller nextViewControllerWithCompletion:v3];
}

void __93__PKOrderPhysicalCardAddressConfirmationViewController__presentNextViewControllerOrTerminate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = +[PKAccountFlowController displayableErrorForError:a3 featureIdentifier:*(void *)(*(void *)(a1 + 32) + 1048) genericErrorTitle:0 genericErrorMessage:0];
    [*(id *)(a1 + 32) _showDisplayableError:v5];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _presentViewController:a2];
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    uint64_t v6 = [(PKOrderPhysicalCardAddressConfirmationViewController *)self navigationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PKOrderPhysicalCardAddressConfirmationViewController__presentViewController___block_invoke;
    v7[3] = &unk_1E59CB6D8;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);
  }
  else
  {
    [(PKExplanationViewController *)self showNavigationBarSpinner:0];
    [(PKOrderPhysicalCardAddressConfirmationViewController *)self _terminateFlow];
  }
}

uint64_t __79__PKOrderPhysicalCardAddressConfirmationViewController__presentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)_terminateFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else {
    [(PKOrderPhysicalCardAddressConfirmationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(PKExplanationViewController *)self explanationView];
  id v4 = [v9 dockView];
  id v5 = [v4 primaryButton];
  [v5 setShowSpinner:v3];
  uint64_t v6 = v3 ^ 1;
  [v5 setEnabled:v6];
  uint64_t v7 = [v4 footerView];
  BOOL v8 = [v7 setupLaterButton];
  [v8 setEnabled:v6];
}

- (void)_showDisplayableError:(id)a3
{
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  [(PKOrderPhysicalCardAddressConfirmationViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (!self->_inUseAssertion)
  {
    id v4 = (void *)MEMORY[0x1E4F1E5E8];
    id v5 = PKPassKitCoreBundle();
    uint64_t v6 = (CLInUseAssertion *)[v4 newAssertionForBundle:v5 withReason:@"Ordering physical card"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;
  }
  [(PKOrderPhysicalCardAddressConfirmationViewController *)self _showSpinner:1];
  controller = self->_controller;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke;
  v9[3] = &unk_1E59CB700;
  v9[4] = self;
  [(PKOrderPhysicalCardController *)controller startOrderPhysicalCardWithCompletion:v9];
}

void __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:v7];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 1096);
    *(void *)(v12 + 1096) = v11;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "setDelegate:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "_setPrivateDelegate:");
    uint64_t v14 = *(void *)(a1 + 32);
    objc_super v15 = *(void **)(v14 + 1096);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_2;
    v17[3] = &unk_1E59CB6D8;
    v17[4] = v14;
    [v15 presentWithCompletion:v17];
  }
  else if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_4;
    v16[3] = &unk_1E59CA7D0;
    v16[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
  else if (v9)
  {
    [*(id *)(a1 + 32) _showSpinner:0];
    [*(id *)(a1 + 32) _showDisplayableError:v10];
  }
}

void __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

uint64_t __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentNextViewControllerOrTerminate];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4 = a3;
  if (self->_supportsAddressChange)
  {
    if (!self->_businessChatController)
    {
      id v5 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v5;
    }
    id v7 = [PKBusinessChatPhysicalCardContext alloc];
    id v8 = [(PKOrderPhysicalCardController *)self->_controller paymentPass];
    id v9 = [(PKBusinessChatPhysicalCardContext *)v7 initWithPaymentPass:v8 intent:0];

    objc_initWeak(&location, self);
    uint64_t v10 = self->_businessChatController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke;
    v11[3] = &unk_1E59CB240;
    objc_copyWeak(&v12, &location);
    [(PKBusinessChatController *)v10 openBusinessChatWithContext:v9 completion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v5 = WeakRetained;
    if (v3)
    {
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      [WeakRetained _terminateFlow];
    }
    id WeakRetained = v5;
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_paymentAuthorizationCoordinator == v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[PKOrderPhysicalCardAddressConfirmationViewController paymentAuthorizationCoordinatorDidFinish:]";
      __int16 v12 = 2048;
      id v13 = self;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
    self->_paymentAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E59CA870;
    id v8 = v4;
    id v9 = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v3[3] = &unk_1E59CA7D0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissWithCompletion:v3];
}

void __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 1088))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
    block[3] = &unk_1E59CA7D0;
    block[4] = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentNextViewControllerOrTerminate];
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id v3 = [(PKOrderPhysicalCardAddressConfirmationViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v7 = a5;
  controller = self->_controller;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v10[3] = &unk_1E59CB750;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(PKOrderPhysicalCardController *)controller completeOrderPhysicalCardWithApplePayTrustSignature:a4 completion:v10];
}

void __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke_2;
  v10[3] = &unk_1E59CB728;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    LODWORD(v2) = *(void *)(a1 + 40) == 0;
  }
  uint64_t v3 = v2 ^ 1;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F84A30]) initWithStatus:v3 errors:0];
  if (v3)
  {
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 48), "_showDisplayableError:");
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 1088) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  artworkOption = self->_artworkOption;
  if (artworkOption)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E59CB778;
    id v9 = v4;
    id v7 = [(PKPhysicalCardArtworkOption *)artworkOption artworkImage:v8];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_physicalCardHeroView, 0);
  objc_storeStrong((id *)&self->_artworkOption, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end