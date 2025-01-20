@interface PXPresentAssistantForContext
@end

@implementation PXPresentAssistantForContext

void ___PXPresentAssistantForContext_block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v7 = PLUIGetLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v10 = a1[4];
    int v19 = 138412290;
    uint64_t v20 = v10;
    v9 = "Assistant completed for context: %@";
    goto LABEL_7;
  }
  BOOL IsUserCanceledError = PXAssistantIsUserCanceledError(v3);
  v6 = PLUIGetLog();
  v7 = v6;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v8 = a1[4];
    int v19 = 138412290;
    uint64_t v20 = v8;
    v9 = "Assistant cancelled by user for context: %@";
LABEL_7:
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
    goto LABEL_10;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
  uint64_t v14 = a1[4];
  int v19 = 138412546;
  uint64_t v20 = v14;
  __int16 v21 = 2112;
  v22 = v4;
  v9 = "Assistant did fail for context: %@, error: %@";
  v11 = v7;
  os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  uint32_t v13 = 22;
LABEL_10:
  _os_log_impl(&dword_1A9AE7000, v11, v12, v9, (uint8_t *)&v19, v13);
LABEL_11:

  uint64_t v15 = *(void *)(a1[8] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  (*(void (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[5], 0, v17);
  uint64_t v18 = a1[7];
  if (v18) {
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v4);
  }
}

@end