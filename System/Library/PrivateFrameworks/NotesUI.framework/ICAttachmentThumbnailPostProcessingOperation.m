@interface ICAttachmentThumbnailPostProcessingOperation
- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4;
- (BOOL)isMovie;
- (BOOL)showAsFileIcon;
- (CGSize)minSize;
- (ICAppearanceInfo)appearanceInfo;
- (ICAttachmentThumbnailPostProcessingOperation)initWithSize:(CGSize)a3 scale:(double)a4 appearanceInfo:(id)a5 cache:(id)a6 cacheKey:(id)a7 processingBlock:(id)a8 completionBlocks:(id)a9 fallbackBlock:(id)a10;
- (ICThumbnailDataCache)cache;
- (NSMutableArray)completionBlocks;
- (NSString)cacheKey;
- (NSURL)mediaURL;
- (UIImage)image;
- (double)scale;
- (id)fallbackBlock;
- (id)processingBlock;
- (unint64_t)imageScaling;
- (void)addCompletionBlock:(id)a3;
- (void)main;
- (void)setAppearanceInfo:(id)a3;
- (void)setCache:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setFallbackBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageScaling:(unint64_t)a3;
- (void)setIsMovie:(BOOL)a3;
- (void)setMediaURL:(id)a3;
- (void)setMinSize:(CGSize)a3;
- (void)setProcessingBlock:(id)a3;
- (void)setScale:(double)a3;
- (void)setShowAsFileIcon:(BOOL)a3;
@end

@implementation ICAttachmentThumbnailPostProcessingOperation

- (ICAttachmentThumbnailPostProcessingOperation)initWithSize:(CGSize)a3 scale:(double)a4 appearanceInfo:(id)a5 cache:(id)a6 cacheKey:(id)a7 processingBlock:(id)a8 completionBlocks:(id)a9 fallbackBlock:(id)a10
{
  double height = a3.height;
  double width = a3.width;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)ICAttachmentThumbnailPostProcessingOperation;
  v25 = [(ICAttachmentThumbnailPostProcessingOperation *)&v29 init];
  v26 = v25;
  if (v25)
  {
    -[ICAttachmentThumbnailPostProcessingOperation setMinSize:](v25, "setMinSize:", width, height);
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setScale:a4];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setAppearanceInfo:v19];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setCache:v20];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setCacheKey:v21];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setFallbackBlock:v24];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setProcessingBlock:v22];
    v27 = (void *)[v23 mutableCopy];
    [(ICAttachmentThumbnailPostProcessingOperation *)v26 setCompletionBlocks:v27];
  }
  return v26;
}

- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ICAttachmentThumbnailPostProcessingOperation *)self cacheKey];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(ICAttachmentThumbnailPostProcessingOperation *)self cache];
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

void __67__ICAttachmentThumbnailPostProcessingOperation_addCompletionBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completionBlocks];
  v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 addObject:v2];
}

- (void)main
{
  id v3 = [(ICAttachmentThumbnailPostProcessingOperation *)self image];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [(ICAttachmentThumbnailPostProcessingOperation *)self mediaURL];
    [(ICAttachmentThumbnailPostProcessingOperation *)self minSize];
    id v3 = objc_msgSend(v4, "ic_fileIconForURL:withPreferredSize:", v5);

    if (v3)
    {
      [(ICAttachmentThumbnailPostProcessingOperation *)self setShowAsFileIcon:1];
    }
    else
    {
      id v3 = [(ICAttachmentThumbnailPostProcessingOperation *)self fallbackBlock];

      if (!v3) {
        goto LABEL_6;
      }
      v12 = [(ICAttachmentThumbnailPostProcessingOperation *)self fallbackBlock];
      [(ICAttachmentThumbnailPostProcessingOperation *)self scale];
      id v3 = v12[2](v12);

      if (!v3) {
        goto LABEL_6;
      }
    }
  }
  id v6 = [(ICAttachmentThumbnailPostProcessingOperation *)self processingBlock];

  if (v6)
  {
    id v7 = [(ICAttachmentThumbnailPostProcessingOperation *)self processingBlock];
    uint64_t v8 = ((void (**)(void, void *, unint64_t, BOOL, BOOL))v7)[2](v7, v3, [(ICAttachmentThumbnailPostProcessingOperation *)self imageScaling], [(ICAttachmentThumbnailPostProcessingOperation *)self showAsFileIcon], [(ICAttachmentThumbnailPostProcessingOperation *)self isMovie]);

    id v3 = (void *)v8;
  }
LABEL_6:
  int v9 = objc_msgSend(v3, "ic_decodeInBackground");

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F83528]), "initWithImage:imageScaling:showAsFileIcon:isMovie:", v9, -[ICAttachmentThumbnailPostProcessingOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailPostProcessingOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailPostProcessingOperation isMovie](self, "isMovie"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ICAttachmentThumbnailPostProcessingOperation_main__block_invoke;
  v13[3] = &unk_1E5FD91D0;
  id v14 = v10;
  v15 = self;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __52__ICAttachmentThumbnailPostProcessingOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) image];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) cache];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [*(id *)(a1 + 40) cacheKey];
    [v3 setThumbnailData:v4 forKey:v5];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
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

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
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

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
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
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end