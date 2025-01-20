@interface _TVListViewController
+ (id)_shadowCollectionElementForCollectionElement:(id)a3;
- (BOOL)_relatedElementIsGridAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (BOOL)contentFlowsVertically;
- (BOOL)isAlwaysSoftFocusEnabled;
- (BOOL)listCell:(id)a3 shouldAppearSelectedForPreviouslyFocusedView:(id)a4;
- (CGSize)_expectedCellSizeForElement:(id)a3 inSectionIndex:(int64_t)a4;
- (CGSize)_expectedHeaderCellSizeForElement:(id)a3 section:(int64_t)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4;
- (Class)cellClassForElement:(id)a3;
- (UIEdgeInsets)_marginForHeaderCellForElement:(id)a3 section:(int64_t)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TVListViewControllerDelegate)delegate;
- (id)_cachedViewControllerForElement:(id)a3;
- (id)_previewControllerWithElement:(id)a3 previewElement:(id *)a4;
- (id)_relatedContentElementForIndexPath:(id)a3;
- (id)_viewControllerForElement:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)makeCollectionViewWithFrame:(CGRect)a3;
- (void)_delayedUpdatePreview;
- (void)_updateCellMetrics;
- (void)_updatedPreviewWithItemAtIndexPath:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didUpdateCollectionViewByNeedingReload:(BOOL)a3 focusUpdate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAlwaysSoftFocusEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)templateControllerDidUpdateFocusFromView:(id)a3;
- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)updateSupplementaryViewsForSectionAtOldIndex:(int64_t)a3 oldElement:(id)a4 withNewIndex:(int64_t)a5 newElement:(id)a6 requiresReload:(BOOL *)a7 requiresRelayout:(BOOL *)a8;
- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4;
- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5;
- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _TVListViewController

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
  v3.receiver = self;
  v3.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v3 dealloc];
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  id v6 = a3;
  v7 = [v6 appDocument];
  v8 = [v7 templateElement];
  uint64_t v9 = objc_msgSend(v8, "tv_elementType");

  if (v9 == 74) {
    self->_configureForStackTemplate = 1;
  }
  v10 = [v6 sections];
  v11 = [v10 firstObject];

  v12 = [v11 firstItemElement];
  secondCellIndexPath = self->_secondCellIndexPath;
  self->_secondCellIndexPath = 0;

  if (objc_msgSend(v12, "tv_elementType") == 55 && objc_msgSend(v12, "tv_textStyle") == 3)
  {
    if ([v11 numberOfItems] < 2)
    {
      v16 = [v6 sections];
      unint64_t v17 = [v16 count];

      if (v17 < 2) {
        goto LABEL_10;
      }
      *(void *)&cellSize.height = &cellSize;
      *(void *)&long long v32 = 0x3032000000;
      *((void *)&v32 + 1) = __Block_byref_object_copy__5;
      *(void *)&long long v33 = __Block_byref_object_dispose__5;
      *((void *)&v33 + 1) = 0;
      v18 = objc_msgSend(v6, "sections", 0);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __59___TVListViewController_updateWithViewElement_cellMetrics___block_invoke;
      v41[3] = &unk_264BA8A18;
      v41[4] = &cellSize;
      [v18 enumerateObjectsUsingBlock:v41];

      v19 = (NSIndexPath *)[*(id *)(*(void *)&cellSize.height + 40) copy];
      v20 = self->_secondCellIndexPath;
      self->_secondCellIndexPath = v19;

      _Block_object_dispose(&cellSize, 8);
      v15 = (NSIndexPath *)*((void *)&v33 + 1);
    }
    else
    {
      v14 = [MEMORY[0x263F088C8] indexPathForItem:1 inSection:0];
      v15 = self->_secondCellIndexPath;
      self->_secondCellIndexPath = v14;
    }
  }
LABEL_10:
  self->_relatedContentElementValid = 0;
  relatedContentElement = self->_relatedContentElement;
  self->_relatedContentElement = 0;

  self->_previewUpdated = 0;
  v40.receiver = self;
  v40.super_class = (Class)_TVListViewController;
  long long v22 = *(_OWORD *)&a4->cellMargin.top;
  long long v37 = *(_OWORD *)&a4->cellInsetAlt.bottom;
  long long v38 = v22;
  long long v39 = *(_OWORD *)&a4->cellMargin.bottom;
  long long v23 = *(_OWORD *)&a4->cellInset.top;
  long long v33 = *(_OWORD *)&a4->cellPadding.bottom;
  long long v34 = v23;
  long long v24 = *(_OWORD *)&a4->cellInsetAlt.top;
  long long v35 = *(_OWORD *)&a4->cellInset.bottom;
  long long v36 = v24;
  long long v25 = *(_OWORD *)&a4->cellPadding.top;
  CGSize cellSize = a4->cellSize;
  long long v32 = v25;
  [(_TVMLCollectionViewController *)&v40 updateWithViewElement:v6 cellMetrics:&cellSize];
  v26 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];

  if (!v26)
  {
    v27 = [(_TVMLCollectionViewController *)self collectionElement];
    v28 = [v27 sections];

    if ([v28 count])
    {
      v29 = [v28 objectAtIndex:0];
    }
    else
    {
      v29 = 0;
    }
    if ([v29 numberOfItems] >= 1)
    {
      v30 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:v30];
    }
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v4 viewDidLoad];
  objc_super v3 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  [v3 setCollectionGradientMask:5];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)_TVListViewController;
  [(_TVListViewController *)&v16 viewWillAppear:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = [(_TVMLCollectionViewController *)self collectionView];
  v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(_TVMLCollectionViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
  if (v4 && !self->_pendingPreviewIndexPath)
  {
    lastPreviewedIndexPath = self->_lastPreviewedIndexPath;

    if (!lastPreviewedIndexPath)
    {
      uint64_t v6 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
      pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = v6;

      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
      [(_TVListViewController *)self performSelector:sel__delayedUpdatePreview withObject:0 afterDelay:0.0];
    }
  }
  else
  {
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVListViewController;
  -[_TVListViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3) {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v3 viewDidLayoutSubviews];
  [(_TVListViewController *)self _updateCellMetrics];
}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = objc_alloc_init(_TVCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v8 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v8 setMinimumInteritemSpacing:0.0];
  -[UICollectionViewFlowLayout setSectionInset:](v8, "setSectionInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  uint64_t v9 = -[_TVCollectionView initWithFrame:collectionViewLayout:]([_TVListView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);
  [(_TVListView *)v9 setAutoresizingMask:18];
  [(_TVListView *)v9 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x263F1D120] withReuseIdentifier:@"TVListHeaderViewIdentifier"];
  [(_TVCollectionView *)v9 setDelegate:self];
  [(_TVListView *)v9 setDataSource:self];
  [(_TVListView *)v9 setBackgroundColor:0];
  [(_TVListView *)v9 setOpaque:0];
  [(_TVListView *)v9 setClipsToBounds:0];
  [(_TVListView *)v9 setShowsVerticalScrollIndicator:0];
  [(_TVListView *)v9 setConfigureForStackTemplate:self->_configureForStackTemplate];

  return v9;
}

- (BOOL)contentFlowsVertically
{
  return 1;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  objc_super v5 = [(_TVMLCollectionViewController *)self collectionView];
  id v8 = [v5 collectionViewLayout];

  uint64_t v6 = [(_TVMLCollectionViewController *)self collectionElement];
  uint64_t v7 = [v6 style];
  objc_msgSend(v7, "tv_interitemSpacing");
  objc_msgSend(v8, "setMinimumLineSpacing:");

  [(_TVListViewController *)self _updateCellMetrics];
}

- (Class)cellClassForElement:(id)a3
{
  id v3 = a3;
  if ([v3 elementType] != 53
    && [v3 elementType] != 14
    && objc_msgSend(v3, "tv_elementType") == 55)
  {
    objc_msgSend(v3, "tv_textStyle");
  }
  objc_super v4 = (objc_class *)(id)objc_opt_class();

  return v4;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  -[_TVListViewController _expectedCellSizeForElement:inSectionIndex:](self, "_expectedCellSizeForElement:inSectionIndex:", v6, [a4 section]);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v10, "tv_elementType") == 53 || objc_msgSend(v10, "tv_elementType") == 14)
  {
    double v11 = [(_TVListViewController *)self _viewControllerForElement:v10];
    double v12 = +[TVInterfaceFactory sharedInterfaceFactory];
    long long v13 = [v12 _viewControllerFromElement:v10 existingController:v11];
  }
  else if (v8 && objc_msgSend(v10, "tv_elementType") == 55 && objc_msgSend(v10, "tv_textStyle") == 3)
  {
    long long v14 = [v8 contentView];
    long long v15 = [v14 subviews];
    objc_super v16 = [v15 firstObject];

    unint64_t v17 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v18 = [v17 _viewFromElement:v10 existingView:v16];

    objc_msgSend(v8, "setDisabled:", objc_msgSend(v10, "isDisabled"));
    [v8 setNeedsLayout];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_TVListViewController;
    [(_TVMLCollectionViewController *)&v19 updateVisibleCell:v8 atIndexPath:v9 withElement:v10];
  }
}

- (void)updateSupplementaryViewsForSectionAtOldIndex:(int64_t)a3 oldElement:(id)a4 withNewIndex:(int64_t)a5 newElement:(id)a6 requiresReload:(BOOL *)a7 requiresRelayout:(BOOL *)a8
{
  id v39 = a6;
  long long v13 = (void *)MEMORY[0x263F088C8];
  id v14 = a4;
  long long v15 = [v13 indexPathForItem:0 inSection:a3];
  objc_super v16 = [v39 header];
  if (v16)
  {
    unint64_t v17 = [v39 header];
    [(_TVListViewController *)self _expectedHeaderCellSizeForElement:v17 section:a5];
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v19 = *MEMORY[0x263F001B0];
    double v21 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  long long v22 = [v14 header];

  long long v23 = (void *)MEMORY[0x263F1D120];
  if (v22)
  {
    long long v24 = [(_TVMLCollectionViewController *)self collectionView];
    long long v25 = [v24 layoutAttributesForSupplementaryElementOfKind:*v23 atIndexPath:v15];
    [v25 frame];
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    double v27 = *MEMORY[0x263F001B0];
    double v29 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  if (v19 == v27 && v21 == v29)
  {
    v31 = [(_TVMLCollectionViewController *)self collectionView];
    long long v32 = [v31 _visibleSupplementaryViewOfKind:*v23 atIndexPath:v15];

    if (v32)
    {
      long long v33 = (void *)MEMORY[0x263F08D40];
      long long v34 = [v39 header];
      [(_TVListViewController *)self _marginForHeaderCellForElement:v34 section:a5];
      long long v35 = objc_msgSend(v33, "valueWithUIEdgeInsets:");
      [v32 setValue:v35 forTVViewStyle:@"padding"];

      long long v36 = +[TVInterfaceFactory sharedInterfaceFactory];
      long long v37 = [v39 header];
      id v38 = (id)[v36 _viewFromElement:v37 existingView:v32];
    }
  }
  else
  {
    *a7 = 1;
  }
}

- (void)didUpdateCollectionViewByNeedingReload:(BOOL)a3 focusUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
  self->_lastPreviewedIndexPath = 0;

  id v8 = [(_TVMLCollectionViewController *)self collectionElement];
  int v9 = [v8 isDisabled];

  if (!v9)
  {
    if (v4)
    {
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
      pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = 0;

      double v12 = [MEMORY[0x263F1C920] mainScreen];
      long long v13 = [v12 focusedView];

      id v14 = [(_TVMLCollectionViewController *)self collectionView];
      if ([v13 isDescendantOfView:v14])
      {
      }
      else
      {
        double v20 = [(_TVListViewController *)self parentViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v22 = [(_TVMLCollectionViewController *)self collectionView];
          int v23 = [v22 remembersLastFocusedIndexPath];

          if (v23)
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v24 = [(_TVMLCollectionViewController *)self collectionView];
            long long v25 = [v24 visibleCells];

            uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v46 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v30 setShouldAppearSelected:0];
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
              }
              while (v27);
            }
          }
          v31 = [(_TVListViewController *)self parentViewController];
          char v32 = [v31 setNeedsFocusUpdateToList];

          if ((v32 & 1) == 0)
          {
            long long v33 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
            long long v34 = self->_pendingPreviewIndexPath;
            self->_pendingPreviewIndexPath = v33;

            [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
            if (self->_pendingPreviewIndexPath) {
              [(_TVListViewController *)self performSelector:sel__delayedUpdatePreview withObject:0 afterDelay:0.0];
            }
          }
        }
      }
      long long v35 = [(_TVMLCollectionViewController *)self collectionView];
      [v35 _setRemembersPreviouslyFocusedItem:0];

      if (v5) {
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    long long v15 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];

    if (!v15) {
      goto LABEL_32;
    }
    objc_super v16 = self->_pendingPreviewIndexPath;
    if (!v16) {
      goto LABEL_29;
    }
    unint64_t v17 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    char v18 = [(NSIndexPath *)v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      id v39 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
      objc_super v40 = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = v39;

      if (v5) {
        goto LABEL_33;
      }
LABEL_35:
      v41 = [MEMORY[0x263F089C8] indexSet];
      cachedListChildViewControllers = self->_cachedListChildViewControllers;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __76___TVListViewController_didUpdateCollectionViewByNeedingReload_focusUpdate___block_invoke;
      v43[3] = &unk_264BA8A40;
      id v44 = v41;
      id v38 = v41;
      [(NSMutableArray *)cachedListChildViewControllers enumerateObjectsUsingBlock:v43];
      [(NSMutableArray *)self->_cachedListChildViewControllers removeObjectsAtIndexes:v38];

      goto LABEL_36;
    }
    if (self->_pendingPreviewIndexPath)
    {
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
      double v19 = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = 0;
    }
    else
    {
LABEL_29:
      long long v36 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
      double v19 = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = v36;
    }

    goto LABEL_31;
  }
  id v10 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];

  if (v10)
  {
LABEL_31:
    long long v37 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    [(_TVListViewController *)self _updatedPreviewWithItemAtIndexPath:v37];
  }
LABEL_32:
  if (!v5) {
    goto LABEL_35;
  }
LABEL_33:
  id v38 = self->_cachedListChildViewControllers;
  self->_cachedListChildViewControllers = 0;
LABEL_36:
}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 nextFocusedIndexPath];
  double v7 = [(_TVMLCollectionViewController *)self collectionElement];
  id v8 = [v7 sections];

  unint64_t v9 = [v6 section];
  if (v9 >= [v8 count]
    || (uint64_t v10 = [v6 item],
        objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")),
        double v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 numberOfItems],
        v11,
        long long v13 = v6,
        v10 >= v12))
  {

    long long v13 = 0;
  }
  if (!v6)
  {
    long long v24 = [(_TVMLCollectionViewController *)self collectionView];
    if ([v24 remembersLastFocusedIndexPath])
    {

LABEL_24:
      uint64_t v23 = 0;
      goto LABEL_25;
    }
    if ([(_TVListViewController *)self isAlwaysSoftFocusEnabled])
    {
    }
    else
    {
      long long v25 = [(UIViewController *)self->_previewController tv_associatedIKViewElement];
      uint64_t v26 = objc_msgSend(v25, "tv_elementType");

      if (v26 != 14) {
        goto LABEL_24;
      }
    }
    uint64_t v27 = [(_TVMLCollectionViewController *)self collectionView];
    uint64_t v23 = [v27 _remembersPreviouslyFocusedItem];

    goto LABEL_25;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = [(_TVMLCollectionViewController *)self collectionView];
  long long v15 = [v14 visibleCells];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v20 setShouldAppearSelected:0];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  self->_secondIndexPathFocused = 0;
  [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:v13];
  double v21 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
  pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
  self->_pendingPreviewIndexPath = v21;

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
  [(_TVListViewController *)self performSelector:sel__delayedUpdatePreview withObject:0 afterDelay:0.1];
  uint64_t v23 = 0;
  if ([v5 focusHeading] == 1)
  {
    if (self->_secondCellIndexPath && objc_msgSend(v13, "isEqual:"))
    {
      uint64_t v23 = 0;
      self->_secondIndexPathFocused = 1;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v28 = [(_TVMLCollectionViewController *)self collectionView];
  int v29 = [v28 remembersLastFocusedIndexPath];

  if (v23 != v29)
  {
    v30 = [(_TVMLCollectionViewController *)self collectionView];
    [v30 _setRemembersPreviouslyFocusedItem:v23];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(_TVMLCollectionViewController *)self collectionElement];
  id v8 = [v7 sections];
  unint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v10 = objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  uint64_t v11 = [v6 section];

  [(_TVListViewController *)self _expectedCellSizeForElement:v10 inSectionIndex:v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = [(_TVMLCollectionViewController *)self collectionElement];
  double v7 = [v6 sections];
  id v8 = [v7 objectAtIndexedSubscript:a5];

  unint64_t v9 = [v8 firstItemElement];
  uint64_t v10 = (double *)MEMORY[0x263F1D1C0];
  double v11 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v12 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  if (objc_msgSend(v9, "tv_elementType") == 53
    || objc_msgSend(v9, "tv_elementType") == 14
    || (double v13 = *v10, v14 = v10[2], objc_msgSend(v9, "tv_elementType") == 55) && objc_msgSend(v9, "tv_textStyle") == 3)
  {
    double v15 = [v9 style];
    objc_msgSend(v15, "tv_margin");
    double v13 = v16;
    double v14 = v17;
  }
  double v18 = v13;
  double v19 = v11;
  double v20 = v14;
  double v21 = v12;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v7 = [(_TVMLCollectionViewController *)self collectionElement];
  id v8 = [v7 sections];
  unint64_t v9 = [v8 objectAtIndex:a5];

  uint64_t v10 = [v9 header];
  [(_TVListViewController *)self _expectedHeaderCellSizeForElement:v10 section:a5];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v18 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 viewController];
    if (v10)
    {
      double v11 = [(_TVListViewController *)self childViewControllers];
      char v12 = [v11 containsObject:v10];

      if ((v12 & 1) == 0)
      {
        [(_TVListViewController *)self addChildViewController:v10];
        [v10 didMoveToParentViewController:self];
      }
    }
  }
  double v13 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
  if ([v13 isEqual:v9]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(_TVListViewController *)self _relatedElementIsGridAtIndexPath:v9])
  {
    double v14 = [MEMORY[0x263F1C920] mainScreen];
    double v15 = [v14 focusedView];
    double v16 = [(_TVMLCollectionViewController *)self collectionView];
    char v17 = [v15 isDescendantOfView:v16];

    if ((v17 & 1) == 0) {
      [v8 setShouldAppearSelected:1];
    }
  }
  else
  {
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v13 collectionView:a3 didEndDisplayingCell:v8 forItemAtIndexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 viewController];
    if (v9)
    {
      uint64_t v10 = [(_TVListViewController *)self childViewControllers];
      if ([v10 containsObject:v9])
      {
        double v11 = [v9 view];
        int v12 = [v11 isDescendantOfView:v8];

        if (v12)
        {
          [v9 willMoveToParentViewController:0];
          [v9 removeFromParentViewController];
        }
      }
      else
      {
      }
    }
  }
}

- (void)templateControllerDidUpdateFocusFromView:(id)a3
{
  previewController = self->_previewController;
  id v5 = a3;
  id v6 = [(UIViewController *)previewController view];
  int v7 = [v5 isDescendantOfView:v6];

  if (v7)
  {
    id v8 = [(_TVMLCollectionViewController *)self collectionView];
    id v9 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    id v6 = [v8 cellForItemAtIndexPath:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 updateFloatingViewControlStateForPreviouslyFocusedView:v6];
    }
  }
  id v15 = [(_TVMLCollectionViewController *)self collectionView];
  if (([v15 remembersLastFocusedIndexPath] & 1) == 0)
  {
    BOOL v10 = [(_TVListViewController *)self isAlwaysSoftFocusEnabled];
    if (v10
      || ([(UIViewController *)self->_previewController tv_associatedIKViewElement],
          id v6 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "tv_elementType") == 14))
    {
      double v11 = [MEMORY[0x263F1C920] mainScreen];
      int v12 = [v11 focusedView];
      objc_super v13 = [(UIViewController *)self->_previewController view];
      int v14 = [v12 isDescendantOfView:v13];

      if (v10)
      {

        if (!v14) {
          return;
        }
      }
      else
      {

        if ((v14 & 1) == 0) {
          return;
        }
      }
      id v15 = [(_TVMLCollectionViewController *)self collectionView];
      [v15 _setRemembersPreviouslyFocusedItem:1];
    }
    else
    {
    }
  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  BOOL v4 = [(_TVListViewController *)self traitCollection];
  BOOL v5 = [v4 forceTouchCapability] != 2;

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v8 scrollViewDidScroll:v4];
  BOOL v5 = [(_TVListViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(_TVListViewController *)self delegate];
    [v7 listViewController:self didScrollWithScrollView:v4];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_TVListViewController;
  [(_TVMLCollectionViewController *)&v9 scrollViewWillEndDragging:a3 withVelocity:a4.x targetContentOffset:a4.y];
  if (self->_secondIndexPathFocused)
  {
    int v7 = [(_TVMLCollectionViewController *)self collectionView];
    [v7 contentInset];
    a5->double y = -v8;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(_TVMLCollectionViewController *)self collectionElement];
  objc_super v9 = [v8 sections];
  BOOL v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));

  double v11 = objc_msgSend(v10, "elementForItemAtIndex:", objc_msgSend(v7, "item"));
  if (objc_msgSend(v11, "tv_elementType") == 53 || objc_msgSend(v11, "tv_elementType") == 14)
  {
    int v12 = [v11 elementName];
    objc_super v13 = [v6 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];

    int v14 = [(_TVListViewController *)self _viewControllerForElement:v11];
    id v15 = [v14 view];
    [v13 bounds];
    objc_msgSend(v15, "setFrame:");
    [v15 setAutoresizingMask:18];
    [v13 setViewController:v14];
  }
  else if (objc_msgSend(v11, "tv_elementType") == 55 && objc_msgSend(v11, "tv_textStyle") == 3)
  {
    char v17 = [v11 elementName];
    objc_super v13 = [v6 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v7];

    objc_super v18 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v19 = [v18 _viewFromElement:v11 existingView:0];

    objc_msgSend(v13, "setDisabled:", objc_msgSend(v11, "isDisabled"));
    double v20 = [v13 contentView];
    [v20 addSubview:v19];

    [v13 setNeedsLayout];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_TVListViewController;
    objc_super v13 = [(_TVMLCollectionViewController *)&v21 collectionView:v6 cellForItemAtIndexPath:v7];
    if (objc_msgSend(v11, "tv_elementType") == 23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 setDelegate:self];
      }
    }
  }

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(_TVMLCollectionViewController *)self collectionElement];
  int v12 = [v11 sections];
  objc_super v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));

  int v14 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"TVListHeaderViewIdentifier" forIndexPath:v8];

  [v14 transferLayoutStylesFromElement:v13];
  id v15 = (void *)MEMORY[0x263F08D40];
  double v16 = [v13 header];
  uint64_t v17 = [v8 section];

  [(_TVListViewController *)self _marginForHeaderCellForElement:v16 section:v17];
  objc_super v18 = objc_msgSend(v15, "valueWithUIEdgeInsets:");
  [v14 setValue:v18 forTVViewStyle:@"padding"];

  objc_msgSend(v14, "tv_setAssociatedIKViewElement:", 0);
  double v19 = +[TVInterfaceFactory sharedInterfaceFactory];
  double v20 = [v13 header];
  id v21 = (id)[v19 _viewFromElement:v20 existingView:v14];

  return v14;
}

- (BOOL)listCell:(id)a3 shouldAppearSelectedForPreviouslyFocusedView:(id)a4
{
  id v6 = (void *)MEMORY[0x263F1C920];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 mainScreen];
  id v10 = [v9 focusedView];

  double v11 = [(UIViewController *)self->_previewController view];
  char v12 = [v10 isDescendantOfView:v11];

  objc_super v13 = [(_TVMLCollectionViewController *)self collectionView];
  char v14 = [v10 isDescendantOfView:v13];

  id v15 = [(_TVMLCollectionViewController *)self collectionView];
  char v16 = [v7 isDescendantOfView:v15];

  uint64_t v17 = [(UIViewController *)self->_previewController view];
  char v18 = [v7 isDescendantOfView:v17];

  if (v8 == v7) {
    char v19 = v12;
  }
  else {
    char v19 = 0;
  }
  char v20 = (v16 | v18) & ((v12 | v14) ^ 1);
  if ([(_TVListViewController *)self isAlwaysSoftFocusEnabled])
  {
    char v21 = v19 | v20;
  }
  else
  {
    long long v22 = [(UIViewController *)self->_previewController tv_associatedIKViewElement];
    if (objc_msgSend(v22, "tv_elementType") == 14) {
      char v21 = v19 | v20;
    }
    else {
      char v21 = 0;
    }
  }
  return v21;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_TVMLCollectionViewController *)self collectionElement];
  id v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = [(_TVMLCollectionViewController *)self collectionView];
    id v9 = [v8 visibleCells];

    id v10 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4, (void)v22);
          [v10 addObjectsFromArray:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [(_TVMLCollectionViewController *)self collectionWrappingView];
    char v18 = [v17 headerView];
    char v19 = objc_msgSend(v18, "tv_impressionableElementsForDocument:", v4);
    [v10 addObjectsFromArray:v19];

    if ([v10 count])
    {
      char v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v10];
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (id)_shadowCollectionElementForCollectionElement:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(_TVShadowViewElement);
  id v15 = [[_TVShadowViewElementID alloc] initWithViewElement:v3];
  -[_TVShadowViewElement setElementID:](v4, "setElementID:");
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v16 = v3;
  id v6 = [v3 sections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 elementType] == 49)
        {
          uint64_t v12 = [[_TVShadowViewElementID alloc] initWithViewElement:v11];
          uint64_t v13 = objc_alloc_init(_TVShadowViewElement);
          [(_TVShadowViewElement *)v13 setElementID:v12];
          [(_TVShadowViewElement *)v13 setParent:v4];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(_TVShadowViewElement *)v4 setChildren:v5];
  }

  return v4;
}

- (void)_updateCellMetrics
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = [(_TVMLCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 collectionViewLayout];

  id v5 = [(_TVMLCollectionViewController *)self collectionElement];
  id v6 = [v5 style];
  objc_msgSend(v6, "tv_padding");
  double v8 = v7;
  double v10 = v9;

  id v11 = [(_TVMLCollectionViewController *)self collectionElement];
  uint64_t v12 = [v11 style];
  objc_msgSend(v12, "tv_width");
  v59 = (void *)v4;
  if (v13 == 0.0)
  {
    uint64_t v14 = [(_TVMLCollectionViewController *)self collectionView];
    [v14 bounds];
    double v16 = v15 - v8 - v10;
  }
  else
  {
    double v16 = v13;
  }

  double cachedCellWidth = self->_cachedCellWidth;
  self->_double cachedCellWidth = v16;
  v60 = self;
  v61 = objc_opt_new();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v18 = [(_TVMLCollectionViewController *)self collectionElement];
  long long v19 = [v18 sections];

  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v64;
    uint64_t v24 = *MEMORY[0x263F4B2F0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v64 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if ([v26 numberOfItems] >= 1)
        {
          uint64_t v27 = 0;
          while (1)
          {
            uint64_t v28 = [v26 elementForItemAtIndex:v27];
            int v29 = [v28 elementName];
            char v30 = [v29 isEqualToString:v24];

            if (v30) {
              break;
            }

            if (++v27 >= [v26 numberOfItems]) {
              goto LABEL_30;
            }
          }
          if (v28)
          {
            long long v31 = [v28 style];
            objc_msgSend(v31, "tv_height");
            double v33 = v32;

            if (v33 <= 2.22044605e-16)
            {
              uint64_t v36 = +[TVInterfaceFactory sharedInterfaceFactory];
              long long v34 = [v36 _viewFromElement:v28 existingView:0];

              long long v37 = [v28 style];
              objc_msgSend(v37, "tv_padding");
              double v39 = v38;
              double v41 = v40;

              objc_msgSend(v34, "sizeThatFits:", v60->_cachedCellWidth, 0.0);
              double v43 = v41 + v39 + v42;
              id v44 = [v28 style];
              objc_msgSend(v44, "tv_minHeight");
              double v46 = v45;

              if (v43 < v46 && v46 > 2.22044605e-16) {
                double v43 = v46;
              }
              long long v48 = [v28 style];
              objc_msgSend(v48, "tv_maxHeight");
              double v50 = v49;

              if (v43 <= v50 || v50 <= 2.22044605e-16) {
                double v52 = v43;
              }
              else {
                double v52 = v50;
              }
              long long v35 = [NSNumber numberWithDouble:v52];
              v53 = [NSNumber numberWithInteger:v22];
              [v61 setObject:v35 forKeyedSubscript:v53];
            }
            else
            {
              long long v34 = [NSNumber numberWithDouble:v33];
              long long v35 = [NSNumber numberWithInteger:v22];
              [v61 setObject:v34 forKeyedSubscript:v35];
            }
          }
        }
LABEL_30:
        ++v22;
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v21);
  }

  if ([v61 count]) {
    v54 = v61;
  }
  else {
    v54 = 0;
  }
  v55 = v54;
  cachedListItemLockupHeightsBySection = v60->_cachedListItemLockupHeightsBySection;
  if (cachedListItemLockupHeightsBySection == v55)
  {
    objc_storeStrong((id *)&v60->_cachedListItemLockupHeightsBySection, v54);
    BOOL v58 = v16 == cachedCellWidth;
  }
  else
  {
    BOOL v57 = [(NSDictionary *)cachedListItemLockupHeightsBySection isEqualToDictionary:v55];
    objc_storeStrong((id *)&v60->_cachedListItemLockupHeightsBySection, v54);
    BOOL v58 = v57 && v16 == cachedCellWidth;
  }
  if (!v58) {
    [v59 invalidateLayout];
  }
}

- (void)_delayedUpdatePreview
{
  id v3 = [(_TVListViewController *)self view];
  uint64_t v4 = [v3 window];

  if (v4)
  {
    pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
    id v6 = pendingPreviewIndexPath;
    double v7 = self->_pendingPreviewIndexPath;
    self->_pendingPreviewIndexPath = 0;

    if ([(NSIndexPath *)self->_lastPreviewedIndexPath isEqual:v6])
    {
      if (v6) {
        [(_TVListViewController *)self _updatedPreviewWithItemAtIndexPath:v6];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastPreviewedIndexPath, pendingPreviewIndexPath);
      if (v6)
      {
        double v8 = [(_TVMLCollectionViewController *)self collectionElement];
        double v9 = [v8 sections];
        double v10 = objc_msgSend(v9, "objectAtIndex:", -[NSIndexPath section](v6, "section"));

        id v11 = objc_msgSend(v10, "elementForItemAtIndex:", -[NSIndexPath row](v6, "row"));
        uint64_t v12 = [(_TVMLCollectionViewController *)self collectionView];
        double v13 = [v12 cellForItemAtIndexPath:v6];

        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __46___TVListViewController__delayedUpdatePreview__block_invoke;
        v14[3] = &unk_264BA71A8;
        objc_copyWeak(&v16, &location);
        double v15 = v6;
        objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"highlight", 1, 1, 0, v13, v14);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (BOOL)_relatedElementIsGridAtIndexPath:(id)a3
{
  id v3 = [(_TVListViewController *)self _relatedContentElementForIndexPath:a3];
  uint64_t v4 = [v3 children];
  id v5 = [v4 firstObject];
  BOOL v6 = objc_msgSend(v5, "tv_elementType") == 14;

  return v6;
}

- (id)_relatedContentElementForIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_TVMLCollectionViewController *)self collectionElement];
  BOOL v6 = [v5 sections];
  double v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  double v8 = objc_msgSend(v7, "elementForItemAtIndex:", objc_msgSend(v4, "row"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v9 = objc_msgSend(v8, "children", 0);
  id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "tv_elementType") == 43)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)_updatedPreviewWithItemAtIndexPath:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_TVListViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(_TVListViewController *)self _relatedContentElementForIndexPath:v4];
    if (v7)
    {
      id v30 = 0;
      double v8 = [(_TVListViewController *)self _previewControllerWithElement:v7 previewElement:&v30];
      double v9 = (IKViewElement *)v30;
      if (v8) {
        goto LABEL_21;
      }
    }
    else
    {
      double v9 = 0;
    }
    if (!self->_relatedContentElementValid)
    {

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v10 = [(_TVMLCollectionViewController *)self collectionElement];
      uint64_t v11 = [v10 children];

      id v7 = (id)[v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v11);
            }
            uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (objc_msgSend(v14, "tv_elementType") == 43)
            {
              id v7 = v14;
              goto LABEL_17;
            }
          }
          id v7 = (id)[v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      objc_storeStrong((id *)&self->_relatedContentElement, v7);
      self->_relatedContentElementValid = 1;
    }
    long long v15 = self->_relatedContentElement;

    if (v15)
    {
      long long v25 = v9;
      double v8 = [(_TVListViewController *)self _previewControllerWithElement:v15 previewElement:&v25];
      long long v16 = v25;

      double v9 = v16;
      id v7 = v15;
    }
    else
    {
      double v8 = 0;
      id v7 = 0;
    }
LABEL_21:
    if (v9 != self->_previewElement || v8 != self->_previewController)
    {
      objc_storeStrong((id *)&self->_previewElement, v9);
      if (v8 != self->_previewController)
      {
        objc_storeStrong((id *)&self->_previewController, v8);
        long long v17 = [(_TVMLCollectionViewController *)self collectionView];
        [v17 _setRemembersPreviouslyFocusedItem:0];

        long long v18 = [(_TVListViewController *)self delegate];
        [v18 listViewController:self updatePreviewViewController:v8];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIViewController *)self->_previewController setAlwaysSoftFocusEnabled:0];
    }
    long long v19 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    if ([v19 isEqual:v4]
      && ([(_TVListViewController *)self isAlwaysSoftFocusEnabled]
       || [(IKViewElement *)v9 tv_elementType] == 14))
    {
      uint64_t v20 = [MEMORY[0x263F1C920] mainScreen];
      uint64_t v21 = [v20 focusedView];
      uint64_t v22 = [(UIViewController *)self->_previewController view];
      int v23 = [v21 isDescendantOfView:v22];

      if (!v23)
      {
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v24 = [(_TVMLCollectionViewController *)self collectionView];
      long long v19 = [v24 cellForItemAtIndexPath:v4];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v19 setShouldAppearSelected:1];
      }
    }

    goto LABEL_34;
  }
LABEL_35:
}

- (id)_previewControllerWithElement:(id)a3 previewElement:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = [v7 children];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    int v23 = 0;
    goto LABEL_47;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v30 = v7;
  id obj = [v7 children];
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v10)
  {
    int v23 = 0;
    goto LABEL_46;
  }
  uint64_t v11 = v10;
  uint64_t v32 = a4;
  uint64_t v33 = *(void *)v35;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v35 != v33) {
        objc_enumerationMutation(obj);
      }
      double v13 = *(IKViewElement **)(*((void *)&v34 + 1) + 8 * v12);
      previewElement = self->_previewElement;
      if (previewElement == v13)
      {
        if (![*(id *)(*((void *)&v34 + 1) + 8 * v12) updateType])
        {
          int v23 = self->_previewController;
          if (a4) {
            *a4 = v13;
          }
          goto LABEL_46;
        }
        previewElement = self->_previewElement;
      }
      if (previewElement == v13
        && ([(IKViewElement *)v13 updateType] == 1 || [(IKViewElement *)v13 updateType] == 2))
      {
        if (self->_previewUpdated)
        {
          long long v18 = [(UIViewController *)self->_previewController view];
          LOBYTE(v15) = 1;
          goto LABEL_25;
        }
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
      }
      long long v16 = +[TVInterfaceFactory sharedInterfaceFactory];
      if (v15)
      {
        id v4 = [(UIViewController *)self->_previewController view];
        long long v17 = v4;
      }
      else
      {
        long long v17 = 0;
      }
      long long v18 = [v16 _viewFromElement:v13 existingView:v17];
      if (v15) {

      }
      long long v19 = [(UIViewController *)self->_previewController view];

      char v20 = v15 ^ 1;
      if (v18 != v19) {
        char v20 = 1;
      }
      if ((v20 & 1) == 0)
      {
        LOBYTE(v15) = 1;
        self->_previewUpdated = 1;
      }
LABEL_25:
      previewController = self->_previewController;
      if (v18)
      {
        uint64_t v22 = [(UIViewController *)previewController view];

        if (v18 == v22)
        {
          int v23 = self->_previewController;
        }
        else
        {
          int v23 = (UIViewController *)objc_alloc_init(MEMORY[0x263F1CB68]);
          [(UIViewController *)v23 setView:v18];
          [(UIViewController *)v23 tv_setAssociatedIKViewElement:v13];
        }
      }
      else
      {
        uint64_t v24 = [(UIViewController *)previewController tv_associatedIKViewElement];
        long long v25 = v24;
        if ((v15 & 1) != 0
          || objc_msgSend(v24, "tv_elementType") == 17 && -[IKViewElement tv_elementType](v13, "tv_elementType") == 17)
        {
          long long v26 = self->_previewController;
        }
        else
        {
          long long v26 = 0;
        }
        long long v27 = +[TVInterfaceFactory sharedInterfaceFactory];
        int v23 = [v27 _viewControllerFromElement:v13 existingController:v26];
      }
      a4 = v32;
      if (v32 && v23)
      {
        *uint64_t v32 = v13;

        goto LABEL_46;
      }

      if (v23) {
        goto LABEL_46;
      }
      ++v12;
    }
    while (v11 != v12);
    uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v11 = v28;
    int v23 = 0;
    if (v28) {
      continue;
    }
    break;
  }
LABEL_46:

  id v7 = v30;
LABEL_47:

  return v23;
}

- (id)_viewControllerForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVListViewController *)self _cachedViewControllerForElement:v4];
  if (!v5)
  {
    id v7 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v5 = [v7 _viewControllerFromElement:v4 existingController:0];

    if (v5)
    {
      cachedListChildViewControllers = self->_cachedListChildViewControllers;
      if (!cachedListChildViewControllers)
      {
        uint64_t v9 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
        uint64_t v10 = self->_cachedListChildViewControllers;
        self->_cachedListChildViewControllers = v9;

        cachedListChildViewControllers = self->_cachedListChildViewControllers;
      }
      if (([(NSMutableArray *)cachedListChildViewControllers containsObject:v5] & 1) == 0) {
        [(NSMutableArray *)self->_cachedListChildViewControllers addObject:v5];
      }
    }
  }

  return v5;
}

- (id)_cachedViewControllerForElement:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_cachedListChildViewControllers;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [_TVShadowViewElementID alloc];
        uint64_t v11 = objc_msgSend(v9, "tv_associatedIKViewElement", (void)v15);
        uint64_t v12 = [(_TVShadowViewElementID *)v10 initWithViewElement:v11];

        double v13 = [[_TVShadowViewElementID alloc] initWithViewElement:v4];
        if ([(_TVShadowViewElementID *)v12 isEqual:v13])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGSize)_expectedCellSizeForElement:(id)a3 inSectionIndex:(int64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double cachedCellWidth = self->_cachedCellWidth;
  double v8 = [v6 style];
  objc_msgSend(v8, "tv_padding");
  double v10 = v9;
  double v12 = v11;

  if (objc_msgSend(v6, "tv_elementType") == 53 || objc_msgSend(v6, "tv_elementType") == 14)
  {
    double v13 = [(_TVListViewController *)self _viewControllerForElement:v6];
    uint64_t v14 = [v13 view];
    objc_msgSend(v14, "sizeThatFits:", cachedCellWidth, 0.0);
    double cachedCellWidth = v15;
    double v17 = v16;
  }
  else if (objc_msgSend(v6, "tv_elementType") == 55 && objc_msgSend(v6, "tv_textStyle") == 3)
  {
    uint64_t v20 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v21 = [v20 _viewFromElement:v6 existingView:0];

    uint64_t v22 = [v6 style];
    objc_msgSend(v22, "tv_padding");
    double v24 = v23;
    double v26 = v25;

    double cachedCellWidth = self->_cachedCellWidth;
    objc_msgSend(v21, "sizeThatFits:", cachedCellWidth, 0.0);
    double v17 = v26 + v24 + v27;
  }
  else
  {
    uint64_t v28 = objc_msgSend(v6, "tv_elementType");
    long long v29 = [v6 style];
    objc_msgSend(v29, "tv_height");
    double v31 = v30;
    if (v28 == 52)
    {
      if (v30 == 0.0) {
        double v17 = 1.0;
      }
      else {
        double v17 = v30;
      }

      double cachedCellWidth = self->_cachedCellWidth;
    }
    else
    {

      if (v31 <= 2.22044605e-16)
      {
        uint64_t v32 = [v6 elementName];
        int v33 = [v32 isEqualToString:*MEMORY[0x263F4B2F0]];

        double v17 = 0.0;
        if (!v33) {
          goto LABEL_18;
        }
        cachedListItemLockupHeightsBySection = self->_cachedListItemLockupHeightsBySection;
        long long v35 = [NSNumber numberWithInteger:a4];
        long long v36 = [(NSDictionary *)cachedListItemLockupHeightsBySection objectForKey:v35];
        [v36 doubleValue];
        double v31 = v37;

        if (v31 <= 2.22044605e-16) {
          goto LABEL_18;
        }
      }
      double v17 = v31;
      if (v31 == 0.0)
      {
LABEL_18:
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        double v38 = objc_msgSend(v6, "children", 0);
        uint64_t v39 = [v38 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          int v41 = 0;
          int v42 = 0;
          char v43 = 0;
          uint64_t v44 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v56 != v44) {
                objc_enumerationMutation(v38);
              }
              double v46 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              if (objc_msgSend(v46, "tv_elementType") == 16 && !objc_msgSend(v46, "tv_imageType"))
              {
                [v46 height];
                double v48 = v47;
                double v49 = [v46 style];
                objc_msgSend(v49, "tv_margin");
                double v51 = v48 + fmax(v50, v10);
                double v52 = [v46 style];
                objc_msgSend(v52, "tv_margin");
                double v17 = v51 + fmax(v53, v12);
              }
              else if (objc_msgSend(v46, "tv_elementType") == 55)
              {
                if (objc_msgSend(v46, "tv_textStyle") == 1)
                {
                  int v41 = 1;
                }
                else if (objc_msgSend(v46, "tv_textStyle") == 2)
                {
                  int v42 = 1;
                }
                else
                {
                  v43 |= objc_msgSend(v46, "tv_textStyle") == 0;
                }
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v55 objects:v59 count:16];
          }
          while (v40);
        }
        else
        {
          int v41 = 0;
          int v42 = 0;
          char v43 = 0;
        }

        if (v17 == 0.0)
        {
          if (v41 & v42)
          {
            double v54 = 90.0;
          }
          else if (v43)
          {
            double v54 = 40.0;
          }
          else
          {
            double v54 = 70.0;
          }
          double v17 = fmax(v17, v54);
        }
      }
      else
      {
        double v17 = v31;
      }
    }
  }

  double v18 = cachedCellWidth;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)_expectedHeaderCellSizeForElement:(id)a3 section:(int64_t)a4
{
  double cachedCellWidth = self->_cachedCellWidth;
  if (a3)
  {
    id v7 = a3;
    [(_TVListViewController *)self _marginForHeaderCellForElement:v7 section:a4];
    double v9 = v8;
    double v11 = v10;
    double v12 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v13 = [v12 _viewFromElement:v7 existingView:0];

    objc_msgSend(v13, "sizeThatFits:", cachedCellWidth, 0.0);
    double cachedCellWidth = v14;
    double v16 = v9 + v11 + v15;
  }
  else
  {
    double v16 = 0.0;
  }
  double v17 = cachedCellWidth;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (UIEdgeInsets)_marginForHeaderCellForElement:(id)a3 section:(int64_t)a4
{
  id v6 = [a3 style];
  objc_msgSend(v6, "tv_margin");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (!a4)
  {
    double v15 = [(_TVMLCollectionViewController *)self collectionWrappingView];
    double v16 = [v15 headerView];

    if (v16)
    {
      double v17 = [(_TVMLCollectionViewController *)self collectionWrappingView];
      double v18 = [v17 headerView];

      objc_msgSend(v18, "tv_margin");
      double v8 = fmax(v8 - v19, 0.0);
    }
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (_TVListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAlwaysSoftFocusEnabled
{
  return self->_alwaysSoftFocusEnabled;
}

- (void)setAlwaysSoftFocusEnabled:(BOOL)a3
{
  self->_alwaysSoftFocusEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondCellIndexPath, 0);
  objc_storeStrong((id *)&self->_lastPreviewedIndexPath, 0);
  objc_storeStrong((id *)&self->_pendingPreviewIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedListChildViewControllers, 0);
  objc_storeStrong((id *)&self->_cachedListItemLockupHeightsBySection, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_previewElement, 0);
  objc_storeStrong((id *)&self->_relatedContentElement, 0);
}

@end