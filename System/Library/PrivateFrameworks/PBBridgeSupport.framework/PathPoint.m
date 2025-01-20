@interface PathPoint
- (PathPoint)initWithP:(PathPoint *)self n:(SEL)a2 r:(float)a3 l:(float)a4;
- (double)n;
- (double)p;
- (float)l;
- (float)r;
- (void)setL:(float)a3;
- (void)setN:(PathPoint *)self;
- (void)setP:(PathPoint *)self;
- (void)setR:(float)a3;
@end

@implementation PathPoint

- (PathPoint)initWithP:(PathPoint *)self n:(SEL)a2 r:(float)a3 l:(float)a4
{
  float v6 = v5;
  float v7 = v4;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PathPoint;
  result = [(PathPoint *)&v11 init];
  if (result)
  {
    *(void *)result->_p = v9;
    *(void *)result->_n = v8;
    result->_r = v7;
    result->_l = v6;
  }
  return result;
}

- (double)p
{
  return *(double *)(a1 + 8);
}

- (void)setP:(PathPoint *)self
{
  *(void *)self->_p = v2;
}

- (double)n
{
  return *(double *)(a1 + 16);
}

- (void)setN:(PathPoint *)self
{
  *(void *)self->_n = v2;
}

- (float)r
{
  return self->_r;
}

- (void)setR:(float)a3
{
  self->_r = a3;
}

- (float)l
{
  return self->_l;
}

- (void)setL:(float)a3
{
  self->_l = a3;
}

@end