@interface PKPassTransitProductsViewController
- (PKPassTransitProductsViewController)initWithPaymentPass:(id)a3 transitType:(unint64_t)a4;
- (PKPaymentPass)pass;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_actionHandlerForIndexPath:(id)a3;
- (id)_allocView;
- (id)_renewActionForCommutePlanIdentifier:(id)a3;
- (id)_topUpActionForIndexPath:(id)a3 balanceIdentifiers:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 inTableView:(id)a4 forIndexPath:(id)a5;
- (void)_configureView:(id)a3 indexPath:(id)a4 animated:(BOOL)a5;
- (void)_handlePassUpdate:(id)a3;
- (void)_reloadBalance;
- (void)_reloadContent;
- (void)_setupBalances;
- (void)_setupPlans;
- (void)accessibleLayoutForView:(id)a3 changedFrom:(int64_t)a4 to:(int64_t)a5;
- (void)dealloc;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setPass:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPassTransitProductsViewController

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKPaymentPass *)self->_pass uniqueID];
  id v9 = v6;
  id v10 = v8;
  if (v10 == v9)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_9;
    }
    int v12 = [v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_9;
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v13[3] = &unk_1E59CA870;
  v13[4] = self;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

LABEL_9:
}

void __95__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1088) setDynamicBalances:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  id v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __92__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1088) updateWithDynamicCommutePlans:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F87558] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPassTransitProductsViewController;
  [(PKSectionTableViewController *)&v4 dealloc];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  id v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __106__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __106__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1088) setTransitProperties:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)_reloadBalance
{
  v3 = [(PKPaymentPass *)self->_pass uniqueID];
  objc_super v4 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__43;
  v31[4] = __Block_byref_object_dispose__43;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__43;
  v29[4] = __Block_byref_object_dispose__43;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__43;
  v27[4] = __Block_byref_object_dispose__43;
  id v28 = 0;
  v5 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  dispatch_group_enter(v4);
  paymentDataProvider = self->_paymentDataProvider;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke;
  v22[3] = &unk_1E59D17F0;
  v26 = v31;
  id v7 = v5;
  id v23 = v7;
  v24 = self;
  id v8 = v4;
  v25 = v8;
  [(PKPaymentDataProvider *)paymentDataProvider transitStateWithPassUniqueIdentifier:v3 paymentApplication:v7 completion:v22];
  dispatch_group_enter(v8);
  id v9 = self->_paymentDataProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_2;
  v19[3] = &unk_1E59D1818;
  v21 = v29;
  int v10 = v8;
  v20 = v10;
  [(PKPaymentDataProvider *)v9 balancesForPaymentPassWithUniqueIdentifier:v3 completion:v19];
  dispatch_group_enter(v10);
  v11 = self->_paymentDataProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_3;
  v16[3] = &unk_1E59CC5A8;
  v18 = v27;
  id v12 = v10;
  v17 = v12;
  [(PKPaymentDataProvider *)v11 plansForPaymentPassWithUniqueIdentifier:v3 completion:v16];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_4;
  block[3] = &unk_1E59DA240;
  objc_copyWeak(&v14, &location);
  block[4] = v31;
  block[5] = v29;
  block[6] = v27;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:*(void *)(a1[5] + 1144)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = a1[6];

  dispatch_group_leave(v6);
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[136] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    [v3[136] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v3[136] updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v3 _reloadContent];
    WeakRetained = v3;
  }
}

- (void)_handlePassUpdate:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPassTransitProductsViewController__handlePassUpdate___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__PKPassTransitProductsViewController__handlePassUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1136) library];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1144) passTypeIdentifier];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1144) serialNumber];
  v5 = [v2 passWithPassTypeIdentifier:v3 serialNumber:v4];
  id v6 = [v5 paymentPass];

  [*(id *)(a1 + 32) setPass:v6];
}

- (PKPassTransitProductsViewController)initWithPaymentPass:(id)a3 transitType:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassTransitProductsViewController;
  id v7 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  id v8 = v7;
  if (v7)
  {
    [(PKPassTransitProductsViewController *)v7 setPass:v6];
    v8->_transitType = a4;
    id v9 = [PKAdjustableSingleCellView alloc];
    uint64_t v10 = -[PKAdjustableSingleCellView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleSingleCellView = v8->_sampleSingleCellView;
    v8->_sampleSingleCellView = (PKAdjustableSingleCellView *)v10;

    id v12 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentDataProvider = v8->_paymentDataProvider;
    v8->_paymentDataProvider = v12;

    [(PKPaymentDataProvider *)v8->_paymentDataProvider addDelegate:v8];
    if (([(PKPaymentPass *)v8->_pass isRemotePass] & 1) == 0)
    {
      id v14 = [(PKPaymentPass *)v8->_pass dataAccessor];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v8->_remoteDataAccessor, v14);
        v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v16 = *MEMORY[0x1E4F87558];
        v17 = [(PKRemoteDataAccessor *)v8->_remoteDataAccessor library];
        [v15 addObserver:v8 selector:sel__handlePassUpdate_ name:v16 object:v17];
      }
    }
    v18 = [(PKPassTransitProductsViewController *)v8 navigationItem];
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v8;
}

- (void)setPass:(id)a3
{
  id v6 = (PKPaymentPass *)a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    self->_pass = v6;
    id v4 = (PKTransitBalanceModel *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v6];
    balanceModel = self->_balanceModel;
    self->_balanceModel = v4;

    [(PKPassTransitProductsViewController *)self _setupPlans];
    [(PKPassTransitProductsViewController *)self _setupBalances];
    [(PKPassTransitProductsViewController *)self _reloadBalance];
  }
}

- (void)_setupPlans
{
  self->_hasCommutePlans = [(PKTransitBalanceModel *)self->_balanceModel hasCommutePlanContent];
}

- (void)_setupBalances
{
  if ([(PKTransitBalanceModel *)self->_balanceModel hasBalanceContent])
  {
    id v3 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    [v3 state];
    self->_hasBalance = PKPaymentApplicationStateIsPersonalized() != 0;
  }
  else
  {
    self->_hasBalance = 0;
  }
}

- (void)_reloadContent
{
  self->_accessibleLayout = 0;
  id v2 = [(PKPassTransitProductsViewController *)self tableView];
  [v2 reloadData];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassTransitProductsViewController;
  [(PKSectionTableViewController *)&v4 viewDidLoad];
  id v3 = [(PKPassTransitProductsViewController *)self tableView];
  [v3 setAllowsSelection:0];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"TransitPassProductAdjustableView"];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"TransitPassHeaderIdentifier"];
  [(PKPassTransitProductsViewController *)self _reloadBalance];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTransitProductsViewController;
  [(PKPassTransitProductsViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKPassTransitProductsViewController *)self tableView];
  objc_super v4 = [(PKPassTransitProductsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTransitProductsViewController;
  [(PKPassTransitProductsViewController *)&v15 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKPassTransitProductsViewController *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [v4 preferredContentSizeCategory];
      id v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        uint64_t v10 = [v4 preferredContentSizeCategory];
        v11 = (void *)*MEMORY[0x1E4FB27F0];

        if (v10 != v11)
        {
          id v12 = [PKAdjustableSingleCellView alloc];
          v13 = -[PKAdjustableSingleCellView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          sampleSingleCellView = self->_sampleSingleCellView;
          self->_sampleSingleCellView = v13;

          [(PKPassTransitProductsViewController *)self _reloadContent];
        }
      }
    }
  }
}

- (id)_renewActionForCommutePlanIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKTransitBalanceModel *)self->_balanceModel displayableCommutePlanActions];
  id v6 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_169);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke_2;
  v10[3] = &unk_1E59D34F0;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "pk_firstObjectPassingTest:", v10);

  return v8;
}

BOOL __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 2
    && [v2 isActionAvailable]
    && ([v2 unavailableActionBehavior] & 1) == 0;

  return v3;
}

BOOL __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 associatedPlanIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if (v5 && v6) {
      BOOL v8 = [v5 caseInsensitiveCompare:v6] == 0;
    }
  }

  return v8;
}

- (id)_topUpActionForIndexPath:(id)a3 balanceIdentifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(PKPaymentPass *)self->_pass availableActions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v17 = *MEMORY[0x1E4F87980];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 type] == 1 && objc_msgSend(v5, "containsObject:", v17)) {
          goto LABEL_19;
        }
        if ([v11 featured])
        {
          id v12 = [v11 associatedEnteredValueIdentifier];

          if (!v12) {
            goto LABEL_19;
          }
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke;
        v19[3] = &unk_1E59CCAF0;
        void v19[4] = v11;
        if ((objc_msgSend(v5, "pk_hasObjectPassingTest:", v19) & 1) != 0
          || (v18[0] = MEMORY[0x1E4F143A8],
              v18[1] = 3221225472,
              v18[2] = __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke_2,
              v18[3] = &unk_1E59CCAF0,
              v18[4] = v11,
              objc_msgSend(v5, "pk_hasObjectPassingTest:", v18)))
        {
LABEL_19:
          id v15 = v11;
          goto LABEL_21;
        }
        if ([v11 type] == 1)
        {
          v13 = [v11 relevantPropertyIdentifier];
          if (v13)
          {
          }
          else
          {
            id v14 = [v11 associatedEnteredValueIdentifier];

            if (!v14) {
              goto LABEL_19;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v15 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_21:

  return v15;
}

BOOL __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) relevantPropertyIdentifier];
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    if (v5 && v4) {
      BOOL v7 = [v4 caseInsensitiveCompare:v5] == 0;
    }
  }

  return v7;
}

BOOL __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) associatedEnteredValueIdentifier];
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    if (v5 && v4) {
      BOOL v7 = [v4 caseInsensitiveCompare:v5] == 0;
    }
  }

  return v7;
}

- (id)_allocView
{
  id v2 = [PKAdjustableSingleCellView alloc];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  return -[PKAdjustableSingleCellView initWithFrame:](v2, "initWithFrame:", v3, v4, v5, v6);
}

- (id)_actionHandlerForIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __66__PKPassTransitProductsViewController__actionHandlerForIndexPath___block_invoke;
  id v11 = &unk_1E59D3538;
  objc_copyWeak(&v12, &location);
  double v5 = _Block_copy(&v8);
  double v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __66__PKPassTransitProductsViewController__actionHandlerForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = [v5 pass];
    id v14 = 0;
    uint64_t v15 = 0;
    char v9 = [v8 canPerformAction:v6 unableReason:&v15 displayableError:&v14];
    id v10 = v14;
    if ((v9 & 1) != 0 || v15 == 2)
    {
      id v11 = [[PKPerformActionViewController alloc] initWithPass:v8 action:v6];
      [(PKPerformActionViewController *)v11 setDelegate:WeakRetained];
      id v12 = [MEMORY[0x1E4F84D50] sharedService];
      [(PKPerformActionViewController *)v11 setWebService:v12];

      v13 = [[PKNavigationController alloc] initWithRootViewController:v11];
      [(PKNavigationController *)v13 setSupportedInterfaceOrientations:2];
      [WeakRetained presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      id v11 = +[PKPerformActionViewController alertControllerForUnableReason:v15 action:v6 displayableError:v10 addCardActionHandler:0];
      [WeakRetained presentViewController:v11 animated:1 completion:0];
    }
  }
}

- (void)_configureView:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v55 = a5;
  id v7 = a3;
  id v8 = a4;
  char v9 = [(PKTransitBalanceModel *)self->_balanceModel displayableCommutePlans];
  id v10 = [(PKTransitBalanceModel *)self->_balanceModel displayableBalances];
  unint64_t transitType = self->_transitType;
  id v12 = self->_pass;
  uint64_t v13 = [v8 row];
  if (transitType >= 3)
  {
    if (transitType != 3) {
      goto LABEL_35;
    }
    id v22 = v7;
    long long v23 = [v9 objectAtIndexedSubscript:v13];
    [v22 beginUpdates];
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v52 = v51 = v23;
    if (!v23)
    {
      v33 = 0;
      v34 = 0;
      v35 = &stru_1EF1B5B50;
LABEL_34:
      [v22 setTitle:v34];
      [v22 setDetail:v33];
      [v22 setSubDetail:v35];
      [v22 setPass:v12];
      [v22 setEnableDisclosure:0];
      [v22 setSubDetailColor:v52];
      [v22 endUpdates:v55];

      goto LABEL_35;
    }
    v54 = v9;
    v24 = [v23 title];
    v44 = [v24 label];
    v50 = v24;
    uint64_t v25 = [v24 value];
    char v26 = [v23 properties];
    if ((v26 & 3) == 1)
    {
      v48 = [v23 formattedDateString];
      v27 = v23;
      if (![v23 hasExpiredPlanDate]) {
        goto LABEL_25;
      }
      uint64_t v28 = [MEMORY[0x1E4FB1618] systemRedColor];
      v29 = v52;
      v52 = (void *)v28;
    }
    else
    {
      if ((v26 & 4) == 0)
      {
        v48 = &stru_1EF1B5B50;
        v27 = v23;
        goto LABEL_25;
      }
      v46 = [v23 passFieldForKey:*MEMORY[0x1E4F87F20]];
      if ((unint64_t)([v46 foreignReferenceType] - 1) > 1)
      {
        v48 = &stru_1EF1B5B50;
      }
      else
      {
        balanceModel = self->_balanceModel;
        v49 = [v46 foreignReferenceIdentifiers];
        v37 = [(PKTransitBalanceModel *)balanceModel balanceForIdentifiers:v49];

        uint64_t v43 = [v37 formattedValue];

        v48 = &stru_1EF1B5B50;
        uint64_t v25 = (void *)v43;
      }
      v27 = v23;
      v29 = v46;
    }

LABEL_25:
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    id v47 = v44;

    id v45 = v25;
    v38 = [v27 identifier];
    v39 = [(PKPassTransitProductsViewController *)self _renewActionForCommutePlanIdentifier:v38];

    uint64_t v40 = [(PKPassTransitProductsViewController *)self _actionHandlerForIndexPath:v8];
    v41 = (void *)v40;
    if (v39 && v40 && [v39 isActionAvailable])
    {
      BOOL v42 = [(PKPaymentPass *)v12 isSuicaPass]
         && [v39 type] == 2
         && [(PKPaymentPass *)self->_pass transitCommutePlanType] == 1;
      [v39 setReverseButtonTitleForLegacySuica:v42];
      [v22 setAction:v39];
      [v22 setActionHandler:v41];
    }

    char v9 = v54;
    v34 = v47;
    v35 = v48;
    v33 = v45;
    goto LABEL_34;
  }
  v53 = v9;
  id v14 = v7;
  [v14 beginUpdates];
  uint64_t v15 = [v10 objectAtIndexedSubscript:v13];
  uint64_t v16 = [v15 identifiers];
  uint64_t v17 = [(PKPassTransitProductsViewController *)self _topUpActionForIndexPath:v8 balanceIdentifiers:v16];

  uint64_t v18 = [(PKPassTransitProductsViewController *)self _actionHandlerForIndexPath:v8];
  v19 = (void *)v18;
  if (v17) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20 && [v17 isActionAvailable])
  {
    [v14 setAction:v17];
    [v14 setActionHandler:v19];
  }
  [v14 setEnableDisclosure:0];
  long long v21 = [v15 localizedTitle];
  if (v21)
  {
    [v14 setTitle:v21];
  }
  else
  {
    id v30 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
    [v14 setTitle:v30];
  }
  v31 = [v15 formattedValue];
  [v14 setDetail:v31];

  [v14 setSubDetail:&stru_1EF1B5B50];
  id v32 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v14 setSubDetailColor:v32];

  [v14 setPass:v12];
  [v14 endUpdates:v55];

  char v9 = v53;
LABEL_35:
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPassTransitProductsViewController *)self view];
  [v3 setNeedsLayout];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t transitType = self->_transitType;
  balanceModel = self->_balanceModel;
  if (transitType == 3) {
    [(PKTransitBalanceModel *)balanceModel displayableCommutePlans];
  }
  else {
  id v6 = [(PKTransitBalanceModel *)balanceModel displayableBalances];
  }
  int64_t v7 = [v6 count];

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 48.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  int64_t v7 = self->_sampleSingleCellView;
  id v8 = a3;
  [(PKPassTransitProductsViewController *)self _configureView:v7 indexPath:a4 animated:0];
  [v8 layoutMargins];
  double v10 = v9;
  double v12 = v11;
  [v8 bounds];
  double v14 = v13;

  -[PKAdjustableSingleCellView sizeThatFits:](v7, "sizeThatFits:", v14 - v10 - v12, 1.79769313e308);
  double v16 = v15;

  return v16;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(PKPassTransitProductsViewController *)self tableView];
  id v6 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"TransitPassHeaderIdentifier"];

  unint64_t transitType = self->_transitType;
  if (transitType)
  {
    if (transitType != 3) {
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    uint64_t v8 = PKPassLocalizedStringWithFormat();
  }
  else
  {
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_BalancesProduc.isa);
  }
  double v9 = (void *)v8;
  objc_msgSend(v6, "setHeaderLabelText:", v8, v11);

LABEL_6:

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"TransitPassProductAdjustableView" forIndexPath:v6];
  [(PKPassTransitProductsViewController *)self _configureCell:v8 inTableView:v7 forIndexPath:v6];

  return v8;
}

- (void)_configureCell:(id)a3 inTableView:(id)a4 forIndexPath:(id)a5
{
  id v9 = a5;
  id v7 = a3;
  id v8 = [v7 hostedContentView];
  if (!v8) {
    id v8 = [(PKPassTransitProductsViewController *)self _allocView];
  }
  [(PKPassTransitProductsViewController *)self _configureView:v8 indexPath:v9 animated:0];
  [v7 setHostedContentView:v8];
}

- (void)accessibleLayoutForView:(id)a3 changedFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  if (a5 == 2 && self->_accessibleLayout != 2)
  {
    self->_accessibleLayout = 2;
    id v9 = v7;
    id v8 = [(PKPassTransitProductsViewController *)self tableView];
    [v8 reloadData];

    id v7 = v9;
  }
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDataAccessor, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellView, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);

  objc_storeStrong((id *)&self->_balanceModel, 0);
}

@end