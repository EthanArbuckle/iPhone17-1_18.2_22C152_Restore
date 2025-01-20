@interface CRRecognizerAsyncFeatureBatchProviderV1
- (CRNeuralRecognizerConfiguration)configuration;
- (CRRecognizerAsyncFeatureBatchProviderV1)initWithConfiguration:(id)a3 inputProvider:(id)a4 error:(id *)a5;
- (CRTextRecognizerModelInputProvider)inputProvider;
- (void)enumerateInputsForImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 usingBlock:(id)a6;
- (void)setConfiguration:(id)a3;
- (void)setInputProvider:(id)a3;
@end

@implementation CRRecognizerAsyncFeatureBatchProviderV1

- (CRRecognizerAsyncFeatureBatchProviderV1)initWithConfiguration:(id)a3 inputProvider:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRRecognizerAsyncFeatureBatchProviderV1;
  v10 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    objc_storeStrong((id *)&v11->_inputProvider, a4);
  }

  return v11;
}

- (void)enumerateInputsForImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 usingBlock:(id)a6
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v10 = a4;
  id v70 = a5;
  v67 = v10;
  id v68 = a6;
  v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_40];
  v12 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v98 count:16];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!v13)
  {
    char v72 = 0;
    goto LABEL_20;
  }
  char v72 = 0;
  uint64_t v73 = *(void *)v95;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v95 != v73) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      v20 = [v19 polygon];
      if (v20)
      {
        v21 = [v19 polygon];
        if ((unint64_t)[v21 pointCount] <= 3)
        {
        }
        else
        {
          v22 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)self configuration];
          int v23 = [v22 rectifyPolygons];

          if (v23)
          {
            v24 = [v19 polygon];
            v25 = [v24 denormalizedPolyline];
            [v25 boundingRect];
            goto LABEL_13;
          }
        }
      }
      v30 = [v19 boundingQuad];
      [v30 baselineAngle];
      double v32 = v31;
      v33 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)self configuration];
      [v33 angleThresholdForRotatedCrops];
      BOOL v35 = fabs(v32) > v34;

      if (!v35) {
        goto LABEL_14;
      }
      v24 = [v19 boundingQuad];
      v25 = [v24 denormalizedQuad];
      [v25 boundingBox];
LABEL_13:
      v102.origin.double x = v26;
      v102.origin.double y = v27;
      v102.size.double width = v28;
      v102.size.double height = v29;
      v100.origin.double x = x;
      v100.origin.double y = y;
      v100.size.double width = width;
      v100.size.double height = height;
      CGRect v101 = CGRectUnion(v100, v102);
      double x = v101.origin.x;
      double y = v101.origin.y;
      double width = v101.size.width;
      double height = v101.size.height;

      char v72 = 1;
LABEL_14:
      [v19 aspectRatio];
      double v37 = v36;
      v38 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)self configuration];
      float v39 = v37;
      uint64_t v40 = [v38 bestFitWidthIndexForAspectRatio:v39];

      v41 = [NSNumber numberWithInteger:v40];
      v42 = [v12 objectForKeyedSubscript:v41];
      BOOL v43 = v42 == 0;

      if (v43)
      {
        v44 = [NSNumber numberWithInteger:v40];
        [v12 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v44];
      }
      v45 = [NSNumber numberWithInteger:v40];
      v46 = [v12 objectForKeyedSubscript:v45];
      v47 = [v46 arrayByAddingObject:v19];
      v48 = [NSNumber numberWithInteger:v40];
      [v12 setObject:v47 forKeyedSubscript:v48];
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v98 count:16];
  }
  while (v13);
LABEL_20:

  v49 = [v12 allKeys];
  v50 = [v49 sortedArrayUsingSelector:sel_compare_];

  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_2;
  v90[3] = &unk_1E6CDC730;
  id v51 = v12;
  id v91 = v51;
  v92 = self;
  id v52 = v50;
  id v93 = v52;
  [v52 enumerateObjectsWithOptions:2 usingBlock:v90];
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__23;
  v88[4] = __Block_byref_object_dispose__23;
  id v89 = (id)objc_opt_new();
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__23;
  v86[4] = __Block_byref_object_dispose__23;
  id v87 = (id)objc_opt_new();
  v53 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)self configuration];
  v54 = [v53 inputWidths];

  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v85[3] = 0;
  if (v70)
  {
    v55 = (CRMetalPolygonRectifier *)v70;
  }
  else if ((v72 & 1) != 0 && _os_feature_enabled_impl())
  {
    v56 = [CRMetalPolygonRectifier alloc];
    v57 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)self configuration];
    v58 = [v57 metalDevice];
    v55 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](v56, "initWithDevice:sourceImage:regionOfInterest:", v58, v69, x, y, width, height);
  }
  else
  {
    v55 = 0;
  }
  v59 = [v51 allKeys];
  v60 = [v59 sortedArrayUsingSelector:sel_compare_];

  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_9;
  v74[3] = &unk_1E6CDC758;
  id v61 = v51;
  v82 = v86;
  v83 = v85;
  id v75 = v61;
  v76 = self;
  id v62 = v69;
  id v77 = v62;
  id v63 = v54;
  id v78 = v63;
  v64 = v55;
  v79 = v64;
  v84 = v88;
  id v65 = obj;
  id v80 = v65;
  id v66 = v68;
  id v81 = v66;
  [v60 enumerateObjectsWithOptions:2 usingBlock:v74];

  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(v88, 8);
}

uint64_t __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 aspectRatio];
  double v6 = v5;
  [v4 aspectRatio];
  double v8 = v7;

  if (v6 > v8) {
    return 1;
  }
  else {
    return -1;
  }
}

void __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v26 = a2;
  double v5 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  uint64_t v6 = [v5 count];

  double v7 = [a1[5] configuration];
  uint64_t v8 = [v7 batchSize];

  uint64_t v9 = a3 - 1;
  if (v9 >= 0)
  {
    uint64_t v10 = v6 % v8;
    if (v6 % v8 >= 1)
    {
      do
      {
        v11 = [a1[6] objectAtIndexedSubscript:v9];
        v12 = [a1[4] objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 count];

        v14 = [a1[5] configuration];
        uint64_t v15 = [v14 batchSize] - v10;

        if (v15 >= v13) {
          uint64_t v16 = v13;
        }
        else {
          uint64_t v16 = v15;
        }
        v17 = [a1[4] objectForKeyedSubscript:v11];
        v18 = objc_msgSend(v17, "subarrayWithRange:", 0, v16);

        v19 = [a1[4] objectForKeyedSubscript:v26];
        v20 = [v19 arrayByAddingObjectsFromArray:v18];

        [a1[4] setObject:v20 forKeyedSubscript:v26];
        if (v13 <= v15)
        {
          [a1[4] removeObjectForKey:v11];
        }
        else
        {
          v21 = [a1[4] objectForKeyedSubscript:v11];
          v22 = objc_msgSend(v21, "subarrayWithRange:", v16, v13 - v16);

          [a1[4] setObject:v22 forKeyedSubscript:v11];
        }
        int v23 = [a1[4] objectForKeyedSubscript:v26];
        uint64_t v24 = [v23 count];

        v25 = [a1[5] configuration];
        uint64_t v10 = v24 % [v25 batchSize];

        if (v10 < 1) {
          break;
        }
        --v9;
      }
      while ((v9 & 0x8000000000000000) == 0);
    }
  }
}

void __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  double v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  v45 = v4;
  uint64_t v46 = [v4 integerValue];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        if (!a3)
        {
          [obj lastObject];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObject:v10];
        ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
        v12 = [*(id *)(a1 + 40) configuration];
        uint64_t v13 = [v12 batchSize];

        if (v11 == v13)
        {
          v14 = [*(id *)(a1 + 40) inputProvider];
          uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
          uint64_t v16 = *(void *)(a1 + 48);
          v17 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v46];
          [v17 doubleValue];
          double v19 = v18;
          v20 = [*(id *)(a1 + 40) configuration];
          v21 = [v14 inputBatchFromLineRegions:v15 image:v16 regionWidth:v20 configuration:*(void *)(a1 + 64) rectifier:v19];

          [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:v21];
          uint64_t v22 = objc_opt_new();
          uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8);
          uint64_t v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;
        }
        uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count];
        id v26 = [*(id *)(a1 + 40) configuration];
        uint64_t v27 = [v26 maxConcurrentBatches];

        if (v25 == v27)
        {
          (*(void (**)(double))(*(void *)(a1 + 80) + 16))((double)*(uint64_t *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)[*(id *)(a1 + 72) count]);
          uint64_t v28 = objc_opt_new();
          uint64_t v29 = *(void *)(*(void *)(a1 + 104) + 8);
          v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v7);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
  {
    double v31 = [*(id *)(a1 + 40) inputProvider];
    uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v33 = *(void *)(a1 + 48);
    double v34 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v46];
    [v34 doubleValue];
    double v36 = v35;
    double v37 = [*(id *)(a1 + 40) configuration];
    v38 = [v31 inputBatchFromLineRegions:v32 image:v33 regionWidth:v37 configuration:*(void *)(a1 + 64) rectifier:v36];

    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:v38];
    uint64_t v39 = objc_opt_new();
    uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
    v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
  {
    (*(void (**)(double))(*(void *)(a1 + 80) + 16))((double)*(uint64_t *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)[*(id *)(a1 + 72) count]);
    uint64_t v42 = objc_opt_new();
    uint64_t v43 = *(void *)(*(void *)(a1 + 104) + 8);
    v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  }
}

- (CRTextRecognizerModelInputProvider)inputProvider
{
  return (CRTextRecognizerModelInputProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputProvider:(id)a3
{
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inputProvider, 0);
}

@end