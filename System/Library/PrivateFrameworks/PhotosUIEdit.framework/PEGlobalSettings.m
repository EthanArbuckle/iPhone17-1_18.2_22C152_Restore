@interface PEGlobalSettings
+ (id)globalSettings;
- (BOOL)affectManuallyEditedSlidersOnly;
- (BOOL)existingBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)fetchAndSendScenePrintsForSliderNet;
- (BOOL)retouchShowsDefaultModeSlider;
- (BOOL)shouldUseFlipAnimationForValuePlatter;
- (BOOL)skipOnDemandSegmentationOnFaces;
- (BOOL)smartCopyPasteGateOnCaptureTime;
- (BOOL)smartCopyPasteReviewUIEnabled;
- (BOOL)synchronousLivePhotoStylesCopyPaste;
- (BOOL)synchronousStylesCopyPaste;
- (PEGlobalSettings)init;
- (double)cleanupFilledCoverageRatio;
- (double)cleanupLassoDistance;
- (double)cleanupLassoHeadTailFraction;
- (double)cleanupLassoHeadTailMaxLength;
- (double)cleanupShortStrokeAngleThreshold;
- (double)cleanupShortStrokeLengthThreshold;
- (double)existingFloatValueForKey:(id)a3 withDefaultValue:(double)a4;
- (double)retouchDefaultModeBrushSizeDefault;
- (double)retouchStrokeIntersectionPercentage;
- (double)retouchTargetPointCoverageThreshold;
- (double)smartCopyPasteSimilarityGatingThreshold;
- (double)subjectExclusionMaskHitRadiusForDirectTouch;
- (double)subjectExclusionMaskHitRadiusForPencilTouch;
- (int64_t)existingIntegerValueForKey:(id)a3 withDefaultValue:(int64_t)a4;
- (int64_t)targetPointsFillStrategy;
- (void)_setInitialValues;
- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3;
- (void)setCleanupFilledCoverageRatio:(double)a3;
- (void)setCleanupLassoDistance:(double)a3;
- (void)setCleanupLassoHeadTailFraction:(double)a3;
- (void)setCleanupLassoHeadTailMaxLength:(double)a3;
- (void)setCleanupShortStrokeAngleThreshold:(double)a3;
- (void)setCleanupShortStrokeLengthThreshold:(double)a3;
- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3;
- (void)setRetouchDefaultModeBrushSizeDefault:(double)a3;
- (void)setRetouchShowsDefaultModeSlider:(BOOL)a3;
- (void)setRetouchStrokeIntersectionPercentage:(double)a3;
- (void)setRetouchTargetPointCoverageThreshold:(double)a3;
- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3;
- (void)setSkipOnDemandSegmentationOnFaces:(BOOL)a3;
- (void)setSmartCopyPasteGateOnCaptureTime:(BOOL)a3;
- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3;
- (void)setSmartCopyPasteSimilarityGatingThreshold:(double)a3;
- (void)setSubjectExclusionMaskHitRadiusForDirectTouch:(double)a3;
- (void)setSubjectExclusionMaskHitRadiusForPencilTouch:(double)a3;
- (void)setSynchronousLivePhotoStylesCopyPaste:(BOOL)a3;
- (void)setSynchronousStylesCopyPaste:(BOOL)a3;
- (void)setTargetPointsFillStrategy:(int64_t)a3;
@end

@implementation PEGlobalSettings

uint64_t __34__PEGlobalSettings_globalSettings__block_invoke()
{
  globalSettings_sharedGlobalInstance = objc_alloc_init(PEGlobalSettings);
  return MEMORY[0x270F9A758]();
}

- (PEGlobalSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)PEGlobalSettings;
  v2 = [(PEGlobalSettings *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PEGlobalSettings *)v2 _setInitialValues];
  }
  return v3;
}

- (void)setRetouchTargetPointCoverageThreshold:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  objc_super v5 = NSStringFromSelector(sel_retouchTargetPointCoverageThreshold);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1) {
    dispatch_once(&globalSettings_onceToken, &__block_literal_global);
  }
  v2 = (void *)globalSettings_sharedGlobalInstance;
  return v2;
}

- (void)_setInitialValues
{
  v3 = NSString;
  v4 = NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  objc_super v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [(PEGlobalSettings *)self setSmartCopyPasteReviewUIEnabled:[(PEGlobalSettings *)self existingBoolValueForKey:v6 withDefaultValue:0]];

  v7 = NSString;
  double v8 = NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  id v9 = [v8 uppercaseString];
  v10 = [v7 stringWithFormat:@"PE_SETTINGS_%@", v9];
  [(PEGlobalSettings *)self setSmartCopyPasteGateOnCaptureTime:[(PEGlobalSettings *)self existingBoolValueForKey:v10 withDefaultValue:0]];

  v11 = NSString;
  v12 = NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  v13 = [v12 uppercaseString];
  v14 = [v11 stringWithFormat:@"PE_SETTINGS_%@", v13];
  [(PEGlobalSettings *)self existingFloatValueForKey:v14 withDefaultValue:0.8];
  -[PEGlobalSettings setSmartCopyPasteSimilarityGatingThreshold:](self, "setSmartCopyPasteSimilarityGatingThreshold:");

  v15 = NSString;
  v16 = NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  v17 = [v16 uppercaseString];
  v18 = [v15 stringWithFormat:@"PE_SETTINGS_%@", v17];
  [(PEGlobalSettings *)self setAffectManuallyEditedSlidersOnly:[(PEGlobalSettings *)self existingBoolValueForKey:v18 withDefaultValue:0]];

  v19 = NSString;
  v20 = NSStringFromSelector(sel_synchronousStylesCopyPaste);
  v21 = [v20 uppercaseString];
  v22 = [v19 stringWithFormat:@"PE_SETTINGS_%@", v21];
  [(PEGlobalSettings *)self setSynchronousStylesCopyPaste:[(PEGlobalSettings *)self existingBoolValueForKey:v22 withDefaultValue:0]];

  v23 = NSString;
  v24 = NSStringFromSelector(sel_synchronousLivePhotoStylesCopyPaste);
  v25 = [v24 uppercaseString];
  v26 = [v23 stringWithFormat:@"PE_SETTINGS_%@", v25];
  [(PEGlobalSettings *)self setSynchronousLivePhotoStylesCopyPaste:[(PEGlobalSettings *)self existingBoolValueForKey:v26 withDefaultValue:1]];

  v27 = NSString;
  v28 = NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  v29 = [v28 uppercaseString];
  v30 = [v27 stringWithFormat:@"PE_SETTINGS_%@", v29];
  [(PEGlobalSettings *)self setShouldUseFlipAnimationForValuePlatter:[(PEGlobalSettings *)self existingBoolValueForKey:v30 withDefaultValue:1]];

  [(PEGlobalSettings *)self setTargetPointsFillStrategy:0];
  v31 = NSString;
  v32 = NSStringFromSelector(sel_cleanupLassoDistance);
  v33 = [v32 uppercaseString];
  v34 = [v31 stringWithFormat:@"PE_SETTINGS_%@", v33];
  [(PEGlobalSettings *)self existingFloatValueForKey:v34 withDefaultValue:36.0];
  -[PEGlobalSettings setCleanupLassoDistance:](self, "setCleanupLassoDistance:");

  v35 = NSString;
  v36 = NSStringFromSelector(sel_cleanupLassoHeadTailFraction);
  v37 = [v36 uppercaseString];
  v38 = [v35 stringWithFormat:@"PE_SETTINGS_%@", v37];
  [(PEGlobalSettings *)self existingFloatValueForKey:v38 withDefaultValue:0.1];
  -[PEGlobalSettings setCleanupLassoHeadTailFraction:](self, "setCleanupLassoHeadTailFraction:");

  v39 = NSString;
  v40 = NSStringFromSelector(sel_cleanupLassoHeadTailMaxLength);
  v41 = [v40 uppercaseString];
  v42 = [v39 stringWithFormat:@"PE_SETTINGS_%@", v41];
  [(PEGlobalSettings *)self existingFloatValueForKey:v42 withDefaultValue:80.0];
  -[PEGlobalSettings setCleanupLassoHeadTailMaxLength:](self, "setCleanupLassoHeadTailMaxLength:");

  v43 = NSString;
  v44 = NSStringFromSelector(sel_cleanupFilledCoverageRatio);
  v45 = [v44 uppercaseString];
  v46 = [v43 stringWithFormat:@"PE_SETTINGS_%@", v45];
  [(PEGlobalSettings *)self existingFloatValueForKey:v46 withDefaultValue:0.01];
  -[PEGlobalSettings setCleanupFilledCoverageRatio:](self, "setCleanupFilledCoverageRatio:");

  v47 = NSString;
  v48 = NSStringFromSelector(sel_cleanupShortStrokeLengthThreshold);
  v49 = [v48 uppercaseString];
  v50 = [v47 stringWithFormat:@"PE_SETTINGS_%@", v49];
  [(PEGlobalSettings *)self existingFloatValueForKey:v50 withDefaultValue:60.0];
  -[PEGlobalSettings setCleanupShortStrokeLengthThreshold:](self, "setCleanupShortStrokeLengthThreshold:");

  v51 = NSString;
  v52 = NSStringFromSelector(sel_cleanupShortStrokeAngleThreshold);
  v53 = [v52 uppercaseString];
  v54 = [v51 stringWithFormat:@"PE_SETTINGS_%@", v53];
  [(PEGlobalSettings *)self existingFloatValueForKey:v54 withDefaultValue:270.0];
  -[PEGlobalSettings setCleanupShortStrokeAngleThreshold:](self, "setCleanupShortStrokeAngleThreshold:");

  v55 = NSString;
  v56 = NSStringFromSelector(sel_retouchTargetPointCoverageThreshold);
  v57 = [v56 uppercaseString];
  v58 = [v55 stringWithFormat:@"PE_SETTINGS_%@", v57];
  [(PEGlobalSettings *)self existingFloatValueForKey:v58 withDefaultValue:0.4];
  -[PEGlobalSettings setRetouchTargetPointCoverageThreshold:](self, "setRetouchTargetPointCoverageThreshold:");

  v59 = NSString;
  v60 = NSStringFromSelector(sel_skipOnDemandSegmentationOnFaces);
  v61 = [v60 uppercaseString];
  v62 = [v59 stringWithFormat:@"PE_SETTINGS_%@", v61];
  [(PEGlobalSettings *)self setSkipOnDemandSegmentationOnFaces:[(PEGlobalSettings *)self existingBoolValueForKey:v62 withDefaultValue:0]];

  v63 = NSString;
  v64 = NSStringFromSelector(sel_retouchStrokeIntersectionPercentage);
  v65 = [v64 uppercaseString];
  v66 = [v63 stringWithFormat:@"PE_SETTINGS_%@", v65];
  [(PEGlobalSettings *)self existingFloatValueForKey:v66 withDefaultValue:12.0];
  -[PEGlobalSettings setRetouchStrokeIntersectionPercentage:](self, "setRetouchStrokeIntersectionPercentage:");

  v67 = NSString;
  v68 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForPencilTouch);
  v69 = [v68 uppercaseString];
  v70 = [v67 stringWithFormat:@"PE_SETTINGS_%@", v69];
  [(PEGlobalSettings *)self existingFloatValueForKey:v70 withDefaultValue:2.0];
  -[PEGlobalSettings setSubjectExclusionMaskHitRadiusForPencilTouch:](self, "setSubjectExclusionMaskHitRadiusForPencilTouch:");

  v71 = NSString;
  v72 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForDirectTouch);
  v73 = [v72 uppercaseString];
  v74 = [v71 stringWithFormat:@"PE_SETTINGS_%@", v73];
  [(PEGlobalSettings *)self existingFloatValueForKey:v74 withDefaultValue:4.0];
  -[PEGlobalSettings setSubjectExclusionMaskHitRadiusForDirectTouch:](self, "setSubjectExclusionMaskHitRadiusForDirectTouch:");

  v75 = NSString;
  v76 = NSStringFromSelector(sel_retouchDefaultModeBrushSizeDefault);
  v77 = [v76 uppercaseString];
  v78 = [v75 stringWithFormat:@"PE_SETTINGS_%@", v77];
  [(PEGlobalSettings *)self existingFloatValueForKey:v78 withDefaultValue:10.0];
  -[PEGlobalSettings setRetouchDefaultModeBrushSizeDefault:](self, "setRetouchDefaultModeBrushSizeDefault:");

  v79 = NSString;
  NSStringFromSelector(sel_retouchShowsDefaultModeSlider);
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  v80 = [v82 uppercaseString];
  v81 = [v79 stringWithFormat:@"PE_SETTINGS_%@", v80];
  [(PEGlobalSettings *)self setRetouchShowsDefaultModeSlider:[(PEGlobalSettings *)self existingBoolValueForKey:v81 withDefaultValue:0]];
}

- (BOOL)existingBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    a4 = [v8 BOOLForKey:v5];
  }
  return a4;
}

- (void)setCleanupShortStrokeLengthThreshold:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupShortStrokeLengthThreshold);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setCleanupShortStrokeAngleThreshold:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupShortStrokeAngleThreshold);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setCleanupLassoHeadTailMaxLength:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupLassoHeadTailMaxLength);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setCleanupLassoHeadTailFraction:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupLassoHeadTailFraction);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setCleanupLassoDistance:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupLassoDistance);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setCleanupFilledCoverageRatio:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_cleanupFilledCoverageRatio);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setSynchronousStylesCopyPaste:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_synchronousStylesCopyPaste);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (void)setSynchronousLivePhotoStylesCopyPaste:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_synchronousLivePhotoStylesCopyPaste);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (void)setSmartCopyPasteSimilarityGatingThreshold:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (void)setSmartCopyPasteGateOnCaptureTime:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (double)existingFloatValueForKey:(id)a3 withDefaultValue:(double)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v8 floatForKey:v5];
    a4 = v9;
  }
  return a4;
}

- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3
{
  self->_fetchAndSendScenePrintsForSliderNet = a3;
}

- (BOOL)fetchAndSendScenePrintsForSliderNet
{
  return self->_fetchAndSendScenePrintsForSliderNet;
}

- (void)setRetouchShowsDefaultModeSlider:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_retouchShowsDefaultModeSlider);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (BOOL)retouchShowsDefaultModeSlider
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_retouchShowsDefaultModeSlider);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (void)setRetouchDefaultModeBrushSizeDefault:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_retouchDefaultModeBrushSizeDefault);
  v6 = [v5 uppercaseString];
  char v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)retouchDefaultModeBrushSizeDefault
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_retouchDefaultModeBrushSizeDefault);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setSubjectExclusionMaskHitRadiusForDirectTouch:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForDirectTouch);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)subjectExclusionMaskHitRadiusForDirectTouch
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForDirectTouch);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setSubjectExclusionMaskHitRadiusForPencilTouch:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForPencilTouch);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)subjectExclusionMaskHitRadiusForPencilTouch
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_subjectExclusionMaskHitRadiusForPencilTouch);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setRetouchStrokeIntersectionPercentage:(double)a3
{
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_retouchStrokeIntersectionPercentage);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)retouchStrokeIntersectionPercentage
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_retouchStrokeIntersectionPercentage);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setSkipOnDemandSegmentationOnFaces:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_skipOnDemandSegmentationOnFaces);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setBool:v3 forKey:v7];
}

- (BOOL)skipOnDemandSegmentationOnFaces
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_skipOnDemandSegmentationOnFaces);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (double)retouchTargetPointCoverageThreshold
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_retouchTargetPointCoverageThreshold);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupShortStrokeAngleThreshold
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupShortStrokeAngleThreshold);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupShortStrokeLengthThreshold
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupShortStrokeLengthThreshold);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupFilledCoverageRatio
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupFilledCoverageRatio);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupLassoHeadTailMaxLength
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupLassoHeadTailMaxLength);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupLassoHeadTailFraction
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupLassoHeadTailFraction);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (double)cleanupLassoDistance
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_cleanupLassoDistance);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setTargetPointsFillStrategy:(int64_t)a3
{
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = NSString;
  id v5 = NSStringFromSelector(sel_targetPointsFillStrategy);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PE_SETTINGS_%@", v6];
  [v8 setInteger:a3 forKey:v7];
}

- (int64_t)targetPointsFillStrategy
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_targetPointsFillStrategy);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  int64_t v7 = [v2 integerForKey:v6];

  return v7;
}

- (BOOL)shouldUseFlipAnimationForValuePlatter
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (BOOL)synchronousLivePhotoStylesCopyPaste
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_synchronousLivePhotoStylesCopyPaste);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (BOOL)synchronousStylesCopyPaste
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_synchronousStylesCopyPaste);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (BOOL)affectManuallyEditedSlidersOnly
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (double)smartCopyPasteSimilarityGatingThreshold
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (BOOL)smartCopyPasteGateOnCaptureTime
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (BOOL)smartCopyPasteReviewUIEnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = NSString;
  v4 = NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  id v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PE_SETTINGS_%@", v5];
  char v7 = [v2 BOOLForKey:v6];

  return v7;
}

- (int64_t)existingIntegerValueForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v7 = [v6 objectForKey:v5];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    a4 = [v8 integerForKey:v5];
  }
  return a4;
}

@end