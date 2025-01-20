@interface ICAttachmentSystemPaperModel
@end

@implementation ICAttachmentSystemPaperModel

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__20;
  v47 = __Block_byref_object_dispose__20;
  id v48 = 0;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  BOOL v7 = *(unsigned char *)(a1 + 73) == 0;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
  v40[3] = &unk_2640BB3F0;
  v42 = &v43;
  v8 = v3;
  v41 = v8;
  [v4 performSearchQuery:v5 fullWordsOnly:v6 caseMatchingOnly:v7 withBlock:v40];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  v29 = v8;
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = v11;
      _os_log_impl(&dword_20BE60000, v10, OS_LOG_TYPE_DEFAULT, "Timed out performing search query for paper drawing %@", buf, 0xCu);
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v10 = (id)v44[5];
    uint64_t v13 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v37;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v14;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v10);
          }
          v18 = *(void **)(*((void *)&v36 + 1) + 8 * v16);
          v19 = objc_alloc_init(ICPaperKitTextFindingResult);
          [v18 bounds];
          -[ICPaperKitTextFindingResult setSearchResultRect:](v19, "setSearchResultRect:");
          [(ICPaperKitTextFindingResult *)v19 setOrder:v17 + v16];
          [v2 addObject:v19];

          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
        uint64_t v14 = v17 + v16;
      }
      while (v13);
      uint64_t v12 = v17 + v16;
      goto LABEL_15;
    }
  }
  uint64_t v12 = 0;
LABEL_15:

  _Block_object_dispose(&v43, 8);
LABEL_16:
  v20 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) searchWithQuery:*(void *)(a1 + 40)];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v25 = objc_alloc_init(ICPaperKitTextFindingResult);
        objc_msgSend(v24, "ic_rectValue");
        -[ICPaperKitTextFindingResult setSearchResultRect:](v25, "setSearchResultRect:");
        [(ICPaperKitTextFindingResult *)v25 setOrder:v12 + i];
        [v2 addObject:v25];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v49 count:16];
      v12 += i;
    }
    while (v21);
  }
  v26 = *(void **)(a1 + 56);
  if (v26)
  {
    id v31 = v26;
    id v30 = v2;
    performBlockOnMainThread();
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
  v28 = *(void **)(v27 + 40);
  if (v28)
  {
    *(void *)(v27 + 40) = 0;
  }
}

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __72__ICAttachmentSystemPaperModel_TextFinding__systemPaperTextFindingQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.systemPaperTextFinding", MEMORY[0x263EF83A8]);
  uint64_t v1 = systemPaperTextFindingQueue_sSystemPaperFindingQueue;
  systemPaperTextFindingQueue_sSystemPaperFindingQueue = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end