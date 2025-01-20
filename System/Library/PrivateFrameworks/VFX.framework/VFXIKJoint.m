@interface VFXIKJoint
- (VFXNode)joint;
- (float)maxAllowedRotationAngle;
- (void)setJoint:(id)a3;
- (void)setMaxAllowedRotationAngle:(float)a3;
@end

@implementation VFXIKJoint

- (VFXNode)joint
{
  return self->joint;
}

- (void)setJoint:(id)a3
{
  self->joint = (VFXNode *)a3;
}

- (float)maxAllowedRotationAngle
{
  return self->maxAllowedRotationAngle;
}

- (void)setMaxAllowedRotationAngle:(float)a3
{
  self->maxAllowedRotationAngle = a3;
}

@end