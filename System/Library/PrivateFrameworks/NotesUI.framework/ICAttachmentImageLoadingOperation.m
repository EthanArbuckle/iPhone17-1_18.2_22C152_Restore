@interface ICAttachmentImageLoadingOperation
- (BOOL)forceFullSizeImage;
- (ICAttachmentImageLoadingOperation)initWithCache:(id)a3 attachment:(id)a4 attachmentType:(signed __int16)a5 forceFullSizeImage:(BOOL)a6 completionHandler:(id)a7;
- (NSCache)cache;
- (NSManagedObjectID)attachmentObjectID;
- (NSMutableArray)completionHandlers;
- (NSString)cacheKey;
- (NSURL)mediaURL;
- (id)addCompletionHandler:(id)a3;
- (signed)attachmentType;
- (void)main;
- (void)removeCompletionHandler:(id)a3 cancelIfNoneLeft:(BOOL)a4;
- (void)setAttachmentObjectID:(id)a3;
- (void)setAttachmentType:(signed __int16)a3;
- (void)setCache:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setForceFullSizeImage:(BOOL)a3;
- (void)setMediaURL:(id)a3;
@end

@implementation ICAttachmentImageLoadingOperation

- (ICAttachmentImageLoadingOperation)initWithCache:(id)a3 attachment:(id)a4 attachmentType:(signed __int16)a5 forceFullSizeImage:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ICAttachmentImageLoadingOperation;
  v15 = [(ICAttachmentImageLoadingOperation *)&v30 init];
  v16 = v15;
  if (v15)
  {
    [(ICAttachmentImageLoadingOperation *)v15 setCache:v12];
    v17 = [v13 managedObjectContext];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __114__ICAttachmentImageLoadingOperation_initWithCache_attachment_attachmentType_forceFullSizeImage_completionHandler___block_invoke;
    v27 = &unk_1E5FD91D0;
    id v28 = v13;
    v18 = v16;
    v29 = v18;
    [v17 performBlockAndWait:&v24];

    -[ICAttachmentImageLoadingOperation setAttachmentType:](v18, "setAttachmentType:", v9, v24, v25, v26, v27);
    [(ICAttachmentImageLoadingOperation *)v18 setForceFullSizeImage:v8];
    v19 = [MEMORY[0x1E4F1CA48] array];
    [(ICAttachmentImageLoadingOperation *)v18 setCompletionHandlers:v19];

    if (v14)
    {
      v20 = [(ICAttachmentImageLoadingOperation *)v18 completionHandlers];
      v21 = (void *)[v14 copy];
      v22 = _Block_copy(v21);
      [v20 addObject:v22];
    }
  }

  return v16;
}

- (void)setForceFullSizeImage:(BOOL)a3
{
  self->_forceFullSizeImage = a3;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (void)setAttachmentType:(signed __int16)a3
{
  self->_attachmentType = a3;
}

- (id)addCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  v6 = [(ICAttachmentImageLoadingOperation *)self completionHandlers];
  objc_sync_enter(v6);
  v7 = [(ICAttachmentImageLoadingOperation *)self completionHandlers];
  BOOL v8 = _Block_copy(v5);
  [v7 addObject:v8];

  objc_sync_exit(v6);
  uint64_t v9 = _Block_copy(v5);

  return v9;
}

- (void)main
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Had to fall back to cropping media for attachment: %@", (uint8_t *)&v3, 0xCu);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (BOOL)forceFullSizeImage
{
  return self->_forceFullSizeImage;
}

- (NSCache)cache
{
  return self->_cache;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

void __114__ICAttachmentImageLoadingOperation_initWithCache_attachment_attachmentType_forceFullSizeImage_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) media];
  uint64_t v2 = [v5 mediaURL];
  [*(id *)(a1 + 40) setMediaURL:v2];

  int v3 = [*(id *)(a1 + 32) objectID];
  [*(id *)(a1 + 40) setAttachmentObjectID:v3];

  uint64_t v4 = [*(id *)(a1 + 32) imageCacheKey];
  [*(id *)(a1 + 40) setCacheKey:v4];
}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F832A0];
  int v3 = [*(id *)(a1 + 32) attachmentObjectID];
  uint64_t v4 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  int v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isUnsupportedOnCurrentPlatform];
  if (v10) {
    LOBYTE(v10) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) hasFallbackImage];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) media];
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) hasFile];
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) imageFilterType];
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = (int)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) orientation];
  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) markupModelData];
  uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isPasswordProtected];
  uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) croppingQuad];
  uint64_t v18 = *(void *)(*(void *)(a1 + 120) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) attachmentModel];
  int v21 = [v20 needsFullSizePreview];

  if (v21)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) sizeWidth];
    double v23 = v22;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) sizeHeight];
    double v25 = v24;
    uint64_t v26 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "attachmentPreviewImageWithMinSize:scale:", v23, v24, 1.0);
    uint64_t v27 = *(void *)(*(void *)(a1 + 128) + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) width];
    double v30 = v29;
    [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) height];
    if (v30 >= v31) {
      double v31 = v30;
    }
    if (v23 >= v25) {
      double v32 = v23;
    }
    else {
      double v32 = v25;
    }
    if (vabdd_f64(v31, v32) >= 0.00999999978)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 0;
      if (![*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) length])
      {
        uint64_t v33 = *(void *)(*(void *)(a1 + 128) + 8);
        v34 = *(void **)(v33 + 40);
        *(void *)(v33 + 40) = 0;
      }
    }
  }
}

- (void)setMediaURL:(id)a3
{
}

- (void)setCacheKey:(id)a3
{
}

- (void)setAttachmentObjectID:(id)a3
{
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (signed)attachmentType
{
  return self->_attachmentType;
}

- (NSManagedObjectID)attachmentObjectID
{
  return self->_attachmentObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_attachmentObjectID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

- (void)removeCompletionHandler:(id)a3 cancelIfNoneLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id aBlock = a3;
  v6 = [(ICAttachmentImageLoadingOperation *)self completionHandlers];
  objc_sync_enter(v6);
  uint64_t v7 = [(ICAttachmentImageLoadingOperation *)self completionHandlers];
  uint64_t v8 = _Block_copy(aBlock);
  [v7 removeObject:v8];

  if (v4)
  {
    uint64_t v9 = [(ICAttachmentImageLoadingOperation *)self completionHandlers];
    uint64_t v10 = [v9 count];

    if (!v10) {
      [(ICAttachmentImageLoadingOperation *)self cancel];
    }
  }
  objc_sync_exit(v6);
}

uint64_t __41__ICAttachmentImageLoadingOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) fallbackImageData];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  return MEMORY[0x1F41817F8]();
}

intptr_t __41__ICAttachmentImageLoadingOperation_main__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) statusOfValueForKey:@"tracks" error:0] == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_previewImage");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

uint64_t __41__ICAttachmentImageLoadingOperation_main__block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) orientedImage];
  return MEMORY[0x1F41817F8]();
}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke_5(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) decryptedData];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end