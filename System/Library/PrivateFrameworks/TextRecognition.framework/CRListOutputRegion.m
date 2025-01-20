@interface CRListOutputRegion
+ (id)listsWithParagraphs:(id)a3;
- (BOOL)contributesToDocumentHierarchy;
- (CRListOutputRegion)initWithListItems:(id)a3;
- (unint64_t)type;
@end

@implementation CRListOutputRegion

- (CRListOutputRegion)initWithListItems:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CROutputRegion *)self init];
  if (v5 && [v4 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v42;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          [v13 baselineAngle];
          double v15 = v14;
          [(CROutputRegion *)v5 baselineAngle];
          double v17 = v15 - v16;
          if (v15 - v16 <= 3.14159265)
          {
            if (v17 <= -3.14159265) {
              double v17 = v17 + 6.28318531;
            }
          }
          else
          {
            double v17 = v17 + -6.28318531;
          }
          double v18 = v16 + v17 * (float)(1.0 / (float)(v9 + i + 1));
          if (v18 <= 3.14159265)
          {
            if (v18 <= -3.14159265) {
              double v18 = v18 + 6.28318531;
            }
          }
          else
          {
            double v18 = v18 + -6.28318531;
          }
          [(CROutputRegion *)v5 setBaselineAngle:v18];
          double v11 = v11 + (double)[v13 confidence];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
        v9 += i;
      }
      while (v8);
    }
    else
    {
      double v11 = 0.0;
    }
    id v32 = v4;

    -[CROutputRegion setConfidence:](v5, "setConfidence:", (v11 / (double)(unint64_t)[v6 count]));
    [(CRCompositeOutputRegion *)v5 setShouldComputeBoundsFromChildren:1];
    [(CROutputRegion *)v5 setShouldComputeTranscriptFromChildren:1];
    [(CROutputRegion *)v5 setChildren:v6];
    v19 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v26 = [v25 paragraphRegions];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v34;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v34 != v29) {
                  objc_enumerationMutation(v26);
                }
                [v19 addObject:*(void *)(*((void *)&v33 + 1) + 8 * k)];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
            }
            while (v28);
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v22);
    }

    [(CROutputRegion *)v5 setParagraphRegions:v19];
    id v4 = v32;
  }

  return v5;
}

+ (id)listsWithParagraphs:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = +[CRLayoutList listsWithRegionGroups:a3];
  id v19 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = objc_opt_new();
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v9 = [v7 items];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = [[CRListItemOutputRegion alloc] initWithLayoutListItem:*(void *)(*((void *)&v20 + 1) + 8 * j)];
              [v8 addObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }

        double v15 = [[CRListOutputRegion alloc] initWithListItems:v8];
        -[CROutputRegion setLayoutDirection:](v15, "setLayoutDirection:", [v7 layoutDirection]);
        [v19 addObject:v15];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  return v19;
}

- (unint64_t)type
{
  return 256;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

@end