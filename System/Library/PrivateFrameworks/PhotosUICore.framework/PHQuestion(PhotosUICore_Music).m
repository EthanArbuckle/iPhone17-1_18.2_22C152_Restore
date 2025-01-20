@interface PHQuestion(PhotosUICore_Music)
+ (id)fetchMemoryMusicQualityQuestionForMemory:()PhotosUICore_Music audioAsset:;
- (uint64_t)memoryMusicQualityFeedbackType;
@end

@implementation PHQuestion(PhotosUICore_Music)

- (uint64_t)memoryMusicQualityFeedbackType
{
  v1 = [a1 additionalInfo];
  v2 = [v1 objectForKeyedSubscript:@"feedbackDescription"];
  uint64_t v3 = PXMemoryMusicQualityFeedbackTypeForString(v2);

  return v3;
}

+ (id)fetchMemoryMusicQualityQuestionForMemory:()PhotosUICore_Music audioAsset:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 identifier];
  v7 = [v5 photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [v5 uuid];
  v11 = [v9 predicateWithFormat:@"type == %d AND entityIdentifier == %@", 15, v10];
  [v8 setPredicate:v11];

  [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v8 validQuestionsOnly:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v23 = v5;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 additionalInfo];
        v19 = [v18 objectForKeyedSubscript:@"songIdentifier"];

        if (v19) {
          BOOL v20 = v6 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20 && ([v19 isEqualToString:v6] & 1) != 0)
        {
          id v21 = v17;

          goto LABEL_15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    id v21 = 0;
LABEL_15:
    id v5 = v23;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

@end