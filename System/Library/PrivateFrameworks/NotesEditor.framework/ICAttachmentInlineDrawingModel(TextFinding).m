@interface ICAttachmentInlineDrawingModel(TextFinding)
+ (id)inlineDrawingTextFindingQueue;
- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
@end

@implementation ICAttachmentInlineDrawingModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a9;
  v14 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentInlineDrawingModel(TextFinding) textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:](a1, v14);
  }

  v15 = [a1 handwritingRecognitionDrawing];
  if (v15) {
    goto LABEL_7;
  }
  v16 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [a1 attachment];
    v18 = [v17 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    v41 = v18;
    _os_log_impl(&dword_20BE60000, v16, OS_LOG_TYPE_DEFAULT, "No handwriting recognition drawing for %@", buf, 0xCu);
  }
  v15 = (void *)[a1 newDrawingFromMergeableData];
  if (v15)
  {
LABEL_7:
    if (([v15 recognitionEnabled] & 1) == 0) {
      [v15 setRecognitionEnabled:1];
    }
    [v15 _canvasBounds];
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    v23 = [a1 attachment];
    v24 = [v23 shortLoggingDescription];

    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    v26 = [(id)objc_opt_class() inlineDrawingTextFindingQueue];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
    v30[3] = &unk_2640BA038;
    id v31 = v15;
    char v38 = a6;
    char v39 = a5;
    id v32 = v12;
    id v33 = v24;
    uint64_t v36 = v20;
    uint64_t v37 = v22;
    dispatch_semaphore_t v34 = v25;
    id v35 = v13;
    v27 = v25;
    id v28 = v24;
    id v29 = v15;
    dispatch_async(v26, v30);
  }
  else if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

+ (id)inlineDrawingTextFindingQueue
{
  if (inlineDrawingTextFindingQueue_onceToken != -1) {
    dispatch_once(&inlineDrawingTextFindingQueue_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)inlineDrawingTextFindingQueue_sDrawingFindingQueue;

  return v0;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 attachment];
  v4 = [v3 shortLoggingDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Finding search query results in inline drawing: %@", (uint8_t *)&v5, 0xCu);
}

@end