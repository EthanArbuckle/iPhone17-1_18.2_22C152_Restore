@interface PKExpressPassesViewController
- (BOOL)_isTransitExpressRowEnabledForIndex:(unint64_t)a3;
- (BOOL)_shouldShowSelectionDisclosureForPass:(id)a3;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)passes;
- (PKExpressPassesViewController)initWithPaymentDataProvider:(id)a3 controller:(id)a4 style:(int64_t)a5;
- (double)_heightForRowAtIndexPath:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_additionalContextStringForPass:(id)a3;
- (id)_conflictingPassesForPass:(id)a3 useCaseWithPasses:(id)a4;
- (id)_expressEnableFailureAlertWithRetryIndexPath:(id)a3;
- (id)_passWithUniqueIdentifier:(id)a3;
- (id)_paymentCardCellForRow:(int64_t)a3;
- (id)_paymentPassForIndex:(unint64_t)a3;
- (id)_preferenceCardCellForIdentifier:(id)a3;
- (id)_reportingSubject;
- (id)_transformState:(id)a3;
- (id)_transitCardCellForRow:(int64_t)a3;
- (id)_transitPassForIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_sectionForPass:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unsigned)_beginPassUpdateSuppression;
- (void)_acquireUserAuthForPass:(id)a3 withCompletion:(id)a4;
- (void)_beginReporting;
- (void)_configureAccessoryViewForPaymentCardCell:(id)a3 row:(int64_t)a4;
- (void)_disableExpressModeForPass:(id)a3 withCompletion:(id)a4;
- (void)_enableExpressModeForPass:(id)a3 withCompletion:(id)a4;
- (void)_endPassUpdateSuppressionWithToken:(unsigned int)a3 delay:(double)a4;
- (void)_endReporting;
- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 completion:(id)a4;
- (void)_invalidateUserAuth;
- (void)_reloadLocalPassStores;
- (void)_reportExpressModeDisable:(id)a3;
- (void)_reportExpressModeEnable:(id)a3 conflictingPasses:(id)a4;
- (void)_reportExpressModeEnableFailed:(id)a3;
- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4 conflictingPasses:(id)a5;
- (void)_sendExpressPassDidChangeNotification;
- (void)_setUserInteractionsEnabled:(BOOL)a3;
- (void)_transitUpdateWithState:(id)a3;
- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPass:(id)a6;
- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPassWithUniqueIdentifier:(id)a6;
- (void)_updateExpressState:(id)a3;
- (void)_updatePaymentCardCellWithIndex:(int64_t)a3 statusString:(id)a4;
- (void)_updateUIWithExpressState;
- (void)_upgradeExpressModeForPass:(id)a3 withCompletion:(id)a4;
- (void)_userChangedExpressSettingForPaymentPassAtIndexPath:(id)a3;
- (void)_userChangedExpressTransitToNone;
- (void)_userSetExpressTransitCardToEnabled:(BOOL)a3 cell:(id)a4;
- (void)dealloc;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentPreferenceCardCell:(id)a3 didChangeSwitchState:(BOOL)a4;
- (void)setPasses:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKExpressPassesViewController

- (PKExpressPassesViewController)initWithPaymentDataProvider:(id)a3 controller:(id)a4 style:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKExpressPassesViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v25, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v12 = v11;
  if (v11)
  {
    p_expressPassController = (id *)&v11->_expressPassController;
    objc_storeStrong((id *)&v11->_expressPassController, a4);
    objc_storeStrong((id *)&v12->_paymentDataProvider, a3);
    if (objc_opt_respondsToSelector()) {
      [(PKPaymentDataProvider *)v12->_paymentDataProvider addDelegate:v12];
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    passUniqueIDToCell = v12->_passUniqueIDToCell;
    v12->_passUniqueIDToCell = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    passUniqueIDToTransitBalanceModels = v12->_passUniqueIDToTransitBalanceModels;
    v12->_passUniqueIDToTransitBalanceModels = v16;

    v12->_style = a5;
    BOOL userAutomaticExpressModeText = 1;
    v12->_isUserInteractionsEnabled = 1;
    uint64_t v19 = +[PKPassSnapshotter sharedInstance];
    passSnapshotter = v12->_passSnapshotter;
    v12->_passSnapshotter = (PKPassSnapshotter *)v19;

    v12->_BOOL userAutomaticExpressModeText = [*p_expressPassController deviceUsesAutomaticAuthorization];
    if ([*p_expressPassController apiVersion]) {
      BOOL userAutomaticExpressModeText = v12->_userAutomaticExpressModeText;
    }
    v12->_useOldAppearance = userAutomaticExpressModeText;
    [*p_expressPassController setPresentingViewController:v12];
    if (v12->_userAutomaticExpressModeText) {
      v21 = @"SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE";
    }
    else {
      v21 = @"SETTINGS_EXPRESS_TRANSIT_PICKER_TITLE";
    }
    v22 = PKLocalizedPaymentString(&v21->isa);
    v23 = [(PKExpressPassesViewController *)v12 navigationItem];
    [v23 setTitle:v22];
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKExpressPassesViewController;
  [(PKExpressPassesViewController *)&v5 viewWillAppear:a3];
  if (self->_style == 1)
  {
    v4 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v4, self);
  }
}

- (id)_passWithUniqueIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = self->_allPasses;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "uniqueID", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKExpressPassesViewController;
  [(PKExpressPassesViewController *)&v4 viewWillDisappear:a3];
  [(PKExpressPassesViewController *)self _invalidateUserAuth];
}

- (void)dealloc
{
  [(PKExpressPassesViewController *)self _invalidateUserAuth];
  v3.receiver = self;
  v3.super_class = (Class)PKExpressPassesViewController;
  [(PKSectionTableViewController *)&v3 dealloc];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (a3)
  {
    LOBYTE(v4) = a3 == 1 && [(NSMutableArray *)self->_paymentPasses count] != 0;
  }
  else
  {
    uint64_t v4 = [(NSMutableArray *)self->_transitPasses count];
    if (v4) {
      LOBYTE(v4) = !self->_useOldAppearance;
    }
  }
  return v4;
}

- (void)setPasses:(id)a3
{
  id v5 = a3;
  if (!self->_supressHandlingPassUpdates)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_passes, a3);
    [(PKExpressPassesViewController *)self _reloadLocalPassStores];
    [(PKSectionTableViewController *)self reloadData];
    id v5 = v6;
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = v6;
  long long v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __86__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    if (*(void *)(result + 40)) {
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:", 0, 0);
    }
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = v6;
  long long v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __100__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    if (*(void *)(result + 40)) {
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:", 0);
    }
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = v6;
  long long v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    if (*(void *)(result + 40)) {
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:");
    }
  }
  return result;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPassWithUniqueIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  transitPasses = self->_transitPasses;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __130__PKExpressPassesViewController__updateBalancesWithServerBalances_transitPassProperties_commutePlans_forPassWithUniqueIdentifier___block_invoke;
  v18[3] = &unk_1E59D1458;
  id v15 = v13;
  id v19 = v15;
  uint64_t v16 = [(NSMutableArray *)transitPasses indexOfObjectPassingTest:v18];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [(NSMutableArray *)self->_transitPasses objectAtIndex:v16];
    [(PKExpressPassesViewController *)self _updateBalancesWithServerBalances:v10 transitPassProperties:v11 commutePlans:v12 forPass:v17];
  }
}

uint64_t __130__PKExpressPassesViewController__updateBalancesWithServerBalances_transitPassProperties_commutePlans_forPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPass:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 uniqueID];
  long long v14 = [(NSMutableDictionary *)self->_passUniqueIDToTransitBalanceModels objectForKey:v13];
  if (!v14) {
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v12];
  }
  if (v16) {
    [v14 setDynamicBalances:v16];
  }
  if (v10) {
    [v14 setTransitProperties:v10];
  }
  if (v11) {
    [v14 updateWithDynamicCommutePlans:v11];
  }
  [(NSMutableDictionary *)self->_passUniqueIDToTransitBalanceModels setObject:v14 forKey:v13];
  id v15 = [(NSMutableDictionary *)self->_passUniqueIDToCell objectForKey:v13];
  [v15 setTransitBalanceModel:v14];
}

- (void)paymentPreferenceCardCell:(id)a3 didChangeSwitchState:(BOOL)a4
{
}

- (void)_userChangedExpressSettingForPaymentPassAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  selectedPaymentPassIndex = (void *)self->_selectedPaymentPassIndex;
  int64_t v6 = [v4 row];
  int64_t v7 = v6;
  if (v6 != self->_selectedPaymentPassIndex)
  {
    self->_selectedPaymentPassIndex = v6;
    id v8 = [(PKExpressPassesViewController *)self tableView];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", selectedPaymentPassIndex, objc_msgSend(v4, "section"));
    id v10 = [v8 cellForRowAtIndexPath:v9];

    [(PKExpressPassesViewController *)self _configureAccessoryViewForPaymentCardCell:v10 row:selectedPaymentPassIndex];
    id v11 = [v8 cellForRowAtIndexPath:v4];
    -[PKExpressPassesViewController _configureAccessoryViewForPaymentCardCell:row:](self, "_configureAccessoryViewForPaymentCardCell:row:", v11, [v4 row]);
    [v11 setActivityIndicatorActive:1];
    [(PKExpressPassesViewController *)self _setUserInteractionsEnabled:0];
    unsigned int v12 = [(PKExpressPassesViewController *)self _beginPassUpdateSuppression];
    int64_t v13 = self->_selectedPaymentPassIndex;
    if (v13 == [(NSMutableArray *)self->_paymentPasses count])
    {
      long long v14 = [(PKExpressPassesViewController *)self _paymentPassForIndex:selectedPaymentPassIndex];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke;
      v22[3] = &unk_1E59D1480;
      objc_copyWeak(&v23, &location);
      v22[4] = self;
      unsigned int v24 = v12;
      [(PKExpressPassesViewController *)self _disableExpressModeForPass:v14 withCompletion:v22];
      objc_destroyWeak(&v23);
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke_2;
      aBlock[3] = &unk_1E59D14A8;
      objc_copyWeak(v20, &location);
      v20[1] = selectedPaymentPassIndex;
      id v18 = v4;
      id v19 = self;
      unsigned int v21 = v12;
      id v15 = _Block_copy(aBlock);
      id v16 = [(PKExpressPassesViewController *)self _paymentPassForIndex:v7];
      if ([(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:v16])
      {
        self->_selectedPaymentPassIsInPendingState = 1;
        [(PKExpressPassesViewController *)self _upgradeExpressModeForPass:v16 withCompletion:v15];
      }
      else
      {
        [(PKExpressPassesViewController *)self _enableExpressModeForPass:v16 withCompletion:v15];
      }

      objc_destroyWeak(v20);
    }
  }
  objc_destroyWeak(&location);
}

void __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateExpressState:v5];
    [v4 _updateUIWithExpressState];
    [v4 _sendExpressPassDidChangeNotification];
    [v4 _setUserInteractionsEnabled:1];
    [*(id *)(a1 + 32) _endPassUpdateSuppressionWithToken:*(unsigned int *)(a1 + 48) delay:0.5];
  }
}

void __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1176) = 0;
    if (v9)
    {
      objc_msgSend(WeakRetained, "_updateExpressState:");
      [v4 _updateUIWithExpressState];
      [v4 _sendExpressPassDidChangeNotification];
    }
    else
    {
      *((void *)WeakRetained + 145) = *(void *)(a1 + 56);
      if ([WeakRetained isSectionMapped:1])
      {
        id v5 = [v4 tableView];
        int64_t v6 = [v5 cellForRowAtIndexPath:*(void *)(a1 + 32)];
        [v6 setActivityIndicatorActive:0];
        objc_msgSend(*(id *)(a1 + 40), "_configureAccessoryViewForPaymentCardCell:row:", v6, objc_msgSend(*(id *)(a1 + 32), "row"));
        int64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", *(void *)(a1 + 56), objc_msgSend(v4, "indexForSection:", 1));
        id v8 = [v5 cellForRowAtIndexPath:v7];

        [v8 setActivityIndicatorActive:0];
        [*(id *)(a1 + 40) _configureAccessoryViewForPaymentCardCell:v8 row:*(void *)(a1 + 56)];
      }
    }
    [v4 _setUserInteractionsEnabled:1];
    [*(id *)(a1 + 40) _endPassUpdateSuppressionWithToken:*(unsigned int *)(a1 + 64) delay:0.5];
  }
}

- (void)_userSetExpressTransitCardToEnabled:(BOOL)a3 cell:(id)a4
{
  id v6 = a4;
  int64_t v7 = [v6 pass];
  [(PKExpressPassesViewController *)self _setUserInteractionsEnabled:0];
  [v6 setAccessoryType:0];
  [v6 setActivityIndicatorActive:1];
  objc_initWeak(&location, self);
  unsigned int v8 = [(PKExpressPassesViewController *)self _beginPassUpdateSuppression];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKExpressPassesViewController__userSetExpressTransitCardToEnabled_cell___block_invoke;
  aBlock[3] = &unk_1E59D14D0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  int64_t v13 = self;
  unsigned int v15 = v8;
  id v10 = _Block_copy(aBlock);
  if (a3) {
    [(PKExpressPassesViewController *)self _enableExpressModeForPass:v7 withCompletion:v10];
  }
  else {
    [(PKExpressPassesViewController *)self _disableExpressModeForPass:v7 withCompletion:v10];
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __74__PKExpressPassesViewController__userSetExpressTransitCardToEnabled_cell___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setUserInteractionsEnabled:1];
    [*(id *)(a1 + 32) setActivityIndicatorActive:0];
    if (v3)
    {
      [v5 _transitUpdateWithState:v3];
LABEL_6:
      [*(id *)(a1 + 40) _endPassUpdateSuppressionWithToken:*(unsigned int *)(a1 + 56) delay:0.5];
      goto LABEL_7;
    }
    if ([v5 isSectionMapped:0])
    {
      id v6 = [*(id *)(a1 + 32) actionSwitch];
      [v6 setOn:0 animated:1];

      goto LABEL_6;
    }
    int64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to update express pass UI", v8, 2u);
    }
  }
LABEL_7:
}

- (void)_userChangedExpressTransitToNone
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_selectedTransitPassIndices count])
  {
    [(PKExpressPassesViewController *)self _setUserInteractionsEnabled:0];
    id v3 = [(PKExpressPassesViewController *)self tableView];
    id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[NSMutableArray count](self->_transitPasses, "count"), 0);
    id v5 = [v3 cellForRowAtIndexPath:v4];

    [v5 setAccessoryType:0];
    [v5 setActivityIndicatorActive:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int64_t v7 = self->_selectedTransitPassIndices;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = -[NSMutableArray objectAtIndex:](self->_transitPasses, "objectAtIndex:", [*(id *)(*((void *)&v17 + 1) + 8 * v10) unsignedIntegerValue]);
          id v12 = [v11 uniqueID];
          [v6 addObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    objc_initWeak(&location, self);
    expressPassController = self->_expressPassController;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke;
    v14[3] = &unk_1E59CBE48;
    objc_copyWeak(&v15, &location);
    [(PKExpressPassController *)expressPassController disableExpressModeForPassesWithUniqueIdentifiers:v6 withCompletion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained _setUserInteractionsEnabled:1];
    id v3 = [v7 _transformState:*(void *)(a1 + 32)];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [v7[138] enabledExpressPasses];
    }
    id v6 = v5;

    [v7 _transitUpdateWithState:v6];
    id WeakRetained = v7;
  }
}

- (void)_upgradeExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    selectedPaymentPassIndex = (void *)self->_selectedPaymentPassIndex;
    objc_initWeak(&location, self);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__12;
    v36[4] = __Block_byref_object_dispose__12;
    id v37 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__12;
    v34[4] = __Block_byref_object_dispose__12;
    id v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__12;
    v32[4] = __Block_byref_object_dispose__12;
    id v33 = 0;
    id v9 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke;
    v31[3] = &unk_1E59CDD98;
    v31[4] = self;
    v31[5] = v32;
    [v9 addOperation:v31];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_51;
    v27[3] = &unk_1E59D1548;
    objc_copyWeak(&v30, &location);
    v27[4] = self;
    id v10 = v6;
    id v28 = v10;
    v29 = v34;
    [v9 addOperation:v27];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_53;
    v20[3] = &unk_1E59D15C0;
    objc_copyWeak(v26, &location);
    id v11 = v10;
    id v21 = v11;
    uint64_t v22 = self;
    id v23 = v34;
    unsigned int v24 = v32;
    v26[1] = selectedPaymentPassIndex;
    objc_super v25 = v36;
    [v9 addOperation:v20];
    id v12 = [MEMORY[0x1E4F1CA98] null];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_4;
    v14[3] = &unk_1E59D15E8;
    objc_copyWeak(v19, &location);
    id v16 = v7;
    long long v17 = v36;
    v19[1] = selectedPaymentPassIndex;
    id v15 = v11;
    long long v18 = v32;
    id v13 = (id)[v9 evaluateWithInput:v12 completion:v14];

    objc_destroyWeak(v19);
    objc_destroyWeak(v26);

    objc_destroyWeak(&v30);
    _Block_object_dispose(v32, 8);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);

    objc_destroyWeak(&location);
  }
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (*(void *)(*(void *)(a1 + 32) + 1136))
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
  else
  {
    id v9 = dispatch_get_global_queue(25, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2;
    v11[3] = &unk_1E59D14F8;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v8;
    id v12 = v6;
    id v10 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E59CAA98;
    id v16 = v10;
    dispatch_async(v9, block);
  }
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  char IsEnabled = PKNearFieldRadioIsEnabled();
  if ((IsEnabled & 1) == 0)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Cannot upgrade express mode while NFC radio is disabled", buf, 2u);
    }

    id v4 = PKCreateAlertControllerForNFCRadioDisabled();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_49;
  block[3] = &unk_1E59CF318;
  id v9 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  char v10 = IsEnabled;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned char *)(a1 + 48) == 0);
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_51(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(*(void *)(a1 + 32) + 1136))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3;
      v14[3] = &unk_1E59D1520;
      objc_copyWeak(&v18, (id *)(a1 + 56));
      id v16 = v9;
      id v12 = v8;
      uint64_t v13 = *(void *)(a1 + 48);
      id v15 = v12;
      uint64_t v17 = v13;
      [WeakRetained _acquireUserAuthForPass:v11 withCompletion:v14];

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (!v6 || v7)
  {
    char v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error getting auth for express mode change: %@", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
  v9();
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained[145];
    uint64_t v13 = PKLocalizedTransitString(&cfstr_SettingsExpres_0.isa);
    [v11 _updatePaymentCardCellWithIndex:v12 statusString:v13];

    uint64_t v14 = (void *)v11[138];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_57;
    v21[3] = &unk_1E59D1598;
    objc_copyWeak(v27, (id *)(a1 + 72));
    id v24 = v9;
    id v17 = v8;
    v27[1] = *(id *)(a1 + 80);
    uint64_t v18 = *(void *)(a1 + 56);
    id v22 = v17;
    uint64_t v25 = v18;
    int8x16_t v20 = *(int8x16_t *)(a1 + 32);
    id v19 = (id)v20.i64[0];
    int8x16_t v23 = vextq_s8(v20, v20, 8uLL);
    uint64_t v26 = *(void *)(a1 + 64);
    [v14 upgradeExpressModeForPass:v15 withCredential:v16 resultHandler:v21];

    objc_destroyWeak(v27);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_57(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3_58;
  v15[3] = &unk_1E59D1570;
  objc_copyWeak(v24, (id *)(a1 + 80));
  id v21 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v7 = *(void **)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v18 = v6;
  uint64_t v19 = v8;
  uint64_t v10 = *(void *)(a1 + 64);
  v24[1] = v7;
  uint64_t v22 = v10;
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 72);
  id v20 = v11;
  uint64_t v23 = v12;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v15);

  objc_destroyWeak(v24);
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (!WeakRetained)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v2);
    id v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_5:
    v3();
    goto LABEL_12;
  }
  id v4 = [*(id *)(a1 + 48) domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F87C30]];

    if (!v6)
    {
      id v7 = 0;
      goto LABEL_11;
    }
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", *(void *)(a1 + 104), objc_msgSend(*(id *)(a1 + 56), "indexForSection:", 1));
LABEL_11:
  uint64_t v8 = [WeakRetained _expressEnableFailureAlertWithRetryIndexPath:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [WeakRetained _reportExpressModeEnableFailed:*(void *)(a1 + 64)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_12:
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      [WeakRetained[139] setObject:v7 atIndexedSubscript:*(void *)(a1 + 72)];
      [v6 _reportExpressModeEnable:*(void *)(a1 + 32) conflictingPasses:0];
    }
    [v6 _updatePaymentCardCellWithIndex:*(void *)(a1 + 72) statusString:0];
    [v6 _invalidateUserAuth];
    uint64_t v8 = *(void *)(a1 + 40);
    if ([v11 isCanceled])
    {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
    else
    {
      uint64_t v9 = [v6[138] enabledExpressPasses];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v10) {
      [v6 presentViewController:v10 animated:1 completion:0];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_enableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(PKExpressPassController *)self->_expressPassController expressModeSupportedForPass:v6];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F846D0]) initWithPassInformation:v8 forSecureElementPass:v6];
    objc_initWeak(location, self);
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__12;
    v49[4] = __Block_byref_object_dispose__12;
    id v50 = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__12;
    v47[4] = __Block_byref_object_dispose__12;
    id v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__12;
    v45[4] = __Block_byref_object_dispose__12;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__12;
    v43[4] = __Block_byref_object_dispose__12;
    id v44 = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke;
    v42[3] = &unk_1E59CDD98;
    v42[4] = self;
    v42[5] = v43;
    [v10 addOperation:v42];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_64;
    v37[3] = &unk_1E59D1660;
    objc_copyWeak(&v41, location);
    v37[4] = self;
    id v11 = v6;
    id v38 = v11;
    id v12 = v9;
    id v39 = v12;
    v40 = v49;
    [v10 addOperation:v37];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_69;
    v33[3] = &unk_1E59D1548;
    objc_copyWeak(&v36, location);
    v33[4] = self;
    id v13 = v11;
    id v34 = v13;
    id v35 = v47;
    [v10 addOperation:v33];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_70;
    v23[3] = &unk_1E59D16B0;
    objc_copyWeak(&v32, location);
    id v14 = v12;
    id v24 = v14;
    id v28 = v47;
    v29 = v45;
    id v15 = v8;
    id v25 = v15;
    id v30 = v49;
    v31 = v43;
    id v26 = v13;
    v27 = self;
    [v10 addOperation:v23];
    id v16 = [MEMORY[0x1E4F1CA98] null];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_5;
    v18[3] = &unk_1E59D16D8;
    objc_copyWeak(&v22, location);
    id v19 = v7;
    id v20 = v45;
    id v21 = v43;
    id v17 = (id)[v10 evaluateWithInput:v16 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v41);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v49, 8);

    objc_destroyWeak(location);
  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (*(void *)(*(void *)(a1 + 32) + 1136))
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
  else
  {
    uint64_t v9 = dispatch_get_global_queue(25, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2;
    v11[3] = &unk_1E59D14F8;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v8;
    id v12 = v6;
    id v10 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E59CAA98;
    id v16 = v10;
    dispatch_async(v9, block);
  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  char IsEnabled = PKNearFieldRadioIsEnabled();
  if ((IsEnabled & 1) == 0)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Cannot upgrade express mode while NFC radio is disabled", buf, 2u);
    }

    id v4 = PKCreateAlertControllerForNFCRadioDisabled();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_63;
  block[3] = &unk_1E59CF318;
  id v9 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  char v10 = IsEnabled;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned char *)(a1 + 48) == 0);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_64(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1186))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 40) uniqueID];
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Checking for conflicts against pass %@", buf, 0xCu);
      }
      id v13 = (void *)WeakRetained[138];
      uint64_t v14 = *(void *)(a1 + 48);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      id v19[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_65;
      v19[3] = &unk_1E59D1638;
      objc_copyWeak(&v25, (id *)(a1 + 64));
      uint64_t v23 = v9;
      id v15 = v8;
      uint64_t v16 = *(void *)(a1 + 56);
      id v20 = v15;
      uint64_t v24 = v16;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 32);
      id v21 = v17;
      uint64_t v22 = v18;
      [v13 conflictingExpressPassesWithPassConfiguration:v14 completion:v19];

      objc_destroyWeak(&v25);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_66;
  block[3] = &unk_1E59D1610;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v12 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v13 = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_66(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_13:
    v16();
    goto LABEL_14;
  }
  uint64_t v4 = [WeakRetained _conflictingPassesForPass:*(void *)(a1 + 40) useCaseWithPasses:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 48) count];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Found %ld conflicts total of which %@ are valid for the use case", buf, 0x16u);
  }

  id v10 = [*(id *)(*(void *)(a1 + 56) + 1128) paymentWebService];
  uint64_t v11 = [v10 targetDevice];
  int v12 = PKGymKitConflictsWithPass();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Pass conflict with GymKit:%d", buf, 8u);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count]) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  if (v13 != 1)
  {
    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_13;
  }
  id v14 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v15 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_67;
  v17[3] = &unk_1E59CA820;
  id v19 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 32);
  PKPromptUserAboutConflicts(v14, v12, v15, v3, v17);

LABEL_14:
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_67(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2 ^ 1u);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_69(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(*(void *)(a1 + 32) + 1136))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3;
      v14[3] = &unk_1E59D1520;
      objc_copyWeak(&v18, (id *)(a1 + 56));
      uint64_t v16 = v9;
      id v12 = v8;
      uint64_t v13 = *(void *)(a1 + 48);
      id v15 = v12;
      uint64_t v17 = v13;
      [WeakRetained _acquireUserAuthForPass:v11 withCompletion:v14];

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (!v6 || v7)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error getting auth for express mode change: %@", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
  v9();
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = (void *)*((void *)WeakRetained + 138);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v19[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_71;
    v19[3] = &unk_1E59D1688;
    objc_copyWeak(&v27, (id *)(a1 + 96));
    id v24 = v9;
    id v15 = v8;
    uint64_t v16 = *(void *)(a1 + 72);
    id v20 = v15;
    uint64_t v25 = v16;
    id v21 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    long long v26 = *(_OWORD *)(a1 + 80);
    uint64_t v18 = *(void *)(a1 + 56);
    id v22 = v17;
    uint64_t v23 = v18;
    [v12 setExpressModeWithPassConfiguration:v13 credential:v14 completion:v19];

    objc_destroyWeak(&v27);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    if (v3)
    {
LABEL_3:
      uint64_t v5 = [WeakRetained _transformState:v3];
      goto LABEL_6;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3_72;
    block[3] = &unk_1E59CAD68;
    id v18 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = [WeakRetained[138] enabledExpressPasses];
LABEL_6:
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 40) passUniqueIdentifier];
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKeyedSubscript:v8];

  if (v9)
  {
    [WeakRetained _reportExpressModeEnable:*(void *)(a1 + 48) conflictingPasses:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 56) _expressEnableFailureAlertWithRetryIndexPath:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [WeakRetained _reportExpressModeEnableFailed:*(void *)(a1 + 48)];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_4;
  v13[3] = &unk_1E59CAD68;
  id v15 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invalidateUserAuth];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v3) {
      [v4 presentViewController:v3 animated:1 completion:0];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_disableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  expressPassController = self->_expressPassController;
  id v9 = [v6 uniqueID];
  v16[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke;
  v12[3] = &unk_1E59D1700;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [(PKExpressPassController *)expressPassController disableExpressModeForPassesWithUniqueIdentifiers:v10 withCompletion:v12];

  [(PKExpressPassesViewController *)self _reportExpressModeDisable:v6];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    id v4 = [WeakRetained _transformState:*(void *)(a1 + 32)];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v10[138] enabledExpressPasses];
    }
    id v8 = v6;

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7) {
      goto LABEL_11;
    }
    uint64_t v10 = 0;
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  id v3 = v10;
LABEL_11:
}

- (void)_sendExpressPassDidChangeNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PKExpressPassesViewControllerExpressPassChangedNotification" object:0];
}

- (double)_heightForRowAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 row];
  unint64_t v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  if (!v7)
  {
    uint64_t v9 = [v5 row];
    if (v9 != [(NSMutableArray *)self->_transitPasses count])
    {
      double v3 = *MEMORY[0x1E4FB2F28];
      goto LABEL_8;
    }
    id v8 = [(PKExpressPassesViewController *)self _transitCardCellForRow:v6];
    goto LABEL_6;
  }
  if (v7 == 1)
  {
    id v8 = [(PKExpressPassesViewController *)self _paymentCardCellForRow:v6];
LABEL_6:
    uint64_t v10 = v8;
    [v8 heightThatFitsLabels];
    double v3 = v11;
  }
LABEL_8:

  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [(PKExpressPassesViewController *)self _heightForRowAtIndexPath:a4];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [(PKExpressPassesViewController *)self _heightForRowAtIndexPath:a4];
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5)
  {
    if (v5 != 1)
    {
      uint64_t v7 = 0;
      BOOL v8 = 0;
      return v7 + v8;
    }
    uint64_t v6 = 1112;
  }
  else
  {
    uint64_t v6 = 1088;
  }
  uint64_t v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + v6) count];
  BOOL v8 = v7 > 0;
  return v7 + v8;
}

- (id)_preferenceCardCellForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKExpressPassesViewController *)self tableView];
  uint64_t v6 = [v5 dequeueReusableCellWithIdentifier:v4];

  if (!v6)
  {
    uint64_t v6 = [[PKPaymentPreferenceCardCell alloc] initWithReuseIdentifier:v4];
    if (self->_style == 1)
    {
      uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [(PKPaymentPreferenceCardCell *)v6 setActivityIndicatorColor:v7];
    }
  }
  BOOL v8 = [(PKPaymentPreferenceCardCell *)v6 displayLabel];
  [v8 setNumberOfLines:1];

  uint64_t v9 = [(PKPaymentPreferenceCardCell *)v6 displayLabel];
  [v9 setLineBreakMode:4];

  [(PKPaymentPreferenceCardCell *)v6 setAccessoryType:0];

  return v6;
}

- (id)_paymentCardCellForRow:(int64_t)a3
{
  unint64_t v5 = [(PKExpressPassesViewController *)self _preferenceCardCellForIdentifier:@"paymentCell"];
  if ([(NSMutableArray *)self->_paymentPasses count] <= (unint64_t)a3)
  {
    [v5 setPassSnapshotter:0];
    [v5 setPass:0];
    uint64_t v6 = [v5 textLabel];
    BOOL v8 = PKLocalizedPaymentString(&cfstr_None_0.isa);
    [v6 setText:v8];
  }
  else
  {
    uint64_t v6 = [(PKExpressPassesViewController *)self _paymentPassForIndex:a3];
    uint64_t v7 = [v5 textLabel];
    [v7 setText:0];

    [v5 setPassSnapshotter:self->_passSnapshotter];
    [v5 setPass:v6];
    BOOL v8 = [(PKExpressPassesViewController *)self _additionalContextStringForPass:v6];
    [v5 setAdditionalContextString:v8];
  }

  [(PKExpressPassesViewController *)self _configureAccessoryViewForPaymentCardCell:v5 row:a3];
  [v5 setUserInteractionEnabled:self->_isUserInteractionsEnabled];

  return v5;
}

- (id)_additionalContextStringForPass:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 devicePaymentApplications];
  uint64_t v6 = [v5 allObjects];

  if ((unint64_t)[v6 count] >= 2)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = [(PKExpressPassController *)self->_expressPassController expressModeSupportedForPass:v4];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __65__PKExpressPassesViewController__additionalContextStringForPass___block_invoke;
    v33[3] = &unk_1E59D1728;
    id v10 = v8;
    id v34 = v10;
    id v27 = v9;
    [v9 enumerateCredentialsWithHandler:v33];
    double v11 = [(PKExpressPassController *)self->_expressPassController eligibleExpressUpgradeRequestsForPass:v4];
    id v12 = [v11 firstObject];

    if (v12)
    {
      id v13 = [v12 paymentApplicationIdentifiers];
      [v10 addObjectsFromArray:v13];
    }
    long long v26 = v12;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v28 = v6;
    id v15 = [v4 sortedPaymentApplications:v6 ascending:1];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v21 = [v20 applicationIdentifier];
          int v22 = [v10 containsObject:v21];

          if (v22)
          {
            uint64_t v23 = [v20 displayName];
            [v14 addObject:v23];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v17);
    }
    unint64_t v24 = [v14 count];
    uint64_t v6 = v28;
    if (v24 >= [v28 count])
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v14 componentsJoinedByString:@", "];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __65__PKExpressPassesViewController__additionalContextStringForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  [MEMORY[0x1E4F846E0] extractApplicationIdentifier:&v3 subcredentialIdentifier:0 fromIdentifiers:a2];
  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", v3);
}

- (id)_transitCardCellForRow:(int64_t)a3
{
  unint64_t v5 = [(PKExpressPassesViewController *)self _preferenceCardCellForIdentifier:@"transitCell"];
  BOOL v6 = [(PKExpressPassesViewController *)self _isTransitExpressRowEnabledForIndex:a3];
  uint64_t v7 = [v5 pass];
  id v8 = [v7 uniqueID];

  if (v8) {
    [(NSMutableDictionary *)self->_passUniqueIDToCell removeObjectForKey:v8];
  }
  if ([(NSMutableArray *)self->_transitPasses count] <= (unint64_t)a3)
  {
    [v5 setPassSnapshotter:0];
    [v5 setPass:0];
    [v5 setDelegate:0];
    [v5 setAccessoryViewType:0];
    id v14 = [v5 textLabel];
    id v15 = PKLocalizedPaymentString(&cfstr_None_0.isa);
    [v14 setText:v15];

    if (v6) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 0;
    }
    [v5 setAccessoryType:v16];
  }
  else
  {
    uint64_t v9 = [v5 textLabel];
    [v9 setText:0];

    [v5 setDelegate:self];
    [v5 setAccessoryViewType:1];
    id v10 = [v5 actionSwitch];
    [v10 setOn:v6 animated:0];

    double v11 = [(PKExpressPassesViewController *)self _transitPassForIndex:a3];
    [v5 setPassSnapshotter:self->_passSnapshotter];
    [v5 setPass:v11];
    id v12 = [v11 uniqueID];
    [(NSMutableDictionary *)self->_passUniqueIDToCell setObject:v5 forKey:v12];
    if ([v11 isStoredValuePass])
    {
      id v13 = [(NSMutableDictionary *)self->_passUniqueIDToTransitBalanceModels objectForKey:v12];
      if (v13)
      {
        [v5 setTransitBalanceModel:v13];
      }
      else
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__PKExpressPassesViewController__transitCardCellForRow___block_invoke;
        v18[3] = &unk_1E59D1750;
        objc_copyWeak(&v20, &location);
        id v19 = v11;
        [(PKExpressPassesViewController *)self _fetchBalancesAndTransitPassPropertiesForPass:v19 completion:v18];

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }
  [v5 setActivityIndicatorActive:0];
  [v5 setUserInteractionEnabled:self->_isUserInteractionsEnabled];

  return v5;
}

void __56__PKExpressPassesViewController__transitCardCellForRow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _updateBalancesWithServerBalances:v10 transitPassProperties:v9 commutePlans:v8 forPass:*(void *)(a1 + 32)];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  uint64_t v7 = [v5 row];

  if (v6)
  {
    if (v6 == 1)
    {
      id v8 = [(PKExpressPassesViewController *)self _paymentCardCellForRow:v7];
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Unhandled section!", v11, 2u);
      }

      id v8 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
    }
  }
  else
  {
    id v8 = [(PKExpressPassesViewController *)self _transitCardCellForRow:v7];
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v8 section]);
  if (v6)
  {
    if (v6 == 1) {
      [(PKExpressPassesViewController *)self _userChangedExpressSettingForPaymentPassAtIndexPath:v8];
    }
  }
  else
  {
    uint64_t v7 = [v8 row];
    if (v7 == [(NSMutableArray *)self->_transitPasses count]) {
      [(PKExpressPassesViewController *)self _userChangedExpressTransitToNone];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_isUserInteractionsEnabled) {
    goto LABEL_5;
  }
  unint64_t v9 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v9 == 1)
  {
    BOOL v11 = 1;
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_5:
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v10 = [v8 row];
    BOOL v11 = v10 == [(NSMutableArray *)self->_transitPasses count];
  }
LABEL_7:

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_useOldAppearance)
  {
    if (self->_userAutomaticExpressModeText) {
      id v7 = @"SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE";
    }
    else {
      id v7 = @"SETTINGS_EXPRESS_TRANSIT_CARDS_SECTION_HEADER";
    }
    goto LABEL_9;
  }
  unint64_t v8 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (!v8)
  {
    id v7 = @"SETTINGS_EXPRESS_TRANSIT_CARD_CATEGORY_SECTION_HEADER";
LABEL_9:
    uint64_t v9 = PKLocalizedPaymentString(&v7->isa);
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    uint64_t v9 = PKLocalizedTransitString(&cfstr_SettingsExpres_2.isa);
LABEL_10:
    uint64_t v10 = (void *)v9;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_useOldAppearance
    || (unint64_t v11 = [(PKSectionTableViewController *)self sectionForIndex:a4]) == 0)
  {
    if (self->_style == 1)
    {
      id v7 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_WATCH";
    }
    else
    {
      int IsAvailable = PKNearFieldLowPowerSupportIsAvailable();
      int v16 = PKPearlIsAvailable();
      if (IsAvailable)
      {
        if (v16) {
          id v7 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_FACEID";
        }
        else {
          id v7 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_TOUCHID";
        }
      }
      else
      {
        if (v16)
        {
          uint64_t v8 = PKLocalizedPearlString(&cfstr_SettingsTransi.isa);
          goto LABEL_5;
        }
        if (self->_userAutomaticExpressModeText) {
          id v7 = @"SETTINGS_AUTOMATIC_TRANSIT_SECTION_FOOTER";
        }
        else {
          id v7 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE";
        }
      }
    }
    uint64_t v8 = PKLocalizedPaymentString(&v7->isa);
LABEL_5:
    uint64_t v9 = (void *)v8;
    goto LABEL_6;
  }
  if (v11 == 1)
  {
    int64_t style = self->_style;
    uint64_t v13 = [(NSMutableArray *)self->_transitPasses count];
    if (style == 1)
    {
      if (v13) {
        id v14 = @"SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_WATCH";
      }
      else {
        id v14 = @"SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_WATCH_NO_TRANSIT_CARDS";
      }
    }
    else if (v13)
    {
      id v14 = @"SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER";
    }
    else if (PKPearlIsAvailable())
    {
      id v14 = @"SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_NO_TRANSIT_CARDS_PEARL";
    }
    else
    {
      id v14 = @"SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_NO_TRANSIT_CARDS";
    }
    uint64_t v8 = PKLocalizedTransitString(&v14->isa);
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_6:

  return v9;
}

- (void)_updateUIWithExpressState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKExpressPassesViewController *)self tableView];
  if ([(PKSectionTableViewController *)self isSectionMapped:1]) {
    unint64_t v4 = [(PKSectionTableViewController *)self indexForSection:1];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(PKSectionTableViewController *)self isSectionMapped:0]) {
    unint64_t v17 = [(PKSectionTableViewController *)self indexForSection:0];
  }
  else {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v3 indexPathsForVisibleRows];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 section];
        uint64_t v12 = [v10 row];
        uint64_t v13 = [v3 cellForRowAtIndexPath:v10];
        if (v11 == v4)
        {
          [(PKExpressPassesViewController *)self _configureAccessoryViewForPaymentCardCell:v13 row:v12];
        }
        else if (v11 == v17)
        {
          BOOL v14 = [(PKExpressPassesViewController *)self _isTransitExpressRowEnabledForIndex:v12];
          [v13 setActivityIndicatorActive:0];
          if (v12 != [(NSMutableArray *)self->_transitPasses count] || !v14)
          {
            [v13 setAccessoryType:0];
            int v16 = [v13 actionSwitch];
            [v16 setOn:v14 animated:1];
          }
          else
          {
            [v13 setAccessoryType:3];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (BOOL)_shouldShowSelectionDisclosureForPass:(id)a3
{
  return 0;
}

- (void)_configureAccessoryViewForPaymentCardCell:(id)a3 row:(int64_t)a4
{
  id v6 = a3;
  int64_t selectedPaymentPassIndex = self->_selectedPaymentPassIndex;
  id v14 = v6;
  if (selectedPaymentPassIndex == a4 && self->_selectedPaymentPassIsInPendingState)
  {
    BOOL v8 = [(NSMutableArray *)self->_paymentPasses count] == a4;
    id v6 = v14;
    int v9 = !v8;
  }
  else
  {
    int v9 = 0;
  }
  if (selectedPaymentPassIndex == a4) {
    int v10 = v9;
  }
  else {
    int v10 = 1;
  }
  objc_msgSend(v6, "setActivityIndicatorActive:");
  uint64_t v11 = [v14 pass];
  if ([(PKExpressPassesViewController *)self _shouldShowSelectionDisclosureForPass:v11])
  {
    [v14 setAccessoryViewType:2];
    if (v10)
    {
      uint64_t v12 = PKLocalizedPaymentString(&cfstr_ExpressPayment_0.isa);
      [v14 setDisclosureString:v12];
    }
    else
    {
      [v14 setDisclosureString:self->_selectedPaymentPassDisclosureString];
    }
  }
  else
  {
    [v14 setAccessoryViewType:0];
    if (v10) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 3;
    }
    [v14 setAccessoryType:v13];
  }
}

- (void)_setUserInteractionsEnabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_isUserInteractionsEnabled ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_isUserInteractionsEnabled = a3;
    unint64_t v4 = [(PKExpressPassesViewController *)self tableView];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v4, "visibleCells", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setUserInteractionEnabled:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)_conflictingPassesForPass:(id)a3 useCaseWithPasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke;
  aBlock[3] = &unk_1E59D1778;
  id v9 = v8;
  id v17 = v9;
  long long v10 = _Block_copy(aBlock);
  if (([v6 isTransitPass] & 1) == 0 && (objc_msgSend(v6, "isAccessPass") & 1) == 0) {
    [(NSMutableArray *)self->_paymentPasses enumerateObjectsUsingBlock:v10];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke_2;
  v14[3] = &unk_1E59D17A0;
  id v15 = v9;
  id v11 = v9;
  long long v12 = [v7 objectsPassingTest:v14];

  return v12;
}

void __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueID];
  [v2 addObject:v3];
}

uint64_t __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)_acquireUserAuthForPass:(id)a3 withCompletion:(id)a4
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    if (self->_LAContext)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Received auth request with pending auth request present.", buf, 2u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      objc_storeStrong((id *)&self->_LAContext, v9);
      if (self->_userAutomaticExpressModeText) {
        long long v10 = @"TRANSIT_AUTOMATIC_AUTHENTICATION_REASON";
      }
      else {
        long long v10 = @"TRANSIT_EXPRESS_AUTHENTICATION_REASON";
      }
      id v11 = PKLocalizedPaymentString(&v10->isa);
      v24[0] = &unk_1EF2B8DC0;
      long long v12 = PKLocalizedPaymentString(&cfstr_TransitExpress_0.isa);
      v25[0] = v12;
      v24[1] = &unk_1EF2B8DD8;
      long long v13 = [v6 localizedDescription];
      id v14 = PKStringWithValidatedFormat();
      v25[1] = v14;
      id v24[2] = &unk_1EF2B8DF0;
      id v15 = PKLocalizedString(&cfstr_Wallet_0.isa);
      v24[3] = &unk_1EF2B8E08;
      v25[2] = v15;
      v25[3] = MEMORY[0x1E4F1CC38];
      int v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 4, v13);

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke;
      v18[3] = &unk_1E59D17C8;
      objc_copyWeak(&v21, &location);
      id v17 = v9;
      id v19 = v17;
      id v20 = v7;
      [v17 evaluatePolicy:2 options:v16 reply:v18];

      objc_destroyWeak(&v21);
    }
    objc_destroyWeak(&location);
  }
}

void __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke_2;
    block[3] = &unk_1E59CD0E0;
    id v10 = v5;
    id v11 = v6;
    id v12 = a1[4];
    id v8 = a1[5];
    id v13 = WeakRetained;
    id v14 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 48) externalizedContext];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v4 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v3 = v4;
  if (!v4)
  {
    [*(id *)(a1 + 56) _invalidateUserAuth];
    id v3 = 0;
  }
}

- (void)_invalidateUserAuth
{
  LAContext = self->_LAContext;
  if (LAContext)
  {
    [LAContext invalidate];
    id v4 = self->_LAContext;
    self->_LAContext = 0;
  }
}

- (id)_transformState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "passUniqueIdentifier", (void)v14);
          if (v11) {
            [v4 setObject:v10 forKey:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    id v12 = (void *)[v4 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_transitUpdateWithState:(id)a3
{
  [(PKExpressPassesViewController *)self _updateExpressState:a3];
  [(PKExpressPassesViewController *)self _updateUIWithExpressState];
  [(PKExpressPassesViewController *)self _sendExpressPassDidChangeNotification];
  if (![(PKSectionTableViewController *)self isSectionMapped:0])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update express pass UI", v5, 2u);
    }
  }
}

- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uniqueID];
  id v9 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__12;
  v35[4] = __Block_byref_object_dispose__12;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__12;
  void v33[4] = __Block_byref_object_dispose__12;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__12;
  v31[4] = __Block_byref_object_dispose__12;
  id v32 = 0;
  id v10 = [v6 devicePrimaryPaymentApplication];
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v9);
    paymentDataProvider = self->_paymentDataProvider;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    id v26[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke;
    v26[3] = &unk_1E59D17F0;
    long long v30 = v35;
    id v27 = v10;
    id v28 = v6;
    long long v29 = v9;
    [(PKPaymentDataProvider *)paymentDataProvider transitStateWithPassUniqueIdentifier:v8 paymentApplication:v27 completion:v26];
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v9);
    id v12 = self->_paymentDataProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_2;
    v23[3] = &unk_1E59D1818;
    uint64_t v25 = v33;
    unint64_t v24 = v9;
    [(PKPaymentDataProvider *)v12 balancesForPaymentPassWithUniqueIdentifier:v8 completion:v23];
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v9);
    id v13 = self->_paymentDataProvider;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_3;
    v20[3] = &unk_1E59CC5A8;
    int v22 = v31;
    id v21 = v9;
    [(PKPaymentDataProvider *)v13 plansForPaymentPassWithUniqueIdentifier:v8 completion:v20];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_4;
  block[3] = &unk_1E59D1840;
  id v16 = v7;
  long long v17 = v33;
  long long v18 = v35;
  uint64_t v19 = v31;
  id v14 = v7;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = a1[6];

  dispatch_group_leave(v6);
}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_4(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

- (void)_updatePaymentCardCellWithIndex:(int64_t)a3 statusString:(id)a4
{
  id v9 = a4;
  id v6 = [(PKExpressPassesViewController *)self tableView];
  id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 1));
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setSubtitleOverrideString:v9];
  }
}

- (id)_paymentPassForIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_paymentPasses count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_paymentPasses objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_transitPassForIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_transitPasses count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_transitPasses objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (int64_t)_sectionForPass:(id)a3
{
  int64_t result = 1;
  if (a3)
  {
    if (!self->_useOldAppearance) {
      return [a3 isTransitPass] ^ 1;
    }
  }
  return result;
}

- (BOOL)_isTransitExpressRowEnabledForIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_transitPasses count];
  selectedTransitPassIndices = self->_selectedTransitPassIndices;
  if (v5 <= a3) {
    return [(NSMutableArray *)selectedTransitPassIndices count] == 0;
  }
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [(NSMutableArray *)selectedTransitPassIndices containsObject:v7];

  return v8;
}

- (void)_reloadLocalPassStores
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  transitPasses = self->_transitPasses;
  self->_transitPasses = v3;

  unint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  selectedTransitPassIndices = self->_selectedTransitPassIndices;
  self->_selectedTransitPassIndices = v5;

  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  paymentPasses = self->_paymentPasses;
  self->_paymentPasses = v7;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = self->_passes;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isAccessPass", (void)v17) & 1) == 0
          && (([(PKExpressPassController *)self->_expressPassController isExpressModeSupportedForPass:v14] & 1) != 0|| [(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:v14]))
        {
          if (![v14 isTransitPass]
            || (p_paymentPasses = &self->_transitPasses, self->_useOldAppearance))
          {
            p_paymentPasses = &self->_paymentPasses;
          }
          [(NSMutableArray *)*p_paymentPasses addObject:v14];
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_transitPasses sortUsingComparator:&__block_literal_global_65];
  [(NSMutableArray *)self->_paymentPasses sortUsingComparator:&__block_literal_global_65];
  id v16 = [(PKExpressPassController *)self->_expressPassController enabledExpressPasses];
  [(PKExpressPassesViewController *)self _updateExpressState:v16];
}

uint64_t __55__PKExpressPassesViewController__reloadLocalPassStores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 localizedName];
  id v7 = [v5 localizedName];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    id v9 = [v4 serialNumber];
    uint64_t v10 = [v5 serialNumber];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (void)_updateExpressState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSMutableArray *)self->_paymentPasses count];
  self->_int64_t selectedPaymentPassIndex = v5;
  self->_selectedPaymentPassIsInPendingState = 0;
  if (v5 >= 1)
  {
    int64_t v6 = v5;
    int64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(NSMutableArray *)self->_paymentPasses objectAtIndexedSubscript:v7];
      id v9 = [v8 uniqueID];
      uint64_t v10 = [v4 objectForKey:v9];

      if (v10) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_11;
      }
    }
    if (self->_selectedPaymentPassIndex != v6)
    {
      uint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Multiple payment passes are marked as express!", v18, 2u);
      }
    }
    self->_int64_t selectedPaymentPassIndex = v7;
  }
LABEL_11:
  [(NSMutableArray *)self->_selectedTransitPassIndices removeAllObjects];
  if ([(NSMutableArray *)self->_transitPasses count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [(NSMutableArray *)self->_transitPasses objectAtIndexedSubscript:v12];
      id v14 = [v13 uniqueID];
      long long v15 = [v4 objectForKey:v14];

      if (v15)
      {
        selectedTransitPassIndices = self->_selectedTransitPassIndices;
        long long v17 = [NSNumber numberWithInteger:v12];
        [(NSMutableArray *)selectedTransitPassIndices addObject:v17];
      }
      ++v12;
    }
    while (v12 < [(NSMutableArray *)self->_transitPasses count]);
  }
}

- (unsigned)_beginPassUpdateSuppression
{
  self->_supressHandlingPassUpdates = 1;
  unsigned int v2 = self->_supressHandlingPassUpdateCounter + 1;
  self->_supressHandlingPassUpdateCounter = v2;
  return v2;
}

- (void)_endPassUpdateSuppressionWithToken:(unsigned int)a3 delay:(double)a4
{
  objc_initWeak(&location, self);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__endPassUpdateSuppressionWithToken_delay___block_invoke;
  block[3] = &unk_1E59D1888;
  objc_copyWeak(&v8, &location);
  unsigned int v9 = a3;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__PKExpressPassesViewController__endPassUpdateSuppressionWithToken_delay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_DWORD *)(a1 + 40) == *((_DWORD *)WeakRetained + 295)) {
    WeakRetained[1177] = 0;
  }
}

- (id)_expressEnableFailureAlertWithRetryIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (self->_style == 1)
  {
    dispatch_time_t v6 = 0;
  }
  else
  {
    int64_t v7 = (void *)MEMORY[0x1E4FB1418];
    if (v4)
    {
      id v8 = PKLocalizedPaymentString(&cfstr_SettingsExpres_15.isa);
      unsigned int v9 = PKLocalizedPaymentString(&cfstr_SettingsExpres_14.isa);
      dispatch_time_t v6 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

      uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      unint64_t v24 = __78__PKExpressPassesViewController__expressEnableFailureAlertWithRetryIndexPath___block_invoke;
      uint64_t v25 = &unk_1E59CB218;
      long long v26 = self;
      id v27 = v5;
      unint64_t v12 = [v10 actionWithTitle:v11 style:0 handler:&v22];
      objc_msgSend(v6, "addAction:", v12, v22, v23, v24, v25, v26);

      id v13 = (void *)MEMORY[0x1E4FB1410];
      id v14 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
      long long v15 = [v13 actionWithTitle:v14 style:1 handler:0];
      [v6 addAction:v15];
    }
    else
    {
      id v16 = PKLocalizedPaymentString(&cfstr_SettingsExpres_13.isa);
      long long v17 = PKLocalizedPaymentString(&cfstr_SettingsExpres_14.isa);
      dispatch_time_t v6 = [v7 alertControllerWithTitle:v16 message:v17 preferredStyle:1];

      long long v18 = (void *)MEMORY[0x1E4FB1410];
      long long v19 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      long long v20 = [v18 actionWithTitle:v19 style:0 handler:0];
      [v6 addAction:v20];
    }
  }

  return v6;
}

uint64_t __78__PKExpressPassesViewController__expressEnableFailureAlertWithRetryIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userChangedExpressSettingForPaymentPassAtIndexPath:*(void *)(a1 + 40)];
}

- (void)_beginReporting
{
  unsigned int v2 = (void *)MEMORY[0x1E4F843E0];
  id v3 = [(PKExpressPassesViewController *)self _reportingSubject];
  [v2 beginSubjectReporting:v3];
}

- (void)_endReporting
{
  unsigned int v2 = (void *)MEMORY[0x1E4F843E0];
  id v3 = [(PKExpressPassesViewController *)self _reportingSubject];
  [v2 endSubjectReporting:v3];
}

- (void)_reportExpressModeEnable:(id)a3 conflictingPasses:(id)a4
{
}

- (void)_reportExpressModeEnableFailed:(id)a3
{
}

- (void)_reportExpressModeDisable:(id)a3
{
}

- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4 conflictingPasses:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PKExpressPassesViewController *)self _beginReporting];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v63 = v8;
  [v11 safelySetObject:v8 forKey:*MEMORY[0x1E4F86308]];
  [v11 setObject:*MEMORY[0x1E4F86ED8] forKey:*MEMORY[0x1E4F86730]];
  if (self->_style == 1) {
    unint64_t v12 = (void *)MEMORY[0x1E4F86B28];
  }
  else {
    unint64_t v12 = (void *)MEMORY[0x1E4F86B48];
  }
  [v11 setObject:*v12 forKey:*MEMORY[0x1E4F86B38]];
  if ([v10 count])
  {
    id v62 = v9;
    id v13 = self;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v15 = v10;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v65;
      uint64_t v20 = *MEMORY[0x1E4F86DF0];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "organizationName", v62);
          uint64_t v23 = (void *)v22;
          if (v22) {
            uint64_t v24 = v22;
          }
          else {
            uint64_t v24 = v20;
          }
          [v14 addObject:v24];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v18);
    }

    uint64_t v25 = [v14 componentsJoinedByString:@"|"];
    [v11 setObject:v25 forKey:*MEMORY[0x1E4F862A0]];

    id v10 = v15;
    self = v13;
    id v9 = v62;
  }
  objc_msgSend(v9, "devicePaymentApplications", v62);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v69;
    while (2)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v69 != v31) {
          objc_enumerationMutation(v27);
        }
        id v33 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        if (v30 && v30 != [*(id *)(*((void *)&v68 + 1) + 8 * j) paymentType])
        {

          id v34 = @"multiple";
          goto LABEL_28;
        }
        uint64_t v30 = [v33 paymentType];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  PKPaymentMethodTypeToString();
  id v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  [v11 safelySetObject:v34 forKey:*MEMORY[0x1E4F86858]];
  id v35 = v11;
  id v36 = v9;
  id v37 = v36;
  if (v36 && v35)
  {
    uint64_t v38 = [v36 passType];
    id v39 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v38 + 1) >= 3) {
      v40 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      v40 = off_1E59D18A8[v38 + 1];
    }
    [v35 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v41 = [v37 style];
    if (v41 < 0xD && ((0x13FFu >> v41) & 1) != 0) {
      v42 = off_1E59D18C0[v41];
    }
    else {
      v42 = (__CFString *)*v39;
    }
    [v35 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    v43 = [v37 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v35 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v45 = v37;
    if ([v45 passType] == 1)
    {
      id v46 = [v45 secureElementPass];
      unint64_t v47 = [v46 cardType];
      if (v47 <= 4) {
        id v44 = (__CFString *)**((id **)&unk_1E59D1928 + v47);
      }
    }
    else
    {
      id v44 = @"other";
    }

    [v35 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    id v48 = [v45 secureElementPass];
    if ([v48 isIdentityPass])
    {
      uint64_t v49 = [v48 identityType];
      if ((unint64_t)(v49 - 1) < 3)
      {
        id v50 = off_1E59D1950[v49 - 1];
        goto LABEL_49;
      }
    }
    else if ([v48 isAccessPass])
    {
      unint64_t v51 = [v48 accessType];
      if (v51 < 7)
      {
        id v50 = off_1E59D1968[v51];
        goto LABEL_49;
      }
    }
    id v50 = (__CFString *)*v39;
LABEL_49:

    [v35 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    v52 = [v45 secureElementPass];
    v53 = [v52 devicePaymentApplications];
    [v53 count];

    v54 = PKAnalyticsReportSwitchToggleResultValue();

    [v35 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    v55 = [v45 secureElementPass];
    id v56 = *v39;
    v57 = [v55 organizationName];
    if ([v57 length])
    {
      unint64_t v58 = [v55 cardType];
      if (v58 <= 4 && ((1 << v58) & 0x16) != 0)
      {
        id v59 = v57;

        id v56 = v59;
      }
    }

    [v35 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
  }

  v60 = (void *)MEMORY[0x1E4F843E0];
  v61 = [(PKExpressPassesViewController *)self _reportingSubject];
  [v60 subject:v61 sendEvent:v35];

  [(PKExpressPassesViewController *)self _endReporting];
}

- (id)_reportingSubject
{
  return (id)*MEMORY[0x1E4F87070];
}

- (NSArray)passes
{
  return self->_passes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_selectedPaymentPassDisclosureString, 0);
  objc_storeStrong((id *)&self->_passUniqueIDToTransitBalanceModels, 0);
  objc_storeStrong((id *)&self->_passUniqueIDToCell, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_allPasses, 0);
  objc_storeStrong((id *)&self->_paymentPasses, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_selectedTransitPassIndices, 0);

  objc_storeStrong((id *)&self->_transitPasses, 0);
}

@end