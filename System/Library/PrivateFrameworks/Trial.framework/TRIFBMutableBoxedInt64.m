@interface TRIFBMutableBoxedInt64
- (TRIFBMutableBoxedInt64)init;
- (TRIFBMutableBoxedInt64)initWithVal:(int64_t)a3;
- (const)cppPointer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)val;
- (void)dealloc;
- (void)setVal:(int64_t)a3;
@end

@implementation TRIFBMutableBoxedInt64

- (int64_t)val
{
  return self->_ptr->var0;
}

- (void)setVal:(int64_t)a3
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

- (TRIFBMutableBoxedInt64)init
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
  v4.super_class = (Class)TRIFBMutableBoxedInt64;
  [(TRIFBMutableBoxedInt64 *)&v4 dealloc];
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

- (TRIFBMutableBoxedInt64)initWithVal:(int64_t)a3
{
  objc_super v4 = [(TRIFBMutableBoxedInt64 *)self init];
  v5 = v4;
  if (v4) {
    [(TRIFBMutableBoxedInt64 *)v4 setVal:a3];
  }
  return v5;
}

@end