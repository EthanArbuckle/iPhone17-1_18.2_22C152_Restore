@interface _PFStoryRecipeDisplayAssetNormalizationDataV1
+ (NSDictionary)limits;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)highKeyProperties;
- (NSDictionary)smartColorProperties;
- (NSDictionary)smartToneProperties;
- (NSDictionary)tempTintProperties;
- (_PFStoryRecipeDisplayAssetNormalizationDataV1)initWithSliderNetPackedDataV1:(id *)a3;
- (const)sliderNetPackedData;
- (double)score;
- (int64_t)version;
- (unint64_t)hash;
@end

@implementation _PFStoryRecipeDisplayAssetNormalizationDataV1

- (NSDictionary)smartColorProperties
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() limits];
  unsigned int smartColorInputVibrancy = self->_data.smartColorInputVibrancy;
  v5 = [v3 objectForKeyedSubscript:@"VIBRANCY_MIN"];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v3 objectForKeyedSubscript:@"VIBRANCY_MAX"];
  [v8 doubleValue];
  if (v9 <= v7) {
    goto LABEL_6;
  }
  double v10 = v9;

  unsigned int smartColorInputCast = self->_data.smartColorInputCast;
  v12 = [v3 objectForKeyedSubscript:@"CAST_MIN"];
  [v12 doubleValue];
  double v14 = v13;
  v15 = [v3 objectForKeyedSubscript:@"CAST_MAX"];
  [v15 doubleValue];
  if (v16 <= v14) {
LABEL_6:
  }
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  double v17 = v7 + (double)smartColorInputVibrancy / 255.0 * (v10 - v7);
  double v18 = v14 + (double)smartColorInputCast / 255.0 * (v16 - v14);

  v23[0] = @"inputVibrancy";
  v19 = [NSNumber numberWithDouble:v17];
  v23[1] = @"inputCast";
  v24[0] = v19;
  v20 = [NSNumber numberWithDouble:v18];
  v24[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return (NSDictionary *)v21;
}

- (NSDictionary)highKeyProperties
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() limits];
  unsigned int highKeyInputStrength = self->_data.highKeyInputStrength;
  v5 = [v3 objectForKeyedSubscript:@"HIGHKEY_MIN"];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v3 objectForKeyedSubscript:@"HIGHKEY_MAX"];
  [v8 doubleValue];
  if (v9 <= v7) {
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  }
  double v10 = v7 + (double)highKeyInputStrength / 255.0 * (v9 - v7);

  double v14 = @"inputStrength";
  v11 = [NSNumber numberWithDouble:v10];
  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  return (NSDictionary *)v12;
}

- (NSDictionary)smartToneProperties
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() limits];
  unsigned int smartToneInputContrast = self->_data.smartToneInputContrast;
  v5 = [v3 objectForKeyedSubscript:@"CONTRAST_MIN"];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v3 objectForKeyedSubscript:@"CONTRAST_MAX"];
  [v8 doubleValue];
  if (v9 <= v7) {
    goto LABEL_8;
  }
  double v10 = v9;

  unsigned int smartToneInputBlack = self->_data.smartToneInputBlack;
  v12 = [v3 objectForKeyedSubscript:@"BLACK_MIN"];
  [v12 doubleValue];
  double v14 = v13;
  v15 = [v3 objectForKeyedSubscript:@"BLACK_MAX"];
  [v15 doubleValue];
  if (v16 <= v14) {
    goto LABEL_8;
  }
  double v17 = v16;

  unsigned int smartToneInputExposure = self->_data.smartToneInputExposure;
  v19 = [v3 objectForKeyedSubscript:@"EXPOSURE_MIN"];
  [v19 doubleValue];
  double v21 = v20;
  v22 = [v3 objectForKeyedSubscript:@"EXPOSURE_MAX"];
  [v22 doubleValue];
  if (v23 <= v21) {
    goto LABEL_8;
  }
  double v24 = v23;

  unsigned int smartToneInputHighlights = self->_data.smartToneInputHighlights;
  v26 = [v3 objectForKeyedSubscript:@"HIGHLIGHTS_MIN"];
  [v26 doubleValue];
  double v28 = v27;
  v29 = [v3 objectForKeyedSubscript:@"HIGHLIGHTS_MAX"];
  [v29 doubleValue];
  if (v30 <= v28) {
LABEL_8:
  }
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  double v31 = v7 + (double)smartToneInputContrast / 255.0 * (v10 - v7);
  double v32 = v28 + (double)smartToneInputHighlights / 255.0 * (v30 - v28);

  v39[0] = @"inputContrast";
  v33 = [NSNumber numberWithDouble:v31];
  v40[0] = v33;
  v39[1] = @"inputBlack";
  v34 = [NSNumber numberWithDouble:v14 + (double)smartToneInputBlack / 255.0 * (v17 - v14)];
  v40[1] = v34;
  v39[2] = @"inputExposure";
  v35 = [NSNumber numberWithDouble:v21 + (double)smartToneInputExposure / 255.0 * (v24 - v21)];
  v40[2] = v35;
  v39[3] = @"inputHighlights";
  v36 = [NSNumber numberWithDouble:v32];
  v40[3] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];

  return (NSDictionary *)v37;
}

- (NSDictionary)tempTintProperties
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() limits];
  unsigned int tempTintInputTemperature = self->_data.tempTintInputTemperature;
  v5 = [v3 objectForKeyedSubscript:@"TEMPERATURE_MIN"];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v3 objectForKeyedSubscript:@"TEMPERATURE_MAX"];
  [v8 doubleValue];
  if (v9 <= v7) {
    goto LABEL_6;
  }
  double v10 = v9;

  unsigned int tempTintInputTint = self->_data.tempTintInputTint;
  v12 = [v3 objectForKeyedSubscript:@"TINT_MIN"];
  [v12 doubleValue];
  double v14 = v13;
  v15 = [v3 objectForKeyedSubscript:@"TINT_MAX"];
  [v15 doubleValue];
  if (v16 <= v14) {
LABEL_6:
  }
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  double v17 = v7 + (double)tempTintInputTemperature / 255.0 * (v10 - v7);
  double v18 = v14 + (double)tempTintInputTint / 255.0 * (v16 - v14);

  v23[0] = @"inputTemperature";
  v19 = [NSNumber numberWithDouble:v17];
  v23[1] = @"inputTint";
  v24[0] = v19;
  double v20 = [NSNumber numberWithDouble:v18];
  v24[1] = v20;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return (NSDictionary *)v21;
}

- (double)score
{
  LOBYTE(v2) = self->_data.score;
  return (double)v2 / 255.0;
}

- (int64_t)version
{
  return self->_data.version;
}

- (const)sliderNetPackedData
{
  return (const $3C3B3F5936EA3FC38689B584FA72ECEA *)&self->_data;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && *(void *)&self->_data.version == v4[1]
    && *(_DWORD *)&self->_data.highKeyInputStrength == (unint64_t)*((unsigned int *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  p_data = &self->_data;
  unint64_t result = 1;
  do
    unint64_t result = *(&p_data->version + v2++) - result + 32 * result;
  while (v2 != 12);
  return result;
}

- (_PFStoryRecipeDisplayAssetNormalizationDataV1)initWithSliderNetPackedDataV1:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PFStoryRecipeDisplayAssetNormalizationDataV1;
  unint64_t result = [(_PFStoryRecipeDisplayAssetNormalizationDataV1 *)&v6 init];
  if (result)
  {
    uint64_t v5 = *(void *)&a3->var0;
    *(_DWORD *)&result->_data.unsigned int highKeyInputStrength = *(_DWORD *)&a3->var8;
    *(void *)&result->_data.version = v5;
  }
  return result;
}

+ (NSDictionary)limits
{
  if (limits_onceToken != -1) {
    dispatch_once(&limits_onceToken, &__block_literal_global_1839);
  }
  uint64_t v2 = (void *)limits_limitsV1;

  return (NSDictionary *)v2;
}

@end