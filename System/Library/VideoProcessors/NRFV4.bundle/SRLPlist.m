@interface SRLPlist
- (int)readPlist:(id)a3;
@end

@implementation SRLPlist

- (int)readPlist:(id)a3
{
  int v53 = 0;
  id v4 = a3;
  getFloatParameter(v4, @"MinFaceSizeT0", &v53);
  self->minFaceSizeT0 = v5;
  getFloatParameter(v4, @"MinFaceSizeT1", &v53);
  self->minFaceSizeT1 = v6;
  getFloatParameter(v4, @"MaxProfileFaceOrientation", &v53);
  self->maxProfileFaceOrientation = v7;
  getFloatParameter(v4, @"SkinMaskMaybeT", &v53);
  self->skinMaskMaybeT = v8;
  getFloatParameter(v4, @"SkinMaskDefinitelyT", &v53);
  self->skinMaskDefinitelyT = v9;
  getFloatParameter(v4, @"PersonMaskT0", &v53);
  self->personMaskT0 = v10;
  getFloatParameter(v4, @"PersonMaskT1", &v53);
  self->personMaskT1 = v11;
  getFloatParameter(v4, @"LumaSigmaMaskM", &v53);
  self->lumaSigmaMaskM = v12;
  getFloatParameter(v4, @"LumaSigmaMaskC", &v53);
  self->lumaSigmaMaskC = v13;
  getFloatParameter(v4, @"BlueSigmaMaskM", &v53);
  self->blueSigmaMaskM = v14;
  getFloatParameter(v4, @"BlueSigmaMaskC", &v53);
  self->blueSigmaMaskC = v15;
  getFloatParameter(v4, @"BrightestFaceMaxLumaT0", &v53);
  self->brightestFaceMaxLumaT0 = v16;
  getFloatParameter(v4, @"BrightestFaceMaxLumaT1", &v53);
  self->brightestFaceMaxLumaT1 = v17;
  getFloatParameter(v4, @"HazeMaxT0", &v53);
  self->hazeMaxT0 = v18;
  getFloatParameter(v4, @"HazeMaxT1", &v53);
  self->hazeMaxT1 = v19;
  getFloatParameter(v4, @"MaxWhitePointSkinRedT0", &v53);
  self->maxWhitePointSkinRedT0 = v20;
  getFloatParameter(v4, @"MaxWhitePointSkinRedT1", &v53);
  self->maxWhitePointSkinRedT1 = v21;
  getFloatParameter(v4, @"MaxWhitePointNonSkinT0", &v53);
  self->maxWhitePointNonSkinT0 = v22;
  getFloatParameter(v4, @"MaxWhitePointNonSkinT1", &v53);
  self->maxWhitePointNonSkinT1 = v23;
  getFloatParameter(v4, @"ExtraBoostRedBlueMedianSumT0", &v53);
  self->extraBoostRedBlueMedianSumT0 = v24;
  getFloatParameter(v4, @"ExtraBoostRedBlueMedianSumT1", &v53);
  self->extraBoostRedBlueMedianSumT1 = v25;
  getFloatParameter(v4, @"ExtraBoostRedMedianWeight", &v53);
  self->extraBoostRedMedianWeight = v26;
  getFloatParameter(v4, @"ExtraBoostBlueMedianWeight", &v53);
  self->extraBoostBlueMedianWeight = v27;
  getFloatParameter(v4, @"ExtraBoostRedBlackPointT0", &v53);
  self->extraBoostRedBlackPointT0 = v28;
  getFloatParameter(v4, @"ExtraBoostRedBlackPointT1", &v53);
  self->extraBoostRedBlackPointT1 = v29;
  getFloatParameter(v4, @"ExtraBoostNonSkinLumaWhitePointT0", &v53);
  self->extraBoostNonSkinLumaWhitePointT0 = v30;
  getFloatParameter(v4, @"ExtraBoostNonSkinLumaWhitePointT1", &v53);
  self->extraBoostNonSkinLumaWhitePointT1 = v31;
  getFloatParameter(v4, @"BoostModelA", &v53);
  self->boostModelA = v32;
  getFloatParameter(v4, @"BoostModelB", &v53);
  self->boostModelB = v33;
  getFloatParameter(v4, @"MinFaceSizeT0Landmarks", &v53);
  self->minFaceSizeT0Landmarks = v34;
  getFloatParameter(v4, @"MinFaceSizeT1Landmarks", &v53);
  self->minFaceSizeT1Landmarks = v35;
  getFloatParameter(v4, @"GlobalLimitT0", &v53);
  self->globalLimitT0 = v36;
  getFloatParameter(v4, @"GlobalLimitT1", &v53);
  self->globalLimitT1 = v37;
  getFloatParameter(v4, @"GlobalLimitT2", &v53);
  self->globalLimitT2 = v38;
  getFloatParameter(v4, @"GlobalLimitT3", &v53);
  self->globalLimitT3 = v39;
  getFloatParameter(v4, @"GlobalLimitStr", &v53);
  self->globalLimitStr = v40;
  getFloatParameter(v4, @"LocalLimitT0", &v53);
  self->localLimitT0 = v41;
  getFloatParameter(v4, @"LocalLimitT1", &v53);
  self->localLimitT1 = v42;
  getFloatParameter(v4, @"LocalLimitStr", &v53);
  self->localLimitStr = v43;
  getFloatParameter(v4, @"LocalExtraBoost", &v53);
  self->localExtraBoost = v44;
  getFloatParameter(v4, @"SaturationT0", &v53);
  self->saturationT0 = v45;
  getFloatParameter(v4, @"SaturationT1", &v53);
  self->saturationT1 = v46;
  getFloatParameter(v4, @"SaturationStr", &v53);
  self->saturationStr = v47;
  self->enableHRStrength = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableHRStrength", 0, 0);
  getFloatParameter(v4, @"HRBoostModelA", &v53);
  self->hRboostModelA = v48;
  getFloatParameter(v4, @"HRBoostModelB", &v53);
  self->hRboostModelB = v49;
  getFloatParameter(v4, @"AETargetGainTh", &v53);
  float v51 = v50;

  self->aETargetGainTh = v51;
  return v53;
}

@end