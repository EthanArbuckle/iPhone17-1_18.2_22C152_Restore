@interface ICAttachmentPreviewGeneratorOCROperation
- (ICAttachmentModel)attachmentModel;
- (NSManagedObjectContext)managedObjectContext;
- (unint64_t)type;
- (void)main;
- (void)setAttachmentModel:(id)a3;
- (void)setManagedObjectContext:(id)a3;
@end

@implementation ICAttachmentPreviewGeneratorOCROperation

- (unint64_t)type
{
  return 2;
}

- (void)main
{
  v4 = [MEMORY[0x1E4F83428] sharedContext];
  v5 = [v4 workerManagedObjectContext];
  [(ICAttachmentPreviewGeneratorOCROperation *)self setManagedObjectContext:v5];

  v6 = [(ICAttachmentPreviewGeneratorOCROperation *)self managedObjectContext];
  objc_msgSend(v6, "setIc_debugName:", @"ocrGenerator");

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__17;
  v16[4] = __Block_byref_object_dispose__17;
  id v17 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7 = [(ICAttachmentPreviewGeneratorOCROperation *)self managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke;
  v11[3] = &unk_1E5FDA2D8;
  v11[4] = self;
  v11[5] = v16;
  v11[6] = &v12;
  v11[7] = a2;
  [v7 performBlockAndWait:v11];

  if (*((unsigned char *)v13 + 24))
  {
    v8 = [(ICAttachmentPreviewGeneratorOCROperation *)self attachmentModel];
    [v8 generateOCRInOperation:self];
  }
  else
  {
    v8 = [(ICAttachmentPreviewGeneratorOCROperation *)self managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke_13;
    v10[3] = &unk_1E5FD95C0;
    v10[4] = v16;
    [v8 performBlockAndWait:v10];
  }

  v9 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v9 operationComplete:self];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
}

void __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) managedObjectContext];
  v4 = [*(id *)v2 attachmentID];
  id v20 = 0;
  uint64_t v5 = [v3 existingObjectWithID:v4 error:&v20];
  id v6 = v20;
  uint64_t v7 = *(void *)(*(void *)(v2 + 8) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  v9 = *(void **)(*(void *)(*(void *)(v2 + 8) + 8) + 40);
  if (!v9)
  {
    if (!v6) {
      goto LABEL_12;
    }
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke_cold_1((id *)v2, (uint64_t)v6, v11);
    }

    goto LABEL_11;
  }
  v10 = [v9 attachmentModel];
  [*(id *)v2 setAttachmentModel:v10];

  if (([*(id *)v2 isCancelled] & 1) != 0
    || ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isDeleted] & 1) != 0)
  {
    goto LABEL_12;
  }
  v11 = [*(id *)v2 attachmentModel];
  if (([v11 needToPostProcessAttachment] & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [*(id *)v2 attachmentModel];
  int v13 = [v12 supportsOCR];

  if (v13) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_12:
  uint64_t v14 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    char v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shortLoggingDescription];
    int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 138413058;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 1024;
    int v28 = v19;
    _os_log_debug_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEBUG, "%@ %@ %@ OCR generate %d", buf, 0x26u);
  }
}

void __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke_13(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) identifier];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_INFO, "Skipping generation for attachment because it is either cancelled or not needed: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setManagedObjectContext:(id)a3
{
}

- (ICAttachmentModel)attachmentModel
{
  return (ICAttachmentModel *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAttachmentModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 attachmentID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Error getting object from ID %@ for OCR generation %@", (uint8_t *)&v6, 0x16u);
}

@end