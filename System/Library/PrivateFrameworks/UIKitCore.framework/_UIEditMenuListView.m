@interface _UIEditMenuListView
+ (double)minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3 traitCollection:(id)a4;
- (BOOL)_canSelectItemAtIndexPath:(id)a3;
- (BOOL)_hasDisplayedMenu;
- (BOOL)_hasPasteAuthentication;
- (BOOL)_isPaginationDirtyForContainerSize:(CGSize)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasShadow;
- (BOOL)scrubbingEnabled;
- (CAShapeLayer)maskLayer;
- (CGSize)_intrinsicHorizontalContentSizeForTraitCollection:(id)a3 containerSize:(CGSize)a4;
- (CGSize)_intrinsicVerticalContentSizeForContainer:(id)a3 containerSize:(CGSize)a4;
- (CGSize)_titleViewSizeForFittingWidth:(double)a3;
- (CGSize)_verticalMenuContentSizeFittingContainerSize:(CGSize)a3 traits:(id)a4;
- (CGSize)arrowSizeForDirection:(int64_t)a3;
- (CGSize)intrinsicContentSizeForContainer:(id)a3 containerSize:(CGSize)a4;
- (NSIndexPath)highlightedIndexPath;
- (NSIndexPath)hoveredIndexPath;
- (NSIndexPath)scrubbedIndexPath;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UIMenu)displayedMenu;
- (UIView)backgroundView;
- (UIView)customBackgroundPlatterView;
- (UIView)menuContainerView;
- (UIView)titleContainerView;
- (UIView)titleSeparatorView;
- (UIView)titleView;
- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer;
- (_UIDiffuseShadowView)shadowView;
- (_UIEditMenuCollectionView)collectionView;
- (_UIEditMenuListView)initWithDelegate:(id)a3 menu:(id)a4 titleView:(id)a5 preferredElementDisplayMode:(unint64_t)a6;
- (_UIEditMenuListViewDelegate)delegate;
- (_UIEditMenuPageButton)leftButton;
- (_UIEditMenuPageButton)rightButton;
- (double)_collectionViewWidthForPageProgress:(double)a3;
- (double)_minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3;
- (id)_indexPathForGestureRecognizer:(id)a3;
- (id)backgroundMaterialGroupName;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)arrowDirection;
- (int64_t)axis;
- (unint64_t)preferredElementDisplayMode;
- (void)_contentSizeCategoryDidChange;
- (void)_createDataSource;
- (void)_createViewHierarchy;
- (void)_didTapLeftDirectionalButton:(id)a3;
- (void)_didTapRightDirectionalButton:(id)a3;
- (void)_handleHoverGesture:(id)a3;
- (void)_handleSelectionGesture:(id)a3;
- (void)_highlightItemAtIndexPath:(id)a3;
- (void)_reloadMenuAnimated:(BOOL)a3;
- (void)_selectItemAtIndexPath:(id)a3;
- (void)_setNeedsPaginationUpdate;
- (void)_unhighlightCurrentlyHighlightedItem;
- (void)_updateArrowEdgeInsets;
- (void)_updateHighlightState;
- (void)_updateMaskingLayerWithFrame:(CGRect)a3;
- (void)_updatePaginationForSnapshot:(id)a3 containerSize:(CGSize)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithMenu:(id)a3 titleView:(id)a4 animated:(BOOL)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setArrowDirection:(int64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setHoveredIndexPath:(id)a3;
- (void)setPreferredElementDisplayMode:(unint64_t)a3;
- (void)setScrubbedIndexPath:(id)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
@end

@implementation _UIEditMenuListView

+ (double)minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3 traitCollection:(id)a4
{
  id v5 = a4;
  v6 = _UIEditMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
  v7 = v6;
  if (a3) {
    [v6 verticalMenuCornerRadius];
  }
  else {
    [v6 horizontalMenuCornerRadius];
  }
  double v9 = v8 * 1.528665;
  double v10 = _UIEditMenuScaledArrowSize(v5);
  id v11 = v5;
  v12 = _UIEditMenuGetPlatformMetrics([v11 userInterfaceIdiom]);
  [v12 arrowSideRadius];
  double v14 = v13;
  id v15 = v11;
  v16 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v15];
  [v16 _scaledValueForValue:0 useLanguageAwareScaling:v14];
  double v18 = v17;
  [v15 displayScale];
  double v20 = v19;

  UIRoundToScale(v18, fmax(v20, 1.0));
  double v22 = v21;

  return ceil(v10 * 0.5 + v9 + v22);
}

- (_UIEditMenuListView)initWithDelegate:(id)a3 menu:(id)a4 titleView:(id)a5 preferredElementDisplayMode:(unint64_t)a6
{
  id v11 = a3;
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIEditMenuListView;
  double v14 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v14)
  {
    if (!(v12 | v13))
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v14 file:@"_UIEditMenuListView.m" lineNumber:127 description:@"Cannot present an edit menu without a valid menu"];
    }
    objc_storeWeak((id *)&v14->_delegate, v11);
    objc_storeStrong((id *)&v14->_displayedMenu, a4);
    objc_storeStrong((id *)&v14->_titleView, a5);
    v14->_preferredElementDisplayMode = a6;
    v14->_arrowDirection = 2;
    v14->_largestPageWidth = 0.0;
    [(_UIEditMenuListView *)v14 _createViewHierarchy];
    [(_UIEditMenuListView *)v14 _createDataSource];
    [(UIView *)v14 _setDisableDictationTouchCancellation:1];
  }

  return v14;
}

- (void)reloadWithMenu:(id)a3 titleView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = (UIMenu *)a3;
  id v16 = a4;
  titleView = self->_titleView;
  if (titleView) {
    [(UIView *)titleView removeFromSuperview];
  }
  displayedMenu = self->_displayedMenu;
  self->_displayedMenu = v8;
  id v11 = v8;

  objc_storeStrong((id *)&self->_titleView, a4);
  unint64_t v12 = [(_UIEditMenuListView *)self titleContainerView];
  [v12 setHidden:v16 == 0];

  BOOL v13 = v11 == 0;
  double v14 = [(_UIEditMenuListView *)self titleSeparatorView];
  [v14 setHidden:v13];

  if (self->_titleView)
  {
    id v15 = [(_UIEditMenuListView *)self titleContainerView];
    [v15 addSubview:v16];
  }
  [(_UIEditMenuListView *)self _reloadMenuAnimated:v5];
}

- (BOOL)_hasDisplayedMenu
{
  v2 = [(_UIEditMenuListView *)self displayedMenu];
  unint64_t v3 = ((unint64_t)[v2 metadata] >> 24) & 1;

  return v3;
}

- (CGSize)_titleViewSizeForFittingWidth:(double)a3
{
  v4 = [(_UIEditMenuListView *)self titleView];
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", a3, 1.79769313e308);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSizeForContainer:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ([(_UIEditMenuListView *)self axis])
  {
    -[_UIEditMenuListView _intrinsicVerticalContentSizeForContainer:containerSize:](self, "_intrinsicVerticalContentSizeForContainer:containerSize:", v7, width, height);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    uint64_t v12 = [v7 traitCollection];

    -[_UIEditMenuListView _intrinsicHorizontalContentSizeForTraitCollection:containerSize:](self, "_intrinsicHorizontalContentSizeForTraitCollection:containerSize:", v12, width, height);
    double v9 = v13;
    double v11 = v14;
    id v7 = (id)v12;
  }

  double v15 = v9;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)_intrinsicHorizontalContentSizeForTraitCollection:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  double v8 = _UIEditMenuGetPlatformMetrics([v7 userInterfaceIdiom]);
  if ([(_UIEditMenuListView *)self _hasDisplayedMenu])
  {
    double v9 = +[_UIEditMenuListItem itemWithTitle:@" "];
    +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", v9, v7, width, height);
    double v11 = v10;
    [v8 horizontalMenuMaximumWidth];
    double width = fmin(width, v12);
    if (-[_UIEditMenuListView _isPaginationDirtyForContainerSize:](self, "_isPaginationDirtyForContainerSize:", width, height))
    {
      -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", 0, width, height);
    }
    double v13 = [(_UIEditMenuListView *)self collectionView];
    double v14 = [v13 pages];
    uint64_t v15 = [v14 count];

    double largestPageWidth = self->_largestPageWidth;
    if (v15 >= 2)
    {
      objc_super v17 = [(_UIEditMenuListView *)self leftButton];
      objc_msgSend(v17, "sizeThatFits:", width, height);
      double v19 = v18;

      double largestPageWidth = largestPageWidth + fmin((double)(v15 - 1), 2.0) * v19;
    }
  }
  else
  {
    double largestPageWidth = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v20 = [(_UIEditMenuListView *)self titleView];

  if (v20)
  {
    [v8 horizontalMenuMaximumWidth];
    double v22 = fmin(width, v21);
    if ([(_UIEditMenuListView *)self _hasDisplayedMenu])
    {
      [(_UIEditMenuListView *)self _titleViewSizeForFittingWidth:fmin(v22, largestPageWidth)];
      double v11 = fmin(height, v11 + v23);
    }
    else
    {
      [(_UIEditMenuListView *)self _titleViewSizeForFittingWidth:v22];
      double largestPageWidth = v24;
      double v11 = v25;
    }
  }

  double v26 = largestPageWidth;
  double v27 = v11;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (CGSize)_intrinsicVerticalContentSizeForContainer:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  double v8 = [v7 traitCollection];
  double v9 = _UIEditMenuGetPlatformMetrics([v8 userInterfaceIdiom]);
  [v9 verticalMenuMaximumHeight];
  double v11 = fmin(height, v10);
  if ([(_UIEditMenuListView *)self _hasDisplayedMenu])
  {
    -[_UIEditMenuListView _verticalMenuContentSizeFittingContainerSize:traits:](self, "_verticalMenuContentSizeFittingContainerSize:traits:", v8, width, v11);
    double v13 = 250.0;
    if (v14 > 250.0)
    {
      if ([v8 userInterfaceIdiom])
      {
        double v15 = 343.0;
      }
      else
      {
        +[UIViewController _horizontalContentMarginForView:v7];
        double v19 = v18;
        double v20 = [v7 _screen];
        [v20 _referenceBounds];
        double v15 = CGRectGetWidth(v31) - (v19 + v19);
      }
      if (width >= v15) {
        double v13 = v15;
      }
      else {
        double v13 = width;
      }
      -[_UIEditMenuListView _verticalMenuContentSizeFittingContainerSize:traits:](self, "_verticalMenuContentSizeFittingContainerSize:traits:", v8, v13, v11);
    }
    double v16 = fmin(v12, v11);
    double v17 = v13;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v12 = 0.0;
    double v13 = 250.0;
  }
  self->_verticalContentHeight = v12;
  double v21 = [(_UIEditMenuListView *)self titleView];

  if (v21)
  {
    [(_UIEditMenuListView *)self _titleViewSizeForFittingWidth:v13];
    double v23 = v22;
    double v25 = v24;
    BOOL v26 = [(_UIEditMenuListView *)self _hasDisplayedMenu];
    double v27 = fmin(v11, v16 + v25);
    if (v26) {
      double v16 = v27;
    }
    else {
      double v16 = v25;
    }
    if (!v26) {
      double v17 = v23;
    }
  }

  double v28 = v17;
  double v29 = v16;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (CGSize)_verticalMenuContentSizeFittingContainerSize:(CGSize)a3 traits:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  double v11 = [v10 itemIdentifiers];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", *(void *)(*((void *)&v20 + 1) + 8 * v15), v7, width, height);
        double v9 = fmax(v9, v16);
        double v8 = v8 + v17;
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  double v18 = v9;
  double v19 = v8;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)_minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3
{
  double v5 = objc_opt_class();
  double v6 = [(UIView *)self traitCollection];
  [v5 minimumRequiredWidthForArrowInRoundedListViewForAxis:a3 traitCollection:v6];
  double v8 = v7;

  return v8;
}

- (CGSize)arrowSizeForDirection:(int64_t)a3
{
  v4 = [(UIView *)self traitCollection];
  double v5 = _UIEditMenuScaledArrowSize(v4);
  double v7 = v6;

  if ((unint64_t)(a3 - 3) >= 2) {
    double v8 = v5;
  }
  else {
    double v8 = v7;
  }
  if ((unint64_t)(a3 - 3) >= 2) {
    double v9 = v7;
  }
  else {
    double v9 = v5;
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)_createViewHierarchy
{
  v81[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = _UIEditMenuGetPlatformMetrics(v4);
  double v6 = [v5 menuBackgroundConfigurator];

  v80 = v5;
  if (v6)
  {
    double v7 = (UIView *)objc_opt_new();
    double v8 = [v5 menuBackgroundConfigurator];
    ((void (**)(void, UIView *))v8)[2](v8, v7);

    [(UIView *)self addSubview:v7];
    customBackgroundPlatterView = self->_customBackgroundPlatterView;
    self->_customBackgroundPlatterView = v7;
  }
  double v10 = (_UIEditMenuListView *)self->_customBackgroundPlatterView;
  if (!v10) {
    double v10 = self;
  }
  double v11 = v10;
  uint64_t v12 = _UIEditMenuGetPlatformMetrics(v4);
  uint64_t v13 = [UIVisualEffectView alloc];
  uint64_t v14 = [v12 menuBackgroundEffect];
  uint64_t v15 = [(UIVisualEffectView *)v13 initWithEffect:v14];

  double v16 = [(_UIEditMenuListView *)self backgroundMaterialGroupName];
  [(UIVisualEffectView *)v15 _setGroupName:v16];

  v79 = v11;
  [(UIView *)v11 addSubview:v15];
  objc_storeStrong((id *)&self->_backgroundView, v15);
  double v17 = objc_opt_new();
  id v18 = +[UIColor blackColor];
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v18, "CGColor"));

  double v19 = [(UIView *)v15 layer];
  [v19 setMask:v17];

  v77 = v17;
  objc_storeStrong((id *)&self->_maskLayer, v17);
  long long v20 = (UIView *)objc_opt_new();
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = v20;

  BOOL v22 = 1;
  [(UIView *)self->_menuContainerView setClipsToBounds:1];
  long long v23 = [(UIVisualEffectView *)v15 contentView];
  [v23 addSubview:self->_menuContainerView];

  double v24 = [_UIEditMenuCollectionView alloc];
  [(UIView *)self _currentScreenScale];
  BOOL v26 = _UIEditMenuViewHorizontalCompositionalLayout(v4, v25);
  double v27 = -[UICollectionView initWithFrame:collectionViewLayout:](v24, "initWithFrame:collectionViewLayout:", v26, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(UICollectionView *)v27 setDelegate:self];
  [(UICollectionView *)v27 setBackgroundColor:0];
  [(UIScrollView *)v27 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v27 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v27 setPagingEnabled:1];
  [(UICollectionView *)v27 setAllowsSelection:0];
  [(UICollectionView *)v27 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_UIEditMenuListViewCell"];
  [(UICollectionView *)v27 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"_UIEditMenuListViewSeparator" withReuseIdentifier:@"_UIEditMenuListViewSeparator"];
  [(UIView *)self->_menuContainerView addSubview:v27];
  objc_storeStrong((id *)&self->_collectionView, v27);
  double v28 = [(UIVisualEffectView *)v15 contentView];
  double v29 = [(UIScrollView *)v27 panGestureRecognizer];
  [v28 addGestureRecognizer:v29];

  v30 = [_UIEditMenuPageButton alloc];
  CGRect v31 = [(_UIEditMenuListView *)self backgroundMaterialGroupName];
  v32 = [(_UIEditMenuPageButton *)v30 initWithDirection:0 backgroundGroupName:v31];
  leftButton = self->_leftButton;
  self->_leftButton = v32;

  [(UIControl *)self->_leftButton addTarget:self action:sel__didTapLeftDirectionalButton_ forControlEvents:0x2000];
  v34 = [(UIVisualEffectView *)v15 contentView];
  [v34 addSubview:self->_leftButton];

  v35 = [_UIEditMenuPageButton alloc];
  v36 = [(_UIEditMenuListView *)self backgroundMaterialGroupName];
  v37 = [(_UIEditMenuPageButton *)v35 initWithDirection:1 backgroundGroupName:v36];
  rightButton = self->_rightButton;
  self->_rightButton = v37;

  [(UIControl *)self->_rightButton addTarget:self action:sel__didTapRightDirectionalButton_ forControlEvents:0x2000];
  v39 = [(UIVisualEffectView *)v15 contentView];
  [v39 addSubview:self->_rightButton];

  v40 = [(UIView *)self traitCollection];
  v41 = _UIEditMenuGetPlatformMetrics([v40 userInterfaceIdiom]);
  v42 = [UIVisualEffectView alloc];
  v43 = [v41 separatorEffect];
  v44 = [(UIVisualEffectView *)v42 initWithEffect:v43];

  v45 = [v41 separatorEffectColor];
  v46 = [(UIView *)v44 contentView];
  [v46 setBackgroundColor:v45];

  v47 = [(UIView *)v44 contentView];
  v48 = [v47 layer];
  [v48 setAllowsEdgeAntialiasing:1];

  v49 = [(UIView *)v44 contentView];
  [v49 setClipsToBounds:0];

  titleSeparatorView = self->_titleSeparatorView;
  self->_titleSeparatorView = v44;

  if (self->_titleView) {
    BOOL v22 = self->_displayedMenu == 0;
  }
  -[UIView setHidden:](self->_titleSeparatorView, "setHidden:", v22, v77);
  v51 = (UIView *)objc_opt_new();
  titleContainerView = self->_titleContainerView;
  self->_titleContainerView = v51;

  [(UIView *)self->_titleContainerView addSubview:self->_titleSeparatorView];
  v53 = [(UIVisualEffectView *)v15 contentView];
  [v53 addSubview:self->_titleContainerView];

  if (self->_titleView) {
    -[UIView addSubview:](self->_titleContainerView, "addSubview:");
  }
  [v80 shadowOpacity];
  if (v54 > 0.0)
  {
    double v55 = v54;
    v56 = objc_alloc_init(_UIDiffuseShadowView);
    id v57 = [(UIView *)self traitCollection];
    v58 = _UIEditMenuGetPlatformMetrics([v57 userInterfaceIdiom]);
    [v58 shadowRadius];
    double v60 = v59;
    id v61 = v57;
    v62 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v61];
    [v62 _scaledValueForValue:0 useLanguageAwareScaling:v60];
    double v64 = v63;
    [v61 displayScale];
    double v66 = v65;

    UIRoundToScale(v64, fmax(v66, 1.0));
    double v68 = v67;

    [(_UIDiffuseShadowView *)v56 setRadius:v68];
    v69 = [(UIView *)self traitCollection];
    [(_UIDiffuseShadowView *)v56 setOffset:_UIEditMenuScaledShadowOffset(v69)];

    [(_UIDiffuseShadowView *)v56 setIntensity:v55];
    [(UIView *)self insertSubview:v56 atIndex:0];
    shadowView = self->_shadowView;
    self->_shadowView = v56;
  }
  [(_UIEditMenuListView *)self _updateArrowEdgeInsets];
  v71 = [(UIGestureRecognizer *)[_UIContinuousSelectionGestureRecognizer alloc] initWithTarget:self action:sel__handleSelectionGesture_];
  [(UIGestureRecognizer *)v71 setCancelsTouchesInView:0];
  [(UIGestureRecognizer *)v71 setDelegate:self];
  v72 = [(UIVisualEffectView *)v15 contentView];
  [v72 addGestureRecognizer:v71];

  objc_storeStrong((id *)&self->_selectionGestureRecognizer, v71);
  v73 = [[UIHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleHoverGesture_];
  [(UIGestureRecognizer *)v73 setDelegate:self];
  v74 = [(UIVisualEffectView *)v15 contentView];
  [v74 addGestureRecognizer:v73];

  objc_storeStrong((id *)&self->_hoverGestureRecognizer, v73);
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  id v76 = [(UIView *)self registerForTraitChanges:v75 withAction:sel__contentSizeCategoryDidChange];
}

- (void)setAxis:(int64_t)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (self->_axis != a3)
  {
    self->_axis = a3;
    double v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    double v7 = [(_UIEditMenuListView *)self collectionView];
    if (a3 == 1)
    {
      uint64_t v13 = _UIEditMenuGetPlatformMetrics(v6);
      [v13 verticalMenuCornerRadius];
      double v15 = v14;
      [(UIView *)self _currentScreenScale];
      double v17 = 1.0 / v16;
      id v18 = [off_1E52D2B08 fractionalWidthDimension:1.0];
      double v19 = [off_1E52D2B08 absoluteDimension:v17];
      long long v20 = [off_1E52D2B30 sizeWithWidthDimension:v18 heightDimension:v19];

      uint64_t v21 = [off_1E52D2AF0 layoutAnchorWithEdges:1];
      BOOL v22 = _UIEditMenuGetPlatformMetrics(v6);
      LODWORD(v18) = [v22 showsSeparatorBetweenItems];

      v39 = (void *)v21;
      v40 = v13;
      if (v18)
      {
        long long v23 = [off_1E52D2B40 supplementaryItemWithLayoutSize:v20 elementKind:@"_UIEditMenuListViewSeparator" containerAnchor:v21];
        [v23 setZIndex:-1];
        v42[0] = v23;
        double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      }
      else
      {
        double v24 = (void *)MEMORY[0x1E4F1CBF0];
      }
      double v8 = v15 * 0.5;
      double v25 = [off_1E52D2B08 fractionalWidthDimension:1.0];
      BOOL v26 = [off_1E52D2B08 estimatedDimension:44.0];
      double v27 = [off_1E52D2B30 sizeWithWidthDimension:v25 heightDimension:v26];

      double v28 = [off_1E52D2B20 itemWithLayoutSize:v27 supplementaryItems:v24];
      v41 = v28;
      uint64_t v11 = 1;
      double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      v30 = [off_1E52D2B18 horizontalGroupWithLayoutSize:v27 subitems:v29];

      CGRect v31 = [off_1E52D2B28 sectionWithGroup:v30];
      [v31 setContentInsetsReference:1];
      v32 = objc_opt_new();
      [v32 setScrollDirection:0];
      [v32 setContentInsetsReference:1];
      double v10 = [[UICollectionViewCompositionalLayout alloc] initWithSection:v31 configuration:v32];

      uint64_t v12 = 0;
    }
    else
    {
      double v8 = 0.0;
      if (a3)
      {
        double v10 = 0;
        uint64_t v12 = 0;
        uint64_t v11 = 0;
      }
      else
      {
        [(UIView *)self _currentScreenScale];
        _UIEditMenuViewHorizontalCompositionalLayout(v6, v9);
        double v10 = (UICollectionViewCompositionalLayout *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = 0;
        uint64_t v12 = 1;
      }
    }
    v33 = [(_UIEditMenuListView *)self rightButton];
    [v33 setHidden:v11];

    v34 = [(_UIEditMenuListView *)self leftButton];
    [v34 setHidden:v11];

    [v7 setPagingEnabled:v12];
    [v7 setShowsVerticalScrollIndicator:v11];
    objc_msgSend(v7, "setVerticalScrollIndicatorInsets:", v8, 0.0, v8, 0.0);
    [v7 setCollectionViewLayout:v10];
    objc_msgSend(v7, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    [(_UIEditMenuListView *)self _setNeedsPaginationUpdate];
    [(UIView *)self setNeedsLayout];
    v35 = [(_UIEditMenuListView *)self dataSource];
    v36 = [v35 snapshot];

    v37 = [v36 sectionIdentifiers];
    [v36 reloadSectionsWithIdentifiers:v37];

    v38 = [(_UIEditMenuListView *)self dataSource];
    [v38 applySnapshotUsingReloadData:v36];

    [v7 resetTargetPage];
    [(_UIEditMenuListView *)self _updateArrowEdgeInsets];
  }
}

- (void)_createDataSource
{
  objc_initWeak(&location, self);
  unint64_t v3 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __40___UIEditMenuListView__createDataSource__block_invoke;
  double v10 = &unk_1E52EE798;
  objc_copyWeak(&v11, &location);
  double v5 = [(UICollectionViewDiffableDataSource *)v3 initWithCollectionView:collectionView cellProvider:&v7];
  dataSource = self->_dataSource;
  self->_dataSource = v5;

  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", &__block_literal_global_213, v7, v8, v9, v10);
  [(_UIEditMenuListView *)self _reloadMenuAnimated:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_reloadMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  [(_UIEditMenuListView *)self _minimumRequiredWidthForArrowInRoundedListViewForAxis:0];
  double v6 = v5;
  uint64_t v7 = [(_UIEditMenuListView *)self displayedMenu];
  char v8 = [(_UIEditMenuListView *)self _hasPasteAuthentication];
  uint64_t v9 = [(_UIEditMenuListView *)self preferredElementDisplayMode];
  id v10 = v7;
  id v11 = objc_opt_new();
  uint64_t v12 = [v10 identifier];
  v35[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v11 appendSectionsWithIdentifiers:v13];

  if (v10)
  {
    _UIEditMenuAppendMenuToSnapshot(v10, v11, v8, v9);
    double v14 = [v11 itemIdentifiers];
    uint64_t v15 = [v14 count];

    if (v15 == 1)
    {
      double v16 = [v11 itemIdentifiers];
      double v17 = [v16 firstObject];

      [v17 setOverrideMinimumWidth:v6 + v6];
    }
  }

  id v18 = [(UIView *)self window];

  if (v18 && v3)
  {
    [(UIView *)self bounds];
    -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", v11, v19, v20);
    if ([(_UIEditMenuListView *)self hasShadow])
    {
      uint64_t v21 = [(_UIEditMenuListView *)self shadowView];
      BOOL v22 = [v21 layer];
      long long v23 = __43___UIEditMenuListView__reloadMenuAnimated___block_invoke(@"shadowPath", [v22 shadowPath]);
      [(UIView *)self addAnimation:v23 forKey:@"shadowPath"];
    }
    double v24 = [(_UIEditMenuListView *)self maskLayer];
    double v25 = [(_UIEditMenuListView *)self maskLayer];
    BOOL v26 = __43___UIEditMenuListView__reloadMenuAnimated___block_invoke(@"path", [v25 path]);
    [v24 addAnimation:v26 forKey:@"path"];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __43___UIEditMenuListView__reloadMenuAnimated___block_invoke_2;
    v34[3] = &unk_1E52D9F70;
    v34[4] = self;
    +[UIView animateWithDuration:0 delay:v34 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(_UIEditMenuListView *)self _setNeedsPaginationUpdate];
  }
  dataSource = self->_dataSource;
  if (v3) {
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v11 animatingDifferences:1];
  }
  else {
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshotUsingReloadData:v11];
  }
  double v28 = [(_UIEditMenuListView *)self collectionView];
  double v29 = [v28 pages];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    CGRect v31 = [(_UIEditMenuListView *)self collectionView];
    [v31 scrollToTargetPageAnimated:0];
  }
  v32 = [(_UIEditMenuListView *)self displayedMenu];
  v33 = [v32 accessibilityIdentifier];
  [self setAccessibilityIdentifier:v33];
}

- (BOOL)_hasPasteAuthentication
{
  v2 = self;
  BOOL v3 = [(_UIEditMenuListView *)self delegate];
  LOBYTE(v2) = [v3 wantsPasteTouchAuthenticationInEditMenuListView:v2];

  return (char)v2;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10) && ![(_UIEditMenuListView *)self axis]) {
    [(_UIEditMenuListView *)self _setNeedsPaginationUpdate];
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuListView;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)_contentSizeCategoryDidChange
{
  [(_UIEditMenuListView *)self _setNeedsPaginationUpdate];
  BOOL v3 = [(_UIEditMenuListView *)self delegate];
  [v3 contentSizeCategoryDidChangeInEditMenuListView:self];

  id v4 = [(UIView *)self traitCollection];
  double v5 = _UIEditMenuGetPlatformMetrics([v4 userInterfaceIdiom]);
  [v5 shadowRadius];
  double v7 = v6;
  id v8 = v4;
  CGRect v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v8];
  [v9 _scaledValueForValue:0 useLanguageAwareScaling:v7];
  double v11 = v10;
  [v8 displayScale];
  double v13 = v12;

  UIRoundToScale(v11, fmax(v13, 1.0));
  double v15 = v14;

  [(_UIDiffuseShadowView *)self->_shadowView setRadius:v15];
  double v16 = [(UIView *)self traitCollection];
  [(_UIDiffuseShadowView *)self->_shadowView setOffset:_UIEditMenuScaledShadowOffset(v16)];

  [(_UIEditMenuListView *)self _updateArrowEdgeInsets];
}

- (void)layoutSubviews
{
  v170.receiver = self;
  v170.super_class = (Class)_UIEditMenuListView;
  [(UIView *)&v170 layoutSubviews];
  BOOL v3 = [(UIView *)self traitCollection];
  id v4 = _UIEditMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  remainder.origin.double x = v5;
  remainder.origin.double y = v7;
  remainder.size.double width = v9;
  remainder.size.double height = v11;
  double v13 = [(_UIEditMenuListView *)self shadowView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  if (-[_UIEditMenuListView _isPaginationDirtyForContainerSize:](self, "_isPaginationDirtyForContainerSize:", v10, v12)) {
    -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", 0, v10, v12);
  }
  int64_t v14 = [(_UIEditMenuListView *)self axis];
  int v15 = *((_DWORD *)&self->super._viewFlags + 4);
  int64_t v16 = [(_UIEditMenuListView *)self arrowDirection];
  int64_t v17 = [(_UIEditMenuListView *)self arrowDirection];
  int64_t v18 = [(_UIEditMenuListView *)self axis];
  unint64_t v19 = v17 - 5;
  BOOL v20 = !v18 && v19 > 0xFFFFFFFFFFFFFFFDLL || v18 == 1 && v19 < 0xFFFFFFFFFFFFFFFELL;
  BOOL v22 = [(UIView *)self layer];
  [v22 anchorPoint];

  [(UIView *)self center];
  double v24 = v23;
  double v26 = v25;
  double v27 = [(UIView *)self superview];
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v27, v24, v26);
  double v154 = v28;

  [(_UIEditMenuListView *)self _minimumRequiredWidthForArrowInRoundedListViewForAxis:[(_UIEditMenuListView *)self axis]];
  double v153 = v29;
  [(UIView *)self _currentScreenScale];
  double v31 = v30;
  double v32 = 1.0;
  v33 = [(_UIEditMenuListView *)self leftButton];
  objc_msgSend(v33, "sizeThatFits:", v10, v12);
  double v156 = v34;

  v35 = [(UIView *)self traitCollection];
  _UIEditMenuScaledArrowSize(v35);
  double v37 = v36;

  int64_t v38 = [(_UIEditMenuListView *)self arrowDirection];
  double v39 = 0.0;
  if (v38 == 1) {
    double v40 = v37;
  }
  else {
    double v40 = 0.0;
  }
  if (v38 == 1) {
    double v41 = 0.0;
  }
  else {
    double v41 = v37;
  }
  if (v38 == 3) {
    double v42 = v37;
  }
  else {
    double v42 = 0.0;
  }
  if (v38 == 3)
  {
    double v40 = 0.0;
    double v41 = 0.0;
  }
  if (v38 == 4) {
    double v42 = 0.0;
  }
  double v164 = v42;
  if (v38 == 4) {
    double v43 = 0.0;
  }
  else {
    double v43 = v40;
  }
  if (v38 == 4) {
    double v44 = 0.0;
  }
  else {
    double v44 = v41;
  }
  double r2 = v44;
  CGSize v45 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  double v157 = v37;
  if (v38 == 4) {
    double v39 = v37;
  }
  double v159 = v39;
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v45;
  v46 = [(_UIEditMenuListView *)self titleView];

  if (v46)
  {
    [(_UIEditMenuListView *)self _titleViewSizeForFittingWidth:v10];
    CGFloat v48 = v47;
    double v50 = v49;
    if ([(_UIEditMenuListView *)self arrowDirection] == 1) {
      CGRectEdge v51 = CGRectMaxYEdge;
    }
    else {
      CGRectEdge v51 = CGRectMinYEdge;
    }
    v171.origin.double x = v6;
    v171.origin.double y = v8;
    v171.size.double width = v10;
    v171.size.double height = v12;
    CGFloat v52 = v50;
    double v32 = 1.0;
    CGRectDivide(v171, &slice, &remainder, v52, v51);
    slice.size.double width = v48;
  }
  unint64_t v53 = v16 - 3;
  double v54 = v32 / v31;
  double v155 = v32 / v31;
  if (v14)
  {
    int64_t v55 = [(_UIEditMenuListView *)self axis];
    double v56 = r2;
    if (v55 == 1) {
      double v57 = r2;
    }
    else {
      double v57 = 0.0;
    }
    if (v55 == 1) {
      double v58 = v43;
    }
    else {
      double v58 = 0.0;
    }
    double width = remainder.size.width;
    double v158 = 0.0;
    double v60 = remainder.origin.x + 0.0;
    double MinY = v58 + remainder.origin.y;
    double rect = remainder.size.height - (v57 + v58);
    double largestPageWidth = CGRectGetWidth(remainder);
    double v151 = 0.0;
    double v152 = 0.0;
    double v62 = 0.0;
    double v63 = 0.0;
  }
  else
  {
    double v64 = [(_UIEditMenuListView *)self collectionView];
    double v65 = [v64 pages];
    uint64_t v66 = [v65 count] - 1;

    double v67 = [(_UIEditMenuListView *)self collectionView];
    [v67 currentPage];
    double v69 = v68;

    double v60 = 0.0;
    double v70 = fmax(fmin(v69, 1.0), 0.0);
    double v71 = fmax(fmin((double)v66 - v69, 1.0), 0.0);
    if ((*(void *)&v15 & 0x80000) != 0) {
      double v72 = v71;
    }
    else {
      double v72 = v70;
    }
    if ((*(void *)&v15 & 0x80000) == 0) {
      double v70 = v71;
    }
    double v158 = (v156 - v54) * v72;
    double v151 = v72;
    double v152 = v70;
    double v63 = -v158;
    double v62 = -(v70 * (v156 - v54));
    [(_UIEditMenuListView *)self _collectionViewWidthForPageProgress:v69];
    double width = v73;
    double MinY = CGRectGetMinY(remainder);
    double rect = CGRectGetHeight(remainder);
    double largestPageWidth = self->_largestPageWidth;
    double v56 = r2;
  }
  double v74 = v60 + v63;
  double v162 = MinY;
  double r2a = MinY + 0.0;
  double v75 = width - (v62 + v63);
  if (v20) {
    double height = remainder.size.height - (v43 + v56);
  }
  else {
    double height = remainder.size.height;
  }
  if (v20) {
    double v77 = remainder.size.width - (v164 + v159);
  }
  else {
    double v77 = remainder.size.width;
  }
  if (v20) {
    double y = v43 + remainder.origin.y;
  }
  else {
    double y = remainder.origin.y;
  }
  if (v20) {
    double x = v164 + remainder.origin.x;
  }
  else {
    double x = remainder.origin.x;
  }
  double v165 = v75;
  UIRoundToViewScale(self);
  double v81 = v80;
  if (v53 >= 2)
  {
    double v82 = v154 - v153;
    if (v80 <= v154 - v153)
    {
      v172.origin.double x = v74;
      v172.size.double width = v165;
      v172.origin.double y = r2a;
      v172.size.double height = rect;
      double v82 = v81;
      if (v81 < v154 + v153 - CGRectGetWidth(v172))
      {
        v173.origin.double x = v74;
        v173.size.double width = v165;
        v173.origin.double y = r2a;
        v173.size.double height = rect;
        double v82 = v154 + v153 - CGRectGetWidth(v173);
      }
    }
  }
  else
  {
    double v82 = v80;
  }
  v174.origin.double x = x;
  v174.origin.double y = y;
  v174.size.double width = v77;
  v174.size.double height = height;
  double MinX = CGRectGetMinX(v174);
  v175.origin.double x = x;
  v175.origin.double y = y;
  v175.size.double width = v77;
  v175.size.double height = height;
  double MaxX = CGRectGetMaxX(v175);
  v176.origin.double x = v74;
  double v85 = v165;
  v176.origin.double y = r2a;
  v176.size.double width = v165;
  double v86 = rect;
  v176.size.double height = rect;
  double v87 = fmax(MinX, fmin(v82, MaxX - CGRectGetWidth(v176)));
  v88 = [(_UIEditMenuListView *)self menuContainerView];
  objc_msgSend(v88, "setFrame:", v158 + v87, v162, width, rect);

  v89 = [(_UIEditMenuListView *)self titleView];

  if (v89)
  {
    double v90 = slice.origin.y;
    double v91 = slice.size.height;
    v92 = [(_UIEditMenuListView *)self titleContainerView];
    objc_msgSend(v92, "setFrame:", v87, v90, v165, v91);

    v177.origin.double x = v87;
    v177.origin.double y = v90;
    v177.size.double width = v165;
    v177.size.double height = v91;
    double v93 = CGRectGetWidth(v177);
    CGFloat v94 = (v93 - CGRectGetWidth(slice)) * 0.5;
    slice.origin.double x = v94;
    slice.origin.double y = 0.0;
    double v95 = slice.size.width;
    CGFloat v96 = slice.size.height;
    v97 = [(_UIEditMenuListView *)self titleView];
    double v98 = v96;
    double v85 = v165;
    objc_msgSend(v97, "setFrame:", v94, 0.0, v95, v98);

    if ([(_UIEditMenuListView *)self _hasDisplayedMenu])
    {
      v99 = [(_UIEditMenuListView *)self titleSeparatorView];

      if (v99)
      {
        int64_t v100 = [(_UIEditMenuListView *)self arrowDirection];
        CGFloat v101 = slice.origin.x;
        CGFloat v102 = slice.origin.y;
        CGFloat v103 = slice.size.width;
        CGFloat v104 = slice.size.height;
        if (v100 == 1) {
          double MaxY = CGRectGetMinY(*(CGRect *)&v101);
        }
        else {
          double MaxY = CGRectGetMaxY(*(CGRect *)&v101);
        }
        double v106 = MaxY;
        v107 = [(_UIEditMenuListView *)self titleSeparatorView];
        objc_msgSend(v107, "setFrame:", 0.0, v106, v165, v155);
      }
    }
  }
  if ((*(void *)&v15 & 0x80000) != 0) {
    double v108 = width - largestPageWidth;
  }
  else {
    double v108 = 0.0;
  }
  v109 = [(_UIEditMenuListView *)self collectionView];
  objc_msgSend(v109, "setFrame:", v108, 0.0, largestPageWidth, rect);

  if (!v14)
  {
    v178.origin.double x = v87;
    v178.origin.double y = r2a;
    v178.size.double width = v85;
    v178.size.double height = rect;
    double v161 = CGRectGetMinY(v178);
    v179.origin.double x = v87;
    v179.origin.double y = r2a;
    v179.size.double width = v85;
    v179.size.double height = rect;
    double v110 = CGRectGetHeight(v179);
    v180.origin.double x = v158 + v87;
    v180.origin.double y = v162;
    v180.size.double width = width;
    v180.size.double height = rect;
    -[UIButton setFrame:](self->_leftButton, "setFrame:", v155 + CGRectGetMinX(v180) - v156, v161, v155 + v156, v110);
    [(UIView *)self->_leftButton setAlpha:v151];
    v181.origin.double x = v158 + v87;
    v181.origin.double y = v162;
    v181.size.double width = width;
    v181.size.double height = rect;
    CGFloat v111 = CGRectGetMaxX(v181);
    double v112 = v110;
    double v85 = v165;
    -[UIButton setFrame:](self->_rightButton, "setFrame:", v111, v161, v155 + v156, v112);
    [(UIView *)self->_rightButton setAlpha:v152];
  }
  v113 = [(_UIEditMenuListView *)self titleContainerView];
  [v113 frame];
  IsEmptdouble y = CGRectIsEmpty(v182);

  if (IsEmpty)
  {
    double v115 = v157;
    double v116 = r2a;
  }
  else
  {
    v117 = [(_UIEditMenuListView *)self titleContainerView];
    [v117 frame];
    v186.origin.double x = v87;
    v186.origin.double y = r2a;
    v186.size.double width = v85;
    v186.size.double height = rect;
    CGRect v184 = CGRectUnion(v183, v186);
    double v87 = v184.origin.x;
    double v116 = v184.origin.y;
    double v85 = v184.size.width;
    double v86 = v184.size.height;

    double v115 = v157;
  }
  int64_t v118 = [(_UIEditMenuListView *)self arrowDirection];
  int64_t v119 = [(_UIEditMenuListView *)self axis];
  double v120 = 0.0;
  if (v118 == 1) {
    double v121 = v115;
  }
  else {
    double v121 = 0.0;
  }
  if (v118 == 1) {
    double v122 = 0.0;
  }
  else {
    double v122 = v115;
  }
  if (v118 == 3)
  {
    double v121 = 0.0;
    double v123 = v115;
  }
  else
  {
    double v123 = 0.0;
  }
  if (v118 == 3) {
    double v122 = 0.0;
  }
  if (v118 == 4)
  {
    double v121 = 0.0;
    double v123 = 0.0;
    double v122 = 0.0;
    double v124 = v115;
  }
  else
  {
    double v124 = 0.0;
  }
  if (v119 == (unint64_t)(v118 - 5) < 0xFFFFFFFFFFFFFFFELL)
  {
    double v121 = 0.0;
    double v123 = 0.0;
    double v122 = 0.0;
  }
  else
  {
    double v120 = v124;
  }
  double v125 = v87 + v123;
  double v126 = v116 + v121;
  double v127 = v85 - (v123 + v120);
  double v128 = v86 - (v121 + v122);
  -[_UIEditMenuListView _updateMaskingLayerWithFrame:](self, "_updateMaskingLayerWithFrame:", v125, v126, v127, v128);
  v129 = [(_UIEditMenuListView *)self customBackgroundPlatterView];
  objc_msgSend(v129, "setFrame:", v125, v126, v127, v128);

  [(UIView *)self bounds];
  double v131 = v130;
  double v133 = v132;
  double v135 = v134;
  double v137 = v136;
  v138 = [(_UIEditMenuListView *)self backgroundView];
  v139 = [v138 superview];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v139, v131, v133, v135, v137);
  double v141 = v140;
  double v143 = v142;
  double v145 = v144;
  double v147 = v146;
  v148 = [(_UIEditMenuListView *)self backgroundView];
  objc_msgSend(v148, "setFrame:", v141, v143, v145, v147);

  if (v14)
  {
    double verticalContentHeight = self->_verticalContentHeight;
    v150 = [(_UIEditMenuListView *)self collectionView];
    [v150 bounds];
    [(_UIEditMenuListView *)self setScrubbingEnabled:verticalContentHeight <= CGRectGetHeight(v185)];
  }
}

- (BOOL)scrubbingEnabled
{
  v2 = [(_UIEditMenuListView *)self collectionView];
  char v3 = [v2 bounces] ^ 1;

  return v3;
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 10.0;
  }
  BOOL v5 = !a3;
  double v6 = [(_UIEditMenuListView *)self collectionView];
  [v6 setBounces:v5];

  id v7 = [(_UIEditMenuListView *)self selectionGestureRecognizer];
  objc_msgSend(v7, "setAllowableMovement:", v4, v4);
}

- (double)_collectionViewWidthForPageProgress:(double)a3
{
  if ([(_UIEditMenuListView *)self _hasDisplayedMenu] && ![(_UIEditMenuListView *)self axis])
  {
    double v13 = [(_UIEditMenuListView *)self collectionView];
    [v13 viewWidthForPageProgress:a3];
    double v15 = v14;

    return v15;
  }
  else
  {
    int64_t v5 = [(_UIEditMenuListView *)self arrowDirection];
    double v6 = [(UIView *)self traitCollection];
    _UIEditMenuScaledArrowSize(v6);
    if (v5 == 3) {
      double v8 = v7;
    }
    else {
      double v8 = 0.0;
    }
    if (v5 == 4) {
      double v9 = 0.0;
    }
    else {
      double v9 = v8;
    }
    if (v5 == 4) {
      double v10 = v7;
    }
    else {
      double v10 = 0.0;
    }

    [(UIView *)self bounds];
    return v11 - (v9 + v10);
  }
}

- (BOOL)_isPaginationDirtyForContainerSize:(CGSize)a3
{
  if (*(unsigned char *)&self->_needsUpdate) {
    return 1;
  }
  if (self->_paginationContainerSize.height == a3.height) {
    return self->_paginationContainerSize.width != a3.width;
  }
  return 1;
}

- (void)_setNeedsPaginationUpdate
{
  *(unsigned char *)&self->_needsUpdate |= 1u;
}

- (void)_updatePaginationForSnapshot:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v86[16] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(_UIEditMenuListView *)self axis])
  {
    double v8 = [(_UIEditMenuListView *)self collectionView];
    [v8 setPages:MEMORY[0x1E4F1CBF0]];

    *(unsigned char *)&self->_needsUpdate &= ~1u;
    self->_paginationContainerSize = (CGSize)*MEMORY[0x1E4F1DB30];
    goto LABEL_51;
  }
  if (!v7)
  {
    id v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  }
  -[UIButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width, height);
  double v10 = v9;
  [(_UIEditMenuListView *)self _minimumRequiredWidthForArrowInRoundedListViewForAxis:[(_UIEditMenuListView *)self axis]];
  double v12 = v11;
  double v13 = [(UIView *)self traitCollection];
  id v76 = v7;
  double v14 = [v7 itemIdentifiers];
  double v15 = [MEMORY[0x1E4F1CA48] array];
  if ([v14 count])
  {
    double v74 = v12;
    double v16 = width;
    double v17 = height;
    uint64_t v18 = [v14 count];
    double v75 = &v71;
    MEMORY[0x1F4188790](v18);
    BOOL v20 = (char *)&v71 - v19;
    uint64_t v21 = [[_UIEditMenuListPage alloc] initWithStartIndex:0];
    [v15 addObject:v21];
    if ([v14 count])
    {
      unint64_t v22 = 0;
      double v23 = 0.0;
      do
      {
        double v24 = [v14 objectAtIndex:v22];
        if ((unint64_t)[v15 count] <= 1) {
          double v25 = 0.0;
        }
        else {
          double v25 = v10 + 0.0;
        }
        uint64_t v26 = [v14 count];
        double v27 = -0.0;
        if (v22 < v26 - 1) {
          double v27 = v10;
        }
        double v28 = v25 + v27;
        +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", v24, v13, v16, height);
        double v30 = fmin(v29, v16 - v28);
        *(double *)&v20[8 * v22] = v30;
        [(_UIEditMenuListPage *)v21 width];
        UIRoundToViewScale(self);
        double v32 = v31;
        UIRoundToViewScale(self);
        if (v32 > v33)
        {
          double v34 = v13;
          v35 = [[_UIEditMenuListPage alloc] initWithStartIndex:v22];

          [v15 addObject:v35];
          uint64_t v21 = v35;
          double v13 = v34;
        }
        [(_UIEditMenuListPage *)v21 appendItemWithWidth:v30];
        [(_UIEditMenuListPage *)v21 width];
        double v23 = fmax(v36, v23);

        ++v22;
      }
      while (v22 < [v14 count]);
    }
    else
    {
      double v23 = 0.0;
    }
    if ((unint64_t)[v15 count] <= 1)
    {
      double width = v16;
      double v12 = v74;
LABEL_38:

      goto LABEL_39;
    }
    double v37 = [v15 lastObject];
    int64_t v38 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v15, "count") - 2);
    double v39 = *(double *)&v20[8 * [v37 range] - 8];
    [v37 width];
    double v41 = v40;
    [v38 width];
    double v43 = v42 * 0.5;
    [v38 range];
    unint64_t v45 = v44;
    [v37 width];
    if (v41 >= v43)
    {
      double height = v17;
    }
    else
    {
      double height = v17;
      if (v45 >= 2)
      {
        double width = v16;
        if (v39 + v46 < v16 - v10)
        {
          double v72 = v38;
          double v73 = v13;
          [v38 removeLastItemWithWidth:v39];
          [v37 prependItemWithWidth:v39];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v47 = v15;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v81 objects:v86 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v82;
            double v12 = v74;
            do
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v82 != v50) {
                  objc_enumerationMutation(v47);
                }
                [*(id *)(*((void *)&v81 + 1) + 8 * i) width];
                double v23 = fmax(v23, v52);
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v81 objects:v86 count:16];
            }
            while (v49);
          }
          else
          {
            double v12 = v74;
          }

          int64_t v38 = v72;
          double v13 = v73;
          goto LABEL_37;
        }
LABEL_36:
        double v12 = v74;
LABEL_37:

        goto LABEL_38;
      }
    }
    double width = v16;
    goto LABEL_36;
  }
  double v23 = 0.0;
LABEL_39:
  double v53 = v12 + v12;
  if ([v15 count] == 1)
  {
    double v54 = [v15 firstObject];
    [v54 enforceMinimumWidth:v53];
  }
  if ([v15 count])
  {
    [(UIScrollView *)self->_collectionView contentInset];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    id v61 = [v15 lastObject];
    [v61 width];
    double v63 = v23 - v62;

    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v56, v58, v60, v63);
  }
  double v64 = [(_UIEditMenuListView *)self collectionView];
  [v64 setPages:v15];

  self->_double largestPageWidth = fmax(v53, v23);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  double v65 = [(_UIEditMenuListView *)self collectionView];
  uint64_t v66 = [v65 visibleCells];

  uint64_t v67 = [v66 countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v68; ++j)
      {
        if (*(void *)v78 != v69) {
          objc_enumerationMutation(v66);
        }
        [*(id *)(*((void *)&v77 + 1) + 8 * j) setMaximumContentWidth:self->_largestPageWidth];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v68);
  }

  -[_UIEditMenuListView setScrubbingEnabled:](self, "setScrubbingEnabled:", [v15 count] == 1);
  [(UIView *)self setNeedsLayout];
  *(unsigned char *)&self->_needsUpdate &= ~1u;
  self->_paginationContainerSize.double width = width;
  self->_paginationContainerSize.double height = height;

  id v7 = v76;
LABEL_51:
}

- (void)_didTapLeftDirectionalButton:(id)a3
{
  int v3 = *((_DWORD *)&self->super._viewFlags + 4);
  double v4 = [(_UIEditMenuListView *)self collectionView];
  id v5 = v4;
  if ((v3 & 0x80000) != 0) {
    [v4 incrementTargetPage];
  }
  else {
    [v4 decrementTargetPage];
  }
}

- (void)_didTapRightDirectionalButton:(id)a3
{
  int v3 = *((_DWORD *)&self->super._viewFlags + 4);
  double v4 = [(_UIEditMenuListView *)self collectionView];
  id v5 = v4;
  if ((v3 & 0x80000) != 0) {
    [v4 decrementTargetPage];
  }
  else {
    [v4 incrementTargetPage];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4 = [(_UIEditMenuListView *)self selectionGestureRecognizer];
  uint64_t v5 = [v4 state];

  if (v5)
  {
    double v6 = [(_UIEditMenuListView *)self selectionGestureRecognizer];
    [v6 setEnabled:0];

    id v7 = [(_UIEditMenuListView *)self selectionGestureRecognizer];
    [v7 setEnabled:1];
  }
  [(_UIEditMenuListView *)self _updateHighlightState];
  if (![(_UIEditMenuListView *)self axis])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = [(_UIEditMenuListView *)self collectionView];
  objc_msgSend(v7, "pageProgressForContentOffset:clamped:", 1, a5->x, a5->y);
  double v9 = v8;

  id v10 = [(_UIEditMenuListView *)self collectionView];
  [v10 setTargetPage:llround(v9)];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v18 = a4;
  double v6 = [(UIView *)self traitCollection];
  _UIEditMenuScaledArrowSize(v6);
  double v8 = v7;

  int64_t v9 = [(_UIEditMenuListView *)self arrowDirection];
  int64_t v10 = [(_UIEditMenuListView *)self axis];
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  if (v10 != (unint64_t)(v9 - 5) < 0xFFFFFFFFFFFFFFFELL)
  {
    double v12 = v9 == 1 ? v8 : 0.0;
    double v16 = v9 == 1 ? 0.0 : v8;
    if (v9 == 3)
    {
      double v12 = 0.0;
      double v17 = v8;
    }
    else
    {
      double v17 = 0.0;
    }
    double v11 = v9 == 3 ? 0.0 : v16;
    if (v9 == 4)
    {
      double v12 = 0.0;
      double v13 = 0.0;
    }
    else
    {
      double v13 = v17;
    }
    double v14 = v9 == 4 ? 0.0 : v11;
    if (v9 == 4) {
      double v15 = v8;
    }
  }
  objc_msgSend(v18, "setArrowEdgeInsets:", v12, v13, v14, v15, v11);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIEditMenuListView *)self maskLayer];
  BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v8 path]);
  v14.double x = x;
  v14.double y = y;
  BOOL v9 = CGRectContainsPoint(BoundingBox, v14);

  if (v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIEditMenuListView;
    int64_t v10 = -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIEditMenuListView *)self leftButton];
  int isGestureRecognizerLocationInsideView = _isGestureRecognizerLocationInsideView(v4, v5);

  if (isGestureRecognizerLocationInsideView)
  {
    id v7 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v8 = 0;
LABEL_5:
    double v11 = [v7 indexPathWithIndex:v8];
    goto LABEL_6;
  }
  BOOL v9 = [(_UIEditMenuListView *)self rightButton];
  int v10 = _isGestureRecognizerLocationInsideView(v4, v9);

  if (v10)
  {
    id v7 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  double v13 = [(_UIEditMenuListView *)self menuContainerView];
  int v14 = _isGestureRecognizerLocationInsideView(v4, v13);

  if (v14)
  {
    double v15 = [(_UIEditMenuListView *)self collectionView];
    [v4 locationInView:v15];
    double v17 = v16;
    double v19 = v18;

    BOOL v20 = [(_UIEditMenuListView *)self collectionView];
    double v11 = objc_msgSend(v20, "indexPathForItemAtPoint:", v17, v19);

    uint64_t v21 = [(_UIEditMenuListView *)self collectionView];
    unint64_t v22 = [v21 cellForItemAtIndexPath:v11];

    double v23 = [v22 securePasteButtonSlotView];

    if (v23)
    {
      double v24 = [v22 securePasteButtonSlotView];
      double v25 = [(_UIEditMenuListView *)self collectionView];
      objc_msgSend(v24, "convertPoint:fromView:", v25, v17, v19);
      double v27 = v26;
      double v29 = v28;

      if ((objc_msgSend(v24, "pointInside:withEvent:", 0, v27, v29) & 1) == 0)
      {

        double v11 = 0;
      }
    }
  }
  else
  {
    double v11 = 0;
  }
LABEL_6:

  return v11;
}

- (void)_handleSelectionGesture:(id)a3
{
  id v20 = a3;
  id v4 = -[_UIEditMenuListView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:");
  uint64_t v5 = [(_UIEditMenuListView *)self collectionView];
  if ([v5 isDecelerating])
  {
    double v6 = [(_UIEditMenuListView *)self collectionView];
    id v7 = [v6 panGestureRecognizer];
    BOOL v8 = [v7 state] == 5;
  }
  else
  {
    BOOL v8 = 1;
  }

  uint64_t v9 = [v20 state];
  int v10 = v4;
  if ((unint64_t)(v9 - 1) < 2) {
    goto LABEL_17;
  }
  if (v9 != 3)
  {
    int v10 = 0;
LABEL_17:
    [(_UIEditMenuListView *)self setScrubbedIndexPath:v10];
LABEL_18:
    [(_UIEditMenuListView *)self _updateHighlightState];
    goto LABEL_19;
  }
  [(_UIEditMenuListView *)self setScrubbedIndexPath:0];
  if (v4) {
    BOOL v11 = v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11) {
    goto LABEL_18;
  }
  BOOL v12 = [(_UIEditMenuListView *)self _canSelectItemAtIndexPath:v4];
  [(_UIEditMenuListView *)self _updateHighlightState];
  if (v12)
  {
    double v13 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v4];
    int v14 = [v13 menuElement];

    if ([(_UIEditMenuListView *)self _hasPasteAuthentication])
    {
      uint64_t v15 = -[UIGestureRecognizer _activeTouchesEvent](v20);
      if (v15)
      {
        double v16 = (void *)v15;
        int v17 = [v14 _acceptBoolMenuVisit:0 commandVisit:&__block_literal_global_451 actionVisit:&__block_literal_global_455];

        if (v17)
        {
          double v18 = -[UIGestureRecognizer _activeTouchesEvent](v20);
          double v19 = [v18 _authenticationMessage];
          +[UIPasteboard _attemptAuthenticationWithMessage:v19];
        }
      }
    }
    [(_UIEditMenuListView *)self _selectItemAtIndexPath:v4];
  }
LABEL_19:
}

- (void)_handleHoverGesture:(id)a3
{
  id v4 = a3;
  id v7 = [(_UIEditMenuListView *)self _indexPathForGestureRecognizer:v4];
  uint64_t v5 = [v4 state];

  if ((unint64_t)(v5 - 1) >= 2) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  [(_UIEditMenuListView *)self setHoveredIndexPath:v6];
  [(_UIEditMenuListView *)self _updateHighlightState];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIEditMenuListView *)self selectionGestureRecognizer];

  if (v5 == v4)
  {
    id v7 = [(UIView *)self layer];
    BOOL v8 = [v7 presentationLayer];
    [v8 opacity];
    double v10 = v9;

    if (v10 >= 0.9)
    {
      BOOL v11 = [(_UIEditMenuListView *)self _indexPathForGestureRecognizer:v4];
      BOOL v6 = v11 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIEditMenuListView *)self selectionGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(_UIEditMenuListView *)self collectionView];
    id v11 = [v10 panGestureRecognizer];
    BOOL v9 = v11 == v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateHighlightState
{
  int v3 = [(_UIEditMenuListView *)self collectionView];
  int v4 = [v3 isDragging];

  id v9 = [(_UIEditMenuListView *)self scrubbedIndexPath];
  id v5 = [(_UIEditMenuListView *)self hoveredIndexPath];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v9;
  }
  id v7 = v6;
  id v8 = v7;
  if (v4)
  {
    [(_UIEditMenuListView *)self highlightedIndexPath];
  }
  else if (v7)
  {
    [(_UIEditMenuListView *)self _highlightItemAtIndexPath:v7];
    goto LABEL_9;
  }
  [(_UIEditMenuListView *)self _unhighlightCurrentlyHighlightedItem];
LABEL_9:
}

- (BOOL)_canSelectItemAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIEditMenuListView.m", 1021, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  id v6 = [(_UIEditMenuListView *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];
  id v8 = [v7 menuElement];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 primaryActionHandler];
    BOOL v10 = v9 != 0;
  }
  else if ([v8 _isLeaf])
  {
    BOOL v10 = ([v8 attributes] & 1) == 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_selectItemAtIndexPath:(id)a3
{
  id v5 = a3;
  id v16 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIEditMenuListView.m", 1035, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    id v5 = 0;
  }
  if ([(_UIEditMenuListView *)self _canSelectItemAtIndexPath:v5])
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
    int v7 = [v16 isEqual:v6];

    if (v7)
    {
      id v8 = [(_UIEditMenuListView *)self leftButton];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28D58] indexPathWithIndex:1];
      int v10 = [v16 isEqual:v9];

      if (!v10)
      {
        BOOL v12 = [(_UIEditMenuListView *)self dataSource];
        double v13 = [v12 itemIdentifierForIndexPath:v16];
        id v11 = [v13 menuElement];

        int v14 = [(_UIEditMenuListView *)self delegate];
        [v14 editMenuListView:self didSelectMenuElement:v11];

        goto LABEL_10;
      }
      id v8 = [(_UIEditMenuListView *)self rightButton];
    }
    id v11 = v8;
    [v8 sendActionsForControlEvents:0x2000];
LABEL_10:
  }
}

- (void)_highlightItemAtIndexPath:(id)a3
{
  id v12 = a3;
  if ((-[NSIndexPath isEqual:](self->_highlightedIndexPath, "isEqual:") & 1) == 0)
  {
    [(_UIEditMenuListView *)self _unhighlightCurrentlyHighlightedItem];
    if ([(_UIEditMenuListView *)self _canSelectItemAtIndexPath:v12])
    {
      objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
      id v5 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
      int v6 = [v12 isEqual:v5];

      if (v6)
      {
        uint64_t v7 = 576;
LABEL_7:
        [*(id *)((char *)&self->super.super.super.isa + v7) setHighlighted:1];
        goto LABEL_9;
      }
      id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:1];
      int v9 = [v12 isEqual:v8];

      if (v9)
      {
        uint64_t v7 = 584;
        goto LABEL_7;
      }
      int v10 = [(_UIEditMenuListView *)self collectionView];
      id v11 = [v10 cellForItemAtIndexPath:v12];

      [v11 setHighlighted:1];
    }
  }
LABEL_9:
}

- (void)_unhighlightCurrentlyHighlightedItem
{
  highlightedIndexPath = self->_highlightedIndexPath;
  if (!highlightedIndexPath) {
    return;
  }
  int v4 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  int v5 = [(NSIndexPath *)highlightedIndexPath isEqual:v4];

  if (v5)
  {
    uint64_t v6 = 576;
  }
  else
  {
    uint64_t v7 = self->_highlightedIndexPath;
    id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:1];
    LODWORD(v7) = [(NSIndexPath *)v7 isEqual:v8];

    if (!v7)
    {
      int v9 = [(_UIEditMenuListView *)self collectionView];
      int v10 = [v9 cellForItemAtIndexPath:self->_highlightedIndexPath];

      [v10 setHighlighted:0];
      goto LABEL_9;
    }
    uint64_t v6 = 584;
  }
  [*(id *)((char *)&self->super.super.super.isa + v6) setHighlighted:0];
LABEL_9:
  id v11 = self->_highlightedIndexPath;
  self->_highlightedIndexPath = 0;
}

- (void)setArrowDirection:(int64_t)a3
{
  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    [(_UIEditMenuListView *)self _updateArrowEdgeInsets];
  }
}

- (void)_updateArrowEdgeInsets
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = [(UIView *)self traitCollection];
  _UIEditMenuScaledArrowSize(v3);
  double v5 = v4;

  int64_t v6 = [(_UIEditMenuListView *)self arrowDirection];
  int64_t v7 = [(_UIEditMenuListView *)self axis];
  uint64_t v8 = (unint64_t)(v6 - 5) < 0xFFFFFFFFFFFFFFFELL;
  if (v6 == 1) {
    double v9 = v5;
  }
  else {
    double v9 = 0.0;
  }
  if (v6 == 1) {
    double v10 = 0.0;
  }
  else {
    double v10 = v5;
  }
  if (v6 == 3)
  {
    double v9 = 0.0;
    double v11 = v5;
  }
  else
  {
    double v11 = 0.0;
  }
  if (v6 == 3) {
    double v10 = 0.0;
  }
  if (v6 == 4)
  {
    double v9 = 0.0;
    double v11 = 0.0;
    double v10 = 0.0;
    double v12 = v5;
  }
  else
  {
    double v12 = 0.0;
  }
  if (v7 == v8) {
    double v13 = 0.0;
  }
  else {
    double v13 = v9;
  }
  if (v7 == v8) {
    double v14 = 0.0;
  }
  else {
    double v14 = v11;
  }
  if (v7 == v8) {
    double v15 = 0.0;
  }
  else {
    double v15 = v10;
  }
  if (v7 == v8) {
    double v16 = 0.0;
  }
  else {
    double v16 = v12;
  }
  -[_UIEditMenuPageButton setArrowEdgeInsets:](self->_leftButton, "setArrowEdgeInsets:", v13, v14, v15, v16, v12);
  -[_UIEditMenuPageButton setArrowEdgeInsets:](self->_rightButton, "setArrowEdgeInsets:", v13, v14, v15, v16);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v17 = [(_UIEditMenuListView *)self collectionView];
  double v18 = [v17 visibleCells];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "setArrowEdgeInsets:", v13, v14, v15, v16);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }

  [(UIView *)self setNeedsLayout];
}

- (void)_updateMaskingLayerWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    id v67 = [(UIView *)self traitCollection];
    uint64_t v8 = _UIEditMenuGetPlatformMetrics([v67 userInterfaceIdiom]);
    if ([(_UIEditMenuListView *)self axis]) {
      [v8 verticalMenuCornerRadius];
    }
    else {
      [v8 horizontalMenuCornerRadius];
    }
    double v10 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
    [v8 arrowSize];
    if (v12 != *MEMORY[0x1E4F1DB30] || v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v14 = [(UIView *)self superview];
      [(UIView *)self center];
      objc_msgSend(v14, "convertPoint:toView:", self);
      double v63 = v16;
      double v64 = v15;

      int64_t v17 = [(_UIEditMenuListView *)self arrowDirection];
      double v18 = _UIEditMenuScaledArrowSize(v67);
      double v65 = v19;
      double v66 = v18;
      id v20 = v67;
      uint64_t v21 = _UIEditMenuGetPlatformMetrics([v20 userInterfaceIdiom]);
      [v21 arrowSideRadius];
      double v23 = v22;
      id v24 = v20;
      long long v25 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v24];
      [v25 _scaledValueForValue:0 useLanguageAwareScaling:v23];
      double v27 = v26;
      [v24 displayScale];
      double v29 = v28;

      UIRoundToScale(v27, fmax(v29, 1.0));
      double v31 = v30;

      id v32 = v24;
      double v33 = _UIEditMenuGetPlatformMetrics([v32 userInterfaceIdiom]);
      [v33 arrowTipRadius];
      double v35 = v34;
      id v36 = v32;
      double v37 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v36];
      [v37 _scaledValueForValue:0 useLanguageAwareScaling:v35];
      double v39 = v38;
      [v36 displayScale];
      double v41 = v40;

      UIRoundToScale(v39, fmax(v41, 1.0));
      double v43 = v42;

      id v44 = v10;
      double v45 = x;
      double v46 = y;
      double v47 = width;
      double v48 = height;
      if ((unint64_t)(v17 - 3) > 1)
      {
        if (v17 == 2)
        {
          double MaxY = CGRectGetMaxY(*(CGRect *)&v45);
          v70.origin.double x = x;
          v70.origin.double y = y;
          v70.size.double width = width;
          v70.size.double height = height;
          double v53 = v65 + CGRectGetMaxY(v70);
          double v54 = -5.0;
        }
        else
        {
          double MaxY = CGRectGetMinY(*(CGRect *)&v45);
          v72.origin.double x = x;
          v72.origin.double y = y;
          v72.size.double width = width;
          v72.size.double height = height;
          double v53 = CGRectGetMinY(v72) - v65;
          double v54 = 5.0;
        }
        double v58 = v64 + v66 * 0.5;
        double v59 = v64 - v66 * 0.5;
        double v60 = MaxY + 0.0;
        if (v17 == 2) {
          _appendBezierPathForPoints(v44, v31, v43, v64 + v66 * 0.5, MaxY, v64 - v66 * 0.5, MaxY, v58 + v31, v60, v59 - v31, MaxY + 0.0, v64, v53, 0.0, v54);
        }
        else {
          _appendBezierPathForPoints(v44, v31, v43, v64 - v66 * 0.5, MaxY, v58, MaxY, v59 - v31, v60, v58 + v31, MaxY + 0.0, v64, v53, 0.0, v54);
        }
      }
      else
      {
        if (v17 == 4)
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v45);
          v69.origin.double x = x;
          v69.origin.double y = y;
          v69.size.double width = width;
          v69.size.double height = height;
          double v50 = v65 + CGRectGetMaxX(v69);
          double v51 = -5.0;
        }
        else
        {
          double MaxX = CGRectGetMinX(*(CGRect *)&v45);
          v71.origin.double x = x;
          v71.origin.double y = y;
          v71.size.double width = width;
          v71.size.double height = height;
          double v50 = CGRectGetMinX(v71) - v65;
          double v51 = 5.0;
        }
        double v55 = v63 - v66 * 0.5;
        double v56 = v63 + v66 * 0.5;
        double v57 = MaxX + 0.0;
        if (v17 == 4) {
          _appendBezierPathForPoints(v44, v31, v43, MaxX, v63 - v66 * 0.5, MaxX, v63 + v66 * 0.5, v57, v55 - v31, MaxX + 0.0, v56 + v31, v50, v63, v51, 0.0);
        }
        else {
          _appendBezierPathForPoints(v44, v31, v43, MaxX, v63 + v66 * 0.5, MaxX, v55, v57, v56 + v31, MaxX + 0.0, v55 - v31, v50, v63, v51, 0.0);
        }
      }
    }
    id v61 = v10;
    -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", [v61 CGPath]);
    if ([(_UIEditMenuListView *)self hasShadow])
    {
      double v62 = [(_UIEditMenuListView *)self shadowView];
      [v62 setPath:v61];
    }
  }
}

- (BOOL)hasShadow
{
  v2 = [(_UIEditMenuListView *)self shadowView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)backgroundMaterialGroupName
{
  backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  if (!backgroundMaterialGroupName)
  {
    double v4 = NSString;
    double v5 = [MEMORY[0x1E4F29128] UUID];
    int64_t v6 = [v5 UUIDString];
    int64_t v7 = [v4 stringWithFormat:@"edit-menu-background-%@", v6];
    uint64_t v8 = self->_backgroundMaterialGroupName;
    self->_backgroundMaterialGroupName = v7;

    backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  }
  return backgroundMaterialGroupName;
}

- (_UIEditMenuListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIEditMenuListViewDelegate *)WeakRetained;
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (int64_t)axis
{
  return self->_axis;
}

- (unint64_t)preferredElementDisplayMode
{
  return self->_preferredElementDisplayMode;
}

- (void)setPreferredElementDisplayMode:(unint64_t)a3
{
  self->_preferredElementDisplayMode = a3;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (UIView)customBackgroundPlatterView
{
  return self->_customBackgroundPlatterView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIDiffuseShadowView)shadowView
{
  return self->_shadowView;
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (UIView)menuContainerView
{
  return self->_menuContainerView;
}

- (_UIEditMenuCollectionView)collectionView
{
  return self->_collectionView;
}

- (UIView)titleContainerView
{
  return self->_titleContainerView;
}

- (UIView)titleSeparatorView
{
  return self->_titleSeparatorView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (_UIEditMenuPageButton)leftButton
{
  return self->_leftButton;
}

- (_UIEditMenuPageButton)rightButton
{
  return self->_rightButton;
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
}

- (NSIndexPath)hoveredIndexPath
{
  return self->_hoveredIndexPath;
}

- (void)setHoveredIndexPath:(id)a3
{
}

- (NSIndexPath)scrubbedIndexPath
{
  return self->_scrubbedIndexPath;
}

- (void)setScrubbedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubbedIndexPath, 0);
  objc_storeStrong((id *)&self->_hoveredIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_titleSeparatorView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundMaterialGroupName, 0);
}

@end