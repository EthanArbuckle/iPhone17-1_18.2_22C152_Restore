@interface BKPageSlide
- (BKPageSlide)init;
- (CGPoint)bottomViewFromCenter;
- (CGPoint)bottomViewToCenter;
- (CGPoint)contextualBottomViewFromCenter;
- (CGPoint)contextualBottomViewToCenter;
- (CGPoint)contextualTopViewFromCenter;
- (CGPoint)contextualTopViewToCenter;
- (CGPoint)manualCurlStartPosition;
- (CGPoint)topViewFromCenter;
- (CGPoint)topViewToCenter;
- (UIView)bottomPagesView;
- (UIView)scrimView;
- (UIView)topPagesView;
- (double)manualCurlCurrentTime;
- (id)completionBlock;
- (id)springAnimationForKeyPath:(id)a3 stiffness:(double)a4 damping:(double)a5 from:(CGPoint)a6 to:(CGPoint)a7;
- (int64_t)ongoingAnimationCount;
- (void)_cleanup;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)autoSlideFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8 completion:(id)a9;
- (void)beginManualAnimationAtLocation:(CGPoint)a3;
- (void)cancelManualAnimation;
- (void)finishManualAnimation;
- (void)initiateManualAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8;
- (void)setBottomPagesView:(id)a3;
- (void)setBottomViewFromCenter:(CGPoint)a3;
- (void)setBottomViewToCenter:(CGPoint)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setManualCurlCurrentTime:(double)a3;
- (void)setManualCurlStartPosition:(CGPoint)a3;
- (void)setOngoingAnimationCount:(int64_t)a3;
- (void)setScrimView:(id)a3;
- (void)setTopPagesView:(id)a3;
- (void)setTopViewFromCenter:(CGPoint)a3;
- (void)setTopViewToCenter:(CGPoint)a3;
- (void)setupSlideAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8;
- (void)updateManualAnimationToLocation:(CGPoint)a3;
@end

@implementation BKPageSlide

- (BKPageSlide)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKPageSlide;
  result = [(BKPageSlide *)&v3 init];
  if (result) {
    result->_ongoingAnimationCount = 0;
  }
  return result;
}

- (void)setupSlideAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  [(BKPageAnimation *)self setState:0];
  BOOL v84 = v9;
  [(BKPageAnimation *)self setIsGoingToNextPage:v10 ^ v9];
  id v17 = v14;
  [v16 setClipsToBounds:1];
  v18 = [v15 firstObject];
  uint64_t v19 = [v15 lastObject];
  v81 = (void *)v19;
  v82 = v18;
  if (v8)
  {
    v20 = (void *)v19;
    [v18 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v20 frame];
    [v18 setFrame:];
    [v20 setFrame:v22, v24, v26, v28];
    v80 = v17;
  }
  else
  {
    [v16 bounds];
    [v18 setFrame:];
    if ([v15 count])
    {
      if ([(BKPageAnimation *)self isGoingToNextPage] && v9)
      {
        uint64_t v29 = [v15 lastObject];
      }
      else
      {
        uint64_t v29 = [v15 firstObject];
      }
      v30 = (void *)v29;
      uint64_t v31 = +[NSArray arrayWithObject:v29];

      id v15 = (id)v31;
    }
    if ([(BKPageAnimation *)self isGoingToNextPage] && v9)
    {
      uint64_t v32 = [v17 firstObject];
    }
    else
    {
      uint64_t v32 = [v17 lastObject];
    }
    v33 = (void *)v32;
    [v16 bounds];
    [v33 setFrame:];
    v80 = +[NSArray arrayWithObject:v33];
  }
  if ([(BKPageAnimation *)self isGoingToNextPage]) {
    v34 = v17;
  }
  else {
    v34 = v15;
  }
  id v35 = v34;
  v83 = v17;
  if ([(BKPageAnimation *)self isGoingToNextPage]) {
    v36 = v15;
  }
  else {
    v36 = v17;
  }
  id v37 = v36;
  id v38 = objc_alloc((Class)UIView);
  [v16 bounds];
  id v39 = [v38 initWithFrame:];
  id v40 = +[UIColor blackColor];
  id v41 = [v40 CGColor];
  v42 = [v39 layer];
  [v42 setShadowColor:v41];

  [v39 bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v43 = objc_claimAutoreleasedReturnValue();
  id v44 = [v43 CGPath];
  v45 = [v39 layer];
  [v45 setShadowPath:v44];

  v46 = [v39 layer];
  [v46 setShadowRadius:50.0];

  double height = CGSizeZero.height;
  v48 = [v39 layer];
  [v48 setShadowOffset:CGSizeZero.width, height];

  v49 = [v39 layer];
  LODWORD(v50) = 1060320051;
  [v49 setShadowOpacity:v50];

  id v51 = objc_alloc((Class)UIView);
  [v16 bounds];
  id v52 = [v51 initWithFrame:];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v53 = v35;
  id v54 = [v53 countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v90;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v90 != v56) {
          objc_enumerationMutation(v53);
        }
        [v39 addSubview:*(void *)(*((void *)&v89 + 1) + 8 * i)];
      }
      id v55 = [v53 countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v55);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v58 = v37;
  id v59 = [v58 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v86;
    do
    {
      for (j = 0; j != v60; j = (char *)j + 1)
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(v58);
        }
        [v52 addSubview:*(void *)(*((void *)&v85 + 1) + 8 * (void)j)];
      }
      id v60 = [v58 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v60);
  }

  [v16 addSubview:v52];
  [v16 addSubview:v39];
  objc_storeStrong((id *)&self->_topPagesView, v39);
  objc_storeStrong((id *)&self->_bottomPagesView, v52);
  id v63 = objc_alloc((Class)UIView);
  [v16 bounds];
  v64 = [v63 initWithFrame:];
  scrimView = self->_scrimView;
  self->_scrimView = v64;

  v66 = +[UIColor blackColor];
  [(UIView *)self->_scrimView setBackgroundColor:v66];

  v67 = [(UIView *)self->_scrimView layer];
  LODWORD(v68) = 1050253722;
  [v67 setOpacity:v68];

  [v52 addSubview:self->_scrimView];
  p_topViewToCenter = &self->_topViewToCenter;
  if (v84)
  {
    [v16 bounds];
    double Width = CGRectGetWidth(v95);
    [v39 bounds];
    double v71 = Width + CGRectGetWidth(v96) * 0.5 + 50.0;
  }
  else
  {
    [v39 center];
    double v71 = -50.0 - v72;
  }
  [v39 center];
  p_topViewToCenter->x = v71;
  self->_topViewToCenter.y = v73;
  [v39 center];
  self->_topViewFromCenter.x = v74;
  self->_topViewFromCenter.y = v75;
  if ([(BKPageAnimation *)self isGoingToNextPage]) {
    [v39 setCenter:p_topViewToCenter->x, self->_topViewToCenter.y];
  }
  [v52 bounds];
  double v76 = CGRectGetWidth(v97) * 0.25;
  [v52 center];
  self->_bottomViewToCenter.x = v77;
  self->_bottomViewToCenter.y = v78;
  if (!v84)
  {
    [v16 bounds];
    double v76 = CGRectGetWidth(v98) - v76;
  }
  [v39 center];
  self->_bottomViewFromCenter.x = v76;
  self->_bottomViewFromCenter.y = v79;
  if ([(BKPageAnimation *)self isGoingToNextPage]) {
    [v52 setCenter:self->_bottomViewToCenter.x, self->_bottomViewToCenter.y];
  }
}

- (id)springAnimationForKeyPath:(id)a3 stiffness:(double)a4 damping:(double)a5 from:(CGPoint)a6 to:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  id v14 = +[CASpringAnimation animationWithKeyPath:a3];
  [v14 setDelegate:self];
  [v14 setMass:1.0];
  [v14 setStiffness:a4];
  [v14 setDamping:a5];
  [v14 setInitialVelocity:0.0];
  [v14 setRemovedOnCompletion:0];
  [v14 settlingDuration];
  [v14 setDuration:];
  id v15 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v10, v9);
  [v14 setFromValue:v15];

  id v16 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y);
  [v14 setToValue:v16];

  if (![(BKPageAnimation *)self isGoingToNextPage]) {
    [v14 ae_reverseValues];
  }

  return v14;
}

- (void)autoSlideFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8 completion:(id)a9
{
  [(BKPageSlide *)self setupSlideAnimationFromPages:a3 toPages:a4 inContainer:a5 isForwardAnimation:a6 isRTL:a7 isZoomedToSpread:a8];
  double v10 = [(BKPageAnimation *)self pageAnimationDelegate];
  [v10 pageAnimationWillBegin:self];

  +[CATransaction begin];
  id v22 = [(BKPageSlide *)self springAnimationForKeyPath:@"position", 250.0, 35.0, self->_topViewFromCenter.x, self->_topViewFromCenter.y, self->_topViewToCenter.x, self->_topViewToCenter.y stiffness damping from to];
  v11 = [(BKPageSlide *)self springAnimationForKeyPath:@"position", 350.0, 50.0, self->_bottomViewFromCenter.x, self->_bottomViewFromCenter.y, self->_bottomViewToCenter.x, self->_bottomViewToCenter.y stiffness damping from to];
  v12 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v12 setDelegate:self];
  [v12 setToValue:&off_1E9738];
  [v12 setFromValue:&off_1E9748];
  [v11 settlingDuration];
  [v12 setDuration:];
  [v12 setRemovedOnCompletion:0];
  [v12 setFillMode:kCAFillModeForwards];
  LODWORD(v13) = 1051260355;
  LODWORD(v14) = 1059816735;
  LODWORD(v15) = 1.0;
  id v16 = +[CAMediaTimingFunction functionWithControlPoints:v13 :0.0 :v14 :v15];
  [v12 setTimingFunction:v16];

  if (![(BKPageAnimation *)self isGoingToNextPage]) {
    [v12 ae_reverseValues];
  }
  id v17 = [(BKPageSlide *)self topPagesView];
  v18 = [v17 layer];
  [v18 addAnimation:v22 forKey:@"kPageSlideAnimationNameTopPages"];

  uint64_t v19 = [(BKPageSlide *)self bottomPagesView];
  v20 = [v19 layer];
  [v20 addAnimation:v11 forKey:@"kPageSlideAnimationNameBottomPages"];

  double v21 = [(UIView *)self->_scrimView layer];
  [v21 addAnimation:v12 forKey:@"kPageSlideAnimationNameScrimView"];

  +[CATransaction commit];
}

- (CGPoint)contextualTopViewFromCenter
{
  if ([(BKPageAnimation *)self isGoingToNextPage])
  {
    [(BKPageSlide *)self topViewFromCenter];
  }
  else
  {
    [(BKPageSlide *)self topViewToCenter];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)contextualTopViewToCenter
{
  if ([(BKPageAnimation *)self isGoingToNextPage])
  {
    [(BKPageSlide *)self topViewToCenter];
  }
  else
  {
    [(BKPageSlide *)self topViewFromCenter];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)contextualBottomViewFromCenter
{
  if ([(BKPageAnimation *)self isGoingToNextPage])
  {
    [(BKPageSlide *)self bottomViewFromCenter];
  }
  else
  {
    [(BKPageSlide *)self bottomViewToCenter];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)contextualBottomViewToCenter
{
  if ([(BKPageAnimation *)self isGoingToNextPage])
  {
    [(BKPageSlide *)self bottomViewToCenter];
  }
  else
  {
    [(BKPageSlide *)self bottomViewFromCenter];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)initiateManualAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8
{
  [(BKPageSlide *)self setupSlideAnimationFromPages:a3 toPages:a4 inContainer:a5 isForwardAnimation:a6 isRTL:a7 isZoomedToSpread:a8];
  [(BKPageAnimation *)self setIsInteractive:1];
  if ([(BKPageAnimation *)self isGoingToNextPage])
  {
    [(BKPageSlide *)self topViewFromCenter];
    double v10 = v9;
    double v12 = v11;
    double v13 = [(BKPageSlide *)self topPagesView];
    [v13 setCenter:v10, v12];

    [(BKPageSlide *)self bottomViewFromCenter];
  }
  else
  {
    [(BKPageSlide *)self topViewToCenter];
    double v17 = v16;
    double v19 = v18;
    v20 = [(BKPageSlide *)self topPagesView];
    [v20 setCenter:v17, v19];

    [(BKPageSlide *)self bottomViewToCenter];
  }
  double v21 = v14;
  double v22 = v15;
  id v23 = [(BKPageSlide *)self bottomPagesView];
  [v23 setCenter:v21, v22];
}

- (void)beginManualAnimationAtLocation:(CGPoint)a3
{
  -[BKPageSlide setManualCurlStartPosition:](self, "setManualCurlStartPosition:", a3.x, a3.y);
  [(BKPageSlide *)self setManualCurlCurrentTime:CFAbsoluteTimeGetCurrent()];
  id v4 = [(BKPageAnimation *)self pageAnimationDelegate];
  [v4 pageAnimationWillBegin:self];
}

- (void)updateManualAnimationToLocation:(CGPoint)a3
{
  double x = a3.x;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
  [(UIView *)self->_topPagesView bounds];
  double v5 = CGRectGetWidth(v27) * 0.5;
  if (v5 != 0.0)
  {
    double v6 = fmax(fmin(vabdd_f64(x, self->_manualCurlStartPosition.x) / v5, 1.0), 0.0);
    [(BKPageSlide *)self contextualTopViewToCenter];
    double v8 = v7;
    [(BKPageSlide *)self contextualTopViewFromCenter];
    double v10 = v9;
    double v12 = v11 - (v11 - v8) * v6;
    double v13 = [(BKPageSlide *)self topPagesView];
    [v13 setCenter:v12, v10];

    [(BKPageSlide *)self contextualBottomViewToCenter];
    double v15 = v14;
    [(BKPageSlide *)self contextualBottomViewFromCenter];
    double v17 = v16;
    double v19 = v18 - (v18 - v15) * v6;
    v20 = [(BKPageSlide *)self bottomPagesView];
    [v20 setCenter:v19, v17];

    unsigned int v21 = [(BKPageAnimation *)self isGoingToNextPage];
    double v22 = 1.0 - v6;
    if (!v21) {
      double v22 = v6;
    }
    float v23 = v22 * 0.300000012;
    id v25 = [(UIView *)self->_scrimView layer];
    *(float *)&double v24 = v23;
    [v25 setOpacity:v24];
  }
}

- (void)finishManualAnimation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BE6D8;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_BE7BC;
  v2[3] = &unk_1DABD8;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.300000012];
}

- (void)cancelManualAnimation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BE8EC;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_BE9D0;
  v2[3] = &unk_1DABD8;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.300000012];
}

- (void)animationDidStart:(id)a3
{
  [(BKPageAnimation *)self setState:1];
  id v4 = (char *)[(BKPageSlide *)self ongoingAnimationCount] + 1;

  [(BKPageSlide *)self setOngoingAnimationCount:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BKPageSlide *)self setOngoingAnimationCount:(char *)[(BKPageSlide *)self ongoingAnimationCount] - 1];
  if (![(BKPageSlide *)self ongoingAnimationCount])
  {
    if (v4) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 4;
    }
    [(BKPageAnimation *)self setState:v7];
    [(BKPageAnimation *)self setFinished:1];
    double v8 = [(BKPageAnimation *)self pageAnimationDelegate];
    [v8 pageAnimation:self didFinish:1];

    uint64_t v9 = [(BKPageSlide *)self completionBlock];
    double v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
    [(BKPageSlide *)self setCompletionBlock:0];

    [(BKPageSlide *)self _cleanup];
  }
  double v11 = [(UIView *)self->_scrimView layer];
  id v12 = [v11 animationForKey:@"kPageSlideAnimationNameScrimView"];

  if (v12 == v6)
  {
    [(UIView *)self->_scrimView removeFromSuperview];
    scrimView = self->_scrimView;
    self->_scrimView = 0;
  }
}

- (void)_cleanup
{
}

- (int64_t)ongoingAnimationCount
{
  return self->_ongoingAnimationCount;
}

- (void)setOngoingAnimationCount:(int64_t)a3
{
  self->_ongoingAnimationCount = a3;
}

- (UIView)topPagesView
{
  return self->_topPagesView;
}

- (void)setTopPagesView:(id)a3
{
}

- (UIView)bottomPagesView
{
  return self->_bottomPagesView;
}

- (void)setBottomPagesView:(id)a3
{
}

- (CGPoint)bottomViewToCenter
{
  double x = self->_bottomViewToCenter.x;
  double y = self->_bottomViewToCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomViewToCenter:(CGPoint)a3
{
  self->_bottomViewToCenter = a3;
}

- (CGPoint)bottomViewFromCenter
{
  double x = self->_bottomViewFromCenter.x;
  double y = self->_bottomViewFromCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomViewFromCenter:(CGPoint)a3
{
  self->_bottomViewFromCenter = a3;
}

- (CGPoint)topViewToCenter
{
  double x = self->_topViewToCenter.x;
  double y = self->_topViewToCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopViewToCenter:(CGPoint)a3
{
  self->_topViewToCenter = a3;
}

- (CGPoint)topViewFromCenter
{
  double x = self->_topViewFromCenter.x;
  double y = self->_topViewFromCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopViewFromCenter:(CGPoint)a3
{
  self->_topViewFromCenter = a3;
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
}

- (CGPoint)manualCurlStartPosition
{
  double x = self->_manualCurlStartPosition.x;
  double y = self->_manualCurlStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setManualCurlStartPosition:(CGPoint)a3
{
  self->_manualCurlStartPosition = a3;
}

- (double)manualCurlCurrentTime
{
  return self->_manualCurlCurrentTime;
}

- (void)setManualCurlCurrentTime:(double)a3
{
  self->_manualCurlCurrentTime = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);
  objc_storeStrong((id *)&self->_bottomPagesView, 0);

  objc_storeStrong((id *)&self->_topPagesView, 0);
}

@end