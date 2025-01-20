@interface PXStoryRelatedOverlayItemDecorationSource
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXStoryRelatedOverlayItemDecorationSource)initWithObservableModel:(id)a3;
- (PXStoryRelatedOverlayItemDecorationSource)initWithViewModel:(id)a3;
- (PXStoryRelatedOverlayLayout)decoratedLayout;
- (PXStoryViewModel)viewModel;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
- (void)_invalidateSelectedRelatedIndex;
- (void)_updateSelectedRelatedIndex;
- (void)configureUpdater:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDecoratedLayout:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXStoryRelatedOverlayItemDecorationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
}

- (void)setViewModel:(id)a3
{
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryRelatedOverlayLayout)decoratedLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);
  return (PXStoryRelatedOverlayLayout *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ViewModelObservationContext_286609 == a5)
  {
    if ((a4 & 0x100000000000000) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__PXStoryRelatedOverlayItemDecorationSource_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5DD1E50;
      v10[4] = self;
      [(PXStoryController *)self performChanges:v10];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
    [(PXStoryController *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

uint64_t __74__PXStoryRelatedOverlayItemDecorationSource_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSelectedRelatedIndex];
}

- (void)_updateSelectedRelatedIndex
{
  v3 = [(PXStoryRelatedOverlayItemDecorationSource *)self viewModel];
  uint64_t v4 = [v3 highlightedRelatedIndex];
  int64_t selectedIndex = self->_selectedIndex;

  if (v4 != selectedIndex)
  {
    v6 = [(PXStoryRelatedOverlayItemDecorationSource *)self viewModel];
    self->_int64_t selectedIndex = [v6 highlightedRelatedIndex];

    v7 = [(PXStoryRelatedOverlayItemDecorationSource *)self decoratedLayout];
    id v8 = v7;
    int64_t v9 = self->_selectedIndex;
    BOOL v11 = v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0;
    [v7 showOrHideFullRelated:v11];

    id v12 = [(PXStoryRelatedOverlayItemDecorationSource *)self decoratedLayout];
    [v12 invalidateDecoration];
  }
}

- (void)_invalidateSelectedRelatedIndex
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSelectedRelatedIndex];
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4 = *(float *)off_1E5DAAF58;
  float v5 = *((float *)off_1E5DAAF58 + 1);
  float v6 = *((float *)off_1E5DAAF58 + 2);
  float v7 = *((float *)off_1E5DAAF58 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  else
  {
    float v5 = [(PXStoryRelatedOverlayItemDecorationSource *)self decoratedLayout];
    unsigned int v6 = [v5 relatedSelectionSpriteIndexRange];

    id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:self->_selectedIndex + v6];
  }
  return v3;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (void)setDecoratedLayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  float v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    unsigned int v6 = [(PXStoryRelatedOverlayItemDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    float v5 = obj;
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateSelectedRelatedIndex, v4.receiver, v4.super_class);
}

- (PXStoryRelatedOverlayItemDecorationSource)initWithObservableModel:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRelatedOverlayItemDecorationSource.m", 39, @"%s is not available as initializer", "-[PXStoryRelatedOverlayItemDecorationSource initWithObservableModel:]");

  abort();
}

- (PXStoryRelatedOverlayItemDecorationSource)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
  unsigned int v6 = [(PXStoryController *)&v9 initWithObservableModel:v5];
  float v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_int64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(PXStoryViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_286609];
  }

  return v7;
}

@end