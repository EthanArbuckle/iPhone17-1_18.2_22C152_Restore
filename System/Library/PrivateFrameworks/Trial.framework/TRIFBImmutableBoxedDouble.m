@interface TRIFBImmutableBoxedDouble
- (TRIFBImmutableBoxedDouble)initWithBufRef:(id)a3 rawPointer:(const void *)a4;
- (const)cppPointer;
- (double)val;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)initWithBufRef:(uint64_t)a3 cppPointer:;
@end

@implementation TRIFBImmutableBoxedDouble

- (void)initWithBufRef:(uint64_t)a3 cppPointer:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TRIFBImmutableBoxedDouble;
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

- (TRIFBImmutableBoxedDouble)initWithBufRef:(id)a3 rawPointer:(const void *)a4
{
  return (TRIFBImmutableBoxedDouble *)-[TRIFBImmutableBoxedDouble initWithBufRef:cppPointer:](self, a3, (uint64_t)a4);
}

- (const)cppPointer
{
  return self->_ptr;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
}

- (double)val
{
  return self->_ptr->var0;
}

- (void).cxx_destruct
{
}

@end