@interface SRLv2Plist
- (int)readPlist:(id)a3;
@end

@implementation SRLv2Plist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"MaskThreshold"];
  [v5 floatValue];
  float v7 = v6;

  self->maskThreshold = v7;
  v8 = [v4 valueForKey:@"MinFaceSize"];
  [v8 floatValue];
  float v10 = v9;

  self->minFaceSize = v10;
  v11 = [v4 valueForKey:@"MaxCurveBoost"];
  [v11 floatValue];
  float v13 = v12;

  self->maxCurveBoost = v13;
  v14 = [v4 valueForKey:@"MinCurveBoost"];
  [v14 floatValue];
  float v16 = v15;

  self->minCurveBoost = v16;
  v17 = [v4 valueForKey:@"MaxTargetRatioDarkening"];
  [v17 floatValue];
  float v19 = v18;

  self->maxTargetRatioDarkening = v19;
  v20 = [v4 valueForKey:@"MaxTargetRatioLimit"];
  [v20 floatValue];
  float v22 = v21;

  self->maxTargetRatioLimit = v22;
  v23 = [v4 valueForKey:@"BiasFactorSRLv2"];
  [v23 floatValue];
  float v25 = v24;

  self->biasFactorSRLv2 = v25;
  v26 = [v4 valueForKey:@"ToneSimilaritySigma"];
  [v26 floatValue];
  float v28 = v27;

  self->toneSimilaritySigma = v28;
  v29 = [v4 valueForKey:@"FaceExpDifThreshold"];
  [v29 floatValue];
  float v31 = v30;

  self->faceExpDifThreshold = v31;
  v32 = [v4 valueForKey:@"FaceExpDifThreshold"];
  LOBYTE(v29) = [v32 intValue] != 0;

  self->relightOnlyPersonMask = (char)v29;
  v33 = [v4 valueForKey:@"TargetMedian_I"];
  [v33 floatValue];
  float v35 = v34;

  self->targetMedian_I = v35;
  v36 = [v4 valueForKey:@"TargetMedian_II"];
  [v36 floatValue];
  float v38 = v37;

  self->targetMedian_II = v38;
  v39 = [v4 valueForKey:@"TargetMedian_III"];
  [v39 floatValue];
  float v41 = v40;

  self->targetMedian_III = v41;
  v42 = [v4 valueForKey:@"TargetMedian_IV"];
  [v42 floatValue];
  float v44 = v43;

  self->targetMedian_IV = v44;
  v45 = [v4 valueForKey:@"TargetMedian_V"];
  [v45 floatValue];
  float v47 = v46;

  self->targetMedian_V = v47;
  v48 = [v4 valueForKey:@"TargetMedian_VI"];
  [v48 floatValue];
  float v50 = v49;

  self->targetMedian_VI = v50;
  v51 = [v4 valueForKey:@"MaxBoost_I"];
  [v51 floatValue];
  float v53 = v52;

  self->maxBoost_I = v53;
  v54 = [v4 valueForKey:@"MaxBoost_II"];
  [v54 floatValue];
  float v56 = v55;

  self->maxBoost_II = v56;
  v57 = [v4 valueForKey:@"MaxBoost_III"];
  [v57 floatValue];
  float v59 = v58;

  self->maxBoost_III = v59;
  v60 = [v4 valueForKey:@"MaxBoost_IV"];
  [v60 floatValue];
  float v62 = v61;

  self->maxBoost_IV = v62;
  v63 = [v4 valueForKey:@"MaxBoost_V"];
  [v63 floatValue];
  float v65 = v64;

  self->maxBoost_V = v65;
  v66 = [v4 valueForKey:@"MaxBoost_VI"];

  [v66 floatValue];
  float v68 = v67;

  self->maxBoost_VI = v68;
  return 0;
}

@end