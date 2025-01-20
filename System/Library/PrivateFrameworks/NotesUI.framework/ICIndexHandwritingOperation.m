@interface ICIndexHandwritingOperation
+ (NSOperationQueue)sharedOperationQueue;
- (ICIndexHandwritingOperation)initWithAttachmentObjectID:(id)a3 context:(id)a4;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)attachmentObjectID;
- (void)main;
- (void)setAttachmentObjectID:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation ICIndexHandwritingOperation

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1) {
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)sharedOperationQueue_queue;
  return (NSOperationQueue *)v2;
}

uint64_t __51__ICIndexHandwritingOperation_sharedOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)sharedOperationQueue_queue;
  sharedOperationQueue_queue = (uint64_t)v0;

  [(id)sharedOperationQueue_queue setName:@"com.apple.notes.index-handwriting-queue"];
  v2 = (void *)sharedOperationQueue_queue;
  return [v2 setMaxConcurrentOperationCount:1];
}

- (ICIndexHandwritingOperation)initWithAttachmentObjectID:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICIndexHandwritingOperation;
  v9 = [(ICIndexHandwritingOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)main
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  v3 = [(ICIndexHandwritingOperation *)self context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__ICIndexHandwritingOperation_main__block_invoke;
  v11[3] = &unk_1E5FD91F8;
  v11[4] = self;
  v11[5] = &v12;
  [v3 performBlockAndWait:v11];

  v4 = [ICInlineDrawingChangeCoalescer alloc];
  v5 = [(ICInlineDrawingChangeCoalescer *)v4 initWithAttachment:v13[5]];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__ICIndexHandwritingOperation_main__block_invoke_2;
  v8[3] = &unk_1E5FD9D20;
  v8[4] = self;
  v10 = &v12;
  id v7 = v6;
  v9 = v7;
  [(ICInlineDrawingChangeCoalescer *)v5 processIndexableContentWithCompletion:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v12, 8);
}

void __35__ICIndexHandwritingOperation_main__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F832A0];
  v3 = [*(id *)(a1 + 32) attachmentObjectID];
  v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) inlineDrawingModel];
  [v8 setHandwritingRecognitionEnabled:1];
}

intptr_t __35__ICIndexHandwritingOperation_main__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__ICIndexHandwritingOperation_main__block_invoke_3;
  v4[3] = &unk_1E5FD95C0;
  v4[4] = *(void *)(a1 + 48);
  [v2 performBlockAndWait:v4];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __35__ICIndexHandwritingOperation_main__block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) note];
  uint64_t v2 = [v4 isHandwritingRecognitionEnabled];
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) inlineDrawingModel];
  [v3 setHandwritingRecognitionEnabled:v2];
}

- (NSManagedObjectID)attachmentObjectID
{
  return self->_attachmentObjectID;
}

- (void)setAttachmentObjectID:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attachmentObjectID, 0);
}

@end