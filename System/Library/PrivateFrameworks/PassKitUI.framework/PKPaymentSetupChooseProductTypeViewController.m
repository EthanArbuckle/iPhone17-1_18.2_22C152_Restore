@interface PKPaymentSetupChooseProductTypeViewController
- (BOOL)acceptedTerms;
- (PKPaymentSetupChooseProductTypeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6;
- (PKPaymentSetupChooseProductTypeViewControllerFlowDelegate)flowDelegate;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupPurchaseController)purchaseController;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)didSelectPKPaymentSetupChooseProductListItem:(id)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupChooseProductTypeViewController

- (PKPaymentSetupChooseProductTypeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  v14 = [(PKDynamicCollectionViewController *)&v36 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_product, a6);
    objc_storeStrong((id *)&v15->_provisioningController, a3);
    v15->_setupContext = a4;
    objc_storeStrong((id *)&v15->_setupDelegate, a5);
    uint64_t v16 = [(PKPaymentSetupProduct *)v15->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87A88]];
    provisioningMethodMetadata = v15->_provisioningMethodMetadata;
    v15->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v16;

    uint64_t v18 = PKUIImageNamed(@"PlaceholderCardArt_Large");
    cardImage = v15->_cardImage;
    v15->_cardImage = (UIImage *)v18;

    v20 = [(PKPaymentSetupChooseProductTypeViewController *)v15 navigationItem];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v21 configureWithOpaqueBackground];
    [v20 setStandardAppearance:v21];
    [v20 setTitle:0];
    v22 = [(PKPaymentSetupChooseProductTypeViewController *)v15 navigationController];
    v35 = [v22 navigationBar];

    [v35 frame];
    double v24 = v23;
    double v25 = v23 + v23;
    v26 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v23 + v23, v23);
    titleIconView = v15->_titleIconView;
    v15->_titleIconView = v26;

    v28 = v15->_titleIconView;
    v29 = [MEMORY[0x1E4FB1618] systemCyanColor];
    [(PKAnimatedNavigationBarTitleView *)v28 setBackgroundColor:v29];

    [(PKAnimatedNavigationBarTitleView *)v15->_titleIconView setAlpha:1.0];
    objc_msgSend(v20, "pkui_setCenterAlignedTitleView:", v15->_titleIconView);
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    passView = v15->_passView;
    v15->_passView = v30;

    v32 = v15->_passView;
    v33 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UIImageView *)v32 setBackgroundColor:v33];

    -[UIImageView setFrame:](v15->_passView, "setFrame:", 0.0, 0.0, v25, v24);
    [(UIImageView *)v15->_passView setAlpha:1.0];
    [(PKAnimatedNavigationBarTitleView *)v15->_titleIconView setTitleView:v15->_passView animated:1];
    [(PKDynamicCollectionViewController *)v15 setUseItemIdentityWhenUpdating:1];
  }
  return v15;
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  [(PKDynamicCollectionViewController *)&v9 viewDidLoad];
  v3 = [PKPaymentSetupChooseProductListSectionController alloc];
  cardImage = self->_cardImage;
  v5 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata digitalIssuanceMetadata];
  v6 = [(PKPaymentSetupChooseProductListSectionController *)v3 initWithImage:cardImage digitalIssuanceMetadata:v5];
  listSectionController = self->_listSectionController;
  self->_listSectionController = v6;

  [(PKPaymentSetupChooseProductListSectionController *)self->_listSectionController setDelegate:self];
  v10[0] = self->_listSectionController;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKDynamicCollectionViewController *)self setSections:v8 animated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PKPaymentSetupChooseProductTypeViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CC4C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPaymentSetupProduct *)product digitalCardCachedImage:v8];
}

void __73__PKPaymentSetupChooseProductTypeViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1056) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1120), a3);
    [*(id *)(*(void *)(a1 + 32) + 1104) setImage:*(void *)(*(void *)(a1 + 32) + 1120)];
    [*(id *)(*(void *)(a1 + 32) + 1152) setCardImage:*(void *)(*(void *)(a1 + 32) + 1120)];
    v5 = [*(id *)(a1 + 32) view];
    [v5 layoutSubviews];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

- (void)didSelectPKPaymentSetupChooseProductListItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  selectedItemIdentifier = self->_selectedItemIdentifier;
  self->_selectedItemIdentifier = v5;

  uint64_t v7 = [v4 type];
  if (v7 == 1)
  {
    id v10 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata digitalIssuanceMetadata];
    v8 = [v10 serviceProviderProducts];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained chooseProductTypeViewController:self didSelectServiceProducts:v8];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [v10 chooseProductTypeViewControllerDidSelectManualEntry:self];
  }
}

- (BOOL)acceptedTerms
{
  return [(PKPaymentSetupPurchaseController *)self->_purchaseController acceptedTerms];
}

- (void)_showSpinner:(BOOL)a3
{
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  v5 = (objc_class *)MEMORY[0x1E4F84A30];
  uint64_t v6 = (void (**)(id, id))a5;
  id v7 = (id)[[v5 alloc] initWithStatus:0 errors:0];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1184);
  *(void *)(v2 + 1184) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 1192))
  {
    v5 = *(void **)(v4 + 1224);
    uint64_t v20 = *MEMORY[0x1E4F86308];
    v21[0] = *MEMORY[0x1E4F86408];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [v5 reportEvent:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F84A98]);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 1200);
    uint64_t v10 = *(void *)(v8 + 1192);
    uint64_t v11 = *(void *)(v8 + 1168);
    uint64_t v12 = *(void *)(v8 + 1176);
    id v13 = [*(id *)(v8 + 1096) currency];
    v14 = (void *)[v7 initWithPaymentSetupProduct:v9 purchase:v10 serviceProviderProduct:v11 item:v12 currency:v13];

    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 1192);
    *(void *)(v15 + 1192) = 0;

    [*(id *)(*(void *)(a1 + 32) + 1072) resolveRequirementsUsingProvisioningMethodMetadata:*(void *)(*(void *)(a1 + 32) + 1096)];
    v17 = [v14 state];
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 1072) requirementsResponse];
    [v17 setRequirementsResponse:v18];

    [*(id *)(a1 + 32) _showSpinner:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
    [WeakRetained chooseProductTypeViewController:*(void *)(a1 + 32) didPerformPurchaseWithCredential:v14];
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  v3 = [(PKPaymentSetupChooseProductTypeViewController *)self view];
  uint64_t v4 = [v3 window];
  v5 = [v4 windowScene];
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
    v12[2] = __113__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
    v12[3] = &unk_1E59CA870;
    v12[4] = self;
    id v13 = v7;
    uint64_t v9 = (void (**)(id, void))a5;
    dispatch_async(MEMORY[0x1E4F14428], v12);
    v9[2](v9, 0);
  }
  else
  {
    uint64_t v10 = (void (*)(void))*((void *)a5 + 2);
    id v11 = a5;
    v10();
  }
}

void __113__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  p_flowDelegate = &self->_flowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_flowDelegate);
    [v7 chooseProductTypeViewControllerDidTerminate:self];
  }
  else
  {
    setupDelegate = self->_setupDelegate;
    [(PKPaymentSetupViewControllerDelegate *)setupDelegate viewControllerDidTerminateSetupFlow:self];
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
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (PKPaymentSetupChooseProductTypeViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupChooseProductTypeViewControllerFlowDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_postPaidItem, 0);
  objc_storeStrong((id *)&self->_postPaidProduct, 0);
  objc_storeStrong((id *)&self->_selectedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end