@interface CRLineWrappingParameters
+ (int64_t)_correctionModeFromString:(id)a3;
- (CRLineWrappingParameters)initWithLocale:(id)a3;
- (CRLineWrappingParameters)initWithLocale:(id)a3 useStrictConfig:(BOOL)a4;
- (CRLineWrappingParameters)initWithLocale:(id)a3 useStrictConfig:(BOOL)a4 useHandwritingConfig:(BOOL)a5;
- (double)lmScoreEOSMinRatio;
- (double)lmScoreThreshold;
- (float)angleSimilarityThreshold;
- (float)confidenceThreshold;
- (float)contextConfidenceThreshold;
- (float)heightSimilarityRatio;
- (float)leadingDistanceRatioTolerance;
- (float)maximumVerticalDistanceGrowthRatio;
- (float)newParagraphIndentDistanceRatioTolerance;
- (float)oversegmentedDistanceHeightRatioListItemTolerance;
- (float)oversegmentedDistanceHeightRatioTolerance;
- (float)probabilityThreshold;
- (float)smallestVerticalDistanceHeightRatio;
- (float)verticalSpacingRatioTolerance;
- (float)widthGrowthLimit;
- (id)description;
- (int)lmContextSize;
- (int64_t)caseWrappingScoreWithNoCapitalization;
- (int64_t)correctionMode;
- (int64_t)noWrappingEvaluationThreshold;
- (int64_t)punctuationWrappingScoreWithEndingMOS;
- (int64_t)punctuationWrappingScoreWithNoClosingPunctuation;
- (int64_t)wrappingEvaluationThreshold;
- (unint64_t)tokenCountIncreaseLimit;
- (void)setAngleSimilarityThreshold:(float)a3;
- (void)setCaseWrappingScoreWithNoCapitalization:(int64_t)a3;
- (void)setConfidenceThreshold:(float)a3;
- (void)setContextConfidenceThreshold:(float)a3;
- (void)setCorrectionMode:(int64_t)a3;
- (void)setHeightSimilarityRatio:(float)a3;
- (void)setLeadingDistanceRatioTolerance:(float)a3;
- (void)setLmContextSize:(int)a3;
- (void)setLmScoreEOSMinRatio:(double)a3;
- (void)setLmScoreThreshold:(double)a3;
- (void)setMaximumVerticalDistanceGrowthRatio:(float)a3;
- (void)setNewParagraphIndentDistanceRatioTolerance:(float)a3;
- (void)setNoWrappingEvaluationThreshold:(int64_t)a3;
- (void)setOversegmentedDistanceHeightRatioListItemTolerance:(float)a3;
- (void)setOversegmentedDistanceHeightRatioTolerance:(float)a3;
- (void)setPunctuationWrappingScoreWithEndingMOS:(int64_t)a3;
- (void)setPunctuationWrappingScoreWithNoClosingPunctuation:(int64_t)a3;
- (void)setSmallestVerticalDistanceHeightRatio:(float)a3;
- (void)setTokenCountIncreaseLimit:(unint64_t)a3;
- (void)setVerticalSpacingRatioTolerance:(float)a3;
- (void)setWidthGrowthLimit:(float)a3;
- (void)setWrappingEvaluationThreshold:(int64_t)a3;
@end

@implementation CRLineWrappingParameters

+ (int64_t)_correctionModeFromString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = CROSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      v8 = v6;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v11, v9);
    }
LABEL_7:

LABEL_8:
    int64_t v5 = 0;
    goto LABEL_11;
  }
  if (([v3 isEqualToString:@"always"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"unless-strong-wrap"])
    {
      int64_t v5 = 1;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"disabled"]) {
      goto LABEL_8;
    }
    v6 = CROSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v11 = 138412290;
      v12 = v4;
      v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  int64_t v5 = 2;
LABEL_11:

  return v5;
}

- (id)description
{
  id v3 = objc_opt_new();
  [(CRLineWrappingParameters *)self heightSimilarityRatio];
  [v3 appendFormat:@"%@: %f\n", @"heightSimilarityRatio", v4];
  [(CRLineWrappingParameters *)self leadingDistanceRatioTolerance];
  [v3 appendFormat:@"%@: %f\n", @"leadingDistanceRatioTolerance", v5];
  [(CRLineWrappingParameters *)self verticalSpacingRatioTolerance];
  [v3 appendFormat:@"%@: %f\n", @"verticalSpacingRatioTolerance", v6];
  [(CRLineWrappingParameters *)self newParagraphIndentDistanceRatioTolerance];
  [v3 appendFormat:@"%@: %f\n", @"newParagraphIndentDistanceRatioTolerance", v7];
  [(CRLineWrappingParameters *)self oversegmentedDistanceHeightRatioTolerance];
  [v3 appendFormat:@"%@: %f\n", @"oversegmentedDistanceHeightRatioTolerance", v8];
  [(CRLineWrappingParameters *)self smallestVerticalDistanceHeightRatio];
  [v3 appendFormat:@"%@: %f\n", @"smallestVerticalDistanceHeightRatio", v9];
  [(CRLineWrappingParameters *)self maximumVerticalDistanceGrowthRatio];
  [v3 appendFormat:@"%@: %f\n", @"maximumVerticalDistanceGrowthRatio", v10];
  [(CRLineWrappingParameters *)self angleSimilarityThreshold];
  [v3 appendFormat:@"%@: %f\n", @"angleSimilarityThreshold", v11];
  [(CRLineWrappingParameters *)self widthGrowthLimit];
  [v3 appendFormat:@"%@: %f\n", @"widthGrowthLimit", v12];
  [v3 appendFormat:@"%@: %lu\n", @"tokenCountIncreaseLimit", -[CRLineWrappingParameters tokenCountIncreaseLimit](self, "tokenCountIncreaseLimit")];
  [(CRLineWrappingParameters *)self oversegmentedDistanceHeightRatioListItemTolerance];
  [v3 appendFormat:@"%@: %f\n", @"oversegmentedDistanceHeightRatioListItemTolerance", v13];
  [v3 appendFormat:@"%@: %lu\n", @"overWrappingCorrection", -[CRLineWrappingParameters correctionMode](self, "correctionMode")];
  [(CRLineWrappingParameters *)self confidenceThreshold];
  [v3 appendFormat:@"%@: %f\n", @"confidenceThreshold", v14];
  [(CRLineWrappingParameters *)self contextConfidenceThreshold];
  [v3 appendFormat:@"%@: %f\n", @"contextConfidenceThreshold", v15];
  [(CRLineWrappingParameters *)self lmScoreThreshold];
  [v3 appendFormat:@"%@: %f\n", @"lmScoreThreshold", v16];
  [(CRLineWrappingParameters *)self lmScoreEOSMinRatio];
  [v3 appendFormat:@"%@: %f\n", @"lmScoreEOSMinRatio", v17];
  [v3 appendFormat:@"%@: %d\n", @"lmContextSize", -[CRLineWrappingParameters lmContextSize](self, "lmContextSize")];
  [(CRLineWrappingParameters *)self probabilityThreshold];
  [v3 appendFormat:@"%@: %f\n", @"probabilityThreshold", v18];
  [v3 appendFormat:@"%@: %ld\n", @"wrappingEvaluationThreshold", -[CRLineWrappingParameters wrappingEvaluationThreshold](self, "wrappingEvaluationThreshold")];
  [v3 appendFormat:@"%@: %ld\n", @"noWrappingEvaluationThreshold", -[CRLineWrappingParameters noWrappingEvaluationThreshold](self, "noWrappingEvaluationThreshold")];
  [v3 appendFormat:@"%@: %ld\n", @"caseWrappingScoreWithNoCapitalization", -[CRLineWrappingParameters caseWrappingScoreWithNoCapitalization](self, "caseWrappingScoreWithNoCapitalization")];
  [v3 appendFormat:@"%@: %ld\n", @"punctuationWrappingScoreWithEndingMOS", -[CRLineWrappingParameters punctuationWrappingScoreWithEndingMOS](self, "punctuationWrappingScoreWithEndingMOS")];
  [v3 appendFormat:@"%@: %ld\n", @"punctuationWrappingScoreWithNoClosingPunctuation", -[CRLineWrappingParameters punctuationWrappingScoreWithNoClosingPunctuation](self, "punctuationWrappingScoreWithNoClosingPunctuation")];
  return v3;
}

- (CRLineWrappingParameters)initWithLocale:(id)a3
{
  return [(CRLineWrappingParameters *)self initWithLocale:a3 useStrictConfig:0 useHandwritingConfig:0];
}

- (CRLineWrappingParameters)initWithLocale:(id)a3 useStrictConfig:(BOOL)a4
{
  return [(CRLineWrappingParameters *)self initWithLocale:a3 useStrictConfig:a4 useHandwritingConfig:0];
}

- (CRLineWrappingParameters)initWithLocale:(id)a3 useStrictConfig:(BOOL)a4 useHandwritingConfig:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  float v8 = (__CFString *)a3;
  v61.receiver = self;
  v61.super_class = (Class)CRLineWrappingParameters;
  float v9 = [(CRLineWrappingParameters *)&v61 init];
  if (!v9)
  {
LABEL_29:
    v49 = v9;
    goto LABEL_30;
  }
  float v10 = +[CRLineWrappingClassifier modelLocaleForLocale:v8];
  if (!v10)
  {
    float v11 = CROSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v8;
      _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_FAULT, "Failed to get model locale for %@", buf, 0xCu);
    }

    float v10 = @"en-US";
  }
  float v12 = @"evaluation";
  if (v6) {
    float v12 = @"evaluation-strict";
  }
  float v13 = v12;
  float v14 = lineWrappingConfig();
  float v15 = [v14 objectForKeyedSubscript:v10];
  uint64_t v16 = [v15 objectForKeyedSubscript:v13];

  if (v5)
  {
    uint64_t v17 = lineWrappingConfig();
    float v18 = [v17 objectForKeyedSubscript:v10];
    v19 = [v18 objectForKeyedSubscript:@"evaluation-hw"];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      v21 = lineWrappingConfig();
      v22 = [v21 objectForKeyedSubscript:v10];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"evaluation-hw"];

      uint64_t v16 = (void *)v23;
    }
  }
  if (v16)
  {
    v24 = [v16 objectForKeyedSubscript:@"heightSimilarityRatio"];
    [v24 floatValue];
    -[CRLineWrappingParameters setHeightSimilarityRatio:](v9, "setHeightSimilarityRatio:");

    v25 = [v16 objectForKeyedSubscript:@"leadingDistanceRatioTolerance"];
    [v25 floatValue];
    -[CRLineWrappingParameters setLeadingDistanceRatioTolerance:](v9, "setLeadingDistanceRatioTolerance:");

    v26 = [v16 objectForKeyedSubscript:@"verticalSpacingRatioTolerance"];
    [v26 floatValue];
    -[CRLineWrappingParameters setVerticalSpacingRatioTolerance:](v9, "setVerticalSpacingRatioTolerance:");

    v27 = [v16 objectForKeyedSubscript:@"newParagraphIndentDistanceRatioTolerance"];
    [v27 floatValue];
    -[CRLineWrappingParameters setNewParagraphIndentDistanceRatioTolerance:](v9, "setNewParagraphIndentDistanceRatioTolerance:");

    v28 = [v16 objectForKeyedSubscript:@"oversegmentedDistanceHeightRatioTolerance"];
    [v28 floatValue];
    -[CRLineWrappingParameters setOversegmentedDistanceHeightRatioTolerance:](v9, "setOversegmentedDistanceHeightRatioTolerance:");

    v29 = [v16 objectForKeyedSubscript:@"smallestVerticalDistanceHeightRatio"];
    [v29 floatValue];
    -[CRLineWrappingParameters setSmallestVerticalDistanceHeightRatio:](v9, "setSmallestVerticalDistanceHeightRatio:");

    v30 = [v16 objectForKeyedSubscript:@"maximumVerticalDistanceGrowthRatio"];
    [v30 floatValue];
    -[CRLineWrappingParameters setMaximumVerticalDistanceGrowthRatio:](v9, "setMaximumVerticalDistanceGrowthRatio:");

    v31 = [v16 objectForKeyedSubscript:@"angleSimilarityThreshold"];
    [v31 floatValue];
    -[CRLineWrappingParameters setAngleSimilarityThreshold:](v9, "setAngleSimilarityThreshold:");

    v32 = [v16 objectForKeyedSubscript:@"widthGrowthLimit"];
    [v32 floatValue];
    -[CRLineWrappingParameters setWidthGrowthLimit:](v9, "setWidthGrowthLimit:");

    v33 = [v16 objectForKeyedSubscript:@"tokenCountIncreaseLimit"];
    -[CRLineWrappingParameters setTokenCountIncreaseLimit:](v9, "setTokenCountIncreaseLimit:", [v33 unsignedIntegerValue]);

    v34 = [v16 objectForKeyedSubscript:@"oversegmentedDistanceHeightRatioListItemTolerance"];
    [v34 floatValue];
    -[CRLineWrappingParameters setOversegmentedDistanceHeightRatioListItemTolerance:](v9, "setOversegmentedDistanceHeightRatioListItemTolerance:");

    v35 = objc_opt_class();
    v36 = [v16 objectForKeyedSubscript:@"overWrappingCorrection"];
    -[CRLineWrappingParameters setCorrectionMode:](v9, "setCorrectionMode:", [v35 _correctionModeFromString:v36]);

    v37 = [v16 objectForKeyedSubscript:@"confidenceThreshold"];
    [v37 floatValue];
    -[CRLineWrappingParameters setConfidenceThreshold:](v9, "setConfidenceThreshold:");

    v38 = [v16 objectForKeyedSubscript:@"contextConfidenceThreshold"];
    [v38 floatValue];
    -[CRLineWrappingParameters setContextConfidenceThreshold:](v9, "setContextConfidenceThreshold:");

    v39 = [v16 objectForKeyedSubscript:@"lmScoreThreshold"];
    [v39 floatValue];
    [(CRLineWrappingParameters *)v9 setLmScoreThreshold:v40];

    v41 = [v16 objectForKeyedSubscript:@"lmScoreEOSMinRatio"];
    [v41 floatValue];
    [(CRLineWrappingParameters *)v9 setLmScoreEOSMinRatio:v42];

    v43 = [v16 objectForKeyedSubscript:@"lmContextSize"];
    [v43 floatValue];
    [(CRLineWrappingParameters *)v9 setLmContextSize:(int)v44];

    v45 = [v16 objectForKeyedSubscript:@"probabilityThreshold"];
    if (v45)
    {
      v46 = [v16 objectForKeyedSubscript:@"probabilityThreshold"];
      [v46 floatValue];
      v9->_probabilityThreshold = v47;
    }
    else
    {
      v9->_probabilityThreshold = 0.5;
    }

    v50 = [v16 objectForKeyedSubscript:@"wrappingEvaluationThreshold"];
    v51 = v50;
    if (!v50) {
      v50 = &unk_1F3933130;
    }
    -[CRLineWrappingParameters setWrappingEvaluationThreshold:](v9, "setWrappingEvaluationThreshold:", [v50 integerValue]);

    v52 = [v16 objectForKeyedSubscript:@"noWrappingEvaluationThreshold"];
    v53 = v52;
    if (!v52) {
      v52 = &unk_1F3933148;
    }
    -[CRLineWrappingParameters setNoWrappingEvaluationThreshold:](v9, "setNoWrappingEvaluationThreshold:", [v52 integerValue]);

    v54 = [v16 objectForKeyedSubscript:@"caseWrappingScoreWithNoCapitalization"];
    v55 = v54;
    if (!v54) {
      v54 = &unk_1F3933160;
    }
    -[CRLineWrappingParameters setCaseWrappingScoreWithNoCapitalization:](v9, "setCaseWrappingScoreWithNoCapitalization:", [v54 integerValue]);

    v56 = [v16 objectForKeyedSubscript:@"punctuationWrappingScoreWithEndingMOS"];
    v57 = v56;
    if (!v56) {
      v56 = &unk_1F3933160;
    }
    -[CRLineWrappingParameters setPunctuationWrappingScoreWithEndingMOS:](v9, "setPunctuationWrappingScoreWithEndingMOS:", [v56 integerValue]);

    v58 = [v16 objectForKeyedSubscript:@"punctuationWrappingScoreWithNoClosingPunctuation"];
    v59 = v58;
    if (!v58) {
      v58 = &unk_1F3933160;
    }
    -[CRLineWrappingParameters setPunctuationWrappingScoreWithNoClosingPunctuation:](v9, "setPunctuationWrappingScoreWithNoClosingPunctuation:", [v58 integerValue]);

    goto LABEL_29;
  }
  v48 = CROSLogForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v63 = v10;
    __int16 v64 = 2112;
    v65 = v13;
    _os_log_impl(&dword_1DD733000, v48, OS_LOG_TYPE_FAULT, "Failed to load line wrapping config for locale %@ and category %@", buf, 0x16u);
  }

  v49 = 0;
LABEL_30:

  return v49;
}

- (float)probabilityThreshold
{
  return self->_probabilityThreshold;
}

- (float)heightSimilarityRatio
{
  return self->_heightSimilarityRatio;
}

- (void)setHeightSimilarityRatio:(float)a3
{
  self->_heightSimilarityRatio = a3;
}

- (float)angleSimilarityThreshold
{
  return self->_angleSimilarityThreshold;
}

- (void)setAngleSimilarityThreshold:(float)a3
{
  self->_angleSimilarityThreshold = a3;
}

- (int)lmContextSize
{
  return self->_lmContextSize;
}

- (void)setLmContextSize:(int)a3
{
  self->_lmContextSize = a3;
}

- (float)oversegmentedDistanceHeightRatioTolerance
{
  return self->_oversegmentedDistanceHeightRatioTolerance;
}

- (void)setOversegmentedDistanceHeightRatioTolerance:(float)a3
{
  self->_oversegmentedDistanceHeightRatioTolerance = a3;
}

- (float)oversegmentedDistanceHeightRatioListItemTolerance
{
  return self->_oversegmentedDistanceHeightRatioListItemTolerance;
}

- (void)setOversegmentedDistanceHeightRatioListItemTolerance:(float)a3
{
  self->_oversegmentedDistanceHeightRatioListItemTolerance = a3;
}

- (float)leadingDistanceRatioTolerance
{
  return self->_leadingDistanceRatioTolerance;
}

- (void)setLeadingDistanceRatioTolerance:(float)a3
{
  self->_leadingDistanceRatioTolerance = a3;
}

- (float)verticalSpacingRatioTolerance
{
  return self->_verticalSpacingRatioTolerance;
}

- (void)setVerticalSpacingRatioTolerance:(float)a3
{
  self->_verticalSpacingRatioTolerance = a3;
}

- (float)newParagraphIndentDistanceRatioTolerance
{
  return self->_newParagraphIndentDistanceRatioTolerance;
}

- (void)setNewParagraphIndentDistanceRatioTolerance:(float)a3
{
  self->_newParagraphIndentDistanceRatioTolerance = a3;
}

- (float)widthGrowthLimit
{
  return self->_widthGrowthLimit;
}

- (void)setWidthGrowthLimit:(float)a3
{
  self->_widthGrowthLimit = a3;
}

- (int64_t)wrappingEvaluationThreshold
{
  return self->_wrappingEvaluationThreshold;
}

- (void)setWrappingEvaluationThreshold:(int64_t)a3
{
  self->_wrappingEvaluationThreshold = a3;
}

- (int64_t)noWrappingEvaluationThreshold
{
  return self->_noWrappingEvaluationThreshold;
}

- (void)setNoWrappingEvaluationThreshold:(int64_t)a3
{
  self->_noWrappingEvaluationThreshold = a3;
}

- (int64_t)caseWrappingScoreWithNoCapitalization
{
  return self->_caseWrappingScoreWithNoCapitalization;
}

- (void)setCaseWrappingScoreWithNoCapitalization:(int64_t)a3
{
  self->_caseWrappingScoreWithNoCapitalization = a3;
}

- (int64_t)punctuationWrappingScoreWithEndingMOS
{
  return self->_punctuationWrappingScoreWithEndingMOS;
}

- (void)setPunctuationWrappingScoreWithEndingMOS:(int64_t)a3
{
  self->_punctuationWrappingScoreWithEndingMOS = a3;
}

- (int64_t)punctuationWrappingScoreWithNoClosingPunctuation
{
  return self->_punctuationWrappingScoreWithNoClosingPunctuation;
}

- (void)setPunctuationWrappingScoreWithNoClosingPunctuation:(int64_t)a3
{
  self->_punctuationWrappingScoreWithNoClosingPunctuation = a3;
}

- (float)smallestVerticalDistanceHeightRatio
{
  return self->_smallestVerticalDistanceHeightRatio;
}

- (void)setSmallestVerticalDistanceHeightRatio:(float)a3
{
  self->_smallestVerticalDistanceHeightRatio = a3;
}

- (float)maximumVerticalDistanceGrowthRatio
{
  return self->_maximumVerticalDistanceGrowthRatio;
}

- (void)setMaximumVerticalDistanceGrowthRatio:(float)a3
{
  self->_maximumVerticalDistanceGrowthRatio = a3;
}

- (int64_t)correctionMode
{
  return self->_correctionMode;
}

- (void)setCorrectionMode:(int64_t)a3
{
  self->_correctionMode = a3;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (float)contextConfidenceThreshold
{
  return self->_contextConfidenceThreshold;
}

- (void)setContextConfidenceThreshold:(float)a3
{
  self->_contextConfidenceThreshold = a3;
}

- (double)lmScoreThreshold
{
  return self->_lmScoreThreshold;
}

- (void)setLmScoreThreshold:(double)a3
{
  self->_lmScoreThreshold = a3;
}

- (double)lmScoreEOSMinRatio
{
  return self->_lmScoreEOSMinRatio;
}

- (void)setLmScoreEOSMinRatio:(double)a3
{
  self->_lmScoreEOSMinRatio = a3;
}

- (unint64_t)tokenCountIncreaseLimit
{
  return self->_tokenCountIncreaseLimit;
}

- (void)setTokenCountIncreaseLimit:(unint64_t)a3
{
  self->_tokenCountIncreaseLimit = a3;
}

@end