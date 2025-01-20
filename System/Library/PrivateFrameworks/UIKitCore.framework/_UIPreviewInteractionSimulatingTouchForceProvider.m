@interface _UIPreviewInteractionSimulatingTouchForceProvider
- (BOOL)isActive;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (_UIPreviewInteractionSimulatingTouchForceProvider)initWithTouchForce:(double)a3 location:(CGPoint)a4 coordinateSpace:(id)a5;
- (double)touchForce;
- (void)cancelInteraction;
- (void)setActive:(BOOL)a3;
@end

@implementation _UIPreviewInteractionSimulatingTouchForceProvider

- (_UIPreviewInteractionSimulatingTouchForceProvider)initWithTouchForce:(double)a3 location:(CGPoint)a4 coordinateSpace:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UIPreviewInteractionSimulatingTouchForceProvider;
  v10 = [(_UIPreviewInteractionSimulatingTouchForceProvider *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_active = 1;
    v10->_targetTouchForce = a3;
    v10->_location.CGFloat x = x;
    v10->_location.CGFloat y = y;
    objc_storeWeak((id *)&v10->_coordinateSpace, v9);
    v12 = v11;
  }

  return v11;
}

- (double)touchForce
{
  return self->_targetTouchForce;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  p_coordinateSpace = &self->_coordinateSpace;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v5, self->_location.x, self->_location.y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)cancelInteraction
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end