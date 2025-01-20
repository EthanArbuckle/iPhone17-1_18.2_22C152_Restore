@interface PKPaymentSetupProductsViewController
- (BOOL)didSelectManualEntryWithCompletion:(id)a3;
- (BOOL)didSelectProduct:(id)a3 completion:(id)a4;
- (PKPaymentSetupProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 category:(id)a6 paymentSetupProducts:(id)a7;
- (PKPaymentSetupProductsViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (unint64_t)paymentSetupMarker;
- (void)_didSelectAddADifferentCard;
- (void)_didSelectAddADifferentCardWithCompletion:(id)a3;
- (void)dealloc;
- (void)displayNoResultsViewWithSubtitle:(id)a3 needsManualEntryButton:(BOOL)a4;
- (void)hideNoResultsView;
- (void)provisioningControllerUpdatedProducts:(id)a3;
- (void)reloadSectionsRequired;
- (void)searchBarCancelButtonClicked;
- (void)searchTextDidChangeTo:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupProductsViewController

- (PKPaymentSetupProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 category:(id)a6 paymentSetupProducts:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupProductsViewController;
  v15 = [(PKPaymentSetupOptionsViewController *)&v18 initWithProvisioningController:v12 context:a4 delegate:a5];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_category, a6);
    objc_storeStrong((id *)&v16->_paymentSetupProducts, a7);
    [v12 addDelegate:v16];
    [(PKDynamicCollectionViewController *)v16 setUseItemIdentityWhenUpdating:1];
  }

  return v16;
}

- (void)dealloc
{
  v3 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProductsViewController;
  [(PKPaymentSetupProductsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupProductsViewController;
  [(PKPaymentSetupOptionsViewController *)&v12 viewDidLoad];
  [(PKDynamicCollectionViewController *)self setRetainCellSelectionCellOnReload:1];
  v3 = [(PKPaymentSetupProductCategory *)self->_category localizedTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  category = self->_category;
  [(PKPaymentSetupOptionsViewController *)self context];
  v5 = [(PKPaymentSetupProductCategory *)category localizedSubtitleWithIsBridge:PKPaymentSetupContextIsBridge()];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v5];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:[(NSArray *)self->_paymentSetupProducts count] > 6];
  v6 = [(PKPaymentSetupProductCategory *)self->_category localizedSearchBarDefaultText];
  [(PKPaymentSetupOptionsViewController *)self setSearchBarDefaultText:v6];

  v7 = [PKPaymentSetupProductsSectionController alloc];
  v8 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  v9 = [(PKPaymentSetupProductsSectionController *)v7 initWithProvisoningController:v8];
  primaryProductSectionController = self->_primaryProductSectionController;
  self->_primaryProductSectionController = v9;

  [(PKPaymentSetupProductsSectionController *)self->_primaryProductSectionController setDelegate:self];
  [(PKPaymentSetupProductsSectionController *)self->_primaryProductSectionController updateWithPaymentSetupProducts:self->_paymentSetupProducts];
  v13[0] = self->_primaryProductSectionController;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v11 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupProductsViewController;
  [(PKPaymentSetupOptionsViewController *)&v6 viewDidAppear:a3];
  reporter = self->_reporter;
  v5 = [(PKPaymentSetupProductCategory *)self->_category identifier];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter setProductType:v5 subtype:0];

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProductsViewController;
  [(PKPaymentSetupProductsViewController *)&v4 viewDidDisappear:a3];
  if ([(PKPaymentSetupProductsViewController *)self isMovingFromParentViewController])[(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter resetProductTypes]; {
}
  }

- (void)provisioningControllerUpdatedProducts:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  v5 = [v4 paymentSetupProductModel];
  objc_super v6 = [(NSArray *)self->_paymentSetupProducts valueForKey:@"productIdentifier"];
  v7 = [v5 productsForProductIdentifiers:v6];
  paymentSetupProducts = self->_paymentSetupProducts;
  self->_paymentSetupProducts = v7;

  [(PKPaymentSetupProductsSectionController *)self->_primaryProductSectionController updateWithPaymentSetupProducts:self->_paymentSetupProducts];
  v10[0] = self->_primaryProductSectionController;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v9 animated:1];
}

- (void)searchTextDidChangeTo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupProductsViewController;
  id v4 = a3;
  [(PKPaymentSetupOptionsViewController *)&v5 searchTextDidChangeTo:v4];
  -[PKPaymentSetupProductsSectionController applySearchString:](self->_primaryProductSectionController, "applySearchString:", v4, v5.receiver, v5.super_class);
}

- (void)searchBarCancelButtonClicked
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupProductsViewController;
  [(PKPaymentSetupOptionsViewController *)&v3 searchBarCancelButtonClicked];
  [(PKPaymentSetupProductsSectionController *)self->_primaryProductSectionController applySearchString:0];
}

- (void)displayNoResultsViewWithSubtitle:(id)a3 needsManualEntryButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PKPaymentSetupOptionsViewController *)self setShowNoResultsView:1 animated:1];
  [(PKPaymentSetupOptionsViewController *)self setNoResultsSubtitle:v6];

  if (v4)
  {
    PKLocalizedPaymentString(&cfstr_AddANewCard.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPaymentSetupOptionsViewController *)self setNoResultsActionButtonTitle:v7 target:self action:sel__didSelectAddADifferentCard];
  }
}

- (void)hideNoResultsView
{
}

- (BOOL)didSelectProduct:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  p_currentlyLoadingProduct = &self->_currentlyLoadingProduct;
  currentlyLoadingProduct = self->_currentlyLoadingProduct;
  if (currentlyLoadingProduct)
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = [(PKPaymentSetupProduct *)currentlyLoadingProduct productIdentifier];
      id v13 = [v7 productIdentifier];
      int v17 = 138412546;
      objc_super v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Already loading product for: %@ cannot select: %@", (uint8_t *)&v17, 0x16u);
    }
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_currentlyLoadingProduct, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained productsViewController:self didSelectProduct:v7];

    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter setSetupProduct:v7];
    v15 = *p_currentlyLoadingProduct;
    *p_currentlyLoadingProduct = 0;

    if (v8) {
      v8[2](v8, 1);
    }
  }

  return currentlyLoadingProduct == 0;
}

- (BOOL)didSelectManualEntryWithCompletion:(id)a3
{
  return 1;
}

- (void)reloadSectionsRequired
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_primaryProductSectionController;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:1];
}

- (void)_didSelectAddADifferentCard
{
}

- (void)_didSelectAddADifferentCardWithCompletion:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained productsViewControllerDidSelectManualEntry:self];

  objc_super v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    objc_super v5 = v6;
  }
}

- (unint64_t)paymentSetupMarker
{
  return 1;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PKDynamicCollectionViewController *)self collectionView];
  [v7 setUserInteractionEnabled:!v5];

  if (!v5)
  {
    primaryProductSectionController = self->_primaryProductSectionController;
    [(PKPaymentSetupProductsSectionController *)primaryProductSectionController hideLoadingIndicatorsAnimated:v4];
  }
}

- (PKPaymentSetupProductsViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupProductsViewControllerFlowDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_currentlyLoadingProduct, 0);
  objc_storeStrong((id *)&self->_primaryProductSectionController, 0);
  objc_storeStrong((id *)&self->_paymentSetupProducts, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end