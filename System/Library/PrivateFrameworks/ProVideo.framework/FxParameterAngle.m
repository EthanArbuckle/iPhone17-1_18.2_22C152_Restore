@interface FxParameterAngle
- (BOOL)isClockwise;
- (FxParameterAngle)init;
- (double)startValue;
- (double)stepValue;
- (void)dealloc;
- (void)setIsClockwise:(BOOL)a3;
- (void)setStartValue:(double)a3;
- (void)setStepValue:(double)a3;
@end

@implementation FxParameterAngle

- (FxParameterAngle)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterAngle;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_anglePriv = (FxParameterAnglePriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000406CB41D2EuLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_anglePriv != 0, &cfstr_AngleprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_anglePriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterAngle;
  [(FxPinParameter *)&v9 dealloc];
}

- (double)startValue
{
  return self->_anglePriv->var1;
}

- (void)setStartValue:(double)a3
{
  self->_anglePriv->var1 = a3;
}

- (double)stepValue
{
  return self->_anglePriv->var2;
}

- (void)setStepValue:(double)a3
{
  self->_anglePriv->var2 = a3;
}

- (BOOL)isClockwise
{
  return self->_anglePriv->var0;
}

- (void)setIsClockwise:(BOOL)a3
{
  self->_anglePriv->var0 = a3;
}

@end