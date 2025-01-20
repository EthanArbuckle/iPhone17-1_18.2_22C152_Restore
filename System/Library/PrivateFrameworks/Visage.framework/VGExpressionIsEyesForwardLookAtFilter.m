@interface VGExpressionIsEyesForwardLookAtFilter
- (VGExpressionIsEyesForwardLookAtFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4;
- (float)filter:(id)a3;
- (int)rejectionReason;
@end

@implementation VGExpressionIsEyesForwardLookAtFilter

- (int)rejectionReason
{
  return 19;
}

- (VGExpressionIsEyesForwardLookAtFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsEyesForwardLookAtFilter;
  v6 = [(VGExpressionIsEyesForwardLookAtFilter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_eyesForwardYawSensitivityInRadians = a3;
    v6->_eyesForwardPitchSensitivityInRadians = a4;
    v8 = v6;
  }

  return v7;
}

- (float)filter:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v4 = [a3 objectForKeyedSubscript:@"tracked_faces"];
  v5 = v4;
  float v6 = 0.0;
  if (v4 && [v4 count])
  {
    v7 = [v5 objectAtIndexedSubscript:0];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKeyedSubscript:@"smooth_data"];
      objc_super v10 = [v9 objectForKeyedSubscript:@"animation"];

      v11 = [v10 objectForKeyedSubscript:@"gaze"];
      objc_msgSend(v11, "vg_float3ByInvokingFloatValue");
      float32x4_t v24 = v12;

      int32x4_t v13 = (int32x4_t)vmulq_f32(v24, v24);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      float32x2_t v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      float32x4_t v25 = vmulq_n_f32(v24, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
      float v16 = atan2f(v25.f32[0], v25.f32[2]);
      float v17 = asinf(v25.f32[1]);
      v18 = __VGLogSharedInstance();
      float v19 = -v17;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        double eyesForwardYawSensitivityInRadians = self->_eyesForwardYawSensitivityInRadians;
        double eyesForwardPitchSensitivityInRadians = self->_eyesForwardPitchSensitivityInRadians;
        *(_DWORD *)buf = 134284289;
        double v27 = v16;
        __int16 v28 = 2049;
        double v29 = v19;
        __int16 v30 = 2049;
        double v31 = eyesForwardYawSensitivityInRadians;
        __int16 v32 = 2049;
        double v33 = eyesForwardPitchSensitivityInRadians;
        _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_DEBUG, " Look-at gaze (yaw/pitch radians): %{private}g %{private}g [abs value threshold (yaw/pitch radians): %{private}g %{private}g] ", buf, 0x2Au);
      }

      float v22 = fabsf(v19);
      float v6 = 0.0;
      if (v22 < self->_eyesForwardPitchSensitivityInRadians)
      {
        if (fabsf(v16) >= self->_eyesForwardYawSensitivityInRadians) {
          float v6 = 0.0;
        }
        else {
          float v6 = 1.0;
        }
      }
    }
  }

  return v6;
}

@end