@interface SBSceneHostingDisplayPreferences
- (BOOL)keepOtherModes;
- (CADisplayModeCriteria)CADisplayModeCriteria;
- (CGSize)logicalScale;
- (FBSDisplayConfigurationRequest)displayConfigurationRequest;
- (SBSceneHostingDisplayPreferences)initWithDisplayConfigurationRequest:(id)a3 logicalScale:(CGSize)a4 contentsScale:(double)a5 keepOtherModes:(BOOL)a6;
- (double)contentsScale;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SBSceneHostingDisplayPreferences

- (SBSceneHostingDisplayPreferences)initWithDisplayConfigurationRequest:(id)a3 logicalScale:(CGSize)a4 contentsScale:(double)a5 keepOtherModes:(BOOL)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBSceneHostingDisplayPreferences;
  v12 = [(SBSceneHostingDisplayPreferences *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    displayConfigurationRequest = v12->_displayConfigurationRequest;
    v12->_displayConfigurationRequest = (FBSDisplayConfigurationRequest *)v13;

    v12->_logicalScale.CGFloat width = width;
    v12->_logicalScale.CGFloat height = height;
    v12->_contentsScale = a5;
    v12->_keepOtherModes = a6;
    v15 = (CADisplayModeCriteria *)objc_alloc_init(MEMORY[0x1E4F39B78]);
    CADisplayModeCriteria = v12->_CADisplayModeCriteria;
    v12->_CADisplayModeCriteria = v15;

    v17 = v12->_CADisplayModeCriteria;
    [(FBSDisplayConfigurationRequest *)v12->_displayConfigurationRequest nativePixelSize];
    -[CADisplayModeCriteria setResolution:](v17, "setResolution:");
    v18 = v12->_CADisplayModeCriteria;
    [(FBSDisplayConfigurationRequest *)v12->_displayConfigurationRequest refreshRate];
    -[CADisplayModeCriteria setRefreshRate:](v18, "setRefreshRate:");
    v19 = v12->_CADisplayModeCriteria;
    [(FBSDisplayConfigurationRequest *)v12->_displayConfigurationRequest hdrMode];
    v20 = FBSDisplayHDRModeToCADisplayHDRMode();
    [(CADisplayModeCriteria *)v19 setHdrMode:v20];
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  displayConfigurationRequest = v3->_displayConfigurationRequest;
  double contentsScale = v3->_contentsScale;
  BOOL keepOtherModes = v3->_keepOtherModes;
  double width = v3->_logicalScale.width;
  double height = v3->_logicalScale.height;
  return -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:](v3, "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", displayConfigurationRequest, keepOtherModes, width, height, contentsScale);
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return self->_displayConfigurationRequest;
}

- (CGSize)logicalScale
{
  double width = self->_logicalScale.width;
  double height = self->_logicalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (BOOL)keepOtherModes
{
  return self->_keepOtherModes;
}

- (CADisplayModeCriteria)CADisplayModeCriteria
{
  return self->_CADisplayModeCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CADisplayModeCriteria, 0);
  objc_storeStrong((id *)&self->_displayConfigurationRequest, 0);
}

@end