@interface PKDashboardBarcodePassDataSource
- (BOOL)hasContent;
- (PKDashboardBarcodePassDataSource)initWithGroupView:(id)a3 context:(id)a4;
- (PKPassGroupView)groupView;
- (id)_messageForIssuerBinding;
- (id)footerTextItemForSection:(unint64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_applyDiff:(id)a3;
- (void)_reloadMessages;
- (void)_sendAnalyticsForIssuerBindingDidTapButton:(id)a3;
- (void)_sendAnalyticsForIssuerBindingMessageType:(id)a3;
- (void)_updateWithTiles:(id)a3;
- (void)dealloc;
- (void)executeAfterContentIsLoaded:(id)a3;
- (void)groupView:(id)a3 didUpdatePassView:(id)a4;
- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5;
- (void)reloadData;
- (void)reloadFrontmostPass;
- (void)reloadMessages;
- (void)reloadTiles;
- (void)sendContentIsLoadedIfNecessary;
- (void)setDataSourceDelegate:(id)a3;
- (void)updateContentIsLoaded;
@end

@implementation PKDashboardBarcodePassDataSource

- (PKDashboardBarcodePassDataSource)initWithGroupView:(id)a3 context:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDashboardBarcodePassDataSource;
  v7 = [(PKDashboardBarcodePassDataSource *)&v21 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_groupView, a3);
    [v6 addPassGroupViewObserver:v8];
    uint64_t v9 = [v6 group];
    group = v8->_group;
    v8->_group = (PKGroup *)v9;

    v11 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    messages = v8->_messages;
    v8->_messages = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    executionBlocksContentIsLoaded = v8->_executionBlocksContentIsLoaded;
    v8->_executionBlocksContentIsLoaded = v13;

    uint64_t v15 = +[PKPassSemanticTileFactory sharedInstance];
    tileFactory = v8->_tileFactory;
    v8->_tileFactory = (PKPassSemanticTileFactory *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passkitui.semantictilefactory", v17);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v18;

    [(PKDashboardBarcodePassDataSource *)v8 reloadFrontmostPass];
    [(PKDashboardBarcodePassDataSource *)v8 reloadData];
  }
  return v8;
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void)dealloc
{
  [(PKPassGroupView *)self->_groupView removePassGroupViewObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBarcodePassDataSource;
  [(PKDashboardBarcodePassDataSource *)&v3 dealloc];
}

- (void)sendContentIsLoadedIfNecessary
{
  if (self->_group) {
    [(PKDashboardBarcodePassDataSource *)self updateContentIsLoaded];
  }
}

- (void)groupView:(id)a3 didUpdatePassView:(id)a4
{
  groupView = self->_groupView;
  id v6 = a4;
  v7 = [(PKPassGroupView *)groupView frontmostPassView];
  v8 = [v7 pass];
  uint64_t v9 = [v8 uniqueID];

  v10 = [v6 pass];

  v11 = [v10 uniqueID];

  id v14 = v9;
  id v12 = v11;
  if (v14 == v12)
  {

    goto LABEL_7;
  }
  if (!v14 || !v12)
  {

    goto LABEL_9;
  }
  int v13 = [v14 isEqualToString:v12];

  if (v13) {
LABEL_7:
  }
    [(PKDashboardBarcodePassDataSource *)self reloadData];
LABEL_9:
}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  [(PKDashboardBarcodePassDataSource *)self reloadFrontmostPass];

  [(PKDashboardBarcodePassDataSource *)self reloadData];
}

- (void)reloadFrontmostPass
{
  objc_super v3 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  pass = self->_pass;
  p_pass = &self->_pass;
  if (pass == v3)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Skipping reload of pass...", v7, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)p_pass, v3);
  }
}

- (void)reloadData
{
  [(PKDashboardBarcodePassDataSource *)self reloadMessages];

  [(PKDashboardBarcodePassDataSource *)self reloadTiles];
}

- (void)setDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(PKDashboardBarcodePassDataSource *)self sendContentIsLoadedIfNecessary];
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 section];
  if (v4 == 2)
  {
    v5 = objc_alloc_init(PKDashboardPassTilesItem);
    [(PKDashboardPassTilesItem *)v5 setPass:self->_pass];
    id v6 = [(PKPassGroupView *)self->_groupView frontmostPassView];
    [(PKDashboardPassTilesItem *)v5 setPassView:v6];

    v7 = [(NSArray *)self->_tileGroups objectAtIndexedSubscript:0];
    [(PKDashboardPassTilesItem *)v5 setGroupTile:v7];
  }
  else if (v4 == 1)
  {
    v5 = objc_alloc_init(PKDashboardPassMessages);
    [(PKDashboardPassTilesItem *)v5 setMessages:self->_messages];
  }
  else if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [[PKDashboardPassGroupItem alloc] initWithGroupView:self->_groupView];
  }

  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      BOOL allContentIsLoaded = self->_allContentIsLoaded;
      if (self->_allContentIsLoaded)
      {
        tileGroups = self->_tileGroups;
        return [tileGroups count] != 0;
      }
    }
    else
    {
      if (a3 != 1) {
        return 0;
      }
      BOOL allContentIsLoaded = self->_allContentIsLoaded;
      if (self->_allContentIsLoaded)
      {
        tileGroups = self->_messages;
        return [tileGroups count] != 0;
      }
    }
  }
  else
  {
    return 1;
  }
  return allContentIsLoaded;
}

- (unint64_t)numberOfSections
{
  return 3;
}

- (id)titleForSection:(unint64_t)a3
{
  if (a3 != 2) {
    goto LABEL_7;
  }
  objc_super v3 = [(NSArray *)self->_tileGroups objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 tiles];
  uint64_t v5 = [v4 count];

  if (!v5)
  {

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  id v6 = [v3 state];
  v7 = [v6 stateTypeGroup];
  v8 = [v7 header];

  id v9 = v8;
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = (void *)[v9 length];

  if (v11)
  {
    v11 = +[PKDashboardHeaderTextItem itemWithHeaderText:v10];
  }
LABEL_9:

  return v11;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  if (a3 != 2) {
    goto LABEL_7;
  }
  objc_super v3 = [(NSArray *)self->_tileGroups objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 tiles];
  uint64_t v5 = [v4 count];

  if (!v5)
  {

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  id v6 = [v3 state];
  v7 = [v6 stateTypeGroup];
  v8 = [v7 footer];

  id v9 = v8;
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = (void *)[v9 length];

  if (v11)
  {
    v11 = +[PKDashboardFooterTextItem itemWithFooterText:v10];
  }
LABEL_9:

  return v11;
}

- (void)reloadTiles
{
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:self->_pass])
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke;
    block[3] = &unk_1E59CA7A8;
    block[4] = self;
    objc_copyWeak(&v6, &location);
    dispatch_async(workQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_5;
    v4[3] = &unk_1E59CA7D0;
    v4[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_2;
  v9[3] = &unk_1E59CB088;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v5 = [v3 createTilesForPass:v4 context:1 tileUpdateBlock:v9];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_4;
  block[3] = &unk_1E59CA870;
  block[4] = *(void *)(a1 + 32);
  id v6 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [*(id *)(*(void *)(a1 + 32) + 72) prewarmTileContentForPass:*(void *)(*(void *)(a1 + 32) + 32) context:2];

  objc_destroyWeak(&v10);
}

void __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_3;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateWithTiles:*(void *)(a1 + 32)];
}

uint64_t __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithTiles:*(void *)(a1 + 40)];
}

uint64_t __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithTiles:0];
}

- (void)_updateWithTiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_tileGroups;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v14 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = v7;
  if (self->_allContentIsLoaded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_2;
    v10[3] = &unk_1E59CFAE0;
    objc_copyWeak(&v12, &location);
    v10[5] = self;
    id v11 = v8;
    v10[4] = v5;
    [WeakRetained performBatchUpdates:v10 completion:0];

    objc_destroyWeak(&v12);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
    [(PKDashboardBarcodePassDataSource *)self updateContentIsLoaded];
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[64] = 1;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    id v3 = (void *)*((void *)WeakRetained + 7);
    *((void *)WeakRetained + 7) = v2;
  }
  else
  {
    id v3 = (void *)*((void *)WeakRetained + 7);
    *((void *)WeakRetained + 7) = 0;
  }
}

void __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v2 = [*(id *)(a1 + 32) firstObject];
    id v3 = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(v2);

    id v4 = [WeakRetained[7] firstObject];
    uint64_t v5 = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(v4);

    id v6 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:v3 andNewItems:v5 inSection:2];
    [*(id *)(a1 + 40) _applyDiff:v6];
  }
}

id __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [v1 tiles];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [v1 state];
    id v6 = [v5 stateTypeGroup];

    id v7 = [v6 header];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 length];

      if (v9) {
        [v2 addObject:v8];
      }
    }
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    [v2 addObject:v11];

    id v12 = [v6 footer];
    int v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 length];

      if (v14) {
        [v2 addObject:v13];
      }
    }
  }
  id v15 = (void *)[v2 copy];

  return v15;
}

- (void)_applyDiff:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v4 deletedIndexPaths];
  [WeakRetained deleteItemsAtIndexPaths:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [v4 deletedSections];
  [v7 deleteSections:v8];

  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [v4 insertedIndexPaths];
  [v9 insertItemsAtIndexPaths:v10];

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = [v4 insertedSections];
  [v11 insertSections:v12];

  int v13 = [v4 movedFromIndexPaths];
  uint64_t v14 = [v4 movedToIndexPaths];
  if ([v13 count])
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = [v13 objectAtIndexedSubscript:v15];
      dispatch_queue_t v18 = [v14 objectAtIndexedSubscript:v15];
      [v16 moveItemAtIndexPath:v17 toIndexPath:v18];

      ++v15;
    }
    while ([v13 count] > v15);
  }
  v28 = v4;
  v19 = objc_msgSend(v4, "changedIndexPaths", v14);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * v23);
        id v25 = objc_loadWeakRetained((id *)&self->_delegate);
        v26 = [(PKDashboardBarcodePassDataSource *)self itemAtIndexPath:v24];
        [v25 itemChanged:v26 atIndexPath:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)reloadMessages
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PKDashboardBarcodePassDataSource_reloadMessages__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __50__PKDashboardBarcodePassDataSource_reloadMessages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadMessages];
}

- (void)_reloadMessages
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v3 = [(PKDashboardBarcodePassDataSource *)self _messageForIssuerBinding];
  objc_msgSend(v8, "pk_safelyAddObject:", v3);

  id v4 = (NSOrderedSet *)[v8 copy];
  messages = self->_messages;
  self->_messages = v4;

  self->_messagesLoaded = 1;
  if (self->_allContentIsLoaded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
      [WeakRetained reloadSections:v7];
    }
  }
  else
  {
    [(PKDashboardBarcodePassDataSource *)self updateContentIsLoaded];
  }
}

- (void)updateContentIsLoaded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_allContentIsLoaded && self->_tilesLoaded && self->_messagesLoaded)
  {
    self->_BOOL allContentIsLoaded = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained contentIsLoaded];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = (void *)[(NSMutableArray *)self->_executionBlocksContentIsLoaded copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_executionBlocksContentIsLoaded removeAllObjects];
  }
}

- (void)executeAfterContentIsLoaded:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    if (self->_allContentIsLoaded)
    {
      v4[2](v4);
    }
    else
    {
      executionBlocksContentIsLoaded = self->_executionBlocksContentIsLoaded;
      uint64_t v6 = _Block_copy(v4);
      [(NSMutableArray *)executionBlocksContentIsLoaded addObject:v6];
    }
    id v4 = aBlock;
  }
}

- (BOOL)hasContent
{
  return !self->_allContentIsLoaded
      || [(NSArray *)self->_tileGroups count]
      || [(NSOrderedSet *)self->_messages count] != 0;
}

- (id)_messageForIssuerBinding
{
  id v3 = [(PKPassGroupView *)self->_groupView frontmostPassView];
  id v4 = [v3 pass];

  uint64_t v5 = [v4 nfcPayload];
  uint64_t v6 = [v5 payloadState];

  uint64_t v7 = [v4 issuerBindingInformation];
  uint64_t v8 = [v7 objectForKey:@"learnMoreURL"];

  uint64_t v9 = PKLocalizedPaymentString(&cfstr_IssuerDataDash.isa);
  long long v10 = 0;
  switch(v6)
  {
    case 0:
      goto LABEL_11;
    case 1:
      [(PKDashboardBarcodePassDataSource *)self _sendAnalyticsForIssuerBindingMessageType:*MEMORY[0x1E4F863E0]];
      long long v11 = [v4 organizationName];
      long long v12 = PKLocalizedPaymentString(&cfstr_IssuerDataDash_0.isa, &stru_1EF1B4C70.isa, v11);

      if (v8)
      {
        long long v13 = PKPassKitUIBundle();
        uint64_t v14 = [v13 URLForResource:@"MessageError" withExtension:@"pdf"];

        uint64_t v15 = PKLocalizedPaymentString(&cfstr_IssuerDataDash_1.isa);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke;
        aBlock[3] = &unk_1E59CA870;
        void aBlock[4] = self;
        id v24 = v8;
        id v16 = _Block_copy(aBlock);
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        id v16 = 0;
      }
      goto LABEL_8;
    case 2:
      [(PKDashboardBarcodePassDataSource *)self _sendAnalyticsForIssuerBindingMessageType:*MEMORY[0x1E4F863E8]];
      v17 = PKPassKitUIBundle();
      uint64_t v14 = [v17 URLForResource:@"MessageError" withExtension:@"pdf"];

      long long v12 = PKLocalizedPaymentString(&cfstr_IssuerDataDash_2.isa);
      uint64_t v15 = PKLocalizedPaymentString(&cfstr_IssuerDataDash_3.isa);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke_2;
      v22[3] = &unk_1E59CA7D0;
      v22[4] = self;
      id v16 = _Block_copy(v22);
      goto LABEL_8;
    case 3:
      uint64_t v18 = PKLocalizedPaymentString(&cfstr_ActivatingTitl.isa);

      long long v12 = PKLocalizedPaymentString(&cfstr_ActivatingMess.isa);
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      id v16 = 0;
      uint64_t v9 = (void *)v18;
      goto LABEL_8;
    default:
      long long v12 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      id v16 = 0;
LABEL_8:
      long long v10 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v10 setIdentifier:@"IssuerBindingInvalidMessage"];
      if (v14)
      {
        double v19 = PKUIScreenScale();
        uint64_t v20 = PKUIImageFromPDF(v14, 45.0, 45.0, v19);
        [(PKDashboardPassMessage *)v10 setImage:v20];
      }
      [(PKDashboardPassMessage *)v10 setTitle:v9];
      [(PKDashboardPassMessage *)v10 setMessage:v12];
      [(PKDashboardPassMessage *)v10 setButtonTitle:v15];
      [(PKDashboardPassMessage *)v10 setActionOnButtonPress:v16];

LABEL_11:
      return v10;
  }
}

void __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendAnalyticsForIssuerBindingDidTapButton:*MEMORY[0x1E4F86DA0]];
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 40)];
  [v3 openURL:v2 withOptions:0];
}

void __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendAnalyticsForIssuerBindingDidTapButton:*MEMORY[0x1E4F86DB0]];
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v1 openSensitiveURL:v2 withOptions:0];
}

- (void)_sendAnalyticsForIssuerBindingMessageType:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87050];
  id v6 = a3;
  [v4 beginSubjectReporting:v5];
  uint64_t v7 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v16[0] = *MEMORY[0x1E4F86308];
  v16[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86750];
  v17[0] = v6;
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E4F86DA8];
  long long v10 = [(PKPassGroupView *)self->_groupView frontmostPassView];
  long long v11 = [v10 pass];
  uint64_t v12 = [v11 passTypeIdentifier];
  long long v13 = (void *)v12;
  uint64_t v14 = *MEMORY[0x1E4F86D78];
  if (v12) {
    uint64_t v14 = v12;
  }
  v17[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v7 subject:v5 sendEvent:v15];

  [MEMORY[0x1E4F843E0] endSubjectReporting:v5];
}

- (void)_sendAnalyticsForIssuerBindingDidTapButton:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87050];
  id v5 = a3;
  [v3 beginSubjectReporting:v4];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86750];
  v11[0] = *MEMORY[0x1E4F86380];
  v11[1] = v7;
  uint64_t v8 = (void *)MEMORY[0x1E4F843E0];
  v10[2] = *MEMORY[0x1E4F86120];
  v11[2] = v5;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v8 subject:v4 sendEvent:v9];

  [MEMORY[0x1E4F843E0] endSubjectReporting:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionBlocksContentIsLoaded, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_groupView, 0);
}

@end