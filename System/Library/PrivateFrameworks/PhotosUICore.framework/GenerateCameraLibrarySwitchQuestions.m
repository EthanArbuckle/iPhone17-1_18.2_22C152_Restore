@interface GenerateCameraLibrarySwitchQuestions
@end

@implementation GenerateCameraLibrarySwitchQuestions

uint64_t ___GenerateCameraLibrarySwitchQuestions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F8AFE0];
  v16[0] = *MEMORY[0x1E4F8B018];
  v16[1] = v4;
  v17[0] = &unk_1F02D84B8;
  v17[1] = &unk_1F02D84D0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v7 = [v6 photoAnalysisClient];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = ___GenerateCameraLibrarySwitchQuestions_block_invoke_518;
  v14 = &unk_1E5DBE598;
  id v15 = v3;
  id v8 = v3;
  [v7 requestGenerateQuestionsWithOptions:v5 reply:&v11];

  v9 = +[PXUserDefaults standardUserDefaults];
  [v9 setSurveyQuestionsHideDate:0];

  return 1;
}

void ___GenerateCameraLibrarySwitchQuestions_block_invoke_518(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8B008]];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = @"Generated new Photos Challenges questions, available in the For You tab.";
  }
  else
  {
    v9 = [v5 userInfo];
    v10 = [v9 description];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v5 description];
    }
    v13 = v12;

    if ([v13 length])
    {
      id v8 = [NSString stringWithFormat:@"Failed to generate questions: %@", v13];
    }
    else
    {
      id v8 = @"Failed to generate questions.";
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___GenerateCameraLibrarySwitchQuestions_block_invoke_2;
  block[3] = &unk_1E5DD0F30;
  v16 = @"Camera Library Switch Questions";
  v17 = v8;
  id v18 = *(id *)(a1 + 32);
  v14 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___GenerateCameraLibrarySwitchQuestions_block_invoke_2(uint64_t a1)
{
}

@end