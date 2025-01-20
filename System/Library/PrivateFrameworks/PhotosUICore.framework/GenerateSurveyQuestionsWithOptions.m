@interface GenerateSurveyQuestionsWithOptions
@end

@implementation GenerateSurveyQuestionsWithOptions

void ___GenerateSurveyQuestionsWithOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8B008]];
  int v7 = [v6 BOOLValue];

  v8 = PLUIGetLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = PHQuestionOptionsDebugDescription();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      v11 = "Did generate some questions for options: %{public}@";
      v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = PHQuestionOptionsDebugDescription();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v5;
    v11 = "Failed to generate questions for options: %{public}@, error: %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___GenerateSurveyQuestionsWithOptions_block_invoke_220;
  block[3] = &unk_1E5DD1758;
  id v15 = *(id *)(a1 + 32);
  char v20 = v7;
  id v18 = v5;
  id v19 = v15;
  id v16 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t ___GenerateSurveyQuestionsWithOptions_block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end