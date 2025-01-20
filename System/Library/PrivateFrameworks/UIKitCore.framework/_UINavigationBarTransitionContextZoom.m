@interface _UINavigationBarTransitionContextZoom
- (BOOL)shouldPerformTwoPartCrossfadeTransition;
- (id)prepareForInterruption;
- (int64_t)transition;
- (void)_addTemporaryView:(id)a3;
- (void)_animateBackgroundView;
- (void)_animateContentView;
- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6;
- (void)_animateLargeTitleView;
- (void)_animateSearchBar;
- (void)_cleanupZoomContent;
- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4;
- (void)_insertTemporaryBackgroundForLayout:(id)a3;
- (void)_prepareContentView;
- (void)_prepareLargeTitleView;
- (void)_prepareSearchBar;
- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5;
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UINavigationBarTransitionContextZoom

- (int64_t)transition
{
  return 4;
}

- (void)_addTemporaryView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    temporaryViews = self->_temporaryViews;
    id v8 = v4;
    if (!temporaryViews)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_temporaryViews;
      self->_temporaryViews = v6;

      temporaryViews = self->_temporaryViews;
    }
    [(NSMutableArray *)temporaryViews addObject:v8];
    id v4 = v8;
  }
}

- (void)_insertTemporaryBackgroundForLayout:(id)a3
{
  id v4 = (double *)a3;
  if ((*(_WORD *)&self->super._flags & 0x800) != 0)
  {
    v19 = v4;
    v5 = objc_opt_new();
    double v6 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)v19);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(UIView *)self->super._navigationBar frame];
    CGFloat v14 = v13;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    CGRect v22 = CGRectOffset(v21, 0.0, v14);
    objc_msgSend(v5, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    objc_msgSend(v5, "setTopAligned:", -[_UIBarBackground topAligned](self->super._backgroundView, "topAligned"));
    if (v19)
    {
      uint64_t v15 = 23;
      if ((*(_WORD *)&self->super._flags & 4) == 0) {
        uint64_t v15 = 24;
      }
      double v16 = v19[v15];
    }
    else
    {
      double v16 = 0.0;
    }
    id v17 = *(id *)&v16;
    if (v19)
    {
      [v17 setBackgroundTransitionProgress:v19[36]];
      double v18 = v19[37];
    }
    else
    {
      [v17 setBackgroundTransitionProgress:0.0];
      double v18 = 0.0;
    }
    [v17 setBackgroundAlpha:v18];
    [v5 setLayout:v17];
    [v5 transitionBackgroundViewsAnimated:0];
    [(UIView *)self->super._transitionOverlayView insertSubview:v5 atIndex:0];
    [(_UINavigationBarTransitionContextZoom *)self _addTemporaryView:v5];

    id v4 = v19;
  }
}

- (void)_prepareContentView
{
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  id v4 = toLayout;

  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  double v6 = fromLayout;

  toContentLayout = self->super._toContentLayout;
  CGFloat v8 = self->super._toLayout;
  if (v8) {
    CGFloat v8 = (_UINavigationBarLayout *)v8->_contentView;
  }
  double v9 = v8;
  [(_UINavigationBarContentViewLayout *)toContentLayout setActive:1 contentView:v9];

  [(UIView *)self->super._contentView layoutIfNeeded];
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout setContentHidden:1];
  if (v6)
  {
    [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout setBackButtonHidden:0 titleLabelHidden:(*(_WORD *)&self->super._flags >> 5) & 1 titleViewHidden:0 barsHidden:0];
    CGFloat v10 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v10 _navigationBarTransitionWillBegin:3 willBeDisplayed:0];
  }
  if (v4)
  {
    id v11 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v11 _navigationBarTransitionWillBegin:3 willBeDisplayed:1];
  }
}

- (void)_prepareLargeTitleView
{
  __int16 flags = (__int16)self->super._flags;
  fromLargeTitleLayout = self->super._fromLargeTitleLayout;
  if ((flags & 0x20) != 0)
  {
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](fromLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(_UINavigationBarLargeTitleViewLayout *)fromLargeTitleLayout setContentHidden:v5];
  if ((*(_WORD *)&self->super._flags & 0x40) != 0) {
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
  }
  toLargeTitleLayout = self->super._toLargeTitleLayout;
  [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout setContentHidden:1];
}

- (void)_prepareSearchBar
{
  p_fromLayout = &self->super._fromLayout;
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  uint64_t v5 = fromLayout;
  p_toLayout = &self->super._toLayout;
  toLayout = self->super._toLayout;
  v19 = v5;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  CGFloat v8 = toLayout;
  double v9 = v19;
  if (v19 == v8)
  {
    CGFloat v8 = v19;
    goto LABEL_23;
  }
  if (*p_fromLayout && (*p_fromLayout)->_hasInlineSearchBar)
  {

    double v9 = 0;
  }
  v19 = v9;
  if (*p_toLayout && (*p_toLayout)->_hasInlineSearchBar)
  {

    double v9 = v19;
    CGFloat v8 = 0;
  }
  if (!v9)
  {
    [(UIView *)self->super._navigationBar bounds];
    double MaxY = CGRectGetMaxY(v21);
    v22.origin.double x = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
    double x = v22.origin.x;
    double width = v22.size.width;
    double height = v22.size.height;
    CGFloat v14 = v22.origin.y + MaxY - CGRectGetMaxY(v22);
    [(_UINavigationBarLayout *)v8 setAlpha:0.0];
    -[_UINavigationBarLayout setFrame:](v8, "setFrame:", x, v14, width, height);
    double v9 = v19;
  }
  if (!*p_toLayout || !(*p_toLayout)->_clientWantsToPreserveSearchBarAcrossTransitions)
  {
    id v17 = [(UIView *)self->super._contentView traitCollection];
    uint64_t v18 = [v17 userInterfaceIdiom];

    double v16 = 0.0;
    if (v18 != 6) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  [(_UINavigationBarLayout *)v9 setAlpha:0.0];
  if (!*p_toLayout)
  {
    double v16 = 1.0;
    if (*p_fromLayout)
    {
      p_toLayout = p_fromLayout;
      if ((*p_fromLayout)->_hasInlineSearchBar) {
        goto LABEL_23;
      }
LABEL_22:
      [(_UINavigationBarLayout *)v8 setAlpha:v16];
      -[_UINavigationBarLayout setFrame:](v8, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](*p_toLayout));
      [(_UINavigationBarLayout *)v8 layoutIfNeeded];
      goto LABEL_23;
    }
LABEL_31:
    p_toLayout = p_fromLayout;
    goto LABEL_22;
  }
  BOOL hasInlineSearchBar = (*p_toLayout)->_hasInlineSearchBar;
  if (!*p_fromLayout)
  {
    if ((*p_toLayout)->_hasInlineSearchBar) {
      goto LABEL_23;
    }
    double v16 = 1.0;
    goto LABEL_31;
  }
  double v16 = 1.0;
  p_toLayout = p_fromLayout;
  if (hasInlineSearchBar == (*p_fromLayout)->_hasInlineSearchBar) {
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  if (a4 && a4 != a3)
  {
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    id v9 = a4;
    objc_msgSend(v9, "setFrame:", x, y, width, 0.0);
    [v9 layoutIfNeeded];
    [v9 setTransitioning:1];
  }
}

- (void)prepare
{
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTransitionContextZoom;
  [(_UINavigationBarTransitionContext *)&v11 prepare];
  fromLayout = self->super._fromLayout;
  if (*(_WORD *)&self->super._flags)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48___UINavigationBarTransitionContextZoom_prepare__block_invoke;
    v10[3] = &unk_1E52DE710;
    v10[4] = self;
    double v6 = v10;
    id v4 = fromLayout;
  }
  else
  {
    [(_UINavigationBarTransitionContextZoom *)self _insertTemporaryBackgroundForLayout:fromLayout];
    [(UIView *)self->super._navigationBar frame];
    id v4 = self->super._fromLayout;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48___UINavigationBarTransitionContextZoom_prepare__block_invoke_2;
    v9[3] = &unk_1E52DE738;
    v9[5] = v5;
    v9[4] = self;
    double v6 = v9;
  }
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)v4, v6);
  [(UIView *)self->super._navigationBar bounds];
  [(_UINavigationBarLayout *)(uint64_t)self->super._toLayout setLayoutSize:v8];
  [(_UINavigationBarTransitionContextZoom *)self _prepareContentView];
  [(_UINavigationBarTransitionContextZoom *)self _prepareLargeTitleView];
  [(_UINavigationBarTransitionContextZoom *)self _prepareSearchBar];
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateContentView
{
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  id v4 = fromLayout;

  if (v4)
  {
    [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout setContentHidden:1];
    uint64_t v5 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v5 _performNavigationBarTransition:3 willBeDisplayed:0];
  }
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  double v7 = toLayout;

  if (v7)
  {
    [(_UINavigationBarContentViewLayout *)self->super._toContentLayout setBackButtonHidden:0 titleLabelHidden:(*(_WORD *)&self->super._flags >> 6) & 1 titleViewHidden:0 barsHidden:0];
    id v8 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v8 _performNavigationBarTransition:3 willBeDisplayed:1];
  }
}

- (void)_animateLargeTitleView
{
  __int16 flags = (__int16)self->super._flags;
  if ((flags & 0x20) != 0)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout setContentHidden:1];
    __int16 flags = (__int16)self->super._flags;
  }
  if ((flags & 0x40) != 0)
  {
    toLargeTitleLayout = self->super._toLargeTitleLayout;
    [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout setContentHidden:0];
  }
}

- (void)_animateSearchBar
{
  fromLayout = self->super._fromLayout;
  if (fromLayout && (id v4 = fromLayout->_searchBar) != 0)
  {
  }
  else
  {
    toLayout = self->super._toLayout;
    if (toLayout) {
      toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
    }
    double v6 = toLayout;

    if (!v6) {
      return;
    }
  }
  double v7 = self->super._toLayout;
  if (v7) {
    double v7 = (_UINavigationBarLayout *)v7->_searchBar;
  }
  id v8 = v7;

  if (!v8)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke;
    v30[3] = &unk_1E52D9F70;
    v30[4] = self;
    objc_super v11 = v30;
    CGFloat v12 = self;
    double v13 = 0;
LABEL_18:
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](v12, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v11, v13, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
    return;
  }
  id v9 = self->super._fromLayout;
  if (v9)
  {
    CGFloat v10 = v9->_searchBar;
    if (v10)
    {

LABEL_17:
      v23 = self;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_3;
      v27 = &unk_1E52D9F70;
      v28 = self;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      CGRect v21 = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_4;
      CGRect v22 = &unk_1E52D9F70;
      objc_super v11 = &v24;
      double v13 = &v19;
      CGFloat v12 = self;
      goto LABEL_18;
    }
  }
  CGFloat v14 = self->super._toLayout;
  if (v14) {
    CGFloat v14 = (_UINavigationBarLayout *)v14->_contentView;
  }
  uint64_t v15 = v14;

  if (v15) {
    goto LABEL_17;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_2;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  double v16 = (void (**)(void))_Block_copy(aBlock);
  id v17 = [(UIView *)self->super._contentView traitCollection];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if (v18 == 6) {
    v16[2](v16);
  }
  else {
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlapIfNecessaryPartOne:0 partTwo:v16];
  }
}

- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a4.size.width;
  double v12 = a4.origin.y;
  double v13 = a4.origin.x;
  id v15 = a3;
  id v16 = a5;
  if (v15 != v16)
  {
    if (v15)
    {
      [v15 setTransitioning:1];
      objc_msgSend(v15, "setFrame:", v13, v12, v11, 0.0);
    }
    if (v16)
    {
      objc_msgSend(v16, "setFrame:", x, y, width, height);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __103___UINavigationBarTransitionContextZoom__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v19 = v16;
      id v17 = _Block_copy(aBlock);
    }
    else
    {
      id v17 = 0;
    }
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithoutOverlap:0 partTwo:v17];
  }
}

- (BOOL)shouldPerformTwoPartCrossfadeTransition
{
  return 0;
}

- (void)_animateBackgroundView
{
  if ((*(_WORD *)&self->super._flags & 1) == 0)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __63___UINavigationBarTransitionContextZoom__animateBackgroundView__block_invoke;
    v2[3] = &unk_1E52D9F70;
    v2[4] = self;
    +[UIView performWithoutAnimation:v2];
  }
}

- (void)animate
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTransitionContextZoom;
  [(_UINavigationBarTransitionContext *)&v4 animate];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48___UINavigationBarTransitionContextZoom_animate__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
}

- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4
{
  id v6 = a3;
  toLayout = self->super._toLayout;
  id v8 = a4;
  if (toLayout) {
    searchBar = toLayout->_searchBar;
  }
  else {
    searchBar = 0;
  }
  CGFloat v10 = searchBar;
  [(UIView *)v10 setAlpha:1.0];

  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  double v12 = fromLayout;
  [(_UINavigationBarLayout *)v12 setAlpha:1.0];

  double v13 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = self->super._toLayout;
  if (v20) {
    uint64_t v20 = (_UINavigationBarLayout *)v20->_searchBar;
  }
  CGRect v21 = v20;
  -[_UINavigationBarLayout setFrame:](v21, "setFrame:", v13, v15, v17, v19);

  double v22 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._fromLayout->super.isa);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = self->super._fromLayout;
  if (v29) {
    v29 = (_UINavigationBarLayout *)v29->_searchBar;
  }
  v30 = v29;
  -[_UINavigationBarLayout setFrame:](v30, "setFrame:", v22, v24, v26, v28);

  v31 = [v6 augmentedTitleView];
  [v31 _navigationBarTransitionCompleted:3 willBeDisplayed:1];

  v32 = [v8 augmentedTitleView];
  [v32 _navigationBarTransitionCompleted:3 willBeDisplayed:0];

  v33 = [v6 titleControl];
  v34 = [v33 titleLabel];
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v49[0] = *MEMORY[0x1E4F1DAB8];
  long long v44 = v49[0];
  v49[1] = v45;
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v43 = v50;
  [v34 setTransform:v49];

  v35 = [v6 backButton];
  v36 = [v35 visualProvider];
  v37 = [v36 contentView];
  v48[0] = v44;
  v48[1] = v45;
  v48[2] = v43;
  [v37 setTransform:v48];

  v38 = [v8 titleControl];
  v39 = [v38 titleLabel];
  v47[0] = v44;
  v47[1] = v45;
  v47[2] = v43;
  [v39 setTransform:v47];

  v40 = [v8 backButton];
  v41 = [v40 visualProvider];
  v42 = [v41 contentView];
  v46[0] = v44;
  v46[1] = v45;
  v46[2] = v43;
  [v42 setTransform:v46];

  [v8 setContentHidden:0];
  [v8 removeContent];

  [v6 setContentHidden:0];
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    [v6 setBackButtonHidden:0 titleLabelHidden:1 titleViewHidden:0 barsHidden:0];
    [(_UINavigationBarContentView *)self->super._contentView setInlineTitleViewAlpha:0.0];
  }
  [v6 cleanupAfterLayoutTransitionCompleted];
}

- (id)prepareForInterruption
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarTransitionContextZoom;
  v3 = [(_UINavigationBarTransitionContext *)&v9 prepareForInterruption];
  self->_isDeferringCleanup = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___UINavigationBarTransitionContextZoom_prepareForInterruption__block_invoke;
  v7[3] = &unk_1E52DB330;
  v7[4] = self;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(v7);

  return v5;
}

- (void)_cleanupZoomContent
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)self->super._fromLayout, &__block_literal_global_282);
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)self->super._toLayout, &__block_literal_global_284);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_temporaryViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeFromSuperview", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_temporaryViews removeAllObjects];
}

- (void)cancel
{
  [(_UINavigationBarTransitionContextZoom *)self _finishWithFinalLayout:self->super._fromContentLayout invalidLayout:self->super._toContentLayout];
  [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout removeContent];
  if (!self->_isDeferringCleanup) {
    [(_UINavigationBarTransitionContextZoom *)self _cleanupZoomContent];
  }
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextZoom;
  [(_UINavigationBarTransitionContext *)&v3 cancel];
}

- (void)complete
{
  [(_UINavigationBarTransitionContextZoom *)self _finishWithFinalLayout:self->super._toContentLayout invalidLayout:self->super._fromContentLayout];
  [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout removeContent];
  if (!self->_isDeferringCleanup) {
    [(_UINavigationBarTransitionContextZoom *)self _cleanupZoomContent];
  }
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextZoom;
  [(_UINavigationBarTransitionContext *)&v3 complete];
}

- (void).cxx_destruct
{
}

@end