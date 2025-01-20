@interface BKBookOpenAnimator
+ (BOOL)_isSlowModeEnabled;
- (BCCoverAnimatingSource)coverSource;
- (BKBookOpenAnimator)init;
- (BKBookOpenTransitioning)bookViewController;
- (BOOL)_sanityCheckPoint:(CGPoint)a3;
- (BOOL)_shouldFallbackForFailedSanityCheck;
- (BOOL)animatesCoverBounds;
- (BOOL)bookshelfTintCoversBars;
- (BOOL)crossfadeOnCloseCompletion;
- (BOOL)defersBookViewSetupForOpening;
- (BOOL)fadeInCover;
- (BOOL)fitCoverImageIntoClosedCoverFrame;
- (BOOL)interactive;
- (BOOL)isContentRevealed;
- (BOOL)opening;
- (BOOL)rightToLeft;
- (BOOL)skipZoomPhase;
- (BOOL)statusBarHidden;
- (BOOL)wantsCoverShadow;
- (CGPoint)_sanitizedCenterPoint:(CGPoint)a3 name:(id)a4;
- (CGRect)_fullsizeRectForFallback;
- (CGRect)_sanitizedFrameWithCenteredFrame:(CGRect)a3 ofSize:(CGSize)a4 name:(id)a5;
- (CGRect)_sanitizedFrameWithFallbackFrame:(CGRect)a3 fallbackFrame:(CGRect)a4 name:(id)a5 fallbackName:(id)a6;
- (CGRect)_sanitizedFrameWithFullsizeFrame:(CGRect)a3 name:(id)a4;
- (CGRect)closedCoverFrame;
- (CGRect)zoomedCoverFrame;
- (IMViewState)bookViewState;
- (IMViewState)bookshelfViewState;
- (IMViewState)minibarContainerViewState;
- (IMViewState)overlayViewState;
- (NSArray)assertions;
- (NSArray)bookshelfContentViews;
- (NSArray)bookshelfLiveViews;
- (NSArray)bookshelfSnapshots;
- (UIColor)bookshelfTintColor;
- (UIImage)coverImage;
- (UIImage)coverShadowImage;
- (UIView)bookContainerView;
- (UIView)bookshelfTintView;
- (UIView)containerView;
- (UIView)coverContainerView;
- (UIView)coverImageView;
- (UIView)coverShadowView;
- (UIViewController)bookshelfViewController;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (double)_debugDragCoefficient;
- (double)adjustDuration:(double)a3;
- (double)coverAspectRatio;
- (double)duration;
- (double)slowModeExtraDurationMultiplier;
- (double)transitionDuration:(id)a3;
- (id)adjustSpring:(id)a3;
- (id)asyncPrepareWithCompletion;
- (id)cleanupBlock;
- (id)closedCoverFrameBlock;
- (id)initOpening:(BOOL)a3;
- (id)minifiedBarAnimator;
- (id)preTransitionBlock;
- (id)viewControllerForStatusBarStyle;
- (int64_t)coverContentMode;
- (void)_adjustShadowForCurrentCoverBounds;
- (void)_animateTransition;
- (void)_deferredSetupBookView;
- (void)_loadStateFromContext:(id)a3;
- (void)_prepareHostWithCompletion:(id)a3;
- (void)_setupBookshelfAnimationViewsWithCompletion:(id)a3;
- (void)_setupSharedViewsWithCompletion:(id)a3;
- (void)_setupViewController:(id)a3;
- (void)animateNonInteractive;
- (void)animateTransition:(id)a3;
- (void)animationsDidFinish;
- (void)bookContentDidLoad;
- (void)configureWithFromViewController:(id)a3 toViewController:(id)a4;
- (void)minibarKeyFrameAnimationWithDuration:(double)a3 hide:(double)a4 show:(double)a5 completion:(id)a6;
- (void)moveCoverToFrame:(CGRect)a3;
- (void)setAssertions:(id)a3;
- (void)setAsyncPrepareWithCompletion:(id)a3;
- (void)setBookContainerView:(id)a3;
- (void)setBookViewState:(id)a3;
- (void)setBookshelfAlpha:(double)a3;
- (void)setBookshelfLiveViews:(id)a3;
- (void)setBookshelfSnapshots:(id)a3;
- (void)setBookshelfTintView:(id)a3;
- (void)setBookshelfTransform:(CGAffineTransform *)a3;
- (void)setBookshelfViewState:(id)a3;
- (void)setCleanupBlock:(id)a3;
- (void)setClosedCoverFrame:(CGRect)a3;
- (void)setClosedCoverFrameBlock:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCoverContainerView:(id)a3;
- (void)setCoverImage:(id)a3;
- (void)setCoverImageView:(id)a3;
- (void)setCoverShadowImage:(id)a3;
- (void)setCoverShadowView:(id)a3;
- (void)setCoverSource:(id)a3;
- (void)setCrossfadeOnCloseCompletion:(BOOL)a3;
- (void)setFadeInCover:(BOOL)a3;
- (void)setFromViewController:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setMinibarContainerViewState:(id)a3;
- (void)setOverlayViewState:(id)a3;
- (void)setPreTransitionBlock:(id)a3;
- (void)setSkipZoomPhase:(BOOL)a3;
- (void)setToViewController:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setupShadowForCoverView:(id)a3;
- (void)teardownViews:(BOOL)a3;
@end

@implementation BKBookOpenAnimator

- (id)initOpening:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKBookOpenAnimator;
  id result = [(BKBookOpenAnimator *)&v5 init];
  if (result)
  {
    *((unsigned char *)result + 11) = a3;
    *((unsigned char *)result + 10) = 0;
  }
  return result;
}

- (BKBookOpenAnimator)init
{
  return (BKBookOpenAnimator *)[(BKBookOpenAnimator *)self initOpening:0];
}

- (void)animateNonInteractive
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  BCReportAssertionFailureWithMessage();
}

- (double)duration
{
  v2 = NSStringFromSelector(a2);
  v3 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  return 0.0;
}

- (UIViewController)bookshelfViewController
{
  if ([(BKBookOpenAnimator *)self opening]) {
    [(BKBookOpenAnimator *)self fromViewController];
  }
  else {
  v3 = [(BKBookOpenAnimator *)self toViewController];
  }

  return (UIViewController *)v3;
}

- (NSArray)bookshelfContentViews
{
  v3 = [(BKBookOpenAnimator *)self bookshelfViewController];
  objc_opt_class();
  id v4 = BUClassAndProtocolCast();
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 transitionContentViews:&OBJC_PROTOCOL___BKBookshelfOpenTransitioning];
  }
  else
  {
    v7 = [(BKBookOpenAnimator *)self bookshelfViewController];
    v8 = [v7 view];

    if (v8)
    {
      v10 = v8;
      v6 = +[NSArray arrayWithObjects:&v10 count:1];
    }
    else
    {
      BCReportAssertionFailureWithMessage();
      v6 = &__NSArray0__struct;
    }
  }

  return (NSArray *)v6;
}

- (BKBookOpenTransitioning)bookViewController
{
  if ([(BKBookOpenAnimator *)self opening]) {
    [(BKBookOpenAnimator *)self toViewController];
  }
  else {
  v3 = [(BKBookOpenAnimator *)self fromViewController];
  }
  id v4 = [v3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKBookOpenTransitioning];
  objc_opt_class();
  objc_super v5 = BUClassAndProtocolCast();

  if (!v5)
  {
    objc_opt_class();
    BCReportAssertionFailureWithMessage();
  }

  return (BKBookOpenTransitioning *)v5;
}

- (BOOL)rightToLeft
{
  v2 = [(BKBookOpenAnimator *)self bookViewController];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 transitionRightToLeft];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (CGRect)zoomedCoverFrame
{
  unsigned __int8 v3 = [(BKBookOpenAnimator *)self containerView];
  [v3 bounds];
  IMActionSafeRectForRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(BKBookOpenAnimator *)self coverImage];
  [v12 size];

  CGSizeScaleThatFitsInCGSize();
  CGSizeScale();
  CGRectMakeWithSize();
  v13 = [(BKBookOpenAnimator *)self coverContainerView];
  v14 = [v13 superview];
  v15 = [(BKBookOpenAnimator *)self containerView];
  v16 = [v15 superview];
  [v14 convertRect:v16 fromView:v5];
  CGRectCenterRectInRect();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)coverAspectRatio
{
  v2 = [(BKBookOpenAnimator *)self coverImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  if (v4 > 0.0 && v6 > 0.0) {
    return v4 / v6;
  }
  v9.width = v4;
  v9.height = v6;
  double v8 = NSStringFromCGSize(v9);
  BCReportAssertionFailureWithMessage();

  return 1.0;
}

- (BOOL)animatesCoverBounds
{
  return 0;
}

- (BOOL)wantsCoverShadow
{
  return 1;
}

- (UIColor)bookshelfTintColor
{
  return +[UIColor blackColor];
}

- (int64_t)coverContentMode
{
  return 2;
}

- (BOOL)bookshelfTintCoversBars
{
  return 0;
}

- (BOOL)defersBookViewSetupForOpening
{
  return 0;
}

- (void)setBookshelfAlpha:(double)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v5 = [(BKBookOpenAnimator *)self bookshelfSnapshots];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      CGSize v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) setAlpha:a3];
        CGSize v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = [(BKBookOpenAnimator *)self bookshelfLiveViews];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) setAlpha:a3];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)setBookshelfTransform:(CGAffineTransform *)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v5 = [(BKBookOpenAnimator *)self bookshelfSnapshots];
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      CGSize v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v9);
        long long v11 = *(_OWORD *)&a3->c;
        v24[0] = *(_OWORD *)&a3->a;
        v24[1] = v11;
        v24[2] = *(_OWORD *)&a3->tx;
        [v10 setTransform:v24];
        CGSize v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = [(BKBookOpenAnimator *)self bookshelfLiveViews];
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
        long long v18 = *(_OWORD *)&a3->c;
        v19[0] = *(_OWORD *)&a3->a;
        v19[1] = v18;
        v19[2] = *(_OWORD *)&a3->tx;
        [v17 setTransform:v19];
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)moveCoverToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(BKBookOpenAnimator *)self animatesCoverBounds])
  {
    [(BKBookOpenAnimator *)self _sanitizedFrameWithCenteredFrame:@"cover.coverContainerView.frame", x, y, width, height, CGSizeZero.width, CGSizeZero.height ofSize name];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    long long v16 = [(BKBookOpenAnimator *)self coverContainerView];
    [v16 setFrame:v9, v11, v13, v15];

    [(BKBookOpenAnimator *)self _adjustShadowForCurrentCoverBounds];
  }
  else
  {
    CGRectGetCenterNoRounding();
    -[BKBookOpenAnimator _sanitizedCenterPoint:name:](self, "_sanitizedCenterPoint:name:", @"cover.coverContainerView.center");
    double v18 = v17;
    double v20 = v19;
    long long v21 = [(BKBookOpenAnimator *)self coverContainerView];
    [v21 setCenter:v18, v20];

    long long v22 = [(BKBookOpenAnimator *)self coverImage];
    [v22 size];
    CGSizeScaleThatFitsInCGSize();
    CGFloat v24 = v23;

    CGAffineTransformMakeScale(&v27, v24, v24);
    long long v25 = [(BKBookOpenAnimator *)self coverContainerView];
    CGAffineTransform v26 = v27;
    [v25 setTransform:&v26];

    [(BKBookOpenAnimator *)self _adjustShadowForCurrentCoverBounds];
  }
}

- (void)teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKBookOpenAnimator *)self bookshelfTintView];
  [v5 removeFromSuperview];

  [(BKBookOpenAnimator *)self setBookshelfTintView:0];
  id v6 = [(BKBookOpenAnimator *)self coverImageView];
  [v6 removeFromSuperview];

  [(BKBookOpenAnimator *)self setCoverImageView:0];
  id v7 = [(BKBookOpenAnimator *)self coverShadowView];
  [v7 removeFromSuperview];

  [(BKBookOpenAnimator *)self setCoverShadowView:0];
  double v8 = [(BKBookOpenAnimator *)self coverContainerView];
  [v8 removeFromSuperview];

  [(BKBookOpenAnimator *)self setCoverContainerView:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v9 = [(BKBookOpenAnimator *)self bookshelfSnapshots];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) removeFromSuperview];
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  [(BKBookOpenAnimator *)self setBookshelfSnapshots:0];
  [(BKBookOpenAnimator *)self setBookshelfLiveViews:0];
  double v14 = [(BKBookOpenAnimator *)self bookshelfViewState];
  [v14 restore];

  double v15 = [(BKBookOpenAnimator *)self bookViewState];
  [v15 restore];

  long long v16 = [(BKBookOpenAnimator *)self minifiedBarAnimator];
  double v17 = [v16 minifiedBarAnimatorContainerView];

  if (v17)
  {
    [v17 setAlpha:1.0];
    double v18 = [(BKBookOpenAnimator *)self minibarContainerViewState];
    [v18 restore];
  }
  double v19 = [(BKBookOpenAnimator *)self bookContainerView];
  [v19 removeFromSuperview];

  [(BKBookOpenAnimator *)self setBookContainerView:0];
  if (v3) {
    [(BKBookOpenAnimator *)self fromViewController];
  }
  else {
  double v20 = [(BKBookOpenAnimator *)self toViewController];
  }
  long long v21 = [v20 view];
  [v21 removeFromSuperview];
}

- (void)_adjustShadowForCurrentCoverBounds
{
  BOOL v3 = [(BKBookOpenAnimator *)self coverShadowView];

  if (v3)
  {
    double v4 = [(BKBookOpenAnimator *)self coverShadowImage];

    if (v4)
    {
      double v5 = [(BKBookOpenAnimator *)self coverShadowView];
      id v6 = [v5 superview];
      [v6 bounds];

      CGRectGetCenterNoRounding();
      double v8 = v7;
      double v10 = v9;
      id v11 = [(BKBookOpenAnimator *)self coverShadowView];
      [v11 setCenter:v8, v10];

      uint64_t v12 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v12 alignmentRectInsets];

      double v13 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v13 size];
      CGRectMakeWithSize();

      CGSizeScaleThatFitsInCGSize();
      CGAffineTransformMakeScale(&v17, v14, v14);
      double v15 = [(BKBookOpenAnimator *)self coverShadowView];
      CGAffineTransform v16 = v17;
      [v15 setTransform:&v16];
    }
  }
}

- (BOOL)fitCoverImageIntoClosedCoverFrame
{
  return 1;
}

- (void)setupShadowForCoverView:(id)a3
{
  id v4 = a3;
  id v10 = [v4 layer];
  [v4 bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v5 = objc_claimAutoreleasedReturnValue();
  [v10 setShadowPath:[v5 CGPath]];

  id v6 = +[UIColor blackColor];
  [v10 setShadowColor:[v6 CGColor]];

  LODWORD(v7) = 1041865114;
  [v10 setShadowOpacity:v7];
  [(BKBookOpenAnimator *)self closedCoverFrame];
  [v4 bounds];

  CGSizeScaleThatFitsInCGSize();
  double v9 = v8;
  CGSizeScale();
  [v10 setShadowOffset:];
  [v10 setShadowRadius:v9 * 4.0];
}

- (void)_setupSharedViewsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(BKBookOpenAnimator *)self opening]) {
    unsigned __int8 v5 = [(BKBookOpenAnimator *)self defersBookViewSetupForOpening];
  }
  else {
    unsigned __int8 v5 = 0;
  }
  id v6 = [(BKBookOpenAnimator *)self containerView];
  if ([(BKBookOpenAnimator *)self opening])
  {
    double v7 = [v6 window];
    double v8 = +[BCStatusBarBackgroundController backgroundControllerForWindow:v7];
    [v8 setOpacity:1 animated:0.0];
  }
  id v9 = objc_alloc((Class)UIView);
  [v6 bounds];
  id v10 = [v9 initWithFrame:];
  [(BKBookOpenAnimator *)self setBookContainerView:v10];
  [v6 addSubview:v10];
  [v10 setAlpha:-[BKBookOpenAnimator opening](self, "opening") ^ 1];
  id v11 = [(BKBookOpenAnimator *)self fromViewController];
  [(BKBookOpenAnimator *)self _setupViewController:v11];

  if ((v5 & 1) == 0)
  {
    uint64_t v12 = [(BKBookOpenAnimator *)self toViewController];
    [(BKBookOpenAnimator *)self _setupViewController:v12];
  }
  uint64_t v13 = [(BKBookOpenAnimator *)self preTransitionBlock];
  CGFloat v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }

  double v15 = [(BKBookOpenAnimator *)self minifiedBarAnimator];
  CGAffineTransform v16 = [v15 minifiedBarAnimatorContainerView];

  if (v16)
  {
    CGAffineTransform v17 = +[IMViewState saveStateForView:v16 flags:3];
    [(BKBookOpenAnimator *)self setMinibarContainerViewState:v17];

    double v18 = [v16 layer];
    [v18 setZPosition:1.0];

    [v6 addSubview:v16];
  }
  [v6 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  CGAffineTransform v27 = [(BKBookOpenAnimator *)self bookshelfViewController];
  long long v28 = [v27 view];
  [v28 setFrame:v20, v22, v24, v26];

  v29 = [(BKBookOpenAnimator *)self bookshelfViewController];
  v30 = [v29 view];
  [v6 addSubview:v30];

  if (![(BKBookOpenAnimator *)self opening])
  {
    v31 = [(BKBookOpenAnimator *)self bookContainerView];
    [v6 addSubview:v31];
  }
  v32 = [(BKBookOpenAnimator *)self closedCoverFrameBlock];
  if (v32)
  {
    v30 = [(BKBookOpenAnimator *)self closedCoverFrameBlock];
    double x = v30[2]();
    double y = v34;
    double width = v36;
    double height = v38;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  v40 = [(BKBookOpenAnimator *)self bookshelfViewController];
  v41 = [v40 view];
  [v6 convertRect:v41 fromView:x, y, width, height];
  double v43 = v42;
  double v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  if (v32) {
  double v50 = v49;
  }
  double v51 = v47;
  double v52 = v45;
  double v53 = v43;
  if ([(BKBookOpenAnimator *)self fitCoverImageIntoClosedCoverFrame])
  {
    [(UIImage *)self->_coverImage size];
    CGRectFitRectInRect();
    CGFloat v54 = v110.origin.x;
    double v107 = v49;
    double v55 = v47;
    CGFloat v56 = v110.origin.y;
    double v51 = v110.size.width;
    double v50 = v110.size.height;
    double v53 = v43 + CGRectGetMinX(v110);
    v111.origin.double x = v54;
    v111.origin.double y = v56;
    CGFloat v47 = v55;
    CGFloat v49 = v107;
    v111.size.double width = v51;
    v111.size.double height = v50;
    double v52 = v45 + CGRectGetMinY(v111);
  }
  -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:", v53, v52, v51, v50);
  v57 = [(BKBookOpenAnimator *)self coverSource];
  id v58 = [v57 coverAnimationSourceAlignment];

  if (v58 == (id)2)
  {
    v112.origin.double x = v43;
    v112.origin.double y = v45;
    v112.size.double width = v47;
    v112.size.double height = v49;
    double MaxY = CGRectGetMaxY(v112);
    v113.origin.double x = v53;
    v113.origin.double y = v52;
    v113.size.double width = v51;
    v113.size.double height = v50;
    double v60 = MaxY - CGRectGetHeight(v113);
    v114.origin.double x = v53;
    v114.origin.double y = v52;
    v114.size.double width = v51;
    v114.size.double height = v50;
    double v61 = round(v60 - CGRectGetMinY(v114));
    if (v61 > 0.0) {
      -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:", v53, v52 + v61, v51, v50);
    }
  }
  [(BKBookOpenAnimator *)self closedCoverFrame];
  if (CGRectIsEmpty(v115))
  {
    [(BKBookOpenAnimator *)self closedCoverFrame];
    v118.origin.double x = CGRectZero.origin.x;
    v118.origin.double y = CGRectZero.origin.y;
    v118.size.double width = CGRectZero.size.width;
    v118.size.double height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v116, v118)) {
      BCReportAssertionFailureWithMessage();
    }
    [(BKBookOpenAnimator *)self setFadeInCover:1];
    v62 = [(BKBookOpenAnimator *)self containerView];
    [v62 bounds];
    IMActionSafeRectForRect();

    v63 = [(BKBookOpenAnimator *)self coverImage];
    [v63 size];

    CGSizeScaleThatFitsInCGSize();
    CGSizeScale();
    CGRectMakeWithSize();
    CGRectCenterRectInRect();
    -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:");
  }
  [(BKBookOpenAnimator *)self bookshelfTintCoversBars];
  id v108 = v6;
  id v64 = objc_alloc((Class)UIView);
  [v108 bounds];
  id v65 = [v64 initWithFrame:];
  v66 = [(BKBookOpenAnimator *)self bookshelfTintColor];
  [v65 setBackgroundColor:v66];
  [v65 setAlpha:0.0];
  [v108 addSubview:v65];
  [(BKBookOpenAnimator *)self setBookshelfTintView:v65];
  v67 = [(BKBookOpenAnimator *)self coverImage];
  [v67 size];
  CGRectMakeWithSize();
  IsEmptdouble y = CGRectIsEmpty(v117);

  if (IsEmpty) {
    BCReportAssertionFailureWithMessage();
  }
  id v69 = objc_alloc((Class)UIView);
  v70 = [(BKBookOpenAnimator *)self coverImage];
  [v70 size];
  CGRectMakeWithSize();
  id v71 = [v69 initWithFrame:];

  [(BKBookOpenAnimator *)self setCoverContainerView:v71];
  double v72 = 1.0;
  if ([(BKBookOpenAnimator *)self opening])
  {
    if ([(BKBookOpenAnimator *)self fadeInCover]) {
      double v72 = 0.0;
    }
    else {
      double v72 = 1.0;
    }
  }
  v73 = [(BKBookOpenAnimator *)self coverContainerView];
  [v73 setAlpha:v72];

  if ([(BKBookOpenAnimator *)self wantsCoverShadow])
  {
    v74 = [(BKBookOpenAnimator *)self coverShadowImage];

    if (v74)
    {
      id v75 = objc_alloc((Class)UIImageView);
      v76 = [(BKBookOpenAnimator *)self coverShadowImage];
      v77 = (BKCustomAnimationPropertiesView *)[v75 initWithImage:v76];

      v78 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v78 alignmentRectInsets];
      double v80 = v79;
      double v82 = v81;
      double v84 = v83;
      double v86 = v85;

      v87 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v87 size];
      double v89 = v88;
      double v91 = v90;

      CGRectMakeWithSize();
      double v94 = (v82 + (v92 - (v82 + v86)) * 0.5) / v89;
      double v95 = (v80 + (v93 - (v80 + v84)) * 0.5) / v91;
      v96 = [(BKCustomAnimationPropertiesView *)v77 layer];
      [v96 setAnchorPoint:v94, v95];
    }
    else
    {
      v97 = [BKCustomAnimationPropertiesView alloc];
      v98 = [(BKBookOpenAnimator *)self coverImage];
      [v98 size];
      CGRectMakeWithSize();
      v77 = -[BKCustomAnimationPropertiesView initWithFrame:](v97, "initWithFrame:");

      [(BKCustomAnimationPropertiesView *)v77 setAutoresizingMask:18];
      [(BKCustomAnimationPropertiesView *)v77 addAnimatablePropertyWithKey:@"shadowPath"];
      [(BKCustomAnimationPropertiesView *)v77 addAnimatablePropertyWithKey:@"shadowRadius"];
      [(BKCustomAnimationPropertiesView *)v77 addAnimatablePropertyWithKey:@"shadowOffset"];
    }
    [(BKBookOpenAnimator *)self setCoverShadowView:v77];
    [v71 addSubview:v77];
    [(BKBookOpenAnimator *)self _adjustShadowForCurrentCoverBounds];
  }
  id v99 = objc_alloc((Class)UIImageView);
  v100 = [(BKBookOpenAnimator *)self coverImage];
  id v101 = [v99 initWithImage:v100];

  [(BKBookOpenAnimator *)self setCoverImageView:v101];
  [v101 setAccessibilityIgnoresInvertColors:1];
  [v101 setAutoresizingMask:18];
  v102 = [(BKBookOpenAnimator *)self coverImage];
  [v102 scale];
  double v104 = v103;
  v105 = [v101 layer];
  [v105 setContentsScale:v104];

  [v101 setClipsToBounds:1];
  [v101 setContentMode:[self coverContentMode]];
  v106 = [(BKBookOpenAnimator *)self coverImage];
  [v106 size];
  CGRectMakeWithSize();
  [v101 setFrame:];

  [v71 addSubview:v101];
  if ([(BKBookOpenAnimator *)self opening])
  {
    [v108 addSubview:v71];
    [(BKBookOpenAnimator *)self closedCoverFrame];
    -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:");
  }
  [(BKBookOpenAnimator *)self performAdditionSetup];
  [(BKBookOpenAnimator *)self _prepareHostWithCompletion:v4];
}

- (void)_setupViewController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKBookOpenAnimator *)self containerView];
  id v6 = [v4 view];
  id v7 = [(BKBookOpenAnimator *)self fromViewController];

  id v8 = [(BKBookOpenAnimator *)self bookshelfViewController];

  id v9 = BUProtocolCast();
  if (objc_opt_respondsToSelector()) {
    [v9 willAddViewToHierarchy];
  }
  +[CATransaction begin];
  [v5 addSubview:v6];
  [v5 bounds];
  [v6 setFrame:];
  kdebug_trace();
  id v10 = _AEBookOpenLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"to";
    if (v7 == v4) {
      CFStringRef v11 = @"from";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Beginning layout %{public}@VC start", buf, 0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001E5E4C;
  v18[3] = &unk_100A43D60;
  id v12 = v6;
  id v19 = v12;
  +[UIView performWithoutAnimation:v18];
  kdebug_trace();
  if (v8 == v4)
  {
    CGFloat v14 = [(BKBookOpenAnimator *)self bookshelfViewController];
    CGAffineTransform v16 = [v14 view];
    CGAffineTransform v17 = +[IMViewState saveStateForView:v16 flags:1];
    [(BKBookOpenAnimator *)self setBookshelfViewState:v17];
  }
  else
  {
    uint64_t v13 = [(BKBookOpenAnimator *)self bookViewController];
    CGFloat v14 = [v13 view];

    double v15 = +[IMViewState saveStateForView:v14 flags:1];
    [(BKBookOpenAnimator *)self setBookViewState:v15];

    CGAffineTransform v16 = [(BKBookOpenAnimator *)self bookContainerView];
    [v16 addSubview:v14];
  }

  +[CATransaction commit];
}

- (void)_deferredSetupBookView
{
  id v3 = [(BKBookOpenAnimator *)self toViewController];
  [(BKBookOpenAnimator *)self _setupViewController:v3];
}

- (void)_prepareHostWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKBookOpenAnimator *)self toViewController];
  id v6 = [v5 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost];

  if (objc_opt_respondsToSelector())
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001E5FF0;
    v12[3] = &unk_100A44120;
    id v7 = &v13;
    v12[4] = self;
    id v13 = v4;
    id v8 = v4;
    [v6 coverAnimationHostPrepareWithCompletion:v12];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001E6084;
    v10[3] = &unk_100A44120;
    id v7 = &v11;
    v10[4] = self;
    id v11 = v4;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)_setupBookshelfAnimationViewsWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)UIApp;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E6130;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 _performBlockAfterCATransactionCommits:v7];
}

- (void)bookContentDidLoad
{
  kdebug_trace();
  v2 = _AEBookOpenLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "bookContentDidLoad signaled", v3, 2u);
  }
}

- (void)configureWithFromViewController:(id)a3 toViewController:(id)a4
{
  id v6 = a4;
  [(BKBookOpenAnimator *)self setFromViewController:a3];
  [(BKBookOpenAnimator *)self setToViewController:v6];
}

- (id)viewControllerForStatusBarStyle
{
  id v3 = [(BKBookOpenAnimator *)self transitionContext];
  if ([v3 transitionWasCancelled]) {
    [(BKBookOpenAnimator *)self fromViewController];
  }
  else {
  id v4 = [(BKBookOpenAnimator *)self toViewController];
  }

  return v4;
}

- (void)animationsDidFinish
{
  id v3 = _AEBookOpenLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "animationsDidFinish signaled", buf, 2u);
  }

  id v4 = [(BKBookOpenAnimator *)self transitionContext];
  uint64_t v5 = [v4 transitionWasCancelled] ^ 1;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E66F8;
  v11[3] = &unk_100A44E60;
  v11[4] = self;
  char v12 = v5;
  +[UIView performWithoutAnimation:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E69C8;
  v9[3] = &unk_100A44E60;
  char v10 = v5;
  v9[4] = self;
  id v6 = objc_retainBlock(v9);
  uint64_t v7 = [(BKBookOpenAnimator *)self cleanupBlock];
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);
  }
  [(BKBookOpenAnimator *)self setCleanupBlock:0];

  ((void (*)(void *))v6[2])(v6);
}

- (void)_loadStateFromContext:(id)a3
{
  id v4 = a3;
  [(BKBookOpenAnimator *)self setTransitionContext:v4];
  uint64_t v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  [(BKBookOpenAnimator *)self setFromViewController:v5];

  id v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  [(BKBookOpenAnimator *)self setToViewController:v6];

  uint64_t v7 = [v4 containerView];
  [(BKBookOpenAnimator *)self setContainerView:v7];

  id v8 = [v4 isInteractive];

  [(BKBookOpenAnimator *)self setInteractive:v8];
}

- (double)transitionDuration:(id)a3
{
  [(BKBookOpenAnimator *)self _loadStateFromContext:a3];
  if ([(BKBookOpenAnimator *)self opening]) {
    return 1.0e10;
  }

  [(BKBookOpenAnimator *)self duration];
  return result;
}

- (void)animateTransition:(id)a3
{
  [(BKBookOpenAnimator *)self _loadStateFromContext:a3];
  id asyncPrepareWithCompletion = self->_asyncPrepareWithCompletion;
  if (asyncPrepareWithCompletion)
  {
    uint64_t v5 = (void (**)(id, void *))objc_retainBlock(asyncPrepareWithCompletion);
    id v6 = self->_asyncPrepareWithCompletion;
    self->_id asyncPrepareWithCompletion = 0;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001E6D40;
    v7[3] = &unk_100A43D60;
    v7[4] = self;
    v5[2](v5, v7);
  }
  else
  {
    [(BKBookOpenAnimator *)self _animateTransition];
  }
}

- (void)_animateTransition
{
  id v3 = [(BKBookOpenAnimator *)self toViewController];
  id v4 = [v3 transitionCoordinator];
  uint64_t v5 = [(BKBookOpenAnimator *)self containerView];
  [v4 animateAlongsideTransitionInView:v5 animation:&stru_100A4AFC8 completion:0];

  id v6 = [(BKBookOpenAnimator *)self coverSource];
  [v6 coverAnimationSourcePrepare];

  kdebug_trace();
  uint64_t v7 = _AEBookOpenLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Open animator setup", buf, 2u);
  }

  if ([(BKBookOpenAnimator *)self opening]
    && [(BKBookOpenAnimator *)self defersBookViewSetupForOpening])
  {
    id v8 = [(BKBookOpenAnimator *)self bookViewController];
    if (objc_opt_respondsToSelector()) {
      [v8 bookOpenTransitionWillBegin];
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E6ED8;
  v9[3] = &unk_100A43D60;
  v9[4] = self;
  [(BKBookOpenAnimator *)self _setupSharedViewsWithCompletion:v9];
}

- (id)minifiedBarAnimator
{
  v2 = [(BKBookOpenAnimator *)self toViewController];
  id v3 = [v2 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedBarAnimating];

  return v3;
}

- (void)minibarKeyFrameAnimationWithDuration:(double)a3 hide:(double)a4 show:(double)a5 completion:(id)a6
{
  id v10 = a6;
  [(BKBookOpenAnimator *)self minifiedBarAnimator];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001E72A4;
  v21[3] = &unk_100A43DD8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v11;
  double v23 = self;
  +[UIView performWithoutAnimation:v21];
  unsigned int v12 = [(BKBookOpenAnimator *)self opening];
  if ([(BKBookOpenAnimator *)self opening])
  {
    id v13 = (void (**)(id, uint64_t))objc_retainBlock(v10);

    if (v13) {
      v13[2](v13, 1);
    }
  }
  else
  {
    if (v12) {
      double v14 = a4;
    }
    else {
      double v14 = a5;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E72F8;
    v15[3] = &unk_100A4AFF0;
    if (!v12) {
      a5 = a4;
    }
    double v18 = v14;
    double v19 = a3;
    CGAffineTransform v16 = (void (**)(id, uint64_t))v11;
    CGAffineTransform v17 = self;
    double v20 = a5;
    +[UIView animateKeyframesWithDuration:0 delay:v15 options:v10 animations:a3 completion:0.0];

    id v13 = v16;
  }
}

- (BOOL)isContentRevealed
{
  return 1;
}

+ (BOOL)_isSlowModeEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKBookOpenAnimatorSlowModeEnabled"];

  return v3;
}

- (double)slowModeExtraDurationMultiplier
{
  return 1.0;
}

- (double)_debugDragCoefficient
{
  if ([(id)objc_opt_class() _isSlowModeEnabled]) {
    double v3 = 3.0;
  }
  else {
    double v3 = 1.0;
  }
  double v4 = AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * v3;
  [(BKBookOpenAnimator *)self slowModeExtraDurationMultiplier];
  return v4 * v5;
}

- (double)adjustDuration:(double)a3
{
  [(BKBookOpenAnimator *)self _debugDragCoefficient];
  return v4 * a3;
}

- (id)adjustSpring:(id)a3
{
  id v4 = a3;
  [(BKBookOpenAnimator *)self _debugDragCoefficient];
  double v6 = v5;
  id v7 = objc_alloc((Class)UISpringTimingParameters);
  [v4 mass];
  double v9 = v8;
  [v4 stiffness];
  double v11 = v10 / (v6 * v6);
  [v4 damping];
  double v13 = v12 / v6;
  [v4 initialVelocity];
  double v15 = v14;
  double v17 = v16;

  id v18 = [v7 initWithMass:v9 stiffness:v11 damping:v13 initialVelocity:v15];

  return v18;
}

- (BOOL)_sanityCheckPoint:(CGPoint)a3
{
  int IsValid = CGFloatIsValid();
  if (IsValid)
  {
    LOBYTE(IsValid) = CGFloatIsValid();
  }
  return IsValid;
}

- (BOOL)_shouldFallbackForFailedSanityCheck
{
  return 1;
}

- (CGRect)_sanitizedFrameWithFallbackFrame:(CGRect)a3 fallbackFrame:(CGRect)a4 name:(id)a5 fallbackName:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  id v16 = a5;
  id v17 = a6;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", v14, v13, v12, v11))
  {
    v24.origin.double x = v14;
    v24.origin.double y = v13;
    v24.size.double width = v12;
    v24.size.double height = v11;
    id v18 = NSStringFromCGRect(v24);
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    double v23 = NSStringFromCGRect(v25);
    BCReportAssertionFailureWithMessage();

    if ([(BKBookOpenAnimator *)self _shouldFallbackForFailedSanityCheck])
    {
      double v11 = height;
      double v12 = width;
      double v13 = y;
      double v14 = x;
    }
  }

  double v19 = v14;
  double v20 = v13;
  double v21 = v12;
  double v22 = v11;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)_fullsizeRectForFallback
{
  v2 = [(BKBookOpenAnimator *)self containerView];
  double v3 = [v2 window];

  if (v3)
  {
    [v3 bounds];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  if (CGRectIsEmpty(v21))
  {
    double v12 = +[UIScreen mainScreen];
    [v12 bounds];
    CGFloat x = v13;
    CGFloat y = v14;
    CGFloat width = v15;
    CGFloat height = v16;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_sanitizedFrameWithFullsizeFrame:(CGRect)a3 name:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", x, y, width, height))
  {
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    double v18 = NSStringFromCGRect(v19);
    BCReportAssertionFailureWithMessage();

    if ([(BKBookOpenAnimator *)self _shouldFallbackForFailedSanityCheck])
    {
      [(BKBookOpenAnimator *)self _fullsizeRectForFallback];
      double x = v10;
      double y = v11;
      double width = v12;
      double height = v13;
    }
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_sanitizedFrameWithCenteredFrame:(CGRect)a3 ofSize:(CGSize)a4 name:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", x, y, v8, v7))
  {
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.CGFloat width = v8;
    v24.size.CGFloat height = v7;
    double v13 = NSStringFromCGRect(v24);
    v23.CGFloat width = width;
    v23.CGFloat height = height;
    double v22 = NSStringFromCGSize(v23);
    BCReportAssertionFailureWithMessage();

    if ([(BKBookOpenAnimator *)self _shouldFallbackForFailedSanityCheck])
    {
      [(BKBookOpenAnimator *)self _fullsizeRectForFallback];
      CGRectGetCenter();
      CGRectMakeWithCenterAndSize();
      double x = v14;
      double y = v15;
      double v8 = v16;
      double v7 = v17;
    }
  }

  double v18 = x;
  double v19 = y;
  double v20 = v8;
  double v21 = v7;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGPoint)_sanitizedCenterPoint:(CGPoint)a3 name:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!-[BKBookOpenAnimator _sanityCheckPoint:](self, "_sanityCheckPoint:", x, y))
  {
    v13.double x = x;
    v13.double y = y;
    id v12 = NSStringFromCGPoint(v13);
    BCReportAssertionFailureWithMessage();

    if ([(BKBookOpenAnimator *)self _shouldFallbackForFailedSanityCheck])
    {
      [(BKBookOpenAnimator *)self _fullsizeRectForFallback];
      CGRectGetCenter();
      double x = v8;
      double y = v9;
    }
  }

  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)closedCoverFrameBlock
{
  return self->_coverClosedFrameBlock;
}

- (void)setClosedCoverFrameBlock:(id)a3
{
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
}

- (UIImage)coverShadowImage
{
  return self->_coverShadowImage;
}

- (void)setCoverShadowImage:(id)a3
{
}

- (BCCoverAnimatingSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
}

- (id)cleanupBlock
{
  return self->_cleanupBlock;
}

- (void)setCleanupBlock:(id)a3
{
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (id)preTransitionBlock
{
  return self->_preTransitionBlock;
}

- (void)setPreTransitionBlock:(id)a3
{
}

- (BOOL)skipZoomPhase
{
  return self->_skipZoomPhase;
}

- (void)setSkipZoomPhase:(BOOL)a3
{
  self->_skipZoomPhase = a3;
}

- (BOOL)crossfadeOnCloseCompletion
{
  return self->_crossfadeOnCloseCompletion;
}

- (void)setCrossfadeOnCloseCompletion:(BOOL)a3
{
  self->_crossfadeOnCloseCompletion = a3;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (id)asyncPrepareWithCompletion
{
  return self->_asyncPrepareWithCompletion;
}

- (void)setAsyncPrepareWithCompletion:(id)a3
{
}

- (BOOL)opening
{
  return self->_opening;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)bookContainerView
{
  return self->_bookContainerView;
}

- (void)setBookContainerView:(id)a3
{
}

- (UIView)bookshelfTintView
{
  return self->_bookshelfTintView;
}

- (void)setBookshelfTintView:(id)a3
{
}

- (CGRect)closedCoverFrame
{
  double x = self->_closedCoverFrame.origin.x;
  double y = self->_closedCoverFrame.origin.y;
  double width = self->_closedCoverFrame.size.width;
  double height = self->_closedCoverFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClosedCoverFrame:(CGRect)a3
{
  self->_closedCoverFrame = a3;
}

- (BOOL)fadeInCover
{
  return self->_fadeInCover;
}

- (void)setFadeInCover:(BOOL)a3
{
  self->_fadeInCover = a3;
}

- (UIView)coverContainerView
{
  return self->_coverContainerView;
}

- (void)setCoverContainerView:(id)a3
{
}

- (UIView)coverShadowView
{
  return self->_coverShadowView;
}

- (void)setCoverShadowView:(id)a3
{
}

- (UIView)coverImageView
{
  return self->_coverImageView;
}

- (void)setCoverImageView:(id)a3
{
}

- (NSArray)bookshelfLiveViews
{
  return self->_bookshelfLiveViews;
}

- (void)setBookshelfLiveViews:(id)a3
{
}

- (NSArray)bookshelfSnapshots
{
  return self->_bookshelfSnapshots;
}

- (void)setBookshelfSnapshots:(id)a3
{
}

- (IMViewState)bookshelfViewState
{
  return self->_bookshelfViewState;
}

- (void)setBookshelfViewState:(id)a3
{
}

- (IMViewState)bookViewState
{
  return self->_bookViewState;
}

- (void)setBookViewState:(id)a3
{
}

- (IMViewState)overlayViewState
{
  return self->_overlayViewState;
}

- (void)setOverlayViewState:(id)a3
{
}

- (IMViewState)minibarContainerViewState
{
  return self->_minibarContainerViewState;
}

- (void)setMinibarContainerViewState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minibarContainerViewState, 0);
  objc_storeStrong((id *)&self->_overlayViewState, 0);
  objc_storeStrong((id *)&self->_bookViewState, 0);
  objc_storeStrong((id *)&self->_bookshelfViewState, 0);
  objc_storeStrong((id *)&self->_bookshelfSnapshots, 0);
  objc_storeStrong((id *)&self->_bookshelfLiveViews, 0);
  objc_storeStrong((id *)&self->_coverImageView, 0);
  objc_storeStrong((id *)&self->_coverShadowView, 0);
  objc_storeStrong((id *)&self->_coverContainerView, 0);
  objc_storeStrong((id *)&self->_bookshelfTintView, 0);
  objc_storeStrong((id *)&self->_bookContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong(&self->_asyncPrepareWithCompletion, 0);
  objc_storeStrong(&self->_preTransitionBlock, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong((id *)&self->_coverSource, 0);
  objc_storeStrong((id *)&self->_coverShadowImage, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);

  objc_storeStrong(&self->_coverClosedFrameBlock, 0);
}

@end