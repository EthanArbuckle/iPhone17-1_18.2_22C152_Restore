@interface ICAttachmentInlineDrawingModel
@end

@implementation ICAttachmentInlineDrawingModel

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", a1[4], a2);
  if ([MEMORY[0x263F5AB78] typeUTIIsInlineDrawing:a1[5]])
  {
    v31 = a1;
    v4 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3);
    }

    objc_opt_class();
    v32 = v3;
    v5 = [v3 attachmentModel];
    v6 = ICDynamicCast();
    v7 = (void *)[v6 newDrawingFromMergeableData];

    id v33 = objc_alloc_init(MEMORY[0x263F14AE0]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v30 = v7;
    v8 = [v7 strokes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      uint64_t v12 = *MEMORY[0x263F14C90];
      v13 = (_OWORD *)MEMORY[0x263F000D0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v16 = [v15 ink];
          v17 = [v16 identifier];
          char v18 = [v17 isEqualToString:v12];

          if ((v18 & 1) == 0)
          {
            long long v19 = v13[1];
            v34[0] = *v13;
            v34[1] = v19;
            v34[2] = v13[2];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);
    }

    [v30 _canvasBounds];
    objc_msgSend(v33, "set_canvasBounds:");
    uint64_t v20 = v31[6];
    v21 = [v33 serialize];
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0);

    v3 = v32;
    goto LABEL_26;
  }
  v22 = (void *)a1[5];
  v23 = [MEMORY[0x263F5AB78] fallbackImageUTI];
  LODWORD(v22) = [v22 isEqualToString:v23];

  if (!v22)
  {
    v29 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_4(v3, (uint64_t)(a1 + 5), v29);
    }

    goto LABEL_25;
  }
  int v24 = [v3 hasFallbackImage];
  v25 = os_log_create("com.apple.notes", "DragAndDrop");
  v26 = v25;
  if (!v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_3(v3, v26);
    }

LABEL_25:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_26;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v3);
  }

  uint64_t v27 = a1[6];
  v28 = [v3 fallbackImageData];
  (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v28, 0);

LABEL_26:
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 88);
  BOOL v6 = *(unsigned char *)(a1 + 89) == 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
  v13[3] = &unk_2640BA010;
  id v14 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v7 = v2;
  id v15 = v7;
  id v16 = *(id *)(a1 + 56);
  [v3 performSearchQuery:v4 fullWordsOnly:v5 caseMatchingOnly:v6 withBlock:v13];
  v8 = *(NSObject **)(a1 + 56);
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_20BE60000, v10, OS_LOG_TYPE_DEFAULT, "Timed out performing search query for inline drawing %@", buf, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v7);
  }
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(a1, v3, v4);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_12;
  v5[3] = &unk_2640B9FE8;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v5];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init(ICPencilKitTextFindingResult);
  [(ICPencilKitTextFindingResult *)v6 setSearchQueryItem:v5];

  [(ICPencilKitTextFindingResult *)v6 setOrder:a3];
  -[ICPencilKitTextFindingResult setDrawingSize:](v6, "setDrawingSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t __76__ICAttachmentInlineDrawingModel_TextFinding__inlineDrawingTextFindingQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.inlineDrawingTextFinding", MEMORY[0x263EF83A8]);
  uint64_t v1 = inlineDrawingTextFindingQueue_sDrawingFindingQueue;
  inlineDrawingTextFindingQueue_sDrawingFindingQueue = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Providing drawing data for attachment: %@", v4, v5, v6, v7, v8);
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Providing fallback image for attachment: %@", v4, v5, v6, v7, v8);
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Fallback image missing for attachment: %@", v4, 0xCu);
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Unexpected typeIdentifier for attachment: %@, %@", v6, 0x16u);
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_debug_impl(&dword_20BE60000, a3, OS_LOG_TYPE_DEBUG, "Finished search query in %@ with %ld results", (uint8_t *)&v5, 0x16u);
}

@end