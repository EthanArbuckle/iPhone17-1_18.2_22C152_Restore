@interface _UIContextMenuListView
- (BOOL)_shouldScrollToSelectedAction;
- (BOOL)allowsBackgroundViewInteraction;
- (BOOL)allowsFocus;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)emphasized;
- (BOOL)hasValidContentSize;
- (BOOL)portalingFocusedView;
- (BOOL)reversesActionOrder;
- (CGSize)nativeContentSize;
- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3;
- (CGSize)visibleContentSize;
- (CGVector)selectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3;
- (NSDirectionalEdgeInsets)contentMargins;
- (NSDirectionalEdgeInsets)headerMargins;
- (NSDirectionalEdgeInsets)menuTitleMargins;
- (NSIndexPath)highlightedIndexPath;
- (NSMutableArray)portals;
- (NSString)backgroundMaterialGroupName;
- (UIBezierPath)hoverZone;
- (UICollectionView)collectionView;
- (UICollectionView)outgoingCollectionView;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UICollectionViewDiffableDataSource)outgoingCollectionViewDataSource;
- (UIMenu)displayedMenu;
- (UIView)borderView;
- (UIView)clippingView;
- (UIView)cvBackgroundView;
- (UIView)portalContainerView;
- (UIVisualEffectView)backgroundView;
- (_UIContextMenuListView)initWithFrame:(CGRect)a3;
- (_UICutoutShadowView)shadowView;
- (double)_clampedCornerRadius;
- (double)closestScrollTruncationDetentToHeight:(double)a3;
- (double)collectionViewAlpha;
- (double)emphasisAlphaMultiplier;
- (double)shadowAlpha;
- (id)_dataSourceForCollectionView:(id)a3;
- (id)_headerIndexPath;
- (id)_platformMetrics;
- (id)_viewAtIndexPath:(id)a3;
- (id)cellForElement:(id)a3;
- (id)elementAtIndexPath:(id)a3;
- (id)indexPathForElement:(id)a3;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)preferredFocusEnvironments;
- (unint64_t)parentHierarchyStyle;
- (unint64_t)position;
- (unint64_t)roundedEdges;
- (void)_configureCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 forElement:(id)a6 section:(id)a7 size:(int64_t)a8;
- (void)_portalCellIfNeeded:(id)a3;
- (void)_removeAllPortals;
- (void)_setupCellPortalingIfNeeded;
- (void)_sizeClippingAndCollectionViews;
- (void)_tearDownCellPortalingIfNeeded;
- (void)_updateCellPortalingWithCell:(id)a3;
- (void)_updateCellPortalingWithUpdateFocusInContext:(id)a3 inCollectionView:(id)a4;
- (void)_updateCollectionViewAlpha;
- (void)_updateContentMargins;
- (void)_updateCornerRadius;
- (void)_updatePlatterHairline;
- (void)_updateScrollInsets;
- (void)_updateShadowAlpha;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didCompleteInPlaceMenuTransition;
- (void)highlightItemAtIndexPath:(id)a3;
- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4;
- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4 playFeedback:(BOOL)a5;
- (void)layoutSubviews;
- (void)scrollToFirstSignificantAction;
- (void)setAllowsBackgroundViewInteraction:(BOOL)a3;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewAlpha:(double)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setContentMargins:(NSDirectionalEdgeInsets)a3;
- (void)setCvBackgroundView:(id)a3;
- (void)setDisplayedMenu:(id)a3;
- (void)setEmphasisAlphaMultiplier:(double)a3;
- (void)setEmphasized:(BOOL)a3;
- (void)setHasValidContentSize:(BOOL)a3;
- (void)setHeaderMargins:(NSDirectionalEdgeInsets)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setHoverZone:(id)a3;
- (void)setMenuTitleMargins:(NSDirectionalEdgeInsets)a3;
- (void)setNativeContentSize:(CGSize)a3;
- (void)setOutgoingCollectionView:(id)a3;
- (void)setOutgoingCollectionViewDataSource:(id)a3;
- (void)setParentHierarchyStyle:(unint64_t)a3;
- (void)setPortalContainerView:(id)a3;
- (void)setPortalingFocusedView:(BOOL)a3;
- (void)setPortals:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setReversesActionOrder:(BOOL)a3;
- (void)setRoundedEdges:(unint64_t)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowView:(id)a3;
- (void)setSubmenuTitleViewExpanded:(BOOL)a3 withMaterialGroupName:(id)a4 associatedCellContentView:(id)a5 highlighted:(BOOL)a6;
- (void)setVisibleContentSize:(CGSize)a3;
- (void)unHighlightItemAtIndexPath:(id)a3;
- (void)willStartInPlaceMenuTransition;
@end

@implementation _UIContextMenuListView

- (_UIContextMenuListView)initWithFrame:(CGRect)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)_UIContextMenuListView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    v6 = [UIView alloc];
    [(UIView *)v4 bounds];
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    [(_UIContextMenuListView *)v4 setClippingView:v7];

    v8 = [(_UIContextMenuListView *)v4 clippingView];
    [v8 setClipsToBounds:1];

    v9 = [(_UIContextMenuListView *)v4 clippingView];
    [(UIView *)v4 addSubview:v9];

    v10 = [(UIView *)v4 traitCollection];
    v11 = _UIContextMenuGetPlatformMetrics([v10 userInterfaceIdiom]);
    v12 = [UIVisualEffectView alloc];
    v13 = [v11 menuBackgroundEffect];
    v14 = [(UIVisualEffectView *)v12 initWithEffect:v13];

    v15 = [v11 menuBackgroundColor];
    [(UIView *)v14 setBackgroundColor:v15];

    [(_UIContextMenuListView *)v4 setBackgroundView:v14];
    v16 = [(_UIContextMenuListView *)v4 backgroundMaterialGroupName];
    v17 = [(_UIContextMenuListView *)v4 backgroundView];
    [v17 _setGroupName:v16];

    v18 = [(_UIContextMenuListView *)v4 clippingView];
    v19 = [(_UIContextMenuListView *)v4 backgroundView];
    [v18 addSubview:v19];

    [(_UIContextMenuListView *)v4 setCollectionViewAlpha:1.0];
    [(_UIContextMenuListView *)v4 setEmphasized:1];
    [(_UIContextMenuListView *)v4 setAllowsFocus:1];
    [(_UIContextMenuListView *)v4 setRoundedEdges:5];
    [(_UIContextMenuListView *)v4 _setupCellPortalingIfNeeded];
    v20 = self;
    v34[0] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    id v22 = [(UIView *)v4 registerForTraitChanges:v21 withAction:sel__updatePlatterHairline];

    v23 = self;
    v33 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    id v25 = [(UIView *)v4 registerForTraitChanges:v24 withAction:sel__updateContentMargins];

    v26 = self;
    v32[0] = v26;
    v27 = self;
    v32[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v29 = [(UIView *)v4 registerForTraitChanges:v28 withHandler:&__block_literal_global_416];
  }
  return v4;
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    if (a3 > 0.0)
    {
      v4 = [(_UIContextMenuListView *)self shadowView];

      if (!v4)
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __41___UIContextMenuListView_setShadowAlpha___block_invoke;
        v5[3] = &unk_1E52D9F70;
        v5[4] = self;
        +[UIView performWithoutAnimation:v5];
      }
    }
    [(_UIContextMenuListView *)self _updateShadowAlpha];
  }
}

- (void)setCollectionViewAlpha:(double)a3
{
  if (self->_collectionViewAlpha != a3)
  {
    self->_collectionViewAlpha = a3;
    [(_UIContextMenuListView *)self _updateCollectionViewAlpha];
  }
}

- (void)setRoundedEdges:(unint64_t)a3
{
  if (self->_roundedEdges != a3)
  {
    self->_roundedEdges = a3;
    [(_UIContextMenuListView *)self _updateCornerRadius];
  }
}

- (CGVector)selectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContextMenuListView *)self collectionView];
  v6 = [v5 _autoScrollAssistantForIndexPath:v4];

  v7 = [v6 scrollView];

  v8 = [(_UIContextMenuListView *)self collectionView];

  if (v7 == v8)
  {
    [(_UIContextMenuListView *)self visibleContentSize];
    double v10 = v13;
    double v12 = v14;
  }
  else
  {
    [v7 frame];
    double v10 = v9;
    double v12 = v11;
  }
  [v7 contentSize];
  if (v15 <= v12) {
    double v16 = 0.0;
  }
  else {
    double v16 = 10.0;
  }
  [v7 contentSize];
  if (v17 <= v10) {
    double v18 = 0.0;
  }
  else {
    double v18 = 10.0;
  }

  double v19 = v18;
  double v20 = v16;
  result.dy = v20;
  result.dx = v19;
  return result;
}

- (void)setReversesActionOrder:(BOOL)a3
{
  if (self->_reversesActionOrder != a3)
  {
    self->_reversesActionOrder = a3;
    id v4 = [(_UIContextMenuListView *)self displayedMenu];

    if (v4)
    {
      v5 = [(_UIContextMenuListView *)self displayedMenu];
      _UIContextMenuCollectionViewDataSourceSnapshot(v5, self->_reversesActionOrder);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      v6 = [(_UIContextMenuListView *)self collectionViewDataSource];
      [v6 applySnapshotUsingReloadData:v13];

      v7 = [(_UIContextMenuListView *)self displayedMenu];
      int v8 = [v7 _hasGlobalHeader];
      uint64_t v9 = [(_UIContextMenuListView *)self position];
      double v10 = [(UIView *)self traitCollection];
      double v11 = _UIContextMenuCollectionViewLayout(v13, v8, v9, v10);
      double v12 = [(_UIContextMenuListView *)self collectionView];
      [v12 setCollectionViewLayout:v11];
    }
  }
}

- (void)setEmphasized:(BOOL)a3
{
  if (self->_emphasized != a3)
  {
    BOOL v3 = a3;
    self->_emphasized = a3;
    v5 = [(_UIContextMenuListView *)self collectionView];
    v6 = [v5 panGestureRecognizer];
    [v6 setEnabled:v3];

    double v7 = 1.0;
    if (!self->_emphasized)
    {
      unint64_t v8 = [(_UIContextMenuListView *)self parentHierarchyStyle];
      double v7 = 0.8;
      if (v8 == 1) {
        double v7 = 0.5;
      }
    }
    [(_UIContextMenuListView *)self setEmphasisAlphaMultiplier:v7];
    [(_UIContextMenuListView *)self _updateCollectionViewAlpha];
    [(_UIContextMenuListView *)self _updateShadowAlpha];
  }
}

- (void)setSubmenuTitleViewExpanded:(BOOL)a3 withMaterialGroupName:(id)a4 associatedCellContentView:(id)a5 highlighted:(BOOL)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(_UIContextMenuListView *)self _headerIndexPath];
  if (v12)
  {
    id v13 = [(_UIContextMenuListView *)self collectionView];
    double v14 = [v13 supplementaryViewForElementKind:@"kContextMenuSubmenuTitleHeader" atIndexPath:v12];

    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __114___UIContextMenuListView_setSubmenuTitleViewExpanded_withMaterialGroupName_associatedCellContentView_highlighted___block_invoke;
    v26 = &unk_1E52E7BD0;
    BOOL v32 = a6;
    v27 = self;
    BOOL v33 = v8;
    id v28 = v12;
    id v29 = v14;
    id v30 = v11;
    id v31 = v10;
    id v15 = v14;
    +[UIView performWithoutAnimation:&v23];
    double v16 = objc_msgSend(v15, "contentView", v23, v24, v25, v26, v27);
    uint64_t v17 = [v16 options];

    if (v8) {
      double v18 = 0.0;
    }
    else {
      double v18 = 1.0;
    }
    uint64_t v19 = 64;
    if (!v8) {
      uint64_t v19 = 0;
    }
    unint64_t v20 = v17 & 0xFFFFFFFFFFFFFFBFLL | v19;
    v21 = [v15 contentView];
    [v21 setOptions:v20];

    id v22 = [v15 obscuringMaterialView];
    [v22 setAlpha:v18];
  }
}

- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v6 = [(_UIContextMenuListView *)self collectionView];
  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v21 = &unk_186D7DBA7;
  [v6 contentSize];
  uint64_t v22 = v7;
  uint64_t v23 = v8;
  if (![(_UIContextMenuListView *)self hasValidContentSize])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66___UIContextMenuListView_preferredContentSizeWithinContainerSize___block_invoke;
    v12[3] = &unk_1E5300108;
    CGFloat v16 = width;
    double v17 = height;
    double v14 = self;
    id v15 = &v18;
    id v13 = v6;
    +[UIView performWithoutAnimation:v12];
  }
  double v9 = v19[4];
  if (v19[5] < height) {
    double height = v19[5];
  }
  v19[5] = height;
  _Block_object_dispose(&v18, 8);

  double v10 = v9;
  double v11 = height;
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (double)closestScrollTruncationDetentToHeight:(double)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = [(_UIContextMenuListView *)self collectionView];
  [v5 contentSize];
  if (v6 > a3)
  {
    BOOL v7 = [(_UIContextMenuListView *)self reversesActionOrder];
    double v8 = a3 + -50.0;
    if (v7)
    {
      [v5 contentSize];
      double v8 = v9 - v8;
    }
    [v5 bounds];
    double v11 = v10;
    double v12 = [v5 _collectionViewData];
    id v13 = -[UICollectionViewData layoutAttributesForElementsInRect:](v12, 0.0, v8, v11, 100.0);

    if ([v13 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        double v18 = 1.79769313e308;
        double v19 = a3;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (!objc_msgSend(v21, "representedElementCategory", (void)v25))
            {
              [v21 frame];
              double MidY = CGRectGetMidY(v31);
              if (v7)
              {
                [v5 contentSize];
                double MidY = v23 - MidY;
              }
              if (MidY < a3 && a3 - MidY < v18)
              {
                double v19 = MidY;
                double v18 = a3 - MidY;
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v16);
      }
      else
      {
        double v19 = a3;
      }

      a3 = v19;
    }
  }
  return a3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuListView;
  [(UIView *)&v14 layoutSubviews];
  [(_UIContextMenuListView *)self _sizeClippingAndCollectionViews];
  BOOL v3 = [(_UIContextMenuListView *)self shadowView];
  id v4 = [(_UIContextMenuListView *)self clippingView];
  [v4 frame];
  objc_msgSend(v3, "frameWithContentWithFrame:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(_UIContextMenuListView *)self shadowView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (void)_sizeClippingAndCollectionViews
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_UIContextMenuListView *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(_UIContextMenuListView *)self clippingView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  id v13 = [(_UIContextMenuListView *)self _platformMetrics];
  id v24 = [v13 gradientMaskingConfiguration];

  if (v24)
  {
    if ([v24 embedBackgroundForCompositing])
    {
      [v24 gradientMaskEdgeInsets];
      double v15 = v6 + v14;
      uint64_t v16 = [(_UIContextMenuListView *)self cvBackgroundView];
      objc_msgSend(v16, "setFrame:", v4, v15, v8, v10);
    }
    [v24 gradientMaskEdgeInsets];
    double v18 = v17;
    [v24 gradientMaskEdgeInsets];
    double v20 = v6 - v18;
    double v21 = v10 - (-v19 - v18);
    uint64_t v22 = [(_UIContextMenuListView *)self collectionView];
    objc_msgSend(v22, "setFrame:", v4 + 0.0, v20, v8, v21);

    double v23 = [(_UIContextMenuListView *)self borderView];
    objc_msgSend(v23, "setFrame:", v4 + -1.0, v6 + -1.0, v8 + 2.0, v10 + 2.0);
  }
  [(_UIContextMenuListView *)self _updateScrollInsets];
  [(_UIContextMenuListView *)self _updateCornerRadius];
}

- (void)_updateScrollInsets
{
  double v3 = [(_UIContextMenuListView *)self _platformMetrics];
  double v4 = [v3 gradientMaskingConfiguration];

  if (!v4)
  {
    double v5 = [(_UIContextMenuListView *)self collectionView];
    [v5 contentSize];
    double v7 = v6;

    [(_UIContextMenuListView *)self visibleContentSize];
    double v9 = v7 - v8;
    double v10 = [(_UIContextMenuListView *)self collectionView];
    [v10 frame];
    double v11 = v9 + CGRectGetHeight(v14) - v7;

    id v12 = [(_UIContextMenuListView *)self collectionView];
    objc_msgSend(v12, "setContentInset:", 0.0, 0.0, fmax(v11, 0.0), 0.0);
  }
}

- (void)setVisibleContentSize:(CGSize)a3
{
  if (a3.width != self->_visibleContentSize.width || a3.height != self->_visibleContentSize.height)
  {
    self->_visibleContentSize = a3;
    [(_UIContextMenuListView *)self _updateScrollInsets];
  }
}

- (void)_updateCornerRadius
{
  [(_UIContextMenuListView *)self _clampedCornerRadius];
  double v4 = v3;
  double v5 = [(_UIContextMenuListView *)self _platformMetrics];
  double v6 = [v5 gradientMaskingConfiguration];
  int v7 = [v6 backgroundMasksCorners];

  if (v7)
  {
    double v8 = [(_UIContextMenuListView *)self backgroundView];
    [v8 _setContinuousCornerRadius:v4];

    double v9 = [(_UIContextMenuListView *)self cvBackgroundView];
    [v9 _setContinuousCornerRadius:v4];

    double v10 = [(_UIContextMenuListView *)self borderView];
    [v10 _setContinuousCornerRadius:v4 + 1.0];

    double v11 = v4;
    double v12 = v4;
  }
  else
  {
    double v12 = 0.0;
    if ([(_UIContextMenuListView *)self roundedEdges]) {
      double v11 = v4;
    }
    else {
      double v11 = 0.0;
    }
    if (([(_UIContextMenuListView *)self roundedEdges] & 4) != 0) {
      double v12 = v4;
    }
  }
  uint64_t v13 = *MEMORY[0x1E4F39EA8];
  CGRect v14 = [(_UIContextMenuListView *)self clippingView];
  double v15 = [v14 layer];
  [v15 setCornerCurve:v13];

  uint64_t v16 = [(_UIContextMenuListView *)self clippingView];
  double v17 = [v16 layer];
  *(double *)double v23 = v12;
  *(double *)&v23[1] = v12;
  *(double *)&v23[2] = v12;
  *(double *)&v23[3] = v12;
  *(double *)&v23[4] = v11;
  *(double *)&v23[5] = v11;
  *(double *)&v23[6] = v11;
  *(double *)&v23[7] = v11;
  [v17 setCornerRadii:v23];

  double v18 = v4 + -2.0;
  double v19 = [(_UIContextMenuListView *)self collectionView];
  [v19 contentInset];
  double v21 = v18 + v20;
  uint64_t v22 = [(_UIContextMenuListView *)self collectionView];
  objc_msgSend(v22, "setScrollIndicatorInsets:", v18, 0.0, v21, 0.0);
}

- (void)_updateCollectionViewAlpha
{
  [(_UIContextMenuListView *)self collectionViewAlpha];
  double v4 = v3;
  [(_UIContextMenuListView *)self emphasisAlphaMultiplier];
  double v6 = v4 * v5;
  id v7 = [(_UIContextMenuListView *)self collectionView];
  [v7 setAlpha:v6];
}

- (void)_updateShadowAlpha
{
  double v3 = [(_UIContextMenuListView *)self _platformMetrics];
  id v33 = [v3 previewShadowSettings];

  if (v33 && ([v33 opacity], v4 > 0.0))
  {
    [v33 opacity];
    double v6 = v5;
    [(_UIContextMenuListView *)self emphasisAlphaMultiplier];
    double v8 = v6 * v7;
    [(_UIContextMenuListView *)self shadowAlpha];
    *(float *)&double v8 = v8 * ceil(v9);
    double v10 = [(_UIContextMenuListView *)self clippingView];
    double v11 = [v10 layer];
    LODWORD(v12) = LODWORD(v8);
    [v11 setShadowOpacity:v12];

    id v13 = [v33 color];
    uint64_t v14 = [v13 CGColor];
    double v15 = [(_UIContextMenuListView *)self clippingView];
    uint64_t v16 = [v15 layer];
    [v16 setShadowColor:v14];

    [v33 offset];
    double v18 = v17;
    double v20 = v19;
    double v21 = [(_UIContextMenuListView *)self clippingView];
    uint64_t v22 = [v21 layer];
    objc_msgSend(v22, "setShadowOffset:", v18, v20);

    [v33 radius];
    double v24 = v23;
    long long v25 = [(_UIContextMenuListView *)self clippingView];
    long long v26 = [v25 layer];
    [v26 setShadowRadius:v24];

    long long v27 = [(_UIContextMenuListView *)self clippingView];
    long long v28 = [v27 layer];
    [v28 setShadowPathIsBounds:1];
  }
  else
  {
    [(_UIContextMenuListView *)self shadowAlpha];
    double v30 = v29;
    [(_UIContextMenuListView *)self emphasisAlphaMultiplier];
    double v32 = v30 * v31;
    long long v27 = [(_UIContextMenuListView *)self shadowView];
    [v27 setAlpha:v32];
  }
}

- (void)setDisplayedMenu:(id)a3
{
  id v59 = a3;
  objc_storeStrong((id *)&self->_displayedMenu, a3);
  [(_UIContextMenuListView *)self setHasValidContentSize:0];
  [(_UIContextMenuListView *)self setHighlightedIndexPath:0];
  double v5 = [(_UIContextMenuListView *)self collectionViewDataSource];
  [(_UIContextMenuListView *)self setOutgoingCollectionViewDataSource:v5];

  [(_UIContextMenuListView *)self _updateContentMargins];
  double v6 = [(_UIContextMenuListView *)self displayedMenu];
  double v7 = _UIContextMenuCollectionViewDataSourceSnapshot(v6, [(_UIContextMenuListView *)self reversesActionOrder]);

  double v8 = [(_UIContextMenuListView *)self displayedMenu];
  int v9 = [v8 _hasGlobalHeader];
  uint64_t v10 = [(_UIContextMenuListView *)self position];
  double v11 = [(UIView *)self traitCollection];
  double v12 = _UIContextMenuCollectionViewLayout(v7, v9, v10, v11);

  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v61);
  uint64_t v14 = [(UIView *)self window];
  [v14 bounds];
  double Height = CGRectGetHeight(v62);

  if (Height < 44.0) {
    double Height = 44.0;
  }
  uint64_t v16 = -[UICollectionView initWithFrame:collectionViewLayout:]([UICollectionView alloc], "initWithFrame:collectionViewLayout:", v12, 0.0, 0.0, Width, Height);
  [(UICollectionView *)v16 setAllowsSelection:1];
  [(UICollectionView *)v16 setAllowsMultipleSelection:1];
  double v17 = +[UIColor clearColor];
  [(UICollectionView *)v16 setBackgroundColor:v17];

  [(UICollectionView *)v16 setAlwaysBounceVertical:0];
  [(UICollectionView *)v16 setAlwaysBounceHorizontal:0];
  [(UIView *)v16 setClipsToBounds:0];
  double v18 = [(_UIContextMenuListView *)self _platformMetrics];
  double v19 = [v18 gradientMaskingConfiguration];
  double v20 = [(UIView *)v16 layer];
  [v20 setAllowsGroupOpacity:v19 != 0];

  [(UICollectionView *)v16 setDelegate:self];
  [(UICollectionView *)v16 setRemembersLastFocusedIndexPath:1];
  double v21 = [(_UIContextMenuListView *)self _platformMetrics];
  uint64_t v22 = [v21 gradientMaskingConfiguration];

  if (v22)
  {
    [(UICollectionView *)v16 setAllowsSelection:1];
    [(UIView *)v16 setClipsToBounds:0];
    [(UIScrollView *)v16 setContentInsetAdjustmentBehavior:2];
    [v22 gradientMaskEdgeInsets];
    -[UICollectionView setContentInset:](v16, "setContentInset:");
    [v22 gradientMaskLengths];
    -[UIScrollView _setGradientMaskLengths:](v16, "_setGradientMaskLengths:");
    [v22 gradientMaskEdgeInsets];
    -[UIScrollView _setGradientMaskEdgeInsets:](v16, "_setGradientMaskEdgeInsets:");
    if ([v22 embedBackgroundForCompositing])
    {
      [(_UIContextMenuListView *)self _clampedCornerRadius];
      double v24 = v23;
      long long v25 = [(UIView *)self traitCollection];
      long long v26 = _UIContextMenuGetPlatformMetrics([v25 userInterfaceIdiom]);
      long long v27 = [UIVisualEffectView alloc];
      long long v28 = [v26 menuBackgroundEffect];
      double v29 = [(UIVisualEffectView *)v27 initWithEffect:v28];

      double v30 = [v26 menuBackgroundColor];
      [(UIView *)v29 setBackgroundColor:v30];

      [(UIVisualEffectView *)v29 _setContinuousCornerRadius:v24];
      double v31 = [(_UIContextMenuListView *)self backgroundMaterialGroupName];
      [(UIVisualEffectView *)v29 _setGroupName:v31];

      double v32 = [UIView alloc];
      [(UIView *)v16 bounds];
      id v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
      [(UIView *)v33 addSubview:v29];
      [v22 gradientMaskEdgeInsets];
      double v35 = v34;
      [v22 gradientMaskEdgeInsets];
      [(UIView *)v33 bounds];
      -[UIView setFrame:](v29, "setFrame:", v36 + 0.0, v35 + v37);
      [(_UIContextMenuListView *)self setCvBackgroundView:v29];
      [(UICollectionView *)v16 setBackgroundView:v33];
    }
    v38 = [(_UIContextMenuListView *)self borderView];

    if (!v38)
    {
      v39 = objc_alloc_init(UIView);
      [(_UIContextMenuListView *)self setBorderView:v39];

      v40 = [(_UIContextMenuListView *)self borderView];
      v41 = [(_UIContextMenuListView *)self clippingView];
      [(UIView *)self insertSubview:v40 belowSubview:v41];
    }
    [(UIView *)self bounds];
    double v43 = v42 + -1.0;
    double v45 = v44 + -1.0;
    double v47 = v46 + 2.0;
    double v49 = v48 + 2.0;
    v50 = [(_UIContextMenuListView *)self borderView];
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

    [(_UIContextMenuListView *)self _updatePlatterHairline];
  }
  [(UICollectionView *)v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kContextMenuSmallCell"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kContextMenuMediumCell"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kContextMenuLargeCell"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kContextMenuLoadingCell"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kContextMenuCustomViewCell"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuHeader" withReuseIdentifier:@"kContextMenuHeader"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuSubmenuTitleHeader" withReuseIdentifier:@"kContextMenuSubmenuTitleHeader"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuSectionSeparator" withReuseIdentifier:@"kContextMenuSectionSeparator"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuGradientMaskSectionSeparator" withReuseIdentifier:@"kContextMenuGradientMaskSectionSeparator"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuGradientStyleHeader" withReuseIdentifier:@"kContextMenuGradientStyleHeader"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuGradientStyleFooter" withReuseIdentifier:@"kContextMenuGradientStyleFooter"];
  [(UICollectionView *)v16 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kContextMenuThinSectionSeparator" withReuseIdentifier:@"kContextMenuThinSectionSeparator"];
  v51 = [(_UIContextMenuListView *)self _dataSourceForCollectionView:v16];
  [(_UIContextMenuListView *)self setCollectionViewDataSource:v51];

  v52 = [(_UIContextMenuListView *)self collectionViewDataSource];
  [v52 applySnapshotUsingReloadData:v7];

  [(_UIContextMenuListView *)self setCollectionView:v16];
  v53 = [(_UIContextMenuListView *)self _platformMetrics];
  v54 = [v53 gradientMaskingConfiguration];

  v55 = [(_UIContextMenuListView *)self clippingView];
  if (v54)
  {
    uint64_t v56 = [(_UIContextMenuListView *)self outgoingCollectionView];
    if (!v56)
    {
      v57 = [(_UIContextMenuListView *)self backgroundView];
      [v55 insertSubview:v16 aboveSubview:v57];

      v58 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v56 = [(_UIContextMenuListView *)self backgroundView];
  }
  v58 = (void *)v56;
  [v55 insertSubview:v16 aboveSubview:v56];
LABEL_14:

  [(_UIContextMenuListView *)self _updateCollectionViewAlpha];
}

- (void)willStartInPlaceMenuTransition
{
  double v3 = [(_UIContextMenuListView *)self collectionView];
  [(_UIContextMenuListView *)self setOutgoingCollectionView:v3];

  [(_UIContextMenuListView *)self _setupCellPortalingIfNeeded];
}

- (void)didCompleteInPlaceMenuTransition
{
  [(_UIContextMenuListView *)self setOutgoingCollectionView:0];
  [(_UIContextMenuListView *)self setOutgoingCollectionViewDataSource:0];
  [(_UIContextMenuListView *)self _tearDownCellPortalingIfNeeded];
}

- (id)preferredFocusEnvironments
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UIContextMenuListView *)self displayedMenu];
  __int16 v4 = [v3 metadata];
  double v5 = [(_UIContextMenuListView *)self highlightedIndexPath];

  if (v5)
  {
    double v6 = [(_UIContextMenuListView *)self highlightedIndexPath];
    double v7 = [(_UIContextMenuListView *)self _viewAtIndexPath:v6];
  }
  else
  {
    if ((v4 & 0x100) == 0 || ([v3 options] & 0x20) == 0) {
      goto LABEL_7;
    }
    uint64_t v10 = [(_UIContextMenuListView *)self displayedMenu];
    double v11 = [v10 selectedElements];
    double v6 = [v11 firstObject];

    double v12 = [(_UIContextMenuListView *)self indexPathForElement:v6];
    double v7 = [(_UIContextMenuListView *)self _viewAtIndexPath:v12];
  }
  if (v7)
  {
    v13[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

    goto LABEL_8;
  }
LABEL_7:
  double v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v11 = a4;
  [(_UIContextMenuListView *)self _updateCellPortalingWithUpdateFocusInContext:v11 inCollectionView:a3];
  double v7 = [v11 nextFocusedIndexPath];
  double v8 = [v11 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  int v9 = [v11 nextFocusedItem];
  BOOL v10 = +[UIFocusSystem environment:self containsEnvironment:v9];

  if (v10)
  {
    [(_UIContextMenuListView *)self _headerIndexPath];
    v7 = double v8 = v7;
LABEL_4:
  }
  if (v7 || [(_UIContextMenuListView *)self parentHierarchyStyle] == 1) {
    [(_UIContextMenuListView *)self highlightItemAtIndexPath:v7 forHover:0];
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  double v5 = [(_UIContextMenuListView *)self elementAtIndexPath:a4];
  if ([v5 _canBeHighlighted]) {
    BOOL v6 = [(_UIContextMenuListView *)self allowsFocus];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
  __int16 v4 = [(_UIContextMenuListView *)self _headerIndexPath];
  id v5 = [(_UIContextMenuListView *)self _viewAtIndexPath:v4];

  if (v5) {
    objc_msgSend(v5, "setAllowsFocus:", -[_UIContextMenuListView allowsFocus](self, "allowsFocus"));
  }
}

- (void)scrollToFirstSignificantAction
{
  uint64_t v3 = [(_UIContextMenuListView *)self highlightedIndexPath];
  if (!v3) {
    goto LABEL_14;
  }
  __int16 v4 = (void *)v3;
  id v5 = [(_UIContextMenuListView *)self highlightedIndexPath];
  BOOL v6 = [(_UIContextMenuListView *)self _headerIndexPath];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v17 = [(_UIContextMenuListView *)self collectionView];
    id v11 = [(_UIContextMenuListView *)self highlightedIndexPath];
    [v17 scrollToItemAtIndexPath:v11 atScrollPosition:2 animated:0];
  }
  else
  {
LABEL_14:
    if ([(_UIContextMenuListView *)self _shouldScrollToSelectedAction])
    {
      double v8 = [(_UIContextMenuListView *)self displayedMenu];
      int v9 = [v8 selectedElements];
      id v17 = [v9 firstObject];

      BOOL v10 = [(_UIContextMenuListView *)self collectionViewDataSource];
      id v11 = [v10 indexPathForItemIdentifier:v17];

      double v12 = [(_UIContextMenuListView *)self collectionView];
      [v12 scrollToItemAtIndexPath:v11 atScrollPosition:2 animated:0];
    }
    else
    {
      if (![(_UIContextMenuListView *)self reversesActionOrder]) {
        return;
      }
      id v13 = [(_UIContextMenuListView *)self collectionView];
      uint64_t v14 = [v13 numberOfSections] - 1;

      double v15 = [(_UIContextMenuListView *)self collectionView];
      uint64_t v16 = [v15 numberOfItemsInSection:v14] - 1;

      id v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:v14];
      id v11 = [(_UIContextMenuListView *)self collectionView];
      double v12 = [(_UIContextMenuListView *)self _platformMetrics];
      [v12 sectionInsets];
      objc_msgSend(v11, "_scrollToItemAtIndexPath:atScrollPosition:additionalInsets:animated:", v17, 4, 0);
    }
  }
}

- (BOOL)_shouldScrollToSelectedAction
{
  v2 = [(_UIContextMenuListView *)self displayedMenu];
  BOOL v3 = (([v2 options] & 0x20) != 0 || objc_msgSend(v2, "forceAutomaticSelection"))
    && ([v2 metadata] & 0x10100) == 256;

  return v3;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  v16.double x = x;
  v16.double y = y;
  if (CGRectContainsPoint(v18, v16))
  {
    BOOL v6 = [(_UIContextMenuListView *)self collectionView];
    char v7 = [v6 visibleSupplementaryViewsOfKind:@"kContextMenuSubmenuTitleHeader"];
    double v8 = [v7 firstObject];

    if (!v8) {
      goto LABEL_5;
    }
    objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v8 bounds];
    v17.double x = v10;
    v17.double y = v12;
    if (!CGRectContainsPoint(v19, v17)
      || ([(_UIContextMenuListView *)self _headerIndexPath],
          (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_5:
      objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
      id v13 = objc_msgSend(v6, "indexPathForItemAtPoint:");
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)elementAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuListView *)self _headerIndexPath];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    char v7 = [(_UIContextMenuListView *)self displayedMenu];
  }
  else
  {
    double v8 = [(_UIContextMenuListView *)self collectionViewDataSource];
    char v7 = [v8 itemIdentifierForIndexPath:v4];
  }
  return v7;
}

- (id)indexPathForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuListView *)self displayedMenu];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    char v7 = [(_UIContextMenuListView *)self _headerIndexPath];
  }
  else
  {
    double v8 = [(_UIContextMenuListView *)self collectionViewDataSource];
    char v7 = [v8 indexPathForItemIdentifier:v4];
  }
  return v7;
}

- (id)cellForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuListView *)self collectionViewDataSource];
  int v6 = [v5 indexPathForItemIdentifier:v4];

  if (v6)
  {
    char v7 = [(_UIContextMenuListView *)self collectionView];
    double v8 = [v7 cellForItemAtIndexPath:v6];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)unHighlightItemAtIndexPath:(id)a3
{
  id v8 = a3;
  [(_UIContextMenuListView *)self setHighlightedIndexPath:0];
  id v4 = [(UIView *)self traitCollection];
  id v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);
  int v6 = [v5 allowsItemHighlighting];

  if (v6)
  {
    char v7 = [(_UIContextMenuListView *)self _viewAtIndexPath:v8];
    [v7 setHighlighted:0];
  }
}

- (void)highlightItemAtIndexPath:(id)a3
{
}

- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4
{
}

- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4 playFeedback:(BOOL)a5
{
  BOOL v5 = a4;
  id v15 = a3;
  char v7 = [(_UIContextMenuListView *)self highlightedIndexPath];
  char v8 = [v7 isEqual:v15];

  if ((v8 & 1) == 0)
  {
    double v9 = [(_UIContextMenuListView *)self highlightedIndexPath];

    if (v9)
    {
      CGFloat v10 = [(_UIContextMenuListView *)self highlightedIndexPath];
      [(_UIContextMenuListView *)self unHighlightItemAtIndexPath:v10];
    }
    if (v15)
    {
      [(_UIContextMenuListView *)self setHighlightedIndexPath:v15];
      double v11 = [(UIView *)self traitCollection];
      CGFloat v12 = _UIContextMenuGetPlatformMetrics([v11 userInterfaceIdiom]);
      int v13 = [v12 allowsItemHighlighting];

      if (v13)
      {
        uint64_t v14 = [(_UIContextMenuListView *)self _viewAtIndexPath:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v14 setHighlighted:1 forHover:v5];
        }
        else {
          [v14 setHighlighted:1];
        }
        [v14 layoutIfNeeded];
      }
    }
    [(UIView *)self setNeedsFocusUpdate];
  }
}

- (id)_viewAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIContextMenuListView *)self _headerIndexPath];
  int v6 = [v4 isEqual:v5];

  char v7 = [(_UIContextMenuListView *)self collectionView];
  char v8 = v7;
  if (v6) {
    [v7 supplementaryViewForElementKind:@"kContextMenuSubmenuTitleHeader" atIndexPath:v4];
  }
  else {
  double v9 = [v7 cellForItemAtIndexPath:v4];
  }

  return v9;
}

- (id)_headerIndexPath
{
  if ([(_UIContextMenuListView *)self position] == 1)
  {
    v2 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_dataSourceForCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  BOOL v5 = [UICollectionViewDiffableDataSource alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke;
  v10[3] = &unk_1E5300130;
  objc_copyWeak(&v11, &location);
  int v6 = [(UICollectionViewDiffableDataSource *)v5 initWithCollectionView:v4 cellProvider:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke_2;
  v8[3] = &unk_1E5300158;
  objc_copyWeak(&v9, &location);
  [(UICollectionViewDiffableDataSource *)v6 setSupplementaryViewProvider:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_configureCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 forElement:(id)a6 section:(id)a7 size:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  CGRect v18 = [v13 actionView];
  v58 = self;
  if ([v17 layout] == 1)
  {
    CGRect v19 = [(_UIContextMenuListView *)self _platformMetrics];
    [v19 enableFloatingFocusStyle];
  }
  [v18 setLayoutClass:objc_opt_class()];
  objc_msgSend(v13, "_setFocusStyle:", objc_msgSend(v18, "focusStyle"));
  uint64_t v55 = [v17 isMultiColorPalette];
  uint64_t v56 = [v16 image];
  double v20 = [v16 subtitle];
  int v21 = [v16 _isLeaf];
  id v22 = v16;
  double v23 = v22;
  v53 = v14;
  id v54 = v13;
  id v52 = v17;
  if (v21)
  {
    if ([v20 length] || (_UIIsPrivateMainBundle() & 1) == 0 && (dyld_program_sdk_at_least() & 1) != 0)
    {
      v57 = v20;
    }
    else
    {
      uint64_t v29 = [v23 discoverabilityTitle];

      v57 = (void *)v29;
    }
    uint64_t v26 = [v23 attributes] & 1;
    char v24 = [v23 attributes];
    uint64_t v27 = [v23 state];
    if (v27 == 1)
    {
      double v30 = [v23 selectedImage];

      if (v30)
      {
        uint64_t v31 = [v23 selectedImage];

        uint64_t v55 = 2;
        uint64_t v56 = (void *)v31;
      }
    }

    uint64_t v28 = 0;
  }
  else
  {
    v57 = v20;
    char v24 = [v22 options];
    unsigned int v25 = [v23 _shouldShowSelectionState];

    uint64_t v26 = 0;
    uint64_t v27 = v25;
    uint64_t v28 = 16;
  }
  uint64_t v32 = [v23 title];
  id v33 = [v23 attributedTitle];

  if (v33)
  {
    double v34 = [v23 attributedTitle];
    [v18 setAttributedTitle:v34];
  }
  else
  {
    [v18 setTitle:v32];
  }
  [v18 setSubtitle:v57];
  double v35 = [v23 _accessoryAction];

  if (v35)
  {
    double v36 = [v23 _accessoryAction];
    [v18 setAccessoryAction:v36];
  }
  else
  {
    [v18 setImage:v56];
  }
  uint64_t v37 = v24 & 2;
  v38 = [v23 accessibilityIdentifier];
  [v18 setAccessibilityIdentifier:v38];

  v39 = [(_UIContextMenuListView *)v58 displayedMenu];
  int v40 = [v39 metadata];

  if ((v40 & 0x10000) != 0 && [(_UIContextMenuListView *)v58 parentHierarchyStyle] == 2) {
    v28 |= 0x20uLL;
  }
  uint64_t v41 = v37 | v26 | v28;
  [v18 setSelectedIconBehavior:v55];
  double v42 = [v18 layout];
  int v43 = [v42 useContentShapeForSelectionHighlight];

  if (v43)
  {
    BOOL v44 = (unint64_t)(v27 - 1) > 1;
    double v46 = v53;
    double v45 = v54;
    double v47 = (void *)v32;
    double v48 = v52;
    double v49 = v15;
    if (!v44) {
      [v53 selectItemAtIndexPath:v15 animated:0 scrollPosition:0];
    }
  }
  else
  {
    uint64_t v50 = v41 | 4;
    if (v27 != 1) {
      uint64_t v50 = v41;
    }
    if (v27 == 2) {
      v41 |= 8uLL;
    }
    else {
      uint64_t v41 = v50;
    }
    double v46 = v53;
    double v45 = v54;
    double v47 = (void *)v32;
    double v48 = v52;
    double v49 = v15;
  }
  if ([(_UIContextMenuListView *)v58 allowsBackgroundViewInteraction]) {
    uint64_t v51 = v41;
  }
  else {
    uint64_t v51 = v41 | 0x80;
  }
  [v18 setOptions:v51];
  objc_msgSend(v18, "setNumberOfTitleLines:", objc_msgSend(v48, "actionLineLimit"));
  if ([v23 _isLeaf])
  {
    uint64_t v61 = 0;
    CGRect v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__153;
    v65 = __Block_byref_object_dispose__153;
    id v66 = 0;
    v59[4] = &v61;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke;
    v60[3] = &unk_1E52FF670;
    v60[4] = &v61;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke_2;
    v59[3] = &unk_1E52FF698;
    [v23 _acceptMenuVisit:0 commandVisit:v60 actionVisit:v59 deferredElementVisit:0];
    if (v62[5]) {
      objc_msgSend(v18, "setPasteVariant:");
    }
    _Block_object_dispose(&v61, 8);
  }
}

- (NSString)backgroundMaterialGroupName
{
  backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  if (!backgroundMaterialGroupName)
  {
    id v4 = NSString;
    BOOL v5 = [MEMORY[0x1E4F29128] UUID];
    int v6 = [v5 UUIDString];
    char v7 = [v4 stringWithFormat:@"context-menu-background-%@", v6];
    char v8 = self->_backgroundMaterialGroupName;
    self->_backgroundMaterialGroupName = v7;

    backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  }
  return backgroundMaterialGroupName;
}

- (double)_clampedCornerRadius
{
  BOOL v3 = [(_UIContextMenuListView *)self _platformMetrics];
  [v3 menuCornerRadius];
  double v5 = v4;

  [(UIView *)self bounds];
  return _UIClampedCornerRadius(15, v5, v6, v7, v8, v9);
}

- (id)_platformMetrics
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = _UIContextMenuGetPlatformMetrics([v2 userInterfaceIdiom]);

  return v3;
}

- (void)_updateContentMargins
{
  BOOL v3 = [(_UIContextMenuListView *)self displayedMenu];
  unint64_t v4 = [v3 metadata];

  uint64_t v5 = (v4 >> 8) & 1;
  if ((v4 & 0x10000) != 0 || [(_UIContextMenuListView *)self position] == 1)
  {
    unint64_t v6 = [(_UIContextMenuListView *)self parentHierarchyStyle];
    BOOL v7 = v6 != 1;
    if (v6 == 1) {
      LODWORD(v5) = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  CGFloat v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  CGFloat v10 = _UIContextMenuGetPlatformMetrics(v9);
  [v10 menuItemInternalPadding];
  double v48 = v12;
  double v49 = v11;
  double v14 = v13;
  double v16 = v15;

  id v17 = _UIContextMenuGetPlatformMetrics(v9);
  [v17 headerPadding];
  double v46 = v19;
  double v47 = v18;
  double v21 = v20;
  double v23 = v22;

  char v24 = _UIContextMenuGetPlatformMetrics(v9);
  [v24 menuTitlePadding];
  double v45 = v25;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  if (v5)
  {
    uint64_t v32 = [(UIView *)self traitCollection];
    id v33 = _UIContextMenuGetPlatformMetrics([v32 userInterfaceIdiom]);
    double v34 = [v33 titleFont];
    double v35 = [v34 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v32];

    double v36 = _UIContextMenuGetPlatformMetrics(v9);
    [v36 leadingIndentationWidth];
    double v38 = v37;

    [v35 _scaledValueForValue:v38];
    UIRoundToViewScale(self);
    double v14 = v14 + v39;
  }
  if (v7)
  {
    int v40 = _UIContextMenuGetPlatformMetrics(v9);
    [v40 menuGutterWidth];
    double v42 = v41;

    double v16 = v16 + v42;
  }
  int v43 = [(_UIContextMenuListView *)self _platformMetrics];
  int v44 = [v43 alignMenuHeaderAndItemContents];

  if (v44)
  {
    double v31 = v16;
    double v27 = v14;
    double v23 = v16;
    double v21 = v14;
  }
  -[_UIContextMenuListView setContentMargins:](self, "setContentMargins:", v49, v14, v48, v16);
  -[_UIContextMenuListView setHeaderMargins:](self, "setHeaderMargins:", v47, v21, v46, v23);
  -[_UIContextMenuListView setMenuTitleMargins:](self, "setMenuTitleMargins:", v45, v27, v29, v31);
}

- (void)_updatePlatterHairline
{
  BOOL v3 = [(_UIContextMenuListView *)self _platformMetrics];
  id v15 = [v3 gradientMaskingConfiguration];

  unint64_t v4 = v15;
  if (v15)
  {
    uint64_t v5 = [v15 platterHairlineColorProvider];
    unint64_t v6 = [(UIView *)self traitCollection];
    BOOL v7 = ((void (**)(void, void *))v5)[2](v5, v6);

    if (v7) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    id v9 = v7;
    uint64_t v10 = [v9 CGColor];
    double v11 = [(_UIContextMenuListView *)self borderView];
    double v12 = [v11 layer];
    [v12 setBorderColor:v10];

    double v13 = [(_UIContextMenuListView *)self borderView];
    double v14 = [v13 layer];
    [v14 setBorderWidth:v8];

    unint64_t v4 = v15;
  }
}

- (void)_setupCellPortalingIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIContextMenuListView *)self _platformMetrics];
  unint64_t v4 = [v3 gradientMaskingConfiguration];
  self->_portalingFocusedView = v4 != 0;

  if ([(_UIContextMenuListView *)self portalingFocusedView])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    portals = self->_portals;
    self->_portals = v5;

    BOOL v7 = objc_alloc_init(UIView);
    portalContainerView = self->_portalContainerView;
    self->_portalContainerView = v7;

    [(UIView *)self addSubview:self->_portalContainerView];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [(_UIContextMenuListView *)self outgoingCollectionView];
    uint64_t v10 = [v9 visibleCells];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [(_UIContextMenuListView *)self _updateCellPortalingWithCell:*(void *)(*((void *)&v16 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    id v15 = [(_UIContextMenuListView *)self clippingView];
    [v15 setClipsToBounds:1];
  }
}

- (void)_tearDownCellPortalingIfNeeded
{
  if ([(_UIContextMenuListView *)self portalingFocusedView])
  {
    [(_UIContextMenuListView *)self setPortalingFocusedView:0];
    BOOL v3 = [(_UIContextMenuListView *)self clippingView];
    [v3 setClipsToBounds:0];

    [(_UIContextMenuListView *)self _removeAllPortals];
  }
}

- (void)_updateCellPortalingWithCell:(id)a3
{
  id v4 = a3;
  if ([(_UIContextMenuListView *)self portalingFocusedView]
    && [v4 isFocused])
  {
    [(_UIContextMenuListView *)self _portalCellIfNeeded:v4];
  }
}

- (void)_updateCellPortalingWithUpdateFocusInContext:(id)a3 inCollectionView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(_UIContextMenuListView *)self portalingFocusedView])
  {
    BOOL v7 = [v9 nextFocusedIndexPath];
    if (v7)
    {
      double v8 = [v6 cellForItemAtIndexPath:v7];
      [(_UIContextMenuListView *)self _portalCellIfNeeded:v8];
    }
  }
}

- (void)_portalCellIfNeeded:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(_UIContextMenuListView *)self portals];
  uint64_t v6 = [(_UIPortalView *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) sourceView];
      char v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(_UIPortalView *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v5 = [[_UIPortalView alloc] initWithSourceView:v4];
    [(_UIPortalView *)v5 setHidesSourceView:1];
    [(_UIPortalView *)v5 setMatchesPosition:1];
    [(_UIPortalView *)v5 setMatchesTransform:1];
    [(_UIPortalView *)v5 setMatchesAlpha:1];
    [(_UIPortalView *)v5 setAllowsHitTesting:0];
    uint64_t v12 = [v4 layer];
    uint64_t v13 = [v12 flipsHorizontalAxis];
    uint64_t v14 = [(_UIPortalView *)v5 portalLayer];
    [v14 setFlipsHorizontalAxis:v13];

    id v15 = [(_UIContextMenuListView *)self portals];
    [v15 addObject:v5];

    long long v16 = [(_UIContextMenuListView *)self portalContainerView];
    [v16 addSubview:v5];
  }
}

- (void)_removeAllPortals
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(_UIContextMenuListView *)self portals];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(_UIContextMenuListView *)self portals];
  [v8 removeAllObjects];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (unint64_t)parentHierarchyStyle
{
  return self->_parentHierarchyStyle;
}

- (void)setParentHierarchyStyle:(unint64_t)a3
{
  self->_parentHierarchyStyle = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (BOOL)reversesActionOrder
{
  return self->_reversesActionOrder;
}

- (BOOL)emphasized
{
  return self->_emphasized;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (BOOL)allowsBackgroundViewInteraction
{
  return self->_allowsBackgroundViewInteraction;
}

- (void)setAllowsBackgroundViewInteraction:(BOOL)a3
{
  self->_allowsBackgroundViewInteraction = a3;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
}

- (unint64_t)roundedEdges
{
  return self->_roundedEdges;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)collectionViewAlpha
{
  return self->_collectionViewAlpha;
}

- (CGSize)nativeContentSize
{
  double width = self->_nativeContentSize.width;
  double height = self->_nativeContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNativeContentSize:(CGSize)a3
{
  self->_nativeContentSize = a3;
}

- (CGSize)visibleContentSize
{
  double width = self->_visibleContentSize.width;
  double height = self->_visibleContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_UICutoutShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (UICollectionView)outgoingCollectionView
{
  return self->_outgoingCollectionView;
}

- (void)setOutgoingCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)outgoingCollectionViewDataSource
{
  return self->_outgoingCollectionViewDataSource;
}

- (void)setOutgoingCollectionViewDataSource:(id)a3
{
}

- (double)emphasisAlphaMultiplier
{
  return self->_emphasisAlphaMultiplier;
}

- (void)setEmphasisAlphaMultiplier:(double)a3
{
  self->_emphasisAlphaMultiplier = a3;
}

- (BOOL)hasValidContentSize
{
  return self->_hasValidContentSize;
}

- (void)setHasValidContentSize:(BOOL)a3
{
  self->_hasValidContentSize = a3;
}

- (UIBezierPath)hoverZone
{
  return self->_hoverZone;
}

- (void)setHoverZone:(id)a3
{
}

- (NSDirectionalEdgeInsets)contentMargins
{
  double top = self->_contentMargins.top;
  double leading = self->_contentMargins.leading;
  double bottom = self->_contentMargins.bottom;
  double trailing = self->_contentMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setContentMargins:(NSDirectionalEdgeInsets)a3
{
  self->_contentMargins = a3;
}

- (NSDirectionalEdgeInsets)headerMargins
{
  double top = self->_headerMargins.top;
  double leading = self->_headerMargins.leading;
  double bottom = self->_headerMargins.bottom;
  double trailing = self->_headerMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setHeaderMargins:(NSDirectionalEdgeInsets)a3
{
  self->_headerMargins = a3;
}

- (NSDirectionalEdgeInsets)menuTitleMargins
{
  double top = self->_menuTitleMargins.top;
  double leading = self->_menuTitleMargins.leading;
  double bottom = self->_menuTitleMargins.bottom;
  double trailing = self->_menuTitleMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setMenuTitleMargins:(NSDirectionalEdgeInsets)a3
{
  self->_menuTitleMargins = a3;
}

- (BOOL)portalingFocusedView
{
  return self->_portalingFocusedView;
}

- (void)setPortalingFocusedView:(BOOL)a3
{
  self->_portalingFocusedView = a3;
}

- (NSMutableArray)portals
{
  return self->_portals;
}

- (void)setPortals:(id)a3
{
}

- (UIView)portalContainerView
{
  return self->_portalContainerView;
}

- (void)setPortalContainerView:(id)a3
{
}

- (UIView)cvBackgroundView
{
  return self->_cvBackgroundView;
}

- (void)setCvBackgroundView:(id)a3
{
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_cvBackgroundView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_portals, 0);
  objc_storeStrong((id *)&self->_hoverZone, 0);
  objc_storeStrong((id *)&self->_outgoingCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_outgoingCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialGroupName, 0);
}

@end