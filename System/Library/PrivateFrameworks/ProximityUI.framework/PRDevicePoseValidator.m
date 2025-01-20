@interface PRDevicePoseValidator
- (BOOL)validatePose:(id)a3;
- (PRDevicePoseValidator)initWithMaximumSpeed:(double)a3;
- (PRPose)previousPose;
- (double)maximumSpeed;
- (void)setMaximumSpeed:(double)a3;
- (void)setPreviousPose:(id)a3;
@end

@implementation PRDevicePoseValidator

- (PRDevicePoseValidator)initWithMaximumSpeed:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRDevicePoseValidator;
  v4 = [(PRDevicePoseValidator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(PRDevicePoseValidator *)v4 setMaximumSpeed:a3];
    os_log_t v6 = os_log_create("com.apple.proximity", "posevalidator");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v6;
  }
  return v5;
}

- (BOOL)validatePose:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PRDevicePoseValidator *)self previousPose];

  if (!v5)
  {
    [(PRDevicePoseValidator *)self setPreviousPose:v4];
    goto LABEL_9;
  }
  [v4 timestamp];
  double v7 = v6;
  v8 = [(PRDevicePoseValidator *)self previousPose];
  [v8 timestamp];
  double v10 = v7 - v9;

  if (v10 <= 0.0)
  {
LABEL_7:
    BOOL v19 = 0;
    goto LABEL_10;
  }
  if (v10 < 1.0) {
    goto LABEL_9;
  }
  [v4 pose];
  float32x4_t v24 = v11;
  v12 = [(PRDevicePoseValidator *)self previousPose];
  [v12 pose];
  float32x4_t v23 = v13;

  float32x4_t v14 = vsubq_f32(v24, v23);
  float32x4_t v15 = vmulq_f32(v14, v14);
  double v16 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0])/ v10;
  [(PRDevicePoseValidator *)self setPreviousPose:v4];
  [(PRDevicePoseValidator *)self maximumSpeed];
  if (v16 <= v17)
  {
LABEL_9:
    BOOL v19 = 1;
    goto LABEL_10;
  }
  logger = self->_logger;
  BOOL v19 = 0;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v20 = logger;
    [(PRDevicePoseValidator *)self maximumSpeed];
    *(_DWORD *)buf = 134218240;
    double v26 = v16;
    __int16 v27 = 2048;
    uint64_t v28 = v21;
    _os_log_impl(&dword_230EC1000, v20, OS_LOG_TYPE_DEFAULT, "PoseValidator found invalid pose. speed = %f m/s, threshold = %f m/s", buf, 0x16u);

    goto LABEL_7;
  }
LABEL_10:

  return v19;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
}

- (void)setMaximumSpeed:(double)a3
{
  self->_maximumSpeed = a3;
}

- (PRPose)previousPose
{
  return self->_previousPose;
}

- (void)setPreviousPose:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPose, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end