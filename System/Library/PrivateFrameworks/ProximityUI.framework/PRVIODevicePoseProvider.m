@interface PRVIODevicePoseProvider
- (ARSession)session;
- (BOOL)trackingNormal;
- (PRDevicePoseValidator)poseValidator;
- (PRVIODevicePoseProvider)initWithARSession:(id)a3;
- (void)reset;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setPoseValidator:(id)a3;
- (void)setSession:(id)a3;
- (void)setTrackingNormal:(BOOL)a3;
@end

@implementation PRVIODevicePoseProvider

- (PRVIODevicePoseProvider)initWithARSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRVIODevicePoseProvider;
  v5 = [(PRVIODevicePoseProvider *)&v9 init];
  if (v5)
  {
    v6 = [[PRDevicePoseValidator alloc] initWithMaximumSpeed:4.0];
    [(PRVIODevicePoseProvider *)v5 setPoseValidator:v6];

    [(PRVIODevicePoseProvider *)v5 setTrackingNormal:0];
    [(PRVIODevicePoseProvider *)v5 setSession:v4];
    v7 = [(PRVIODevicePoseProvider *)v5 session];
    [v7 setDelegate:v5];
  }
  return v5;
}

- (void)reset
{
  [(PRVIODevicePoseProvider *)self setTrackingNormal:0];
  id v5 = [(PRVIODevicePoseProvider *)self session];
  v3 = [(PRVIODevicePoseProvider *)self session];
  id v4 = [v3 configuration];
  [v5 runWithConfiguration:v4 options:15];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v23 = a4;
  id v5 = [v23 camera];
  uint64_t v6 = [v5 trackingState];

  if (v6 == 2)
  {
    [(PRVIODevicePoseProvider *)self setTrackingNormal:1];
    v7 = [v23 camera];
    [v7 transform];
    float32x4_t v21 = v9;
    float32x4_t v22 = v8;
    float32x4_t v19 = v11;
    float32x4_t v20 = v10;

    [v23 timestamp];
    uint64_t v12 = 0;
    v24[0] = xmmword_230EF9210;
    v24[1] = xmmword_230EF9220;
    v24[2] = xmmword_230EF9230;
    v24[3] = xmmword_230EF9140;
    do
    {
      v24[v12 + 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(v24[v12])), v21, *(float32x2_t *)&v24[v12], 1), v20, (float32x4_t)v24[v12], 2), v19, (float32x4_t)v24[v12], 3);
      ++v12;
    }
    while (v12 != 4);
    v13 = +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:");
    v14 = [(PRVIODevicePoseProvider *)self poseValidator];
    int v15 = [v14 validatePose:v13];

    v16 = [(PRDevicePoseProvider *)self delegate];
    v17 = v16;
    if (v15)
    {
      [v16 devicePoseUpdated:v13];
    }
    else
    {
      [(PRVIODevicePoseProvider *)self reset];
      [v17 invalidPoseDetected];
    }
  }
  else
  {
    NSLog(&cfstr_CameraTracking.isa);
    if ([(PRVIODevicePoseProvider *)self trackingNormal])
    {
      v18 = [(PRDevicePoseProvider *)self delegate];
      [v18 invalidPoseDetected];

      [(PRVIODevicePoseProvider *)self setTrackingNormal:0];
    }
  }
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (PRDevicePoseValidator)poseValidator
{
  return self->_poseValidator;
}

- (void)setPoseValidator:(id)a3
{
}

- (BOOL)trackingNormal
{
  return self->_trackingNormal;
}

- (void)setTrackingNormal:(BOOL)a3
{
  self->_trackingNormal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poseValidator, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end