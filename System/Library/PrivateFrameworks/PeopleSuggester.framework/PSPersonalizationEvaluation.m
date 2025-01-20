@interface PSPersonalizationEvaluation
@end

@implementation PSPersonalizationEvaluation

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 task];
  v5 = [v4 error];

  if (v5)
  {
    v6 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_cold_1(v6, v3);
    }
  }
  if (((*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))() & 1) == 0)
  {
    v7 = [v3 task];
    [v7 cancel];

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_350(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }
  v6 = [v3 model];
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v6 writeToURL:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (*(void *)(*(void *)(a1[5] + 8) + 40) || (v9 & 1) == 0)
  {
    v10 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_139_cold_1((uint64_t)(a1 + 5), v10, v11, v12, v13, v14, v15, v16);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = [a2 task];
  uint64_t v5 = [v4 error];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, v3, OS_LOG_TYPE_ERROR, "context.task.error: %@", v6, 0xCu);
}

@end