@interface BKCrossFadeZoomTransition
+ (id)transition;
- (BKCrossFadeZoomTransition)init;
- (CGPoint)fadeControlPoint1;
- (CGPoint)fadeControlPoint2;
- (CGPoint)zoomControlPoint1;
- (CGPoint)zoomControlPoint2;
- (double)fadeDuration;
- (double)transitionDuration:(id)a3;
- (double)zoomDuration;
- (double)zoomFactor;
- (void)animateTransition:(id)a3;
- (void)setFadeControlPoint1:(CGPoint)a3;
- (void)setFadeControlPoint2:(CGPoint)a3;
- (void)setFadeDuration:(double)a3;
- (void)setZoomControlPoint1:(CGPoint)a3;
- (void)setZoomControlPoint2:(CGPoint)a3;
- (void)setZoomDuration:(double)a3;
- (void)setZoomFactor:(double)a3;
@end

@implementation BKCrossFadeZoomTransition

+ (id)transition
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BKCrossFadeZoomTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKCrossFadeZoomTransition;
  result = [(BKCrossFadeZoomTransition *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_zoomControlPoint1.y = xmmword_10085CBC0;
    result->_zoomControlPoint2.y = 1.0;
    *(_OWORD *)&result->_fadeDuration = xmmword_10085CBD0;
    *(_OWORD *)&result->_zoomFactor = xmmword_10085CBE0;
    *(_OWORD *)&result->_fadeControlPoint1.y = xmmword_10085CBF0;
    *(_OWORD *)&result->_fadeControlPoint2.y = xmmword_10085CC00;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  [(BKCrossFadeZoomTransition *)self zoomDuration];
  double v5 = v4;
  [(BKCrossFadeZoomTransition *)self fadeDuration];
  if (v5 >= result) {
    return v5;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 containerView];
  v43 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v7 = [v43 view];
  v8 = [v6 view];
  [v5 insertSubview:v8 belowSubview:v7];
  v9 = [v5 window];
  [v9 setUserInteractionEnabled:0];

  [v7 frame];
  [v8 setFrame:];
  [v7 alpha];
  uint64_t v11 = v10;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v54[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v54[1] = v12;
  v54[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v7 setTransform:v54];
  id v13 = objc_alloc_init((Class)BCViewPropertyAnimatorCounter);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001BC150;
  v49[3] = &unk_100A47F70;
  id v50 = v5;
  id v14 = v7;
  uint64_t v53 = v11;
  id v51 = v14;
  id v52 = v4;
  id v15 = v4;
  id v16 = v5;
  [v13 setAnimationDidEnd:v49];
  id v17 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BKCrossFadeZoomTransition *)self zoomDuration];
  double v19 = v18;
  [(BKCrossFadeZoomTransition *)self zoomControlPoint1];
  double v21 = v20;
  double v23 = v22;
  [(BKCrossFadeZoomTransition *)self zoomControlPoint2];
  double v25 = v24;
  double v27 = v26;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001BC1D8;
  v46[3] = &unk_100A43DD8;
  id v28 = v14;
  id v47 = v28;
  v48 = self;
  id v29 = [v17 initWithDuration:v46 controlPoint1:v19 controlPoint2:v21 animations:v23, v25, v27];
  [v13 animate:v29];
  id v30 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BKCrossFadeZoomTransition *)self fadeDuration];
  double v32 = v31;
  [(BKCrossFadeZoomTransition *)self fadeControlPoint1];
  double v34 = v33;
  double v36 = v35;
  [(BKCrossFadeZoomTransition *)self fadeControlPoint2];
  double v38 = v37;
  double v40 = v39;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001BC248;
  v44[3] = &unk_100A43D60;
  id v45 = v28;
  id v41 = v28;
  id v42 = [v30 initWithDuration:v44 controlPoint1:v32 controlPoint2:v34 animations:v36, v38, v40];
  [v13 animate:v42];
}

- (double)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setFadeDuration:(double)a3
{
  self->_fadeDuration = a3;
}

- (double)zoomDuration
{
  return self->_zoomDuration;
}

- (void)setZoomDuration:(double)a3
{
  self->_zoomDuration = a3;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (CGPoint)fadeControlPoint1
{
  double x = self->_fadeControlPoint1.x;
  double y = self->_fadeControlPoint1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFadeControlPoint1:(CGPoint)a3
{
  self->_fadeControlPoint1 = a3;
}

- (CGPoint)fadeControlPoint2
{
  double x = self->_fadeControlPoint2.x;
  double y = self->_fadeControlPoint2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFadeControlPoint2:(CGPoint)a3
{
  self->_fadeControlPoint2 = a3;
}

- (CGPoint)zoomControlPoint1
{
  double x = self->_zoomControlPoint1.x;
  double y = self->_zoomControlPoint1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomControlPoint1:(CGPoint)a3
{
  self->_zoomControlPoint1 = a3;
}

- (CGPoint)zoomControlPoint2
{
  double x = self->_zoomControlPoint2.x;
  double y = self->_zoomControlPoint2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomControlPoint2:(CGPoint)a3
{
  self->_zoomControlPoint2 = a3;
}

@end