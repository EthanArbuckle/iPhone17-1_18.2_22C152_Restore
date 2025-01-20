@interface PXFeedContentLayout
- (PXFeedContentLayout)init;
- (PXFeedContentLayout)initWithViewModel:(id)a3;
- (PXFeedItemDecorationSource)decorationSource;
- (PXFeedViewModel)viewModel;
- (PXSectionedDataSource)presentedDataSource;
- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (int64_t)anchoredSublayoutIndex;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_invalidateCompositionParameters;
- (void)_invalidateFeedSectionSublayouts;
- (void)_invalidateFeedSelectionSnapshot;
- (void)_updateCompositionParameters;
- (void)_updateFeedSectionSublayouts;
- (void)_updateFeedSelectionSnapshot;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)safeAreaInsetsDidChange;
- (void)setPresentedDataSource:(id)a3;
- (void)update;
@end

@implementation PXFeedContentLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_decorationSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setPresentedDataSource:(id)a3
{
}

- (PXSectionedDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (PXFeedItemDecorationSource)decorationSource
{
  return self->_decorationSource;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v10 = a3;
  if ((void *)ViewModelObservationContext_254712 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXFeedContentLayout.m" lineNumber:232 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    [(PXFeedContentLayout *)self _invalidateFeedSectionSublayouts];
    if ((v6 & 4) == 0)
    {
LABEL_4:
      if ((v6 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_4;
  }
  [(PXFeedContentLayout *)self _invalidateFeedSelectionSnapshot];
  if ((v6 & 8) != 0) {
LABEL_5:
  }
    [(PXFeedContentLayout *)self _invalidateCompositionParameters];
LABEL_6:
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  char v6 = [(PXFeedContentLayout *)self viewModel];
  v7 = [v6 dataSource];
  v11[0] = [v7 identifier];
  v11[1] = a4;
  int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v8 = [[PXFeedSectionContentLayout alloc] initWithViewModel:v6 dataSource:v7 sectionIndexPath:v11];
  v9 = [[PXGDecoratingLayout alloc] initWithDecoratedLayout:v8];
  [(PXGDecoratingLayout *)v9 setActiveDecorations:&unk_1F02D5548];
  [(PXGDecoratingLayout *)v9 setContentSource:self->_decorationSource];
  [(PXGDecoratingLayout *)v9 setDecorationSource:self->_decorationSource];
  [(PXFeedItemDecorationSource *)self->_decorationSource setDecoratedLayout:v8];

  return v9;
}

- (int64_t)anchoredSublayoutIndex
{
  if ([(PXGLayout *)self numberOfSublayouts] == 1) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXFeedContentLayout;
  return [(PXGLayout *)&v4 anchoredSublayoutIndex];
}

- (void)_updateCompositionParameters
{
  id v12 = [(PXGCompositeLayout *)self composition];
  v3 = [(PXFeedContentLayout *)self viewModel];
  int v4 = [v3 wantsEmbeddedScrollView];

  if (v4)
  {
    [(PXGLayout *)self safeAreaInsets];
  }
  else
  {
    double v5 = *(double *)off_1E5DAAF10;
    double v6 = *((double *)off_1E5DAAF10 + 1);
    double v7 = *((double *)off_1E5DAAF10 + 2);
    double v8 = *((double *)off_1E5DAAF10 + 3);
  }
  objc_msgSend(v12, "setPadding:", v5, v6, v7, v8);
  v9 = [(PXFeedContentLayout *)self viewModel];
  id v10 = [v9 spec];
  v11 = [v10 scrollBehavior];
  objc_msgSend(v12, "setAxis:", objc_msgSend(v11, "axis"));
}

- (void)_invalidateCompositionParameters
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXFeedContentLayout _invalidateCompositionParameters]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedContentLayout.m", 169, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateFeedSelectionSnapshot
{
  id v4 = [(PXFeedContentLayout *)self viewModel];
  v3 = [v4 selectionSnapshot];
  [(PXFeedItemDecorationSource *)self->_decorationSource setSelectionSnapshot:v3];
}

- (void)_invalidateFeedSelectionSnapshot
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXFeedContentLayout _invalidateFeedSelectionSnapshot]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedContentLayout.m", 160, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateFeedSectionSublayouts
{
  v3 = [(PXFeedContentLayout *)self presentedDataSource];
  id v4 = [(PXFeedContentLayout *)self viewModel];
  double v5 = [v4 dataSource];
  double v6 = [v4 dataSourceChangeHistory];
  double v7 = objc_msgSend(v6, "coalescedChangeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v3, "identifier"), objc_msgSend(v5, "identifier"));

  double v8 = [v7 sectionChanges];
  -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", v8, [v5 numberOfSections], self);
  v9 = [v7 sectionsWithItemChanges];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PXFeedContentLayout__updateFeedSectionSublayouts__block_invoke;
  v12[3] = &unk_1E5DD3088;
  v12[4] = self;
  id v13 = v5;
  id v14 = v7;
  id v10 = v7;
  id v11 = v5;
  [v9 enumerateIndexesUsingBlock:v12];

  [(PXFeedItemDecorationSource *)self->_decorationSource setDataSource:v11 section:0];
  [(PXFeedContentLayout *)self setPresentedDataSource:v11];
}

void __51__PXFeedContentLayout__updateFeedSectionSublayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) sublayoutAtIndex:a2 loadIfNeeded:0];
  v3 = [v4 decoratedLayout];
  [v3 setDataSource:*(void *)(a1 + 40) changeDetails:*(void *)(a1 + 48)];
}

- (void)_invalidateFeedSectionSublayouts
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXFeedContentLayout _invalidateFeedSectionSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedContentLayout.m", 139, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXFeedContentLayout update]"];
      [v7 handleFailureInFunction:v8, @"PXFeedContentLayout.m", 124, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXFeedContentLayout *)self _updateFeedSectionSublayouts];
      if (!p_updateFlags->isPerformingUpdate)
      {
        id v13 = [MEMORY[0x1E4F28B00] currentHandler];
        id v14 = [NSString stringWithUTF8String:"-[PXFeedContentLayout update]"];
        [v13 handleFailureInFunction:v14, @"PXFeedContentLayout.m", 128, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXFeedContentLayout *)self _updateFeedSelectionSnapshot];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[PXFeedContentLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXFeedContentLayout.m", 131, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXFeedContentLayout *)self _updateCompositionParameters];
      unint64_t v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"-[PXFeedContentLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXFeedContentLayout.m", 134, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXFeedContentLayout;
  [(PXGCompositeLayout *)&v15 update];
}

- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  id v10 = [(PXFeedContentLayout *)self viewModel];
  id v11 = [v10 dataSource];
  long long v12 = *(_OWORD *)&a4->item;
  v24[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v24[1] = v12;
  id v13 = [v11 objectReferenceAtIndexPath:v24];

  if (!v13)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a3 object:self file:@"PXFeedContentLayout.m" lineNumber:106 description:@"Cannot be nil"];
  }
  uint64_t v23 = 0;
  id v14 = [(PXGLayout *)self sublayoutAtIndex:[(PXFeedContentLayout *)self sublayoutIndexForObjectReference:v13 options:0 updatedObjectReference:&v23] loadIfNeeded:0];
  if (!v14)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a3 object:self file:@"PXFeedContentLayout.m" lineNumber:110 description:@"Cannot be nil"];
  }
  objc_super v15 = [v14 decoratedLayout];
  if (!v15)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a3 object:self file:@"PXFeedContentLayout.m" lineNumber:112 description:@"Cannot be nil"];
  }
  unsigned int v16 = [v15 axSpriteIndexClosestToSpriteIndex:LODWORD(a4->item) inDirection:a5];
  if (v16 == -1)
  {
    long long v17 = *(_OWORD *)off_1E5DAB028;
    long long v18 = *((_OWORD *)off_1E5DAB028 + 1);
  }
  else
  {
    a4->item = v16;
    long long v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v18 = *(_OWORD *)&a4->item;
  }
  *(_OWORD *)&retstr->dataSourceIdentifier = v17;
  *(_OWORD *)&retstr->item = v18;

  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedContentLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXFeedContentLayout *)self _invalidateCompositionParameters];
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __63__PXFeedContentLayout_itemPlacementControllerForItemReference___block_invoke;
  objc_super v15 = &unk_1E5DCC0F0;
  unsigned int v16 = self;
  id v17 = v5;
  id v18 = v6;
  SEL v19 = a2;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateSublayoutsUsingBlock:&v12];

  id v10 = +[PXGMultiplexedItemPlacementController itemPlacementControllerForItemPlacementControllers:](PXGMultiplexedItemPlacementController, "itemPlacementControllerForItemPlacementControllers:", v8, v12, v13, v14, v15, v16);

  return v10;
}

void __63__PXFeedContentLayout_itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 decoratedLayout];
  id v6 = [v4 itemPlacementControllerForItemReference:*(void *)(a1 + 40)];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
    id v5 = v6;
  }
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(PXFeedContentLayout *)self viewModel];
    id v9 = [v8 dataSource];

    id v10 = [v9 objectReferenceForObjectReference:v7];
    if (!v10) {
      goto LABEL_7;
    }
    if (v9) {
      [v9 indexPathForObjectReference:v10];
    }
    if (*(void *)off_1E5DAAED8)
    {
      int64_t v11 = 0;
      id v12 = v10;

      id v7 = v12;
    }
    else
    {
LABEL_7:
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v13 = v7;
  *a5 = v13;

  return v11;
}

- (int64_t)scrollableAxis
{
  v2 = [(PXGCompositeLayout *)self composition];
  int64_t v3 = [v2 axis];

  return v3;
}

- (PXFeedContentLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedContentLayout;
  id v6 = [(PXGCompositeLayout *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXFeedViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_254712];
    id v8 = objc_alloc_init(PXFeedItemDecorationSource);
    decorationSource = v7->_decorationSource;
    v7->_decorationSource = v8;

    id v10 = objc_alloc_init(PXGStackedSublayoutComposition);
    [(PXGCompositeLayout *)v7 setComposition:v10];

    [(PXFeedContentLayout *)v7 _invalidateFeedSectionSublayouts];
    [(PXFeedContentLayout *)v7 _invalidateFeedSelectionSnapshot];
    [(PXFeedContentLayout *)v7 _invalidateCompositionParameters];
  }

  return v7;
}

- (PXFeedContentLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedContentLayout.m", 46, @"%s is not available as initializer", "-[PXFeedContentLayout init]");

  abort();
}

@end