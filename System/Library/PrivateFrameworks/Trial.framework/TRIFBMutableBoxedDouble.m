@interface TRIFBMutableBoxedDouble
- (TRIFBMutableBoxedDouble)init;
- (TRIFBMutableBoxedDouble)initWithVal:(double)a3;
- (const)cppPointer;
- (double)val;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setVal:(double)a3;
@end

@implementation TRIFBMutableBoxedDouble

- (double)val
{
  return self->_ptr->var0;
}

- (void)setVal:(double)a3
{
  if (self && !self->_allowMutation)
  {
    id v4 = [NSString alloc];
    v5 = NSStringFromSelector(a2);
    uint64_t v6 = [v4 initWithFormat:@"%@ mutating method sent to immutable object", v5];

    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInternalInconsistencyException" reason:v6 userInfo:0];
    objc_exception_throw(v7);
  }
  self->_ptr->var0 = a3;
}

- (TRIFBMutableBoxedDouble)init
{
}

- (void)dealloc
{
  if (self->_deleteWhenDone)
  {
    ptr = self->_ptr;
    if (ptr) {
      MEMORY[0x19F3ACBD0](ptr, 0x1000C4000313F17);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBMutableBoxedDouble;
  [(TRIFBMutableBoxedDouble *)&v4 dealloc];
}

- (const)cppPointer
{
  return self->_ptr;
}

- (id)copyWithZone:(_NSZone *)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
}

- (TRIFBMutableBoxedDouble)initWithVal:(double)a3
{
  objc_super v4 = [(TRIFBMutableBoxedDouble *)self init];
  v5 = v4;
  if (v4) {
    [(TRIFBMutableBoxedDouble *)v4 setVal:a3];
  }
  return v5;
}

@end