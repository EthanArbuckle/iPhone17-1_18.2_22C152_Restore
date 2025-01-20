@interface ICNoteEditorTextFindingController
+ (OS_dispatch_queue)textFindingQueue;
+ (id)textFindingResultsForPattern:(id)a3 textView:(id)a4 textStorage:(id)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7;
@end

@implementation ICNoteEditorTextFindingController

+ (OS_dispatch_queue)textFindingQueue
{
  if (textFindingQueue_onceToken != -1) {
    dispatch_once(&textFindingQueue_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)textFindingQueue_sTextFindingQueue;

  return (OS_dispatch_queue *)v2;
}

void __53__ICNoteEditorTextFindingController_textFindingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.textFinding", v2);
  v1 = (void *)textFindingQueue_sTextFindingQueue;
  textFindingQueue_sTextFindingQueue = (uint64_t)v0;
}

+ (id)textFindingResultsForPattern:(id)a3 textView:(id)a4 textStorage:(id)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v47 = a6;
  aSelector = a2;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v48 = a4;
  id v11 = a5;
  v49 = v10;
  if ([v10 length]
    && ([v11 string],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 length],
        v12,
        v13))
  {
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__11;
    v68 = __Block_byref_object_dispose__11;
    id v69 = [MEMORY[0x263EFF980] array];
    uint64_t v14 = [MEMORY[0x263F08AE8] escapedPatternForString:v10];
    id v63 = 0;
    v15 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v14 options:v47 error:&v63];
    id v16 = v63;
    uint64_t v42 = v14;
    v44 = v16;
    v45 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v11, "string", v14, v16, v15, aSelector);
      v18 = objc_msgSend(v15, "matchesInString:options:range:", v17, 0, 0, objc_msgSend(v11, "length"));

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      os_log_t v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v60 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            if (v7)
            {
              v24 = [v11 string];
              uint64_t v25 = [v23 range];
              char v27 = objc_msgSend(v24, "ic_rangeEncapsulatesWord:", v25, v26);

              if ((v27 & 1) == 0) {
                continue;
              }
            }
            v28 = objc_alloc_init(ICTextFindingResult);
            uint64_t v29 = [v23 range];
            -[ICTextFindingResult setRange:](v28, "setRange:", v29, v30);
            [(id)v65[5] addObject:v28];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v71 count:16];
        }
        while (v20);
      }
    }
    else
    {
      uint64_t v32 = (uint64_t)v16;
      os_log_t v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[ICNoteEditorTextFindingController textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:](v32, v19);
      }
    }

    v33 = [MEMORY[0x263F5ACA0] sharedContext];
    v34 = [v33 managedObjectContext];

    dispatch_group_t v35 = dispatch_group_create();
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke;
    v50[3] = &unk_2640BA5D8;
    id v51 = v11;
    id v36 = v34;
    id v52 = v36;
    v37 = v35;
    v53 = v37;
    v56 = &v64;
    id v54 = v49;
    id v55 = v48;
    BOOL v57 = v47;
    BOOL v58 = v7;
    [v36 performBlockAndWait:v50];
    dispatch_time_t v38 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v37, v38))
    {
      v39 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = NSStringFromSelector(aSelector);
        +[ICNoteEditorTextFindingController textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:](v40, buf, v39);
      }
    }
    v31 = objc_msgSend((id)v65[5], "sortedArrayUsingSelector:", sel_compare_, v42);

    _Block_object_dispose(&v64, 8);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v2, "ic_range");
  uint64_t v6 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_2;
  v9[3] = &unk_2640BA5B0;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v13 = v8;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  __int16 v14 = *(_WORD *)(a1 + 80);
  objc_msgSend(v2, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v3, v4, v6, 0, v9);
}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = a2;
  dispatch_group_enter(v7);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_3;
  os_log_t v19 = &unk_2640BA588;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v10 = *(void *)(a1 + 56);
  id v20 = v9;
  uint64_t v22 = v10;
  id v21 = *(id *)(a1 + 32);
  id v11 = v9;
  id v12 = _Block_copy(&aBlock);
  objc_opt_class();
  uint64_t v13 = ICDynamicCast();
  objc_msgSend(v13, "textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, 0, v12, aBlock, v17, v18, v19);

  objc_opt_class();
  __int16 v14 = ICDynamicCast();

  v15 = [v14 attachmentModel];
  [v15 textFindingResultsMatchingString:*(void *)(a1 + 40) textView:*(void *)(a1 + 48) ignoreCase:*(unsigned __int8 *)(a1 + 64) wholeWords:*(unsigned __int8 *)(a1 + 65) startsWith:0 usePattern:0 completion:v12];
}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 64);
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v7);
        objc_msgSend(v10, "setRange:", v8, v9);
        [v10 setAttachmentResult:1];
        [*(id *)(a1 + 32) addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", *(void *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)textFindingResultsForPattern:(os_log_t)log textView:textStorage:ignoreCase:wholeWords:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "%@ timed out finding text", buf, 0xCu);
}

+ (void)textFindingResultsForPattern:(uint64_t)a1 textView:(NSObject *)a2 textStorage:ignoreCase:wholeWords:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Error creating plaintext regular expression: %@", (uint8_t *)&v2, 0xCu);
}

@end