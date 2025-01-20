@interface TRIFBMutableBoxedBool
- (BOOL)val;
- (TRIFBMutableBoxedBool)init;
- (TRIFBMutableBoxedBool)initWithVal:(BOOL)a3;
- (const)cppPointer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setVal:(BOOL)a3;
@end

@implementation TRIFBMutableBoxedBool

- (BOOL)val
{
  return self->_ptr->var0 != 0;
}

- (void)setVal:(BOOL)a3
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

- (TRIFBMutableBoxedBool)init
{
}

- (void)dealloc
{
  if (self->_deleteWhenDone)
  {
    ptr = self->_ptr;
    if (ptr) {
      MEMORY[0x19F3ACBD0](ptr, 0x1000C4077774924);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBMutableBoxedBool;
  [(TRIFBMutableBoxedBool *)&v4 dealloc];
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

- (TRIFBMutableBoxedBool)initWithVal:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(TRIFBMutableBoxedBool *)self init];
  v5 = v4;
  if (v4) {
    [(TRIFBMutableBoxedBool *)v4 setVal:v3];
  }
  return v5;
}

@end