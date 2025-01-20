@interface CRNeuralRecognizerConfiguration
- (BOOL)decodeWithLM;
- (BOOL)filterWithLM;
- (BOOL)usesAppleNeuralEngine;
- (CRConfidenceThresholds)confidenceThresholds;
- (CRNeuralRecognizerConfiguration)initWithLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5;
- (CRTitleParameters)titleParameters;
- (NSArray)customWords;
- (NSArray)inputWidths;
- (NSString)locale;
- (NSURL)customModelURL;
- (double)inputHeight;
- (float)highConfidenceThreshold;
- (float)mediumConfidenceThreshold;
- (float)precisionThreshold;
- (id)initV2DefaultConfigWithOptions:(id)a3;
- (id)initV3DefaultConfigWithOptions:(id)a3;
- (id)textFeatureFilter;
- (int64_t)batchSize;
- (int64_t)bestFitWidthIndexForAspectRatio:(double)a3;
- (int64_t)maxConcurrentBatches;
- (unint64_t)paddingMode;
- (void)setDefaultConfidenceThresholdsForRevision:(unint64_t)a3;
- (void)setHighConfidenceThreshold:(float)a3;
- (void)setMediumConfidenceThreshold:(float)a3;
@end

@implementation CRNeuralRecognizerConfiguration

- (CRNeuralRecognizerConfiguration)initWithLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CRNeuralRecognizerConfiguration;
  v11 = [(CRRecognizerConfiguration *)&v36 initWithImageReaderOptions:v10 error:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locale, a3);
    v13 = [v10 objectForKeyedSubscript:@"CRImageReaderDisableLanguageCorrection"];
    int v14 = [v13 BOOLValue];

    if (v14) {
      v12->_decodeWithLM = 0;
    }
    uint64_t v15 = [v10 objectForKeyedSubscript:@"CRImageReaderDynamicLexicon"];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [v10 objectForKeyedSubscript:@"CRImageReaderDynamicLexicon"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v19 = [v10 objectForKeyedSubscript:@"CRImageReaderDynamicLexicon"];
        customWords = v12->_customWords;
        v12->_customWords = (NSArray *)v19;
      }
    }
    v21 = [v10 objectForKeyedSubscript:@"CRImageReaderPrecisionThresholdKey"];

    if (v21)
    {
      v22 = [v10 objectForKeyedSubscript:@"CRImageReaderPrecisionThresholdKey"];
      [v22 floatValue];
      v12->_precisionThreshold = v23;
    }
    v24 = [v10 objectForKeyedSubscript:@"CRImageReaderRecognizerModelPath"];
    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
      customModelURL = v12->_customModelURL;
      v12->_customModelURL = (NSURL *)v25;
    }
    v27 = [CRTitleParameters alloc];
    LODWORD(v28) = 1064514355;
    uint64_t v29 = [(CRTitleParameters *)v27 initWithMinTitleProbability:7 minTitleLength:v28];
    titleParameters = v12->_titleParameters;
    v12->_titleParameters = (CRTitleParameters *)v29;

    if (+[CRImageReader languageIsChinese:v12->_locale])
    {
      v31 = [CRTitleParameters alloc];
      LODWORD(v32) = 1060320051;
      uint64_t v33 = [(CRTitleParameters *)v31 initWithMinTitleProbability:2 minTitleLength:v32];
      v34 = v12->_titleParameters;
      v12->_titleParameters = (CRTitleParameters *)v33;
    }
    [(CRNeuralRecognizerConfiguration *)v12 setDefaultConfidenceThresholdsForRevision:[(CRRecognizerConfiguration *)v12 revision]];
  }
  return v12;
}

- (BOOL)usesAppleNeuralEngine
{
  if ([(CRRecognizerConfiguration *)self computeDeviceType] == 1
    || [(CRRecognizerConfiguration *)self computeDeviceType] == 2)
  {
    return 0;
  }
  return deviceHasAppleNeuralEngine();
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRNeuralRecognizerConfiguration;
  v3 = [(CRRecognizerConfiguration *)&v9 initV2DefaultConfigWithOptions:a3];
  v4 = v3;
  if (v3)
  {
    v3[13] = 4;
    v3[14] = 16;
    v5 = (void *)v3[15];
    v3[15] = &unk_1F3935BC0;

    v4[16] = 0x4040000000000000;
    v4[17] = 0;
    *((unsigned char *)v4 + 80) = 1;
    v6 = (void *)v4[18];
    v4[18] = 0;

    *((_DWORD *)v4 + 21) = 0;
    v7 = (void *)v4[12];
    v4[12] = 0;
  }
  return v4;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRNeuralRecognizerConfiguration;
  v3 = [(CRRecognizerConfiguration *)&v9 initV3DefaultConfigWithOptions:a3];
  v4 = v3;
  if (v3)
  {
    v3[13] = 4;
    v3[14] = 16;
    v5 = (void *)v3[15];
    v3[15] = &unk_1F3935BD8;

    v4[16] = 0x4040000000000000;
    v4[17] = 2;
    *((unsigned char *)v4 + 80) = 1;
    v6 = (void *)v4[18];
    v4[18] = 0;

    *((_DWORD *)v4 + 21) = 0;
    v7 = (void *)v4[12];
    v4[12] = 0;
  }
  return v4;
}

- (BOOL)filterWithLM
{
  BOOL v3 = [(CRNeuralRecognizerConfiguration *)self decodeWithLM];
  if (v3) {
    LOBYTE(v3) = ![(CRRecognizerConfiguration *)self falsePositiveFilteringDisabled];
  }
  return v3;
}

- (CRConfidenceThresholds)confidenceThresholds
{
  BOOL v3 = [CRConfidenceThresholds alloc];
  [(CRNeuralRecognizerConfiguration *)self mediumConfidenceThreshold];
  int v5 = v4;
  [(CRNeuralRecognizerConfiguration *)self highConfidenceThreshold];
  LODWORD(v7) = v6;
  LODWORD(v8) = v5;
  objc_super v9 = [(CRConfidenceThresholds *)v3 initWithMediumThreshold:v8 highThreshold:v7];
  return v9;
}

- (int64_t)bestFitWidthIndexForAspectRatio:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(CRNeuralRecognizerConfiguration *)self inputWidths];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      [(CRNeuralRecognizerConfiguration *)self inputHeight];
      double v12 = v11;
      [v10 floatValue];
      float v14 = v12 / v13;
      if (v14 * 1.1 < a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int64_t v15 = [v5 indexOfObject:v10];

    if (v15 != -1) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  v16 = CROSLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v23 = a3;
    _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEBUG, "Could not determine an appropriate width index for aspect ratio %.4f", buf, 0xCu);
  }

  int64_t v15 = [v5 count] - 1;
LABEL_14:

  return v15;
}

- (id)textFeatureFilter
{
  BOOL v3 = [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];

  if (!v3)
  {
    if ([(CRRecognizerConfiguration *)self revision] > 2)
    {
      id v5 = [CRTextFeaturesFilterV2 alloc];
      int v4 = [(CRNeuralRecognizerConfiguration *)self locale];
      uint64_t v6 = [(CRTextFeaturesFilterV2 *)v5 initWithLocale:v4];
      [(CRRecognizerConfiguration *)self setCachedTextFeatureFilter:v6];
    }
    else
    {
      int v4 = objc_opt_new();
      [(CRRecognizerConfiguration *)self setCachedTextFeatureFilter:v4];
    }
  }
  return [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];
}

- (void)setDefaultConfidenceThresholdsForRevision:(unint64_t)a3
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a3 - 1 <= 2)
  {
    float v3 = flt_1DD8CE6E0[!self->_decodeWithLM];
    float v4 = flt_1DD8CE6E8[!self->_decodeWithLM];
  }
  self->_mediumConfidenceThreshold = v3;
  self->_highConfidenceThreshold = v4;
}

- (NSURL)customModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (int64_t)maxConcurrentBatches
{
  return self->_maxConcurrentBatches;
}

- (NSArray)inputWidths
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (double)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)paddingMode
{
  return self->_paddingMode;
}

- (BOOL)decodeWithLM
{
  return self->_decodeWithLM;
}

- (NSArray)customWords
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (float)precisionThreshold
{
  return self->_precisionThreshold;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (CRTitleParameters)titleParameters
{
  return (CRTitleParameters *)objc_getProperty(self, a2, 160, 1);
}

- (float)mediumConfidenceThreshold
{
  return self->_mediumConfidenceThreshold;
}

- (void)setMediumConfidenceThreshold:(float)a3
{
  self->_mediumConfidenceThreshold = a3;
}

- (float)highConfidenceThreshold
{
  return self->_highConfidenceThreshold;
}

- (void)setHighConfidenceThreshold:(float)a3
{
  self->_highConfidenceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleParameters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_customWords, 0);
  objc_storeStrong((id *)&self->_inputWidths, 0);
  objc_storeStrong((id *)&self->_customModelURL, 0);
}

@end