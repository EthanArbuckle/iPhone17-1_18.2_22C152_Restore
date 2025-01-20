@interface _UIGravityWellEffectBody
- (CAPoint3D)positionInPrimaryContainer;
- (UITargetedPreview)preview;
- (UIView)anchorView;
- (_UIMorphingPlatterView)effectView;
- (double)distanceFromPrimaryBody;
- (id)description;
- (void)setAnchorView:(id)a3;
- (void)setDistanceFromPrimaryBody:(double)a3;
- (void)setEffectView:(id)a3;
- (void)setPositionInPrimaryContainer:(CAPoint3D)a3;
- (void)setPreview:(id)a3;
@end

@implementation _UIGravityWellEffectBody

- (id)description
{
  v3 = NSString;
  [(_UIGravityWellEffectBody *)self distanceFromPrimaryBody];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<_UIGravityWellEffectBody: %p; distanceFromPrimaryBody: %.2f>",
               self,
               v4);
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (_UIMorphingPlatterView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
}

- (CAPoint3D)positionInPrimaryContainer
{
  double x = self->_positionInPrimaryContainer.x;
  double y = self->_positionInPrimaryContainer.y;
  double z = self->_positionInPrimaryContainer.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPositionInPrimaryContainer:(CAPoint3D)a3
{
  self->_positionInPrimaryContainer = a3;
}

- (double)distanceFromPrimaryBody
{
  return self->_distanceFromPrimaryBody;
}

- (void)setDistanceFromPrimaryBody:(double)a3
{
  self->_distanceFromPrimaryBoddouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end