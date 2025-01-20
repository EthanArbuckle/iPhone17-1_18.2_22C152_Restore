@interface SKUIGridViewElementPageSection
- (BOOL)_containsOnlyShelfElements;
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (BOOL)isEditing;
- (BOOL)requestLayoutWithReloadReason:(int64_t)a3;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIGridViewElementPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)backgroundColorForSection;
- (id)cellForIndexPath:(id)a3;
- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4;
- (id)indexPathsForBackgroundItems;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3;
- (void)_reloadViewElementProperties;
- (void)_requestLayoutForCells;
- (void)_resetLayoutProperties;
- (void)_setContext:(id)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SKUIIndexPathRange *)a4;
- (void)dealloc;
- (void)deselectItemsAnimated:(BOOL)a3;
- (void)expandEditorialForLabelElement:(id)a3 indexPath:(id)a4;
- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)reloadVisibleCellsWithReason:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIGridViewElementPageSection

- (SKUIGridViewElementPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGridViewElementPageSection initWithPageComponent:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridViewElementPageSection;
  v5 = [(SKUIStorePageSection *)&v9 initWithPageComponent:v4];
  if (v5)
  {
    v6 = objc_alloc_init(SKUIGridViewElementPageSectionConfiguration);
    configuration = v5->_configuration;
    v5->_configuration = v6;

    [(SKUIGridViewElementPageSectionConfiguration *)v5->_configuration setDataSource:v5];
    [(SKUIGridViewElementPageSection *)v5 _reloadViewElementProperties];
  }

  return v5;
}

- (void)dealloc
{
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v9 = [v8 viewElement];
  [v6 addItemViewElement:v9];

  viewElements = self->_viewElements;
  uint64_t v11 = [v7 item];

  id v12 = [(NSArray *)viewElements objectAtIndex:v11];
  [v6 addItemViewElement:v12];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  if (a3 == 2) {
    return -[SKUIStorePageSection applyUpdateType:](&v9, sel_applyUpdateType_, 2, v8.receiver, v8.super_class, self, SKUIGridViewElementPageSection);
  }
  BOOL v6 = [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration showsEditMode];
  NSUInteger v7 = [(NSArray *)self->_viewElements count];
  [(SKUIGridViewElementPageSection *)self _reloadViewElementProperties];
  if (v6 == [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration showsEditMode]
    || v7 != [(NSArray *)self->_viewElements count])
  {
    return -[SKUIStorePageSection applyUpdateType:](&v8, sel_applyUpdateType_, a3, self, SKUIGridViewElementPageSection, v9.receiver, v9.super_class);
  }
  [(SKUIGridViewElementPageSection *)self _resetLayoutProperties];
  [(SKUIGridViewElementPageSection *)self _requestLayoutForCells];
  return 1;
}

- (id)backgroundColorForSection
{
  return self->_backgroundColor;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v4 item]);
  id v6 = [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration backgroundColorForViewElement:v5];
  NSUInteger v7 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v8 = [v7 viewElement];
  objc_super v9 = [v8 style];
  v10 = [v9 ikBackgroundColor];

  if (v10 || [0 colorType] == 3)
  {
    uint64_t v11 = [v5 style];
    id v12 = [v11 ikBackgroundColor];

    if (v12 && ([v12 color], v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
    {
      uint64_t v14 = [v12 color];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v15 = (void *)v14;
  }
  else if ([v5 handlesBackgroundColorDirectly])
  {
    v15 = 0;
  }
  else
  {
    if (!v6)
    {
      v17.receiver = self;
      v17.super_class = (Class)SKUIGridViewElementPageSection;
      id v6 = [(SKUIStorePageSection *)&v17 backgroundColorForIndexPath:v4];
    }
    id v6 = v6;
    v15 = v6;
  }

  return v15;
}

- (id)cellForIndexPath:(id)a3
{
  viewElements = self->_viewElements;
  id v5 = a3;
  id v6 = -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", [v5 item]);
  NSUInteger v7 = [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration cellForViewElement:v6 indexPath:v5];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  viewElements = self->_viewElements;
  id v5 = a3;
  id v6 = -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", [v5 item]);
  [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration cellSizeForViewElement:v6 indexPath:v5];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3
{
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [a3 item]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 isEnabled]) {
    [v3 dispatchEventOfType:3 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v4 item]);
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEnabled])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__SKUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v7[3] = &unk_1E6429838;
      objc_copyWeak(&v10, &location);
      id v8 = v6;
      double v9 = self;
      [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v7];

      objc_destroyWeak(&v10);
    }
    else
    {
      [v6 dispatchEvent:0x1F1C94B88 eventAttribute:0x1F1C94BA8 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
    }
  }

  objc_destroyWeak(&location);
}

void __73__SKUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SKUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  v6[3] = &unk_1E6429810;
  char v10 = a2;
  char v11 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
}

void __73__SKUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56) || !*(unsigned char *)(a1 + 57))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained performDefaultActionForViewElement:*(void *)(a1 + 32)];
  }
  id v3 = [*(id *)(a1 + 40) context];
  id v5 = [v3 parentViewController];

  if (SKUIViewControllerIsVisible(v5))
  {
    id v4 = [v5 transitionCoordinator];

    if (!v4) {
      [*(id *)(a1 + 40) deselectItemsAnimated:1];
    }
  }
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 activeMetricsImpressionSession];

  id v7 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 viewElement];

  [v6 beginActiveImpressionForViewElement:v8];
  id v9 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v4 item]);

  [v6 beginActiveImpressionForViewElement:v9];
  v10.receiver = self;
  v10.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v10 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 activeMetricsImpressionSession];

  id v7 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 viewElement];

  [v6 endActiveImpressionForViewElement:v8];
  unint64_t v9 = [v4 item];
  if (v9 < [(NSArray *)self->_viewElements count])
  {
    uint64_t v10 = [(NSArray *)self->_viewElements objectAtIndex:v9];

    [v6 endActiveImpressionForViewElement:v10];
    uint64_t v8 = (void *)v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v11 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [(SKUIGridViewElementPageSectionConfiguration *)configuration collectionViewWillApplyLayoutAttributes:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v6 collectionViewWillApplyLayoutAttributes:v5];
}

- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SKUIIndexPathRange *)a4
{
  double y = a3.y;
  double x = a3.x;
  int64_t v8 = [(SKUIGridViewElementPageSection *)self numberOfCells];
  if (self->_lastNeedsMoreCount < v8)
  {
    unint64_t v9 = v8;
    long long v10 = *(_OWORD *)&a4->var2;
    long long v17 = *(_OWORD *)&a4->var0;
    long long v18 = v10;
    uint64_t v11 = [(SKUIStorePageSection *)self itemRangeForIndexPathRange:&v17];
    if (v12 + v11 + 20 >= v9)
    {
      self->_lastNeedsMoreCount = v9;
      v13 = [(SKUIStorePageSection *)self pageComponent];
      uint64_t v14 = [v13 viewElement];
      [v14 dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGridViewElementPageSection;
  long long v15 = *(_OWORD *)&a4->var2;
  long long v17 = *(_OWORD *)&a4->var0;
  long long v18 = v15;
  -[SKUIStorePageSection collectionViewWillScrollToOffset:visibleRange:](&v16, sel_collectionViewWillScrollToOffset_visibleRange_, &v17, x, y);
}

- (void)deselectItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(SKUIStorePageSection *)self context];
  objc_super v6 = [v5 collectionView];

  id v7 = [v6 indexPathsForSelectedItems];
  int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v14 section] == v8) {
          [v6 deselectItemAtIndexPath:v14 animated:v3];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v15 deselectItemsAnimated:v3];
}

- (void)expandEditorialForLabelElement:(id)a3 indexPath:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  cellLayoutContext = self->_cellLayoutContext;
  id v7 = a4;
  [(SKUIViewElementLayoutContext *)cellLayoutContext expandEditorialForLabelElement:a3];
  int64_t v8 = [(SKUIStorePageSection *)self context];
  id v9 = [v8 collectionView];
  v11[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [v9 reloadItemsAtIndexPaths:v10];
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__84;
  v24 = __Block_byref_object_dispose__84;
  id v25 = 0;
  viewElements = self->_viewElements;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__SKUIGridViewElementPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke;
  v16[3] = &unk_1E64262E0;
  id v9 = v6;
  long long v18 = self;
  long long v19 = &v20;
  id v17 = v9;
  [(NSArray *)viewElements enumerateObjectsUsingBlock:v16];
  if (v21[5])
  {
    uint64_t v10 = objc_alloc_init(SKUIModalSourceViewProvider);
    [(SKUIModalSourceViewProvider *)v10 setUserInfo:v9];
    uint64_t v11 = [(SKUIStorePageSection *)self context];
    uint64_t v12 = [v11 collectionView];
    v13 = [v12 cellForItemAtIndexPath:v21[5]];

    uint64_t v14 = [v9 itmlID];
    objc_super v15 = [v13 viewForElementIdentifier:v14];

    if (v15) {
      [(SKUIModalSourceViewProvider *)v10 setOriginalSourceView:v15];
    }
    else {
      [(SKUIModalSourceViewProvider *)v10 setOriginalSourceView:v13];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v7[2](v7, v10);

  _Block_object_dispose(&v20, 8);
}

void __83__SKUIGridViewElementPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) isDescendentFromViewElement:a2])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionIndex"));
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (id)indexPathsForBackgroundItems
{
  return self->_indexPathsForBackgroundItems;
}

- (int64_t)numberOfCells
{
  return [(NSArray *)self->_viewElements count];
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIStorePageSection *)self context];
  id v5 = [v4 collectionView];
  id v6 = [v5 indexPathsForVisibleItems];

  int64_t v7 = [(SKUIStorePageSection *)self sectionIndex];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v14 section] == v7)
        {
          uint64_t v15 = [v14 item];
          if (v11 <= v15) {
            uint64_t v11 = v15;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  long long v16 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v22 = [v16 viewElement];

  int64_t v17 = [(NSArray *)self->_viewElements count];
  if (v11 < v17)
  {
    uint64_t v18 = 0;
    do
    {
      long long v19 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v11, v22);
      if ([(objc_class *)[(SKUIGridViewElementPageSectionConfiguration *)self->_configuration cellClassForViewElement:v19] prefetchResourcesForViewElement:v19 reason:a3 context:self->_cellLayoutContext])
      {
        if ([(SKUIGridViewElementPageSectionConfiguration *)self->_configuration viewElementIsStandardCard:v19])
        {
          int64_t v20 = 10
              / [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration numberOfColumns];
          if (v20 <= 1) {
            int64_t v20 = 1;
          }
        }
        else
        {
          int64_t v20 = 1;
        }
        v18 += v20;
      }

      if (v18 > 19) {
        break;
      }
      ++v11;
    }
    while (v11 < v17);
  }
  uint64_t v21 = v22;
  if (v17 <= 19 && self->_lastNeedsMoreCount < v17)
  {
    self->_lastNeedsMoreCount = v17;
    [v22 dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIGridViewElementPageSection;
  -[SKUIStorePageSection prefetchResourcesWithReason:](&v24, sel_prefetchResourcesWithReason_, a3, v22);
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 collectionView];

  uint64_t v10 = [v7 sourceView];

  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  uint64_t v11 = objc_msgSend(v9, "indexPathForItemAtPoint:");
  uint64_t v12 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v11 item]);
  v13 = [(SKUIStorePageSection *)self context];
  uint64_t v14 = [v13 clientContext];
  uint64_t v15 = [v14 previewViewControllerForViewElement:v12];

  return v15;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  viewElements = self->_viewElements;
  id v7 = a3;
  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", [v7 item]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration reloadCellWithIndexPath:v7 forViewElement:v8 reason:a4];
}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v6 reloadVisibleCellsWithReason:a3];
  cellLayoutContext = self->_cellLayoutContext;
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SKUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  [(SKUIViewElementLayoutContext *)cellLayoutContext setAggregateValue:v5 forKey:0x1F1C954E8];
}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  if (a3 == 2) {
    [(SKUIGridViewElementPageSection *)self _requestLayoutForCells];
  }
  return a3 == 2;
}

- (UIEdgeInsets)sectionContentInset
{
  configuration = self->_configuration;
  v26.receiver = self;
  v26.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v26 sectionContentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SKUIStorePageSection *)self pageComponent];
  v13 = [v12 viewElement];
  -[SKUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:](configuration, "sectionContentInsetAdjustedFromValue:forGridViewElement:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(SKUIStorePageSection *)self pageComponent];
  double v7 = [v6 viewElement];

  double v8 = [v7 firstDescendentWithIndexBarEntryID:v5];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
    do
    {
      double v11 = v10;
      NSUInteger v12 = [(NSArray *)self->_viewElements indexOfObject:v10];
      id v10 = [v10 parent];
    }
    while (v10 && v12 == 0x7FFFFFFFFFFFFFFFLL);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v12, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v10 collectionView];
  NSUInteger v12 = [v11 cellForItemAtIndexPath:v8];

  int v13 = [v12 updateWithItemState:v9 context:self->_cellLayoutContext animated:v5];
  if (v13)
  {
    double v14 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v8 item]);
    [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration requestCellLayoutForViewElement:v14];
  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 collectionView];
  [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration registerReusableClassesForCollectionView:v5];
  double v6 = self->_cellLayoutContext;
  double v7 = [[SKUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  id v9 = self->_cellLayoutContext;
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SKUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  [(SKUIViewElementLayoutContext *)v9 setAggregateValue:v10 forKey:0x1F1C954E8];

  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x1E4F1CC38] forKey:0x1F1C92648];
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:&unk_1F1D61EF8 forKey:0x1F1C8C948];
  double v11 = [(SKUIStorePageSection *)self pageComponent];
  NSUInteger v12 = [v11 viewElement];

  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", [v12 elementType]);
  if ([(SKUIGridViewElementPageSection *)self _containsOnlyShelfElements]) {
    [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x1E4F1CC38] forKey:0x1F1C93668];
  }
  [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration setCellLayoutContext:self->_cellLayoutContext];
  [(SKUIGridViewElementPageSection *)self _resetLayoutProperties];
  [(SKUIGridViewElementPageSection *)self _requestLayoutForCells];
  int v13 = [(SKUIStorePageSection *)self pageComponent];
  double v14 = [v13 viewElement];
  double v15 = [v14 style];
  double v16 = [v15 ikBackgroundColor];

  if (v16 && [v16 colorType] == 3)
  {
    double v17 = (IKColor *)[v16 copy];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v17;

    double v19 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v25[0] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    indexPathsForBackgroundItems = self->_indexPathsForBackgroundItems;
    self->_indexPathsForBackgroundItems = v20;
  }
  else
  {
    double v22 = self->_backgroundColor;
    self->_backgroundColor = 0;

    double v23 = self->_indexPathsForBackgroundItems;
    self->_indexPathsForBackgroundItems = 0;
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIGridViewElementPageSection;
  [(SKUIStorePageSection *)&v24 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SKUIViewElementLayoutContext *)cellLayoutContext invalidateAllEditorialLayouts];
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setActivePageWidth:width];
  [(SKUIGridViewElementPageSection *)self _resetLayoutProperties];
  [(SKUIGridViewElementPageSection *)self _requestLayoutForCells];
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridViewElementPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)_setContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIGridViewElementPageSection;
  id v4 = a3;
  [(SKUIStorePageSection *)&v5 _setContext:v4];
  -[SKUIGridViewElementPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3) {
    self->_editing = a3;
  }
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  objc_super v9 = [v8 collectionView];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SKUIGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E6429860;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  double v17 = self;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [(SKUIGridViewElementPageSection *)self _enumerateVisibleViewElementsUsingBlock:v13];
}

void __62__SKUIGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = [a3 elementType];
  BOOL v6 = (unint64_t)(v5 - 14) > 0x34 || ((1 << (v5 - 14)) & 0x10003C00000001) == 0;
  if (!v6 || v5 == 154 || v5 == 152)
  {
    id v7 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v8];
    [v7 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 56) + 96)];
  }
}

- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "item", a3);
  if (v5 >= [(NSArray *)self->_viewElements count])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(NSArray *)self->_viewElements objectAtIndex:v5];
  }

  return v6;
}

- (BOOL)_containsOnlyShelfElements
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_viewElements;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
      if (objc_msgSend(v7, "elementType", (void)v10) != 66 || objc_msgSend(v7, "lockupViewType") != 4) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        BOOL v8 = 1;
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKUIStorePageSection *)self context];
  uint64_t v6 = [v5 collectionView];

  id v7 = [v6 indexPathsForVisibleItems];
  int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SKUIGridViewElementPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_1E6429888;
  id v11 = v4;
  int64_t v12 = v8;
  v10[4] = self;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __74__SKUIGridViewElementPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if ([v8 section] == a1[6])
  {
    uint64_t v6 = a1[5];
    id v7 = objc_msgSend(*(id *)(a1[4] + 160), "objectAtIndex:", objc_msgSend(v8, "item"));
    (*(void (**)(uint64_t, id, void *, uint64_t))(v6 + 16))(v6, v8, v7, a4);
  }
}

- (void)_reloadViewElementProperties
{
  uint64_t v3 = [(SKUIStorePageSection *)self pageComponent];
  id v7 = [v3 viewElement];

  -[SKUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", [v7 rendersWithPerspective]);
  id v4 = [v7 flattenedChildren];
  viewElements = self->_viewElements;
  self->_viewElements = v4;

  [(SKUIGridViewElementPageSectionConfiguration *)self->_configuration updateStylePropertiesForGridViewElement:v7 gridItemViewElements:self->_viewElements numberOfGridItems:[(NSArray *)self->_viewElements count]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v7 collectionFeature];
    [v6 setCollectionTarget:self];
  }
}

- (void)_requestLayoutForCells
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_viewElements;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SKUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resetLayoutProperties
{
  configuration = self->_configuration;
  id v4 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v3 = [v4 viewElement];
  [(SKUIGridViewElementPageSectionConfiguration *)configuration updateLayoutPropertiesForGridViewElement:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_indexPathsForBackgroundItems, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGridViewElementPageSection initWithPageComponent:]";
}

@end