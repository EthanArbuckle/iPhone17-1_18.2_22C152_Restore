@interface VGFaceCaptureOptions
+ (BOOL)supportsSecureCoding;
+ (float)defaultAmbientLightFilterLowThreshold;
+ (float)defaultDistanceFilterCloseThreshold;
+ (float)defaultDistanceFilterFarThreshold;
+ (float)defaultEyesForwardAngleSensitivity;
+ (float)defaultEyesOpenSensitivity;
+ (float)defaultMotionBlurThreshold;
+ (float)defaultNeutralExpressionLowerBound;
+ (float)defaultNeutralExpressionUpperBound;
+ (float)defaultPitchLimit;
+ (float)defaultSimpleSelectorMaxOffsetAngle;
+ (float)defaultSimpleSelectorMinOffsetAngle;
+ (float)defaultVNFrontPoseBlinkThreshold;
+ (float)defaultYawLimit;
+ (unint64_t)defaultRequiredPitchPoses;
+ (unint64_t)defaultRequiredYawPoses;
- (BOOL)convertFKTrackingDictToARKitDict;
- (BOOL)ensureAlmostNeutralExpressionOnNonFrontPose;
- (BOOL)ensureEyesForwardOnFrontPose;
- (BOOL)ensureEyesOpenOnFrontPose;
- (BOOL)ensureEyesOpenOnNonFrontPose;
- (BOOL)ensureNeutralExpressionOnFrontPose;
- (BOOL)isEqual:(id)a3;
- (BOOL)sendMetrics;
- (BOOL)useAmbientLightFilter;
- (BOOL)useDepthFovFilter;
- (BOOL)useDepthFovFilterForBadAlignment;
- (BOOL)useDistanceFilter;
- (BOOL)useFKForceCPU;
- (BOOL)useFKInternalFaceDetector;
- (BOOL)useFaceTrackingDictionary;
- (BOOL)useFovMarginsFilterFrontPose;
- (BOOL)useFovMarginsFilterNonFrontPose;
- (BOOL)useLookAtForEyesForward;
- (BOOL)useMotionBlurFilter;
- (BOOL)useSimpleSelector;
- (BOOL)useTrackedFaceIdentifierFilter;
- (BOOL)useVNFaceLandmarksFilter;
- (BOOL)useVNFilters;
- (BOOL)useVNFiltersEnrollment;
- (BOOL)writeDebugData;
- (NSArray)requiredExpressions;
- (NSString)cameraImageColorSpaceName;
- (NSString)debugDataPath;
- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions;
- (VGFaceCaptureOptions)init;
- (VGFaceCaptureOptions)initWithCoder:(id)a3;
- (VGFaceCaptureOptions)initWithSuiteName:(id)a3;
- (VGFaceSelectionFrustum)frontPoseSelectionFrustum;
- (VGFaceSelectionFrustum)selectionFrustum;
- (float)ambientLightFilterLowThreshold;
- (float)bottomMarginFrontPoseDelta;
- (float)bottomMarginHeadRatio;
- (float)bottomMarginPitchPoseDelta;
- (float)distanceFilterCloseThreshold;
- (float)distanceFilterFarThreshold;
- (float)eyesForwardPitchSensitivity;
- (float)eyesForwardYawSensitivity;
- (float)eyesOpenSensitivity;
- (float)leftMarginFrontPoseHeadRatio;
- (float)leftMarginHeadRatio;
- (float)motionBlurThreshold;
- (float)neutralExpressionLowerBound;
- (float)neutralExpressionUpperBound;
- (float)pitchLimit;
- (float)rightMarginFrontPoseHeadRatio;
- (float)rightMarginHeadRatio;
- (float)simpleSelectorMaxOffsetAngle;
- (float)simpleSelectorMinOffsetAngle;
- (float)topMarginHeadRatio;
- (float)vnFrontPoseBlinkThreshold;
- (float)yawLimit;
- (id)description;
- (id)toDictionary;
- (unint64_t)requiredPitchPoses;
- (unint64_t)requiredYawPoses;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientLightFilterLowThreshold:(float)a3;
- (void)setBodyPoseGuidanceOptions:(id)a3;
- (void)setBottomMarginFrontPoseDelta:(float)a3;
- (void)setBottomMarginHeadRatio:(float)a3;
- (void)setBottomMarginPitchPoseDelta:(float)a3;
- (void)setCameraImageColorSpaceName:(id)a3;
- (void)setConvertFKTrackingDictToARKitDict:(BOOL)a3;
- (void)setDebugDataPath:(id)a3;
- (void)setDefaultsWithSuiteName:(id)a3;
- (void)setDistanceFilterCloseThreshold:(float)a3;
- (void)setDistanceFilterFarThreshold:(float)a3;
- (void)setEnsureAlmostNeutralExpressionOnNonFrontPose:(BOOL)a3;
- (void)setEnsureEyesForwardOnFrontPose:(BOOL)a3;
- (void)setEnsureEyesOpenOnFrontPose:(BOOL)a3;
- (void)setEnsureEyesOpenOnNonFrontPose:(BOOL)a3;
- (void)setEnsureNeutralExpressionOnFrontPose:(BOOL)a3;
- (void)setEyesForwardPitchSensitivity:(float)a3;
- (void)setEyesForwardYawSensitivity:(float)a3;
- (void)setEyesOpenSensitivity:(float)a3;
- (void)setFrontPoseSelectionFrustum:(id)a3;
- (void)setLeftMarginFrontPoseHeadRatio:(float)a3;
- (void)setLeftMarginHeadRatio:(float)a3;
- (void)setMotionBlurThreshold:(float)a3;
- (void)setNeutralExpressionLowerBound:(float)a3;
- (void)setNeutralExpressionUpperBound:(float)a3;
- (void)setPitchLimit:(float)a3;
- (void)setRequiredExpressions:(id)a3;
- (void)setRequiredPitchPoses:(unint64_t)a3;
- (void)setRequiredYawPoses:(unint64_t)a3;
- (void)setRightMarginFrontPoseHeadRatio:(float)a3;
- (void)setRightMarginHeadRatio:(float)a3;
- (void)setSelectionFrustum:(id)a3;
- (void)setSendMetrics:(BOOL)a3;
- (void)setSimpleSelectorMaxOffsetAngle:(float)a3;
- (void)setSimpleSelectorMinOffsetAngle:(float)a3;
- (void)setTopMarginHeadRatio:(float)a3;
- (void)setUseAmbientLightFilter:(BOOL)a3;
- (void)setUseDepthFovFilter:(BOOL)a3;
- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3;
- (void)setUseDistanceFilter:(BOOL)a3;
- (void)setUseFKForceCPU:(BOOL)a3;
- (void)setUseFKInternalFaceDetector:(BOOL)a3;
- (void)setUseFaceTrackingDictionary:(BOOL)a3;
- (void)setUseFovMarginsFilterFrontPose:(BOOL)a3;
- (void)setUseFovMarginsFilterNonFrontPose:(BOOL)a3;
- (void)setUseLookAtForEyesForward:(BOOL)a3;
- (void)setUseMotionBlurFilter:(BOOL)a3;
- (void)setUseSimpleSelector:(BOOL)a3;
- (void)setUseTrackedFaceIdentifierFilter:(BOOL)a3;
- (void)setUseVNFaceLandmarksFilter:(BOOL)a3;
- (void)setUseVNFilters:(BOOL)a3;
- (void)setUseVNFiltersEnrollment:(BOOL)a3;
- (void)setVnFrontPoseBlinkThreshold:(float)a3;
- (void)setWriteDebugData:(BOOL)a3;
- (void)setYawLimit:(float)a3;
@end

@implementation VGFaceCaptureOptions

- (VGFaceCaptureOptions)init
{
  v27.receiver = self;
  v27.super_class = (Class)VGFaceCaptureOptions;
  v2 = [(VGFaceCaptureOptions *)&v27 init];
  if (v2)
  {
    *((void *)v2 + 15) = [(id)objc_opt_class() defaultRequiredYawPoses];
    uint64_t v3 = [(id)objc_opt_class() defaultRequiredPitchPoses];
    v4 = (void *)*((void *)v2 + 17);
    uint64_t v5 = MEMORY[0x263EFFA68];
    *((void *)v2 + 16) = v3;
    *((void *)v2 + 17) = v5;

    [(id)objc_opt_class() defaultYawLimit];
    *((_DWORD *)v2 + 8) = v6;
    [(id)objc_opt_class() defaultPitchLimit];
    *((_DWORD *)v2 + 9) = v7;
    [(id)objc_opt_class() defaultEyesForwardAngleSensitivity];
    *((_DWORD *)v2 + 10) = v8;
    [(id)objc_opt_class() defaultEyesForwardAngleSensitivity];
    *((_DWORD *)v2 + 11) = v9;
    [(id)objc_opt_class() defaultEyesOpenSensitivity];
    *((_DWORD *)v2 + 12) = v10;
    [(id)objc_opt_class() defaultNeutralExpressionLowerBound];
    *((_DWORD *)v2 + 13) = v11;
    [(id)objc_opt_class() defaultNeutralExpressionUpperBound];
    *((_DWORD *)v2 + 14) = v12;
    *(_DWORD *)(v2 + 11) = 0;
    v2[15] = 1;
    *((_DWORD *)v2 + 4) = 0;
    *((_WORD *)v2 + 10) = 0;
    objc_storeStrong((id *)v2 + 19, (id)*MEMORY[0x263F002D8]);
    v2[22] = 0;
    [(id)objc_opt_class() defaultSimpleSelectorMinOffsetAngle];
    *((_DWORD *)v2 + 23) = v13;
    [(id)objc_opt_class() defaultSimpleSelectorMaxOffsetAngle];
    *((_DWORD *)v2 + 24) = v14;
    *((_WORD *)v2 + 12) = 0;
    [(id)objc_opt_class() defaultVNFrontPoseBlinkThreshold];
    *((_DWORD *)v2 + 27) = v15;
    *((_WORD *)v2 + 13) = 0;
    v2[28] = 0;
    [(id)objc_opt_class() defaultAmbientLightFilterLowThreshold];
    *((_DWORD *)v2 + 28) = v16;
    *(_WORD *)(v2 + 29) = 0;
    v2[31] = 0;
    [(id)objc_opt_class() defaultMotionBlurThreshold];
    *((_DWORD *)v2 + 29) = v17;
    *((_WORD *)v2 + 4) = 0;
    uint64_t v18 = objc_opt_new();
    v19 = (void *)*((void *)v2 + 21);
    *((void *)v2 + 21) = v18;

    uint64_t v20 = objc_opt_new();
    v21 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v20;

    v2[23] = 1;
    [(id)objc_opt_class() defaultDistanceFilterCloseThreshold];
    *((_DWORD *)v2 + 25) = v22;
    [(id)objc_opt_class() defaultDistanceFilterFarThreshold];
    *((_DWORD *)v2 + 26) = v23;
    v24 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = 0;

    v25 = v2;
  }

  return (VGFaceCaptureOptions *)v2;
}

- (VGFaceCaptureOptions)initWithSuiteName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VGFaceCaptureOptions *)self init];
  int v6 = v5;
  if (v5)
  {
    [(VGFaceCaptureOptions *)v5 setDefaultsWithSuiteName:v4];
    int v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  id v93 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v93];
  uint64_t v5 = [v4 objectForKey:@"requiredYawPoses"];

  if (v5) {
    self->_requiredYawPoses = [v4 integerForKey:@"requiredYawPoses"];
  }
  int v6 = [v4 objectForKey:@"requiredPitchPoses"];

  if (v6) {
    self->_requiredPitchPoses = [v4 integerForKey:@"requiredPitchPoses"];
  }
  int v7 = [v4 objectForKey:@"requiredExpressions"];

  if (v7)
  {
    requiredExpressions = self->_requiredExpressions;
    self->_requiredExpressions = (NSArray *)MEMORY[0x263EFFA68];
  }
  int v9 = [v4 objectForKey:@"yawLimit"];

  if (v9)
  {
    [v4 floatForKey:@"yawLimit"];
    self->_yawLimit = v10;
  }
  int v11 = [v4 objectForKey:@"pitchLimit"];

  if (v11)
  {
    [v4 floatForKey:@"pitchLimit"];
    self->_pitchLimit = v12;
  }
  int v13 = [v4 objectForKey:@"eyesForwardYawSensitivity"];

  if (v13)
  {
    [v4 floatForKey:@"eyesForwardYawSensitivity"];
    self->_eyesForwardYawSensitivity = v14;
  }
  int v15 = [v4 objectForKey:@"eyesOpenSensitivity"];

  if (v15)
  {
    [v4 floatForKey:@"eyesOpenSensitivity"];
    self->_eyesOpenSensitivity = v16;
  }
  int v17 = [v4 objectForKey:@"neutralExpressionLowerBound"];

  if (v17)
  {
    [v4 floatForKey:@"neutralExpressionLowerBound"];
    self->_neutralExpressionLowerBound = v18;
  }
  v19 = [v4 objectForKey:@"neutralExpressionUpperBound"];

  if (v19)
  {
    [v4 floatForKey:@"neutralExpressionUpperBound"];
    self->_neutralExpressionUpperBound = v20;
  }
  v21 = [v4 objectForKey:@"eyesForwardPitchSensitivity"];

  if (v21)
  {
    [v4 floatForKey:@"eyesForwardPitchSensitivity"];
    self->_eyesForwardPitchSensitivity = v22;
  }
  int v23 = [v4 objectForKey:@"useLookAtForEyesForward"];

  if (v23) {
    self->_useLookAtForEyesForward = [v4 BOOLForKey:@"useLookAtForEyesForward"];
  }
  v24 = [v4 objectForKey:@"ensureEyesForwardOnFrontPose"];

  if (v24) {
    self->_ensureEyesForwardOnFrontPose = [v4 BOOLForKey:@"ensureEyesForwardOnFrontPose"];
  }
  v25 = [v4 objectForKey:@"leftMarginHeadRatio"];

  if (v25)
  {
    [v4 floatForKey:@"leftMarginHeadRatio"];
    self->_leftMarginHeadRatio = v26;
  }
  objc_super v27 = [v4 objectForKey:@"rightMarginHeadRatio"];

  if (v27)
  {
    [v4 floatForKey:@"rightMarginHeadRatio"];
    self->_rightMarginHeadRatio = v28;
  }
  v29 = [v4 objectForKey:@"topMarginHeadRatio"];

  if (v29)
  {
    [v4 floatForKey:@"topMarginHeadRatio"];
    self->_topMarginHeadRatio = v30;
  }
  v31 = [v4 objectForKey:@"bottomMarginHeadRatio"];

  if (v31)
  {
    [v4 floatForKey:@"bottomMarginHeadRatio"];
    self->_bottomMarginHeadRatio = v32;
  }
  v33 = [v4 objectForKey:@"leftMarginFrontPoseHeadRatio"];

  if (v33)
  {
    [v4 floatForKey:@"leftMarginFrontPoseHeadRatio"];
    self->_leftMarginFrontPoseHeadRatio = v34;
  }
  v35 = [v4 objectForKey:@"rightMarginFrontPoseHeadRatio"];

  if (v35)
  {
    [v4 floatForKey:@"rightMarginFrontPoseHeadRatio"];
    self->_rightMarginFrontPoseHeadRatio = v36;
  }
  v37 = [v4 objectForKey:@"bottomMarginFrontPoseDelta"];

  if (v37)
  {
    [v4 floatForKey:@"bottomMarginFrontPoseDelta"];
    self->_bottomMarginFrontPoseDelta = v38;
  }
  v39 = [v4 objectForKey:@"bottomMarginPitchPoseDelta"];

  if (v39)
  {
    [v4 floatForKey:@"bottomMarginPitchPoseDelta"];
    self->_bottomMarginPitchPoseDelta = v40;
  }
  v41 = [v4 objectForKey:@"ensureEyesOpenOnFrontPose"];

  if (v41) {
    self->_ensureEyesOpenOnFrontPose = [v4 BOOLForKey:@"ensureEyesOpenOnFrontPose"];
  }
  v42 = [v4 objectForKey:@"ensureEyesOpenOnAllPoses"];

  if (v42) {
    self->_ensureEyesOpenOnNonFrontPose = [v4 BOOLForKey:@"ensureEyesOpenOnAllPoses"];
  }
  v43 = [v4 objectForKey:@"ensureEyesOpenOnNonFrontPose"];

  if (v43) {
    self->_ensureEyesOpenOnNonFrontPose = [v4 BOOLForKey:@"ensureEyesOpenOnNonFrontPose"];
  }
  v44 = [v4 objectForKey:@"ensureAlmostNeutralExpressionOnAllPoses"];

  if (v44) {
    self->_ensureAlmostNeutralExpressionOnNonFrontPose = [v4 BOOLForKey:@"ensureAlmostNeutralExpressionOnAllPoses"];
  }
  v45 = [v4 objectForKey:@"ensureNeutralExpressionOnFrontPose"];

  if (v45) {
    self->_ensureNeutralExpressionOnFrontPose = [v4 BOOLForKey:@"ensureNeutralExpressionOnFrontPose"];
  }
  v46 = [v4 objectForKey:@"ensureAlmostNeutralExpressionOnNonFrontPose"];

  if (v46) {
    self->_ensureAlmostNeutralExpressionOnNonFrontPose = [v4 BOOLForKey:@"ensureAlmostNeutralExpressionOnNonFrontPose"];
  }
  v47 = [v4 objectForKey:@"useFaceTrackingDictionary"];

  if (v47) {
    self->_useFaceTrackingDictionary = [v4 BOOLForKey:@"useFaceTrackingDictionary"];
  }
  v48 = [v4 objectForKey:@"useFKInternalFaceDetector"];

  if (v48) {
    self->_useFKInternalFaceDetector = [v4 BOOLForKey:@"useFKInternalFaceDetector"];
  }
  v49 = [v4 objectForKey:@"useFKForceCPU"];

  if (v49) {
    self->_useFKForceCPU = [v4 BOOLForKey:@"useFKForceCPU"];
  }
  v50 = [v4 objectForKey:@"convertFKTrackingDictToARKitDict"];

  if (v50) {
    self->_convertFKTrackingDictToARKitDict = [v4 BOOLForKey:@"convertFKTrackingDictToARKitDict"];
  }
  v51 = [v4 objectForKey:@"sendMetrics"];

  if (v51) {
    self->_sendMetrics = [v4 BOOLForKey:@"sendMetrics"];
  }
  v52 = [v4 objectForKey:@"cameraImageColorSpaceName"];

  if (v52)
  {
    v53 = [v4 stringForKey:@"cameraImageColorSpaceName"];
    cameraImageColorSpaceName = self->_cameraImageColorSpaceName;
    self->_cameraImageColorSpaceName = v53;
  }
  v55 = [v4 objectForKey:@"useSimpleSelector"];

  if (v55) {
    self->_useSimpleSelector = [v4 BOOLForKey:@"useSimpleSelector"];
  }
  v56 = [v4 objectForKey:@"simpleSelectorMinOffsetAngle"];

  if (v56)
  {
    [v4 floatForKey:@"simpleSelectorMinOffsetAngle"];
    self->_simpleSelectorMinOffsetAngle = v57;
  }
  v58 = [v4 objectForKey:@"simpleSelectorMaxOffsetAngle"];

  if (v58)
  {
    [v4 floatForKey:@"simpleSelectorMaxOffsetAngle"];
    self->_simpleSelectorMaxOffsetAngle = v59;
  }
  v60 = [v4 objectForKey:@"useDistanceFilter"];

  if (v60) {
    self->_useDistanceFilter = [v4 BOOLForKey:@"useDistanceFilter"];
  }
  v61 = [v4 objectForKey:@"distanceFilterCloseThreshold"];

  if (v61)
  {
    [v4 floatForKey:@"distanceFilterCloseThreshold"];
    self->_distanceFilterCloseThreshold = v62;
  }
  v63 = [v4 objectForKey:@"distanceFilterFarThreshold"];

  if (v63)
  {
    [v4 floatForKey:@"distanceFilterFarThreshold"];
    self->_distanceFilterFarThreshold = v64;
  }
  uint64_t v65 = [v4 objectForKey:@"useBodyPoseGuidanceFilter"];
  if (v65)
  {
    v66 = (void *)v65;
    char v67 = [v4 BOOLForKey:@"useBodyPoseGuidanceFilter"];

    if ((v67 & 1) == 0)
    {
      bodyPoseGuidanceOptions = self->_bodyPoseGuidanceOptions;
      self->_bodyPoseGuidanceOptions = 0;
    }
  }
  v69 = self->_bodyPoseGuidanceOptions;
  if (v69) {
    [(VGBodyPoseGuidanceOptions *)v69 setDefaultsWithSuiteName:v93];
  }
  v70 = [v4 objectForKey:@"useVNFilters"];

  if (v70) {
    self->_useVNFilters = [v4 BOOLForKey:@"useVNFilters"];
  }
  v71 = [v4 objectForKey:@"_useVNFiltersEnrollment"];

  if (v71) {
    self->_useVNFiltersEnrollment = [v4 BOOLForKey:@"_useVNFiltersEnrollment"];
  }
  v72 = [v4 objectForKey:@"vnFrontPoseBlinkThreshold"];

  if (v72) {
    self->_vnFrontPoseBlinkThreshold = (float)[v4 BOOLForKey:@"vnFrontPoseBlinkThreshold"];
  }
  v73 = [v4 objectForKey:@"useDepthFovFilter"];

  if (v73) {
    self->_useDepthFovFilter = [v4 BOOLForKey:@"useDepthFovFilter"];
  }
  v74 = [v4 objectForKey:@"useDepthFovFilterForBadAlignment"];

  if (v74) {
    self->_useDepthFovFilterForBadAlignment = [v4 BOOLForKey:@"useDepthFovFilterForBadAlignment"];
  }
  v75 = [v4 objectForKey:@"useAmbientLightFilter"];

  if (v75) {
    self->_useAmbientLightFilter = [v4 BOOLForKey:@"useAmbientLightFilter"];
  }
  v76 = [v4 objectForKey:@"ambientLightFilterLowThreshold"];

  if (v76)
  {
    [v4 floatForKey:@"ambientLightFilterLowThreshold"];
    self->_ambientLightFilterLowThreshold = v77;
  }
  v78 = [v4 objectForKey:@"useMotionBlurFilter"];

  if (v78) {
    self->_useMotionBlurFilter = [v4 BOOLForKey:@"useMotionBlurFilter"];
  }
  v79 = [v4 objectForKey:@"motionBlurThreshold"];

  if (v79)
  {
    [v4 floatForKey:@"motionBlurThreshold"];
    self->_motionBlurThreshold = v80;
  }
  v81 = [v4 objectForKey:@"useTrackedFaceIdentifierFilter"];

  if (v81) {
    self->_useTrackedFaceIdentifierFilter = [v4 BOOLForKey:@"useTrackedFaceIdentifierFilter"];
  }
  v82 = [v4 objectForKey:@"useVNFaceLandmarksFilter"];

  if (v82) {
    self->_useVNFaceLandmarksFilter = [v4 BOOLForKey:@"useVNFaceLandmarksFilter"];
  }
  v83 = [v4 objectForKey:@"useFovMarginsFilterFrontPose"];

  if (v83) {
    self->_useFovMarginsFilterFrontPose = [v4 BOOLForKey:@"useFovMarginsFilterFrontPose"];
  }
  v84 = [v4 objectForKey:@"useFovMarginsFilterNonFrontPose"];

  if (v84) {
    self->_useFovMarginsFilterNonFrontPose = [v4 BOOLForKey:@"useFovMarginsFilterNonFrontPose"];
  }
  v85 = [v4 objectForKey:@"selectionFrustumYawOffsetLeft"];

  if (v85)
  {
    [v4 floatForKey:@"selectionFrustumYawOffsetLeft"];
    -[VGFaceSelectionFrustum setYawOffsetLeft:](self->_selectionFrustum, "setYawOffsetLeft:");
  }
  v86 = [v4 objectForKey:@"selectionFrustumYawOffsetRight"];

  if (v86)
  {
    [v4 floatForKey:@"selectionFrustumYawOffsetRight"];
    -[VGFaceSelectionFrustum setYawOffsetRight:](self->_selectionFrustum, "setYawOffsetRight:");
  }
  v87 = [v4 objectForKey:@"selectionFrustumPitchOffsetTop"];

  if (v87)
  {
    [v4 floatForKey:@"selectionFrustumPitchOffsetTop"];
    -[VGFaceSelectionFrustum setPitchOffsetTop:](self->_selectionFrustum, "setPitchOffsetTop:");
  }
  v88 = [v4 objectForKey:@"selectionFrustumPitchOffsetBottom"];

  if (v88)
  {
    [v4 floatForKey:@"selectionFrustumPitchOffsetBottom"];
    -[VGFaceSelectionFrustum setPitchOffsetBottom:](self->_selectionFrustum, "setPitchOffsetBottom:");
  }
  v89 = [v4 objectForKey:@"frontPoseSelectionFrustumYawOffsetLeft"];

  if (v89)
  {
    [v4 floatForKey:@"frontPoseSelectionFrustumYawOffsetLeft"];
    -[VGFaceSelectionFrustum setYawOffsetLeft:](self->_frontPoseSelectionFrustum, "setYawOffsetLeft:");
  }
  v90 = [v4 objectForKey:@"frontPoseSelectionFrustumYawOffsetRight"];

  if (v90)
  {
    [v4 floatForKey:@"frontPoseSelectionFrustumYawOffsetRight"];
    -[VGFaceSelectionFrustum setYawOffsetRight:](self->_frontPoseSelectionFrustum, "setYawOffsetRight:");
  }
  v91 = [v4 objectForKey:@"frontPoseSelectionFrustumPitchOffsetTop"];

  if (v91)
  {
    [v4 floatForKey:@"frontPoseSelectionFrustumPitchOffsetTop"];
    -[VGFaceSelectionFrustum setPitchOffsetTop:](self->_frontPoseSelectionFrustum, "setPitchOffsetTop:");
  }
  v92 = [v4 objectForKey:@"frontPoseSelectionFrustumPitchOffsetBottom"];

  if (v92)
  {
    [v4 floatForKey:@"frontPoseSelectionFrustumPitchOffsetBottom"];
    -[VGFaceSelectionFrustum setPitchOffsetBottom:](self->_frontPoseSelectionFrustum, "setPitchOffsetBottom:");
  }
}

+ (unint64_t)defaultRequiredYawPoses
{
  return 3;
}

+ (unint64_t)defaultRequiredPitchPoses
{
  return 2;
}

+ (float)defaultYawLimit
{
  return 30.0;
}

+ (float)defaultPitchLimit
{
  return 22.5;
}

+ (float)defaultEyesForwardAngleSensitivity
{
  return 10.0;
}

+ (float)defaultEyesOpenSensitivity
{
  return 0.3;
}

+ (float)defaultNeutralExpressionLowerBound
{
  return 0.5;
}

+ (float)defaultNeutralExpressionUpperBound
{
  return 0.6;
}

+ (float)defaultSimpleSelectorMinOffsetAngle
{
  return 20.0;
}

+ (float)defaultSimpleSelectorMaxOffsetAngle
{
  return 80.0;
}

+ (float)defaultDistanceFilterCloseThreshold
{
  return 20.0;
}

+ (float)defaultDistanceFilterFarThreshold
{
  return 60.0;
}

+ (float)defaultAmbientLightFilterLowThreshold
{
  return 400.0;
}

+ (float)defaultVNFrontPoseBlinkThreshold
{
  return 0.6;
}

+ (float)defaultMotionBlurThreshold
{
  return 1.0;
}

- (id)description
{
  float pitchLimit = self->_pitchLimit;
  double yawLimit = self->_yawLimit;
  unint64_t requiredYawPoses = self->_requiredYawPoses;
  double v6 = pitchLimit;
  int v7 = @"YES";
  if (self->_useFovMarginsFilterFrontPose) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  if (self->_useFovMarginsFilterNonFrontPose) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  if (self->_ensureEyesForwardOnFrontPose) {
    float v10 = @"YES";
  }
  else {
    float v10 = @"NO";
  }
  if (self->_useLookAtForEyesForward) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  if (self->_ensureEyesOpenOnFrontPose) {
    float v12 = @"YES";
  }
  else {
    float v12 = @"NO";
  }
  if (self->_ensureEyesOpenOnNonFrontPose) {
    int v13 = @"YES";
  }
  else {
    int v13 = @"NO";
  }
  if (self->_ensureNeutralExpressionOnFrontPose) {
    float v14 = @"YES";
  }
  else {
    float v14 = @"NO";
  }
  if (self->_ensureAlmostNeutralExpressionOnNonFrontPose) {
    int v15 = @"YES";
  }
  else {
    int v15 = @"NO";
  }
  if (self->_useFaceTrackingDictionary) {
    float v16 = @"YES";
  }
  else {
    float v16 = @"NO";
  }
  if (self->_useFKInternalFaceDetector) {
    int v17 = @"YES";
  }
  else {
    int v17 = @"NO";
  }
  if (self->_useFKForceCPU) {
    float v18 = @"YES";
  }
  else {
    float v18 = @"NO";
  }
  if (self->_convertFKTrackingDictToARKitDict) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if (self->_sendMetrics) {
    float v20 = @"YES";
  }
  else {
    float v20 = @"NO";
  }
  if (self->_useSimpleSelector) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if (self->_useDistanceFilter) {
    float v22 = @"YES";
  }
  else {
    float v22 = @"NO";
  }
  if (self->_useVNFilters) {
    int v23 = @"YES";
  }
  else {
    int v23 = @"NO";
  }
  if (self->_useVNFiltersEnrollment) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  if (self->_useDepthFovFilter) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  if (self->_useDepthFovFilterForBadAlignment) {
    float v26 = @"YES";
  }
  else {
    float v26 = @"NO";
  }
  if (self->_useAmbientLightFilter) {
    objc_super v27 = @"YES";
  }
  else {
    objc_super v27 = @"NO";
  }
  if (self->_useTrackedFaceIdentifierFilter) {
    float v28 = @"YES";
  }
  else {
    float v28 = @"NO";
  }
  if (self->_useVNFaceLandmarksFilter) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  if (!self->_useMotionBlurFilter) {
    int v7 = @"NO";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Yaw Poses %lu (limit %.f) Pitch Poses %lu (limit %.f) Expressions %@ Eyes Forward Sensitivity (yaw %g, pitch %g) Selection Frustum Offsets (non-front poses): { %@ } Selection Frustum Offsets (front pose): { %@ } Use FoV Margin: front pose [%@], non front poses [%@] Margins Head Ratio (left %g, right %g, top %g, bottom %g) Margins Head Ratio Front Pose (left %g, right %g, top %g, bottom %g) Bottom margin front pose delta %g Bottom margin pitch pose delta %g Ensure Eyes Forward On Front Pose %@ (use look-at check: %@) Eyes Open Sensitivity %g Neutral Expression Lower Bound %g Neutral Expression Upper Bound %g Ensure Eyes Open On Front Pose %@ Ensure Eyes Open On Non Front Pose %@ Ensure Almost Neutral Expression On Front Pose %@ Ensure Almost Neutral Expression On Non Front Pose %@ Face Tracking Result Set in VGCaptureData %@ Use FaceKit Tracker internal Face Detector %@ Use FaceKit Force CPU %@ Convert FaceKit tracking dictionary to ARKit tracking dictionary %@ Send Metrics %@ Use simple selector: %@ (min offset: %g, max offset: %g) Use distance filter: %@ (close threshold: %g cm, far threshold: %g cm) Body Pose Guidance Options: { %@ } Use Vision Filters %@ (during Frame Selection) Use Vision Filters %@ (during Enrollment) Vision Front Pose Blink Confidence Threshold %g Use computed depth bounding box %@ Use computed depth bounding box for poses with bad alignment %@ Use ambient light filter %@ (low threshold: %g) Use tracked face identifier filter %@ Use Vision face landmarks filter %@ Use Motion Blur Filter %@ (threshold: %g)", requiredYawPoses, *(void *)&yawLimit, self->_requiredPitchPoses, *(void *)&v6, self->_requiredExpressions, self->_eyesForwardYawSensitivity, self->_eyesForwardPitchSensitivity, self->_selectionFrustum, self->_frontPoseSelectionFrustum, v8, v9, self->_leftMarginHeadRatio, self->_rightMarginHeadRatio, self->_topMarginHeadRatio, self->_bottomMarginHeadRatio, self->_leftMarginFrontPoseHeadRatio,
               self->_rightMarginFrontPoseHeadRatio,
               self->_topMarginHeadRatio,
               self->_bottomMarginHeadRatio,
               self->_bottomMarginFrontPoseDelta,
               self->_bottomMarginPitchPoseDelta,
               v10,
               v11,
               self->_eyesOpenSensitivity,
               self->_neutralExpressionLowerBound,
               self->_neutralExpressionUpperBound,
               v12,
               v13,
               v14,
               v15,
               v16,
               v17,
               v18,
               v19,
               v20,
               v21,
               self->_simpleSelectorMinOffsetAngle,
               self->_simpleSelectorMaxOffsetAngle,
               v22,
               self->_distanceFilterCloseThreshold,
               self->_distanceFilterFarThreshold,
               self->_bodyPoseGuidanceOptions,
               v23,
               v24,
               self->_vnFrontPoseBlinkThreshold,
               v25,
               v26,
               v27,
               self->_ambientLightFilterLowThreshold,
               v28,
               v29,
               v7,
               self->_motionBlurThreshold);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFaceCaptureOptions)initWithCoder:(id)a3
{
  v71[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VGFaceCaptureOptions *)self init];
  if (v5)
  {
    v5->_unint64_t requiredYawPoses = [v4 decodeIntegerForKey:@"requiredYawPoses"];
    v5->_requiredPitchPoses = [v4 decodeIntegerForKey:@"requiredPitchPoses"];
    double v6 = (void *)MEMORY[0x263EFFA08];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    int v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"requiredExpressions"];
    requiredExpressions = v5->_requiredExpressions;
    v5->_requiredExpressions = (NSArray *)v9;

    [v4 decodeFloatForKey:@"yawLimit"];
    v5->_double yawLimit = v11;
    [v4 decodeFloatForKey:@"pitchLimit"];
    v5->_float pitchLimit = v12;
    [v4 decodeFloatForKey:@"eyesForwardYawSensitivity"];
    v5->_eyesForwardYawSensitivity = v13;
    [v4 decodeFloatForKey:@"eyesForwardPitchSensitivity"];
    v5->_eyesForwardPitchSensitivity = v14;
    [v4 decodeFloatForKey:@"yawSensitivity"];
    int v16 = v15;
    int v17 = v15;
    if ([v4 containsValueForKey:@"yawSensitivityFrontPose"])
    {
      [v4 decodeFloatForKey:@"yawSensitivityFrontPose"];
      int v17 = v18;
    }
    if ([v4 containsValueForKey:@"selectionFrustum"])
    {
      uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionFrustum"];
      selectionFrustum = v5->_selectionFrustum;
      v5->_selectionFrustum = (VGFaceSelectionFrustum *)v19;
    }
    else
    {
      uint64_t v21 = objc_opt_new();
      float v22 = v5->_selectionFrustum;
      v5->_selectionFrustum = (VGFaceSelectionFrustum *)v21;

      LODWORD(v23) = v16;
      [(VGFaceSelectionFrustum *)v5->_selectionFrustum setYawOffsetLeft:v23];
      LODWORD(v24) = v16;
      [(VGFaceSelectionFrustum *)v5->_selectionFrustum setYawOffsetRight:v24];
      LODWORD(v25) = v16;
      [(VGFaceSelectionFrustum *)v5->_selectionFrustum setPitchOffsetTop:v25];
      LODWORD(v26) = v16;
      [(VGFaceSelectionFrustum *)v5->_selectionFrustum setPitchOffsetBottom:v26];
    }
    if ([v4 containsValueForKey:@"frontPoseSelectionFrustum"])
    {
      uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frontPoseSelectionFrustum"];
      frontPoseSelectionFrustum = v5->_frontPoseSelectionFrustum;
      v5->_frontPoseSelectionFrustum = (VGFaceSelectionFrustum *)v27;
    }
    else
    {
      uint64_t v29 = objc_opt_new();
      float v30 = v5->_frontPoseSelectionFrustum;
      v5->_frontPoseSelectionFrustum = (VGFaceSelectionFrustum *)v29;

      LODWORD(v31) = v17;
      [(VGFaceSelectionFrustum *)v5->_frontPoseSelectionFrustum setYawOffsetLeft:v31];
      LODWORD(v32) = v17;
      [(VGFaceSelectionFrustum *)v5->_frontPoseSelectionFrustum setYawOffsetRight:v32];
      LODWORD(v33) = v17;
      [(VGFaceSelectionFrustum *)v5->_frontPoseSelectionFrustum setPitchOffsetTop:v33];
      LODWORD(v34) = v17;
      [(VGFaceSelectionFrustum *)v5->_frontPoseSelectionFrustum setPitchOffsetBottom:v34];
    }
    [v4 decodeFloatForKey:@"leftMarginHeadRatio"];
    v5->_float leftMarginHeadRatio = v35;
    [v4 decodeFloatForKey:@"rightMarginHeadRatio"];
    v5->_float rightMarginHeadRatio = v36;
    [v4 decodeFloatForKey:@"topMarginHeadRatio"];
    v5->_topMarginHeadRatio = v37;
    [v4 decodeFloatForKey:@"bottomMarginHeadRatio"];
    v5->_bottomMarginHeadRatio = v38;
    if ([v4 containsValueForKey:@"leftMarginFrontPoseHeadRatio"]) {
      [v4 decodeFloatForKey:@"leftMarginFrontPoseHeadRatio"];
    }
    else {
      float leftMarginHeadRatio = v5->_leftMarginHeadRatio;
    }
    v5->_leftMarginFrontPoseHeadRatio = leftMarginHeadRatio;
    if ([v4 containsValueForKey:@"rightMarginFrontPoseHeadRatio"]) {
      [v4 decodeFloatForKey:@"rightMarginFrontPoseHeadRatio"];
    }
    else {
      float rightMarginHeadRatio = v5->_rightMarginHeadRatio;
    }
    v5->_rightMarginFrontPoseHeadRatio = rightMarginHeadRatio;
    [v4 decodeFloatForKey:@"bottomMarginFrontPoseDelta"];
    v5->_bottomMarginFrontPoseDelta = v41;
    [v4 decodeFloatForKey:@"bottomMarginPitchPoseDelta"];
    v5->_bottomMarginPitchPoseDelta = v42;
    [v4 decodeFloatForKey:@"eyesOpenSensitivity"];
    v5->_eyesOpenSensitivity = v43;
    [v4 decodeFloatForKey:@"neutralExpressionLowerBound"];
    v5->_neutralExpressionLowerBound = v44;
    [v4 decodeFloatForKey:@"neutralExpressionUpperBound"];
    v5->_neutralExpressionUpperBound = v45;
    v5->_writeDebugData = [v4 decodeBoolForKey:@"writeDebugData"];
    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugDataPath"];
    debugDataPath = v5->_debugDataPath;
    v5->_debugDataPath = (NSString *)v46;

    v5->_useLookAtForEyesForward = [v4 decodeBoolForKey:@"useLookAtForEyesForward"];
    v5->_ensureEyesForwardOnFrontPose = [v4 decodeBoolForKey:@"ensureEyesForwardOnFrontPose"];
    v5->_ensureEyesOpenOnFrontPose = [v4 decodeBoolForKey:@"ensureEyesOpenOnFrontPose"];
    if ([v4 containsValueForKey:@"ensureEyesOpenOnAllPoses"]) {
      v48 = @"ensureEyesOpenOnAllPoses";
    }
    else {
      v48 = @"ensureEyesOpenOnNonFrontPose";
    }
    v5->_ensureEyesOpenOnNonFrontPose = [v4 decodeBoolForKey:v48];
    if ([v4 containsValueForKey:@"ensureNeutralExpressionOnFrontPose"]) {
      v5->_ensureNeutralExpressionOnFrontPose = [v4 decodeBoolForKey:@"ensureNeutralExpressionOnFrontPose"];
    }
    if ([v4 containsValueForKey:@"ensureAlmostNeutralExpressionOnAllPoses"]) {
      v49 = @"ensureAlmostNeutralExpressionOnAllPoses";
    }
    else {
      v49 = @"ensureAlmostNeutralExpressionOnNonFrontPose";
    }
    v5->_ensureAlmostNeutralExpressionOnNonFrontPose = [v4 decodeBoolForKey:v49];
    v5->_useFaceTrackingDictionary = [v4 decodeBoolForKey:@"useFaceTrackingDictionary"];
    v5->_useFKInternalFaceDetector = [v4 decodeBoolForKey:@"useFKInternalFaceDetector"];
    v5->_useFKForceCPU = [v4 decodeBoolForKey:@"useFKForceCPU"];
    v5->_convertFKTrackingDictToARKitDict = [v4 decodeBoolForKey:@"convertFKTrackingDictToARKitDict"];
    v5->_sendMetrics = [v4 decodeBoolForKey:@"sendMetrics"];
    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraImageColorSpaceName"];
    cameraImageColorSpaceName = v5->_cameraImageColorSpaceName;
    v5->_cameraImageColorSpaceName = (NSString *)v50;

    v5->_useSimpleSelector = [v4 decodeBoolForKey:@"useSimpleSelector"];
    [v4 decodeFloatForKey:@"simpleSelectorMinOffsetAngle"];
    v5->_simpleSelectorMinOffsetAngle = v52;
    [v4 decodeFloatForKey:@"simpleSelectorMaxOffsetAngle"];
    v5->_simpleSelectorMaxOffsetAngle = v53;
    v5->_useDistanceFilter = [v4 decodeBoolForKey:@"useDistanceFilter"];
    [v4 decodeFloatForKey:@"distanceFilterCloseThreshold"];
    v5->_distanceFilterCloseThreshold = v54;
    [v4 decodeFloatForKey:@"distanceFilterFarThreshold"];
    v5->_distanceFilterFarThreshold = v55;
    v5->_useAmbientLightFilter = [v4 decodeBoolForKey:@"useAmbientLightFilter"];
    [v4 decodeFloatForKey:@"ambientLightFilterLowThreshold"];
    v5->_ambientLightFilterLowThreshold = v56;
    v5->_useVNFilters = [v4 decodeBoolForKey:@"useVNFilters"];
    v5->_useVNFiltersEnrollment = [v4 decodeBoolForKey:@"useVNFiltersEnrollment"];
    [v4 decodeFloatForKey:@"vnFrontPoseBlinkThreshold"];
    v5->_vnFrontPoseBlinkThreshold = v57;
    if ([v4 containsValueForKey:@"bodyPoseGuidanceOptions"])
    {
      uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyPoseGuidanceOptions"];
      bodyPoseGuidanceOptions = v5->_bodyPoseGuidanceOptions;
      v5->_bodyPoseGuidanceOptions = (VGBodyPoseGuidanceOptions *)v58;
    }
    else
    {
      bodyPoseGuidanceOptions = v5->_bodyPoseGuidanceOptions;
      v5->_bodyPoseGuidanceOptions = 0;
    }

    if ([v4 containsValueForKey:@"useFovMarginsFilterFrontPose"]) {
      char v60 = [v4 decodeBoolForKey:@"useFovMarginsFilterFrontPose"];
    }
    else {
      char v60 = 1;
    }
    v5->_useFovMarginsFilterFrontPose = v60;
    if ([v4 containsValueForKey:@"useFovMarginsFilterNonFrontPose"]) {
      char v61 = [v4 decodeBoolForKey:@"useFovMarginsFilterNonFrontPose"];
    }
    else {
      char v61 = 1;
    }
    v5->_useFovMarginsFilterNonFrontPose = v61;
    if ([v4 containsValueForKey:@"useDepthFovFilter"]) {
      char v62 = [v4 decodeBoolForKey:@"useDepthFovFilter"];
    }
    else {
      char v62 = 1;
    }
    v5->_useDepthFovFilter = v62;
    int v63 = [v4 containsValueForKey:@"useDepthFovFilterForBadAlignment"];
    if (v63) {
      LOBYTE(v63) = [v4 decodeBoolForKey:@"useDepthFovFilterForBadAlignment"];
    }
    v5->_useDepthFovFilterForBadAlignment = v63;
    int v64 = [v4 containsValueForKey:@"useAmbientLightFilter"];
    if (v64) {
      LOBYTE(v64) = [v4 decodeBoolForKey:@"useAmbientLightFilter"];
    }
    v5->_useAmbientLightFilter = v64;
    int v65 = [v4 containsValueForKey:@"useTrackedFaceIdentifierFilter"];
    if (v65) {
      LOBYTE(v65) = [v4 decodeBoolForKey:@"useTrackedFaceIdentifierFilter"];
    }
    v5->_useTrackedFaceIdentifierFilter = v65;
    int v66 = [v4 containsValueForKey:@"useVNFaceLandmarksFilter"];
    if (v66) {
      LOBYTE(v66) = [v4 decodeBoolForKey:@"useVNFaceLandmarksFilter"];
    }
    v5->_useVNFaceLandmarksFilter = v66;
    int v67 = [v4 containsValueForKey:@"useMotionBlurFilter"];
    if (v67) {
      LOBYTE(v67) = [v4 decodeBoolForKey:@"useMotionBlurFilter"];
    }
    v5->_useMotionBlurFilter = v67;
    if ([v4 containsValueForKey:@"motionBlurThreshold"]) {
      [v4 decodeFloatForKey:@"motionBlurThreshold"];
    }
    else {
      [(id)objc_opt_class() defaultMotionBlurThreshold];
    }
    v5->_motionBlurThreshold = v68;
    v69 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requiredYawPoses = self->_requiredYawPoses;
  id v27 = a3;
  [v27 encodeInteger:requiredYawPoses forKey:@"requiredYawPoses"];
  [v27 encodeInteger:self->_requiredPitchPoses forKey:@"requiredPitchPoses"];
  [v27 encodeObject:self->_requiredExpressions forKey:@"requiredExpressions"];
  *(float *)&double v5 = self->_yawLimit;
  [v27 encodeFloat:@"yawLimit" forKey:v5];
  *(float *)&double v6 = self->_pitchLimit;
  [v27 encodeFloat:@"pitchLimit" forKey:v6];
  *(float *)&double v7 = self->_eyesForwardYawSensitivity;
  [v27 encodeFloat:@"eyesForwardYawSensitivity" forKey:v7];
  *(float *)&double v8 = self->_eyesForwardPitchSensitivity;
  [v27 encodeFloat:@"eyesForwardPitchSensitivity" forKey:v8];
  *(float *)&double v9 = self->_leftMarginHeadRatio;
  [v27 encodeFloat:@"leftMarginHeadRatio" forKey:v9];
  *(float *)&double v10 = self->_rightMarginHeadRatio;
  [v27 encodeFloat:@"rightMarginHeadRatio" forKey:v10];
  *(float *)&double v11 = self->_topMarginHeadRatio;
  [v27 encodeFloat:@"topMarginHeadRatio" forKey:v11];
  *(float *)&double v12 = self->_bottomMarginHeadRatio;
  [v27 encodeFloat:@"bottomMarginHeadRatio" forKey:v12];
  *(float *)&double v13 = self->_leftMarginFrontPoseHeadRatio;
  [v27 encodeFloat:@"leftMarginFrontPoseHeadRatio" forKey:v13];
  *(float *)&double v14 = self->_rightMarginFrontPoseHeadRatio;
  [v27 encodeFloat:@"rightMarginFrontPoseHeadRatio" forKey:v14];
  *(float *)&double v15 = self->_bottomMarginFrontPoseDelta;
  [v27 encodeFloat:@"bottomMarginFrontPoseDelta" forKey:v15];
  *(float *)&double v16 = self->_bottomMarginPitchPoseDelta;
  [v27 encodeFloat:@"bottomMarginPitchPoseDelta" forKey:v16];
  *(float *)&double v17 = self->_eyesOpenSensitivity;
  [v27 encodeFloat:@"eyesOpenSensitivity" forKey:v17];
  *(float *)&double v18 = self->_neutralExpressionLowerBound;
  [v27 encodeFloat:@"neutralExpressionLowerBound" forKey:v18];
  *(float *)&double v19 = self->_neutralExpressionUpperBound;
  [v27 encodeFloat:@"neutralExpressionUpperBound" forKey:v19];
  [v27 encodeBool:self->_writeDebugData forKey:@"writeDebugData"];
  [v27 encodeObject:self->_debugDataPath forKey:@"debugDataPath"];
  [v27 encodeBool:self->_useLookAtForEyesForward forKey:@"useLookAtForEyesForward"];
  [v27 encodeBool:self->_ensureEyesForwardOnFrontPose forKey:@"ensureEyesForwardOnFrontPose"];
  [v27 encodeBool:self->_ensureEyesOpenOnFrontPose forKey:@"ensureEyesOpenOnFrontPose"];
  [v27 encodeBool:self->_ensureEyesOpenOnNonFrontPose forKey:@"ensureEyesOpenOnNonFrontPose"];
  [v27 encodeBool:self->_ensureNeutralExpressionOnFrontPose forKey:@"ensureNeutralExpressionOnFrontPose"];
  [v27 encodeBool:self->_ensureAlmostNeutralExpressionOnNonFrontPose forKey:@"ensureAlmostNeutralExpressionOnNonFrontPose"];
  [v27 encodeBool:self->_useFaceTrackingDictionary forKey:@"useFaceTrackingDictionary"];
  [v27 encodeBool:self->_useFKInternalFaceDetector forKey:@"useFKInternalFaceDetector"];
  [v27 encodeBool:self->_useFKForceCPU forKey:@"useFKForceCPU"];
  [v27 encodeBool:self->_convertFKTrackingDictToARKitDict forKey:@"convertFKTrackingDictToARKitDict"];
  [v27 encodeBool:self->_sendMetrics forKey:@"sendMetrics"];
  [v27 encodeObject:self->_cameraImageColorSpaceName forKey:@"cameraImageColorSpaceName"];
  [v27 encodeBool:self->_useSimpleSelector forKey:@"useSimpleSelector"];
  *(float *)&double v20 = self->_simpleSelectorMinOffsetAngle;
  [v27 encodeFloat:@"simpleSelectorMinOffsetAngle" forKey:v20];
  *(float *)&double v21 = self->_simpleSelectorMaxOffsetAngle;
  [v27 encodeFloat:@"simpleSelectorMaxOffsetAngle" forKey:v21];
  [v27 encodeBool:self->_useDistanceFilter forKey:@"useDistanceFilter"];
  *(float *)&double v22 = self->_distanceFilterCloseThreshold;
  [v27 encodeFloat:@"distanceFilterCloseThreshold" forKey:v22];
  *(float *)&double v23 = self->_distanceFilterFarThreshold;
  [v27 encodeFloat:@"distanceFilterFarThreshold" forKey:v23];
  [v27 encodeBool:self->_useVNFilters forKey:@"useVNFilters"];
  [v27 encodeBool:self->_useVNFiltersEnrollment forKey:@"useVNFiltersEnrollment"];
  *(float *)&double v24 = self->_vnFrontPoseBlinkThreshold;
  [v27 encodeFloat:@"vnFrontPoseBlinkThreshold" forKey:v24];
  [v27 encodeObject:self->_bodyPoseGuidanceOptions forKey:@"bodyPoseGuidanceOptions"];
  [v27 encodeObject:self->_selectionFrustum forKey:@"selectionFrustum"];
  [v27 encodeObject:self->_frontPoseSelectionFrustum forKey:@"frontPoseSelectionFrustum"];
  [v27 encodeBool:self->_useFovMarginsFilterFrontPose forKey:@"useFovMarginsFilterFrontPose"];
  [v27 encodeBool:self->_useFovMarginsFilterNonFrontPose forKey:@"useFovMarginsFilterNonFrontPose"];
  [v27 encodeBool:self->_useDepthFovFilter forKey:@"useDepthFovFilter"];
  [v27 encodeBool:self->_useDepthFovFilterForBadAlignment forKey:@"useDepthFovFilterForBadAlignment"];
  [v27 encodeBool:self->_useAmbientLightFilter forKey:@"useAmbientLightFilter"];
  *(float *)&double v25 = self->_ambientLightFilterLowThreshold;
  [v27 encodeFloat:@"ambientLightFilterLowThreshold" forKey:v25];
  [v27 encodeBool:self->_useTrackedFaceIdentifierFilter forKey:@"useTrackedFaceIdentifierFilter"];
  [v27 encodeBool:self->_useVNFaceLandmarksFilter forKey:@"useVNFaceLandmarksFilter"];
  [v27 encodeBool:self->_useMotionBlurFilter forKey:@"useMotionBlurFilter"];
  *(float *)&double v26 = self->_motionBlurThreshold;
  [v27 encodeFloat:@"motionBlurThreshold" forKey:v26];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t requiredYawPoses = self->_requiredYawPoses;
    if (requiredYawPoses != [v5 requiredYawPoses]
      || (unint64_t requiredPitchPoses = self->_requiredPitchPoses, requiredPitchPoses != [v5 requiredPitchPoses]))
    {
      BOOL v45 = 0;
LABEL_30:

      goto LABEL_31;
    }
    requiredExpressions = self->_requiredExpressions;
    double v9 = [v5 requiredExpressions];
    if (![requiredExpressions isEqualToArray:v9]) {
      goto LABEL_28;
    }
    float yawLimit = self->_yawLimit;
    [v5 yawLimit];
    if (yawLimit != v11) {
      goto LABEL_28;
    }
    float pitchLimit = self->_pitchLimit;
    [v5 pitchLimit];
    if (pitchLimit != v13) {
      goto LABEL_28;
    }
    float eyesForwardYawSensitivity = self->_eyesForwardYawSensitivity;
    [v5 eyesForwardYawSensitivity];
    if (eyesForwardYawSensitivity != v15) {
      goto LABEL_28;
    }
    float eyesForwardPitchSensitivity = self->_eyesForwardPitchSensitivity;
    [v5 eyesForwardPitchSensitivity];
    if (eyesForwardPitchSensitivity != v17) {
      goto LABEL_28;
    }
    float leftMarginHeadRatio = self->_leftMarginHeadRatio;
    [v5 leftMarginHeadRatio];
    if (leftMarginHeadRatio != v19) {
      goto LABEL_28;
    }
    float rightMarginHeadRatio = self->_rightMarginHeadRatio;
    [v5 rightMarginHeadRatio];
    if (rightMarginHeadRatio != v21) {
      goto LABEL_28;
    }
    float topMarginHeadRatio = self->_topMarginHeadRatio;
    [v5 topMarginHeadRatio];
    if (topMarginHeadRatio != v23) {
      goto LABEL_28;
    }
    float bottomMarginHeadRatio = self->_bottomMarginHeadRatio;
    [v5 bottomMarginHeadRatio];
    if (bottomMarginHeadRatio != v25) {
      goto LABEL_28;
    }
    float leftMarginFrontPoseHeadRatio = self->_leftMarginFrontPoseHeadRatio;
    [v5 leftMarginFrontPoseHeadRatio];
    if (leftMarginFrontPoseHeadRatio != v27) {
      goto LABEL_28;
    }
    float rightMarginFrontPoseHeadRatio = self->_rightMarginFrontPoseHeadRatio;
    [v5 rightMarginFrontPoseHeadRatio];
    if (rightMarginFrontPoseHeadRatio != v29) {
      goto LABEL_28;
    }
    float bottomMarginFrontPoseDelta = self->_bottomMarginFrontPoseDelta;
    [v5 bottomMarginFrontPoseDelta];
    if (bottomMarginFrontPoseDelta != v31) {
      goto LABEL_28;
    }
    float bottomMarginPitchPoseDelta = self->_bottomMarginPitchPoseDelta;
    [v5 bottomMarginPitchPoseDelta];
    if (bottomMarginPitchPoseDelta != v33) {
      goto LABEL_28;
    }
    float eyesOpenSensitivity = self->_eyesOpenSensitivity;
    [v5 eyesOpenSensitivity];
    if (eyesOpenSensitivity != v35
      || (float neutralExpressionLowerBound = self->_neutralExpressionLowerBound,
          [v5 neutralExpressionLowerBound],
          neutralExpressionLowerBound != v37)
      || (float neutralExpressionUpperBound = self->_neutralExpressionUpperBound,
          [v5 neutralExpressionUpperBound],
          neutralExpressionUpperBound != v39)
      || (float v40 = self,
          uint64_t writeDebugData = self->_writeDebugData,
          writeDebugData != [v5 writeDebugData]))
    {
LABEL_28:
      BOOL v45 = 0;
LABEL_29:

      goto LABEL_30;
    }
    debugDataPath = v40->_debugDataPath;
    float v43 = debugDataPath;
    if (!debugDataPath)
    {
      uint64_t writeDebugData = [v5 debugDataPath];
      if (!writeDebugData)
      {
        int v44 = 0;
        goto LABEL_34;
      }
      float v43 = v40->_debugDataPath;
    }
    requiredExpressions = [v5 debugDataPath];
    if (![(NSString *)v43 isEqualToString:requiredExpressions])
    {

      BOOL v45 = 0;
      goto LABEL_52;
    }
    int v44 = 1;
LABEL_34:
    int useLookAtForEyesForward = v40->_useLookAtForEyesForward;
    if (useLookAtForEyesForward != [v5 useLookAtForEyesForward]) {
      goto LABEL_50;
    }
    int ensureEyesForwardOnFrontPose = v40->_ensureEyesForwardOnFrontPose;
    if (ensureEyesForwardOnFrontPose != [v5 ensureEyesForwardOnFrontPose]) {
      goto LABEL_50;
    }
    int ensureEyesOpenOnFrontPose = v40->_ensureEyesOpenOnFrontPose;
    if (ensureEyesOpenOnFrontPose != [v5 ensureEyesOpenOnFrontPose]) {
      goto LABEL_50;
    }
    int ensureEyesOpenOnNonFrontPose = v40->_ensureEyesOpenOnNonFrontPose;
    if (ensureEyesOpenOnNonFrontPose != [v5 ensureEyesOpenOnNonFrontPose]
      || (int ensureNeutralExpressionOnFrontPose = v40->_ensureNeutralExpressionOnFrontPose,
          ensureNeutralExpressionOnFrontPose != [v5 ensureNeutralExpressionOnFrontPose])
      || (int ensureAlmostNeutralExpressionOnNonFrontPose = v40->_ensureAlmostNeutralExpressionOnNonFrontPose,
          ensureAlmostNeutralExpressionOnNonFrontPose != [v5 ensureAlmostNeutralExpressionOnNonFrontPose])|| (int useFaceTrackingDictionary = v40->_useFaceTrackingDictionary, useFaceTrackingDictionary != objc_msgSend(v5, "useFaceTrackingDictionary"))|| (useFKInternalFaceDetector = v40->_useFKInternalFaceDetector, useFKInternalFaceDetector != objc_msgSend(v5, "useFKInternalFaceDetector"))|| (useFKForceCPU = v40->_useFKForceCPU, useFKForceCPU != objc_msgSend(v5, "useFKForceCPU"))|| (convertFKTrackingDictToARKitDict = v40->_convertFKTrackingDictToARKitDict, convertFKTrackingDictToARKitDict != objc_msgSend(v5, "convertFKTrackingDictToARKitDict"))|| (sendMetrics = v40->_sendMetrics, sendMetrics != objc_msgSend(v5, "sendMetrics")))
    {
LABEL_50:
      BOOL v45 = 0;
      if ((v44 & 1) == 0) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    cameraImageColorSpaceName = v40->_cameraImageColorSpaceName;
    float v59 = cameraImageColorSpaceName;
    if (!cameraImageColorSpaceName)
    {
      v101 = [v5 cameraImageColorSpaceName];
      if (!v101)
      {
        v101 = 0;
        int v102 = 0;
        goto LABEL_56;
      }
      float v59 = v40->_cameraImageColorSpaceName;
    }
    v103 = [v5 cameraImageColorSpaceName];
    if (!-[NSString isEqualToString:](v59, "isEqualToString:"))
    {

      BOOL v45 = 0;
      goto LABEL_73;
    }
    int v102 = 1;
LABEL_56:
    int useSimpleSelector = v40->_useSimpleSelector;
    if (useSimpleSelector != [v5 useSimpleSelector]) {
      goto LABEL_70;
    }
    float simpleSelectorMinOffsetAngle = v40->_simpleSelectorMinOffsetAngle;
    [v5 simpleSelectorMinOffsetAngle];
    if (simpleSelectorMinOffsetAngle != v62) {
      goto LABEL_70;
    }
    float simpleSelectorMaxOffsetAngle = v40->_simpleSelectorMaxOffsetAngle;
    [v5 simpleSelectorMaxOffsetAngle];
    if (simpleSelectorMaxOffsetAngle != v64) {
      goto LABEL_70;
    }
    int useDistanceFilter = v40->_useDistanceFilter;
    if (useDistanceFilter != [v5 useDistanceFilter]) {
      goto LABEL_70;
    }
    float distanceFilterCloseThreshold = v40->_distanceFilterCloseThreshold;
    [v5 distanceFilterCloseThreshold];
    if (distanceFilterCloseThreshold != v67
      || (float distanceFilterFarThreshold = v40->_distanceFilterFarThreshold,
          [v5 distanceFilterFarThreshold],
          distanceFilterFarThreshold != v69)
      || (int useVNFilters = v40->_useVNFilters, useVNFilters != [v5 useVNFilters])
      || (int useVNFiltersEnrollment = v40->_useVNFiltersEnrollment,
          useVNFiltersEnrollment != [v5 useVNFiltersEnrollment])
      || (float vnFrontPoseBlinkThreshold = v40->_vnFrontPoseBlinkThreshold,
          [v5 vnFrontPoseBlinkThreshold],
          vnFrontPoseBlinkThreshold != v73))
    {
LABEL_70:
      BOOL v45 = 0;
      goto LABEL_71;
    }
    bodyPoseGuidanceOptions = v40->_bodyPoseGuidanceOptions;
    v100 = bodyPoseGuidanceOptions;
    if (!bodyPoseGuidanceOptions)
    {
      v95 = [v5 bodyPoseGuidanceOptions];
      if (!v95)
      {
        v95 = 0;
        int v98 = 0;
        goto LABEL_80;
      }
      bodyPoseGuidanceOptions = v40->_bodyPoseGuidanceOptions;
    }
    v99 = [v5 bodyPoseGuidanceOptions];
    if (!-[VGBodyPoseGuidanceOptions isEqual:](bodyPoseGuidanceOptions, "isEqual:"))
    {
      BOOL v45 = 0;
      goto LABEL_112;
    }
    int v98 = 1;
LABEL_80:
    selectionFrustum = v40->_selectionFrustum;
    v97 = selectionFrustum;
    if (!selectionFrustum)
    {
      v91 = [v5 selectionFrustum];
      if (!v91)
      {
        v91 = 0;
        int v93 = 0;
        goto LABEL_87;
      }
      selectionFrustum = v40->_selectionFrustum;
    }
    v96 = [v5 selectionFrustum];
    if (!-[VGFaceSelectionFrustum isEqual:](selectionFrustum, "isEqual:"))
    {
      BOOL v45 = 0;
      goto LABEL_109;
    }
    int v93 = 1;
LABEL_87:
    frontPoseSelectionFrustum = v40->_frontPoseSelectionFrustum;
    v94 = frontPoseSelectionFrustum;
    if (!frontPoseSelectionFrustum)
    {
      v89 = [v5 frontPoseSelectionFrustum];
      if (!v89)
      {
        v89 = 0;
        int v90 = 0;
        goto LABEL_94;
      }
      frontPoseSelectionFrustum = v40->_frontPoseSelectionFrustum;
    }
    v92 = [v5 frontPoseSelectionFrustum];
    if (!-[VGFaceSelectionFrustum isEqual:](frontPoseSelectionFrustum, "isEqual:"))
    {
      BOOL v45 = 0;
      goto LABEL_106;
    }
    int v90 = 1;
LABEL_94:
    int useFovMarginsFilterFrontPose = v40->_useFovMarginsFilterFrontPose;
    if (useFovMarginsFilterFrontPose != [v5 useFovMarginsFilterFrontPose]) {
      goto LABEL_105;
    }
    int useFovMarginsFilterNonFrontPose = v40->_useFovMarginsFilterNonFrontPose;
    if (useFovMarginsFilterNonFrontPose != [v5 useFovMarginsFilterNonFrontPose]) {
      goto LABEL_105;
    }
    int useDepthFovFilter = v40->_useDepthFovFilter;
    if (useDepthFovFilter != [v5 useDepthFovFilter]) {
      goto LABEL_105;
    }
    int useDepthFovFilterForBadAlignment = v40->_useDepthFovFilterForBadAlignment;
    if (useDepthFovFilterForBadAlignment == [v5 useDepthFovFilterForBadAlignment]
      && (int useAmbientLightFilter = v40->_useAmbientLightFilter,
          useAmbientLightFilter == [v5 useAmbientLightFilter])
      && (float ambientLightFilterLowThreshold = v40->_ambientLightFilterLowThreshold,
          [v5 ambientLightFilterLowThreshold],
          ambientLightFilterLowThreshold == v83)
      && (int useTrackedFaceIdentifierFilter = v40->_useTrackedFaceIdentifierFilter,
          useTrackedFaceIdentifierFilter == [v5 useTrackedFaceIdentifierFilter])
      && (int useVNFaceLandmarksFilter = v40->_useVNFaceLandmarksFilter,
          useVNFaceLandmarksFilter == [v5 useVNFaceLandmarksFilter])
      && (int useMotionBlurFilter = v40->_useMotionBlurFilter,
          useMotionBlurFilter == [v5 useMotionBlurFilter]))
    {
      float motionBlurThreshold = v40->_motionBlurThreshold;
      [v5 motionBlurThreshold];
      BOOL v45 = motionBlurThreshold == v88;
      if ((v90 & 1) == 0)
      {
LABEL_107:
        if (v94)
        {
          if (!v93) {
            goto LABEL_110;
          }
        }
        else
        {

          if ((v93 & 1) == 0)
          {
LABEL_110:
            if (v97)
            {
              if (!v98)
              {
LABEL_113:
                if (v100)
                {
                  if (!v102)
                  {
LABEL_73:
                    if (cameraImageColorSpaceName)
                    {
                      if (!v44) {
                        goto LABEL_52;
                      }
                    }
                    else
                    {

                      if ((v44 & 1) == 0)
                      {
LABEL_52:
                        if (!debugDataPath) {

                        }
                        goto LABEL_29;
                      }
                    }
LABEL_51:

                    goto LABEL_52;
                  }
LABEL_72:

                  goto LABEL_73;
                }

LABEL_71:
                if ((v102 & 1) == 0) {
                  goto LABEL_73;
                }
                goto LABEL_72;
              }
            }
            else
            {

              if ((v98 & 1) == 0) {
                goto LABEL_113;
              }
            }
LABEL_112:

            goto LABEL_113;
          }
        }
LABEL_109:

        goto LABEL_110;
      }
    }
    else
    {
LABEL_105:
      BOOL v45 = 0;
      if (!v90) {
        goto LABEL_107;
      }
    }
LABEL_106:

    goto LABEL_107;
  }
  BOOL v45 = 0;
LABEL_31:

  return v45;
}

- (id)toDictionary
{
  v93[53] = *MEMORY[0x263EF8340];
  v92[0] = @"requiredYawPoses";
  v91 = [NSNumber numberWithUnsignedInteger:self->_requiredYawPoses];
  v93[0] = v91;
  v92[1] = @"requiredPitchPoses";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:self->_requiredPitchPoses];
  requiredExpressions = self->_requiredExpressions;
  int v90 = (void *)v3;
  v93[1] = v3;
  v93[2] = requiredExpressions;
  v92[2] = @"requiredExpressions";
  v92[3] = @"yawLimit";
  *(float *)&double v5 = self->_yawLimit;
  v89 = [NSNumber numberWithFloat:v5];
  v93[3] = v89;
  v92[4] = @"pitchLimit";
  *(float *)&double v6 = self->_pitchLimit;
  float v88 = [NSNumber numberWithFloat:v6];
  v93[4] = v88;
  v92[5] = @"eyesForwardYawSensitivity";
  *(float *)&double v7 = self->_eyesForwardYawSensitivity;
  v87 = [NSNumber numberWithFloat:v7];
  v93[5] = v87;
  v92[6] = @"eyesForwardPitchSensitivity";
  *(float *)&double v8 = self->_eyesForwardPitchSensitivity;
  v86 = [NSNumber numberWithFloat:v8];
  v93[6] = v86;
  v92[7] = @"leftMarginHeadRatio";
  *(float *)&double v9 = self->_leftMarginHeadRatio;
  v85 = [NSNumber numberWithFloat:v9];
  v93[7] = v85;
  v92[8] = @"rightMarginHeadRatio";
  *(float *)&double v10 = self->_rightMarginHeadRatio;
  v84 = [NSNumber numberWithFloat:v10];
  v93[8] = v84;
  v92[9] = @"topMarginHeadRatio";
  *(float *)&double v11 = self->_topMarginHeadRatio;
  float v83 = [NSNumber numberWithFloat:v11];
  v93[9] = v83;
  v92[10] = @"bottomMarginHeadRatio";
  *(float *)&double v12 = self->_bottomMarginHeadRatio;
  v82 = [NSNumber numberWithFloat:v12];
  v93[10] = v82;
  v92[11] = @"leftMarginFrontPoseHeadRatio";
  *(float *)&double v13 = self->_leftMarginFrontPoseHeadRatio;
  v81 = [NSNumber numberWithFloat:v13];
  v93[11] = v81;
  v92[12] = @"rightMarginFrontPoseHeadRatio";
  *(float *)&double v14 = self->_rightMarginFrontPoseHeadRatio;
  float v80 = [NSNumber numberWithFloat:v14];
  v93[12] = v80;
  v92[13] = @"bottomMarginFrontPoseDelta";
  *(float *)&double v15 = self->_bottomMarginFrontPoseDelta;
  v79 = [NSNumber numberWithFloat:v15];
  v93[13] = v79;
  v92[14] = @"bottomMarginPitchPoseDelta";
  *(float *)&double v16 = self->_bottomMarginPitchPoseDelta;
  v78 = [NSNumber numberWithFloat:v16];
  v93[14] = v78;
  v92[15] = @"eyesOpenSensitivity";
  *(float *)&double v17 = self->_eyesOpenSensitivity;
  float v77 = [NSNumber numberWithFloat:v17];
  v93[15] = v77;
  v92[16] = @"neutralExpressionLowerBound";
  *(float *)&double v18 = self->_neutralExpressionLowerBound;
  v76 = [NSNumber numberWithFloat:v18];
  v93[16] = v76;
  v92[17] = @"neutralExpressionUpperBound";
  *(float *)&double v19 = self->_neutralExpressionUpperBound;
  v75 = [NSNumber numberWithFloat:v19];
  v93[17] = v75;
  v92[18] = @"writeDebugData";
  uint64_t v20 = [NSNumber numberWithBool:self->_writeDebugData];
  debugDataPath = (__CFString *)self->_debugDataPath;
  double v22 = @"nil";
  if (!debugDataPath) {
    debugDataPath = @"nil";
  }
  v74 = (void *)v20;
  v93[18] = v20;
  v93[19] = debugDataPath;
  v92[19] = @"debugDataPath";
  v92[20] = @"useLookAtForEyesForward";
  float v73 = [NSNumber numberWithBool:self->_useLookAtForEyesForward];
  v93[20] = v73;
  v92[21] = @"ensureEyesForwardOnFrontPose";
  v72 = [NSNumber numberWithBool:self->_ensureEyesForwardOnFrontPose];
  v93[21] = v72;
  v92[22] = @"ensureEyesOpenOnFrontPose";
  v71 = [NSNumber numberWithBool:self->_ensureEyesOpenOnFrontPose];
  v93[22] = v71;
  v92[23] = @"ensureEyesOpenOnNonFrontPose";
  v70 = [NSNumber numberWithBool:self->_ensureEyesOpenOnNonFrontPose];
  v93[23] = v70;
  v92[24] = @"ensureAlmostNeutralExpressionOnNonFrontPose";
  float v69 = [NSNumber numberWithBool:self->_ensureAlmostNeutralExpressionOnNonFrontPose];
  v93[24] = v69;
  v92[25] = @"useFaceTrackingDictionary";
  float v67 = [NSNumber numberWithBool:self->_useFaceTrackingDictionary];
  v93[25] = v67;
  v92[26] = @"useFKInternalFaceDetector";
  int v66 = [NSNumber numberWithBool:self->_useFKInternalFaceDetector];
  v93[26] = v66;
  v92[27] = @"useFKForceCPU";
  int v65 = [NSNumber numberWithBool:self->_useFKForceCPU];
  v93[27] = v65;
  v92[28] = @"convertFKTrackingDictToARKitDict";
  float v64 = [NSNumber numberWithBool:self->_convertFKTrackingDictToARKitDict];
  v93[28] = v64;
  v92[29] = @"sendMetrics";
  uint64_t v23 = [NSNumber numberWithBool:self->_sendMetrics];
  cameraImageColorSpaceName = self->_cameraImageColorSpaceName;
  int v63 = (void *)v23;
  v93[29] = v23;
  v93[30] = cameraImageColorSpaceName;
  v92[30] = @"cameraImageColorSpaceName";
  v92[31] = @"useSimpleSelector";
  float v62 = [NSNumber numberWithBool:self->_useSimpleSelector];
  v93[31] = v62;
  v92[32] = @"simpleSelectorMinOffsetAngle";
  *(float *)&double v25 = self->_simpleSelectorMinOffsetAngle;
  char v61 = [NSNumber numberWithFloat:v25];
  v93[32] = v61;
  v92[33] = @"simpleSelectorMaxOffsetAngle";
  *(float *)&double v26 = self->_simpleSelectorMaxOffsetAngle;
  char v60 = [NSNumber numberWithFloat:v26];
  v93[33] = v60;
  v92[34] = @"useDistanceFilter";
  float v59 = [NSNumber numberWithBool:self->_useDistanceFilter];
  v93[34] = v59;
  v92[35] = @"distanceFilterCloseThreshold";
  *(float *)&double v27 = self->_distanceFilterCloseThreshold;
  uint64_t v58 = [NSNumber numberWithFloat:v27];
  v93[35] = v58;
  v92[36] = @"distanceFilterFarThreshold";
  *(float *)&double v28 = self->_distanceFilterFarThreshold;
  float v57 = [NSNumber numberWithFloat:v28];
  v93[36] = v57;
  v92[37] = @"useVNFilters";
  float v56 = [NSNumber numberWithBool:self->_useVNFilters];
  v93[37] = v56;
  v92[38] = @"useVNFiltersEnrollment";
  float v55 = [NSNumber numberWithBool:self->_useVNFiltersEnrollment];
  v93[38] = v55;
  v92[39] = @"vnFrontPoseBlinkThreshold";
  *(float *)&double v29 = self->_vnFrontPoseBlinkThreshold;
  float v54 = [NSNumber numberWithFloat:v29];
  v93[39] = v54;
  v92[40] = @"bodyPoseGuidanceOptions";
  bodyPoseGuidanceOptions = self->_bodyPoseGuidanceOptions;
  float v53 = bodyPoseGuidanceOptions;
  if (bodyPoseGuidanceOptions)
  {
    double v22 = [(VGBodyPoseGuidanceOptions *)bodyPoseGuidanceOptions toDictionary];
  }
  v93[40] = v22;
  v92[41] = @"selectionFrustum";
  selectionFrustum = self->_selectionFrustum;
  float v52 = selectionFrustum;
  if (selectionFrustum)
  {
    double v32 = [(VGFaceSelectionFrustum *)selectionFrustum toDictionary];
  }
  else
  {
    double v32 = @"nil";
  }
  v49 = v32;
  v93[41] = v32;
  v92[42] = @"frontPoseSelectionFrustum";
  frontPoseSelectionFrustum = self->_frontPoseSelectionFrustum;
  float v68 = v22;
  v51 = frontPoseSelectionFrustum;
  if (frontPoseSelectionFrustum)
  {
    double v34 = [(VGFaceSelectionFrustum *)frontPoseSelectionFrustum toDictionary];
  }
  else
  {
    double v34 = @"nil";
  }
  v93[42] = v34;
  v92[43] = @"useFovMarginsFilterFrontPose";
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithBool:", self->_useFovMarginsFilterFrontPose, v34);
  v93[43] = v50;
  v92[44] = @"useFovMarginsFilterNonFrontPose";
  float v35 = [NSNumber numberWithBool:self->_useFovMarginsFilterNonFrontPose];
  v93[44] = v35;
  v92[45] = @"useDepthFovFilter";
  float v36 = [NSNumber numberWithBool:self->_useDepthFovFilter];
  v93[45] = v36;
  v92[46] = @"useDepthFovFilterForBadAlignment";
  float v37 = [NSNumber numberWithBool:self->_useDepthFovFilterForBadAlignment];
  v93[46] = v37;
  v92[47] = @"useAmbientLightFilter";
  float v38 = [NSNumber numberWithBool:self->_useAmbientLightFilter];
  v93[47] = v38;
  v92[48] = @"ambientLightFilterLowThreshold";
  *(float *)&double v39 = self->_ambientLightFilterLowThreshold;
  float v40 = [NSNumber numberWithFloat:v39];
  v93[48] = v40;
  v92[49] = @"useTrackedFaceIdentifierFilter";
  float v41 = [NSNumber numberWithBool:self->_useTrackedFaceIdentifierFilter];
  v93[49] = v41;
  v92[50] = @"useVNFaceLandmarksFilter";
  float v42 = [NSNumber numberWithBool:self->_useVNFaceLandmarksFilter];
  v93[50] = v42;
  v92[51] = @"useMotionBlurFilter";
  float v43 = [NSNumber numberWithBool:self->_useMotionBlurFilter];
  v93[51] = v43;
  v92[52] = @"motionBlurThreshold";
  *(float *)&double v44 = self->_motionBlurThreshold;
  BOOL v45 = [NSNumber numberWithFloat:v44];
  v93[52] = v45;
  uint64_t v46 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:53];

  if (v51) {
  if (v52)
  }

  if (v53) {

  }
  return v46;
}

- (unint64_t)requiredYawPoses
{
  return self->_requiredYawPoses;
}

- (void)setRequiredYawPoses:(unint64_t)a3
{
  self->_unint64_t requiredYawPoses = a3;
}

- (unint64_t)requiredPitchPoses
{
  return self->_requiredPitchPoses;
}

- (void)setRequiredPitchPoses:(unint64_t)a3
{
  self->_unint64_t requiredPitchPoses = a3;
}

- (NSArray)requiredExpressions
{
  return self->_requiredExpressions;
}

- (void)setRequiredExpressions:(id)a3
{
}

- (float)yawLimit
{
  return self->_yawLimit;
}

- (void)setYawLimit:(float)a3
{
  self->_float yawLimit = a3;
}

- (float)pitchLimit
{
  return self->_pitchLimit;
}

- (void)setPitchLimit:(float)a3
{
  self->_float pitchLimit = a3;
}

- (float)eyesForwardYawSensitivity
{
  return self->_eyesForwardYawSensitivity;
}

- (void)setEyesForwardYawSensitivity:(float)a3
{
  self->_float eyesForwardYawSensitivity = a3;
}

- (float)eyesForwardPitchSensitivity
{
  return self->_eyesForwardPitchSensitivity;
}

- (void)setEyesForwardPitchSensitivity:(float)a3
{
  self->_float eyesForwardPitchSensitivity = a3;
}

- (float)eyesOpenSensitivity
{
  return self->_eyesOpenSensitivity;
}

- (void)setEyesOpenSensitivity:(float)a3
{
  self->_float eyesOpenSensitivity = a3;
}

- (float)neutralExpressionLowerBound
{
  return self->_neutralExpressionLowerBound;
}

- (void)setNeutralExpressionLowerBound:(float)a3
{
  self->_float neutralExpressionLowerBound = a3;
}

- (float)neutralExpressionUpperBound
{
  return self->_neutralExpressionUpperBound;
}

- (void)setNeutralExpressionUpperBound:(float)a3
{
  self->_float neutralExpressionUpperBound = a3;
}

- (BOOL)useFovMarginsFilterFrontPose
{
  return self->_useFovMarginsFilterFrontPose;
}

- (void)setUseFovMarginsFilterFrontPose:(BOOL)a3
{
  self->_int useFovMarginsFilterFrontPose = a3;
}

- (BOOL)useFovMarginsFilterNonFrontPose
{
  return self->_useFovMarginsFilterNonFrontPose;
}

- (void)setUseFovMarginsFilterNonFrontPose:(BOOL)a3
{
  self->_int useFovMarginsFilterNonFrontPose = a3;
}

- (float)leftMarginHeadRatio
{
  return self->_leftMarginHeadRatio;
}

- (void)setLeftMarginHeadRatio:(float)a3
{
  self->_float leftMarginHeadRatio = a3;
}

- (float)rightMarginHeadRatio
{
  return self->_rightMarginHeadRatio;
}

- (void)setRightMarginHeadRatio:(float)a3
{
  self->_float rightMarginHeadRatio = a3;
}

- (float)topMarginHeadRatio
{
  return self->_topMarginHeadRatio;
}

- (void)setTopMarginHeadRatio:(float)a3
{
  self->_float topMarginHeadRatio = a3;
}

- (float)bottomMarginHeadRatio
{
  return self->_bottomMarginHeadRatio;
}

- (void)setBottomMarginHeadRatio:(float)a3
{
  self->_float bottomMarginHeadRatio = a3;
}

- (float)leftMarginFrontPoseHeadRatio
{
  return self->_leftMarginFrontPoseHeadRatio;
}

- (void)setLeftMarginFrontPoseHeadRatio:(float)a3
{
  self->_float leftMarginFrontPoseHeadRatio = a3;
}

- (float)rightMarginFrontPoseHeadRatio
{
  return self->_rightMarginFrontPoseHeadRatio;
}

- (void)setRightMarginFrontPoseHeadRatio:(float)a3
{
  self->_float rightMarginFrontPoseHeadRatio = a3;
}

- (float)bottomMarginFrontPoseDelta
{
  return self->_bottomMarginFrontPoseDelta;
}

- (void)setBottomMarginFrontPoseDelta:(float)a3
{
  self->_float bottomMarginFrontPoseDelta = a3;
}

- (float)bottomMarginPitchPoseDelta
{
  return self->_bottomMarginPitchPoseDelta;
}

- (void)setBottomMarginPitchPoseDelta:(float)a3
{
  self->_float bottomMarginPitchPoseDelta = a3;
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_uint64_t writeDebugData = a3;
}

- (NSString)debugDataPath
{
  return self->_debugDataPath;
}

- (void)setDebugDataPath:(id)a3
{
}

- (BOOL)useLookAtForEyesForward
{
  return self->_useLookAtForEyesForward;
}

- (void)setUseLookAtForEyesForward:(BOOL)a3
{
  self->_int useLookAtForEyesForward = a3;
}

- (BOOL)ensureEyesForwardOnFrontPose
{
  return self->_ensureEyesForwardOnFrontPose;
}

- (void)setEnsureEyesForwardOnFrontPose:(BOOL)a3
{
  self->_int ensureEyesForwardOnFrontPose = a3;
}

- (BOOL)ensureEyesOpenOnFrontPose
{
  return self->_ensureEyesOpenOnFrontPose;
}

- (void)setEnsureEyesOpenOnFrontPose:(BOOL)a3
{
  self->_int ensureEyesOpenOnFrontPose = a3;
}

- (BOOL)ensureEyesOpenOnNonFrontPose
{
  return self->_ensureEyesOpenOnNonFrontPose;
}

- (void)setEnsureEyesOpenOnNonFrontPose:(BOOL)a3
{
  self->_int ensureEyesOpenOnNonFrontPose = a3;
}

- (BOOL)ensureNeutralExpressionOnFrontPose
{
  return self->_ensureNeutralExpressionOnFrontPose;
}

- (void)setEnsureNeutralExpressionOnFrontPose:(BOOL)a3
{
  self->_int ensureNeutralExpressionOnFrontPose = a3;
}

- (BOOL)ensureAlmostNeutralExpressionOnNonFrontPose
{
  return self->_ensureAlmostNeutralExpressionOnNonFrontPose;
}

- (void)setEnsureAlmostNeutralExpressionOnNonFrontPose:(BOOL)a3
{
  self->_int ensureAlmostNeutralExpressionOnNonFrontPose = a3;
}

- (BOOL)useFaceTrackingDictionary
{
  return self->_useFaceTrackingDictionary;
}

- (void)setUseFaceTrackingDictionary:(BOOL)a3
{
  self->_int useFaceTrackingDictionary = a3;
}

- (BOOL)useFKInternalFaceDetector
{
  return self->_useFKInternalFaceDetector;
}

- (void)setUseFKInternalFaceDetector:(BOOL)a3
{
  self->_int useFKInternalFaceDetector = a3;
}

- (BOOL)useFKForceCPU
{
  return self->_useFKForceCPU;
}

- (void)setUseFKForceCPU:(BOOL)a3
{
  self->_int useFKForceCPU = a3;
}

- (BOOL)convertFKTrackingDictToARKitDict
{
  return self->_convertFKTrackingDictToARKitDict;
}

- (void)setConvertFKTrackingDictToARKitDict:(BOOL)a3
{
  self->_int convertFKTrackingDictToARKitDict = a3;
}

- (BOOL)sendMetrics
{
  return self->_sendMetrics;
}

- (void)setSendMetrics:(BOOL)a3
{
  self->_int sendMetrics = a3;
}

- (NSString)cameraImageColorSpaceName
{
  return self->_cameraImageColorSpaceName;
}

- (void)setCameraImageColorSpaceName:(id)a3
{
}

- (BOOL)useSimpleSelector
{
  return self->_useSimpleSelector;
}

- (void)setUseSimpleSelector:(BOOL)a3
{
  self->_int useSimpleSelector = a3;
}

- (float)simpleSelectorMinOffsetAngle
{
  return self->_simpleSelectorMinOffsetAngle;
}

- (void)setSimpleSelectorMinOffsetAngle:(float)a3
{
  self->_float simpleSelectorMinOffsetAngle = a3;
}

- (float)simpleSelectorMaxOffsetAngle
{
  return self->_simpleSelectorMaxOffsetAngle;
}

- (void)setSimpleSelectorMaxOffsetAngle:(float)a3
{
  self->_float simpleSelectorMaxOffsetAngle = a3;
}

- (BOOL)useDistanceFilter
{
  return self->_useDistanceFilter;
}

- (void)setUseDistanceFilter:(BOOL)a3
{
  self->_int useDistanceFilter = a3;
}

- (float)distanceFilterCloseThreshold
{
  return self->_distanceFilterCloseThreshold;
}

- (void)setDistanceFilterCloseThreshold:(float)a3
{
  self->_float distanceFilterCloseThreshold = a3;
}

- (float)distanceFilterFarThreshold
{
  return self->_distanceFilterFarThreshold;
}

- (void)setDistanceFilterFarThreshold:(float)a3
{
  self->_float distanceFilterFarThreshold = a3;
}

- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions
{
  return self->_bodyPoseGuidanceOptions;
}

- (void)setBodyPoseGuidanceOptions:(id)a3
{
}

- (VGFaceSelectionFrustum)selectionFrustum
{
  return self->_selectionFrustum;
}

- (void)setSelectionFrustum:(id)a3
{
}

- (VGFaceSelectionFrustum)frontPoseSelectionFrustum
{
  return self->_frontPoseSelectionFrustum;
}

- (void)setFrontPoseSelectionFrustum:(id)a3
{
}

- (BOOL)useVNFilters
{
  return self->_useVNFilters;
}

- (void)setUseVNFilters:(BOOL)a3
{
  self->_int useVNFilters = a3;
}

- (BOOL)useVNFiltersEnrollment
{
  return self->_useVNFiltersEnrollment;
}

- (void)setUseVNFiltersEnrollment:(BOOL)a3
{
  self->_int useVNFiltersEnrollment = a3;
}

- (float)vnFrontPoseBlinkThreshold
{
  return self->_vnFrontPoseBlinkThreshold;
}

- (void)setVnFrontPoseBlinkThreshold:(float)a3
{
  self->_float vnFrontPoseBlinkThreshold = a3;
}

- (BOOL)useDepthFovFilter
{
  return self->_useDepthFovFilter;
}

- (void)setUseDepthFovFilter:(BOOL)a3
{
  self->_int useDepthFovFilter = a3;
}

- (BOOL)useDepthFovFilterForBadAlignment
{
  return self->_useDepthFovFilterForBadAlignment;
}

- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3
{
  self->_int useDepthFovFilterForBadAlignment = a3;
}

- (BOOL)useAmbientLightFilter
{
  return self->_useAmbientLightFilter;
}

- (void)setUseAmbientLightFilter:(BOOL)a3
{
  self->_int useAmbientLightFilter = a3;
}

- (float)ambientLightFilterLowThreshold
{
  return self->_ambientLightFilterLowThreshold;
}

- (void)setAmbientLightFilterLowThreshold:(float)a3
{
  self->_float ambientLightFilterLowThreshold = a3;
}

- (BOOL)useTrackedFaceIdentifierFilter
{
  return self->_useTrackedFaceIdentifierFilter;
}

- (void)setUseTrackedFaceIdentifierFilter:(BOOL)a3
{
  self->_int useTrackedFaceIdentifierFilter = a3;
}

- (BOOL)useVNFaceLandmarksFilter
{
  return self->_useVNFaceLandmarksFilter;
}

- (void)setUseVNFaceLandmarksFilter:(BOOL)a3
{
  self->_int useVNFaceLandmarksFilter = a3;
}

- (BOOL)useMotionBlurFilter
{
  return self->_useMotionBlurFilter;
}

- (void)setUseMotionBlurFilter:(BOOL)a3
{
  self->_int useMotionBlurFilter = a3;
}

- (float)motionBlurThreshold
{
  return self->_motionBlurThreshold;
}

- (void)setMotionBlurThreshold:(float)a3
{
  self->_float motionBlurThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontPoseSelectionFrustum, 0);
  objc_storeStrong((id *)&self->_selectionFrustum, 0);
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, 0);
  objc_storeStrong((id *)&self->_cameraImageColorSpaceName, 0);
  objc_storeStrong((id *)&self->_debugDataPath, 0);

  objc_storeStrong((id *)&self->_requiredExpressions, 0);
}

@end