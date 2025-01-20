@interface _UISEDiagonalHysteresisRecognizeGestureFeature
- (_UISEDiagonalHysteresisRecognizeGestureFeature)initWithSettings:(id)a3;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEDiagonalHysteresisRecognizeGestureFeature

- (void).cxx_destruct
{
}

- (_UISEDiagonalHysteresisRecognizeGestureFeature)initWithSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISEDiagonalHysteresisRecognizeGestureFeature;
  v4 = [(_UISEDiagonalHysteresisRecognizeGestureFeature *)&v7 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_settings, a3);
    v5->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v5;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  [(_UISEGestureFeatureSettings *)self->_settings hysteresis];
  if (a3->var0 == 1)
  {
    if (v5 <= 0.0
      || (float64x2_t v6 = vsubq_f64((float64x2_t)self->_initialLocation, (float64x2_t)a3->var5),
          sqrt(vaddvq_f64(vmulq_f64(v6, v6))) > v5))
    {
      [(_UISEGestureFeature *)self _setState:1];
    }
  }
  else if (!a3->var0)
  {
    self->_initialLocation = a3->var5;
  }
}

@end