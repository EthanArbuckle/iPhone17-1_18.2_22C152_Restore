@interface FxParameterText
- (BOOL)allowsReturns;
- (FxParameterText)init;
- (void)dealloc;
- (void)setAllowsReturns:(BOOL)a3;
@end

@implementation FxParameterText

- (FxParameterText)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterText;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_textPriv = (FxParameterTextPriv *)malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  free(self->_textPriv);
  v3.receiver = self;
  v3.super_class = (Class)FxParameterText;
  [(FxPinParameter *)&v3 dealloc];
}

- (BOOL)allowsReturns
{
  return self->_textPriv->var0;
}

- (void)setAllowsReturns:(BOOL)a3
{
  self->_textPriv->var0 = a3;
}

@end