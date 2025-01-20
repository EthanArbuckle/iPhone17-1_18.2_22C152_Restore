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
  v9 = [v8 scene];
  [v9 offsetCoordinate];
  double v11 = v10;
  double v13 = v5 + v12;

  id v14 = objc_loadWeakRetained((id *)p_rotatable);
  [v14 centerCoordinate];
  double v16 = v15;
  double v18 = v17;

  float v19 = v13;
  float v20 = v16;
  if (vabds_f32(v19, v20) >= 0.001) {
    return 0;
  }
  float v21 = v7 + v11;
  float v22 = v18;
  return vabds_f32(v21, v22) < 0.001;
}

- (void)stop
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_state = 0;
  *(void *)self->_accumulatedPushVector = 0;
  *(void *)&self->_effectivePushDeceleration = 0;
  double v4 = (void *)MEMORY[0x1E4FBA8A8];
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

  id v30 = objc_loadWeakRetained((id *)&self->_rotatable);
  v31 = [v30 scene];
  [v31 offsetCoordinate];
  double v33 = v27 + v32;
  double v35 = v29 + v34;

  double v36 = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(v18, v19, v33, v35);
  double v38 = v37;
  float v39 = v36;
  float v40 = 80.0;
  if (v39 <= 80.0)
  {
    float v40 = v39;
    if (v39 < -80.0) {
      float v40 = -80.0;
    }
  }
  double v41 = v40;
  id v42 = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(v42, "setCenterCoordinate:", v41, v38);

  id v43 = objc_loadWeakRetained((id *)&self->_rotatable);
  [v43 centerCoordinate];
  float64_t v50 = v45;
  float64_t v51 = v44;

  if (!self->_isPulling
    || (v46.f64[0] = v51,
        v46.f64[1] = v50,
        *(float32x2_t *)&v46.f64[0] = vsub_f32(vcvt_f32_f64(v46), vcvt_f32_f64((float64x2_t)self->_landingCoordinate)),
        sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v46, *(float32x2_t *)&v46).i32[1]), *(float *)v46.f64, *(float *)v46.f64)) < 0.1))
  {
    int32x2_t v47 = vcgt_f32((float32x2_t)vdup_n_s32(0x3DCCCCCDu), vabs_f32(*(float32x2_t *)self->_accumulatedPushVector));
    if (v47.i32[0] & v47.i32[1])
    {
      if (self->_isPulling)
      {
        id v48 = objc_loadWeakRetained((id *)&self->_rotatable);
        objc_msgSend(v48, "setCenterCoordinate:", v33, v35);
      }
      id v49 = objc_loadWeakRetained((id *)&self->_observer);
      [v49 rotationModelStoppedByDecelerating:self];

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

  id v12 = objc_loadWeakRetained((id *)&self->_rotatable);
  double v13 = [v12 scene];
  [v13 offsetCoordinate];
  double v15 = v9 + v14;
  double v17 = v11 + v16;

  int64_t state = self->_state;
  if (state == 1)
  {
    double latitude = self->_landingCoordinate.latitude;
    double longitude = self->_landingCoordinate.longitude;
  }
  else
  {
    double latitude = v15;
    double longitude = v17;
    if (!state)
    {
      objc_msgSend(MEMORY[0x1E4F39B68], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink, v15, v17);
      float v21 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v21;

      float v23 = self->_displayLink;
      double v24 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [(CADisplayLink *)v23 addToRunLoop:v24 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_previousDisplayLinkCallbackTime = v6;
      self->_int64_t state = 1;
      double latitude = v15;
      double longitude = v17;
    }
  }
  self->_landingCoordinate.double latitude = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(latitude, longitude, v15, v17);
  self->_landingCoordinate.double longitude = v25;
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