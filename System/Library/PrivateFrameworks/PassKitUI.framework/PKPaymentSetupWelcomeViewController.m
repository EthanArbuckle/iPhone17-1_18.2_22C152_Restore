@interface PKPaymentSetupWelcomeViewController
- (BOOL)_didSelectItemWithIdentifier:(id)a3 title:(id)a4 category:(id)a5 productIdentifiers:(id)a6 completion:(id)a7;
- (BOOL)didSelectAppExtensionWithIdentifier:(id)a3 title:(id)a4 completion:(id)a5;
- (BOOL)didSelectCategory:(id)a3 completion:(id)a4;
- (BOOL)didSelectYourCardsWithCompletion:(id)a3;
- (PKPaymentSetupWelcomeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (PKPaymentSetupWelcomeViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_updateFilteredPaymentSetupProductModelForRequirements:(unint64_t)a3 provisoningController:(id)a4 forceReload:(BOOL)a5;
- (void)_updateHeaderContentsWithProvisoningController:(id)a3;
- (void)dealloc;
- (void)didTapFooterLink:(id)a3;
- (void)preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)provisioningControllerUpdatedAccounts:(id)a3;
- (void)provisioningControllerUpdatedProducts:(id)a3;
- (void)reloadSectionsForRequirements:(unint64_t)a3 animated:(BOOL)a4 forceReload:(BOOL)a5;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentSetupWelcomeViewController

- (PKPaymentSetupWelcomeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupWelcomeViewController;
  v5 = [(PKPaymentSetupOptionsViewController *)&v11 initWithProvisioningController:a3 context:a4 delegate:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PKPaymentSetupCategoriesSectionController);
    categoriesSectionController = v5->_categoriesSectionController;
    v5->_categoriesSectionController = v6;

    [(PKPaymentSetupCategoriesSectionController *)v5->_categoriesSectionController setDelegate:v5];
    v8 = objc_alloc_init(PKPaymentSetupAppExtensionsSectionController);
    appExtensionSectionController = v5->_appExtensionSectionController;
    v5->_appExtensionSectionController = v8;

    [(PKPaymentSetupAppExtensionsSectionController *)v5->_appExtensionSectionController setDelegate:v5];
    [(PKDynamicCollectionViewController *)v5 setUseItemIdentityWhenUpdating:1];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupWelcomeViewController;
  [(PKPaymentSetupWelcomeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupWelcomeViewController;
  [(PKPaymentSetupOptionsViewController *)&v18 viewDidLoad];
  [(PKDynamicCollectionViewController *)self setRetainCellSelectionCellOnReload:1];
  v3 = PKCurrentRegion();
  int v4 = [v3 isEqualToString:@"CN"];

  if (v4)
  {
    v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
    v6 = objc_alloc_init(PKMultiHyperlinkView);
    v7 = PKLocalizedPaymentString(&cfstr_WelcomePrivacy.isa);
    v8 = PKLocalizedPaymentString(&cfstr_WelcomePrivacy_0.isa);
    v9 = PKStringWithValidatedFormat();
    -[PKMultiHyperlinkView setText:](v6, "setText:", v9, v8);
    [(PKMultiHyperlinkView *)v6 setTextAlignment:1];
    objc_initWeak(&location, self);
    v10 = [PKTextRangeHyperlink alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PKPaymentSetupWelcomeViewController_viewDidLoad__block_invoke;
    v15[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v16, &location);
    objc_super v11 = [(PKTextRangeHyperlink *)v10 initWithLinkText:v8 action:v15];
    v19[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(PKMultiHyperlinkView *)v6 setSources:v12];

    [v5 setAdditionalLinkView:v6];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v13 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  [v13 addDelegate:self];
  [(PKPaymentSetupWelcomeViewController *)self _updateHeaderContentsWithProvisoningController:v13];
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", [v13 preflightRequirements], 0, 0);
  v14 = [(PKPaymentSetupWelcomeViewController *)self view];
  [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F857E8]];
}

void __50__PKPaymentSetupWelcomeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F87090]];
    [WeakRetained didTapFooterLink:v1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupWelcomeViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  v5 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", [v5 preflightRequirements], v3, 0);

  [(PKPaymentSetupWelcomeViewController *)self preflightWithCompletion:0];
}

- (void)reloadSectionsForRequirements:(unint64_t)a3 animated:(BOOL)a4 forceReload:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
  [(PKPaymentSetupWelcomeViewController *)self _updateFilteredPaymentSetupProductModelForRequirements:a3 provisoningController:v9 forceReload:v5];
  if ([(PKPaymentSetupCategoriesSectionController *)self->_categoriesSectionController updateWithRequirements:a3 provisioningController:v9 paymentSetupProductModel:self->_filteredPaymentSetupProductModel forceProductConfiguration:v5])
  {
    [v10 addObject:self->_categoriesSectionController];
  }
  if ([(PKPaymentSetupAppExtensionsSectionController *)self->_appExtensionSectionController updateWithRequirements:a3 paymentSetupProductModel:self->_filteredPaymentSetupProductModel])
  {
    [v10 addObject:self->_appExtensionSectionController];
  }
  [(PKPaymentSetupWelcomeViewController *)self _updateHeaderContentsWithProvisoningController:v9];
  [(PKPaymentSetupOptionsViewController *)self setSections:v10 animated:v6];
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:(a3 & 0xA) == 0];
}

- (void)_updateFilteredPaymentSetupProductModelForRequirements:(unint64_t)a3 provisoningController:(id)a4 forceReload:(BOOL)a5
{
  id v16 = a4;
  if (a5 || PKPaymentPreflightRequirementsImpactProducts())
  {
    self->_currentConfiguredRequirements = a3;
    v8 = PKCurrentMobileCarrierRegion();
    v9 = [v16 webService];
    id v10 = [v9 targetDevice];
    objc_super v11 = [v10 deviceRegion];

    v12 = [v16 paymentSetupProductModel];
    v13 = [v16 localCredentials];
    objc_msgSend(v12, "filteredPaymentSetupProductModelWithLocalCredentials:setupContext:webService:mobileCarrierRegion:deviceRegion:", v13, -[PKPaymentSetupOptionsViewController context](self, "context"), v9, v8, v11);
    v14 = (PKPaymentSetupProductModel *)objc_claimAutoreleasedReturnValue();
    filteredPaymentSetupProductModel = self->_filteredPaymentSetupProductModel;
    self->_filteredPaymentSetupProductModel = v14;
  }
}

- (void)_updateHeaderContentsWithProvisoningController:(id)a3
{
  id v8 = [a3 paymentSetupProductModel];
  int v4 = [v8 localizedTitle];
  BOOL v5 = [v8 localizedSubtitle];
  if (v4)
  {
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];
    if (v5)
    {
LABEL_3:
      [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v5];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v6 = PKLocalizedPaymentString(&cfstr_PaymentSetupTi.isa);
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];

    if (v5) {
      goto LABEL_3;
    }
  }
  v7 = PKLocalizedPaymentString(&cfstr_PaymentSetupSu.isa);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v7];

LABEL_6:
}

- (void)preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!self->_isDisplayingError)
  {
    if (v6)
    {
      self->_isDisplayingError = 1;
      [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:0];
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKPaymentSetupWelcomeViewController_preflightRequirementsUpdated_displayableError___block_invoke;
      v9[3] = &unk_1E59CB010;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, v9, 0);
      [(PKPaymentSetupWelcomeViewController *)self presentViewController:v8 animated:1 completion:0];
      [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportError:v7 context:0];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PKPaymentSetupWelcomeViewController *)self reloadSectionsForRequirements:a3 animated:1 forceReload:0];
    }
  }
}

void __85__PKPaymentSetupWelcomeViewController_preflightRequirementsUpdated_displayableError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(WeakRetained + 166);

  if (v2)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 166);
    [v3 welcomeViewControllerDidTerminate:*(void *)(a1 + 32)];
  }
  else
  {
    int v4 = [WeakRetained delegate];

    if (v4)
    {
      BOOL v5 = [WeakRetained delegate];
      [v5 viewControllerDidTerminateSetupFlow:WeakRetained];
    }
    else
    {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)provisioningControllerUpdatedProducts:(id)a3
{
  uint64_t v4 = [a3 preflightRequirements];

  [(PKPaymentSetupWelcomeViewController *)self reloadSectionsForRequirements:v4 animated:0 forceReload:1];
}

- (void)provisioningControllerUpdatedAccounts:(id)a3
{
  uint64_t v4 = [a3 preflightRequirements];

  [(PKPaymentSetupWelcomeViewController *)self reloadSectionsForRequirements:v4 animated:1 forceReload:1];
}

- (BOOL)didSelectAppExtensionWithIdentifier:(id)a3 title:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = (void (**)(id, void))a5;
  if (self->_loadingIdentifier)
  {
    if (v11) {
      v11[2](v11, 0);
    }
    BOOL v12 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_loadingIdentifier, a3);
    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__PKPaymentSetupWelcomeViewController_didSelectAppExtensionWithIdentifier_title_completion___block_invoke;
    v15[3] = &unk_1E59CA820;
    void v15[4] = self;
    id v16 = v11;
    BOOL v12 = [(PKPaymentSetupWelcomeViewController *)self _didSelectItemWithIdentifier:0 title:v10 category:0 productIdentifiers:v13 completion:v15];
  }
  return v12;
}

uint64_t __92__PKPaymentSetupWelcomeViewController_didSelectAppExtensionWithIdentifier_title_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 deselectCells];
}

- (BOOL)didSelectYourCardsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void (**)(void, void))v4;
  p_loadingIdentifier = &self->_loadingIdentifier;
  loadingIdentifier = self->_loadingIdentifier;
  if (!loadingIdentifier)
  {
    objc_storeStrong((id *)&self->_loadingIdentifier, (id)*MEMORY[0x1E4F87BE0]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained welcomeViewControllerDidSelectCardsOnFile:self];

    id v10 = *p_loadingIdentifier;
    *p_loadingIdentifier = 0;

    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4) {
LABEL_3:
  }
    ((void (**)(void, BOOL))v5)[2](v5, loadingIdentifier == 0);
LABEL_4:

  return loadingIdentifier == 0;
}

- (BOOL)didSelectCategory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_loadingIdentifier)
  {
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    BOOL v9 = 0;
  }
  else
  {
    id v10 = [v6 identifier];
    loadingIdentifier = self->_loadingIdentifier;
    self->_loadingIdentifier = v10;

    BOOL v12 = [v6 identifier];
    v13 = [v6 localizedDisplayName];
    v14 = [v6 productIdentifiers];
    BOOL v9 = [(PKPaymentSetupWelcomeViewController *)self _didSelectItemWithIdentifier:v12 title:v13 category:v6 productIdentifiers:v14 completion:v8];
  }
  return v9;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_didPreflight)
  {
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    self->_didPreflight = 1;
    id v6 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PKPaymentSetupWelcomeViewController_preflightWithCompletion___block_invoke;
    v7[3] = &unk_1E59CE160;
    id v8 = v5;
    [v6 preflightWithCompletion:v7];
  }
}

uint64_t __63__PKPaymentSetupWelcomeViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_didSelectItemWithIdentifier:(id)a3 title:(id)a4 category:(id)a5 productIdentifiers:(id)a6 completion:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  v13 = (void (**)(id, void))a7;
  v14 = [(PKPaymentSetupProductModel *)self->_filteredPaymentSetupProductModel availableProductsForProductIdentifiers:a6];
  if ([v14 count])
  {
    if (v13) {
      v13[2](v13, 0);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained welcomeViewController:self didSelectCategory:v12 products:v14];
  }
  else
  {
    if (([v11 isEqualToString:*MEMORY[0x1E4F87BC0]] & 1) == 0)
    {
      id v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error: Category:%@ should have products - using default flow", (uint8_t *)&v18, 0xCu);
      }
    }
    if (v13) {
      v13[2](v13, 1);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained welcomeViewControllerDidSelectManualEntry:self];
  }

  return 1;
}

- (void)didTapFooterLink:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v4];
    [v5 setModalPresentationStyle:2];
    [(PKPaymentSetupWelcomeViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    BOOL v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      BOOL v9 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Error: Could not open url in: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PKDynamicCollectionViewController *)self collectionView];
  [v7 setUserInteractionEnabled:!v5];

  loadingIdentifier = self->_loadingIdentifier;
  if (loadingIdentifier && !v5)
  {
    self->_loadingIdentifier = 0;

    [(PKPaymentSetupCategoriesSectionController *)self->_categoriesSectionController hideLoadingIndicatorsAnimated:v4];
    appExtensionSectionController = self->_appExtensionSectionController;
    [(PKPaymentSetupAppExtensionsSectionController *)appExtensionSectionController hideLoadingIndicatorsAnimated:v4];
  }
}

- (PKPaymentSetupWelcomeViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupWelcomeViewControllerFlowDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_filteredPaymentSetupProductModel, 0);
  objc_storeStrong((id *)&self->_loadingIdentifier, 0);
  objc_storeStrong((id *)&self->_appExtensionSectionController, 0);

  objc_storeStrong((id *)&self->_categoriesSectionController, 0);
}

@end