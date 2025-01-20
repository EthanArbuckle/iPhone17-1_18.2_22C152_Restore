@interface ICAttachmentSystemPaperModel(TextFinding)
+ (id)systemPaperTextFindingQueue;
- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
@end

@implementation ICAttachmentSystemPaperModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a9;
  v16 = [a1 attachment];
  v17 = [v16 shortLoggingDescription];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__20;
  v38 = __Block_byref_object_dispose__20;
  v18 = [ICSystemPaperIndexableTextContentHelper alloc];
  v19 = [a1 attachment];
  v39 = [(ICSystemPaperIndexableTextContentHelper *)v18 initWithPaperAttachment:v19];

  v20 = [(id)v35[5] drawing];
  [v20 setRecognitionEnabled:1];
  v21 = [(id)objc_opt_class() systemPaperTextFindingQueue];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
  v26[3] = &unk_2640BB418;
  id v27 = v20;
  id v28 = v13;
  char v32 = a6;
  char v33 = a5;
  id v30 = v15;
  v31 = &v34;
  id v29 = v17;
  id v22 = v15;
  id v23 = v17;
  id v24 = v13;
  id v25 = v20;
  dispatch_async(v21, v26);

  _Block_object_dispose(&v34, 8);
}

+ (id)systemPaperTextFindingQueue
{
  if (systemPaperTextFindingQueue_onceToken != -1) {
    dispatch_once(&systemPaperTextFindingQueue_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)systemPaperTextFindingQueue_sSystemPaperFindingQueue;

  return v0;
}

@end