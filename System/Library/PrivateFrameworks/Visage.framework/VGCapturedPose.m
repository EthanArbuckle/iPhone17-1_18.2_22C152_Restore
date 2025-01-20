@interface VGCapturedPose
+ (BOOL)supportsSecureCoding;
- (BOOL)frontPose;
- (BOOL)isEqual:(id)a3;
- (BOOL)valid;
- (NSDictionary)trackingData;
- (VGBodyPoseFrameState)bodyPoseFrameState;
- (VGCaptureData)captureData;
- (VGCapturedPose)initWithCoder:(id)a3;
- (float)selectedAngle;
- (float)selectedPitch;
- (float)selectedYaw;
- (void)encodeWithCoder:(id)a3;
- (void)setBodyPoseFrameState:(id)a3;
- (void)setCaptureData:(id)a3;
- (void)setFrontPose:(BOOL)a3;
- (void)setSelectedAngle:(float)a3;
- (void)setSelectedPitch:(float)a3;
- (void)setSelectedYaw:(float)a3;
- (void)setTrackingData:(id)a3;
@end

@implementation VGCapturedPose

- (BOOL)valid
{
  return self->_captureData != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(VGCapturedPose *)self captureData];
  [v8 encodeObject:v4 forKey:@"captureData"];

  v5 = [(VGCapturedPose *)self trackingData];
  [v8 encodeObject:v5 forKey:@"trackingData"];

  objc_msgSend(v8, "encodeBool:forKey:", -[VGCapturedPose frontPose](self, "frontPose"), @"frontPose");
  [(VGCapturedPose *)self selectedAngle];
  objc_msgSend(v8, "encodeFloat:forKey:", @"selectedAngle");
  [(VGCapturedPose *)self selectedPitch];
  objc_msgSend(v8, "encodeFloat:forKey:", @"selectedPitch");
  [(VGCapturedPose *)self selectedYaw];
  objc_msgSend(v8, "encodeFloat:forKey:", @"selectedYaw");
  v6 = [(VGCapturedPose *)self bodyPoseFrameState];

  if (v6)
  {
    v7 = [(VGCapturedPose *)self bodyPoseFrameState];
    [v8 encodeObject:v7 forKey:@"bodyPoseFrameState"];
  }
}

- (VGCapturedPose)initWithCoder:(id)a3
{
  v17[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VGCapturedPose;
  v5 = [(VGCapturedPose *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captureData"];
    [(VGCapturedPose *)v5 setCaptureData:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:7];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"trackingData"];
    [(VGCapturedPose *)v5 setTrackingData:v10];

    -[VGCapturedPose setFrontPose:](v5, "setFrontPose:", [v4 decodeBoolForKey:@"frontPose"]);
    [v4 decodeFloatForKey:@"selectedAngle"];
    -[VGCapturedPose setSelectedAngle:](v5, "setSelectedAngle:");
    if ([v4 containsValueForKey:@"selectedPitch"]) {
      [v4 decodeFloatForKey:@"selectedPitch"];
    }
    else {
      LODWORD(v11) = 2139095040;
    }
    [(VGCapturedPose *)v5 setSelectedPitch:v11];
    if ([v4 containsValueForKey:@"selectedYaw"]) {
      [v4 decodeFloatForKey:@"selectedYaw"];
    }
    else {
      LODWORD(v12) = 2139095040;
    }
    [(VGCapturedPose *)v5 setSelectedYaw:v12];
    if ([v4 containsValueForKey:@"bodyPoseFrameState"])
    {
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyPoseFrameState"];
      [(VGCapturedPose *)v5 setBodyPoseFrameState:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_35;
  }
  id v8 = v7;
  v9 = v8;
  captureData = self->_captureData;
  double v11 = captureData;
  if (!captureData)
  {
    v3 = [v8 captureData];
    if (!v3)
    {
      int v12 = 0;
      goto LABEL_10;
    }
    double v11 = self->_captureData;
  }
  id v4 = [v9 captureData];
  if (![(VGCaptureData *)v11 isEqual:v4])
  {

    char v13 = 0;
    goto LABEL_32;
  }
  int v12 = 1;
LABEL_10:
  trackingData = self->_trackingData;
  v15 = trackingData;
  if (!trackingData)
  {
    v32 = [v9 trackingData];
    if (!v32)
    {
      v32 = 0;
      v33 = v3;
      int v16 = 0;
      goto LABEL_17;
    }
    v15 = self->_trackingData;
  }
  v5 = [v9 trackingData];
  if (([(NSDictionary *)v15 isEqual:v5] & 1) == 0)
  {

    char v13 = 0;
    goto LABEL_29;
  }
  v33 = v3;
  int v16 = 1;
LABEL_17:
  int frontPose = self->_frontPose;
  if (frontPose == [v9 frontPose])
  {
    float selectedAngle = self->_selectedAngle;
    [v9 selectedAngle];
    if (selectedAngle == v19)
    {
      float selectedPitch = self->_selectedPitch;
      [v9 selectedPitch];
      if (selectedPitch == v21)
      {
        float selectedYaw = self->_selectedYaw;
        [v9 selectedYaw];
        if (selectedYaw == v23)
        {
          bodyPoseFrameState = self->_bodyPoseFrameState;
          v25 = bodyPoseFrameState;
          if (!bodyPoseFrameState)
          {
            uint64_t v26 = [v9 bodyPoseFrameState];
            if (!v26)
            {
              v27 = 0;
              char v13 = 1;
              v3 = v33;
LABEL_39:

              if ((v16 & 1) == 0) {
                goto LABEL_29;
              }
              goto LABEL_28;
            }
            uint64_t v29 = v26;
            v25 = self->_bodyPoseFrameState;
          }
          v31 = bodyPoseFrameState;
          char v13 = -[VGBodyPoseFrameState isEqual:](v25, "isEqual:", v9[5], v29);
          v3 = v33;
          v27 = v30;
          if (v31)
          {
            if (!v16) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }
          goto LABEL_39;
        }
      }
    }
  }
  char v13 = 0;
  v3 = v33;
  if (v16) {
LABEL_28:
  }

LABEL_29:
  if (!trackingData)
  {

    if ((v12 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (v12) {
LABEL_31:
  }

LABEL_32:
  if (!captureData) {

  }
LABEL_35:
  return v13;
}

- (VGCaptureData)captureData
{
  return self->_captureData;
}

- (void)setCaptureData:(id)a3
{
}

- (NSDictionary)trackingData
{
  return self->_trackingData;
}

- (void)setTrackingData:(id)a3
{
}

- (BOOL)frontPose
{
  return self->_frontPose;
}

- (void)setFrontPose:(BOOL)a3
{
  self->_int frontPose = a3;
}

- (float)selectedAngle
{
  return self->_selectedAngle;
}

- (void)setSelectedAngle:(float)a3
{
  self->_float selectedAngle = a3;
}

- (VGBodyPoseFrameState)bodyPoseFrameState
{
  return self->_bodyPoseFrameState;
}

- (void)setBodyPoseFrameState:(id)a3
{
}

- (float)selectedPitch
{
  return self->_selectedPitch;
}

- (void)setSelectedPitch:(float)a3
{
  self->_float selectedPitch = a3;
}

- (float)selectedYaw
{
  return self->_selectedYaw;
}

- (void)setSelectedYaw:(float)a3
{
  self->_float selectedYaw = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPoseFrameState, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);

  objc_storeStrong((id *)&self->_captureData, 0);
}

@end