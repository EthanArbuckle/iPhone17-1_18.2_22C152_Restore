@interface CRLiOSPresetCollectionViewController
- (BOOL)isLowContrastWithBackgroundColor:(id)a3;
- (BOOL)p_cancelledSwatchRendering;
- (BOOL)p_presetsChanged;
- (BOOL)p_shouldUseDarkUI;
- (BOOL)presetCollectionViewLayoutShouldHighlightPresetAtIndexPath:(id)a3;
- (BOOL)shouldVerticallyDistributeEvenly;
- (CRLiOSPresetCollectionContext)context;
- (CRLiOSPresetCollectionView)p_collectionView;
- (CRLiOSPresetCollectionViewController)initWithPresetCollectionType:(unint64_t)a3 delegate:(id)a4;
- (CRLiOSPresetCollectionViewControllerDelegate)p_delegate;
- (CRLiOSPresetCollectionViewLabeledCell)p_longPressedCell;
- (CRLiOSPresetRenderer)p_presetRenderer;
- (NSMutableArray)p_visibleCells;
- (UICollectionViewDelegateFlowLayout)p_layout;
- (UIEdgeInsets)swatchInsets;
- (UIGestureRecognizer)p_currentDragGestureRecognizer;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)p_backgroundColor;
- (id)p_cellsMissingImages;
- (id)p_editingCoordinator;
- (id)p_indexPathsForCells:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)p_numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)p_numberOfSections;
- (unint64_t)p_presetCollectionType;
- (unint64_t)presetCollectionType;
- (void)accessibilityFocusFirstVisiblePreset;
- (void)cancelSwatchRenderingIfNeeded;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)p_clearVisibleCellCache;
- (void)p_handlePresetsChanged;
- (void)p_registerNibsInCollectionView:(id)a3 layout:(id)a4 context:(id)a5;
- (void)p_setLongPressedCell:(id)a3;
- (void)p_setupCollectionView;
- (void)p_setupUIInLabeledCell:(id)a3 atIndexPath:(id)a4 context:(id)a5;
- (void)presetCollectionViewDidLayoutSubviews:(id)a3;
- (void)presetCollectionViewLayoutDidHighlightPresetAtIndexPath:(id)a3;
- (void)presetCollectionViewLayoutDidSelectPresetAtIndexPath:(id)a3;
- (void)presetCollectionViewLayoutDidUnhighlightPresetAtIndexPath:(id)a3;
- (void)reloadData;
- (void)reloadDataIfNeeded;
- (void)scrollToBottom;
- (void)scrollToTop;
- (void)setP_cancelledSwatchRendering:(BOOL)a3;
- (void)setP_collectionView:(id)a3;
- (void)setP_currentDragGestureRecognizer:(id)a3;
- (void)setP_delegate:(id)a3;
- (void)setP_presetCollectionType:(unint64_t)a3;
- (void)setP_presetsChanged:(BOOL)a3;
- (void)setP_visibleCells:(id)a3;
- (void)setPresetsChanged;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRLiOSPresetCollectionViewController

- (CRLiOSPresetCollectionViewController)initWithPresetCollectionType:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLiOSPresetCollectionViewController;
  v7 = [(CRLiOSPresetCollectionViewController *)&v20 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_presetCollectionType = a3;
    if (a3)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v11 = [(CRLiOSPresetCollectionViewController *)v8 p_delegate];
      v12 = [v11 shapeCollectionDataSource];

      v13 = [(CRLiOSPresetCollectionViewController *)v8 p_delegate];
      v14 = [v13 shapeSearchResultsCollection];

      v10 = [[CRLiOSShapePresetCollectionViewLayoutProvider alloc] initWithShapeCollectionDataSource:v12 searchResultsCollection:v14];
      v9 = [[CRLiOSShapePresetProvider alloc] initWithShapeCollectionDataSource:v12 searchResultsCollection:v14];
    }
    v15 = [[CRLiOSPresetCollectionViewLayout alloc] initWithPresetCollectionViewLayoutProvider:v10 delegate:v8];
    layout = v8->_layout;
    v8->_layout = (UICollectionViewDelegateFlowLayout *)v15;

    v17 = [[CRLiOSPresetRenderer alloc] initWithPresetProvider:v9];
    presetRenderer = v8->_presetRenderer;
    v8->_presetRenderer = v17;
  }
  return v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSPresetCollectionViewController;
  [(CRLiOSPresetCollectionViewController *)&v3 viewDidLoad];
  [(CRLiOSPresetCollectionViewController *)self p_setupCollectionView];
  [(CRLiOSPresetCollectionViewController *)self p_clearVisibleCellCache];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPresetCollectionViewController;
  [(CRLiOSPresetCollectionViewController *)&v6 viewWillAppear:a3];
  if ([(CRLiOSPresetCollectionViewController *)self p_presetsChanged]) {
    [(CRLiOSPresetCollectionViewController *)self p_handlePresetsChanged];
  }
  v4 = [(CRLiOSPresetCollectionViewController *)self p_backgroundColor];
  v5 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  [v5 setBackgroundColor:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPresetCollectionViewController;
  [(CRLiOSPresetCollectionViewController *)&v5 viewDidAppear:a3];
  v4 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  [v4 flashScrollIndicators];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPresetCollectionViewController;
  [(CRLiOSPresetCollectionViewController *)&v5 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionViewController;
  [(CRLiOSPresetCollectionViewController *)&v4 viewDidDisappear:a3];
  [(CRLiOSPresetCollectionViewController *)self cancelSwatchRenderingIfNeeded];
}

- (void)reloadData
{
  [(CRLiOSPresetCollectionViewController *)self p_clearVisibleCellCache];
  id v3 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  [v3 reloadData];
}

- (void)scrollToTop
{
  id v2 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  [v2 setContentOffset:CGPointZero];
}

- (void)scrollToBottom
{
  id v3 = (char *)[(CRLiOSPresetCollectionViewController *)self p_numberOfSections] - 1;
  unint64_t v4 = [(CRLiOSPresetCollectionViewController *)self p_numberOfItemsInSection:v3];
  objc_super v5 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  [v5 layoutIfNeeded];

  id v7 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  objc_super v6 = +[NSIndexPath indexPathForItem:v4 - 1 inSection:v3];
  [v7 scrollToItemAtIndexPath:v6 atScrollPosition:4 animated:0];
}

- (void)accessibilityFocusFirstVisiblePreset
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003E1C44;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v2, 0.1);
}

- (BOOL)isLowContrastWithBackgroundColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  objc_super v6 = [(CRLiOSPresetCollectionViewController *)self context];
  unsigned __int8 v7 = [v5 contextIsLowContrast:v6 forBackgroundColor:v4];

  return v7;
}

- (unint64_t)presetCollectionType
{
  return [(CRLiOSPresetCollectionViewController *)self p_presetCollectionType];
}

- (void)setPresetsChanged
{
  [(CRLiOSPresetCollectionViewController *)self setP_presetsChanged:1];
  if ([(CRLiOSPresetCollectionViewController *)self isViewLoaded])
  {
    [(CRLiOSPresetCollectionViewController *)self p_handlePresetsChanged];
  }
}

- (void)cancelSwatchRenderingIfNeeded
{
  id v3 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  -[CRLiOSPresetCollectionViewController setP_cancelledSwatchRendering:](self, "setP_cancelledSwatchRendering:", [v3 cancelSwatchRenderingIfNeeded]);
}

- (UIEdgeInsets)swatchInsets
{
  id v2 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  [v2 swatchInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldVerticallyDistributeEvenly
{
  double v3 = [(CRLiOSPresetCollectionViewController *)self p_layout];
  double v4 = [(CRLiOSPresetCollectionViewController *)self context];
  unsigned __int8 v5 = [v3 shouldVerticallyDistributeEvenlyForContext:v4];

  return v5;
}

- (void)presetCollectionViewDidLayoutSubviews:(id)a3
{
  id v5 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  double v4 = [(CRLiOSPresetCollectionViewController *)self context];
  [v5 waitOnSwatchRenderingAndDeliverResultsIfNeededInContext:v4];
}

- (CRLiOSPresetCollectionContext)context
{
  double v3 = [(CRLiOSPresetCollectionViewController *)self p_delegate];
  double v4 = [v3 contextWithPresetCollectionViewController:self];

  return (CRLiOSPresetCollectionContext *)v4;
}

- (BOOL)presetCollectionViewLayoutShouldHighlightPresetAtIndexPath:(id)a3
{
  return 1;
}

- (void)presetCollectionViewLayoutDidHighlightPresetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  double v6 = [v5 cellForItemAtIndexPath:v4];

  double v7 = (objc_class *)objc_opt_class();
  sub_100246E2C(v6, v7, 1, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  double v13 = [v14 presetButton];
  [v13 setHighlighted:1];
}

- (void)presetCollectionViewLayoutDidUnhighlightPresetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
  double v6 = [v5 cellForItemAtIndexPath:v4];

  double v7 = (objc_class *)objc_opt_class();
  sub_100246E2C(v6, v7, 1, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  double v13 = [v14 presetButton];
  [v13 setHighlighted:0];
}

- (void)presetCollectionViewLayoutDidSelectPresetAtIndexPath:(id)a3
{
  id v4 = a3;
  [(CRLiOSPresetCollectionViewController *)self cancelSwatchRenderingIfNeeded];
  id v5 = [(CRLiOSPresetCollectionViewController *)self p_delegate];
  [v5 presetCollectionViewController:self didSelectPresetAtIndexPath:v4];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(CRLiOSPresetCollectionViewController *)self p_numberOfItemsInSection:a4];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CRLiOSPresetCollectionViewController *)self context];
  id v9 = [v6 section];
  uint64_t v10 = [(CRLiOSPresetCollectionViewController *)self layout];
  uint64_t v11 = [v10 cellReuseIdentifierForSection:v9 context:v8];

  v48 = (void *)v11;
  uint64_t v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

  double v13 = (objc_class *)objc_opt_class();
  v19 = sub_100246E2C(v12, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);

  [v19 setExclusiveTouch:1];
  objc_super v20 = [v19 presetButton];
  [v20 setHighlighted:0];

  v21 = [v19 presetButton];
  v22 = [v21 imageView];
  [v22 setContentMode:1];

  v23 = [v19 contentView];
  [v23 setUserInteractionEnabled:0];

  id v47 = [v6 row];
  uint64_t v24 = objc_opt_class();
  v25 = sub_1002469D0(v24, v19);
  if (v25) {
    [(CRLiOSPresetCollectionViewController *)self p_setupUIInLabeledCell:v25 atIndexPath:v6 context:v8];
  }
  [v19 setIsAccessibilityElement:1];
  v26 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  v27 = [v26 localizedAccessibilityNameForPresetAtIndexPath:v6 context:v8];
  [v19 setAccessibilityLabel:v27];

  id v28 = objc_alloc((Class)NSMutableArray);
  uint64_t v29 = +[NSBundle mainBundle];
  v30 = [(id)v29 localizedStringForKey:@"Double tap to insert" value:0 table:0];
  v49 = v30;
  v31 = +[NSArray arrayWithObjects:&v49 count:1];
  id v32 = [v28 initWithArray:v31];

  v33 = [(CRLiOSPresetCollectionViewController *)self context];
  LOBYTE(v29) = [v33 isSearching];

  if ((v29 & 1) == 0)
  {
    v34 = +[NSBundle mainBundle];
    v35 = [v34 localizedStringForKey:@"Swipe left or right with three fingers to change pages." value:0 table:0];
    [v32 addObject:v35];
  }
  v36 = [v32 componentsJoinedByString:@". "];
  [v19 setAccessibilityHint:v36];

  [v19 setTag:v47];
  v37 = [(CRLiOSPresetCollectionViewController *)self layout];
  [v37 sizeOfPresetInSection:[v6 section]];
  double v39 = v38;
  double v41 = v40;

  v42 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  v43 = [v19 presetButton];
  v44 = [(CRLiOSPresetCollectionViewController *)self p_backgroundColor];
  [v42 renderSwatchInView:v43 withSize:v44 backgroundColor:v6 atIndexPath:v8 context:v39];

  v45 = [(CRLiOSPresetCollectionViewController *)self p_visibleCells];
  [v45 addObject:v19];

  return v19;
}

- (void)reloadDataIfNeeded
{
  if ([(CRLiOSPresetCollectionViewController *)self p_cancelledSwatchRendering])
  {
    [(CRLiOSPresetCollectionViewController *)self setP_cancelledSwatchRendering:0];
    [(CRLiOSPresetCollectionViewController *)self reloadData];
  }
  else
  {
    id v6 = [(CRLiOSPresetCollectionViewController *)self p_cellsMissingImages];
    if ([v6 count])
    {
      double v3 = [(CRLiOSPresetCollectionViewController *)self p_visibleCells];
      [v3 removeObjectsInArray:v6];

      id v4 = [(CRLiOSPresetCollectionViewController *)self p_indexPathsForCells:v6];
      id v5 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
      [v5 reloadItemsAtIndexPaths:v4];
    }
  }
}

- (void)p_setupCollectionView
{
  id v38 = [(CRLiOSPresetCollectionViewController *)self layout];
  double v3 = -[CRLiOSPresetCollectionView initWithFrame:collectionViewLayout:]([CRLiOSPresetCollectionView alloc], "initWithFrame:collectionViewLayout:", v38, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CRLiOSPresetCollectionView *)v3 setDelaysContentTouches:0];
  [(CRLiOSPresetCollectionView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CRLiOSPresetCollectionView *)v3 setDataSource:self];
  [(CRLiOSPresetCollectionView *)v3 setDelegate:v38];
  [(CRLiOSPresetCollectionView *)v3 setPresetCollectionViewDelegate:self];
  id v4 = [(CRLiOSPresetCollectionViewController *)self context];
  if ([v38 showsSubpageNavigator])
  {
    id v5 = [v38 subpageNavigatorItems];
    id v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [CRLiOSPresetCollectionContext alloc];
        id v9 = [v4 contextType];
        [v4 contentSize];
        double v11 = v10;
        double v13 = v12;
        uint64_t v14 = [v4 editingCoordinator];
        id v15 = [v4 isSearching];
        id v16 = [v4 pageIndex];
        uint64_t v17 = [v4 traitCollection];
        uint64_t v18 = -[CRLiOSPresetCollectionContext initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:](v8, "initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:", v9, v14, v15, v16, v7, v17, v11, v13);

        [(CRLiOSPresetCollectionViewController *)self p_registerNibsInCollectionView:v3 layout:v38 context:v18];
        ++v7;
        v19 = [v38 subpageNavigatorItems];
        id v20 = [v19 count];
      }
      while (v7 < (unint64_t)v20);
    }
  }
  else
  {
    [(CRLiOSPresetCollectionViewController *)self p_registerNibsInCollectionView:v3 layout:v38 context:v4];
  }
  v21 = [(CRLiOSPresetCollectionViewController *)self p_backgroundColor];
  [(CRLiOSPresetCollectionView *)v3 setBackgroundColor:v21];

  -[CRLiOSPresetCollectionView setLayoutMargins:](v3, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(CRLiOSPresetCollectionView *)v3 setDragDelegate:self];
  v22 = [(CRLiOSPresetCollectionViewController *)self view];
  [v22 addSubview:v3];
  v23 = [v22 safeAreaLayoutGuide];
  uint64_t v24 = [v23 topAnchor];
  v25 = [(CRLiOSPresetCollectionView *)v3 topAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [v22 bottomAnchor];
  id v28 = [(CRLiOSPresetCollectionView *)v3 bottomAnchor];
  uint64_t v29 = [v27 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [v22 safeAreaLayoutGuide];
  v31 = [v30 leadingAnchor];
  id v32 = [(CRLiOSPresetCollectionView *)v3 leadingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  v34 = [v22 safeAreaLayoutGuide];
  v35 = [v34 trailingAnchor];
  v36 = [(CRLiOSPresetCollectionView *)v3 trailingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  [(CRLiOSPresetCollectionViewController *)self setP_collectionView:v3];
}

- (void)p_registerNibsInCollectionView:(id)a3 layout:(id)a4 context:(id)a5
{
  id v6 = a3;
  unint64_t v7 = [a4 cellRegistrationDictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = [v7 objectForKeyedSubscript:v13];
        [v6 registerNib:v14 forCellWithReuseIdentifier:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)p_clearVisibleCellCache
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(CRLiOSPresetCollectionViewController *)self setP_visibleCells:v3];
}

- (unint64_t)p_numberOfSections
{
  id v3 = [(CRLiOSPresetCollectionViewController *)self layout];
  id v4 = [(CRLiOSPresetCollectionViewController *)self context];
  id v5 = [v3 numberOfSectionsInCollectionViewForContext:v4];

  return (unint64_t)v5;
}

- (unint64_t)p_numberOfItemsInSection:(unint64_t)a3
{
  id v4 = [(CRLiOSPresetCollectionViewController *)self layout];
  id v5 = [v4 numberOfItemsInSection:a3];

  return (unint64_t)v5;
}

- (id)p_editingCoordinator
{
  id v2 = [(CRLiOSPresetCollectionViewController *)self context];
  id v3 = [v2 editingCoordinator];

  return v3;
}

- (id)p_backgroundColor
{
  id v3 = [(CRLiOSPresetCollectionViewController *)self p_delegate];
  id v4 = [v3 backgroundColorForPresetCollectionViewController:self];

  return v4;
}

- (id)p_indexPathsForCells:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v12 = [(CRLiOSPresetCollectionViewController *)self p_collectionView];
        uint64_t v13 = [v12 indexPathForCell:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)p_cellsMissingImages
{
  id v3 = [(CRLiOSPresetCollectionViewController *)self p_visibleCells];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(CRLiOSPresetCollectionViewController *)self p_visibleCells];
  id v6 = [v5 copy];

  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        long long v18 = sub_100246DEC(v11, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
        v19 = v18;
        if (v18)
        {
          id v20 = [v18 presetButton];
          unsigned int v21 = [v20 crl_isPresetRenderingInvalid];

          if (v21) {
            [v4 addObject:v19];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)p_handlePresetsChanged
{
  [(CRLiOSPresetCollectionViewController *)self setP_presetsChanged:0];

  [(CRLiOSPresetCollectionViewController *)self reloadData];
}

- (BOOL)p_shouldUseDarkUI
{
  id v2 = [(CRLiOSPresetCollectionViewController *)self traitCollection];
  unsigned __int8 v3 = [v2 crl_isUserInterfaceStyleDark];

  return v3;
}

- (void)p_setupUIInLabeledCell:(id)a3 atIndexPath:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v44 = [v10 section];
  uint64_t v11 = [v8 label];
  uint64_t v12 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  uint64_t v13 = [v12 localizedNameForPresetAtIndexPath:v10 context:v9];

  uint64_t v14 = [(CRLiOSPresetCollectionViewController *)self p_presetRenderer];
  uint64_t v15 = v9;
  id v16 = [v14 isDefaultLocalizedNameForPresetAtIndexPath:v10 context:v9];

  [v8 setLabelHasDefaultLocalizedName:v16];
  id v17 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v11 setNumberOfLines:2];
  LODWORD(v18) = 0.5;
  [v17 setHyphenationFactor:v18];
  [v17 setLineBreakMode:4];
  v19 = +[UIFont systemFontOfSize:12.0];
  [v17 setLineSpacing:1.0];
  [v17 setAlignment:1];
  LODWORD(v14) = [(CRLiOSPresetCollectionViewController *)self p_shouldUseDarkUI];
  id v20 = v8;
  unsigned int v21 = [v8 labelHasDefaultLocalizedName];
  if (v14)
  {
    if (v21)
    {
      double v22 = 0.556862772;
LABEL_6:
      uint64_t v23 = +[UIColor colorWithRed:v22 green:v22 blue:v22 alpha:1.0];
      goto LABEL_8;
    }
  }
  else if (v21)
  {
    double v22 = 0.643137276;
    goto LABEL_6;
  }
  uint64_t v23 = +[UIColor labelColor];
LABEL_8:
  v43 = (void *)v23;
  v46[0] = NSParagraphStyleAttributeName;
  v46[1] = NSForegroundColorAttributeName;
  v47[0] = v17;
  v47[1] = v23;
  v46[2] = NSFontAttributeName;
  v46[3] = NSKernAttributeName;
  v47[2] = v19;
  v47[3] = &off_10155E378;
  uint64_t v24 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
  long long v25 = (void *)v24;
  CFStringRef v26 = v13;
  v45 = v11;
  if (!v13)
  {
    v42 = (void *)v24;
    int v41 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F69A8);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD738(v41, v27);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F69C8);
    }
    id v28 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v28, v41);
    }
    uint64_t v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPresetCollectionViewController p_setupUIInLabeledCell:atIndexPath:context:]");
    v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPresetCollectionViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 455, 0, "invalid nil value for '%{public}s'", "localizedName");

    CFStringRef v26 = &stru_101538650;
    uint64_t v11 = v45;
    long long v25 = v42;
  }
  id v31 = [objc_alloc((Class)NSAttributedString) initWithString:v26 attributes:v25];
  [v11 setAttributedText:v31];
  id v32 = [(CRLiOSPresetCollectionViewController *)self p_layout];
  [v32 additionalHeightForItemInSection:v44 context:v15];
  double v34 = v33 - 30.0;
  v35 = [v20 labelVerticalSpacingConstraint];
  [v35 setConstant:v34];

  v36 = [(CRLiOSPresetCollectionViewController *)self p_layout];
  [v36 horizontalInsetForItemInSection:v44 context:v15];
  double v38 = v37;

  double v39 = [v20 presetViewLeadingConstraint];
  [v39 setConstant:v38];

  double v40 = [v20 presetViewTrailingConstraint];
  [v40 setConstant:v38];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CRLiOSPresetCollectionViewController *)self p_delegate];
  unsigned int v10 = [v9 allowsInsertDrag];

  if (v10)
  {
    uint64_t v11 = [(CRLiOSPresetCollectionViewController *)self p_delegate];
    uint64_t v12 = [v11 itemsForBeginningDragSessionForPresetCollectionViewController:self forCollectionView:v7 atIndexPath:v8];
  }
  else
  {
    uint64_t v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  id v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = +[UIBezierPath bezierPath];
  [v4 setShadowPath:v6];

  return v4;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4 = [(CRLiOSPresetCollectionViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (CRLiOSPresetCollectionView)p_collectionView
{
  return self->_collectionView;
}

- (void)setP_collectionView:(id)a3
{
}

- (CRLiOSPresetCollectionViewControllerDelegate)p_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSPresetCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setP_delegate:(id)a3
{
}

- (UICollectionViewDelegateFlowLayout)p_layout
{
  return self->_layout;
}

- (unint64_t)p_presetCollectionType
{
  return self->_presetCollectionType;
}

- (void)setP_presetCollectionType:(unint64_t)a3
{
  self->_presetCollectionType = a3;
}

- (CRLiOSPresetRenderer)p_presetRenderer
{
  return self->_presetRenderer;
}

- (BOOL)p_presetsChanged
{
  return self->_presetsChanged;
}

- (void)setP_presetsChanged:(BOOL)a3
{
  self->_presetsChanged = a3;
}

- (NSMutableArray)p_visibleCells
{
  return self->_visibleCells;
}

- (void)setP_visibleCells:(id)a3
{
}

- (UIGestureRecognizer)p_currentDragGestureRecognizer
{
  return self->_currentDragGestureRecognizer;
}

- (void)setP_currentDragGestureRecognizer:(id)a3
{
}

- (BOOL)p_cancelledSwatchRendering
{
  return self->_cancelledSwatchRendering;
}

- (void)setP_cancelledSwatchRendering:(BOOL)a3
{
  self->_cancelledSwatchRendering = a3;
}

- (CRLiOSPresetCollectionViewLabeledCell)p_longPressedCell
{
  return self->_longPressedCell;
}

- (void)p_setLongPressedCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressedCell, 0);
  objc_storeStrong((id *)&self->_currentDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visibleCells, 0);
  objc_storeStrong((id *)&self->_presetRenderer, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end