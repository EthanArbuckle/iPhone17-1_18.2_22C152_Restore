@interface DeepFusionHighlightTuning
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionHighlightTuning

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"RedBoost"];
  [v5 floatValue];
  self->redBoost = v6;

  v7 = [v4 objectForKeyedSubscript:@"BlueBoost"];
  [v7 floatValue];
  self->blueBoost = v8;

  v9 = [v4 objectForKeyedSubscript:@"GreenBoost"];
  [v9 floatValue];
  self->greenBoost = v10;

  v11 = [v4 objectForKeyedSubscript:@"SaturationSlope"];
  [v11 floatValue];
  self->saturationSlope = v12;

  v13 = [v4 objectForKeyedSubscript:@"SaturationMid"];
  [v13 floatValue];
  self->saturationMid = v14;

  v15 = [v4 objectForKeyedSubscript:@"PixelRecalculationLimit"];
  [v15 floatValue];
  self->pixelRecalculationLimit = v16;

  v17 = [v4 objectForKeyedSubscript:@"RecalcAlphaSlope"];
  [v17 floatValue];
  self->recalcAlphaSlope = v18;

  v19 = [v4 objectForKeyedSubscript:@"RecalcAlphaMid"];

  [v19 floatValue];
  self->recalcAlphaMid = v20;

  return 0;
}

@end