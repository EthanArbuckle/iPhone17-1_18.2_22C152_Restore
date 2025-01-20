@interface PXBarsController
- (BOOL)_isSpaceItem:(id)a3;
- (BOOL)_needsUpdate;
- (BOOL)wantsAnimatedBarsUpdate;
- (NSArray)additionalLeftBarButtonItems;
- (NSArray)additionalRightBarButtonItems;
- (NSArray)leftBarButtonItemIdentifiers;
- (NSArray)rightBarButtonItemIdentifiers;
- (NSArray)toolbarItemIdentifiers;
- (NSMutableDictionary)barButtonItemCache;
- (NSMutableDictionary)barButtonItemCachedPlacement;
- (PXActionPerformerDelegate)actionPerformerDelegate;
- (PXBarSpec)barSpec;
- (PXBarsController)init;
- (PXBarsControllerDelegate)delegate;
- (UIViewController)viewController;
- (double)fixedSpaceForEndButtonSpacing;
- (double)fixedSpaceForInterButtonSpacing;
- (id)_getCachedOrCreateNewBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4;
- (id)_makeFixedInterButtonSpacingBarButtonItem;
- (id)cachedBarButtonItemForIdentifier:(id)a3;
- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4;
- (void)_updateBarsIfNeeded;
- (void)_updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4;
- (void)invalidateBarButtonItemWithIdentifier:(id)a3;
- (void)invalidateBars;
- (void)purgeCachedBarButtonItems;
- (void)purgeCachedBarButtonItemsForIdentifiers:(id)a3;
- (void)setActionPerformerDelegate:(id)a3;
- (void)setAdditionalLeftBarButtonItems:(id)a3;
- (void)setAdditionalRightBarButtonItems:(id)a3;
- (void)setBarSpec:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWantsAnimatedBarsUpdate:(BOOL)a3;
- (void)updateBars;
- (void)updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4 layoutDirection:(int64_t)a5 isSpaceItem:(id)a6 dynamicHitTestInsetsViewProvider:(id)a7;
- (void)updateIfNeeded;
@end

@implementation PXBarsController

- (void)updateBars
{
  v3 = [(PXBarsController *)self viewController];
  v4 = [v3 navigationItem];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PXBarsController_updateBars__block_invoke;
  aBlock[3] = &unk_1E5DB1788;
  aBlock[4] = self;
  v5 = (void (**)(void *, void *, uint64_t, void *))_Block_copy(aBlock);
  v6 = [(PXBarsController *)self leftBarButtonItemIdentifiers];
  v7 = [(PXBarsController *)self additionalLeftBarButtonItems];
  v8 = v5[2](v5, v6, 2, v7);
  [v4 setLeftBarButtonItems:v8];

  v9 = [(PXBarsController *)self rightBarButtonItemIdentifiers];
  v10 = [(PXBarsController *)self additionalRightBarButtonItems];
  v11 = v5[2](v5, v9, 3, v10);
  [v4 setRightBarButtonItems:v11];

  v12 = [(PXBarsController *)self toolbarItemIdentifiers];
  v13 = v5[2](v5, v12, 4, 0);
  v14 = [(PXBarsController *)self viewController];
  [v14 setToolbarItems:v13];
}

void __30__PXBarsController_updateBars__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __30__PXBarsController_updateBars__block_invoke_2;
  v10 = &unk_1E5DB1760;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = a3;
  PXMap();
}

- (void)_updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PXBarsController *)self viewController];
  uint64_t v8 = [v7 view];
  uint64_t v9 = objc_msgSend(v8, "px_layoutDirection");

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke;
  v10[3] = &unk_1E5DB17B0;
  v10[4] = self;
  [(PXBarsController *)self updateDynamicHitTestInsetsForBarWithItems:v6 placement:a4 layoutDirection:v9 isSpaceItem:v10 dynamicHitTestInsetsViewProvider:&__block_literal_global_26059];
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4 layoutDirection:(int64_t)a5 isSpaceItem:(id)a6 dynamicHitTestInsetsViewProvider:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a7;
  v10;
  PXFilter();
}

id __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 customView];
  if ([v2 conformsToProtocol:&unk_1F041FA90]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSArray)leftBarButtonItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)additionalRightBarButtonItems
{
  return self->_additionalRightBarButtonItems;
}

- (NSArray)additionalLeftBarButtonItems
{
  return self->_additionalLeftBarButtonItems;
}

- (void)_updateBarsIfNeeded
{
  if (self->_needsUpdateFlags.needsUpdateBars)
  {
    self->_needsUpdateFlags.needsUpdateBars = 0;
    [(PXBarsController *)self updateBars];
    [(PXBarsController *)self setWantsAnimatedBarsUpdate:0];
  }
}

uint64_t __30__PXBarsController_updateBars__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getCachedOrCreateNewBarButtonItemForIdentifier:a2 placement:*(void *)(a1 + 40)];
}

uint64_t __142__PXBarsController_Testing__updateDynamicHitTestInsetsForBarWithItems_placement_layoutDirection_isSpaceItem_dynamicHitTestInsetsViewProvider___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isSpaceItem:a2];
}

- (BOOL)_isSpaceItem:(id)a3
{
  id v3 = a3;
  if ([v3 isSystemItem]) {
    BOOL v4 = (unint64_t)([v3 systemItem] - 5) < 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_storeWeak((id *)&self->_viewController, obj);
    [(PXBarsController *)self viewControllerDidChange:v5];
    [(PXBarsController *)self invalidateBars];
  }
}

- (void)updateIfNeeded
{
  if ([(PXBarsController *)self _needsUpdate])
  {
    [(PXBarsController *)self _updateBarsIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.needsUpdateBars;
}

- (void)setWantsAnimatedBarsUpdate:(BOOL)a3
{
  self->_wantsAnimatedBarsUpdate = a3;
}

- (void)invalidateBars
{
  self->_needsUpdateFlags.needsUpdateBars = 1;
}

- (id)_getCachedOrCreateNewBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PXBarsController *)self barButtonItemCache];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [(PXBarsController *)self barButtonItemCachedPlacement];
  id v10 = [v9 objectForKeyedSubscript:v6];

  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  char v12 = [v10 isEqualToNumber:v11];

  if (v12)
  {
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v8 = [(PXBarsController *)self createBarButtonItemForIdentifier:v6 placement:a4];
  if (v8)
  {
    uint64_t v13 = [(PXBarsController *)self barButtonItemCache];
    [v13 setObject:v8 forKeyedSubscript:v6];

    v14 = [NSNumber numberWithUnsignedInteger:a4];
    v15 = [(PXBarsController *)self barButtonItemCachedPlacement];
    [v15 setObject:v14 forKeyedSubscript:v6];
  }
LABEL_7:

  return v8;
}

- (void)purgeCachedBarButtonItemsForIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = [(PXBarsController *)self barButtonItemCache];
        [v10 removeObjectForKey:v9];

        id v11 = [(PXBarsController *)self barButtonItemCachedPlacement];
        [v11 removeObjectForKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSMutableDictionary)barButtonItemCachedPlacement
{
  return self->_barButtonItemCachedPlacement;
}

- (NSMutableDictionary)barButtonItemCache
{
  return self->_barButtonItemCache;
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"PXBarItemIdentifierSelect"])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedSelectBarButtonItem");
LABEL_12:
    uint64_t v9 = (void *)v6;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierSelectAll"])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedSelectAllBarButtonItem");
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierDeselectAll"])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedDeselectAllBarButtonItem");
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierDone"])
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v8 = 0;
LABEL_11:
    uint64_t v6 = [v7 initWithBarButtonSystemItem:v8 target:0 action:0];
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierCancel"])
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v8 = 1;
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierAdd"])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedAddBarButtonItem");
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierActionMenu"])
  {
    id v11 = +[PXPhotosGridSettings sharedInstance];
    long long v12 = [v11 actionMenuGlyphName];
    id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
    long long v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v12];
    uint64_t v9 = (void *)[v13 initWithImage:v14 style:0 target:0 action:0];

LABEL_20:
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierDismiss"])
  {
    long long v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
    uint64_t v17 = [v15 systemImageNamed:@"chevron.left" withConfiguration:v16];
    v18 = [v17 imageFlippedForRightToLeftLayoutDirection];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v18 style:0 target:0 action:0];
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"])
  {
    uint64_t v6 = [(PXBarsController *)self _makeFixedInterButtonSpacingBarButtonItem];
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierButtonEndSpacing"])
  {
    [(PXBarsController *)self fixedSpaceForEndButtonSpacing];
    if (v19 > 0.0)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB14A8], "fixedSpaceItemOfWidth:");
      goto LABEL_12;
    }
    goto LABEL_36;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierAddToLibrary"]
    || [v5 isEqualToString:@"PXBarItemIdentifierContentSyndicationSaveAll"])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = (void *)MEMORY[0x1E4FB1818];
    v22 = @"square.and.arrow.down";
LABEL_31:
    id v11 = [v21 systemImageNamed:v22];
    uint64_t v9 = (void *)[v20 initWithImage:v11 style:0 target:0 action:0];
    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierInfo"])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = (void *)MEMORY[0x1E4FB1818];
    v22 = @"info.circle";
    goto LABEL_31;
  }
  if ([v5 isEqualToString:@"PXBarItemIdentifierToggleSidebar"])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = (void *)MEMORY[0x1E4FB1818];
    v22 = @"sidebar.leading";
    goto LABEL_31;
  }
LABEL_36:
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (PXBarsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXBarsController;
  v2 = [(PXBarsController *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_needsUpdateFlags.needsUpdateBars = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    barButtonItemCache = v3->_barButtonItemCache;
    v3->_barButtonItemCache = (NSMutableDictionary *)v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    barButtonItemCachedPlacement = v3->_barButtonItemCachedPlacement;
    v3->_barButtonItemCachedPlacement = v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemCachedPlacement, 0);
  objc_storeStrong((id *)&self->_barButtonItemCache, 0);
  objc_storeStrong((id *)&self->_barSpec, 0);
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewController);
}

- (PXBarSpec)barSpec
{
  return self->_barSpec;
}

- (BOOL)wantsAnimatedBarsUpdate
{
  return self->_wantsAnimatedBarsUpdate;
}

- (void)setActionPerformerDelegate:(id)a3
{
}

- (PXActionPerformerDelegate)actionPerformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
  return (PXActionPerformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXBarsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXBarsControllerDelegate *)WeakRetained;
}

- (double)fixedSpaceForEndButtonSpacing
{
  return 0.0;
}

- (double)fixedSpaceForInterButtonSpacing
{
}

- (void)purgeCachedBarButtonItems
{
  id v3 = [(PXBarsController *)self barButtonItemCache];
  [v3 removeAllObjects];

  id v4 = [(PXBarsController *)self barButtonItemCachedPlacement];
  [v4 removeAllObjects];
}

- (id)cachedBarButtonItemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PXBarsController *)self barButtonItemCache];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)invalidateBarButtonItemWithIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v6, v7, v8);
  [(PXBarsController *)self invalidateBars];
}

- (id)_makeFixedInterButtonSpacingBarButtonItem
{
  [(PXBarsController *)self fixedSpaceForInterButtonSpacing];
  if (v2 <= 0.0)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB14A8], "fixedSpaceItemOfWidth:");
  }
  return v3;
}

- (void)setAdditionalRightBarButtonItems:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  id v4 = self->_additionalRightBarButtonItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      additionalRightBarButtonItems = self->_additionalRightBarButtonItems;
      self->_additionalRightBarButtonItems = v6;

      [(PXBarsController *)self invalidateBars];
    }
  }
}

- (void)setAdditionalLeftBarButtonItems:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  id v4 = self->_additionalLeftBarButtonItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      additionalLeftBarButtonItems = self->_additionalLeftBarButtonItems;
      self->_additionalLeftBarButtonItems = v6;

      [(PXBarsController *)self invalidateBars];
    }
  }
}

- (NSArray)toolbarItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)rightBarButtonItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setBarSpec:(id)a3
{
  char v5 = (PXBarSpec *)a3;
  if (self->_barSpec != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_barSpec, a3);
    [(PXBarsController *)self invalidateBars];
    [(PXBarsController *)self _updateBarsIfNeeded];
    char v5 = v6;
  }
}

@end