@interface SBHLibraryPodFolderView
+ (Class)defaultIconListViewClass;
+ (id)defaultIconLocation;
- (BOOL)_animatesRotationForAllVisibleIconListViews;
- (BOOL)_shouldUseScrollableIconViewInteraction;
- (BOOL)centersContentIfPossible;
- (BOOL)hidesFeatherBlur;
- (BOOL)isLibraryPodCategoryFolderView;
- (BSUIScrollView)podScrollView;
- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate;
- (CGPoint)_restingContentOffsetForScrollOffset:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (CGPoint)scrollingStartOffset;
- (CGRect)_frameForIconListAtIndex:(unint64_t)a3;
- (CGRect)_iconListFrameForPageRect:(CGRect)a3 atIndex:(unint64_t)a4;
- (CGSize)_iconListViewSize;
- (CGSize)_iconSpacingForIconListView;
- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3;
- (SBHLibraryPodFolderView)initWithConfiguration:(id)a3;
- (UIEdgeInsets)_scrollingInteractionVisibleInsets;
- (UINavigationBar)navigationBar;
- (UIScrollViewDelegate)scrollViewDelegate;
- (double)_pageWidth;
- (int64_t)iconVisibilityHandling;
- (int64_t)positionForBar:(id)a3;
- (unint64_t)extraIdleScrollVisibleRows;
- (void)_configureIconListView:(id)a3;
- (void)_configureScrollingInteraction:(id)a3;
- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3;
- (void)_layoutNavBarAndContentInsets;
- (void)_layoutSubviews;
- (void)_orientationDidChange:(int64_t)a3;
- (void)_positionNavBarAbuttingListView;
- (void)_updateCycleIdleUntil:(unint64_t)a3;
- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4;
- (void)_updateScrollViewContentSize;
- (void)_updateVisibleRowRange;
- (void)_zeroFirstListViewOriginIfNeeded;
- (void)didMoveToWindow;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginScrolling:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCentersContentIfPossible:(BOOL)a3;
- (void)setExtraIdleScrollVisibleRows:(unint64_t)a3;
- (void)setFolder:(id)a3;
- (void)setHidesFeatherBlur:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3;
- (void)setNeedsLayout;
- (void)setScrollViewDelegate:(id)a3;
- (void)setScrollingStartOffset:(CGPoint)a3;
- (void)updateAccessibilityTintColors;
@end

@implementation SBHLibraryPodFolderView

- (SBHLibraryPodFolderView)initWithConfiguration:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryPodFolderView;
  v3 = [(SBFolderView *)&v12 initWithConfiguration:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4F8E0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    podScrollView = v3->_podScrollView;
    v3->_podScrollView = (BSUIScrollView *)v5;

    [(BSUIScrollView *)v3->_podScrollView _setLayoutDebuggingIdentifier:@"podScrollView"];
    [(BSUIScrollView *)v3->_podScrollView setAlwaysBounceVertical:1];
    [(BSUIScrollView *)v3->_podScrollView setContentInsetAdjustmentBehavior:3];
    [(BSUIScrollView *)v3->_podScrollView setClipsToBounds:0];
    [(BSUIScrollView *)v3->_podScrollView setDelegate:v3];
    [(BSUIScrollView *)v3->_podScrollView setDelaysContentTouches:0];
    v7 = [(SBFolderView *)v3 scalingView];
    [v7 addSubview:v3->_podScrollView];

    v8 = [(SBFolderView *)v3 folder];
    v9 = [v8 firstList];
    [v9 addListObserver:v3];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel_accessibilityReduceTransparencyDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];

    [(SBHLibraryPodFolderView *)v3 setAccessibilityIdentifier:@"dewey-pod-expanded"];
  }
  return v3;
}

- (void)_configureScrollingInteraction:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setConsidersFolderIconTargets:", -[SBHLibraryPodFolderView isLibraryPodCategoryFolderView](self, "isLibraryPodCategoryFolderView") ^ 1);
}

+ (id)defaultIconLocation
{
  return @"SBIconLocationAppLibrary";
}

+ (Class)defaultIconListViewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)iconVisibilityHandling
{
  return 2;
}

- (BOOL)isLibraryPodCategoryFolderView
{
  return 0;
}

- (void)setFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderView *)self folder];
  v6 = [v5 firstList];
  [v6 removeListObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v9 setFolder:v4];

  v7 = [(SBFolderView *)self folder];
  v8 = [v7 firstList];
  [v8 addListObserver:self];
}

- (void)setLegibilitySettings:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v3 setLegibilitySettings:a3];
}

- (UINavigationBar)navigationBar
{
  navBar = self->_navBar;
  if (!navBar)
  {
    id v4 = [SBHFeatherBlurNavigationBar alloc];
    uint64_t v5 = -[SBHFeatherBlurNavigationBar initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_navBar;
    self->_navBar = v5;

    [(SBHFeatherBlurNavigationBar *)self->_navBar setDelegate:self];
    [(SBHFeatherBlurNavigationBar *)self->_navBar setHidesFeatherBlur:self->_hidesFeatherBlur];
    v7 = [(SBFolderView *)self scalingView];
    [v7 addSubview:self->_navBar];

    navBar = self->_navBar;
  }
  return (UINavigationBar *)navBar;
}

- (void)setCentersContentIfPossible:(BOOL)a3
{
  if (self->_centersContentIfPossible != a3)
  {
    self->_centersContentIfPossible = a3;
    [(SBHLibraryPodFolderView *)self setNeedsLayout];
  }
}

- (void)setHidesFeatherBlur:(BOOL)a3
{
  if (self->_hidesFeatherBlur != a3)
  {
    self->_hidesFeatherBlur = a3;
    -[SBHFeatherBlurNavigationBar setHidesFeatherBlur:](self->_navBar, "setHidesFeatherBlur:");
  }
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v3 setNeedsLayout];
  [(SBHFeatherBlurNavigationBar *)self->_navBar setNeedsLayout];
}

- (void)_layoutSubviews
{
  [(SBHLibraryPodFolderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(BSUIScrollView *)self->_podScrollView frame];
  if ((BSRectEqualToRect() & 1) == 0) {
    -[BSUIScrollView setFrame:](self->_podScrollView, "setFrame:", v4, v6, v8, v10);
  }
  [(SBHLibraryPodFolderView *)self _updateScrollViewContentSize];
  [(SBHLibraryPodFolderView *)self _zeroFirstListViewOriginIfNeeded];
  if (self->_navBar)
  {
    [(SBHLibraryPodFolderView *)self _layoutNavBarAndContentInsets];
  }
}

- (void)_layoutNavBarAndContentInsets
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  [(BSUIScrollView *)self->_podScrollView contentOffset];
  [(BSUIScrollView *)self->_podScrollView adjustedContentInset];
  int v3 = BSFloatLessThanOrEqualToFloat();
  [(SBHFeatherBlurNavigationBar *)self->_navBar sb_minimumNavbarHeight];
  self->_minimumNavBarHeight = v4;
  [(SBHFeatherBlurNavigationBar *)self->_navBar sb_maximumNavbarHeight];
  self->_double maximumNavBarHeight = v5;
  double v6 = [(SBHLibraryPodFolderView *)self safeAreaLayoutGuide];
  [v6 layoutFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [(SBHLibraryPodFolderView *)self _scrollViewContentSize];
  double v16 = v15;
  v74.origin.CGFloat x = v8;
  v74.origin.CGFloat y = v10;
  v74.size.CGFloat width = v12;
  v74.size.height = v14;
  CGRectGetWidth(v74);
  CGFloat v17 = v16 + self->_minimumNavBarHeight;
  v75.origin.CGFloat x = v8;
  v75.origin.CGFloat y = v10;
  v75.size.CGFloat width = v12;
  v75.size.height = v14;
  double MinY = CGRectGetMinY(v75);
  uint64_t v18 = MEMORY[0x1E4FB2848];
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v76.origin.CGFloat x = v8;
  v76.origin.CGFloat y = v10;
  v76.size.CGFloat width = v12;
  v76.size.height = v14;
  if (CGRectGetHeight(v76) <= v17)
  {
    self->_usingCenteredLayout = 0;
  }
  else
  {
    BOOL centersContentIfPossible = self->_centersContentIfPossible;
    self->_usingCenteredLayout = centersContentIfPossible;
    if (centersContentIfPossible)
    {
      UIRectCenteredRect();
      CGFloat x = v77.origin.x;
      CGFloat width = v77.size.width;
      CGFloat y = v77.origin.y;
      CGFloat rect = v77.size.height;
      double maximumNavBarHeight = CGRectGetMinY(v77) - MinY + self->_minimumNavBarHeight;
      v78.origin.CGFloat x = v8;
      v78.origin.CGFloat y = v10;
      v78.size.CGFloat width = v12;
      v78.size.height = v14;
      double MaxY = CGRectGetMaxY(v78);
      v79.origin.CGFloat x = x;
      v79.size.CGFloat width = width;
      v79.origin.CGFloat y = y;
      v79.size.height = rect;
      double v25 = MaxY - CGRectGetMaxY(v79);
      goto LABEL_6;
    }
  }
  double v25 = *(double *)(v18 + 16);
  double maximumNavBarHeight = self->_maximumNavBarHeight;
LABEL_6:
  [(BSUIScrollView *)self->_podScrollView contentInset];
  if (v29 != v19 || v26 != maximumNavBarHeight || v28 != v20 || v27 != v25)
  {
    -[BSUIScrollView setContentInset:](self->_podScrollView, "setContentInset:", maximumNavBarHeight, v19, v25, v20);
    -[BSUIScrollView setScrollIndicatorInsets:](self->_podScrollView, "setScrollIndicatorInsets:", maximumNavBarHeight, v19, v25, v20);
  }
  [(SBHLibraryPodFolderView *)self _positionNavBarAbuttingListView];
  if (v3 && ![(BSUIScrollView *)self->_podScrollView isScrolling])
  {
    podScrollView = self->_podScrollView;
    [(BSUIScrollView *)podScrollView adjustedContentInset];
    -[BSUIScrollView setContentOffset:](podScrollView, "setContentOffset:", 0.0, -v34);
  }
  v35 = [(SBHLibraryPodFolderView *)self superview];
  if (v35)
  {
    podScrollViewGradientMaskLayers = self->_podScrollViewGradientMaskLayers;

    if (!podScrollViewGradientMaskLayers)
    {
      v37 = [MEMORY[0x1E4FA5F00] configureGradientMaskForFeatherBlurRecipe:2 onContentView:self->_podScrollView];
      v38 = self->_podScrollViewGradientMaskLayers;
      self->_podScrollViewGradientMaskLayers = v37;
    }
  }
  if (self->_podScrollViewGradientMaskLayers)
  {
    [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:2];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    [(SBHFeatherBlurNavigationBar *)self->_navBar gradientMaskFrame];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v53 = [(SBHLibraryPodFolderView *)self window];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v54 = self->_podScrollViewGradientMaskLayers;
    uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      double v57 = v52 - (v40 + v44);
      double v58 = v50 - (v42 + v46);
      double v59 = v42 + v48;
      uint64_t v60 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v69 != v60) {
            objc_enumerationMutation(v54);
          }
          v62 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          objc_msgSend(v62, "setFrame:", v59, 0.0, v58, v57);
          v63 = objc_msgSend(MEMORY[0x1E4FA5F00], "matchMoveAnimationForFrame:relativeToView:", v53, v59, 0.0, v58, v57);
          [v62 addAnimation:v63 forKey:@"SBLibraryPodFolderViewMatchMoveAnimation"];
        }
        uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v56);
    }
  }
}

- (void)_positionNavBarAbuttingListView
{
  int v3 = [(SBHLibraryPodFolderView *)self safeAreaLayoutGuide];
  [v3 layoutFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(BSUIScrollView *)self->_podScrollView contentOffset];
  double v13 = -v12;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.height = v11;
  double MinY = CGRectGetMinY(v26);
  double minimumNavBarHeight = self->_minimumNavBarHeight;
  double v16 = v13 - MinY;
  [(SBHLibraryPodFolderView *)self bounds];
  double v18 = v17;
  double v24 = v19;
  v27.origin.CGFloat x = v5;
  v27.origin.CGFloat y = v7;
  v27.size.CGFloat width = v9;
  v27.size.height = v11;
  double Height = CGRectGetHeight(v27);
  if (minimumNavBarHeight >= v16) {
    double v21 = minimumNavBarHeight;
  }
  else {
    double v21 = v16;
  }
  navBar = self->_navBar;
  if (Height <= v21) {
    double v23 = Height;
  }
  else {
    double v23 = v21;
  }
  -[SBHFeatherBlurNavigationBar sbf_setBoundsAndPositionFromFrame:](navBar, "sbf_setBoundsAndPositionFromFrame:", v18, MinY, v24, v23);
}

- (CGPoint)_restingContentOffsetForScrollOffset:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_usingCenteredLayout)
  {
    CGFloat v7 = [(SBHLibraryPodFolderView *)self safeAreaLayoutGuide];
    [v7 layoutFrame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v36.origin.CGFloat x = v9;
    v36.origin.double y = v11;
    v36.size.CGFloat width = v13;
    v36.size.height = v15;
    double MinY = CGRectGetMinY(v36);
    double v17 = -y - MinY;
    if (v17 >= self->_minimumNavBarHeight && v17 < self->_maximumNavBarHeight)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v18 = [(SBHFeatherBlurNavigationBar *)self->_navBar _restingHeights];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        double v22 = 1.79769313e308;
        double v23 = NAN;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v29 + 1) + 8 * i) doubleValue];
            double v26 = vabdd_f64(v25, v17);
            if (v26 < v22)
            {
              double v23 = v25;
              double v22 = v26;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v20);
      }
      else
      {
        double v23 = NAN;
      }

      double y = -(MinY + v23);
    }
  }
  double v27 = x;
  double v28 = y;
  result.double y = v28;
  result.CGFloat x = v27;
  return result;
}

- (void)_zeroFirstListViewOriginIfNeeded
{
  if ([(SBFolderView *)self iconListViewCount])
  {
    int v3 = [(SBFolderView *)self firstIconListView];
    [v3 frame];
    objc_msgSend(v3, "setFrame:");
  }
  [(SBHLibraryPodFolderView *)self _updateVisibleRowRange];
}

- (void)_updateScrollViewContentSize
{
  podScrollView = self->_podScrollView;
  [(SBHLibraryPodFolderView *)self _scrollViewContentSize];
  -[BSUIScrollView setContentSize:](podScrollView, "setContentSize:");
}

- (double)_pageWidth
{
  [(BSUIScrollView *)self->_podScrollView frame];
  return CGRectGetWidth(*(CGRect *)&v2);
}

- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  CGFloat v5 = [v7 superview];
  podScrollView = self->_podScrollView;

  if (v5 != podScrollView) {
    [(BSUIScrollView *)self->_podScrollView addSubview:v7];
  }
}

- (CGRect)_iconListFrameForPageRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView _iconListFrameForPageRect:atIndex:](&v15, sel__iconListFrameForPageRect_atIndex_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(BSUIScrollView *)self->_podScrollView bounds];
  UIRectCenteredXInRect();
  double MinX = CGRectGetMinX(v16);
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.CGFloat x = MinX;
  return result;
}

- (void)_configureIconListView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodFolderView;
  id v4 = a3;
  [(SBFolderView *)&v5 _configureIconListView:v4];
  objc_msgSend(v4, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0, v5.receiver, v5.super_class);
  [v4 setBoundsSizeTracksContentSize:1];
  [v4 addLayoutObserver:self];
  [(SBHLibraryPodFolderView *)self _iconSpacingForIconListView];
  objc_msgSend(v4, "setIconSpacing:");
}

- (CGSize)_iconSpacingForIconListView
{
  int v3 = [(SBFolderView *)self listLayoutProvider];
  id v4 = [v3 layoutForIconLocation:@"SBIconLocationAppLibrary"];

  objc_super v5 = [v4 appLibraryVisualConfiguration];
  if ((unint64_t)([(SBFolderView *)self orientation] - 3) > 1) {
    [v5 portraitCategoryPodIconSpacing];
  }
  else {
    [v5 landscapeCategoryPodIconSpacing];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v7 _frameForIconListAtIndex:a3];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.size.height = v4;
  result.size.CGFloat width = v3;
  result.origin.double y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGSize)_iconListViewSize
{
  if ([(SBFolderView *)self iconListViewCount])
  {
    double v3 = [(SBFolderView *)self firstIconListView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)_orientationDidChange:(int64_t)a3
{
  [(SBHLibraryPodFolderView *)self _iconSpacingForIconListView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SBHLibraryPodFolderView__orientationDidChange___block_invoke;
  v8[3] = &__block_descriptor_48_e28_v24__0__SBIconListView_8_B16l;
  v8[4] = v5;
  v8[5] = v6;
  [(SBFolderView *)self enumerateIconListViewsUsingBlock:v8];
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v7 _orientationDidChange:a3];
}

uint64_t __49__SBHLibraryPodFolderView__orientationDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconSpacing:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)_animatesRotationForAllVisibleIconListViews
{
  return 1;
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 1;
}

- (UIEdgeInsets)_scrollingInteractionVisibleInsets
{
  [(BSUIScrollView *)self->_podScrollView adjustedContentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void *, unsigned char *))a3;
  double v5 = [(SBFolderView *)self currentIconListView];
  [v5 icons];
  char v40 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    id v28 = v6;
    long long v29 = v5;
    uint64_t v26 = *(void *)v37;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v27 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        double v12 = objc_msgSend(v5, "displayedIconViewForIcon:", v11, v26);
        if (v12)
        {
          double v13 = v12;
          uint64_t v14 = [v12 customIconImageViewController];
          objc_super v15 = v11;
          CGRect v16 = (void *)v14;
          if (([v15 isCategoryIcon] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            && (id v17 = v16) != 0)
          {
            long long v30 = v17;
            long long v31 = v16;
            double v18 = [v17 iconListView];
            uint64_t v19 = [v18 icons];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v20 = v19;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v33;
              while (2)
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v33 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  double v25 = [v18 displayedIconViewForIcon:*(void *)(*((void *)&v32 + 1) + 8 * i)];
                  if (v25)
                  {
                    v4[2](v4, v25, &v40);
                    if (v40)
                    {

                      id v6 = v28;
                      double v5 = v29;
                      CGRect v16 = v31;
                      goto LABEL_26;
                    }
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            id v6 = v28;
            double v5 = v29;
            uint64_t v9 = v26;
            uint64_t v8 = v27;
            CGRect v16 = v31;
          }
          else
          {
            v4[2](v4, v13, &v40);
            if (v40)
            {
LABEL_26:

              goto LABEL_27;
            }
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_27:
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_podScrollView == a3)
  {
    id v5 = a3;
    [(SBHLibraryPodFolderView *)self _updateVisibleRowRange];
    if (self->_navBar) {
      [(SBHLibraryPodFolderView *)self _positionNavBarAbuttingListView];
    }
    [(SBFolderView *)self _scrollingInteractionScrollViewDidScroll:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    [WeakRetained scrollViewDidScroll:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHLibraryPodFolderView;
    id v4 = a3;
    [(SBFolderView *)&v7 scrollViewDidScroll:v4];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = (BSUIScrollView *)a3;
  if (self->_podScrollView == v9)
  {
    if (self->_navBar)
    {
      -[SBHLibraryPodFolderView _restingContentOffsetForScrollOffset:withVelocity:](self, "_restingContentOffsetForScrollOffset:withVelocity:", a5->x, a5->y, x, y);
      a5->double x = v10;
      a5->double y = v11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHLibraryPodFolderView;
    -[SBFolderView scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v13, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = (BSUIScrollView *)a3;
  if (self->_podScrollView == v4)
  {
    [(SBFolderView *)self _updateScrollingInteractionIsScrolling:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    [WeakRetained scrollViewWillBeginDragging:v4];
  }
  [(SBHFeatherBlurNavigationBar *)self->_navBar setAllowsAnimatedUpdating:1];
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v6 scrollViewWillBeginDragging:v4];
}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  if (self->_podScrollView == a3)
  {
    p_librarySearchControllerScrollViewDelegate = &self->_librarySearchControllerScrollViewDelegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_librarySearchControllerScrollViewDelegate);
    [WeakRetained scrollViewWillBeginScrolling:v5];

    [v5 contentOffset];
    double v8 = v7;
    double v10 = v9;

    -[SBHLibraryPodFolderView setScrollingStartOffset:](self, "setScrollingStartOffset:", v8, v10);
    [(SBHLibraryPodFolderView *)self setExtraIdleScrollVisibleRows:0];
  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  id v4 = (BSUIScrollView *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v6 scrollViewDidEndScrolling:v4];
  if (self->_podScrollView == v4)
  {
    [(SBFolderView *)self _updateScrollingInteractionIsScrolling:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    [WeakRetained scrollViewDidEndScrolling:v4];

    [(SBHLibraryPodFolderView *)self setExtraIdleScrollVisibleRows:0];
  }
  [(SBHFeatherBlurNavigationBar *)self->_navBar setAllowsAnimatedUpdating:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v3 didMoveToWindow];
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  [(SBHLibraryPodFolderView *)self _updateVisibleRowRange];
}

- (void)_updateVisibleRowRange
{
  id v17 = [(SBFolderView *)self firstIconListView];
  [(BSUIScrollView *)self->_podScrollView contentOffset];
  long double v4 = v3;
  [(BSUIScrollView *)self->_podScrollView bounds];
  CGFloat Height = CGRectGetHeight(v19);
  double v6 = nexttoward(v4 + Height, v4);
  [(SBHLibraryPodFolderView *)self scrollingStartOffset];
  double v8 = v7;
  unint64_t v9 = objc_msgSend(v17, "rowAtPoint:", 0.0, (double)v4);
  uint64_t v10 = objc_msgSend(v17, "rowAtPoint:", 0.0, v6);
  unint64_t v11 = [(SBHLibraryPodFolderView *)self extraIdleScrollVisibleRows];
  unint64_t v12 = v10 - v9 + v11;
  unint64_t v13 = v9 - v11;
  if (v9 < v11) {
    unint64_t v13 = 0;
  }
  if (v4 >= v8) {
    unint64_t v14 = v9;
  }
  else {
    unint64_t v14 = v13;
  }
  unint64_t v15 = [v17 iconRowsForCurrentOrientation];
  if (v14 + v12 + 1 < v15) {
    unint64_t v16 = v12 + 1;
  }
  else {
    unint64_t v16 = v15 - v14;
  }
  objc_msgSend(v17, "setVisibleRowRange:", v14, v16);
  [v17 layoutIconsIfNeeded];
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6 = a4;
  long double v4 = [v6 icon];
  int v5 = [v4 isCategoryIcon];

  if (v5) {
    [v6 setAllowsEditingAnimation:0];
  }
}

- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3
{
  id v4 = a3;
  unint64_t v5 = SBHScreenTypeForCurrentDevice();
  if (SBHScreenTypeIsPhone(v5)
    || ![(SBHLibraryPodFolderView *)self isLibraryPodCategoryFolderView])
  {
    unint64_t v11 = [(SBFolderView *)self listLayoutProvider];
    double v8 = [v11 layoutForIconLocation:@"SBIconLocationRoot"];

    SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v8, 1);
    double v10 = v12 + 4.0;
  }
  else
  {
    id v6 = [(SBFolderView *)self listLayoutProvider];
    double v7 = [(SBFolderView *)self iconLocation];
    double v8 = [v6 layoutForIconLocation:v7];

    objc_msgSend(v8, "layoutInsetsForOrientation:", -[SBFolderView orientation](self, "orientation"));
    double v10 = v9;
  }

  if ([v4 insetsLayoutMarginsFromSafeArea])
  {
    uint64_t v13 = [v4 effectiveUserInterfaceLayoutDirection];
    [(SBHLibraryPodFolderView *)self safeAreaInsets];
    if (v13 == 1) {
      double v16 = v14;
    }
    else {
      double v16 = v15;
    }
    if (v13 == 1) {
      double v14 = v15;
    }
    double v17 = v10 + v14;
    double v10 = v10 + v16;
  }
  else
  {
    double v17 = v10;
  }

  double v18 = 0.0;
  double v19 = 0.0;
  double v20 = v17;
  double v21 = v10;
  result.trailing = v21;
  result.bottom = v19;
  result.leading = v20;
  result.top = v18;
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_updateCycleIdleUntil:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v5 _updateCycleIdleUntil:a3];
  unint64_t v4 = [(SBHLibraryPodFolderView *)self extraIdleScrollVisibleRows];
  if (v4 <= 9)
  {
    [(SBHLibraryPodFolderView *)self setExtraIdleScrollVisibleRows:v4 + 1];
    [(SBHLibraryPodFolderView *)self _updateVisibleRowRange];
  }
}

- (void)updateAccessibilityTintColors
{
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodFolderView;
  [(SBFolderView *)&v2 updateAccessibilityTintColors];
}

- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
  return (BSUIScrollViewDelegate *)WeakRetained;
}

- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3
{
}

- (BSUIScrollView)podScrollView
{
  return self->_podScrollView;
}

- (BOOL)centersContentIfPossible
{
  return self->_centersContentIfPossible;
}

- (BOOL)hidesFeatherBlur
{
  return self->_hidesFeatherBlur;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (unint64_t)extraIdleScrollVisibleRows
{
  return self->_extraIdleScrollVisibleRows;
}

- (void)setExtraIdleScrollVisibleRows:(unint64_t)a3
{
  self->_extraIdleScrollVisibleRows = a3;
}

- (CGPoint)scrollingStartOffset
{
  double x = self->_scrollingStartOffset.x;
  double y = self->_scrollingStartOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollingStartOffset:(CGPoint)a3
{
  self->_scrollingStartOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_podScrollView, 0);
  objc_destroyWeak((id *)&self->_librarySearchControllerScrollViewDelegate);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_podScrollViewGradientMaskLayers, 0);
}

@end