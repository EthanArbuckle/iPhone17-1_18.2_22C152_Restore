@interface CRCharacterOutputRegion
+ (id)characterWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
+ (id)characterWithTextFeature:(id)a3 imageSize:(CGSize)a4 confidenceThresholdProvider:(id)a5;
+ (id)characterWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 imageSize:(uint64_t)a5 confidenceThresholdProvider:(void *)a6;
- (BOOL)computesBoundsFromChildren;
- (BOOL)computesNumberOfLinesFromChildren;
- (BOOL)computesTranscriptFromChildren;
- (BOOL)isEqual:(id)a3;
- (CRCharacterOutputRegion)init;
- (CRCharacterOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (id)contentBaselines;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)joiningDelimiter;
- (unint64_t)type;
@end

@implementation CRCharacterOutputRegion

- (CRCharacterOutputRegion)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRCharacterOutputRegion;
  v2 = [(CROutputRegion *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CROutputRegion *)v2 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v3 setShouldComputeTranscriptFromChildren:0];
    [(CROutputRegion *)v3 setNumberOfLines:0];
  }
  return v3;
}

- (CRCharacterOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRCharacterOutputRegion;
  v9 = [(CROutputRegion *)&v15 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    v10 = [CRNormalizedPolyline alloc];
    v11 = +[CRCodingUtilities objectDataFromEncodingData:v8 offset:a5];
    uint64_t v12 = [(CRNormalizedPolyline *)v10 initWithCRCodableDataRepresentation:v11];
    baseline = v9->_baseline;
    v9->_baseline = (CRNormalizedPolyline *)v12;
  }
  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v9.receiver = self;
  v9.super_class = (Class)CRCharacterOutputRegion;
  v4 = [(CROutputRegion *)&v9 crCodableDataRepresentation];
  objc_super v5 = [v3 dataWithData:v4];

  if (self) {
    id Property = objc_getProperty(self, v6, 336, 1);
  }
  else {
    id Property = 0;
  }
  +[CRCodingUtilities appendCodable:Property toData:v5];
  return v5;
}

+ (id)characterWithTextFeature:(id)a3 imageSize:(CGSize)a4 confidenceThresholdProvider:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v11 = +[CRCharacterOutputRegion characterWithTextFeature:(uint64_t)a1 candidateIdx:v9 imageSize:0 confidenceThresholdProvider:v10];
  uint64_t v12 = [v9 stringValueCandidates];
  unint64_t v13 = [v12 count];

  if (v13 >= 2)
  {
    v14 = (void *)MEMORY[0x1E4F1CA48];
    objc_super v15 = [v9 stringValueCandidates];
    v16 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));

    v17 = [v9 stringValueCandidates];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      unint64_t v19 = 0;
      do
      {
        v20 = +[CRCharacterOutputRegion characterWithTextFeature:(uint64_t)a1 candidateIdx:v9 imageSize:v19 confidenceThresholdProvider:v10];
        [v16 addObject:v20];

        ++v19;
        v21 = [v9 stringValueCandidates];
        unint64_t v22 = [v21 count];
      }
      while (v19 < v22);
    }
    v23 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];
    [v11 setCandidates:v23];
  }
  [v11 setNumberOfLines:0];

  return v11;
}

+ (id)characterWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 imageSize:(uint64_t)a5 confidenceThresholdProvider:(void *)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = self;
  unint64_t v13 = [v11 selectedLocale];
  v14 = [v10 thresholdsForTextRegion:v11 withLocale:v13];

  objc_super v15 = [v11 candidateProbs];
  v16 = [v15 objectAtIndexedSubscript:a5];
  [v16 doubleValue];
  uint64_t v17 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v14);

  uint64_t v18 = [CRNormalizedQuad alloc];
  [v11 topLeft];
  double v20 = v19;
  double v22 = v21;
  [v11 topRight];
  double v24 = v23;
  double v26 = v25;
  [v11 bottomRight];
  double v28 = v27;
  double v30 = v29;
  [v11 bottomLeft];
  v33 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v18, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v20, v22, v24, v26, v28, v30, v31, v32, *(void *)&a1, *(void *)&a2);
  v34 = [v11 stringValueCandidates];
  v35 = [v34 objectAtIndexedSubscript:a5];
  [v11 baselineAngle];
  v37 = [v12 characterWithText:v35 confidence:v17 quad:v33 baselineAngle:v36];

  v38 = [v11 candidateProbs];
  v39 = [v38 objectAtIndexedSubscript:a5];
  [v39 floatValue];
  objc_msgSend(v37, "setRawConfidence:");

  v40 = [v11 candidateActivationProbs];
  v41 = [v40 objectAtIndexedSubscript:a5];
  [v41 floatValue];
  [v37 setActivationProbability:v42];

  v43 = [v11 selectedLocale];
  [v37 setRecognizedLocale:v43];

  v44 = [v11 uuid];

  [v37 setUuid:v44];
  [v37 setNumberOfLines:0];

  return v37;
}

+ (id)characterWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  v24[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [(CROutputRegion *)[CRCharacterOutputRegion alloc] initWithConfidence:v7 baselineAngle:a6];
  [(CROutputRegion *)v11 setText:v10];

  [(CROutputRegion *)v11 setBoundingQuad:v9];
  [v9 bottomLeft];
  v24[0] = v12;
  v24[1] = v13;
  [v9 bottomRight];
  v24[2] = v14;
  v24[3] = v15;
  v16 = [CRNormalizedPolyline alloc];
  [v9 normalizationSize];
  double v18 = v17;
  double v20 = v19;

  double v22 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v16, "initWithNormalizedPoints:count:size:", v24, 2, v18, v20);
  if (v11) {
    objc_setProperty_atomic(v11, v21, v22, 336);
  }

  [(CROutputRegion *)v11 setNumberOfLines:0];
  return v11;
}

- (id)contentBaselines
{
  v2 = self;
  v7[1] = *(id *)MEMORY[0x1E4F143B8];
  if (self)
  {
    if (objc_getProperty(self, a2, 336, 1))
    {
      v7[0] = objc_getProperty(v2, v3, 336, 1);
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = v7[0];
      v2 = [v4 arrayWithObjects:v7 count:1];
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)computesBoundsFromChildren
{
  return 0;
}

- (BOOL)computesTranscriptFromChildren
{
  return 0;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (unint64_t)type
{
  return 32;
}

- (id)joiningDelimiter
{
  return &stru_1F38EED68;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRCharacterOutputRegion *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)CRCharacterOutputRegion;
      if ([(CROutputRegion *)&v13 isEqual:v5])
      {
        if (self) {
          id Property = objc_getProperty(self, v6, 336, 1);
        }
        else {
          id Property = 0;
        }
        id v9 = Property;
        if (v5) {
          id v10 = objc_getProperty(v5, v8, 336, 1);
        }
        else {
          id v10 = 0;
        }
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CRCharacterOutputRegion;
  id v7 = [(CROutputRegion *)&v12 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  id v9 = v7;
  if (!self)
  {
    id Property = 0;
    if (!v7) {
      return v9;
    }
    goto LABEL_3;
  }
  id Property = objc_getProperty(self, v8, 336, 1);
  if (v9) {
LABEL_3:
  }
    objc_setProperty_atomic(v9, v8, Property, 336);
  return v9;
}

- (void).cxx_destruct
{
}

@end