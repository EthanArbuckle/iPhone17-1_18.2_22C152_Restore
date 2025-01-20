@interface CRDataDetectorsOutputRegion
+ (id)outputRegionWithDDResult:(id)a3 children:(id)a4 locale:(id)a5;
+ (id)outputRegionWithDataType:(unint64_t)a3 ddResult:(id)a4 children:(id)a5 locale:(id)a6;
- (BOOL)computesBoundsFromChildren;
- (BOOL)computesTranscriptFromChildren;
- (BOOL)contributesToDocumentHierarchy;
- (BOOL)isEqual:(id)a3;
- (CRDataDetectorsOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (DDScannerResult)ddResult;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)debugDescription;
- (unint64_t)dataType;
- (unint64_t)type;
@end

@implementation CRDataDetectorsOutputRegion

- (CRDataDetectorsOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRDataDetectorsOutputRegion;
  v9 = [(CROutputRegion *)&v13 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    v9->_dataType = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
    uint64_t v10 = +[CRCodingUtilities ddScannerResultFromEncodingData:v8 offset:a5];
    ddResult = v9->_ddResult;
    v9->_ddResult = (DDScannerResult *)v10;
  }
  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v8.receiver = self;
  v8.super_class = (Class)CRDataDetectorsOutputRegion;
  v4 = [(CROutputRegion *)&v8 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendUInteger:[(CRDataDetectorsOutputRegion *)self dataType] toData:v5];
  v6 = [(CRDataDetectorsOutputRegion *)self ddResult];
  +[CRCodingUtilities appendCodable:v6 toData:v5];

  return v5;
}

+ (id)outputRegionWithDataType:(unint64_t)a3 ddResult:(id)a4 children:(id)a5 locale:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    LODWORD(v15) = 2;
    double v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v18 baselineAngle];
        double v20 = v19;
        if ([v18 confidence])
        {
          int v21 = [v18 confidence];
          if (v15 == 2 && v21 == 1) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = v15;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        double v16 = v16 + v20;
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v15 = 2;
    double v16 = 0.0;
  }
  v23 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRDataDetectorsOutputRegion alloc], "initWithConfidence:baselineAngle:", v15, v16 / (double)(unint64_t)[v10 count]);
  v25 = v23;
  if (v23)
  {
    v23->_dataType = a3;
    objc_setProperty_atomic(v23, v24, v9, 344);
  }
  [(CROutputRegion *)v25 setChildren:v10];
  [(CROutputRegion *)v25 setRecognizedLocale:v11];

  return v25;
}

+ (id)outputRegionWithDDResult:(id)a3 children:(id)a4 locale:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_class();
  id v11 = v9;
  self;
  uint64_t v12 = 3;
  switch([v11 category])
  {
    case 1u:
      uint64_t v13 = [v11 type];
      int v14 = [v13 isEqualToString:*MEMORY[0x1E4F5EFF8]];

      if (v14) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      break;
    case 2u:
      break;
    case 3u:
      uint64_t v12 = 4;
      break;
    case 4u:
      uint64_t v12 = 5;
      break;
    case 6u:
      uint64_t v12 = 6;
      break;
    case 7u:
      uint64_t v12 = 10;
      break;
    default:
      uint64_t v15 = [v11 type];
      char v16 = [v15 isEqualToString:@"FlightInformation"];

      if (v16)
      {
        uint64_t v12 = 7;
      }
      else
      {
        v17 = [v11 type];
        char v18 = [v17 isEqualToString:@"TrackingNumber"];

        if (v18)
        {
          uint64_t v12 = 8;
        }
        else
        {
          double v19 = [v11 type];
          int v20 = [v19 isEqualToString:@"PhysicalAmount"];

          if (v20) {
            uint64_t v12 = 9;
          }
          else {
            uint64_t v12 = 0;
          }
        }
      }
      break;
  }

  int v21 = [v10 outputRegionWithDataType:v12 ddResult:v11 children:v8 locale:v7];

  return v21;
}

- (BOOL)computesBoundsFromChildren
{
  return 1;
}

- (BOOL)computesTranscriptFromChildren
{
  return 1;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(CRDataDetectorsOutputRegion *)self dataType];
  id v7 = [(CRDataDetectorsOutputRegion *)self ddResult];
  uint64_t v8 = [v7 category];
  id v9 = [(CRDataDetectorsOutputRegion *)self ddResult];
  id v10 = [v9 matchedString];
  id v11 = [(CROutputRegion *)self recognizedLocale];
  uint64_t v12 = [v3 stringWithFormat:@"[%@] dataType:%lu category:%d matchedString:'%@' locale:%@", v5, v6, v8, v10, v11];

  return v12;
}

- (unint64_t)type
{
  return 2048;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRDataDetectorsOutputRegion *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)CRDataDetectorsOutputRegion;
      if ([(CROutputRegion *)&v11 isEqual:v5]
        && (unint64_t v6 = [(CRDataDetectorsOutputRegion *)self dataType],
            v6 == [(CRDataDetectorsOutputRegion *)v5 dataType]))
      {
        id v7 = [(CRDataDetectorsOutputRegion *)self ddResult];
        uint64_t v8 = [(CRDataDetectorsOutputRegion *)v5 ddResult];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CRDataDetectorsOutputRegion;
  id v7 = [(CROutputRegion *)&v12 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  unint64_t v8 = [(CRDataDetectorsOutputRegion *)self dataType];
  if (v7)
  {
    v7[42] = v8;
    char v9 = [(CRDataDetectorsOutputRegion *)self ddResult];
    objc_setProperty_atomic(v7, v10, v9, 344);
  }
  else
  {
    char v9 = [(CRDataDetectorsOutputRegion *)self ddResult];
  }

  return v7;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (DDScannerResult)ddResult
{
  return (DDScannerResult *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
}

@end