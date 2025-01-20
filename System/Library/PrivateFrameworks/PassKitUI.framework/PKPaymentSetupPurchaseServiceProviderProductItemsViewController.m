@interface PKPaymentSetupPurchaseServiceProviderProductItemsViewController
- (BOOL)acceptedTerms;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupPurchaseController)purchaseController;
- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProduct:(id)a6;
- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProductWithItems:(id)a6;
- (PKPaymentSetupPurchaseServiceProviderProductItemsViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)_initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 primaryServiceProviderProduct:(id)a6 serviceProviderProductWithItems:(id)a7;
- (id)_rightBarButton;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_rightBarButtonPressed:(id)a3;
- (void)_setHeroCardImage:(id)a3;
- (void)didSelectServiceProviderItem:(id)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupPurchaseServiceProviderProductItemsViewController

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProduct:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 items];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __137__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_initWithProvisioningController_context_product_serviceProviderProduct___block_invoke;
  v18[3] = &unk_1E59DD9E0;
  id v19 = v10;
  id v14 = v10;
  v15 = objc_msgSend(v13, "pk_arrayByApplyingBlock:", v18);

  v16 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self _initWithProvisioningController:v12 context:a4 product:v11 primaryServiceProviderProduct:v14 serviceProviderProductWithItems:v15];
  return v16;
}

PKPaymentSetupServiceProviderProductWithItem *__137__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_initWithProvisioningController_context_product_serviceProviderProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PKPaymentSetupServiceProviderProductWithItem alloc] initWithServiceProviderProduct:*(void *)(a1 + 32) item:v3];

  return v4;
}

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProductWithItems:(id)a6
{
  return (PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)[(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self _initWithProvisioningController:a3 context:a4 product:a5 primaryServiceProviderProduct:0 serviceProviderProductWithItems:a6];
}

- (id)_initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 primaryServiceProviderProduct:(id)a6 serviceProviderProductWithItems:(id)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  v16 = [(PKPaymentSetupOptionsViewController *)&v30 initWithProvisioningController:v12 context:a4 delegate:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_product, a5);
    v17->_hasSelectedItems = 0;
    objc_storeStrong((id *)&v17->_primaryServiceProviderProduct, a6);
    [(PKDynamicCollectionViewController *)v17 setUseItemIdentityWhenUpdating:1];
    uint64_t v18 = [(PKPaymentSetupProduct *)v17->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87A88]];
    provisioningMethodMetadata = v17->_provisioningMethodMetadata;
    v17->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v18;

    v20 = [[PKPaymentSetupPurchaseController alloc] initWithProvisioningController:v12 context:a4 purchaseControllerDelegate:v17 product:v13 provisioningMetadata:v17->_provisioningMethodMetadata];
    purchaseController = v17->_purchaseController;
    v17->_purchaseController = v20;

    v22 = [PKPaymentServiceProviderItemsSectionController alloc];
    v23 = [(PKPaymentProvisioningMethodMetadata *)v17->_provisioningMethodMetadata currency];
    uint64_t v24 = [(PKPaymentServiceProviderItemsSectionController *)v22 initWithIdentifier:@"ServiceProviderItems" serviceProviderProductWithItems:v15 currency:v23 delegate:v17];
    listSectionController = v17->_listSectionController;
    v17->_listSectionController = (PKPaymentServiceProviderItemsSectionController *)v24;

    v31[0] = v17->_listSectionController;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [(PKPaymentSetupOptionsViewController *)v17 setSections:v26 animated:0];

    v27 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)v17 navigationItem];
    id v28 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v28 configureWithDefaultBackground];
    [v27 setStandardAppearance:v28];
  }
  return v17;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  [(PKPaymentSetupOptionsViewController *)&v11 viewDidLoad];
  [(PKDynamicCollectionViewController *)self setRetainCellSelectionCellOnReload:1];
  primaryServiceProviderProduct = self->_primaryServiceProviderProduct;
  if (primaryServiceProviderProduct)
  {
    v4 = [(PKDigitalIssuanceServiceProviderProduct *)primaryServiceProviderProduct localizedDisplayName];
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

    [(PKDigitalIssuanceServiceProviderProduct *)self->_primaryServiceProviderProduct localizedDescription];
  }
  else
  {
    v5 = PKLocalizedPaymentString(&cfstr_DciCommutePlan.isa);
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v5];

    PKLocalizedPaymentString(&cfstr_DciCommutePlan_0.isa);
  v6 = };
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  v7 = PKUIImageNamed(@"PlaceholderCardArt_Large");
  [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self _setHeroCardImage:v7];

  v8 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self navigationItem];
  v9 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self _rightBarButton];
  [v8 setRightBarButtonItem:v9];

  id v10 = [v8 rightBarButtonItem];
  [v10 setEnabled:self->_hasSelectedItems];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CC4C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPaymentSetupProduct *)product digitalCardCachedImage:v8];
}

void __91__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    [*(id *)(a1 + 32) _setHeroCardImage:v4];
    id v4 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v4);
    id v4 = v6;
  }
}

- (id)_rightBarButton
{
  id v3 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA_0.isa);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v3 style:2 target:self action:sel__rightBarButtonPressed_];

  return v4;
}

- (void)_rightBarButtonPressed:(id)a3
{
  if (self->_hasSelectedItems)
  {
    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
    purchaseController = self->_purchaseController;
    product = self->_product;
    id v6 = [(PKPaymentSetupServiceProviderProductWithItem *)self->_selectedItemPair serviceProviderProduct];
    id v7 = [(PKPaymentSetupServiceProviderProductWithItem *)self->_selectedItemPair item];
    v8 = [(PKPaymentSetupPurchaseController *)purchaseController paymentRequestForProduct:product serviceProviderProduct:v6 productItem:v7];

    id v9 = [MEMORY[0x1E4F84898] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke;
    v11[3] = &unk_1E59CC6E8;
    v11[4] = self;
    id v12 = v8;
    id v10 = v8;
    [v9 canPresentPaymentRequest:v10 completion:v11];
  }
}

void __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke_2;
  block[3] = &unk_1E59CC648;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 1336) presetPaymentRequest:a1[5] forResultType:a1[6]];
}

- (BOOL)acceptedTerms
{
  return [(PKPaymentSetupPurchaseController *)self->_purchaseController acceptedTerms];
}

- (void)_setHeroCardImage:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentSetupOptionsViewController *)self headerView];
  id v5 = [v4 topArtView];
  if (!v5)
  {
    id v5 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
    [(PKHeroCardExplanationHeaderView *)v5 setPadding:0];
    [(PKHeroCardExplanationHeaderView *)v5 setSize:0];
    [(PKHeroCardExplanationHeaderView *)v5 setHideBackground:1];
    [(PKHeroCardExplanationHeaderView *)v5 setHideShadow:1];
    [v4 setTopArtView:v5];
  }
  [(PKHeroCardExplanationHeaderView *)v5 setCardImage:v6];
}

- (void)didSelectServiceProviderItem:(id)a3
{
  id v4 = (PKPaymentSetupServiceProviderProductWithItem *)a3;
  self->_hasSelectedItems = 1;
  id v5 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:1];

  selectedItemPair = self->_selectedItemPair;
  self->_selectedItemPair = v4;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x1E4F84A30];
  id v6 = (void (**)(id, id))a5;
  id v7 = (id)[[v5 alloc] initWithStatus:0 errors:0];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 1320))
  {
    id v3 = *(void **)(v1 + 1352);
    uint64_t v19 = *MEMORY[0x1E4F86308];
    v20[0] = *MEMORY[0x1E4F86408];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v3 reportEvent:v4];

    id v5 = objc_alloc(MEMORY[0x1E4F84A98]);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 1328);
    uint64_t v8 = *(void *)(v6 + 1320);
    id v9 = [*(id *)(v6 + 1312) serviceProviderProduct];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 1312) item];
    objc_super v11 = [*(id *)(*(void *)(a1 + 32) + 1280) currency];
    id v12 = (void *)[v5 initWithPaymentSetupProduct:v7 purchase:v8 serviceProviderProduct:v9 item:v10 currency:v11];

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 1320);
    *(void *)(v13 + 1320) = 0;

    id v15 = [*(id *)(a1 + 32) provisioningController];
    [v15 resolveRequirementsUsingProvisioningMethodMetadata:*(void *)(*(void *)(a1 + 32) + 1280)];
    v16 = [v12 state];
    v17 = [v15 requirementsResponse];
    [v16 setRequirementsResponse:v17];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1344));
    [WeakRetained purchaseServiceProviderProductItemsViewController:*(void *)(a1 + 32) didPerformPurchaseWithCredential:v12];
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id v3 = [(PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  uint64_t v6 = [v5 _sceneIdentifier];

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
    v12[2] = __131__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
    v12[3] = &unk_1E59CA870;
    v12[4] = self;
    id v13 = v7;
    id v9 = (void (**)(id, void))a5;
    dispatch_async(MEMORY[0x1E4F14428], v12);
    v9[2](v9, 0);
  }
  else
  {
    id v10 = (void (*)(void))*((void *)a5 + 2);
    id v11 = a5;
    v10();
  }
}

void __131__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
}

- (void)paymentSetupDidFinish:(id)a3
{
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupPurchaseServiceProviderProductItemsViewControllerFlowDelegate *)WeakRetained;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_selectedItemPair, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_primaryServiceProviderProduct, 0);

  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
}

@end