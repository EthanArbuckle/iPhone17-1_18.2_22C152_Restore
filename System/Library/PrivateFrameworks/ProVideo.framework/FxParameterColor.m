@interface FxParameterColor
- (BOOL)hasAlpha;
- (FxParameterColor)init;
- (void)dealloc;
- (void)setHasAlpha:(BOOL)a3;
@end

@implementation FxParameterColor

- (FxParameterColor)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterColor;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_colorPriv = (FxParameterColorPriv *)malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_colorPriv != 0, &cfstr_ColorprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_colorPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterColor;
  [(FxPinParameter *)&v9 dealloc];
}

- (BOOL)hasAlpha
{
  return self->_colorPriv->var0;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_colorPriv->var0 = a3;
}

@end