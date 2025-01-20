@interface PSTrialClient
@end

@implementation PSTrialClient

void __22___PSTrialClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Namespace updated", v3, 2u);
    }

    [WeakRetained updateFactors];
  }
}

void __31___PSTrialClient_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  v4 = a2;
  [v3 refresh];
  uint64_t v5 = [*(id *)(a1 + 32) recipe];
  v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = (id)v4[3];
  v4[3] = 0;
}

void __30___PSTrialClient_rankingModel__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[3]);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v4 = v3[1];
    if (v4)
    {
      uint64_t v5 = [v4 levelForFactor:@"psSuggestionsRankingModel.mlmodelc" withNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];
      v6 = [v5 directoryValue];
      id v7 = [v6 path];

      if (v7)
      {
        v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
        v9 = +[_PSLogging rewriteChannel];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __30___PSTrialClient_rankingModel__block_invoke_cold_4((uint64_t)v8, v9);
        }

        uint64_t v10 = [*(id *)(a1 + 32) loadCoreMLModel:v8 config:0];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v14 = +[_PSLogging generalChannel];
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v16[0] = 0;
            _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Loaded model successfully", (uint8_t *)v16, 2u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          __30___PSTrialClient_rankingModel__block_invoke_cold_3(v15);
        }

        objc_storeStrong(v3 + 3, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      }
      else
      {
        v8 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          __30___PSTrialClient_rankingModel__block_invoke_cold_2(v8);
        }
      }
    }
    else
    {
      uint64_t v5 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        __30___PSTrialClient_rankingModel__block_invoke_cold_1(v5);
      }
    }
  }
}

void __24___PSTrialClient_recipe__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a2 + 8) levelForFactor:@"psRecipe" withNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];
  id v4 = [v3 fileValue];
  uint64_t v5 = [v4 path];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = [v3 fileValue];
    v8 = [v7 path];
    v9 = [v6 fileURLWithPath:v8 isDirectory:0];

    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:1 error:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else
    {
      v21 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __24___PSTrialClient_recipe__block_invoke_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else
  {
    v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __24___PSTrialClient_recipe__block_invoke_cold_1(v9, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

uint64_t __36___PSTrialClient_getTrialExperiment__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) experimentIdentifiersWithNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __31___PSTrialClient_objectForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a2 + 16) objectForKeyedSubscript:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A314B000, log, OS_LOG_TYPE_FAULT, "_PSTrialClient is nil", v1, 2u);
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  v2 = @"psSuggestionsRankingModel.mlmodelc";
  _os_log_fault_impl(&dword_1A314B000, log, OS_LOG_TYPE_FAULT, "_PSTrialClient: Directory path is nil for Factor %@", (uint8_t *)&v1, 0xCu);
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  v2 = @"psSuggestionsRankingModel.mlmodelc";
  _os_log_fault_impl(&dword_1A314B000, log, OS_LOG_TYPE_FAULT, "_PSTrialClient: Loaded model is nil for %@", (uint8_t *)&v1, 0xCu);
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "_PSTrialClient: Using CoreML model from %@", (uint8_t *)&v2, 0xCu);
}

void __24___PSTrialClient_recipe__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24___PSTrialClient_recipe__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end