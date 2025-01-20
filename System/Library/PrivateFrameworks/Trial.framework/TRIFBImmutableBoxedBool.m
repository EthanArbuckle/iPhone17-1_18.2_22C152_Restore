@interface TRIFBImmutableBoxedBool
- (BOOL)val;
- (TRIFBImmutableBoxedBool)initWithBufRef:(id)a3 rawPointer:(const void *)a4;
- (const)cppPointer;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)initWithBufRef:(uint64_t)a3 cppPointer:;
@end

@implementation TRIFBImmutableBoxedBool

- (void)initWithBufRef:(uint64_t)a3 cppPointer:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TRIFBImmutableBoxedBool;
    id v7 = objc_msgSendSuper2(&v9, sel_init_);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
    }
  }

  return a1;
}

- (TRIFBImmutableBoxedBool)initWithBufRef:(id)a3 rawPointer:(const void *)a4
{
  return (TRIFBImmutableBoxedBool *)-[TRIFBImmutableBoxedBool initWithBufRef:cppPointer:](self, a3, (uint64_t)a4);
}

- (const)cppPointer
{
  return self->_ptr;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
}

- (BOOL)val
{
  return self->_ptr->var0 != 0;
}

- (void).cxx_destruct
{
}

@end