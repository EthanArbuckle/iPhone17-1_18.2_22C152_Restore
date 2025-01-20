@interface FxPlugGroup
+ (id)fxPlugGroupWithDescriptor:(id)a3;
- (FxPlugGroup)initWithDescriptor:(id)a3;
- (id)descriptor;
- (id)fxPlugDescriptorAtIndex:(int)a3;
- (unsigned)count;
- (void)addFxPlugDescriptor:(id)a3;
- (void)dealloc;
@end

@implementation FxPlugGroup

- (FxPlugGroup)initWithDescriptor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FxPlugGroup;
  v4 = [(FxPlugGroup *)&v7 init];
  if (v4)
  {
    v5 = (FxPlugGroupPriv *)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
    v4->_priv = v5;
    if (v5)
    {
      v4->_priv->var1 = a3;
      v4->_priv->var0 = (id)[MEMORY[0x1E4F1CA48] array];
    }
  }
  return v4;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v11.receiver);
  priv = self->_priv;
  if (priv)
  {
    id var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    if (priv->var0)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v11.receiver = self;
  v11.super_class = (Class)FxPlugGroup;
  [(FxPlugGroup *)&v11 dealloc];
}

+ (id)fxPlugGroupWithDescriptor:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDescriptor:a3];

  return v3;
}

- (id)descriptor
{
  return self->_priv->var1;
}

- (void)addFxPlugDescriptor:(id)a3
{
}

- (id)fxPlugDescriptorAtIndex:(int)a3
{
  return (id)[self->_priv->var0 objectAtIndex:a3];
}

- (unsigned)count
{
  return [self->_priv->var0 count];
}

@end