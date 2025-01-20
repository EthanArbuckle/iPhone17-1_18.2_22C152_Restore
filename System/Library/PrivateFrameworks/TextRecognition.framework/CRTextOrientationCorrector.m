@interface CRTextOrientationCorrector
- (BOOL)_loadResourcesWithError:(id *)a3;
- (BOOL)decodeOutputForInput:(id)a3 shouldDecodeScriptResult:(BOOL)a4 shouldDecodeOrientationResult:(BOOL)a5 shouldDecodeLayoutDirectionResult:(BOOL)a6 error:(id *)a7;
- (CRCTCCVNLPOrientationDecoder)decoder;
- (CRTextOrientationCorrector)initWithOptions:(id)a3 error:(id *)a4;
- (CRTextOrientationModelV1)model;
- (CRTextOrientationRecognizerConfiguration)configuration;
- (id)_indexSetFromIndices:(id)a3;
- (id)_lineRegion:(id)a3 applyingAngleDirection:(int64_t)a4;
- (id)_localeSortedRegions:(id)a3 indexSet:(id)a4;
- (id)regionsByCorrectingOrientationOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7;
- (id)regionsByCorrectingSequenceScriptOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7;
- (int64_t)_angleDirectionOfBaselineAngle:(double)a3;
- (int64_t)_orientationForBaselineAngle:(double)a3;
- (int64_t)_orientationForBaselineAngle:(double)a3 layoutDirection:(unint64_t)a4;
- (int64_t)calculateAngleDirectionForInput:(id)a3 error:(id *)a4;
- (int64_t)calculateAngleDirectionForTextFeatureInfo:(id)a3 error:(id *)a4;
- (unint64_t)calculateLayoutDirectionForInput:(id)a3 error:(id *)a4;
- (void)_correctScriptOnRegions:(id)a3 indexes:(id)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7;
- (void)_scriptCorrectionBasedOnLayoutDirectionOnLineRegions:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDecoder:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation CRTextOrientationCorrector

- (CRTextOrientationCorrector)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRTextOrientationCorrector;
  v7 = [(CRTextOrientationCorrector *)&v28 init];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  id v27 = 0;
  v8 = [[CRTextOrientationRecognizerConfiguration alloc] initWithImageReaderOptions:v6 error:&v27];
  id v9 = v27;
  configuration = v7->_configuration;
  v7->_configuration = v8;

  if (!v7->_configuration)
  {
    v21 = CROSLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      v22 = "Could not initialize orientation corrector configuration. %@";
      goto LABEL_10;
    }
LABEL_14:

    goto LABEL_15;
  }
  v11 = [CRTextOrientationModelV1 alloc];
  v12 = v7->_configuration;
  id v26 = v9;
  uint64_t v13 = [(CRTextSequenceRecognizerModelEspresso *)v11 initWithConfiguration:v12 error:&v26];
  id v14 = v26;

  model = v7->_model;
  v7->_model = (CRTextOrientationModelV1 *)v13;

  if (!v7->_model)
  {
    v21 = CROSLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v14;
      _os_log_impl(&dword_1DD733000, v21, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector model. %@", buf, 0xCu);
    }
    id v9 = v14;
    goto LABEL_14;
  }
  v16 = [CRCTCCVNLPOrientationDecoder alloc];
  v17 = v7->_configuration;
  v18 = v7->_model;
  id v25 = v14;
  uint64_t v19 = [(CRCTCCVNLPOrientationDecoder *)v16 initWithConfiguration:v17 model:v18 error:&v25];
  id v9 = v25;

  decoder = v7->_decoder;
  v7->_decoder = (CRCTCCVNLPOrientationDecoder *)v19;

  if (!v7->_decoder)
  {
    v21 = CROSLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      v22 = "Could not initialize orientation corrector decoder. %@";
LABEL_10:
      _os_log_impl(&dword_1DD733000, v21, OS_LOG_TYPE_FAULT, v22, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_15:
  if (!v7->_model || !v7->_decoder)
  {
    v23 = 0;
    goto LABEL_21;
  }
LABEL_17:
  if (a4) {
    *a4 = v9;
  }
  v23 = v7;
LABEL_21:

  return v23;
}

- (BOOL)decodeOutputForInput:(id)a3 shouldDecodeScriptResult:(BOOL)a4 shouldDecodeOrientationResult:(BOOL)a5 shouldDecodeLayoutDirectionResult:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  model = self->_model;
  v27[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v24 = 0;
  v15 = [(CRTextSequenceRecognizerModelEspresso *)model predictFromInputs:v14 error:&v24];
  id v16 = v24;

  if (v16)
  {
    if (a7) {
      *a7 = v16;
    }
    v17 = CROSLogForCategory(0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v26 = v16;
    v18 = "Orientation correction model inference error. %@";
    goto LABEL_11;
  }
  decoder = self->_decoder;
  v20 = [v15 firstObject];
  id v23 = 0;
  -[CRCTCCVNLPOrientationDecoder decodeOutput:imageSize:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:](decoder, "decodeOutput:imageSize:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:", v20, v10, v9, v8, &v23, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v16 = v23;

  if (!v16)
  {
    BOOL v21 = 1;
    goto LABEL_13;
  }
  if (a7) {
    *a7 = v16;
  }
  v17 = CROSLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v16;
    v18 = "Orientation correction decoding error. %@";
LABEL_11:
    _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
  }
LABEL_12:

  BOOL v21 = 0;
LABEL_13:

  return v21;
}

- (int64_t)calculateAngleDirectionForInput:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4 && *a4)
  {
LABEL_25:
    int64_t v19 = 0;
    goto LABEL_26;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [v5 textFeatureInfo];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v8)
  {

    uint64_t v10 = 0;
    uint64_t v11 = 0;
LABEL_22:
    v20 = CROSLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = v11;
      _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEBUG, "Could not determine orientation for width %ld positive and %ld negative", buf, 0x16u);
    }

    goto LABEL_25;
  }
  uint64_t v9 = v8;
  v22 = v6;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
      if (v14 && *(double *)(v14 + 32) > 0.1)
      {
        v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) lineRegion];
        id v16 = [v15 boundingQuad];
        [v16 baselineAngle];
        int64_t v17 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

        uint64_t v18 = 1;
        if (*(void *)(v14 + 24) == 2) {
          uint64_t v18 = 2;
        }
        if (v17 == v18) {
          ++v10;
        }
        else {
          ++v11;
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v9);

  if (v10 <= v11)
  {
    id v6 = v22;
    if (v11 > v10)
    {
      int64_t v19 = 2;
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  int64_t v19 = 1;
  id v6 = v22;
LABEL_26:

  return v19;
}

- (unint64_t)calculateLayoutDirectionForInput:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4 && *a4)
  {
    unint64_t v7 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend(v5, "textFeatureInfo", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (v15) {
            uint64_t v15 = *(void *)(v15 + 72);
          }
          if (v15 == 5) {
            ++v12;
          }
          else {
            ++v11;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    if (v12 <= v11) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 5;
    }
  }

  return v7;
}

- (int64_t)calculateAngleDirectionForTextFeatureInfo:(id)a3 error:(id *)a4
{
  id v6 = (double *)a3;
  unint64_t v7 = v6;
  if (a4 && *a4)
  {
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v6 lineRegion];
    uint64_t v10 = [v9 boundingQuad];
    [v10 baselineAngle];
    int64_t v8 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

    if (v7 && v7[4] > 0.1)
    {
      uint64_t v11 = 1;
      if (v8 != 2) {
        uint64_t v11 = 2;
      }
      if (*((void *)v7 + 3) == 2) {
        int64_t v8 = v11;
      }
    }
  }

  return v8;
}

- (id)regionsByCorrectingOrientationOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v29 = a5;
  id v30 = a6;
  uint64_t v11 = [(CRTextOrientationCorrector *)self model];
  if (v11)
  {

LABEL_4:
    uint64_t v12 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v13 = v31;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          long long v19 = NSNumber;
          long long v20 = [v18 boundingQuad];
          [v20 baselineAngle];
          uint64_t v22 = objc_msgSend(v19, "numberWithInteger:", -[CRTextOrientationCorrector _orientationForBaselineAngle:layoutDirection:](self, "_orientationForBaselineAngle:layoutDirection:", objc_msgSend(v18, "layoutDirection"), v21));

          if (a4 || [v18 shouldRunSequenceOrientation])
          {
            id v23 = [v12 objectForKeyedSubscript:v22];
            BOOL v24 = v23 == 0;

            if (v24)
            {
              long long v25 = [[CROrderedIndexSet alloc] initWithArray:v13];
              [v12 setObject:v25 forKeyedSubscript:v22];
            }
            long long v26 = [v12 objectForKeyedSubscript:v22];
            [v26 addIndex:v15 + i];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v52 count:16];
        v15 += i;
      }
      while (v14);
    }

    *(void *)buf = 0;
    v43 = buf;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__10;
    v46 = __Block_byref_object_dispose__10;
    id v47 = (id)[v13 mutableCopy];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__10;
    v40[4] = __Block_byref_object_dispose__10;
    id v41 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke;
    v33[3] = &unk_1E6CDB8C0;
    v33[4] = self;
    id v34 = v13;
    BOOL v39 = a4;
    id v35 = v29;
    id v36 = v30;
    v37 = v40;
    v38 = buf;
    [v12 enumerateKeysAndObjectsUsingBlock:v33];
    long long v27 = (void *)[*((id *)v43 + 5) copy];

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_17;
  }
  if ([(CRTextOrientationCorrector *)self _loadResourcesWithError:a7]) {
    goto LABEL_4;
  }
  uint64_t v12 = CROSLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "Orientation corrector unable to load resources", buf, 2u);
  }
  long long v27 = 0;
LABEL_17:

  return v27;
}

void __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v65 = a2;
  uint64_t v78 = a1;
  id v68 = a3;
  v67 = objc_msgSend(*(id *)(a1 + 32), "_localeSortedRegions:indexSet:", *(void *)(a1 + 40));
  uint64_t v6 = a1;
  int v69 = *(unsigned __int8 *)(a1 + 80);
  if (*(unsigned char *)(a1 + 80))
  {
    id v7 = v67;
  }
  else
  {
    int64_t v8 = objc_msgSend(*(id *)(a1 + 32), "configuration", v65);
    unint64_t v9 = [v8 batchSize];

    unint64_t v10 = [v67 count];
    if (v9 >= v10) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v9;
    }
    objc_msgSend(v67, "subIndexSetWithRange:", 0, v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v78;
  }
  v73 = v7;
  if (objc_msgSend(v7, "count", v65))
  {
    LODWORD(v72) = 0;
    while (1)
    {
      uint64_t v12 = [*(id *)(v6 + 32) configuration];
      [v12 batchSize];

      [v73 count];
      v77 = objc_msgSend(v73, "subIndexSetWithRange:");
      v93[0] = 0;
      v93[1] = v93;
      v93[2] = 0x2020000000;
      v93[3] = -1;
      uint64_t v89 = 0;
      v90 = &v89;
      uint64_t v91 = 0x2020000000;
      uint64_t v92 = 0;
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2;
      v88[3] = &unk_1E6CDB898;
      v88[4] = v93;
      v88[5] = &v89;
      [v77 enumerateObjectsUsingBlock:v88];
      v74 = [v77 objects];
      id v13 = [*(id *)(v78 + 32) configuration];
      uint64_t v14 = [v13 inputWidths];
      uint64_t v15 = [*(id *)(v78 + 32) configuration];
      uint64_t v16 = [v74 objectAtIndexedSubscript:v90[3]];
      [v16 aspectRatio];
      long long v17 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v15, "bestFitWidthIndexForAspectRatio:"));
      [v17 doubleValue];
      double v19 = v18;

      long long v20 = [*(id *)(v78 + 32) model];
      uint64_t v21 = *(void *)(v78 + 48);
      uint64_t v22 = [*(id *)(v78 + 32) configuration];
      v75 = [v20 inputBatchFromLineRegions:v74 image:v21 regionWidth:v22 configuration:*(void *)(v78 + 56) rectifier:v19];

      uint64_t v23 = v78;
      BOOL v24 = *(void **)(v78 + 32);
      id v87 = 0;
      int v25 = [v24 decodeOutputForInput:v75 shouldDecodeScriptResult:0 shouldDecodeOrientationResult:1 shouldDecodeLayoutDirectionResult:1 error:&v87];
      id v26 = v87;
      id v27 = v87;
      if (v27)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(v78 + 64) + 8) + 40), v26);
        *a4 = 1;
        uint64_t v23 = v78;
      }
      if (!v25) {
        goto LABEL_48;
      }
      if (v69)
      {
        for (unint64_t i = 0; [v77 count] > i; ++i)
        {
          id v29 = [v75 textFeatureInfo];
          id v30 = [v29 objectAtIndexedSubscript:i];

          id v31 = *(void **)(v78 + 32);
          v32 = v27;
          id v86 = v27;
          uint64_t v33 = [v31 calculateAngleDirectionForTextFeatureInfo:v30 error:&v86];
          id v27 = v86;

          id v34 = [v77 indices];
          id v35 = [v34 objectAtIndexedSubscript:i];

          id v36 = objc_msgSend(*(id *)(v78 + 40), "objectAtIndexedSubscript:", objc_msgSend(v35, "integerValue"));
          v37 = [*(id *)(v78 + 32) _lineRegion:v36 applyingAngleDirection:v33];
          v38 = (void *)[v37 mutableCopy];

          if (v30)
          {
            if (v30[9]) {
              objc_msgSend(v38, "setLayoutDirection:");
            }
          }
          BOOL v39 = [v36 uuid];
          [v38 setUuid:v39];

          objc_msgSend(*(id *)(*(void *)(*(void *)(v78 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v38, objc_msgSend(v35, "integerValue"));
        }
        goto LABEL_48;
      }
      v40 = *(void **)(v23 + 32);
      id v85 = v27;
      uint64_t v41 = [v40 calculateAngleDirectionForInput:v75 error:&v85];
      id v42 = v85;

      v43 = *(void **)(v78 + 32);
      id v84 = v42;
      unint64_t v44 = [v43 calculateLayoutDirectionForInput:v75 error:&v84];
      id v45 = v84;
      id v70 = v84;

      if (v70)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(v78 + 64) + 8) + 40), v45);
        *a4 = 1;
      }
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v46 = [v68 indices];
      uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v47) {
        break;
      }
LABEL_47:

      id v27 = v70;
LABEL_48:

      _Block_object_dispose(&v89, 8);
      _Block_object_dispose(v93, 8);

      v63 = [*(id *)(v78 + 32) configuration];
      int v64 = [v63 batchSize];

      unint64_t v72 = v64 + (int)v72;
      uint64_t v6 = v78;
      if (v72 >= [v73 count]) {
        goto LABEL_49;
      }
    }
    uint64_t v48 = *(void *)v81;
    id obj = v46;
LABEL_23:
    uint64_t v49 = 0;
    while (1)
    {
      if (*(void *)v81 != v48) {
        objc_enumerationMutation(obj);
      }
      long long v50 = *(void **)(*((void *)&v80 + 1) + 8 * v49);
      long long v51 = objc_msgSend(*(id *)(v78 + 40), "objectAtIndexedSubscript:", objc_msgSend(v50, "integerValue"));
      if (v41)
      {
        v52 = [*(id *)(v78 + 32) _lineRegion:v51 applyingAngleDirection:v41];
        uint64_t v53 = [v52 mutableCopy];
      }
      else
      {
        v56 = [v77 indices];
        uint64_t v57 = [v56 indexOfObject:v50];

        v58 = CROSLogForCategory(0);
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
        if (v57 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v59)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD733000, v58, OS_LOG_TYPE_DEBUG, "Orientation correction fallback using detector orientation results", buf, 2u);
          }

          if (![v51 shouldRotate180DetectorOrientationFallback])
          {
            v54 = (void *)[v51 mutableCopy];
            goto LABEL_30;
          }
          v52 = [v51 rotated180];
          uint64_t v53 = [v52 mutableCopy];
        }
        else
        {
          if (v59)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD733000, v58, OS_LOG_TYPE_DEBUG, "Orientation correction fallback using sequence orientation results", buf, 2u);
          }

          v60 = [v75 textFeatureInfo];
          v52 = [v60 objectAtIndexedSubscript:v57];

          if (v52 && v52[3] == 2)
          {
            v61 = [v51 rotated180];
            v54 = (void *)[v61 mutableCopy];

            goto LABEL_29;
          }
          uint64_t v53 = [v51 mutableCopy];
        }
      }
      v54 = (void *)v53;
LABEL_29:

LABEL_30:
      if (v44 >= 2) {
        [v54 setLayoutDirection:v44];
      }
      v55 = [v51 uuid];
      [v54 setUuid:v55];

      objc_msgSend(*(id *)(*(void *)(*(void *)(v78 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v54, objc_msgSend(v50, "integerValue"));
      if (v47 == ++v49)
      {
        v46 = obj;
        uint64_t v62 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
        uint64_t v47 = v62;
        if (!v62) {
          goto LABEL_47;
        }
        goto LABEL_23;
      }
    }
  }
LABEL_49:
}

uint64_t __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v4 + 24) > a3)
  {
    *(void *)(v4 + 24) = a3;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a4;
  }
  return result;
}

- (id)regionsByCorrectingSequenceScriptOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(CRTextOrientationCorrector *)self model];
  if (v15)
  {

LABEL_4:
    *(void *)buf = 0;
    v40 = buf;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__10;
    v43 = __Block_byref_object_dispose__10;
    id v44 = 0;
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke;
    v36[3] = &unk_1E6CDB8E8;
    BOOL v38 = a4;
    id v17 = v16;
    id v37 = v17;
    [v12 enumerateObjectsUsingBlock:v36];
    double v18 = (void *)[v12 mutableCopy];
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2;
    v29[3] = &unk_1E6CDB910;
    id v20 = v19;
    id v30 = v20;
    id v31 = self;
    id v21 = v18;
    id v32 = v21;
    id v22 = v13;
    id v33 = v22;
    id v23 = v14;
    id v34 = v23;
    id v35 = buf;
    [v17 enumerateIndexesUsingBlock:v29];
    if ([v20 count])
    {
      BOOL v24 = (id *)(v40 + 40);
      id obj = (id)*((void *)v40 + 5);
      [(CRTextOrientationCorrector *)self _correctScriptOnRegions:v21 indexes:v20 image:v22 rectifier:v23 error:&obj];
      objc_storeStrong(v24, obj);
    }
    [(CRTextOrientationCorrector *)self _scriptCorrectionBasedOnLayoutDirectionOnLineRegions:v21];
    int v25 = (void *)[v21 copy];

    _Block_object_dispose(buf, 8);
    goto LABEL_7;
  }
  if ([(CRTextOrientationCorrector *)self _loadResourcesWithError:a7]) {
    goto LABEL_4;
  }
  id v27 = CROSLogForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v27, OS_LOG_TYPE_FAULT, "Orientation corrector unable to load resources", buf, 2u);
  }

  int v25 = 0;
LABEL_7:

  return v25;
}

void __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 40) || [v5 shouldRunSequenceScript]) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

void __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addIndex:a2];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  uint64_t v4 = [*(id *)(a1 + 40) configuration];
  uint64_t v5 = [v4 batchSize];

  if (v3 == v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    id v15 = 0;
    [v6 _correctScriptOnRegions:v8 indexes:v7 image:v9 rectifier:v10 error:&v15];
    id v11 = v15;
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
    id v14 = v11;

    [*(id *)(a1 + 32) removeAllIndexes];
  }
}

- (void)_correctScriptOnRegions:(id)a3 indexes:(id)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v26 = a5;
  id v13 = a6;
  id v14 = [v11 objectsAtIndexes:v12];
  id v15 = [(CRTextOrientationCorrector *)self configuration];
  id v16 = [v15 inputWidths];
  id v17 = [(CRTextOrientationCorrector *)self configuration];
  double v18 = [v14 firstObject];
  [v18 aspectRatio];
  id v19 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v17, "bestFitWidthIndexForAspectRatio:"));
  [v19 doubleValue];
  double v21 = v20;

  id v22 = [(CRTextOrientationCorrector *)self model];
  id v23 = [(CRTextOrientationCorrector *)self configuration];
  BOOL v24 = [v22 inputBatchFromLineRegions:v14 image:v26 regionWidth:v23 configuration:v13 rectifier:v21];

  id v32 = 0;
  LODWORD(v22) = [(CRTextOrientationCorrector *)self decodeOutputForInput:v24 shouldDecodeScriptResult:1 shouldDecodeOrientationResult:0 shouldDecodeLayoutDirectionResult:0 error:&v32];
  id v25 = v32;
  if (v22)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __84__CRTextOrientationCorrector__correctScriptOnRegions_indexes_image_rectifier_error___block_invoke;
    v27[3] = &unk_1E6CDB938;
    id v28 = v11;
    id v30 = v31;
    id v29 = v24;
    [v12 enumerateIndexesUsingBlock:v27];

    _Block_object_dispose(v31, 8);
  }
}

void __84__CRTextOrientationCorrector__correctScriptOnRegions_indexes_image_rectifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v6 = [*(id *)(a1 + 40) textFeatureInfo];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    id v11 = [*(id *)(a1 + 40) textFeatureInfo];
    uint64_t v8 = [v11 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v12 = [v8 lineRegion];

    if (v4 != v12)
    {
      uint64_t v9 = CROSLogForCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_8:

        goto LABEL_21;
      }
      uint64_t v10 = [v4 boundingQuad];
      id v14 = [v10 denormalizedQuad];
      int v34 = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_DEBUG, "Skiping script on region with quads %@", (uint8_t *)&v34, 0xCu);

LABEL_7:
      goto LABEL_8;
    }
    if (v8)
    {
      id v15 = objc_getProperty(v8, v13, 48, 1);
      if (v15)
      {
        id v17 = v15;
        id v18 = [v4 topScriptCategory];
        id v20 = objc_getProperty(v8, v19, 48, 1);

        if (v18 != v20)
        {
          double v21 = (void *)[v4 mutableCopy];
          id v23 = objc_getProperty(v8, v22, 48, 1);
          [v21 setTopScriptCategory:v23];

          id v25 = objc_getProperty(v8, v24, 56, 1);
          if (!v25)
          {
LABEL_20:
            id v33 = [v4 uuid];
            [v21 setUuid:v33];

            [*(id *)(a1 + 32) setObject:v21 atIndexedSubscript:a2];
            goto LABEL_21;
          }
          id v27 = objc_getProperty(v8, v26, 56, 1);
LABEL_19:
          id v32 = v27;
          [v21 setSequenceScriptOutputResult:v27];

          goto LABEL_20;
        }
      }
      id Property = objc_getProperty(v8, v16, 56, 1);
    }
    else
    {
      id Property = 0;
    }
    id v29 = Property;

    if (!v29) {
      goto LABEL_21;
    }
    double v21 = (void *)[v4 mutableCopy];
    if (v8) {
      id v31 = objc_getProperty(v8, v30, 56, 1);
    }
    else {
      id v31 = 0;
    }
    id v27 = v31;
    goto LABEL_19;
  }
  uint64_t v8 = CROSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v4 boundingQuad];
    uint64_t v10 = [v9 denormalizedQuad];
    int v34 = 138412290;
    id v35 = v10;
    _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEBUG, "Skiping script on region with quads %@", (uint8_t *)&v34, 0xCu);
    goto LABEL_7;
  }
LABEL_21:
}

- (BOOL)_loadResourcesWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [CRTextOrientationModelV1 alloc];
  configuration = self->_configuration;
  id v20 = 0;
  uint64_t v7 = [(CRTextSequenceRecognizerModelEspresso *)v5 initWithConfiguration:configuration error:&v20];
  id v8 = v20;
  model = self->_model;
  self->_model = v7;

  if (a3) {
    *a3 = v8;
  }
  if (!self->_model)
  {
    id v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector model. %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  uint64_t v10 = [CRCTCCVNLPOrientationDecoder alloc];
  id v11 = self->_configuration;
  id v12 = self->_model;
  id v19 = v8;
  id v13 = [(CRCTCCVNLPOrientationDecoder *)v10 initWithConfiguration:v11 model:v12 error:&v19];
  id v14 = v19;

  decoder = self->_decoder;
  self->_decoder = v13;

  if (a3) {
    *a3 = v14;
  }
  if (!self->_decoder)
  {
    id v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector decoder. %@", buf, 0xCu);
    }
    id v8 = v14;
LABEL_12:

    id v14 = v8;
  }
  if (self->_model) {
    BOOL v17 = self->_decoder != 0;
  }
  else {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_lineRegion:(id)a3 applyingAngleDirection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 boundingQuad];
  [v7 baselineAngle];
  int64_t v8 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

  if (v8 == a4)
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [v6 rotated180];
  }
  uint64_t v10 = v9;

  return v10;
}

- (int64_t)_orientationForBaselineAngle:(double)a3
{
  if (a3 <= 3.14159265)
  {
    if (a3 > -3.14159265) {
      goto LABEL_6;
    }
    double v3 = 6.28318531;
  }
  else
  {
    double v3 = -6.28318531;
  }
  a3 = a3 + v3;
LABEL_6:
  double v4 = fabs(a3);
  return v4 >= 1.22 && v4 <= 1.92;
}

- (int64_t)_orientationForBaselineAngle:(double)a3 layoutDirection:(unint64_t)a4
{
  if (a4 == 5) {
    return 2;
  }
  else {
    return -[CRTextOrientationCorrector _orientationForBaselineAngle:](self, "_orientationForBaselineAngle:", a3, v4, v5) == 1;
  }
}

- (int64_t)_angleDirectionOfBaselineAngle:(double)a3
{
  double v3 = a3;
  if (a3 <= 3.14159265)
  {
    if (a3 > -3.14159265) {
      goto LABEL_6;
    }
    double v4 = 6.28318531;
  }
  else
  {
    double v4 = -6.28318531;
  }
  double v3 = v3 + v4;
LABEL_6:
  int64_t v5 = [(CRTextOrientationCorrector *)self _orientationForBaselineAngle:v3];
  BOOL v7 = fabs(v3) > 1.92 && v5 == 0;
  if (v3 < 0.0 && v5 == 1) {
    BOOL v7 = 1;
  }
  if (v7) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_localeSortedRegions:(id)a3 indexSet:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 count];
  id v9 = [(CRTextOrientationCorrector *)self configuration];
  unint64_t v10 = [v9 batchSize];

  if (v8 < v10)
  {
    id v11 = (CROrderedIndexSet *)v7;
    goto LABEL_19;
  }
  id v12 = objc_opt_new();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke;
  v40[3] = &unk_1E6CDB960;
  id v13 = v12;
  id v41 = v13;
  id v35 = v6;
  id v14 = v6;
  id v42 = v14;
  id v34 = v7;
  [v7 enumerateObjectsUsingBlock:v40];
  id v15 = [v13 keysSortedByValueUsingComparator:&__block_literal_global_17];
  id v11 = [[CROrderedIndexSet alloc] initWithArray:v14];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (!v17) {
    goto LABEL_14;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v37 != v19) {
        objc_enumerationMutation(v16);
      }
      double v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v22 = +[CRScriptCategoryV1 common]();
      if (v21 != (void *)v22)
      {
        uint64_t v23 = (void *)v22;
        SEL v24 = +[CRScriptCategoryV1 unknown]();

        if (v21 == v24) {
          continue;
        }
        double v21 = [v13 objectForKeyedSubscript:v21];
        [(CROrderedIndexSet *)v11 addIndexSet:v21];
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v43 count:16];
  }
  while (v18);
LABEL_14:

  id v25 = +[CRScriptCategoryV1 common]();
  id v26 = [v13 objectForKeyedSubscript:v25];

  if (v26)
  {
    id v27 = +[CRScriptCategoryV1 common]();
    id v28 = [v13 objectForKeyedSubscript:v27];
    [(CROrderedIndexSet *)v11 addIndexSet:v28];
  }
  id v29 = +[CRScriptCategoryV1 unknown]();
  id v30 = [v13 objectForKeyedSubscript:v29];

  if (v30)
  {
    id v31 = +[CRScriptCategoryV1 unknown]();
    id v32 = [v13 objectForKeyedSubscript:v31];
    [(CROrderedIndexSet *)v11 addIndexSet:v32];
  }
  id v7 = v34;
  id v6 = v35;
LABEL_19:

  return v11;
}

void __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 topScriptCategory];
  if (!v6)
  {
    id v6 = +[CRScriptCategoryV1 unknown]();
  }
  id v7 = +[CRScriptCategoryV1 latinCyrillic]();

  if (v6 == v7)
  {
    unint64_t v8 = [v5 scriptCategoryResults];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"probability" ascending:0];
    v22[0] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v11 = [v8 sortedArrayUsingDescriptors:v10];
    id v12 = [v11 firstObject];

    id v13 = [v12 scriptCategory];
    uint64_t v14 = +[CRScriptCategoryV1 common]();
    if (v13 == (void *)v14)
    {
    }
    else
    {
      id v15 = (void *)v14;
      id v16 = [v12 scriptCategory];
      uint64_t v17 = +[CRScriptCategoryV1 unknown]();

      if (v16 != v17)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    uint64_t v18 = [v12 scriptCategory];

    id v6 = (void *)v18;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v19 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (!v19)
  {
    id v20 = [[CROrderedIndexSet alloc] initWithArray:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:v6];
  }
  double v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  [v21 addIndex:a3];
}

uint64_t __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    if (v8 <= [v5 count]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)_scriptCorrectionBasedOnLayoutDirectionOnLineRegions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke;
  v27[3] = &unk_1E6CDB9A8;
  id v6 = v5;
  id v28 = v6;
  id v7 = v4;
  id v29 = v7;
  [v3 enumerateObjectsUsingBlock:v27];
  if ([v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unint64_t v8 = +[CRScriptCategoryV1 verticalLayoutSupportedCategories];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v19 = v3;
      id v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unint64_t v16 = [v7 countForObject:v15];
          if (v16 > v12)
          {
            unint64_t v17 = v16;
            id v18 = v15;

            id v11 = v18;
            unint64_t v12 = v17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v10);

      if (!v12 || !v11)
      {
        id v3 = v19;
        goto LABEL_17;
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke_2;
      v20[3] = &unk_1E6CDB9D0;
      id v3 = v19;
      id v21 = v19;
      id v11 = v11;
      id v22 = v11;
      [v6 enumerateIndexesUsingBlock:v20];

      unint64_t v8 = v21;
    }
    else
    {
      id v11 = 0;
    }

LABEL_17:
  }
}

void __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([v8 layoutDirection] == 5) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
  id v5 = [v8 topScriptCategory];

  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v8 topScriptCategory];
    [v6 addObject:v7];
  }
}

void __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v3 = +[CRScriptCategoryV1 verticalLayoutSupportedCategories];
  id v4 = [v6 topScriptCategory];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0) {
    [v6 setTopScriptCategory:*(void *)(a1 + 40)];
  }
}

- (id)_indexSetFromIndices:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CRTextOrientationModelV1)model
{
  return (CRTextOrientationModelV1 *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModel:(id)a3
{
}

- (CRCTCCVNLPOrientationDecoder)decoder
{
  return (CRCTCCVNLPOrientationDecoder *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDecoder:(id)a3
{
}

- (CRTextOrientationRecognizerConfiguration)configuration
{
  return (CRTextOrientationRecognizerConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end