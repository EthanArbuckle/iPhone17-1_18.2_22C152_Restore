@interface THGuidedPanRectWell
- (BOOL)allowVerticalMovementInWell;
- (CGPoint)focalPoint;
- (CGPoint)maxCenterPoint;
- (CGPoint)minCenterPoint;
- (CGPoint)p_distanceFromWellRect:(CGPoint)a3;
- (CGPoint)unconsumedMovementWithMovement:(CGPoint)a3 controller:(id)a4;
- (CGRect)unscaledRect;
- (CGRect)wellRect;
- (NSString)identifier;
- (THGuidedPanRectWell)initWithUnscaledRect:(CGRect)a3 wellRect:(CGRect)a4 target:(id)a5;
- (THGuidedPanTarget)target;
- (double)currentBlendedWeight;
- (double)currentWeight;
- (double)previousBlendedWeight;
- (double)smoothWeight;
- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5;
- (double)wellViewScale;
- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6;
- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4;
- (id)description;
- (id)guidedPanTargetWithController:(id)a3 location:(id)a4;
- (id)p_contentLocationWithMovement:(CGPoint)a3 snapToBounds:(BOOL)a4 overscrolled:(BOOL *)a5 controller:(id)a6;
- (id)ratingBlock;
- (id)weightBlock;
- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5;
- (void)dealloc;
- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 controller:(id)a4;
- (void)setAllowVerticalMovementInWell:(BOOL)a3;
- (void)setCurrentBlendedWeight:(double)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setFocalPoint:(CGPoint)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxCenterPoint:(CGPoint)a3;
- (void)setMinCenterPoint:(CGPoint)a3;
- (void)setPreviousBlendedWeight:(double)a3;
- (void)setRatingBlock:(id)a3;
- (void)setSmoothWeight:(double)a3;
- (void)setWeightBlock:(id)a3;
- (void)setWellViewScale:(double)a3;
@end

@implementation THGuidedPanRectWell

- (THGuidedPanRectWell)initWithUnscaledRect:(CGRect)a3 wellRect:(CGRect)a4 target:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)THGuidedPanRectWell;
  v14 = [(THGuidedPanRectWell *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_unscaledRect.origin.CGFloat x = v13;
    v14->_unscaledRect.origin.CGFloat y = v12;
    v14->_unscaledRect.size.CGFloat width = v11;
    v14->_unscaledRect.size.CGFloat height = v10;
    v14->_wellRect.origin.CGFloat x = x;
    v14->_wellRect.origin.CGFloat y = y;
    v14->_wellRect.size.CGFloat width = width;
    v14->_wellRect.size.CGFloat height = height;
    v14->_target = (THGuidedPanTarget *)a5;
    TSDCenterOfRect();
    v15->_focalPoint.CGFloat x = v16;
    v15->_focalPoint.CGFloat y = v17;
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanRectWell;
  [(THGuidedPanRectWell *)&v3 dealloc];
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 controller:(id)a4
{
  [a4 viewScaleForUnscaledRect:[self guidedPanTargetKind] == 0, self->_unscaledRect.origin.x, self->_unscaledRect.origin.y, self->_unscaledRect.size.width, self->_unscaledRect.size.height];
  self->_wellViewScale = v6;
  double MidX = CGRectGetMidX(self->_unscaledRect);
  double MinY = CGRectGetMinY(self->_unscaledRect);
  id v9 = [a4 interactiveCanvasController];
  objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "screenTopContentPlacement");
  [v9 clampedCenterPointForPoint:MidX withPlacement:MinY viewScale:self->_wellViewScale];
  self->_minCenterPoint.CGFloat x = v12;
  self->_minCenterPoint.CGFloat y = v13;
  double v14 = CGRectGetMidX(self->_unscaledRect);
  double MaxY = CGRectGetMaxY(self->_unscaledRect);
  id v16 = [a4 interactiveCanvasController];
  objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "screenBottomContentPlacement");
  [v16 clampedCenterPointForPoint:v14 withPlacement:MaxY viewScale:v17, v18, self->_wellViewScale];
  self->_maxCenterPoint.CGFloat x = v19;
  self->_maxCenterPoint.CGFloat y = v20;
  if (v20 < self->_minCenterPoint.y) {
    self->_maxCenterPoint = self->_minCenterPoint;
  }
}

- (CGPoint)unconsumedMovementWithMovement:(CGPoint)a3 controller:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_allowVerticalMovementInWell)
  {
    objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", a3.x, a3.y);
    double v9 = v8;
    double v11 = v10;
    [a4 unscaledCenterPoint];
    double v13 = v12 - v11;
    double v14 = self->_minCenterPoint.y;
    if (v13 < v14 || (double v14 = self->_maxCenterPoint.y, v15 = 0.0, v13 > v14)) {
      double v15 = v14 - v13;
    }
    objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", v9, v15);
    CGFloat x = v16;
    CGFloat y = v17;
  }
  double v18 = x;
  double v19 = y;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (id)p_contentLocationWithMovement:(CGPoint)a3 snapToBounds:(BOOL)a4 overscrolled:(BOOL *)a5 controller:(id)a6
{
  if (self->_allowVerticalMovementInWell)
  {
    BOOL v9 = a4;
    objc_msgSend(objc_msgSend(a6, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", a3.x, a3.y);
    double v11 = v10;
    [a6 unscaledCenterPoint];
    double x = v12;
    double v15 = v14 - v11;
    double y = self->_minCenterPoint.y;
    if (v9)
    {
      TSUClamp();
      double v15 = v17;
    }
    else if (v15 < y || (double y = self->_maxCenterPoint.y, v15 > y))
    {
      double v15 = v15 + (y - v15) * -0.5;
      BOOL v19 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  double x = self->_focalPoint.x;
  double v18 = self->_focalPoint.y;
  double v15 = self->_minCenterPoint.y;
  if (v18 < v15)
  {
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  double v15 = self->_maxCenterPoint.y;
  if (v18 <= v15) {
    double v15 = self->_focalPoint.y;
  }
  BOOL v19 = 0;
LABEL_12:
  id result = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", x, v15, self->_wellViewScale);
  if (a5) {
    *a5 = v19;
  }
  return result;
}

- (CGPoint)p_distanceFromWellRect:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = CGPointZero.x;
  double v7 = CGPointZero.y;
  if (CGRectContainsPoint(self->_wellRect, a3)) {
    goto LABEL_29;
  }
  double MinX = CGRectGetMinX(self->_wellRect);
  if (x > MinX)
  {
    BOOL v10 = x >= CGRectGetMaxX(self->_wellRect);
    BOOL v9 = v10;
  }
  else
  {
    BOOL v9 = 0;
    BOOL v10 = 1;
  }
  double MinY = CGRectGetMinY(self->_wellRect);
  if (y > MinY)
  {
    double MaxY = CGRectGetMaxY(self->_wellRect);
    BOOL v12 = y >= MaxY;
    if (x > MinX || y >= MaxY)
    {
      if (!v9 || y >= MaxY)
      {
        BOOL v16 = x <= MinX;
        if (y < MaxY) {
          BOOL v16 = 1;
        }
        if (v16 || v9) {
          goto LABEL_19;
        }
        double v15 = CGRectGetMaxY(self->_wellRect);
LABEL_28:
        double v7 = y - v15;
        double v6 = 0.0;
        goto LABEL_29;
      }
      double MaxX = CGRectGetMaxX(self->_wellRect);
    }
    else
    {
      double MaxX = CGRectGetMinX(self->_wellRect);
    }
    double v6 = x - MaxX;
    double v7 = 0.0;
    goto LABEL_29;
  }
  if (!v10)
  {
    double v15 = CGRectGetMinY(self->_wellRect);
    goto LABEL_28;
  }
  BOOL v12 = 1;
LABEL_19:
  if (v10 && v12)
  {
    CGFloat v17 = self->_wellRect.origin.x;
    CGFloat v18 = self->_wellRect.origin.y;
    CGFloat width = self->_wellRect.size.width;
    CGFloat height = self->_wellRect.size.height;
    if (x > MinX) {
      CGRectGetMaxX(*(CGRect *)&v17);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v17);
    }
    CGFloat v21 = self->_wellRect.origin.x;
    CGFloat v22 = self->_wellRect.origin.y;
    CGFloat v23 = self->_wellRect.size.width;
    CGFloat v24 = self->_wellRect.size.height;
    if (y > MinY) {
      CGRectGetMaxY(*(CGRect *)&v21);
    }
    else {
      CGRectGetMinY(*(CGRect *)&v21);
    }
    TSDSubtractPoints();
    double v6 = v25;
    double v7 = v26;
  }
LABEL_29:
  double v27 = v6;
  double v28 = v7;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5
{
  weightBlock = self->_weightBlock;
  if (!weightBlock) {
    return 0.0;
  }
  [a4 unscaledPoint];
  -[THGuidedPanRectWell p_distanceFromWellRect:](self, "p_distanceFromWellRect:");
  double v7 = (void (*)(void *))weightBlock[2];

  v7(weightBlock);
  return result;
}

- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4
{
  return -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 0, 0, a4, a3.x, a3.y);
}

- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  char v52 = 0;
  -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 0, &v52, a6);
  id v13 = -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 1, 0, a6, v10, v9);
  if (!self->_allowVerticalMovementInWell)
  {
    TSDPointLength();
    if (v15 <= 300.0)
    {
      id v35 = +[TSDContentLocation contentLocationInterpolatingFromLocation:a3 toLocation:v13 fraction:1.04999995];
      id v14 = +[TSDContentPathAnimation animation];
      [v14 setContentLocations:[NSArray arrayWithObjects:a3, v35, v13, 0]];
      [v14 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
      v36 = +[NSNumber numberWithFloat:0.0];
      LODWORD(v37) = 1061997773;
      v38 = +[NSNumber numberWithFloat:v37];
      LODWORD(v39) = 1.0;
      v40 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v36, v38, +[NSNumber numberWithFloat:v39], 0, v51);
    }
    else
    {
      double currentBlendedWeight = self->_currentBlendedWeight;
      double previousBlendedWeight = self->_previousBlendedWeight;
      id v18 = +[TSDContentLocation contentLocation];
      if (currentBlendedWeight <= 0.5 || currentBlendedWeight <= previousBlendedWeight)
      {
        objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanFillScreenViewScale");
        double v21 = v20;
        objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanZoomedOutViewScale");
        double v23 = v22;
        [a3 unscaledPoint];
        [v13 unscaledPoint];
        TSDInterpolatePoints();
        [v18 setUnscaledPoint:];
        [a3 viewScale];
        TSDInterpolateFloats();
        double v42 = v24;
        [a3 viewScale];
        if (v25 < v21)
        {
          [v13 viewScale];
          if (v26 < v21)
          {
            [a3 viewScale];
            double v42 = v27;
          }
        }
        objc_msgSend(objc_msgSend(a6, "target"), "viewScaleWithController:", a6);
        if (vabdd_f64(v28, v23) >= 0.00999999978)
        {
          [a3 viewScale];
          float v30 = v29;
          [v13 viewScale];
          *(float *)&double v31 = v31;
          [v18 setViewScale:fmax(v23, fmin(v42, fminf(v30, *(float *)&v31) * 0.95))];
        }
      }
      else
      {
        [a3 unscaledPoint];
        [v13 unscaledPoint];
        TSDInterpolatePoints();
        [v18 setUnscaledPoint:];
        [a3 viewScale];
        double v42 = v41;
      }
      [v18 setViewScale:v42];
      id v43 = +[TSDContentLocation contentLocationInterpolatingFromLocation:v18 toLocation:v13 fraction:1.04999995];
      id v14 = +[TSDContentPathAnimation animation];
      [v14 setContentLocations:[NSArray arrayWithObjects:a3, v18, v43, v13, 0]];
      [v14 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
      v44 = +[NSNumber numberWithFloat:0.0];
      LODWORD(v45) = 1050253722;
      v46 = +[NSNumber numberWithFloat:v45];
      LODWORD(v47) = 1058642330;
      v48 = +[NSNumber numberWithFloat:v47];
      LODWORD(v49) = 1.0;
      v40 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v44, v46, v48, +[NSNumber numberWithFloat:v49], 0);
    }
    [v14 setKeyTimes:v40];
    goto LABEL_23;
  }
  if (v52 || y == 0.0)
  {
    if (!v52)
    {
      [a3 viewScale];
      if (vabdd_f64(v32, self->_wellViewScale) < 0.00999999978) {
        return 0;
      }
    }
    id v14 = +[TSDContentPathAnimation animation];
    [v14 setContentLocations:[NSArray arrayWithObjects:a3, v13, 0]];
    v33 = +[NSNumber numberWithFloat:0.0];
    LODWORD(v34) = 1.0;
    [v14 setKeyTimes:[NSArray arrayWithObjects:v33, [NSNumber numberWithFloat:v34], 0]];
    [v14 setTimingFunctions:[NSArray arrayWithObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]]];
LABEL_23:
    [v14 setDuration:0.300000012];
    return v14;
  }
  return -[THGuidedPanColumnAnimator animation](-[THGuidedPanColumnAnimator initWithLocation:velocity:min:max:targetViewScale:controller:]([THGuidedPanColumnAnimator alloc], "initWithLocation:velocity:min:max:targetViewScale:controller:", a3, a6, x, y, self->_minCenterPoint.x, self->_minCenterPoint.y, self->_maxCenterPoint.x, self->_maxCenterPoint.y, self->_wellViewScale), "animation");
}

- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5
{
  ratingBlock = (uint64_t (**)(__n128, __n128, __n128, __n128))self->_ratingBlock;
  if (ratingBlock) {
    LODWORD(ratingBlock) = ratingBlock[2]((__n128)a3, *(__n128 *)&a3.y, (__n128)a4, *(__n128 *)&a4.y);
  }
  return (int)ratingBlock;
}

- (id)guidedPanTargetWithController:(id)a3 location:(id)a4
{
  return self->_target;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:@"<%@ %p %@ %@>", v4, self, NSStringFromCGRect(self->_wellRect), self->_identifier];
}

- (THGuidedPanTarget)target
{
  return self->_target;
}

- (CGRect)unscaledRect
{
  double x = self->_unscaledRect.origin.x;
  double y = self->_unscaledRect.origin.y;
  double width = self->_unscaledRect.size.width;
  double height = self->_unscaledRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)wellRect
{
  double x = self->_wellRect.origin.x;
  double y = self->_wellRect.origin.y;
  double width = self->_wellRect.size.width;
  double height = self->_wellRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)focalPoint
{
  double x = self->_focalPoint.x;
  double y = self->_focalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFocalPoint:(CGPoint)a3
{
  self->_focalPoint = a3;
}

- (BOOL)allowVerticalMovementInWell
{
  return self->_allowVerticalMovementInWell;
}

- (void)setAllowVerticalMovementInWell:(BOOL)a3
{
  self->_allowVerticalMovementInWell = a3;
}

- (id)weightBlock
{
  return self->_weightBlock;
}

- (void)setWeightBlock:(id)a3
{
}

- (id)ratingBlock
{
  return self->_ratingBlock;
}

- (void)setRatingBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)smoothWeight
{
  return self->_smoothWeight;
}

- (void)setSmoothWeight:(double)a3
{
  self->_smoothWeight = a3;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (double)currentBlendedWeight
{
  return self->_currentBlendedWeight;
}

- (void)setCurrentBlendedWeight:(double)a3
{
  self->_double currentBlendedWeight = a3;
}

- (double)previousBlendedWeight
{
  return self->_previousBlendedWeight;
}

- (void)setPreviousBlendedWeight:(double)a3
{
  self->_double previousBlendedWeight = a3;
}

- (double)wellViewScale
{
  return self->_wellViewScale;
}

- (void)setWellViewScale:(double)a3
{
  self->_wellViewScale = a3;
}

- (CGPoint)minCenterPoint
{
  double x = self->_minCenterPoint.x;
  double y = self->_minCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMinCenterPoint:(CGPoint)a3
{
  self->_minCenterPoint = a3;
}

- (CGPoint)maxCenterPoint
{
  double x = self->_maxCenterPoint.x;
  double y = self->_maxCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMaxCenterPoint:(CGPoint)a3
{
  self->_maxCenterPoint = a3;
}

@end