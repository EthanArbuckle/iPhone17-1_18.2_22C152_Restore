@interface BlinkDetectionPlist
+ (void)initialize;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation BlinkDetectionPlist

+ (void)initialize
{
  blinkDetectionModeOverride = -1;
  blinkDetectionStrengthOverride = -1082130432;
  blinkDetectionConfidenceThresholdOverride = -1;
  blinkDetectionLEyePortionWeightOverride = -1082130432;
  blinkDetectionREyePortionWeightOverride = -1082130432;
  blinkDetectionMouthPortionWeigthOverride = -1082130432;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"BlinkDetectionMode"];
  v6 = v5;
  if (v5) {
    self->mode = [v5 intValue];
  }

  v7 = [v4 objectForKeyedSubscript:@"ConfidenceThreshold"];
  v8 = v7;
  if (v7) {
    self->confidenceThreshold = [v7 intValue];
  }

  v9 = [v4 objectForKeyedSubscript:@"LEyePortionLeft"];
  v10 = v9;
  if (v9)
  {
    [v9 floatValue];
    self->lEyePortionLeft = v11;
  }

  v12 = [v4 objectForKeyedSubscript:@"LEyePortionTop"];
  v13 = v12;
  if (v12)
  {
    [v12 floatValue];
    self->lEyePortionTop = v14;
  }

  v15 = [v4 objectForKeyedSubscript:@"LEyePortionWidth"];
  v16 = v15;
  if (v15)
  {
    [v15 floatValue];
    self->lEyePortionWidth = v17;
  }

  v18 = [v4 objectForKeyedSubscript:@"LEyePortionHeight"];
  v19 = v18;
  if (v18)
  {
    [v18 floatValue];
    self->lEyePortionHeight = v20;
  }

  v21 = [v4 objectForKeyedSubscript:@"LEyePortionWeight"];
  v22 = v21;
  if (v21)
  {
    [v21 floatValue];
    self->lEyePortionWeight = v23;
  }

  v24 = [v4 objectForKeyedSubscript:@"REyePortionLeft"];
  v25 = v24;
  if (v24)
  {
    [v24 floatValue];
    self->rEyePortionLeft = v26;
  }

  v27 = [v4 objectForKeyedSubscript:@"REyePortionTop"];
  v28 = v27;
  if (v27)
  {
    [v27 floatValue];
    self->rEyePortionTop = v29;
  }

  v30 = [v4 objectForKeyedSubscript:@"REyePortionWidth"];
  v31 = v30;
  if (v30)
  {
    [v30 floatValue];
    self->rEyePortionWidth = v32;
  }

  v33 = [v4 objectForKeyedSubscript:@"REyePortionHeight"];
  v34 = v33;
  if (v33)
  {
    [v33 floatValue];
    self->rEyePortionHeight = v35;
  }

  v36 = [v4 objectForKeyedSubscript:@"REyePortionWeight"];
  v37 = v36;
  if (v36)
  {
    [v36 floatValue];
    self->rEyePortionWeight = v38;
  }

  v39 = [v4 objectForKeyedSubscript:@"MouthPortionLeft"];
  v40 = v39;
  if (v39)
  {
    [v39 floatValue];
    self->mouthPortionLeft = v41;
  }

  v42 = [v4 objectForKeyedSubscript:@"MouthPortionTop"];
  v43 = v42;
  if (v42)
  {
    [v42 floatValue];
    self->mouthPortionTop = v44;
  }

  v45 = [v4 objectForKeyedSubscript:@"MouthPortionWidth"];
  v46 = v45;
  if (v45)
  {
    [v45 floatValue];
    self->mouthPortionWidth = v47;
  }

  v48 = [v4 objectForKeyedSubscript:@"MouthPortionHeight"];
  v49 = v48;
  if (v48)
  {
    [v48 floatValue];
    self->mouthHeight = v50;
  }

  v51 = [v4 objectForKeyedSubscript:@"MouthPortionWeight"];
  v52 = v51;
  if (v51)
  {
    [v51 floatValue];
    self->mouthPortionWeigth = v53;
  }

  v54 = [v4 objectForKeyedSubscript:@"BlinkScoreStrength"];
  v55 = v54;
  if (v54)
  {
    [v54 floatValue];
    self->strength = v56;
  }

  return 0;
}

- (void)applyOverrides
{
  if ((blinkDetectionModeOverride & 0x80000000) == 0) {
    self->mode = blinkDetectionModeOverride;
  }
  if (*(float *)&blinkDetectionStrengthOverride >= 0.0) {
    LODWORD(self->strength) = blinkDetectionStrengthOverride;
  }
  if ((blinkDetectionConfidenceThresholdOverride & 0x80000000) == 0) {
    self->confidenceThreshold = blinkDetectionConfidenceThresholdOverride;
  }
  if (*(float *)&blinkDetectionLEyePortionWeightOverride >= 0.0) {
    LODWORD(self->lEyePortionWeight) = blinkDetectionLEyePortionWeightOverride;
  }
  if (*(float *)&blinkDetectionREyePortionWeightOverride >= 0.0) {
    LODWORD(self->rEyePortionWeight) = blinkDetectionREyePortionWeightOverride;
  }
  if (*(float *)&blinkDetectionMouthPortionWeigthOverride >= 0.0) {
    LODWORD(self->mouthPortionWeigth) = blinkDetectionMouthPortionWeigthOverride;
  }
}

@end