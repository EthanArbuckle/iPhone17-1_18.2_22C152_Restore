@interface CRTableOutputRegion
- (BOOL)contributesToDocumentHierarchy;
- (CRTableOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRTableOutputRegion)initWithCells:(id)a3 quad:(id)a4 rowQuads:(id)a5 colQuads:(id)a6;
- (NSArray)colQuads;
- (NSArray)rowQuads;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (unint64_t)type;
- (void)setColQuads:(id)a3;
- (void)setRowQuads:(id)a3;
@end

@implementation CRTableOutputRegion

- (CRTableOutputRegion)initWithCells:(id)a3 quad:(id)a4 rowQuads:(id)a5 colQuads:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(CROutputRegion *)self init];
  if (v14)
  {
    if ([v10 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
        double v19 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v15);
            }
            double v19 = v19
                + (double)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "confidence", (void)v22);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v17);
      }
      else
      {
        double v19 = 0.0;
      }

      -[CROutputRegion setConfidence:](v14, "setConfidence:", (v19 / (double)(unint64_t)[v15 count]));
      [(CROutputRegion *)v14 setChildren:v15];
    }
    objc_msgSend(v11, "baselineAngle", (void)v22);
    -[CROutputRegion setBaselineAngle:](v14, "setBaselineAngle:");
    [(CROutputRegion *)v14 setBoundingQuad:v11];
    [(CROutputRegion *)v14 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v14 setShouldComputeTranscriptFromChildren:1];
    [(CRTableOutputRegion *)v14 setRowQuads:v12];
    [(CRTableOutputRegion *)v14 setColQuads:v13];
  }

  return v14;
}

- (CRTableOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRTableOutputRegion;
  v9 = [(CROutputRegion *)&v13 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    if (a4 >= 3) {
      +[CRCodingUtilities integerFromEncodingData:v8 offset:a5];
    }
    id v10 = +[CRCodingUtilities arrayFromEncodingData:v8 offset:a5 objectProviderBlock:&__block_literal_global_34];
    [(CRTableOutputRegion *)v9 setRowQuads:v10];

    id v11 = +[CRCodingUtilities arrayFromEncodingData:v8 offset:a5 objectProviderBlock:&__block_literal_global_3];
    [(CRTableOutputRegion *)v9 setColQuads:v11];
  }
  return v9;
}

CRNormalizedQuad *__74__CRTableOutputRegion_initWithCRCodableDataRepresentation_version_offset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CRNormalizedQuad alloc] initWithCRCodableDataRepresentation:v2];

  return v3;
}

CRNormalizedQuad *__74__CRTableOutputRegion_initWithCRCodableDataRepresentation_version_offset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CRNormalizedQuad alloc] initWithCRCodableDataRepresentation:v2];

  return v3;
}

- (unint64_t)type
{
  return 64;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v9.receiver = self;
  v9.super_class = (Class)CRTableOutputRegion;
  v4 = [(CROutputRegion *)&v9 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendInteger:1 toData:v5];
  v6 = [(CRTableOutputRegion *)self rowQuads];
  +[CRCodingUtilities appendCodable:v6 toData:v5];

  v7 = [(CRTableOutputRegion *)self colQuads];
  +[CRCodingUtilities appendCodable:v7 toData:v5];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  BOOL v6 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CRTableOutputRegion;
  id v8 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v16, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5);
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v10 = [(CRTableOutputRegion *)self rowQuads];
  id v11 = (void *)[v9 initWithArray:v10 copyItems:v6];
  [v8 setRowQuads:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
  objc_super v13 = [(CRTableOutputRegion *)self colQuads];
  v14 = (void *)[v12 initWithArray:v13 copyItems:v6];
  [v8 setColQuads:v14];

  return v8;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (NSArray)rowQuads
{
  return self->_rowQuads;
}

- (void)setRowQuads:(id)a3
{
}

- (NSArray)colQuads
{
  return self->_colQuads;
}

- (void)setColQuads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colQuads, 0);
  objc_storeStrong((id *)&self->_rowQuads, 0);
}

@end