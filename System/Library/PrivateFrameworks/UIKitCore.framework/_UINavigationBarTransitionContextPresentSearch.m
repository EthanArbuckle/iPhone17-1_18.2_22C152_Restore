@interface _UINavigationBarTransitionContextPresentSearch
- (int64_t)transition;
- (void)_animateBackgroundView;
- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6;
- (void)_prepareBackgroundView;
- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5;
- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3;
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UINavigationBarTransitionContextPresentSearch

- (int64_t)transition
{
  return 5;
}

- (void)_prepareBackgroundView
{
  if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground]) {
    return;
  }
  if ((*(_WORD *)&self->super._flags & 0x200) != 0 && (fromLayout = self->super._fromLayout) != 0)
  {
    BOOL v3 = fromLayout->_chromelessTransitionProgress != 1.0;
    if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
LABEL_7:
      toLayout = self->super._toLayout;
      if (toLayout) {
        LODWORD(toLayout) = toLayout->_chromelessTransitionProgress == 1.0;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v3 = 1;
    if ((*(_WORD *)&self->super._flags & 0x400) != 0) {
      goto LABEL_7;
    }
  }
  LODWORD(toLayout) = 0;
LABEL_9:
  if (((v3 | toLayout) & 1) == 0)
  {
    -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout));
    v6 = self->super._toLayout;
    if (v6)
    {
      uint64_t v7 = 184;
      if ((*(_WORD *)&self->super._flags & 4) == 0) {
        uint64_t v7 = 192;
      }
      v6 = *(_UINavigationBarLayout **)((char *)&v6->super.isa + v7);
    }
    v8 = v6;
    v9 = self->super._fromLayout;
    double computedBackgroundViewAlpha = 0.0;
    double chromelessTransitionProgress = 0.0;
    if (v9) {
      double chromelessTransitionProgress = v9->_chromelessTransitionProgress;
    }
    v13 = v8;
    [(_UINavigationBarLayout *)v8 setBackgroundTransitionProgress:chromelessTransitionProgress];
    v12 = self->super._fromLayout;
    if (v12) {
      double computedBackgroundViewAlpha = v12->_computedBackgroundViewAlpha;
    }
    [(_UINavigationBarLayout *)v13 setBackgroundAlpha:computedBackgroundViewAlpha];
    [(_UINavigationBarLayout *)v13 setShadowAlpha:0.0];
    if ((*(_WORD *)&self->super._flags & 0x800) != 0)
    {
      [(_UIBarBackground *)self->super._backgroundView setLayout:v13];
      [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
    }
    [(UIView *)self->super._backgroundView layoutIfNeeded];
  }
}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  if (a4 && a4 != a3)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    id v10 = a4;
    [v10 setAlpha:0.0];
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    [v10 layoutIfNeeded];
    [v10 setTransitioning:1];
  }
}

- (void)prepare
{
  [(_UINavigationBarTransitionContext *)self _updateIncomingLayoutWidthToMatchOutgoingLayout];
  v16.receiver = self;
  v16.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  [(_UINavigationBarTransitionContext *)&v16 prepare];
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  v4 = toLayout;
  [(_UINavigationBarLayout *)v4 _prepareForTransitionToSearchLayoutState:3];
  uint64_t v5 = self->super._toLayout;
  if (v5) {
    double width = v5->_layoutSize.width;
  }
  else {
    double width = 0.0;
  }
  if ([(_UINavigationBarTransitionContext *)self observedScrollViewOffsetIsApplicable]&& (([(_UINavigationBarTransitionContext *)self startingContentOffsetForObservedScrollView], (fromLayout = self->super._fromLayout) == 0)? (double height = 0.0): (double height = fromLayout->_layoutSize.height), v7 > -height))
  {
    double v10 = -[_UINavigationBarLayout layoutHeights]((uint64_t)self->super._toLayout);
  }
  else
  {
    -[_UINavigationBarLayout layoutHeights]((uint64_t)self->super._toLayout);
  }
  [(_UINavigationBarLayout *)(uint64_t)self->super._toLayout setLayoutSize:v10];
  [(_UINavigationBarTransitionContextPresentSearch *)self _prepareBackgroundView];
  -[_UINavigationBarTransitionContext _preparePalettes](self);
  [(UIView *)self->super._tabBarHostedView setAlpha:1.0];
  v11 = [(_UINavigationBarLayout *)v4 _searchController];
  int v12 = [v11 _hidesNavigationBarDuringPresentationRespectingInlineSearch];

  if (v12)
  {
    v13 = [(_UINavigationBarTransitionContext *)self navigationBar];
    -[_UINavigationBarLayout _setBarPosition:](v4, "_setBarPosition:", [v13 barPosition]);
  }
  else
  {
    [(_UINavigationBarLayout *)v4 _setBarPosition:2];
    if ([(_UINavigationBarLayout *)v4 _isHostedInlineByNavigationBar])
    {
      v14 = [(_UINavigationBarLayout *)v4 _viewStackedInNavigationBar];
      transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
      self->_transitioningScopeBarContainer = v14;

      [(UIView *)self->_transitioningScopeBarContainer setAlpha:0.0];
      [(UIView *)self->_transitioningScopeBarContainer setHidden:0];
      -[UIView setFrame:](self->_transitioningScopeBarContainer, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa));
      [(UIView *)self->_transitioningScopeBarContainer layoutIfNeeded];
    }
  }
}

- (void)_animateBackgroundView
{
  if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
  {
    -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
    toLayout = self->super._toLayout;
    if (toLayout)
    {
      uint64_t v4 = 184;
      if ((*(_WORD *)&self->super._flags & 4) == 0) {
        uint64_t v4 = 192;
      }
      toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v4);
    }
    uint64_t v5 = toLayout;
    v6 = self->super._toLayout;
    double computedBackgroundViewAlpha = 0.0;
    double chromelessTransitionProgress = 0.0;
    if (v6) {
      double chromelessTransitionProgress = v6->_chromelessTransitionProgress;
    }
    double v10 = v5;
    [(_UINavigationBarLayout *)v5 setBackgroundTransitionProgress:chromelessTransitionProgress];
    v9 = self->super._toLayout;
    if (v9) {
      double computedBackgroundViewAlpha = v9->_computedBackgroundViewAlpha;
    }
    [(_UINavigationBarLayout *)v10 setBackgroundAlpha:computedBackgroundViewAlpha];
    [(_UINavigationBarLayout *)v10 setShadowAlpha:1.0];
    if ((*(_WORD *)&self->super._flags & 0x800) != 0)
    {
      [(_UIBarBackground *)self->super._backgroundView setLayout:v10];
      [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
    [(_UINavigationBarTransitionContext *)&v11 _animateBackgroundView];
  }
}

- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v16 = a3;
  id v17 = a5;
  if (v16 != v17)
  {
    if (v16)
    {
      [v16 setAlpha:0.0];
      [v16 setTransitioning:1];
      objc_msgSend(v16, "setFrame:", v14, v13, v12, v11);
    }
    if (v17)
    {
      objc_msgSend(v17, "setFrame:", x, y, width, height);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __112___UINavigationBarTransitionContextPresentSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v20 = v17;
      v18 = _Block_copy(aBlock);
    }
    else
    {
      v18 = 0;
    }
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithoutOverlap:0 partTwo:v18];
  }
}

- (void)animate
{
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  uint64_t v5 = toLayout;
  if ([(_UINavigationBarLayout *)v5 _usesLegacyVisualProvider])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTransitionContext.m" lineNumber:3068 description:@"A search bar with a legacy visual provider should not end up in this code path. This is a UIKit bug"];
  }
  v6 = self->super._toLayout;
  if (v6)
  {
    double backgroundAlpha = self->super._backgroundAlpha;
    if (v6->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      v6->_requestedBackgroundViewAlpha = backgroundAlpha;
      [(_UINavigationBarLayout *)v6 _updateLayoutOutputs];
      v6 = self->super._toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)v6);
  v29.receiver = self;
  v29.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  [(_UINavigationBarTransitionContext *)&v29 animate];
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._toLayout);
  v8 = [(_UINavigationBarTransitionContext *)self navigationBar];
  [v8 frame];
  objc_msgSend(v8, "setFrame:");
  double v9 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int v16 = [(_UINavigationBarLayout *)v5 _isHostedInlineByNavigationBar];
  if (v16)
  {
    -[UIView setFrame:](self->_transitioningScopeBarContainer, "setFrame:", v9, v11, v13, v15);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke;
    v28[3] = &unk_1E52D9F70;
    v28[4] = self;
    +[UIView animateKeyframesWithDuration:0 delay:v28 options:0 animations:0.0 completion:0.0];
  }
  else
  {
    -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v9, v11, v13, v15);
  }
  id v17 = [v8 _stack];
  v18 = [v17 topItem];
  [v18 _updateSearchBarItemGroup];

  [(_UINavigationBarLayout *)v5 _animateTransitionToSearchLayoutState:3];
  v19 = self->super._toLayout;
  if (v19) {
    v19 = (_UINavigationBarLayout *)v19->_backgroundView;
  }
  id v20 = v19;
  -[_UINavigationBarLayout setFrame:](v20, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
  [(_UINavigationBarLayout *)v20 layoutIfNeeded];
  if ((*(_WORD *)&self->super._flags & 0x20) != 0)
  {
    fromLayout = self->super._fromLayout;
    if (fromLayout) {
      fromLayout = (_UINavigationBarLayout *)fromLayout->_largeTitleView;
    }
    v22 = fromLayout;
    [(_UINavigationBarLayout *)v22 frame];
    -[_UINavigationBarLayout setFrame:](v22, "setFrame:", v23, _hiddenLargeTitleMinY(self->super._toLayout, self->super._fromLayout, v16), v24, v25);
    [(_UINavigationBarLayout *)v22 layoutIfNeeded];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_3;
  v27[3] = &unk_1E52D9F70;
  v27[4] = self;
  [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlap:v27 partOne:0 partTwo:-0.3];
  -[_UINavigationBarTransitionContext _animatePalettes](self);
  [(UIView *)self->super._tabBarHostedView setAlpha:0.0];
}

- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  [(_UINavigationBarTransitionContext *)&v4 _resetContentAndLargeTitleViewCompleted:a3];
  [(UIView *)self->super._contentView setAlpha:1.0];
}

- (void)complete
{
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  [(_UINavigationBarTransitionContext *)&v13 complete];
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentViewLayout;
  }
  objc_super v4 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentViewLayout;
  }
  v6 = toLayout;

  if (v4 != v6) {
    [(_UINavigationBarLayout *)v4 removeContent];
  }
  double v7 = self->super._toLayout;
  if (v7) {
    double v7 = (_UINavigationBarLayout *)v7->_searchBar;
  }
  v8 = v7;
  [(_UINavigationBarLayout *)v8 _completeTransitionToSearchLayoutState:3];

  double v9 = self->super._toLayout;
  if (v9) {
    double v9 = (_UINavigationBarLayout *)v9->_bottomPalette;
  }
  double v10 = v9;

  if (!v10)
  {
    double v11 = self->super._fromLayout;
    if (v11) {
      double v11 = (_UINavigationBarLayout *)v11->_bottomPalette;
    }
    double v12 = v11;
    [(_UINavigationBarLayout *)v12 removeFromSuperview];
  }
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  [(_UINavigationBarTransitionContext *)&v8 cancel];
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  objc_super v4 = toLayout;
  uint64_t v5 = self->super._toLayout;
  if (v5) {
    uint64_t v5 = (_UINavigationBarLayout *)v5->_searchBar;
  }
  v6 = v5;
  [(_UINavigationBarLayout *)v6 _cancelTransitionToSearchLayoutState:3];

  if ([(_UINavigationBarLayout *)v4 _isHostedInlineByNavigationBar])
  {
    [(UIView *)self->_transitioningScopeBarContainer setAlpha:0.0];
    transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
    self->_transitioningScopeBarContainer = 0;
  }
}

- (void).cxx_destruct
{
}

@end