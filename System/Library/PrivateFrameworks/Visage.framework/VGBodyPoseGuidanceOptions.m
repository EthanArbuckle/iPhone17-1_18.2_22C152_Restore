@interface VGBodyPoseGuidanceOptions
+ (BOOL)supportsSecureCoding;
+ (float)defaultBestAlignmentToleranceAngleFrontPose;
+ (float)defaultLeftElbowMarginMax;
+ (float)defaultLeftElbowMarginMin;
+ (float)defaultLeftElbowTargetMax;
+ (float)defaultLeftElbowTargetMin;
+ (float)defaultLeftShoulderForwardMarginMax;
+ (float)defaultLeftShoulderForwardMarginMin;
+ (float)defaultLeftShoulderForwardTargetMax;
+ (float)defaultLeftShoulderForwardTargetMin;
+ (float)defaultRightElbowMarginMax;
+ (float)defaultRightElbowMarginMin;
+ (float)defaultRightElbowTargetMax;
+ (float)defaultRightElbowTargetMin;
+ (float)defaultRightShoulderForwardMarginMax;
+ (float)defaultRightShoulderForwardMarginMin;
+ (float)defaultRightShoulderForwardTargetMax;
+ (float)defaultRightShoulderForwardTargetMin;
+ (float)defaultShouldersHeightAsymmetryMarginMax;
+ (float)defaultShouldersHeightAsymmetryMarginMin;
+ (float)defaultShouldersHeightAsymmetryTargetMax;
+ (float)defaultShouldersHeightAsymmetryTargetMin;
+ (float)defaultShouldersTwistMarginMax;
+ (float)defaultShouldersTwistMarginMin;
+ (float)defaultShouldersTwistTargetMax;
+ (float)defaultShouldersTwistTargetMin;
+ (float)defaultTorsoHeadMarginMax;
+ (float)defaultTorsoHeadMarginMin;
+ (float)defaultTorsoHeadTargetMax;
+ (float)defaultTorsoHeadTargetMin;
- (BOOL)isEqual:(id)a3;
- (VGBodyPoseGuidanceOptions)init;
- (VGBodyPoseGuidanceOptions)initWithCoder:(id)a3;
- (VGBodyPoseGuidanceOptions)initWithSuiteName:(id)a3;
- (float)bestAlignmentToleranceAngleFrontPose;
- (float)leftElbowMarginMax;
- (float)leftElbowMarginMin;
- (float)leftElbowTargetMax;
- (float)leftElbowTargetMin;
- (float)leftShoulderForwardMarginMax;
- (float)leftShoulderForwardMarginMin;
- (float)leftShoulderForwardTargetMax;
- (float)leftShoulderForwardTargetMin;
- (float)rightElbowMarginMax;
- (float)rightElbowMarginMin;
- (float)rightElbowTargetMax;
- (float)rightElbowTargetMin;
- (float)rightShoulderForwardMarginMax;
- (float)rightShoulderForwardMarginMin;
- (float)rightShoulderForwardTargetMax;
- (float)rightShoulderForwardTargetMin;
- (float)shouldersHeightAsymmetryMarginMax;
- (float)shouldersHeightAsymmetryMarginMin;
- (float)shouldersHeightAsymmetryTargetMax;
- (float)shouldersHeightAsymmetryTargetMin;
- (float)shouldersTwistMarginMax;
- (float)shouldersTwistMarginMin;
- (float)shouldersTwistTargetMax;
- (float)shouldersTwistTargetMin;
- (float)torsoHeadMarginMax;
- (float)torsoHeadMarginMin;
- (float)torsoHeadTargetMax;
- (float)torsoHeadTargetMin;
- (id)description;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setBestAlignmentToleranceAngleFrontPose:(float)a3;
- (void)setDefaultsWithSuiteName:(id)a3;
- (void)setLeftElbowMarginMax:(float)a3;
- (void)setLeftElbowMarginMin:(float)a3;
- (void)setLeftElbowTargetMax:(float)a3;
- (void)setLeftElbowTargetMin:(float)a3;
- (void)setLeftShoulderForwardMarginMax:(float)a3;
- (void)setLeftShoulderForwardMarginMin:(float)a3;
- (void)setLeftShoulderForwardTargetMax:(float)a3;
- (void)setLeftShoulderForwardTargetMin:(float)a3;
- (void)setRightElbowMarginMax:(float)a3;
- (void)setRightElbowMarginMin:(float)a3;
- (void)setRightElbowTargetMax:(float)a3;
- (void)setRightElbowTargetMin:(float)a3;
- (void)setRightShoulderForwardMarginMax:(float)a3;
- (void)setRightShoulderForwardMarginMin:(float)a3;
- (void)setRightShoulderForwardTargetMax:(float)a3;
- (void)setRightShoulderForwardTargetMin:(float)a3;
- (void)setShouldersHeightAsymmetryMarginMax:(float)a3;
- (void)setShouldersHeightAsymmetryMarginMin:(float)a3;
- (void)setShouldersHeightAsymmetryTargetMax:(float)a3;
- (void)setShouldersHeightAsymmetryTargetMin:(float)a3;
- (void)setShouldersTwistMarginMax:(float)a3;
- (void)setShouldersTwistMarginMin:(float)a3;
- (void)setShouldersTwistTargetMax:(float)a3;
- (void)setShouldersTwistTargetMin:(float)a3;
- (void)setTorsoHeadMarginMax:(float)a3;
- (void)setTorsoHeadMarginMin:(float)a3;
- (void)setTorsoHeadTargetMax:(float)a3;
- (void)setTorsoHeadTargetMin:(float)a3;
@end

@implementation VGBodyPoseGuidanceOptions

- (VGBodyPoseGuidanceOptions)init
{
  v34.receiver = self;
  v34.super_class = (Class)VGBodyPoseGuidanceOptions;
  v2 = [(VGBodyPoseGuidanceOptions *)&v34 init];
  if (v2)
  {
    [(id)objc_opt_class() defaultTorsoHeadTargetMin];
    v2->_torsoHeadTargetMin = v3;
    [(id)objc_opt_class() defaultTorsoHeadTargetMax];
    v2->_torsoHeadTargetMax = v4;
    [(id)objc_opt_class() defaultTorsoHeadMarginMin];
    v2->_torsoHeadMarginMin = v5;
    [(id)objc_opt_class() defaultTorsoHeadMarginMax];
    v2->_torsoHeadMarginMax = v6;
    [(id)objc_opt_class() defaultShouldersTwistTargetMin];
    v2->_shouldersTwistTargetMin = v7;
    [(id)objc_opt_class() defaultShouldersTwistTargetMax];
    v2->_shouldersTwistTargetMax = v8;
    [(id)objc_opt_class() defaultShouldersTwistMarginMin];
    v2->_shouldersTwistMarginMin = v9;
    [(id)objc_opt_class() defaultShouldersTwistMarginMax];
    v2->_shouldersTwistMarginMax = v10;
    [(id)objc_opt_class() defaultLeftElbowTargetMin];
    v2->_leftElbowTargetMin = v11;
    [(id)objc_opt_class() defaultLeftElbowTargetMax];
    v2->_leftElbowTargetMax = v12;
    [(id)objc_opt_class() defaultLeftElbowMarginMin];
    v2->_leftElbowMarginMin = v13;
    [(id)objc_opt_class() defaultLeftElbowMarginMax];
    v2->_leftElbowMarginMax = v14;
    [(id)objc_opt_class() defaultRightElbowTargetMin];
    v2->_rightElbowTargetMin = v15;
    [(id)objc_opt_class() defaultRightElbowTargetMax];
    v2->_rightElbowTargetMax = v16;
    [(id)objc_opt_class() defaultRightElbowMarginMin];
    v2->_rightElbowMarginMin = v17;
    [(id)objc_opt_class() defaultRightElbowMarginMax];
    v2->_rightElbowMarginMax = v18;
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryTargetMin];
    v2->_shouldersHeightAsymmetryTargetMin = v19;
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryTargetMax];
    v2->_shouldersHeightAsymmetryTargetMax = v20;
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryMarginMin];
    v2->_shouldersHeightAsymmetryMarginMin = v21;
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryMarginMax];
    v2->_shouldersHeightAsymmetryMarginMax = v22;
    [(id)objc_opt_class() defaultLeftShoulderForwardTargetMin];
    v2->_leftShoulderForwardTargetMin = v23;
    [(id)objc_opt_class() defaultLeftShoulderForwardTargetMax];
    v2->_leftShoulderForwardTargetMax = v24;
    [(id)objc_opt_class() defaultLeftShoulderForwardMarginMin];
    v2->_leftShoulderForwardMarginMin = v25;
    [(id)objc_opt_class() defaultLeftShoulderForwardMarginMax];
    v2->_leftShoulderForwardMarginMax = v26;
    [(id)objc_opt_class() defaultRightShoulderForwardTargetMin];
    v2->_rightShoulderForwardTargetMin = v27;
    [(id)objc_opt_class() defaultRightShoulderForwardTargetMax];
    v2->_rightShoulderForwardTargetMax = v28;
    [(id)objc_opt_class() defaultRightShoulderForwardMarginMin];
    v2->_rightShoulderForwardMarginMin = v29;
    [(id)objc_opt_class() defaultRightShoulderForwardMarginMax];
    v2->_rightShoulderForwardMarginMax = v30;
    [(id)objc_opt_class() defaultBestAlignmentToleranceAngleFrontPose];
    v2->_bestAlignmentToleranceAngleFrontPose = v31;
    v32 = v2;
  }

  return v2;
}

- (VGBodyPoseGuidanceOptions)initWithSuiteName:(id)a3
{
  id v4 = a3;
  float v5 = [(VGBodyPoseGuidanceOptions *)self init];
  float v6 = v5;
  if (v5)
  {
    [(VGBodyPoseGuidanceOptions *)v5 setDefaultsWithSuiteName:v4];
    float v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  id v63 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v63];
  float v5 = [v4 objectForKey:@"torsoHeadTargetMin"];

  if (v5)
  {
    [v4 floatForKey:@"torsoHeadTargetMin"];
    self->_torsoHeadTargetMin = v6;
  }
  float v7 = [v4 objectForKey:@"torsoHeadTargetMax"];

  if (v7)
  {
    [v4 floatForKey:@"torsoHeadTargetMax"];
    self->_torsoHeadTargetMax = v8;
  }
  float v9 = [v4 objectForKey:@"torsoHeadMarginMin"];

  if (v9)
  {
    [v4 floatForKey:@"torsoHeadMarginMin"];
    self->_torsoHeadMarginMin = v10;
  }
  float v11 = [v4 objectForKey:@"torsoHeadMarginMax"];

  if (v11)
  {
    [v4 floatForKey:@"torsoHeadMarginMax"];
    self->_torsoHeadMarginMax = v12;
  }
  float v13 = [v4 objectForKey:@"shouldersTwistTargetMin"];

  if (v13)
  {
    [v4 floatForKey:@"shouldersTwistTargetMin"];
    self->_shouldersTwistTargetMin = v14;
  }
  float v15 = [v4 objectForKey:@"shouldersTwistTargetMax"];

  if (v15)
  {
    [v4 floatForKey:@"shouldersTwistTargetMax"];
    self->_shouldersTwistTargetMax = v16;
  }
  float v17 = [v4 objectForKey:@"shouldersTwistMarginMin"];

  if (v17)
  {
    [v4 floatForKey:@"shouldersTwistMarginMin"];
    self->_shouldersTwistMarginMin = v18;
  }
  float v19 = [v4 objectForKey:@"shouldersTwistMarginMax"];

  if (v19)
  {
    [v4 floatForKey:@"shouldersTwistMarginMax"];
    self->_shouldersTwistMarginMax = v20;
  }
  float v21 = [v4 objectForKey:@"leftElbowTargetMin"];

  if (v21)
  {
    [v4 floatForKey:@"leftElbowTargetMin"];
    self->_leftElbowTargetMin = v22;
  }
  float v23 = [v4 objectForKey:@"leftElbowTargetMax"];

  if (v23)
  {
    [v4 floatForKey:@"leftElbowTargetMax"];
    self->_leftElbowTargetMax = v24;
  }
  float v25 = [v4 objectForKey:@"leftElbowMarginMin"];

  if (v25)
  {
    [v4 floatForKey:@"leftElbowMarginMin"];
    self->_leftElbowMarginMin = v26;
  }
  float v27 = [v4 objectForKey:@"leftElbowMarginMax"];

  if (v27)
  {
    [v4 floatForKey:@"leftElbowMarginMax"];
    self->_leftElbowMarginMax = v28;
  }
  float v29 = [v4 objectForKey:@"rightElbowTargetMin"];

  if (v29)
  {
    [v4 floatForKey:@"rightElbowTargetMin"];
    self->_rightElbowTargetMin = v30;
  }
  float v31 = [v4 objectForKey:@"rightElbowTargetMax"];

  if (v31)
  {
    [v4 floatForKey:@"rightElbowTargetMax"];
    self->_rightElbowTargetMax = v32;
  }
  v33 = [v4 objectForKey:@"rightElbowMarginMin"];

  if (v33)
  {
    [v4 floatForKey:@"rightElbowMarginMin"];
    self->_rightElbowMarginMin = v34;
  }
  v35 = [v4 objectForKey:@"rightElbowMarginMax"];

  if (v35)
  {
    [v4 floatForKey:@"rightElbowMarginMax"];
    self->_rightElbowMarginMax = v36;
  }
  v37 = [v4 objectForKey:@"shouldersHeightAsymmetryTargetMin"];

  if (v37)
  {
    [v4 floatForKey:@"shouldersHeightAsymmetryTargetMin"];
    self->_shouldersHeightAsymmetryTargetMin = v38;
  }
  v39 = [v4 objectForKey:@"shouldersHeightAsymmetryTargetMax"];

  if (v39)
  {
    [v4 floatForKey:@"shouldersHeightAsymmetryTargetMax"];
    self->_shouldersHeightAsymmetryTargetMax = v40;
  }
  v41 = [v4 objectForKey:@"shouldersHeightAsymmetryMarginMin"];

  if (v41)
  {
    [v4 floatForKey:@"shouldersHeightAsymmetryMarginMin"];
    self->_shouldersHeightAsymmetryMarginMin = v42;
  }
  v43 = [v4 objectForKey:@"shouldersHeightAsymmetryMarginMax"];

  if (v43)
  {
    [v4 floatForKey:@"shouldersHeightAsymmetryMarginMax"];
    self->_shouldersHeightAsymmetryMarginMax = v44;
  }
  v45 = [v4 objectForKey:@"leftShoulderForwardTargetMin"];

  if (v45)
  {
    [v4 floatForKey:@"leftShoulderForwardTargetMin"];
    self->_leftShoulderForwardTargetMin = v46;
  }
  v47 = [v4 objectForKey:@"leftShoulderForwardTargetMax"];

  if (v47)
  {
    [v4 floatForKey:@"leftShoulderForwardTargetMax"];
    self->_leftShoulderForwardTargetMax = v48;
  }
  v49 = [v4 objectForKey:@"leftShoulderForwardMarginMin"];

  if (v49)
  {
    [v4 floatForKey:@"leftShoulderForwardMarginMin"];
    self->_leftShoulderForwardMarginMin = v50;
  }
  v51 = [v4 objectForKey:@"leftShoulderForwardMarginMax"];

  if (v51)
  {
    [v4 floatForKey:@"leftShoulderForwardMarginMax"];
    self->_leftShoulderForwardMarginMax = v52;
  }
  v53 = [v4 objectForKey:@"rightShoulderForwardTargetMin"];

  if (v53)
  {
    [v4 floatForKey:@"rightShoulderForwardTargetMin"];
    self->_rightShoulderForwardTargetMin = v54;
  }
  v55 = [v4 objectForKey:@"rightShoulderForwardTargetMax"];

  if (v55)
  {
    [v4 floatForKey:@"rightShoulderForwardTargetMax"];
    self->_rightShoulderForwardTargetMax = v56;
  }
  v57 = [v4 objectForKey:@"rightShoulderForwardMarginMin"];

  if (v57)
  {
    [v4 floatForKey:@"rightShoulderForwardMarginMin"];
    self->_rightShoulderForwardMarginMin = v58;
  }
  v59 = [v4 objectForKey:@"rightShoulderForwardMarginMax"];

  if (v59)
  {
    [v4 floatForKey:@"rightShoulderForwardMarginMax"];
    self->_rightShoulderForwardMarginMax = v60;
  }
  v61 = [v4 objectForKey:@"bestAlignmentToleranceAngleFrontPose"];

  if (v61)
  {
    [v4 floatForKey:@"bestAlignmentToleranceAngleFrontPose"];
    self->_bestAlignmentToleranceAngleFrontPose = v62;
  }
}

+ (float)defaultTorsoHeadTargetMin
{
  return -15.0;
}

+ (float)defaultTorsoHeadTargetMax
{
  return 15.0;
}

+ (float)defaultTorsoHeadMarginMin
{
  return 5.0;
}

+ (float)defaultTorsoHeadMarginMax
{
  return 5.0;
}

+ (float)defaultShouldersTwistTargetMin
{
  return -10.0;
}

+ (float)defaultShouldersTwistTargetMax
{
  return 10.0;
}

+ (float)defaultShouldersTwistMarginMin
{
  return 5.0;
}

+ (float)defaultShouldersTwistMarginMax
{
  return 5.0;
}

+ (float)defaultLeftElbowTargetMin
{
  return 0.0;
}

+ (float)defaultLeftElbowTargetMax
{
  return 90.0;
}

+ (float)defaultLeftElbowMarginMin
{
  return 5.0;
}

+ (float)defaultLeftElbowMarginMax
{
  return 30.0;
}

+ (float)defaultRightElbowTargetMin
{
  return -90.0;
}

+ (float)defaultRightElbowTargetMax
{
  return 0.0;
}

+ (float)defaultRightElbowMarginMin
{
  return 30.0;
}

+ (float)defaultRightElbowMarginMax
{
  return 5.0;
}

+ (float)defaultShouldersHeightAsymmetryTargetMin
{
  return -4.0;
}

+ (float)defaultShouldersHeightAsymmetryTargetMax
{
  return 4.0;
}

+ (float)defaultShouldersHeightAsymmetryMarginMin
{
  return 1.0;
}

+ (float)defaultShouldersHeightAsymmetryMarginMax
{
  return 1.0;
}

+ (float)defaultLeftShoulderForwardTargetMin
{
  return -0.09;
}

+ (float)defaultLeftShoulderForwardTargetMax
{
  return 0.01;
}

+ (float)defaultLeftShoulderForwardMarginMin
{
  return 0.03;
}

+ (float)defaultLeftShoulderForwardMarginMax
{
  return 0.03;
}

+ (float)defaultRightShoulderForwardTargetMin
{
  return -0.09;
}

+ (float)defaultRightShoulderForwardTargetMax
{
  return 0.01;
}

+ (float)defaultRightShoulderForwardMarginMin
{
  return 0.03;
}

+ (float)defaultRightShoulderForwardMarginMax
{
  return 0.03;
}

+ (float)defaultBestAlignmentToleranceAngleFrontPose
{
  return 2.0;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Torso Head targets [min %g, max %g] margins [min %g, max %g] Shoulders Twist targets [min %g, max %g] margins [min %g, max %g] Left Elbow targets [min %g, max %g] margins [min %g, max %g] Right Elbow targets [min %g, max %g] margins [min %g, max %g] Shoulders Height Assymetry targets [min %g, max %g] margins [min %g, max %g] Left Shoulder Forward targets [min %g, max %g] margins [min %g, max %g] Right Shoulder Forward targets [min %g, max %g] margins [min %g, max %g] Best Alignment Tolerance Angle (front pose) %g ", self->_torsoHeadTargetMin, self->_torsoHeadTargetMax, self->_torsoHeadMarginMin, self->_torsoHeadMarginMax, self->_shouldersTwistTargetMin, self->_shouldersTwistTargetMax, self->_shouldersTwistMarginMin, self->_shouldersTwistMarginMax, self->_leftElbowTargetMin, self->_leftElbowTargetMax, self->_leftElbowMarginMin, self->_leftElbowMarginMax, self->_rightElbowTargetMin, self->_rightElbowTargetMax, self->_rightElbowMarginMin, self->_rightElbowMarginMax,
               self->_shouldersHeightAsymmetryTargetMin,
               self->_shouldersHeightAsymmetryTargetMax,
               self->_shouldersHeightAsymmetryMarginMin,
               self->_shouldersHeightAsymmetryMarginMax,
               self->_leftShoulderForwardTargetMin,
               self->_leftShoulderForwardTargetMax,
               self->_leftShoulderForwardMarginMin,
               self->_leftShoulderForwardMarginMax,
               self->_rightShoulderForwardTargetMin,
               self->_rightShoulderForwardTargetMax,
               self->_rightShoulderForwardMarginMin,
               self->_rightShoulderForwardMarginMax,
               self->_bestAlignmentToleranceAngleFrontPose);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseGuidanceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  float v5 = [(VGBodyPoseGuidanceOptions *)self init];
  if (v5)
  {
    [(id)objc_opt_class() defaultTorsoHeadTargetMin];
    v5->_torsoHeadTargetMin = v6;
    if ([v4 containsValueForKey:@"torsoHeadTargetMin"])
    {
      [v4 decodeFloatForKey:@"torsoHeadTargetMin"];
      v5->_torsoHeadTargetMin = v7;
    }
    [(id)objc_opt_class() defaultTorsoHeadTargetMax];
    v5->_torsoHeadTargetMax = v8;
    if ([v4 containsValueForKey:@"torsoHeadTargetMax"])
    {
      [v4 decodeFloatForKey:@"torsoHeadTargetMax"];
      v5->_torsoHeadTargetMax = v9;
    }
    [(id)objc_opt_class() defaultTorsoHeadMarginMin];
    v5->_torsoHeadMarginMin = v10;
    if ([v4 containsValueForKey:@"torsoHeadMarginMin"])
    {
      [v4 decodeFloatForKey:@"torsoHeadMarginMin"];
      v5->_torsoHeadMarginMin = v11;
    }
    [(id)objc_opt_class() defaultTorsoHeadMarginMax];
    v5->_torsoHeadMarginMax = v12;
    if ([v4 containsValueForKey:@"torsoHeadMarginMax"])
    {
      [v4 decodeFloatForKey:@"torsoHeadMarginMax"];
      v5->_torsoHeadMarginMax = v13;
    }
    [(id)objc_opt_class() defaultShouldersTwistTargetMin];
    v5->_shouldersTwistTargetMin = v14;
    if ([v4 containsValueForKey:@"shouldersTwistTargetMin"])
    {
      [v4 decodeFloatForKey:@"shouldersTwistTargetMin"];
      v5->_shouldersTwistTargetMin = v15;
    }
    [(id)objc_opt_class() defaultShouldersTwistTargetMax];
    v5->_shouldersTwistTargetMax = v16;
    if ([v4 containsValueForKey:@"shouldersTwistTargetMax"])
    {
      [v4 decodeFloatForKey:@"shouldersTwistTargetMax"];
      v5->_shouldersTwistTargetMax = v17;
    }
    [(id)objc_opt_class() defaultShouldersTwistMarginMin];
    v5->_shouldersTwistMarginMin = v18;
    if ([v4 containsValueForKey:@"shouldersTwistMarginMin"])
    {
      [v4 decodeFloatForKey:@"shouldersTwistMarginMin"];
      v5->_shouldersTwistMarginMin = v19;
    }
    [(id)objc_opt_class() defaultShouldersTwistMarginMax];
    v5->_shouldersTwistMarginMax = v20;
    if ([v4 containsValueForKey:@"shouldersTwistMarginMax"])
    {
      [v4 decodeFloatForKey:@"shouldersTwistMarginMax"];
      v5->_shouldersTwistMarginMax = v21;
    }
    [(id)objc_opt_class() defaultLeftElbowTargetMin];
    v5->_leftElbowTargetMin = v22;
    if ([v4 containsValueForKey:@"leftElbowTargetMin"])
    {
      [v4 decodeFloatForKey:@"leftElbowTargetMin"];
      v5->_leftElbowTargetMin = v23;
    }
    [(id)objc_opt_class() defaultLeftElbowTargetMax];
    v5->_leftElbowTargetMax = v24;
    if ([v4 containsValueForKey:@"leftElbowTargetMax"])
    {
      [v4 decodeFloatForKey:@"leftElbowTargetMax"];
      v5->_leftElbowTargetMax = v25;
    }
    [(id)objc_opt_class() defaultLeftElbowMarginMin];
    v5->_leftElbowMarginMin = v26;
    if ([v4 containsValueForKey:@"leftElbowMarginMin"])
    {
      [v4 decodeFloatForKey:@"leftElbowMarginMin"];
      v5->_leftElbowMarginMin = v27;
    }
    [(id)objc_opt_class() defaultLeftElbowMarginMax];
    v5->_leftElbowMarginMax = v28;
    if ([v4 containsValueForKey:@"leftElbowMarginMax"])
    {
      [v4 decodeFloatForKey:@"leftElbowMarginMax"];
      v5->_leftElbowMarginMax = v29;
    }
    [(id)objc_opt_class() defaultRightElbowTargetMin];
    v5->_rightElbowTargetMin = v30;
    if ([v4 containsValueForKey:@"rightElbowTargetMin"])
    {
      [v4 decodeFloatForKey:@"rightElbowTargetMin"];
      v5->_rightElbowTargetMin = v31;
    }
    [(id)objc_opt_class() defaultRightElbowTargetMax];
    v5->_rightElbowTargetMax = v32;
    if ([v4 containsValueForKey:@"rightElbowTargetMax"])
    {
      [v4 decodeFloatForKey:@"rightElbowTargetMax"];
      v5->_rightElbowTargetMax = v33;
    }
    [(id)objc_opt_class() defaultRightElbowMarginMin];
    v5->_rightElbowMarginMin = v34;
    if ([v4 containsValueForKey:@"rightElbowMarginMin"])
    {
      [v4 decodeFloatForKey:@"rightElbowMarginMin"];
      v5->_rightElbowMarginMin = v35;
    }
    [(id)objc_opt_class() defaultRightElbowMarginMax];
    v5->_rightElbowMarginMax = v36;
    if ([v4 containsValueForKey:@"rightElbowMarginMax"])
    {
      [v4 decodeFloatForKey:@"rightElbowMarginMax"];
      v5->_rightElbowMarginMax = v37;
    }
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryTargetMin];
    v5->_shouldersHeightAsymmetryTargetMin = v38;
    if ([v4 containsValueForKey:@"shouldersHeightAsymmetryTargetMin"])
    {
      [v4 decodeFloatForKey:@"shouldersHeightAsymmetryTargetMin"];
      v5->_shouldersHeightAsymmetryTargetMin = v39;
    }
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryTargetMax];
    v5->_shouldersHeightAsymmetryTargetMax = v40;
    if ([v4 containsValueForKey:@"shouldersHeightAsymmetryTargetMax"])
    {
      [v4 decodeFloatForKey:@"shouldersHeightAsymmetryTargetMax"];
      v5->_shouldersHeightAsymmetryTargetMax = v41;
    }
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryMarginMin];
    v5->_shouldersHeightAsymmetryMarginMin = v42;
    if ([v4 containsValueForKey:@"shouldersHeightAsymmetryMarginMin"])
    {
      [v4 decodeFloatForKey:@"shouldersHeightAsymmetryMarginMin"];
      v5->_shouldersHeightAsymmetryMarginMin = v43;
    }
    [(id)objc_opt_class() defaultShouldersHeightAsymmetryMarginMax];
    v5->_shouldersHeightAsymmetryMarginMax = v44;
    if ([v4 containsValueForKey:@"shouldersHeightAsymmetryMarginMax"])
    {
      [v4 decodeFloatForKey:@"shouldersHeightAsymmetryMarginMax"];
      v5->_shouldersHeightAsymmetryMarginMax = v45;
    }
    [(id)objc_opt_class() defaultLeftShoulderForwardTargetMin];
    v5->_leftShoulderForwardTargetMin = v46;
    if ([v4 containsValueForKey:@"leftShoulderForwardTargetMin"])
    {
      [v4 decodeFloatForKey:@"leftShoulderForwardTargetMin"];
      v5->_leftShoulderForwardTargetMin = v47;
    }
    [(id)objc_opt_class() defaultLeftShoulderForwardTargetMax];
    v5->_leftShoulderForwardTargetMax = v48;
    if ([v4 containsValueForKey:@"leftShoulderForwardTargetMax"])
    {
      [v4 decodeFloatForKey:@"leftShoulderForwardTargetMax"];
      v5->_leftShoulderForwardTargetMax = v49;
    }
    [(id)objc_opt_class() defaultLeftShoulderForwardMarginMin];
    v5->_leftShoulderForwardMarginMin = v50;
    if ([v4 containsValueForKey:@"leftShoulderForwardMarginMin"])
    {
      [v4 decodeFloatForKey:@"leftShoulderForwardMarginMin"];
      v5->_leftShoulderForwardMarginMin = v51;
    }
    [(id)objc_opt_class() defaultLeftShoulderForwardMarginMax];
    v5->_leftShoulderForwardMarginMax = v52;
    if ([v4 containsValueForKey:@"leftShoulderForwardMarginMax"])
    {
      [v4 decodeFloatForKey:@"leftShoulderForwardMarginMax"];
      v5->_leftShoulderForwardMarginMax = v53;
    }
    [(id)objc_opt_class() defaultRightShoulderForwardTargetMin];
    v5->_rightShoulderForwardTargetMin = v54;
    if ([v4 containsValueForKey:@"rightShoulderForwardTargetMin"])
    {
      [v4 decodeFloatForKey:@"rightShoulderForwardTargetMin"];
      v5->_rightShoulderForwardTargetMin = v55;
    }
    [(id)objc_opt_class() defaultRightShoulderForwardTargetMax];
    v5->_rightShoulderForwardTargetMax = v56;
    if ([v4 containsValueForKey:@"rightShoulderForwardTargetMax"])
    {
      [v4 decodeFloatForKey:@"rightShoulderForwardTargetMax"];
      v5->_rightShoulderForwardTargetMax = v57;
    }
    [(id)objc_opt_class() defaultRightShoulderForwardMarginMin];
    v5->_rightShoulderForwardMarginMin = v58;
    if ([v4 containsValueForKey:@"rightShoulderForwardMarginMin"])
    {
      [v4 decodeFloatForKey:@"rightShoulderForwardMarginMin"];
      v5->_rightShoulderForwardMarginMin = v59;
    }
    [(id)objc_opt_class() defaultRightShoulderForwardMarginMax];
    v5->_rightShoulderForwardMarginMax = v60;
    if ([v4 containsValueForKey:@"rightShoulderForwardMarginMax"])
    {
      [v4 decodeFloatForKey:@"rightShoulderForwardMarginMax"];
      v5->_rightShoulderForwardMarginMax = v61;
    }
    [(id)objc_opt_class() defaultBestAlignmentToleranceAngleFrontPose];
    v5->_bestAlignmentToleranceAngleFrontPose = v62;
    if ([v4 containsValueForKey:@"bestAlignmentToleranceAngleFrontPose"])
    {
      [v4 decodeFloatForKey:@"bestAlignmentToleranceAngleFrontPose"];
      v5->_bestAlignmentToleranceAngleFrontPose = v63;
    }
    v64 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_torsoHeadTargetMin;
  id v34 = v4;
  [v4 encodeFloat:@"torsoHeadTargetMin" forKey:v5];
  *(float *)&double v6 = self->_torsoHeadTargetMax;
  [v34 encodeFloat:@"torsoHeadTargetMax" forKey:v6];
  *(float *)&double v7 = self->_torsoHeadMarginMin;
  [v34 encodeFloat:@"torsoHeadMarginMin" forKey:v7];
  *(float *)&double v8 = self->_torsoHeadMarginMax;
  [v34 encodeFloat:@"torsoHeadMarginMax" forKey:v8];
  *(float *)&double v9 = self->_shouldersTwistTargetMin;
  [v34 encodeFloat:@"shouldersTwistTargetMin" forKey:v9];
  *(float *)&double v10 = self->_shouldersTwistTargetMax;
  [v34 encodeFloat:@"shouldersTwistTargetMax" forKey:v10];
  *(float *)&double v11 = self->_shouldersTwistMarginMin;
  [v34 encodeFloat:@"shouldersTwistMarginMin" forKey:v11];
  *(float *)&double v12 = self->_shouldersTwistMarginMax;
  [v34 encodeFloat:@"shouldersTwistMarginMax" forKey:v12];
  *(float *)&double v13 = self->_leftElbowTargetMin;
  [v34 encodeFloat:@"leftElbowTargetMin" forKey:v13];
  *(float *)&double v14 = self->_leftElbowTargetMax;
  [v34 encodeFloat:@"leftElbowTargetMax" forKey:v14];
  *(float *)&double v15 = self->_leftElbowMarginMin;
  [v34 encodeFloat:@"leftElbowMarginMin" forKey:v15];
  *(float *)&double v16 = self->_leftElbowMarginMax;
  [v34 encodeFloat:@"leftElbowMarginMax" forKey:v16];
  *(float *)&double v17 = self->_rightElbowTargetMin;
  [v34 encodeFloat:@"rightElbowTargetMin" forKey:v17];
  *(float *)&double v18 = self->_rightElbowTargetMax;
  [v34 encodeFloat:@"rightElbowTargetMax" forKey:v18];
  *(float *)&double v19 = self->_rightElbowMarginMin;
  [v34 encodeFloat:@"rightElbowMarginMin" forKey:v19];
  *(float *)&double v20 = self->_rightElbowMarginMax;
  [v34 encodeFloat:@"rightElbowMarginMax" forKey:v20];
  *(float *)&double v21 = self->_shouldersHeightAsymmetryTargetMin;
  [v34 encodeFloat:@"shouldersHeightAsymmetryTargetMin" forKey:v21];
  *(float *)&double v22 = self->_shouldersHeightAsymmetryTargetMax;
  [v34 encodeFloat:@"shouldersHeightAsymmetryTargetMax" forKey:v22];
  *(float *)&double v23 = self->_shouldersHeightAsymmetryMarginMin;
  [v34 encodeFloat:@"shouldersHeightAsymmetryMarginMin" forKey:v23];
  *(float *)&double v24 = self->_shouldersHeightAsymmetryMarginMax;
  [v34 encodeFloat:@"shouldersHeightAsymmetryMarginMax" forKey:v24];
  *(float *)&double v25 = self->_leftShoulderForwardTargetMin;
  [v34 encodeFloat:@"leftShoulderForwardTargetMin" forKey:v25];
  *(float *)&double v26 = self->_leftShoulderForwardTargetMax;
  [v34 encodeFloat:@"leftShoulderForwardTargetMax" forKey:v26];
  *(float *)&double v27 = self->_leftShoulderForwardMarginMin;
  [v34 encodeFloat:@"leftShoulderForwardMarginMin" forKey:v27];
  *(float *)&double v28 = self->_leftShoulderForwardMarginMax;
  [v34 encodeFloat:@"leftShoulderForwardMarginMax" forKey:v28];
  *(float *)&double v29 = self->_rightShoulderForwardTargetMin;
  [v34 encodeFloat:@"rightShoulderForwardTargetMin" forKey:v29];
  *(float *)&double v30 = self->_rightShoulderForwardTargetMax;
  [v34 encodeFloat:@"rightShoulderForwardTargetMax" forKey:v30];
  *(float *)&double v31 = self->_rightShoulderForwardMarginMin;
  [v34 encodeFloat:@"rightShoulderForwardMarginMin" forKey:v31];
  *(float *)&double v32 = self->_rightShoulderForwardMarginMax;
  [v34 encodeFloat:@"rightShoulderForwardMarginMax" forKey:v32];
  *(float *)&double v33 = self->_bestAlignmentToleranceAngleFrontPose;
  [v34 encodeFloat:@"bestAlignmentToleranceAngleFrontPose" forKey:v33];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    float torsoHeadTargetMin = self->_torsoHeadTargetMin;
    [v5 torsoHeadTargetMin];
    if (torsoHeadTargetMin != v7) {
      goto LABEL_32;
    }
    float torsoHeadTargetMax = self->_torsoHeadTargetMax;
    [v5 torsoHeadTargetMax];
    if (torsoHeadTargetMax != v9) {
      goto LABEL_32;
    }
    float torsoHeadMarginMin = self->_torsoHeadMarginMin;
    [v5 torsoHeadMarginMin];
    if (torsoHeadMarginMin != v11) {
      goto LABEL_32;
    }
    float torsoHeadMarginMax = self->_torsoHeadMarginMax;
    [v5 torsoHeadMarginMax];
    if (torsoHeadMarginMax != v13) {
      goto LABEL_32;
    }
    float shouldersTwistTargetMin = self->_shouldersTwistTargetMin;
    [v5 shouldersTwistTargetMin];
    if (shouldersTwistTargetMin != v15) {
      goto LABEL_32;
    }
    float shouldersTwistTargetMax = self->_shouldersTwistTargetMax;
    [v5 shouldersTwistTargetMax];
    if (shouldersTwistTargetMax != v17) {
      goto LABEL_32;
    }
    float shouldersTwistMarginMin = self->_shouldersTwistMarginMin;
    [v5 shouldersTwistMarginMin];
    if (shouldersTwistMarginMin != v19) {
      goto LABEL_32;
    }
    float shouldersTwistMarginMax = self->_shouldersTwistMarginMax;
    [v5 shouldersTwistMarginMax];
    if (shouldersTwistMarginMax != v21) {
      goto LABEL_32;
    }
    float leftElbowTargetMin = self->_leftElbowTargetMin;
    [v5 leftElbowTargetMin];
    if (leftElbowTargetMin != v23) {
      goto LABEL_32;
    }
    float leftElbowTargetMax = self->_leftElbowTargetMax;
    [v5 leftElbowTargetMax];
    if (leftElbowTargetMax != v25) {
      goto LABEL_32;
    }
    float leftElbowMarginMin = self->_leftElbowMarginMin;
    [v5 leftElbowMarginMin];
    if (leftElbowMarginMin != v27) {
      goto LABEL_32;
    }
    float leftElbowMarginMax = self->_leftElbowMarginMax;
    [v5 leftElbowMarginMax];
    if (leftElbowMarginMax != v29) {
      goto LABEL_32;
    }
    float rightElbowTargetMin = self->_rightElbowTargetMin;
    [v5 rightElbowTargetMin];
    if (rightElbowTargetMin != v31) {
      goto LABEL_32;
    }
    float rightElbowTargetMax = self->_rightElbowTargetMax;
    [v5 rightElbowTargetMax];
    if (rightElbowTargetMax != v33) {
      goto LABEL_32;
    }
    float rightElbowMarginMin = self->_rightElbowMarginMin;
    [v5 rightElbowMarginMin];
    if (rightElbowMarginMin != v35) {
      goto LABEL_32;
    }
    float rightElbowMarginMax = self->_rightElbowMarginMax;
    [v5 rightElbowMarginMax];
    if (rightElbowMarginMax != v37) {
      goto LABEL_32;
    }
    float shouldersHeightAsymmetryTargetMin = self->_shouldersHeightAsymmetryTargetMin;
    [v5 shouldersHeightAsymmetryTargetMin];
    if (shouldersHeightAsymmetryTargetMin != v39) {
      goto LABEL_32;
    }
    float shouldersHeightAsymmetryTargetMax = self->_shouldersHeightAsymmetryTargetMax;
    [v5 shouldersHeightAsymmetryTargetMax];
    if (shouldersHeightAsymmetryTargetMax != v41) {
      goto LABEL_32;
    }
    float shouldersHeightAsymmetryMarginMin = self->_shouldersHeightAsymmetryMarginMin;
    [v5 shouldersHeightAsymmetryMarginMin];
    if (shouldersHeightAsymmetryMarginMin != v43) {
      goto LABEL_32;
    }
    float shouldersHeightAsymmetryMarginMax = self->_shouldersHeightAsymmetryMarginMax;
    [v5 shouldersHeightAsymmetryMarginMax];
    if (shouldersHeightAsymmetryMarginMax != v45) {
      goto LABEL_32;
    }
    float leftShoulderForwardTargetMin = self->_leftShoulderForwardTargetMin;
    [v5 leftShoulderForwardTargetMin];
    if (leftShoulderForwardTargetMin != v47) {
      goto LABEL_32;
    }
    float leftShoulderForwardTargetMax = self->_leftShoulderForwardTargetMax;
    [v5 leftShoulderForwardTargetMax];
    if (leftShoulderForwardTargetMax != v49) {
      goto LABEL_32;
    }
    float leftShoulderForwardMarginMin = self->_leftShoulderForwardMarginMin;
    [v5 leftShoulderForwardMarginMin];
    if (leftShoulderForwardMarginMin != v51) {
      goto LABEL_32;
    }
    float leftShoulderForwardMarginMax = self->_leftShoulderForwardMarginMax;
    [v5 leftShoulderForwardMarginMax];
    if (leftShoulderForwardMarginMax != v53) {
      goto LABEL_32;
    }
    float rightShoulderForwardTargetMin = self->_rightShoulderForwardTargetMin;
    [v5 rightShoulderForwardTargetMin];
    if (rightShoulderForwardTargetMin != v55) {
      goto LABEL_32;
    }
    float rightShoulderForwardTargetMax = self->_rightShoulderForwardTargetMax;
    [v5 rightShoulderForwardTargetMax];
    if (rightShoulderForwardTargetMax == v57
      && (float rightShoulderForwardMarginMin = self->_rightShoulderForwardMarginMin,
          [v5 rightShoulderForwardMarginMin],
          rightShoulderForwardMarginMin == v59)
      && (float rightShoulderForwardMarginMax = self->_rightShoulderForwardMarginMax,
          [v5 rightShoulderForwardMarginMax],
          rightShoulderForwardMarginMax == v61))
    {
      float bestAlignmentToleranceAngleFrontPose = self->_bestAlignmentToleranceAngleFrontPose;
      [v5 bestAlignmentToleranceAngleFrontPose];
      BOOL v64 = bestAlignmentToleranceAngleFrontPose == v63;
    }
    else
    {
LABEL_32:
      BOOL v64 = 0;
    }
  }
  else
  {
    BOOL v64 = 0;
  }

  return v64;
}

- (id)toDictionary
{
  v64[29] = *MEMORY[0x263EF8340];
  v63[0] = @"torsoHeadTargetMin";
  *(float *)&double v2 = self->_torsoHeadTargetMin;
  float v62 = [NSNumber numberWithFloat:v2];
  v64[0] = v62;
  v63[1] = @"torsoHeadTargetMax";
  *(float *)&double v4 = self->_torsoHeadTargetMax;
  float v61 = [NSNumber numberWithFloat:v4];
  v64[1] = v61;
  v63[2] = @"torsoHeadMarginMin";
  *(float *)&double v5 = self->_torsoHeadMarginMin;
  float v60 = [NSNumber numberWithFloat:v5];
  v64[2] = v60;
  v63[3] = @"torsoHeadMarginMax";
  *(float *)&double v6 = self->_torsoHeadMarginMax;
  float v59 = [NSNumber numberWithFloat:v6];
  v64[3] = v59;
  v63[4] = @"shouldersTwistTargetMin";
  *(float *)&double v7 = self->_shouldersTwistTargetMin;
  float v58 = [NSNumber numberWithFloat:v7];
  v64[4] = v58;
  v63[5] = @"shouldersTwistTargetMax";
  *(float *)&double v8 = self->_shouldersTwistTargetMax;
  float v57 = [NSNumber numberWithFloat:v8];
  v64[5] = v57;
  v63[6] = @"shouldersTwistMarginMin";
  *(float *)&double v9 = self->_shouldersTwistMarginMin;
  float v56 = [NSNumber numberWithFloat:v9];
  v64[6] = v56;
  v63[7] = @"shouldersTwistMarginMax";
  *(float *)&double v10 = self->_shouldersTwistMarginMax;
  float v55 = [NSNumber numberWithFloat:v10];
  v64[7] = v55;
  v63[8] = @"leftElbowTargetMin";
  *(float *)&double v11 = self->_leftElbowTargetMin;
  float v54 = [NSNumber numberWithFloat:v11];
  v64[8] = v54;
  v63[9] = @"leftElbowTargetMax";
  *(float *)&double v12 = self->_leftElbowTargetMax;
  float v53 = [NSNumber numberWithFloat:v12];
  v64[9] = v53;
  v63[10] = @"leftElbowMarginMin";
  *(float *)&double v13 = self->_leftElbowMarginMin;
  float v52 = [NSNumber numberWithFloat:v13];
  v64[10] = v52;
  v63[11] = @"leftElbowMarginMax";
  *(float *)&double v14 = self->_leftElbowMarginMax;
  float v51 = [NSNumber numberWithFloat:v14];
  v64[11] = v51;
  v63[12] = @"rightElbowTargetMin";
  *(float *)&double v15 = self->_rightElbowTargetMin;
  float v50 = [NSNumber numberWithFloat:v15];
  v64[12] = v50;
  v63[13] = @"rightElbowTargetMax";
  *(float *)&double v16 = self->_rightElbowTargetMax;
  float v49 = [NSNumber numberWithFloat:v16];
  v64[13] = v49;
  v63[14] = @"rightElbowMarginMin";
  *(float *)&double v17 = self->_rightElbowMarginMin;
  float v48 = [NSNumber numberWithFloat:v17];
  v64[14] = v48;
  v63[15] = @"rightElbowMarginMax";
  *(float *)&double v18 = self->_rightElbowMarginMax;
  float v47 = [NSNumber numberWithFloat:v18];
  v64[15] = v47;
  v63[16] = @"shouldersHeightAsymmetryTargetMin";
  *(float *)&double v19 = self->_shouldersHeightAsymmetryTargetMin;
  float v46 = [NSNumber numberWithFloat:v19];
  v64[16] = v46;
  v63[17] = @"shouldersHeightAsymmetryTargetMax";
  *(float *)&double v20 = self->_shouldersHeightAsymmetryTargetMax;
  float v45 = [NSNumber numberWithFloat:v20];
  v64[17] = v45;
  v63[18] = @"shouldersHeightAsymmetryMarginMin";
  *(float *)&double v21 = self->_shouldersHeightAsymmetryMarginMin;
  float v44 = [NSNumber numberWithFloat:v21];
  v64[18] = v44;
  v63[19] = @"shouldersHeightAsymmetryMarginMax";
  *(float *)&double v22 = self->_shouldersHeightAsymmetryMarginMax;
  float v43 = [NSNumber numberWithFloat:v22];
  v64[19] = v43;
  v63[20] = @"leftShoulderForwardTargetMin";
  *(float *)&double v23 = self->_leftShoulderForwardTargetMin;
  double v24 = [NSNumber numberWithFloat:v23];
  v64[20] = v24;
  v63[21] = @"leftShoulderForwardTargetMax";
  *(float *)&double v25 = self->_leftShoulderForwardTargetMax;
  double v26 = [NSNumber numberWithFloat:v25];
  v64[21] = v26;
  v63[22] = @"leftShoulderForwardMarginMin";
  *(float *)&double v27 = self->_leftShoulderForwardMarginMin;
  double v28 = [NSNumber numberWithFloat:v27];
  v64[22] = v28;
  v63[23] = @"leftShoulderForwardMarginMax";
  *(float *)&double v29 = self->_leftShoulderForwardMarginMax;
  double v30 = [NSNumber numberWithFloat:v29];
  v64[23] = v30;
  v63[24] = @"rightShoulderForwardTargetMin";
  *(float *)&double v31 = self->_rightShoulderForwardTargetMin;
  double v32 = [NSNumber numberWithFloat:v31];
  v64[24] = v32;
  v63[25] = @"rightShoulderForwardTargetMax";
  *(float *)&double v33 = self->_rightShoulderForwardTargetMax;
  id v34 = [NSNumber numberWithFloat:v33];
  v64[25] = v34;
  v63[26] = @"rightShoulderForwardMarginMin";
  *(float *)&double v35 = self->_rightShoulderForwardMarginMin;
  float v36 = [NSNumber numberWithFloat:v35];
  v64[26] = v36;
  v63[27] = @"rightShoulderForwardMarginMax";
  *(float *)&double v37 = self->_rightShoulderForwardMarginMax;
  float v38 = [NSNumber numberWithFloat:v37];
  v64[27] = v38;
  v63[28] = @"bestAlignmentToleranceAngleFrontPose";
  *(float *)&double v39 = self->_bestAlignmentToleranceAngleFrontPose;
  float v40 = [NSNumber numberWithFloat:v39];
  v64[28] = v40;
  float v41 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:29];

  return v41;
}

- (float)torsoHeadTargetMin
{
  return self->_torsoHeadTargetMin;
}

- (void)setTorsoHeadTargetMin:(float)a3
{
  self->_float torsoHeadTargetMin = a3;
}

- (float)torsoHeadTargetMax
{
  return self->_torsoHeadTargetMax;
}

- (void)setTorsoHeadTargetMax:(float)a3
{
  self->_float torsoHeadTargetMax = a3;
}

- (float)torsoHeadMarginMin
{
  return self->_torsoHeadMarginMin;
}

- (void)setTorsoHeadMarginMin:(float)a3
{
  self->_float torsoHeadMarginMin = a3;
}

- (float)torsoHeadMarginMax
{
  return self->_torsoHeadMarginMax;
}

- (void)setTorsoHeadMarginMax:(float)a3
{
  self->_float torsoHeadMarginMax = a3;
}

- (float)shouldersTwistTargetMin
{
  return self->_shouldersTwistTargetMin;
}

- (void)setShouldersTwistTargetMin:(float)a3
{
  self->_float shouldersTwistTargetMin = a3;
}

- (float)shouldersTwistTargetMax
{
  return self->_shouldersTwistTargetMax;
}

- (void)setShouldersTwistTargetMax:(float)a3
{
  self->_float shouldersTwistTargetMax = a3;
}

- (float)shouldersTwistMarginMin
{
  return self->_shouldersTwistMarginMin;
}

- (void)setShouldersTwistMarginMin:(float)a3
{
  self->_float shouldersTwistMarginMin = a3;
}

- (float)shouldersTwistMarginMax
{
  return self->_shouldersTwistMarginMax;
}

- (void)setShouldersTwistMarginMax:(float)a3
{
  self->_float shouldersTwistMarginMax = a3;
}

- (float)leftElbowTargetMin
{
  return self->_leftElbowTargetMin;
}

- (void)setLeftElbowTargetMin:(float)a3
{
  self->_float leftElbowTargetMin = a3;
}

- (float)leftElbowTargetMax
{
  return self->_leftElbowTargetMax;
}

- (void)setLeftElbowTargetMax:(float)a3
{
  self->_float leftElbowTargetMax = a3;
}

- (float)leftElbowMarginMin
{
  return self->_leftElbowMarginMin;
}

- (void)setLeftElbowMarginMin:(float)a3
{
  self->_float leftElbowMarginMin = a3;
}

- (float)leftElbowMarginMax
{
  return self->_leftElbowMarginMax;
}

- (void)setLeftElbowMarginMax:(float)a3
{
  self->_float leftElbowMarginMax = a3;
}

- (float)rightElbowTargetMin
{
  return self->_rightElbowTargetMin;
}

- (void)setRightElbowTargetMin:(float)a3
{
  self->_float rightElbowTargetMin = a3;
}

- (float)rightElbowTargetMax
{
  return self->_rightElbowTargetMax;
}

- (void)setRightElbowTargetMax:(float)a3
{
  self->_float rightElbowTargetMax = a3;
}

- (float)rightElbowMarginMin
{
  return self->_rightElbowMarginMin;
}

- (void)setRightElbowMarginMin:(float)a3
{
  self->_float rightElbowMarginMin = a3;
}

- (float)rightElbowMarginMax
{
  return self->_rightElbowMarginMax;
}

- (void)setRightElbowMarginMax:(float)a3
{
  self->_float rightElbowMarginMax = a3;
}

- (float)shouldersHeightAsymmetryTargetMin
{
  return self->_shouldersHeightAsymmetryTargetMin;
}

- (void)setShouldersHeightAsymmetryTargetMin:(float)a3
{
  self->_float shouldersHeightAsymmetryTargetMin = a3;
}

- (float)shouldersHeightAsymmetryTargetMax
{
  return self->_shouldersHeightAsymmetryTargetMax;
}

- (void)setShouldersHeightAsymmetryTargetMax:(float)a3
{
  self->_float shouldersHeightAsymmetryTargetMax = a3;
}

- (float)shouldersHeightAsymmetryMarginMin
{
  return self->_shouldersHeightAsymmetryMarginMin;
}

- (void)setShouldersHeightAsymmetryMarginMin:(float)a3
{
  self->_float shouldersHeightAsymmetryMarginMin = a3;
}

- (float)shouldersHeightAsymmetryMarginMax
{
  return self->_shouldersHeightAsymmetryMarginMax;
}

- (void)setShouldersHeightAsymmetryMarginMax:(float)a3
{
  self->_float shouldersHeightAsymmetryMarginMax = a3;
}

- (float)leftShoulderForwardTargetMin
{
  return self->_leftShoulderForwardTargetMin;
}

- (void)setLeftShoulderForwardTargetMin:(float)a3
{
  self->_float leftShoulderForwardTargetMin = a3;
}

- (float)leftShoulderForwardTargetMax
{
  return self->_leftShoulderForwardTargetMax;
}

- (void)setLeftShoulderForwardTargetMax:(float)a3
{
  self->_float leftShoulderForwardTargetMax = a3;
}

- (float)leftShoulderForwardMarginMin
{
  return self->_leftShoulderForwardMarginMin;
}

- (void)setLeftShoulderForwardMarginMin:(float)a3
{
  self->_float leftShoulderForwardMarginMin = a3;
}

- (float)leftShoulderForwardMarginMax
{
  return self->_leftShoulderForwardMarginMax;
}

- (void)setLeftShoulderForwardMarginMax:(float)a3
{
  self->_float leftShoulderForwardMarginMax = a3;
}

- (float)rightShoulderForwardTargetMin
{
  return self->_rightShoulderForwardTargetMin;
}

- (void)setRightShoulderForwardTargetMin:(float)a3
{
  self->_float rightShoulderForwardTargetMin = a3;
}

- (float)rightShoulderForwardTargetMax
{
  return self->_rightShoulderForwardTargetMax;
}

- (void)setRightShoulderForwardTargetMax:(float)a3
{
  self->_float rightShoulderForwardTargetMax = a3;
}

- (float)rightShoulderForwardMarginMin
{
  return self->_rightShoulderForwardMarginMin;
}

- (void)setRightShoulderForwardMarginMin:(float)a3
{
  self->_float rightShoulderForwardMarginMin = a3;
}

- (float)rightShoulderForwardMarginMax
{
  return self->_rightShoulderForwardMarginMax;
}

- (void)setRightShoulderForwardMarginMax:(float)a3
{
  self->_float rightShoulderForwardMarginMax = a3;
}

- (float)bestAlignmentToleranceAngleFrontPose
{
  return self->_bestAlignmentToleranceAngleFrontPose;
}

- (void)setBestAlignmentToleranceAngleFrontPose:(float)a3
{
  self->_float bestAlignmentToleranceAngleFrontPose = a3;
}

@end