@interface UIPageViewController
+ (BOOL)_isNavigationOrientation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4;
+ (BOOL)_isSpineLocation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4;
+ (BOOL)_isSupportedTransitionStyle:(int64_t)a3;
+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation;
+ (id)_incomingViewControllerKeys;
+ (id)_outgoingViewControllerKeys;
+ (id)stringForSpineLocation:(int64_t)a3;
- (BOOL)_canHandleGestures;
- (BOOL)_child:(id)a3 canBeginAppearanceTransition:(BOOL)a4;
- (BOOL)_childCanEndAppearanceTransition:(id)a3;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_isCurrentViewControllerStateValid;
- (BOOL)_isInterfaceRotating;
- (BOOL)_isPageControlVisible;
- (BOOL)_shouldBeginNavigationInDirection:(int64_t *)a3 inResponseToPanGestureRecognizer:(id)a4;
- (BOOL)_shouldCompleteManualCurlWithSuggestedVelocity:(double *)a3;
- (BOOL)_shouldFlipInRightToLeft;
- (BOOL)_shouldGenerateAppearanceCallbacksWhenScrolling;
- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToTapGestureRecognizer:(id)a4;
- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToVelocity:(double *)a4 ofGestureRecognizedByPanGestureRecognizer:(id)a5;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)isDoubleSided;
- (BOOL)queuingScrollViewShouldLayoutSubviews:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CGRect)_disabledScrollingRegion;
- (CGRect)_tapRegions;
- (CGSize)_contentSizeForSize:(CGSize)a3;
- (CGSize)_effectiveTapRegionBreadths;
- (NSArray)_viewControllers;
- (NSArray)_viewControllersStashedForRotation;
- (NSArray)gestureRecognizers;
- (NSArray)viewControllers;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_effectiveTapRegionInsets;
- (UIPageViewController)initWithCoder:(NSCoder *)coder;
- (UIPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIPageViewController)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options;
- (UIPageViewControllerSpineLocation)spineLocation;
- (_NSRange)_validRangeForPresentationOfViewControllersWithSpineLocation:(int64_t)a3;
- (_UIPageViewControllerContentView)_contentView;
- (_UIQueuingScrollView)_scrollView;
- (double)_pageSpacing;
- (id)_deepestActionResponder;
- (id)_incomingViewControllersForGestureDrivenCurlInDirection:(int64_t)a3;
- (id)_pageControl;
- (id)_queuingScrollView:(id)a3 viewBefore:(BOOL)a4 view:(id)a5;
- (id)_validatedViewControllersForPresentationOfViewControllers:(id)a3 validRange:(_NSRange)a4;
- (id)_validatedViewControllersForTransitionWithViewControllers:(id)a3 animated:(BOOL)a4;
- (id)_viewControllerAfterViewController:(id)a3;
- (id)_viewControllerBefore:(BOOL)a3 viewController:(id)a4;
- (id)_viewControllerBeforeViewController:(id)a3;
- (id)_viewControllersForCurlWithViewControllers:(id)a3 direction:(int64_t)a4;
- (id)_viewControllersForPendingSpineLocation:(int64_t)a3;
- (id)dataSource;
- (id)delegate;
- (id)queuingScrollView:(id)a3 viewAfterView:(id)a4;
- (id)queuingScrollView:(id)a3 viewBeforeView:(id)a4;
- (int64_t)_navigationEndDirectionInResponseToPanGestureRecognizer:(id)a3 suggestedVelocity:(double *)a4;
- (int64_t)_navigationOrientation;
- (int64_t)_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:(int64_t)a3;
- (int64_t)_transitionStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginDisablingInterfaceAutorotation;
- (void)_cacheViewControllerForScroll:(id)a3;
- (void)_child:(id)a3 beginAppearanceTransition:(BOOL)a4 animated:(BOOL)a5;
- (void)_child:(id)a3 beginAppearanceTransitionIfPossible:(BOOL)a4 animated:(BOOL)a5;
- (void)_child:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4;
- (void)_child:(id)a3 endAppearanceTransitionIfPossible:(BOOL)a4;
- (void)_child:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)_child:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)_childEndAppearanceTransition:(id)a3;
- (void)_contentViewFrameOrBoundsDidChange;
- (void)_endDisablingInterfaceAutorotation;
- (void)_flushViewController:(id)a3 animated:(BOOL)a4;
- (void)_handlePagingInDirection:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_handlePanGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_invalidateEffectiveTapRegions;
- (void)_invalidatePageCurl;
- (void)_invalidateViewControllersStashedForCurlFromDataSource;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_pageControlValueChanged:(id)a3;
- (void)_populateIncomingViewControllersInMap:(id)a3 withViewControllers:(id)a4 forCurlInDirection:(int64_t)a5;
- (void)_populateOutgoingViewControllersInMap:(id)a3;
- (void)_sendChildViewWill:(BOOL)a3 appear:(BOOL)a4 animated:(BOOL)a5;
- (void)_setDisabledScrollingRegion:(CGRect)a3;
- (void)_setPageSpacing:(double)a3;
- (void)_setSpineLocation:(int64_t)a3;
- (void)_setTapRegionBreadths:(CGSize)a3;
- (void)_setTapRegionInsets:(UIEdgeInsets)a3;
- (void)_setViewControllers:(id)a3;
- (void)_setViewControllers:(id)a3 withCurlOfType:(int64_t)a4 fromLocation:(CGPoint)a5 direction:(int64_t)a6 animated:(BOOL)a7 notifyDelegate:(BOOL)a8 completion:(id)a9;
- (void)_setViewControllers:(id)a3 withScrollInDirection:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setViewControllersStashedForRotation:(id)a3;
- (void)_updatePageControlViaDataSourceIfNecessary;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)queuingScrollView:(id)a3 attemptToPageInDirection:(int64_t)a4;
- (void)queuingScrollView:(id)a3 didBailoutOfScrollAndRevealedView:(id)a4;
- (void)queuingScrollView:(id)a3 didCommitManualScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 direction:(int64_t)a7 animated:(BOOL)a8 canComplete:(BOOL)a9;
- (void)queuingScrollView:(id)a3 didEndManualScroll:(BOOL)a4 toRevealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 didFinish:(BOOL)a8 didComplete:(BOOL)a9;
- (void)queuingScrollView:(id)a3 didFlushView:(id)a4 animated:(BOOL)a5;
- (void)queuingScrollView:(id)a3 willManuallyScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 animated:(BOOL)a7;
- (void)queuingScrollViewDidFinishScrolling:(id)a3;
- (void)setDataSource:(id)dataSource;
- (void)setDelegate:(id)delegate;
- (void)setDoubleSided:(BOOL)doubleSided;
- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void *)completion;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillUnload;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation UIPageViewController

+ (BOOL)_isSupportedTransitionStyle:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)_isNavigationOrientation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)_isSpineLocation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4
{
  BOOL v5 = a3 == 101 || (unint64_t)(a3 - 1) < 3;
  if (a4) {
    return a3 == 0;
  }
  else {
    return v5;
  }
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  uint64_t v3 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:sel_preferredInterfaceOrientationForPresentation inBaseClass:v3];
}

- (UIPageViewController)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options
{
  v8 = options;
  v17.receiver = self;
  v17.super_class = (Class)UIPageViewController;
  v9 = [(UIViewController *)&v17 initWithNibName:0 bundle:0];
  if (v9)
  {
    if (![(id)objc_opt_class() _isSupportedTransitionStyle:style]) {
      style = UIPageViewControllerTransitionStylePageCurl;
    }
    if ([(id)objc_opt_class() _isNavigationOrientation:navigationOrientation supportedForTransitionStyle:style])v10 = (void *)navigationOrientation; {
    else
    }
      v10 = 0;
    UIPageViewControllerCommonInitWithTransitionStyleAndNavigationOrientation(v9, (void *)style, v10);
    if (v8)
    {
      if (style == UIPageViewControllerTransitionStyleScroll)
      {
        v14 = [(NSDictionary *)v8 objectForKey:@"UIPageViewControllerOptionInterPageSpacingKey"];
        [v14 floatValue];
        [(UIPageViewController *)v9 _setPageSpacing:v15];
      }
      else if (style == UIPageViewControllerTransitionStylePageCurl)
      {
        v11 = [(NSDictionary *)v8 objectForKey:@"UIPageViewControllerOptionSpineLocationKey"];

        if (v11)
        {
          v12 = [(NSDictionary *)v8 objectForKey:@"UIPageViewControllerOptionSpineLocationKey"];
          uint64_t v13 = [v12 integerValue];

          if ([(id)objc_opt_class() _isSpineLocation:v13 supportedForTransitionStyle:v9->_transitionStyle])-[UIPageViewController _setSpineLocation:](v9, "_setSpineLocation:", v13); {
        }
          }
      }
    }
  }

  return v9;
}

- (UIPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(UIPageViewController *)self initWithTransitionStyle:0 navigationOrientation:0 options:0];
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPageViewController;
  [(UIViewController *)&v11 encodeWithCoder:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v4 encodeConditionalObject:v6 forKey:@"UIDelegate"];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_dataSource);

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v4 encodeConditionalObject:v8 forKey:@"UIDataSource"];
  }
  [v4 encodeInteger:self->_transitionStyle forKey:@"UITransitionStyle"];
  [v4 encodeInteger:self->_navigationOrientation forKey:@"UINavigationOrientation"];
  [v4 encodeInteger:self->_spineLocation forKey:@"UISpineLocation"];
  [v4 encodeBool:self->_doubleSided forKey:@"UIDoubleSided"];
  viewControllers = self->_viewControllers;
  v10 = [(UIViewController *)self childViewControllers];
  LODWORD(viewControllers) = [(NSArray *)viewControllers isEqual:v10];

  if (viewControllers) {
    [v4 encodeBool:1 forKey:@"UIViewControllersAreChildren"];
  }
  else {
    [v4 encodeObject:self->_viewControllers forKey:@"UIViewControllers"];
  }
  [v4 encodeInteger:(uint64_t)self->_pageSpacing forKey:@"UIPageSpacing"];
}

- (UIPageViewController)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v15.receiver = self;
  v15.super_class = (Class)UIPageViewController;
  BOOL v5 = [(UIViewController *)&v15 initWithCoder:v4];
  if (v5)
  {
    if ([(NSCoder *)v4 containsValueForKey:@"UITransitionStyle"])
    {
      id v6 = [(NSCoder *)v4 decodeIntegerForKey:@"UITransitionStyle"];
      if (![(id)objc_opt_class() _isSupportedTransitionStyle:v6]) {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UINavigationOrientation"])
    {
      uint64_t v7 = [(NSCoder *)v4 decodeIntegerForKey:@"UINavigationOrientation"];
      if ([(id)objc_opt_class() _isNavigationOrientation:v7 supportedForTransitionStyle:v6])id v8 = (void *)v7; {
      else
      }
        id v8 = 0;
    }
    else
    {
      id v8 = 0;
    }
    UIPageViewControllerCommonInitWithTransitionStyleAndNavigationOrientation(v5, v6, v8);
    v5->_doubleSided = [(NSCoder *)v4 decodeBoolForKey:@"UIDoubleSided"];
    if ([(NSCoder *)v4 containsValueForKey:@"UISpineLocation"])
    {
      uint64_t v9 = [(NSCoder *)v4 decodeIntegerForKey:@"UISpineLocation"];
      if ([(id)objc_opt_class() _isSpineLocation:v9 supportedForTransitionStyle:v5->_transitionStyle])-[UIPageViewController _setSpineLocation:](v5, "_setSpineLocation:", v9); {
    }
      }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIViewControllersAreChildren"]) {
      [(UIViewController *)v5 childViewControllers];
    }
    else {
    uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIViewControllers"];
    }
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = (NSArray *)v10;

    v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIDelegate"];
    [(UIPageViewController *)v5 setDelegate:v12];

    uint64_t v13 = [(NSCoder *)v4 decodeObjectForKey:@"UIDataSource"];
    [(UIPageViewController *)v5 setDataSource:v13];

    [(UIPageViewController *)v5 _setPageSpacing:(double)[(NSCoder *)v4 decodeIntegerForKey:@"UIPageSpacing"]];
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 2, 0, (void *)1);
  }

  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = v5;
  if (v5) {
    objc_setAssociatedObject(v5, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
  }

  uint64_t v7 = [(UIGestureRecognizer *)self->_panGestureRecognizer view];
  [v7 removeGestureRecognizer:self->_panGestureRecognizer];

  [(UIGestureRecognizer *)self->_panGestureRecognizer removeTarget:self action:sel__handlePanGesture_];
  id v8 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
  [v8 removeGestureRecognizer:self->_tapGestureRecognizer];

  [(UIGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:sel__handleTapGesture_];
  tapRegions = self->_tapRegions;
  if (tapRegions)
  {
    free(tapRegions);
    self->_tapRegions = 0;
  }
  uint64_t v10 = [(UIPageViewController *)self _contentView];

  if (v10)
  {
    objc_super v11 = [(UIPageViewController *)self _contentView];
    [v11 invalidatePageViewController];
  }
  v12.receiver = self;
  v12.super_class = (Class)UIPageViewController;
  [(UIViewController *)&v12 dealloc];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  if (!v4)
  {
LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  char v5 = dyld_program_sdk_at_least();
  id v6 = v4;
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v7 = objc_msgSend(v4, sel_allowsWeakReference);
    id v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__UIPageViewController_setDelegate___block_invoke;
      block[3] = &unk_1E52D9F98;
      id v29 = v4;
      v30 = self;
      if (setDelegate__once_1 != -1) {
        dispatch_once(&setDelegate__once_1, block);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = WeakRetained;
  if (self->_unsafeUnretainedDelegate != v8)
  {
    self->_unsafeUnretainedDelegate = v8;
    if (WeakRetained) {
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    }
    objc_storeWeak((id *)&self->_delegate, v8);
    objc_super v11 = v8;
    objc_super v12 = [(UIPageViewController *)self delegate];
    if (v11 == v12)
    {
      unsigned int v13 = [(UIPageViewController *)self allowsWeakReference];

      if (v11 && v13)
      {
        objc_initWeak(&location, self);
        v14 = [_UIWeakHelper alloc];
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __36__UIPageViewController_setDelegate___block_invoke_89;
        v25 = &unk_1E52DC308;
        objc_copyWeak(&v26, &location);
        objc_super v15 = [(_UIWeakHelper *)v14 initWithDeallocationBlock:&v22];
        objc_setAssociatedObject(v11, (char *)&self->super.super.super.isa + 1, v15, (void *)1);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 2;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 4;
    }
    else {
      __int16 v17 = 0;
    }
    __int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v17;
    *(_WORD *)&self->___int16 delegateFlags = delegateFlags;
    if (self->_transitionStyle)
    {
      __int16 v19 = 0;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v19 = 8;
      }
      else {
        __int16 v19 = 0;
      }
      __int16 delegateFlags = (__int16)self->_delegateFlags;
    }
    *(_WORD *)&self->___int16 delegateFlags = delegateFlags & 0xFFF7 | v19;
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = 16;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v20;
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 32;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v21;
    [(UIPageViewController *)self _updatePageControlViaDataSourceIfNecessary];
  }
}

void __36__UIPageViewController_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &kUIPageViewControllerNavigationDirectionUndetermined_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __36__UIPageViewController_setDelegate___block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (!v2) {
      [v3 setDelegate:0];
    }

    id WeakRetained = v3;
  }
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return WeakRetained;
}

- (void)setDataSource:(id)dataSource
{
  id v4 = dataSource;
  if (!v4)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  char v5 = dyld_program_sdk_at_least();
  uint64_t v6 = v4;
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v7 = objc_msgSend(v4, sel_allowsWeakReference);
    uint64_t v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__UIPageViewController_setDataSource___block_invoke;
      block[3] = &unk_1E52D9F98;
      id v33 = v4;
      v34 = self;
      if (setDataSource__once_0 != -1) {
        dispatch_once(&setDataSource__once_0, block);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  uint64_t v8 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v10 = WeakRetained;
  if (self->_unsafeUnretainedDataSource != v8)
  {
    self->_unsafeUnretainedDataSource = v8;
    if (WeakRetained) {
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 2, 0, (void *)1);
    }
    objc_storeWeak((id *)&self->_dataSource, v8);
    objc_super v11 = v8;
    objc_super v12 = [(UIPageViewController *)self dataSource];
    if (v11 == v12)
    {
      unsigned int v13 = [(UIPageViewController *)self allowsWeakReference];

      if (v11 && v13)
      {
        objc_initWeak(&location, self);
        v14 = [_UIWeakHelper alloc];
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        v28 = __38__UIPageViewController_setDataSource___block_invoke_102;
        id v29 = &unk_1E52DC308;
        objc_copyWeak(&v30, &location);
        objc_super v15 = [(_UIWeakHelper *)v14 initWithDeallocationBlock:&v26];
        objc_setAssociatedObject(v11, (char *)&self->super.super.super.isa + 2, v15, (void *)1);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 64;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 128;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 256;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 512;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v19;
    if ([(UIViewController *)self isViewLoaded])
    {
      int v20 = [(UIPageViewController *)self _canHandleGestures];
      __int16 v21 = [(UIPageViewController *)self _scrollView];
      int v22 = [v21 isScrollEnabled];

      if (v20 != v22)
      {
        uint64_t v23 = [(UIPageViewController *)self _scrollView];
        objc_msgSend(v23, "setScrollEnabled:", -[UIPageViewController _canHandleGestures](self, "_canHandleGestures"));
      }
      v24 = [(UIPageViewController *)self _scrollView];
      [v24 _invalidateOffscreenViews];

      v25 = [(UIPageViewController *)self _contentView];
      [v25 setNeedsLayout];
    }
  }
}

void __38__UIPageViewController_setDataSource___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &kUIPageViewControllerNavigationDirectionUndetermined_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as dataSource. This will be a hard crash in the future. Offending object: %@ hosting object: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __38__UIPageViewController_setDataSource___block_invoke_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained dataSource];
    if (!v2) {
      [v3 setDataSource:0];
    }

    id WeakRetained = v3;
  }
}

- (int64_t)_transitionStyle
{
  return self->_transitionStyle;
}

- (int64_t)_navigationOrientation
{
  return self->_navigationOrientation;
}

- (void)_setSpineLocation:(int64_t)a3
{
  if (self->_transitionStyle)
  {
    BOOL v3 = 0;
    self->_spineLocation = 0;
LABEL_3:
    self->_doubleSided = v3;
    return;
  }
  if (self->_spineLocation != a3)
  {
    self->_spineLocation = a3;
    if (a3 == 2)
    {
      BOOL v3 = 1;
      goto LABEL_3;
    }
  }
}

- (UIPageViewControllerSpineLocation)spineLocation
{
  return self->_spineLocation;
}

- (BOOL)isDoubleSided
{
  return self->_doubleSided;
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  if (!self->_transitionStyle && self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    if (!self->_stashingViewControllersForRotation && !doubleSided && self->_spineLocation == 2) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"If 'UIPageViewControllerSpineLocationMid' is specified, 'doubleSided' must be 'YES'." format];
    }
  }
}

- (NSArray)gestureRecognizers
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_panGestureRecognizer, self->_tapGestureRecognizer, 0);
}

- (NSArray)viewControllers
{
  int64_t transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    __int16 v7 = [(NSArray *)self->_viewControllers _ui_onlyObject];
    uint64_t v8 = objc_msgSend(v6, "arrayWithObjects:", v7, 0);
  }
  else if (transitionStyle)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (self->_stashingViewControllersForRotation
      && [(NSArray *)self->_viewControllersStashedForRotation count])
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
      viewControllersStashedForRotation = self->_viewControllersStashedForRotation;
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
      viewControllersStashedForRotation = self->_viewControllers;
    }
    uint64_t v8 = [v4 arrayWithArray:viewControllersStashedForRotation];
  }
  return (NSArray *)v8;
}

- (void)_invalidateEffectiveTapRegions
{
  *(_OWORD *)&self->_effectiveTapRegionInsets.top = 0u;
  *(_OWORD *)&self->_effectiveTapRegionInsets.bottom = 0u;
  self->_effectiveTapRegionBreadths = (CGSize)*MEMORY[0x1E4F1DB30];
  tapRegions = self->_tapRegions;
  if (tapRegions)
  {
    free(tapRegions);
    self->_tapRegions = 0;
  }
}

- (UIEdgeInsets)_effectiveTapRegionInsets
{
  p_effectiveTapRegionInsets = &self->_effectiveTapRegionInsets;
  double top = self->_effectiveTapRegionInsets.top;
  double left = self->_effectiveTapRegionInsets.left;
  double bottom = self->_effectiveTapRegionInsets.bottom;
  double right = self->_effectiveTapRegionInsets.right;
  if (top == 0.0 && bottom == 0.0 && left == 0.0 && right == 0.0)
  {
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_tapRegionInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_tapRegionInsets.bottom))))))
    {
      long long v8 = *(_OWORD *)&self->_tapRegionInsets.bottom;
      *(_OWORD *)&p_effectiveTapRegionInsets->double top = *(_OWORD *)&self->_tapRegionInsets.top;
      *(_OWORD *)&self->_effectiveTapRegionInsets.double bottom = v8;
    }
    uint64_t v9 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    [v9 bounds];
    double Height = CGRectGetHeight(v15);

    objc_super v11 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    [v11 bounds];
    double Width = CGRectGetWidth(v16);

    double v13 = p_effectiveTapRegionInsets->left;
    double top = fmax(p_effectiveTapRegionInsets->top, 0.0);
    if (Height <= top) {
      double top = Height;
    }
    double bottom = Height - top;
    double v14 = fmax(p_effectiveTapRegionInsets->bottom, 0.0);
    if (Height - top > v14) {
      double bottom = v14;
    }
    double right = fmax(p_effectiveTapRegionInsets->right, 0.0);
    if (Width <= right) {
      double right = Width;
    }
    p_effectiveTapRegionInsets->double bottom = bottom;
    p_effectiveTapRegionInsets->double right = right;
    double left = fmax(v13, 0.0);
    if (Width - right <= left) {
      double left = Width - right;
    }
    p_effectiveTapRegionInsets->double top = top;
    p_effectiveTapRegionInsets->double left = left;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setTapRegionInsets:(UIEdgeInsets)a3
{
  if (self->_tapRegionInsets.left != a3.left
    || self->_tapRegionInsets.top != a3.top
    || self->_tapRegionInsets.right != a3.right
    || self->_tapRegionInsets.bottom != a3.bottom)
  {
    self->_tapRegionInsets = a3;
    [(UIPageViewController *)self _invalidateEffectiveTapRegions];
  }
}

- (CGSize)_effectiveTapRegionBreadths
{
  p_effectiveTapRegionBreadths = &self->_effectiveTapRegionBreadths;
  double width = self->_effectiveTapRegionBreadths.width;
  double height = self->_effectiveTapRegionBreadths.height;
  if (width == 0.0 && height == 0.0)
  {
    if (self->_tapRegionBreadths.width == 0.0 && self->_tapRegionBreadths.height == 0.0)
    {
      uint64_t v6 = +[UIDevice currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      double v8 = 80.0;
      if (self->_spineLocation == 2) {
        double v8 = 60.0;
      }
      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v9 = dbl_186B942A0[self->_spineLocation == 2];
      }
      else {
        double v9 = v8;
      }
      p_effectiveTapRegionBreadths->double width = v9;
      p_effectiveTapRegionBreadths->double height = v9;
    }
    else
    {
      CGSize *p_effectiveTapRegionBreadths = self->_tapRegionBreadths;
      double v9 = p_effectiveTapRegionBreadths->width;
    }
    uint64_t v10 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    [v10 bounds];
    double v11 = CGRectGetWidth(v17) * 0.5;

    if (v9 <= v11) {
      double v12 = v9;
    }
    else {
      double v12 = v11;
    }
    p_effectiveTapRegionBreadths->double width = v12;
    double v13 = p_effectiveTapRegionBreadths->height;
    double v14 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    [v14 bounds];
    double v15 = CGRectGetHeight(v18) * 0.5;

    if (v13 <= v15) {
      double height = v13;
    }
    else {
      double height = v15;
    }
    p_effectiveTapRegionBreadths->double height = height;
    double width = p_effectiveTapRegionBreadths->width;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setTapRegionBreadths:(CGSize)a3
{
  if (self->_tapRegionBreadths.width != a3.width || self->_tapRegionBreadths.height != a3.height)
  {
    self->_tapRegionBreadths = a3;
    [(UIPageViewController *)self _invalidateEffectiveTapRegions];
  }
}

- (CGRect)_disabledScrollingRegion
{
  BOOL v3 = [(UIPageViewController *)self _scrollView];
  if (v3)
  {
    uint64_t v4 = [(UIPageViewController *)self _scrollView];
    [v4 disabledScrollingRegion];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setDisabledScrollingRegion:(CGRect)a3
{
  if (self->_transitionStyle == 1)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v7 = [(UIPageViewController *)self _scrollView];
    objc_msgSend(v7, "setDisabledScrollingRegion:", x, y, width, height);
  }
}

- (_UIPageViewControllerContentView)_contentView
{
  if ([(UIViewController *)self isViewLoaded])
  {
    BOOL v3 = [(UIViewController *)self view];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (_UIPageViewControllerContentView *)v3;
}

- (_UIQueuingScrollView)_scrollView
{
  v2 = [(UIPageViewController *)self _contentView];
  BOOL v3 = [v2 scrollView];

  return (_UIQueuingScrollView *)v3;
}

- (BOOL)_isPageControlVisible
{
  return self->_transitionStyle == 1
      && (~*(_WORD *)&self->_delegateFlags & 0x300) == 0
      && self->_navigationOrientation == 0;
}

- (id)_pageControl
{
  v2 = [(UIPageViewController *)self _contentView];
  BOOL v3 = [v2 pageControl];

  return v3;
}

- (CGSize)_contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v5 = [(UIPageViewController *)self _navigationOrientation];
  if (v5) {
    double v6 = width;
  }
  else {
    double v6 = width * 3.0;
  }
  if (v5) {
    double v7 = height * 3.0;
  }
  else {
    double v7 = height;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (double)_pageSpacing
{
  return self->_pageSpacing;
}

- (void)_setPageSpacing:(double)a3
{
  if (self->_transitionStyle == 1)
  {
    double v3 = ceil(a3 * 0.5);
    double v4 = v3 + v3;
    BOOL v5 = v3 <= 0.0;
    double v6 = 0.0;
    if (!v5) {
      double v6 = v4;
    }
    if (self->_pageSpacing != v6)
    {
      self->_pageSpacing = v6;
      id v7 = [(UIPageViewController *)self _contentView];
      [v7 setNeedsLayout];
    }
  }
}

- (void)loadView
{
  double v3 = [_UIPageViewControllerContentView alloc];
  [(UIViewController *)self _defaultInitialViewFrame];
  double v14 = -[_UIPageViewControllerContentView initWithFrame:andPageViewController:](v3, "initWithFrame:andPageViewController:", self);
  [(UIViewController *)self setView:v14];
  [(UIView *)v14 setOpaque:0];
  int64_t transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    int v7 = [(UIPageViewController *)self _canHandleGestures];
    double v8 = [(UIPageViewController *)self _scrollView];
    int v9 = [v8 isScrollEnabled];

    if (v7 != v9)
    {
      double v10 = [(UIPageViewController *)self _scrollView];
      objc_msgSend(v10, "setScrollEnabled:", -[UIPageViewController _canHandleGestures](self, "_canHandleGestures"));
    }
    double v11 = [(UIPageViewController *)self _scrollView];
    double v12 = [v11 visibleView];
    if (v12)
    {
    }
    else
    {
      NSUInteger v13 = [(NSArray *)self->_viewControllers count];

      if (v13) {
        [(UIPageViewController *)self _setViewControllers:self->_viewControllers withScrollInDirection:0 animated:0 completion:0];
      }
    }
  }
  else if (!transitionStyle)
  {
    BOOL v5 = [(UIGestureRecognizer *)self->_panGestureRecognizer view];

    if (!v5) {
      [(UIView *)v14 addGestureRecognizer:self->_panGestureRecognizer];
    }
    double v6 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];

    if (!v6) {
      [(UIView *)v14 addGestureRecognizer:self->_tapGestureRecognizer];
    }
    if (!self->_pageCurl && [(NSArray *)self->_viewControllers count]) {
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllers, 1, 0, 0, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
}

- (void)viewWillUnload
{
  v4.receiver = self;
  v4.super_class = (Class)UIPageViewController;
  [(UIViewController *)&v4 viewWillUnload];
  double v3 = [(UIPageViewController *)self _contentView];
  [v3 invalidatePageViewController];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  *a4 = 1;
  [(UIViewController *)self _contentOverlayInsets];
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  double v8 = [(UIViewController *)self _existingView];
  int v9 = [v8 _shouldReverseLayoutDirection];

  [(UIViewController *)self systemMinimumLayoutMargins];
  if (v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  *a4 = v12;
  if (v9) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  *a5 = v13;
}

- (void)_child:(id)a3 beginAppearanceTransition:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (![(UIViewController *)self _forwardAppearanceMethods])
  {
    id v8 = (id)[v9 view];
    [v9 beginAppearanceTransition:v6 animated:v5];
  }
}

- (BOOL)_child:(id)a3 canBeginAppearanceTransition:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6 && ![(UIViewController *)self _forwardAppearanceMethods])
  {
    int v9 = [v6 _appearState];
    if (v4)
    {
      if (v9 != 3)
      {
        int v10 = 0;
LABEL_11:
        BOOL v7 = [v6 _appearState] == v10;
        goto LABEL_4;
      }
    }
    else if (v9 != 1)
    {
      int v10 = 2;
      goto LABEL_11;
    }
    BOOL v7 = 1;
    goto LABEL_4;
  }
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (void)_child:(id)a3 beginAppearanceTransitionIfPossible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (-[UIPageViewController _child:canBeginAppearanceTransition:](self, "_child:canBeginAppearanceTransition:")) {
    [(UIPageViewController *)self _child:v8 beginAppearanceTransition:v6 animated:v5];
  }
}

- (void)_childEndAppearanceTransition:(id)a3
{
  id v4 = a3;
  if (![(UIViewController *)self _forwardAppearanceMethods]) {
    [v4 endAppearanceTransition];
  }
}

- (BOOL)_childCanEndAppearanceTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && ![(UIViewController *)self _forwardAppearanceMethods]
    && ([v4 _appearState] == 3 || objc_msgSend(v4, "_appearState") == 1);

  return v5;
}

- (void)_child:(id)a3 endAppearanceTransitionIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  id v10 = v6;
  if (v6)
  {
    int v8 = [v6 _appearState];
    BOOL v9 = v4 ? v8 == 3 : v8 == 1;
    id v7 = v10;
    if (v9)
    {
      [(UIPageViewController *)self _child:v10 beginAppearanceTransitionIfPossible:v4 animated:0];
      id v7 = v10;
    }
  }
  if ([(UIPageViewController *)self _childCanEndAppearanceTransition:v7]) {
    [(UIPageViewController *)self _childEndAppearanceTransition:v10];
  }
}

- (void)_child:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  if (![(UIViewController *)self _forwardRotationMethods]) {
    [v8 willRotateToInterfaceOrientation:a4 duration:a5];
  }
}

- (void)_child:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  if (![(UIViewController *)self _forwardRotationMethods]) {
    [v8 willAnimateRotationToInterfaceOrientation:a4 duration:a5];
  }
}

- (void)_child:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  if (![(UIViewController *)self _forwardRotationMethods]) {
    [v6 didRotateFromInterfaceOrientation:a4];
  }
}

- (void)_sendChildViewWill:(BOOL)a3 appear:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(UIViewController *)self isViewLoaded] && [(NSArray *)self->_viewControllers count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v9 = self->_viewControllers;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "isViewLoaded", (void)v15))
          {
            if (v7) {
              [(UIPageViewController *)self _child:v14 beginAppearanceTransitionIfPossible:v6 animated:v5];
            }
            else {
              [(UIPageViewController *)self _child:v14 endAppearanceTransitionIfPossible:v6];
            }
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIPageViewController;
  -[UIViewController viewWillAppear:](&v13, sel_viewWillAppear_);
  if (!self->_transitionStyle)
  {
    BOOL v5 = [(UIViewController *)self _window];

    if (!v5)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v11 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Window should be nonnil here unless a subclass is mistakenly sending this to a child when no window can be found", v12, 2u);
        }
      }
      else
      {
        uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &viewWillAppear____s_category) + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Window should be nonnil here unless a subclass is mistakenly sending this to a child when no window can be found", v12, 2u);
        }
      }
    }
    BOOL v6 = [(UIViewController *)self _window];
    if (v6)
    {
      BOOL v7 = (void *)UIApp;
      id v8 = [(UIViewController *)self _window];
      int64_t v9 = -[UIPageViewController _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:](self, "_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:", [v7 _sceneInterfaceOrientationFromWindow:v8]);
    }
    else
    {
      int64_t v9 = [(UIPageViewController *)self _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:0];
    }

    if (v9 && v9 != self->_spineLocation)
    {
      [(UIPageViewController *)self _setSpineLocation:v9];
      [(UIPageViewController *)self _invalidatePageCurl];
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllersStashedForRotation, 1, 0, 0, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    [(UIPageViewController *)self _setViewControllersStashedForRotation:0];
  }
  [(UIPageViewController *)self _sendChildViewWill:1 appear:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  [(UIPageViewController *)self _sendChildViewWill:0 appear:1 animated:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UIPageViewController *)self _sendChildViewWill:1 appear:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  [(UIPageViewController *)self _sendChildViewWill:0 appear:0 animated:v3];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  viewControllers = self->_viewControllers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__UIPageViewController_shouldAutorotateToInterfaceOrientation___block_invoke;
  v6[3] = &unk_1E52DE018;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSArray *)viewControllers enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __63__UIPageViewController_shouldAutorotateToInterfaceOrientation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 shouldAutorotateToInterfaceOrientation:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v5 = [WeakRetained pageViewControllerSupportedInterfaceOrientations:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPageViewController;
    return [(UIViewController *)&v6 supportedInterfaceOrientations];
  }
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  if ([(UIViewController *)&v5 _hasPreferredInterfaceOrientationForPresentation])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = dyld_program_sdk_at_least();
    if (v3) {
      return (*(_WORD *)&self->_delegateFlags >> 5) & 1;
    }
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if ((*(_WORD *)&self->_delegateFlags & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v5 = [WeakRetained pageViewControllerPreferredInterfaceOrientationForPresentation:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPageViewController;
    return [(UIViewController *)&v6 preferredInterfaceOrientationForPresentation];
  }
}

+ (id)stringForSpineLocation:(int64_t)a3
{
  char v4 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown Spine Location (%ld)", a3);
  if ((unint64_t)a3 <= 3)
  {
    int64_t v5 = off_1E52E8F98[a3];

    char v4 = v5;
  }
  return v4;
}

- (_NSRange)_validRangeForPresentationOfViewControllersWithSpineLocation:(int64_t)a3
{
  if (a3 == 2) {
    NSUInteger v3 = 2;
  }
  else {
    NSUInteger v3 = 1;
  }
  NSUInteger v4 = 0;
  result.length = v3;
  result.id location = v4;
  return result;
}

- (id)_validatedViewControllersForPresentationOfViewControllers:(id)a3 validRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  if ([v6 count] == length)
  {
    uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", location, length);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_viewControllersForPendingSpineLocation:(int64_t)a3
{
  uint64_t v5 = -[UIPageViewController _validRangeForPresentationOfViewControllersWithSpineLocation:](self, "_validRangeForPresentationOfViewControllersWithSpineLocation:");
  uint64_t v7 = v6;
  if ([(NSArray *)self->_viewControllersStashedForRotation count])
  {
    id v8 = self->_viewControllersStashedForRotation;
    uint64_t v9 = -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v8, v5, v7);
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = 0;
  }
  if ([(NSArray *)self->_viewControllersStashedForRotation count]
    || (char v10 = self->_viewControllers,
        v8,
        -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v10, v5, v7), v9 = objc_claimAutoreleasedReturnValue(), id v8 = v10, !v9))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = [(NSArray *)v8 count];
    double v14 = [(id)objc_opt_class() stringForSpineLocation:a3];
    [v11 raise:v12, @"The number of provided view controllers (%ld) doesn't match the number required (%ld) for the requested spine location (%@)", v13, v7, v14 format];

    uint64_t v9 = 0;
  }
LABEL_8:

  return v9;
}

- (void)_invalidatePageCurl
{
  [(_UIPageCurl *)self->_pageCurl _cancelAllActiveTransitionsAndAbandonCallbacks:1];
  pageCurl = self->_pageCurl;
  self->_pageCurl = 0;
}

- (int64_t)_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_delegateFlags & 8) != 0)
  {
    self->_stashingViewControllersForRotation = 1;
    int64_t v7 = [WeakRetained pageViewController:self spineLocationForInterfaceOrientation:a3];
    if (([(id)objc_opt_class() _isSpineLocation:v7 supportedForTransitionStyle:self->_transitionStyle] & 1) == 0)
    {
      id v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      char v10 = [(id)objc_opt_class() stringForSpineLocation:v7];
      [v8 raise:v9, @"'%@' is not a valid spine location", v10 format];
    }
    self->_stashingViewControllersForRotation = 0;
    uint64_t v11 = [(UIPageViewController *)self _viewControllersForPendingSpineLocation:v7];
    [(UIPageViewController *)self _setViewControllersStashedForRotation:v11];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  self->_interfaceRotating = 1;
  [(UIPageViewController *)self _invalidatePageCurl];
  if (self->_transitionStyle) {
    goto LABEL_2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_2;
  }
  __int16 delegateFlags = (__int16)self->_delegateFlags;

  if ((delegateFlags & 8) == 0) {
    goto LABEL_2;
  }
  double v14 = [UISnapshotView alloc];
  long long v15 = [(UIViewController *)self view];
  [v15 bounds];
  long long v16 = -[UISnapshotView initWithFrame:](v14, "initWithFrame:");

  rotationSnapshotViews = self->_rotationSnapshotViews;
  if (!rotationSnapshotViews)
  {
    long long v18 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    __int16 v19 = self->_rotationSnapshotViews;
    self->_rotationSnapshotViews = v18;

    rotationSnapshotViews = self->_rotationSnapshotViews;
  }
  [(NSMutableArray *)rotationSnapshotViews addObject:v16];
  uint64_t v20 = [(UIViewController *)self view];
  [(UISnapshotView *)v16 captureSnapshotOfView:v20 withSnapshotType:1];

  int64_t v21 = [(UIPageViewController *)self _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:a3];
  int v22 = self->_viewControllersStashedForRotation;
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation == 2 || v21 != 2)
  {
    if (spineLocation == 2 && v21 != 2)
    {
      int64_t spineLocation = 2;
      goto LABEL_23;
    }
    if (([(NSArray *)self->_viewControllers isEqual:v22] & 1) == 0)
    {
      int64_t spineLocation = self->_spineLocation;
      goto LABEL_23;
    }

LABEL_2:
    [(UIPageViewController *)self _setViewControllersStashedForRotation:self->_viewControllers];
    [(NSMutableArray *)self->_rotationSnapshotViews removeAllObjects];
    goto LABEL_3;
  }
LABEL_23:
  v77 = v16;
  self->_spineLocationPriorToInterfaceRotation = spineLocation;
  [(UIPageViewController *)self _setSpineLocation:v21];
  v24 = self->_viewControllers;
  v25 = [UISnapshotView alloc];
  uint64_t v26 = [(UIViewController *)self view];
  [v26 bounds];
  uint64_t v27 = -[UISnapshotView initWithFrame:](v25, "initWithFrame:");

  [(NSMutableArray *)self->_rotationSnapshotViews addObject:v27];
  if (self->_spineLocationPriorToInterfaceRotation == 2 && self->_spineLocation != 2)
  {
    v28 = [(NSArray *)v22 _ui_onlyObject];
    BOOL v29 = [(NSArray *)v24 containsObject:v28];

    if (v29)
    {
      id v30 = [(NSArray *)v22 _ui_onlyObject];
      v31 = [v30 view];
      [v31 frame];
      -[UISnapshotView setFrame:](v27, "setFrame:");
    }
  }

  v32 = [(UIViewController *)self view];
  [v32 bounds];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  int64_t v41 = self->_spineLocation;
  if (self->_spineLocationPriorToInterfaceRotation == 2)
  {
    if (v41 != 2)
    {
      v42 = [(NSArray *)v22 _ui_onlyObject];
      uint64_t v43 = [(NSArray *)v24 indexOfObject:v42];

      v84.origin.double x = v34;
      v84.origin.double y = v36;
      v84.size.double width = v38;
      v84.size.double height = v40;
      double MinX = CGRectGetMinX(v84);
      double Height = 0.0;
      double Width = 0.0;
      if (!self->_navigationOrientation && v43 == 1)
      {
        v85.origin.double x = v34;
        v85.origin.double y = v36;
        v85.size.double width = v38;
        v85.size.double height = v40;
        double Width = CGRectGetWidth(v85);
      }
      v86.origin.double x = v34;
      v86.origin.double y = v36;
      v86.size.double width = v38;
      v86.size.double height = v40;
      double MinY = CGRectGetMinY(v86);
      if (self->_navigationOrientation == 1 && v43 == 1)
      {
        v87.origin.double x = v34;
        v87.origin.double y = v36;
        v87.size.double width = v38;
        v87.size.double height = v40;
        double Height = CGRectGetHeight(v87);
      }
      double v73 = MinY + Height;
      double v75 = MinX + Width;
      v88.origin.double x = v34;
      v88.origin.double y = v36;
      v88.size.double width = v38;
      v88.size.double height = v40;
      double v47 = CGRectGetWidth(v88);
      if (self->_navigationOrientation) {
        double v48 = 1.0;
      }
      else {
        double v48 = 2.0;
      }
      double v49 = v47 / v48;
      v89.origin.double x = v34;
      v89.origin.double y = v36;
      v89.size.double width = v38;
      v89.size.double height = v40;
      double v50 = CGRectGetHeight(v89);
      if (self->_navigationOrientation == 1) {
        double v51 = 2.0;
      }
      else {
        double v51 = 1.0;
      }
      double v40 = v50 / v51;
LABEL_56:
      double v36 = v73;
      double v34 = v75;
      double v38 = v49;
    }
  }
  else if (v41 == 2)
  {
    v52 = [(NSArray *)v24 _ui_onlyObject];
    uint64_t v53 = [(NSArray *)v22 indexOfObject:v52];

    v90.origin.double x = v34;
    v90.origin.double y = v36;
    v90.size.double width = v38;
    v90.size.double height = v40;
    double v76 = CGRectGetMinX(v90);
    double v54 = 0.0;
    double v55 = 0.0;
    if (!self->_navigationOrientation && v53 == 1)
    {
      v91.origin.double x = v34;
      v91.origin.double y = v36;
      v91.size.double width = v38;
      v91.size.double height = v40;
      double v55 = CGRectGetWidth(v91);
    }
    v92.origin.double x = v34;
    v92.origin.double y = v36;
    v92.size.double width = v38;
    v92.size.double height = v40;
    double v56 = CGRectGetMinY(v92);
    if (self->_navigationOrientation == 1 && v53 == 1)
    {
      v93.origin.double x = v34;
      v93.origin.double y = v36;
      v93.size.double width = v38;
      v93.size.double height = v40;
      double v54 = CGRectGetHeight(v93);
    }
    double v73 = v56 - v54;
    double v75 = v76 - v55;
    v94.origin.double x = v34;
    v94.origin.double y = v36;
    v94.size.double width = v38;
    v94.size.double height = v40;
    double v57 = CGRectGetWidth(v94);
    if (self->_navigationOrientation) {
      double v58 = 1.0;
    }
    else {
      double v58 = 2.0;
    }
    double v49 = v57 * v58;
    v95.origin.double x = v34;
    v95.origin.double y = v36;
    v95.size.double width = v38;
    v95.size.double height = v40;
    double v59 = CGRectGetHeight(v95);
    if (self->_navigationOrientation == 1) {
      double v60 = 2.0;
    }
    else {
      double v60 = 1.0;
    }
    double v40 = v59 * v60;
    v61 = [(NSArray *)v22 objectAtIndex:v53 == 0];
    v62 = [v61 view];
    [v62 setAlpha:0.0];

    goto LABEL_56;
  }
  v63 = [_UIPageCurl alloc];
  int64_t v64 = self->_spineLocation;
  if (v64 == 101)
  {
    uint64_t v65 = 3;
  }
  else
  {
    uint64_t v66 = 2;
    if (v64 == 2) {
      uint64_t v66 = 8;
    }
    if (v64 == 3) {
      uint64_t v66 = 32;
    }
    uint64_t v67 = 4;
    if (v64 != 2) {
      uint64_t v67 = 1;
    }
    BOOL v68 = v64 == 3;
    uint64_t v69 = 16;
    if (!v68) {
      uint64_t v69 = v67;
    }
    if (self->_navigationOrientation) {
      uint64_t v65 = v66;
    }
    else {
      uint64_t v65 = v69;
    }
  }
  v70 = [(UIViewController *)self view];
  v71 = -[_UIPageCurl initWithSpineLocation:andContentRect:inContentView:](v63, "initWithSpineLocation:andContentRect:inContentView:", v65, v70, v34, v36, v38, v40);
  pageCurl = self->_pageCurl;
  self->_pageCurl = v71;

  -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v22, 1, 0, 0, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(UIPageViewController *)self _setViewControllersStashedForRotation:v24];

LABEL_3:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  int64_t v7 = self->_viewControllers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v79 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UIPageViewController *)self _child:*(void *)(*((void *)&v78 + 1) + 8 * i) willRotateToInterfaceOrientation:a3 duration:a4];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v78 objects:v82 count:16];
    }
    while (v9);
  }

  [(UIPageViewController *)self _invalidatePageCurl];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if (self->_transitionStyle) {
    goto LABEL_53;
  }
  if (![(NSArray *)self->_viewControllersStashedForRotation count])
  {
    uint64_t v83 = [MEMORY[0x1E4F28B00] currentHandler];
    [v83 handleFailureInMethod:a2 object:self file:@"UIPageViewController.m" lineNumber:1061 description:@"No view controllers"];
  }
  uint64_t v8 = self->_viewControllersStashedForRotation;
  CGRect v85 = self->_viewControllers;
  -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(UIPageViewController *)self _setViewControllersStashedForRotation:v8];
  int64_t spineLocation = self->_spineLocation;
  if (self->_spineLocationPriorToInterfaceRotation == 2)
  {
    uint64_t v10 = v85;
    if (spineLocation != 2 && [(NSArray *)v8 count])
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = [(NSArray *)v8 objectAtIndex:v11];
        if (![(NSArray *)v85 containsObject:v12])
        {
          uint64_t v13 = [(NSArray *)v85 _ui_onlyObject];
          double v14 = [v13 view];
          [v14 frame];
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;

          if (self->_navigationOrientation)
          {
            v104.origin.double x = v16;
            v104.origin.double y = v18;
            v104.size.double width = v20;
            v104.size.double height = v22;
            double Height = CGRectGetHeight(v104);
            if (!v11) {
              double Height = -Height;
            }
            double v18 = v18 + Height;
          }
          else
          {
            v105.origin.double x = v16;
            v105.origin.double y = v18;
            v105.size.double width = v20;
            v105.size.double height = v22;
            double Width = CGRectGetWidth(v105);
            if (!v11) {
              double Width = -Width;
            }
            double v16 = v16 + Width;
          }
          v25 = [v12 view];
          objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);

          uint64_t v26 = [v12 view];
          [v26 setAlpha:0.0];
        }
        ++v11;
      }
      while (v11 < [(NSArray *)v8 count]);
    }
  }
  else
  {
    uint64_t v10 = v85;
    if (spineLocation == 2)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      uint64_t v27 = v85;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v96 objects:v102 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v97 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            if (![(NSArray *)v8 containsObject:v32])
            {
              double v33 = [v32 view];
              [v33 setAlpha:1.0];
            }
          }
          uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v96 objects:v102 count:16];
        }
        while (v29);
      }
    }
  }
  if ([(NSMutableArray *)self->_rotationSnapshotViews count])
  {
    double v34 = [(UIViewController *)self view];
    [v34 layoutBelowIfNeeded];

    double v35 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
    double v36 = [(UIViewController *)self view];
    [v35 captureSnapshotOfView:v36 withSnapshotType:0];

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    double v37 = [(UIViewController *)self view];
    double v38 = [v37 subviews];

    uint64_t v39 = [v38 countByEnumeratingWithState:&v92 objects:v101 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v93 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void **)(*((void *)&v92 + 1) + 8 * j);
          v44 = [(NSMutableArray *)self->_rotationSnapshotViews _ui_firstObject];

          if (v43 != v44) {
            [v43 setHidden:1];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v92 objects:v101 count:16];
      }
      while (v40);
    }

    if (self->_spineLocationPriorToInterfaceRotation == 2 || self->_spineLocation != 2)
    {
      v74 = [(UIViewController *)self view];
      double v75 = [(NSMutableArray *)self->_rotationSnapshotViews _ui_firstObject];
      [v74 addSubview:v75];

      v72 = [(UIViewController *)self view];
      uint64_t v73 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
    }
    else
    {
      viewControllers = self->_viewControllers;
      v46 = [(NSArray *)v8 _ui_onlyObject];
      LODWORD(viewControllers) = [(NSArray *)viewControllers containsObject:v46];

      if (viewControllers)
      {
        double v47 = [(NSArray *)v8 _ui_onlyObject];
        double v48 = [v47 view];
        [v48 frame];
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;

        double v57 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
        [v57 frame];
        double v58 = CGRectGetWidth(v106);
        v107.origin.double x = v50;
        v107.origin.double y = v52;
        v107.size.double width = v54;
        v107.size.double height = v56;
        double v59 = v58 / CGRectGetWidth(v107);

        double v60 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
        [v60 frame];
        double v61 = CGRectGetHeight(v108);
        v109.origin.double x = v50;
        v109.origin.double y = v52;
        v109.size.double width = v54;
        v109.size.double height = v56;
        double v62 = v61 / CGRectGetHeight(v109);

        int64_t navigationOrientation = self->_navigationOrientation;
        v110.origin.double x = v50;
        v110.origin.double y = v52;
        v110.size.double width = v54;
        v110.size.double height = v56;
        double v64 = v59 * CGRectGetWidth(v110);
        if (!navigationOrientation) {
          double v64 = v64 + v64;
        }
        double v84 = v64;
        int64_t v65 = self->_navigationOrientation;
        v111.origin.double x = v50;
        v111.origin.double y = v52;
        v111.size.double width = v54;
        v111.size.double height = v56;
        double v66 = v62 * CGRectGetHeight(v111);
        if (v65 == 1) {
          double v67 = v66 + v66;
        }
        else {
          double v67 = v66;
        }
        BOOL v68 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
        v112.origin.double x = v50;
        v112.origin.double y = v52;
        v112.size.double width = v54;
        v112.size.double height = v56;
        CGFloat v69 = -(CGRectGetMinX(v112) * v59);
        v113.origin.double x = v50;
        v113.origin.double y = v52;
        v113.size.double width = v54;
        v113.size.double height = v56;
        objc_msgSend(v68, "setFrame:", v69, -(CGRectGetMinY(v113) * v62), v84, v67);
      }
      v70 = [(UIViewController *)self view];
      v71 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
      [v70 addSubview:v71];

      v72 = [(UIViewController *)self view];
      uint64_t v73 = [(NSMutableArray *)self->_rotationSnapshotViews _ui_firstObject];
    }
    double v76 = (void *)v73;
    [v72 addSubview:v73];
    uint64_t v10 = v85;

    v77 = [(NSMutableArray *)self->_rotationSnapshotViews lastObject];
    [v77 setAlpha:0.0];

    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __75__UIPageViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
    v90[3] = &unk_1E52D9F98;
    v90[4] = self;
    CGRect v91 = v8;
    +[UIView animateWithDuration:v90 animations:a4];
  }
  if (self->_transitionStyle || ![(NSMutableArray *)self->_rotationSnapshotViews count])
  {
LABEL_53:
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v78 = self->_viewControllers;
    uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v86 objects:v100 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v87;
      do
      {
        for (uint64_t k = 0; k != v80; ++k)
        {
          if (*(void *)v87 != v81) {
            objc_enumerationMutation(v78);
          }
          [(UIPageViewController *)self _child:*(void *)(*((void *)&v86 + 1) + 8 * k) willAnimateRotationToInterfaceOrientation:a3 duration:a4];
        }
        uint64_t v80 = [(NSArray *)v78 countByEnumeratingWithState:&v86 objects:v100 count:16];
      }
      while (v80);
    }
  }
}

void __75__UIPageViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 1008);
  if (*(void *)(v11 + 1088) == 2)
  {
    if (v12 == 2) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    double v14 = objc_msgSend(*(id *)(v11 + 1024), "_ui_onlyObject");
    LOBYTE(v13) = [v13 containsObject:v14];

    if (v13)
    {
      double v15 = [*(id *)(*(void *)(a1 + 32) + 1080) lastObject];
      [v15 frame];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      v24 = [*(id *)(a1 + 32) view];
      [v24 bounds];
      double Width = CGRectGetWidth(v49);
      v50.origin.double x = v17;
      v50.origin.double y = v19;
      v50.size.double width = v21;
      v50.size.double height = v23;
      double v26 = Width / CGRectGetWidth(v50);

      uint64_t v27 = [*(id *)(a1 + 32) view];
      [v27 bounds];
      double Height = CGRectGetHeight(v51);
      v52.origin.double x = v17;
      v52.origin.double y = v19;
      v52.size.double width = v21;
      v52.size.double height = v23;
      double v29 = Height / CGRectGetHeight(v52);

      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 1000);
      v53.origin.double x = v17;
      v53.origin.double y = v19;
      v53.size.double width = v21;
      v53.size.double height = v23;
      double v31 = v26 * CGRectGetWidth(v53);
      if (v30) {
        double v8 = v31;
      }
      else {
        double v8 = v31 + v31;
      }
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 1000);
      v54.origin.double x = v17;
      v54.origin.double y = v19;
      v54.size.double width = v21;
      v54.size.double height = v23;
      double v33 = v29 * CGRectGetHeight(v54);
      if (v32 == 1) {
        double v10 = v33 + v33;
      }
      else {
        double v10 = v33;
      }
      v55.origin.double x = v17;
      v55.origin.double y = v19;
      v55.size.double width = v21;
      v55.size.double height = v23;
      double v4 = -(CGRectGetMinX(v55) * v26);
      v56.origin.double x = v17;
      v56.origin.double y = v19;
      v56.size.double width = v21;
      v56.size.double height = v23;
      double v6 = -(CGRectGetMinY(v56) * v29);
    }
    double v34 = (id *)(*(void *)(a1 + 32) + 1080);
  }
  else
  {
    if (v12 != 2) {
      goto LABEL_17;
    }
    double v35 = *(void **)(v11 + 1024);
    double v36 = objc_msgSend(*(id *)(a1 + 40), "_ui_onlyObject");
    LODWORD(v35) = [v35 containsObject:v36];

    if (v35)
    {
      double v37 = objc_msgSend(*(id *)(a1 + 40), "_ui_onlyObject");
      double v38 = [v37 view];
      [v38 frame];
      double v4 = v39;
      double v6 = v40;
      double v8 = v41;
      double v10 = v42;
    }
    double v34 = (id *)(*(void *)(a1 + 32) + 1080);
  }
  uint64_t v43 = objc_msgSend(*v34, "_ui_firstObject");
  [v43 setAlpha:0.0];

  uint64_t v11 = *(void *)(a1 + 32);
LABEL_17:
  v44 = [*(id *)(v11 + 1080) lastObject];
  [v44 setAlpha:1.0];

  v45 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "_ui_firstObject");
  objc_msgSend(v45, "setFrame:", v4, v6, v8, v10);

  id v47 = [*(id *)(*(void *)(a1 + 32) + 1080) lastObject];
  v46 = [*(id *)(a1 + 32) view];
  [v46 bounds];
  objc_msgSend(v47, "setFrame:");
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_transitionStyle)
  {
    if (!self->_pageCurl) {
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllers, 1, 0, 0, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    [(UIPageViewController *)self _invalidateEffectiveTapRegions];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v5 = [(UIViewController *)self view];
    double v6 = [v5 subviews];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([(NSMutableArray *)self->_rotationSnapshotViews containsObject:v11])
          {
            [v11 removeFromSuperview];
          }
          else
          {
            [v11 setHidden:0];
            [v11 setAlpha:1.0];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_rotationSnapshotViews removeAllObjects];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_viewControllers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[UIPageViewController _child:didRotateFromInterfaceOrientation:](self, "_child:didRotateFromInterfaceOrientation:", *(void *)(*((void *)&v17 + 1) + 8 * j), a3, (void)v17);
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  self->_interfaceRotating = 0;
  [(UIPageViewController *)self _setViewControllersStashedForRotation:0];
}

- (void)_contentViewFrameOrBoundsDidChange
{
  if (!self->_transitionStyle && ![(NSMutableArray *)self->_rotationSnapshotViews count])
  {
    pageCurl = self->_pageCurl;
    if (pageCurl)
    {
      double v4 = [(UIViewController *)self view];
      [v4 bounds];
      -[_UIPageCurl _setContentRect:](pageCurl, "_setContentRect:");

      if ([(NSArray *)self->_viewControllers count])
      {
        unint64_t v5 = 0;
        do
        {
          double v6 = [(NSArray *)self->_viewControllers objectAtIndex:v5];
          if ([v6 isViewLoaded])
          {
            uint64_t v7 = [v6 view];
            if (v5) {
              BOOL v8 = 0;
            }
            else {
              BOOL v8 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
            }
            [(_UIPageCurl *)self->_pageCurl _pageViewFrame:v8];
            objc_msgSend(v7, "setFrame:");
          }
          ++v5;
        }
        while (v5 < [(NSArray *)self->_viewControllers count]);
      }
    }
    [(UIPageViewController *)self _invalidateEffectiveTapRegions];
  }
}

- (BOOL)_isCurrentViewControllerStateValid
{
  if (self->_transitionStyle) {
    return 0;
  }
  int64_t spineLocation = self->_spineLocation;
  NSUInteger v4 = [(NSArray *)self->_viewControllers count];
  if (spineLocation == 2) {
    return v4 == 2;
  }
  else {
    return v4 == 1;
  }
}

- (id)_validatedViewControllersForTransitionWithViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  int64_t transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    if ([v6 count] == 1)
    {
      id v10 = v7;
      uint64_t v9 = 1;
      if (v10) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else if (transitionStyle)
  {
    uint64_t v9 = 0;
  }
  else if (v4)
  {
    if (self->_doubleSided) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    if ([v6 count] == v9)
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v11 = [(UIPageViewController *)self _validRangeForPresentationOfViewControllersWithSpineLocation:self->_spineLocation];
    uint64_t v9 = v12;
    -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v7, v11, v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10) {
      goto LABEL_18;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = [v7 count];
    double v16 = [(id)objc_opt_class() stringForSpineLocation:self->_spineLocation];
    [v13 raise:v14, @"The number of provided view controllers (%ld) doesn't match the number required (%ld) for the requested spine location (%@)", v15, v9, v16 format];
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The number of view controllers provided (%ld) doesn't match the number required (%ld) for the requested transition", objc_msgSend(v7, "count"), v9);
  id v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)_canHandleGestures
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    $9D61448B49CE3ACBE30B7BC01FFD74FF delegateFlags = self->_delegateFlags;
    if ((*(unsigned char *)&delegateFlags & 0x40) != 0) {
      BOOL v5 = (*(unsigned int *)&delegateFlags >> 7) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_viewControllerBefore:(BOOL)a3 viewController:(id)a4
{
  id v6 = a4;
  if ([(UIPageViewController *)self _canHandleGestures])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v8 = WeakRetained;
    if (a3) {
      [WeakRetained pageViewController:self viewControllerBeforeViewController:v6];
    }
    else {
    uint64_t v9 = [WeakRetained pageViewController:self viewControllerAfterViewController:v6];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_viewControllerBeforeViewController:(id)a3
{
  return [(UIPageViewController *)self _viewControllerBefore:1 viewController:a3];
}

- (id)_viewControllerAfterViewController:(id)a3
{
  return [(UIPageViewController *)self _viewControllerBefore:0 viewController:a3];
}

- (id)_viewControllersForCurlWithViewControllers:(id)a3 direction:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation == 1 || spineLocation == 101)
  {
    if (!a4)
    {
      uint64_t v9 = [v6 objectForKey:@"UIPageCurlControllerOutgoingRightViewControllerKey"];
      if (self->_doubleSided) {
        goto LABEL_18;
      }
LABEL_13:
      id v10 = 0;
      if (!v9) {
        goto LABEL_21;
      }
LABEL_20:
      [v7 setObject:v9 forKey:@"UIPageCurlControllerFrontViewControllerKey"];
      goto LABEL_21;
    }
    if (self->_doubleSided)
    {
      id v10 = [v6 objectForKey:@"UIPageCurlControllerIncomingLeftViewControllerKey"];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v12 = @"UIPageCurlControllerIncomingRightViewControllerKey";
  }
  else
  {
    if (spineLocation == 2)
    {
      if (a4)
      {
        uint64_t v9 = [v6 objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
LABEL_11:
        uint64_t v11 = @"UIPageCurlControllerIncomingRightViewControllerKey";
        goto LABEL_19;
      }
      uint64_t v9 = [v6 objectForKey:@"UIPageCurlControllerOutgoingRightViewControllerKey"];
LABEL_18:
      uint64_t v11 = @"UIPageCurlControllerIncomingLeftViewControllerKey";
LABEL_19:
      id v10 = [v6 objectForKey:v11];
      if (!v9) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    if (a4)
    {
      uint64_t v9 = [v6 objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
      if (self->_doubleSided) {
        goto LABEL_11;
      }
      goto LABEL_13;
    }
    if (self->_doubleSided)
    {
      id v10 = [v6 objectForKey:@"UIPageCurlControllerIncomingRightViewControllerKey"];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v12 = @"UIPageCurlControllerIncomingLeftViewControllerKey";
  }
  uint64_t v9 = [v6 objectForKey:v12];
  if (v9) {
    goto LABEL_20;
  }
LABEL_21:
  if (v10) {
    [v7 setObject:v10 forKey:@"UIPageCurlControllerBackViewControllerKey"];
  }

  return v7;
}

- (void)_populateOutgoingViewControllersInMap:(id)a3
{
  id v10 = a3;
  int64_t spineLocation = self->_spineLocation;
  if ((spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v5 = [(NSArray *)self->_viewControllers objectAtIndex:0];
    if (v5)
    {
      id v6 = (void *)v5;
      [v10 setObject:v5 forKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
    }
    int64_t spineLocation = self->_spineLocation;
  }
  uint64_t v7 = 0;
  if (spineLocation != 1 && spineLocation != 101)
  {
    if (spineLocation != 2) {
      goto LABEL_11;
    }
    uint64_t v7 = 1;
  }
  uint64_t v8 = [(NSArray *)self->_viewControllers objectAtIndex:v7];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [v10 setObject:v8 forKey:@"UIPageCurlControllerOutgoingRightViewControllerKey"];
  }
LABEL_11:
}

- (void)_populateIncomingViewControllersInMap:(id)a3 withViewControllers:(id)a4 forCurlInDirection:(int64_t)a5
{
  id v15 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation == 101 || spineLocation == 1)
  {
    uint64_t v11 = [v7 objectAtIndex:0];
    [v15 setObject:v11 forKey:@"UIPageCurlControllerIncomingRightViewControllerKey"];

    if (!self->_doubleSided) {
      goto LABEL_11;
    }
    uint64_t v12 = [v8 objectAtIndex:1];
    uint64_t v13 = @"UIPageCurlControllerIncomingLeftViewControllerKey";
    goto LABEL_10;
  }
  uint64_t v14 = [v7 objectAtIndex:0];
  [v15 setObject:v14 forKey:@"UIPageCurlControllerIncomingLeftViewControllerKey"];

  if (self->_doubleSided)
  {
    uint64_t v12 = [v8 objectAtIndex:1];
    uint64_t v13 = @"UIPageCurlControllerIncomingRightViewControllerKey";
LABEL_10:
    [v15 setObject:v12 forKey:v13];
  }
LABEL_11:
}

- (void)_invalidateViewControllersStashedForCurlFromDataSource
{
}

+ (id)_outgoingViewControllerKeys
{
  v2 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
  if (!_outgoingViewControllerKeys___outgoingViewControllerKeys)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"UIPageCurlControllerOutgoingLeftViewControllerKey", @"UIPageCurlControllerOutgoingRightViewControllerKey", 0);
    BOOL v4 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
    _outgoingViewControllerKeys___outgoingViewControllerKeys = v3;

    v2 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
  }
  return v2;
}

+ (id)_incomingViewControllerKeys
{
  v2 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
  if (!_incomingViewControllerKeys___incomingViewControllerKeys)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"UIPageCurlControllerIncomingLeftViewControllerKey", @"UIPageCurlControllerIncomingRightViewControllerKey", 0);
    BOOL v4 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
    _incomingViewControllerKeys___incomingViewControllerKeys = v3;

    v2 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
  }
  return v2;
}

- (void)_beginDisablingInterfaceAutorotation
{
  if (![(_UIPageCurl *)self->_pageCurl _areAnimationsInFlightOrPending])
  {
    ++self->_disableAutorotationCount;
    v3.receiver = self;
    v3.super_class = (Class)UIPageViewController;
    [(UIViewController *)&v3 _beginDisablingInterfaceAutorotation];
  }
}

- (void)_endDisablingInterfaceAutorotation
{
  if (![(_UIPageCurl *)self->_pageCurl _areAnimationsInFlightOrPending])
  {
    for (int64_t i = self->_disableAutorotationCount; i; int64_t i = self->_disableAutorotationCount)
    {
      self->_disableAutorotationCount = i - 1;
      v4.receiver = self;
      v4.super_class = (Class)UIPageViewController;
      [(UIViewController *)&v4 _endDisablingInterfaceAutorotation];
    }
  }
}

- (void)_setViewControllers:(id)a3 withCurlOfType:(int64_t)a4 fromLocation:(CGPoint)a5 direction:(int64_t)a6 animated:(BOOL)a7 notifyDelegate:(BOOL)a8 completion:(id)a9
{
  LODWORD(WeakRetained) = a8;
  BOOL v11 = a7;
  double y = a5.y;
  double x = a5.x;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a9;
  if (self->_transitionStyle)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v82 = id v81 = v18;
    [v82 handleFailureInMethod:a2 object:self file:@"UIPageViewController.m" lineNumber:1395 description:@"Invalid transition style"];

    id v18 = v81;
  }
  if (self->_stashingViewControllersForRotation)
  {
    [(UIPageViewController *)self _setViewControllersStashedForRotation:v18];
  }
  else
  {
    if (!self->_pageCurl)
    {
      int64_t v92 = a4;
      id v20 = v18;
      long long v21 = [_UIPageCurl alloc];
      int64_t spineLocation = self->_spineLocation;
      int v23 = (int)WeakRetained;
      if (spineLocation == 101)
      {
        uint64_t v24 = 3;
      }
      else
      {
        uint64_t v25 = 2;
        if (spineLocation == 2) {
          uint64_t v25 = 8;
        }
        if (spineLocation == 3) {
          uint64_t v25 = 32;
        }
        uint64_t v26 = 4;
        if (spineLocation != 2) {
          uint64_t v26 = 1;
        }
        BOOL v27 = spineLocation == 3;
        uint64_t v28 = 16;
        if (!v27) {
          uint64_t v28 = v26;
        }
        if (self->_navigationOrientation) {
          uint64_t v24 = v25;
        }
        else {
          uint64_t v24 = v28;
        }
      }
      double v29 = [(UIViewController *)self view];
      [v29 bounds];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      id WeakRetained = [(UIViewController *)self view];
      double v38 = -[_UIPageCurl initWithSpineLocation:andContentRect:inContentView:](v21, "initWithSpineLocation:andContentRect:inContentView:", v24, WeakRetained, v31, v33, v35, v37);
      pageCurl = self->_pageCurl;
      self->_pageCurl = v38;

      id v18 = v20;
      LODWORD(WeakRetained) = v23;
      a4 = v92;
    }
    if ([(UIPageViewController *)self _isCurrentViewControllerStateValid] && v11)
    {
      double v40 = [(UIPageViewController *)self _validatedViewControllersForTransitionWithViewControllers:v18 animated:1];
      if ([v40 count]
        && [(_UIPageCurl *)self->_pageCurl _isPreviousCurlCompatibleWithCurlOfType:a4 inDirection:a6])
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(UIPageViewController *)self _populateOutgoingViewControllersInMap:v41];
        if (self->_spineLocation == 2)
        {
          id v42 = v40;
        }
        else
        {
          objc_msgSend(v40, "subarrayWithRange:", 0, 1);
          id v42 = (id)objc_claimAutoreleasedReturnValue();
        }
        long long v89 = v42;
        if WeakRetained && (*(_WORD *)&self->_delegateFlags)
        {
          char v64 = (char)WeakRetained;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained pageViewController:self willTransitionToViewControllers:v89];

          LOBYTE(WeakRetained) = v64;
        }
        [(UIPageViewController *)self _populateIncomingViewControllersInMap:v41 withViewControllers:v40 forCurlInDirection:a6];
        long long v88 = v40;
        if (a4 == 4 || a4 == 1) {
          [(UIPageViewController *)self _setViewControllers:v89];
        }
        else {
          objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, v41);
        }
        int64_t v65 = [(UIPageViewController *)self _viewControllersForCurlWithViewControllers:v41 direction:a6];
        CGRect v90 = [v65 objectForKey:@"UIPageCurlControllerFrontViewControllerKey"];
        double v84 = [v65 objectForKey:@"UIPageCurlControllerBackViewControllerKey"];
        id v66 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke;
        aBlock[3] = &unk_1E52E8E38;
        aBlock[4] = self;
        BOOL v110 = v11;
        id v83 = v66;
        id v109 = v83;
        double v67 = (void (**)(void *, void *, uint64_t, void))_Block_copy(aBlock);
        BOOL v68 = [v41 objectForKey:@"UIPageCurlControllerIncomingRightViewControllerKey"];
        if (a6)
        {
          uint64_t v69 = 0;
        }
        else
        {
          int64_t v70 = self->_spineLocation;
          unint64_t v71 = v70 - 1;
          BOOL v72 = v70 == 101;
          uint64_t v69 = v71 < 2 || v72;
        }
        char v85 = (char)WeakRetained;
        id v94 = v18;
        v67[2](v67, v68, v69, 0);

        uint64_t v73 = [v41 objectForKey:@"UIPageCurlControllerIncomingLeftViewControllerKey"];
        BOOL v74 = 0;
        if (a6 == 1) {
          BOOL v74 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
        }
        v67[2](v67, v73, v74, 1);

        double v75 = [v41 objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
        [(UIPageViewController *)self _child:v75 beginAppearanceTransition:0 animated:1];

        double v76 = [v41 objectForKey:@"UIPageCurlControllerOutgoingRightViewControllerKey"];
        [(UIPageViewController *)self _child:v76 beginAppearanceTransition:0 animated:1];

        [(UIPageViewController *)self _beginDisablingInterfaceAutorotation];
        long long v95 = self->_pageCurl;
        v77 = [v90 view];
        long long v78 = [v84 view];
        v101[0] = MEMORY[0x1E4F143A8];
        v101[1] = 3221225472;
        v101[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_2;
        v101[3] = &unk_1E52E8F00;
        v101[4] = self;
        id v102 = v41;
        id v103 = v83;
        int64_t v105 = a6;
        int64_t v106 = a4;
        id v104 = v19;
        char v107 = v85;
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_7;
        v100[3] = &unk_1E52D9F70;
        v100[4] = self;
        id v79 = v83;
        id v80 = v41;
        -[_UIPageCurl _enqueueCurlOfType:fromLocation:inDirection:withView:revealingView:completion:finally:](v95, "_enqueueCurlOfType:fromLocation:inDirection:withView:revealingView:completion:finally:", a4, a6, v77, v78, v101, v100, x, y);

        id v18 = v94;
        double v40 = v88;
      }
    }
    else
    {
      uint64_t v43 = [(UIGestureRecognizer *)self->_tapGestureRecognizer isEnabled];
      uint64_t v44 = [(UIGestureRecognizer *)self->_panGestureRecognizer isEnabled];
      [(UIGestureRecognizer *)self->_tapGestureRecognizer setEnabled:0];
      [(UIGestureRecognizer *)self->_panGestureRecognizer setEnabled:0];
      [(_UIPageCurl *)self->_pageCurl _cancelAllActiveTransitionsAndAbandonCallbacks:0];
      if (-[NSArray count](self->_viewControllers, "count") || [v18 count])
      {
        uint64_t v45 = [(UIPageViewController *)self _validatedViewControllersForTransitionWithViewControllers:v18 animated:0];
        if (v45)
        {
          v46 = (void *)v45;
          unsigned int v86 = v44;
          unsigned int v87 = v43;
          id v91 = v19;
          id v93 = v18;
          id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          double v48 = self->_viewControllers;
          uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v96 objects:v111 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v97;
            do
            {
              for (uint64_t i = 0; i != v50; ++i)
              {
                if (*(void *)v97 != v51) {
                  objc_enumerationMutation(v48);
                }
                CGRect v53 = *(void **)(*((void *)&v96 + 1) + 8 * i);
                if ([v46 containsObject:v53])
                {
                  [v47 addObject:v53];
                }
                else
                {
                  [v53 willMoveToParentViewController:0];
                  if ([v53 isViewLoaded])
                  {
                    [(UIPageViewController *)self _child:v53 beginAppearanceTransition:0 animated:0];
                    CGRect v54 = [v53 view];
                    [v54 removeFromSuperview];

                    [(UIPageViewController *)self _childEndAppearanceTransition:v53];
                  }
                  [v53 removeFromParentViewController];
                }
              }
              uint64_t v50 = [(NSArray *)v48 countByEnumeratingWithState:&v96 objects:v111 count:16];
            }
            while (v50);
          }

          [(UIPageViewController *)self _setViewControllers:v46];
          id v19 = v91;
          if ([(NSArray *)self->_viewControllers count])
          {
            unint64_t v55 = 0;
            do
            {
              CGRect v56 = [(NSArray *)self->_viewControllers objectAtIndex:v55];
              if (([v47 containsObject:v56] & 1) == 0) {
                [(UIViewController *)self addChildViewController:v56];
              }
              double v57 = [v56 view];
              double v58 = [v57 superview];
              double v59 = [(UIViewController *)self view];

              if (v58 != v59)
              {
                [(UIPageViewController *)self _child:v56 beginAppearanceTransition:1 animated:0];
                double v60 = [(UIViewController *)self view];
                double v61 = [v56 view];
                [v60 addSubview:v61];

                [(UIPageViewController *)self _childEndAppearanceTransition:v56];
              }
              if (([v47 containsObject:v56] & 1) == 0) {
                [v56 didMoveToParentViewController:self];
              }
              double v62 = [v56 view];
              if (v55) {
                BOOL v63 = 0;
              }
              else {
                BOOL v63 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
              }
              [(_UIPageCurl *)self->_pageCurl _pageViewFrame:v63];
              objc_msgSend(v62, "setFrame:");

              ++v55;
            }
            while (v55 < [(NSArray *)self->_viewControllers count]);
          }

          id v18 = v93;
          uint64_t v43 = v87;
          uint64_t v44 = v86;
        }
      }
      if (v19) {
        (*((void (**)(id, uint64_t))v19 + 2))(v19, 1);
      }
      [(UIGestureRecognizer *)self->_tapGestureRecognizer setEnabled:v43];
      [(UIGestureRecognizer *)self->_panGestureRecognizer setEnabled:v44];
    }
  }
  [(UIPageViewController *)self _invalidateViewControllersStashedForCurlFromDataSource];
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v11 = v7;
    uint64_t v8 = [v7 view];
    [*(id *)(*(void *)(a1 + 32) + 1032) _pageViewFrame:a4];
    objc_msgSend(v8, "setFrame:");

    [*(id *)(a1 + 32) _child:v11 beginAppearanceTransition:1 animated:*(unsigned __int8 *)(a1 + 48)];
    id v7 = v11;
    if (a3)
    {
      [*(id *)(a1 + 32) addChildViewController:v11];
      uint64_t v9 = [*(id *)(a1 + 32) view];
      id v10 = [v11 view];
      [v9 insertSubview:v10 atIndex:0];

      [v11 didMoveToParentViewController:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) addObject:v11];
      id v7 = v11;
    }
  }
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = [(id)objc_opt_class() _outgoingViewControllerKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v61 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(a1 + 40) objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v8);
  }

  if (a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_3;
    aBlock[3] = &unk_1E52E8E60;
    aBlock[4] = *(void *)(a1 + 32);
    uint64_t v12 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v13 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
    v12[2](v12, v13);

    uint64_t v14 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerOutgoingRightViewControllerKey"];
    v12[2](v12, v14);

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_4;
    v56[3] = &unk_1E52E8E88;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    id v57 = v15;
    uint64_t v58 = v16;
    long long v17 = (void (**)(void *, void *, BOOL, uint64_t))_Block_copy(v56);
    id v18 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerIncomingLeftViewControllerKey"];
    if (*(void *)(a1 + 64)) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = (*(void *)(*(void *)(a1 + 32) + 1008) & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    v17[2](v17, v18, v19, 1);

    double v37 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerIncomingRightViewControllerKey"];
    if (*(void *)(a1 + 64) != 1
      || (uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 1008), v39 = 1, (unint64_t)(v38 - 1) >= 2) && v38 != 101)
    {
      uint64_t v39 = 0;
    }
    v17[2](v17, v37, v39, 0);
  }
  else
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_5;
    v53[3] = &unk_1E52E8EB0;
    id v20 = *(id *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 32);
    id v54 = v20;
    uint64_t v55 = v21;
    long long v22 = (void (**)(void *, void *))_Block_copy(v53);
    int v23 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerIncomingLeftViewControllerKey"];
    v22[2](v22, v23);

    uint64_t v24 = [*(id *)(a1 + 40) objectForKey:@"UIPageCurlControllerIncomingRightViewControllerKey"];
    uint64_t v44 = v22;
    v22[2](v22, v24);

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_6;
    v52[3] = &unk_1E52E8ED8;
    v52[4] = *(void *)(a1 + 32);
    uint64_t v25 = (void (**)(void *, void, BOOL, BOOL))_Block_copy(v52);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v45 = v5;
    obuint64_t j = v5;
    uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(obj);
          }
          double v30 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          double v31 = [*(id *)(*(void *)(a1 + 32) + 1024) objectAtIndex:0];
          BOOL v32 = v30 == v31 || *(void *)(*(void *)(a1 + 32) + 1008) == 2;

          double v33 = [*(id *)(*(void *)(a1 + 32) + 1024) objectAtIndex:0];
          if (v30 == v33)
          {
            uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 1008);
            BOOL v34 = v35 != 1 && v35 != 101;
          }
          else
          {
            BOOL v34 = 0;
          }

          ((void (**)(void *, void *, BOOL, BOOL))v25)[2](v25, v30, v32, v34);
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
      }
      while (v27);
    }

    a3 = 0;
    uint64_t v5 = v45;
  }
  uint64_t v40 = *(void *)(a1 + 72);
  if (v40 == 4 || v40 == 1)
  {
    uint64_t v41 = *(void *)(a1 + 56);
    if (v41) {
      (*(void (**)(uint64_t, void))(v41 + 16))(v41, a2);
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v42 = *(void *)(a1 + 32);
    if ((*(_WORD *)(v42 + 1248) & 2) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v42 + 976));
      [WeakRetained pageViewController:*(void *)(a1 + 32) didFinishAnimating:a2 previousViewControllers:v5 transitionCompleted:a3];
    }
  }
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 willMoveToParentViewController:0];
  objc_super v3 = [v4 view];
  [v3 removeFromSuperview];

  [*(id *)(a1 + 32) _childEndAppearanceTransition:v4];
  [v4 removeFromParentViewController];
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_4(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v13 = v7;
    if (a3)
    {
      if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0) {
        [*(id *)(a1 + 40) addChildViewController:v13];
      }
      uint64_t v9 = [v13 view];
      [*(id *)(*(void *)(a1 + 40) + 1032) _pageViewFrame:a4];
      objc_msgSend(v9, "setFrame:");

      id v10 = [*(id *)(a1 + 40) view];
      id v11 = [v13 view];
      [v10 insertSubview:v11 atIndex:0];

      char v12 = [*(id *)(a1 + 32) containsObject:v13];
      uint64_t v8 = v13;
      if ((v12 & 1) == 0)
      {
        [v13 didMoveToParentViewController:*(void *)(a1 + 40)];
        uint64_t v8 = v13;
      }
    }
    [*(id *)(a1 + 40) _childEndAppearanceTransition:v8];
    uint64_t v8 = v13;
  }
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if ([*(id *)(a1 + 32) containsObject:v3])
    {
      [v5 willMoveToParentViewController:0];
      id v4 = [v5 view];
      [v4 removeFromSuperview];

      [v5 removeFromParentViewController];
    }
    [*(id *)(a1 + 40) _childEndAppearanceTransition:v5];
    id v3 = v5;
  }
}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_6(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v14 = v7;
    if (a3)
    {
      uint64_t v8 = [v7 view];
      uint64_t v9 = [v8 superview];
      id v10 = [*(id *)(a1 + 32) view];

      if (v9 != v10)
      {
        id v11 = [v14 view];
        [*(id *)(*(void *)(a1 + 32) + 1032) _pageViewFrame:a4];
        objc_msgSend(v11, "setFrame:");

        char v12 = [*(id *)(a1 + 32) view];
        uint64_t v13 = [v14 view];
        [v12 addSubview:v13];
      }
    }
    [*(id *)(a1 + 32) _childEndAppearanceTransition:v14];
    id v7 = v14;
  }
}

uint64_t __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDisablingInterfaceAutorotation];
}

- (void)_cacheViewControllerForScroll:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_cachedViewControllersForScroll, "containsObject:"))
  {
    [(UIViewController *)self addChildViewController:v4];
    [v4 didMoveToParentViewController:self];
    [(NSHashTable *)self->_cachedViewControllersForScroll addObject:v4];
  }
}

- (void)_setViewControllers:(id)a3 withScrollInDirection:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = [(UIPageViewController *)self _validatedViewControllersForTransitionWithViewControllers:a3 animated:v6];
  char v12 = [(NSArray *)self->_viewControllers _ui_onlyObject];
  uint64_t v13 = objc_msgSend(v11, "_ui_onlyObject");
  if (v13)
  {
    id v14 = [(UIPageViewController *)self _scrollView];
    id v15 = [v14 visibleView];
    if (v15)
    {
      uint64_t v16 = v15;
      if (v13 == v12 && v6)
      {

        goto LABEL_11;
      }
      [(UIPageViewController *)self _scrollView];
      id v24 = v10;
      v18 = int64_t v17 = a4;
      char v23 = [v18 isPreviousScrollCompatibleWithScrollInDirection:v17];

      a4 = v17;
      id v10 = v24;

      if ((v23 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (v6) {
      BOOL v6 = [(NSArray *)self->_viewControllers count] != 0;
    }
    [v12 willMoveToParentViewController:0];
    [(UIPageViewController *)self _cacheViewControllerForScroll:v13];
    BOOL v19 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v19;

    uint64_t v21 = [(UIPageViewController *)self _scrollView];
    long long v22 = [v13 view];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__UIPageViewController__setViewControllers_withScrollInDirection_animated_completion___block_invoke;
    v25[3] = &unk_1E52E8F28;
    v25[4] = self;
    id v26 = v10;
    [v21 setView:v22 direction:a4 animated:v6 completion:v25];
  }
LABEL_11:
}

void __86__UIPageViewController__setViewControllers_withScrollInDirection_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) _contentView];
  [v3 setNeedsLayout];
}

- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void *)completion
{
  BOOL v7 = animated;
  id v10 = viewControllers;
  id v11 = completion;
  char v12 = v11;
  int64_t transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__UIPageViewController_setViewControllers_direction_animated_completion___block_invoke;
    v14[3] = &unk_1E52E8F50;
    id v15 = v11;
    [(UIPageViewController *)self _setViewControllers:v10 withScrollInDirection:direction animated:v7 completion:v14];
    [(UIPageViewController *)self _updatePageControlViaDataSourceIfNecessary];
  }
  else if (!transitionStyle && (!self->_interfaceRotating || self->_stashingViewControllersForRotation))
  {
    -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v10, 1, direction, v7, 0, v11, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

uint64_t __73__UIPageViewController_setViewControllers_direction_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_deepestActionResponder
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__UIPageViewController__deepestActionResponder__block_invoke;
  v4[3] = &unk_1E52E6838;
  v4[4] = self;
  uint64_t v2 = [(UIViewController *)self _deepestPresentedActionResponderOrBlock:v4];
  return v2;
}

id __47__UIPageViewController__deepestActionResponder__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) viewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 _hasDeepestActionResponder])
        {
          if (v5)
          {

            goto LABEL_14;
          }
          id v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      uint64_t v9 = [v5 _deepestActionResponder];

      goto LABEL_16;
    }
  }
  else
  {
LABEL_14:
  }
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)UIPageViewController;
  uint64_t v9 = objc_msgSendSuper2(&v11, sel__deepestActionResponder);
LABEL_16:
  return v9;
}

- (id)_incomingViewControllersForGestureDrivenCurlInDirection:(int64_t)a3
{
  cachedViewControllersForCurl = self->_cachedViewControllersForCurl;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  BOOL v7 = [(NSMutableDictionary *)cachedViewControllersForCurl objectForKey:v6];

  if (!v7)
  {
    [(NSMutableDictionary *)self->_cachedViewControllersForCurl removeAllObjects];
    if (a3)
    {
      uint64_t v8 = [(NSArray *)self->_viewControllers objectAtIndex:0];
      uint64_t v9 = [(UIPageViewController *)self _viewControllerBeforeViewController:v8];

      if (v9)
      {
        id v10 = (void *)MEMORY[0x1E4F1C978];
        if (self->_doubleSided)
        {
          objc_super v11 = [(UIPageViewController *)self _viewControllerBeforeViewController:v9];
          BOOL v7 = objc_msgSend(v10, "arrayWithObjects:", v11, v9, 0);
        }
        else
        {
          BOOL v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v9, 0);
        }
        id v18 = self->_cachedViewControllersForCurl;
        BOOL v19 = [NSNumber numberWithInteger:a3];
        id v20 = v18;
        goto LABEL_18;
      }
LABEL_13:
      BOOL v7 = 0;
LABEL_19:

      goto LABEL_20;
    }
    viewControllers = self->_viewControllers;
    if (self->_spineLocation == 2)
    {
      long long v13 = [(NSArray *)viewControllers objectAtIndex:1];
      uint64_t v9 = [(UIPageViewController *)self _viewControllerAfterViewController:v13];

      if (!v9) {
        goto LABEL_13;
      }
      long long v14 = (void *)MEMORY[0x1E4F1C978];
      long long v15 = [(UIPageViewController *)self _viewControllerAfterViewController:v9];
      objc_msgSend(v14, "arrayWithObjects:", v9, v15, 0);
    }
    else
    {
      uint64_t v16 = [(NSArray *)viewControllers objectAtIndex:0];
      uint64_t v9 = [(UIPageViewController *)self _viewControllerAfterViewController:v16];

      if (!v9) {
        goto LABEL_13;
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1C978];
      if (!self->_doubleSided)
      {
        BOOL v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v9, 0);
        goto LABEL_17;
      }
      long long v15 = [(UIPageViewController *)self _viewControllerAfterViewController:v9];
      objc_msgSend(v17, "arrayWithObjects:", v15, v9, 0);
    BOOL v7 = };

LABEL_17:
    uint64_t v21 = self->_cachedViewControllersForCurl;
    BOOL v19 = [NSNumber numberWithInteger:0];
    id v20 = v21;
LABEL_18:
    [(NSMutableDictionary *)v20 setObject:v7 forKey:v19];

    goto LABEL_19;
  }
LABEL_20:
  return v7;
}

- (CGRect)_tapRegions
{
  uint64_t result = self->_tapRegions;
  if (!result)
  {
    self->_tapRegions = (CGRect *)malloc_type_malloc(0x40uLL, 0x1000040E0EAB150uLL);
    [(UIPageViewController *)self _effectiveTapRegionInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UIPageViewController *)self _effectiveTapRegionBreadths];
    double v13 = v12;
    double v15 = v14;
    int64_t navigationOrientation = self->_navigationOrientation;
    tapRegions = self->_tapRegions;
    id v18 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    [v18 bounds];
    double MinX = CGRectGetMinX(v36);
    [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
    if (navigationOrientation) {
      id v20 = {;
    }
      [v20 bounds];
      CGFloat MinY = CGRectGetMinY(v37);
      long long v22 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v22 bounds];
      CGFloat Width = CGRectGetWidth(v38);
      tapRegions->origin.double x = v7 + MinX;
      tapRegions->origin.double y = MinY;
      tapRegions->size.double width = Width - v7 - v11;
      tapRegions->size.double height = v15;

      id v24 = self->_tapRegions;
      uint64_t v25 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v25 bounds];
      CGFloat v26 = v7 + CGRectGetMinX(v39);
      uint64_t v27 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v27 bounds];
      CGFloat v28 = CGRectGetMaxY(v40) - v15;
      double v29 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v29 bounds];
      CGFloat v30 = CGRectGetWidth(v41);
      v24[1].origin.double x = v26;
      v24[1].origin.double y = v28;
      v24[1].size.double width = v30 - v7 - v11;
      v24[1].size.double height = v15;
    }
    else {
      double v31 = {;
    }
      [v31 bounds];
      CGFloat Height = CGRectGetHeight(v42);
      tapRegions->origin.double x = MinX;
      tapRegions->origin.double y = v5;
      tapRegions->size.double width = v13;
      tapRegions->size.double height = Height - v5 - v9;

      double v33 = self->_tapRegions;
      uint64_t v25 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v25 bounds];
      CGFloat v34 = CGRectGetMaxX(v43) - v13;
      uint64_t v27 = [(UIGestureRecognizer *)self->_tapGestureRecognizer view];
      [v27 bounds];
      CGFloat v35 = CGRectGetHeight(v44);
      v33[1].origin.double x = v34;
      v33[1].origin.double y = v5;
      v33[1].size.double width = v13;
      v33[1].size.double height = v35 - v5 - v9;
    }

    return self->_tapRegions;
  }
  return result;
}

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToTapGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_transitionStyle)
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = [(UIPageViewController *)self _tapRegions];
    char v9 = 0;
    uint64_t v10 = 0;
    char v11 = 1;
    while (1)
    {
      double v12 = &v8[v10];
      double v13 = [v6 view];
      [v6 locationInView:v13];
      v19.double x = v14;
      v19.double y = v15;
      BOOL v16 = CGRectContainsPoint(*v12, v19);

      if (a3)
      {
        if (v16) {
          break;
        }
      }
      if (v16) {
        char v9 = 1;
      }
      char v17 = v11 & ((v9 & 1) == 0);
      uint64_t v10 = 1;
      char v11 = 0;
      if ((v17 & 1) == 0)
      {
        BOOL v7 = v9 & 1;
        goto LABEL_11;
      }
    }
    *a3 = v11 & 1;
    BOOL v7 = 1;
  }
LABEL_11:

  return v7;
}

- (BOOL)_shouldFlipInRightToLeft
{
  if ([(UIPageViewController *)self navigationOrientation] == UIPageViewControllerNavigationOrientationVertical
    || [(UIPageViewController *)self transitionStyle] == UIPageViewControllerTransitionStylePageCurl)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v3 = [(UIViewController *)self view];
    unint64_t v4 = ((unint64_t)v3[28] >> 19) & 1;
  }
  return v4;
}

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToVelocity:(double *)a4 ofGestureRecognizedByPanGestureRecognizer:(id)a5
{
  id v8 = a5;
  char v9 = [(UIViewController *)self view];
  [v8 velocityInView:v9];
  double v11 = v10;
  double v13 = v12;

  int64_t navigationOrientation = self->_navigationOrientation;
  if (navigationOrientation == 1)
  {
    double v17 = -v13;
    if (v13 >= 0.0) {
      double v17 = v13;
    }
    if (v17 > 300.0)
    {
      double v11 = v13;
      if (!a4)
      {
LABEL_8:
        if ([(UIPageViewController *)self _shouldFlipInRightToLeft])
        {
          if (a3)
          {
            int64_t v16 = v11 < 0.0;
LABEL_20:
            *a3 = v16;
          }
        }
        else if (a3)
        {
          int64_t v16 = v11 >= 0.0;
          goto LABEL_20;
        }
        return 1;
      }
LABEL_7:
      *a4 = v11;
      goto LABEL_8;
    }
  }
  else if (!navigationOrientation)
  {
    double v15 = -v11;
    if (v11 >= 0.0) {
      double v15 = v11;
    }
    if (v15 > 300.0)
    {
      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  BOOL result = 0;
  if (a4) {
    *a4 = 0.0;
  }
  return result;
}

- (BOOL)_shouldBeginNavigationInDirection:(int64_t *)a3 inResponseToPanGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (!self->_transitionStyle)
  {
    int64_t v22 = 0;
    if ([(UIPageViewController *)self _shouldNavigateInDirection:&v22 inResponseToVelocity:0 ofGestureRecognizedByPanGestureRecognizer:v6])
    {
      if (!a3)
      {
LABEL_7:
        BOOL v7 = 1;
        goto LABEL_8;
      }
      int64_t v8 = v22;
LABEL_6:
      *a3 = v8;
      goto LABEL_7;
    }
    double v10 = [(UIViewController *)self view];
    double v11 = [v10 superview];
    [v6 translationInView:v11];
    double v13 = v12;
    double v15 = v14;

    if (self->_navigationOrientation)
    {
      double v16 = -v15;
      if (v15 >= 0.0) {
        double v16 = v15;
      }
      double v17 = -v13;
      if (v13 >= 0.0) {
        double v17 = v13;
      }
      if (v16 <= v17) {
        goto LABEL_2;
      }
      if ([(UIPageViewController *)self _shouldFlipInRightToLeft])
      {
        if (!a3) {
          goto LABEL_7;
        }
        BOOL v18 = v15 < 0.0;
        goto LABEL_26;
      }
      if (!a3) {
        goto LABEL_7;
      }
      BOOL v21 = v15 < 0.0;
    }
    else
    {
      double v19 = -v13;
      if (v13 >= 0.0) {
        double v19 = v13;
      }
      double v20 = -v15;
      if (v15 >= 0.0) {
        double v20 = v15;
      }
      if (v19 <= v20) {
        goto LABEL_2;
      }
      if ([(UIPageViewController *)self _shouldFlipInRightToLeft])
      {
        if (!a3) {
          goto LABEL_7;
        }
        BOOL v18 = v13 < 0.0;
LABEL_26:
        int64_t v8 = v18;
        goto LABEL_6;
      }
      if (!a3) {
        goto LABEL_7;
      }
      BOOL v21 = v13 < 0.0;
    }
    int64_t v8 = !v21;
    goto LABEL_6;
  }
LABEL_2:
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  unint64_t v4 = (UITapGestureRecognizer *)a3;
  double v5 = v4;
  uint64_t v14 = -1;
  panGestureRecognizer = self->_panGestureRecognizer;
  if (panGestureRecognizer) {
    BOOL v7 = panGestureRecognizer == (UIPanGestureRecognizer *)v4;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer || tapGestureRecognizer != v4) {
      goto LABEL_16;
    }
  }
  if (![(UIPageViewController *)self _canHandleGestures]
    || ![(UIPageViewController *)self _isCurrentViewControllerStateValid])
  {
    goto LABEL_17;
  }
  if (self->_tapGestureRecognizer != v5)
  {
    [(UIPageViewController *)self _shouldBeginNavigationInDirection:&v14 inResponseToPanGestureRecognizer:self->_panGestureRecognizer];
    goto LABEL_15;
  }
  if (![(UIPageViewController *)self _shouldNavigateInDirection:&v14 inResponseToTapGestureRecognizer:v5])
  {
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
LABEL_15:
  double v10 = [(UIPageViewController *)self _incomingViewControllersForGestureDrivenCurlInDirection:v14];
  uint64_t v11 = [v10 count];

  if (!v11) {
    goto LABEL_17;
  }
LABEL_16:
  BOOL v12 = [(UIGestureRecognizer *)v5 state] == UIGestureRecognizerStatePossible;
LABEL_18:

  return v12;
}

- (int64_t)_navigationEndDirectionInResponseToPanGestureRecognizer:(id)a3 suggestedVelocity:(double *)a4
{
  id v6 = a3;
  if (self->_transitionStyle)
  {
    int64_t v7 = 1;
  }
  else
  {
    int64_t v26 = 0;
    if ([(UIPageViewController *)self _shouldNavigateInDirection:&v26 inResponseToVelocity:a4 ofGestureRecognizedByPanGestureRecognizer:v6])
    {
      int64_t v7 = v26;
    }
    else
    {
      if (a4) {
        *a4 = 0.0;
      }
      int64_t v8 = [(UIViewController *)self view];
      [v6 locationInView:v8];
      double v10 = v9;
      double v12 = v11;

      int64_t navigationOrientation = self->_navigationOrientation;
      BOOL v14 = [(UIPageViewController *)self _shouldFlipInRightToLeft];
      double v15 = [(UIViewController *)self view];
      [v15 bounds];
      if (navigationOrientation)
      {
        double MidY = CGRectGetMidY(*(CGRect *)&v16);

        BOOL v21 = v12 <= MidY;
      }
      else
      {
        double MidX = CGRectGetMidX(*(CGRect *)&v16);

        BOOL v21 = v10 <= MidX;
      }
      unsigned int v23 = v21;
      int v24 = !v21;
      if (!v14) {
        unsigned int v23 = v24;
      }
      int64_t v7 = v23;
    }
  }

  return v7;
}

- (BOOL)_shouldCompleteManualCurlWithSuggestedVelocity:(double *)a3
{
  double v5 = [(_UIPageCurl *)self->_pageCurl _wrappedManualPageCurlDirection];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 integerValue];
    BOOL v8 = v7 == [(UIPageViewController *)self _navigationEndDirectionInResponseToPanGestureRecognizer:self->_panGestureRecognizer suggestedVelocity:a3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_handlePanGesture:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (UIPanGestureRecognizer *)a3;
  double v5 = v4;
  panGestureRecognizer = self->_panGestureRecognizer;
  if (panGestureRecognizer) {
    BOOL v7 = panGestureRecognizer == v4;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    goto LABEL_53;
  }
  if ([(UIGestureRecognizer *)v4 state] == UIGestureRecognizerStateBegan)
  {
    uint64_t v57 = 0;
    if ([(_UIPageCurl *)self->_pageCurl _isManualPageCurlInProgressAndUncommitted]|| ![(UIPageViewController *)self _shouldBeginNavigationInDirection:&v57 inResponseToPanGestureRecognizer:self->_panGestureRecognizer])
    {
      goto LABEL_53;
    }
LABEL_9:
    BOOL v8 = [(UIPageViewController *)self _incomingViewControllersForGestureDrivenCurlInDirection:v57];
    double v9 = self->_panGestureRecognizer;
    double v10 = [(UIViewController *)self view];
    [(UIPanGestureRecognizer *)v9 locationInView:v10];
    -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v8, 0, v57, 1, 1, 0);

    goto LABEL_53;
  }
  if ([(UIGestureRecognizer *)self->_panGestureRecognizer state] != UIGestureRecognizerStateChanged)
  {
    if ([(UIGestureRecognizer *)self->_panGestureRecognizer state] != UIGestureRecognizerStateEnded
      && [(UIGestureRecognizer *)self->_panGestureRecognizer state] != UIGestureRecognizerStateCancelled)
    {
      goto LABEL_53;
    }
    uint64_t v57 = 0;
    if (![(UIGestureRecognizer *)v5 isEnabled]
      || ![(UIPageViewController *)self _shouldCompleteManualCurlWithSuggestedVelocity:&v57])
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      int64_t v26 = [(id)objc_opt_class() _incomingViewControllerKeys];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v50 != v29) {
              objc_enumerationMutation(v26);
            }
            double v31 = [(NSDictionary *)self->_incomingAndOutgoingViewControllersForManualTransition objectForKey:*(void *)(*((void *)&v49 + 1) + 8 * i)];
            [(UIPageViewController *)self _child:v31 beginAppearanceTransition:0 animated:1];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v28);
      }

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      BOOL v32 = [(id)objc_opt_class() _outgoingViewControllerKeys];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v46 != v35) {
              objc_enumerationMutation(v32);
            }
            CGRect v37 = [(NSDictionary *)self->_incomingAndOutgoingViewControllersForManualTransition objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * j)];
            [(UIPageViewController *)self _child:v37 beginAppearanceTransition:1 animated:1];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v58 count:16];
        }
        while (v34);
      }

      pageCurl = self->_pageCurl;
      CGRect v39 = self->_panGestureRecognizer;
      int64_t v22 = [(UIViewController *)self view];
      [(UIPanGestureRecognizer *)v39 locationInView:v22];
      -[_UIPageCurl _abortManualCurlAtLocation:withSuggestedVelocity:](pageCurl, "_abortManualCurlAtLocation:withSuggestedVelocity:");
LABEL_49:

      incomingAndOutgoingViewControllersForManualTransition = self->_incomingAndOutgoingViewControllersForManualTransition;
      self->_incomingAndOutgoingViewControllersForManualTransition = 0;

      goto LABEL_53;
    }
    CGRect v43 = v5;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    BOOL v14 = [(id)objc_opt_class() _incomingViewControllerKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (!v15) {
      goto LABEL_33;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
LABEL_19:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v54 != v17) {
        objc_enumerationMutation(v14);
      }
      double v19 = *(void **)(*((void *)&v53 + 1) + 8 * v18);
      double v20 = [(NSDictionary *)self->_incomingAndOutgoingViewControllersForManualTransition objectForKey:v19];
      if (!v20) {
        goto LABEL_31;
      }
      int64_t spineLocation = self->_spineLocation;
      if (spineLocation != 101)
      {
        if (spineLocation == 2) {
          goto LABEL_30;
        }
        if (spineLocation != 1) {
          goto LABEL_28;
        }
      }
      if (([v19 isEqual:@"UIPageCurlControllerIncomingRightViewControllerKey"] & 1) == 0)
      {
        int64_t spineLocation = self->_spineLocation;
LABEL_28:
        if (spineLocation != 3
          || ![v19 isEqual:@"UIPageCurlControllerIncomingLeftViewControllerKey"])
        {
          goto LABEL_31;
        }
      }
LABEL_30:
      [v44 addObject:v20];
LABEL_31:

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (!v16)
        {
LABEL_33:

          int64_t v22 = v44;
          [(UIPageViewController *)self _setViewControllers:v44];
          unsigned int v23 = self->_pageCurl;
          int v24 = self->_panGestureRecognizer;
          uint64_t v25 = [(UIViewController *)self view];
          [(UIPanGestureRecognizer *)v24 locationInView:v25];
          -[_UIPageCurl _completeManualCurlAtLocation:withSuggestedVelocity:](v23, "_completeManualCurlAtLocation:withSuggestedVelocity:");

          double v5 = v43;
          goto LABEL_49;
        }
        goto LABEL_19;
      }
    }
  }
  if ([(_UIPageCurl *)self->_pageCurl _isManualPageCurlInProgressAndUncommitted])
  {
    double v11 = self->_pageCurl;
    double v12 = self->_panGestureRecognizer;
    double v13 = [(UIViewController *)self view];
    [(UIPanGestureRecognizer *)v12 locationInView:v13];
    -[_UIPageCurl _updateManualCurlToLocation:](v11, "_updateManualCurlToLocation:");

    goto LABEL_53;
  }
  uint64_t v57 = 0;
  if ([(UIPageViewController *)self _shouldBeginNavigationInDirection:&v57 inResponseToPanGestureRecognizer:self->_panGestureRecognizer])
  {
    if ([(_UIPageCurl *)self->_pageCurl _isPreviousCurlCompatibleWithCurlOfType:0 inDirection:v57])
    {
      CGRect v41 = [(UIPageViewController *)self _incomingViewControllersForGestureDrivenCurlInDirection:v57];
      uint64_t v42 = [v41 count];

      if (v42) {
        goto LABEL_9;
      }
    }
  }
LABEL_53:
}

- (void)_handleTapGesture:(id)a3
{
  tapGestureRecognizer = self->_tapGestureRecognizer;
  if (tapGestureRecognizer) {
    BOOL v4 = tapGestureRecognizer == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4 && [a3 state] == 3)
  {
    uint64_t v7 = 0;
    if ([(UIPageViewController *)self _shouldNavigateInDirection:&v7 inResponseToTapGestureRecognizer:self->_tapGestureRecognizer])
    {
      id v6 = [(UIPageViewController *)self _incomingViewControllersForGestureDrivenCurlInDirection:v7];
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v6, 1, v7, 1, 1, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
}

- (void)_handlePagingInDirection:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = [(UIPageViewController *)self _scrollView];
  if ([v9 isTracking])
  {
LABEL_8:

    goto LABEL_9;
  }
  double v10 = [(UIPageViewController *)self _scrollView];
  char v11 = [v10 isDecelerating];

  if ((v11 & 1) == 0)
  {
    double v9 = [(NSArray *)self->_viewControllers _ui_onlyObject];
    double v12 = [(UIPageViewController *)self _viewControllerBefore:a3 == 1 viewController:v9];
    if (v12)
    {
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
      if (*(_WORD *)&self->_delegateFlags)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained pageViewController:self willTransitionToViewControllers:v13];
      }
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__UIPageViewController__handlePagingInDirection_animated_completion___block_invoke;
      v15[3] = &unk_1E52E8F78;
      objc_copyWeak(&v18, &location);
      id v16 = v9;
      id v17 = v8;
      [(UIPageViewController *)self _setViewControllers:v13 withScrollInDirection:a3 animated:v5 completion:v15];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __69__UIPageViewController__handlePagingInDirection_animated_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  char v11 = WeakRetained;
  if (WeakRetained && ((_WORD)WeakRetained[156] & 2) != 0)
  {
    id v8 = objc_loadWeakRetained(WeakRetained + 122);
    double v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(a1 + 32), 0);
    [v8 pageViewController:v11 didFinishAnimating:a2 previousViewControllers:v9 transitionCompleted:a3];

    uint64_t v7 = v11;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, a2, a3);
    uint64_t v7 = v11;
  }
}

- (void)_updatePageControlViaDataSourceIfNecessary
{
  if ([(UIPageViewController *)self _isPageControlVisible])
  {
    uint64_t v3 = [(UIPageViewController *)self _pageControl];
    uint64_t v4 = [v3 numberOfPages];

    BOOL v5 = [(UIPageViewController *)self _pageControl];
    uint64_t v6 = [v5 currentPage];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v8 = [WeakRetained presentationCountForPageViewController:self];
    uint64_t v9 = [WeakRetained presentationIndexForPageViewController:self];
    uint64_t v10 = v9;
    if (v4 == v8)
    {
      if (v9 < 0 || v6 == v9 || v4 < 1 || v9 >= v4) {
        goto LABEL_12;
      }
    }
    else if (v8 < 1 || v9 < 0 || v9 >= v8)
    {
      goto LABEL_12;
    }
    char v11 = [(UIPageViewController *)self _pageControl];
    [v11 setNumberOfPages:v8];

    double v12 = [(UIPageViewController *)self _pageControl];
    [v12 setCurrentPage:v10];

LABEL_12:
  }
  self->_pageControlRequiresValidation = 0;
}

- (void)queuingScrollView:(id)a3 willManuallyScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = +[UIViewController viewControllerForView:v12];
  if (!v14)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UIPageViewController.m", 1966, @"No view controller managing revealed view %@", v12 object file lineNumber description];
  }
  if (![(NSHashTable *)self->_cachedViewControllersForScroll containsObject:v14])
  {
    int64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"UIPageViewController.m", 1967, @"Unexpected view controller: %@", v14 object file lineNumber description];
  }
  uint64_t v15 = +[UIViewController viewControllerForView:v13];
  if (v15 && ![(NSHashTable *)self->_cachedViewControllersForScroll containsObject:v15])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v28 = id v27 = v12;
    [v28 handleFailureInMethod:a2, self, @"UIPageViewController.m", 1969, @"Unexpected view controller: %@", v15 object file lineNumber description];

    id v12 = v27;
    if (!v9) {
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    goto LABEL_11;
  }
  if (v14 && (*(_WORD *)&self->_delegateFlags & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
    [WeakRetained pageViewController:self willTransitionToViewControllers:v17];
  }
LABEL_11:
  if ([(UIPageViewController *)self _shouldGenerateAppearanceCallbacksWhenScrolling])
  {
    uint64_t v29 = v15;
    id v30 = v12;
    [(UIPageViewController *)self _child:v14 beginAppearanceTransitionIfPossible:1 animated:v7];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = self->_cachedViewControllersForScroll;
    uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          unsigned int v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (v23 != v14)
          {
            if (![*(id *)(*((void *)&v31 + 1) + 8 * i) isViewLoaded]
              || ([v23 view], id v24 = (id)objc_claimAutoreleasedReturnValue(),
                                             v24,
                                             v24 == v13))
            {
              [(UIPageViewController *)self _child:v23 beginAppearanceTransitionIfPossible:0 animated:v7];
            }
            else
            {
              [(UIPageViewController *)self _child:v23 endAppearanceTransitionIfPossible:0];
            }
          }
        }
        uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v20);
    }

    uint64_t v15 = v29;
    id v12 = v30;
  }
}

- (BOOL)_shouldGenerateAppearanceCallbacksWhenScrolling
{
  if (self) {
    BOOL v2 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2;
  }
  else {
    BOOL v2 = 0;
  }
  NSClassFromString(&cfstr_Qlpageviewcont.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  int v4 = dyld_program_sdk_at_least();
  char v5 = v2 | ~isKindOfClass;
  if (v4) {
    char v5 = v2;
  }
  return v5 & 1;
}

- (void)queuingScrollView:(id)a3 didCommitManualScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 direction:(int64_t)a7 animated:(BOOL)a8 canComplete:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v11 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(NSArray *)self->_viewControllers _ui_onlyObject];
  id v16 = +[UIViewController viewControllerForView:v13];
  if (!v16)
  {
    CGRect v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"UIPageViewController.m", 2000, @"No view controller managing revealed view %@", v13 object file lineNumber description];
  }
  if (v11 && a9)
  {
    id v17 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v16, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v17;
  }
  uint64_t v19 = +[UIViewController viewControllerForView:v14];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = v20;
  BOOL v45 = v11;
  if (v11 && v19) {
    [v20 setObject:v19 forKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
  }
  long long v47 = v21;
  objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, v21);
  int64_t v22 = (void *)v15;
  if ([(UIPageViewController *)self _shouldGenerateAppearanceCallbacksWhenScrolling])
  {
    CGRect v41 = v19;
    uint64_t v42 = (void *)v15;
    id v43 = v13;
    [(UIPageViewController *)self _child:v16 beginAppearanceTransitionIfPossible:1 animated:v9];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    unsigned int v23 = self->_cachedViewControllersForScroll;
    uint64_t v24 = [(NSHashTable *)v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (v28 != v16)
          {
            if (![*(id *)(*((void *)&v48 + 1) + 8 * i) isViewLoaded]
              || ([v28 view], id v29 = (id)objc_claimAutoreleasedReturnValue(),
                                             v29,
                                             v29 == v14))
            {
              [(UIPageViewController *)self _child:v28 beginAppearanceTransitionIfPossible:0 animated:v9];
            }
            else
            {
              [(UIPageViewController *)self _child:v28 endAppearanceTransitionIfPossible:0];
            }
          }
        }
        uint64_t v25 = [(NSHashTable *)v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v25);
    }

    int64_t v22 = v42;
    id v13 = v43;
    uint64_t v19 = v41;
  }
  id v30 = [(UIPageViewController *)self _pageControl];
  uint64_t v31 = [v30 numberOfPages];

  if (a9 && [(UIPageViewController *)self _isPageControlVisible] && v31)
  {
    if (self->_pageControlRequiresValidation)
    {
      [(UIPageViewController *)self _updatePageControlViaDataSourceIfNecessary];
    }
    else if (v45 && v22 != v16)
    {
      long long v32 = v19;
      if ([(UIPageViewController *)self _shouldFlipInRightToLeft]) {
        int64_t v33 = a7 == 0;
      }
      else {
        int64_t v33 = a7;
      }
      long long v34 = [(UIPageViewController *)self _pageControl];
      uint64_t v35 = [v34 currentPage];
      uint64_t v36 = v35 - 1;
      if (!v33) {
        uint64_t v36 = v35 + 1;
      }
      uint64_t v37 = v36 % v31;

      uint64_t v38 = (v31 & (v37 >> 63)) + v37;
      uint64_t v19 = v32;
      CGRect v39 = [(UIPageViewController *)self _pageControl];
      [v39 setCurrentPage:v38];
    }
  }
}

- (void)queuingScrollView:(id)a3 didEndManualScroll:(BOOL)a4 toRevealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 didFinish:(BOOL)a8 didComplete:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  if (!v12 || a9)
  {
    uint64_t v17 = +[UIViewController viewControllerForView:v16];
  }
  else
  {
    uint64_t v17 = [(NSDictionary *)self->_incomingAndOutgoingViewControllersForManualTransition objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
  }
  id v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"UIPageViewController.m", 2054, @"No view controller managing visible view %@", v16 object file lineNumber description];
  }
  long long v32 = v16;
  int64_t v33 = v15;
  if ([(UIPageViewController *)self _shouldGenerateAppearanceCallbacksWhenScrolling])
  {
    [(UIPageViewController *)self _child:v18 beginAppearanceTransitionIfPossible:1 animated:v10];
    if (v9) {
      [(UIPageViewController *)self _child:v18 endAppearanceTransitionIfPossible:1];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v19 = self->_cachedViewControllersForScroll;
  uint64_t v20 = [(NSHashTable *)v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (v24 != v18)
        {
          [(UIPageViewController *)self _child:*(void *)(*((void *)&v34 + 1) + 8 * i) beginAppearanceTransitionIfPossible:0 animated:v10];
          if (v9) {
            [(UIPageViewController *)self _child:v24 endAppearanceTransitionIfPossible:0];
          }
        }
      }
      uint64_t v21 = [(NSHashTable *)v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }

  if (v12 && (*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    uint64_t v25 = [(NSDictionary *)self->_incomingAndOutgoingViewControllersForManualTransition objectForKey:@"UIPageCurlControllerOutgoingLeftViewControllerKey"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v25, 0);
    [WeakRetained pageViewController:self didFinishAnimating:v10 previousViewControllers:v27 transitionCompleted:a9];

    incomingAndOutgoingViewControllersForManualTransition = self->_incomingAndOutgoingViewControllersForManualTransition;
    self->_incomingAndOutgoingViewControllersForManualTransition = 0;
  }
  if ([(UIPageViewController *)self _isPageControlVisible])
  {
    id v29 = [(UIPageViewController *)self _pageControl];
    if (![v29 numberOfPages] || v12 || a9)
    {
    }
    else
    {
      int v30 = [v33 isManualScrollInProgress];

      if (v30) {
        self->_pageControlRequiresValidation = 1;
      }
    }
  }
}

- (void)queuingScrollView:(id)a3 didBailoutOfScrollAndRevealedView:(id)a4
{
  id v12 = a4;
  uint64_t v6 = +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:");
  if (!v6)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIPageViewController.m", 2083, @"No view controller managing visible view %@", v12 object file lineNumber description];
  }
  BOOL v7 = [(UIPageViewController *)self _viewControllers];
  uint64_t v8 = objc_msgSend(v7, "_ui_onlyObject");

  if (v8 != v6)
  {
    BOOL v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v9;
  }
  [(UIPageViewController *)self _updatePageControlViaDataSourceIfNecessary];
}

- (void)queuingScrollViewDidFinishScrolling:(id)a3
{
  if ((*(_WORD *)&self->_delegateFlags & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _pageViewControllerDidFinishTransitions:self];
  }
}

- (id)_queuingScrollView:(id)a3 viewBefore:(BOOL)a4 view:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (([v8 isTracking] & 1) != 0 || objc_msgSend(v8, "isManualScrollInProgress"))
  {
    BOOL v10 = 0;
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
    BOOL v10 = @"kUIFaultingViewSentinel";
  }
  id v12 = v10;
  id v13 = +[UIViewController viewControllerForView:v9];
  if ([(UIPageViewController *)self _shouldFlipInRightToLeft])
  {
    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v6 = v6 ^ 1;
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_11;
  }
  uint64_t v14 = [(UIPageViewController *)self _viewControllerBefore:v6 viewController:v13];
  if (v14)
  {
    id v15 = (void *)v14;
    [(UIPageViewController *)self _cacheViewControllerForScroll:v14];
    uint64_t v16 = [v15 view];

    id v12 = (id)v16;
  }
LABEL_11:

  return v12;
}

- (id)queuingScrollView:(id)a3 viewBeforeView:(id)a4
{
  return [(UIPageViewController *)self _queuingScrollView:a3 viewBefore:1 view:a4];
}

- (id)queuingScrollView:(id)a3 viewAfterView:(id)a4
{
  return [(UIPageViewController *)self _queuingScrollView:a3 viewBefore:0 view:a4];
}

- (void)_flushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v11 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIPageViewController.m", 2125, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

    id v7 = 0;
  }
  if (![(NSHashTable *)self->_cachedViewControllersForScroll containsObject:v7])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v10 = [v11 view];
    [v9 handleFailureInMethod:a2, self, @"UIPageViewController.m", 2126, @"Don't know about flushed view %@", v10 object file lineNumber description];
  }
  [(UIPageViewController *)self _child:v11 beginAppearanceTransitionIfPossible:0 animated:v4];
  [(UIPageViewController *)self _child:v11 endAppearanceTransitionIfPossible:v4];
  [v11 willMoveToParentViewController:0];
  [(UIViewController *)self removeChildViewController:v11];
  [(NSHashTable *)self->_cachedViewControllersForScroll removeObject:v11];
}

- (void)queuingScrollView:(id)a3 didFlushView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[UIViewController viewControllerForView:a4];
  if (v9)
  {
    id v7 = [(UIPageViewController *)self viewControllers];
    uint64_t v8 = [v7 indexOfObjectIdenticalTo:v9];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPageViewController *)self _flushViewController:v9 animated:v5];
    }
  }
}

- (void)queuingScrollView:(id)a3 attemptToPageInDirection:(int64_t)a4
{
  id v8 = [(UIPageViewController *)self _pageControl];
  uint64_t v6 = [v8 currentPage];
  if (a4) {
    uint64_t v7 = v6 - 1;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  [v8 setCurrentPage:v7];
  [(UIPageViewController *)self _handlePagingInDirection:a4 animated:1 completion:0];
}

- (BOOL)queuingScrollViewShouldLayoutSubviews:(id)a3
{
  return !self->_interfaceRotating;
}

- (void)_pageControlValueChanged:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(UIPageViewController *)self _scrollView];
  if ([v4 isTracking])
  {

    goto LABEL_17;
  }
  BOOL v5 = [(UIPageViewController *)self _scrollView];
  char v6 = [v5 isDecelerating];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v11 currentPage];
    uint64_t v8 = [v11 previousPage];
    uint64_t v9 = [v11 interactionState];
    if ([(UIPageViewController *)self _shouldFlipInRightToLeft])
    {
      if (v7 < v8) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = -1;
      }
      if (v7 > v8)
      {
        uint64_t v10 = 1;
LABEL_16:
        [(UIPageViewController *)self _handlePagingInDirection:v10 animated:v9 == 1 completion:0];
        goto LABEL_17;
      }
    }
    else
    {
      if (v7 < v8) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = -1;
      }
      if (v7 > v8)
      {
        uint64_t v10 = 0;
        goto LABEL_16;
      }
    }
    if (v10 != -1) {
      goto LABEL_16;
    }
    [(UIPageViewController *)self _updatePageControlViaDataSourceIfNecessary];
  }
LABEL_17:
}

- (NSArray)_viewControllers
{
  return self->_viewControllers;
}

- (void)_setViewControllers:(id)a3
{
}

- (NSArray)_viewControllersStashedForRotation
{
  return self->_viewControllersStashedForRotation;
}

- (void)_setViewControllersStashedForRotation:(id)a3
{
}

- (BOOL)_isInterfaceRotating
{
  return self->_interfaceRotating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, 0);
  objc_storeStrong((id *)&self->_cachedViewControllersForScroll, 0);
  objc_storeStrong((id *)&self->_cachedViewControllersForCurl, 0);
  objc_storeStrong((id *)&self->_rotationSnapshotViews, 0);
  objc_storeStrong((id *)&self->_viewControllersStashedForRotation, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end