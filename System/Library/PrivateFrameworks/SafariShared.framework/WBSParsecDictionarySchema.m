@interface WBSParsecDictionarySchema
@end

@implementation WBSParsecDictionarySchema

void __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = (void *)a1[4];
  id v7 = a3;
  v8 = [v6 objectForKeyedSubscript:v5];
  char v9 = [v7 _validateChild:v8 ofParent:a1[4] withParentAssociatedError:a1[5] errorHandler:a1[6]];

  if ((v9 & 1) == 0)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke_cold_1((uint64_t)v5, a1 + 4, v10);
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
  }
}

void __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_17(&dword_1A6B5F000, (uint64_t)a2, a3, "Dictionary schema validation failed for key \"%{public}@\" of dictionary %p", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end