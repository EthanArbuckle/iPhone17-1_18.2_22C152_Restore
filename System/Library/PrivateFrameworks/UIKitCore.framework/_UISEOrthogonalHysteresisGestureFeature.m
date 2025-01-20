@interface _UISEOrthogonalHysteresisGestureFeature
- (_UISEOrthogonalHysteresisGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEOrthogonalHysteresisGestureFeature

- (_UISEOrthogonalHysteresisGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UISEOrthogonalHysteresisGestureFeature;
  v6 = [(_UISEOrthogonalHysteresisGestureFeature *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    objc_storeWeak((id *)&v7->_provider, a4);
    v7->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    v7->_initialTimestamp = NAN;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  [(_UISEGestureFeatureSettings *)self->_settings hysteresis];
  if (a3->var0 != 1)
  {
    if (!a3->var0)
    {
      self->_initialLocation = a3->var5;
      self->_initialTimestamp = a3->var6;
    }
    return;
  }
  double v6 = v5;
  if (v5 > 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v8 = [WeakRetained touchedEdges];

    if (((~(_BYTE)v8 & 3) == 0) | (2 * ((~(_BYTE)v8 & 9) == 0)) | (4 * ((~(_BYTE)v8 & 6) == 0)) | (8 * ((~(_BYTE)v8 & 0xC) == 0)))
    {
      float64x2_t v9 = vsubq_f64((float64x2_t)self->_initialLocation, (float64x2_t)a3->var5);
      if (sqrt(vaddvq_f64(vmulq_f64(v9, v9))) <= v6)
      {
        [(_UISEGestureFeatureSettings *)self->_settings cornerAngleWindow];
        double v11 = v10;
        double v12 = 0.0;
LABEL_21:
        [(_UISEGestureFeatureSettings *)self->_settings hysteresis];
        long double v22 = fmin(v21, 10.0) / tan(v11 * -0.5 + 1.57079633);
        double v23 = a3->var6 - self->_initialTimestamp;
        [(_UISEGestureFeatureSettings *)self->_settings edgeAngleWindowDecayTime];
        if (v12 <= fmax(v22 * (1.0 - v23 * (1.0 / v24)), 20.0)) {
          return;
        }
        v16 = self;
        uint64_t v17 = 2;
        goto LABEL_14;
      }
    }
    else
    {
      if ((v8 & 0xA) != 0)
      {
        p_y = (CGPoint *)&self->_initialLocation.y;
        double v14 = vabdd_f64(a3->var5.x, self->_initialLocation.x);
        p_var5 = (CGPoint *)&a3->var5.y;
      }
      else
      {
        p_var5 = &a3->var5;
        p_y = &self->_initialLocation;
        double v14 = vabdd_f64(a3->var5.y, self->_initialLocation.y);
      }
      if (v14 <= v6)
      {
        double v12 = vabdd_f64(p_var5->x, p_y->x);
        unint64_t v18 = [(_UISEGestureFeatureSettings *)self->_settings interfaceBottomEdge];
        settings = self->_settings;
        if (v8 == v18) {
          [(_UISEGestureFeatureSettings *)settings bottomEdgeAngleWindow];
        }
        else {
          [(_UISEGestureFeatureSettings *)settings edgeAngleWindow];
        }
        double v11 = v20;
        goto LABEL_21;
      }
    }
  }
  v16 = self;
  uint64_t v17 = 1;
LABEL_14:
  [(_UISEGestureFeature *)v16 _setState:v17];
}

@end