@interface _UISETeleportFailGestureFeature
- (_UISETeleportFailGestureFeature)init;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISETeleportFailGestureFeature

- (_UISETeleportFailGestureFeature)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISETeleportFailGestureFeature;
  result = [(_UISETeleportFailGestureFeature *)&v3 init];
  if (result) {
    result->_lastLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return result;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (a3->var0 == 1)
  {
    float64x2_t v5 = vsubq_f64((float64x2_t)self->_lastLocation, (float64x2_t)a3->var5);
    if (sqrt(vaddvq_f64(vmulq_f64(v5, v5))) > 100.0) {
      [(_UISEGestureFeature *)self _setState:2];
    }
  }
  else if (a3->var0)
  {
    return;
  }
  self->_lastLocation = a3->var5;
}

@end