@interface VFXBtShapeWrapper
- (VFXBtShapeWrapper)initWithShape:(btCollisionShape *)a3;
- (btCollisionShape)btShape;
- (void)dealloc;
@end

@implementation VFXBtShapeWrapper

- (VFXBtShapeWrapper)initWithShape:(btCollisionShape *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VFXBtShapeWrapper;
  result = [(VFXBtShapeWrapper *)&v5 init];
  if (result) {
    result->_collisionShape = a3;
  }
  return result;
}

- (void)dealloc
{
  sub_1B6552410((uint64_t)self->_collisionShape);
  v3.receiver = self;
  v3.super_class = (Class)VFXBtShapeWrapper;
  [(VFXBtShapeWrapper *)&v3 dealloc];
}

- (btCollisionShape)btShape
{
  return self->_collisionShape;
}

@end