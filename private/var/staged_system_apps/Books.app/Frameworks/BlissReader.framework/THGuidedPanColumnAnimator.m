@interface THGuidedPanColumnAnimator
- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10;
- (BOOL)verticalBounceEnabled;
- (THGuidedPanColumnAnimator)initWithLocation:(id)a3 velocity:(CGPoint)a4 min:(CGPoint)a5 max:(CGPoint)a6 targetViewScale:(double)a7 controller:(id)a8;
- (TSDContentAnimation)animation;
- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9;
- (void)dealloc;
- (void)setVerticalBounceEnabled:(BOOL)a3;
@end

@implementation THGuidedPanColumnAnimator

- (THGuidedPanColumnAnimator)initWithLocation:(id)a3 velocity:(CGPoint)a4 min:(CGPoint)a5 max:(CGPoint)a6 targetViewScale:(double)a7 controller:(id)a8
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v12 = a5.y;
  CGFloat v13 = a5.x;
  double v14 = a4.y;
  v28.receiver = self;
  v28.super_class = (Class)THGuidedPanColumnAnimator;
  v16 = [(THGuidedPanColumnAnimator *)&v28 init];
  if (v16)
  {
    id v17 = +[TSDContinuousContentPathAnimation animation];
    v16->_verticalBounceEnabled = 1;
    v16->_accuracCGFloat y = 1.0;
    *(_OWORD *)&v16->_fastScrollCount = xmmword_344FE0;
    v16->_minCenter.CGFloat x = v13;
    v16->_minCenter.CGFloat y = v12;
    v16->_maxCenter.CGFloat x = x;
    v16->_maxCenter.CGFloat y = y;
    [a3 viewScale];
    v16->_currentViewScale = v18;
    objc_msgSend(objc_msgSend(a8, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", 0.0, v14 / -1000.0);
    v16->_unscaledVelocity.CGFloat x = v19;
    v16->_unscaledVelocity.CGFloat y = v20;
    [a3 unscaledPoint];
    v16->_unscaledPosition.CGFloat x = v21;
    v16->_unscaledPosition.CGFloat y = v22;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_17DCB0;
    v25[3] = &unk_45A368;
    v25[4] = v16;
    long long v26 = xmmword_344FF0;
    double v27 = a7;
    [v17 setTick:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_17DD80;
    v24[3] = &unk_45A390;
    v24[4] = v16;
    [v17 setIsFinished:v24];
    v16->_animation = (TSDContentAnimation *)v17;
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanColumnAnimator;
  [(THGuidedPanColumnAnimator *)&v3 dealloc];
}

- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10
{
  if (a6 >= a7) {
    double v10 = a6;
  }
  else {
    double v10 = a7;
  }
  if (!a10) {
    return 0;
  }
  if (a5 < a6 || v10 < a5)
  {
    double v20 = a4;
  }
  else
  {
    double v21 = *a10;
    if (*a10 == 0.0) {
      goto LABEL_42;
    }
    double v22 = a4 * a9;
    if (a4 * a9 >= -0.5) {
      double v23 = v22 * (v22 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v23 = exp(v22);
    }
    double v24 = (1.0 - v23) / (1.0 - a8) * a8;
    double v25 = *a3 + v21 * v24 * self->_fastScrollMultiplier;
    *a3 = v25;
    double v20 = 0.0;
    BOOL v26 = v25 < a6 || v25 > v10;
    double v27 = a4;
    if (v26)
    {
      if (v25 >= a6)
      {
        double v28 = (v10 - a5) * a4;
        double v29 = v25 - a5;
      }
      else
      {
        double v28 = (a5 - a6) * a4;
        double v29 = a5 - v25;
      }
      double v27 = v28 / v29;
      double v20 = a4 - v27;
    }
    if (v27 > 0.0)
    {
      if (v27 != a4)
      {
        double v30 = v27 * a9;
        if (v27 * a9 >= -0.5) {
          double v23 = v30 * (v30 * 0.5 + 1.0) + 1.0;
        }
        else {
          double v23 = exp(v30);
        }
        double v24 = (1.0 - v23) / (1.0 - a8) * a8;
      }
      *a3 = a5 + v24 * *a10 * self->_fastScrollMultiplier;
      *a10 = v23 * *a10;
    }
  }
  if (v20 > 0.0)
  {
    double v31 = v20 * a9;
    if (v20 * a9 >= -0.5) {
      double v32 = v31 * (v31 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v32 = exp(v31);
    }
    double v33 = v20 * -0.01005;
    if (v20 * -0.01005 >= -0.5) {
      double v34 = v33 * (v33 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v34 = exp(v33);
    }
    if (*a3 >= a6) {
      double v35 = v10 + (*a3 - v10) * v34;
    }
    else {
      double v35 = a6 + (*a3 - a6) * v34;
    }
    *a3 = v35;
    *a3 = v35 + (1.0 - v32) * (v34 * a8 * *a10) / (1.0 - a8);
    *a10 = v32 * v34 * *a10;
    *(_OWORD *)&self->_fastScrollCount = xmmword_344FE0;
  }
LABEL_42:
  double v36 = *a3;
  double v37 = v10 + 0.5;
  BOOL v38 = v10 > 0.0 || v36 < v37;
  if (!v38
    && ((accuracCGFloat y = self->_accuracy, accuracy == 1.0)
      ? (double v41 = round(v36))
      : (double v40 = floor(v36), v41 = v40 + round((v36 - v40) * accuracy) / accuracy),
        v41 != 0.0)
    || (v36 > a6 + -0.5 ? (BOOL v42 = v36 < v37) : (BOOL v42 = 0), !v42))
  {
    *(_OWORD *)&self->_fastScrollCount = xmmword_344FE0;
    return 1;
  }
  return 0;
}

- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9
{
  double v11 = a5;
  if (a5 >= a6) {
    double v14 = a5;
  }
  else {
    double v14 = a6;
  }
  double v15 = a4 * a8;
  if (v15 >= -0.5) {
    double v16 = v15 * (v15 * 0.5 + 1.0) + 1.0;
  }
  else {
    double v16 = exp(v15);
  }
  *a3 = *a3 + *a9 * ((1.0 - v16) / (1.0 - a7) * a7) * self->_fastScrollMultiplier;
  *a9 = v16 * *a9;
  if (*a3 < v11 || (double v11 = v14, *a3 > v14))
  {
    *a3 = v11;
    *a9 = 0.0;
  }
}

- (TSDContentAnimation)animation
{
  return self->_animation;
}

- (BOOL)verticalBounceEnabled
{
  return self->_verticalBounceEnabled;
}

- (void)setVerticalBounceEnabled:(BOOL)a3
{
  self->_verticalBounceEnabled = a3;
}

@end