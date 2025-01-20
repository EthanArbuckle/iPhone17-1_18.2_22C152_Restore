@interface WKTargetedElementInfo
@end

@implementation WKTargetedElementInfo

void __100___WKTargetedElementInfo_ScribbleUtilities__safari_renderedTextForCheckingSimilarityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = a2;
  uint64_t v4 = [v6 length];
  id v5 = v6;
  if (!v4) {
    id v5 = *(id *)(a1 + 32);
  }
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
}

void __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v4 = (void *)getVNImageRequestHandlerClass_softClass;
    uint64_t v27 = getVNImageRequestHandlerClass_softClass;
    if (!getVNImageRequestHandlerClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getVNImageRequestHandlerClass_block_invoke;
      v22 = &unk_1E5E41610;
      v23 = &v24;
      __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v19);
      uint64_t v4 = (void *)v25[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v24, 8);
    id v6 = [v5 alloc];
    v7 = (void *)[v6 initWithCGImage:a2 options:MEMORY[0x1E4F1CC08]];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v8 = (void *)getVNRecognizeTextRequestClass_softClass;
    uint64_t v27 = getVNRecognizeTextRequestClass_softClass;
    if (!getVNRecognizeTextRequestClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getVNRecognizeTextRequestClass_block_invoke;
      v22 = &unk_1E5E41610;
      v23 = &v24;
      __getVNRecognizeTextRequestClass_block_invoke((uint64_t)&v19);
      v8 = (void *)v25[3];
    }
    v9 = v8;
    _Block_object_dispose(&v24, 8);
    id v10 = [v9 alloc];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke_2;
    v17 = &unk_1E5E43B70;
    id v18 = *(id *)(a1 + 32);
    v11 = (void *)[v10 initWithCompletionHandler:&v14];
    objc_msgSend(v11, "setRecognitionLevel:", 1, v14, v15, v16, v17);
    v28[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v7 performRequests:v12 error:0];
  }
  else
  {
    v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v13();
  }
}

void __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = a1;
    id v6 = [MEMORY[0x1E4F28E78] string];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [v5 results];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) topCandidates:1];
          v13 = [v12 firstObject];
          uint64_t v14 = [v13 string];

          if ([v6 length]) {
            [v6 appendFormat:@" %@", v14];
          }
          else {
            [v6 appendString:v14];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(v15 + 32) + 16))();
  }
}

id __87___WKTargetedElementInfo_ScribbleUtilities__safari_uniqueSelectorsIncludingShadowHosts__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 4)
  {
    uint64_t v4 = objc_msgSend(v3, "subarrayWithRange:", 0, 3);

    id v3 = (id)v4;
  }
  id v5 = [v2 setWithArray:v3];

  return v5;
}

@end