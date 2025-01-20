@interface FxPin
- (Class)valueClass;
- (FxPin)init;
- (id)description;
- (id)displayName;
- (id)parentPlug;
- (id)properties;
- (id)stream;
- (id)uuid;
- (int)direction;
- (int)index;
- (void)dealloc;
- (void)setDescription:(id)a3;
- (void)setDirection:(int)a3;
- (void)setDisplayName:(id)a3;
- (void)setParentPlug:(id)a3;
- (void)setUUID:(id)a3;
- (void)setValueClass:(Class)a3;
@end

@implementation FxPin

- (FxPin)init
{
  v5.receiver = self;
  v5.super_class = (Class)FxPin;
  v2 = [(FxPin *)&v5 init];
  if (v2)
  {
    v3 = (FxPinPriv *)malloc_type_calloc(1uLL, 0x40uLL, 0x10800409C3078A8uLL);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->var1 = (id)[MEMORY[0x1E4F1CA60] dictionary];
      v2->_priv->var7 = (Class)objc_opt_class();
    }
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v15.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    id var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    id var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    id var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    id var4 = priv->var4;
    if (var4)
    {

      priv = self->_priv;
    }
    id var5 = priv->var5;
    if (var5)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v15.receiver = self;
  v15.super_class = (Class)FxPin;
  [(FxPin *)&v15 dealloc];
}

- (int)index
{
  if (![(FxPin *)self direction])
  {
    uint64_t v3 = objc_msgSend(-[FxPin parentPlug](self, "parentPlug"), "inputPins");
    return [v3 indexOfObject:self];
  }
  if ([(FxPin *)self direction] == 1)
  {
    uint64_t v3 = objc_msgSend(-[FxPin parentPlug](self, "parentPlug"), "outputPins");
    return [v3 indexOfObject:self];
  }
  return -1;
}

- (id)properties
{
  return self->_priv->var1;
}

- (id)parentPlug
{
  return self->_priv->var0;
}

- (void)setParentPlug:(id)a3
{
  id var0 = self->_priv->var0;
  if (var0) {

  }
  self->_priv->id var0 = a3;
}

- (id)stream
{
  id result = self->_priv->var2;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(FxStream);
    [(FxStream *)v4 setPin:self];
    id result = v4;
    self->_priv->id var2 = result;
  }
  return result;
}

- (id)uuid
{
  return self->_priv->var3;
}

- (void)setUUID:(id)a3
{
  id var3 = self->_priv->var3;
  if (var3) {

  }
  self->_priv->id var3 = a3;
}

- (id)displayName
{
  return self->_priv->var4;
}

- (void)setDisplayName:(id)a3
{
  id var4 = self->_priv->var4;
  if (var4) {

  }
  self->_priv->id var4 = a3;
}

- (id)description
{
  return self->_priv->var5;
}

- (void)setDescription:(id)a3
{
  id var5 = self->_priv->var5;
  if (var5) {

  }
  self->_priv->id var5 = a3;
}

- (int)direction
{
  return self->_priv->var6;
}

- (void)setDirection:(int)a3
{
  self->_priv->var6 = a3;
}

- (Class)valueClass
{
  return self->_priv->var7;
}

- (void)setValueClass:(Class)a3
{
  self->_priv->var7 = a3;
}

@end