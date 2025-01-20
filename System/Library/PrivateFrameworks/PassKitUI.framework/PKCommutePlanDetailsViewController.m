@interface PKCommutePlanDetailsViewController
- (BOOL)_shouldShowRenewAction;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKCommutePlanDetailsViewController)initWithCommutePlan:(id)a3 associatedAction:(id)a4 forPass:(id)a5 paymentDataProvider:(id)a6 webService:(id)a7 style:(int64_t)a8;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_numberOfCommutePlanDetailsRowsEnabled;
- (int64_t)_numberOfCommutePlanDetailsRowsEnabledForRowType:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_commutePlanDetailsRowTypeForRowIndex:(int64_t)a3;
- (void)_fetchRemindersWithCompletion:(id)a3;
- (void)_handleActionSelected;
- (void)_handleReminderIntervalChanged:(int64_t)a3;
- (void)_reloadBalanceWithCompletion:(id)a3;
- (void)_reloadChangedIndexPathsWithOldIndex:(unint64_t)a3 newIndex:(unint64_t)a4 inSection:(unint64_t)a5;
- (void)_resetReminderIntervalsForCountPlans:(id)a3;
- (void)_resetReminderIntervalsForTimedPlans:(id)a3;
- (void)_updateSelectedBalanceReminderWithBalanceReminder:(id)a3;
- (void)_updateSelectedReminderIntervalsIndexWithReminder:(id)a3;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKCommutePlanDetailsViewController

- (PKCommutePlanDetailsViewController)initWithCommutePlan:(id)a3 associatedAction:(id)a4 forPass:(id)a5 paymentDataProvider:(id)a6 webService:(id)a7 style:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v39 = a6;
  id obj = a7;
  id v38 = a7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [v14 title];
  [v17 addObject:v18];

  v19 = [v14 details];
  [v17 addObjectsFromArray:v19];

  v40.receiver = self;
  v40.super_class = (Class)PKCommutePlanDetailsViewController;
  v20 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v40, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    fields = v20->_fields;
    v20->_fields = (NSArray *)v21;

    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    reminderIntervals = v20->_reminderIntervals;
    v20->_reminderIntervals = v23;

    objc_storeStrong((id *)&v20->_pass, a5);
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v16];
    balanceModel = v20->_balanceModel;
    v20->_balanceModel = (PKTransitBalanceModel *)v25;

    objc_storeStrong((id *)&v20->_commutePlan, a3);
    objc_storeStrong((id *)&v20->_action, a4);
    p_paymentDataProvider = (id *)&v20->_paymentDataProvider;
    objc_storeStrong((id *)&v20->_paymentDataProvider, a6);
    if (objc_opt_respondsToSelector()) {
      [*p_paymentDataProvider addDelegate:v20];
    }
    objc_storeStrong((id *)&v20->_webService, obj);
    v20->_style = a8;
    v28 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    timeIntervalFormatter = v20->_timeIntervalFormatter;
    v20->_timeIntervalFormatter = v28;

    [(NSDateComponentsFormatter *)v20->_timeIntervalFormatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v20->_timeIntervalFormatter setMaximumUnitCount:1];
    if (objc_opt_respondsToSelector()) {
      char v30 = objc_opt_respondsToSelector();
    }
    else {
      char v30 = 0;
    }
    v20->_BOOL dataProviderImplementsBalanceReminderAPI = v30 & 1;
    if (objc_opt_respondsToSelector())
    {
      char v31 = objc_opt_respondsToSelector();
      v20->_dataProviderImplementsCommutePlanReminderAPI = v31 & 1;
      if (v31) {
        goto LABEL_12;
      }
    }
    else
    {
      v20->_dataProviderImplementsCommutePlanReminderAPI = 0;
    }
    BOOL dataProviderImplementsBalanceReminderAPI = v20->_dataProviderImplementsBalanceReminderAPI;
    if (!dataProviderImplementsBalanceReminderAPI)
    {
LABEL_13:
      v20->_canShowReminders = dataProviderImplementsBalanceReminderAPI;
      v33 = [(PKCommutePlanDetailsViewController *)v20 navigationItem];
      objc_msgSend(v33, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v33, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
      v34 = PKPassLocalizedStringWithFormat();
      -[PKCommutePlanDetailsViewController setTitle:](v20, "setTitle:", v34, 0);

      goto LABEL_14;
    }
LABEL_12:
    BOOL dataProviderImplementsBalanceReminderAPI = [*p_paymentDataProvider apiVersion] > 1;
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKCommutePlanDetailsViewController;
  [(PKSectionTableViewController *)&v7 viewDidLoad];
  if (self->_style == 2)
  {
    v3 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v3, self);

    v4 = [(PKCommutePlanDetailsViewController *)self tableView];
    v5 = PKBridgeAppearanceGetAppearanceSpecifier();
    v6 = [v5 tintColor];
    [v4 setTintColor:v6];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __94__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setDynamicBalances:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _resetReminderIntervalsForCountPlans:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __91__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) updateWithDynamicCommutePlans:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _resetReminderIntervalsForTimedPlans:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __105__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setTransitProperties:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)_reloadBalanceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentPass *)self->_pass uniqueID];
  id v6 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__39;
  v38[4] = __Block_byref_object_dispose__39;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__39;
  v36[4] = __Block_byref_object_dispose__39;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__39;
  v34[4] = __Block_byref_object_dispose__39;
  id v35 = 0;
  objc_super v7 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  dispatch_group_enter(v6);
  paymentDataProvider = self->_paymentDataProvider;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke;
  v29[3] = &unk_1E59D17F0;
  v33 = v38;
  id v9 = v7;
  id v30 = v9;
  char v31 = self;
  int v10 = v6;
  v32 = v10;
  [(PKPaymentDataProvider *)paymentDataProvider transitStateWithPassUniqueIdentifier:v5 paymentApplication:v9 completion:v29];
  dispatch_group_enter(v10);
  v11 = self->_paymentDataProvider;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_2;
  v26[3] = &unk_1E59D1818;
  v28 = v36;
  id v12 = v10;
  v27 = v12;
  [(PKPaymentDataProvider *)v11 balancesForPaymentPassWithUniqueIdentifier:v5 completion:v26];
  dispatch_group_enter(v12);
  v13 = self->_paymentDataProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_3;
  v23[3] = &unk_1E59CC5A8;
  uint64_t v25 = v34;
  id v14 = v12;
  v24 = v14;
  [(PKPaymentDataProvider *)v13 plansForPaymentPassWithUniqueIdentifier:v5 completion:v23];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_4;
  v16[3] = &unk_1E59D8FE0;
  objc_copyWeak(&v21, &location);
  v19 = v36;
  v20 = v34;
  id v17 = v4;
  v18 = v38;
  id v15 = v4;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:*(void *)(a1[5] + 1104)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = a1[6];

  dispatch_group_leave(v6);
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[147] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v6[147] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v6 _resetReminderIntervalsForCountPlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v6[147] updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [v6 _resetReminderIntervalsForTimedPlans:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v4 = [v6 tableView];
    [v4 reloadData];

    uint64_t v3 = v6;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
      uint64_t v3 = v6;
    }
  }
}

- (void)_resetReminderIntervalsForTimedPlans:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPassAction *)self->_action type] == 2
    && ([(PKTransitCommutePlan *)self->_commutePlan properties] & 1) != 0)
  {
    uint64_t v5 = [(PKTransitCommutePlan *)self->_commutePlan expiryDate];
    id v6 = [(PKTransitCommutePlan *)self->_commutePlan startDate];
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] now];
    }
    if (v4 && [v4 count])
    {
      objc_super v7 = [(PKTransitCommutePlan *)self->_commutePlan identifier];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke;
      v18[3] = &unk_1E59D9008;
      id v19 = v7;
      id v8 = v7;
      id v9 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v18);
      int v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 expiryDate];

        uint64_t v12 = [v10 startDate];

        id v6 = (void *)v12;
        uint64_t v5 = (void *)v11;
      }
    }
    if (v5)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke_41;
      v15[3] = &unk_1E59D9030;
      id v16 = v5;
      id v17 = v6;
      objc_msgSend(&unk_1EF2BA0C8, "pk_objectsPassingTest:", v15);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      reminderIntervals = self->_reminderIntervals;
      self->_reminderIntervals = v13;
    }
  }
}

uint64_t __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  objc_super v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

BOOL __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke_41(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3;
  [*(id *)(a1 + 32) timeIntervalSince1970];
  double v6 = v5;
  [*(id *)(a1 + 40) timeIntervalSince1970];
  return v4 < v6 - v7;
}

- (void)_resetReminderIntervalsForCountPlans:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPassAction *)self->_action type] == 2)
  {
    char v5 = [(PKTransitCommutePlan *)self->_commutePlan properties];
    if (v4)
    {
      if ((v5 & 4) != 0 && [v4 count])
      {
        double v6 = [(PKTransitCommutePlan *)self->_commutePlan passFieldForKey:*MEMORY[0x1E4F87F20]];
        double v7 = [v6 foreignReferenceIdentifiers];
        uint64_t v8 = [v4 allObjects];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke;
        v16[3] = &unk_1E59D9058;
        id v9 = v7;
        id v17 = v9;
        int v10 = objc_msgSend(v8, "pk_firstObjectPassingTest:", v16);

        if (v10)
        {
          uint64_t v11 = [v10 value];
          uint64_t v12 = [v11 integerValue];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke_54;
          v15[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
          void v15[4] = v12;
          objc_msgSend(&unk_1EF2BA0E0, "pk_objectsPassingTest:", v15);
          v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
          reminderIntervals = self->_reminderIntervals;
          self->_reminderIntervals = v13;
        }
      }
    }
  }
}

uint64_t __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifiers];
  uint64_t v3 = PKEqualObjects();

  return v3;
}

BOOL __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke_54(uint64_t a1, void *a2)
{
  return [a2 integerValue] < *(void *)(a1 + 32);
}

- (void)_fetchRemindersWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(PKTransitCommutePlan *)self->_commutePlan properties];
  if ((v5 & 4) != 0)
  {
    if (!self->_dataProviderImplementsBalanceReminderAPI) {
      goto LABEL_10;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F84A40]);
    double v7 = [(PKTransitCommutePlan *)self->_commutePlan foreignReferenceIdentifiers];
    uint64_t v8 = (void *)[v6 initWithIdentifiers:v7 forValue:0 roundingToExponent:0];

    objc_initWeak(&location, self);
    paymentDataProvider = self->_paymentDataProvider;
    pass = self->_pass;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke;
    v17[3] = &unk_1E59D90A0;
    objc_copyWeak(&v19, &location);
    id v18 = v4;
    [(PKPaymentDataProvider *)paymentDataProvider balanceReminderThresholdForBalance:v8 pass:pass withCompletion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  if ((v5 & 3) == 1)
  {
    if (self->_dataProviderImplementsCommutePlanReminderAPI)
    {
      self->_selectedReminderIntervalsIndex = 0;
      self->_shouldLoadReminderInterval = 1;
      objc_initWeak(&location, self);
      uint64_t v11 = self->_paymentDataProvider;
      commutePlan = self->_commutePlan;
      v13 = self->_pass;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_4;
      v14[3] = &unk_1E59D90C8;
      objc_copyWeak(&v16, &location);
      id v15 = v4;
      [(PKPaymentDataProvider *)v11 commutePlanReminderForCommutePlan:commutePlan pass:v13 withCompletion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
LABEL_10:
    [(PKCommutePlanDetailsViewController *)self _reloadBalanceWithCompletion:v4];
    goto LABEL_11;
  }
  if ((v5 & 1) != 0 && ((v5 & 2) != 0 || !self->_dataProviderImplementsCommutePlanReminderAPI)) {
    goto LABEL_10;
  }
LABEL_11:
}

void __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E59CF8D8;
  id v11 = v3;
  id v12 = WeakRetained;
  id v13 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CAD18;
  block[4] = WeakRetained;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_updateSelectedBalanceReminderWithBalanceReminder:");
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBalanceWithCompletion:*(void *)(a1 + 40)];
}

void __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_5;
  aBlock[3] = &unk_1E59CF8D8;
  void aBlock[4] = WeakRetained;
  id v11 = v3;
  id v12 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_6;
  block[3] = &unk_1E59CAD18;
  block[4] = WeakRetained;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_5(void *a1)
{
  id v2 = (unsigned char *)a1[4];
  if (v2 && v2[1144]) {
    [v2 _updateSelectedReminderIntervalsIndexWithReminder:a1[5]];
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBalanceWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 == 1) {
    return self->_canShowReminders;
  }
  return 0;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKCommutePlanDetailsViewController;
  [(PKCommutePlanDetailsViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKCommutePlanDetailsViewController *)self tableView];
  id v4 = [(PKCommutePlanDetailsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)_handleReminderIntervalChanged:(int64_t)a3
{
  if (self->_selectedReminderIntervalsIndex != a3)
  {
    self->_shouldLoadReminderInterval = 0;
    BOOL v5 = a3 < 1;
    int64_t v6 = a3 - 1;
    if (v5)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(NSArray *)self->_reminderIntervals objectAtIndexedSubscript:v6];
    }
    uint64_t v8 = [(PKCommutePlanDetailsViewController *)self tableView];
    unint64_t v9 = [(PKSectionTableViewController *)self indexForSection:1];
    int v10 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_selectedReminderIntervalsIndex inSection:v9];
    id v11 = [v8 cellForRowAtIndexPath:v10];

    [v11 setAccessoryType:0];
    if ([(PKTransitCommutePlan *)self->_commutePlan properties])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F84A58]);
      [v7 doubleValue];
      id v15 = objc_msgSend(v14, "initWithTimeInterval:");
      [(PKPaymentDataProvider *)self->_paymentDataProvider setCommutePlanReminder:v15 forCommutePlan:self->_commutePlan pass:self->_pass completion:0];
    }
    else if (([(PKTransitCommutePlan *)self->_commutePlan properties] & 4) != 0)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F84A48]);
      id v13 = (void *)MEMORY[0x1E4F28C28];
      if (v7)
      {
        [v7 decimalValue];
      }
      else
      {
        v23[0] = 0;
        v23[1] = 0;
        int v24 = 0;
      }
      id v16 = [v13 decimalNumberWithDecimal:v23];
      id v17 = (void *)[v12 initWithThreshold:v16 isEnabled:1];

      id v18 = objc_alloc(MEMORY[0x1E4F84A40]);
      id v19 = [(PKTransitCommutePlan *)self->_commutePlan foreignReferenceIdentifiers];
      v20 = (void *)[v18 initWithIdentifiers:v19 forValue:0 roundingToExponent:0];

      [(PKPaymentDataProvider *)self->_paymentDataProvider setBalanceReminder:v17 forBalance:v20 pass:self->_pass completion:0];
    }
    id v21 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:v9];
    v22 = [v8 cellForRowAtIndexPath:v21];

    [v22 setAccessoryType:3];
    self->_selectedReminderIntervalsIndex = a3;
  }
}

- (void)_handleActionSelected
{
  id v7 = 0;
  uint64_t v8 = 0;
  char v3 = [(PKPaymentPass *)self->_pass canPerformAction:self->_action unableReason:&v8 displayableError:&v7];
  id v4 = v7;
  if ((v3 & 1) != 0 || v8 == 2)
  {
    BOOL v5 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:self->_action paymentDataProvider:self->_paymentDataProvider];
    [(PKPerformActionViewController *)v5 setDelegate:self];
    [(PKPerformActionViewController *)v5 setWebService:self->_webService];
    int64_t v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    [(PKNavigationController *)v6 setSupportedInterfaceOrientations:2];
    [(PKCommutePlanDetailsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    BOOL v5 = +[PKPerformActionViewController alertControllerForUnableReason:v8 action:self->_action displayableError:v4 addCardActionHandler:0];
    [(PKCommutePlanDetailsViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_updateSelectedBalanceReminderWithBalanceReminder:(id)a3
{
  reminderIntervals = self->_reminderIntervals;
  BOOL v5 = NSNumber;
  int64_t v6 = [a3 threshold];
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue"));
  uint64_t v8 = [(NSArray *)reminderIntervals indexOfObject:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v8 + 1;
  }
  if (self->_selectedReminderIntervalsIndex != v9)
  {
    self->_selectedReminderIntervalsIndex = v9;
    if (self->_canShowReminders)
    {
      -[PKCommutePlanDetailsViewController _reloadChangedIndexPathsWithOldIndex:newIndex:inSection:](self, "_reloadChangedIndexPathsWithOldIndex:newIndex:inSection:");
    }
  }
}

- (void)_updateSelectedReminderIntervalsIndexWithReminder:(id)a3
{
  [a3 timeInterval];
  reminderIntervals = self->_reminderIntervals;
  BOOL v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v6 = [(NSArray *)reminderIntervals indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6 + 1;
  }
  if (self->_selectedReminderIntervalsIndex != v7)
  {
    self->_selectedReminderIntervalsIndex = v7;
    if (self->_canShowReminders)
    {
      -[PKCommutePlanDetailsViewController _reloadChangedIndexPathsWithOldIndex:newIndex:inSection:](self, "_reloadChangedIndexPathsWithOldIndex:newIndex:inSection:");
    }
  }
}

- (void)_reloadChangedIndexPathsWithOldIndex:(unint64_t)a3 newIndex:(unint64_t)a4 inSection:(unint64_t)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:a5];
  unint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a4 inSection:a5];
  int v10 = [(PKCommutePlanDetailsViewController *)self tableView];
  v12[0] = v8;
  v12[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKCommutePlanDetailsViewController *)self view];
  [v3 setNeedsLayout];
}

- (unint64_t)_commutePlanDetailsRowTypeForRowIndex:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    unint64_t v8 = v6;
    v7 += [(PKCommutePlanDetailsViewController *)self _numberOfCommutePlanDetailsRowsEnabledForRowType:v6];
    if (v5) {
      break;
    }
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while (v7 <= a3);
  if (v7 <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

- (BOOL)_shouldShowRenewAction
{
  action = self->_action;
  if (action) {
    LOBYTE(action) = [(PKPaymentPassAction *)action isActionAvailable];
  }
  return (char)action;
}

- (int64_t)_numberOfCommutePlanDetailsRowsEnabled
{
  NSUInteger v3 = [(NSArray *)self->_fields count];
  return v3 + [(PKCommutePlanDetailsViewController *)self _shouldShowRenewAction];
}

- (int64_t)_numberOfCommutePlanDetailsRowsEnabledForRowType:(unint64_t)a3
{
  if (a3 == 1) {
    return [(PKCommutePlanDetailsViewController *)self _shouldShowRenewAction];
  }
  if (a3) {
    return 0;
  }
  fields = self->_fields;

  return [(NSArray *)fields count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 1)
  {
    int64_t result = [(NSArray *)self->_reminderIntervals count];
    if (result) {
      return [(NSArray *)self->_reminderIntervals count] + 1;
    }
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [(PKCommutePlanDetailsViewController *)self _numberOfCommutePlanDetailsRowsEnabled];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];

  unint64_t v10 = [(PKSectionTableViewController *)self sectionForIndex:v9];
  if (v10 == 1)
  {
    id v18 = [v6 dequeueReusableCellWithIdentifier:@"reminderCellIdentifier"];
    if (!v18)
    {
      id v18 = (PKCommutePlanDetailsTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"reminderCellIdentifier"];
      if (self->_style == 2)
      {
        v26 = PKBridgeAppearanceGetAppearanceSpecifier();
        PKAppearanceApplyToContainer(v26, v18);
      }
    }
    if (v8 >= 1)
    {
      if (([(PKTransitCommutePlan *)self->_commutePlan properties] & 4) != 0)
      {
        char v31 = [(NSArray *)self->_reminderIntervals objectAtIndexedSubscript:v8 - 1];
        uint64_t v32 = [v31 unsignedIntegerValue];

        v33 = [NSNumber numberWithUnsignedInteger:v32];
        PKLocalizedPaymentString(&cfstr_CommutePlanRen.isa, &stru_1EF1B4C70.isa, v33);
      }
      else
      {
        if (([(PKTransitCommutePlan *)self->_commutePlan properties] & 1) == 0)
        {
          id v12 = 0;
LABEL_32:
          v36 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
          [v36 setText:v12];

          id v37 = [(PKCommutePlanDetailsTableViewCell *)v18 detailTextLabel];
          [v37 setText:0];

          id v38 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
          [v38 setLineBreakMode:0];

          id v39 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
          [v39 setNumberOfLines:2];

          if (v8 == self->_selectedReminderIntervalsIndex) {
            uint64_t v40 = 3;
          }
          else {
            uint64_t v40 = 0;
          }
          [(PKCommutePlanDetailsTableViewCell *)v18 setAccessoryType:v40];
          int64_t style = self->_style;
          v42 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
          if (style == 2)
          {
            v43 = PKBridgeAppearanceGetAppearanceSpecifier();
            v44 = [v43 textColor];
            [v42 setTextColor:v44];
          }
          else
          {
            v43 = [MEMORY[0x1E4FB1618] labelColor];
            [v42 setTextColor:v43];
          }

          goto LABEL_52;
        }
        timeIntervalFormatter = self->_timeIntervalFormatter;
        id v35 = [(NSArray *)self->_reminderIntervals objectAtIndexedSubscript:v8 - 1];
        [v35 doubleValue];
        v33 = -[NSDateComponentsFormatter stringFromTimeInterval:](timeIntervalFormatter, "stringFromTimeInterval:");

        PKLocalizedPaymentString(&cfstr_CommutePlanRen_0.isa, &stru_1EF1B4C70.isa, v33);
      id v12 = };

      goto LABEL_32;
    }
    id v12 = PKLocalizedPaymentString(&cfstr_CommutePlanRen_1.isa);
    goto LABEL_32;
  }
  if (v10) {
    goto LABEL_28;
  }
  unint64_t v11 = [(PKCommutePlanDetailsViewController *)self _commutePlanDetailsRowTypeForRowIndex:v8];
  if (v11 != 1)
  {
    if (!v11)
    {
      id v12 = [(NSArray *)self->_fields objectAtIndexedSubscript:v8];
      id v13 = [v12 label];
      id v14 = [v12 value];
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"planDetailsCellStyle%d", 0);
      id v16 = [v6 dequeueReusableCellWithIdentifier:v15];
      if (!v16)
      {
        id v16 = [[PKCommutePlanDetailsTableViewCell alloc] initWithStyle:0 reuseIdentifier:v15 passDetailViewStyle:self->_style];
        if (self->_style == 2)
        {
          id v17 = PKBridgeAppearanceGetAppearanceSpecifier();
          PKAppearanceApplyToContainer(v17, v16);
        }
      }
      id v18 = v16;
      if ((unint64_t)([v12 foreignReferenceType] - 1) <= 1)
      {
        balanceModel = self->_balanceModel;
        v20 = [v12 foreignReferenceIdentifiers];
        id v21 = [(PKTransitBalanceModel *)balanceModel balanceForIdentifiers:v20];

        uint64_t v22 = [v21 formattedValue];

        id v14 = (void *)v22;
      }
      v23 = [v12 key];
      int v24 = v23;
      if (v8)
      {
        if (![v23 isEqualToString:*MEMORY[0x1E4F87F20]])
        {
          if ([v24 isEqualToString:*MEMORY[0x1E4F87F30]])
          {
            uint64_t v25 = [(PKTransitCommutePlan *)self->_commutePlan startDateString];
LABEL_50:
            v54 = (void *)v25;

            id v14 = v54;
            goto LABEL_51;
          }
          if ([v24 isEqualToString:*MEMORY[0x1E4F87F28]])
          {
            uint64_t v25 = [(PKTransitCommutePlan *)self->_commutePlan expiryDateString];
            goto LABEL_50;
          }
LABEL_51:
          [(PKCommutePlanDetailsTableViewCell *)v18 setPrimaryText:v13];
          [(PKCommutePlanDetailsTableViewCell *)v18 setSecondaryText:v14];

LABEL_52:
          goto LABEL_53;
        }
      }
      else if (([(PKTransitCommutePlan *)self->_commutePlan properties] & 4) != 0)
      {
        PKCommutePlanFormatTitleFromLabelAndValue();
        id v45 = v13;

        v46 = v14;
        goto LABEL_47;
      }
      PKCommutePlanFieldEitherLabelOrValueIsEmpty();
      PKCommutePlanFormatTitleFromLabelAndValue();
      id v45 = v13;

      v46 = v14;
LABEL_47:
      id v53 = v46;

      id v14 = v53;
      id v13 = v45;
      goto LABEL_51;
    }
LABEL_28:
    id v18 = 0;
    goto LABEL_53;
  }
  if (![(PKCommutePlanDetailsViewController *)self _shouldShowRenewAction]) {
    goto LABEL_28;
  }
  v27 = [NSString stringWithFormat:@"actionCellIdentifier"];
  id v18 = [v6 dequeueReusableCellWithIdentifier:v27];
  if (!v18)
  {
    id v18 = (PKCommutePlanDetailsTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:v27];
    if (self->_style == 2)
    {
      v28 = PKBridgeAppearanceGetAppearanceSpecifier();
      PKAppearanceApplyToContainer(v28, v18);
    }
  }
  action = self->_action;
  if ([(PKPaymentPass *)self->_pass isSuicaPass]) {
    BOOL v30 = [(PKPaymentPassAction *)self->_action type] == 2;
  }
  else {
    BOOL v30 = 0;
  }
  [(PKPaymentPassAction *)action setReverseButtonTitleForLegacySuica:v30];
  v47 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
  v48 = [(PKPaymentPassAction *)self->_action title];
  [v47 setText:v48];

  int64_t v49 = self->_style;
  v50 = [(PKCommutePlanDetailsTableViewCell *)v18 textLabel];
  if (v49 == 2)
  {
    v51 = PKBridgeAppearanceGetAppearanceSpecifier();
    v52 = [v51 buttonTextColor];
    [v50 setTextColor:v52];
  }
  else
  {
    v51 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v50 setTextColor:v51];
  }

LABEL_53:

  return v18;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  if (v6 == 1)
  {
    BOOL v7 = 1;
  }
  else if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = -[PKCommutePlanDetailsViewController _commutePlanDetailsRowTypeForRowIndex:](self, "_commutePlanDetailsRowTypeForRowIndex:", [v5 row]) == 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  [a3 deselectRowAtIndexPath:v7 animated:1];
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v6 == 1)
  {
    -[PKCommutePlanDetailsViewController _handleReminderIntervalChanged:](self, "_handleReminderIntervalChanged:", [v7 row]);
  }
  else if (!v6 {
         && -[PKCommutePlanDetailsViewController _commutePlanDetailsRowTypeForRowIndex:](self, "_commutePlanDetailsRowTypeForRowIndex:", [v7 row]) == 1&& -[PKCommutePlanDetailsViewController _shouldShowRenewAction](self, "_shouldShowRenewAction"))
  }
  {
    [(PKCommutePlanDetailsViewController *)self _handleActionSelected];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] != 1)
  {
    id v5 = 0;
    goto LABEL_18;
  }
  if (([(PKTransitCommutePlan *)self->_commutePlan properties] & 4) != 0)
  {
    id v7 = [(PKTransitCommutePlan *)self->_commutePlan passFieldForKey:*MEMORY[0x1E4F87F20]];
    uint64_t v8 = [v7 unitType];

    if (v8)
    {
      if (v8 == 2)
      {
        id v5 = [(NSArray *)self->_reminderIntervals count];
        if (!v5) {
          goto LABEL_18;
        }
        unint64_t v6 = @"COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_TICKETS";
      }
      else if (v8 == 1)
      {
        id v5 = [(NSArray *)self->_reminderIntervals count];
        if (!v5) {
          goto LABEL_18;
        }
        unint64_t v6 = @"COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_RIDES";
      }
      else
      {
        id v5 = [(NSArray *)self->_reminderIntervals count];
        if (!v5) {
          goto LABEL_18;
        }
        unint64_t v6 = @"COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_NONE";
      }
    }
    else
    {
      id v5 = [(NSArray *)self->_reminderIntervals count];
      if (!v5) {
        goto LABEL_18;
      }
      unint64_t v6 = @"COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_TRIPS";
    }
  }
  else
  {
    id v5 = [(NSArray *)self->_reminderIntervals count];
    if (!v5) {
      goto LABEL_18;
    }
    unint64_t v6 = @"COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER";
  }
  id v5 = PKLocalizedPaymentString(&v6->isa);
LABEL_18:

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] != 1
    || ((uint64_t v5 = [(PKTransitCommutePlan *)self->_commutePlan properties] & 1, self->_canShowReminders)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        v6))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_reminderIntervals count];
    if (v8)
    {
      uint64_t v8 = PKPassLocalizedStringWithFormat();
    }
  }

  return v8;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedDataController, 0);
  objc_storeStrong((id *)&self->_commutePlan, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_timeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_reminderIntervals, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_fields, 0);
}

@end