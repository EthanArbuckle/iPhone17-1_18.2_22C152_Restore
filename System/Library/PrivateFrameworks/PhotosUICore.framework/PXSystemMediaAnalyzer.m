@interface PXSystemMediaAnalyzer
- (id)requestAnalysisForAssets:(id)a3 options:(unint64_t)a4 contexts:(id)a5 resultHandler:(id)a6;
- (id)requestMatchedTimeRangesForAsset:(id)a3 searchQueryMatchInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation PXSystemMediaAnalyzer

- (id)requestMatchedTimeRangesForAsset:(id)a3 searchQueryMatchInfo:(id)a4 resultHandler:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void))a5;
  id v12 = v9;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_31;
  }
  id v13 = v12;

  if (!v13)
  {
LABEL_31:
    v34 = PLUIGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v12;
      _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Unable to analyze unsupported asset: %@", buf, 0xCu);
    }

    v11[2](v11, MEMORY[0x1E4F1CBF0]);
    id v13 = 0;
    goto LABEL_34;
  }
  if (!v11)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"PXMediaAnalyzer.m", 106, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];
  }
  v14 = [v10 personLocalIdentifiers];
  if ([v14 count]) {
    goto LABEL_13;
  }
  v15 = [v10 sceneIdentifiers];
  if (![v15 count])
  {
    v16 = [v10 audioIdentifiers];
    if ([v16 count])
    {
LABEL_11:

      goto LABEL_12;
    }
    v17 = [v10 humanActionIdentifiers];
    if ([v17 count])
    {

      goto LABEL_11;
    }
    v43 = [v10 queryEmbedding];

    if (v43) {
      goto LABEL_14;
    }
    v44 = PLUIGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = [v13 localIdentifier];
      *(_DWORD *)buf = 138412290;
      id v73 = v45;
      _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: No identifiers provided. Skipping matched time range request for asset: %@", buf, 0xCu);
    }
    v11[2](v11, MEMORY[0x1E4F1CBF0]);
LABEL_34:
    id v35 = 0;
    goto LABEL_35;
  }
LABEL_12:

LABEL_13:
LABEL_14:
  v18 = PLUIGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = [v13 localIdentifier];
    *(_DWORD *)buf = 138412546;
    id v73 = v19;
    __int16 v74 = 2112;
    id v75 = v10;
    _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Requesting matched time ranges for asset: %@, searchQueryMatchInfo: %@", buf, 0x16u);
  }
  uint64_t v20 = [MEMORY[0x1E4F744F0] sharedMediaAnalyzer];
  id v55 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  [v55 setTotalUnitCount:101];
  id v53 = objc_alloc(MEMORY[0x1E4F744F8]);
  v70[0] = &unk_1F02D7AC8;
  v52 = [v10 sceneIdentifiers];
  uint64_t v21 = [v52 allObjects];
  v22 = (void *)MEMORY[0x1E4F1CBF0];
  v51 = (void *)v21;
  if (v21) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = MEMORY[0x1E4F1CBF0];
  }
  v71[0] = v23;
  v70[1] = &unk_1F02D7AE0;
  v50 = [v10 personLocalIdentifiers];
  uint64_t v24 = [v50 allObjects];
  v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = (uint64_t)v22;
  }
  v71[1] = v26;
  v70[2] = &unk_1F02D7AF8;
  v49 = [v10 humanActionIdentifiers];
  uint64_t v27 = [v49 allObjects];
  v28 = (void *)v27;
  if (v27) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = (uint64_t)v22;
  }
  v71[2] = v29;
  v70[3] = &unk_1F02D7B10;
  v48 = [v10 audioIdentifiers];
  uint64_t v30 = [v48 allObjects];
  v31 = (void *)v30;
  if (v30) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = (uint64_t)v22;
  }
  v71[3] = v32;
  v70[4] = &unk_1F02D7B28;
  v33 = [v10 queryEmbedding];
  v56 = (void *)v20;
  if (v33)
  {
    v47 = [v10 queryEmbedding];
    v69 = v47;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  }
  v71[4] = v22;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:5];
  v54 = (void *)[v53 initWithEntities:v37];

  if (v33)
  {
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke;
  v66[3] = &unk_1E5DB9950;
  id v67 = v55;
  uint64_t v68 = 0x4059400000000000;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_2;
  v61[3] = &unk_1E5DC89F8;
  id v38 = v13;
  id v62 = v38;
  id v39 = v67;
  id v63 = v39;
  uint64_t v65 = 0x4059400000000000;
  v64 = v11;
  int v40 = [v56 findTimeRangesWithContext:v54 inAsset:v38 withOptions:0 andProgressHandler:v66 andCompletionHandler:v61];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_256;
  v57[3] = &unk_1E5DC8448;
  id v13 = v38;
  int v60 = v40;
  id v58 = v13;
  v59 = v56;
  id v41 = v56;
  [v39 setCancellationHandler:v57];
  v42 = v59;
  id v35 = v39;

LABEL_35:
  return v35;
}

uint64_t __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) setCompletedUnitCount:vcvtad_u64_f64(*(double *)(a1 + 40) * a2)];
}

void __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = PLUIGetLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 32) localIdentifier];
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      id v10 = "PXSystemMediaAnalyzer: Returning time ranges for asset: %@. TimeRanges: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v11, v12, v10, (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = [*(id *)(a1 + 32) localIdentifier];
    int v15 = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    id v10 = "PXSystemMediaAnalyzer: Failed to get timeRanges for asset: %@, error: %@";
    v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) setCompletedUnitCount:(uint64_t)*(double *)(a1 + 56)];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v13, v14);
}

uint64_t __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_256(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) localIdentifier];
    int v4 = *(_DWORD *)(a1 + 48);
    int v6 = 138412546;
    v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Canceling time range request for asset: %@, requestID: %d", (uint8_t *)&v6, 0x12u);
  }
  return [*(id *)(a1 + 40) cancelAnalysisWithRequestID:*(unsigned int *)(a1 + 48)];
}

- (id)requestAnalysisForAssets:(id)a3 options:(unint64_t)a4 contexts:(id)a5 resultHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  uint64_t v13 = [MEMORY[0x1E4F744F0] sharedMediaAnalyzer];
  double v14 = (double)(unint64_t)(100 * [v9 count]) + 1.0;
  [v12 setTotalUnitCount:(uint64_t)v14];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16 = v15;
  if ((a4 & 2) != 0)
  {
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74580]];
    uint64_t v17 = 0x40000;
    if ((a4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v17 = 0;
  if (a4) {
LABEL_5:
  }
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74550]];
LABEL_6:
  if ((a4 & 0x10) != 0) {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74558]];
  }
  uint64_t v18 = [v10 count];
  if (v18 == [v9 count]) {
    [v16 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F74568]];
  }
  unint64_t v19 = v17 & 0xFFFFFFFF7FFFFFFFLL | (((a4 >> 5) & 1) << 31);
  uint64_t v20 = v19 | 0xA00018;
  if ((a4 & 4) == 0) {
    uint64_t v20 = v19;
  }
  uint64_t v21 = v20 | (a4 << 20) & 0x800000;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke;
  v35[3] = &unk_1E5DB9900;
  id v36 = v12;
  double v37 = v14;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_2;
  v31[3] = &unk_1E5DB9928;
  id v22 = v36;
  double v34 = v14;
  id v32 = v22;
  id v33 = v11;
  id v23 = v11;
  LODWORD(v21) = [v13 requestAnalysis:v21 forAssets:v9 withOptions:v16 andProgressHandler:v35 andCompletionHandler:v31];
  [v22 setCancellable:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_3;
  v28[3] = &unk_1E5DD0180;
  uint64_t v29 = v13;
  int v30 = v21;
  id v24 = v13;
  [v22 setCancellationHandler:v28];
  v25 = v29;
  id v26 = v22;

  return v26;
}

uint64_t __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) setCompletedUnitCount:vcvtad_u64_f64(*(double *)(a1 + 40) * a2)];
}

void __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t)*(double *)(a1 + 48);
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 setCompletedUnitCount:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAnalysisWithRequestID:*(unsigned int *)(a1 + 40)];
}

@end