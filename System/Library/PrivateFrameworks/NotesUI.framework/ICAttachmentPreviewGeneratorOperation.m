@interface ICAttachmentPreviewGeneratorOperation
- (ICAttachmentModel)attachmentModel;
- (ICAttachmentPreviewGeneratorOperation)initWithAttachmentManagedObjectID:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectID)attachmentID;
- (unint64_t)type;
- (void)cancel;
- (void)main;
- (void)setAttachmentID:(id)a3;
- (void)setAttachmentModel:(id)a3;
- (void)setManagedObjectContext:(id)a3;
@end

@implementation ICAttachmentPreviewGeneratorOperation

- (ICAttachmentPreviewGeneratorOperation)initWithAttachmentManagedObjectID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentPreviewGeneratorOperation;
  v5 = [(ICAttachmentPreviewGeneratorOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICAttachmentPreviewGeneratorOperation *)v5 setAttachmentID:v4];
  }

  return v6;
}

- (unint64_t)type
{
  return 1;
}

- (void)main
{
  id v4 = [MEMORY[0x1E4F83428] sharedContext];
  v5 = [v4 workerManagedObjectContext];
  [(ICAttachmentPreviewGeneratorOperation *)self setManagedObjectContext:v5];

  v6 = [(ICAttachmentPreviewGeneratorOperation *)self managedObjectContext];
  [v6 setAutomaticallyMergesChangesFromParent:0];

  v7 = [(ICAttachmentPreviewGeneratorOperation *)self managedObjectContext];
  objc_msgSend(v7, "setIc_debugName:", @"previewGenerator");

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__61;
  v19[4] = __Block_byref_object_dispose__61;
  id v20 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_super v8 = [(ICAttachmentPreviewGeneratorOperation *)self managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke;
  v14[3] = &unk_1E5FDA2D8;
  v14[4] = self;
  v14[5] = v19;
  v14[6] = &v15;
  v14[7] = a2;
  [v8 performBlockAndWait:v14];

  if (!*((unsigned char *)v16 + 24)
    || ([(ICAttachmentPreviewGeneratorOperation *)self attachmentModel],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 generatePreviewsInOperation:self],
        v9,
        (v10 & 1) != 0))
  {
    v11 = [(ICAttachmentPreviewGeneratorOperation *)self managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_13;
    v13[3] = &unk_1E5FD9B68;
    v13[4] = self;
    v13[5] = v19;
    v13[6] = a2;
    [v11 performBlockAndWait:v13];
  }
  [(ICAttachmentPreviewGeneratorOperation *)self setManagedObjectContext:0];
  v12 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v12 operationComplete:self];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [*(id *)v2 attachmentID];
  id v20 = 0;
  uint64_t v5 = [v3 existingObjectWithID:v4 error:&v20];
  id v6 = v20;
  uint64_t v7 = *(void *)(*(void *)(v2 + 8) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  v9 = *(void **)(*(void *)(*(void *)(v2 + 8) + 8) + 40);
  if (v9)
  {
    char v10 = [v9 attachmentModel];
    [*(id *)v2 setAttachmentModel:v10];

    if (([*(id *)v2 isCancelled] & 1) == 0
      && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isDeleted] & 1) == 0)
    {
      v11 = [*(id *)v2 attachmentModel];
      int v12 = [v11 needToGeneratePreviews];

      if (v12) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  else if (v6)
  {
    v13 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_cold_1((id *)v2, (uint64_t)v6, v13);
    }
  }
  v14 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    char v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shortLoggingDescription];
    int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 138413058;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 1024;
    int v28 = v19;
    _os_log_debug_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEBUG, "%@ %@ %@ generate %d", buf, 0x26u);
  }
}

uint64_t __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_13(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_13_cold_1(a1, v2);
  }

  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 32) managedObjectContext];
    id v4 = [*(id *)(a1 + 32) attachmentModel];
    uint64_t v5 = [v4 attachment];
    id v6 = [v5 shortLoggingDescription];
    objc_msgSend(v3, "ic_saveWithLogDescription:", @"Saving after preview creation for %@", v6);

    uint64_t v7 = +[ICAttachmentPreviewGenerator sharedGenerator];
    [v7 postProcessIfNeededForAttachment:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v8 = *MEMORY[0x1E4F83040];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E4F83040]);
    v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) parentAttachment];
    char v10 = [v9 attachmentModel];
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];
    int v12 = [v10 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v11];

    if (v12)
    {
      v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) parentAttachment];
      objc_msgSend(v13, "ic_postNotificationOnMainThreadWithName:", v8);
    }
  }
  return [*(id *)(a1 + 32) setAttachmentModel:0];
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentPreviewGeneratorOperation;
  [(ICAttachmentPreviewGeneratorOperation *)&v6 cancel];
  v3 = [(ICAttachmentPreviewGeneratorOperation *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICAttachmentPreviewGeneratorOperation_cancel__block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  v5[4] = self;
  [v3 performBlock:v5];

  id v4 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v4 operationComplete:self];
}

void __47__ICAttachmentPreviewGeneratorOperation_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) attachmentModel];
  [v1 didCancelPreviewGeneratorOperation];
}

- (NSManagedObjectID)attachmentID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAttachmentID:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 256, 1);
}

- (void)setManagedObjectContext:(id)a3
{
}

- (ICAttachmentModel)attachmentModel
{
  return (ICAttachmentModel *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAttachmentModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 attachmentID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Error getting object from ID %@ for preview generation %@", (uint8_t *)&v6, 0x16u);
}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shortLoggingDescription];
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "%@ %@ %@ generation complete", (uint8_t *)&v8, 0x20u);
}

@end