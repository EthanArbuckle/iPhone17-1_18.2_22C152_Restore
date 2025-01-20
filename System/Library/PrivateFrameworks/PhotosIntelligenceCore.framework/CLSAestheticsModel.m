@interface CLSAestheticsModel
+ (NSString)name;
+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood;
+ (double)legacyAestheticScoreThresholdToBeAwesome;
+ (double)legacyAestheticScoreThresholdToNotBeJunk;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (CLSAestheticsModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)failureScoreNode;
- (CLSSignalNode)harmoniousColorScoreNode;
- (CLSSignalNode)immersivenessScoreNode;
- (CLSSignalNode)interestingSubjectScoreNode;
- (CLSSignalNode)intrusiveObjectPresenceScoreNode;
- (CLSSignalNode)livelyColorScoreNode;
- (CLSSignalNode)lowLightNode;
- (CLSSignalNode)noiseScoreNode;
- (CLSSignalNode)overallAestheticScoreNode;
- (CLSSignalNode)pleasantCameraTiltScoreNode;
- (CLSSignalNode)pleasantCompositionScoreNode;
- (CLSSignalNode)pleasantLightingScoreNode;
- (CLSSignalNode)pleasantPatternScoreNode;
- (CLSSignalNode)pleasantPerspectiveScoreNode;
- (CLSSignalNode)pleasantPostProcessingScoreNode;
- (CLSSignalNode)pleasantReflectionsScoreNode;
- (CLSSignalNode)pleasantSymmetryScoreNode;
- (CLSSignalNode)sharplyFocusedSubjectScoreNode;
- (CLSSignalNode)tastefullyBlurredScoreNode;
- (CLSSignalNode)wellChosenSubjectScoreNode;
- (CLSSignalNode)wellFramedSubjectScoreNode;
- (CLSSignalNode)wellTimedShotScoreNode;
- (double)aestheticScoreThresholdToBeAestheticallyPrettyGood;
- (double)aestheticScoreThresholdToBeAwesome;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion31;
- (void)setupVersion32;
- (void)setupVersion86;
@end

@implementation CLSAestheticsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowLightNode, 0);
  objc_storeStrong((id *)&self->_pleasantCameraTiltScoreNode, 0);
  objc_storeStrong((id *)&self->_intrusiveObjectPresenceScoreNode, 0);
  objc_storeStrong((id *)&self->_interestingSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantCompositionScoreNode, 0);
  objc_storeStrong((id *)&self->_failureScoreNode, 0);
  objc_storeStrong((id *)&self->_noiseScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPostProcessingScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPerspectiveScoreNode, 0);
  objc_storeStrong((id *)&self->_immersivenessScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPatternScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantSymmetryScoreNode, 0);
  objc_storeStrong((id *)&self->_livelyColorScoreNode, 0);
  objc_storeStrong((id *)&self->_harmoniousColorScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantReflectionsScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantLightingScoreNode, 0);
  objc_storeStrong((id *)&self->_wellTimedShotScoreNode, 0);
  objc_storeStrong((id *)&self->_sharplyFocusedSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_tastefullyBlurredScoreNode, 0);
  objc_storeStrong((id *)&self->_wellChosenSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_wellFramedSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_overallAestheticScoreNode, 0);
}

- (double)aestheticScoreThresholdToBeAestheticallyPrettyGood
{
  return self->_aestheticScoreThresholdToBeAestheticallyPrettyGood;
}

- (double)aestheticScoreThresholdToBeAwesome
{
  return self->_aestheticScoreThresholdToBeAwesome;
}

- (CLSSignalNode)lowLightNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 184, 1);
}

- (CLSSignalNode)pleasantCameraTiltScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 176, 1);
}

- (CLSSignalNode)intrusiveObjectPresenceScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 168, 1);
}

- (CLSSignalNode)interestingSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 160, 1);
}

- (CLSSignalNode)pleasantCompositionScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 152, 1);
}

- (CLSSignalNode)failureScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 144, 1);
}

- (CLSSignalNode)noiseScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 136, 1);
}

- (CLSSignalNode)pleasantPostProcessingScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 128, 1);
}

- (CLSSignalNode)pleasantPerspectiveScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 120, 1);
}

- (CLSSignalNode)immersivenessScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 112, 1);
}

- (CLSSignalNode)pleasantPatternScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 104, 1);
}

- (CLSSignalNode)pleasantSymmetryScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 96, 1);
}

- (CLSSignalNode)livelyColorScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)harmoniousColorScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)pleasantReflectionsScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)pleasantLightingScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)wellTimedShotScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)sharplyFocusedSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)tastefullyBlurredScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)wellChosenSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)wellFramedSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)overallAestheticScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion86
{
  [(CLSAestheticsModel *)self setupVersion32];
  self->_version = 86;
  self->_lowLightNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Low Light" operatingPoint:0.8 highPrecisionOperatingPoint:0.8 highRecallOperatingPoint:0.8];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion32
{
  [(CLSAestheticsModel *)self setupVersion31];
  self->_version = 32;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Overall Aesthetics" operatingPoint:0.1 highPrecisionOperatingPoint:0.22 highRecallOperatingPoint:0.1];
  overallAestheticScoreNode = self->_overallAestheticScoreNode;
  self->_overallAestheticScoreNode = v3;

  self->_aestheticScoreThresholdToBeAwesome = 0.7;
}

- (void)setupVersion31
{
  self->_version = 31;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Overall Aesthetics" operatingPoint:0.1 highPrecisionOperatingPoint:0.18 highRecallOperatingPoint:0.1];
  overallAestheticScoreNode = self->_overallAestheticScoreNode;
  self->_overallAestheticScoreNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Well Framed Subject" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  wellFramedSubjectScoreNode = self->_wellFramedSubjectScoreNode;
  self->_wellFramedSubjectScoreNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Well Chosen Subject" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  wellChosenSubjectScoreNode = self->_wellChosenSubjectScoreNode;
  self->_wellChosenSubjectScoreNode = v7;

  v9 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Tastefully Blurred" operatingPoint:-0.92 highPrecisionOperatingPoint:-0.29 highRecallOperatingPoint:-0.92];
  tastefullyBlurredScoreNode = self->_tastefullyBlurredScoreNode;
  self->_tastefullyBlurredScoreNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Sharply Focused Subject" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  sharplyFocusedSubjectScoreNode = self->_sharplyFocusedSubjectScoreNode;
  self->_sharplyFocusedSubjectScoreNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Well Timed Shot" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  wellTimedShotScoreNode = self->_wellTimedShotScoreNode;
  self->_wellTimedShotScoreNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Lighting" operatingPoint:-0.76 highPrecisionOperatingPoint:-0.65 highRecallOperatingPoint:-0.76];
  pleasantLightingScoreNode = self->_pleasantLightingScoreNode;
  self->_pleasantLightingScoreNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Reflections" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantReflectionsScoreNode = self->_pleasantReflectionsScoreNode;
  self->_pleasantReflectionsScoreNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Harmonious Color" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  harmoniousColorScoreNode = self->_harmoniousColorScoreNode;
  self->_harmoniousColorScoreNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Lively Color" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  livelyColorScoreNode = self->_livelyColorScoreNode;
  self->_livelyColorScoreNode = v21;

  v23 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Symmetry" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantSymmetryScoreNode = self->_pleasantSymmetryScoreNode;
  self->_pleasantSymmetryScoreNode = v23;

  v25 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Pattern" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantPatternScoreNode = self->_pleasantPatternScoreNode;
  self->_pleasantPatternScoreNode = v25;

  v27 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Immersiveness" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  immersivenessScoreNode = self->_immersivenessScoreNode;
  self->_immersivenessScoreNode = v27;

  v29 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Perspective" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantPerspectiveScoreNode = self->_pleasantPerspectiveScoreNode;
  self->_pleasantPerspectiveScoreNode = v29;

  v31 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Postprocessing" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantPostProcessingScoreNode = self->_pleasantPostProcessingScoreNode;
  self->_pleasantPostProcessingScoreNode = v31;

  v33 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Noise" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noiseScoreNode = self->_noiseScoreNode;
  self->_noiseScoreNode = v33;

  v35 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Failure" operatingPoint:-0.45 highPrecisionOperatingPoint:-0.035 highRecallOperatingPoint:-0.45];
  failureScoreNode = self->_failureScoreNode;
  self->_failureScoreNode = v35;

  v37 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Composition" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantCompositionScoreNode = self->_pleasantCompositionScoreNode;
  self->_pleasantCompositionScoreNode = v37;

  v39 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Interesting Subject" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  interestingSubjectScoreNode = self->_interestingSubjectScoreNode;
  self->_interestingSubjectScoreNode = v39;

  v41 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Intrusive Object Presence" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  intrusiveObjectPresenceScoreNode = self->_intrusiveObjectPresenceScoreNode;
  self->_intrusiveObjectPresenceScoreNode = v41;

  v43 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Pleasant Camera Tilt" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  pleasantCameraTiltScoreNode = self->_pleasantCameraTiltScoreNode;
  self->_pleasantCameraTiltScoreNode = v43;

  v45 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Low Light" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  lowLightNode = self->_lowLightNode;
  self->_lowLightNode = v45;

  *(_OWORD *)&self->_aestheticScoreThresholdToBeAwesome = xmmword_25995A460;
}

- (id)initForTesting
{
  return [(CLSAestheticsModel *)self initWithSceneAnalysisVersion:86];
}

- (CLSAestheticsModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSAestheticsModel;
  v4 = [(CLSAestheticsModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x56)
    {
      if (a3 < 0x20)
      {
        if (a3 == 31)
        {
          [(CLSAestheticsModel *)v4 setupVersion31];
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            int v10 = a3;
            __int16 v11 = 2112;
            uint64_t v12 = v6;
            _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
      }
      else
      {
        [(CLSAestheticsModel *)v4 setupVersion32];
      }
    }
    else
    {
      [(CLSAestheticsModel *)v4 setupVersion86];
    }
  }
  return v5;
}

+ (double)legacyAestheticScoreThresholdToNotBeJunk
{
  return 0.1;
}

+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood
{
  return 0.45;
}

+ (double)legacyAestheticScoreThresholdToBeAwesome
{
  return 0.65;
}

+ (unint64_t)latestVersion
{
  return 86;
}

+ (NSString)name
{
  return (NSString *)@"Aesthetics";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 32;
  if (a3 == 31) {
    uint64_t v4 = 31;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a3 <= 0x1F) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x55) {
    return v3;
  }
  else {
    return 86;
  }
}

@end