@interface PFStoryRecipeDisplayAssetNormalization
- (BOOL)isEqual:(id)a3;
- (NSData)analysisData;
- (NSDictionary)highKeyProperties;
- (NSDictionary)smartColorProperties;
- (NSDictionary)smartToneProperties;
- (NSDictionary)tempTintProperties;
- (NSString)detailedDescription;
- (PFStoryRecipeDisplayAssetNormalization)init;
- (PFStoryRecipeDisplayAssetNormalization)initWithAnalysisData:(id)a3;
- (double)score;
- (int64_t)version;
- (unint64_t)hash;
@end

@implementation PFStoryRecipeDisplayAssetNormalization

- (void).cxx_destruct
{
}

- (NSString)detailedDescription
{
  v3 = [(PFStoryRecipeDisplayAssetNormalization *)self tempTintProperties];
  v4 = [(PFStoryRecipeDisplayAssetNormalization *)self smartToneProperties];
  v33 = [(PFStoryRecipeDisplayAssetNormalization *)self highKeyProperties];
  v5 = [(PFStoryRecipeDisplayAssetNormalization *)self smartColorProperties];
  v6 = NSString;
  int64_t v34 = [(PFStoryRecipeDisplayAssetNormalization *)self version];
  v37 = v3;
  v36 = [v3 objectForKeyedSubscript:@"inputTemperature"];
  [v36 floatValue];
  double v8 = v7;
  v35 = [v3 objectForKeyedSubscript:@"inputTint"];
  [v35 floatValue];
  double v10 = v9;
  v11 = [v4 objectForKeyedSubscript:@"inputExposure"];
  [v11 floatValue];
  double v13 = v12;
  v14 = [v4 objectForKeyedSubscript:@"inputBlack"];
  [v14 floatValue];
  double v16 = v15;
  v17 = [v4 objectForKeyedSubscript:@"inputHighlights"];
  [v17 floatValue];
  double v19 = v18;
  v20 = [v4 objectForKeyedSubscript:@"inputContrast"];
  [v20 floatValue];
  double v22 = v21;
  v23 = [v33 objectForKeyedSubscript:@"inputStrength"];
  [v23 floatValue];
  double v25 = v24;
  v26 = [v5 objectForKeyedSubscript:@"inputVibrancy"];
  [v26 floatValue];
  double v28 = v27;
  v29 = [v5 objectForKeyedSubscript:@"inputCast"];
  [v29 floatValue];
  v31 = objc_msgSend(v6, "stringWithFormat:", @"V%d WB{%0.0fT %0.1ft} ST{%0.2fx %0.2fb %0.2fh %0.2fc} HK{%0.2f} SC{%0.2fvi %0.2fca}", v34, *(void *)&v8, *(void *)&v10, *(void *)&v13, *(void *)&v16, *(void *)&v19, *(void *)&v22, *(void *)&v25, *(void *)&v28, v30);

  return (NSString *)v31;
}

- (NSDictionary)smartColorProperties
{
  return (NSDictionary *)[(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData smartColorProperties];
}

- (NSDictionary)highKeyProperties
{
  return (NSDictionary *)[(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData highKeyProperties];
}

- (NSDictionary)smartToneProperties
{
  return (NSDictionary *)[(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData smartToneProperties];
}

- (NSDictionary)tempTintProperties
{
  return (NSDictionary *)[(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData tempTintProperties];
}

- (double)score
{
  [(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData score];
  return result;
}

- (int64_t)version
{
  return [(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData version];
}

- (NSData)analysisData
{
  uint64_t v2 = [(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData sliderNetPackedData];
  v3 = (void *)MEMORY[0x1E4F1C9B8];

  return (NSData *)[v3 dataWithBytes:v2 length:12];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PFStoryRecipeDisplayAssetNormalization *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  normalizationData = self->_normalizationData;
  if (normalizationData == v4->_normalizationData) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[_PFStoryRecipeDisplayAssetNormalizationData isEqual:](normalizationData, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return [(_PFStoryRecipeDisplayAssetNormalizationData *)self->_normalizationData hash];
}

- (PFStoryRecipeDisplayAssetNormalization)initWithAnalysisData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _PFAssertFailHandler();
LABEL_19:
    _PFAssertFailHandler();
    goto LABEL_20;
  }
  v5 = v4;
  if (![v4 length])
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFStoryRecipeDisplayAssetNormalization: Empty analysis data.", buf, 2u);
    }
    double v8 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)[v5 length] <= 2) {
    goto LABEL_19;
  }
  v14.receiver = self;
  v14.super_class = (Class)PFStoryRecipeDisplayAssetNormalization;
  self = [(PFStoryRecipeDisplayAssetNormalization *)&v14 init];
  if (!self)
  {
LABEL_16:
    self = self;
    double v8 = self;
LABEL_17:

    return v8;
  }
  char v6 = (unsigned char *)[v5 bytes];
  int v7 = *v6;
  if (v7 == 2)
  {
    float v9 = [[_PFStoryRecipeDisplayAssetNormalizationDataV2 alloc] initWithSliderNetPackedDataV2:v6];
LABEL_14:
    normalizationData = self->_normalizationData;
    self->_normalizationData = (_PFStoryRecipeDisplayAssetNormalizationData *)v9;

    goto LABEL_15;
  }
  if (v7 == 1)
  {
    float v9 = [[_PFStoryRecipeDisplayAssetNormalizationDataV1 alloc] initWithSliderNetPackedDataV1:v6];
    goto LABEL_14;
  }
  if (!*v6)
  {
    _PFAssertFailHandler();
    goto LABEL_9;
  }
LABEL_15:
  if (self->_normalizationData) {
    goto LABEL_16;
  }
LABEL_20:
  float v12 = (PFStoryRecipeDisplayAssetNormalization *)_PFAssertFailHandler();
  return [(PFStoryRecipeDisplayAssetNormalization *)v12 init];
}

- (PFStoryRecipeDisplayAssetNormalization)init
{
  uint64_t v2 = _PFAssertFailHandler();
  return (PFStoryRecipeDisplayAssetNormalization *)_PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryRev0(v2);
}

@end