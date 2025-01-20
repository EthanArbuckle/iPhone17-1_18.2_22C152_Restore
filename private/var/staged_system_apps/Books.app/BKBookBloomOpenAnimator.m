@interface BKBookBloomOpenAnimator
+ (CGRect)_availableRectForFittingZoomedCoverInContainerViewBounds:(CGRect)a3 isCompact:(BOOL)a4;
+ (CGRect)zoomedFrameForCoverWithSize:(CGSize)a3 isCompact:(BOOL)a4 containerViewBounds:(CGRect)a5;
+ (double)marginPercentage:(BOOL)a3;
+ (double)maxCoverScale:(BOOL)a3;
+ (id)backgroundColorForZoomedBookCover;
+ (void)setBlurRadius:(double)a3 forView:(id)a4;
+ (void)setBrightnessFilter:(double)a3 forView:(id)a4;
- (BOOL)_contentViewIsShowingCover;
- (BOOL)bookshelfTintCoversBars;
- (BOOL)useShadowEffects;
- (CGRect)closedContentContainerFrame;
- (CGRect)revealBigContentContainerFrame;
- (CGRect)revealBigCoverFrame;
- (CGRect)revealSmallContentContainerFrame;
- (CGRect)zoomedCoverFrame;
- (NSMutableArray)viewsToBeCleanedUp;
- (UIEdgeInsets)_insetsFromContentSize:(CGSize)a3 toCoverSize:(CGSize)a4 containerSize:(CGSize)a5 isCompact:(BOOL)a6;
- (UIView)blurredCoverContainer;
- (UIView)blurredShadowContainer;
- (UIView)blurredShadowSnapshot;
- (UIView)contentBackgroundView;
- (UIView)contentContainerView;
- (UIView)contentSnapshot;
- (UIView)fullBookSnapshot;
- (double)closeDuration;
- (double)duration;
- (double)minSecondHalfDelayOnClose;
- (double)minSecondHalfDelayOnOpen;
- (double)revealDuration;
- (double)slowModeExtraDurationMultiplier;
- (double)zoomDuration;
- (id)_closeSpring;
- (id)_customTimingFunction;
- (id)_revealSpring;
- (id)_zoomSpring;
- (id)bookshelfTintColor;
- (id)initOpening:(BOOL)a3;
- (uint64_t)_frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:;
- (void)_adjustShadowForCurrentCoverBounds;
- (void)_animateRevealForClosingWithCompletion:(id)a3;
- (void)_animateRevealForOpeningWithCompletion:(id)a3;
- (void)_moveContentContainerToFrame:(CGRect)a3;
- (void)_moveCoverToFrame:(CGRect)a3 extraTransform:(CGAffineTransform *)a4;
- (void)_setTargetFrame:(CGRect)a3 forView:(id)a4 baseFrame:(CGRect)a5 extraTransform:(CGAffineTransform *)a6;
- (void)_teardownContentViews;
- (void)animateRevealWithCompletion:(id)a3;
- (void)animateZoomWithCompletion:(id)a3;
- (void)performAdditionSetup;
- (void)setBlurredCoverContainer:(id)a3;
- (void)setBlurredShadowContainer:(id)a3;
- (void)setBlurredShadowSnapshot:(id)a3;
- (void)setClosedContentContainerFrame:(CGRect)a3;
- (void)setContentBackgroundView:(id)a3;
- (void)setContentContainerView:(id)a3;
- (void)setContentSnapshot:(id)a3;
- (void)setFullBookSnapshot:(id)a3;
- (void)setRevealBigContentContainerFrame:(CGRect)a3;
- (void)setRevealBigCoverFrame:(CGRect)a3;
- (void)setRevealSmallContentContainerFrame:(CGRect)a3;
- (void)setUseShadowEffects:(BOOL)a3;
- (void)setViewsToBeCleanedUp:(id)a3;
- (void)setupSpinner;
- (void)setupViewsForReveal;
- (void)setupViewsForZoom;
- (void)teardownViews:(BOOL)a3;
@end

@implementation BKBookBloomOpenAnimator

- (id)initOpening:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKBookBloomOpenAnimator;
  v3 = [(BKBookOpenAnimator *)&v7 initOpening:a3];
  if (v3)
  {
    uint64_t v4 = +[NSMutableArray array];
    v5 = (void *)v3[40];
    v3[40] = v4;
  }
  return v3;
}

- (id)_zoomSpring
{
  v3 = [(BKBookOpenAnimator *)self toViewController];
  if (objc_msgSend(v3, "im_isCompactWidth"))
  {
    unsigned int v4 = 1;
  }
  else
  {
    v5 = [(BKBookOpenAnimator *)self toViewController];
    unsigned int v4 = [v5 im_isCompactHeight];
  }
  id v6 = objc_alloc((Class)UISpringTimingParameters);
  double v7 = 300.0;
  if (!v4) {
    double v7 = 200.0;
  }
  double v8 = 30.0;
  if (v4) {
    double v8 = 35.0;
  }
  id v9 = [v6 initWithMass:1.0 stiffness:v7 damping:v8 initialVelocity:0.0];
  v10 = [(BKBookOpenAnimator *)self adjustSpring:v9];

  return v10;
}

- (id)_revealSpring
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:325.0 damping:30.0 initialVelocity:0.0];
  unsigned int v4 = [(BKBookOpenAnimator *)self adjustSpring:v3];

  return v4;
}

- (id)_closeSpring
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:325.0 damping:30.0 initialVelocity:0.0];
  unsigned int v4 = [(BKBookOpenAnimator *)self adjustSpring:v3];

  return v4;
}

- (id)_customTimingFunction
{
  LODWORD(v2) = 1051371084;
  LODWORD(v3) = 1045220557;
  LODWORD(v4) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
}

- (double)duration
{
  if ([(BKBookOpenAnimator *)self opening])
  {
    [(BKBookBloomOpenAnimator *)self zoomDuration];
    double v4 = v3;
    [(BKBookBloomOpenAnimator *)self revealDuration];
    return v4 + v5;
  }
  else
  {
    [(BKBookBloomOpenAnimator *)self closeDuration];
  }
  return result;
}

- (double)zoomDuration
{
  double v2 = [(BKBookBloomOpenAnimator *)self _zoomSpring];
  [v2 settlingDuration];
  double v4 = v3;

  return v4;
}

- (double)revealDuration
{
  double v2 = [(BKBookBloomOpenAnimator *)self _revealSpring];
  [v2 settlingDuration];
  double v4 = v3;

  return v4;
}

- (double)closeDuration
{
  if ([(BKBookOpenAnimator *)self fadeInCover])
  {
    [(BKBookOpenAnimator *)self adjustDuration:0.32];
  }
  else
  {
    double v4 = [(BKBookBloomOpenAnimator *)self _closeSpring];
    [v4 settlingDuration];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.4;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (double)slowModeExtraDurationMultiplier
{
  return 1.0;
}

- (id)bookshelfTintColor
{
  return +[BKBookBloomOpenAnimator backgroundColorForZoomedBookCover];
}

- (BOOL)bookshelfTintCoversBars
{
  return 1;
}

- (UIEdgeInsets)_insetsFromContentSize:(CGSize)a3 toCoverSize:(CGSize)a4 containerSize:(CGSize)a5 isCompact:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  if ([(BKBookBloomOpenAnimator *)self _contentViewIsShowingCover])
  {
    CGRectMakeWithSize();
  }
  else
  {
    CGRectMakeWithSize();
    +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v6, v10, v9, v11, v12, v13, v14);
    CGFloat v19 = v18;
    CGFloat v20 = v15;
    CGFloat v21 = v16;
    CGFloat v22 = v17;
    double v23 = 0.1;
    if (!v6) {
      double v23 = 0.0;
    }
    if (width <= height) {
      double v24 = v23;
    }
    else {
      double v24 = -0.3;
    }
    CGFloat v25 = v19;
    CGFloat v26 = v24 * CGRectGetWidth(*(CGRect *)(&v15 - 1));
    v40.origin.CGFloat x = v19;
    v40.origin.CGFloat y = v20;
    v40.size.double width = v21;
    v40.size.double height = v22;
    CGRect v41 = CGRectInset(v40, v26, 0.0);
    CGFloat x = v41.origin.x;
    CGFloat v38 = v41.size.width;
    CGFloat y = v41.origin.y;
    CGFloat v37 = v41.size.height;
    CGRectMakeWithSize();
    +[BKBookBloomOpenAnimator _availableRectForFittingZoomedCoverInContainerViewBounds:isCompact:](BKBookBloomOpenAnimator, "_availableRectForFittingZoomedCoverInContainerViewBounds:isCompact:", v6);
    v44.origin.CGFloat x = v29;
    v44.origin.CGFloat y = v30;
    v44.size.double width = v31;
    v44.size.double height = v32;
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.double height = v37;
    v42.size.double width = v38;
    CGRectIntersection(v42, v44);
  }
  sub_1000C4BEC();

  BCNormalizedInsetsForRects();
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

- (uint64_t)_frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:
{
  uint64_t v0 = sub_1000C4BEC();

  return _BCRectByUnapplyingNormalizedInsets(v0);
}

- (CGRect)zoomedCoverFrame
{
  double v3 = [(BKBookOpenAnimator *)self bookViewController];
  if (objc_msgSend(v3, "im_isCompactWidth"))
  {
    uint64_t v4 = 1;
  }
  else
  {
    double v5 = [(BKBookOpenAnimator *)self bookViewController];
    uint64_t v4 = [v5 im_isCompactHeight];
  }
  BOOL v6 = [(BKBookOpenAnimator *)self containerView];
  [v6 bounds];
  IMActionSafeRectForRect();

  double v7 = [(BKBookOpenAnimator *)self coverImage];
  [v7 size];
  +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(BKBookOpenAnimator *)self coverContainerView];
  double v17 = [v16 superview];
  double v18 = [(BKBookOpenAnimator *)self containerView];
  [v17 convertRect:v18 fromView:v9];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)performAdditionSetup
{
  v27.receiver = self;
  v27.super_class = (Class)BKBookBloomOpenAnimator;
  [(BKBookOpenAnimator *)&v27 performAdditionSetup];
  BOOL useShadowEffects = self->_useShadowEffects;
  uint64_t v4 = [BKCustomAnimationPropertiesView alloc];
  double v5 = [(BKBookOpenAnimator *)self containerView];
  [v5 bounds];
  BOOL v6 = -[BKCustomAnimationPropertiesView initWithFrame:](v4, "initWithFrame:");
  [(BKBookBloomOpenAnimator *)self setBlurredCoverContainer:v6];

  double v7 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  [v7 addAnimatablePropertyWithKey:@"filters.gaussianBlur.inputRadius"];

  double v8 = [BKCustomAnimationPropertiesView alloc];
  double v9 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  [v9 bounds];
  double v10 = -[BKCustomAnimationPropertiesView initWithFrame:](v8, "initWithFrame:");
  [(BKBookBloomOpenAnimator *)self setBlurredShadowContainer:v10];

  double v11 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
  [v11 addAnimatablePropertyWithKey:@"filters.gaussianBlur.inputRadius"];

  double v12 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
  [v12 addAnimatablePropertyWithKey:@"filters.colorBrightness.inputAmount"];

  double v13 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  double v14 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
  [v13 addSubview:v14];

  unsigned int v15 = [(BKBookOpenAnimator *)self skipZoomPhase];
  if (useShadowEffects && v15)
  {
    double v16 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    +[BKBookBloomOpenAnimator setBlurRadius:v16 forView:60.0];

    double v17 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    +[BKBookBloomOpenAnimator setBrightnessFilter:v17 forView:-0.6];

    [(BKBookBloomOpenAnimator *)self _adjustShadowForCurrentCoverBounds];
  }
  double v18 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  double v19 = [(BKBookOpenAnimator *)self coverContainerView];
  [v18 addSubview:v19];

  double v20 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
  double v21 = [(BKBookOpenAnimator *)self coverShadowView];
  [v20 addSubview:v21];

  [(BKBookBloomOpenAnimator *)self _adjustShadowForCurrentCoverBounds];
  if (![(BKBookOpenAnimator *)self opening])
  {
    double v22 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
    [v22 setHidden:1];
  }
  unsigned int v23 = [(BKBookOpenAnimator *)self skipZoomPhase];
  if (!useShadowEffects && v23)
  {
    double v24 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    [v24 setHidden:1];
  }
  double v25 = [(BKBookOpenAnimator *)self containerView];
  double v26 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  [v25 addSubview:v26];
}

- (void)_teardownContentViews
{
  double v3 = [(BKBookBloomOpenAnimator *)self fullBookSnapshot];
  [v3 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setFullBookSnapshot:0];
  uint64_t v4 = [(BKBookBloomOpenAnimator *)self contentSnapshot];
  [v4 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setContentSnapshot:0];
  double v5 = [(BKBookBloomOpenAnimator *)self contentBackgroundView];
  [v5 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setContentBackgroundView:0];
  BOOL v6 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v6 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setContentContainerView:0];
}

- (void)teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKBookBloomOpenAnimator *)self _teardownContentViews];
  double v5 = [(BKBookBloomOpenAnimator *)self blurredShadowSnapshot];
  [v5 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setBlurredShadowSnapshot:0];
  BOOL v6 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
  [v6 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setBlurredShadowContainer:0];
  double v7 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  [v7 removeFromSuperview];

  [(BKBookBloomOpenAnimator *)self setBlurredCoverContainer:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = [(BKBookBloomOpenAnimator *)self viewsToBeCleanedUp];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) removeFromSuperview];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  double v13 = [(BKBookBloomOpenAnimator *)self viewsToBeCleanedUp];
  [v13 removeAllObjects];

  v14.receiver = self;
  v14.super_class = (Class)BKBookBloomOpenAnimator;
  [(BKBookZoomRevealOpenAnimator *)&v14 teardownViews:v3];
}

- (void)setupViewsForZoom
{
  if ([(BKBookOpenAnimator *)self opening])
  {
    [(BKBookBloomOpenAnimator *)self _teardownContentViews];
    BOOL v3 = [(BKBookOpenAnimator *)self bookContainerView];
    [v3 setAlpha:0.0];

    id v5 = [(BKBookOpenAnimator *)self containerView];
    uint64_t v4 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
    [v5 addSubview:v4];
  }
}

- (void)_setTargetFrame:(CGRect)a3 forView:(id)a4 baseFrame:(CGRect)a5 extraTransform:(CGAffineTransform *)a6
{
  memset(&v15, 0, sizeof(v15));
  CGFloat v7 = a3.size.width / a5.size.width;
  CGFloat v8 = a3.size.height / a5.size.height;
  id v9 = a4;
  CGAffineTransformMakeScale(&v15, v7, v8);
  CGAffineTransform t1 = v15;
  long long v10 = *(_OWORD *)&a6->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a6->tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform v15 = v14;
  CGRectGetCenterNoRounding();
  [v9 setCenter:];
  CGAffineTransform v11 = v15;
  [v9 setTransform:&v11];
}

- (void)_moveCoverToFrame:(CGRect)a3 extraTransform:(CGAffineTransform *)a4
{
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v6 = [(BKBookOpenAnimator *)self coverContainerView];
  CGFloat v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v8 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v13, &t1, &t2);
  id v9 = [(BKBookOpenAnimator *)self coverContainerView];
  CGAffineTransform v10 = v13;
  [v9 setTransform:&v10];
}

- (void)_moveContentContainerToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v8 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [(BKBookBloomOpenAnimator *)self revealSmallContentContainerFrame];
  double v10 = v9;
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15[1] = v11;
  v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _setTargetFrame:forView:baseFrame:extraTransform:](self, "_setTargetFrame:forView:baseFrame:extraTransform:", v8, v15, x, y, width, height, v12, v10, v13, v14);
}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(BKBookOpenAnimator *)self opening])
  {
    BOOL useShadowEffects = self->_useShadowEffects;
    [(BKBookOpenAnimator *)self closedCoverFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(BKBookBloomOpenAnimator *)self zoomedCoverFrame];
    uint64_t v46 = v15;
    uint64_t v47 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    [(BKBookBloomOpenAnimator *)self zoomDuration];
    double v21 = v20;
    double v22 = 0.0;
    [(BKBookOpenAnimator *)self animateNavigationBarWithDuration:v20 * 0.5 delay:0.0];
    if (![(BKBookOpenAnimator *)self fadeInCover]) {
      double v22 = 1.0;
    }
    long long v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v55[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v55[1] = v23;
    v55[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v55, v7, v9, v11, v13);
    double v24 = [(BKBookOpenAnimator *)self coverContainerView];
    [v24 setAlpha:v22];

    double v25 = [(BKBookOpenAnimator *)self bookshelfTintView];
    [v25 setAlpha:0.0];

    double v26 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    [v26 setAlpha:1.0];

    if (useShadowEffects)
    {
      objc_super v27 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      +[BKBookBloomOpenAnimator setBlurRadius:v27 forView:0.0];

      double v28 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      +[BKBookBloomOpenAnimator setBrightnessFilter:v28 forView:0.0];
    }
    [(BKBookOpenAnimator *)self adjustDuration:0.2];
    [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:0 hide:v21 show:v29 completion:-1.0];
    double v30 = [(BKBookBloomOpenAnimator *)self _zoomSpring];
    [v30 mass];
    double v32 = v31;
    [v30 stiffness];
    double v34 = v33;
    [v30 damping];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000C5A30;
    v52[3] = &unk_100A456F0;
    v52[4] = self;
    v52[5] = v47;
    v52[6] = v46;
    v52[7] = v17;
    v52[8] = v19;
    BOOL v54 = useShadowEffects;
    long long v53 = xmmword_10085C8A0;
    +[UIView _animateUsingSpringWithDuration:0 delay:v52 options:v4 mass:v21 stiffness:0.0 damping:v32 initialVelocity:v34 animations:v35 completion:0.0];
    [(BKBookOpenAnimator *)self adjustDuration:0.3];
    double v37 = v36;
    CGFloat v38 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000C5AF8;
    v49[3] = &unk_100A45718;
    v49[4] = self;
    __asm { FMOV            V0.2D, #1.0 }
    long long v50 = _Q0;
    BOOL v51 = useShadowEffects;
    +[UIView animateWithDuration:v38 delay:0 timingFunction:v49 options:0 animations:v37 completion:0.0];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000C5BB0;
    v48[3] = &unk_100A43D60;
    v48[4] = self;
    +[UIView animateWithDuration:v48 animations:v21];
  }
  else
  {
    id v44 = objc_retainBlock(v4);
    v45 = v44;
    if (v44) {
      (*((void (**)(id, uint64_t))v44 + 2))(v44, 1);
    }
  }
}

- (void)_adjustShadowForCurrentCoverBounds
{
  BOOL v3 = [(BKBookOpenAnimator *)self coverShadowView];

  if (v3)
  {
    id v4 = [(BKBookOpenAnimator *)self coverShadowImage];

    if (v4)
    {
      id v5 = [(BKBookOpenAnimator *)self coverContainerView];
      [v5 frame];
      CGRectGetCenterNoRounding();
      double v7 = v6;
      double v9 = v8;

      double v10 = [(BKBookOpenAnimator *)self coverShadowView];
      [v10 setCenter:v7, v9];

      double v11 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v11 alignmentRectInsets];

      double v12 = [(BKBookOpenAnimator *)self coverShadowImage];
      [v12 size];
      CGRectMakeWithSize();

      double v13 = [(BKBookOpenAnimator *)self coverContainerView];
      [v13 frame];
      CGSizeScaleThatFillsInCGSize();
      CGFloat v15 = v14;

      CGAffineTransformMakeScale(&v18, v15, v15);
      uint64_t v16 = [(BKBookOpenAnimator *)self coverShadowView];
      CGAffineTransform v17 = v18;
      [v16 setTransform:&v17];
    }
  }
}

- (void)setupSpinner
{
  BOOL v3 = [(BKBookOpenAnimator *)self containerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(BKBookOpenAnimator *)self containerView];
  [(BKBookBloomOpenAnimator *)self zoomedCoverFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [(BKBookOpenAnimator *)self coverContainerView];
  double v22 = [v21 superview];
  [v12 convertRect:v22 fromView:v14];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v34.origin.double x = v24;
  v34.origin.double y = v26;
  v34.size.double width = v28;
  v34.size.double height = v30;
  CGRectGetMaxY(v34);
  v35.origin.double x = v5;
  v35.origin.double y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  CGRectGetMaxY(v35);
  v36.origin.double x = v5;
  v36.origin.double y = v7;
  v36.size.double width = v9;
  v36.size.double height = v11;
  CGRectGetMidX(v36);
  id v32 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v32 bounds];
  CGRectMakeWithCenterAndSize();
  CGRect v38 = CGRectIntegral(v37);
  [v32 setFrame:v38.origin.x, v38.origin.y, v38.size.width, v38.size.height];
  [v32 setAlpha:0.0];
  [v32 startAnimating];
  double v31 = [(BKBookOpenAnimator *)self containerView];
  [v31 addSubview:v32];

  [(BKBookZoomRevealOpenAnimator *)self setSpinnerView:v32];
}

- (void)setupViewsForReveal
{
  unsigned int v4 = [(BKBookOpenAnimator *)self opening];
  unsigned __int8 v5 = [(BKBookZoomRevealOpenAnimator *)self contentLoaded];
  if (v4)
  {
    if ((v5 & 1) == 0) {
      BCReportAssertionFailureWithMessage();
    }
    if (![(BKBookZoomRevealOpenAnimator *)self contentLoaded])
    {
      double v6 = _AEBookOpenLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Revealing content before book is loaded!", buf, 2u);
      }
    }
    CGFloat v7 = [(BKBookOpenAnimator *)self bookshelfTintView];
    [v7 setAlpha:1.0];

    double v8 = [(BKBookOpenAnimator *)self bookContainerView];
    [v8 setAlpha:0.0];

    CGFloat v9 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
    [v9 setHidden:0];

    double v10 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    CGFloat v11 = [v10 snapshotViewAfterScreenUpdates:0];

    if (v11)
    {
      double v12 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      double v13 = [v12 superview];
      [v13 addSubview:v11];

      double v14 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      [v14 center];
      [v11 setCenter:];

      double v15 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      double v16 = [v15 superview];
      double v17 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      [v16 insertSubview:v11 belowSubview:v17];

      double v18 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
      [v18 setAlpha:0.0];

      [(BKBookBloomOpenAnimator *)self setBlurredShadowSnapshot:v11];
    }
  }
  else
  {
    double v19 = [(BKBookOpenAnimator *)self bookshelfTintView];
    [v19 setAlpha:1.0];

    double v20 = [(BKBookOpenAnimator *)self bookContainerView];
    [v20 setAlpha:0.0];

    CGFloat v11 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
    [v11 setHidden:0];
  }

  double v21 = [(BKBookOpenAnimator *)self containerView];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v205.origin.CGFloat x = v23;
  v205.origin.CGFloat y = v25;
  v205.size.CGFloat width = v27;
  v205.size.CGFloat height = v29;
  if (CGRectIsEmpty(v205)) {
    BCReportAssertionFailureWithMessage();
  }
  id v30 = [objc_alloc((Class)UIView) initWithFrame:v23, v25, v27, v29];
  [(BKBookBloomOpenAnimator *)self setContentContainerView:v30];

  double v31 = [(BKBookOpenAnimator *)self containerView];
  id v32 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v31 addSubview:v32];

  double v33 = [(BKBookOpenAnimator *)self bookViewController];
  id v34 = objc_alloc((Class)UIView);
  CGRect v35 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v35 bounds];
  id v36 = [v34 initWithFrame:];
  [(BKBookBloomOpenAnimator *)self setContentBackgroundView:v36];

  CGRect v37 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  CGRect v38 = [(BKBookBloomOpenAnimator *)self contentBackgroundView];
  [v37 addSubview:v38];

  if (objc_opt_respondsToSelector()) {
    [v33 transitionContentBackgroundColor];
  }
  else {
  v39 = +[UIColor whiteColor];
  }
  CGRect v40 = [(BKBookBloomOpenAnimator *)self contentBackgroundView];
  [v40 setBackgroundColor:v39];

  CGRect v41 = [v33 transitionContentView];
  double v201 = v25;
  double v202 = v23;
  double v199 = v29;
  double v200 = v27;
  if (v41)
  {
    CGRect v42 = [(BKBookBloomOpenAnimator *)self contentContainerView];
    [v41 frame];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    BOOL v51 = [v41 superview];
    [v42 convertRect:v51 fromView:v44];
    CGFloat x = v52;
    CGFloat y = v54;
    CGFloat width = v56;
    CGFloat height = v58;
  }
  else
  {
    v60 = _AEBookOpenLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v204 = v61;
      id v62 = v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "-[%@ transitionContentView] should not return nil", buf, 0xCu);
    }
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  v63 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v63 bounds];
  v212.origin.CGFloat x = x;
  v212.origin.CGFloat y = y;
  v212.size.CGFloat width = width;
  v212.size.CGFloat height = height;
  CGRect v207 = CGRectIntersection(v206, v212);
  double v64 = v207.origin.x;
  double v65 = v207.origin.y;
  double v66 = v207.size.width;
  double v67 = v207.size.height;

  v208.origin.CGFloat x = v64;
  v208.origin.CGFloat y = v65;
  v208.size.CGFloat width = v66;
  v208.size.CGFloat height = v67;
  if (CGRectIsNull(v208))
  {
    v211.origin.CGFloat x = x;
    v211.origin.CGFloat y = y;
    v211.size.CGFloat width = width;
    v211.size.CGFloat height = height;
    v196 = NSStringFromCGRect(v211);
    BCReportAssertionFailureWithMessage();
  }
  [(BKBookOpenAnimator *)self _sanitizedFrameWithFullsizeFrame:@"bigContentVisibleRect", v64, v65, v66, v67, v196 name];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = [(BKBookOpenAnimator *)self coverImage];
  [v76 size];
  double v78 = v77;
  double v80 = v79;
  v81 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v81 bounds];
  double v83 = v82;
  double v85 = v84;
  v86 = [(BKBookOpenAnimator *)self toViewController];
  unsigned __int8 v87 = [v86 im_isCompactWidth];
  if (v87)
  {
    uint64_t v88 = 1;
  }
  else
  {
    double v2 = [(BKBookOpenAnimator *)self toViewController];
    uint64_t v88 = [v2 im_isCompactHeight];
  }
  -[BKBookBloomOpenAnimator _insetsFromContentSize:toCoverSize:containerSize:isCompact:](self, "_insetsFromContentSize:toCoverSize:containerSize:isCompact:", v88, v73, v75, v78, v80, v83, v85);
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  double v96 = v95;
  if ((v87 & 1) == 0) {

  }
  double v197 = v92;
  double v198 = v90;
  -[BKBookBloomOpenAnimator _frameOfCoverThatFitsContentWithFrame:insetsContentToCover:](self, "_frameOfCoverThatFitsContentWithFrame:insetsContentToCover:", v69, v71, v73, v75, v90, v92, v94, v96);
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  v105 = [(BKBookOpenAnimator *)self coverContainerView];
  v106 = [v105 superview];
  v107 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v106 convertRect:v107 fromView:v98];
  -[BKBookBloomOpenAnimator setRevealBigCoverFrame:](self, "setRevealBigCoverFrame:");

  v108 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  if (v4) {
    [(BKBookBloomOpenAnimator *)self zoomedCoverFrame];
  }
  else {
    [(BKBookOpenAnimator *)self closedCoverFrame];
  }
  double v113 = v109;
  double v114 = v110;
  double v115 = v111;
  double v116 = v112;
  v117 = [(BKBookOpenAnimator *)self coverContainerView];
  v118 = [v117 superview];
  [v108 convertRect:v118 fromView:v113, v114, v115, v116];
  double v120 = v119;
  double v122 = v121;
  double v124 = v123;
  double v126 = v125;

  v127 = [(BKBookOpenAnimator *)self coverImage];
  [v127 size];
  -[BKBookBloomOpenAnimator _frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:](self, "_frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:", v73, v75, v128, v129, v120, v122, v124, v126, *(void *)&v198, *(void *)&v197, *(void *)&v94, *(void *)&v96);

  BCNormalizedInsetsForRects();
  BCRectByApplyingNormalizedInsets();
  double v131 = v130;
  double v133 = v132;
  double v135 = v134;
  double v137 = v136;
  if (objc_opt_respondsToSelector())
  {
    v138 = [v33 transitionContentViewImage];
    if (v138)
    {
      id v139 = [objc_alloc((Class)UIImageView) initWithImage:v138];
      [(BKBookBloomOpenAnimator *)self setContentSnapshot:v139];
    }
  }
  v140 = [(BKBookBloomOpenAnimator *)self contentSnapshot];

  if (!v140)
  {
    v141 = [v41 snapshotViewAfterScreenUpdates:0];
    [(BKBookBloomOpenAnimator *)self setContentSnapshot:v141];
  }
  [(BKBookOpenAnimator *)self _sanitizedFrameWithCenteredFrame:@"smallContentFrame", v131, v133, v135, v137, 1.0, 1.0 ofSize name];
  double v143 = v142;
  double v145 = v144;
  double v147 = v146;
  double v149 = v148;
  v150 = [(BKBookBloomOpenAnimator *)self contentSnapshot];
  [v150 setFrame:v143, v145, v147, v149];

  v151 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  v152 = [(BKBookBloomOpenAnimator *)self contentSnapshot];
  [v151 addSubview:v152];

  v153 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v153 bounds];
  BCNormalizedInsetsForRects();

  BCRectByApplyingNormalizedInsets();
  double v155 = v154;
  double v157 = v156;
  double v159 = v158;
  double v161 = v160;
  v162 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  v163 = [v162 superview];
  v164 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v163 convertRect:v164 fromView:v155 toView:v157];
  -[BKBookBloomOpenAnimator setRevealBigContentContainerFrame:](self, "setRevealBigContentContainerFrame:");

  -[BKBookBloomOpenAnimator setRevealSmallContentContainerFrame:](self, "setRevealSmallContentContainerFrame:", v202, v201, v200, v199);
  [(BKBookBloomOpenAnimator *)self revealBigContentContainerFrame];
  BCNormalizedInsetsForRects();
  BCRectByApplyingNormalizedInsets();
  double v166 = v165;
  double v168 = v167;
  double v170 = v169;
  double v172 = v171;
  v173 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  v174 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  v175 = [v174 superview];
  [v173 convertRect:v175 fromView:v166 toView:v168];
  CGFloat v177 = v176;
  CGFloat v179 = v178;
  CGFloat v181 = v180;
  CGFloat v183 = v182;

  v184 = [(BKBookBloomOpenAnimator *)self contentBackgroundView];
  [v184 frame];
  v213.origin.CGFloat x = v185;
  v213.origin.CGFloat y = v186;
  v213.size.CGFloat width = v187;
  v213.size.CGFloat height = v188;
  v209.origin.CGFloat x = v177;
  v209.origin.CGFloat y = v179;
  v209.size.CGFloat width = v181;
  v209.size.CGFloat height = v183;
  CGRect v210 = CGRectUnion(v209, v213);
  double v189 = v210.origin.x;
  double v190 = v210.origin.y;
  double v191 = v210.size.width;
  double v192 = v210.size.height;
  v193 = [(BKBookBloomOpenAnimator *)self contentBackgroundView];
  [v193 setFrame:v189, v190, v191, v192];

  v194 = [(BKBookOpenAnimator *)self containerView];
  v195 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  [v194 addSubview:v195];
}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(BKBookOpenAnimator *)self opening]) {
    [(BKBookBloomOpenAnimator *)self _animateRevealForOpeningWithCompletion:v4];
  }
  else {
    [(BKBookBloomOpenAnimator *)self _animateRevealForClosingWithCompletion:v4];
  }
}

- (BOOL)_contentViewIsShowingCover
{
  double v2 = [(BKBookOpenAnimator *)self bookViewController];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 transitionContentViewIsShowingCover];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)_animateRevealForOpeningWithCompletion:(id)a3
{
  id v4 = a3;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v93[3] = 0;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000C7550;
  v92[3] = &unk_100A44688;
  v92[4] = v93;
  unsigned __int8 v5 = objc_retainBlock(v92);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1000C7568;
  v89[3] = &unk_100A45740;
  double v91 = v93;
  id v67 = v4;
  id v90 = v67;
  double v6 = objc_retainBlock(v89);
  unsigned int v7 = [(BKBookBloomOpenAnimator *)self _contentViewIsShowingCover];
  BOOL useShadowEffects = self->_useShadowEffects;
  [(BKBookBloomOpenAnimator *)self revealDuration];
  double v77 = v9;
  [(BKBookBloomOpenAnimator *)self zoomedCoverFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(BKBookBloomOpenAnimator *)self revealBigCoverFrame];
  uint64_t v75 = v19;
  uint64_t v76 = v18;
  uint64_t v73 = v21;
  uint64_t v74 = v20;
  [(BKBookBloomOpenAnimator *)self revealSmallContentContainerFrame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(BKBookBloomOpenAnimator *)self revealBigContentContainerFrame];
  uint64_t v71 = v31;
  uint64_t v72 = v30;
  uint64_t v69 = v33;
  uint64_t v70 = v32;
  long long v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v88[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v88[1] = v34;
  v88[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v88, v11, v13, v15, v17);
  -[BKBookBloomOpenAnimator _moveContentContainerToFrame:](self, "_moveContentContainerToFrame:", v23, v25, v27, v29);
  if (useShadowEffects)
  {
    CGRect v35 = [(BKBookBloomOpenAnimator *)self blurredShadowSnapshot];

    if (v35) {
      [(BKBookBloomOpenAnimator *)self blurredShadowSnapshot];
    }
    else {
    id v36 = [(BKBookBloomOpenAnimator *)self blurredShadowContainer];
    }
    [v36 setAlpha:1.0];
  }
  ((void (*)(void *))v5[2])(v5);
  CGRect v37 = [(BKBookBloomOpenAnimator *)self _revealSpring];
  [v37 mass];
  double v39 = v38;
  [v37 stiffness];
  double v41 = v40;
  [v37 damping];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1000C75FC;
  v87[3] = &unk_100A44EF0;
  v87[4] = self;
  v87[5] = v76;
  v87[6] = v75;
  v87[7] = v74;
  v87[8] = v73;
  v87[9] = v72;
  v87[10] = v71;
  v87[11] = v70;
  v87[12] = v69;
  +[UIView _animateUsingSpringWithDuration:0 delay:v87 options:v6 mass:v77 stiffness:0.0 damping:v39 initialVelocity:v41 animations:v42 completion:0.0];
  if (useShadowEffects)
  {
    [(BKBookOpenAnimator *)self adjustDuration:0.2];
    double v44 = v43;
    double v45 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1000C7660;
    v86[3] = &unk_100A43D60;
    v86[4] = self;
    +[UIView animateWithDuration:v45 delay:0 timingFunction:v86 options:v6 animations:v44 completion:0.0];
  }
  double v46 = [(BKBookOpenAnimator *)self bookViewController];
  if (objc_opt_respondsToSelector())
  {
    double v47 = [v46 transitionContentBackgroundColor];
  }
  else
  {
    double v47 = 0;
  }
  double v48 = [(BKBookBloomOpenAnimator *)self bookshelfTintColor];
  id v49 = v47;
  if (v7)
  {
    double v50 = [(BKBookOpenAnimator *)self coverContainerView];
    [v50 setAlpha:1.0];

    BOOL v51 = [(BKBookBloomOpenAnimator *)self contentContainerView];
    [v51 setAlpha:0.0];

    if (v49)
    {
      double v52 = [(BKBookOpenAnimator *)self bookshelfTintView];
      [v52 setBackgroundColor:v48];

      ((void (*)(void *))v5[2])(v5);
      [(BKBookOpenAnimator *)self adjustDuration:0.2];
      double v54 = v53;
      v55 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_1000C76D8;
      v84[3] = &unk_100A43DD8;
      v84[4] = self;
      id v85 = v49;
      +[UIView animateWithDuration:v55 delay:0 timingFunction:v84 options:v6 animations:v54 completion:0.0];
    }
  }
  else
  {
    double v56 = [(BKBookOpenAnimator *)self coverContainerView];
    [v56 setAlpha:1.0];

    v57 = [(BKBookBloomOpenAnimator *)self contentContainerView];
    [v57 setAlpha:0.0];

    double v58 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
    +[BKBookBloomOpenAnimator setBlurRadius:v58 forView:0.0];

    ((void (*)(void *))v5[2])(v5);
    [(BKBookOpenAnimator *)self adjustDuration:0.4];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000C7728;
    v83[3] = &unk_100A45768;
    v83[4] = self;
    v83[5] = 0x405E000000000000;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v83, v6);
    if (v49)
    {
      v59 = [(BKBookOpenAnimator *)self bookshelfTintView];
      [v59 setBackgroundColor:v48];

      ((void (*)(void *))v5[2])(v5);
      [(BKBookOpenAnimator *)self adjustDuration:0.2];
      double v61 = v60;
      id v62 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000C7794;
      v81[3] = &unk_100A43DD8;
      v81[4] = self;
      id v82 = v49;
      +[UIView animateWithDuration:v62 delay:0 timingFunction:v81 options:v6 animations:v61 completion:0.0];
    }
    ((void (*)(void *))v5[2])(v5);
    [(BKBookOpenAnimator *)self adjustDuration:0.2];
    double v64 = v63;
    double v65 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000C77E4;
    v80[3] = &unk_100A45768;
    v80[4] = self;
    v80[5] = 0;
    +[UIView animateWithDuration:v65 delay:0 timingFunction:v80 options:v6 animations:v64 completion:0.0];

    ((void (*)(void *))v5[2])(v5);
    [(BKBookOpenAnimator *)self adjustDuration:0.17];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000C7838;
    v79[3] = &unk_100A45768;
    v79[4] = self;
    v79[5] = 0x3FF0000000000000;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v79, v6);
  }
  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.2];
  [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:v6 hide:v77 show:-1.0 completion:v66];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000C788C;
  v78[3] = &unk_100A43D60;
  v78[4] = self;
  +[UIView animateWithDuration:v78 animations:v77];

  _Block_object_dispose(v93, 8);
}

- (void)_animateRevealForClosingWithCompletion:(id)a3
{
  id v4 = a3;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000C7FB0;
  v78[3] = &unk_100A44688;
  v78[4] = v79;
  unsigned __int8 v5 = objc_retainBlock(v78);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000C7FC8;
  v75[3] = &unk_100A45740;
  double v77 = v79;
  id v6 = v4;
  id v76 = v6;
  unsigned int v7 = objc_retainBlock(v75);
  [(BKBookBloomOpenAnimator *)self closeDuration];
  double v67 = v8;
  unsigned __int8 v9 = [(BKBookOpenAnimator *)self fadeInCover];
  [(BKBookBloomOpenAnimator *)self revealBigCoverFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(BKBookOpenAnimator *)self closedCoverFrame];
  uint64_t v65 = v19;
  uint64_t v66 = v18;
  uint64_t v63 = v21;
  uint64_t v64 = v20;
  [(BKBookBloomOpenAnimator *)self revealBigContentContainerFrame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(BKBookBloomOpenAnimator *)self revealSmallContentContainerFrame];
  uint64_t v61 = v31;
  uint64_t v62 = v30;
  uint64_t v59 = v33;
  uint64_t v60 = v32;
  long long v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v74[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v74[1] = v34;
  v74[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v74, v11, v13, v15, v17);
  -[BKBookBloomOpenAnimator _moveContentContainerToFrame:](self, "_moveContentContainerToFrame:", v23, v25, v27, v29);
  CGRect v35 = [(BKBookOpenAnimator *)self coverContainerView];
  [v35 setAlpha:0.0];

  id v36 = [(BKBookBloomOpenAnimator *)self blurredCoverContainer];
  +[BKBookBloomOpenAnimator setBlurRadius:v36 forView:120.0];

  CGRect v37 = [(BKBookOpenAnimator *)self bookshelfTintView];
  [v37 setAlpha:1.0];

  double v38 = [(BKBookBloomOpenAnimator *)self contentContainerView];
  [v38 setAlpha:1.0];

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000C805C;
  v73[3] = &unk_100A44EF0;
  v73[4] = self;
  v73[5] = v66;
  v73[6] = v65;
  v73[7] = v64;
  v73[8] = v63;
  v73[9] = v62;
  v73[10] = v61;
  v73[11] = v60;
  v73[12] = v59;
  double v39 = objc_retainBlock(v73);
  ((void (*)(void *))v5[2])(v5);
  if (v9)
  {
    double v40 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
    +[UIView animateWithDuration:v40 delay:0 timingFunction:v39 options:v7 animations:v67 completion:0.0];
  }
  else
  {
    double v40 = [(BKBookBloomOpenAnimator *)self _closeSpring];
    [v40 mass];
    double v42 = v41;
    [v40 stiffness];
    double v44 = v43;
    [v40 damping];
    +[UIView _animateUsingSpringWithDuration:0 delay:v39 options:v7 mass:v67 stiffness:0.0 damping:v42 initialVelocity:v44 animations:v45 completion:0.0];
  }

  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.32];
  double v47 = v46;
  double v48 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000C80C0;
  v72[3] = &unk_100A45768;
  v72[4] = self;
  v72[5] = 0x3FF0000000000000;
  +[UIView animateWithDuration:v48 delay:0 timingFunction:v72 options:v7 animations:v47 completion:0.0];

  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.15];
  double v50 = v49;
  BOOL v51 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1000C8114;
  v71[3] = &unk_100A45768;
  v71[4] = self;
  v71[5] = 0;
  +[UIView animateWithDuration:v51 delay:0 timingFunction:v71 options:v7 animations:v50 completion:0.0];

  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.2];
  double v53 = v52;
  double v54 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000C8180;
  v70[3] = &unk_100A45768;
  v70[4] = self;
  v70[5] = 0;
  +[UIView animateWithDuration:v54 delay:0 timingFunction:v70 options:v7 animations:v53 completion:0.0];

  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.32];
  double v56 = v55;
  v57 = [(BKBookBloomOpenAnimator *)self _customTimingFunction];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000C81D4;
  v69[3] = &unk_100A45768;
  v69[4] = self;
  v69[5] = 0;
  +[UIView animateWithDuration:v57 delay:0 timingFunction:v69 options:v7 animations:v56 completion:0.0];

  ((void (*)(void *))v5[2])(v5);
  [(BKBookOpenAnimator *)self adjustDuration:0.2];
  [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:v7 hide:v67 show:-1.0 completion:v58];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000C8228;
  v68[3] = &unk_100A43D60;
  v68[4] = self;
  +[UIView animateWithDuration:v68 animations:v67];

  _Block_object_dispose(v79, 8);
}

+ (double)maxCoverScale:(BOOL)a3
{
  [a1 marginPercentage:a3];
  return v3 * -2.0 + 1.0;
}

+ (double)marginPercentage:(BOOL)a3
{
  double result = 0.13;
  if (a3) {
    return 0.1;
  }
  return result;
}

+ (CGRect)_availableRectForFittingZoomedCoverInContainerViewBounds:(CGRect)a3 isCompact:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(id)objc_opt_class() marginPercentage:a4];
  double v9 = width * v8;
  double v10 = height * v8;
  CGFloat v11 = x;
  CGFloat v12 = y;
  double v13 = width;
  double v14 = height;

  return CGRectInset(*(CGRect *)&v11, v9, v10);
}

+ (CGRect)zoomedFrameForCoverWithSize:(CGSize)a3 isCompact:(BOOL)a4 containerViewBounds:(CGRect)a5
{
  [a1 _availableRectForFittingZoomedCoverInContainerViewBounds:a4 isCompact:a5.origin.x, a5.origin.y, a5.size.width, a5.size.height];

  sub_1000C4BEC();
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

+ (id)backgroundColorForZoomedBookCover
{
  return +[UIColor systemBackgroundColor];
}

+ (void)setBlurRadius:(double)a3 forView:(id)a4
{
  double v5 = [a4 layer];
  double v6 = [v5 valueForKeyPath:@"filters.gaussianBlur"];

  if (v6)
  {
    id v7 = +[NSNumber numberWithDouble:a3];
    [v5 setValue:v7 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
  else
  {
    id v8 = objc_alloc((Class)CAFilter);
    id v7 = [v8 initWithType:kCAFilterGaussianBlur];
    [v7 setName:@"gaussianBlur"];
    double v9 = +[NSNumber numberWithDouble:a3];
    [v7 setValue:v9 forKey:kCIInputRadiusKey];

    [v7 setValue:@"low" forKey:@"inputQuality"];
    [v7 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
    double v10 = [v5 filters];
    if (v10)
    {
      CGFloat v11 = [v5 filters];
      CGFloat v12 = [v11 arrayByAddingObject:v7];
      [v5 setFilters:v12];
    }
    else
    {
      id v13 = v7;
      CGFloat v11 = +[NSArray arrayWithObjects:&v13 count:1];
      [v5 setFilters:v11];
    }
  }
}

+ (void)setBrightnessFilter:(double)a3 forView:(id)a4
{
  double v5 = [a4 layer];
  double v6 = [v5 valueForKeyPath:@"filters.colorBrightness.inputAmount"];

  if (v6)
  {
    id v7 = +[NSNumber numberWithDouble:a3];
    [v5 setValue:v7 forKeyPath:@"filters.colorBrightness.inputAmount"];
  }
  else
  {
    id v7 = +[CAFilter filterWithType:kCAFilterColorBrightness];
    [v7 setName:@"colorBrightness"];
    id v8 = +[NSNumber numberWithDouble:a3];
    [v7 setValue:v8 forKey:@"inputAmount"];

    double v9 = [v5 filters];
    if (v9)
    {
      double v10 = [v5 filters];
      CGFloat v11 = [v10 arrayByAddingObject:v7];
      [v5 setFilters:v11];
    }
    else
    {
      CGFloat v12 = v7;
      double v10 = +[NSArray arrayWithObjects:&v12 count:1];
      [v5 setFilters:v10];
    }
  }
}

- (BOOL)useShadowEffects
{
  return self->_useShadowEffects;
}

- (void)setUseShadowEffects:(BOOL)a3
{
  self->_BOOL useShadowEffects = a3;
}

- (UIView)blurredCoverContainer
{
  return self->_blurredCoverContainer;
}

- (void)setBlurredCoverContainer:(id)a3
{
}

- (UIView)blurredShadowContainer
{
  return self->_blurredShadowContainer;
}

- (void)setBlurredShadowContainer:(id)a3
{
}

- (UIView)blurredShadowSnapshot
{
  return self->_blurredShadowSnapshot;
}

- (void)setBlurredShadowSnapshot:(id)a3
{
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
}

- (UIView)fullBookSnapshot
{
  return self->_fullBookSnapshot;
}

- (void)setFullBookSnapshot:(id)a3
{
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
}

- (CGRect)revealSmallContentContainerFrame
{
  double x = self->_revealSmallContentContainerFrame.origin.x;
  double y = self->_revealSmallContentContainerFrame.origin.y;
  double width = self->_revealSmallContentContainerFrame.size.width;
  double height = self->_revealSmallContentContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRevealSmallContentContainerFrame:(CGRect)a3
{
  self->_revealSmallContentContainerFrame = a3;
}

- (CGRect)revealBigCoverFrame
{
  double x = self->_revealBigCoverFrame.origin.x;
  double y = self->_revealBigCoverFrame.origin.y;
  double width = self->_revealBigCoverFrame.size.width;
  double height = self->_revealBigCoverFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRevealBigCoverFrame:(CGRect)a3
{
  self->_revealBigCoverFrame = a3;
}

- (CGRect)revealBigContentContainerFrame
{
  double x = self->_revealBigContentContainerFrame.origin.x;
  double y = self->_revealBigContentContainerFrame.origin.y;
  double width = self->_revealBigContentContainerFrame.size.width;
  double height = self->_revealBigContentContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRevealBigContentContainerFrame:(CGRect)a3
{
  self->_revealBigContentContainerFrame = a3;
}

- (CGRect)closedContentContainerFrame
{
  double x = self->_closedContentContainerFrame.origin.x;
  double y = self->_closedContentContainerFrame.origin.y;
  double width = self->_closedContentContainerFrame.size.width;
  double height = self->_closedContentContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClosedContentContainerFrame:(CGRect)a3
{
  self->_closedContentContainerFrame = a3;
}

- (NSMutableArray)viewsToBeCleanedUp
{
  return self->_viewsToBeCleanedUp;
}

- (void)setViewsToBeCleanedUp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_fullBookSnapshot, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_storeStrong((id *)&self->_blurredShadowSnapshot, 0);
  objc_storeStrong((id *)&self->_blurredShadowContainer, 0);

  objc_storeStrong((id *)&self->_blurredCoverContainer, 0);
}

@end