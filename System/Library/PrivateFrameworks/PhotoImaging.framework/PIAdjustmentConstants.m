@interface PIAdjustmentConstants
- (NSArray)allAdjustmentTypes;
- (NSArray)nonVisualAdjustmentTypes;
- (NSString)PIApertureRedEyeAdjustmentKey;
- (NSString)PIAutoEnhanceAdjustmentKey;
- (NSString)PIAutoLoopAdjustmentKey;
- (NSString)PICinematicAudioAdjustmentKey;
- (NSString)PICropAdjustmentKey;
- (NSString)PICurvesAdjustmentKey;
- (NSString)PIDefinitionAdjustmentKey;
- (NSString)PIDepthAdjustmentKey;
- (NSString)PIEffect3DAdjustmentKey;
- (NSString)PIEffectAdjustmentKey;
- (NSString)PIGrainAdjustmentKey;
- (NSString)PIHighResFusionAdjustmentKey;
- (NSString)PIInpaintAdjustmentKey;
- (NSString)PILevelsAdjustmentKey;
- (NSString)PILivePhotoKeyFrameAdjustmentKey;
- (NSString)PIMuteAdjustmentKey;
- (NSString)PINoiseReductionAdjustmentKey;
- (NSString)PIOrientationAdjustmentKey;
- (NSString)PIPortraitAdjustmentKey;
- (NSString)PIPortraitVideoAdjustmentKey;
- (NSString)PIRawAdjustmentKey;
- (NSString)PIRawNoiseReductionAdjustmentKey;
- (NSString)PIRedEyeAdjustmentKey;
- (NSString)PIRetouchAdjustmentKey;
- (NSString)PISelectiveColorAdjustmentKey;
- (NSString)PISemanticEnhanceAdjustmentKey;
- (NSString)PISemanticStyleAdjustmentKey;
- (NSString)PISharpenAdjustmentKey;
- (NSString)PISlomoAdjustmentKey;
- (NSString)PISmartBWAdjustmentKey;
- (NSString)PISmartColorAdjustmentKey;
- (NSString)PISmartToneAdjustmentKey;
- (NSString)PISourceAdjustmentKey;
- (NSString)PITrimAdjustmentKey;
- (NSString)PIVideoCrossfadeLoopAdjustmentKey;
- (NSString)PIVideoPosterFrameAdjustmentKey;
- (NSString)PIVideoStabilizeAdjustmentKey;
- (NSString)PIVignetteAdjustmentKey;
- (NSString)PIWhiteBalanceAdjustmentKey;
- (PIAdjustmentConstants)init;
@end

@implementation PIAdjustmentConstants

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PISourceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISemanticStyleAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICinematicAudioAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIPortraitVideoAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoCrossfadeLoopAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoStabilizeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISemanticEnhanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRawNoiseReductionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRawAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIOrientationAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIPortraitAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIDepthAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIMuteAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIHighResFusionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIAutoLoopAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoPosterFrameAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PILivePhotoKeyFrameAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISlomoAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PITrimAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICropAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIEffect3DAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIEffectAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISelectiveColorAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PILevelsAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICurvesAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIDefinitionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PINoiseReductionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISharpenAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVignetteAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIInpaintAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRetouchAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIApertureRedEyeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRedEyeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIWhiteBalanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIAutoEnhanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIGrainAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartBWAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartColorAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartToneAdjustmentKey, 0);
}

- (NSString)PISourceAdjustmentKey
{
  return self->_PISourceAdjustmentKey;
}

- (NSString)PISemanticStyleAdjustmentKey
{
  return self->_PISemanticStyleAdjustmentKey;
}

- (NSString)PICinematicAudioAdjustmentKey
{
  return self->_PICinematicAudioAdjustmentKey;
}

- (NSString)PIPortraitVideoAdjustmentKey
{
  return self->_PIPortraitVideoAdjustmentKey;
}

- (NSString)PIVideoCrossfadeLoopAdjustmentKey
{
  return self->_PIVideoCrossfadeLoopAdjustmentKey;
}

- (NSString)PIVideoStabilizeAdjustmentKey
{
  return self->_PIVideoStabilizeAdjustmentKey;
}

- (NSString)PISemanticEnhanceAdjustmentKey
{
  return self->_PISemanticEnhanceAdjustmentKey;
}

- (NSString)PIRawNoiseReductionAdjustmentKey
{
  return self->_PIRawNoiseReductionAdjustmentKey;
}

- (NSString)PIRawAdjustmentKey
{
  return self->_PIRawAdjustmentKey;
}

- (NSString)PIOrientationAdjustmentKey
{
  return self->_PIOrientationAdjustmentKey;
}

- (NSString)PIPortraitAdjustmentKey
{
  return self->_PIPortraitAdjustmentKey;
}

- (NSString)PIDepthAdjustmentKey
{
  return self->_PIDepthAdjustmentKey;
}

- (NSString)PIMuteAdjustmentKey
{
  return self->_PIMuteAdjustmentKey;
}

- (NSString)PIHighResFusionAdjustmentKey
{
  return self->_PIHighResFusionAdjustmentKey;
}

- (NSString)PIAutoLoopAdjustmentKey
{
  return self->_PIAutoLoopAdjustmentKey;
}

- (NSString)PIVideoPosterFrameAdjustmentKey
{
  return self->_PIVideoPosterFrameAdjustmentKey;
}

- (NSString)PILivePhotoKeyFrameAdjustmentKey
{
  return self->_PILivePhotoKeyFrameAdjustmentKey;
}

- (NSString)PISlomoAdjustmentKey
{
  return self->_PISlomoAdjustmentKey;
}

- (NSString)PITrimAdjustmentKey
{
  return self->_PITrimAdjustmentKey;
}

- (NSString)PICropAdjustmentKey
{
  return self->_PICropAdjustmentKey;
}

- (NSString)PIEffect3DAdjustmentKey
{
  return self->_PIEffect3DAdjustmentKey;
}

- (NSString)PIEffectAdjustmentKey
{
  return self->_PIEffectAdjustmentKey;
}

- (NSString)PISelectiveColorAdjustmentKey
{
  return self->_PISelectiveColorAdjustmentKey;
}

- (NSString)PILevelsAdjustmentKey
{
  return self->_PILevelsAdjustmentKey;
}

- (NSString)PICurvesAdjustmentKey
{
  return self->_PICurvesAdjustmentKey;
}

- (NSString)PIDefinitionAdjustmentKey
{
  return self->_PIDefinitionAdjustmentKey;
}

- (NSString)PINoiseReductionAdjustmentKey
{
  return self->_PINoiseReductionAdjustmentKey;
}

- (NSString)PISharpenAdjustmentKey
{
  return self->_PISharpenAdjustmentKey;
}

- (NSString)PIVignetteAdjustmentKey
{
  return self->_PIVignetteAdjustmentKey;
}

- (NSString)PIInpaintAdjustmentKey
{
  return self->_PIInpaintAdjustmentKey;
}

- (NSString)PIRetouchAdjustmentKey
{
  return self->_PIRetouchAdjustmentKey;
}

- (NSString)PIApertureRedEyeAdjustmentKey
{
  return self->_PIApertureRedEyeAdjustmentKey;
}

- (NSString)PIRedEyeAdjustmentKey
{
  return self->_PIRedEyeAdjustmentKey;
}

- (NSString)PIWhiteBalanceAdjustmentKey
{
  return self->_PIWhiteBalanceAdjustmentKey;
}

- (NSString)PIAutoEnhanceAdjustmentKey
{
  return self->_PIAutoEnhanceAdjustmentKey;
}

- (NSString)PIGrainAdjustmentKey
{
  return self->_PIGrainAdjustmentKey;
}

- (NSString)PISmartBWAdjustmentKey
{
  return self->_PISmartBWAdjustmentKey;
}

- (NSString)PISmartColorAdjustmentKey
{
  return self->_PISmartColorAdjustmentKey;
}

- (NSString)PISmartToneAdjustmentKey
{
  return self->_PISmartToneAdjustmentKey;
}

- (NSArray)nonVisualAdjustmentTypes
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_PITrimAdjustmentKey;
  PIMuteAdjustmentKey = self->_PIMuteAdjustmentKey;
  long long v6 = *(_OWORD *)&self->_PILivePhotoKeyFrameAdjustmentKey;
  PICinematicAudioAdjustmentKey = self->_PICinematicAudioAdjustmentKey;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:6];
  return (NSArray *)v2;
}

- (NSArray)allAdjustmentTypes
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  PISmartBWAdjustmentKey = self->_PISmartBWAdjustmentKey;
  PIWhiteBalanceAdjustmentKey = self->_PIWhiteBalanceAdjustmentKey;
  PIVignetteAdjustmentKey = self->_PIVignetteAdjustmentKey;
  PISharpenAdjustmentKey = self->_PISharpenAdjustmentKey;
  PIRetouchAdjustmentKey = self->_PIRetouchAdjustmentKey;
  v25 = PIVignetteAdjustmentKey;
  PINoiseReductionAdjustmentKey = self->_PINoiseReductionAdjustmentKey;
  PIDefinitionAdjustmentKey = self->_PIDefinitionAdjustmentKey;
  v26 = PISharpenAdjustmentKey;
  v27 = PINoiseReductionAdjustmentKey;
  PICurvesAdjustmentKey = self->_PICurvesAdjustmentKey;
  PILevelsAdjustmentKey = self->_PILevelsAdjustmentKey;
  v28 = PIDefinitionAdjustmentKey;
  v29 = PICurvesAdjustmentKey;
  v30 = PILevelsAdjustmentKey;
  PIEffect3DAdjustmentKey = self->_PIEffect3DAdjustmentKey;
  PIAutoLoopAdjustmentKey = self->_PIAutoLoopAdjustmentKey;
  PIVideoPosterFrameAdjustmentKey = self->_PIVideoPosterFrameAdjustmentKey;
  v36 = PIAutoLoopAdjustmentKey;
  PIMuteAdjustmentKey = self->_PIMuteAdjustmentKey;
  PIHighResFusionAdjustmentKey = self->_PIHighResFusionAdjustmentKey;
  v38 = PIMuteAdjustmentKey;
  PIPortraitAdjustmentKey = self->_PIPortraitAdjustmentKey;
  PIDepthAdjustmentKey = self->_PIDepthAdjustmentKey;
  v40 = PIPortraitAdjustmentKey;
  PIRawAdjustmentKey = self->_PIRawAdjustmentKey;
  PIOrientationAdjustmentKey = self->_PIOrientationAdjustmentKey;
  v42 = PIRawAdjustmentKey;
  PISemanticEnhanceAdjustmentKey = self->_PISemanticEnhanceAdjustmentKey;
  PIPortraitVideoAdjustmentKey = self->_PIPortraitVideoAdjustmentKey;
  PICinematicAudioAdjustmentKey = self->_PICinematicAudioAdjustmentKey;
  PIRawNoiseReductionAdjustmentKey = self->_PIRawNoiseReductionAdjustmentKey;
  v44 = PIPortraitVideoAdjustmentKey;
  PIVideoStabilizeAdjustmentKey = self->_PIVideoStabilizeAdjustmentKey;
  v46 = PISemanticEnhanceAdjustmentKey;
  long long v19 = *(_OWORD *)&self->_PISmartToneAdjustmentKey;
  long long v21 = *(_OWORD *)&self->_PIGrainAdjustmentKey;
  long long v23 = *(_OWORD *)&self->_PIRedEyeAdjustmentKey;
  long long v31 = *(_OWORD *)&self->_PISelectiveColorAdjustmentKey;
  long long v15 = *(_OWORD *)&self->_PISlomoAdjustmentKey;
  long long v33 = *(_OWORD *)&self->_PICropAdjustmentKey;
  long long v34 = v15;
  PISemanticStyleAdjustmentKey = self->_PISemanticStyleAdjustmentKey;
  v47 = PICinematicAudioAdjustmentKey;
  v48 = PISemanticStyleAdjustmentKey;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:36];
  return (NSArray *)v17;
}

- (PIAdjustmentConstants)init
{
  v6.receiver = self;
  v6.super_class = (Class)PIAdjustmentConstants;
  v2 = [(PIAdjustmentConstants *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_PISmartToneAdjustmentKey, @"smartTone");
    objc_storeStrong((id *)&v3->_PISmartColorAdjustmentKey, @"smartColor");
    objc_storeStrong((id *)&v3->_PISmartBWAdjustmentKey, @"smartBlackAndWhite");
    objc_storeStrong((id *)&v3->_PIGrainAdjustmentKey, @"grain");
    objc_storeStrong((id *)&v3->_PIAutoEnhanceAdjustmentKey, @"autoEnhance");
    objc_storeStrong((id *)&v3->_PIWhiteBalanceAdjustmentKey, @"whiteBalance");
    objc_storeStrong((id *)&v3->_PIRedEyeAdjustmentKey, @"redEye");
    objc_storeStrong((id *)&v3->_PIApertureRedEyeAdjustmentKey, @"apertureRedEye");
    objc_storeStrong((id *)&v3->_PIRetouchAdjustmentKey, @"retouch");
    objc_storeStrong((id *)&v3->_PIInpaintAdjustmentKey, @"inpaint");
    objc_storeStrong((id *)&v3->_PIVignetteAdjustmentKey, @"vignette");
    objc_storeStrong((id *)&v3->_PISharpenAdjustmentKey, @"sharpen");
    objc_storeStrong((id *)&v3->_PINoiseReductionAdjustmentKey, @"noiseReduction");
    objc_storeStrong((id *)&v3->_PIDefinitionAdjustmentKey, @"definition");
    objc_storeStrong((id *)&v3->_PICurvesAdjustmentKey, @"curves");
    objc_storeStrong((id *)&v3->_PILevelsAdjustmentKey, @"levels");
    objc_storeStrong((id *)&v3->_PISelectiveColorAdjustmentKey, @"selectiveColor");
    objc_storeStrong((id *)&v3->_PIEffectAdjustmentKey, @"effect");
    objc_storeStrong((id *)&v3->_PIEffect3DAdjustmentKey, @"effect3D");
    objc_storeStrong((id *)&v3->_PICropAdjustmentKey, @"cropStraighten");
    objc_storeStrong((id *)&v3->_PITrimAdjustmentKey, @"trim");
    objc_storeStrong((id *)&v3->_PISlomoAdjustmentKey, @"slomo");
    objc_storeStrong((id *)&v3->_PILivePhotoKeyFrameAdjustmentKey, @"livePhotoKeyFrame");
    objc_storeStrong((id *)&v3->_PIVideoPosterFrameAdjustmentKey, @"videoPosterFrame");
    objc_storeStrong((id *)&v3->_PIAutoLoopAdjustmentKey, @"autoLoop");
    objc_storeStrong((id *)&v3->_PIHighResFusionAdjustmentKey, @"highResFusion");
    objc_storeStrong((id *)&v3->_PIMuteAdjustmentKey, @"mute");
    objc_storeStrong((id *)&v3->_PIDepthAdjustmentKey, @"depthEffect");
    objc_storeStrong((id *)&v3->_PIPortraitAdjustmentKey, @"portraitEffect");
    objc_storeStrong((id *)&v3->_PIOrientationAdjustmentKey, @"orientation");
    objc_storeStrong((id *)&v3->_PIRawAdjustmentKey, @"raw");
    objc_storeStrong((id *)&v3->_PIRawNoiseReductionAdjustmentKey, @"rawNoiseReduction");
    objc_storeStrong((id *)&v3->_PISourceAdjustmentKey, @"source");
    objc_storeStrong((id *)&v3->_PIPortraitVideoAdjustmentKey, @"portraitVideo");
    objc_storeStrong((id *)&v3->_PIVideoStabilizeAdjustmentKey, @"videoStabilize");
    objc_storeStrong((id *)&v3->_PIVideoCrossfadeLoopAdjustmentKey, @"videoCrossfadeLoop");
    objc_storeStrong((id *)&v3->_PISemanticEnhanceAdjustmentKey, @"semanticEnhance");
    objc_storeStrong((id *)&v3->_PICinematicAudioAdjustmentKey, @"cinematicAudio");
    objc_storeStrong((id *)&v3->_PISemanticStyleAdjustmentKey, @"semanticStyle");
    long long v4 = v3;
  }

  return v3;
}

@end