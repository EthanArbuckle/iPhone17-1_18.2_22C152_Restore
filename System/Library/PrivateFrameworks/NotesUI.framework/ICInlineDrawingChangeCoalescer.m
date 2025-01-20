@interface ICInlineDrawingChangeCoalescer
- (BOOL)hasChanges;
- (ICAttachment)attachment;
- (ICInlineDrawingChangeCoalescer)initWithAttachment:(id)a3;
- (ICSelectorDelayer)processChangesSelectorDelayer;
- (NSManagedObjectContext)handwritingRecognitionContext;
- (NSManagedObjectContext)mainContext;
- (NSManagedObjectContext)workerContext;
- (PKDrawing)latestDrawing;
- (id)retrieveAndClearLatestDrawingToMerge;
- (unint64_t)numberOfChanges;
- (void)dealloc;
- (void)drawingDataDidChange:(id)a3;
- (void)mergeDrawingChanges;
- (void)mergeDrawingWithDrawing:(id)a3;
- (void)processIndexableContentWithCompletion:(id)a3;
- (void)retrieveAndClearLatestDrawingToMerge;
- (void)setAttachment:(id)a3;
- (void)setHandwritingRecognitionContext:(id)a3;
- (void)setLatestDrawing:(id)a3;
- (void)setMainContext:(id)a3;
- (void)setNumberOfChanges:(unint64_t)a3;
- (void)setProcessChangesSelectorDelayer:(id)a3;
- (void)setWorkerContext:(id)a3;
- (void)updateNowIfNecessary;
- (void)updateVersionIfNeededForAttachment:(id)a3 withDrawing:(id)a4;
@end

@implementation ICInlineDrawingChangeCoalescer

- (ICInlineDrawingChangeCoalescer)initWithAttachment:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICInlineDrawingChangeCoalescer;
  v6 = [(ICInlineDrawingChangeCoalescer *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachment, a3);
    v8 = [MEMORY[0x1E4F83428] sharedContext];
    uint64_t v9 = [v8 workerManagedObjectContext];
    workerContext = v7->_workerContext;
    v7->_workerContext = (NSManagedObjectContext *)v9;

    v11 = [MEMORY[0x1E4F83428] sharedContext];
    uint64_t v12 = [v11 managedObjectContext];
    mainContext = v7->_mainContext;
    v7->_mainContext = (NSManagedObjectContext *)v12;

    v14 = [MEMORY[0x1E4F83428] sharedContext];
    uint64_t v15 = [v14 workerManagedObjectContext];
    handwritingRecognitionContext = v7->_handwritingRecognitionContext;
    v7->_handwritingRecognitionContext = (NSManagedObjectContext *)v15;
  }
  return v7;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Had an updated drawing when deallocing ICDrawingChangeCoalescer", v1, 2u);
}

- (BOOL)hasChanges
{
  return [(ICInlineDrawingChangeCoalescer *)self numberOfChanges] != 0;
}

- (ICSelectorDelayer)processChangesSelectorDelayer
{
  processChangesSelectorDelayer = self->_processChangesSelectorDelayer;
  if (!processChangesSelectorDelayer)
  {
    v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel_mergeDrawingChanges delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:2.0];
    id v5 = self->_processChangesSelectorDelayer;
    self->_processChangesSelectorDelayer = v4;

    processChangesSelectorDelayer = self->_processChangesSelectorDelayer;
  }
  return processChangesSelectorDelayer;
}

- (void)drawingDataDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  [(ICInlineDrawingChangeCoalescer *)self setLatestDrawing:v5];
  [(ICInlineDrawingChangeCoalescer *)self setNumberOfChanges:[(ICInlineDrawingChangeCoalescer *)self numberOfChanges] + 1];
  v6 = [(ICInlineDrawingChangeCoalescer *)self processChangesSelectorDelayer];
  [v6 requestFire];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__76;
  v17[4] = __Block_byref_object_dispose__76;
  id v18 = 0;
  v7 = [(ICInlineDrawingChangeCoalescer *)self attachment];
  v8 = [v7 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke;
  v16[3] = &unk_1E5FD91F8;
  v16[4] = self;
  v16[5] = v17;
  [v8 performBlockAndWait:v16];

  uint64_t v9 = [(ICInlineDrawingChangeCoalescer *)self attachment];
  v10 = [v9 inlineDrawingModel];
  v11 = [v10 handwritingRecognitionDrawingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_27;
  v13[3] = &unk_1E5FD91F8;
  id v14 = v5;
  uint64_t v15 = v17;
  id v12 = v5;
  dispatch_async(v11, v13);

  _Block_object_dispose(v17, 8);
}

void __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  v2 = [*(id *)(a1 + 32) attachment];
  v3 = [v2 inlineDrawingModel];
  uint64_t v4 = [v3 handwritingRecognitionDrawing];
  uint64_t v5 = *(void *)(*(void *)(v1 + 8) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_cold_1((id *)v1);
  }
}

uint64_t __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_27(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mergeWithDrawing:*(void *)(a1 + 32)];
}

- (void)updateNowIfNecessary
{
  v3 = [(ICInlineDrawingChangeCoalescer *)self processChangesSelectorDelayer];
  [v3 cancelPreviousFireRequests];

  id v6 = [(ICInlineDrawingChangeCoalescer *)self retrieveAndClearLatestDrawingToMerge];
  if (v6)
  {
    uint64_t v4 = [(ICInlineDrawingChangeCoalescer *)self attachment];
    uint64_t v5 = [v4 managedObjectContext];
    objc_msgSend(v5, "ic_save");

    [(ICInlineDrawingChangeCoalescer *)self mergeDrawingWithDrawing:v6];
  }
}

- (void)mergeDrawingChanges
{
  v3 = [(ICInlineDrawingChangeCoalescer *)self retrieveAndClearLatestDrawingToMerge];
  if (v3)
  {
    uint64_t v4 = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__ICInlineDrawingChangeCoalescer_mergeDrawingChanges__block_invoke;
    v5[3] = &unk_1E5FD91D0;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __53__ICInlineDrawingChangeCoalescer_mergeDrawingChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mergeDrawingWithDrawing:*(void *)(a1 + 40)];
}

- (id)retrieveAndClearLatestDrawingToMerge
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  v3 = [(ICInlineDrawingChangeCoalescer *)self latestDrawing];
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge](self);
    }

    [(ICInlineDrawingChangeCoalescer *)self setNumberOfChanges:0];
    [(ICInlineDrawingChangeCoalescer *)self setLatestDrawing:0];
  }
  return v3;
}

- (void)mergeDrawingWithDrawing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICInlineDrawingChangeCoalescer *)self attachment];
  id v6 = [v5 objectID];

  v7 = [(ICInlineDrawingChangeCoalescer *)self mainContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke;
  v25[3] = &unk_1E5FD91D0;
  id v8 = v7;
  id v26 = v8;
  id v9 = v6;
  id v27 = v9;
  [v8 performBlockAndWait:v25];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v10 = [(ICInlineDrawingChangeCoalescer *)self workerContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke_2;
  v16 = &unk_1E5FDE438;
  id v11 = v9;
  id v17 = v11;
  id v18 = self;
  v20 = &v21;
  id v12 = v4;
  id v19 = v12;
  [v10 performBlockAndWait:&v13];

  if (*((unsigned char *)v22 + 24)) {
    -[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:](self, "processIndexableContentWithCompletion:", 0, v13, v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v21, 8);
}

void __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 isPasswordProtected] && objc_msgSend(v2, "hasChanges")) {
    objc_msgSend(*(id *)(a1 + 32), "ic_save");
  }
}

void __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F832A0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) workerContext];
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  uint64_t v5 = [v10 attachmentModel];
  id v6 = ICCheckedDynamicCast();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 mergeWithDrawing:*(void *)(a1 + 48)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 40) updateVersionIfNeededForAttachment:v10 withDrawing:*(void *)(a1 + 48)];
    [v10 updateChangeCountWithReason:@"Merged drawing"];
    v7 = [v10 note];
    [v7 updateModificationDateAndChangeCount];

    id v8 = [v10 note];
    id v9 = [v8 managedObjectContext];
    objc_msgSend(v9, "ic_save");
  }
}

- (void)processIndexableContentWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(ICInlineDrawingChangeCoalescer *)self attachment];
  id v6 = [v5 objectID];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__76;
  id v18 = __Block_byref_object_dispose__76;
  id v19 = 0;
  v7 = [(ICInlineDrawingChangeCoalescer *)self attachment];
  id v8 = [v7 managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke;
  v13[3] = &unk_1E5FDB2D0;
  void v13[4] = self;
  v13[5] = &v14;
  [v8 performBlockAndWait:v13];

  id v9 = v15[5];
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_39;
    block[3] = &unk_1E5FDBB10;
    block[4] = self;
    id v11 = v6;
    id v12 = v4;
    dispatch_async(v9, block);
  }
  else if (v4)
  {
    v4[2](v4);
  }
  _Block_object_dispose(&v14, 8);
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 managedObjectContext];
  id v4 = [*(id *)(a1 + 32) attachment];
  objc_msgSend(v3, "ic_refreshObject:mergeChanges:", v4, 1);

  uint64_t v5 = [*(id *)(a1 + 32) attachment];
  id v6 = [v5 inlineDrawingModel];
  uint64_t v7 = [v6 handwritingRecognitionDrawingQueue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [*(id *)(a1 + 32) attachment];
  id v11 = [v10 inlineDrawingModel];

  if (([v11 isHandwritingRecognitionEnabled] & 1) == 0)
  {
    id v12 = [v11 attachment];
    uint64_t v13 = [v12 note];

    objc_msgSend(v13, "updatePKDrawingsWithHandwritingRecognitionEnabled:", objc_msgSend(v13, "isHandwritingRecognitionEnabled"));
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v14 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 32) attachment];
      uint64_t v16 = [v15 shortLoggingDescription];
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "No queue to process drawing changes for %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_39(uint64_t a1)
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__76;
  v29 = __Block_byref_object_dispose__76;
  id v30 = 0;
  id v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 managedObjectContext];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2;
  v24[3] = &unk_1E5FDB2D0;
  v24[4] = *(void *)(a1 + 32);
  v24[5] = &v25;
  [v3 performBlockAndWait:v24];

  uint64_t v7 = (void *)v26[5];
  if (v7)
  {
    uint64_t v8 = [v7 indexableContent];
    id v9 = [v8 indexableTextRepresentation];
    id v10 = [v8 presentableTextRepresentation];
    id v11 = [*(id *)(a1 + 32) handwritingRecognitionContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_40;
    v17[3] = &unk_1E5FDE460;
    id v18 = *(id *)(a1 + 40);
    id v12 = v11;
    id v19 = v12;
    id v13 = v10;
    id v20 = v13;
    id v14 = v9;
    uint64_t v23 = &v25;
    uint64_t v15 = *(void *)(a1 + 32);
    id v21 = v14;
    uint64_t v22 = v15;
    [v12 performBlockAndWait:v17];
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v4, v5, v6);
  }
  _Block_object_dispose(&v25, 8);
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  uint64_t v4 = [v3 inlineDrawingModel];
  uint64_t v5 = [v4 handwritingRecognitionDrawing];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v8 = [*(id *)(a1 + 32) attachment];
    id v9 = [v8 inlineDrawingModel];
    int v10 = [v9 isHandwritingRecognitionEnabled];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) attachment];
      id v12 = [v11 inlineDrawingModel];
      uint64_t v13 = [v12 newDrawingFromMergeableData];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRecognitionEnabled:1];
    }
  }
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_40(uint64_t a1)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F832A0], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v3 = v2;
  if (!v2)
  {
    id v11 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Cannot regenerate text content for non-existent attachment: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  uint64_t v4 = [v2 identifier];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [v3 note],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_40_cold_1(v3, a1, v7);
    }

    [v3 setHandwritingSummary:*(void *)(a1 + 48)];
    [v3 setAdditionalIndexableText:*(void *)(a1 + 56)];
    objc_msgSend(*(id *)(a1 + 40), "ic_save");
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v8 = [v3 identifier];
      if (v8)
      {
        id v9 = (void *)v8;
        int v10 = [v3 note];

        if (v10)
        {
          id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v12 = *(void *)(a1 + 64);
          v25[0] = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          v24[0] = @"Drawing";
          v24[1] = @"DrawingID";
          uint64_t v13 = [v3 identifier];
          v25[1] = v13;
          v24[2] = @"Note";
          uint64_t v14 = [v3 note];
          v25[2] = v14;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
          [v11 postNotificationName:@"ICNAInlineDrawingRecognitionReportNotification" object:v12 userInfo:v15];

LABEL_16:
        }
      }
    }
  }
  else
  {
    uint64_t v16 = [v3 identifier];

    if (!v16)
    {
      int v17 = (void *)MEMORY[0x1E4F836F8];
      id v18 = [v3 shortLoggingDescription];
      [v17 handleFailedAssertWithCondition:"attachment.identifier", "-[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:]_block_invoke", 1, 1, @"Expected non-nil value for attachment.identifier: %@", v18 functionName simulateCrash showAlert format];
    }
    id v19 = [v3 note];

    if (!v19)
    {
      id v20 = (void *)MEMORY[0x1E4F836F8];
      id v11 = [v3 shortLoggingDescription];
      [v20 handleFailedAssertWithCondition:"attachment.note", "-[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:]_block_invoke", 1, 1, @"Expected non-nil value for attachment.note: %@", v11 functionName simulateCrash showAlert format];
      goto LABEL_16;
    }
  }
}

- (void)updateVersionIfNeededForAttachment:(id)a3 withDrawing:(id)a4
{
  id v7 = a3;
  if ([a4 _minimumSerializationVersion] >= 2)
  {
    uint64_t v5 = +[ICDrawingPencilKitConverter sharedConverter];
    id v6 = (id)[v5 updateInlineDrawingAttachment:v7];
  }
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void)setProcessChangesSelectorDelayer:(id)a3
{
}

- (PKDrawing)latestDrawing
{
  return self->_latestDrawing;
}

- (void)setLatestDrawing:(id)a3
{
}

- (unint64_t)numberOfChanges
{
  return self->_numberOfChanges;
}

- (void)setNumberOfChanges:(unint64_t)a3
{
  self->_numberOfChanges = a3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (NSManagedObjectContext)mainContext
{
  return self->_mainContext;
}

- (void)setMainContext:(id)a3
{
}

- (NSManagedObjectContext)handwritingRecognitionContext
{
  return self->_handwritingRecognitionContext;
}

- (void)setHandwritingRecognitionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingRecognitionContext, 0);
  objc_storeStrong((id *)&self->_mainContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_latestDrawing, 0);
  objc_storeStrong((id *)&self->_processChangesSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

void __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_cold_1(id *a1)
{
  [*a1 numberOfChanges];
  id v2 = [*a1 attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "Drawing data did change: %lu, attachment: %@", v6, v7, v8, v9, v10);
}

- (void)retrieveAndClearLatestDrawingToMerge
{
  [a1 numberOfChanges];
  id v2 = [a1 attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "Retrieving drawing with number of changes: %lu, attachment: %@", v6, v7, v8, v9, v10);
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  uint64_t v4 = [v3 shortLoggingDescription];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Regenerating indexable text for %@", (uint8_t *)&v5, 0xCu);
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_40_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 shortLoggingDescription];
  uint64_t v6 = [*(id *)(a2 + 48) length];
  uint64_t v7 = [*(id *)(a2 + 56) length];
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Indexable text for %@ presentableText=%ld indexableText.length=%ld", (uint8_t *)&v8, 0x20u);
}

@end