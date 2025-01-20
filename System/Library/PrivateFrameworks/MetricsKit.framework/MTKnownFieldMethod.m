@interface MTKnownFieldMethod
- (MTKnownFieldMethod)initWithIMP:(void *)a3 accessor:(SEL)a4;
- (SEL)accessor;
- (void)imp;
- (void)setAccessor:(SEL)a3;
- (void)setImp:(void *)a3;
@end

@implementation MTKnownFieldMethod

- (MTKnownFieldMethod)initWithIMP:(void *)a3 accessor:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTKnownFieldMethod;
  v6 = [(MTKnownFieldMethod *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(MTKnownFieldMethod *)v6 setImp:a3];
    [(MTKnownFieldMethod *)v7 setAccessor:a4];
  }
  return v7;
}

- (void)imp
{
  return self->_imp;
}

- (void)setImp:(void *)a3
{
  self->_imp = a3;
}

- (SEL)accessor
{
  return self->_accessor;
}

- (void)setAccessor:(SEL)a3
{
  self->_accessor = a3;
}

@end