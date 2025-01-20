@interface NUNIAstronomyRotationModel
- (BOOL)isAtHomeCoordinate;
- (BOOL)isPulling;
- (NUNIAstronomyRotationModel)init;
- (NUNIAstronomyRotationModelObserver)observer;
- (NUNIRotatable)rotatable;
- (const)interactionSettings;
- (void)_handleDisplayLink;
- (void)_update;
- (void)dealloc;
- (void)push:(NUNIAstronomyRotationModel *)self;
- (void)setObserver:(id)a3;
- (void)setPulling:(BOOL)a3;
- (void)setRotatable:(id)a3;
- (void)stop;
@end

@implementation NUNIAstronomyRotationModel

- (NUNIAstronomyRotationModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyRotationModel;
  v2 = [(NUNIAstronomyRotationModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_interactionSettings = (const NUNIAstronomyInteractionSettings *)&init_defaults;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(NUNIAstronomyRotationModel *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)NUNIAstronomyRotationModel;
  [(NUNIAstronomyRotationModel *)&v3 dealloc];
}

- (BOOL)isAtHomeCoordinate
{
  p_rotatable = &self->_rotatable;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  [WeakRetained homeCoordinate];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_loadWeakRetained((id *)p_rotatable);
  [v8 centerCoordinate];
  double v10 = v9;
  double v12 = v11;

  float v13 = v5;
  float v14 = v10;
  if (vabds_f32(v13, v14) >= 0.001) {
    return 0;
  }
  float v15 = v7;
  float v16 = v12;
  return vabds_f32(v15, v16) < 0.001;
}

- (void)stop
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_state = 0;
  *(void *)self->_accumulatedPushVector = 0;
  *(void *)&self->_effectivePushDeceleration = 0;
  double v4 = (void *)MEMORY[0x263F8C6D0];
  [v4 cancelPreviousPerformRequestsWithTarget:self];
}

- (void)_handleDisplayLink
{
}

- (void)_update
{
  CFTimeInterval v3 = CACurrentMediaTime();
  float v4 = v3 - self->_previousDisplayLinkCallbackTime;
  self->_previousDisplayLinkCallbackTime = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  [WeakRetained centerCoordinate];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(NUNIAstronomyRotationModel *)self interactionSettings];
  double v11 = v10;
  float var1 = v10[1].var1;
  if (var1 == 0.0)
  {
    float var0 = v10[1].var0;
LABEL_9:
    self->_effectivePushDeceleration = var0;
    goto LABEL_10;
  }
  float v14 = v3 - self->_pushStartTime;
  if (var1 >= v14) {
    float v15 = v3 - self->_pushStartTime;
  }
  else {
    float v15 = v10[1].var1;
  }
  float var0 = self->_effectivePushDeceleration;
  float v16 = v10[1].var0;
  if (var0 > v16 && v15 > 0.001)
  {
    float var0 = 1.0 - powf(1.0 - v16, var1 / v15);
    goto LABEL_9;
  }
LABEL_10:
  float32x2_t v17 = vmul_n_f32(*(float32x2_t *)self->_accumulatedPushVector, var0);
  *(float32x2_t *)self->_accumulatedPushVector = v17;
  double v18 = v7 + vmuls_lane_f32(v4, v17, 1);
  double v19 = v9 + (float)(v4 * v17.f32[0]);
  if (self->_isPulling)
  {
    float var3 = v11[1].var3;
    if (var3 == 0.0)
    {
      float var2 = v11[1].var2;
    }
    else
    {
      float v22 = v3 - self->_pullStartTime;
      if (var3 >= v22) {
        float v23 = v3 - self->_pullStartTime;
      }
      else {
        float v23 = v11[1].var3;
      }
      float var2 = self->_effectivePullAcceleration;
      if (var2 >= v11[1].var2 || v23 <= 0.001) {
        goto LABEL_20;
      }
      float var2 = powf(v11[1].var2, var3 / v23);
    }
    self->_effectivePullAcceleration = var2;
LABEL_20:
    double v24 = var2;
    double v18 = v18 - (v18 - self->_landingCoordinate.latitude) * v24;
    double v19 = v19 - (v19 - self->_landingCoordinate.longitude) * v24;
  }
  id v25 = objc_loadWeakRetained((id *)&self->_rotatable);
  [v25 homeCoordinate];
  double v27 = v26;
  double v29 = v28;

  double v30 = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(v18, v19, v27, v29);
  double v32 = v31;
  float v33 = v30;
  float v34 = 80.0;
  if (v33 <= 80.0)
  {
    float v34 = v33;
    if (v33 < -80.0) {
      float v34 = -80.0;
    }
  }
  double v35 = v34;
  id v36 = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(v36, "setCenterCoordinate:", v35, v32);

  id v37 = objc_loadWeakRetained((id *)&self->_rotatable);
  [v37 centerCoordinate];
  float64_t v44 = v39;
  float64_t v45 = v38;

  if (!self->_isPulling
    || (v40.f64[0] = v45,
        v40.f64[1] = v44,
        *(float32x2_t *)&v40.f64[0] = vsub_f32(vcvt_f32_f64(v40), vcvt_f32_f64((float64x2_t)self->_landingCoordinate)),
        sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v40, *(float32x2_t *)&v40).i32[1]), *(float *)v40.f64, *(float *)v40.f64)) < 0.1))
  {
    int32x2_t v41 = vcgt_f32((float32x2_t)vdup_n_s32(0x3DCCCCCDu), vabs_f32(*(float32x2_t *)self->_accumulatedPushVector));
    if (v41.i32[0] & v41.i32[1])
    {
      if (self->_isPulling)
      {
        id v42 = objc_loadWeakRetained((id *)&self->_rotatable);
        objc_msgSend(v42, "setCenterCoordinate:", v27, v29);
      }
      id v43 = objc_loadWeakRetained((id *)&self->_observer);
      [v43 rotationModelStoppedByDecelerating:self];

      [(NUNIAstronomyRotationModel *)self stop];
    }
  }
}

- (void)push:(NUNIAstronomyRotationModel *)self
{
  float32x2_t v3 = v2;
  double v5 = [(NUNIAstronomyRotationModel *)self interactionSettings];
  double v6 = CACurrentMediaTime();
  self->_effectivePullAcceleration = v5[1].var2 * 0.01;
  *(float32x2_t *)self->_accumulatedPushVector = vadd_f32(*(float32x2_t *)self->_accumulatedPushVector, v3);
  self->_effectivePushDeceleration = 1.0;
  self->_pushStartTime = v6;
  self->_pullStartTime = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  [WeakRetained homeCoordinate];
  double v9 = v8;
  double v11 = v10;

  int64_t state = self->_state;
  if (state == 1)
  {
    double latitude = self->_landingCoordinate.latitude;
    double longitude = self->_landingCoordinate.longitude;
  }
  else
  {
    double latitude = v9;
    double longitude = v11;
    if (!state)
    {
      objc_msgSend(MEMORY[0x263F15780], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink, v9, v11);
      float v15 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v15;

      float32x2_t v17 = self->_displayLink;
      double v18 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [(CADisplayLink *)v17 addToRunLoop:v18 forMode:*MEMORY[0x263EFF588]];

      self->_previousDisplayLinkCallbackTime = v6;
      self->_int64_t state = 1;
      double latitude = v9;
      double longitude = v11;
    }
  }
  self->_landingCoordinate.double latitude = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(latitude, longitude, v9, v11);
  self->_landingCoordinate.double longitude = v19;
}

- (const)interactionSettings
{
  return self->_interactionSettings;
}

- (NUNIRotatable)rotatable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  return (NUNIRotatable *)WeakRetained;
}

- (void)setRotatable:(id)a3
{
}

- (NUNIAstronomyRotationModelObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (NUNIAstronomyRotationModelObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isPulling
{
  return self->_pulling;
}

- (void)setPulling:(BOOL)a3
{
  self->_pulling = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_rotatable);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end