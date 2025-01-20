@interface PKPaymentSetupPurchaseViewController
- (BOOL)_isCompactHeight;
- (BOOL)_shouldHideImage;
- (BOOL)acceptedTerms;
- (BOOL)fieldsVerified;
- (CGSize)_imageSize;
- (NSDecimalNumber)currentAmount;
- (NSLayoutConstraint)amountViewBottomHeightConstraint;
- (PKPaymentAuthorizationCoordinator)authorizationCoordinator;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupPurchaseAmountView)amountView;
- (PKPaymentSetupPurchaseController)purchaseController;
- (PKPaymentSetupPurchaseViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6;
- (PKPaymentSetupPurchaseViewControllerFlowDelegate)flowDelegate;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKServiceProviderPurchase)purchase;
- (RemoteUIController)termsController;
- (UIActivityIndicatorView)activityIndicator;
- (UIImage)cardImage;
- (UIImageView)passView;
- (UILabel)titleLabel;
- (id)_rightBarButton;
- (id)_spinnerBarButton;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (int64_t)setupContext;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)_presentTermsAndConditionsWithCompletion:(id)a3;
- (void)_presetPaymentRequest:(id)a3 forResultType:(int64_t)a4;
- (void)_rightBarButtonPressed:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_updateBottomHeightConstraint;
- (void)didUpdateAmount:(id)a3 isValid:(BOOL)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setAcceptedTerms:(BOOL)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAmountView:(id)a3;
- (void)setAmountViewBottomHeightConstraint:(id)a3;
- (void)setAuthorizationCoordinator:(id)a3;
- (void)setCardImage:(id)a3;
- (void)setCurrentAmount:(id)a3;
- (void)setFieldsVerified:(BOOL)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setPassView:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setProvisioningMethodMetadata:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setReporter:(id)a3;
- (void)setSetupContext:(int64_t)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setTermsController:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)shakeCard;
- (void)showKeyPad;
- (void)transferBalanceFromExistingCard;
- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6;
- (void)viewController:(id)a3 didShowProvisioningError:(id)a4;
- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupPurchaseViewController

- (PKPaymentSetupPurchaseViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupPurchaseViewController;
  v14 = [(PKPaymentSetupPurchaseViewController *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_product, a6);
    objc_storeStrong((id *)&v15->_provisioningController, a3);
    v15->_setupContext = a4;
    objc_storeWeak((id *)&v15->_setupDelegate, v12);
    uint64_t v16 = [(PKPaymentSetupProduct *)v15->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87A88]];
    provisioningMethodMetadata = v15->_provisioningMethodMetadata;
    v15->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
    currentAmount = v15->_currentAmount;
    v15->_currentAmount = (NSDecimalNumber *)v18;

    v20 = [[PKPaymentSetupPurchaseController alloc] initWithProvisioningController:v11 context:a4 purchaseControllerDelegate:v15 product:v13 provisioningMetadata:v15->_provisioningMethodMetadata];
    purchaseController = v15->_purchaseController;
    v15->_purchaseController = v20;

    v22 = [(PKPaymentSetupPurchaseViewController *)v15 navigationItem];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v23 configureWithTransparentBackground];
    [v22 setStandardAppearance:v23];
    [v22 setTitle:0];
    v24 = [(PKPaymentSetupPurchaseViewController *)v15 _rightBarButton];
    [v22 setRightBarButtonItem:v24];

    v15->_fieldsVerified = 0;
    v25 = [v22 rightBarButtonItem];
    [v25 setEnabled:v15->_fieldsVerified];
  }
  return v15;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupPurchaseViewController;
  [(PKPaymentSetupPurchaseViewController *)&v5 viewDidLoad];
  v3 = [(PKPaymentSetupPurchaseViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  [(PKPaymentSetupPurchaseViewController *)self _createSubviews];
  [(PKPaymentSetupPurchaseViewController *)self _createConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupPurchaseViewController;
  [(PKPaymentSetupPurchaseViewController *)&v6 viewWillAppear:a3];
  self->_visibility = 1;
  int64_t setupContext = self->_setupContext;
  objc_super v5 = [(PKPaymentSetupPurchaseViewController *)self view];
  PKPaymentSetupApplyContextAppearance(setupContext, v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseViewController;
  [(PKPaymentSetupPurchaseViewController *)&v4 viewWillDisappear:a3];
  self->_visibility = 3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseViewController;
  [(PKPaymentSetupPurchaseViewController *)&v4 viewDidDisappear:a3];
  self->_visibility = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupPurchaseViewController;
  [(PKPaymentSetupPurchaseViewController *)&v12 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  self->_visibility = 2;
  self->_didPurchase = 0;
  [(PKPaymentSetupPurchaseViewController *)self showKeyPad];
  if ([(PKPaymentSetupProduct *)self->_product flags])
  {
    objc_super v4 = (void *)MEMORY[0x1E4FB1418];
    objc_super v5 = PKLocalizedPaymentString(&cfstr_TransitCardOnl.isa);
    objc_super v6 = PKLocalizedPaymentString(&cfstr_TransitCardOnl_0.isa);
    v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

    v8 = (void *)MEMORY[0x1E4FB1410];
    v9 = PKLocalizedPaymentString(&cfstr_TransitCardOnl_1.isa);
    v10 = [v8 actionWithTitle:v9 style:0 handler:0];

    [v7 addAction:v10];
    id v11 = [(PKPaymentSetupPurchaseViewController *)self navigationController];
    [v11 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PKPaymentSetupPurchaseViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CC4C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPaymentSetupProduct *)product digitalCardCachedImage:v8];
}

void __64__PKPaymentSetupPurchaseViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 977) = 1;
    [*(id *)(a1 + 32) setCardImage:v4];
    id v4 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v4);
    id v4 = v6;
  }
}

- (void)shakeCard
{
}

- (void)didUpdateAmount:(id)a3 isValid:(BOOL)a4
{
  objc_storeStrong((id *)&self->_currentAmount, a3);
  self->_fieldsVerified = a4;
  id v6 = [(PKPaymentSetupPurchaseViewController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:self->_fieldsVerified];

  int64_t setupContext = self->_setupContext;
  id v9 = [(PKPaymentSetupPurchaseViewController *)self view];
  PKPaymentSetupApplyContextAppearance(setupContext, v9);
}

- (void)transferBalanceFromExistingCard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained purchaseViewControllerDidRequestTransferBalance:self];
}

- (BOOL)acceptedTerms
{
  return [(PKPaymentSetupPurchaseController *)self->_purchaseController acceptedTerms];
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F84A30];
  id v6 = (void (**)(id, id))a5;
  id v7 = (id)[[v5 alloc] initWithStatus:0 errors:0];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1088);
  *(void *)(v2 + 1088) = 0;

  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 1096))
  {
    uint64_t v5 = *(void **)(result + 1008);
    uint64_t v18 = *MEMORY[0x1E4F86308];
    v19[0] = *MEMORY[0x1E4F86408];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v5 reportEvent:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F84610]);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 1080);
    v10 = [*(id *)(v8 + 1040) currency];
    id v11 = (void *)[v7 initWithAmount:v9 currency:v10 exponent:0];

    objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F84A98]) initWithPaymentSetupProduct:*(void *)(*(void *)(a1 + 32) + 984) purchase:*(void *)(*(void *)(a1 + 32) + 1096) balance:v11];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 1096);
    *(void *)(v13 + 1096) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 976) = 1;
    [*(id *)(*(void *)(a1 + 32) + 1016) resolveRequirementsUsingProvisioningMethodMetadata:*(void *)(*(void *)(a1 + 32) + 1040)];
    v15 = [v12 state];
    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 1016) requirementsResponse];
    [v15 setRequirementsResponse:v16];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
    [WeakRetained purchaseViewController:*(void *)(a1 + 32) didPerformPurchaseWithCredential:v12];

    uint64_t result = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(result + 976)) {
    return [(id)result showKeyPad];
  }
  return result;
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  v3 = [(PKPaymentSetupPurchaseViewController *)self view];
  id v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
    v12[3] = &unk_1E59CA870;
    v12[4] = self;
    id v13 = v7;
    uint64_t v9 = (void (**)(id, void))a5;
    dispatch_async(MEMORY[0x1E4F14428], v12);
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void (*)(void))*((void *)a5 + 2);
    id v11 = a5;
    v10();
  }
}

void __104__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  [WeakRetained viewControllerDidTerminateSetupFlow:self];
}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  id v9 = a4;
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportError:v9 context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  char v6 = objc_opt_respondsToSelector();

  id v7 = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v8 = v7;
  if (v9 && (v6 & 1) != 0) {
    [v7 viewController:self didShowProvisioningError:v9];
  }
  else {
    [v7 viewControllerDidTerminateSetupFlow:self];
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  v10 = [v8 targetDevice];
  if (objc_opt_respondsToSelector())
  {
    [v10 requestPasscodeUpgradeForPasscodeUpgradeFlowController:v8 withVisibleViewController:v7 completion:v9];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F87538];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Error: PKPaymentSetupPurchaseViewController does not support viewController:requestPasscodeUpgradeWithCompletion:";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v14 = [v11 errorWithDomain:v12 code:-1 userInfo:v13];

    v9[2](v9, 0, v14);
  }
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v8 = a6;
  id v9 = [v10 targetDevice];
  if (objc_opt_respondsToSelector()) {
    [v9 exitPasscodeUpgradeForPasscodeUpgradeFlowController:v10 withShouldContinue:v7 error:v8];
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v10 = a4;
  purchaseController = self->_purchaseController;
  id v8 = a3;
  id v9 = [(PKPaymentSetupPurchaseController *)purchaseController termsController];

  if (v9 == v8) {
    PKPaymentSetupApplyContextAppearance(self->_setupContext, v10);
  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  [(PKPaymentSetupPurchaseViewController *)self dismissViewControllerAnimated:1 completion:0];

  [(PKPaymentSetupPurchaseViewController *)self showKeyPad];
}

- (BOOL)_shouldHideImage
{
  if (!PKUIGetMinScreenWidthType()) {
    return 1;
  }

  return [(PKPaymentSetupPurchaseViewController *)self _isCompactHeight];
}

- (BOOL)_isCompactHeight
{
  uint64_t v2 = [(PKPaymentSetupPurchaseViewController *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == 1;

  return v3;
}

- (void)_createSubviews
{
  id v19 = [(PKPaymentSetupPurchaseViewController *)self view];
  BOOL v3 = [[PKPaymentSetupPurchaseAmountView alloc] initWithProduct:self->_product provisioningMethodMetadata:self->_provisioningMethodMetadata];
  amountView = self->_amountView;
  self->_amountView = v3;

  [(PKPaymentSetupPurchaseAmountView *)self->_amountView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKPaymentSetupPurchaseAmountView *)self->_amountView setDelegate:self];
  [v19 addSubview:self->_amountView];
  if (![(PKPaymentSetupPurchaseViewController *)self _shouldHideImage])
  {
    [(PKPaymentSetupPurchaseViewController *)self _imageSize];
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    cardImage = self->_cardImage;
    BOOL v7 = cardImage;
    if (!cardImage)
    {
      BOOL v7 = PKUIImageNamed(@"PlaceholderCardArt_Large");
    }
    id v8 = (UIImageView *)[v5 initWithImage:v7];
    passView = self->_passView;
    self->_passView = v8;

    if (!cardImage) {
    id v10 = [(UIImageView *)self->_passView layer];
    }
    [v10 setShadowRadius:12.0];
    id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(v10, "setShadowOffset:", 0.0, 12.0);
    LODWORD(v12) = 1.0;
    [v10 setShadowOpacity:v12];
    [v10 setMasksToBounds:0];
    id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    [v13 CGColor];
    PKPaymentStyleApplyCorners();

    [(UIImageView *)self->_passView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_passView setAccessibilityIgnoresInvertColors:1];
    [v19 addSubview:self->_passView];
  }
  v14 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB2790], 2, 0);
  uint64_t v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v15;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = self->_titleLabel;
  uint64_t v18 = PKLocalizedPaymentString(&cfstr_SetupPurchaseS.isa);
  [(UILabel *)v17 setText:v18];

  [(UILabel *)self->_titleLabel setFont:v14];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setLineBreakMode:4];
  [v19 addSubview:self->_titleLabel];
}

- (void)_createConstraints
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentSetupPurchaseViewController *)self view];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v43 = v3;
  char v6 = [v3 safeAreaLayoutGuide];
  passView = self->_passView;
  id v41 = v4;
  if (passView)
  {
    [(PKPaymentSetupPurchaseViewController *)self _imageSize];
    double v9 = v8;
    id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v10];
    double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v9];
    [v4 addObject:v12];
    [v4 addObject:v11];
    id v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passView attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];
    [v5 addObject:v13];

    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passView attribute:3 relatedBy:0 toItem:v6 attribute:15 multiplier:1.0 constant:0.0];
    [v5 addObject:v14];

    passView = self->_passView;
  }
  titleLabel = self->_titleLabel;
  uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
  if (passView) {
    v17 = passView;
  }
  else {
    v17 = v6;
  }
  if (passView) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 15;
  }
  BOOL v19 = [(PKPaymentSetupPurchaseViewController *)self _isCompactHeight];
  double v20 = 8.0;
  if (!v19) {
    double v20 = 44.0;
  }
  v21 = [v16 constraintWithItem:titleLabel attribute:12 relatedBy:0 toItem:v17 attribute:v18 multiplier:1.0 constant:v20];
  [v5 addObject:v21];

  v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:v6 attribute:17 multiplier:1.0 constant:0.0];
  [v5 addObject:v22];

  id v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:6 relatedBy:0 toItem:v6 attribute:18 multiplier:1.0 constant:0.0];
  [v5 addObject:v23];

  v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountView attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:11 multiplier:1.0 constant:0.0];
  [v5 addObject:v24];

  v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountView attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
  amountViewBottomHeightConstraint = self->_amountViewBottomHeightConstraint;
  self->_amountViewBottomHeightConstraint = v25;

  [(PKPaymentSetupPurchaseViewController *)self _updateBottomHeightConstraint];
  [v5 addObject:self->_amountViewBottomHeightConstraint];
  objc_super v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountView attribute:5 relatedBy:0 toItem:v6 attribute:17 multiplier:1.0 constant:0.0];
  [v5 addObject:v27];

  v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountView attribute:6 relatedBy:0 toItem:v6 attribute:18 multiplier:1.0 constant:0.0];
  [v5 addObject:v28];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v29 = v42;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v30)
  {
    uint64_t v32 = v30;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(v29);
        }
        LODWORD(v31) = 1148846080;
        [*(id *)(*((void *)&v48 + 1) + 8 * i) setPriority:v31];
      }
      uint64_t v32 = [v29 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v32);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v35 = v5;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v36)
  {
    uint64_t v38 = v36;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v35);
        }
        LODWORD(v37) = 1144750080;
        [*(id *)(*((void *)&v44 + 1) + 8 * j) setPriority:v37];
      }
      uint64_t v38 = [v35 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v38);
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v29];
  [MEMORY[0x1E4F28DC8] activateConstraints:v35];
}

- (id)_rightBarButton
{
  BOOL v3 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA.isa);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v3 style:2 target:self action:sel__rightBarButtonPressed_];

  return v4;
}

- (id)_spinnerBarButton
{
  if (!self->_activityIndicator)
  {
    BOOL v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    PKPaymentSetupApplyContextAppearance([(PKPaymentSetupPurchaseViewController *)self setupContext], self->_activityIndicator);
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicator];

  return v5;
}

- (void)showKeyPad
{
  id v2 = [(PKPaymentSetupPurchaseAmountView *)self->_amountView amountTextField];
  [v2 becomeFirstResponder];
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(PKPaymentSetupPurchaseViewController *)self navigationItem];
  if (v3)
  {
    id v5 = [(PKPaymentSetupPurchaseViewController *)self _spinnerBarButton];
    [v7 setRightBarButtonItem:v5];

    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  }
  else
  {
    char v6 = [(PKPaymentSetupPurchaseViewController *)self _rightBarButton];
    [v7 setRightBarButtonItem:v6];

    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  }
}

- (void)_rightBarButtonPressed:(id)a3
{
  if (self->_fieldsVerified)
  {
    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
    id v4 = [(PKPaymentSetupPurchaseAmountView *)self->_amountView amountTextField];
    [v4 resignFirstResponder];

    id v5 = [(PKPaymentSetupPurchaseController *)self->_purchaseController paymentRequestForAmount:self->_currentAmount];
    char v6 = [MEMORY[0x1E4F84898] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke;
    v8[3] = &unk_1E59CC6E8;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [v6 canPresentPaymentRequest:v7 completion:v8];
  }
}

void __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke_2;
  block[3] = &unk_1E59CC648;
  BOOL v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 992) presetPaymentRequest:a1[5] forResultType:a1[6]];
}

- (void)_presetPaymentRequest:(id)a3 forResultType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 5 || a4 == 2)
  {
    [(PKPaymentSetupPurchaseController *)self->_purchaseController presetPaymentRequest:v6 forResultType:a4];
  }
  else if (PKViewVisibilityStateIsVisible())
  {
    [(PKPaymentSetupPurchaseViewController *)self _showSpinner:1];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PKPaymentSetupPurchaseViewController__presetPaymentRequest_forResultType___block_invoke;
    v7[3] = &unk_1E59CC710;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    id v8 = v6;
    [(PKPaymentSetupPurchaseViewController *)self _presentTermsAndConditionsWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __76__PKPaymentSetupPurchaseViewController__presetPaymentRequest_forResultType___block_invoke(uint64_t a1, int a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 1008);
    uint64_t v6 = *MEMORY[0x1E4F86308];
    v12[0] = *MEMORY[0x1E4F86488];
    uint64_t v7 = *MEMORY[0x1E4F86D18];
    v11[0] = v6;
    v11[1] = v7;
    id v8 = PKAnalyticsReportSwitchToggleResultValue();
    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [v5 reportEvent:v9];

    [WeakRetained _showSpinner:0];
    if (a2)
    {
      if (PKViewVisibilityStateIsVisible())
      {
        double v10 = [WeakRetained authorizationCoordinator];
        if (!v10)
        {
          double v10 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:*(void *)(a1 + 40)];
          [WeakRetained setAuthorizationCoordinator:v10];
          [v10 setDelegate:WeakRetained];
          [v10 _setPrivateDelegate:WeakRetained];
          [v10 presentWithCompletion:0];
        }
      }
    }
  }
}

- (void)_presentTermsAndConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_acceptedTerms)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
  else
  {
    uint64_t v6 = [(PKPaymentSetupProduct *)self->_product termsURL];
    if (v6)
    {
      if (!self->_termsController)
      {
        uint64_t v7 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
        termsController = self->_termsController;
        self->_termsController = v7;

        [(RemoteUIController *)self->_termsController setDelegate:self];
      }
      [(PKPaymentSetupPurchaseViewController *)self resignFirstResponder];
      id v9 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
      double v10 = objc_alloc_init(PKPortraitNavigationController);
      [(PKPortraitNavigationController *)v10 setModalInPresentation:1];
      [(RemoteUIController *)self->_termsController setNavigationController:v10];
      id v11 = [(RemoteUIController *)self->_termsController loader];
      double v12 = [v9 context];
      objc_msgSend(v11, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

      objc_initWeak(&location, self);
      id v13 = self->_termsController;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke;
      v15[3] = &unk_1E59CC788;
      objc_copyWeak(&v20, &location);
      v14 = v10;
      uint64_t v16 = v14;
      v17 = self;
      BOOL v19 = v5;
      id v18 = v6;
      [(RemoteUIController *)v13 loadURL:v18 postBody:0 completion:v15];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      v5[2](v5, 1, 0);
    }
  }
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CC760;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  char v16 = a2;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v14 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      PKPaymentSetupApplyContextAppearance([WeakRetained setupContext], *(void **)(a1 + 32));
      int v5 = objc_msgSend(*(id *)(a1 + 40), "pkui_userInterfaceIdiomSupportsLargeLayouts");
      if (PKViewVisibilityStateIsVisible())
      {
        if (v5)
        {
          [*(id *)(a1 + 32) setModalPresentationStyle:3];
          [v4 presentViewController:*(void *)(a1 + 32) withTransition:1 completion:0];
        }
        else
        {
          [v4 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
        }
        id v9 = (void *)v4[140];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_3;
        v15[3] = &unk_1E59CC738;
        objc_copyWeak(&v17, v2);
        char v18 = v5;
        id v16 = *(id *)(a1 + 64);
        [v9 setHandlerForElementName:@"agree" handler:v15];
        id v10 = (void *)v4[140];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_4;
        v11[3] = &unk_1E59CC738;
        objc_copyWeak(&v13, v2);
        char v14 = v5;
        id v12 = *(id *)(a1 + 64);
        [v10 setHandlerForElementName:@"disagree" handler:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&v17);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        id v8 = [*(id *)(a1 + 56) localizedDescription];
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v7;
        __int16 v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@ with error: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setAcceptedTerms:1];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 dismissViewControllerWithTransition:1 completion:0];
    }
    else {
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(unsigned char *)(a1 + 48)) {
      [WeakRetained dismissViewControllerWithTransition:2 completion:0];
    }
    else {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (CGSize)_imageSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = dbl_1A0442FE0[v2 < 5];
  double v4 = dbl_1A0442FF0[v2 < 5];
  if (!v2)
  {
    double v4 = 81.0;
    double v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_updateBottomHeightConstraint
{
  [(PKPaymentSetupPurchaseAmountView *)self->_amountView defaultKeyboardSize];
  double v4 = v3;
  amountViewBottomHeightConstraint = self->_amountViewBottomHeightConstraint;
  +[PKNumberPadSuggestionsView defaultSize];

  [(NSLayoutConstraint *)amountViewBottomHeightConstraint setConstant:-(v4 + v6)];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (PKPaymentSetupPurchaseViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupPurchaseViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (void)setSetupContext:(int64_t)a3
{
  self->_int64_t setupContext = a3;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata
{
  return self->_provisioningMethodMetadata;
}

- (void)setProvisioningMethodMetadata:(id)a3
{
}

- (UIImageView)passView
{
  return self->_passView;
}

- (void)setPassView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (PKPaymentSetupPurchaseAmountView)amountView
{
  return self->_amountView;
}

- (void)setAmountView:(id)a3
{
}

- (NSLayoutConstraint)amountViewBottomHeightConstraint
{
  return self->_amountViewBottomHeightConstraint;
}

- (void)setAmountViewBottomHeightConstraint:(id)a3
{
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (void)setCurrentAmount:(id)a3
{
}

- (PKPaymentAuthorizationCoordinator)authorizationCoordinator
{
  return self->_authorizationCoordinator;
}

- (void)setAuthorizationCoordinator:(id)a3
{
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (BOOL)fieldsVerified
{
  return self->_fieldsVerified;
}

- (void)setFieldsVerified:(BOOL)a3
{
  self->_fieldsVerified = a3;
}

- (void)setAcceptedTerms:(BOOL)a3
{
  self->_acceptedTerms = a3;
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_amountViewBottomHeightConstraint, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_purchaseController, 0);

  objc_storeStrong((id *)&self->_product, 0);
}

@end