@interface BKBookZoomRevealOpenAnimator
- (BOOL)contentLoaded;
- (BOOL)defersBookViewSetupForOpening;
- (BOOL)isContentRevealed;
- (BOOL)secondHalfStarted;
- (BOOL)skipReveal;
- (BOOL)waitingForContentLoaded;
- (BOOL)zoomRequiresContentLoaded;
- (CAMediaTimingFunction)revealTimingFunction;
- (CAMediaTimingFunction)zoomTimingFunction;
- (UIView)spinnerView;
- (double)_spinnerScale;
- (double)minSecondHalfDelayOnClose;
- (double)minSecondHalfDelayOnOpen;
- (double)revealDuration;
- (double)spinnerStartTime;
- (double)zoomDuration;
- (id)viewControllerForStatusBarStyle;
- (void)_animateFirstHalf;
- (void)_animateSecondHalf;
- (void)_revealWithCompletion:(id)a3;
- (void)_showSpinner:(BOOL)a3 delay:(double)a4 completion:(id)a5;
- (void)_zoomWithCompletion:(id)a3;
- (void)animateNonInteractive;
- (void)animateRevealWithCompletion:(id)a3;
- (void)animateZoomWithCompletion:(id)a3;
- (void)bookContentDidLoad;
- (void)setContentLoaded:(BOOL)a3;
- (void)setSecondHalfStarted:(BOOL)a3;
- (void)setSkipReveal:(BOOL)a3;
- (void)setSpinnerStartTime:(double)a3;
- (void)setSpinnerView:(id)a3;
- (void)setWaitingForContentLoaded:(BOOL)a3;
- (void)setupSpinner;
- (void)setupViewsForReveal;
- (void)setupViewsForZoom;
- (void)teardownViews:(BOOL)a3;
@end

@implementation BKBookZoomRevealOpenAnimator

- (double)zoomDuration
{
  v2 = NSStringFromSelector(a2);
  v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  return 0.0;
}

- (double)revealDuration
{
  v2 = NSStringFromSelector(a2);
  v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  return 0.0;
}

- (void)setupViewsForZoom
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  BCReportAssertionFailureWithMessage();
}

- (void)animateZoomWithCompletion:(id)a3
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();
}

- (void)setupViewsForReveal
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  BCReportAssertionFailureWithMessage();
}

- (void)animateRevealWithCompletion:(id)a3
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();
}

- (CAMediaTimingFunction)zoomTimingFunction
{
  LODWORD(v2) = 1051371084;
  LODWORD(v3) = 1045220557;
  LODWORD(v4) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
}

- (CAMediaTimingFunction)revealTimingFunction
{
  LODWORD(v2) = 1057674284;
  LODWORD(v3) = 1051928088;
  LODWORD(v4) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.0;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (BOOL)zoomRequiresContentLoaded
{
  return 0;
}

- (void)teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKBookZoomRevealOpenAnimator *)self spinnerView];
  [v5 removeFromSuperview];

  [(BKBookZoomRevealOpenAnimator *)self setSpinnerView:0];
  v6.receiver = self;
  v6.super_class = (Class)BKBookZoomRevealOpenAnimator;
  [(BKBookOpenAnimator *)&v6 teardownViews:v3];
}

- (void)bookContentDidLoad
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100124BEC;
  v3[3] = &unk_100A43D60;
  v3[4] = self;
  double v2 = objc_retainBlock(v3);
  ((void (*)(void))v2[2])();
}

- (double)_spinnerScale
{
  [(BKBookOpenAnimator *)self coverAspectRatio];
  double v4 = v3;
  id v5 = [(BKBookOpenAnimator *)self coverContainerView];
  [v5 bounds];
  if (v4 > 0.9) {
    double v10 = CGRectGetHeight(*(CGRect *)&v6) / 768.0;
  }
  else {
    double v10 = CGRectGetWidth(*(CGRect *)&v6) * 0.0009765625;
  }

  return v10;
}

- (void)setupSpinner
{
  [(BKBookZoomRevealOpenAnimator *)self _spinnerScale];
  double v4 = round(v3 * 112.0);
  id v10 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, v4, v4];
  id v5 = [(BKBookOpenAnimator *)self coverContainerView];
  [v5 bounds];
  CGRectGetCenterNoRounding();
  [v10 setCenter:];

  [v10 frame];
  CGRect v13 = CGRectIntegral(v12);
  [v10 setFrame:v13.origin.x, v13.origin.y, v13.size.width, v13.size.height];
  uint64_t v6 = [v10 layer];
  [v6 setCornerRadius:8.0];

  v7 = +[UIColor colorWithWhite:0.0 alpha:0.8];
  [v10 setBackgroundColor:v7];

  [(BKBookZoomRevealOpenAnimator *)self setSpinnerView:v10];
  id v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v10 bounds];
  CGRectGetCenterNoRounding();
  [v8 setCenter:];
  [v8 frame];
  CGRect v15 = CGRectIntegral(v14);
  [v8 setFrame:v15.origin.x, v15.origin.y, v15.size.width, v15.size.height];
  [v8 startAnimating];
  [v10 addSubview:v8];
  [v10 setAlpha:0.0];
  v9 = [(BKBookOpenAnimator *)self coverContainerView];
  [v9 addSubview:v10];
}

- (void)_showSpinner:(BOOL)a3 delay:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012523C;
  v5[3] = &unk_100A44E60;
  v5[4] = self;
  BOOL v6 = a3;
  +[UIView animateWithDuration:0 delay:v5 options:a5 animations:0.3 completion:a4];
}

- (void)_animateFirstHalf
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100125478;
  v13[3] = &unk_100A43D60;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100125700;
  v10[3] = &unk_100A44120;
  v11 = self;
  CGRect v12 = objc_retainBlock(v13);
  double v3 = v12;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001259A8;
  v8[3] = &unk_100A44AF8;
  v8[4] = v11;
  v9 = objc_retainBlock(v10);
  double v4 = v9;
  id v5 = objc_retainBlock(v8);
  [(BKBookZoomRevealOpenAnimator *)self setSecondHalfStarted:0];
  BOOL v6 = [(BKBookOpenAnimator *)self fromViewController];
  [v6 setNeedsStatusBarAppearanceUpdate];

  if ([(BKBookOpenAnimator *)self opening])
  {
    if ([(BKBookOpenAnimator *)self skipZoomPhase])
    {
      ((void (*)(void *, uint64_t))v5[2])(v5, 1);
    }
    else if ([(BKBookZoomRevealOpenAnimator *)self zoomRequiresContentLoaded] {
           && ![(BKBookZoomRevealOpenAnimator *)self contentLoaded])
    }
    {
      [(BKBookZoomRevealOpenAnimator *)self setWaitingForContentLoaded:1];
    }
    else
    {
      [(BKBookZoomRevealOpenAnimator *)self _zoomWithCompletion:v5];
    }
  }
  else
  {
    [(BKBookZoomRevealOpenAnimator *)self _revealWithCompletion:v5];
  }
  v7 = +[AETestDriver shared];
  [v7 postEvent:kBETestDriverOpenAnimationSetupEnd sender:self];
}

- (void)_animateSecondHalf
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100125E1C;
  v5[3] = &unk_100A44268;
  v5[4] = self;
  double v3 = objc_retainBlock(v5);
  [(BKBookZoomRevealOpenAnimator *)self setSecondHalfStarted:1];
  double v4 = [(BKBookOpenAnimator *)self toViewController];
  [v4 setNeedsStatusBarAppearanceUpdate];

  if ([(BKBookOpenAnimator *)self opening]) {
    [(BKBookZoomRevealOpenAnimator *)self _revealWithCompletion:v3];
  }
  else {
    [(BKBookZoomRevealOpenAnimator *)self _zoomWithCompletion:v3];
  }
}

- (void)_zoomWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKBookZoomRevealOpenAnimator *)self setupViewsForZoom];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100125FAC;
  id v10 = &unk_100A44AF8;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  [(BKBookZoomRevealOpenAnimator *)self animateZoomWithCompletion:&v7];
  kdebug_trace();
  BOOL v6 = +[AETestDriver shared];
  [v6 postEvent:kBETestDriverOpenAnimationZoomStart sender:self];
}

- (void)_revealWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKBookZoomRevealOpenAnimator *)self setupViewsForReveal];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100126144;
  id v10 = &unk_100A44AF8;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  [(BKBookZoomRevealOpenAnimator *)self animateRevealWithCompletion:&v7];
  kdebug_trace();
  BOOL v6 = +[AETestDriver shared];
  [v6 postEvent:kBETestDriverOpenAnimationRevealStart sender:self];
}

- (void)animateNonInteractive
{
  [(BKBookOpenAnimator *)self animateNavigationBarPrepare];

  [(BKBookZoomRevealOpenAnimator *)self _animateFirstHalf];
}

- (BOOL)isContentRevealed
{
  if ([(BKBookOpenAnimator *)self opening]
    && [(BKBookZoomRevealOpenAnimator *)self secondHalfStarted])
  {
    return 1;
  }
  if ([(BKBookOpenAnimator *)self opening]) {
    return 0;
  }
  return ![(BKBookZoomRevealOpenAnimator *)self secondHalfStarted];
}

- (BOOL)defersBookViewSetupForOpening
{
  return 1;
}

- (id)viewControllerForStatusBarStyle
{
  if ([(BKBookOpenAnimator *)self opening]
    && ![(BKBookZoomRevealOpenAnimator *)self secondHalfStarted])
  {
    double v3 = [(BKBookOpenAnimator *)self fromViewController];
  }
  else
  {
    double v3 = [(BKBookOpenAnimator *)self toViewController];
  }

  return v3;
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)secondHalfStarted
{
  return self->_secondHalfStarted;
}

- (void)setSecondHalfStarted:(BOOL)a3
{
  self->_secondHalfStarted = a3;
}

- (BOOL)skipReveal
{
  return self->_skipReveal;
}

- (void)setSkipReveal:(BOOL)a3
{
  self->_skipReveal = a3;
}

- (UIView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (double)spinnerStartTime
{
  return self->_spinnerStartTime;
}

- (void)setSpinnerStartTime:(double)a3
{
  self->_spinnerStartTime = a3;
}

- (void).cxx_destruct
{
}

@end