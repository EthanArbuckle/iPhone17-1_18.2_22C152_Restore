@interface PGSettlingEffectScoreHelper
+ (float)analyzedSettlingEffectScoreForAsset:(id)a3 requestedOnDemand:(BOOL *)a4;
+ (float)requestSettlingEffectScoreForAsset:(id)a3 error:(id *)a4;
@end

@implementation PGSettlingEffectScoreHelper

+ (float)requestSettlingEffectScoreForAsset:(id)a3 error:(id *)a4
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float v6 = 0.0;
  if ([MEMORY[0x1E4F8E858] assetIsEligibleForSettlingEffect:v5])
  {
    os_log_t v7 = os_log_create("com.apple.PhotosGraph", "suggestions");
    v31 = [MEMORY[0x1E4F744E8] analysisService];
    v56[0] = *MEMORY[0x1E4F74538];
    v56[1] = @"AllowStreaming";
    v57[0] = MEMORY[0x1E4F1CC38];
    v57[1] = MEMORY[0x1E4F1CC38];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    v9 = [v5 mediaAnalysisProperties];
    v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [v5 uuid];
      [v9 settlingEffectScore];
      float v13 = v12;
      [v9 activityScore];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      double v53 = v14;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGSettlingEffectScoreHelper] Requesting settlingEffectScore for asset:%@. (current SettlingEffectScore:%.2f, ActivityScore:%.2f)", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    double v53 = COERCE_DOUBLE(__Block_byref_object_copy__64720);
    v54 = __Block_byref_object_dispose__64721;
    id v55 = 0;
    uint64_t v43 = 0;
    v44 = (float *)&v43;
    uint64_t v45 = 0x2020000000;
    int v46 = 0;
    uint64_t v39 = 0;
    v40 = (float *)&v39;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = v10;
    os_signpost_id_t v17 = os_signpost_id_generate(v16);
    v18 = v16;
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SettingEffectScoreRequest", "", v47, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v20 = mach_absolute_time();
    id v51 = v5;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __72__PGSettlingEffectScoreHelper_requestSettlingEffectScoreForAsset_error___block_invoke_2;
    v32[3] = &unk_1E68EE7F8;
    id v33 = v5;
    v35 = &v43;
    v36 = &v39;
    v37 = buf;
    v22 = v15;
    v34 = v22;
    [v31 requestAnalysisTypes:0x40000 forAssets:v21 withOptions:v8 progressHandler:&__block_literal_global_64725 andCompletionHandler:v32];

    dispatch_time_t v23 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v22, v23);
    uint64_t v24 = mach_absolute_time();
    mach_timebase_info v25 = info;
    v26 = v19;
    v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_END, v17, "SettingEffectScoreRequest", "", v47, 2u);
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v47 = 136315394;
      double v48 = COERCE_DOUBLE("SettingEffectScoreRequest");
      __int16 v49 = 2048;
      double v50 = (float)((float)((float)((float)(v24 - v20) * (float)v25.numer) / (float)v25.denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v47, 0x16u);
    }
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      double v28 = v44[6];
      double v29 = v40[6];
      *(_DWORD *)v47 = 134218240;
      double v48 = v28;
      __int16 v49 = 2048;
      double v50 = v29;
      _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[PGSettlingEffectScoreHelper] settlingEffectScore:%.2f, activityScore:%.2f", v47, 0x16u);
    }
    float v6 = v44[6];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(buf, 8);
  }
  return v6;
}

void __72__PGSettlingEffectScoreHelper_requestSettlingEffectScoreForAsset_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  if (v17)
  {
    float v6 = [*(id *)(a1 + 32) localIdentifier];
    os_log_t v7 = [v17 objectForKeyedSubscript:v6];
    v8 = [v7 objectForKey:*MEMORY[0x1E4F744D0]];
    v9 = [v8 firstObject];

    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F744B8]];
    [v10 floatValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;

    float v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74470]];
    float v13 = [v12 objectForKeyedSubscript:@"RankingLevel"];
    [v13 floatValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = v5;
    v9 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (float)analyzedSettlingEffectScoreForAsset:(id)a3 requestedOnDemand:(BOOL *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float v6 = [v5 mediaAnalysisProperties];
  [v6 settlingEffectScore];
  float v8 = v7;

  if (v8 <= -1.0
    || ([v5 mediaAnalysisProperties],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 activityScore],
        float v11 = v10,
        v9,
        v11 == 0.5))
  {
    if (a4) {
      *a4 = 1;
    }
    id v15 = 0;
    +[PGSettlingEffectScoreHelper requestSettlingEffectScoreForAsset:v5 error:&v15];
    float v8 = v12;
    id v13 = v15;
    if (v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v13;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGSettlingEffectScoreHelper] Error requesting settlingEffectScore: %@", buf, 0xCu);
    }
  }
  return v8;
}

@end