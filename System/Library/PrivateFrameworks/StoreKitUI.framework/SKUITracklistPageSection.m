@interface SKUITracklistPageSection
- (BOOL)_isDynamicTracklist;
- (BOOL)requestLayoutWithReloadReason:(int64_t)a3;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUITracklistPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (double)_widthForButtonElements:(id)a3;
- (id)_columnData;
- (id)_representativeStringForViewElement:(id)a3;
- (id)_viewElementForIndex:(int64_t)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)firstAppearanceIndexPath;
- (id)relevantEntityProviders;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3;
- (void)_reloadEntityProvider;
- (void)_requestCellLayoutWithColumnData:(id)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SKUIIndexPathRange *)a4;
- (void)dealloc;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUITracklistPageSection

- (SKUITracklistPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITracklistPageSection initWithPageComponent:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUITracklistPageSection;
  v5 = [(SKUIStorePageSection *)&v8 initWithPageComponent:v4];
  v6 = v5;
  if (v5) {
    [(SKUITracklistPageSection *)v5 _reloadEntityProvider];
  }

  return v6;
}

- (void)dealloc
{
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(SKUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v6 addItemViewElement:v9];

  uint64_t v10 = [v7 item];
  id v11 = [(SKUITracklistPageSection *)self _viewElementForIndex:v10];
  [v6 addItemViewElement:v11];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUITracklistPageSection;
  id v4 = [(SKUIStorePageSection *)&v6 applyUpdateType:a3];
  if (v4 != (id)2) {
    [(SKUITracklistPageSection *)self _reloadEntityProvider];
  }
  return (int64_t)v4;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v4 item]);
  objc_super v6 = [v5 style];

  id v7 = [v6 ikBackgroundColor];
  objc_super v8 = [v7 color];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUITracklistPageSection;
    id v9 = [(SKUIStorePageSection *)&v12 backgroundColorForIndexPath:v4];
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  objc_super v6 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v4 item]);
  id v7 = v6;
  if (v6)
  {
    if ([v6 elementType] == 146)
    {
      objc_super v8 = [v5 collectionView];
      id v9 = (uint64_t *)&SKUITracklistLockupCollectionViewCellReuseIdentifier;
    }
    else
    {
      v15 = [(SKUIStorePageSection *)self pageComponent];
      v16 = [v15 viewElement];
      v17 = [v16 header];

      objc_super v8 = [v5 collectionView];
      id v9 = &SKUITracklistSectionHeaderReuseIdentifier;
      if (v7 == v17) {
        id v9 = &SKUITracklistHeaderReuseIdentifier;
      }
    }
    id v11 = [v8 dequeueReusableCellWithReuseIdentifier:*v9 forIndexPath:v4];

    [v5 activePageWidth];
    [v11 reloadWithViewElement:v7 width:self->_cellLayoutContext context:v18 + -30.0];
  }
  else
  {
    uint64_t v10 = [v5 collectionView];
    id v11 = [v10 dequeueReusableCellWithReuseIdentifier:0x1F1C9A748 forIndexPath:v4];

    objc_super v12 = [(SKUIStorePageSection *)self pageComponent];
    v13 = [v12 viewElement];
    v14 = [v13 style];
    [v11 setColoringWithStyle:v14];

    [v11 setLeftEdgeInset:0.0];
    [v11 setRightEdgeInset:0.0];
    [v11 setVerticalAlignment:1];
  }

  return v11;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  [v5 activePageWidth];
  double v7 = v6;

  uint64_t v8 = [v4 item];
  id v9 = [(SKUITracklistPageSection *)self _viewElementForIndex:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 elementType] == 146)
    {
      id v11 = off_1E64210A8;
    }
    else
    {
      v13 = [(SKUIStorePageSection *)self pageComponent];
      v14 = [v13 viewElement];
      v15 = [v14 header];

      id v11 = off_1E64210B8;
      if (v10 == v15) {
        id v11 = off_1E64210A0;
      }
    }
    [(__objc2_class *)*v11 sizeThatFitsWidth:v10 viewElement:self->_cellLayoutContext context:v7 + -30.0];
    double v12 = v16;
  }
  else
  {
    double v12 = 15.0;
  }

  double v17 = v7;
  double v18 = v12;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v4 item]);
  if ([v5 isEnabled])
  {
    double v6 = [(SKUIStorePageSection *)self context];
    double v7 = [v6 collectionView];
    uint64_t v8 = [v7 cellForItemAtIndexPath:v4];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
    v15 = &unk_1E6429AB0;
    double v16 = self;
    id v17 = v8;
    id v18 = v4;
    id v19 = v5;
    id v9 = v8;
    [v19 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:&v12];
  }
  else
  {
    [v5 dispatchEvent:0x1F1C94B88 eventAttribute:0x1F1C94BA8 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
  uint64_t v10 = [(SKUIStorePageSection *)self context];
  id v11 = [v10 collectionView];
  [v11 deselectItemAtIndexPath:v4 animated:0];
}

void __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E6429A88;
  double v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  char v11 = a2;
  char v12 = a3;
  id v10 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  objc_super v3 = [v2 collectionView];
  id v4 = [v3 indexPathForCell:*(void *)(a1 + 40)];

  if ([v4 isEqual:*(void *)(a1 + 48)]
    && (!*(unsigned char *)(a1 + 64) || !*(unsigned char *)(a1 + 65))
    && [*(id *)(a1 + 56) elementType] == 146)
  {
    [*(id *)(a1 + 40) togglePreviewPlaybackAnimated:1];
  }
}

- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SKUIIndexPathRange *)a4
{
  double y = a3.y;
  double x = a3.x;
  int64_t v8 = [(SKUITracklistPageSection *)self numberOfCells];
  if (self->_lastNeedsMoreCount < v8)
  {
    unint64_t v9 = v8;
    long long v10 = *(_OWORD *)&a4->var2;
    long long v17 = *(_OWORD *)&a4->var0;
    long long v18 = v10;
    uint64_t v11 = [(SKUIStorePageSection *)self itemRangeForIndexPathRange:&v17];
    if (v12 + v11 + 30 >= v9)
    {
      self->_lastNeedsMoreCount = v9;
      uint64_t v13 = [(SKUIStorePageSection *)self pageComponent];
      v14 = [v13 viewElement];
      [v14 dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUITracklistPageSection;
  long long v15 = *(_OWORD *)&a4->var2;
  long long v17 = *(_OWORD *)&a4->var0;
  long long v18 = v15;
  -[SKUIStorePageSection collectionViewWillScrollToOffset:visibleRange:](&v16, sel_collectionViewWillScrollToOffset_visibleRange_, &v17, x, y);
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  double v7 = [(SKUIStorePageSection *)self pageComponent];
  int64_t v8 = [v7 viewElement];

  [v6 beginActiveImpressionForViewElement:v8];
  unint64_t v9 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v4 item]);

  [v6 beginActiveImpressionForViewElement:v9];
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v10 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  double v7 = [(SKUIStorePageSection *)self pageComponent];
  int64_t v8 = [v7 viewElement];

  [v6 endActiveImpressionForViewElement:v8];
  unint64_t v9 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v4 item]);

  [v6 endActiveImpressionForViewElement:v9];
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v10 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  columnData = self->_columnData;
  id v7 = a4;
  id v8 = a3;
  [(SKUITracklistPageSection *)self _requestCellLayoutWithColumnData:columnData];
  v9.receiver = self;
  v9.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v9 entityProvider:v8 didInvalidateWithContext:v7];
}

- (id)firstAppearanceIndexPath
{
  uint64_t v3 = [(SKUITracklistPageSection *)self numberOfCells];
  if (v3 < 1)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 1;
    do
    {
      double v6 = [(SKUITracklistPageSection *)self _viewElementForIndex:v5 - 1];
      if ([v6 elementType] == 146 && objc_msgSend(v6, "isSelected"))
      {
        id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v5 - 1, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
      }
      else
      {
        id v7 = 0;
      }

      if (v7) {
        break;
      }
    }
    while (v5++ < v4);
  }

  return v7;
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  id v20 = a3;
  double v6 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  uint64_t v7 = [(SKUITracklistPageSection *)self numberOfCells];
  if (v7 < 1)
  {
LABEL_5:
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      objc_super v10 = [(SKUITracklistPageSection *)self _viewElementForIndex:v9];
      char v11 = [v20 isDescendentFromViewElement:v10];

      if (v11) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v9, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    if (v12)
    {
      uint64_t v13 = objc_alloc_init(SKUIModalSourceViewProvider);
      [(SKUIModalSourceViewProvider *)v13 setUserInfo:v20];
      v14 = [(SKUIStorePageSection *)self context];
      long long v15 = [v14 collectionView];
      objc_super v16 = [v15 cellForItemAtIndexPath:v12];

      long long v17 = [v20 itmlID];
      long long v18 = [v16 viewForElementIdentifier:v17];

      if (v18) {
        id v19 = v18;
      }
      else {
        id v19 = v16;
      }
      [(SKUIModalSourceViewProvider *)v13 setOriginalSourceView:v19];

      goto LABEL_7;
    }
  }
  uint64_t v13 = 0;
LABEL_7:
  v6[2](v6, v13);
}

- (int64_t)numberOfCells
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v3 = [v2 viewElement];

  uint64_t v4 = [v3 header];

  int64_t v5 = v4 != 0;
  double v6 = [v3 tracks];
  uint64_t v7 = v6;
  if (v6)
  {
    v5 += [v6 count];
  }
  else
  {
    uint64_t v8 = [v3 sections];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) flattenedChildren];
          v5 += [v13 count];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    if ((unint64_t)[v8 count] >= 2) {
      int64_t v5 = v5 + [v8 count] - 1;
    }
  }
  return v5;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  int64_t v5 = [(SKUITracklistPageSection *)self numberOfCells];
  if (v5 <= 29 && self->_lastNeedsMoreCount < v5)
  {
    self->_lastNeedsMoreCount = v5;
    double v6 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v7 = [v6 viewElement];
    [v7 dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v8 prefetchResourcesWithReason:a3];
}

- (id)relevantEntityProviders
{
  v7.receiver = self;
  v7.super_class = (Class)SKUITracklistPageSection;
  uint64_t v3 = [(SKUIStorePageSection *)&v7 relevantEntityProviders];
  uint64_t v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      uint64_t v5 = objc_msgSend(v3, "setByAddingObject:");

      uint64_t v4 = (void *)v5;
    }
    else
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    }
  }

  return v4;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v11 = a3;
  uint64_t v5 = [(SKUIStorePageSection *)self context];
  double v6 = [v5 collectionView];
  objc_super v7 = [v6 cellForItemAtIndexPath:v11];

  if (v7)
  {
    [v5 activePageWidth];
    double v9 = v8;
    uint64_t v10 = -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", [v11 item]);
    [v7 reloadWithViewElement:v10 width:self->_cellLayoutContext context:v9 + -30.0];
  }
}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  if (a3 != 2) {
    return 0;
  }
  uint64_t v4 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v5 = [v4 viewElement];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke;
  id v19 = &unk_1E6429B00;
  uint64_t v20 = self;
  id v7 = v6;
  id v21 = v7;
  [v5 enumerateTracksUsingBlock:&v16];
  -[SKUITracklistPageSection _widthForButtonElements:](self, "_widthForButtonElements:", v7, v16, v17, v18, v19, v20);
  double v9 = v8;
  uint64_t v10 = [(SKUITracklistColumnData *)self->_columnData columnForIdentifier:1];
  [v10 preferredWidth];
  BOOL v12 = v9 != v11;
  if (v9 != v11)
  {
    [v10 setPreferredWidth:v9];
    columnData = self->_columnData;
    v14 = [(SKUIStorePageSection *)self context];
    [v14 activePageWidth];
    -[SKUITracklistColumnData adjustColumnsToFitWidth:](columnData, "adjustColumnsToFitWidth:");

    [(SKUITracklistPageSection *)self _requestCellLayoutWithColumnData:self->_columnData];
  }

  return v12;
}

void __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke_2;
  v4[3] = &unk_1E6429AD8;
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateColumnsForTrack:a2 usingBlock:v4];
}

void __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5 && [v6 columnIdentifier] == 1) {
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
  }
}

- (UIEdgeInsets)sectionContentInset
{
  v22.receiver = self;
  v22.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v22 sectionContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v21 = 0;
  double v11 = [(SKUIStorePageSection *)self pageComponent];
  BOOL v12 = [v11 viewElement];
  uint64_t v13 = [v12 style];
  double v14 = SKUIViewElementPaddingForStyle(v13, &v21);
  double v16 = v15;

  if (v21) {
    double v17 = v14;
  }
  else {
    double v17 = v4;
  }
  if (v21) {
    double v18 = v16;
  }
  else {
    double v18 = v8;
  }
  double v19 = v6;
  double v20 = v10;
  result.right = v20;
  result.bottom = v18;
  result.left = v19;
  result.top = v17;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v10 collectionView];
  BOOL v12 = [v11 cellForItemAtIndexPath:v9];

  LOBYTE(v5) = [v12 updateWithItemState:v8 context:self->_cellLayoutContext animated:v5];
  return v5;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9A748];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9B2A8];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUITracklistLockupCollectionViewCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C8F728];
  columnData = self->_columnData;
  self->_columnData = 0;

  double v7 = self->_cellLayoutContext;
  id v8 = [[SKUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v7];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v8;

  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  double v10 = [(SKUITracklistPageSection *)self _columnData];
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:v10 forKey:0x1F1C8E028];
  [v4 activePageWidth];
  objc_msgSend(v10, "adjustColumnsToFitWidth:");
  [(SKUITracklistPageSection *)self _requestCellLayoutWithColumnData:v10];
  v11.receiver = self;
  v11.super_class = (Class)SKUITracklistPageSection;
  [(SKUIStorePageSection *)&v11 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  columnData = self->_columnData;
  id v8 = a4;
  id v9 = [(SKUIStorePageSection *)self context];
  [v9 activePageWidth];
  -[SKUITracklistColumnData adjustColumnsToFitWidth:](columnData, "adjustColumnsToFitWidth:");

  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setActivePageWidth:width];
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:self->_columnData forKey:0x1F1C8E028];
  [(SKUITracklistPageSection *)self _requestCellLayoutWithColumnData:self->_columnData];
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  id v9 = [v8 collectionView];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SKUITracklistPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E6429860;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  double v17 = self;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [(SKUITracklistPageSection *)self _enumerateVisibleViewElementsUsingBlock:v13];
}

void __56__SKUITracklistPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:a2];
  [v3 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 56) + 88)];
}

- (id)_columnData
{
  columnData = self->_columnData;
  if (!columnData)
  {
    id v4 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v5 = [v4 viewElement];

    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__SKUITracklistPageSection__columnData__block_invoke;
    v29[3] = &unk_1E6429B50;
    v29[4] = self;
    v32 = v33;
    id v8 = v6;
    id v30 = v8;
    id v9 = v7;
    id v31 = v9;
    [v5 enumerateTracksUsingBlock:v29];
    id v10 = SKUIFontLimitedPreferredFontForTextStyle(20, 5);
    id v11 = SKUIFontPreferredFontForTextStyle(5);
    id v12 = [(SKUITracklistColumnData *)self->_columnData columns];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    char v21 = __39__SKUITracklistPageSection__columnData__block_invoke_3;
    objc_super v22 = &unk_1E6429B78;
    id v13 = v9;
    v28 = v33;
    id v23 = v13;
    v24 = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v11;
    id v26 = v15;
    id v16 = v10;
    id v27 = v16;
    [v12 enumerateObjectsUsingBlock:&v19];

    double v17 = objc_msgSend(v5, "header", v19, v20, v21, v22);
    if (v17) {
      [(SKUITracklistColumnData *)self->_columnData enumerateColumnsForHeader:v17 usingBlock:&__block_literal_global_51];
    }

    _Block_object_dispose(v33, 8);
    columnData = self->_columnData;
  }

  return columnData;
}

void __39__SKUITracklistPageSection__columnData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 96);
  if (!v5)
  {
    id v6 = [[SKUITracklistColumnData alloc] initWithRepresentativeTrack:v3];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 96);
    *(void *)(v7 + 96) = v6;

    [*(id *)(*(void *)(a1 + 32) + 96) setInterColumnSpacing:15.0];
    [*(id *)(*(void *)(a1 + 32) + 96) setLeftEdgeInset:15.0];
    [*(id *)(*(void *)(a1 + 32) + 96) setRightEdgeInset:15.0];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 96);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__SKUITracklistPageSection__columnData__block_invoke_2;
  v10[3] = &unk_1E6429B28;
  uint64_t v9 = *(void *)(a1 + 56);
  v10[4] = v4;
  uint64_t v13 = v9;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v5 enumerateColumnsForTrack:v3 usingBlock:v10];
}

void __39__SKUITracklistPageSection__columnData__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [a2 columnIdentifier];
  if (v8 == 1)
  {
    if (v7) {
      [*(id *)(a1 + 40) addObjectsFromArray:v7];
    }
  }
  else
  {
    if (v8)
    {
      id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
      id v16 = [*(id *)(a1 + 48) objectForKey:v9];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v17 = v7;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_super v22 = objc_msgSend(*(id *)(a1 + 32), "_representativeStringForViewElement:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
            id v23 = v22;
            if (v22)
            {
              if (!v16 || (unint64_t v24 = [v22 length], v24 > objc_msgSend(v16, "length"))) {
                [*(id *)(a1 + 48) setObject:v23 forKey:v9];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*(void *)(a1 + 32) + 88) sizeForBadgeElement:*(void *)(*((void *)&v29 + 1) + 8 * j)];
            uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
            if (*(double *)(v15 + 24) >= v14) {
              double v14 = *(double *)(v15 + 24);
            }
            *(double *)(v15 + 24) = v14;
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v11);
      }
    }
  }
}

void __39__SKUITracklistPageSection__columnData__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  id v6 = [*(id *)(a1 + 32) objectForKey:v5];
  switch([v16 columnIdentifier])
  {
    case 0:
      double v7 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      goto LABEL_4;
    case 1:
      [v16 setMaximumWidthFraction:0.3];
      [*(id *)(a1 + 40) _widthForButtonElements:*(void *)(a1 + 48)];
LABEL_4:
      [v16 setPreferredWidth:v7];
      goto LABEL_12;
    case 2:
      if (!v6) {
        goto LABEL_12;
      }
      id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v9 = (SKUIBarRatingView *)objc_msgSend(v8, "initWithObjectsAndKeys:", *(void *)(a1 + 56), *MEMORY[0x1E4FB06F8], 0);
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v9];
      [v10 size];
      *(float *)&double v11 = v11;
      double v12 = ceilf(*(float *)&v11);
      break;
    case 3:
      id v9 = objc_alloc_init(SKUIBarRatingView);
      -[SKUIBarRatingView sizeThatFits:](v9, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      *(float *)&double v13 = v13;
      [v16 setPreferredWidth:ceilf(*(float *)&v13)];
      goto LABEL_11;
    case 5:
      if (!v6) {
        goto LABEL_12;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v9 = (SKUIBarRatingView *)objc_msgSend(v14, "initWithObjectsAndKeys:", *(void *)(a1 + 64), *MEMORY[0x1E4FB06F8], 0);
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v9];
      [v10 size];
      double v12 = ceil(v15);
      break;
    default:
      goto LABEL_12;
  }
  [v16 setPreferredWidth:v12];

LABEL_11:
LABEL_12:
}

void __39__SKUITracklistPageSection__columnData__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v4 = a3;
  if (([v10 sizesToFit] & 1) == 0)
  {
    +[SKUITracklistHeaderCollectionViewCell sizeForHeaderTitleLabel:v4];
    double v6 = v5;
    [v10 preferredWidth];
    float v8 = v6;
    double v9 = ceilf(v8);
    if (v7 < v9) {
      double v7 = v9;
    }
    [v10 setPreferredWidth:v7];
  }
}

- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self context];
  double v6 = [v5 collectionView];

  double v7 = [v6 indexPathsForVisibleItems];
  int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SKUITracklistPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_1E6429BC0;
  id v11 = v4;
  int64_t v12 = v8;
  v10[4] = self;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __68__SKUITracklistPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 section] == *(void *)(a1 + 48))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "_viewElementForIndex:", objc_msgSend(v4, "item"));
    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (BOOL)_isDynamicTracklist
{
  return self->_entityProvider != 0;
}

- (void)_reloadEntityProvider
{
  id v3 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = [v3 viewElement];

  id v4 = [v6 explicitEntityProvider];
  p_entityProvider = &self->_entityProvider;
  if (*p_entityProvider != v4 && ([(SKUIEntityProviding *)*p_entityProvider isEqual:v4] & 1) == 0) {
    objc_storeStrong((id *)p_entityProvider, v4);
  }
}

- (id)_representativeStringForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  id v6 = 0;
  if (v5 > 89)
  {
    if (v5 == 90)
    {
      id v8 = [v4 flattenedChildren];
      id v10 = [v8 firstObject];
      id v6 = [(SKUITracklistPageSection *)self _representativeStringForViewElement:v10];

      goto LABEL_10;
    }
    if (v5 == 138)
    {
      id v8 = v4;
      unint64_t v11 = [v8 labelViewStyle];
      id v6 = 0;
      if (v11 <= 3 && v11 != 2)
      {
        int64_t v12 = [v8 text];
        id v6 = [v12 string];
      }
      goto LABEL_10;
    }
    if (v5 != 141) {
      goto LABEL_11;
    }
  }
  else if ((unint64_t)(v5 - 12) >= 2)
  {
    if (v5 != 80) {
      goto LABEL_11;
    }
    double v7 = [v4 text];
    goto LABEL_9;
  }
  double v7 = [v4 buttonText];
LABEL_9:
  id v8 = v7;
  id v6 = [v7 string];
LABEL_10:

LABEL_11:

  return v6;
}

- (void)_requestCellLayoutWithColumnData:(id)a3
{
  id v23 = a3;
  id v4 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v5 = [v4 viewElement];

  id v6 = [v5 header];
  double v7 = [(SKUIStorePageSection *)self context];
  [v7 activePageWidth];
  double v9 = v8;
  [v23 leftEdgeInset];
  double v11 = v10;
  [v23 rightEdgeInset];
  double v13 = v12;

  uint64_t v14 = [(SKUITracklistPageSection *)self numberOfCells];
  if (v14 >= 1)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    float v17 = v9 - v11 - v13;
    double v18 = (double)(uint64_t)vcvtps_s32_f32(v17);
    do
    {
      uint64_t v19 = (void *)MEMORY[0x1C8749310]();
      uint64_t v20 = [(SKUITracklistPageSection *)self _viewElementForIndex:v16];
      uint64_t v21 = [v20 elementType];
      if (v21 == 146 || v21 == 48)
      {
        objc_super v22 = objc_opt_class();
        if (v22) {
          [v22 requestLayoutForViewElement:v20 width:self->_cellLayoutContext context:v18];
        }
      }

      ++v16;
    }
    while (v15 != v16);
  }
}

- (id)_viewElementForIndex:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v5 = [v4 viewElement];

  id v6 = [v5 header];
  double v7 = v6;
  if (a3 >= 1 && v6)
  {

    --a3;
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  double v8 = [v5 tracks];
  double v9 = v8;
  if (v8)
  {
    if (a3 >= (unint64_t)[v8 count])
    {
      double v7 = 0;
    }
    else
    {
      double v7 = [v9 objectAtIndex:a3];
    }
  }
  else
  {
    [v5 sections];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    double v7 = (void *)[v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v10);
          }
          double v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "flattenedChildren", (void)v16);
          int64_t v14 = [v13 count];
          if (a3 <= v14)
          {
            if (a3 == v14)
            {
              double v7 = 0;
            }
            else
            {
              double v7 = [v13 objectAtIndex:a3];
            }

            goto LABEL_22;
          }
          a3 += ~v14;
        }
        double v7 = (void *)[v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
LABEL_24:

  return v7;
}

- (double)_widthForButtonElements:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v3)
  {
    v33 = 0;
    v36 = 0;
    double v32 = 0.0;
    double v6 = 0.0;
    double v31 = 0.0;
    goto LABEL_46;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v45 = 0;
  v46 = 0;
  uint64_t v48 = *(void *)v50;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v50 != v48) {
        objc_enumerationMutation(obj);
      }
      double v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      uint64_t v9 = [v8 itemIdentifier];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = +[SKUIItemStateCenter defaultCenter];
        double v12 = [v11 stateForItemWithIdentifier:v10];

        double v13 = [v8 buyButtonDescriptor];
        LODWORD(v11) = [v13 canPersonalizeUsingItemState:v12];

        if (v11)
        {
          int64_t v14 = [(SKUIStorePageSection *)self context];
          uint64_t v15 = [v14 clientContext];
          long long v16 = +[SKUIItemOfferButton localizedTitleForItemState:v12 clientContext:v15];

          goto LABEL_11;
        }
      }
      else
      {
        double v12 = 0;
      }
      long long v16 = 0;
LABEL_11:
      uint64_t v17 = [v8 elementType];
      switch(v17)
      {
        case 141:
          if (+[SKUIStyledButton usesItemOfferAppearanceForButtonType:1 itemState:v12])
          {
            id v18 = v16;
          }
          else
          {
            id v18 = 0;
          }
          if (!v45)
          {
            uint64_t v21 = [v8 buttonTitleStyle];
            objc_super v22 = v21;
            if (!v21)
            {
              uint64_t v21 = [v8 style];
              v43 = v21;
            }
            uint64_t v45 = SKUIViewElementFontWithStyle(v21);
            id v23 = v43;
            if (!v22) {
LABEL_28:
            }
          }
          break;
        case 50:
          long long v19 = [v8 buttonImage];
          [v19 size];
          double v6 = v20;

LABEL_33:
          long long v29 = [v8 buttonText];
          id v28 = [v29 string];

          unint64_t v30 = [v28 length];
          if (v30 <= [v5 length])
          {
            id v18 = 0;
          }
          else
          {
            id v28 = v28;

            id v18 = 0;
            uint64_t v5 = v28;
          }
          goto LABEL_36;
        case 13:
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            unint64_t v24 = [v8 buttonText];
            id v18 = [v24 string];
          }
          if ([v8 buttonViewType] == 3)
          {
            objc_super v22 = [MEMORY[0x1E4FB1618] whiteColor];
            id v23 = [MEMORY[0x1E4FB1618] whiteColor];
            long long v25 = +[SKUIItemOfferButton cloudImageWithTintColor:v22 arrowTintColor:v23];
            [v25 size];
            double v6 = v26;

            goto LABEL_28;
          }
          break;
        default:
          goto LABEL_33;
      }
      if (!v18) {
        goto LABEL_33;
      }
      unint64_t v27 = [v18 length];
      id v28 = v46;
      if (v27 <= [v46 length]) {
        goto LABEL_37;
      }
      id v18 = v18;
      v46 = v18;
LABEL_36:

LABEL_37:
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  }
  while (v4);
  double v31 = 0.0;
  double v32 = 0.0;
  v33 = v46;
  if (v46)
  {
    v34 = objc_alloc_init(SKUIItemOfferButton);
    [(SKUIItemOfferButton *)v34 setTitle:v46];
    -[SKUIItemOfferButton sizeThatFits:](v34, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    *(float *)&double v35 = v35;
    double v32 = ceilf(*(float *)&v35);
  }
  v36 = (void *)v45;
  if (v5)
  {
    if (!v45)
    {
      v36 = [MEMORY[0x1E4FB08E0] systemFontOfSize:9.0];
    }
    id v37 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v38 = objc_msgSend(v37, "initWithObjectsAndKeys:", v36, *MEMORY[0x1E4FB06F8], 0);
    v39 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v38];
    [v39 size];
    *(float *)&double v40 = v40;
    double v31 = ceilf(*(float *)&v40);
  }
LABEL_46:
  if (v32 >= v31) {
    double v41 = v32;
  }
  else {
    double v41 = v31;
  }
  if (v41 >= v6) {
    double v6 = v41;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_columnData, 0);

  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITracklistPageSection initWithPageComponent:]";
}

@end