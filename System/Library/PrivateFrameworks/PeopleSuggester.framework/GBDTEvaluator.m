@interface GBDTEvaluator
+ (void)initialize;
- (float)_firstOrderGradientWithPrediction:(float)a3 label:(float)a4;
- (float)_secondOrderGradientWithPrediction:(float)a3;
- (float)_sigmoidWithValue:(float)a3;
- (id)_computeFirstOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5;
- (id)_computePredictionsFromModelWithInputVectors:(id)a3 currentModel:(id)a4 error:(id *)a5;
- (id)_computeSecondOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5;
- (id)_computeSumOfGradientsLeftAndRightOfSplitWithFeature:(int)a3 threshold:(float)a4 inputVectors:(id)a5 gradients:(id)a6;
- (id)_differenceArrayWithArray:(id)a3;
- (id)_evaluateResultWithGradients:(id)a3 questions:(id)a4 inputVectors:(id)a5 reportGradientsBothSidesOfSplit:(BOOL)a6 reportNodeSumGradients:(BOOL)a7 reportPerFeatureResultDifference:(BOOL)a8 reportPerNodeResultDifference:(BOOL)a9;
- (id)_findNodeSamplesWithDecisionPath:(id)a3 inputVectors:(id)a4 gradients:(id)a5;
- (id)_l1NormWithArray:(id)a3;
- (id)_l2NormWithArray:(id)a3;
- (id)_makeKeysWithInputVectors:(id)a3;
- (id)_sumAbsoluteErrorWithPredictions:(id)a3 targets:(id)a4;
- (id)_sumAccuratePredictionsWithPredictions:(id)a3 targets:(id)a4;
- (id)_translateResultWithTranslateVector:(id)a3 result:(id)a4;
- (id)_weightResultWithWeightVector:(id)a3 result:(id)a4;
- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 processDataReturnDict:(id)a5 error:(id *)a6;
@end

@implementation GBDTEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.LighthouseShareSheetPFLPlugin", "GBDTEvaluator");
    MEMORY[0x1F41817F8]();
  }
}

- (id)_makeKeysWithInputVectors:(id)a3
{
  v3 = [a3 objectAtIndex:0];
  int v4 = [v3 count];

  v5 = [MEMORY[0x1E4F1CA48] array];
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      v7 = [NSNumber numberWithInt:v6];
      v8 = [v7 stringValue];
      [v5 addObject:v8];

      uint64_t v6 = (v6 + 1);
    }
    while (v4 != v6);
  }

  return v5;
}

- (id)_computePredictionsFromModelWithInputVectors:(id)a3 currentModel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(GBDTEvaluator *)self _makeKeysWithInputVectors:v8];
  v11 = [MEMORY[0x1E4F1CA48] array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    v26 = v27;
    do
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v14 = objc_msgSend(v8, "objectAtIndexedSubscript:", v12, v26);
      v15 = (void *)[v13 initWithObjects:v14 forKeys:v10];

      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      v16 = (void *)getMLDictionaryFeatureProviderClass_softClass_0;
      uint64_t v32 = getMLDictionaryFeatureProviderClass_softClass_0;
      if (!getMLDictionaryFeatureProviderClass_softClass_0)
      {
        v27[0] = __getMLDictionaryFeatureProviderClass_block_invoke_0;
        v27[1] = &unk_1E5ADE858;
        v28 = &v29;
        CoreMLLibraryCore_1();
        Class Class = objc_getClass("MLDictionaryFeatureProvider");
        *(void *)(v28[1] + 24) = Class;
        getMLDictionaryFeatureProviderClass_softClass_0 = *(void *)(v28[1] + 24);
        v16 = (void *)v30[3];
      }
      v18 = v16;
      _Block_object_dispose(&v29, 8);
      v19 = (void *)[[v18 alloc] initWithDictionary:v15 error:0];
      v20 = [v9 predictionFromFeatures:v19 error:a5];
      v21 = [v20 featureValueForName:@"predictedValue"];
      [v21 doubleValue];
      double v23 = v22;

      v24 = [NSNumber numberWithDouble:v23];
      [v11 addObject:v24];

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_l1NormWithArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) floatValue];
        float v8 = v8 + fabsf(v10);
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }
  *(float *)&double v5 = v8;
  v11 = [NSNumber numberWithFloat:v5];

  return v11;
}

- (id)_l2NormWithArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        float v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v10 floatValue];
        float v12 = v11;
        [v10 floatValue];
        float v8 = v8 + (float)(v12 * v13);
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }
  *(float *)&double v5 = sqrtf(v8);
  long long v14 = [NSNumber numberWithFloat:v5];

  return v14;
}

- (id)_sumAbsoluteErrorWithPredictions:(id)a3 targets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((int)[v6 count] < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      float v11 = [v6 objectAtIndexedSubscript:v9];
      [v11 floatValue];
      -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
      float v13 = v12;
      long long v14 = [v7 objectAtIndexedSubscript:v9];
      [v14 floatValue];
      float v10 = v10 + vabds_f32(v13, v15);

      ++v9;
    }
    while (v9 < (int)[v6 count]);
  }
  *(float *)&double v8 = v10;
  long long v16 = [NSNumber numberWithFloat:v8];

  return v16;
}

- (id)_sumAccuratePredictionsWithPredictions:(id)a3 targets:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 == [v7 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "floatValue", (void)v25);
          -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
          if (v15 <= 0.5) {
            long long v16 = &unk_1EF6750A8;
          }
          else {
            long long v16 = &unk_1EF675090;
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    if ((int)[v10 count] < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      do
      {
        long long v19 = objc_msgSend(v9, "objectAtIndexedSubscript:", v17, (void)v25);
        int v20 = [v19 intValue];
        uint64_t v21 = [v7 objectAtIndexedSubscript:v17];
        int v22 = [v21 intValue];

        if (v20 == v22) {
          ++v18;
        }
        ++v17;
      }
      while (v17 < (int)[v10 count]);
    }
    double v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v18, (void)v25);
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

- (float)_sigmoidWithValue:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (float)_firstOrderGradientWithPrediction:(float)a3 label:(float)a4
{
  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  return v5 - a4;
}

- (float)_secondOrderGradientWithPrediction:(float)a3
{
  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  float v6 = v5;
  *(float *)&double v7 = -a3;
  [(GBDTEvaluator *)self _sigmoidWithValue:v7];
  return v6 * v8;
}

- (id)_computeFirstOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v8 objectAtIndexedSubscript:v12];
      [v13 floatValue];
      float v15 = v14;

      long long v16 = [v9 objectAtIndexedSubscript:v12];
      [v16 floatValue];
      -[GBDTEvaluator _firstOrderGradientWithPrediction:label:](self, "_firstOrderGradientWithPrediction:label:");
      float v18 = v17;

      if (v15 == 1.0)
      {
        [v10 floatValue];
        float v18 = v18 * *(float *)&v19;
      }
      *(float *)&double v19 = v18;
      int v20 = [NSNumber numberWithFloat:v19];
      [v11 addObject:v20];

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_computeSecondOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v8 objectAtIndexedSubscript:v12];
      [v13 floatValue];
      float v15 = v14;

      long long v16 = [v9 objectAtIndexedSubscript:v12];
      [v16 floatValue];
      -[GBDTEvaluator _secondOrderGradientWithPrediction:](self, "_secondOrderGradientWithPrediction:");
      float v18 = v17;

      if (v15 == 1.0)
      {
        [v10 floatValue];
        float v18 = v18 * *(float *)&v19;
      }
      *(float *)&double v19 = v18;
      int v20 = [NSNumber numberWithFloat:v19];
      [v11 addObject:v20];

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_findNodeSamplesWithDecisionPath:(id)a3 inputVectors:(id)a4 gradients:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((int)[v8 count] < 1) {
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  do
  {
    if ((int)[v7 count] < 1)
    {
LABEL_10:
      double v23 = [v8 objectAtIndexedSubscript:v9];
      [v27 addObject:v23];

      uint64_t v12 = [v28 objectAtIndexedSubscript:v9];
      [v26 addObject:v12];
      goto LABEL_12;
    }
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];

      uint64_t v13 = [v7 objectAtIndexedSubscript:v10];
      float v14 = [v13 objectAtIndexedSubscript:1];

      float v15 = [v7 objectAtIndexedSubscript:v10];
      long long v16 = [v15 objectAtIndexedSubscript:2];

      LODWORD(v15) = [v16 intValue];
      float v17 = [v8 objectAtIndexedSubscript:v9];
      float v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "intValue"));
      [v18 floatValue];
      float v20 = v19;
      [v14 floatValue];
      float v22 = v21;

      if (v15 != 1) {
        break;
      }
      if (v20 >= v22) {
        goto LABEL_11;
      }
LABEL_9:

      if (++v10 >= (int)[v7 count]) {
        goto LABEL_10;
      }
    }
    if (v20 > v22) {
      goto LABEL_9;
    }
LABEL_11:

LABEL_12:
    ++v9;
  }
  while (v9 < (int)[v8 count]);
LABEL_13:
  v29[0] = v27;
  v29[1] = v26;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

  return v24;
}

- (id)_computeSumOfGradientsLeftAndRightOfSplitWithFeature:(int)a3 threshold:(float)a4 inputVectors:(id)a5 gradients:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if ((int)[v9 count] < 1)
  {
    float v14 = 0.0;
    float v13 = 0.0;
  }
  else
  {
    uint64_t v12 = 0;
    float v13 = 0.0;
    float v14 = 0.0;
    do
    {
      float v15 = [v9 objectAtIndex:v12];
      long long v16 = [v15 objectAtIndex:a3];

      [v16 floatValue];
      float v18 = v17;
      float v19 = [v10 objectAtIndexedSubscript:v12];
      [v19 floatValue];
      float v21 = v20;

      if (v18 <= a4) {
        float v22 = -0.0;
      }
      else {
        float v22 = v21;
      }
      float v14 = v14 + v22;
      if (v18 <= a4) {
        float v23 = v21;
      }
      else {
        float v23 = -0.0;
      }
      float v13 = v13 + v23;

      ++v12;
    }
    while (v12 < (int)[v9 count]);
  }
  *(float *)&double v11 = v13;
  v24 = [NSNumber numberWithFloat:v11];
  v29[0] = v24;
  *(float *)&double v25 = v14;
  id v26 = [NSNumber numberWithFloat:v25];
  v29[1] = v26;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

  return v27;
}

- (id)_evaluateResultWithGradients:(id)a3 questions:(id)a4 inputVectors:(id)a5 reportGradientsBothSidesOfSplit:(BOOL)a6 reportNodeSumGradients:(BOOL)a7 reportPerFeatureResultDifference:(BOOL)a8 reportPerNodeResultDifference:(BOOL)a9
{
  BOOL v66 = a8;
  BOOL v55 = a7;
  BOOL v75 = a6;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v12 = a4;
  id v58 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((int)[v12 count] < 1) {
    goto LABEL_38;
  }
  uint64_t v14 = 0;
  v56 = v13;
  id v57 = v12;
  do
  {
    float v15 = [v12 objectAtIndexedSubscript:v14];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"decisionPath"];

    uint64_t v63 = v14;
    float v17 = [v12 objectAtIndexedSubscript:v14];
    float v18 = [v17 objectForKeyedSubscript:@"splits"];

    float v19 = self;
    v62 = (void *)v16;
    float v20 = [(GBDTEvaluator *)self _findNodeSamplesWithDecisionPath:v16 inputVectors:v58 gradients:v59];
    v74 = [v20 objectAtIndex:0];
    v61 = v20;
    v73 = [v20 objectAtIndex:1];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v69 = v18;
    v60 = [v18 allKeys];
    float v22 = [v60 sortedArrayUsingComparator:&__block_literal_global_10];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v22;
    uint64_t v70 = [v22 countByEnumeratingWithState:&v80 objects:v85 count:16];
    float v23 = 0;
    if (!v70) {
      goto LABEL_25;
    }
    uint64_t v67 = *(void *)v81;
    v68 = v21;
    do
    {
      for (uint64_t i = 0; i != v70; uint64_t i = v39 + 1)
      {
        if (*(void *)v81 != v67) {
          objc_enumerationMutation(obj);
        }
        uint64_t v71 = i;
        double v25 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        id v26 = [v69 objectForKey:v25];
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v72 = v26;
        uint64_t v29 = [v72 countByEnumeratingWithState:&v76 objects:v84 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v77;
          do
          {
            uint64_t v32 = 0;
            v33 = v23;
            do
            {
              if (*(void *)v77 != v31) {
                objc_enumerationMutation(v72);
              }
              v34 = *(void **)(*((void *)&v76 + 1) + 8 * v32);
              uint64_t v35 = [v25 intValue];
              [v34 floatValue];
              float v23 = -[GBDTEvaluator _computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:](v19, "_computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:", v35, v74, v73);

              v36 = [v23 objectAtIndexedSubscript:0];
              [v27 addObject:v36];

              if (v75)
              {
                v37 = [v23 objectAtIndexedSubscript:1];
                [v28 addObject:v37];
              }
              ++v32;
              v33 = v23;
            }
            while (v30 != v32);
            uint64_t v30 = [v72 countByEnumeratingWithState:&v76 objects:v84 count:16];
          }
          while (v30);
        }

        if (!v66)
        {
          id v21 = v68;
          [v68 addObjectsFromArray:v27];
          uint64_t v39 = v71;
          if (!v75) {
            goto LABEL_23;
          }
          goto LABEL_21;
        }
        uint64_t v38 = [(GBDTEvaluator *)v19 _differenceArrayWithArray:v27];

        id v21 = v68;
        uint64_t v39 = v71;
        if (v75)
        {
          uint64_t v40 = [(GBDTEvaluator *)v19 _differenceArrayWithArray:v28];

          [v68 addObjectsFromArray:v38];
          id v28 = (id)v40;
          id v27 = (id)v38;
LABEL_21:
          [v64 addObjectsFromArray:v28];
          goto LABEL_23;
        }
        [v68 addObjectsFromArray:v38];
        id v27 = (id)v38;
LABEL_23:
      }
      uint64_t v70 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v70);
LABEL_25:
    if (a9)
    {
      self = v19;
      v41 = [(GBDTEvaluator *)v19 _differenceArrayWithArray:v21];

      id v13 = v56;
      id v12 = v57;
      v43 = v62;
      uint64_t v42 = v63;
      v44 = v64;
      if (v75)
      {
        v44 = [(GBDTEvaluator *)self _differenceArrayWithArray:v64];

        [v56 addObjectsFromArray:v41];
        goto LABEL_29;
      }
      [v56 addObjectsFromArray:v41];
LABEL_31:
      if (v23 && !v75)
      {
        if (v55)
        {
          v45 = NSNumber;
          v46 = [v23 objectAtIndexedSubscript:0];
          [v46 floatValue];
          float v48 = v47;
          v49 = [v23 objectAtIndexedSubscript:1];
          [v49 floatValue];
          *(float *)&double v51 = v48 + v50;
          v52 = [v45 numberWithFloat:v51];
          [v13 addObject:v52];
        }
        else
        {
          v53 = [v23 objectAtIndexedSubscript:1];
          [v13 addObject:v53];
        }
        v44 = v64;
      }
    }
    else
    {
      id v13 = v56;
      [v56 addObjectsFromArray:v21];
      self = v19;
      v41 = v21;
      id v12 = v57;
      v43 = v62;
      uint64_t v42 = v63;
      v44 = v64;
      if (!v75) {
        goto LABEL_31;
      }
LABEL_29:
      [v13 addObjectsFromArray:v44];
    }

    uint64_t v14 = v42 + 1;
  }
  while (v14 < (int)[v12 count]);
LABEL_38:

  return v13;
}

uint64_t __187__GBDTEvaluator__evaluateResultWithGradients_questions_inputVectors_reportGradientsBothSidesOfSplit_reportNodeSumGradients_reportPerFeatureResultDifference_reportPerNodeResultDifference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (id)_weightResultWithWeightVector:(id)a3 result:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    int v24 = 134217984;
    uint64_t v25 = [v6 count];
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v24, 0xCu);
  }
  id v9 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    uint64_t v11 = [v5 count];
    int v24 = 134217984;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Size of weight vector: %lu", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v12 = [v5 count];
  if (v12 == [v6 count])
  {
    if ((int)[v6 count] >= 1)
    {
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = NSNumber;
        float v15 = [v6 objectAtIndexedSubscript:v13];
        [v15 floatValue];
        float v17 = v16;
        float v18 = [v5 objectAtIndexedSubscript:v13];
        [v18 floatValue];
        *(float *)&double v20 = v17 * v19;
        id v21 = [v14 numberWithFloat:v20];
        [v6 setObject:v21 atIndexedSubscript:v13];

        ++v13;
      }
      while (v13 < (int)[v6 count]);
    }
  }
  else
  {
    float v22 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Weight vector is not the same size as result vector. No weighting of results is being applied.", (uint8_t *)&v24, 2u);
    }
  }

  return v6;
}

- (id)_translateResultWithTranslateVector:(id)a3 result:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    int v24 = 134217984;
    uint64_t v25 = [v6 count];
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v24, 0xCu);
  }
  id v9 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    uint64_t v11 = [v5 count];
    int v24 = 134217984;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Size of translate vector: %lu", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v12 = [v5 count];
  if (v12 == [v6 count])
  {
    if ((int)[v6 count] >= 1)
    {
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = NSNumber;
        float v15 = [v6 objectAtIndexedSubscript:v13];
        [v15 floatValue];
        float v17 = v16;
        float v18 = [v5 objectAtIndexedSubscript:v13];
        [v18 floatValue];
        *(float *)&double v20 = v17 + v19;
        id v21 = [v14 numberWithFloat:v20];
        [v6 setObject:v21 atIndexedSubscript:v13];

        ++v13;
      }
      while (v13 < (int)[v6 count]);
    }
  }
  else
  {
    float v22 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Translate vector is not the same size as result vector. No translating of results applied.", (uint8_t *)&v24, 2u);
    }
  }

  return v6;
}

- (id)_differenceArrayWithArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [v3 objectAtIndexedSubscript:0];
    [v4 addObject:v5];

    if ((int)[v3 count] >= 2)
    {
      uint64_t v6 = 1;
      do
      {
        id v7 = [v3 objectAtIndexedSubscript:v6];
        [v7 floatValue];
        float v9 = v8;
        id v10 = [v3 objectAtIndexedSubscript:v6 - 1];
        [v10 floatValue];
        float v12 = v9 - v11;

        *(float *)&double v13 = v12;
        uint64_t v14 = [NSNumber numberWithFloat:v13];
        [v4 addObject:v14];

        ++v6;
      }
      while (v6 < (int)[v3 count]);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 processDataReturnDict:(id)a5 error:(id *)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  float v12 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "Start of GBDT gradient computation", buf, 2u);
  }
  v89 = v11;
  double v13 = [v11 objectForKeyedSubscript:@"CalculatedPositiveSampleWeight"];
  int v14 = [v10 computeFirstOrderGradients];
  int v90 = [v10 computeSecondOrderGradients];
  float v15 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    if (v14) {
      float v16 = @"Yes";
    }
    else {
      float v16 = @"No";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v92 = (uint64_t)v16;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "Computation and reporting of 1st order gradients: %@", buf, 0xCu);
  }
  float v17 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    if (v90) {
      float v18 = @"Yes";
    }
    else {
      float v18 = @"No";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v92 = (uint64_t)v18;
    _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_INFO, "Computation and reporting of 2nd order gradients: %@", buf, 0xCu);
  }
  if ((v14 | v90))
  {
    unsigned int v83 = [v10 reportGradientsBothSidesOfSplit];
    float v19 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v83) {
        double v20 = @"Yes";
      }
      else {
        double v20 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v92 = (uint64_t)v20;
      _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "Reporting gradients on both sides of split: %@", buf, 0xCu);
    }
    unsigned int v21 = [v10 reportNodeSumGradients];
    float v22 = sLog;
    BOOL v23 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        int v24 = "Reporting sum of gradients in each node";
LABEL_27:
        _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, v24, buf, 2u);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      int v24 = "Reporting right and left gradients for last split evaluated in each node";
      goto LABEL_27;
    }
    unsigned int v81 = [v10 reportPerFeatureResultDifference];
    id v28 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v81) {
        uint64_t v29 = @"Yes";
      }
      else {
        uint64_t v29 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v92 = (uint64_t)v29;
      _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "For each feature, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
    }
    int v79 = [v10 reportPerNodeResultDifference];
    uint64_t v30 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v79) {
        uint64_t v31 = @"Yes";
      }
      else {
        uint64_t v31 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v92 = (uint64_t)v31;
      _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "For each node, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
    }
    uint64_t v26 = v9;
    uint64_t v32 = [getMLModelClass() compileModelAtURL:v9 error:a6];
    if (*a6)
    {
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.4();
      }
      id v25 = (id)MEMORY[0x1E4F1CC08];
      id v27 = v89;
    }
    else
    {
      uint64_t v33 = [getMLModelClass() modelWithContentsOfURL:v32 error:a6];
      v34 = (void *)v33;
      uint64_t v35 = sLog;
      if (*a6)
      {
        id v27 = v89;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
          -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:]();
        }
        id v25 = (id)MEMORY[0x1E4F1CC08];
      }
      else
      {
        long long v76 = (void *)v33;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "Compilation of coreML model complete", buf, 2u);
        }
        v36 = [v10 inputVectors];
        v37 = (void *)[v36 mutableCopy];

        uint64_t v38 = [v10 targetVector];
        long long v77 = (void *)[v38 mutableCopy];

        uint64_t v39 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "Extraction of input vectors and targets from records into arrays complete", buf, 2u);
        }
        uint64_t v40 = (void *)sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          v41 = v40;
          uint64_t v42 = [v37 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v92 = v42;
          _os_log_impl(&dword_1A314B000, v41, OS_LOG_TYPE_INFO, "Number of rows used for GBDT training = %lu", buf, 0xCu);
        }
        BOOL v75 = v37;
        if ([v37 count])
        {
          v43 = [(GBDTEvaluator *)self _computePredictionsFromModelWithInputVectors:v37 currentModel:v76 error:a6];
          v44 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A314B000, v44, OS_LOG_TYPE_INFO, "Predictions of all input vectors from coreML model complete", buf, 2u);
          }
          uint64_t v45 = [v77 count];
          if (v45 == [v43 count])
          {
            v73 = [v10 GBDTQuestions];
            id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v74 = v43;
            if (v14)
            {
              uint64_t v47 = [(GBDTEvaluator *)self _computeFirstOrderGradientsWithTargets:v77 predictions:v43 positiveSampleWeight:v13];
              float v48 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v48, OS_LOG_TYPE_INFO, "Computation of 1st order gradients complete", buf, 2u);
              }
              LOBYTE(v72) = v79;
              v85 = (void *)v47;
              v49 = [(GBDTEvaluator *)self _evaluateResultWithGradients:v47 questions:v73 inputVectors:v37 reportGradientsBothSidesOfSplit:v83 reportNodeSumGradients:v21 reportPerFeatureResultDifference:v81 reportPerNodeResultDifference:v72];
              float v50 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v50, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 1st order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
              }
              [v46 addObjectsFromArray:v49];
            }
            uint64_t v86 = v32;
            if (v90)
            {
              double v51 = [(GBDTEvaluator *)self _computeSecondOrderGradientsWithTargets:v77 predictions:v74 positiveSampleWeight:v13];
              v52 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_INFO, "Computation of 2nd order gradients complete", buf, 2u);
              }
              LOBYTE(v72) = v79;
              v53 = [(GBDTEvaluator *)self _evaluateResultWithGradients:v51 questions:v73 inputVectors:v37 reportGradientsBothSidesOfSplit:v83 reportNodeSumGradients:v21 reportPerFeatureResultDifference:v81 reportPerNodeResultDifference:v72];
              v54 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v54, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 2nd order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
              }
              [v46 addObjectsFromArray:v53];
            }
            BOOL v55 = [v10 translateVector];
            v56 = [(GBDTEvaluator *)self _translateResultWithTranslateVector:v55 result:v46];

            id v57 = sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A314B000, v57, OS_LOG_TYPE_INFO, "Element-wise translation of result vector with translate vector complete", buf, 2u);
            }
            id v58 = [v10 weightVector];
            uint64_t v59 = [(GBDTEvaluator *)self _weightResultWithWeightVector:v58 result:v56];

            v60 = sLog;
            id v27 = v89;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A314B000, v60, OS_LOG_TYPE_INFO, "Element-wise multiplication of result vector with weight vector complete", buf, 2u);
            }
            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v61 addObject:v59];
            if (v61) {
              [v25 setObject:v61 forKey:@"ModelDeltas"];
            }
            v62 = (void *)v59;
            uint64_t v63 = [(GBDTEvaluator *)self _l1NormWithArray:v59];
            if (v63) {
              [v25 setObject:v63 forKey:@"L1Norm"];
            }
            uint64_t v64 = [(GBDTEvaluator *)self _l2NormWithArray:v59];
            if (v64) {
              [v25 setObject:v64 forKey:@"L2Norm"];
            }
            long long v82 = (void *)v64;
            uint64_t v65 = [(GBDTEvaluator *)self _sumAbsoluteErrorWithPredictions:v74 targets:v77];
            if (v65) {
              [v25 setObject:v65 forKey:@"SumAbsolutePredictionError"];
            }
            v84 = v61;
            uint64_t v66 = [(GBDTEvaluator *)self _sumAccuratePredictionsWithPredictions:v74 targets:v77];
            if (v66) {
              [v25 setObject:v66 forKey:@"SumAccuratePredictions"];
            }
            long long v78 = (void *)v66;
            v88 = (void *)v63;
            uint64_t v67 = [v89 objectForKeyedSubscript:@"NumberTrainingSessions"];
            if (v67) {
              [v25 setObject:v67 forKey:@"NumberTrainingSessions"];
            }
            long long v80 = (void *)v65;
            v68 = [v89 objectForKeyedSubscript:@"NumberTrainingRecords"];
            if (v68) {
              [v25 setObject:v68 forKey:@"NumberTrainingRecords"];
            }
            v69 = [v89 objectForKeyedSubscript:@"NumberTrainingRecordsClass0"];
            if (v69) {
              [v25 setObject:v69 forKey:@"NumberTrainingRecordsClass0"];
            }
            uint64_t v70 = [v89 objectForKeyedSubscript:@"NumberTrainingRecordsClass1"];
            if (v70) {
              [v25 setObject:v70 forKey:@"NumberTrainingRecordsClass1"];
            }

            uint64_t v32 = v86;
            v34 = v76;
            v43 = v74;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
              -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:]();
            }
            id v25 = (id)MEMORY[0x1E4F1CC08];
            id v27 = v89;
            v34 = v76;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
            -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:]();
          }
          id v25 = (id)MEMORY[0x1E4F1CC08];
          id v27 = v89;
          v34 = v76;
        }
      }
    }

    goto LABEL_101;
  }
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
    -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.5();
  }
  id v25 = (id)MEMORY[0x1E4F1CC08];
  uint64_t v26 = v9;
  id v27 = v89;
LABEL_101:

  return v25;
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "No valid records for GBDT evaluation", v2, v3, v4, v5, v6);
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Length of targets arrays does not equal length of predictions array", v2, v3, v4, v5, v6);
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to load model.", v2, v3, v4, v5, v6);
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to compile model.", v2, v3, v4, v5, v6);
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Not computing or reporting 1st and 2nd order gradients. This is because ComputeFirstOrderGradients and ComputeSecondOrderGradients in recipe were both set to 0. Set these parameters to 1 if gradients are to be computed and reported. Exiting without computing result.", v2, v3, v4, v5, v6);
}

@end