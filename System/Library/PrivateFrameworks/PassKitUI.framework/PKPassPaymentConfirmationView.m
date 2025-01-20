@interface PKPassPaymentConfirmationView
- (BOOL)_canDisplaySecondaryView;
- (BOOL)_isExpressOutstanding;
- (BOOL)_isRegisteredForAllExpressTransactionNotifications;
- (BOOL)_isRegisteredForAnyExpressTransactionNotifications;
- (BOOL)_shouldDisplayPrimaryView;
- (BOOL)_shouldDisplaySecondaryView;
- (PKPassPaymentConfirmationView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5;
- (id)_expressNotificationNames;
- (id)_findOrCreatePrimaryAdjustableSingleCellView;
- (id)_findOrCreatePrimaryFusedDoubleCellView;
- (id)_findOrCreateSecondaryView;
- (id)_groupTileForTiles:(id)a3;
- (void)_beginResolution;
- (void)_disableActivityTimer;
- (void)_handleExpressNotification:(id)a3;
- (void)_presentCheckmarkIfNecessary;
- (void)_registerForExpressTransactionNotifications:(BOOL)a3;
- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5;
- (void)_reloadTiles;
- (void)_resolveActivityIfNecessary;
- (void)_resolveActivityIfNecessaryWithDelay;
- (void)_updateContentPrimaryView;
- (void)_updateContentSecondaryView;
- (void)dealloc;
- (void)didBecomeHiddenAnimated:(BOOL)a3;
- (void)didBecomeVisibleAnimated:(BOOL)a3;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)willBecomeHiddenAnimated:(BOOL)a3;
- (void)willBecomeVisibleAnimated:(BOOL)a3;
@end

@implementation PKPassPaymentConfirmationView

- (PKPassPaymentConfirmationView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v74.receiver = self;
  v74.super_class = (Class)PKPassPaymentConfirmationView;
  v11 = [(PKPassFooterContentView *)&v74 initWithPass:v8 presentationContext:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_passView, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v12];
    paymentService = v12->_paymentService;
    v12->_paymentService = (PKPaymentService *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredExpressObservers = v12->_registeredExpressObservers;
    v12->_registeredExpressObservers = v15;

    v12->_transactionType = [v10 standaloneTransactionType];
    [(PKPassPaymentConfirmationView *)v12 _registerForExpressTransactionNotifications:1];
    uint64_t v17 = [(PKPaymentService *)v12->_paymentService outstandingExpressTransactionState];
    expressState = v12->_expressState;
    v12->_expressState = (PKExpressTransactionState *)v17;

    if (![(PKPassPaymentConfirmationView *)v12 _isExpressOutstanding]
      || ![(PKPassPaymentConfirmationView *)v12 _isRegisteredForAllExpressTransactionNotifications])
    {
      [(PKPassPaymentConfirmationView *)v12 _registerForExpressTransactionNotifications:0];
      v19 = v12->_expressState;
      if (!v19)
      {
        uint64_t v20 = [MEMORY[0x1E4F846E8] create];
        v21 = v12->_expressState;
        v12->_expressState = (PKExpressTransactionState *)v20;

        v19 = v12->_expressState;
      }
      if ([(PKExpressTransactionState *)v19 isProcessing]) {
        [(PKExpressTransactionState *)v12->_expressState resolve];
      }
    }
    v22 = objc_msgSend(v8, "paymentPass", v10);
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v22];
    transitBalanceModel = v12->_transitBalanceModel;
    v12->_transitBalanceModel = (PKTransitBalanceModel *)v23;

    v47 = [v22 devicePrimaryPaymentApplication];
    id v45 = v9;
    id v46 = v8;
    if ((unint64_t)([(PKPassFooterContentView *)v12 style] - 1) >= 3) {
      int v25 = [v22 isStoredValuePass];
    }
    else {
      int v25 = 0;
    }
    v26 = [v22 uniqueID];
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x3032000000;
    v72[3] = __Block_byref_object_copy__52;
    v72[4] = __Block_byref_object_dispose__52;
    id v73 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__52;
    v70[4] = __Block_byref_object_dispose__52;
    id v71 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = __Block_byref_object_copy__52;
    v68[4] = __Block_byref_object_dispose__52;
    id v69 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__52;
    v66[4] = __Block_byref_object_dispose__52;
    id v67 = 0;
    objc_initWeak(&location, v12);
    v27 = dispatch_group_create();
    v28 = v27;
    if (v25)
    {
      dispatch_group_enter(v27);
      v29 = v12->_paymentService;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke;
      v60[3] = &unk_1E59D17F0;
      v64 = v70;
      id v61 = v47;
      id v62 = v22;
      v30 = v28;
      v63 = v30;
      [(PKPaymentService *)v29 transitStateWithPassUniqueIdentifier:v26 paymentApplication:v61 completion:v60];
      dispatch_group_enter(v30);
      v31 = v12->_paymentService;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_2;
      v57[3] = &unk_1E59D1818;
      v59 = v68;
      v32 = v30;
      v58 = v32;
      [(PKPaymentService *)v31 balancesForPaymentPassWithUniqueIdentifier:v26 completion:v57];
      dispatch_group_enter(v32);
      v33 = v12->_paymentService;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_3;
      v54[3] = &unk_1E59CC5A8;
      v56 = v66;
      v55 = v32;
      [(PKPaymentService *)v33 plansForPaymentPassWithUniqueIdentifier:v26 completion:v54];
    }
    dispatch_group_enter(v28);
    v34 = v12->_paymentService;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_4;
    v50[3] = &unk_1E59DC990;
    v52 = v72;
    objc_copyWeak(&v53, &location);
    v35 = v28;
    v51 = v35;
    [(PKPaymentService *)v34 tilesForPassWithUniqueIdentifier:v26 context:1 completion:v50];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_5;
    block[3] = &unk_1E59DC9B8;
    objc_copyWeak(&v49, &location);
    block[4] = v70;
    block[5] = v68;
    block[6] = v66;
    block[7] = v72;
    dispatch_group_notify(v35, MEMORY[0x1E4F14428], block);
    v36 = [[PKPassPaymentPayStateView alloc] initWithStyle:[(PKPassFooterContentView *)v12 style]];
    payStateView = v12->_payStateView;
    v12->_payStateView = v36;

    uint64_t v38 = [v22 isAccessPass];
    [(PKPassPaymentPayStateView *)v12->_payStateView setAccessPass:v38];
    v39 = v12->_payStateView;
    if (v38) {
      BOOL v40 = [v22 accessType] == 3;
    }
    else {
      BOOL v40 = 0;
    }
    [(PKPassPaymentPayStateView *)v39 setHomeKeyPass:v40];
    [(PKPassPaymentPayStateView *)v12->_payStateView setDelegate:v12];
    [(PKPassPaymentPayStateView *)v12->_payStateView setAlpha:1.0];
    v41 = [(PKPassPaymentPayStateView *)v12->_payStateView glyph];
    [v41 setState:6 animated:0 completionHandler:0];

    [(PKPassPaymentConfirmationView *)v12 addSubview:v12->_payStateView];
    v42 = [(PKPassFooterContentView *)v12 bottomRule];
    [v42 setAlpha:0.0];

    [(PKPassFooterContentView *)v12 setInfoButtonAlpha:0.0];
    objc_destroyWeak(&v49);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
    _Block_object_dispose(v66, 8);

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);

    _Block_object_dispose(v72, 8);
    id v9 = v45;
    id v8 = v46;
    id v10 = v44;
  }

  return v12;
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  v6 = a1[6];

  dispatch_group_leave(v6);
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained _groupTileForTiles:v4];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v9);
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[77] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    [v3[77] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v3[77] updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    objc_storeStrong(v3 + 76, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    [v3 _updateContentPrimaryView];
    [v3 _updateContentSecondaryView];
    id WeakRetained = v3;
  }
}

- (id)_groupTileForTiles:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [v4 metadata];
    if ([v5 isGroupType]) {
      objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_197);
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4F848D8] _createDefaultDashboardGroupTileWithChildTiles:v3];
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_197);
  }

  return v6;
}

BOOL __52__PKPassPaymentConfirmationView__groupTileForTiles___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 prearmTiles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_reloadTiles
{
  objc_initWeak(&location, self);
  paymentService = self->_paymentService;
  id v4 = [(PKPassFooterContentView *)self paymentPass];
  v5 = [v4 uniqueID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke;
  v6[3] = &unk_1E59CF060;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [(PKPaymentService *)paymentService tilesForPassWithUniqueIdentifier:v5 context:1 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained _groupTileForTiles:v3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke_2;
    v8[3] = &unk_1E59CA870;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    id v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 608), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _updateContentPrimaryView];
}

- (id)_findOrCreatePrimaryAdjustableSingleCellView
{
  singleValueCellPrimary = self->_singleValueCellPrimary;
  if (!singleValueCellPrimary)
  {
    id v4 = [PKAdjustableSingleCellView alloc];
    v5 = -[PKAdjustableSingleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_singleValueCellPrimary;
    self->_singleValueCellPrimary = v5;

    [(PKPaymentDashboardCellActionHandleable *)self->_singleValueCellPrimary setAlpha:0.0];
    [(PKPassPaymentConfirmationView *)self addSubview:self->_singleValueCellPrimary];
    singleValueCellPrimary = self->_singleValueCellPrimary;
  }

  return singleValueCellPrimary;
}

- (id)_findOrCreatePrimaryFusedDoubleCellView
{
  dualValueCellPrimary = self->_dualValueCellPrimary;
  if (!dualValueCellPrimary)
  {
    id v4 = [PKFusedDoubleCellView alloc];
    v5 = -[PKFusedDoubleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_dualValueCellPrimary;
    self->_dualValueCellPrimary = v5;

    [(PKPaymentDashboardCellActionHandleable *)self->_dualValueCellPrimary setAlpha:0.0];
    [(PKPassPaymentConfirmationView *)self addSubview:self->_dualValueCellPrimary];
    dualValueCellPrimary = self->_dualValueCellPrimary;
  }

  return dualValueCellPrimary;
}

- (id)_findOrCreateSecondaryView
{
  singleValueCellSecondary = self->_singleValueCellSecondary;
  if (!singleValueCellSecondary)
  {
    id v4 = [PKAdjustableSingleCellView alloc];
    v5 = -[PKAdjustableSingleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_singleValueCellSecondary;
    self->_singleValueCellSecondary = v5;

    [(PKPaymentDashboardCellActionHandleable *)self->_singleValueCellSecondary setAlpha:0.0];
    [(PKPassPaymentConfirmationView *)self addSubview:self->_singleValueCellSecondary];
    singleValueCellSecondary = self->_singleValueCellSecondary;
  }

  return singleValueCellSecondary;
}

- (BOOL)_shouldDisplayPrimaryView
{
  if ((unint64_t)([(PKPassFooterContentView *)self style] - 1) >= 3)
  {
    id v3 = [(PKPassFooterContentView *)self paymentPass];
    if ([v3 isStoredValuePass])
    {
      char v4 = [(PKTransitBalanceModel *)self->_transitBalanceModel hasBalanceContent];

      if (v4) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (BOOL)_canDisplaySecondaryView
{
  return (unint64_t)([(PKPassFooterContentView *)self style] - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldDisplaySecondaryView
{
  BOOL v3 = [(PKPassPaymentConfirmationView *)self _canDisplaySecondaryView];
  if (v3)
  {
    char v4 = [(PKPassFooterContentView *)self paymentPass];
    if ([v4 isTransitPass])
    {
      char v5 = [(PKTransitBalanceModel *)self->_transitBalanceModel hasCommutePlanContent];

      if (v5)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else
    {
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_updateContentPrimaryView
{
  if ([(PKTransitBalanceModel *)self->_transitBalanceModel hasBalanceContent])
  {
    v39 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableBalances];
    uint64_t v3 = [(UIView *)v39 count];
    unint64_t v4 = v3;
    if (v3 == 1)
    {
      char v5 = [(PKPassPaymentConfirmationView *)self _findOrCreatePrimaryAdjustableSingleCellView];
    }
    else
    {
      if (!v3)
      {
LABEL_11:
        id v10 = [(UIView *)self->_displayedCellPrimary layer];
        v11 = [v10 presentationLayer];
        v12 = v11;
        if (!v11) {
          v11 = v10;
        }
        [v11 opacity];
        float v15 = v14;

        unint64_t v16 = v4 - 1;
        if (v4 == 1)
        {
          uint64_t v17 = [(UIView *)v39 objectAtIndexedSubscript:0];
          v18 = self->_displayedCellPrimary;
          [(UIView *)v18 setAlpha:1.0];
          [(UIView *)v18 beginUpdates];
          [(UIView *)v18 setEnableDisclosure:0];
          v19 = [(PKPassFooterContentView *)self paymentPass];
          [(UIView *)v18 setPass:v19];

          uint64_t v20 = [(UIView *)v17 localizedTitle];
          if (v20)
          {
            [(UIView *)v18 setTitle:v20];
          }
          else
          {
            uint64_t v23 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
            [(UIView *)v18 setTitle:v23];
          }
          BOOL v24 = v15 > 0.0;

          int v25 = [(UIView *)v17 formattedValue];
          [(UIView *)v18 setDetail:v25];

          [(UIView *)v18 setSubDetail:0];
          v26 = v18;
        }
        else
        {
          if (v4 == 2)
          {
            uint64_t v17 = self->_displayedCellPrimary;
            [(UIView *)v17 setAlpha:1.0];
            [(UIView *)v17 beginUpdates];
            v18 = [(UIView *)v39 objectAtIndexedSubscript:0];
            v21 = [(UIView *)v18 localizedTitle];
            if (v21)
            {
              [(UIView *)v17 setLeftTitle:v21];
            }
            else
            {
              v27 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
              [(UIView *)v17 setLeftTitle:v27];
            }
            v28 = [(UIView *)v18 formattedValue];
            [(UIView *)v17 setLeftDetail:v28];

            [(UIView *)v17 setLeftSubDetail:0];
            v29 = [(UIView *)v39 objectAtIndexedSubscript:1];
            v30 = [v29 localizedTitle];
            if (v30)
            {
              [(UIView *)v17 setRightTitle:v30];
            }
            else
            {
              v31 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
              [(UIView *)v17 setRightTitle:v31];
            }
            v32 = [v29 formattedValue];
            [(UIView *)v17 setRightDetail:v32];

            [(UIView *)v17 setRightSubDetail:0];
            v33 = [(PKPassFooterContentView *)self paymentPass];
            [(UIView *)v17 setPass:v33];

            [(UIView *)v17 setEnableDisclosure:0];
            [(UIView *)v17 endUpdates:v15 > 0.0];

            goto LABEL_33;
          }
          if (v4 < 3)
          {
LABEL_34:
            uint64_t v13 = v39;
            goto LABEL_35;
          }
          uint64_t v17 = self->_displayedCellPrimary;
          [(UIView *)v17 setAlpha:1.0];
          [(UIView *)v17 beginUpdates];
          v18 = [(UIView *)v39 objectAtIndexedSubscript:0];
          v22 = [(UIView *)v18 localizedTitle];
          if (v22)
          {
            [(UIView *)v17 setLeftTitle:v22];
          }
          else
          {
            v34 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
            [(UIView *)v17 setLeftTitle:v34];
          }
          BOOL v24 = v15 > 0.0;

          v35 = [(UIView *)v18 formattedValue];
          [(UIView *)v17 setLeftDetail:v35];

          [(UIView *)v17 setLeftSubDetail:0];
          v36 = PKLocalizedPaymentString(&cfstr_PropertySummar_0.isa);
          [(UIView *)v17 setRightTitle:v36];

          v37 = PKLocalizedPaymentString(&cfstr_PropertySummar_1.isa, &cfstr_Lu.isa, v16);
          [(UIView *)v17 setRightDetail:v37];

          [(UIView *)v17 setRightSubDetail:0];
          uint64_t v38 = [(PKPassFooterContentView *)self paymentPass];
          [(UIView *)v17 setPass:v38];

          [(UIView *)v17 setEnableDisclosure:0];
          v26 = v17;
        }
        [(UIView *)v26 endUpdates:v24];
LABEL_33:

        goto LABEL_34;
      }
      char v5 = [(PKPassPaymentConfirmationView *)self _findOrCreatePrimaryFusedDoubleCellView];
    }
    displayedCellPrimary = self->_displayedCellPrimary;
    self->_displayedCellPrimary = v5;

    goto LABEL_11;
  }
  if (!self->_groupTile)
  {
    uint64_t v13 = self->_displayedCellPrimary;
    self->_displayedCellPrimary = 0;
LABEL_35:

    return;
  }
  tileGroupView = self->_tileGroupView;
  if (!tileGroupView)
  {
    id v7 = objc_alloc_init(PKPassTileGroupView);
    id v8 = self->_tileGroupView;
    self->_tileGroupView = v7;

    [(PKPassPaymentConfirmationView *)self addSubview:self->_tileGroupView];
    tileGroupView = self->_tileGroupView;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __58__PKPassPaymentConfirmationView__updateContentPrimaryView__block_invoke;
  v40[3] = &unk_1E59CA7D0;
  v40[4] = self;
  [(PKPassTileGroupView *)tileGroupView performBatchUpdates:v40 animated:1];
  objc_storeStrong((id *)&self->_displayedCellPrimary, self->_tileGroupView);
}

void __58__PKPassPaymentConfirmationView__updateContentPrimaryView__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _canDisplaySecondaryView])
  {
    if ([*(id *)(a1 + 32) _shouldDisplaySecondaryView]) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = (void *)v3[65];
  char v5 = [v3 paymentPass];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 480);
  uint64_t v8 = *(void *)(v6 + 608);
  v9[0] = 1;
  uint64_t v10 = v2;
  uint64_t v11 = 0;
  [v4 setPass:v5 passView:v7 groupTile:v8 context:v9 animated:0];
}

- (void)_updateContentSecondaryView
{
  if ([(PKTransitBalanceModel *)self->_transitBalanceModel hasCommutePlanContent])
  {
    uint64_t v3 = [(PKPaymentDashboardCellActionHandleable *)self->_singleValueCellSecondary layer];
    unint64_t v4 = [v3 presentationLayer];
    char v5 = v4;
    if (!v4) {
      unint64_t v4 = v3;
    }
    [v4 opacity];
    float v7 = v6;

    uint64_t v8 = [(PKPassPaymentConfirmationView *)self _findOrCreateSecondaryView];
    singleValueCellSecondary = self->_singleValueCellSecondary;
    self->_singleValueCellSecondary = v8;

    uint64_t v10 = self->_singleValueCellSecondary;
    [(PKPaymentDashboardCellActionHandleable *)v10 setAlpha:1.0];
    [(PKPaymentDashboardCellActionHandleable *)v10 beginUpdates];
    uint64_t v11 = [(PKPassFooterContentView *)self paymentPass];
    [(PKPaymentDashboardCellActionHandleable *)v10 setPass:v11];
    [(PKPaymentDashboardCellActionHandleable *)v10 setEnableDisclosure:0];
    transitBalanceModel = self->_transitBalanceModel;
    char v22 = 0;
    id v20 = 0;
    id v21 = 0;
    v19 = &stru_1EF1B5B50;
    [(PKTransitBalanceModel *)transitBalanceModel getDisplayableCommutePlanDetailsForTitle:&v21 value:&v20 subtitle:&v19 isExpired:&v22];
    id v13 = v21;
    id v14 = v20;
    float v15 = v19;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    id v16 = v13;

    id v17 = v14;
    [(PKPaymentDashboardCellActionHandleable *)v10 setTitle:v16];
    [(PKPaymentDashboardCellActionHandleable *)v10 setDetail:v17];
    [(PKPaymentDashboardCellActionHandleable *)v10 setSubDetail:v15];
    if (v22) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(PKPaymentDashboardCellActionHandleable *)v10 setSubDetailColor:v18];

    [(PKPaymentDashboardCellActionHandleable *)v10 endUpdates:v7 > 0.0];
    [(PKPassPaymentConfirmationView *)self layoutIfNeeded];
    [(PKPassPaymentConfirmationView *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  [(PKPassPaymentConfirmationView *)self _disableActivityTimer];
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  [(PKPassPaymentConfirmationView *)self _registerForExpressTransactionNotifications:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v3 dealloc];
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKPassPaymentConfirmationView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v19 layoutSubviews];
  [(PKPassPaymentConfirmationView *)self bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  double width = v20.size.width;
  CGFloat height = v20.size.height;
  memset(&slice, 0, sizeof(slice));
  CGRect remainder = v20;
  CGRectDivide(v20, &slice, &remainder, 10.0, CGRectMinYEdge);
  if ([(PKPassPaymentConfirmationView *)self _shouldDisplayPrimaryView]
    && !self->_receivedTransaction)
  {
    -[UIView sizeThatFits:](self->_displayedCellPrimary, "sizeThatFits:", width, 1.79769313e308);
    CGFloat amount = v7;
    displayedCellPrimarCGFloat y = self->_displayedCellPrimary;
    PKSizeAlignedInRect();
    -[UIView pkui_setFrame:animated:](displayedCellPrimary, "pkui_setFrame:animated:", self->_animated);
    CGRectDivide(remainder, &slice, &remainder, amount, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  if ([(PKPassPaymentConfirmationView *)self _shouldDisplaySecondaryView]
    && !self->_receivedTransaction)
  {
    -[PKPaymentDashboardCellActionHandleable sizeThatFits:](self->_singleValueCellSecondary, "sizeThatFits:", width, 1.79769313e308);
    CGFloat amounta = v9;
    singleValueCellSecondarCGFloat y = self->_singleValueCellSecondary;
    PKSizeAlignedInRect();
    -[PKPaymentDashboardCellActionHandleable pkui_setFrame:animated:](singleValueCellSecondary, "pkui_setFrame:animated:", self->_animated);
    CGRectDivide(remainder, &slice, &remainder, amounta, CGRectMinYEdge);
  }
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.CGFloat height = height;
  CGRectDivide(v21, &slice, &remainder, 10.0, CGRectMinYEdge);
  if ([(PKPassPaymentConfirmationView *)self _shouldDisplayPrimaryView])
  {
    uint64_t v11 = self->_displayedCellPrimary;
    if (v11)
    {
      [(UIView *)v11 frame];
      CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  if ([(PKPassPaymentConfirmationView *)self _shouldDisplaySecondaryView])
  {
    id v13 = self->_singleValueCellSecondary;
    if (v13)
    {
      [(PKPaymentDashboardCellActionHandleable *)v13 frame];
      CGRectDivide(remainder, &slice, &remainder, v14, CGRectMinYEdge);
    }
  }
  -[UIView pkui_setFrame:animated:](self->_payStateView, "pkui_setFrame:animated:", self->_animated, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v6 willBecomeVisibleAnimated:a3];
  unint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  visibleDate = self->_visibleDate;
  self->_visibleDate = v4;
}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v8 didBecomeVisibleAnimated:a3];
  self->_needsResolution = 1;
  if (![(PKPassPaymentConfirmationView *)self _isExpressOutstanding]) {
    goto LABEL_9;
  }
  unint64_t v4 = [(PKPaymentService *)self->_paymentService outstandingExpressTransactionState];
  expressState = self->_expressState;
  if (!v4) {
    goto LABEL_5;
  }
  if (([(PKExpressTransactionState *)expressState mergeState:v4] & 1) == 0)
  {
    expressState = self->_expressState;
LABEL_5:
    [(PKExpressTransactionState *)expressState resolve];
  }
  if (![(PKPassPaymentConfirmationView *)self _isExpressOutstanding]) {
    [(PKPassPaymentConfirmationView *)self _registerForExpressTransactionNotifications:0];
  }

LABEL_9:
  objc_super v6 = self->_expressState;
  if (v6 && ![(PKExpressTransactionState *)v6 status]) {
    [(PKPassPaymentPayStateView *)self->_payStateView setState:7 animated:1 withCompletionHandler:0];
  }
  else {
    [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PKPassPaymentConfirmationView_didBecomeVisibleAnimated___block_invoke;
  v7[3] = &unk_1E59CA7D0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v7, 0);
}

uint64_t __58__PKPassPaymentConfirmationView_didBecomeVisibleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setLabelAlpha:1.0];
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v4 willBecomeHiddenAnimated:a3];
  [(PKPaymentService *)self->_paymentService setDelegate:0];
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentConfirmationView;
  [(PKPassFooterContentView *)&v3 didBecomeHiddenAnimated:a3];
}

- (void)_presentCheckmarkIfNecessary
{
  if (!self->_needsResolution) {
    return;
  }
  uint64_t v3 = [(PKExpressTransactionState *)self->_expressState status];
  BOOL v4 = v3 == 1;
  if (!self->_showingResolution)
  {
    char v5 = (void *)(self->_resolutionCounter + 1);
    self->_resolutionCounter = (unint64_t)v5;
    self->_showingResolution = 1;
    self->_showingSuccessResolution = v4;
    self->_animatingResolution = 1;
    if (v3 == 1) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 9;
    }
    switch(v3)
    {
      case 0:
      case 2:
        double v7 = @"PAYMENT_TRY_AGAIN";
        break;
      case 1:
        goto LABEL_15;
      case 3:
        double v7 = @"PAYMENT_TRY_WITH_DIFFERENT_CARD";
        break;
      default:
        goto LABEL_18;
    }
    uint64_t v11 = PKLocalizedPaymentString(&v7->isa);
    goto LABEL_23;
  }
  if (v3 == 1 && !self->_showingSuccessResolution)
  {
    char v5 = (void *)(self->_resolutionCounter + 1);
    self->_resolutionCounter = (unint64_t)v5;
    self->_showingResolution = 1;
    self->_showingSuccessResolution = v4;
    self->_animatingResolution = 1;
    uint64_t v6 = 8;
LABEL_15:
    uint64_t v8 = [(PKExpressTransactionState *)self->_expressState standaloneTransactionType];
    if (v8 == 2)
    {
      double v9 = @"TRANSACTION_UNLOCKED";
    }
    else
    {
      if (v8 != 1)
      {
LABEL_18:
        uint64_t v10 = 0;
LABEL_24:
        objc_initWeak(&location, self);
        payStateView = self->_payStateView;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __61__PKPassPaymentConfirmationView__presentCheckmarkIfNecessary__block_invoke;
        v13[3] = &unk_1E59DBE00;
        objc_copyWeak(v14, &location);
        v14[1] = v5;
        [(PKPassPaymentPayStateView *)payStateView setState:v6 animated:1 withOverrideText:v10 preserveGlyphState:0 completionHandler:v13];
        objc_destroyWeak(v14);
        objc_destroyWeak(&location);

        return;
      }
      double v9 = @"TRANSACTION_LOCKED";
    }
    uint64_t v11 = PKLocalizedCredentialString(&v9->isa);
LABEL_23:
    uint64_t v10 = (void *)v11;
    goto LABEL_24;
  }
  if (![(PKPassPaymentConfirmationView *)self _isExpressOutstanding])
  {
    [(PKPassPaymentConfirmationView *)self _beginResolution];
  }
}

void __61__PKPassPaymentConfirmationView__presentCheckmarkIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 72) == *(void *)(a1 + 40))
    {
      *((unsigned char *)WeakRetained + 557) = 0;
      char v5 = WeakRetained;
      char v4 = [WeakRetained _isExpressOutstanding];
      uint64_t v3 = v5;
      if ((v4 & 1) == 0)
      {
        [v5 _beginResolution];
        uint64_t v3 = v5;
      }
    }
  }
}

- (void)_disableActivityTimer
{
  activityResolutionTimer = self->_activityResolutionTimer;
  if (activityResolutionTimer)
  {
    dispatch_source_cancel(activityResolutionTimer);
    char v4 = self->_activityResolutionTimer;
    self->_activityResolutionTimer = 0;
  }
}

- (void)_beginResolution
{
  if (!self->_animatingResolution && self->_needsResolution && !self->_showingAlert)
  {
    if (!self->_showingSuccessResolution
      && [(PKExpressTransactionState *)self->_expressState status] == 3
      && ([(PKPassFooterContentView *)self pass],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 paymentPass],
          char v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isTransitPass],
          v4,
          v3,
          v5))
    {
      uint64_t v6 = [(UIView *)self pkui_viewControllerFromResponderChain];
      if (v6)
      {
        self->_showingAlert = 1;
        [(PKPassPaymentConfirmationView *)self _disableActivityTimer];
        double v7 = PKLocalizedPaymentString(&cfstr_PaymentAlertIn.isa);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_PaymentAlertIn_0.isa);
        objc_initWeak(&location, self);
        double v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
        uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v11 = PKLocalizedPaymentString(&cfstr_PaymentAlertIn_1.isa);
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        float v15 = __49__PKPassPaymentConfirmationView__beginResolution__block_invoke;
        id v16 = &unk_1E59CCFF0;
        objc_copyWeak(&v17, &location);
        CGFloat v12 = [v10 actionWithTitle:v11 style:0 handler:&v13];
        objc_msgSend(v9, "addAction:", v12, v13, v14, v15, v16);

        [v6 presentViewController:v9 animated:1 completion:0];
        objc_destroyWeak(&v17);

        objc_destroyWeak(&location);
      }
      else
      {
        [(PKPassPaymentConfirmationView *)self _resolveActivityIfNecessaryWithDelay];
      }
    }
    else
    {
      [(PKPassPaymentConfirmationView *)self _resolveActivityIfNecessaryWithDelay];
    }
  }
}

void __49__PKPassPaymentConfirmationView__beginResolution__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resolveActivityIfNecessary];
    id WeakRetained = v2;
  }
}

- (void)_resolveActivityIfNecessaryWithDelay
{
  if (!self->_animatingResolution && self->_needsResolution && !self->_showingAlert)
  {
    [(PKPassPaymentConfirmationView *)self _disableActivityTimer];
    objc_initWeak(&location, self);
    if (self->_receivedTransaction)
    {
      [MEMORY[0x1E4F85060] defaultDuration];
      double v4 = v3 + 0.35;
    }
    else if (self->_receivedExit)
    {
      double v4 = 1.0;
    }
    else
    {
      double v4 = 0.5;
    }
    int v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    activityResolutionTimer = self->_activityResolutionTimer;
    self->_activityResolutionTimer = v5;

    double v7 = self->_activityResolutionTimer;
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    double v9 = self->_activityResolutionTimer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKPassPaymentConfirmationView__resolveActivityIfNecessaryWithDelay__block_invoke;
    v10[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_activityResolutionTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __69__PKPassPaymentConfirmationView__resolveActivityIfNecessaryWithDelay__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = WeakRetained[71];
    int v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      double v4 = v5[71];
      v5[71] = 0;

      id v2 = v5;
    }
    [v2 _resolveActivityIfNecessary];
    id v2 = v5;
  }
}

- (void)_resolveActivityIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsResolution)
  {
    double v3 = [(PKPassFooterContentView *)self delegate];
    uint64_t v4 = [v3 isPassFooterContentViewInGroup:self];

    self->_needsResolution = 0;
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F879B8];
    uint64_t v9 = *MEMORY[0x1E4F879C0];
    double v7 = [NSNumber numberWithBool:v4];
    v10[0] = v7;
    dispatch_time_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:v6 object:self userInfo:v8];
  }
}

- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4
{
  id v5 = a3;
  kdebug_trace();
  uint64_t v6 = [(PKPassFooterContentView *)self delegate];
  [v6 passFooterContentViewDidTransact:self success:1];

  LODWORD(self) = [v5 accessPass];
  if (self) {
    SystemSoundID v7 = 1163;
  }
  else {
    SystemSoundID v7 = 1394;
  }

  AudioServicesPlaySystemSound(v7);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentConfirmationView_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  CGFloat v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__PKPassPaymentConfirmationView_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) transactionDate];
  char v2 = [*(id *)(a1 + 40) _isExpressOutstanding];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v2 & 1) != 0 || *(unsigned char *)(v3 + 553))
  {
    if (*(void *)(v3 + 584)) {
      BOOL v4 = v8 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:");
      if (v5 <= -10.0) {
        goto LABEL_11;
      }
      uint64_t v3 = *(void *)(a1 + 40);
    }
    id v6 = [(id)v3 paymentPass];
    int v7 = [v6 hasDeviceTransactionSourceIdentifier:*(void *)(a1 + 48)];

    if (v7)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 552) = 1;
      [*(id *)(a1 + 40) _updateContentPrimaryView];
      [*(id *)(a1 + 40) _updateContentSecondaryView];
    }
  }
LABEL_11:
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) paymentPass];
  uint64_t v3 = [v2 uniqueID];
  int v4 = PKEqualObjects();

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 616) setTransitProperties:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    double v5 = *(void **)(a1 + 32);
    [v5 _updateContentSecondaryView];
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 1)
  {
    uint64_t v10 = [(PKPassFooterContentView *)self paymentPass];
    id v11 = [v10 uniqueID];
    id v12 = v8;
    id v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v12 || !v11)
      {

        goto LABEL_10;
      }
      char v14 = [v11 isEqualToString:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_10;
      }
    }
    float v15 = [(PKPassPaymentConfirmationView *)self _groupTileForTiles:v9];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__PKPassPaymentConfirmationView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    v17[3] = &unk_1E59CA870;
    v17[4] = self;
    id v18 = v15;
    id v16 = v15;
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
LABEL_10:
}

uint64_t __84__PKPassPaymentConfirmationView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 608), *(id *)(a1 + 40));
  char v2 = *(void **)(a1 + 32);

  return [v2 _updateContentPrimaryView];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) paymentPass];
  uint64_t v3 = [v2 uniqueID];
  int v4 = PKEqualObjects();

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 616) setDynamicBalances:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    double v5 = *(void **)(a1 + 32);
    [v5 _updateContentSecondaryView];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) paymentPass];
  uint64_t v3 = [v2 uniqueID];
  int v4 = PKEqualObjects();

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 616) updateWithDynamicCommutePlans:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    double v5 = *(void **)(a1 + 32);
    [v5 _updateContentSecondaryView];
  }
}

- (id)_expressNotificationNames
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F871D8];
  v7[0] = *MEMORY[0x1E4F871D0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F871C0];
  v7[2] = *MEMORY[0x1E4F871B8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F871B0];
  v7[4] = *MEMORY[0x1E4F871C8];
  void v7[5] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];

  return v5;
}

- (BOOL)_isRegisteredForAllExpressTransactionNotifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(PKPassPaymentConfirmationView *)self _expressNotificationNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(NSMutableDictionary *)self->_registeredExpressObservers objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_isRegisteredForAnyExpressTransactionNotifications
{
  return [(NSMutableDictionary *)self->_registeredExpressObservers count] != 0;
}

- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_registeredExpressObservers objectForKeyedSubscript:v11];
  if (!v10)
  {
    uint64_t v10 = [v8 addObserverForName:v11 object:0 queue:0 usingBlock:v9];
    if (v10) {
      [(NSMutableDictionary *)self->_registeredExpressObservers setObject:v10 forKeyedSubscript:v11];
    }
  }
}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (![(PKPassPaymentConfirmationView *)self _isRegisteredForAllExpressTransactionNotifications])
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke;
      aBlock[3] = &unk_1E59D8BF8;
      objc_copyWeak(&v26, &location);
      uint64_t v4 = _Block_copy(aBlock);
      uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v6 = [(PKPassPaymentConfirmationView *)self _expressNotificationNames];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(v6);
            }
            [(PKPassPaymentConfirmationView *)self _registerObserverForNotificationName:*(void *)(*((void *)&v21 + 1) + 8 * i) center:v5 handler:v4];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v7);
      }

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
  else if ([(PKPassPaymentConfirmationView *)self _isRegisteredForAnyExpressTransactionNotifications])
  {
    uint64_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [(PKPassPaymentConfirmationView *)self _expressNotificationNames];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * j);
          uint64_t v16 = [(NSMutableDictionary *)self->_registeredExpressObservers objectForKeyedSubscript:v15];
          if (v16)
          {
            [v10 removeObserver:v16];
            [(NSMutableDictionary *)self->_registeredExpressObservers removeObjectForKey:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
      }
      while (v12);
    }
  }
}

void __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleExpressNotification:*(void *)(a1 + 32)];
}

- (void)_handleExpressNotification:(id)a3
{
  id v10 = a3;
  int v4 = [(PKExpressTransactionState *)self->_expressState isProcessing];
  uint64_t v5 = v10;
  if (v4)
  {
    id v6 = [v10 name];
    if (PKEqualObjects())
    {
      [(PKExpressTransactionState *)self->_expressState receiveEvents:1];
      payStateView = self->_payStateView;
      uint64_t v8 = @"Express started";
    }
    else
    {
      if (!PKEqualObjects())
      {
        if (PKEqualObjects())
        {
          [(PKExpressTransactionState *)self->_expressState receiveEvents:256];
          [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
          payStateView = self->_payStateView;
          uint64_t v8 = @"Express ended: failure";
        }
        else
        {
          if (!PKEqualObjects())
          {
            if (PKEqualObjects())
            {
              [(PKExpressTransactionState *)self->_expressState receiveEvents:4];
              [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
              payStateView = self->_payStateView;
              uint64_t v8 = @"Express ended";
            }
            else
            {
              if (!PKEqualObjects()) {
                goto LABEL_8;
              }
              [(PKPassPaymentConfirmationView *)self _registerForExpressTransactionNotifications:0];
              [(PKExpressTransactionState *)self->_expressState resolve];
              self->_receivedExit = 1;
              [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
              payStateView = self->_payStateView;
              uint64_t v8 = @"Express exited";
            }
            goto LABEL_6;
          }
          [(PKExpressTransactionState *)self->_expressState receiveEvents:512];
          [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
          payStateView = self->_payStateView;
          uint64_t v8 = @"Express ended: incompatible";
        }
        uint64_t v9 = 1;
        goto LABEL_7;
      }
      [(PKExpressTransactionState *)self->_expressState receiveEvents:2];
      [(PKPassPaymentConfirmationView *)self _presentCheckmarkIfNecessary];
      payStateView = self->_payStateView;
      uint64_t v8 = @"Express timeout";
    }
LABEL_6:
    uint64_t v9 = 0;
LABEL_7:
    [(PKPassPaymentPayStateView *)payStateView updateDebugLabel:v8 isErrorState:v9];
LABEL_8:

    uint64_t v5 = v10;
  }
}

- (BOOL)_isExpressOutstanding
{
  expressState = self->_expressState;
  if (expressState) {
    LOBYTE(expressState) = [(PKExpressTransactionState *)expressState isProcessing];
  }
  return (char)expressState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_registeredExpressObservers, 0);
  objc_storeStrong((id *)&self->_visibleDate, 0);
  objc_storeStrong((id *)&self->_activityResolutionTimer, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_displayedCellPrimary, 0);
  objc_storeStrong((id *)&self->_tileGroupView, 0);
  objc_storeStrong((id *)&self->_dualValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_singleValueCellSecondary, 0);
  objc_storeStrong((id *)&self->_singleValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_payStateView, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end