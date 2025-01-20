@interface SiriSharedUIContentPlatterView
- (BOOL)_hasFakeNavigationBarBackground;
- (BOOL)_hasScrollViewStickyHeader;
- (BOOL)_platterNeedsLayout;
- (BOOL)_shouldAllowDismissalWhenScrollable;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)allowAutomaticContentViewsScaling;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)isNextLevelCard;
- (BOOL)isScrollEnabled;
- (CGPoint)_contentOffsetForScrollView:(id)a3;
- (CGSize)_contentSizeForScrollView:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)contentViews;
- (PLPlatterView)platterView;
- (SiriSharedUIContentPlatterDarkenMaskView)_darkenMaskView;
- (SiriSharedUIContentPlatterScrollView)_scrollView;
- (SiriSharedUIContentPlatterView)initWithFrame:(CGRect)a3;
- (SiriSharedUIContentPlatterViewDelegate)delegate;
- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer;
- (SiriSharedUIStandardView)_contentHostingView;
- (UIEdgeInsets)_adjustedContentInsetForScrollView:(id)a3;
- (UIEdgeInsets)contentInsets;
- (double)_cornerRadiusForPlatter;
- (double)_currentContentOffset;
- (double)darkenIntensity;
- (double)heightForContentSeparators;
- (void)_animateScrollViewStickyHeaderIfNeededGivenCurrentContentOffset:(double)a3 contentOffsetWhenScrolledToTop:(double)a4;
- (void)_setCurrentContentOffset:(double)a3;
- (void)_setPlatterNeedsLayout:(BOOL)a3;
- (void)_setShouldAllowDismissalWhileScrollable:(BOOL)a3;
- (void)_updateContentFullyScrolled;
- (void)_updateContentScale;
- (void)_updateContentViewTransformationForAmbientUpdate;
- (void)layoutSubviews;
- (void)prepareForDrillInAnimation;
- (void)prepareForPopAnimationOfType:(int64_t)a3;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentHostingView:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentViews:(id)a3;
- (void)setDarkenIntensity:(double)a3;
- (void)setDarkenMaskView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalGestureRecognizer:(id)a3;
- (void)setFakeNavigationBarBackgroundHidden:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setIsNextLevelCard:(BOOL)a3;
- (void)setMinimumScrollViewBottomInset:(double)a3;
- (void)setNeedsLayout;
- (void)setPlatterView:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollView:(id)a3;
@end

@implementation SiriSharedUIContentPlatterView

- (SiriSharedUIContentPlatterView)initWithFrame:(CGRect)a3
{
  v38.receiver = self;
  v38.super_class = (Class)SiriSharedUIContentPlatterView;
  v3 = -[SiriSharedUIContentPlatterView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SiriSharedUIContentPlatterScrollView);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    [(SiriSharedUIContentPlatterScrollView *)v3->_scrollView setDelegate:v3];
    [(SiriSharedUIContentPlatterScrollView *)v3->_scrollView setPlatterDelegate:v3];
    v3->_supportsSAE = [MEMORY[0x263F286B8] isSAEEnabled];
    v3->_minimumScrollViewBottomInset = 0.0;
    [(SiriSharedUIContentPlatterScrollView *)v3->_scrollView setKeyboardDismissMode:2];
    if ([(SiriSharedUIContentPlatterView *)v3 _hasScrollViewStickyHeader])
    {
      v3->_showingScrollViewStickyHeader = 0;
      uint64_t v6 = [MEMORY[0x263F82E38] behaviorWithDampingRatio:0.75 response:0.62832];
      scrollViewStickyHeaderSpringAnimationBehavior = v3->_scrollViewStickyHeaderSpringAnimationBehavior;
      v3->_scrollViewStickyHeaderSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v6;

      v8 = objc_alloc_init(SiriSharedUITouchPassthroughView);
      scrollViewStickyHeaderContainerView = v3->_scrollViewStickyHeaderContainerView;
      v3->_scrollViewStickyHeaderContainerView = v8;

      [(SiriSharedUITouchPassthroughView *)v3->_scrollViewStickyHeaderContainerView setClipsToBounds:0];
      [(SiriSharedUITouchPassthroughView *)v3->_scrollViewStickyHeaderContainerView setAlpha:0.0];
      uint64_t v10 = +[SiriSharedUIGradientView verticalBlackToClear];
      scrollViewStickyHeaderDimmingGradientView = v3->_scrollViewStickyHeaderDimmingGradientView;
      v3->_scrollViewStickyHeaderDimmingGradientView = (_TtC12SiriSharedUI24SiriSharedUIGradientView *)v10;

      [(SiriSharedUIGradientView *)v3->_scrollViewStickyHeaderDimmingGradientView setAlpha:0.3];
      [(SiriSharedUITouchPassthroughView *)v3->_scrollViewStickyHeaderContainerView addSubview:v3->_scrollViewStickyHeaderDimmingGradientView];
      v12 = [[_TtC12SiriSharedUI28SiriSharedUIVariableBlurView alloc] initWithMaskImageName:@"SAEScrollViewStickyHeaderVariableBlurViewMask"];
      scrollViewStickyHeaderBlurView = v3->_scrollViewStickyHeaderBlurView;
      v3->_scrollViewStickyHeaderBlurView = v12;

      [(SiriSharedUIVariableBlurView *)v3->_scrollViewStickyHeaderBlurView setAlpha:1.0];
      [(SiriSharedUITouchPassthroughView *)v3->_scrollViewStickyHeaderContainerView addSubview:v3->_scrollViewStickyHeaderBlurView];
      [(SiriSharedUIContentPlatterView *)v3 addSubview:v3->_scrollViewStickyHeaderContainerView];
    }
    if ([(SiriSharedUIContentPlatterView *)v3 _hasFakeNavigationBarBackground])
    {
      id v14 = objc_alloc(MEMORY[0x263F82E50]);
      v15 = [MEMORY[0x263F824D8] effectWithStyle:8];
      uint64_t v16 = [v14 initWithEffect:v15];
      fakeNavigationBarBackgroundView = v3->_fakeNavigationBarBackgroundView;
      v3->_fakeNavigationBarBackgroundView = (UIVisualEffectView *)v16;

      [(UIVisualEffectView *)v3->_fakeNavigationBarBackgroundView setHidden:1];
      [(SiriSharedUIContentPlatterView *)v3 addSubview:v3->_fakeNavigationBarBackgroundView];
      v3->_ignoreSafeAreaInsetChanges = 0;
    }
    v3->_reducedOrbOpacity = 0;
    v18 = objc_alloc_init(SiriSharedUIContentPlatterDarkenMaskView);
    darkenMaskView = v3->_darkenMaskView;
    v3->_darkenMaskView = v18;

    v20 = [SiriSharedUIStandardView alloc];
    uint64_t v21 = -[SiriSharedUIStandardView initWithFrame:](v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    contentHostingView = v3->_contentHostingView;
    v3->_contentHostingView = (SiriSharedUIStandardView *)v21;

    uint64_t v23 = [MEMORY[0x263F5E700] platterViewWithBlurEffectStyle:9];
    platterView = v3->_platterView;
    v3->_platterView = (PLPlatterView *)v23;

    v25 = v3->_platterView;
    [(SiriSharedUIContentPlatterView *)v3 _cornerRadiusForPlatter];
    -[PLPlatterView _setContinuousCornerRadius:](v25, "_setContinuousCornerRadius:");
    v26 = [(SiriSharedUIContentPlatterView *)v3 platterView];
    [(SiriSharedUIContentPlatterView *)v3 addSubview:v26];

    v27 = [(SiriSharedUIContentPlatterView *)v3 _contentHostingView];
    [(SiriSharedUIContentPlatterView *)v3 addSubview:v27];

    v28 = v3->_contentHostingView;
    v29 = [(SiriSharedUIContentPlatterView *)v3 _scrollView];
    [(SiriSharedUIStandardView *)v28 addSubview:v29];

    v30 = v3->_scrollView;
    [(PLPlatterView *)v3->_platterView _continuousCornerRadius];
    -[SiriSharedUIContentPlatterScrollView _setContinuousCornerRadius:](v30, "_setContinuousCornerRadius:");
    v31 = v3->_darkenMaskView;
    [(PLPlatterView *)v3->_platterView _continuousCornerRadius];
    -[SiriSharedUIContentPlatterDarkenMaskView _setContinuousCornerRadius:](v31, "_setContinuousCornerRadius:");
    v32 = [(PLPlatterView *)v3->_platterView customContentView];
    [v32 addSubview:v3->_darkenMaskView];

    v33 = [(SiriSharedUIContentPlatterView *)v3 _scrollView];
    v34 = [MEMORY[0x263F825C8] clearColor];
    [v33 setBackgroundColor:v34];

    v35 = [(SiriSharedUIContentPlatterView *)v3 _scrollView];
    [v35 setShowsVerticalScrollIndicator:0];

    v36 = [(SiriSharedUIContentPlatterView *)v3 _scrollView];
    [v36 setContentInsetAdjustmentBehavior:2];

    [(SiriSharedUIContentPlatterView *)v3 setScrollEnabled:1];
    if ([(SiriSharedUIContentPlatterView *)v3 _hasScrollViewStickyHeader]) {
      [(SiriSharedUIContentPlatterView *)v3 bringSubviewToFront:v3->_scrollViewStickyHeaderContainerView];
    }
    if ([(SiriSharedUIContentPlatterView *)v3 _hasFakeNavigationBarBackground]) {
      [(SiriSharedUIContentPlatterView *)v3 bringSubviewToFront:v3->_fakeNavigationBarBackgroundView];
    }
  }
  return v3;
}

- (double)_cornerRadiusForPlatter
{
  if (!SiriSharedUIDeviceIsPad() || !self->_supportsSAE) {
    return 23.5;
  }
  v3 = [MEMORY[0x263F82B60] mainScreen];
  v4 = [v3 traitCollection];
  [v4 displayCornerRadius];
  double v6 = v5;

  return v6;
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 layer];
  [(SiriSharedUIContentPlatterView *)self _cornerRadiusForPlatter];
  objc_msgSend(v5, "setCornerRadius:");

  [(PLPlatterView *)self->_platterView setBackgroundView:v4];
  scrollView = self->_scrollView;
  [(PLPlatterView *)self->_platterView _continuousCornerRadius];
  -[SiriSharedUIContentPlatterScrollView _setContinuousCornerRadius:](scrollView, "_setContinuousCornerRadius:");
  darkenMaskView = self->_darkenMaskView;
  [(PLPlatterView *)self->_platterView _continuousCornerRadius];
  -[SiriSharedUIContentPlatterDarkenMaskView _setContinuousCornerRadius:](darkenMaskView, "_setContinuousCornerRadius:");
  [(SiriSharedUIContentPlatterView *)self setNeedsLayout];
}

- (void)setNeedsLayout
{
  [(SiriSharedUIContentPlatterView *)self _setPlatterNeedsLayout:1];
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIContentPlatterView;
  [(SiriSharedUIContentPlatterView *)&v3 setNeedsLayout];
  [(SiriSharedUIContentPlatterView *)self _updateContentScale];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriSharedUIContentPlatterView;
    BOOL v5 = [(SiriSharedUIContentPlatterView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_updateContentScale
{
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity) {
      objc_super v3 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      objc_super v3 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v4 = *(double *)v3;
    BOOL v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 scale];
    double v7 = v4 * v6;

    contentHostingView = self->_contentHostingView;
    +[SiriSharedUIContentScaleFactorUtility siriSharedUIApplyContentScale:contentHostingView toView:v7];
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      [(PLPlatterView *)self->_platterView removeFromSuperview];
      [(SiriSharedUIContentPlatterView *)self setScrollEnabled:self->_isNextLevelCard];
      BOOL isNextLevelCard = self->_isNextLevelCard;
    }
    else
    {
      [(SiriSharedUIContentPlatterView *)self insertSubview:self->_platterView belowSubview:self->_contentHostingView];
      BOOL isNextLevelCard = 1;
      [(SiriSharedUIContentPlatterView *)self setScrollEnabled:1];
    }
    [(SiriSharedUIContentPlatterScrollView *)self->_scrollView setBounces:isNextLevelCard];
    [(SiriSharedUIContentPlatterView *)self _updateContentViewTransformationForAmbientUpdate];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivity = a3;
  id v4 = [(SiriSharedUIContentPlatterView *)self _scrollView];
  [v4 setIsInAmbientInteractivity:self->_isInAmbientInteractivity];
}

- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3
{
  if (self->_allowAutomaticContentViewsScaling != a3)
  {
    self->_allowAutomaticContentViewsScaling = a3;
    [(SiriSharedUIContentPlatterView *)self _updateContentViewTransformationForAmbientUpdate];
  }
}

- (void)_updateContentViewTransformationForAmbientUpdate
{
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity) {
      v2 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      v2 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    contentHostingView = self->_contentHostingView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    id v4 = &v10;
    BOOL v5 = contentHostingView;
  }
  else
  {
    BOOL v5 = self->_contentHostingView;
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v7 = *MEMORY[0x263F000D0];
    long long v8 = v6;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    id v4 = (CGAffineTransform *)&v7;
  }
  -[SiriSharedUIStandardView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)SiriSharedUIContentPlatterView;
  [(SiriSharedUIContentPlatterView *)&v31 layoutSubviews];
  if ([(SiriSharedUIContentPlatterView *)self _platterNeedsLayout])
  {
    [(SiriSharedUIContentPlatterView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(SiriSharedUIContentPlatterView *)self platterView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    v12 = [(SiriSharedUIContentPlatterView *)self _contentHostingView];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

    if (self->_supportsSAE)
    {
      if ([(SiriSharedUIContentPlatterView *)self _hasScrollViewStickyHeader])
      {
        -[SiriSharedUIGradientView setFrame:](self->_scrollViewStickyHeaderDimmingGradientView, "setFrame:", 0.0, 0.0, v8, v8 * 0.237489398);
        -[SiriSharedUIVariableBlurView setFrame:](self->_scrollViewStickyHeaderBlurView, "setFrame:", 0.0, 0.0, v8, v8 * 0.537743851);
      }
      if ([(SiriSharedUIContentPlatterView *)self _hasFakeNavigationBarBackground])
      {
        fakeNavigationBarBackgroundView = self->_fakeNavigationBarBackgroundView;
        [(SiriSharedUIContentPlatterView *)self safeAreaInsets];
        -[UIVisualEffectView setFrame:](fakeNavigationBarBackgroundView, "setFrame:", 0.0, 0.0, v8, v14);
      }
      v15 = [(PLPlatterView *)self->_platterView backgroundMaterialView];
      if (v15)
      {
        BOOL makeBackgroundPlatterTransparent = self->_makeBackgroundPlatterTransparent;

        if (makeBackgroundPlatterTransparent)
        {
          v17 = [(PLPlatterView *)self->_platterView backgroundMaterialView];
          [v17 setAlpha:0.0];

          v18 = [(PLPlatterView *)self->_platterView backgroundView];
          [v18 setAlpha:0.0];

          [(PLPlatterView *)self->_platterView setHasShadow:0];
        }
      }
    }
    if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
    {
      v19 = [(SiriSharedUIContentPlatterView *)self _scrollView];
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      CGFloat v20 = CGRectGetWidth(v32) * 0.5;
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      double v21 = CGRectGetHeight(v33) * 0.5;
      double v22 = 0.0;
      double v23 = 0.0;
      v24 = v19;
      double v25 = v20;
    }
    else
    {
      v24 = [(SiriSharedUIContentPlatterView *)self _scrollView];
      v19 = v24;
      double v22 = v4;
      double v23 = v6;
      double v25 = v8;
      double v21 = v10;
    }
    objc_msgSend(v24, "setFrame:", v22, v23, v25, v21);

    BOOL v26 = v10 == *(double *)(MEMORY[0x263F001B0] + 8) && v8 == *MEMORY[0x263F001B0];
    v27 = [(SiriSharedUIContentPlatterView *)self platterView];
    [v27 setHidden:v26];

    v28 = [(SiriSharedUIContentPlatterView *)self _scrollView];
    [v28 setNeedsLayout];

    v29 = [(SiriSharedUIContentPlatterView *)self _scrollView];
    [v29 layoutIfNeeded];

    [(SiriSharedUIContentPlatterView *)self _updateContentFullyScrolled];
    v30 = [(SiriSharedUIContentPlatterView *)self _darkenMaskView];
    objc_msgSend(v30, "setFrame:", v4, v6, v8, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v6 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v7 = [(SiriSharedUIContentPlatterView *)self contentViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "sizeThatFits:", width, height);
        double v5 = v5 + v13;
        if (v6 <= v12) {
          double v6 = v12;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  double v14 = v6;
  double v15 = v5;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)heightForContentSeparators
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SiriSharedUIContentPlatterView *)self contentViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 intrinsicContentSize];
          double v6 = v6 + v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)prepareForDrillInAnimation
{
  self->_BOOL makeBackgroundPlatterTransparent = 1;
}

- (void)prepareForPopAnimationOfType:(int64_t)a3
{
  self->_BOOL makeBackgroundPlatterTransparent = 0;
}

- (BOOL)isScrollEnabled
{
  v2 = [(SiriSharedUIContentPlatterView *)self _scrollView];
  char v3 = [v2 isAutomaticScrollingEnabled];

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriSharedUIContentPlatterView *)self _scrollView];
  [v4 setAutomaticScrollingEnabled:v3];
}

- (void)setContentViews:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSArray *)a3;
  contentViews = self->_contentViews;
  if (contentViews != v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v7 = contentViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_contentViews, a3);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v12 = self->_contentViews;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * j);
          long long v18 = [(SiriSharedUIContentPlatterView *)self _scrollView];
          [v18 addSubview:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [(SiriSharedUIContentPlatterView *)self setNeedsLayout];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.bottom < self->_minimumScrollViewBottomInset) {
    a3.bottom = self->_minimumScrollViewBottomInset;
  }
  p_contentInsets = &self->_contentInsets;
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    p_contentInsets->top = a3.top;
    self->_contentInsets.left = a3.left;
    self->_contentInsets.bottom = a3.bottom;
    self->_contentInsets.right = a3.right;
    uint64_t v8 = [(SiriSharedUIContentPlatterView *)self _scrollView];
    objc_msgSend(v8, "setContentInset:", p_contentInsets->top, p_contentInsets->left, p_contentInsets->bottom, p_contentInsets->right);

    [(SiriSharedUIContentPlatterView *)self setNeedsLayout];
  }
}

- (void)safeAreaInsetsDidChange
{
  if (self->_supportsSAE && !self->_ignoreSafeAreaInsetChanges)
  {
    [(SiriSharedUIContentPlatterView *)self safeAreaInsets];
    double v4 = v3;
    -[SiriSharedUIContentPlatterView setContentInsets:](self, "setContentInsets:");
    -[SiriSharedUIContentPlatterScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, 0.0, -v4);
    [(SiriSharedUIContentPlatterView *)self setNeedsLayout];
    [(SiriSharedUIContentPlatterView *)self layoutIfNeeded];
  }
}

- (void)setDismissalGestureRecognizer:(id)a3
{
  uint64_t v5 = (SiriSharedUIPanDismissalGestureRecognizer *)a3;
  if (self->_dismissalGestureRecognizer != v5)
  {
    objc_storeStrong((id *)&self->_dismissalGestureRecognizer, a3);
    [(SiriSharedUIContentPlatterView *)self addGestureRecognizer:v5];
  }
}

- (void)setFakeNavigationBarBackgroundHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SiriSharedUIContentPlatterView *)self _hasFakeNavigationBarBackground])
  {
    [(UIVisualEffectView *)self->_fakeNavigationBarBackgroundView setHidden:v3];
    self->_ignoreSafeAreaInsetChanges = v3;
  }
}

- (void)setMinimumScrollViewBottomInset:(double)a3
{
  self->_minimumScrollViewBottomInset = a3;
  [(SiriSharedUIContentPlatterScrollView *)self->_scrollView contentInset];
  if (v5 < a3)
  {
    -[SiriSharedUIContentPlatterView setContentInsets:](self, "setContentInsets:");
  }
}

- (void)setDarkenIntensity:(double)a3
{
  [(SiriSharedUIContentPlatterView *)self darkenIntensity];
  if (v5 != a3)
  {
    id v6 = [(SiriSharedUIContentPlatterView *)self _darkenMaskView];
    [v6 setAlpha:a3 * 0.3];
  }
}

- (double)darkenIntensity
{
  v2 = [(SiriSharedUIContentPlatterView *)self _darkenMaskView];
  [v2 alpha];
  double v4 = v3 / 0.3;

  return v4;
}

- (void)scrollViewDidScroll:(id)a3
{
  v54 = (SiriSharedUIContentPlatterView *)a3;
  -[SiriSharedUIContentPlatterView _contentOffsetForScrollView:](self, "_contentOffsetForScrollView:");
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(SiriSharedUIContentPlatterView *)self delegate];
  objc_msgSend(v8, "contentPlatterView:didScrollWithContentOffset:", self, v5, v7);

  [(SiriSharedUIContentPlatterView *)self _currentContentOffset];
  double v10 = v9;
  long long v11 = [(SiriSharedUIContentPlatterView *)self delegate];
  objc_msgSend(v11, "contentPlatterView:didScrollWithContentOffset:", self, v5, v7);

  if (self->_supportsSAE) {
    long long v12 = v54;
  }
  else {
    long long v12 = self;
  }
  [(SiriSharedUIContentPlatterView *)v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(SiriSharedUIContentPlatterView *)self _adjustedContentInsetForScrollView:v54];
  double v22 = v21;
  double v53 = v23;
  [(SiriSharedUIContentPlatterView *)self _contentSizeForScrollView:v54];
  double v25 = v22 + v24;
  v56.origin.x = v14;
  v56.origin.y = v16;
  v56.size.double width = v18;
  v56.size.double height = v20;
  double v26 = v25 - CGRectGetHeight(v56);
  [(SiriSharedUIContentPlatterView *)self _animateScrollViewStickyHeaderIfNeededGivenCurrentContentOffset:v7 contentOffsetWhenScrolledToTop:-v22];
  if (v7 >= v10)
  {
    if (v7 > 0.0)
    {
      if (v7 < v26)
      {
        [(PLPlatterView *)self->_platterView bounds];
        double Height = CGRectGetHeight(v61);
        [(SiriSharedUIContentPlatterView *)self bounds];
        if (Height != CGRectGetHeight(v62))
        {
          platterView = self->_platterView;
          [(SiriSharedUIContentPlatterView *)self bounds];
          double Width = CGRectGetWidth(v63);
          [(SiriSharedUIContentPlatterView *)self bounds];
          -[PLPlatterView setFrame:](platterView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v64));
        }
      }
    }
    else
    {
      [(SiriSharedUIContentPlatterView *)self bounds];
      double v44 = v43;
      double v46 = v45 - v7;
      double v48 = v7 + v47;
      [(SiriSharedUIContentPlatterView *)self _setPlatterNeedsLayout:0];
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, v46, v44, v48);
    }
    if (v7 > v26) {
      goto LABEL_12;
    }
  }
  else
  {
    if (v7 < 0.0)
    {
      [(SiriSharedUIContentPlatterView *)self bounds];
      double v28 = v27;
      double v30 = v29 - v7;
      double v32 = v7 + v31;
      [(SiriSharedUIContentPlatterView *)self _setPlatterNeedsLayout:0];
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, v30, v28, v32);
    }
    if (v7 > 0.0 && v7 < v26)
    {
      [(PLPlatterView *)self->_platterView bounds];
      double v33 = CGRectGetHeight(v57);
      [(SiriSharedUIContentPlatterView *)self bounds];
      if (v33 != CGRectGetHeight(v58))
      {
        v34 = self->_platterView;
        [(SiriSharedUIContentPlatterView *)self bounds];
        double v35 = CGRectGetWidth(v59);
        [(SiriSharedUIContentPlatterView *)self bounds];
        -[PLPlatterView setFrame:](v34, "setFrame:", 0.0, 0.0, v35, CGRectGetHeight(v60));
      }
    }
    if (v7 >= v26)
    {
LABEL_12:
      [(SiriSharedUIContentPlatterView *)self bounds];
      double v37 = v36;
      double v39 = v38 - (v7 - v26);
      [(SiriSharedUIContentPlatterView *)self _setPlatterNeedsLayout:0];
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, 0.0, v37, v39);
    }
  }
  float v40 = v7;
  float v41 = v53 + v26;
  BOOL v42 = floorf(v40) == floorf(v41);
  v52 = [(SiriSharedUIContentPlatterView *)self dismissalGestureRecognizer];

  if (v52) {
    [(SiriSharedUIContentPlatterView *)self _setShouldAllowDismissalWhileScrollable:v42];
  }
  [(SiriSharedUIContentPlatterView *)self _setCurrentContentOffset:v7];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v23 = a3;
  if (self->_isInAmbient && !self->_reducedOrbOpacity && (SiriSharedUIIsTextInputEnabled() & 1) == 0)
  {
    double v4 = [(SiriSharedUIContentPlatterView *)self delegate];
    [v4 contentPlatterViewScrollDidBegin];

    self->_reducedOrbOpacity = 1;
  }
  double v5 = [(SiriSharedUIContentPlatterView *)self dismissalGestureRecognizer];

  if (v5)
  {
    [v23 contentSize];
    [v23 contentSize];
    double v7 = v6;
    [v23 adjustedContentInset];
    double v9 = v7 + v8;
    [v23 adjustedContentInset];
    double v11 = v9 + v10;
    [(SiriSharedUIContentPlatterView *)self bounds];
    double v12 = v11 - CGRectGetHeight(v25);
    double v13 = [v23 panGestureRecognizer];
    CGFloat v14 = [v23 superview];
    [v13 velocityInView:v14];
    double v16 = v15;

    [v23 contentOffset];
    float v18 = v17;
    *(float *)&double v17 = v12;
    if (floorf(v18) == floorf(*(float *)&v17))
    {
      if (v16 < 0.0)
      {
        [(SiriSharedUIContentPlatterView *)self _setShouldAllowDismissalWhileScrollable:1];
        double v19 = [(SiriSharedUIContentPlatterView *)self _scrollView];
        [v19 setScrollEnabled:0];

        CGFloat v20 = [(SiriSharedUIContentPlatterView *)self _scrollView];
        [v20 setScrollEnabled:1];
      }
      if (v16 > 0.0)
      {
        [(SiriSharedUIContentPlatterView *)self _setShouldAllowDismissalWhileScrollable:1];
        double v21 = [(SiriSharedUIContentPlatterView *)self dismissalGestureRecognizer];
        [v21 setEnabled:0];

        double v22 = [(SiriSharedUIContentPlatterView *)self dismissalGestureRecognizer];
        [v22 setEnabled:1];
      }
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v8 = a3;
  if (self->_isInAmbient && !a4 && self->_reducedOrbOpacity && (SiriSharedUIIsTextInputEnabled() & 1) == 0)
  {
    double v6 = [(SiriSharedUIContentPlatterView *)self delegate];
    [v6 contentPlatterViewScrollDidEnd];

    self->_reducedOrbOpacity = 0;
  }
  double v7 = [(SiriSharedUIContentPlatterView *)self delegate];
  [(SiriSharedUIContentPlatterView *)self _contentOffsetForScrollView:v8];
  objc_msgSend(v7, "contentPlatterViewScrolledToContentOffset:");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_isInAmbient && self->_reducedOrbOpacity)
  {
    uint64_t v7 = v4;
    uint64_t v4 = SiriSharedUIIsTextInputEnabled();
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      double v6 = [(SiriSharedUIContentPlatterView *)self delegate];
      [v6 contentPlatterViewScrollDidEnd];

      uint64_t v5 = v7;
      self->_reducedOrbOpacity = 0;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_updateContentFullyScrolled
{
  [(SiriSharedUIContentPlatterView *)self _adjustedContentInsetForScrollView:self->_scrollView];
  double v4 = v3;
  double v6 = v5;
  [(SiriSharedUIContentPlatterScrollView *)self->_scrollView contentSize];
  double v8 = v4 + v7;
  [(SiriSharedUIContentPlatterView *)self bounds];
  double v9 = v8 - CGRectGetHeight(v14);
  [(SiriSharedUIContentPlatterView *)self _contentOffsetForScrollView:self->_scrollView];
  float v11 = v10;
  *(float *)&double v10 = v6 + v9;
  BOOL v12 = floorf(v11) == floorf(*(float *)&v10);
  [(SiriSharedUIContentPlatterView *)self _setShouldAllowDismissalWhileScrollable:v12];
}

- (CGPoint)_contentOffsetForScrollView:(id)a3
{
  [a3 contentOffset];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)_contentSizeForScrollView:(id)a3
{
  [a3 contentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (UIEdgeInsets)_adjustedContentInsetForScrollView:(id)a3
{
  [a3 adjustedContentInset];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_hasScrollViewStickyHeader
{
  return !SiriSharedUIDeviceIsPad() && self->_supportsSAE;
}

- (BOOL)_hasFakeNavigationBarBackground
{
  BOOL IsPad = SiriSharedUIDeviceIsPad();
  if (IsPad) {
    LOBYTE(IsPad) = self->_supportsSAE;
  }
  return IsPad;
}

- (void)_animateScrollViewStickyHeaderIfNeededGivenCurrentContentOffset:(double)a3 contentOffsetWhenScrolledToTop:(double)a4
{
  if ([(SiriSharedUIContentPlatterView *)self _hasScrollViewStickyHeader])
  {
    if (a3 <= a4)
    {
      if (!self->_showingScrollViewStickyHeader) {
        return;
      }
      uint64_t v7 = 0;
    }
    else
    {
      if (self->_showingScrollViewStickyHeader) {
        return;
      }
      uint64_t v7 = 1;
    }
    uint64_t v8 = [objc_alloc(NSNumber) initWithInt:v7];
    if (v8)
    {
      double v9 = (void *)v8;
      objc_initWeak(&location, self);
      self->_showingScrollViewStickyHeader = [v9 BOOLValue];
      double v10 = (void *)MEMORY[0x263F82E00];
      scrollViewStickyHeaderSpringAnimationBehavior = self->_scrollViewStickyHeaderSpringAnimationBehavior;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __129__SiriSharedUIContentPlatterView__animateScrollViewStickyHeaderIfNeededGivenCurrentContentOffset_contentOffsetWhenScrolledToTop___block_invoke;
      v13[3] = &unk_2640E3698;
      objc_copyWeak(&v15, &location);
      id v12 = v9;
      id v14 = v12;
      [v10 _animateUsingSpringBehavior:scrollViewStickyHeaderSpringAnimationBehavior tracking:0 animations:v13 completion:0];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __129__SiriSharedUIContentPlatterView__animateScrollViewStickyHeaderIfNeededGivenCurrentContentOffset_contentOffsetWhenScrolledToTop___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = (void *)WeakRetained[53];
    double v4 = WeakRetained;
    [*(id *)(a1 + 32) doubleValue];
    objc_msgSend(v3, "setAlpha:");
    WeakRetained = v4;
  }
}

- (SiriSharedUIContentPlatterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUIContentPlatterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)contentViews
{
  return self->_contentViews;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)allowAutomaticContentViewsScaling
{
  return self->_allowAutomaticContentViewsScaling;
}

- (BOOL)isNextLevelCard
{
  return self->_isNextLevelCard;
}

- (void)setIsNextLevelCard:(BOOL)a3
{
  self->_BOOL isNextLevelCard = a3;
}

- (SiriSharedUIStandardView)_contentHostingView
{
  return self->_contentHostingView;
}

- (void)setContentHostingView:(id)a3
{
}

- (SiriSharedUIContentPlatterScrollView)_scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SiriSharedUIContentPlatterDarkenMaskView)_darkenMaskView
{
  return self->_darkenMaskView;
}

- (void)setDarkenMaskView:(id)a3
{
}

- (BOOL)_platterNeedsLayout
{
  return self->_platterNeedsLayout;
}

- (void)_setPlatterNeedsLayout:(BOOL)a3
{
  self->_platterNeedsLayout = a3;
}

- (BOOL)_shouldAllowDismissalWhenScrollable
{
  return self->_shouldAllowDismissalWhileScrollable;
}

- (void)_setShouldAllowDismissalWhileScrollable:(BOOL)a3
{
  self->_shouldAllowDismissalWhileScrollable = a3;
}

- (double)_currentContentOffset
{
  return self->_currentContentOffset;
}

- (void)_setCurrentContentOffset:(double)a3
{
  self->_currentContentOffset = a3;
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_darkenMaskView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentHostingView, 0);
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fakeNavigationBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollViewStickyHeaderSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_scrollViewStickyHeaderDimmingGradientView, 0);
  objc_storeStrong((id *)&self->_scrollViewStickyHeaderBlurView, 0);
  objc_storeStrong((id *)&self->_scrollViewStickyHeaderContainerView, 0);
}

@end