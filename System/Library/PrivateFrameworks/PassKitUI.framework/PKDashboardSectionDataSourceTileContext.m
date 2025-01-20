@interface PKDashboardSectionDataSourceTileContext
- (BOOL)isContentLoaded;
- (NSArray)sectionIdentifiers;
- (PKDashboardSectionDataSourceDelegate)delegate;
- (PKDashboardSectionDataSourceTileContext)initWithTileContext:(int64_t)a3 forPass:(id)a4 passView:(id)a5 tileGroupID:(id)a6 overridesMaximumRows:(BOOL)a7;
- (id)footerTextItemForSectionIdentifier:(id)a3;
- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4;
- (id)titleForSectionIdentifier:(id)a3;
- (unint64_t)numberOfItemsInSection:(id)a3;
- (void)_loadTiles;
- (void)_updateWithTiles:(id)a3;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)reloadTiles;
- (void)setDelegate:(id)a3;
@end

@implementation PKDashboardSectionDataSourceTileContext

- (PKDashboardSectionDataSourceTileContext)initWithTileContext:(int64_t)a3 forPass:(id)a4 passView:(id)a5 tileGroupID:(id)a6 overridesMaximumRows:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKDashboardSectionDataSourceTileContext;
  v16 = [(PKDashboardSectionDataSourceTileContext *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_context = a3;
    objc_storeStrong((id *)&v16->_pass, a4);
    objc_storeStrong((id *)&v17->_passView, a5);
    objc_storeStrong((id *)&v17->_tileGroupID, a6);
    v17->_overridesMaximumRows = a7;
    v18 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentDataProvider = v17->_paymentDataProvider;
    v17->_paymentDataProvider = v18;

    [(PKPaymentDefaultDataProvider *)v17->_paymentDataProvider addDelegate:v17];
    uint64_t v20 = +[PKPassSemanticTileFactory sharedInstance];
    tileFactory = v17->_tileFactory;
    v17->_tileFactory = (PKPassSemanticTileFactory *)v20;

    [(PKDashboardSectionDataSourceTileContext *)v17 _loadTiles];
  }

  return v17;
}

- (void)reloadTiles
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKDashboardSectionDataSourceTileContext_reloadTiles__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PKDashboardSectionDataSourceTileContext_reloadTiles__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadTiles];
}

- (void)_loadTiles
{
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:self->_pass])
  {
    objc_initWeak(&location, self);
    tileFactory = self->_tileFactory;
    int64_t context = self->_context;
    pass = self->_pass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke;
    v11[3] = &unk_1E59CB088;
    objc_copyWeak(&v12, &location);
    v6 = [(PKPassSemanticTileFactory *)tileFactory createTilesForPass:pass context:context tileUpdateBlock:v11];
    [(PKDashboardSectionDataSourceTileContext *)self _updateWithTiles:v6];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    paymentDataProvider = self->_paymentDataProvider;
    v8 = [(PKPass *)self->_pass uniqueID];
    int64_t v9 = self->_context;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_2;
    v10[3] = &unk_1E59CB328;
    v10[4] = self;
    [(PKPaymentDefaultDataProvider *)paymentDataProvider tilesForPassWithUniqueIdentifier:v8 context:v9 completion:v10];
  }
}

void __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateWithTiles:v3];
}

void __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_3;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithTiles:*(void *)(a1 + 40)];
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_context == a5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PKDashboardSectionDataSourceTileContext_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    block[3] = &unk_1E59CA8E8;
    block[4] = self;
    id v11 = v8;
    id v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __94__PKDashboardSectionDataSourceTileContext_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _updateWithTiles:v5];
  }
}

- (void)_updateWithTiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_tileGroups;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke;
  aBlock[3] = &unk_1E59CB378;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v13 = v6;
  id v14 = self;
  v7 = (void (**)(void))_Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_3;
    v10[3] = &unk_1E59CB3E8;
    objc_copyWeak(&v11, &location);
    v10[4] = v5;
    [v9 updateSectionDataSource:self withUpdates:v7 diff:v10];

    objc_destroyWeak(&v11);
  }
  else
  {
    v7[2](v7);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(a1 + 32) count])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_2;
    v6[3] = &unk_1E59CB350;
    int v3 = *(void **)(a1 + 32);
    v6[4] = *(void *)(a1 + 40);
    uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", v6);
    uint64_t v5 = (void *)WeakRetained[7];
    WeakRetained[7] = v4;
  }
  else
  {
    uint64_t v5 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
  }

  *((unsigned char *)WeakRetained + 72) = 1;
}

uint64_t __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2) {
    return 1;
  }
  int v3 = [a2 metadata];
  uint64_t v4 = [v3 identifier];
  id v5 = v2;
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else if (v6)
  {
    uint64_t v8 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = WeakRetained[7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_5;
    v11[3] = &unk_1E59CB3C0;
    objc_copyWeak(&v12, v4);
    id v9 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldSections:v7 andNewSections:v8 sectionIdentifier:&__block_literal_global_4 sectionItemsAccessor:v11 firstSectionIndex:a2];
    objc_destroyWeak(&v12);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 metadata];
  int v3 = [v2 identifier];

  return v3;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 state];
    id v6 = [v5 stateTypeGroup];

    uint64_t v7 = [v3 tiles];
    uint64_t v8 = [v7 count];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v8)
    {
      id v10 = [v6 header];
      id v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 length];

        if (v12) {
          [v9 addObject:v11];
        }
      }
      id v13 = [MEMORY[0x1E4F29128] UUID];
      id v14 = [v13 UUIDString];
      [v9 addObject:v14];

      id v15 = [v6 footer];
      v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 length];

        if (v17) {
          [v9 addObject:v16];
        }
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(PKDashboardPassTilesItem);
  [(PKDashboardPassTilesItem *)v6 setPass:self->_pass];
  [(PKDashboardPassTilesItem *)v6 setPassView:self->_passView];
  tileGroups = self->_tileGroups;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___groupForSectionIdentifier_block_invoke;
  v11[3] = &unk_1E59CB430;
  id v12 = v5;
  id v8 = v5;
  id v9 = [(NSArray *)tileGroups pk_firstObjectPassingTest:v11];

  [(PKDashboardPassTilesItem *)v6 setGroupTile:v9];
  if (self->_overridesMaximumRows) {
    [(PKDashboardPassTilesItem *)v6 setMaximumRowsOverride:-1];
  }

  return v6;
}

- (unint64_t)numberOfItemsInSection:(id)a3
{
  id v4 = a3;
  tileGroups = self->_tileGroups;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___groupForSectionIdentifier_block_invoke;
  v11[3] = &unk_1E59CB430;
  id v12 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)tileGroups pk_firstObjectPassingTest:v11];

  unint64_t v9 = self->_isContentLoaded && v7 != 0;
  return v9;
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)[(NSArray *)self->_tileGroups pk_arrayByApplyingBlock:&__block_literal_global_23];
}

id __61__PKDashboardSectionDataSourceTileContext_sectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 metadata];
  id v3 = [v2 identifier];

  return v3;
}

- (id)titleForSectionIdentifier:(id)a3
{
  id v4 = a3;
  tileGroups = self->_tileGroups;
  id v6 = v4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___groupForSectionIdentifier_block_invoke;
  v25[3] = &unk_1E59CB430;
  id v26 = v6;
  uint64_t v7 = [(NSArray *)tileGroups pk_firstObjectPassingTest:v25];

  id v8 = [v7 tiles];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [v7 state];
    id v11 = [v10 stateTypeGroup];
    id v12 = [v11 header];

    id v13 = [v7 state];
    id v14 = [v13 stateTypeGroup];
    id v15 = [v14 headerActionTitle];

    id v16 = v12;
    uint64_t v17 = v16;
    if (v16)
    {
      v18 = (void *)[v16 length];

      if (v18)
      {
        v19 = [v7 metadata];
        uint64_t v20 = [v19 metadataTypeHorizontalFlowGroup];
        uint64_t v21 = [v20 groupStyle];

        if (v21) {
          uint64_t v22 = 3;
        }
        else {
          uint64_t v22 = 0;
        }
        v18 = +[PKDashboardHeaderTextItem itemWithHeaderText:v17 style:v22];
        [v18 setActionTitle:v15];
        [v18 setPreferBaselineAlignment:1];
        [v18 setUseActionInsets:0];
        objc_super v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v18 setActionColor:v23];
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)footerTextItemForSectionIdentifier:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  tileGroups = self->_tileGroups;
  id v6 = v4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___groupForSectionIdentifier_block_invoke;
  v25[3] = &unk_1E59CB430;
  id v26 = v6;
  uint64_t v7 = [(NSArray *)tileGroups pk_firstObjectPassingTest:v25];

  id v8 = [v7 tiles];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    id v16 = 0;
    goto LABEL_22;
  }
  id v10 = [v7 state];
  id v11 = [v10 stateTypeGroup];
  id v12 = [v11 footer];

  id v13 = [v7 state];
  id v14 = [v13 stateTypeGroup];
  id v15 = [v14 footerActionTitle];

  if (!v12)
  {
    if (!v15)
    {
LABEL_15:
      id v16 = 0;
      goto LABEL_21;
    }
    BOOL v17 = 0;
    goto LABEL_9;
  }
  id v16 = (void *)[v12 length];
  BOOL v17 = v16 != 0;
  if (v15)
  {
LABEL_9:
    id v16 = (void *)[v15 length];
    BOOL v18 = v16 != 0;

    if (v17 && v16)
    {
      id v19 = [NSString stringWithFormat:@"%@\n%@", v15, v12];
      BOOL v18 = 1;
      if (!v19) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    if (!v17)
    {
      if (!v16) {
        goto LABEL_21;
      }
      id v19 = v15;
      BOOL v18 = 1;
      goto LABEL_18;
    }
LABEL_14:
    id v19 = v12;
    if (!v19) {
      goto LABEL_15;
    }
LABEL_18:
    id v16 = +[PKDashboardFooterTextItem itemWithFooterText:v19];
    if (v18)
    {
      uint64_t v20 = [[PKTextRangeHyperlink alloc] initWithLinkText:v15 action:&__block_literal_global_33];
      v27[0] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v16 setSources:v21];

      uint64_t v22 = [MEMORY[0x1E4FB1618] labelColor];
      [v16 setLinkTextColor:v22];
    }
    [v16 setBottomInsetType:0];
    [v16 setMaximumNumberOfLines:4];
    objc_super v23 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
    [v16 setFont:v23];

    [v16 setUseCustomContentInsets:1];
    objc_msgSend(v16, "setCustomContentInsets:", 0.0, 5.0, 10.0, 5.0);

    goto LABEL_21;
  }
  if (v16)
  {
    BOOL v18 = 0;
    goto LABEL_14;
  }
LABEL_21:

LABEL_22:

  return v16;
}

- (PKDashboardSectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardSectionDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isContentLoaded
{
  return self->_isContentLoaded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_tileGroupID, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end