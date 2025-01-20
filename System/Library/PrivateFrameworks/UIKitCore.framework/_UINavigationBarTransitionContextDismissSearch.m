@interface _UINavigationBarTransitionContextDismissSearch
- (BOOL)_shouldCrossfadeDismissal;
- (int64_t)transition;
- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6;
- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5;
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UINavigationBarTransitionContextDismissSearch

- (int64_t)transition
{
  return 6;
}

- (BOOL)_shouldCrossfadeDismissal
{
  v3 = [(UISearchBar *)self->_transitioningSearchBar _searchController];
  if (([v3 obscuresBackgroundDuringPresentation] & 1) == 0)
  {
    v5 = [(UISearchBar *)self->_transitioningSearchBar _searchController];
    if (![v5 _hidesNavigationBarDuringPresentationRespectingInlineSearch])
    {
      BOOL v4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    toLayout = self->super._toLayout;
    if (toLayout)
    {
      v7 = toLayout->_searchBar;
      if (v7)
      {
        v13.origin.x = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
        if (CGRectGetHeight(v13) != 0.0)
        {
          BOOL v4 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    if ((*(_WORD *)&self->super._flags & 0x40) != 0)
    {
      v8 = self->super._toLayout;
      double v9 = 0.0;
      double height = 0.0;
      if (v8) {
        double height = v8->_layoutSize.height;
      }
      fromLayout = self->super._fromLayout;
      if (fromLayout) {
        double v9 = fromLayout->_layoutSize.height;
      }
      BOOL v4 = height == v9;
    }
    else
    {
      BOOL v4 = 1;
    }
    goto LABEL_16;
  }
  BOOL v4 = 0;
LABEL_18:

  return v4;
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
  v31.receiver = self;
  v31.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  [(_UINavigationBarTransitionContext *)&v31 prepare];
  [(_UINavigationBarLayout *)self->super._toLayout finalizeStateFromTransition:self];
  [(_UINavigationBarContentView *)self->super._contentView clearTransitionContext];
  [(_UINavigationBarLargeTitleView *)self->super._largeTitleView clearTransitionContext];
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    searchBar = fromLayout->_searchBar;
  }
  else {
    searchBar = 0;
  }
  p_transitioningSearchBar = &self->_transitioningSearchBar;
  objc_storeStrong((id *)&self->_transitioningSearchBar, searchBar);
  BOOL v6 = [(UISearchBar *)self->_transitioningSearchBar _isHostedInlineByNavigationBar];
  if (v6)
  {
    v7 = [(UISearchBar *)*p_transitioningSearchBar _viewStackedInNavigationBar];
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong((id *)&self->_transitioningScopeBarContainer, v7);
  if (v6) {

  }
  toLayout = self->super._toLayout;
  if (toLayout) {
    int64_t representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  }
  else {
    int64_t representedSearchLayoutState = 0;
  }
  [(UISearchBar *)*p_transitioningSearchBar _prepareForTransitionToSearchLayoutState:representedSearchLayoutState];
  int v10 = [(UISearchBar *)*p_transitioningSearchBar _isHostedInlineByNavigationBar];
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    int v11 = v10;
    largeTitleView = self->super._largeTitleView;
    CGRect v13 = self->super._fromLayout;
    if (v13) {
      CGRect v13 = (_UINavigationBarLayout *)v13->_largeTitleView;
    }
    v14 = v13;

    if (largeTitleView != (_UINavigationBarLargeTitleView *)v14)
    {
      v15 = self->super._toLayout;
      if (v15)
      {
        [(_UINavigationBarLayout *)v15 _layoutFrameFor:v15->_largeTitleLayoutData withOrder:60];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        v22 = self->super._toLayout;
      }
      else
      {
        v22 = 0;
        double v19 = 0.0;
        double v21 = 0.0;
        double v17 = 0.0;
      }
      -[UIView setFrame:](self->super._largeTitleView, "setFrame:", v17, _hiddenLargeTitleMinY(self->super._fromLayout, v22, v11), v19, v21);
      [(UIView *)self->super._largeTitleView layoutIfNeeded];
      [(UIView *)self->super._largeTitleView setAlpha:0.0];
    }
  }
  v23 = self->super._toLayout;
  if (v23) {
    v23 = (_UINavigationBarLayout *)v23->_contentView;
  }
  v24 = v23;
  v25 = self->super._fromLayout;
  if (v25) {
    v25 = (_UINavigationBarLayout *)v25->_contentView;
  }
  v26 = v25;

  if (v24 != v26) {
    [(_UINavigationBarLayout *)v24 setAlpha:0.0];
  }
  v27 = self->super._fromLayout;
  if (v27) {
    v27 = (_UINavigationBarLayout *)v27->_bottomPalette;
  }
  v28 = v27;

  if (!v28)
  {
    v29 = self->super._toLayout;
    if (v29) {
      v29 = (_UINavigationBarLayout *)v29->_bottomPalette;
    }
    v30 = v29;
    [(_UINavigationBarLayout *)v30 setAlpha:0.0];
  }
  -[_UINavigationBarTransitionContext _preparePalettes](self);
  [(UIView *)self->super._tabBarHostedView setAlpha:0.0];
  [(UISearchBar *)*p_transitioningSearchBar _setBarPosition:2];
  if ([(_UINavigationBarTransitionContextDismissSearch *)self _shouldCrossfadeDismissal]) {
    [(UISearchBar *)*p_transitioningSearchBar _freezeForAnimatedTransitionToSearchLayoutState:2];
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
      aBlock[2] = __112___UINavigationBarTransitionContextDismissSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v20 = v17;
      double v18 = _Block_copy(aBlock);
    }
    else
    {
      double v18 = 0;
    }
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithoutOverlap:0 partTwo:v18];
  }
}

- (void)animate
{
  if ([(UISearchBar *)self->_transitioningSearchBar _usesLegacyVisualProvider])
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTransitionContext.m" lineNumber:3257 description:@"A search bar with a legacy visual provider should not end up in this code path. This is a UIKit bug"];
  }
  toLayout = self->super._toLayout;
  if (toLayout)
  {
    double backgroundAlpha = self->super._backgroundAlpha;
    if (toLayout->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      toLayout->_requestedBackgroundViewAlpha = backgroundAlpha;
      [(_UINavigationBarLayout *)toLayout _updateLayoutOutputs];
      toLayout = self->super._toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)toLayout);
  v40.receiver = self;
  v40.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  [(_UINavigationBarTransitionContext *)&v40 animate];
  BOOL v6 = [(_UINavigationBarTransitionContext *)self navigationBar];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = self->super._toLayout;
  if (v13) {
    double height = v13->_layoutSize.height;
  }
  else {
    double height = 0.0;
  }
  v15 = [(_UINavigationBarTransitionContext *)self navigationBar];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, height);

  BOOL v16 = [(_UINavigationBarTransitionContextDismissSearch *)self _shouldCrossfadeDismissal];
  if (!v16
    && ![(UISearchBar *)self->_transitioningSearchBar _isHostedInlineByNavigationBar])
  {
    -[UISearchBar setFrame:](self->_transitioningSearchBar, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa));
  }
  id v17 = self->super._toLayout;
  if (v17) {
    int64_t representedSearchLayoutState = v17->_representedSearchLayoutState;
  }
  else {
    int64_t representedSearchLayoutState = 0;
  }
  [(UISearchBar *)self->_transitioningSearchBar _animateTransitionToSearchLayoutState:representedSearchLayoutState];
  if (self->_transitioningScopeBarContainer)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke;
    v39[3] = &unk_1E52D9F70;
    v39[4] = self;
    +[UIView animateKeyframesWithDuration:0 delay:v39 options:0 animations:0.0 completion:0.0];
  }
  double v19 = self->super._toLayout;
  if (v19) {
    double v19 = (_UINavigationBarLayout *)v19->_backgroundView;
  }
  id v20 = v19;
  -[_UINavigationBarLayout setFrame:](v20, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
  [(_UINavigationBarLayout *)v20 layoutIfNeeded];
  if ((*(_WORD *)&self->super._flags & 0x40) == 0)
  {
    double v21 = 0;
    if ((*(_WORD *)&self->super._flags & 0x800) == 0) {
      goto LABEL_32;
    }
    goto LABEL_25;
  }
  v22 = self->super._toLayout;
  if (v22) {
    v22 = (_UINavigationBarLayout *)v22->_largeTitleView;
  }
  double v21 = v22;
  v23 = self->super._toLayout;
  if (v23) {
    [(_UINavigationBarLayout *)v23 _layoutFrameFor:v23->_largeTitleLayoutData withOrder:60];
  }
  -[_UINavigationBarLayout setFrame:](v21, "setFrame:");
  [(_UINavigationBarLayout *)v21 layoutIfNeeded];
  if ((*(_WORD *)&self->super._flags & 0x800) != 0)
  {
LABEL_25:
    v24 = self->super._toLayout;
    double computedBackgroundViewAlpha = 0.0;
    if (v24)
    {
      double chromelessTransitionProgress = v24->_chromelessTransitionProgress;
      v24 = (_UINavigationBarLayout *)v24->_backgroundView;
    }
    else
    {
      double chromelessTransitionProgress = 0.0;
    }
    v27 = v24;
    v28 = [(_UINavigationBarLayout *)v27 layout];
    [v28 setBackgroundTransitionProgress:chromelessTransitionProgress];

    v29 = self->super._toLayout;
    if (v29)
    {
      double computedBackgroundViewAlpha = v29->_computedBackgroundViewAlpha;
      v29 = (_UINavigationBarLayout *)v29->_backgroundView;
    }
    v30 = v29;
    objc_super v31 = [(_UINavigationBarLayout *)v30 layout];
    [v31 setBackgroundAlpha:computedBackgroundViewAlpha];

    v32 = self->super._toLayout;
    if (v32) {
      v32 = (_UINavigationBarLayout *)v32->_backgroundView;
    }
    v33 = v32;
    [(_UINavigationBarLayout *)v33 transitionBackgroundViews];
  }
LABEL_32:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_3;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  v34 = v21;
  v38 = v34;
  v35 = (void (**)(void))_Block_copy(aBlock);
  if (v16)
  {
    [(UIView *)self->_transitioningSearchBar setAlpha:0.0];
    v35[2](v35);
  }
  else
  {
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlap:0 partOne:v35 partTwo:-0.3];
  }
  -[_UINavigationBarTransitionContext _animatePalettes](self);
  [(UIView *)self->super._tabBarHostedView setAlpha:1.0];
}

- (void)complete
{
  v23.receiver = self;
  v23.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  [(_UINavigationBarTransitionContext *)&v23 complete];
  toLayout = self->super._toLayout;
  if (toLayout) {
    int64_t representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  }
  else {
    int64_t representedSearchLayoutState = 0;
  }
  [(UISearchBar *)self->_transitioningSearchBar _completeTransitionToSearchLayoutState:representedSearchLayoutState];
  if (![(UISearchBar *)self->_transitioningSearchBar _isHostedInlineByNavigationBar])
  {
    [(UIView *)self->super._navigationBar bounds];
    double v8 = self->super._toLayout;
    if (v8)
    {
      double width = v8->_layoutSize.width;
      double height = v8->_layoutSize.height;
    }
    else
    {
      double height = 0.0;
      double width = 0.0;
    }
    if (v6 == width && v7 == height) {
      goto LABEL_23;
    }
    double v12 = [(UISearchBar *)self->_transitioningSearchBar _searchController];
    double v13 = v12;
    if (v12)
    {
      int v14 = (v12[263] >> 5) & 3;
      if (v14)
      {

        if (v14 == 1)
        {
LABEL_22:
          [(UIView *)self->super._navigationBar bounds];
          [(_UINavigationBarLayout *)(uint64_t)self->super._toLayout setLayoutSize:v17];
          [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
          double v8 = self->super._toLayout;
LABEL_23:
          -[UISearchBar setFrame:](self->_transitioningSearchBar, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](v8));
          goto LABEL_24;
        }
LABEL_19:
        if (os_variant_has_internal_diagnostics())
        {
          id v20 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "What changed the navigation bar bounds size to something unexpected during the animation if it wasn't a showsScopeBar change?", buf, 2u);
          }
        }
        else
        {
          v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &complete___s_category) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "What changed the navigation bar bounds size to something unexpected during the animation if it wasn't a showsScopeBar change?", buf, 2u);
          }
        }
        goto LABEL_22;
      }
      dyld_program_sdk_at_least();
    }

    goto LABEL_19;
  }
  uint64_t v5 = self->super._toLayout;
  if (v5 && v5->_representedSearchLayoutState == 1)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58___UINavigationBarTransitionContextDismissSearch_complete__block_invoke;
    v21[3] = &unk_1E52D9F70;
    v21[4] = self;
    +[UIView performWithoutAnimation:v21];
    [(UISearchBar *)self->_transitioningSearchBar _growToSearchFieldIfNecessary];
  }
LABEL_24:
  [(UIView *)self->_transitioningSearchBar setAlpha:1.0];
  [(UIView *)self->_transitioningScopeBarContainer setAlpha:0.0];
  transitioningSearchBar = self->_transitioningSearchBar;
  self->_transitioningSearchBar = 0;

  transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
  self->_transitioningScopeBarContainer = 0;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  [(_UINavigationBarTransitionContext *)&v7 cancel];
  toLayout = self->super._toLayout;
  if (toLayout) {
    int64_t representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  }
  else {
    int64_t representedSearchLayoutState = 0;
  }
  [(UISearchBar *)self->_transitioningSearchBar _cancelTransitionToSearchLayoutState:representedSearchLayoutState];
  [(UIView *)self->_transitioningSearchBar setAlpha:1.0];
  [(UIView *)self->_transitioningScopeBarContainer setAlpha:1.0];
  transitioningSearchBar = self->_transitioningSearchBar;
  self->_transitioningSearchBar = 0;

  transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
  self->_transitioningScopeBarContainer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningScopeBarContainer, 0);
  objc_storeStrong((id *)&self->_transitioningSearchBar, 0);
}

@end