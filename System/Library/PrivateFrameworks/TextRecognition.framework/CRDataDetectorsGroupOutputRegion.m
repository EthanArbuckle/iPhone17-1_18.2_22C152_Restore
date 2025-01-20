@interface CRDataDetectorsGroupOutputRegion
- (BOOL)computesBoundsFromChildren;
- (BOOL)computesTranscriptFromChildren;
- (CRDataDetectorsGroupOutputRegion)initWithDDRegions:(id)a3 children:(id)a4 groupType:(unint64_t)a5;
- (id)debugDescription;
- (unint64_t)groupType;
- (unint64_t)type;
@end

@implementation CRDataDetectorsGroupOutputRegion

- (CRDataDetectorsGroupOutputRegion)initWithDDRegions:(id)a3 children:(id)a4 groupType:(unint64_t)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    double v12 = 0.0;
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v49;
      LODWORD(v15) = 2;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v10);
          }
          v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          [v18 baselineAngle];
          double v16 = v16 + v19;
          unsigned int v20 = [v18 confidence];
          if (v20 >= v15) {
            uint64_t v15 = v15;
          }
          else {
            uint64_t v15 = v20;
          }
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v15 = 2;
      double v16 = 0.0;
    }

    if ([v10 count]) {
      double v12 = v16 / (double)(unint64_t)[v10 count];
    }
    v47.receiver = self;
    v47.super_class = (Class)CRDataDetectorsGroupOutputRegion;
    v22 = [(CROutputRegion *)&v47 initWithConfidence:v15 baselineAngle:v12];
    if (v22)
    {
      id v42 = v9;
      v23 = (void *)[v10 copy];
      [(CROutputRegion *)v22 setChildren:v23];

      v24 = (void *)[v8 copy];
      [(CROutputRegion *)v22 setDataDetectorRegions:v24];

      v22->_groupType = a5;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v25 = [(CROutputRegion *)v22 dataDetectorRegions];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        v28 = 0;
        unint64_t v29 = 0;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v25);
            }
            v32 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            if (v28)
            {
              [v28 baselineAngle];
              double v34 = v33;
              [v32 baselineAngle];
              double v36 = v35 + v34 * (double)v29++;
              double v37 = v36 / (double)v29;
              v38 = [v32 boundingQuad];
              *(float *)&double v39 = v37;
              uint64_t v40 = [v28 unionWithNormalizedQuad:v38 baselineAngle:v39];

              v28 = (void *)v40;
            }
            else
            {
              v28 = [*(id *)(*((void *)&v43 + 1) + 8 * j) boundingQuad];
              ++v29;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }

      [(CROutputRegion *)v22 setBoundingQuad:v28];
      id v9 = v42;
    }
    self = v22;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)debugDescription
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  unint64_t v7 = [(CRDataDetectorsGroupOutputRegion *)self groupType];
  id v8 = [(CROutputRegion *)self dataDetectorRegions];
  uint64_t v9 = [v8 count];
  id v10 = [(CROutputRegion *)self children];
  uint64_t v11 = [v4 stringWithFormat:@"[%@] type:%lu #DD:%lu #Non-DD:%lu", v6, v7, v9, objc_msgSend(v10, "count")];
  [v3 addObject:v11];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v12 = [(CROutputRegion *)self dataDetectorRegions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = NSString;
        v18 = [*(id *)(*((void *)&v34 + 1) + 8 * i) debugDescription];
        double v19 = [v17 stringWithFormat:@"- DD: %@", v18];
        [v3 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unsigned int v20 = [(CROutputRegion *)self dataDetectorRegions];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = NSString;
        uint64_t v26 = [*(id *)(*((void *)&v30 + 1) + 8 * j) debugDescription];
        uint64_t v27 = [v25 stringWithFormat:@"- Non-DD: %@", v26];
        [v3 addObject:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v22);
  }

  v28 = [v3 componentsJoinedByString:@"\n"];

  return v28;
}

- (unint64_t)type
{
  return 4096;
}

- (BOOL)computesBoundsFromChildren
{
  return 1;
}

- (BOOL)computesTranscriptFromChildren
{
  return 1;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

@end