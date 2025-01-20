@interface ICAttachmentInlineDrawingModel(UI)
- (BOOL)isTitleQueryEnabled;
- (ICAttachmentInlineDrawingActivityItemSource)activityItem;
- (id)activityItems;
- (id)handwritingRecognitionDrawingQueue;
- (id)imageForActivityItem;
- (id)mergeableDataForCopying:()UI;
- (id)titleQuery;
- (uint64_t)actuallyMergeWithDrawing:()UI;
- (uint64_t)isHandwritingRecognitionEnabled;
- (uint64_t)mergeWithMergeableData:()UI mergeableFieldState:;
- (void)attachmentModelDealloc;
- (void)drawPreviewInRect:()UI;
- (void)setHandwritingRecognitionDrawingQueue:()UI;
- (void)setHandwritingRecognitionEnabled:()UI;
- (void)setTitleQuery:()UI;
- (void)setTitleQueryEnabled:()UI;
- (void)titleQuery:()UI didUpdateWithItem:;
- (void)updateAfterLoadWithSubAttachmentIdentifierMap:()UI;
@end

@implementation ICAttachmentInlineDrawingModel(UI)

- (void)attachmentModelDealloc
{
  id v1 = [a1 titleQuery];
  [v1 setDelegate:0];
  [v1 pause];
}

- (uint64_t)mergeWithMergeableData:()UI mergeableFieldState:
{
  id v4 = a3;
  if ([v4 length])
  {
    id v14 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F38DF8]) initWithData:v4 error:&v14];
    id v6 = v14;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    uint64_t v9 = v8;
    if (v8)
    {
      if (![a1 actuallyMergeWithDrawing:v5])
      {
        uint64_t v9 = 0;
        goto LABEL_17;
      }
      v11 = [a1 attachment];
      id v10 = (id)[v11 ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentInlineDrawingModelMergeableDataDidChangeNotification"];
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentInlineDrawingModel(UI) mergeWithMergeableData:mergeableFieldState:]();
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v9 = 0;
LABEL_18:

  return v9;
}

- (uint64_t)actuallyMergeWithDrawing:()UI
{
  id v4 = a3;
  v5 = [a1 attachment];
  id v6 = [v5 managedObjectContext];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke;
  v27[3] = &unk_1E5FD91A8;
  v29 = &v35;
  v27[4] = a1;
  id v7 = v4;
  id v28 = v7;
  v30 = &v31;
  [v6 performBlockAndWait:v27];
  if ([(id)v36[5] length])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F38DF8]);
    uint64_t v9 = v36[5];
    id v26 = 0;
    id v10 = (id)[v8 initWithData:v9 error:&v26];
    id v11 = v26;
    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentInlineDrawingModel(UI) actuallyMergeWithDrawing:]();
      }
    }
    uint64_t v13 = [v10 mergeWithDrawing:v7];
  }
  else
  {
    id v10 = v7;
    uint64_t v13 = 2;
  }
  id v14 = [a1 handwritingRecognitionDrawingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_14;
  block[3] = &unk_1E5FD91D0;
  block[4] = a1;
  id v15 = v7;
  id v25 = v15;
  dispatch_async(v14, block);

  if (!v13)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_15;
    v21[3] = &unk_1E5FD8DF0;
    v21[4] = a1;
    [v6 performBlockAndWait:v21];
    goto LABEL_14;
  }
  if (v13 == 1)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_16;
    v20[3] = &unk_1E5FD8DF0;
    v20[4] = a1;
    [v6 performBlockAndWait:v20];
    goto LABEL_14;
  }
  if (v13 != 2)
  {
LABEL_14:
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  v16 = [v10 serializeWithVersion:v32[3]];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2;
  v22[3] = &unk_1E5FD91D0;
  v22[4] = a1;
  id v17 = v16;
  id v23 = v17;
  [v6 performBlockAndWait:v22];

  uint64_t v18 = 1;
LABEL_15:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

- (id)imageForActivityItem
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  v2 = [a1 attachment];
  v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICAttachmentInlineDrawingModel_UI__imageForActivityItem__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = a1;
  v7[5] = &v8;
  [v3 performBlockAndWait:v7];

  if (v9[5])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:");
    v5 = +[ICAttachmentPreviewImageLoader orientedImage:v4 withBackground:1];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICAttachmentInlineDrawingActivityItemSource)activityItem
{
  v2 = [ICAttachmentInlineDrawingActivityItemSource alloc];
  v3 = [a1 attachment];
  id v4 = [(ICAttachmentActivityItemSource *)v2 initWithAttachment:v3];

  return v4;
}

- (id)activityItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 activityItem];
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  id v6 = [a1 attachment];
  id v7 = [(ICAttachmentActivityItemSource *)v5 initWithAttachment:v6];
  uint64_t v8 = [v4 arrayByAddingObject:v7];

  return v8;
}

- (id)mergeableDataForCopying:()UI
{
  id v1 = (void *)[a1 newDrawingFromMergeableData];
  uint64_t v2 = [v1 serializeTransiently];

  return v2;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:()UI
{
  uint64_t v2 = (void *)[a1 newDrawingFromMergeableData];
  if (v2)
  {
    id v9 = v2;
    v3 = [v2 uuid];

    if (!v3) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((drawing.uuid) != nil)", "-[ICAttachmentInlineDrawingModel(UI) updateAfterLoadWithSubAttachmentIdentifierMap:]", 1, 0, @"Expected non-nil value for '%s'", "drawing.uuid");
    }
    id v4 = [a1 attachment];
    v5 = [v4 typeUTI];
    if ([v5 isEqualToString:*MEMORY[0x1E4F83060]]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }

    id v7 = [v9 serializeWithVersion:v6];
    uint64_t v8 = [a1 attachment];
    [v8 setMergeableData:v7];

    uint64_t v2 = v9;
  }
}

- (void)setHandwritingRecognitionEnabled:()UI
{
  v5 = [a1 handwritingRecognitionDrawing];
  if (a3)
  {
    if (!v5)
    {
      id v6 = (id)[a1 newDrawingFromMergeableData];
      [a1 setHandwritingRecognitionDrawing:v6];
      v5 = v6;
    }
    id v7 = v5;
    [v5 setRecognitionEnabled:1];
  }
  else
  {
    if (!v5) {
      return;
    }
    id v7 = v5;
    [v5 cancelOngoingRecognitionRequests];
    [v7 setRecognitionEnabled:0];
    [a1 setHandwritingRecognitionDrawing:0];
  }
}

- (uint64_t)isHandwritingRecognitionEnabled
{
  id v1 = [a1 handwritingRecognitionDrawing];
  uint64_t v2 = [v1 recognitionEnabled];

  return v2;
}

- (id)handwritingRecognitionDrawingQueue
{
  uint64_t v2 = objc_getAssociatedObject(a1, (const void *)ICHandwritingRecognitionDrawingQueueKey);
  if (!v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v2 = dispatch_queue_create("com.apple.notes.handwritingrecognition", v3);

    [a1 setHandwritingRecognitionDrawingQueue:v2];
  }
  return v2;
}

- (void)setHandwritingRecognitionDrawingQueue:()UI
{
}

- (void)setTitleQueryEnabled:()UI
{
  v5 = [a1 titleQuery];
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__0;
  v16[3] = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v6 = [a1 attachment];
  id v7 = [v6 managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke;
  v14[3] = &unk_1E5FD91F8;
  v14[4] = a1;
  v14[5] = &v15;
  [v7 performBlockAndWait:v14];

  if (a3)
  {
    if (!v5)
    {
      uint64_t v8 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ICAttachmentInlineDrawingModel(UI) setTitleQueryEnabled:]((uint64_t)v16, v8);
      }

      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x3032000000;
      v12[3] = __Block_byref_object_copy__0;
      v12[4] = __Block_byref_object_dispose__0;
      id v13 = 0;
      id v9 = [a1 handwritingRecognitionDrawingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_29;
      block[3] = &unk_1E5FD9248;
      block[4] = a1;
      void block[5] = v12;
      block[6] = &v15;
      dispatch_async(v9, block);

      _Block_object_dispose(v12, 8);
    }
  }
  else if (v5)
  {
    uint64_t v10 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentInlineDrawingModel(UI) setTitleQueryEnabled:]((uint64_t)v16, v10);
    }

    [v5 pause];
    [a1 setTitleQuery:0];
  }
  _Block_object_dispose(&v15, 8);
}

- (BOOL)isTitleQueryEnabled
{
  id v1 = [a1 titleQuery];
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)titleQuery
{
  return objc_getAssociatedObject(a1, (const void *)ICTitleQueryKey);
}

- (void)setTitleQuery:()UI
{
}

- (void)titleQuery:()UI didUpdateWithItem:
{
  v5 = [a4 transcribedTitle];
  id v6 = [a1 attachment];
  id v7 = [v6 objectID];

  uint64_t v8 = [MEMORY[0x1E4F83428] sharedContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke;
  v11[3] = &unk_1E5FD9270;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v8 performBackgroundTask:v11];
}

- (void)drawPreviewInRect:()UI
{
  id v10 = [MEMORY[0x1E4F83298] currentInfo];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  id v11 = [a1 attachment];
  id v12 = [v11 managedObjectContext];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__ICAttachmentInlineDrawingModel_UI__drawPreviewInRect___block_invoke;
  v21[3] = &unk_1E5FD91F8;
  v21[4] = a1;
  void v21[5] = &v22;
  [v12 performBlockAndWait:v21];

  id v13 = (void *)MEMORY[0x1E4F832C0];
  id v14 = [a1 attachment];
  uint64_t v15 = [v13 generateImageForAttachment:v14 fromDrawing:v23[5] fullResolution:0 appearanceInfo:v10];

  if (!v15)
  {
    uint64_t v18 = [a1 attachment];
    v19 = [v18 fallbackImageData];

    if (!v19)
    {
      uint64_t v15 = 0;
      goto LABEL_3;
    }
    v20 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v19);
    uint64_t v15 = +[ICAttachmentPreviewImageLoader orientedImage:v20 withBackground:0];

    if (!v15) {
      goto LABEL_3;
    }
  }
  v16 = [a1 attachment];
  id v17 = [v16 note];
  +[ICPaperStyle drawPaperStyleType:inRect:](ICPaperStyle, "drawPaperStyleType:inRect:", (int)[v17 paperStyleType], a2, a3, a4, a5);

  objc_msgSend(v15, "drawInRect:", a2, a3, a4, a5);
LABEL_3:

  _Block_object_dispose(&v22, 8);
}

- (void)mergeWithMergeableData:()UI mergeableFieldState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error creating PKDrawing from data in mergeWithMergeableData: %@", v2, v3, v4, v5, v6);
}

- (void)actuallyMergeWithDrawing:()UI .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "actuallyMergeWithDrawing error creating currentDrawing %@", v2, v3, v4, v5, v6);
}

- (void)setTitleQueryEnabled:()UI .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Enabling title query for %@", (uint8_t *)&v3, 0xCu);
}

- (void)setTitleQueryEnabled:()UI .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Disabling title query for %@", (uint8_t *)&v3, 0xCu);
}

@end