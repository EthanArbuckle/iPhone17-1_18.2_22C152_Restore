@interface _UINavigationBarTransitionContextPop
- (id)viewUsingEaseInCurve;
- (int64_t)transition;
- (void)_animateBackgroundView;
- (void)_animateContentView;
- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6;
- (void)_animateLargeTitleView;
- (void)_animateScaleTransition;
- (void)_animateSearchBar;
- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4;
- (void)_prepareBackgroundView;
- (void)_prepareContentView;
- (void)_prepareLargeTitleView;
- (void)_prepareScaleTransition;
- (void)_prepareSearchBar;
- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5;
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UINavigationBarTransitionContextPop

- (int64_t)transition
{
  return 2;
}

- (id)viewUsingEaseInCurve
{
  if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._toLargeTitleLayout, self->super._fromContentLayout))
  {
    v3 = [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout titleLabel];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_prepareScaleTransition
{
  if ((*(_WORD *)&self->super._flags & 0x40) != 0 && self->super._largeTitleTransitionType == 1)
  {
    [(UIView *)self->super._largeTitleView setClipsToBounds:0];
    [(UIView *)self->super._contentView setClipsToBounds:0];
    if ((*(_WORD *)&self->super._flags & 0x20) == 0)
    {
      [(UIView *)self->super._largeTitleView bounds];
      if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        toLayout = self->super._toLayout;
        if (toLayout) {
          [(_UINavigationBarLayout *)toLayout _layoutFrameFor:toLayout->_largeTitleLayoutData withOrder:60];
        }
        -[UIView setFrame:](self->super._largeTitleView, "setFrame:");
        [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout updateRestingTitleHeight];
      }
    }
    double v7 = 0.0;
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
    self->_titleTransitionAdjustment = _titleTransitionAdjustmentFromLargeTitleToBackButton(self->super._toLargeTitleLayout, self->super._fromContentLayout);
    double v8 = _distanceFromLargeTitleToBackButton(self->super._toLargeTitleLayout, self->super._fromContentLayout, self->super._contentView);
    double v10 = v9;
    double v11 = v8 - self->_titleTransitionAdjustment;
    self->_titleTransitionDistanceExcludingLargeTitleOffset.width = v11;
    self->_titleTransitionDistanceExcludingLargeTitleOffset.height = v9;
    v12 = self->super._toLayout;
    double v13 = 0.0;
    if (v12)
    {
      [(_UINavigationBarLayout *)v12 _layoutFrameFor:v12->_largeTitleLayoutData withOrder:60];
      double v13 = v14;
      double v7 = v15;
    }
    [(UIView *)self->super._largeTitleView frame];
    v18 = self->super._toLayout;
    if (v18)
    {
      double v19 = v13 - v16;
      double v20 = v10 + v7 - v17;
      if (v18->_largeTitleExposure <= 0.0) {
        double v19 = -0.0;
      }
      else {
        double v10 = v20;
      }
    }
    else
    {
      double v19 = -0.0;
    }
    self->_titleTransitionDistance.width = v11 + v19;
    self->_titleTransitionDistance.height = v10;
    toLargeTitleLayout = self->super._toLargeTitleLayout;
    v22 = self->super._fromContentLayout;
    v23 = [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout titleLabel];
    _applyStretchTransformForTitleViewAndBackButtonLayout(2, v23, v22);

    uint64_t v24 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];

      if (!v26)
      {
        v27 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
        v28 = [v27 visualProvider];
        v29 = [v28 backIndicatorView];

        [v29 setAlpha:1.0];
        long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v31[0] = *MEMORY[0x1E4F1DAB8];
        v31[1] = v30;
        v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [v29 setTransform:v31];
      }
    }
  }
}

- (void)_prepareContentView
{
  toContentLayout = self->super._toContentLayout;
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  v5 = toLayout;
  [(_UINavigationBarContentViewLayout *)toContentLayout setActive:1 contentView:v5];

  [(_UINavigationBarLayout *)self->super._toLayout ensureBackButtonTruncationOccursWithContext:self];
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  double v7 = fromLayout;

  if (v7) {
    [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout setBackButtonHidden:0 titleLabelHidden:(*(_WORD *)&self->super._flags >> 5) & 1 titleViewHidden:0 barsHidden:0];
  }
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout setContentHidden:1];
  double v8 = self->super._toLayout;
  if (v8) {
    double v8 = (_UINavigationBarLayout *)v8->_contentView;
  }
  CGFloat v9 = v8;

  if (v9)
  {
    double v10 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
    [v10 setAlpha:0.3];
  }
  [(UIView *)self->super._contentView layoutIfNeeded];
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout freeze];
  [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout freeze];
  double v11 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  v12 = [v11 visualProvider];
  double v13 = [v12 contentView];
  [v13 frame];
  self->_endingNewBackButtonFrame.origin.x = v14;
  self->_endingNewBackButtonFrame.origin.y = v15;
  self->_endingNewBackButtonFrame.size.width = v16;
  self->_endingNewBackButtonFrame.size.height = v17;

  v18 = self->super._toLayout;
  if (v18 && (v46 = v18->_contentView) != 0)
  {
    double v19 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleControl];
    [v19 frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    self->_endingNewTitleViewFrame.origin.x = v20;
    self->_endingNewTitleViewFrame.origin.y = v22;
    self->_endingNewTitleViewFrame.size.width = v24;
    self->_endingNewTitleViewFrame.size.height = v26;
    $91315BD00F435461FFF53ACD9B2AA218 flags = self->super._flags;
    if ((*(unsigned char *)&flags & 0x40) == 0 || self->super._largeTitleTransitionType != 1)
    {
      double v29 = _distanceFromTitleToBackButton(self->super._toContentLayout, self->super._fromContentLayout, v46, (*(unsigned int *)&flags >> 1) & 1);
      self->_titleTransitionDistance.width = v29;
      self->_titleTransitionDistance.height = 0.0;
      objc_msgSend(v19, "setFrame:", v21 - v29, v23, v25, v27);
      long long v30 = self->super._toContentLayout;
      v31 = self->super._fromContentLayout;
      v32 = [(_UINavigationBarContentViewLayout *)v30 titleControl];
      v33 = [v32 titleLabel];
      _applyStretchTransformForTitleViewAndBackButtonLayout(1, v33, v31);
    }
  }
  else
  {
    v46 = 0;
  }
  v34 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  [v34 setBackButtonMaskEnabled:1];

  _performAdditionalTitleViewClipping(self, self->super._fromContentLayout, self->super._toContentLayout);
  v35 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  [v35 frame];
  double Width = CGRectGetWidth(v48);

  double v37 = fabs(self->_titleTransitionDistance.width);
  if (Width >= v37) {
    double v37 = Width;
  }
  double v38 = -v37;
  v39 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  _updateBackButtonSpacingForButton(v39, (*(_WORD *)&self->super._flags >> 1) & 1, v38, 0.0);

  v40 = self->super._fromLayout;
  if (v40) {
    v40 = (_UINavigationBarLayout *)v40->_contentView;
  }
  v41 = v40;

  if (v41)
  {
    v42 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v42 _navigationBarTransitionWillBegin:1 willBeDisplayed:0];
  }
  v43 = self->super._toLayout;
  if (v43) {
    v43 = (_UINavigationBarLayout *)v43->_contentView;
  }
  v44 = v43;

  if (v44)
  {
    v45 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v45 _navigationBarTransitionWillBegin:1 willBeDisplayed:1];
  }
  [(UIView *)self->super._contentView layoutIfNeeded];
}

- (void)_prepareLargeTitleView
{
  if ((*(_WORD *)&self->super._flags & 0x20) != 0)
  {
    double v3 = _slideTransitionFadeMaskImage(0);
    double v4 = [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout titleLabel];
    [(UIView *)self->super._largeTitleView frame];
    double MaxX = CGRectGetMaxX(v21);
    v6 = _wrapViewInClippingView(v4, 0, v3, 0.0, MaxX);

    -[_UINavigationBarTransitionContext _addClippingView:]((uint64_t)self, v6);
  }
  else
  {
    [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout setContentHidden:1];
  }
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    int64_t largeTitleTransitionType = self->super._largeTitleTransitionType;
    if (largeTitleTransitionType == 1)
    {
      [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout setContentHidden:1];
      toLargeTitleLayout = self->super._toLargeTitleLayout;
      id v19 = [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout titleLabel];
      [v19 center];
      _updateLargeTitleSpacingForLayout(toLargeTitleLayout, v17, v18, -self->_titleTransitionDistanceExcludingLargeTitleOffset.width, -self->_titleTransitionDistanceExcludingLargeTitleOffset.height);
    }
    else
    {
      if (largeTitleTransitionType) {
        return;
      }
      [(UIView *)self->super._largeTitleView bounds];
      double v10 = -v9;
      if ((*(_WORD *)&self->super._flags & 2) != 0) {
        double v10 = v9;
      }
      -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, v10, 0.0);
      id v19 = [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout accessoryView];
      [v19 setAlpha:0.0];
    }
  }
  else
  {
    if (!self->super._toLargeTitleLayout)
    {
      largeTitleView = self->super._largeTitleView;
      if (largeTitleView)
      {
        v12 = [(UIView *)largeTitleView superview];
        navigationBar = self->super._navigationBar;

        if (v12 == navigationBar)
        {
          CGFloat v14 = [(_UINavigationBarLargeTitleView *)self->super._largeTitleView layout];
          CGFloat v15 = self->super._toLargeTitleLayout;
          self->super._toLargeTitleLayout = v14;
        }
      }
    }
    double v7 = self->super._toLargeTitleLayout;
    [(_UINavigationBarLargeTitleViewLayout *)v7 setContentHidden:1];
  }
}

- (void)_prepareBackgroundView
{
  if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground]) {
    return;
  }
  __int16 flags = (__int16)self->super._flags;
  if ((flags & 0x200) != 0 && (fromLayout = self->super._fromLayout) != 0)
  {
    int v4 = fromLayout->_chromelessTransitionProgress == 1.0;
    if ((*(_WORD *)&self->super._flags & 0x400) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    int v4 = 0;
    if ((*(_WORD *)&self->super._flags & 0x400) == 0) {
      goto LABEL_7;
    }
  }
  toLayout = self->super._toLayout;
  if (toLayout)
  {
    int v6 = toLayout->_chromelessTransitionProgress == 1.0;
    if (!v4) {
      goto LABEL_24;
    }
LABEL_11:
    if ((v6 & 1) == 0)
    {
      double v8 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
      CGFloat v12 = v8;
      double v13 = v9;
      double v14 = v10;
      double v15 = v11;
      if ((flags & 2) != 0)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v8);
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v8);
        v26.origin.x = v12;
        v26.origin.y = v13;
        v26.size.width = v14;
        v26.size.height = v15;
        double MaxX = MinX - CGRectGetWidth(v26);
      }
      -[UIView setFrame:](self->super._backgroundView, "setFrame:", MaxX, v13, v14, v15);
      double v18 = self->super._toLayout;
      if (v18)
      {
        uint64_t v19 = 184;
        if ((*(_WORD *)&self->super._flags & 4) == 0) {
          uint64_t v19 = 192;
        }
        double v18 = *(_UINavigationBarLayout **)((char *)&v18->super.isa + v19);
      }
      CGFloat v20 = v18;
      CGRect v21 = v20;
      CGFloat v22 = self->super._toLayout;
      if (v22) {
        double chromelessTransitionProgress = v22->_chromelessTransitionProgress;
      }
      else {
        double chromelessTransitionProgress = 0.0;
      }
      [(_UINavigationBarLayout *)v20 setBackgroundTransitionProgress:chromelessTransitionProgress];
      [(_UINavigationBarLayout *)v21 setBackgroundAlpha:self->super._backgroundAlpha];
      [(_UINavigationBarLayout *)v21 setShadowAlpha:0.0];
      if ((*(_WORD *)&self->super._flags & 0x800) != 0)
      {
        [(_UIBarBackground *)self->super._backgroundView setLayout:v21];
        [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
      }
    }
    goto LABEL_24;
  }
LABEL_7:
  int v6 = 0;
  if (v4) {
    goto LABEL_11;
  }
LABEL_24:
  if (v4 != v6)
  {
    navigationBar = self->super._navigationBar;
    [(UINavigationBar *)navigationBar _updatePaletteBackgroundIfNecessary];
  }
}

- (void)_prepareSearchBar
{
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  double v27 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  v5 = toLayout;
  if (v27 != v5)
  {
    [(_UINavigationBarLayout *)v27 _navigationBarSlideTransitionWillBegin];
    [(_UINavigationBarLayout *)v5 _navigationBarSlideTransitionWillBegin];
    int v6 = self->super._fromLayout;
    if (v6 && v6->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      [(_UINavigationBarLayout *)v27 setAlpha:0.0];
      [(_UINavigationBarLayout *)v5 setAlpha:1.0];
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._fromLayout->super.isa));
      [(_UINavigationBarLayout *)v5 layoutIfNeeded];
    }
    else
    {
      if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(v6, self->super._toLayout, 0, 0) & 1) != 0
        || ![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
      {
        [(_UINavigationBarLayout *)v5 setAlpha:0.0];
      }
      double v7 = self->super._fromLayout;
      double v8 = self->super._toLayout;
      if (v7) {
        searchBar = v7->_searchBar;
      }
      else {
        searchBar = 0;
      }
      double v10 = searchBar;
      int v11 = [(UISearchBar *)v10 showsScopeBar];

      if (v8) {
        CGFloat v12 = v8->_searchBar;
      }
      else {
        CGFloat v12 = 0;
      }
      double v13 = v12;

      int v14 = [(UISearchBar *)v13 showsScopeBar];
      if (v11 != v14)
      {
        double v15 = [(_UINavigationBarLayout *)v5 _scopeBar];
        [v15 setAlpha:0.0];
      }
      CGFloat v16 = [(_UINavigationBarLayout *)v5 _searchController];
      int v17 = [v16 isActive];

      double v18 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      if (!v17 && [(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
      {
        BOOL v25 = [(_UINavigationBarTransitionContext *)self isRTL];
        v29.origin.x = v18;
        v29.origin.y = v20;
        v29.size.width = v22;
        v29.size.height = v24;
        double Width = CGRectGetWidth(v29);
        if (!v25) {
          double Width = -Width;
        }
        double v18 = v18 + Width;
      }
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v18, v20, v22, v24);
    }
  }
}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  if (v10 && v10 != a3)
  {
    id v26 = v10;
    [v10 preferredHeight];
    double v12 = v11;
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.height = v12;
    double v13 = x - CGRectGetWidth(v28);
    if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
    {
      fromLayout = self->super._fromLayout;
      toLayout = self->super._toLayout;
      CGFloat v16 = fromLayout;
      int v17 = toLayout;
      if (v16)
      {
        BOOL v18 = v16->_largeTitleExposure > 0.0;
        bottomPalette = v16->_bottomPalette;
      }
      else
      {
        BOOL v18 = 0;
        bottomPalette = 0;
      }
      double v20 = bottomPalette;

      if (v17)
      {
        BOOL v21 = v17->_largeTitleExposure > 0.0;
        double v22 = v17->_bottomPalette;
      }
      else
      {
        BOOL v21 = 0;
        double v22 = 0;
      }
      double v23 = v22;

      char v24 = !v18;
      if (!v20) {
        char v24 = 1;
      }
      if (v24)
      {
        if (v20) {
          char v25 = v18;
        }
        else {
          char v25 = 1;
        }
        if (v25)
        {

          if (!v23 || v20 || v18 || v21) {
            goto LABEL_23;
          }
        }
        else
        {

          if (!v23 || v21) {
            goto LABEL_23;
          }
        }
        [v26 setAlpha:0.0];
      }
      else
      {
      }
    }
LABEL_23:
    objc_msgSend(v26, "setFrame:", v13, y, width, v12);
    [v26 layoutIfNeeded];
    [v26 setTransitioning:1];
    id v10 = v26;
  }
}

- (void)prepare
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTransitionContextPop;
  [(_UINavigationBarTransitionContext *)&v6 prepare];
  if ((*(_WORD *)&self->super._flags & 0x40) != 0
    && _shouldScaleLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toLargeTitleLayout, self->super._fromContentLayout, 0))
  {
    self->super._int64_t largeTitleTransitionType = 1;
  }
  toLayout = self->super._toLayout;
  if (toLayout) {
    double width = toLayout->_layoutSize.width;
  }
  else {
    double width = 0.0;
  }
  [(UIView *)self->super._navigationBar bounds];
  [(_UINavigationBarLayout *)(uint64_t)self->super._toLayout setLayoutSize:v5];
  [(_UINavigationBarTransitionContextPop *)self _prepareContentView];
  [(_UINavigationBarTransitionContextPop *)self _prepareScaleTransition];
  [(_UINavigationBarTransitionContextPop *)self _prepareLargeTitleView];
  [(_UINavigationBarTransitionContextPop *)self _prepareBackgroundView];
  [(_UINavigationBarTransitionContextPop *)self _prepareSearchBar];
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateScaleTransition
{
  if ((*(_WORD *)&self->super._flags & 0x40) != 0 && self->super._largeTitleTransitionType == 1)
  {
    double height = self->_titleTransitionDistance.height;
    double v4 = self->_titleTransitionDistance.width - self->_titleTransitionAdjustment;
    double v5 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    _updateBackButtonSpacingForButton(v5, 0, v4, height);

    toLargeTitleLayout = self->super._toLargeTitleLayout;
    double v7 = self->super._fromContentLayout;
    double v8 = [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout titleLabel];
    _applyStretchTransformForTitleViewAndBackButtonLayout(5, v8, v7);

    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._toLargeTitleLayout, self->super._fromContentLayout))
    {
      [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout setContentAlpha:0.0];
      unint64_t v9 = [(_UINavigationBarTransitionContext *)self _animationOptions];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke;
      v33[3] = &unk_1E52D9F70;
      v33[4] = self;
      +[UIView animateKeyframesWithDuration:v9 delay:v33 options:0 animations:0.0 completion:0.0];
    }
    uint64_t v10 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    if (v10)
    {
      double v11 = (void *)v10;
      double v12 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];

      if (!v12)
      {
        double v13 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
        int v14 = [v13 visualProvider];
        double v15 = [v14 backIndicatorView];

        [v15 frame];
        uint64_t v19 = v18;
        uint64_t v21 = v20;
        double v22 = -7.0;
        if ((*(_WORD *)&self->super._flags & 2) == 0) {
          double v22 = 7.0;
        }
        double v23 = v16 + v22;
        double v24 = v17 + 5.0;
        unint64_t v25 = [(_UINavigationBarTransitionContext *)self _animationOptions];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_5;
        v27[3] = &unk_1E52DA520;
        id v28 = v15;
        double v29 = v23;
        double v30 = v24;
        uint64_t v31 = v19;
        uint64_t v32 = v21;
        id v26 = v15;
        +[UIView animateKeyframesWithDuration:v25 delay:v27 options:0 animations:0.0 completion:0.0];
      }
    }
  }
}

- (void)_animateContentView
{
  v55[1] = *MEMORY[0x1E4F143B8];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke;
  v54[3] = &unk_1E52DE670;
  v54[4] = self;
  +[UIView _animateInProcessAlongsideTransition:v54];
  double x = self->_endingNewBackButtonFrame.origin.x;
  double y = self->_endingNewBackButtonFrame.origin.y;
  double width = self->_endingNewBackButtonFrame.size.width;
  double height = self->_endingNewBackButtonFrame.size.height;
  double v7 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  double v8 = [v7 visualProvider];
  unint64_t v9 = [v8 contentView];
  objc_msgSend(v9, "setFrame:", x, y, width, height);

  uint64_t v10 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout titleControl];
  [v10 frame];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_3;
  v48[3] = &unk_1E52DE698;
  v48[4] = self;
  uint64_t v50 = v11;
  uint64_t v51 = v12;
  uint64_t v52 = v13;
  uint64_t v53 = v14;
  id v15 = v10;
  id v49 = v15;
  +[UIView _animateInProcessAlongsideTransition:v48];
  if ((*(_WORD *)&self->super._flags & 0x40) == 0 || self->super._largeTitleTransitionType != 1)
  {
    double v16 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    _updateBackButtonSpacingForButton(v16, (*(_WORD *)&self->super._flags >> 1) & 1, fabs(self->_titleTransitionDistance.width), 0.0);

    toContentLayout = self->super._toContentLayout;
    uint64_t v18 = self->super._fromContentLayout;
    uint64_t v19 = [(_UINavigationBarContentViewLayout *)toContentLayout titleControl];
    uint64_t v20 = [v19 titleLabel];
    _applyStretchTransformForTitleViewAndBackButtonLayout(4, v20, v18);
  }
  uint64_t v21 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleControl];
  BOOL v22 = +[UIView _hasInProcessProgressAnimator];
  if (v21) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = 0;
  }
  self->_unfreezeTitleControlOnFinish = v23;
  double v24 = self->super._toContentLayout;
  if (v23)
  {
    v55[0] = v21;
    unint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    [(_UINavigationBarContentViewLayout *)v24 unfreezeExceptViews:v25];
  }
  else
  {
    [(_UINavigationBarContentViewLayout *)self->super._toContentLayout unfreezeExceptViews:0];
  }
  [v21 frame];
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_4;
  v41[3] = &unk_1E52DE698;
  id v34 = v21;
  uint64_t v44 = v27;
  uint64_t v45 = v29;
  uint64_t v46 = v31;
  uint64_t v47 = v33;
  id v42 = v34;
  v43 = self;
  +[UIView _animateInProcessAlongsideTransition:v41];
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  v36 = fromLayout;

  if (v36)
  {
    double v37 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v37 _performNavigationBarTransition:1 willBeDisplayed:0];
  }
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  v39 = toLayout;

  if (v39)
  {
    v40 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v40 _performNavigationBarTransition:1 willBeDisplayed:1];
  }
}

- (void)_animateLargeTitleView
{
  [(UIView *)self->super._largeTitleView bounds];
  double v4 = v3;
  __int16 flags = (__int16)self->super._flags;
  fromLayout = self->super._fromLayout;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (fromLayout)
  {
    [(_UINavigationBarLayout *)fromLayout _layoutFrameFor:fromLayout->_largeTitleLayoutData withOrder:60];
    double v9 = v10;
    double v8 = v11;
  }
  toLayout = self->super._toLayout;
  double v13 = 0.0;
  if (toLayout)
  {
    -[_UINavigationBarLayout _layoutFrameFor:withOrder:](toLayout, "_layoutFrameFor:withOrder:", toLayout->_largeTitleLayoutData, 60, 0.0);
    double v7 = v14;
  }
  double v15 = -v4;
  if ((flags & 2) == 0) {
    double v15 = v4;
  }
  double v16 = v15 - (v13 - v9);
  double v17 = v8 - v7 + 0.0;
  uint64_t v18 = [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout titleLabel];
  [v18 center];
  uint64_t v20 = v19;
  uint64_t v22 = v21;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62___UINavigationBarTransitionContextPop__animateLargeTitleView__block_invoke;
  v23[3] = &unk_1E52DE6E8;
  v23[4] = self;
  *(double *)&v23[5] = v16;
  *(double *)&v23[6] = v17;
  v23[7] = v20;
  v23[8] = v22;
  +[UIView _animateInProcessAlongsideTransition:v23];
}

- (void)_animateBackgroundView
{
  if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
  {
    v30.receiver = self;
    v30.super_class = (Class)_UINavigationBarTransitionContextPop;
    [(_UINavigationBarTransitionContext *)&v30 _animateBackgroundView];
    return;
  }
  __int16 flags = (__int16)self->super._flags;
  if ((flags & 0x200) != 0)
  {
    fromLayout = self->super._fromLayout;
    if (fromLayout) {
      LOBYTE(fromLayout) = fromLayout->_chromelessTransitionProgress == 1.0;
    }
  }
  else
  {
    LOBYTE(fromLayout) = 0;
  }
  toLayout = self->super._toLayout;
  if ((*(_WORD *)&self->super._flags & 0x400) == 0) {
    goto LABEL_13;
  }
  if (!toLayout) {
    goto LABEL_34;
  }
  if (toLayout->_chromelessTransitionProgress != 1.0)
  {
LABEL_13:
    if (toLayout)
    {
      BOOL v6 = (flags & 4) == 0;
      uint64_t v7 = 184;
      if (v6) {
        uint64_t v7 = 192;
      }
      double v8 = *(Class *)((char *)&toLayout->super.isa + v7);
      goto LABEL_17;
    }
LABEL_34:
    double v8 = 0;
LABEL_17:
    id v29 = v8;
    double v9 = self->super._toLayout;
    double computedBackgroundViewAlpha = 0.0;
    double chromelessTransitionProgress = 0.0;
    if (v9) {
      double chromelessTransitionProgress = v9->_chromelessTransitionProgress;
    }
    [v29 setBackgroundTransitionProgress:chromelessTransitionProgress];
    uint64_t v12 = self->super._toLayout;
    if (v12) {
      double computedBackgroundViewAlpha = v12->_computedBackgroundViewAlpha;
    }
    [v29 setBackgroundAlpha:computedBackgroundViewAlpha];
    double MaxX = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    goto LABEL_22;
  }
  if (fromLayout)
  {
    id v29 = 0;
    if ((*(_WORD *)&self->super._flags & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v20 = self->super._fromLayout;
  if (v20)
  {
    BOOL v6 = (flags & 4) == 0;
    uint64_t v21 = 184;
    if (v6) {
      uint64_t v21 = 192;
    }
    uint64_t v22 = *(Class *)((char *)&v20->super.isa + v21);
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v29 = v22;
  double v23 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout);
  CGFloat v27 = v23;
  double v15 = v24;
  double v17 = v25;
  double v19 = v26;
  if ((*(_WORD *)&self->super._flags & 2) != 0)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v23);
    v32.origin.double x = v27;
    v32.origin.double y = v15;
    v32.size.double width = v17;
    v32.size.double height = v19;
    double MaxX = MinX - CGRectGetWidth(v32);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v23);
  }
LABEL_22:
  -[UIView setFrame:](self->super._backgroundView, "setFrame:", MaxX, v15, v17, v19);
  if ((*(_WORD *)&self->super._flags & 0x800) != 0)
  {
LABEL_23:
    [(_UIBarBackground *)self->super._backgroundView setLayout:v29];
    [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
  }
LABEL_24:
  [(UIView *)self->super._backgroundView layoutIfNeeded];
}

- (void)_animateSearchBar
{
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  double v4 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  BOOL v6 = toLayout;
  if (v4 != v6)
  {
    if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke;
      v28[3] = &unk_1E52DC4E8;
      v28[4] = self;
      id v29 = v6;
      +[UIView _animateInProcessAlongsideTransition:v28];
    }
    uint64_t v7 = self->super._fromLayout;
    if (!v7 || !v7->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_2;
      v26[3] = &unk_1E52D9F98;
      v26[4] = self;
      double v8 = v4;
      CGFloat v27 = v8;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_3;
      v24[3] = &unk_1E52D9F70;
      double v9 = v6;
      double v25 = v9;
      [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlapIfNecessaryPartOne:v26 partTwo:v24];
      double v10 = self->super._fromLayout;
      double v11 = self->super._toLayout;
      if (v10) {
        searchBar = v10->_searchBar;
      }
      else {
        searchBar = 0;
      }
      double v13 = searchBar;
      int v14 = [(UISearchBar *)v13 showsScopeBar];

      if (v11) {
        double v15 = v11->_searchBar;
      }
      else {
        double v15 = 0;
      }
      double v16 = v15;

      int v17 = [(UISearchBar *)v16 showsScopeBar];
      if (v14 != v17)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_4;
        v21[3] = &unk_1E52D9F98;
        uint64_t v22 = v8;
        double v23 = v9;
        +[UIView animateKeyframesWithDuration:0 delay:v21 options:0 animations:0.0 completion:0.0];
      }
      if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_7;
        v18[3] = &unk_1E52DC4E8;
        double v19 = v8;
        uint64_t v20 = self;
        +[UIView _animateInProcessAlongsideTransition:v18];
      }
    }
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
  CGFloat v14 = a4.origin.x;
  id v16 = a3;
  id v17 = a5;
  double v18 = v17;
  if (v16 != v17)
  {
    if (!v16)
    {
      id v34 = 0;
      if (v17) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    v44.origin.double x = v14;
    v44.origin.double y = v13;
    v44.size.double width = v12;
    v44.size.double height = v11;
    CGFloat v19 = CGRectGetWidth(v44);
    double v20 = v19;
    if (v18)
    {
      double v21 = v13;
      double v22 = v12;
      double v23 = v11;
      double v11 = CGRectGetHeight(*(CGRect *)&v19);
      v45.origin.double x = x;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      double v24 = CGRectGetHeight(v45);
      if (v11 >= v24) {
        double v11 = v24;
      }
    }
    if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground]) {
      goto LABEL_14;
    }
    toLayout = self->super._toLayout;
    double v26 = self->super._fromLayout;
    CGFloat v27 = toLayout;
    if (v26)
    {
      BOOL v28 = v26->_largeTitleExposure > 0.0;
      bottomPalette = v26->_bottomPalette;
    }
    else
    {
      BOOL v28 = 0;
      bottomPalette = 0;
    }
    objc_super v30 = bottomPalette;

    if (v27)
    {
      BOOL v31 = v27->_largeTitleExposure > 0.0;
      CGRect v32 = v27->_bottomPalette;
    }
    else
    {
      BOOL v31 = 0;
      CGRect v32 = 0;
    }
    uint64_t v33 = v32;

    if (v31 && v33)
    {

LABEL_14:
      id v34 = 0;
      goto LABEL_15;
    }
    if (v33) {
      char v36 = v31;
    }
    else {
      char v36 = 1;
    }
    if (v36)
    {

      id v34 = 0;
      if (!v30 || v28 || v31 || v33) {
        goto LABEL_15;
      }
    }
    else
    {

      id v34 = 0;
      if (!v30 || v28)
      {
LABEL_15:
        [v16 setTransitioning:1];
        objc_msgSend(v16, "setFrame:", v20, v13, v12, v11);
        if (v18)
        {
LABEL_16:
          objc_msgSend(v18, "setFrame:", x, y, width, height);
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2;
          v40 = &unk_1E52D9F70;
          id v41 = v18;
          v35 = _Block_copy(&v37);

LABEL_19:
          -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", v34, v35, v37, v38, v39, v40);

          goto LABEL_20;
        }
LABEL_18:
        v35 = 0;
        goto LABEL_19;
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    id v43 = v16;
    id v34 = _Block_copy(aBlock);

    goto LABEL_15;
  }
LABEL_20:
}

- (void)animate
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  [(_UINavigationBarTransitionContext *)&v3 animate];
  [(_UINavigationBarTransitionContextPop *)self _animateContentView];
  [(_UINavigationBarTransitionContextPop *)self _animateScaleTransition];
  [(_UINavigationBarTransitionContextPop *)self _animateLargeTitleView];
  [(_UINavigationBarTransitionContextPop *)self _animateSearchBar];
  -[_UINavigationBarTransitionContext _animatePalettes](self);
}

- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  uint64_t v7 = a4;
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._fromLayout);
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._toLayout);
  if (v6) {
    double v8 = (void *)v6[20];
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;
  if (v7) {
    double v10 = (void *)v7[20];
  }
  else {
    double v10 = 0;
  }
  id v11 = v10;
  if (v6) {
    double v12 = (void *)v6[21];
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;
  if (v7) {
    CGFloat v14 = (void *)v7[21];
  }
  else {
    CGFloat v14 = 0;
  }
  id v15 = v14;
  id v16 = [v9 augmentedTitleView];
  [v16 _navigationBarTransitionCompleted:1 willBeDisplayed:1];

  id v17 = [v11 augmentedTitleView];
  [v17 _navigationBarTransitionCompleted:1 willBeDisplayed:0];

  double v18 = [v9 titleControl];
  CGFloat v19 = [v18 titleLabel];
  long long v65 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v69[0] = *MEMORY[0x1E4F1DAB8];
  long long v64 = v69[0];
  v69[1] = v65;
  long long v70 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v63 = v70;
  [v19 setTransform:v69];

  double v20 = [v9 backButton];
  double v21 = [v20 visualProvider];
  double v22 = [v21 contentView];
  v68[0] = v64;
  v68[1] = v65;
  v68[2] = v63;
  [v22 setTransform:v68];

  double v23 = [v11 titleControl];
  double v24 = [v23 titleLabel];
  v67[0] = v64;
  v67[1] = v65;
  v67[2] = v63;
  [v24 setTransform:v67];

  double v25 = [v11 backButton];
  double v26 = [v25 visualProvider];
  CGFloat v27 = [v26 contentView];
  v66[0] = v64;
  v66[1] = v65;
  v66[2] = v63;
  [v27 setTransform:v66];

  [v11 setContentHidden:0];
  BOOL v28 = [v11 backButton];
  [v28 setBackButtonMaskEnabled:0];

  [v11 removeContent];
  [v15 removeContent];
  -[_UINavigationBarTransitionContext _removeAllClippingViews]((uint64_t)self);
  [v13 cleanupAfterLayoutTransitionCompleted];
  [v9 cleanupAfterLayoutTransitionCompleted];
  CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_endingNewTitleViewFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_endingNewTitleViewFrame.size = v29;
  [v9 setContentHidden:0];
  objc_super v30 = [v9 backButton];
  [v30 setBackButtonMaskEnabled:0];

  [(UIView *)self->super._largeTitleView setClipsToBounds:1];
  [(UIView *)self->super._contentView setClipsToBounds:1];
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  CGRect v32 = toLayout;
  [(_UINavigationBarLayout *)v32 setAlpha:1.0];

  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  id v34 = fromLayout;
  [(_UINavigationBarLayout *)v34 setAlpha:1.0];

  double v35 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  id v42 = self->super._toLayout;
  if (v42) {
    id v42 = (_UINavigationBarLayout *)v42->_searchBar;
  }
  id v43 = v42;
  -[_UINavigationBarLayout setFrame:](v43, "setFrame:", v35, v37, v39, v41);

  double v44 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._fromLayout->super.isa);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  uint64_t v51 = self->super._fromLayout;
  if (v51) {
    uint64_t v51 = (_UINavigationBarLayout *)v51->_searchBar;
  }
  uint64_t v52 = v51;
  -[_UINavigationBarLayout setFrame:](v52, "setFrame:", v44, v46, v48, v50);

  if (v6)
  {
    uint64_t v53 = 23;
    if ((*(_WORD *)&self->super._flags & 4) == 0) {
      uint64_t v53 = 24;
    }
    v54 = (void *)v6[v53];
  }
  else
  {
    v54 = 0;
  }
  id v55 = v54;
  [v55 setShadowAlpha:1.0];
  [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout unfreeze];
  if (self->_unfreezeTitleControlOnFinish)
  {
    toContentLayout = self->super._toContentLayout;
    v57 = [(_UINavigationBarContentViewLayout *)toContentLayout titleControl];
    v71[0] = v57;
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
    [(_UINavigationBarContentViewLayout *)toContentLayout unfreezeOnlyViews:v58];
  }
  if (v6) {
    v59 = (void *)v6[30];
  }
  else {
    v59 = 0;
  }
  id v60 = v59;
  [v60 _navigationBarSlideTransitionDidEnd];

  if (v7) {
    v61 = (void *)v7[30];
  }
  else {
    v61 = 0;
  }
  id v62 = v61;
  [v62 _navigationBarSlideTransitionDidEnd];
}

- (void)cancel
{
  [(_UINavigationBarTransitionContextPop *)self _finishWithFinalLayout:self->super._fromLayout invalidLayout:self->super._toLayout];
  [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout removeContent];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  [(_UINavigationBarTransitionContext *)&v3 cancel];
}

- (void)complete
{
  [(_UINavigationBarTransitionContextPop *)self _finishWithFinalLayout:self->super._toLayout invalidLayout:self->super._fromLayout];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  [(_UINavigationBarTransitionContext *)&v3 complete];
}

@end