@interface CRMultiModelTextFeatureSplitter
+ (BOOL)_regionsAreLikelyStackedTextResults:(id)a3;
+ (id)_legacySortTextRegions:(id)a3 point:(CGPoint)a4 angle:(float)a5 sortingWithinLine:(BOOL)a6;
+ (id)_recognizerRegionsFromLineRegions:(id)a3;
- (CRMultiModelTextFeatureSplitter)initWithConfiguration:(id)a3;
- (CRRecognizerConfiguration)configuration;
- (id)combineRegions:(id)a3 lineRegion:(id)a4;
- (id)groupLineRegions:(id)a3;
- (id)groupLineRegions:(id)a3 tableGroups:(id)a4;
- (id)pruneAndFilterLineRegions:(id)a3 recognitionResult:(id)a4;
- (id)pruneLineRegions:(id)a3 recognitionResult:(id)a4;
- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4;
- (void)setConfiguration:(id)a3;
@end

@implementation CRMultiModelTextFeatureSplitter

- (CRMultiModelTextFeatureSplitter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRMultiModelTextFeatureSplitter;
  v6 = [(CRMultiModelTextFeatureSplitter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
}

+ (id)_recognizerRegionsFromLineRegions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v10 regionFragments];
          [v4 addObjectsFromArray:v11];
        }
        else
        {
          objc_msgSend(v4, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)_regionsAreLikelyStackedTextResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    unint64_t v5 = 0;
    uint64_t v26 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = [v7 locale];
        if (!+[CRImageReader languageIsChinese:v8])
        {
          objc_super v9 = [v7 locale];
          if (!+[CRImageReader languageIsJapanese:v9])
          {
            v17 = [v7 locale];
            BOOL v18 = +[CRImageReader languageIsKorean:v17];

            if (!v18) {
              continue;
            }
            goto LABEL_10;
          }
        }
LABEL_10:
        v10 = [v7 text];
        if ([v10 length])
        {
          v11 = [v7 text];
          [v11 rangeOfComposedCharacterSequenceAtIndex:0];
          uint64_t v13 = v12;
          long long v14 = [v7 text];
          uint64_t v15 = [v14 length];

          if (v13 == v15)
          {
            ++v24;
            continue;
          }
        }
        else
        {
        }
        ++v5;
        [v7 confidence];
        if (v16 < 0.300000012) {
          ++v25;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v4) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  unint64_t v5 = 0;
LABEL_21:
  BOOL v19 = 0;
  if (v24 + v5 >= 0x32)
  {
    float v20 = (float)v24 / (float)(unint64_t)[obj count];
    if (v20 > 0.6 || v5 >= 5 && (v20 > 0.3 ? (BOOL v21 = (float)((float)v25 / (float)v5) <= 0.5) : (BOOL v21 = 1), !v21)) {
      BOOL v19 = 1;
    }
  }

  return v19;
}

+ (id)_legacySortTextRegions:(id)a3 point:(CGPoint)a4 angle:(float)a5 sortingWithinLine:(BOOL)a6
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__CRMultiModelTextFeatureSplitter__legacySortTextRegions_point_angle_sortingWithinLine___block_invoke;
  v8[3] = &__block_descriptor_53_e35_q24__0___CRRegion__8___CRRegion__16l;
  CGPoint v9 = a4;
  float v10 = a5;
  BOOL v11 = a6;
  uint64_t v6 = [a3 sortedArrayUsingComparator:v8];
  return v6;
}

uint64_t __88__CRMultiModelTextFeatureSplitter__legacySortTextRegions_point_angle_sortingWithinLine___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 boundingQuad];
  [v7 topLeft];
  double v53 = v8;
  double v54 = v9;
  float v10 = [v6 boundingQuad];
  [v10 topRight];
  double v55 = v11;
  double v56 = v12;
  uint64_t v13 = [v6 boundingQuad];
  [v13 bottomRight];
  double v57 = v14;
  double v58 = v15;
  double v16 = [v6 boundingQuad];

  [v16 bottomLeft];
  double v59 = v17;
  double v60 = v18;

  BOOL v19 = [v5 boundingQuad];
  [v19 topLeft];
  double v45 = v20;
  double v46 = v21;
  v22 = [v5 boundingQuad];
  [v22 topRight];
  double v47 = v23;
  double v48 = v24;
  unint64_t v25 = [v5 boundingQuad];
  [v25 bottomRight];
  double v49 = v26;
  double v50 = v27;
  long long v28 = [v5 boundingQuad];

  [v28 bottomLeft];
  double v51 = v29;
  double v52 = v30;

  double v31 = *(float *)(a1 + 48);
  double v32 = *(double *)(a1 + 32);
  double v33 = *(double *)(a1 + 40);
  rotatePolygon(&v53, &v53, v32, v33, v31);
  rotatePolygon(&v45, &v45, v32, v33, v31);
  double v34 = fmin(fmin(v54, v56), fmin(v58, v60));
  double v35 = fmin(fmin(v46, v48), fmin(v50, v52));
  double v36 = fmax(fmax(v54, v56), fmax(v58, v60)) - v34;
  if (v35 >= v34 + v36) {
    return -1;
  }
  double v37 = fmax(fmax(v46, v48), fmax(v50, v52)) - v35;
  if (v34 >= v35 + v37) {
    return 1;
  }
  double v38 = fmin(fmin(v53, v55), fmin(v57, v59));
  double v39 = fmin(fmin(v45, v47), fmin(v49, v51));
  double v40 = fmax(fmax(v53, v55), fmax(v57, v59)) - v38;
  if (v39 >= v38 + v40) {
    return -1;
  }
  double v41 = fmax(fmax(v45, v47), fmax(v49, v51)) - v39;
  if (v38 >= v39 + v41) {
    return 1;
  }
  if (*(unsigned char *)(a1 + 52))
  {
    double v36 = v40;
    double v34 = v38;
    double v37 = v41;
    double v35 = v39;
  }
  float v42 = v35 + v37 * 0.5;
  float v43 = v34 + v36 * 0.5;
  if (v42 < v43) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)pruneLineRegions:(id)a3 recognitionResult:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  uint64_t v7 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v6;
  uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v56;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v56 != v45) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
        float v10 = objc_opt_class();
        uint64_t v61 = v9;
        double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
        uint64_t v12 = [v10 _recognizerRegionsFromLineRegions:v11];

        uint64_t v13 = [v46 recognizedRegionsForDetectedLineRegions:v12];
        double v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_29];
        double v15 = [v13 filteredArrayUsingPredicate:v14];

        double v48 = (void *)v12;
        uint64_t v49 = v8;
        if ([v15 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          double v16 = [v9 boundingQuad];
          [v16 midPoint];
          double v18 = v17;
          double v20 = v19;

          double v21 = [v9 boundingQuad];
          [v21 baselineAngle];
          float v23 = v22;

          double v24 = objc_opt_class();
          *(float *)&double v25 = v23;
          double v26 = objc_msgSend(v24, "_legacySortTextRegions:point:angle:sortingWithinLine:", v15, 1, v18, v20, v25);

          double v27 = [(CRMultiModelTextFeatureSplitter *)self combineRegions:v26 lineRegion:v9];
          double v60 = v27;
          double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v28 = v15;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              double v33 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * i) mutableCopy];
              double v34 = [v33 text];
              uint64_t v35 = [v34 length];

              if (v35)
              {
                double v36 = [(CRMultiModelTextFeatureSplitter *)self configuration];
                if (![v36 falsePositiveFilteringDisabled])
                {
                  double v37 = [(CRMultiModelTextFeatureSplitter *)self configuration];
                  if ((unint64_t)[v37 revision] > 2)
                  {
                    [v33 subregions];
                    uint64_t v38 = v31;
                    id v39 = v28;
                    double v40 = self;
                    v42 = double v41 = v7;
                    uint64_t v50 = [v42 count];

                    uint64_t v7 = v41;
                    self = v40;
                    id v28 = v39;
                    uint64_t v31 = v38;

                    if (v50) {
                      [v33 adjustBoundsBasedOnSubregions];
                    }
                    goto LABEL_21;
                  }
                }
LABEL_21:
                [v7 addObject:v33];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v30);
        }

        uint64_t v8 = v49 + 1;
      }
      while (v49 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v47);
  }

  return v7;
}

BOOL __70__CRMultiModelTextFeatureSplitter_pruneLineRegions_recognitionResult___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)groupLineRegions:(id)a3
{
  id v4 = a3;
  id v5 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  uint64_t v6 = [v5 textFeatureOrder];
  uint64_t v7 = [(id)v6 orderAndGroupRegions:v4];

  id v8 = v7;
  double v9 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  LOBYTE(v6) = [v9 falsePositiveFilteringDisabled];

  float v10 = v8;
  if ((v6 & 1) == 0)
  {
    double v11 = [(CRMultiModelTextFeatureSplitter *)self configuration];
    uint64_t v12 = [v11 textFeatureFilter];
    float v10 = [v12 filterBlocks:v8];
  }
  return v10;
}

- (id)groupLineRegions:(id)a3 tableGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  double v9 = [v8 textFeatureOrder];
  char v10 = objc_opt_respondsToSelector();

  double v11 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  uint64_t v12 = [v11 textFeatureOrder];
  uint64_t v13 = v12;
  if (v10) {
    [v12 orderAndGroupRegions:v7 tableGroups:v6];
  }
  else {
  double v14 = [v12 orderAndGroupRegions:v7];
  }

  id v15 = v14;
  double v16 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  char v17 = [v16 falsePositiveFilteringDisabled];

  double v18 = v15;
  if ((v17 & 1) == 0)
  {
    double v19 = [(CRMultiModelTextFeatureSplitter *)self configuration];
    double v20 = [v19 textFeatureFilter];
    double v18 = [v20 filterBlocks:v15];
  }
  return v18;
}

- (id)pruneAndFilterLineRegions:(id)a3 recognitionResult:(id)a4
{
  id v5 = [(CRMultiModelTextFeatureSplitter *)self pruneLineRegions:a3 recognitionResult:a4];
  id v6 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  char v7 = [v6 falsePositiveFilteringDisabled];

  id v8 = v5;
  if ((v7 & 1) == 0)
  {
    double v9 = [(CRMultiModelTextFeatureSplitter *)self configuration];
    char v10 = [v9 textFeatureFilter];
    id v8 = [v10 filterLineRegions:v5];
  }
  return v8;
}

- (id)combineRegions:(id)a3 lineRegion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v42 = a4;
  id v6 = [(CRRecognizedTextRegion *)[CRMutableRecognizedTextRegion alloc] initWithType:2 detectedLineRegion:v42];
  if ([v5 count])
  {
    char v7 = [v5 firstObject];
    id v8 = [v7 locale];
    [(CRRecognizedTextRegion *)v6 setLocale:v8];

    v44 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v39 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v50;
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      float v13 = 0.0;
      double v14 = &stru_1F38EED68;
      float v15 = 0.0;
      do
      {
        uint64_t v16 = 0;
        char v17 = v14;
        do
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
          double v19 = [v18 subregions];
          [v44 addObjectsFromArray:v19];

          -[CRRecognizedTextRegion setWhitespaceInjected:](v6, "setWhitespaceInjected:", [v18 whitespaceInjected] | -[CRRecognizedTextRegion whitespaceInjected](v6, "whitespaceInjected"));
          double v20 = [v18 candidates];
          unint64_t v21 = [v20 count];

          if (v12 >= v21) {
            unint64_t v12 = v21;
          }
          [v18 confidence];
          float v15 = v22 + v15;
          [v18 activationProbability];
          float v13 = v23 + v13;
          double v24 = [v18 text];
          double v14 = [(__CFString *)v17 stringByAppendingFormat:@" %@", v24];

          ++v16;
          char v17 = v14;
        }
        while (v10 != v16);
        uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v10);
    }
    else
    {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      float v13 = 0.0;
      double v14 = &stru_1F38EED68;
      float v15 = 0.0;
    }
    uint64_t v38 = v6;

    double v41 = objc_opt_new();
    if (v12)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        double v26 = objc_opt_new();
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v27 = obj;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v46 != v30) {
                objc_enumerationMutation(v27);
              }
              double v32 = [*(id *)(*((void *)&v45 + 1) + 8 * j) candidates];
              double v33 = [v32 objectAtIndexedSubscript:i];
              [v26 addObject:v33];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v29);
        }

        double v34 = [(CRMultiModelTextFeatureSplitter *)self combineRegions:v26 lineRegion:v42];
        [v41 addObject:v34];
      }
    }
    id v6 = v38;
    [(CRRecognizedTextRegion *)v38 setSubregions:v44];
    [(CRRecognizedTextRegion *)v38 setCandidates:v41];
    -[CRRecognizedTextRegion setConfidence:](v38, "setConfidence:", (float)(v15 / (float)(unint64_t)[obj count]));
    -[CRRecognizedTextRegion setActivationProbability:](v38, "setActivationProbability:", (float)(v13 / (float)(unint64_t)[obj count]));
    uint64_t v35 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    double v36 = [(__CFString *)v14 stringByTrimmingCharactersInSet:v35];
    [(CRRecognizedTextRegion *)v38 setText:v36];

    id v5 = v39;
  }

  return v6;
}

- (CRRecognizerConfiguration)configuration
{
  return (CRRecognizerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end