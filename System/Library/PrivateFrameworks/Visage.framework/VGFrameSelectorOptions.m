@interface VGFrameSelectorOptions
+ (id)optionsWithCaptureOptions:(id)a3;
- (BOOL)detectFrontPose;
- (BOOL)useDepthFovFilterForBadAlignment;
- (BOOL)useSimpleSelector;
- (BOOL)useVNFaceLandmarksFilter;
- (BOOL)useVNFilters;
- (NSArray)frontExpressionFilters;
- (NSArray)pitchAngles;
- (NSArray)pitchExpressionFilters;
- (NSArray)yawAngles;
- (NSArray)yawExpressionFilters;
- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions;
- (VGFrameSelectorFrustumOffsets)frontPoseFrustumOffsets;
- (VGFrameSelectorFrustumOffsets)pitchPosesFrustumOffsets;
- (VGFrameSelectorFrustumOffsets)yawPosesFrustumOffsets;
- (VGFrameSelectorMarginRatio)frontPoseMarginRatio;
- (VGFrameSelectorMarginRatio)pitchMarginRatio;
- (VGFrameSelectorMarginRatio)yawMarginRatio;
- (float)pitchLimit;
- (float)simpleSelectorMaxOffsetAngle;
- (float)simpleSelectorMinOffsetAngle;
- (float)vnFrontPoseBlinkThreshold;
- (float)yawLimit;
- (unint64_t)pitchFrameCount;
- (unint64_t)yawFrameCount;
- (void)_setOptionsForFrontPose:(id)a3;
- (void)_setOptionsForPitchPoses:(id)a3;
- (void)_setOptionsForYawPoses:(id)a3;
- (void)setBodyPoseGuidanceOptions:(id)a3;
- (void)setDetectFrontPose:(BOOL)a3;
- (void)setFrontExpressionFilters:(id)a3;
- (void)setFrontPoseFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3;
- (void)setFrontPoseMarginRatio:(id)a3;
- (void)setPitchAngles:(id)a3;
- (void)setPitchExpressionFilters:(id)a3;
- (void)setPitchFrameCount:(unint64_t)a3;
- (void)setPitchLimit:(float)a3;
- (void)setPitchMarginRatio:(id)a3;
- (void)setPitchPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3;
- (void)setSimpleSelectorMaxOffsetAngle:(float)a3;
- (void)setSimpleSelectorMinOffsetAngle:(float)a3;
- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3;
- (void)setUseSimpleSelector:(BOOL)a3;
- (void)setUseVNFaceLandmarksFilter:(BOOL)a3;
- (void)setUseVNFilters:(BOOL)a3;
- (void)setVnFrontPoseBlinkThreshold:(float)a3;
- (void)setYawAngles:(id)a3;
- (void)setYawExpressionFilters:(id)a3;
- (void)setYawFrameCount:(unint64_t)a3;
- (void)setYawLimit:(float)a3;
- (void)setYawMarginRatio:(id)a3;
- (void)setYawPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3;
@end

@implementation VGFrameSelectorOptions

- (void)_setOptionsForFrontPose:(id)a3
{
  id v26 = a3;
  [(VGFrameSelectorOptions *)self setDetectFrontPose:1];
  v4 = [v26 frontPoseSelectionFrustum];
  [v4 yawOffsetLeft];
  int v6 = v5;
  v7 = [v26 frontPoseSelectionFrustum];
  [v7 yawOffsetRight];
  int v9 = v8;
  v10 = [v26 frontPoseSelectionFrustum];
  [v10 pitchOffsetTop];
  int v12 = v11;
  v13 = [v26 frontPoseSelectionFrustum];
  [v13 pitchOffsetBottom];
  LODWORD(v15) = v14;
  LODWORD(v16) = v6;
  LODWORD(v17) = v9;
  LODWORD(v18) = v12;
  -[VGFrameSelectorOptions setFrontPoseFrustumOffsets:](self, "setFrontPoseFrustumOffsets:", v16, v17, v18, v15);

  v19 = +[VGExpressionFilterLegacy getFrontExpressionFiltersForCaptureOptions:v26];
  [(VGFrameSelectorOptions *)self setFrontExpressionFilters:v19];

  if ([v26 useFovMarginsFilterFrontPose])
  {
    v20 = objc_opt_new();
    [v26 topMarginHeadRatio];
    objc_msgSend(v20, "setTopMarginHeadRatio:");
    [v26 leftMarginFrontPoseHeadRatio];
    objc_msgSend(v20, "setLeftMarginHeadRatio:");
    [v26 rightMarginFrontPoseHeadRatio];
    objc_msgSend(v20, "setRightMarginHeadRatio:");
    [v26 bottomMarginHeadRatio];
    float v22 = v21;
    [v26 bottomMarginFrontPoseDelta];
    *(float *)&double v24 = v22 + v23;
    [v20 setBottomMarginHeadRatio:v24];
    [(VGFrameSelectorOptions *)self setFrontPoseMarginRatio:v20];
  }
  v25 = [v26 bodyPoseGuidanceOptions];
  [(VGFrameSelectorOptions *)self setBodyPoseGuidanceOptions:v25];
}

- (void)_setOptionsForYawPoses:(id)a3
{
  id v23 = a3;
  -[VGFrameSelectorOptions setYawFrameCount:](self, "setYawFrameCount:", [v23 requiredYawPoses]);
  [v23 yawLimit];
  double v5 = v4 * 3.14159265 / 180.0;
  *(float *)&double v5 = v5;
  [(VGFrameSelectorOptions *)self setYawLimit:v5];
  int v6 = [v23 selectionFrustum];
  [v6 yawOffsetLeft];
  int v8 = v7;
  int v9 = [v23 selectionFrustum];
  [v9 yawOffsetRight];
  int v11 = v10;
  int v12 = [v23 selectionFrustum];
  [v12 pitchOffsetTop];
  int v14 = v13;
  double v15 = [v23 selectionFrustum];
  [v15 pitchOffsetBottom];
  LODWORD(v17) = v16;
  LODWORD(v18) = v8;
  LODWORD(v19) = v11;
  LODWORD(v20) = v14;
  -[VGFrameSelectorOptions setYawPosesFrustumOffsets:](self, "setYawPosesFrustumOffsets:", v18, v19, v20, v17);

  float v21 = +[VGExpressionFilterLegacy getExpressionFiltersForCaptureOptions:v23];
  [(VGFrameSelectorOptions *)self setYawExpressionFilters:v21];

  if ([v23 useFovMarginsFilterNonFrontPose])
  {
    float v22 = objc_opt_new();
    [v23 topMarginHeadRatio];
    objc_msgSend(v22, "setTopMarginHeadRatio:");
    [v23 leftMarginHeadRatio];
    objc_msgSend(v22, "setLeftMarginHeadRatio:");
    [v23 rightMarginHeadRatio];
    objc_msgSend(v22, "setRightMarginHeadRatio:");
    [v23 bottomMarginHeadRatio];
    objc_msgSend(v22, "setBottomMarginHeadRatio:");
    [(VGFrameSelectorOptions *)self setYawMarginRatio:v22];
  }
}

- (void)_setOptionsForPitchPoses:(id)a3
{
  id v27 = a3;
  -[VGFrameSelectorOptions setPitchFrameCount:](self, "setPitchFrameCount:", [v27 requiredPitchPoses]);
  [v27 pitchLimit];
  double v5 = v4 * 3.14159265 / 180.0;
  *(float *)&double v5 = v5;
  [(VGFrameSelectorOptions *)self setPitchLimit:v5];
  int v6 = [v27 selectionFrustum];
  [v6 yawOffsetLeft];
  int v8 = v7;
  int v9 = [v27 selectionFrustum];
  [v9 yawOffsetRight];
  int v11 = v10;
  int v12 = [v27 selectionFrustum];
  [v12 pitchOffsetTop];
  int v14 = v13;
  double v15 = [v27 selectionFrustum];
  [v15 pitchOffsetBottom];
  LODWORD(v17) = v16;
  LODWORD(v18) = v8;
  LODWORD(v19) = v11;
  LODWORD(v20) = v14;
  -[VGFrameSelectorOptions setPitchPosesFrustumOffsets:](self, "setPitchPosesFrustumOffsets:", v18, v19, v20, v17);

  float v21 = +[VGExpressionFilterLegacy getExpressionFiltersForCaptureOptions:v27];
  [(VGFrameSelectorOptions *)self setPitchExpressionFilters:v21];

  if ([v27 useFovMarginsFilterNonFrontPose])
  {
    float v22 = objc_opt_new();
    [v27 topMarginHeadRatio];
    objc_msgSend(v22, "setTopMarginHeadRatio:");
    [v27 leftMarginHeadRatio];
    objc_msgSend(v22, "setLeftMarginHeadRatio:");
    [v27 rightMarginHeadRatio];
    objc_msgSend(v22, "setRightMarginHeadRatio:");
    [v27 bottomMarginHeadRatio];
    float v24 = v23;
    [v27 bottomMarginPitchPoseDelta];
    *(float *)&double v26 = fmaxf(v24 + v25, 0.0);
    [v22 setBottomMarginHeadRatio:v26];
    [(VGFrameSelectorOptions *)self setPitchMarginRatio:v22];
  }
}

+ (id)optionsWithCaptureOptions:(id)a3
{
  id v3 = a3;
  float v4 = objc_opt_new();
  objc_msgSend(v4, "setUseSimpleSelector:", objc_msgSend(v3, "useSimpleSelector"));
  [v3 simpleSelectorMinOffsetAngle];
  objc_msgSend(v4, "setSimpleSelectorMinOffsetAngle:");
  [v3 simpleSelectorMaxOffsetAngle];
  objc_msgSend(v4, "setSimpleSelectorMaxOffsetAngle:");
  objc_msgSend(v4, "setUseVNFilters:", objc_msgSend(v3, "useVNFilters"));
  [v3 vnFrontPoseBlinkThreshold];
  objc_msgSend(v4, "setVnFrontPoseBlinkThreshold:");
  objc_msgSend(v4, "setUseVNFaceLandmarksFilter:", objc_msgSend(v3, "useVNFaceLandmarksFilter"));
  objc_msgSend(v4, "setUseDepthFovFilterForBadAlignment:", objc_msgSend(v3, "useDepthFovFilterForBadAlignment"));
  [v4 _setOptionsForFrontPose:v3];
  [v4 _setOptionsForYawPoses:v3];
  [v4 _setOptionsForPitchPoses:v3];

  return v4;
}

- (unint64_t)yawFrameCount
{
  return self->_yawFrameCount;
}

- (void)setYawFrameCount:(unint64_t)a3
{
  self->_yawFrameCount = a3;
}

- (unint64_t)pitchFrameCount
{
  return self->_pitchFrameCount;
}

- (void)setPitchFrameCount:(unint64_t)a3
{
  self->_pitchFrameCount = a3;
}

- (float)yawLimit
{
  return self->_yawLimit;
}

- (void)setYawLimit:(float)a3
{
  self->_yawLimit = a3;
}

- (float)pitchLimit
{
  return self->_pitchLimit;
}

- (void)setPitchLimit:(float)a3
{
  self->_pitchLimit = a3;
}

- (BOOL)detectFrontPose
{
  return self->_detectFrontPose;
}

- (void)setDetectFrontPose:(BOOL)a3
{
  self->_detectFrontPose = a3;
}

- (NSArray)frontExpressionFilters
{
  return self->_frontExpressionFilters;
}

- (void)setFrontExpressionFilters:(id)a3
{
}

- (NSArray)yawExpressionFilters
{
  return self->_yawExpressionFilters;
}

- (void)setYawExpressionFilters:(id)a3
{
}

- (NSArray)pitchExpressionFilters
{
  return self->_pitchExpressionFilters;
}

- (void)setPitchExpressionFilters:(id)a3
{
}

- (NSArray)yawAngles
{
  return self->_yawAngles;
}

- (void)setYawAngles:(id)a3
{
}

- (NSArray)pitchAngles
{
  return self->_pitchAngles;
}

- (void)setPitchAngles:(id)a3
{
}

- (BOOL)useSimpleSelector
{
  return self->_useSimpleSelector;
}

- (void)setUseSimpleSelector:(BOOL)a3
{
  self->_useSimpleSelector = a3;
}

- (float)simpleSelectorMinOffsetAngle
{
  return self->_simpleSelectorMinOffsetAngle;
}

- (void)setSimpleSelectorMinOffsetAngle:(float)a3
{
  self->_simpleSelectorMinOffsetAngle = a3;
}

- (float)simpleSelectorMaxOffsetAngle
{
  return self->_simpleSelectorMaxOffsetAngle;
}

- (void)setSimpleSelectorMaxOffsetAngle:(float)a3
{
  self->_simpleSelectorMaxOffsetAngle = a3;
}

- (VGFrameSelectorMarginRatio)yawMarginRatio
{
  return self->_yawMarginRatio;
}

- (void)setYawMarginRatio:(id)a3
{
}

- (VGFrameSelectorMarginRatio)pitchMarginRatio
{
  return self->_pitchMarginRatio;
}

- (void)setPitchMarginRatio:(id)a3
{
}

- (VGFrameSelectorMarginRatio)frontPoseMarginRatio
{
  return self->_frontPoseMarginRatio;
}

- (void)setFrontPoseMarginRatio:(id)a3
{
}

- (VGFrameSelectorFrustumOffsets)frontPoseFrustumOffsets
{
  float yawOffsetDegreesLeft = self->_frontPoseFrustumOffsets.yawOffsetDegreesLeft;
  float yawOffsetDegreesRight = self->_frontPoseFrustumOffsets.yawOffsetDegreesRight;
  float pitchOffsetDegreesTop = self->_frontPoseFrustumOffsets.pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom = self->_frontPoseFrustumOffsets.pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.float yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.float yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setFrontPoseFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_frontPoseFrustumOffsets = a3;
}

- (VGFrameSelectorFrustumOffsets)yawPosesFrustumOffsets
{
  float yawOffsetDegreesLeft = self->_yawPosesFrustumOffsets.yawOffsetDegreesLeft;
  float yawOffsetDegreesRight = self->_yawPosesFrustumOffsets.yawOffsetDegreesRight;
  float pitchOffsetDegreesTop = self->_yawPosesFrustumOffsets.pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom = self->_yawPosesFrustumOffsets.pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.float yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.float yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setYawPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_yawPosesFrustumOffsets = a3;
}

- (VGFrameSelectorFrustumOffsets)pitchPosesFrustumOffsets
{
  float yawOffsetDegreesLeft = self->_pitchPosesFrustumOffsets.yawOffsetDegreesLeft;
  float yawOffsetDegreesRight = self->_pitchPosesFrustumOffsets.yawOffsetDegreesRight;
  float pitchOffsetDegreesTop = self->_pitchPosesFrustumOffsets.pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom = self->_pitchPosesFrustumOffsets.pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.float pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.float yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.float yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setPitchPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_pitchPosesFrustumOffsets = a3;
}

- (BOOL)useVNFilters
{
  return self->_useVNFilters;
}

- (void)setUseVNFilters:(BOOL)a3
{
  self->_useVNFilters = a3;
}

- (float)vnFrontPoseBlinkThreshold
{
  return self->_vnFrontPoseBlinkThreshold;
}

- (void)setVnFrontPoseBlinkThreshold:(float)a3
{
  self->_vnFrontPoseBlinkThreshold = a3;
}

- (BOOL)useVNFaceLandmarksFilter
{
  return self->_useVNFaceLandmarksFilter;
}

- (void)setUseVNFaceLandmarksFilter:(BOOL)a3
{
  self->_useVNFaceLandmarksFilter = a3;
}

- (BOOL)useDepthFovFilterForBadAlignment
{
  return self->_useDepthFovFilterForBadAlignment;
}

- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3
{
  self->_useDepthFovFilterForBadAlignment = a3;
}

- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions
{
  return self->_bodyPoseGuidanceOptions;
}

- (void)setBodyPoseGuidanceOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, 0);
  objc_storeStrong((id *)&self->_frontPoseMarginRatio, 0);
  objc_storeStrong((id *)&self->_pitchMarginRatio, 0);
  objc_storeStrong((id *)&self->_yawMarginRatio, 0);
  objc_storeStrong((id *)&self->_pitchAngles, 0);
  objc_storeStrong((id *)&self->_yawAngles, 0);
  objc_storeStrong((id *)&self->_pitchExpressionFilters, 0);
  objc_storeStrong((id *)&self->_yawExpressionFilters, 0);

  objc_storeStrong((id *)&self->_frontExpressionFilters, 0);
}

@end