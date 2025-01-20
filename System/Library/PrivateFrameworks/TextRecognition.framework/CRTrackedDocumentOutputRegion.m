@interface CRTrackedDocumentOutputRegion
+ (CRBlockOutputRegion)_blockFromRegion:(uint64_t)a3 trackedType:;
+ (CRBlockOutputRegion)_blockFromTrackedRegionGroup:(uint64_t)a3 trackedType:;
+ (id)documentWithTrackedRegionGroups:(id)a3;
+ (id)documentWithTrackedRegions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
@end

@implementation CRTrackedDocumentOutputRegion

+ (CRBlockOutputRegion)_blockFromTrackedRegionGroup:(uint64_t)a3 trackedType:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  self;
  v4 = [MEMORY[0x1E4F28E78] string];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v5 = v3;
  v6 = [v3 children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v45;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v6);
        }
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v15 = [v14 numberOfLines];
        [v14 baselineAngle];
        double v17 = v16;
        if (v11 == 0.0)
        {
          double v12 = v16;
        }
        else
        {
          __double2 v18 = __sincos_stret(v12);
          __double2 v19 = __sincos_stret(v17);
          double v12 = atan2(v19.__sinval + v18.__sinval * v11, v19.__cosval + v18.__cosval * v11);
        }
        if ([v4 length])
        {
          if ([v5 isInlineGroup]) {
            v20 = @" ";
          }
          else {
            v20 = @"\n";
          }
          [v4 appendString:v20];
        }
        v9 += v15;
        v21 = [v14 text];
        [v4 appendString:v21];

        double v11 = v11 + 1.0;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
    double v12 = 0.0;
  }

  v22 = [CRBlockOutputRegion alloc];
  v23 = [v5 children];
  v24 = [v23 firstObject];
  v25 = -[CROutputRegion initWithConfidence:baselineAngle:](v22, "initWithConfidence:baselineAngle:", [v24 confidence], v12);

  [(CRCompositeOutputRegion *)v25 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v25 setShouldComputeParagraphsFromChildren:0];
  [(CROutputRegion *)v25 setShouldComputeTranscriptFromChildren:0];
  [(CROutputRegion *)v25 setNumberOfLines:v9];
  -[CROutputRegion setTextAlignment:](v25, "setTextAlignment:", [v5 textAlignment]);
  -[CROutputRegion setLayoutDirection:](v25, "setLayoutDirection:", [v5 layoutDirection]);
  [(CROutputRegion *)v25 setText:v4];
  v26 = [v5 boundingQuad];
  [(CROutputRegion *)v25 setBoundingQuad:v26];

  v27 = [v5 originalBoundingQuad];
  [(CROutputRegion *)v25 setOriginalBoundingQuad:v27];

  [v5 boundingQuadHomography];
  -[CROutputRegion setBoundingQuadHomography:](v25, "setBoundingQuadHomography:");
  v28 = [v5 trackingID];
  [(CROutputRegion *)v25 setTrackingID:v28];

  v29 = NSNumber;
  v30 = [v5 vcQuad];
  v31 = objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "homographyGroupID"));
  [(CROutputRegion *)v25 setHomographyGroupID:v31];

  if (a3 == 4)
  {
    [(CROutputRegion *)v25 setChildren:MEMORY[0x1E4F1CBF0]];
    v32 = [v5 children];
    [(CROutputRegion *)v25 setParagraphRegions:v32];

    [(CROutputRegion *)v25 setNumberOfLines:0];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v33 = [v5 children];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          -[CROutputRegion setNumberOfLines:](v25, "setNumberOfLines:", -[CROutputRegion numberOfLines](v25, "numberOfLines")+ [*(id *)(*((void *)&v40 + 1) + 8 * j) numberOfLines]);
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v35);
    }
  }
  else
  {
    v33 = [v5 children];
    [(CROutputRegion *)v25 setChildren:v33];
  }

  return v25;
}

+ (CRBlockOutputRegion)_blockFromRegion:(uint64_t)a3 trackedType:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  v5 = [CRBlockOutputRegion alloc];
  uint64_t v6 = [v4 confidence];
  [v4 baselineAngle];
  uint64_t v7 = -[CROutputRegion initWithConfidence:baselineAngle:](v5, "initWithConfidence:baselineAngle:", v6);
  [(CRCompositeOutputRegion *)v7 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v7 setShouldComputeParagraphsFromChildren:0];
  [(CROutputRegion *)v7 setShouldComputeTranscriptFromChildren:0];
  uint64_t v8 = [v4 children];
  [(CROutputRegion *)v7 setChildren:v8];

  -[CROutputRegion setNumberOfLines:](v7, "setNumberOfLines:", [v4 numberOfLines]);
  -[CROutputRegion setTextAlignment:](v7, "setTextAlignment:", [v4 textAlignment]);
  -[CROutputRegion setLayoutDirection:](v7, "setLayoutDirection:", [v4 layoutDirection]);
  uint64_t v9 = [v4 text];
  [(CROutputRegion *)v7 setText:v9];

  uint64_t v10 = [v4 boundingQuad];
  [(CROutputRegion *)v7 setBoundingQuad:v10];

  double v11 = [v4 originalBoundingQuad];
  [(CROutputRegion *)v7 setOriginalBoundingQuad:v11];

  [v4 boundingQuadHomography];
  -[CROutputRegion setBoundingQuadHomography:](v7, "setBoundingQuadHomography:");
  double v12 = [v4 trackingID];
  [(CROutputRegion *)v7 setTrackingID:v12];

  if (a3 == 4)
  {
    v15[0] = v4;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(CROutputRegion *)v7 setParagraphRegions:v13];
  }
  return v7;
}

+ (id)documentWithTrackedRegionGroups:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CROutputRegion *)[CRTrackedDocumentOutputRegion alloc] initWithConfidence:2 baselineAngle:0.0];
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = [v6 children];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 type];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = +[CRTrackedDocumentOutputRegion _blockFromTrackedRegionGroup:trackedType:]((uint64_t)a1, *(void **)(*((void *)&v18 + 1) + 8 * i), v9);
        objc_msgSend(v10, "addObject:", v16, (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  [(CRDocumentOutputRegion *)v5 setChildren:v10];
  return v5;
}

+ (id)documentWithTrackedRegions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CROutputRegion *)[CRTrackedDocumentOutputRegion alloc] initWithConfidence:2 baselineAngle:0.0];
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = [v6 type];

  if (v7 == 8
    || ([(CROutputRegion *)v5 setShouldComputeParagraphsFromChildren:0],
        v7 != 2))
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = +[CRTrackedDocumentOutputRegion _blockFromRegion:trackedType:]((uint64_t)a1, *(void **)(*((void *)&v17 + 1) + 8 * i), v7);
          objc_msgSend(v9, "addObject:", v15, (void)v17);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    id v8 = (id)[v9 copy];
    [(CRDocumentOutputRegion *)v5 setChildren:v8];
    if (v7 == 4) {
      [(CROutputRegion *)v5 setParagraphRegions:v10];
    }
  }
  else
  {
    id v8 = v4;
    [(CRDocumentOutputRegion *)v5 setChildren:v8];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  BOOL v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CRTrackedDocumentOutputRegion;
  id v8 = [(CRDocumentOutputRegion *)&v25 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  if (v6)
  {
    uint64_t v9 = [(CROutputRegion *)self paragraphRegions];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = [v8 contentsWithTypes:4];
      uint64_t v12 = [v11 count];
      uint64_t v13 = [(CROutputRegion *)self paragraphRegions];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        uint64_t v15 = [(CROutputRegion *)self paragraphRegions];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          unint64_t v17 = 0;
          do
          {
            long long v18 = [(CROutputRegion *)self paragraphRegions];
            long long v19 = [v18 objectAtIndexedSubscript:v17];
            long long v20 = [v19 trackingID];
            long long v21 = [v11 objectAtIndexedSubscript:v17];
            [v21 setTrackingID:v20];

            ++v17;
            uint64_t v22 = [(CROutputRegion *)self paragraphRegions];
            unint64_t v23 = [v22 count];
          }
          while (v23 > v17);
        }
      }
    }
  }
  return v8;
}

@end