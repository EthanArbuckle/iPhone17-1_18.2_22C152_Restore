@interface FxParameterSlider
- (BOOL)isLogarithmic;
- (FxParameterSlider)init;
- (double)maxSliderValue;
- (double)maxValue;
- (double)minSliderValue;
- (double)minValue;
- (double)stepValue;
- (void)dealloc;
- (void)setIsLogarithmic:(BOOL)a3;
- (void)setMaxSliderValue:(double)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinSliderValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setStepValue:(double)a3;
@end

@implementation FxParameterSlider

- (FxParameterSlider)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterSlider;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_sliderPriv = (FxParameterSliderPriv *)malloc_type_calloc(1uLL, 0x30uLL, 0x1000040C179455EuLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_sliderPriv != 0, &cfstr_SliderprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_sliderPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterSlider;
  [(FxPinParameter *)&v9 dealloc];
}

- (double)minValue
{
  return self->_sliderPriv->var0;
}

- (void)setMinValue:(double)a3
{
  self->_sliderPriv->var0 = a3;
}

- (double)maxValue
{
  return self->_sliderPriv->var1;
}

- (void)setMaxValue:(double)a3
{
  self->_sliderPriv->var1 = a3;
}

- (double)stepValue
{
  return self->_sliderPriv->var2;
}

- (void)setStepValue:(double)a3
{
  self->_sliderPriv->var2 = a3;
}

- (double)minSliderValue
{
  return self->_sliderPriv->var3;
}

- (void)setMinSliderValue:(double)a3
{
  self->_sliderPriv->var3 = a3;
}

- (double)maxSliderValue
{
  return self->_sliderPriv->var4;
}

- (void)setMaxSliderValue:(double)a3
{
  self->_sliderPriv->var4 = a3;
}

- (BOOL)isLogarithmic
{
  return self->_sliderPriv->var5;
}

- (void)setIsLogarithmic:(BOOL)a3
{
  self->_sliderPriv->var5 = a3;
}

@end