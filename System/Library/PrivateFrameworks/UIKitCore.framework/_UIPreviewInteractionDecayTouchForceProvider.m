@interface _UIPreviewInteractionDecayTouchForceProvider
- (BOOL)isActive;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (_UIPreviewInteractionDecayTouchForceProvider)initWithTouchForceProvider:(id)a3;
- (double)touchForce;
- (void)cancelInteraction;
- (void)setActive:(BOOL)a3;
@end

@implementation _UIPreviewInteractionDecayTouchForceProvider

- (_UIPreviewInteractionDecayTouchForceProvider)initWithTouchForceProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIPreviewInteractionDecayTouchForceProvider.m", 34, @"Invalid parameter not satisfying: %@", @"touchForceProvider" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_UIPreviewInteractionDecayTouchForceProvider;
  v7 = [(_UIPreviewInteractionDecayTouchForceProvider *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->_active = 1;
    objc_storeStrong((id *)&v7->_touchForceProvider, a3);
    [v6 touchForce];
    v8->_initialTouchForce = v9;
    v10 = +[UIScreen mainScreen];
    uint64_t v11 = [v10 fixedCoordinateSpace];
    coordinateSpace = v8->_coordinateSpace;
    v8->_coordinateSpace = (UICoordinateSpace *)v11;

    [v6 locationInCoordinateSpace:v8->_coordinateSpace];
    v8->_location.x = v13;
    v8->_location.y = v14;
    v15 = v8;
  }

  return v8;
}

- (double)touchForce
{
  return 0.0;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  -[UICoordinateSpace convertPoint:toCoordinateSpace:](self->_coordinateSpace, "convertPoint:toCoordinateSpace:", a3, self->_location.x, self->_location.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)cancelInteraction
{
  [(_UIPreviewInteractionDecayTouchForceProvider *)self setActive:0];
  touchForceProvider = self->_touchForceProvider;
  [(_UIPreviewInteractionTouchForceProviding *)touchForceProvider cancelInteraction];
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
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_touchForceProvider, 0);
}

@end