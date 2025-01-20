@interface CRImageReaderOutput
+ (BOOL)supportsSecureCoding;
+ (id)outputWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5;
+ (int)confidenceLevelForConfidenceScore:(double)a3 confidenceThresholds:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImageReaderOutput:(id)a3;
- (BOOL)isTitle;
- (CGPoint)_rotatePointIfNeccessary:(CGPoint)a3 anchor:(CGPoint)a4 angle:(double)a5;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (CGSize)imageSize;
- (CRImageReaderOutput)initWithCoder:(id)a3;
- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5;
- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5 withCandidates:(BOOL)a6;
- (NSArray)candidates;
- (NSArray)components;
- (NSString)stringValue;
- (NSString)type;
- (float)baselineAngle;
- (id)boundingQuad;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cornersForCharacterRange:(_NSRange)a3 error:(id *)a4;
- (id)crCodableDataRepresentation;
- (id)decodeOutputsArrayFromData:(id)a3 offset:(unint64_t *)a4 version:(int64_t)a5;
- (id)initV1WithCoder:(id)a3;
- (id)initV2WithDataRepresentation:(id)a3;
- (id)quadForCharacterRange:(_NSRange)a3 error:(id *)a4;
- (int)confidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBaselineAngle:(float)a3;
- (void)setConfidence:(int)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setIsTitle:(BOOL)a3;
- (void)setStringValue:(id)a3;
@end

@implementation CRImageReaderOutput

- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5
{
  return [(CRImageReaderOutput *)self initWithType:a3 outputRegion:a4 isTitle:a5 withCandidates:1];
}

- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5 withCandidates:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v71.receiver = self;
  v71.super_class = (Class)CRImageReaderOutput;
  v13 = [(CRImageReaderOutput *)&v71 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    if (v12)
    {
      uint64_t v15 = [v12 text];
      stringValue = v14->_stringValue;
      v14->_stringValue = (NSString *)v15;

      v14->_confidence = [v12 confidence];
      v17 = [v12 boundingQuad];
      [v17 boundingBox];
      v14->_boundingBox.origin.x = v18;
      v14->_boundingBox.origin.y = v19;
      v14->_boundingBox.size.width = v20;
      v14->_boundingBox.size.height = v21;

      v22 = [v12 boundingQuad];
      [v22 topLeft];
      v14->_topLeft.x = v23;
      v14->_topLeft.y = v24;

      v25 = [v12 boundingQuad];
      [v25 topRight];
      v14->_topRight.x = v26;
      v14->_topRight.y = v27;

      v28 = [v12 boundingQuad];
      [v28 bottomRight];
      v14->_bottomRight.x = v29;
      v14->_bottomRight.y = v30;

      v31 = [v12 boundingQuad];
      [v31 bottomLeft];
      v14->_bottomLeft.x = v32;
      v14->_bottomLeft.y = v33;

      v34 = [v12 boundingQuad];
      [v34 baselineAngle];
      *(float *)&double v35 = v35;
      v14->_baselineAngle = *(float *)&v35;

      v36 = [v12 boundingQuad];
      [v36 normalizationSize];
      v14->_imageSize.width = v37;
      v14->_imageSize.height = v38;

      v14->_isTitle = v7;
      v39 = [v12 contentsWithTypes:48];
      id v62 = v12;
      if ([v39 count])
      {
        BOOL v61 = v6;
        v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v41 = v39;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v68 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = [[CRImageReaderOutput alloc] initWithType:v11 outputRegion:*(void *)(*((void *)&v67 + 1) + 8 * i) isTitle:0];
              [v40 addObject:v46];
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v67 objects:v73 count:16];
          }
          while (v43);
        }

        uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithArray:v40];
        components = v14->_components;
        v14->_components = (NSArray *)v47;

        id v12 = v62;
        BOOL v6 = v61;
      }
      if (v6)
      {
        v49 = (void *)MEMORY[0x1E4F1CA48];
        v50 = [v12 candidates];
        v51 = objc_msgSend(v49, "arrayWithCapacity:", objc_msgSend(v50, "count"));

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v52 = [v12 candidates];
        uint64_t v53 = [v52 countByEnumeratingWithState:&v63 objects:v72 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v54; ++j)
            {
              if (*(void *)v64 != v55) {
                objc_enumerationMutation(v52);
              }
              v57 = [[CRImageReaderOutput alloc] initWithType:v11 outputRegion:*(void *)(*((void *)&v63 + 1) + 8 * j) isTitle:v7 withCandidates:0];
              [v51 addObject:v57];
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v63 objects:v72 count:16];
          }
          while (v54);
        }

        uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithArray:v51];
        candidates = v14->_candidates;
        v14->_candidates = (NSArray *)v58;

        id v12 = v62;
      }
    }
  }

  return v14;
}

+ (id)outputWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CRImageReaderOutput alloc] initWithType:v8 outputRegion:v7 isTitle:v5];

  return v9;
}

+ (int)confidenceLevelForConfidenceScore:(double)a3 confidenceThresholds:(id)a4
{
  id v5 = a4;
  [v5 mediumConfidenceThreshold];
  double v7 = v6;
  [v5 highConfidenceThreshold];
  float v9 = v8;

  if (v9 > a3) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  if (v7 <= a3) {
    return v10;
  }
  else {
    return 0;
  }
}

- (id)boundingQuad
{
  v3 = [CRNormalizedQuad alloc];
  [(CRImageReaderOutput *)self topLeft];
  double v5 = v4;
  double v7 = v6;
  [(CRImageReaderOutput *)self topRight];
  double v9 = v8;
  double v11 = v10;
  [(CRImageReaderOutput *)self bottomRight];
  double v13 = v12;
  double v15 = v14;
  [(CRImageReaderOutput *)self bottomLeft];
  double v17 = v16;
  double v19 = v18;
  [(CRImageReaderOutput *)self imageSize];
  v22 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v3, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v5, v7, v9, v11, v13, v15, v17, v19, v20, v21);
  return v22;
}

- (id)cornersForCharacterRange:(_NSRange)a3 error:(id *)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  double v4 = -[CRImageReaderOutput quadForCharacterRange:error:](self, "quadForCharacterRange:error:", a3.location, a3.length, a4);
  double v5 = v4;
  if (v4)
  {
    double v6 = (void *)MEMORY[0x1E4F29238];
    [v4 topLeft];
    double v7 = objc_msgSend(v6, "valueWithPoint:");
    v16[0] = v7;
    double v8 = (void *)MEMORY[0x1E4F29238];
    [v5 topRight];
    double v9 = objc_msgSend(v8, "valueWithPoint:");
    v16[1] = v9;
    double v10 = (void *)MEMORY[0x1E4F29238];
    [v5 bottomRight];
    double v11 = objc_msgSend(v10, "valueWithPoint:");
    v16[2] = v11;
    double v12 = (void *)MEMORY[0x1E4F29238];
    [v5 bottomLeft];
    double v13 = objc_msgSend(v12, "valueWithPoint:");
    v16[3] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)quadForCharacterRange:(_NSRange)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_25;
  }
  NSUInteger location = a3.location;
  NSUInteger v7 = a3.location + a3.length;
  double v8 = [(CRImageReaderOutput *)self stringValue];
  if (v7 > [v8 length])
  {

LABEL_25:
    if (a4)
    {
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53[0] = @"Invalid input range.";
      CGFloat v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      *a4 = [v36 errorWithDomain:@"CRImageReaderOutputErrorDomain" code:-1 userInfo:v37];
    }
    CGFloat v38 = 0;
    goto LABEL_28;
  }
  double v9 = [(CRImageReaderOutput *)self components];
  uint64_t v10 = [v9 count];

  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  double v12 = (void *)v11;
  if (!v7)
  {
    v40 = 0;
    goto LABEL_37;
  }
  NSUInteger v13 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  unint64_t v14 = 0;
  char v45 = 0;
  uint64_t v51 = 0;
  NSUInteger v47 = v7;
  v48 = (void *)v11;
  NSUInteger v46 = location;
  while (1)
  {
    double v15 = [(CRImageReaderOutput *)self stringValue];
    char v16 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", v13));

    if ((v16 & 1) == 0) {
      break;
    }
LABEL_23:
    if (++v13 == v7) {
      goto LABEL_33;
    }
  }
  double v17 = [(CRImageReaderOutput *)self components];
  unint64_t v18 = [v17 count];

  if (v14 >= v18) {
    goto LABEL_33;
  }
  double v19 = [(CRImageReaderOutput *)self components];
  uint64_t v20 = [v19 objectAtIndexedSubscript:v14];

  uint64_t v21 = [v20 stringValue];
  v22 = [v21 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];

  if (v51 - v50 >= (unint64_t)[v22 length])
  {
    unint64_t v23 = v14 + 1;
    while (1)
    {
      unint64_t v14 = v23;
      CGFloat v24 = [(CRImageReaderOutput *)self components];
      unint64_t v25 = [v24 count];

      if (v14 >= v25) {
        break;
      }
      CGFloat v26 = [(CRImageReaderOutput *)self components];
      CGFloat v27 = [v26 objectAtIndexedSubscript:v14];

      v28 = [v27 stringValue];
      CGFloat v29 = [v28 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];

      uint64_t v30 = [v29 length];
      unint64_t v23 = v14 + 1;
      v22 = v29;
      uint64_t v20 = v27;
      if (v30)
      {
        uint64_t v20 = v27;
        v22 = v29;
        break;
      }
    }
    uint64_t v50 = v51;
  }
  v31 = [(CRImageReaderOutput *)self components];
  unint64_t v32 = [v31 count];

  if (v14 < v32)
  {
    if (v13 >= location)
    {
      CGFloat v33 = [v20 boundingQuad];
      v34 = v33;
      if (v49)
      {
        [(CRImageReaderOutput *)self baselineAngle];
        uint64_t v35 = -[CRNormalizedQuad unionWithNormalizedQuad:baselineAngle:](v49, "unionWithNormalizedQuad:baselineAngle:", v34);

        v49 = (CRNormalizedQuad *)v35;
      }
      else
      {
        v49 = v33;
        char v45 = 1;
      }

      double v12 = v48;
      NSUInteger location = v46;
    }
    else
    {
      double v12 = v48;
    }
    NSUInteger v7 = v47;
    ++v51;

    goto LABEL_23;
  }

  double v12 = v48;
LABEL_33:
  if (v45)
  {
    v40 = v49;
    if (v49)
    {
      id v41 = v49;
      v40 = v41;
      goto LABEL_38;
    }
  }
  else
  {
    v40 = v49;
  }
LABEL_37:
  uint64_t v42 = [CRNormalizedQuad alloc];
  [(CRImageReaderOutput *)self imageSize];
  id v41 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v42, "initWithNormalizedBoundingBox:size:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v43, v44);
LABEL_38:
  CGFloat v38 = v41;

LABEL_28:
  return v38;
}

- (CGPoint)_rotatePointIfNeccessary:(CGPoint)a3 anchor:(CGPoint)a4 angle:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  if (fabs(a5) > 0.05)
  {
    double v7 = a4.y;
    double v8 = a4.x;
    __double2 v9 = __sincos_stret(a5);
    float v10 = (x - v8) * v9.__cosval - (y - v7) * v9.__sinval;
    float v11 = (y - v7) * v9.__cosval + (x - v8) * v9.__sinval;
    double x = v8 + v10;
    double y = v7 + v11;
  }
  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  double v5 = +[CRImageReaderOutput allocWithZone:](CRImageReaderOutput, "allocWithZone:");
  double v6 = [(CRImageReaderOutput *)self type];
  uint64_t v7 = [(CRImageReaderOutput *)v5 initWithType:v6 outputRegion:0 isTitle:[(CRImageReaderOutput *)self isTitle]];

  double v8 = [(CRImageReaderOutput *)self stringValue];
  uint64_t v9 = [v8 copyWithZone:a3];
  float v10 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v9;

  *(_DWORD *)(v7 + 12) = [(CRImageReaderOutput *)self confidence];
  [(CRImageReaderOutput *)self boundingBox];
  *(void *)(v7 + 136) = v11;
  *(void *)(v7 + 144) = v12;
  *(void *)(v7 + 152) = v13;
  *(void *)(v7 + 160) = v14;
  [(CRImageReaderOutput *)self topLeft];
  *(void *)(v7 + 56) = v15;
  *(void *)(v7 + 64) = v16;
  [(CRImageReaderOutput *)self topRight];
  *(void *)(v7 + 72) = v17;
  *(void *)(v7 + 80) = v18;
  [(CRImageReaderOutput *)self bottomRight];
  *(void *)(v7 + 88) = v19;
  *(void *)(v7 + 96) = v20;
  [(CRImageReaderOutput *)self bottomLeft];
  *(void *)(v7 + 104) = v21;
  *(void *)(v7 + 112) = v22;
  [(CRImageReaderOutput *)self baselineAngle];
  *(_DWORD *)(v7 + 16) = v23;
  [(CRImageReaderOutput *)self imageSize];
  *(void *)(v7 + 120) = v24;
  *(void *)(v7 + 128) = v25;
  CGFloat v26 = [(CRImageReaderOutput *)self components];

  if (v26)
  {
    CGFloat v27 = (void *)MEMORY[0x1E4F1CA48];
    v28 = [(CRImageReaderOutput *)self components];
    CGFloat v29 = objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v30 = [(CRImageReaderOutput *)self components];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v34) copyWithZone:a3];
          [v29 addObject:v35];

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v32);
    }

    v36 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v29;
  }
  CGFloat v37 = [(CRImageReaderOutput *)self candidates];

  if (v37)
  {
    CGFloat v38 = (void *)MEMORY[0x1E4F1CA48];
    v39 = [(CRImageReaderOutput *)self candidates];
    v40 = objc_msgSend(v38, "arrayWithCapacity:", objc_msgSend(v39, "count"));

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v41 = [(CRImageReaderOutput *)self candidates];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v50;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v50 != v44) {
            objc_enumerationMutation(v41);
          }
          NSUInteger v46 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v45) copyWithZone:a3];
          [v40 addObject:v46];

          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v43);
    }

    NSUInteger v47 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v40;
  }
  return (id)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:2 forKey:@"CROutputEncodingVersion"];
  id v6 = [(CRImageReaderOutput *)self crCodableDataRepresentation];
  double v5 = compressData(v6);
  [v4 encodeObject:v5 forKey:@"CROutputEncodingData"];
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), @"CROutputEncodingUncompressedDataSize");
}

- (id)crCodableDataRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(CRImageReaderOutput *)self type];
  +[CRCodingUtilities appendCodable:v4 toData:v3];

  double v5 = [(CRImageReaderOutput *)self stringValue];
  +[CRCodingUtilities appendCodable:v5 toData:v3];

  +[CRCodingUtilities appendInteger:[(CRImageReaderOutput *)self confidence] toData:v3];
  [(CRImageReaderOutput *)self boundingBox];
  +[CRCodingUtilities appendRect:toData:](CRCodingUtilities, "appendRect:toData:", v3);
  [(CRImageReaderOutput *)self topLeft];
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  [(CRImageReaderOutput *)self topRight];
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  [(CRImageReaderOutput *)self bottomRight];
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  [(CRImageReaderOutput *)self bottomLeft];
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  [(CRImageReaderOutput *)self imageSize];
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3);
  +[CRCodingUtilities appendBool:[(CRImageReaderOutput *)self isTitle] toData:v3];
  [(CRImageReaderOutput *)self baselineAngle];
  +[CRCodingUtilities appendFloat:toData:](CRCodingUtilities, "appendFloat:toData:", v3);
  id v6 = [(CRImageReaderOutput *)self components];
  +[CRCodingUtilities appendCodable:v6 toData:v3];

  uint64_t v7 = [(CRImageReaderOutput *)self candidates];
  +[CRCodingUtilities appendCodable:v7 toData:v3];

  return v3;
}

- (CRImageReaderOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"CROutputEncodingVersion"] == 2)
  {
    double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CROutputEncodingData"];
    id v6 = uncompressDataOfSize(v5, [v4 decodeIntegerForKey:@"CROutputEncodingUncompressedDataSize"]);
    uint64_t v7 = (CRImageReaderOutput *)[(CRImageReaderOutput *)self initV2WithDataRepresentation:v6];
  }
  else
  {
    uint64_t v7 = (CRImageReaderOutput *)[(CRImageReaderOutput *)self initV1WithCoder:v4];
  }

  return v7;
}

- (id)initV1WithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CRImageReaderOutput;
  double v5 = [(CRImageReaderOutput *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CROutputType"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    if ([v4 containsValueForKey:@"CROutputStringValue"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CROutputStringValue"];
      stringValue = v5->_stringValue;
      v5->_stringValue = (NSString *)v8;
    }
    v5->_confidence = [v4 decodeInt32ForKey:@"CROutputConfidence"];
    [v4 decodeRectForKey:@"CROutputBoundingBox"];
    v5->_boundingBox.origin.double x = v10;
    v5->_boundingBox.origin.double y = v11;
    v5->_boundingBox.size.width = v12;
    v5->_boundingBox.size.height = v13;
    [v4 decodePointForKey:@"CROutputTopLeft"];
    v5->_topLeft.double x = v14;
    v5->_topLeft.double y = v15;
    [v4 decodePointForKey:@"CROutputTopRight"];
    v5->_topRight.double x = v16;
    v5->_topRight.double y = v17;
    [v4 decodePointForKey:@"CROutputBottomRight"];
    v5->_bottomRight.double x = v18;
    v5->_bottomRight.double y = v19;
    [v4 decodePointForKey:@"CROutputBottomLeft"];
    v5->_bottomLeft.double x = v20;
    v5->_bottomLeft.double y = v21;
    [v4 decodeSizeForKey:@"CROutputImageSize"];
    v5->_imageSize.width = v22;
    v5->_imageSize.height = v23;
    v5->_isTitle = [v4 decodeBoolForKey:@"CROutputIsTitle"];
    [v4 decodeFloatForKey:@"CROutputBaselineAngle"];
    v5->_baselineAngle = v24;
    if ([v4 containsValueForKey:@"CROutputComponents"])
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v26 = objc_opt_class();
      CGFloat v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
      uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"CROutputComponents"];
      components = v5->_components;
      v5->_components = (NSArray *)v28;
    }
    if ([v4 containsValueForKey:@"CROutputCandidatesKey"])
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v31 = objc_opt_class();
      uint64_t v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
      uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"CROutputCandidatesKey"];
      candidates = v5->_candidates;
      v5->_candidates = (NSArray *)v33;
    }
  }

  return v5;
}

- (id)initV2WithDataRepresentation:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRImageReaderOutput;
  double v5 = [(CRImageReaderOutput *)&v31 init];
  if (v5)
  {
    uint64_t v30 = 0;
    uint64_t v6 = +[CRCodingUtilities stringFromEncodingData:v4 offset:&v30];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = +[CRCodingUtilities stringFromEncodingData:v4 offset:&v30];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    v5->_confidence = +[CRCodingUtilities integerFromEncodingData:v4 offset:&v30];
    +[CRCodingUtilities rectFromEncodingData:v4 offset:&v30];
    v5->_boundingBox.origin.double x = v10;
    v5->_boundingBox.origin.double y = v11;
    v5->_boundingBox.size.width = v12;
    v5->_boundingBox.size.height = v13;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v30];
    v5->_topLeft.double x = v14;
    v5->_topLeft.double y = v15;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v30];
    v5->_topRight.double x = v16;
    v5->_topRight.double y = v17;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v30];
    v5->_bottomRight.double x = v18;
    v5->_bottomRight.double y = v19;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v30];
    v5->_bottomLeft.double x = v20;
    v5->_bottomLeft.double y = v21;
    +[CRCodingUtilities sizeFromEncodingData:v4 offset:&v30];
    v5->_imageSize.width = v22;
    v5->_imageSize.height = v23;
    v5->_isTitle = +[CRCodingUtilities BOOLFromEncodingData:v4 offset:&v30];
    +[CRCodingUtilities floatFromEncodingData:v4 offset:&v30];
    v5->_baselineAngle = v24;
    uint64_t v25 = [(CRImageReaderOutput *)v5 decodeOutputsArrayFromData:v4 offset:&v30 version:2];
    components = v5->_components;
    v5->_components = (NSArray *)v25;

    uint64_t v27 = [(CRImageReaderOutput *)v5 decodeOutputsArrayFromData:v4 offset:&v30 version:2];
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v27;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToImageReaderOutput:(id)a3
{
  id v4 = a3;
  int v5 = [(CRImageReaderOutput *)self confidence];
  if (v5 != [v4 confidence]) {
    goto LABEL_11;
  }
  [(CRImageReaderOutput *)self boundingBox];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v4 boundingBox];
  double v18 = vabdd_f64(v13, v17);
  if (vabdd_f64(v11, v16) > 4.4408921e-16 || v18 > 4.4408921e-16) {
    goto LABEL_11;
  }
  double v20 = vabdd_f64(v9, v15);
  if (vabdd_f64(v7, v14) > 4.4408921e-16 || v20 > 4.4408921e-16) {
    goto LABEL_11;
  }
  [(CRImageReaderOutput *)self topLeft];
  double v25 = v24;
  double v27 = v26;
  [v4 topLeft];
  char v22 = 0;
  if (v25 == v28 && v27 == v29)
  {
    [(CRImageReaderOutput *)self topRight];
    double v31 = v30;
    double v33 = v32;
    [v4 topRight];
    char v22 = 0;
    if (v31 == v35 && v33 == v34)
    {
      [(CRImageReaderOutput *)self bottomRight];
      double v37 = v36;
      double v39 = v38;
      [v4 bottomRight];
      char v22 = 0;
      if (v37 == v41 && v39 == v40)
      {
        [(CRImageReaderOutput *)self bottomLeft];
        double v43 = v42;
        double v45 = v44;
        [v4 bottomLeft];
        char v22 = 0;
        if (v43 == v47 && v45 == v46)
        {
          [(CRImageReaderOutput *)self baselineAngle];
          float v49 = v48;
          [v4 baselineAngle];
          if (v49 != v50) {
            goto LABEL_11;
          }
          int v51 = [(CRImageReaderOutput *)self isTitle];
          if (v51 != [v4 isTitle]) {
            goto LABEL_11;
          }
          long long v52 = [(CRImageReaderOutput *)self type];
          long long v53 = [v4 type];
          uint64_t v54 = [v52 isEqualToString:v53];

          if (!v54) {
            goto LABEL_11;
          }
          long long v55 = [(CRImageReaderOutput *)self stringValue];
          if (v55 || ([v4 stringValue], (long long v53 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            long long v56 = [(CRImageReaderOutput *)self stringValue];
            v57 = [v4 stringValue];
            uint64_t v54 = [v56 isEqualToString:v57];

            if (v55)
            {

              if (!v54) {
                goto LABEL_11;
              }
            }
            else
            {

              if ((v54 & 1) == 0) {
                goto LABEL_11;
              }
            }
          }
          uint64_t v58 = [(CRImageReaderOutput *)self components];
          if (!v58)
          {
            long long v53 = [v4 components];
            if (!v53) {
              goto LABEL_36;
            }
          }
          uint64_t v59 = [(CRImageReaderOutput *)self components];
          v60 = [v4 components];
          uint64_t v54 = [v59 isEqualToArray:v60];

          if (v58)
          {

            if (v54) {
              goto LABEL_36;
            }
            goto LABEL_11;
          }

          if (v54)
          {
LABEL_36:
            BOOL v61 = [(CRImageReaderOutput *)self candidates];
            if (v61 || ([v4 candidates], (uint64_t v54 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v62 = [(CRImageReaderOutput *)self candidates];
              long long v63 = [v4 candidates];
              char v22 = [v62 isEqualToArray:v63];

              if (v61)
              {
LABEL_42:

                goto LABEL_12;
              }
            }
            else
            {
              char v22 = 1;
            }

            goto LABEL_42;
          }
LABEL_11:
          char v22 = 0;
        }
      }
    }
  }
LABEL_12:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRImageReaderOutput *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CRImageReaderOutput *)self isEqualToImageReaderOutput:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(CRImageReaderOutput *)self stringValue];
  uint64_t v4 = [v3 hash];
  int v5 = [(CRImageReaderOutput *)self components];
  uint64_t v6 = [v5 hash] ^ v4;
  double v7 = [(CRImageReaderOutput *)self candidates];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)decodeOutputsArrayFromData:(id)a3 offset:(unint64_t *)a4 version:(int64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CRImageReaderOutput_decodeOutputsArrayFromData_offset_version___block_invoke;
  v7[3] = &__block_descriptor_40_e37___NSObject_CRCodable__16__0__NSData_8l;
  v7[4] = a5;
  int v5 = +[CRCodingUtilities arrayFromEncodingData:a3 offset:a4 objectProviderBlock:v7];
  return v5;
}

id __65__CRImageReaderOutput_decodeOutputsArrayFromData_offset_version___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 2)
  {
    id v2 = a2;
    id v3 = [[CRImageReaderOutput alloc] initV2WithDataRepresentation:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStringValue:(id)a3
{
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPoint)topLeft
{
  objc_copyStruct(v4, &self->_topLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)topRight
{
  objc_copyStruct(v4, &self->_topRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  objc_copyStruct(v4, &self->_bottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  objc_copyStruct(v4, &self->_bottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)components
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (float)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(float)a3
{
  self->_baselineAngle = a3;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end