@interface UIPointerRegionRequest
- (BOOL)_isPencilInitiated;
- (CGPoint)location;
- (UIKeyModifierFlags)modifiers;
- (id)description;
- (int64_t)_pointerType;
- (void)setLocation:(CGPoint)a3;
- (void)setModifiers:(int64_t)a3;
- (void)set_pointerType:(int64_t)a3;
@end

@implementation UIPointerRegionRequest

- (BOOL)_isPencilInitiated
{
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIPointerInteraction.m" lineNumber:713 description:@"This may only be used in Springboard!"];
  }
  return [(UIPointerRegionRequest *)self _pointerType] == 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(UIPointerRegionRequest *)self location];
  v5 = NSStringFromCGPoint(v9);
  v6 = [v3 stringWithFormat:@"<%@: %p location = %@>", v4, self, v5];;

  return v6;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (UIKeyModifierFlags)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(int64_t)a3
{
  self->_modifiers = a3;
}

- (int64_t)_pointerType
{
  return self->__pointerType;
}

- (void)set_pointerType:(int64_t)a3
{
  self->__pointerType = a3;
}

@end