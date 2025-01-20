@interface CRWordOutputRegion
+ (id)wordWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
+ (id)wordWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
- (BOOL)computesNumberOfLinesFromChildren;
- (BOOL)isEqual:(id)a3;
- (CRWordOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (id)contentBaselines;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)joiningDelimiter;
- (unint64_t)type;
@end

@implementation CRWordOutputRegion

- (CRWordOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRWordOutputRegion;
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
  v9.super_class = (Class)CRWordOutputRegion;
  v4 = [(CROutputRegion *)&v9 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  if (self) {
    id Property = objc_getProperty(self, v6, 336, 1);
  }
  else {
    id Property = 0;
  }
  +[CRCodingUtilities appendCodable:Property toData:v5];
  return v5;
}

+ (id)wordWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  v24[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  v11 = [(CROutputRegion *)[CRWordOutputRegion alloc] initWithConfidence:v7 baselineAngle:a6];
  [(CROutputRegion *)v11 setText:v10];

  [(CROutputRegion *)v11 setBoundingQuad:v9];
  [(CROutputRegion *)v11 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v11 setShouldComputeTranscriptFromChildren:0];
  [(CROutputRegion *)v11 setChildren:0];
  [(CROutputRegion *)v11 setNumberOfLines:0];
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

  v22 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v16, "initWithNormalizedPoints:count:size:", v24, 2, v18, v20);
  if (v11) {
    objc_setProperty_atomic(v11, v21, v22, 336);
  }

  return v11;
}

+ (id)wordWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  v11 = [(CROutputRegion *)[CRWordOutputRegion alloc] initWithConfidence:v7 baselineAngle:a6];
  [(CROutputRegion *)v11 setShouldComputeTranscriptFromChildren:1];
  if (v9)
  {
    [(CROutputRegion *)v11 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v11 setBoundingQuad:v9];
  }
  else
  {
    [(CROutputRegion *)v11 setShouldComputeBoundsFromChildren:1];
  }
  [(CROutputRegion *)v11 setChildren:v10];

  [(CROutputRegion *)v11 setNumberOfLines:0];
  uint64_t v12 = [(CROutputRegion *)v11 boundingQuad];
  [v12 bottomLeft];
  v23[0] = v13;
  v23[1] = v14;
  uint64_t v15 = [(CROutputRegion *)v11 boundingQuad];
  [v15 bottomRight];
  v23[2] = v16;
  v23[3] = v17;

  double v18 = [CRNormalizedPolyline alloc];
  double v19 = [(CROutputRegion *)v11 boundingQuad];
  [v19 normalizationSize];
  v21 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v18, "initWithNormalizedPoints:count:size:", v23, 2);
  if (v11) {
    objc_setProperty_atomic(v11, v20, v21, 336);
  }

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

- (unint64_t)type
{
  return 16;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  return @" ";
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRWordOutputRegion *)a3;
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
      v13.super_class = (Class)CRWordOutputRegion;
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
  v12.super_class = (Class)CRWordOutputRegion;
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