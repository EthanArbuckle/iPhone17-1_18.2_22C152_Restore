@interface SRLv2Plist
- (int)readPlist:(id)a3;
@end

@implementation SRLv2Plist

- (int)readPlist:(id)a3
{
  int v28 = 0;
  id v4 = a3;
  getFloatParameter(v4, @"MaskThreshold", &v28);
  self->maskThreshold = v5;
  getFloatParameter(v4, @"MinFaceSize", &v28);
  self->minFaceSize = v6;
  getFloatParameter(v4, @"MaxCurveBoost", &v28);
  self->maxCurveBoost = v7;
  getFloatParameter(v4, @"MinCurveBoost", &v28);
  self->minCurveBoost = v8;
  getFloatParameter(v4, @"MaxTargetRatioDarkening", &v28);
  self->maxTargetRatioDarkening = v9;
  getFloatParameter(v4, @"MaxTargetRatioLimit", &v28);
  self->maxTargetRatioLimit = v10;
  getFloatParameter(v4, @"BiasFactorSRLv2", &v28);
  self->biasFactorSRLv2 = v11;
  getFloatParameter(v4, @"ToneSimilaritySigma", &v28);
  self->toneSimilaritySigma = v12;
  getFloatParameter(v4, @"FaceExpDifThreshold", &v28);
  self->faceExpDifThreshold = v13;
  self->relightOnlyPersonMask = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"RelightOnlyPersonMask", 0, 0);
  self->matchPreview = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"MatchPreview", 0, 0);
  getFloatParameter(v4, @"TargetMedian_I", &v28);
  self->targetMedian_I = v14;
  getFloatParameter(v4, @"TargetMedian_II", &v28);
  self->targetMedian_II = v15;
  getFloatParameter(v4, @"TargetMedian_III", &v28);
  self->targetMedian_III = v16;
  getFloatParameter(v4, @"TargetMedian_IV", &v28);
  self->targetMedian_IV = v17;
  getFloatParameter(v4, @"TargetMedian_V", &v28);
  self->targetMedian_V = v18;
  getFloatParameter(v4, @"TargetMedian_VI", &v28);
  self->targetMedian_VI = v19;
  getFloatParameter(v4, @"MaxBoost_I", &v28);
  self->maxBoost_I = v20;
  getFloatParameter(v4, @"MaxBoost_II", &v28);
  self->maxBoost_II = v21;
  getFloatParameter(v4, @"MaxBoost_III", &v28);
  self->maxBoost_III = v22;
  getFloatParameter(v4, @"MaxBoost_IV", &v28);
  self->maxBoost_IV = v23;
  getFloatParameter(v4, @"MaxBoost_V", &v28);
  self->maxBoost_V = v24;
  getFloatParameter(v4, @"MaxBoost_VI", &v28);
  float v26 = v25;

  self->maxBoost_VI = v26;
  return v28;
}

@end