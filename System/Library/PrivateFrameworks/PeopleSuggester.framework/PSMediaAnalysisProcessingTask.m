@interface PSMediaAnalysisProcessingTask
@end

@implementation PSMediaAnalysisProcessingTask

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging mediaAnalysisChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_356(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_PSLogging mediaAnalysisChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) uuid];
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "%{BOOL}d, updated interaction %@ for media analysis", (uint8_t *)v6, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end