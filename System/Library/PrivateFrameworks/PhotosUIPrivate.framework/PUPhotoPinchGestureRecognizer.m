@interface PUPhotoPinchGestureRecognizer
- (BOOL)_touchesNeedUpdate;
- (CGPoint)adjustedInitialCenterInView:(id)a3;
- (CGPoint)adjustedTranslationInView:(id)a3;
- (CGPoint)adjustedTranslationVelocityInView:(id)a3;
- (CGRect)initialPinchRect;
- (PUPhotoPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (PUValueFilter)_rotationFilter;
- (double)adjustedRotationInView:(id)a3;
- (double)adjustedRotationVelocityInView:(id)a3;
- (double)adjustedScaleInView:(id)a3;
- (double)rotationHysteresisDegrees;
- (void)_setRotationFilter:(id)a3;
- (void)_setTouchesNeedUpdate:(BOOL)a3;
- (void)_updateIfNeeded;
- (void)reset;
- (void)setInitialPinchRect:(CGRect)a3;
- (void)setRotationHysteresisDegrees:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PUPhotoPinchGestureRecognizer

- (void).cxx_destruct
{
}

- (void)_setRotationFilter:(id)a3
{
}

- (PUValueFilter)_rotationFilter
{
  return self->__rotationFilter;
}

- (void)_setTouchesNeedUpdate:(BOOL)a3
{
  self->__touchesNeedUpdate = a3;
}

- (BOOL)_touchesNeedUpdate
{
  return self->__touchesNeedUpdate;
}

- (CGRect)initialPinchRect
{
  double x = self->_initialPinchRect.origin.x;
  double y = self->_initialPinchRect.origin.y;
  double width = self->_initialPinchRect.size.width;
  double height = self->_initialPinchRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRotationHysteresisDegrees:(double)a3
{
  self->_rotationHysteresisDegrees = a3;
}

- (double)rotationHysteresisDegrees
{
  return self->_rotationHysteresisDegrees;
}

- (void)_updateIfNeeded
{
  if ([(PUPhotoPinchGestureRecognizer *)self _touchesNeedUpdate]
    && (unint64_t)[(PUPhotoPinchGestureRecognizer *)self numberOfTouches] >= 2)
  {
    [(PUPhotoPinchGestureRecognizer *)self _setTouchesNeedUpdate:0];
    uint64_t v3 = 0;
    char v4 = 1;
    do
    {
      char v5 = v4;
      v6 = &self->_latestTouchLocations[v3];
      [(PUPhotoPinchGestureRecognizer *)self locationOfTouch:v3 inView:0];
      v6->CGFloat x = v7;
      v6->CGFloat y = v8;
      if (!self->_initialTouchLocationsSet) {
        self->_initialTouchLocations[v3] = *v6;
      }
      char v4 = 0;
      uint64_t v3 = 1;
    }
    while ((v5 & 1) != 0);
    if (!self->_initialTouchLocationsSet)
    {
      [(PUPhotoPinchGestureRecognizer *)self initialPinchRect];
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
      if (!CGRectIsEmpty(v13)) {
        AdjustPointsWithinRect(self->_initialTouchLocations, &self->_initialTouchLocations[1], x, y, width, height);
      }
      self->_initialTouchLocationsSet = 1;
    }
  }
}

- (double)adjustedRotationVelocityInView:(id)a3
{
  return 0.0;
}

- (CGPoint)adjustedTranslationVelocityInView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (double)adjustedScaleInView:(id)a3
{
  [(PUPhotoPinchGestureRecognizer *)self _updateIfNeeded];
  if (!self->_initialTouchLocationsSet) {
    return 0.0;
  }
  UIDistanceBetweenPoints();
  double v5 = v4;
  UIDistanceBetweenPoints();
  return v6 / v5;
}

- (double)adjustedRotationInView:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  [(PUPhotoPinchGestureRecognizer *)self _updateIfNeeded];
  if (!self->_initialTouchLocationsSet) {
    return 0.0;
  }
  double v4 = atan2(self->_initialTouchLocations[1].y - self->_initialTouchLocations[0].y, self->_initialTouchLocations[1].x - self->_initialTouchLocations[0].x);
  double v5 = atan2(self->_latestTouchLocations[1].y - self->_latestTouchLocations[0].y, self->_latestTouchLocations[1].x - self->_latestTouchLocations[0].x)- v4;
  double v6 = [(PUPhotoPinchGestureRecognizer *)self _rotationFilter];
  if (!v6)
  {
    CGFloat v7 = objc_alloc_init(PUAngleValueFilter);
    CGFloat v8 = objc_alloc_init(PUInitialHysteresisValueFilter);
    [(PUPhotoPinchGestureRecognizer *)self rotationHysteresisDegrees];
    [(PUInitialHysteresisValueFilter *)v8 setThresholdValue:v9 / 180.0 * 3.14159265];
    double v6 = objc_alloc_init(PUGroupValueFilter);
    v14[0] = v7;
    v14[1] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [(PUGroupValueFilter *)v6 setFilters:v10];

    [(PUPhotoPinchGestureRecognizer *)self _setRotationFilter:v6];
  }
  [(PUGroupValueFilter *)v6 setInputValue:v5];
  [(PUGroupValueFilter *)v6 outputValue];
  double v12 = v11;

  return v12;
}

- (CGPoint)adjustedTranslationInView:(id)a3
{
  id v4 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _updateIfNeeded];
  if (self->_initialTouchLocationsSet)
  {
    UIMidPointBetweenPoints();
    double v6 = v5;
    double v8 = v7;
    UIMidPointBetweenPoints();
    double v10 = v9;
    double v12 = v11;
    if (v4)
    {
      objc_msgSend(v4, "convertPoint:fromView:", 0, v6, v8);
      double v6 = v13;
      double v8 = v14;
      objc_msgSend(v4, "convertPoint:fromView:", 0, v10, v12);
      double v10 = v15;
      double v12 = v16;
    }
    double v17 = v10 - v6;
    double v18 = v12 - v8;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v19 = v17;
  double v20 = v18;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (CGPoint)adjustedInitialCenterInView:(id)a3
{
  id v4 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _updateIfNeeded];
  if (self->_initialTouchLocationsSet)
  {
    UIMidPointBetweenPoints();
    double v7 = v5;
    double v8 = v6;
    if (v4)
    {
      objc_msgSend(v4, "convertPoint:fromView:", 0, v5, v6);
      double v7 = v9;
      double v8 = v10;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v11 = v7;
  double v12 = v8;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)setInitialPinchRect:(CGRect)a3
{
  p_initialPinchRect = &self->_initialPinchRect;
  self->_initialPinchRect = a3;
  if (self->_initialTouchLocationsSet)
  {
    double v5 = [(PUPhotoPinchGestureRecognizer *)self view];
    objc_msgSend(v5, "convertRect:toView:", 0, p_initialPinchRect->origin.x, p_initialPinchRect->origin.y, p_initialPinchRect->size.width, p_initialPinchRect->size.height);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v15.origin.CGFloat x = v7;
    v15.origin.CGFloat y = v9;
    v15.size.CGFloat width = v11;
    v15.size.CGFloat height = v13;
    if (!CGRectIsEmpty(v15))
    {
      AdjustPointsWithinRect(self->_initialTouchLocations, &self->_initialTouchLocations[1], v7, v9, v11, v13);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _setTouchesNeedUpdate:1];
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  [(PUPhotoPinchGestureRecognizer *)&v8 touchesCancelled:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _setTouchesNeedUpdate:1];
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  [(PUPhotoPinchGestureRecognizer *)&v8 touchesEnded:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _setTouchesNeedUpdate:1];
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  [(PUPhotoPinchGestureRecognizer *)&v8 touchesMoved:v7 withEvent:v6];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPhotoPinchGestureRecognizer *)self _setTouchesNeedUpdate:1];
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  [(PUPhotoPinchGestureRecognizer *)&v8 touchesBegan:v7 withEvent:v6];

  [(PUPhotoPinchGestureRecognizer *)self _updateIfNeeded];
}

- (void)reset
{
  self->_initialTouchLocationsSet = 0;
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_initialPinchRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_initialPinchRect.size = v3;
  [(PUPhotoPinchGestureRecognizer *)self _setRotationFilter:0];
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPinchGestureRecognizer;
  [(PUPhotoPinchGestureRecognizer *)&v4 reset];
}

- (PUPhotoPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPinchGestureRecognizer;
  objc_super v4 = [(PUPhotoPinchGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  double v5 = v4;
  if (v4) {
    [(PUPhotoPinchGestureRecognizer *)v4 setRotationHysteresisDegrees:5.0];
  }
  return v5;
}

@end