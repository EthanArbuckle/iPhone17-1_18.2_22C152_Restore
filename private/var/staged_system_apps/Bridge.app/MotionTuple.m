@interface MotionTuple
+ (id)motionWithX:(float)a3 andY:(float)a4 andZ:(float)a5;
- (float)x;
- (float)y;
- (float)z;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
@end

@implementation MotionTuple

+ (id)motionWithX:(float)a3 andY:(float)a4 andZ:(float)a5
{
  v8 = objc_alloc_init(MotionTuple);
  *(float *)&double v9 = a3;
  [(MotionTuple *)v8 setX:v9];
  *(float *)&double v10 = a4;
  [(MotionTuple *)v8 setY:v10];
  *(float *)&double v11 = a5;
  [(MotionTuple *)v8 setZ:v11];

  return v8;
}

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (float)z
{
  return self->_z;
}

- (void)setZ:(float)a3
{
  self->_z = a3;
}

@end