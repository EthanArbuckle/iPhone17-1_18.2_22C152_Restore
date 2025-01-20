@interface _UINavigationBarTransitionContextPush
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

@implementation _UINavigationBarTransitionContextPush

- (int64_t)transition
{
  return 1;
}

- (void)_prepareScaleTransition
{
  if ((*(_WORD *)&self->super._flags & 0x20) != 0 && self->super._largeTitleTransitionType == 1)
  {
    [(UIView *)self->super._largeTitleView setClipsToBounds:0];
    [(UIView *)self->super._contentView setClipsToBounds:0];
    self->_titleTransitionDistance.width = _distanceFromLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toContentLayout, self->super._contentView);
    self->_titleTransitionDistance.height = v3;
    self->_titleTransitionDistance.width = self->_titleTransitionDistance.width
                                         - _titleTransitionAdjustmentFromLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toContentLayout);
    self->_titleTransitionDistanceExcludingLargeTitleOffset = self->_titleTransitionDistance;
    toLayout = self->super._toLayout;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if (toLayout)
    {
      [(_UINavigationBarLayout *)toLayout _layoutFrameFor:toLayout->_largeTitleLayoutData withOrder:60];
      double v7 = v8;
      double v6 = v9;
    }
    fromLayout = self->super._fromLayout;
    double v11 = 0.0;
    if (fromLayout)
    {
      -[_UINavigationBarLayout _layoutFrameFor:withOrder:](fromLayout, "_layoutFrameFor:withOrder:", fromLayout->_largeTitleLayoutData, 60, 0.0);
      double v5 = v12;
    }
    v13 = self->super._toLayout;
    if (v13 && v13->_largeTitleExposure > 0.0)
    {
      CGFloat v14 = v6 - v5 + self->_titleTransitionDistance.height;
      self->_titleTransitionDistance.width = v7 - v11 + self->_titleTransitionDistance.width;
      self->_titleTransitionDistance.height = v14;
    }
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    v16 = self->super._toContentLayout;
    v17 = [(_UINavigationBarLargeTitleViewLayout *)fromLargeTitleLayout titleLabel];
    _applyStretchTransformForTitleViewAndBackButtonLayout(5, v17, v16);

    v18 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
    _updateBackButtonSpacingForButton(v18, 0, self->_titleTransitionDistanceExcludingLargeTitleOffset.width, self->_titleTransitionDistanceExcludingLargeTitleOffset.height);

    v19 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    if (v19)
    {
    }
    else
    {
      v20 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];

      if (v20)
      {
        v21 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
        v22 = [v21 visualProvider];
        v23 = [v22 backIndicatorView];

        [v23 frame];
        self->_endingBackIndicatorViewFrame.origin.x = v24;
        self->_endingBackIndicatorViewFrame.origin.y = v25;
        self->_endingBackIndicatorViewFrame.size.width = v26;
        self->_endingBackIndicatorViewFrame.size.height = v27;
        double v28 = -7.0;
        if ((*(_WORD *)&self->super._flags & 2) == 0) {
          double v28 = 7.0;
        }
        objc_msgSend(v23, "setFrame:", v24 + v28, v25 + 5.0);
        CGAffineTransformMakeScale(&v34, 0.7, 0.7);
        CGAffineTransform v33 = v34;
        [v23 setTransform:&v33];
        [v23 setAlpha:0.0];
      }
    }
    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._fromLargeTitleLayout, self->super._toContentLayout))
    {
      v29 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
      [v29 setAlpha:1.0];

      v30 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
      v31 = [v30 visualProvider];
      v32 = [v31 contentView];
      [v32 setAlpha:0.0];
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
  double v5 = toLayout;
  [(_UINavigationBarContentViewLayout *)toContentLayout setActive:1 contentView:v5];

  [(_UINavigationBarLayout *)self->super._toLayout ensureBackButtonTruncationOccursWithContext:self];
  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  }
  double v7 = fromLayout;

  fromContentLayout = self->super._fromContentLayout;
  if (v7) {
    [(_UINavigationBarContentViewLayout *)fromContentLayout setBackButtonHidden:0 titleLabelHidden:(*(_WORD *)&self->super._flags >> 5) & 1 titleViewHidden:0 barsHidden:0];
  }
  else {
    [(_UINavigationBarContentViewLayout *)fromContentLayout setContentHidden:1];
  }
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout setContentHidden:1];
  [(UIView *)self->super._contentView layoutIfNeeded];
  [(_UINavigationBarContentViewLayout *)self->super._toContentLayout freeze];
  [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout freeze];
  double v9 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
  v10 = [v9 visualProvider];
  double v11 = [v10 contentView];
  [v11 frame];
  self->_endingNewBackButtonFrame.origin.x = v12;
  self->_endingNewBackButtonFrame.origin.y = v13;
  self->_endingNewBackButtonFrame.size.width = v14;
  self->_endingNewBackButtonFrame.size.height = v15;

  v16 = self->super._toLayout;
  if (v16 && (v49 = v16->_contentView) != 0)
  {
    v17 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleControl];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    self->_endingNewTitleViewFrame.origin.x = v24;
    self->_endingNewTitleViewFrame.origin.y = v18;
    self->_endingNewTitleViewFrame.size.width = v20;
    self->_endingNewTitleViewFrame.size.height = v22;
    __int16 flags = (__int16)self->super._flags;
    CGFloat v26 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleViewGuide];
    [v26 layoutFrame];
    if ((flags & 2) != 0)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v27);
      CGAffineTransform v33 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleControl];
      [v33 frame];
      double MaxX = MinX - CGRectGetWidth(v51);
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v27);
    }

    objc_msgSend(v17, "setFrame:", MaxX, v19, v21, v23);
    $91315BD00F435461FFF53ACD9B2AA218 v34 = self->super._flags;
    if ((*(unsigned char *)&v34 & 0x20) == 0 || self->super._largeTitleTransitionType != 1)
    {
      self->_titleTransitionDistance.width = fabs(_distanceFromTitleToBackButton(self->super._fromContentLayout, self->super._toContentLayout, v49, (*(unsigned int *)&v34 >> 1) & 1));
      self->_titleTransitionDistance.height = 0.0;
      v35 = self->super._fromLayout;
      if (v35) {
        v35 = (_UINavigationBarLayout *)v35->_contentView;
      }
      v36 = v35;

      if (v36)
      {
        v37 = self->super._fromContentLayout;
        v38 = self->super._toContentLayout;
        v39 = [(_UINavigationBarContentViewLayout *)v37 titleControl];
        v40 = [v39 titleLabel];
        _applyStretchTransformForTitleViewAndBackButtonLayout(4, v40, v38);
      }
      v41 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
      _updateBackButtonSpacingForButton(v41, (*(_WORD *)&self->super._flags >> 1) & 1, self->_titleTransitionDistance.width, self->_titleTransitionDistance.height);
    }
  }
  else
  {
    v49 = 0;
  }
  v42 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
  [v42 setBackButtonMaskEnabled:1];

  _performAdditionalTitleViewClipping(self, self->super._fromContentLayout, self->super._toContentLayout);
  v43 = self->super._fromLayout;
  if (v43) {
    v43 = (_UINavigationBarLayout *)v43->_contentView;
  }
  v44 = v43;

  if (v44)
  {
    v45 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v45 _navigationBarTransitionWillBegin:0 willBeDisplayed:0];
  }
  v46 = self->super._toLayout;
  if (v46) {
    v46 = (_UINavigationBarLayout *)v46->_contentView;
  }
  v47 = v46;

  if (v47)
  {
    v48 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v48 _navigationBarTransitionWillBegin:0 willBeDisplayed:1];
  }
  [(UIView *)self->super._contentView layoutIfNeeded];
}

- (void)_prepareLargeTitleView
{
  __int16 flags = (__int16)self->super._flags;
  if ((flags & 0x20) == 0)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout setContentHidden:1];
    __int16 flags = (__int16)self->super._flags;
  }
  if ((flags & 0x40) != 0)
  {
    [(UIView *)self->super._largeTitleView bounds];
    __int16 v5 = (__int16)self->super._flags;
    if ((v5 & 2) != 0) {
      double v6 = -v4;
    }
    else {
      double v6 = v4;
    }
    if ((v5 & 0x20) == 0)
    {
      [(UIView *)self->super._largeTitleView bounds];
      if (v8 == *MEMORY[0x1E4F1DB30] && v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        toLayout = self->super._toLayout;
        if (toLayout) {
          [(_UINavigationBarLayout *)toLayout _layoutFrameFor:toLayout->_largeTitleLayoutData withOrder:60];
        }
        -[UIView setFrame:](self->super._largeTitleView, "setFrame:");
      }
    }
    double v11 = self->super._toLayout;
    double v12 = 0.0;
    double v13 = 0.0;
    if (v11)
    {
      [(_UINavigationBarLayout *)v11 _layoutFrameFor:v11->_largeTitleLayoutData withOrder:60];
      double v13 = v14;
    }
    fromLayout = self->super._fromLayout;
    if (fromLayout)
    {
      [(_UINavigationBarLayout *)fromLayout _layoutFrameFor:fromLayout->_largeTitleLayoutData withOrder:60];
      double v12 = v16;
    }
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, v6, v13 - v12);
    if ((*(_WORD *)&self->super._flags & 2) != 0)
    {
      v17 = _slideTransitionFadeMaskImage(1);
      CGFloat v18 = [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout titleLabel];
      [(UIView *)self->super._largeTitleView frame];
      double MaxX = CGRectGetMaxX(v27);
      CGFloat v20 = v18;
      double v21 = v17;
      CGFloat v22 = 0;
    }
    else
    {
      v17 = _slideTransitionFadeMaskImage(0);
      CGFloat v18 = [(_UINavigationBarLargeTitleViewLayout *)self->super._toLargeTitleLayout titleLabel];
      [(UIView *)self->super._largeTitleView frame];
      double MaxX = CGRectGetMaxX(v26);
      CGFloat v20 = v18;
      double v21 = 0;
      CGFloat v22 = v17;
    }
    double v23 = _wrapViewInClippingView(v20, v21, v22, 0.0, MaxX);

    -[_UINavigationBarTransitionContext _addClippingView:]((uint64_t)self, v23);
    toLargeTitleLayout = self->super._toLargeTitleLayout;
    [(_UINavigationBarLargeTitleViewLayout *)toLargeTitleLayout setContentHidden:1];
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
      goto LABEL_26;
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
        double MinX = CGRectGetMinX(*(CGRect *)&v8);
        v28.origin.x = v12;
        v28.origin.y = v13;
        v28.size.width = v14;
        v28.size.height = v15;
        double MaxX = MinX - CGRectGetWidth(v28);
      }
      else
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v8);
      }
      -[UIView setFrame:](self->super._backgroundView, "setFrame:", MaxX, v13, v14, v15);
      CGFloat v18 = self->super._toLayout;
      if (v18)
      {
        uint64_t v19 = 184;
        if ((*(_WORD *)&self->super._flags & 4) == 0) {
          uint64_t v19 = 192;
        }
        CGFloat v18 = *(_UINavigationBarLayout **)((char *)&v18->super.isa + v19);
      }
      CGFloat v20 = v18;
      double v21 = v20;
      CGFloat v22 = self->super._toLayout;
      double computedBackgroundViewAlpha = 0.0;
      double chromelessTransitionProgress = 0.0;
      if (v22) {
        double chromelessTransitionProgress = v22->_chromelessTransitionProgress;
      }
      [(_UINavigationBarLayout *)v20 setBackgroundTransitionProgress:chromelessTransitionProgress];
      double v25 = self->super._toLayout;
      if (v25) {
        double computedBackgroundViewAlpha = v25->_computedBackgroundViewAlpha;
      }
      [(_UINavigationBarLayout *)v21 setBackgroundAlpha:computedBackgroundViewAlpha];
      [(_UINavigationBarLayout *)v21 setShadowAlpha:0.0];
      if ((*(_WORD *)&self->super._flags & 0x800) != 0)
      {
        [(_UIBarBackground *)self->super._backgroundView setLayout:v21];
        [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
      }
      [(UIView *)self->super._backgroundView layoutIfNeeded];
    }
    goto LABEL_26;
  }
LABEL_7:
  int v6 = 0;
  if (v4) {
    goto LABEL_11;
  }
LABEL_26:
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
  double v25 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  __int16 v5 = toLayout;
  if (v25 != v5)
  {
    [(_UINavigationBarLayout *)v25 _navigationBarSlideTransitionWillBegin];
    [(_UINavigationBarLayout *)v5 _navigationBarSlideTransitionWillBegin];
    int v6 = self->super._toLayout;
    if (v6 && v6->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      [(_UINavigationBarLayout *)v25 setAlpha:0.0];
      [(_UINavigationBarLayout *)v5 setAlpha:1.0];
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._fromLayout->super.isa));
      [(_UINavigationBarLayout *)v5 layoutIfNeeded];
    }
    else
    {
      if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(self->super._fromLayout, v6, 1, 0) & 1) != 0
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
      double v16 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
      {
        BOOL v23 = [(_UINavigationBarTransitionContext *)self isRTL];
        v27.origin.x = v16;
        v27.origin.y = v18;
        v27.size.width = v20;
        v27.size.height = v22;
        double Width = CGRectGetWidth(v27);
        if (v23) {
          double Width = -Width;
        }
        double v16 = v16 + Width;
      }
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v16, v18, v20, v22);
    }
    [(_UINavigationBarLayout *)v5 layoutIfNeeded];
    [(_UINavigationBarLayout *)v25 layoutIfNeeded];
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
    double v13 = x + CGRectGetWidth(v28);
    if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
    {
      fromLayout = self->super._fromLayout;
      toLayout = self->super._toLayout;
      double v16 = fromLayout;
      double v17 = toLayout;
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
      BOOL v23 = v22;

      if (v23 && v21)
      {
        if (v20) {
          char v24 = 1;
        }
        else {
          char v24 = v18;
        }
        goto LABEL_21;
      }
      if (v23) {
        char v25 = v21;
      }
      else {
        char v25 = 1;
      }
      if ((v25 & 1) == 0)
      {
        if (v20) {
          char v24 = v18;
        }
        else {
          char v24 = 0;
        }
LABEL_21:

        if ((v24 & 1) == 0) {
          [v26 setAlpha:0.0];
        }
        goto LABEL_23;
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
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  [(_UINavigationBarTransitionContext *)&v3 prepare];
  if ((*(_WORD *)&self->super._flags & 0x20) != 0
    && _shouldScaleLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toLargeTitleLayout, self->super._toContentLayout, 1))
  {
    self->super._largeTitleTransitionType = 1;
  }
  [(_UINavigationBarTransitionContextPush *)self _prepareContentView];
  [(_UINavigationBarTransitionContextPush *)self _prepareScaleTransition];
  [(_UINavigationBarTransitionContextPush *)self _prepareLargeTitleView];
  [(_UINavigationBarTransitionContextPush *)self _prepareBackgroundView];
  [(_UINavigationBarTransitionContextPush *)self _prepareSearchBar];
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateScaleTransition
{
  if ((*(_WORD *)&self->super._flags & 0x20) != 0 && self->super._largeTitleTransitionType == 1)
  {
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    int v4 = self->super._toContentLayout;
    __int16 v5 = [(_UINavigationBarLargeTitleViewLayout *)fromLargeTitleLayout titleLabel];
    _applyStretchTransformForTitleViewAndBackButtonLayout(2, v5, v4);

    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._fromLargeTitleLayout, self->super._toContentLayout))
    {
      unint64_t v6 = [(_UINavigationBarTransitionContext *)self _animationOptions];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke;
      v16[3] = &unk_1E52D9F70;
      v16[4] = self;
      +[UIView animateKeyframesWithDuration:v6 delay:v16 options:0 animations:0.0 completion:0.0];
    }
    id v7 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    if (!v7)
    {
      double v8 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];

      if (!v8) {
        return;
      }
      double v9 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout backButton];
      id v10 = [v9 visualProvider];
      double v11 = [v10 backIndicatorView];

      unint64_t v12 = [(_UINavigationBarTransitionContext *)self _animationOptions];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_4;
      v13[3] = &unk_1E52D9F98;
      id v14 = v11;
      double v15 = self;
      id v7 = v11;
      +[UIView animateKeyframesWithDuration:v12 delay:v13 options:0 animations:0.0 completion:0.0];
    }
  }
}

- (void)_animateContentView
{
  v62[1] = *MEMORY[0x1E4F143B8];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke;
  v61[3] = &unk_1E52DE670;
  v61[4] = self;
  +[UIView _animateInProcessAlongsideTransition:v61];
  toContentLayout = self->super._toContentLayout;
  if (toContentLayout)
  {
    double x = self->_endingNewBackButtonFrame.origin.x;
    double y = self->_endingNewBackButtonFrame.origin.y;
    double width = self->_endingNewBackButtonFrame.size.width;
    double height = self->_endingNewBackButtonFrame.size.height;
    double v8 = [(_UINavigationBarContentViewLayout *)toContentLayout backButton];
    double v9 = [v8 visualProvider];
    id v10 = [v9 contentView];
    objc_msgSend(v10, "setFrame:", x, y, width, height);
  }
  fromContentLayout = self->super._fromContentLayout;
  if (fromContentLayout)
  {
    unint64_t v12 = [(_UINavigationBarContentViewLayout *)fromContentLayout backButton];
    double v13 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout backButton];
    [v13 frame];
    CGFloat v14 = CGRectGetWidth(v63);
    _updateBackButtonSpacingForButton(v12, (*(_WORD *)&self->super._flags >> 1) & 1, -v14, 0.0);
  }
  double v15 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout titleControl];
  BOOL v16 = +[UIView _hasInProcessProgressAnimator];
  if (v15) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }
  self->_unfreezeTitleControlOnFinish = v17;
  BOOL v18 = self->super._toContentLayout;
  if (v17)
  {
    v62[0] = v15;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    [(_UINavigationBarContentViewLayout *)v18 unfreezeExceptViews:v19];
  }
  else
  {
    [(_UINavigationBarContentViewLayout *)self->super._toContentLayout unfreezeExceptViews:0];
  }
  fromLayout = self->super._fromLayout;
  if (fromLayout)
  {
    BOOL v21 = fromLayout->_contentView;
    if (v21)
    {
      if ((*(_WORD *)&self->super._flags & 0x20) != 0)
      {
        int64_t largeTitleTransitionType = self->super._largeTitleTransitionType;

        if (largeTitleTransitionType == 1) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      BOOL v23 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout titleControl];
      [v23 frame];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_3;
      v55[3] = &unk_1E52DE698;
      uint64_t v57 = v24;
      uint64_t v58 = v25;
      uint64_t v59 = v26;
      uint64_t v60 = v27;
      v55[4] = self;
      id v56 = v23;
      id v28 = v23;
      +[UIView _animateInProcessAlongsideTransition:v55];
      v29 = self->super._fromContentLayout;
      v30 = self->super._toContentLayout;
      v31 = [(_UINavigationBarContentViewLayout *)v29 titleControl];
      v32 = [v31 titleLabel];
      _applyStretchTransformForTitleViewAndBackButtonLayout(1, v32, v30);
    }
  }
LABEL_17:
  [v15 frame];
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_4;
  v48[3] = &unk_1E52DE698;
  id v41 = v15;
  uint64_t v51 = v34;
  uint64_t v52 = v36;
  uint64_t v53 = v38;
  uint64_t v54 = v40;
  id v49 = v41;
  v50 = self;
  +[UIView _animateInProcessAlongsideTransition:v48];
  v42 = self->super._fromLayout;
  if (v42) {
    v42 = (_UINavigationBarLayout *)v42->_contentView;
  }
  v43 = v42;

  if (v43)
  {
    v44 = [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout augmentedTitleView];
    [v44 _performNavigationBarTransition:0 willBeDisplayed:0];
  }
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  }
  v46 = toLayout;

  if (v46)
  {
    v47 = [(_UINavigationBarContentViewLayout *)self->super._toContentLayout augmentedTitleView];
    [v47 _performNavigationBarTransition:0 willBeDisplayed:1];
  }
}

- (void)_animateLargeTitleView
{
  [(UIView *)self->super._largeTitleView bounds];
  if ((*(_WORD *)&self->super._flags & 2) != 0) {
    double v4 = v3;
  }
  else {
    double v4 = -v3;
  }
  __int16 v5 = [(_UINavigationBarLargeTitleViewLayout *)self->super._fromLargeTitleLayout titleLabel];
  [v5 center];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke;
  v10[3] = &unk_1E52DE6C0;
  v10[4] = self;
  *(double *)&v10[5] = v4;
  v10[6] = v7;
  v10[7] = v9;
  +[UIView _animateInProcessAlongsideTransition:v10];
}

- (void)_animateBackgroundView
{
  if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
  {
    v28.receiver = self;
    v28.super_class = (Class)_UINavigationBarTransitionContextPush;
    [(_UINavigationBarTransitionContext *)&v28 _animateBackgroundView];
    return;
  }
  __int16 flags = (__int16)self->super._flags;
  if ((flags & 0x200) != 0)
  {
    fromLayout = self->super._fromLayout;
    if (fromLayout) {
      LODWORD(fromLayout) = fromLayout->_chromelessTransitionProgress == 1.0;
    }
  }
  else
  {
    LODWORD(fromLayout) = 0;
  }
  if ((*(_WORD *)&self->super._flags & 0x400) != 0)
  {
    toLayout = self->super._toLayout;
    if (toLayout) {
      LODWORD(toLayout) = toLayout->_chromelessTransitionProgress == 1.0;
    }
  }
  else
  {
    LODWORD(toLayout) = 0;
  }
  if ((fromLayout | toLayout))
  {
    if ((fromLayout | toLayout ^ 1))
    {
      if ((fromLayout ^ 1 | toLayout)) {
        return;
      }
      double MaxX = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
      backgroundView = self->super._backgroundView;
    }
    else
    {
      double v18 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout);
      CGFloat v22 = v18;
      CGFloat v23 = v19;
      CGFloat v24 = v20;
      CGFloat v25 = v21;
      if ((flags & 2) != 0)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v18);
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v18);
        v30.origin.double x = v22;
        v30.origin.double y = v23;
        v30.size.double width = v24;
        v30.size.double height = v25;
        double MaxX = MinX - CGRectGetWidth(v30);
      }
      backgroundView = self->super._backgroundView;
      double v7 = v23;
      double v8 = v24;
      double v9 = v25;
    }
    -[UIView setFrame:](backgroundView, "setFrame:", MaxX, v7, v8, v9);
  }
  else
  {
    -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
    double v11 = self->super._toLayout;
    if (v11)
    {
      uint64_t v12 = 184;
      if ((*(_WORD *)&self->super._flags & 4) == 0) {
        uint64_t v12 = 192;
      }
      double v11 = *(_UINavigationBarLayout **)((char *)&v11->super.isa + v12);
    }
    double v13 = v11;
    CGFloat v14 = self->super._toLayout;
    double computedBackgroundViewAlpha = 0.0;
    double chromelessTransitionProgress = 0.0;
    if (v14) {
      double chromelessTransitionProgress = v14->_chromelessTransitionProgress;
    }
    uint64_t v27 = v13;
    [(_UINavigationBarLayout *)v13 setBackgroundTransitionProgress:chromelessTransitionProgress];
    BOOL v17 = self->super._toLayout;
    if (v17) {
      double computedBackgroundViewAlpha = v17->_computedBackgroundViewAlpha;
    }
    [(_UINavigationBarLayout *)v27 setBackgroundAlpha:computedBackgroundViewAlpha];
    [(_UINavigationBarLayout *)v27 setShadowAlpha:1.0];
    if ((*(_WORD *)&self->super._flags & 0x800) != 0)
    {
      [(_UIBarBackground *)self->super._backgroundView setLayout:v27];
      [(_UIBarBackground *)self->super._backgroundView transitionBackgroundViews];
    }
  }
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
  uint64_t v6 = toLayout;
  if (v4 != v6)
  {
    if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke;
      v30[3] = &unk_1E52DC4E8;
      v30[4] = self;
      v31 = v6;
      +[UIView _animateInProcessAlongsideTransition:v30];
    }
    double v7 = self->super._toLayout;
    if (!v7 || !v7->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_2;
      v28[3] = &unk_1E52D9F98;
      v28[4] = self;
      double v8 = v4;
      v29 = v8;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_3;
      v26[3] = &unk_1E52D9F70;
      double v9 = v6;
      uint64_t v27 = v9;
      [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlapIfNecessaryPartOne:v28 partTwo:v26];
      id v10 = self->super._fromLayout;
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
      BOOL v16 = v15;

      int v17 = [(UISearchBar *)v16 showsScopeBar];
      if (v14 != v17)
      {
        double v18 = [(_UINavigationBarLayout *)v8 _scopeBar];
        double v19 = [(_UINavigationBarLayout *)v9 _scopeBar];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_4;
        v23[3] = &unk_1E52D9F98;
        CGFloat v24 = v8;
        CGFloat v25 = v9;
        +[UIView animateKeyframesWithDuration:0 delay:v23 options:0 animations:0.0 completion:0.0];
      }
      if ([(_UINavigationBarTransitionContext *)self shouldSlideBarBackground])
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_7;
        v20[3] = &unk_1E52DC4E8;
        double v21 = v8;
        CGFloat v22 = self;
        +[UIView _animateInProcessAlongsideTransition:v20];
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
      v32 = 0;
      if (v17)
      {
LABEL_29:
        objc_msgSend(v18, "setFrame:", x, y, width, height);
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        uint64_t v37 = __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2;
        uint64_t v38 = &unk_1E52D9F70;
        id v39 = v18;
        uint64_t v33 = _Block_copy(&v35);

        goto LABEL_30;
      }
LABEL_17:
      uint64_t v33 = 0;
LABEL_30:
      -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", v32, v33, v35, v36, v37, v38);

      goto LABEL_31;
    }
    v42.origin.double x = v14;
    v42.origin.double y = v13;
    v42.size.double width = v12;
    v42.size.double height = v11;
    double v19 = CGRectGetWidth(v42);
    double v20 = -v19;
    if (v18)
    {
      v43.origin.double x = -v19;
      v43.origin.double y = v13;
      v43.size.double width = v12;
      v43.size.double height = v11;
      double v11 = CGRectGetHeight(v43);
      v44.origin.double x = x;
      v44.origin.double y = y;
      v44.size.double width = width;
      v44.size.double height = height;
      double v21 = CGRectGetHeight(v44);
      if (v11 >= v21) {
        double v11 = v21;
      }
    }
    if (![(_UINavigationBarTransitionContext *)self shouldSlideBarBackground]) {
      goto LABEL_27;
    }
    toLayout = self->super._toLayout;
    CGFloat v23 = self->super._fromLayout;
    CGFloat v24 = toLayout;
    if (v23)
    {
      BOOL v25 = v23->_largeTitleExposure > 0.0;
      bottomPalette = v23->_bottomPalette;
    }
    else
    {
      BOOL v25 = 0;
      bottomPalette = 0;
    }
    uint64_t v27 = bottomPalette;

    if (v24)
    {
      BOOL v28 = v24->_largeTitleExposure > 0.0;
      v29 = v24->_bottomPalette;
    }
    else
    {
      BOOL v28 = 0;
      v29 = 0;
    }
    CGRect v30 = v29;

    if (!v27 || !v25)
    {
      if (v27) {
        char v34 = v25;
      }
      else {
        char v34 = 1;
      }
      if (v34)
      {

        goto LABEL_27;
      }
      if (v30) {
        char v31 = v28;
      }
      else {
        char v31 = 0;
      }
    }
    else if (v30)
    {
      char v31 = 1;
    }
    else
    {
      char v31 = v28;
    }

    if ((v31 & 1) == 0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v41 = v16;
      v32 = _Block_copy(aBlock);

LABEL_28:
      [v16 setTransitioning:1];
      objc_msgSend(v16, "setFrame:", v20, v13, v12, v11);
      if (v18) {
        goto LABEL_29;
      }
      goto LABEL_17;
    }
LABEL_27:
    v32 = 0;
    goto LABEL_28;
  }
LABEL_31:
}

- (void)animate
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  [(_UINavigationBarTransitionContext *)&v3 animate];
  [(_UINavigationBarTransitionContextPush *)self _animateContentView];
  [(_UINavigationBarTransitionContextPush *)self _animateScaleTransition];
  [(_UINavigationBarTransitionContextPush *)self _animateLargeTitleView];
  [(_UINavigationBarTransitionContextPush *)self _animateSearchBar];
  -[_UINavigationBarTransitionContext _animatePalettes](self);
}

- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  double v7 = a4;
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
    id v10 = (void *)v7[20];
  }
  else {
    id v10 = 0;
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
  [v16 _navigationBarTransitionCompleted:0 willBeDisplayed:1];

  id v17 = [v11 augmentedTitleView];
  [v17 _navigationBarTransitionCompleted:0 willBeDisplayed:0];

  double v18 = [v13 titleLabel];
  long long v67 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v73[0] = *MEMORY[0x1E4F1DAB8];
  long long v66 = v73[0];
  v73[1] = v67;
  long long v74 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v65 = v74;
  [v18 setTransform:v73];

  double v19 = [v9 titleControl];
  double v20 = [v19 titleLabel];
  v72[0] = v66;
  v72[1] = v67;
  v72[2] = v65;
  [v20 setTransform:v72];

  double v21 = [v9 backButton];
  CGFloat v22 = [v21 visualProvider];
  CGFloat v23 = [v22 contentView];
  v71[0] = v66;
  v71[1] = v67;
  v71[2] = v65;
  [v23 setTransform:v71];

  CGFloat v24 = [v15 titleLabel];
  v70[0] = v66;
  v70[1] = v67;
  v70[2] = v65;
  [v24 setTransform:v70];

  BOOL v25 = [v11 titleControl];
  uint64_t v26 = [v25 titleLabel];
  v69[0] = v66;
  v69[1] = v67;
  v69[2] = v65;
  [v26 setTransform:v69];

  uint64_t v27 = [v11 backButton];
  BOOL v28 = [v27 visualProvider];
  v29 = [v28 contentView];
  v68[0] = v66;
  v68[1] = v67;
  v68[2] = v65;
  [v29 setTransform:v68];

  [v11 setContentHidden:0];
  CGRect v30 = [v11 backButton];
  [v30 setBackButtonMaskEnabled:0];

  [v11 removeContent];
  [v15 removeContent];
  -[_UINavigationBarTransitionContext _removeAllClippingViews]((uint64_t)self);
  [v13 cleanupAfterLayoutTransitionCompleted];
  [v9 cleanupAfterLayoutTransitionCompleted];
  CGSize v31 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_endingNewTitleViewFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_endingNewTitleViewFrame.size = v31;
  [v9 setContentHidden:0];
  v32 = [v9 backButton];
  [v32 setBackButtonMaskEnabled:0];

  [(UIView *)self->super._largeTitleView setClipsToBounds:1];
  [(UIView *)self->super._contentView setClipsToBounds:1];
  toLayout = self->super._toLayout;
  if (toLayout) {
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  }
  char v34 = toLayout;
  [(_UINavigationBarLayout *)v34 setAlpha:1.0];

  fromLayout = self->super._fromLayout;
  if (fromLayout) {
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  }
  uint64_t v36 = fromLayout;
  [(_UINavigationBarLayout *)v36 setAlpha:1.0];

  double v37 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._toLayout->super.isa);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  CGRect v44 = self->super._toLayout;
  if (v44) {
    CGRect v44 = (_UINavigationBarLayout *)v44->_searchBar;
  }
  v45 = v44;
  -[_UINavigationBarLayout setFrame:](v45, "setFrame:", v37, v39, v41, v43);

  double v46 = -[_UINavigationBarLayout searchBarLayoutFrame](&self->super._fromLayout->super.isa);
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  uint64_t v53 = self->super._fromLayout;
  if (v53) {
    uint64_t v53 = (_UINavigationBarLayout *)v53->_searchBar;
  }
  uint64_t v54 = v53;
  -[_UINavigationBarLayout setFrame:](v54, "setFrame:", v46, v48, v50, v52);

  if (v6)
  {
    uint64_t v55 = 23;
    if ((*(_WORD *)&self->super._flags & 4) == 0) {
      uint64_t v55 = 24;
    }
    id v56 = (void *)v6[v55];
  }
  else
  {
    id v56 = 0;
  }
  id v57 = v56;
  [v57 setShadowAlpha:1.0];
  [(_UINavigationBarContentViewLayout *)self->super._fromContentLayout unfreeze];
  if (self->_unfreezeTitleControlOnFinish)
  {
    toContentLayout = self->super._toContentLayout;
    uint64_t v59 = [(_UINavigationBarContentViewLayout *)toContentLayout titleControl];
    v75[0] = v59;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    [(_UINavigationBarContentViewLayout *)toContentLayout unfreezeOnlyViews:v60];
  }
  if (v6) {
    v61 = (void *)v6[30];
  }
  else {
    v61 = 0;
  }
  id v62 = v61;
  [v62 _navigationBarSlideTransitionDidEnd];

  if (v7) {
    CGRect v63 = (void *)v7[30];
  }
  else {
    CGRect v63 = 0;
  }
  id v64 = v63;
  [v64 _navigationBarSlideTransitionDidEnd];
}

- (void)cancel
{
  [(_UINavigationBarTransitionContextPush *)self _finishWithFinalLayout:self->super._fromLayout invalidLayout:self->super._toLayout];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  [(_UINavigationBarTransitionContext *)&v3 cancel];
}

- (void)complete
{
  [(_UINavigationBarTransitionContextPush *)self _finishWithFinalLayout:self->super._toLayout invalidLayout:self->super._fromLayout];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  [(_UINavigationBarTransitionContext *)&v3 complete];
}

@end