@interface VFXManipulatorNodeTransformPair
- (VFXNode)node;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (void)setNode:(id)a3;
@end

@implementation VFXManipulatorNodeTransformPair

- (VFXNode)node
{
  return self->node;
}

- (void)setNode:(id)a3
{
}

- (__n128)transform
{
  return a1[1];
}

- (__n128)setTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

@end