@interface CRLineOutputRegion
+ (CRLineOutputRegion)_lineWithChildren:(void *)a3 confidence:(uint64_t)a4 quad:(void *)a5 baselineAngle:;
+ (CRLineOutputRegion)lineWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 subfeatureType:(uint64_t)a5 imageSize:(uint64_t)a6 confidenceThresholdProvider:(void *)a7 injectSpaceCharacter:(int)a8;
+ (CRNormalizedQuad)_spaceCharacterQuadBetweenQuad1:(void *)a3 quad2:;
+ (id)lineWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
+ (id)lineWithDetectedRegion:(id)a3;
+ (id)lineWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6;
+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6 injectSpaceCharacter:(BOOL)a7;
+ (id)lineWithTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5;
+ (id)lineWithWords:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
- (BOOL)computesNumberOfLinesFromChildren;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldWrapToNextLine;
- (BOOL)useLineSeparatorAsLineBreak;
- (CGRect)boundingBoxEstimateAfterTrimmingCharacters:(id)a3;
- (CRDetectedLineRegion)detectedLineRegion;
- (CRLineOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRLineOutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4;
- (NSLocale)locale;
- (double)confidenceScore;
- (id)contentBaselines;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)joiningDelimiter;
- (id)scriptCategoryResults;
- (id)sequenceScriptOutputResult;
- (int64_t)wordCount;
- (unint64_t)lineWrappingType;
- (unint64_t)nmsOutputScale;
- (unint64_t)textRegionType;
- (unint64_t)textType;
- (unint64_t)type;
- (void)mergeWithLine:(id)a3;
- (void)setDetectedLineRegion:(id)a3;
- (void)setLineWrappingType:(unint64_t)a3;
- (void)setUseLineSeparatorAsLineBreak:(BOOL)a3;
@end

@implementation CRLineOutputRegion

- (CRLineOutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLineOutputRegion;
  v4 = [(CROutputRegion *)&v7 initWithConfidence:*(void *)&a3 baselineAngle:a4];
  v5 = v4;
  if (v4) {
    [(CROutputRegion *)v4 setNumberOfLines:1];
  }
  return v5;
}

- (CRLineOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLineOutputRegion;
  v9 = [(CROutputRegion *)&v12 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    if (a4 >= 11)
    {
      unint64_t v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
    }
    else if (a4 >= 5)
    {
      unint64_t v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5]+ 1;
    }
    else if (a4 == 4)
    {
      if (+[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5])
      {
        unint64_t v10 = 2;
      }
      else
      {
        unint64_t v10 = 1;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
    v9->_lineWrappingType = v10;
  }

  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v7.receiver = self;
  v7.super_class = (Class)CRLineOutputRegion;
  v4 = [(CROutputRegion *)&v7 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendUInteger:[(CRLineOutputRegion *)self lineWrappingType] toData:v5];
  return v5;
}

+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6 injectSpaceCharacter:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.height;
  double width = a5.width;
  id v13 = a3;
  id v14 = a6;
  v15 = +[CRLineOutputRegion lineWithTextFeature:(uint64_t)a1 candidateIdx:v13 subfeatureType:0 imageSize:a4 confidenceThresholdProvider:v14 injectSpaceCharacter:v7];
  v16 = (void *)MEMORY[0x1E4F1CA48];
  v17 = [v13 stringValueCandidates];
  v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

  v19 = [v13 stringValueCandidates];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    unint64_t v21 = 0;
    do
    {
      v22 = +[CRLineOutputRegion lineWithTextFeature:(uint64_t)a1 candidateIdx:v13 subfeatureType:v21 imageSize:a4 confidenceThresholdProvider:v14 injectSpaceCharacter:v7];
      [v18 addObject:v22];

      ++v21;
      v23 = [v13 stringValueCandidates];
      unint64_t v24 = [v23 count];
    }
    while (v21 < v24);
  }
  v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v18];
  [v15 setCandidates:v25];

  return v15;
}

+ (CRLineOutputRegion)lineWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 subfeatureType:(uint64_t)a5 imageSize:(uint64_t)a6 confidenceThresholdProvider:(void *)a7 injectSpaceCharacter:(int)a8
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a7;
  self;
  v70 = v14;
  v16 = [v14 selectedLocale];
  v67 = [v15 thresholdsForTextRegion:v14 withLocale:v16];

  v17 = [v14 candidateProbs];
  v18 = [v17 objectAtIndexedSubscript:a5];
  [v18 doubleValue];
  uint64_t v19 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v67);

  uint64_t v20 = [CRLineOutputRegion alloc];
  [v14 baselineAngle];
  v69 = [(CRLineOutputRegion *)v20 initWithConfidence:v19 baselineAngle:v21];
  v22 = [v14 subFeatureCandidates];
  v23 = [v22 firstObject];
  uint64_t v24 = [v23 count];

  v25 = [v14 stringValueCandidates];
  v66 = [v25 objectAtIndexedSubscript:a5];

  v68 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v26 = [v66 stringByTrimmingCharactersInSet:v68];
  [(CROutputRegion *)v69 setText:v26];

  v27 = [CRNormalizedQuad alloc];
  [v14 topLeft];
  double v29 = v28;
  double v31 = v30;
  [v14 topRight];
  double v33 = v32;
  double v35 = v34;
  [v14 bottomRight];
  double v37 = v36;
  double v39 = v38;
  [v14 bottomLeft];
  v42 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v27, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v29, v31, v33, v35, v37, v39, v40, v41, *(void *)&a1, *(void *)&a2);
  [(CROutputRegion *)v69 setBoundingQuad:v42];

  v43 = [v14 polygon];
  [(CROutputRegion *)v69 setPolygon:v43];

  [(CRCompositeOutputRegion *)v69 setShouldComputeBoundsFromChildren:0];
  if (v24)
  {
    if (a6 == 16)
    {
      uint64_t v44 = 1;
      goto LABEL_7;
    }
    char v45 = [v14 whitespaceInjected];
    uint64_t v44 = 1;
    if (v45 & 1) != 0 || (a8) {
      goto LABEL_7;
    }
  }
  uint64_t v44 = 0;
LABEL_7:
  BOOL v46 = v24 == 0;
  [(CROutputRegion *)v69 setShouldComputeTranscriptFromChildren:v44];
  v47 = [v14 candidateProbs];
  v48 = [v47 objectAtIndexedSubscript:a5];
  [v48 floatValue];
  -[CROutputRegion setRawConfidence:](v69, "setRawConfidence:");

  v49 = [v14 candidateActivationProbs];
  v50 = [v49 objectAtIndexedSubscript:a5];
  [v50 doubleValue];
  -[CROutputRegion setActivationProbability:](v69, "setActivationProbability:");

  v51 = [v14 selectedLocale];
  [(CROutputRegion *)v69 setRecognizedLocale:v51];

  v52 = [v14 uuid];
  [(CROutputRegion *)v69 setUuid:v52];

  -[CRLineOutputRegion setLineWrappingType:](v69, "setLineWrappingType:", [v14 lineWrappingType]);
  if (v46) {
    v53 = 0;
  }
  else {
    v53 = objc_opt_new();
  }
  if (a6 == 32 && a8)
  {
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x2020000000;
    v89[3] = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__3;
    v94 = __Block_byref_object_dispose__3;
    id v95 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__3;
    v87[4] = __Block_byref_object_dispose__3;
    id v88 = 0;
    v54 = [(CROutputRegion *)v69 text];
    v55 = [(CROutputRegion *)v69 text];
    uint64_t v56 = [v55 length];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __129__CRLineOutputRegion_lineWithTextFeature_candidateIdx_subfeatureType_imageSize_confidenceThresholdProvider_injectSpaceCharacter___block_invoke;
    v75[3] = &unk_1E6CDAE10;
    uint64_t v84 = a5;
    id v76 = v14;
    v81 = v89;
    id v77 = v68;
    v78 = @" ";
    v82 = v87;
    p_long long buf = &buf;
    double v85 = a1;
    double v86 = a2;
    id v79 = v53;
    id v80 = v15;
    objc_msgSend(v54, "enumerateSubstringsInRange:options:usingBlock:", 0, v56, 2, v75);

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(v89, 8);
  }
  else if (a6 == 32 || a6 == 16)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v57 = [v14 subFeatureCandidates];
    v58 = [v57 objectAtIndexedSubscript:a5];

    uint64_t v59 = [v58 countByEnumeratingWithState:&v71 objects:v90 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v72 != v60) {
            objc_enumerationMutation(v58);
          }
          uint64_t v62 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          if (a6 == 32) {
            +[CRCharacterOutputRegion characterWithTextFeature:imageSize:confidenceThresholdProvider:](CRCharacterOutputRegion, "characterWithTextFeature:imageSize:confidenceThresholdProvider:", v62, v15, a1, a2);
          }
          else {
          v63 = +[CRWordOutputRegion wordWithTextFeature:imageSize:confidenceThresholdProvider:](CRWordOutputRegion, "wordWithTextFeature:imageSize:confidenceThresholdProvider:", v62, v15, a1, a2);
          }
          [v53 addObject:v63];
        }
        uint64_t v59 = [v58 countByEnumeratingWithState:&v71 objects:v90 count:16];
      }
      while (v59);
    }
  }
  else
  {
    v64 = CROSLogForCategory(0);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a6;
      _os_log_impl(&dword_1DD733000, v64, OS_LOG_TYPE_ERROR, "Unsupported subfeature type %ld", (uint8_t *)&buf, 0xCu);
    }
  }
  [(CROutputRegion *)v69 setChildren:v53];

  return v69;
}

+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6
{
  return +[CRLineOutputRegion lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:", a3, a4, a6, 1, a5.width, a5.height);
}

+ (id)lineWithDetectedRegion:(id)a3
{
  id v3 = a3;
  v4 = [CRLineOutputRegion alloc];
  v5 = [v3 boundingQuad];
  [v5 baselineAngle];
  v6 = -[CRLineOutputRegion initWithConfidence:baselineAngle:](v4, "initWithConfidence:baselineAngle:", 1);

  BOOL v7 = [v3 boundingQuad];
  [(CROutputRegion *)v6 setBoundingQuad:v7];

  -[CROutputRegion setLayoutDirection:](v6, "setLayoutDirection:", [v3 layoutDirection]);
  id v8 = [v3 polygon];
  [(CROutputRegion *)v6 setPolygon:v8];

  [(CRLineOutputRegion *)v6 setDetectedLineRegion:v3];
  [(CRCompositeOutputRegion *)v6 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v6 setShouldComputeTranscriptFromChildren:0];
  return v6;
}

+ (id)lineWithTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5
{
  BOOL v5 = a5;
  id v46 = a1;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v51 = v7;
  v9 = [v7 locale];
  v48 = [v8 thresholdsForTextRegion:v7 withLocale:v9];

  [v7 confidence];
  uint64_t v10 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v48);
  v49 = [v7 subregions];
  v11 = [CRLineOutputRegion alloc];
  objc_super v12 = [v7 boundingQuad];
  [v12 baselineAngle];
  v50 = -[CRLineOutputRegion initWithConfidence:baselineAngle:](v11, "initWithConfidence:baselineAngle:", v10);

  uint64_t v13 = [v49 count];
  if (v13)
  {
    id v14 = [v7 subregions];
    id v15 = [v14 firstObject];
    unint64_t v47 = [v15 textRegionType];
  }
  else
  {
    unint64_t v47 = 0;
  }
  v16 = [v7 text];
  v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v18 = [v16 stringByTrimmingCharactersInSet:v17];
  [(CROutputRegion *)v50 setText:v18];

  uint64_t v19 = [v7 boundingQuad];
  [(CROutputRegion *)v50 setBoundingQuad:v19];

  uint64_t v20 = [v7 polygon];
  [(CROutputRegion *)v50 setPolygon:v20];

  [(CRCompositeOutputRegion *)v50 setShouldComputeBoundsFromChildren:0];
  if (!v13) {
    goto LABEL_9;
  }
  if (v47 == 1)
  {
    uint64_t v21 = 1;
    goto LABEL_10;
  }
  char v22 = [v7 whitespaceInjected];
  uint64_t v21 = 1;
  if ((v22 & 1) == 0 && !v5) {
LABEL_9:
  }
    uint64_t v21 = 0;
LABEL_10:
  [(CROutputRegion *)v50 setShouldComputeTranscriptFromChildren:v21];
  [v7 confidence];
  *(float *)&double v23 = v23;
  [(CROutputRegion *)v50 setRawConfidence:v23];
  [v7 activationProbability];
  -[CROutputRegion setActivationProbability:](v50, "setActivationProbability:");
  uint64_t v24 = [v7 locale];
  [(CROutputRegion *)v50 setRecognizedLocale:v24];

  -[CROutputRegion setLayoutDirection:](v50, "setLayoutDirection:", [v7 layoutDirection]);
  v25 = [v7 detectedLineRegion];
  [(CRLineOutputRegion *)v50 setDetectedLineRegion:v25];

  if (v13)
  {
    id v26 = (id)objc_opt_new();
    if (v47 || !v5)
    {
      if (v47 > 1)
      {
        double v37 = CROSLogForCategory(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v47;
          _os_log_impl(&dword_1DD733000, v37, OS_LOG_TYPE_ERROR, "Unsupported subfeature type %ld", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v32 = v49;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v77 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v57 != v34) {
                objc_enumerationMutation(v32);
              }
              double v36 = +[CROutputRegion outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CROutputRegion, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", *(void *)(*((void *)&v56 + 1) + 8 * i), v8, v5, v46);
              [v26 addObject:v36];
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v77 count:16];
          }
          while (v33);
        }
      }
    }
    else
    {
      v75[0] = 0;
      v75[1] = v75;
      v75[2] = 0x2020000000;
      v75[3] = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v79 = 0x3032000000;
      id v80 = __Block_byref_object_copy__3;
      v81 = __Block_byref_object_dispose__3;
      id v82 = 0;
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x3032000000;
      v73[3] = __Block_byref_object_copy__3;
      v73[4] = __Block_byref_object_dispose__3;
      id v74 = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x3010000000;
      v72[4] = 0;
      v72[5] = 0;
      v72[3] = &unk_1DD8FDA7A;
      v27 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      double v28 = [(CROutputRegion *)v50 text];
      double v29 = [(CROutputRegion *)v50 text];
      uint64_t v30 = [v29 length];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __90__CRLineOutputRegion_lineWithTextRegion_confidenceThresholdProvider_injectSpaceCharacter___block_invoke;
      v60[3] = &unk_1E6CDADE8;
      v66 = v72;
      id v61 = v49;
      v67 = v75;
      id v31 = v27;
      id v62 = v31;
      v63 = @" ";
      v68 = v73;
      p_long long buf = &buf;
      id v70 = v46;
      id v26 = v26;
      id v64 = v26;
      id v65 = v8;
      BOOL v71 = v5;
      objc_msgSend(v28, "enumerateSubstringsInRange:options:usingBlock:", 0, v30, 2, v60);

      _Block_object_dispose(v72, 8);
      _Block_object_dispose(v73, 8);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(v75, 8);
    }
  }
  else
  {
    id v26 = 0;
  }
  -[CROutputRegion setChildren:](v50, "setChildren:", v26, v46);
  double v38 = [v51 candidates];
  if (v38) {
    double v39 = objc_opt_new();
  }
  else {
    double v39 = 0;
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v40 = [v51 candidates];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(v40);
        }
        uint64_t v44 = +[CRLineOutputRegion lineWithTextRegion:*(void *)(*((void *)&v52 + 1) + 8 * j) confidenceThresholdProvider:v8 injectSpaceCharacter:v5];
        [v39 addObject:v44];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v76 count:16];
    }
    while (v41);
  }

  [(CROutputRegion *)v50 setCandidates:v39];
  return v50;
}

void __90__CRLineOutputRegion_lineWithTextRegion_confidenceThresholdProvider_injectSpaceCharacter___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v28 = a2;
  v30.location = a3;
  v30.length = a4;
  NSRange v7 = NSIntersectionRange(v30, *(NSRange *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  if (v7.location == 0x7FFFFFFFFFFFFFFFLL || v7.length == 0)
  {
    v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    if ([v28 rangeOfCharacterFromSet:*(void *)(a1 + 40)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = +[CROutputRegion outputRegionFromTextRegion:v9 confidenceThresholdProvider:*(void *)(a1 + 64) injectSpaceCharacter:*(unsigned __int8 *)(a1 + 112)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
      objc_super v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v9);
      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    else
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) text];
      char v14 = [v13 isEqualToString:*(void *)(a1 + 48)];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = *(void *)(a1 + 104);
        v16 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) boundingQuad];
        v17 = [v9 boundingQuad];
        v18 = +[CRLineOutputRegion _spaceCharacterQuadBetweenQuad1:quad2:](v15, v16, v17);

        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) confidence];
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) baselineAngle];
        uint64_t v21 = +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v19, v20, v18);
        [*(id *)(a1 + 56) addObject:v21];
        uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
        double v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;
      }
    }
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v25 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) text];
    uint64_t v26 = [v25 length];
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    *(void *)(v27 + 32) = 0;
    *(void *)(v27 + 40) = v26 + v24;
  }
}

+ (CRNormalizedQuad)_spaceCharacterQuadBetweenQuad1:(void *)a3 quad2:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [CRNormalizedQuad alloc];
  [v5 topRight];
  double v27 = v8;
  double v28 = v7;
  [v4 topLeft];
  double v10 = v9;
  double v12 = v11;
  [v4 bottomLeft];
  double v14 = v13;
  double v16 = v15;

  [v5 bottomRight];
  double v18 = v17;
  double v20 = v19;
  [v5 normalizationSize];
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  v25 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v6, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v28, v27, v10, v12, v14, v16, v18, v20, v22, v24);
  return v25;
}

void __129__CRLineOutputRegion_lineWithTextFeature_candidateIdx_subfeatureType_imageSize_confidenceThresholdProvider_injectSpaceCharacter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 subFeatureCandidates];
  v6 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 96)];
  obuint64_t j = [v6 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:*(void *)(a1 + 40)];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = +[CRCharacterOutputRegion characterWithTextFeature:imageSize:confidenceThresholdProvider:](CRCharacterOutputRegion, "characterWithTextFeature:imageSize:confidenceThresholdProvider:", obj, *(void *)(a1 + 64), *(double *)(a1 + 104), *(double *)(a1 + 112));
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), obj);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  else
  {
    double v11 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) text];
    char v12 = [v11 isEqualToString:*(void *)(a1 + 48)];

    if ((v12 & 1) == 0)
    {
      double v13 = [CRNormalizedQuad alloc];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) topRight];
      double v15 = v14;
      double v17 = v16;
      [obj topLeft];
      double v19 = v18;
      double v21 = v20;
      [obj bottomLeft];
      double v23 = v22;
      double v25 = v24;
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) bottomRight];
      double v28 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v13, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v15, v17, v19, v21, v23, v25, v26, v27, *(void *)(a1 + 104), *(void *)(a1 + 112));
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) confidence];
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) baselineAngle];
      uint64_t v31 = +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v29, v30, v28);
      [*(id *)(a1 + 56) addObject:v31];
      uint64_t v32 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
  }
}

+ (id)lineWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = [[CRLineOutputRegion alloc] initWithConfidence:v7 baselineAngle:a6];
  [(CROutputRegion *)v11 setText:v10];

  [(CROutputRegion *)v11 setBoundingQuad:v9];
  [(CRCompositeOutputRegion *)v11 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v11 setShouldComputeTranscriptFromChildren:0];
  [(CROutputRegion *)v11 setChildren:0];
  return v11;
}

+ (id)lineWithWords:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  return +[CRLineOutputRegion _lineWithChildren:confidence:quad:baselineAngle:](a6, (uint64_t)a1, a3, *(uint64_t *)&a4, a5);
}

+ (CRLineOutputRegion)_lineWithChildren:(void *)a3 confidence:(uint64_t)a4 quad:(void *)a5 baselineAngle:
{
  id v8 = a5;
  id v9 = a3;
  self;
  id v10 = [[CRLineOutputRegion alloc] initWithConfidence:a4 baselineAngle:a1];
  [(CROutputRegion *)v10 setShouldComputeTranscriptFromChildren:1];
  if (v8)
  {
    [(CRCompositeOutputRegion *)v10 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v10 setBoundingQuad:v8];
  }
  else
  {
    [(CRCompositeOutputRegion *)v10 setShouldComputeBoundsFromChildren:1];
  }
  [(CROutputRegion *)v10 setChildren:v9];

  return v10;
}

+ (id)lineWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  return +[CRLineOutputRegion _lineWithChildren:confidence:quad:baselineAngle:](a6, (uint64_t)a1, a3, *(uint64_t *)&a4, a5);
}

- (id)scriptCategoryResults
{
  v2 = [(CRLineOutputRegion *)self detectedLineRegion];
  id v3 = [v2 scriptCategoryResults];

  return v3;
}

- (id)sequenceScriptOutputResult
{
  v2 = [(CRLineOutputRegion *)self detectedLineRegion];
  id v3 = [v2 sequenceScriptOutputResult];

  return v3;
}

- (unint64_t)nmsOutputScale
{
  v2 = [(CRLineOutputRegion *)self detectedLineRegion];
  unint64_t v3 = [v2 nmsOutputScale];

  return v3;
}

- (unint64_t)textType
{
  v2 = [(CRLineOutputRegion *)self detectedLineRegion];
  unint64_t v3 = [v2 textType];

  return v3;
}

- (id)contentBaselines
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(CROutputRegion *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v3)
  {
    double v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v2);
      }
      id v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) contentBaselines];
      uint64_t v9 = [v8 firstObject];
      id v10 = (void *)v9;
      if (v5)
      {
        uint64_t v11 = [v5 polylineByAppendingPolyline:v9];

        id v5 = (void *)v11;
      }
      else
      {
        id v5 = (void *)v9;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  }
  while (v4);

  if (v5)
  {
    char v12 = [v5 simplified];
    double v19 = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

    v2 = v5;
LABEL_14:

    goto LABEL_16;
  }
  double v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_16:
  return v13;
}

- (int64_t)wordCount
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v3 = [(CROutputRegion *)self recognizedLocale];
  BOOL v4 = +[CRImageReader languageIsChinese:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__CRLineOutputRegion_wordCount__block_invoke;
    v10[3] = &unk_1E6CDAE38;
    id v6 = v5;
    id v11 = v6;
    char v12 = &v13;
    [(CROutputRegion *)self enumerateContentsWithTypes:32 usingBlock:v10];
  }
  else
  {
    id v6 = [(CROutputRegion *)self contentsWithTypes:16];
    uint64_t v7 = [v6 count];
    v14[3] += v7;
  }

  int64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __31__CRLineOutputRegion_wordCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 text];
  BOOL v4 = [v3 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 length];

  if (v5) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (unint64_t)type
{
  return 8;
}

- (CGRect)boundingBoxEstimateAfterTrimmingCharacters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CROutputRegion *)self boundingQuad];
  id v6 = [v5 denormalizedQuad];
  [v6 boundingBox];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(CROutputRegion *)self text];
  unint64_t v16 = [v15 length];
  long long v17 = [v15 stringByTrimmingCharactersInSet:v4];

  unint64_t v18 = [v15 rangeOfString:v17];
  double v20 = (double)v19 / (double)v16;
  if (v20 == 0.0)
  {
    double v21 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v21 = v8 + v12 * ((double)v18 / (double)v16);
    double v22 = v12 * v20;
  }

  double v23 = v21;
  double v24 = v10;
  double v25 = v22;
  double v26 = v14;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)joiningDelimiter
{
  BOOL v3 = [(CRLineOutputRegion *)self useLineSeparatorAsLineBreak];
  return +[CRLineWrapper joiningDelimiterForLine:self useLineSeparatorAsLineBreak:v3];
}

- (BOOL)shouldWrapToNextLine
{
  return [(CRLineOutputRegion *)self lineWrappingType] != 1
      && [(CRLineOutputRegion *)self lineWrappingType] != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLineOutputRegion *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v9.receiver = self;
      v9.super_class = (Class)CRLineOutputRegion;
      if ([(CROutputRegion *)&v9 isEqual:v5])
      {
        unint64_t v6 = [(CRLineOutputRegion *)self lineWrappingType];
        BOOL v7 = v6 == [(CRLineOutputRegion *)v5 lineWrappingType];
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CRLineOutputRegion;
  id v7 = [(CROutputRegion *)&v10 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  objc_msgSend(v7, "setLineWrappingType:", -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType"));
  objc_msgSend(v7, "setUseLineSeparatorAsLineBreak:", -[CRLineOutputRegion useLineSeparatorAsLineBreak](self, "useLineSeparatorAsLineBreak"));
  double v8 = [(CRLineOutputRegion *)self detectedLineRegion];
  [v7 setDetectedLineRegion:v8];

  return v7;
}

- (unint64_t)textRegionType
{
  return 2;
}

- (NSLocale)locale
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  BOOL v3 = [(CROutputRegion *)self recognizedLocale];
  id v4 = [v2 localeWithLocaleIdentifier:v3];

  return (NSLocale *)v4;
}

- (double)confidenceScore
{
  [(CROutputRegion *)self rawConfidence];
  return v2;
}

- (void)mergeWithLine:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(CROutputRegion *)self text];
    float v7 = (float)(unint64_t)[v6 length];
    double v8 = [(CROutputRegion *)self text];
    uint64_t v9 = [v8 length];
    objc_super v10 = [v5 text];
    float v11 = v7 / (float)(unint64_t)([v10 length] + v9);

    [(CROutputRegion *)self rawConfidence];
    float v13 = v12;
    [v5 rawConfidence];
    *(float *)&double v15 = (float)((float)(1.0 - v11) * v14) + (float)(v13 * v11);
    [(CROutputRegion *)self setRawConfidence:v15];
    [(CROutputRegion *)self activationProbability];
    double v17 = v16;
    [v5 activationProbability];
    [(CROutputRegion *)self setActivationProbability:v18 * (float)(1.0 - v11) + v17 * v11];
    unint64_t v19 = [(CROutputRegion *)self text];
    double v20 = [(CROutputRegion *)self text];
    double v21 = [v5 text];
    double v22 = [(CROutputRegion *)self recognizedLocale];
    double v23 = [v20 _crStringByAppendingString:v21 locale:v22];
    [(CROutputRegion *)self setText:v23];

    if (![(CROutputRegion *)self shouldComputeTranscriptFromChildren]) {
      goto LABEL_8;
    }
    double v24 = [(CROutputRegion *)self children];
    double v25 = [v24 firstObject];
    uint64_t v26 = [v25 type];

    if (v26 != 32) {
      goto LABEL_8;
    }
    double v27 = [(CROutputRegion *)self text];
    unint64_t v28 = [v27 length];
    if (v28 > [v19 length])
    {
      uint64_t v29 = [(CROutputRegion *)self text];
      int v30 = objc_msgSend(v29, "characterAtIndex:", objc_msgSend(v19, "length"));

      if (v30 != 32)
      {
LABEL_8:
        double v40 = [(CROutputRegion *)self children];
        uint64_t v41 = [v5 children];
        uint64_t v42 = [v40 arrayByAddingObjectsFromArray:v41];
        [(CROutputRegion *)self setChildren:v42];

        for (unint64_t i = 0; ; ++i)
        {
          uint64_t v44 = [(CROutputRegion *)self candidates];
          unint64_t v45 = [v44 count];

          id v46 = [v5 candidates];
          unint64_t v47 = [v46 count];

          unint64_t v48 = v45 >= v47 ? v47 : v45;
          if (v48 <= i) {
            break;
          }
          v49 = [(CROutputRegion *)self candidates];
          v50 = [v49 objectAtIndexedSubscript:i];
          v51 = [v5 candidates];
          long long v52 = [v51 objectAtIndexedSubscript:i];
          [v50 mergeWithLine:v52];
        }
        long long v55 = [(CROutputRegion *)self boundingQuad];
        [v55 size];
        double v57 = v56;

        long long v58 = [v5 boundingQuad];
        [v58 size];
        double v60 = v59;

        double v61 = v57 / (v57 + v60);
        [(CROutputRegion *)self baselineAngle];
        double v63 = v62;
        [v5 baselineAngle];
        double v65 = v63 - v64;
        if (v63 - v64 <= 3.14159265)
        {
          if (v65 > -3.14159265) {
            goto LABEL_22;
          }
          double v66 = 6.28318531;
        }
        else
        {
          double v66 = -6.28318531;
        }
        double v65 = v65 + v66;
LABEL_22:
        double v67 = v64 + v61 * v65;
        if (v67 <= 3.14159265)
        {
          if (v67 > -3.14159265)
          {
LABEL_27:
            [(CROutputRegion *)self setBaselineAngle:v67];
            v69 = [(CROutputRegion *)self boundingQuad];
            id v70 = [v5 boundingQuad];
            [(CROutputRegion *)self baselineAngle];
            *(float *)&double v71 = v71;
            long long v72 = [v69 unionWithNormalizedQuad:v70 baselineAngle:v71];
            [(CROutputRegion *)self setBoundingQuad:v72];
            if ([(CROutputRegion *)self shouldComputeTranscriptFromChildren]) {
              [(CROutputRegion *)self _invalidateTranscript];
            }

            goto LABEL_30;
          }
          double v68 = 6.28318531;
        }
        else
        {
          double v68 = -6.28318531;
        }
        double v67 = v67 + v68;
        goto LABEL_27;
      }
      long long v73 = [(CROutputRegion *)self children];
      uint64_t v31 = [v73 lastObject];
      uint64_t v32 = [v31 boundingQuad];
      uint64_t v33 = [v5 children];
      uint64_t v34 = [v33 firstObject];
      double v35 = [v34 boundingQuad];
      double v27 = +[CRLineOutputRegion _spaceCharacterQuadBetweenQuad1:quad2:]((uint64_t)CRLineOutputRegion, v32, v35);

      double v36 = [(CROutputRegion *)self children];
      uint64_t v37 = [v5 confidence];
      [v5 baselineAngle];
      double v38 = +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", @" ", v37, v27);
      double v39 = [v36 arrayByAddingObject:v38];
      [(CROutputRegion *)self setChildren:v39];
    }
    goto LABEL_8;
  }
  long long v53 = CROSLogForCategory(0);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v75 = (id)objc_opt_class();
    id v54 = v75;
    _os_log_impl(&dword_1DD733000, v53, OS_LOG_TYPE_FAULT, "Unexpectedly appending objects of type %@", buf, 0xCu);
  }
LABEL_30:
}

- (unint64_t)lineWrappingType
{
  return self->_lineWrappingType;
}

- (void)setLineWrappingType:(unint64_t)a3
{
  self->_lineWrappingType = a3;
}

- (BOOL)useLineSeparatorAsLineBreak
{
  return self->_useLineSeparatorAsLineBreak;
}

- (void)setUseLineSeparatorAsLineBreak:(BOOL)a3
{
  self->_useLineSeparatorAsLineBreak = a3;
}

- (CRDetectedLineRegion)detectedLineRegion
{
  return self->_detectedLineRegion;
}

- (void)setDetectedLineRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end