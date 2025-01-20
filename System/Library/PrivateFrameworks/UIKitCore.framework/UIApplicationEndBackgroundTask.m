@interface UIApplicationEndBackgroundTask
@end

@implementation UIApplicationEndBackgroundTask

void ___UIApplicationEndBackgroundTask_block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A80) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[7];
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    *(_DWORD *)buf = 138478339;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    __int16 v18 = 2113;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Decrementing reference count for assertion %{private}@ (used by background task with identifier %lu: %{private}@)", buf, 0x20u);
  }
  v6 = (void *)qword_1EB260A58;
  v7 = (void *)a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___UIApplicationEndBackgroundTask_block_invoke_79;
  v10[3] = &unk_1E52F0790;
  id v8 = v7;
  uint64_t v9 = a1[7];
  uint64_t v12 = a1[6];
  uint64_t v13 = v9;
  id v11 = v8;
  [v6 decrementReferenceForObject:v8 invalidationHandler:v10];
}

uint64_t ___UIApplicationEndBackgroundTask_block_invoke_79(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)qword_1EB260A50;
  if (qword_1EB260A50 == *(void *)(a1 + 32))
  {
    qword_1EB260A50 = 0;
  }
  uint64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A88) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Will invalidate assertion: %@ for task identifier: %lu", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  if (!qword_1EB260A50) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

@end