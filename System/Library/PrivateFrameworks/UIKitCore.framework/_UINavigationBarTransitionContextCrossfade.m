@interface _UINavigationBarTransitionContextCrossfade
- (int64_t)transition;
- (void)_animateContentView;
- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6;
- (void)_animateLargeTitleView;
- (void)_animateSearchBar;
- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4;
- (void)_prepareContentView;
- (void)_prepareLargeTitleView;
- (void)_prepareSearchBar;
- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5;
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UINavigationBarTransitionContextCrossfade

- (int64_t)transition
{
  return 3;
}

- (void)_prepareContentView
{
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  v4 = toLayout;

  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  v6 = fromLayout;

  toContentLayout = self->super._toContentLayout;
  v8 = self->super._toLayout;
  if (v8) {
    v8 = (_UINavigationBarLayout *)v8->_contentView;
  }
  v9 = v8;
  [(_UINavigationBarContentViewLayout *)toContentLayout setActive:1 contentView:v9];

  [(UIView *)self->super._contentView layoutIfNeeded];
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout setContentHidden:1];
  if (v6)
  {
    [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout setBackButtonHidden:0 titleLabelHidden:(*(_WORD *)&self->super._flags >> 5) & 1 titleViewHidden:0 barsHidden:0];
    v10 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v10 _navigationBarTransitionWillBegin:2 willBeDisplayed:0];
  }
  if (v4)
  {
    id v11 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v11 _navigationBarTransitionWillBegin:2 willBeDisplayed:1];
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
  v16 = v5;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  v8 = toLayout;
  v9 = v16;
  if (v16 == v8)
  {
    v8 = v16;
    goto LABEL_23;
  }
  if (*p_fromLayout && (*p_fromLayout)->_hasInlineSearchBar)
  {

    v9 = 0;
  }
  v16 = v9;
  if (*p_toLayout && (*p_toLayout)->_hasInlineSearchBar)
  {

    v9 = v16;
    v8 = 0;
  }
  if (!v9)
  {
    [(UIView *)self->super._navigationBar bounds];
    double MaxY = CGRectGetMaxY(v18);
    v19.origin.double x = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
    double x = v19.origin.x;
    double width = v19.size.width;
    double height = v19.size.height;
    CGFloat v14 = v19.origin.y + MaxY - CGRectGetMaxY(v19);
    [(_UINavigationBarLayout *)v8 setAlpha:0.0];
    -[_UINavigationBarLayout setFrame:](v8, "setFrame:", x, v14, width, height);
    v9 = v16;
  }
  double v15 = 0.0;
  if (!*p_toLayout || !(*p_toLayout)->_clientWantsToPreserveSearchBarAcrossTransitions)
  {
    p_fromLayout = &self->super._toLayout;
    goto LABEL_22;
  }
  [(_UINavigationBarLayout *)v9 setAlpha:0.0];
  if (*p_toLayout)
  {
    if (*p_fromLayout)
    {
      double v15 = 1.0;
      if ((*p_toLayout)->_hasInlineSearchBar != (*p_fromLayout)->_hasInlineSearchBar) {
        goto LABEL_23;
      }
    }
    else
    {
      if ((*p_toLayout)->_hasInlineSearchBar) {
        goto LABEL_23;
      }
      double v15 = 1.0;
    }
LABEL_22:
    [(_UINavigationBarLayout *)v8 setAlpha:v15];
    -[_UINavigationBarLayout setFrame:](v8, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](*p_fromLayout));
    [(_UINavigationBarLayout *)v8 layoutIfNeeded];
    goto LABEL_23;
  }
  double v15 = 1.0;
  if (!*p_fromLayout || !(*p_fromLayout)->_hasInlineSearchBar) {
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
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  [(_UINavigationBarTransitionContext *)&v5 prepare];
  [(UIView *)self->super._navigationBar bounds];
  [(_UINavigationBarLayout *)(uint64_t)self->super._toLayout setLayoutSize:v4];
  [(_UINavigationBarTransitionContextCrossfade *)self _prepareContentView];
  [(_UINavigationBarTransitionContextCrossfade *)self _prepareLargeTitleView];
  [(_UINavigationBarTransitionContextCrossfade *)self _prepareSearchBar];
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateContentView
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
  id v6 = fromLayout;

  if ((unint64_t)v6 | (unint64_t)v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke;
    v9[3] = &unk_1E52D9FC0;
    BOOL v10 = v6 != 0;
    v9[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke_2;
    v7[3] = &unk_1E52D9FC0;
    BOOL v8 = v4 != 0;
    v7[4] = self;
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlapIfNecessaryPartOne:v9 partTwo:v7];
  }
}

- (void)_animateLargeTitleView
{
  if ((*(_WORD *)&self->super._flags & 0x60) != 0)
  {
    v2[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke_2;
    v2[3] = &unk_1E52D9F70;
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlapIfNecessaryPartOne:v3 partTwo:v2];
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
    id v6 = toLayout;

    if (!v6) {
      return;
    }
  }
  v7 = self->super._toLayout;
  if (v7) {
    v7 = (_UINavigationBarLayout *)v7->_searchBar;
  }
  BOOL v8 = v7;

  if (!v8)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke;
    v30[3] = &unk_1E52D9F70;
    v30[4] = self;
    id v11 = v30;
    v12 = self;
    v13 = 0;
LABEL_18:
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](v12, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v11, v13, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
    return;
  }
  id v9 = self->super._fromLayout;
  if (v9)
  {
    BOOL v10 = v9->_searchBar;
    if (v10)
    {

LABEL_17:
      v23 = self;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_3;
      v27 = &unk_1E52D9F70;
      v28 = self;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_4;
      v22 = &unk_1E52D9F70;
      id v11 = &v24;
      v13 = &v19;
      v12 = self;
      goto LABEL_18;
    }
  }
  CGFloat v14 = self->super._toLayout;
  if (v14) {
    CGFloat v14 = (_UINavigationBarLayout *)v14->_contentView;
  }
  double v15 = v14;

  if (v15) {
    goto LABEL_17;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_2;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  v16 = (void (**)(void))_Block_copy(aBlock);
  v17 = [(UIView *)self->super._contentView traitCollection];
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
      aBlock[2] = __108___UINavigationBarTransitionContextCrossfade__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v19 = v16;
      v17 = _Block_copy(aBlock);
    }
    else
    {
      v17 = 0;
    }
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithoutOverlap:0 partTwo:v17];
  }
}

- (void)animate
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  [(_UINavigationBarTransitionContext *)&v3 animate];
  [(_UINavigationBarTransitionContextCrossfade *)self _animateContentView];
  [(_UINavigationBarTransitionContextCrossfade *)self _animateLargeTitleView];
  [(_UINavigationBarTransitionContextCrossfade *)self _animateSearchBar];
  -[_UINavigationBarTransitionContext _animatePalettes](self);
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
  BOOL v10 = searchBar;
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
  v21 = v20;
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
  [v31 _navigationBarTransitionCompleted:2 willBeDisplayed:1];

  v32 = [v8 augmentedTitleView];
  [v32 _navigationBarTransitionCompleted:2 willBeDisplayed:0];

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

- (void)cancel
{
  [(_UINavigationBarTransitionContextCrossfade *)self _finishWithFinalLayout:self->super._fromContentLayout invalidLayout:self->super._toContentLayout];
  [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout removeContent];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  [(_UINavigationBarTransitionContext *)&v3 cancel];
}

- (void)complete
{
  [(_UINavigationBarTransitionContextCrossfade *)self _finishWithFinalLayout:self->super._toContentLayout invalidLayout:self->super._fromContentLayout];
  [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout removeContent];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  [(_UINavigationBarTransitionContext *)&v3 complete];
}

@end