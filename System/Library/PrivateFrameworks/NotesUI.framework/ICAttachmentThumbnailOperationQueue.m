@interface ICAttachmentThumbnailOperationQueue
- (id)checkPreviewImagesIntegrityOperationForAttachment:(id)a3;
- (void)addOperationWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11;
@end

@implementation ICAttachmentThumbnailOperationQueue

- (void)addOperationWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v38 = a6;
  id v20 = a7;
  id v21 = a8;
  id v37 = a9;
  id v22 = a10;
  id v36 = a11;
  [(ICAttachmentThumbnailOperationQueue *)self setSuspended:1];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v23 = [(ICAttachmentThumbnailOperationQueue *)self operations];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    while (2)
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = ICProtocolCast();
        v29 = v28;
        if (v28 && [v28 isMatchingOperationForCacheKey:v21 cache:v20])
        {
          [v29 addCompletionBlock:v22];

          [(ICAttachmentThumbnailOperationQueue *)self setSuspended:0];
          v34 = v38;
          v30 = v39;
          v33 = v36;
          v32 = v37;
          goto LABEL_12;
        }

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  [(ICAttachmentThumbnailOperationQueue *)self setSuspended:0];
  v30 = v39;
  v31 = [(ICAttachmentThumbnailOperationQueue *)self checkPreviewImagesIntegrityOperationForAttachment:v39];
  v33 = v36;
  v32 = v37;
  v34 = v38;
  v35 = -[ICAttachmentThumbnailOperation initWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:queue:]([ICAttachmentThumbnailOperation alloc], "initWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:queue:", v39, v38, v20, v21, v37, v22, width, height, a5, v36, self);
  [(ICAttachmentThumbnailOperation *)v35 addDependency:v31];
  [(ICAttachmentThumbnailOperationQueue *)self addOperation:v31];
  [(ICAttachmentThumbnailOperationQueue *)self addOperation:v35];

LABEL_12:
}

- (id)checkPreviewImagesIntegrityOperationForAttachment:(id)a3
{
  v3 = [a3 objectID];
  v4 = (void *)MEMORY[0x1E4F28B48];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke;
  v8[3] = &unk_1E5FD8DF0;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 blockOperationWithBlock:v8];

  return v6;
}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F83428] sharedContext];
  v3 = [v2 workerManagedObjectContext];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__69;
  v9[4] = __Block_byref_object_dispose__69;
  id v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_13;
  v5[3] = &unk_1E5FD9870;
  v8 = v9;
  id v4 = v3;
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  [v4 performBlockAndWait:v5];

  _Block_object_dispose(v9, 8);
}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_13(void *a1)
{
  v3 = a1 + 5;
  uint64_t v2 = a1[5];
  id v4 = (void *)a1[4];
  id v12 = 0;
  uint64_t v5 = [v4 existingObjectWithID:v2 error:&v12];
  id v6 = v12;
  uint64_t v7 = *(void *)(v3[1] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  id v9 = *(void **)(*(void *)(v3[1] + 8) + 40);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  if (!v10)
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_13_cold_1(v3, v11);
    }

    id v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  [v9 checkPreviewImagesIntegrity];
}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_13_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Failed to find attachment with object ID %@ for checking preview image integrity", (uint8_t *)&v3, 0xCu);
}

@end