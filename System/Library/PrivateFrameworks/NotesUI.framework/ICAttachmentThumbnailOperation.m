@interface ICAttachmentThumbnailOperation
- (BOOL)attachmentPropertiesCaptured;
- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4;
- (BOOL)isMovie;
- (BOOL)showAsFileIcon;
- (CGSize)minSize;
- (ICAppearanceInfo)appearanceInfo;
- (ICAttachmentPreviewImageLoader)attachmentPreviewImageLoader;
- (ICAttachmentThumbnailOperation)initWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11 queue:(id)a12;
- (ICAttachmentThumbnailOperationQueue)queue;
- (ICThumbnailDataCache)cache;
- (NSManagedObjectID)attachmentID;
- (NSMutableArray)completionBlocks;
- (NSString)cacheKey;
- (NSURL)mediaURL;
- (double)scale;
- (id)fallbackBlock;
- (id)processingBlock;
- (unint64_t)imageScaling;
- (void)addCompletionBlock:(id)a3;
- (void)capturePropertiesFromAttachment:(id)a3;
- (void)main;
- (void)requestThumbnail;
- (void)setAppearanceInfo:(id)a3;
- (void)setAttachmentID:(id)a3;
- (void)setAttachmentPreviewImageLoader:(id)a3;
- (void)setAttachmentPropertiesCaptured:(BOOL)a3;
- (void)setCache:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setFallbackBlock:(id)a3;
- (void)setImageScaling:(unint64_t)a3;
- (void)setIsMovie:(BOOL)a3;
- (void)setMediaURL:(id)a3;
- (void)setMinSize:(CGSize)a3;
- (void)setProcessingBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScale:(double)a3;
- (void)setShowAsFileIcon:(BOOL)a3;
@end

@implementation ICAttachmentThumbnailOperation

- (ICAttachmentThumbnailOperation)initWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11 queue:(id)a12
{
  double height = a4.height;
  double width = a4.width;
  id v21 = a3;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  v41.receiver = self;
  v41.super_class = (Class)ICAttachmentThumbnailOperation;
  v29 = [(ICAttachmentThumbnailOperation *)&v41 init];
  v30 = v29;
  if (v29)
  {
    -[ICAttachmentThumbnailOperation setMinSize:](v29, "setMinSize:", width, height);
    [(ICAttachmentThumbnailOperation *)v30 setScale:a5];
    [(ICAttachmentThumbnailOperation *)v30 setAppearanceInfo:v22];
    [(ICAttachmentThumbnailOperation *)v30 setCache:v23];
    [(ICAttachmentThumbnailOperation *)v30 setCacheKey:v24];
    [(ICAttachmentThumbnailOperation *)v30 setFallbackBlock:v27];
    [(ICAttachmentThumbnailOperation *)v30 setProcessingBlock:v25];
    id v40 = v25;
    id v31 = v24;
    id v32 = v23;
    id v33 = v22;
    v34 = (void *)MEMORY[0x1E4F1CA48];
    v35 = (void *)[v26 copy];
    v36 = [v34 arrayWithObject:v35];
    [(ICAttachmentThumbnailOperation *)v30 setCompletionBlocks:v36];

    id v22 = v33;
    id v23 = v32;
    id v24 = v31;
    id v25 = v40;

    [(ICAttachmentThumbnailOperation *)v30 setQueue:v28];
    v37 = [v21 objectID];
    [(ICAttachmentThumbnailOperation *)v30 setAttachmentID:v37];

    v38 = [v21 note];

    if (!v38) {
      [(ICAttachmentThumbnailOperation *)v30 capturePropertiesFromAttachment:v21];
    }
  }

  return v30;
}

- (void)capturePropertiesFromAttachment:(id)a3
{
  id v19 = a3;
  v4 = [v19 attachmentModel];
  int v5 = [v4 hasPreviews];

  if (v5)
  {
    [(ICAttachmentThumbnailOperation *)self minSize];
    double v7 = v6;
    double v9 = v8;
    [(ICAttachmentThumbnailOperation *)self scale];
    double v11 = v10;
    v12 = [(ICAttachmentThumbnailOperation *)self appearanceInfo];
    v13 = objc_msgSend(v19, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v12, "type"), 1, v7, v9, v11);

    v14 = (void *)[v13 newImageLoaderForUpdatingImageOnCompletion:1];
    [(ICAttachmentThumbnailOperation *)self setAttachmentPreviewImageLoader:v14];

    -[ICAttachmentThumbnailOperation setImageScaling:](self, "setImageScaling:", [v13 scaleWhenDrawing]);
  }
  else
  {
    v15 = [v19 media];
    v16 = [v15 mediaURL];
    [(ICAttachmentThumbnailOperation *)self setMediaURL:v16];

    [(ICAttachmentThumbnailOperation *)self setImageScaling:2];
    [(ICAttachmentThumbnailOperation *)self setShowAsFileIcon:1];
  }
  v17 = [(ICAttachmentThumbnailOperation *)self attachmentPreviewImageLoader];
  if (v17)
  {
  }
  else
  {
    v18 = [(ICAttachmentThumbnailOperation *)self mediaURL];

    if (!v18) {
      goto LABEL_8;
    }
  }
  -[ICAttachmentThumbnailOperation setIsMovie:](self, "setIsMovie:", [v19 attachmentType] == 5);
LABEL_8:
  [(ICAttachmentThumbnailOperation *)self setAttachmentPropertiesCaptured:1];
}

- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(ICAttachmentThumbnailOperation *)self cacheKey];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(ICAttachmentThumbnailOperation *)self cache];
    BOOL v11 = v10 == v6;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)addCompletionBlock:(id)a3
{
  v4 = (void *)[a3 copy];
  id v3 = v4;
  performBlockOnMainThreadAndWait();
}

void __53__ICAttachmentThumbnailOperation_addCompletionBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completionBlocks];
  v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 addObject:v2];
}

- (void)main
{
  if ([(ICAttachmentThumbnailOperation *)self attachmentPropertiesCaptured])
  {
    id v3 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F83428] sharedContext];
    int v5 = [v4 workerManagedObjectContext];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__ICAttachmentThumbnailOperation_main__block_invoke;
    v22[3] = &unk_1E5FD91D0;
    id v3 = v5;
    id v23 = v3;
    id v24 = self;
    [v3 performBlockAndWait:v22];
  }
  id v6 = [(ICAttachmentThumbnailOperation *)self attachmentPreviewImageLoader];
  int v7 = [v6 canLoadImage];

  if (v7)
  {
    double v8 = [(ICAttachmentThumbnailOperation *)self attachmentPreviewImageLoader];
    uint64_t v9 = [v8 loadOrientedImage];
  }
  else
  {
    id v10 = [(ICAttachmentThumbnailOperation *)self mediaURL];

    if (v10)
    {
      [(ICAttachmentThumbnailOperation *)self requestThumbnail];
      goto LABEL_14;
    }
    BOOL v11 = [(ICAttachmentThumbnailOperation *)self fallbackBlock];

    if (!v11) {
      goto LABEL_14;
    }
    double v8 = [(ICAttachmentThumbnailOperation *)self fallbackBlock];
    [(ICAttachmentThumbnailOperation *)self scale];
    uint64_t v9 = v8[2](v8);
  }
  v12 = (void *)v9;

  if (v12)
  {
    v13 = [(ICAttachmentThumbnailOperation *)self processingBlock];

    if (v13)
    {
      v14 = [(ICAttachmentThumbnailOperation *)self processingBlock];
      uint64_t v15 = ((void (**)(void, void *, unint64_t, BOOL, BOOL))v14)[2](v14, v12, [(ICAttachmentThumbnailOperation *)self imageScaling], [(ICAttachmentThumbnailOperation *)self showAsFileIcon], [(ICAttachmentThumbnailOperation *)self isMovie]);

      v12 = (void *)v15;
    }
  }
  v16 = objc_msgSend(v12, "ic_decodeInBackground");

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F83528]), "initWithImage:imageScaling:showAsFileIcon:isMovie:", v16, -[ICAttachmentThumbnailOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailOperation isMovie](self, "isMovie"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__ICAttachmentThumbnailOperation_main__block_invoke_12;
  v19[3] = &unk_1E5FD91D0;
  id v20 = v17;
  id v21 = self;
  id v18 = v17;
  dispatch_async(MEMORY[0x1E4F14428], v19);

LABEL_14:
}

void __38__ICAttachmentThumbnailOperation_main__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) attachmentID];
  id v8 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v8];
  id v5 = v8;

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    int v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__ICAttachmentThumbnailOperation_main__block_invoke_cold_1(v1, v7);
    }
  }
  [*v1 capturePropertiesFromAttachment:v4];
}

void __38__ICAttachmentThumbnailOperation_main__block_invoke_12(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) image];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) cache];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) cacheKey];
    [v3 setThumbnailData:v4 forKey:v5];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v6 = objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [*(id *)(a1 + 32) image];
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v12, [*(id *)(a1 + 32) imageScaling], objc_msgSend(*(id *)(a1 + 32), "showAsFileIcon"), objc_msgSend(*(id *)(a1 + 32), "isMovie"));

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)requestThumbnail
{
  id v3 = [ICAttachmentThumbnailPostProcessingOperation alloc];
  [(ICAttachmentThumbnailOperation *)self minSize];
  double v5 = v4;
  double v7 = v6;
  [(ICAttachmentThumbnailOperation *)self scale];
  double v9 = v8;
  uint64_t v10 = [(ICAttachmentThumbnailOperation *)self appearanceInfo];
  uint64_t v11 = [(ICAttachmentThumbnailOperation *)self cache];
  v12 = [(ICAttachmentThumbnailOperation *)self cacheKey];
  long long v13 = [(ICAttachmentThumbnailOperation *)self processingBlock];
  long long v14 = [(ICAttachmentThumbnailOperation *)self completionBlocks];
  long long v15 = [(ICAttachmentThumbnailOperation *)self fallbackBlock];
  long long v16 = -[ICAttachmentThumbnailPostProcessingOperation initWithSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlocks:fallbackBlock:](v3, "initWithSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlocks:fallbackBlock:", v10, v11, v12, v13, v14, v15, v5, v7, v9);

  v17 = [(ICAttachmentThumbnailOperation *)self mediaURL];
  [(ICAttachmentThumbnailOperation *)self minSize];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  [(ICAttachmentThumbnailOperation *)self scale];
  id v22 = (void *)MEMORY[0x1E4F28B48];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke;
  v29[3] = &unk_1E5FDAC38;
  uint64_t v32 = v19;
  uint64_t v33 = v21;
  uint64_t v34 = v23;
  id v30 = v17;
  id v31 = v16;
  id v24 = v16;
  id v25 = v17;
  id v26 = [v22 blockOperationWithBlock:v29];
  [(ICAttachmentThumbnailPostProcessingOperation *)v24 addDependency:v26];
  id v27 = [(ICAttachmentThumbnailOperation *)self queue];
  [v27 addOperation:v26];

  id v28 = [(ICAttachmentThumbnailOperation *)self queue];
  [v28 addOperation:v24];
}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v2 = (void *)getQLThumbnailGenerationRequestClass_softClass;
  uint64_t v21 = getQLThumbnailGenerationRequestClass_softClass;
  if (!getQLThumbnailGenerationRequestClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __getQLThumbnailGenerationRequestClass_block_invoke;
    long long v16 = &unk_1E5FD95C0;
    v17 = &v18;
    __getQLThumbnailGenerationRequestClass_block_invoke((uint64_t)&v13);
    v2 = (void *)v19[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v18, 8);
  double v4 = objc_msgSend([v3 alloc], "initWithFileAtURL:size:scale:representationTypes:", *(void *)(a1 + 32), -1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2050000000;
  double v5 = (void *)getQLThumbnailGeneratorClass_softClass;
  uint64_t v21 = getQLThumbnailGeneratorClass_softClass;
  if (!getQLThumbnailGeneratorClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __getQLThumbnailGeneratorClass_block_invoke;
    long long v16 = &unk_1E5FD95C0;
    v17 = &v18;
    __getQLThumbnailGeneratorClass_block_invoke((uint64_t)&v13);
    double v5 = (void *)v19[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v18, 8);
  double v7 = [v6 sharedGenerator];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2;
  v10[3] = &unk_1E5FDAC10;
  id v11 = *(id *)(a1 + 40);
  dispatch_semaphore_t v12 = v8;
  double v9 = v8;
  [v7 generateBestRepresentationForRequest:v4 completionHandler:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 UIImage];
  [*(id *)(a1 + 32) setImage:v6];

  if (v5)
  {
    double v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2_cold_1((uint64_t)v5, v7);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (CGSize)minSize
{
  double width = self->_minSize.width;
  double height = self->_minSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
}

- (ICThumbnailDataCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (void)setProcessingBlock:(id)a3
{
}

- (ICAttachmentThumbnailOperationQueue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  return (ICAttachmentThumbnailOperationQueue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (NSManagedObjectID)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
}

- (BOOL)attachmentPropertiesCaptured
{
  return self->_attachmentPropertiesCaptured;
}

- (void)setAttachmentPropertiesCaptured:(BOOL)a3
{
  self->_attachmentPropertiesCaptured = a3;
}

- (ICAttachmentPreviewImageLoader)attachmentPreviewImageLoader
{
  return self->_attachmentPreviewImageLoader;
}

- (void)setAttachmentPreviewImageLoader:(id)a3
{
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (BOOL)showAsFileIcon
{
  return self->_showAsFileIcon;
}

- (void)setShowAsFileIcon:(BOOL)a3
{
  self->_showAsFileIcon = a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (void)setIsMovie:(BOOL)a3
{
  self->_isMovie = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_attachmentPreviewImageLoader, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
}

void __38__ICAttachmentThumbnailOperation_main__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 attachmentID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error getting attachment from object ID %@ in attachment thumbnail operation", (uint8_t *)&v4, 0xCu);
}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error getting thumbnail %@", (uint8_t *)&v2, 0xCu);
}

@end