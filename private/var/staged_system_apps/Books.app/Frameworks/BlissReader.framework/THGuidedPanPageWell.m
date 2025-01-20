@interface THGuidedPanPageWell
- (double)currentBlendedWeight;
- (double)currentWeight;
- (double)previousBlendedWeight;
- (double)smoothWeight;
- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5;
- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6;
- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4;
- (id)guidedPanTargetWithController:(id)a3 location:(id)a4;
- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5;
- (void)setCurrentBlendedWeight:(double)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setPreviousBlendedWeight:(double)a3;
- (void)setSmoothWeight:(double)a3;
@end

@implementation THGuidedPanPageWell

- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5
{
  return 1.0;
}

- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4
{
  return 0;
}

- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6
{
  [self guidedPanTargetWithController:a6 location:a3 x:a4.x y:a4.y x:a5.x y:a5.y].guidedPanTargetUnscaledRect;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([a6 delegate]) {
    objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanZoomedOutViewScale");
  }
  else {
    [a6 viewScaleForUnscaledRect:1 forPage:v9 v11, v13, v15];
  }
  TSDCenterOfRect();
  v16 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:");
  id v17 = +[TSDContentPathAnimation animation];
  [v17 setContentLocations:[NSArray arrayWithObjects:a3, v16, 0]];
  [v17 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  v18 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v19) = 1.0;
  [v17 setKeyTimes:[NSArray arrayWithObjects:v18, [NSNumber numberWithFloat:v19], nil]];
  [v17 setDuration:0.300000012];
  return v17;
}

- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5
{
  return 2;
}

- (id)guidedPanTargetWithController:(id)a3 location:(id)a4
{
  return +[THGuidedPanPageTarget guidedPanTargetForPageAtLocation:a4 controller:a3];
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
  self->_currentBlendedWeight = a3;
}

- (double)previousBlendedWeight
{
  return self->_previousBlendedWeight;
}

- (void)setPreviousBlendedWeight:(double)a3
{
  self->_previousBlendedWeight = a3;
}

@end