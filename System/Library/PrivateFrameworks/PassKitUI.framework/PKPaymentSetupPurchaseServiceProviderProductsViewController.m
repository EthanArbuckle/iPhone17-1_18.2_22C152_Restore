@interface PKPaymentSetupPurchaseServiceProviderProductsViewController
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupPurchaseServiceProviderProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6;
- (PKPaymentSetupPurchaseServiceProviderProductsViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_setHeroCardImage:(id)a3;
- (void)didSelectServiceProviderProduct:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupPurchaseServiceProviderProductsViewController

- (PKPaymentSetupPurchaseServiceProviderProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
  v13 = [(PKPaymentSetupOptionsViewController *)&v25 initWithProvisioningController:a3 context:a4 delegate:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_product, a6);
    objc_storeStrong((id *)&v14->_setupDelegate, a5);
    uint64_t v15 = [(PKPaymentSetupProduct *)v14->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87A88]];
    provisioningMethodMetadata = v14->_provisioningMethodMetadata;
    v14->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v15;

    [(PKDynamicCollectionViewController *)v14 setUseItemIdentityWhenUpdating:1];
    v17 = [(PKPaymentProvisioningMethodMetadata *)v14->_provisioningMethodMetadata digitalIssuanceMetadata];
    v18 = [v17 serviceProviderProducts];

    v19 = [[PKPaymentServiceProviderProductsListSectionController alloc] initWithIdentifier:@"ServiceProviderProducts" serviceProviderProducts:v18];
    listSectionController = v14->_listSectionController;
    v14->_listSectionController = v19;

    [(PKPaymentServiceProviderProductsListSectionController *)v14->_listSectionController setDelegate:v14];
    v26[0] = v14->_listSectionController;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(PKPaymentSetupOptionsViewController *)v14 setSections:v21 animated:0];

    v22 = [(PKPaymentSetupPurchaseServiceProviderProductsViewController *)v14 navigationItem];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v23 configureWithDefaultBackground];
    [v22 setStandardAppearance:v23];
  }
  return v14;
}

- (void)didSelectServiceProviderProduct:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v5 = *MEMORY[0x1E4F86308];
  v12[0] = *MEMORY[0x1E4F86438];
  uint64_t v6 = *MEMORY[0x1E4F86058];
  v11[0] = v5;
  v11[1] = v6;
  id v7 = a3;
  v8 = [v7 identifier];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportEvent:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained purchaseServiceProviderProductsViewController:self didSelectServiceProviderProduct:v7];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewDidLoad];
  v3 = PKLocalizedPaymentString(&cfstr_DciCommutePlan.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  v4 = PKLocalizedPaymentString(&cfstr_DciCommutePlan_0.isa);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PKPaymentSetupPurchaseServiceProviderProductsViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CC4C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPaymentSetupProduct *)product digitalCardCachedImage:v8];
}

void __87__PKPaymentSetupPurchaseServiceProviderProductsViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)_setHeroCardImage:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentSetupOptionsViewController *)self headerView];
  uint64_t v5 = [v4 topArtView];
  if (!v5)
  {
    uint64_t v5 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
    [(PKHeroCardExplanationHeaderView *)v5 setPadding:0];
    [(PKHeroCardExplanationHeaderView *)v5 setSize:0];
    [(PKHeroCardExplanationHeaderView *)v5 setHideBackground:1];
    [(PKHeroCardExplanationHeaderView *)v5 setHideShadow:1];
    [v4 setTopArtView:v5];
  }
  [(PKHeroCardExplanationHeaderView *)v5 setCardImage:v6];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseServiceProviderProductsViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupPurchaseServiceProviderProductsViewControllerFlowDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);

  objc_storeStrong((id *)&self->_setupDelegate, 0);
}

@end