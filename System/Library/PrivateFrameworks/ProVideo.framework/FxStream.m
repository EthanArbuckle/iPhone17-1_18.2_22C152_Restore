@interface FxStream
- (FxStream)init;
- (id)createSampleAtTime:(double)a3;
- (id)pin;
- (id)provider;
- (void)dealloc;
- (void)setPin:(id)a3;
@end

@implementation FxStream

- (FxStream)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxStream;
  v2 = [(FxStream *)&v4 init];
  if (v2) {
    v2->_priv = (FxStreamPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxStream;
  [(FxStream *)&v10 dealloc];
}

- (id)pin
{
  return self->_priv->var0;
}

- (void)setPin:(id)a3
{
  id var0 = self->_priv->var0;
  if (var0 != a3)
  {
    if (var0) {

    }
    self->_priv->id var0 = a3;
  }
}

- (id)provider
{
  id v2 = [(FxStream *)self pin];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  int v4 = [v2 direction];
  if (v4 != 1)
  {
    if (!v4)
    {
      v12 = (void *)[v3 parentPlug];
      return (id)[v12 host];
    }
    FxDebugLog(&cfstr_IllegalPinDire.isa, v5, v6, v7, v8, v9, v10, v11, v4);
    return 0;
  }

  return (id)[v3 parentPlug];
}

- (id)createSampleAtTime:(double)a3
{
  uint64_t v5 = objc_alloc_init(FxSample);
  [(FxSample *)v5 setStream:self];
  [(FxSample *)v5 setTime:a3];
  return v5;
}

@end