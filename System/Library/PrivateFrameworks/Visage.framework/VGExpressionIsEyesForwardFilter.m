@interface VGExpressionIsEyesForwardFilter
- (VGExpressionIsEyesForwardFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4;
- (float)filter:(id)a3;
- (int)rejectionReason;
@end

@implementation VGExpressionIsEyesForwardFilter

- (int)rejectionReason
{
  return 19;
}

- (VGExpressionIsEyesForwardFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsEyesForwardFilter;
  v6 = [(VGExpressionIsEyesForwardFilter *)&v10 init];
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
  uint64_t v36 = *MEMORY[0x263EF8340];
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

      v11 = [v10 objectForKeyedSubscript:@"left_eye_pitch"];
      [v11 floatValue];
      float v13 = v12;

      v14 = [v10 objectForKeyedSubscript:@"left_eye_yaw"];
      [v14 floatValue];
      float v16 = v15;

      v17 = [v10 objectForKeyedSubscript:@"right_eye_pitch"];
      [v17 floatValue];
      float v19 = v18;

      v20 = [v10 objectForKeyedSubscript:@"right_eye_yaw"];
      [v20 floatValue];
      float v22 = v21;

      v23 = __VGLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 134218752;
        double v29 = v16;
        __int16 v30 = 2048;
        double v31 = v13;
        __int16 v32 = 2048;
        double v33 = v22;
        __int16 v34 = 2048;
        double v35 = v19;
        _os_log_impl(&dword_260C8D000, v23, OS_LOG_TYPE_DEBUG, " Left eye (yaw/pitch): %f %f, Right eye (yaw/pitch): %f %f ", (uint8_t *)&v28, 0x2Au);
      }

      float v24 = fabsf(v13);
      float eyesForwardPitchSensitivityInRadians = self->_eyesForwardPitchSensitivityInRadians;
      float v6 = 0.0;
      if (v24 < eyesForwardPitchSensitivityInRadians)
      {
        float eyesForwardYawSensitivityInRadians = self->_eyesForwardYawSensitivityInRadians;
        if (fabsf(v16) < eyesForwardYawSensitivityInRadians && fabsf(v19) < eyesForwardPitchSensitivityInRadians)
        {
          if (fabsf(v22) >= eyesForwardYawSensitivityInRadians) {
            float v6 = 0.0;
          }
          else {
            float v6 = 1.0;
          }
        }
      }
    }
  }

  return v6;
}

@end