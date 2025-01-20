@interface BKAudiobookSlideOpenAnimator
- (BKAudiobookOpenTransitioning)audiobookViewController;
- (BOOL)animatesCoverBounds;
- (BOOL)landscape;
- (BOOL)wantsCoverShadow;
- (CGRect)contentFrame;
- (CGRect)zoomedCoverFrame;
- (UIView)contentClipView;
- (UIView)contentView;
- (UIView)currentCoverView;
- (double)coverFadeDuration;
- (double)revealDuration;
- (int64_t)coverContentMode;
- (void)animateRevealWithCompletion:(id)a3;
- (void)animateZoomWithCompletion:(id)a3;
- (void)animationsDidFinish;
- (void)setContentClipView:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentCoverView:(id)a3;
- (void)setupViewsForReveal;
- (void)setupViewsForZoom;
@end

@implementation BKAudiobookSlideOpenAnimator

- (double)coverFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.2;
}

- (BOOL)landscape
{
  v2 = [(BKBookOpenAnimator *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  return v4 > v6;
}

- (BOOL)animatesCoverBounds
{
  return 1;
}

- (BOOL)wantsCoverShadow
{
  return ![(BKBookOpenAnimator *)self skipZoomPhase];
}

- (BKAudiobookOpenTransitioning)audiobookViewController
{
  v2 = [(BKBookOpenAnimator *)self bookViewController];
  objc_opt_class();
  double v3 = BUClassAndProtocolCast();

  return (BKAudiobookOpenTransitioning *)v3;
}

- (void)setupViewsForZoom
{
  double v3 = [(BKBookOpenAnimator *)self bookViewController];
  double v4 = [v3 view];
  [v4 setAlpha:0.0];

  id v6 = [(BKBookOpenAnimator *)self containerView];
  double v5 = [(BKBookOpenAnimator *)self coverContainerView];
  [v6 addSubview:v5];
}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKBookOpenAnimator *)self opening];
  [(BKBookOpenAnimator *)self closedCoverFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(BKAudiobookSlideOpenAnimator *)self zoomedCoverFrame];
  double v18 = v17;
  if (v5)
  {
    double v19 = 1.0;
    double v20 = 0.0;
    uint64_t v30 = 0x3FA999999999999ALL;
    double v17 = v13;
    double v21 = v16;
    double v16 = v11;
    double v22 = v15;
    double v15 = v9;
    double v9 = v22;
    double v23 = v14;
    double v14 = v7;
    double v7 = v23;
    double v24 = 0.0;
  }
  else
  {
    double v24 = 1.0;
    uint64_t v30 = 0;
    double v20 = 0.05;
    double v19 = 0.0;
    double v18 = v13;
    double v21 = v11;
  }
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v14, v15, v16, v17);
  v25 = [(BKBookOpenAnimator *)self bookshelfTintView];
  [v25 setAlpha:v20];

  [(BKBookOpenAnimator *)self setBookshelfAlpha:v19];
  v26 = [(BKBookOpenAnimator *)self coverShadowView];
  [v26 setAlpha:v19];

  [(BKBookSlideOpenAnimator *)self zoomDuration];
  double v28 = v27;
  v29 = [(BKBookZoomRevealOpenAnimator *)self zoomTimingFunction];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000EE21C;
  v31[3] = &unk_100A46AC0;
  v31[4] = self;
  *(double *)&v31[5] = v7;
  *(double *)&v31[6] = v9;
  *(double *)&v31[7] = v21;
  *(double *)&v31[8] = v18;
  v31[9] = v30;
  *(double *)&v31[10] = v24;
  *(double *)&v31[11] = v24;
  +[UIView animateWithDuration:v29 delay:0 timingFunction:v31 options:v4 animations:v28 completion:0.0];
}

- (void)setupViewsForReveal
{
  [(BKBookOpenAnimator *)self closedCoverFrame];
  double v4 = v3;
  double v6 = v5;
  id v9 = [objc_alloc((Class)UIView) initWithFrame:v7, v8, v3, v5];
  [(BKAudiobookSlideOpenAnimator *)self setContentClipView:v9];

  double v10 = [(BKAudiobookSlideOpenAnimator *)self contentClipView];
  [v10 setClipsToBounds:1];

  double v11 = [(BKBookOpenAnimator *)self containerView];
  double v12 = [(BKAudiobookSlideOpenAnimator *)self contentClipView];
  [v11 addSubview:v12];

  double v13 = [(BKBookOpenAnimator *)self bookViewController];
  double v14 = [v13 view];
  [v14 layoutIfNeeded];

  id v45 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
  double v15 = [v45 transitionCoverViews];
  [v15 enumerateObjectsUsingBlock:&stru_100A46B00];

  double v16 = [(BKBookOpenAnimator *)self bookViewController];
  double v17 = [v16 transitionContentView];

  double v18 = [v17 snapshotViewAfterScreenUpdates:1];
  [(BKAudiobookSlideOpenAnimator *)self setContentView:v18];

  double v19 = [v45 transitionCoverViews];
  [v19 enumerateObjectsUsingBlock:&stru_100A46B20];

  double v20 = [(BKAudiobookSlideOpenAnimator *)self contentView];
  [v20 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  -[BKAudiobookSlideOpenAnimator setContentFrame:](self, "setContentFrame:", v22, v24, v26, v28);
  if ([(BKAudiobookSlideOpenAnimator *)self landscape]) {
    double v22 = (v4 - v26) * 0.5;
  }
  else {
    double v24 = (v6 - v28) * 0.5;
  }
  v29 = [(BKAudiobookSlideOpenAnimator *)self contentView];
  [v29 setFrame:v22, v24, v26, v28];

  uint64_t v30 = [(BKAudiobookSlideOpenAnimator *)self contentClipView];
  v31 = [(BKAudiobookSlideOpenAnimator *)self contentView];
  [v30 addSubview:v31];

  if (![(BKBookOpenAnimator *)self skipZoomPhase]) {
    [(BKAudiobookSlideOpenAnimator *)self zoomedCoverFrame];
  }
  CGRectMakeWithSize();
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:");
  v32 = [(BKBookOpenAnimator *)self coverContainerView];
  v33 = [v32 layer];
  [v33 setMasksToBounds:1];

  v34 = [(BKAudiobookSlideOpenAnimator *)self contentClipView];
  v35 = [(BKBookOpenAnimator *)self coverContainerView];
  [v34 addSubview:v35];

  id v36 = objc_alloc((Class)UIImageView);
  v37 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
  v38 = [v37 transitionCurrentCoverImage];
  id v39 = [v36 initWithImage:v38];

  [v39 setClipsToBounds:1];
  [v39 setContentMode:[self coverContentMode]];
  v40 = [(BKBookOpenAnimator *)self coverContainerView];
  [v40 bounds];
  CGRectMakeWithSize();
  [v39 setFrame:];

  [v39 setAutoresizingMask:18];
  [v39 setAlpha:0.0];
  v41 = [(BKBookOpenAnimator *)self coverImageView];
  v42 = [v41 superview];

  if (!v42) {
    BCReportAssertionFailureWithMessage();
  }
  v43 = [(BKBookOpenAnimator *)self coverImageView];
  [v42 insertSubview:v39 aboveSubview:v43];

  [(BKAudiobookSlideOpenAnimator *)self setCurrentCoverView:v39];
  v44 = [(BKBookOpenAnimator *)self coverShadowView];
  [v44 setAlpha:0.0];
}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000EEAA0;
  v29[3] = &unk_100A43DD8;
  v29[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = v5;
  double v6 = objc_retainBlock(v29);
  if ([(BKBookOpenAnimator *)self opening])
  {
    [(BKAudiobookSlideOpenAnimator *)self revealDuration];
    double v8 = v7;
    id v9 = [(BKBookZoomRevealOpenAnimator *)self revealTimingFunction];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000EEBD4;
    v26[3] = &unk_100A46B68;
    v26[4] = self;
    double v27 = &stru_100A46B40;
    id v28 = v4;
    +[UIView animateWithDuration:v9 delay:0 timingFunction:v6 options:v26 animations:v8 completion:0.0];

    double v10 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
    [v10 coverCornerRadius];
    double v12 = v11;

    +[CATransaction begin];
    [(BKAudiobookSlideOpenAnimator *)self revealDuration];
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
    double v13 = [(BKBookZoomRevealOpenAnimator *)self revealTimingFunction];
    +[CATransaction setAnimationTimingFunction:v13];

    double v14 = +[CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    if ([(BKBookOpenAnimator *)self opening])
    {
      [v14 setFromValue:&off_100A82CC0];
    }
    else
    {
      double v19 = +[NSNumber numberWithDouble:v12];
      [v14 setFromValue:v19];
    }
    double v17 = (id *)&v27;
    double v18 = &v28;
    if ([(BKBookOpenAnimator *)self opening])
    {
      double v20 = +[NSNumber numberWithDouble:v12];
      [v14 setToValue:v20];
    }
    else
    {
      [v14 setToValue:&off_100A82CC0];
    }
    [v14 setFillMode:kCAFillModeForwards];
    [v14 setRemovedOnCompletion:0];
    double v21 = [(BKBookOpenAnimator *)self coverContainerView];
    double v22 = [v21 layer];
    [v22 addAnimation:v14 forKey:@"cornerRadius"];

    +[CATransaction commit];
  }
  else
  {
    [(BKAudiobookSlideOpenAnimator *)self coverFadeDuration];
    double v16 = v15;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000EEC1C;
    v23[3] = &unk_100A46B68;
    v23[4] = self;
    double v17 = (id *)&v24;
    double v24 = v6;
    double v18 = &v25;
    id v25 = v4;
    +[UIView animateWithDuration:&stru_100A46B40 animations:v23 completion:v16];
  }
}

- (void)animationsDidFinish
{
  double v3 = [(BKAudiobookSlideOpenAnimator *)self currentCoverView];
  [v3 removeFromSuperview];

  [(BKAudiobookSlideOpenAnimator *)self setCurrentCoverView:0];
  id v4 = [(BKAudiobookSlideOpenAnimator *)self contentView];
  [v4 removeFromSuperview];

  [(BKAudiobookSlideOpenAnimator *)self setContentView:0];
  id v5 = [(BKAudiobookSlideOpenAnimator *)self contentClipView];
  [v5 removeFromSuperview];

  [(BKAudiobookSlideOpenAnimator *)self setContentClipView:0];
  v6.receiver = self;
  v6.super_class = (Class)BKAudiobookSlideOpenAnimator;
  [(BKBookOpenAnimator *)&v6 animationsDidFinish];
}

- (CGRect)zoomedCoverFrame
{
  double v3 = [(BKBookOpenAnimator *)self containerView];
  [v3 bounds];

  id v4 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
  [v4 transitionCoverFrame];

  CGSizeScaleThatFitsInCGSize();
  CGSizeScale();
  CGRectMakeWithSize();

  CGRectCenterRectInRect();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)revealDuration
{
  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookSlideOpenAnimator;
  [(BKBookSlideOpenAnimator *)&v3 revealDuration];
  return result;
}

- (int64_t)coverContentMode
{
  objc_super v3 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
  if (v3)
  {
    id v4 = [(BKAudiobookSlideOpenAnimator *)self audiobookViewController];
    int64_t v5 = (int64_t)[v4 coverContentMode];
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (UIView)currentCoverView
{
  return self->_currentCoverView;
}

- (void)setCurrentCoverView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_currentCoverView, 0);
}

@end