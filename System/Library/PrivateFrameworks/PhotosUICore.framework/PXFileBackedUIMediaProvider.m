@interface PXFileBackedUIMediaProvider
- (BOOL)isCachingEnabled;
- (PXFileBackedUIMediaProvider)init;
- (PXFileBackedUIMediaProvider)initWithCachingEnabled:(BOOL)a3;
- (id)_createImageForKey:(id)a3 error:(id *)a4;
- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 preferHDR:(BOOL)a6 bakeInOrientation:(BOOL)a7 error:(id *)a8;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_handleImageCreated:(id)a3 imageKey:(id)a4;
@end

@implementation PXFileBackedUIMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isCachingEnabled
{
  return self->_cachingEnabled;
}

- (void)_handleImageCreated:(id)a3 imageKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 && [(PXFileBackedUIMediaProvider *)self isCachingEnabled]) {
    [(NSCache *)self->_cache setObject:v7 forKey:v6];
  }
}

- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 preferHDR:(BOOL)a6 bakeInOrientation:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a5.height;
  double width = a5.width;
  v30[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v14 = (const __CFURL *)a3;
  id v15 = a4;
  v16 = v15;
  if (v15)
  {
    uint64_t v29 = *MEMORY[0x1E4F2FF78];
    v30[0] = v15;
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  }
  else
  {
    CFDictionaryRef v17 = 0;
  }
  CGImageSourceRef v18 = CGImageSourceCreateWithURL(v14, v17);
  if (!v18)
  {
    v27 = 0;
    if (!a8) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v19 = v18;
  if (width >= height) {
    double v20 = width;
  }
  else {
    double v20 = height;
  }
  uint64_t v21 = (int)v20;
  v22 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v23 = [NSNumber numberWithInt:v21];
  [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2FF68]];

  [v22 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F2FE28]];
  v24 = [NSNumber numberWithBool:v9];
  [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F2FE48]];

  if (v10) {
    [v22 setObject:*MEMORY[0x1E4F2FE68] forKeyedSubscript:*MEMORY[0x1E4F2FE58]];
  }
  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v19, 0, (CFDictionaryRef)v22);
  if (ThumbnailAtIndex)
  {
    v26 = ThumbnailAtIndex;
    v27 = [MEMORY[0x1E4FB1818] imageWithCGImage:ThumbnailAtIndex];
    CGImageRelease(v26);
  }
  else
  {
    v27 = 0;
  }
  CFRelease(v19);

  if (a8)
  {
LABEL_16:
    if (!v27)
    {
      *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXFileBackedUIMediaProviderErrorDomain" code:-100 userInfo:0];
    }
  }
LABEL_18:

  return v27;
}

- (id)_createImageForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 url];
  id v7 = (void *)MEMORY[0x1E4F8CDF8];
  v8 = [v6 pathExtension];
  BOOL v9 = [v7 typeWithFilenameExtension:v8];

  BOOL v10 = [v9 identifier];
  [v5 size];
  v13 = -[PXFileBackedUIMediaProvider _resizeImageAtURL:imageUTI:targetSize:preferHDR:bakeInOrientation:error:](self, "_resizeImageAtURL:imageUTI:targetSize:preferHDR:bakeInOrientation:error:", v6, v10, [v5 preferHDR], 1, 0, v11, v12);

  [(PXFileBackedUIMediaProvider *)self _handleImageCreated:v13 imageKey:v5];
  return v13;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  v16 = [PXFileBackedImageKey alloc];
  CFDictionaryRef v17 = [v15 url];
  CGImageSourceRef v18 = -[PXFileBackedImageKey initWithUrl:size:preferHDR:](v16, "initWithUrl:size:preferHDR:", v17, [v13 preferHDR], width, height);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DCAAC8;
  id v19 = v14;
  id v37 = v19;
  double v20 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v21 = [(NSCache *)self->_cache objectForKey:v18];
  if (v21)
  {
    v20[2](v20, v21, 0);
  }
  else if ([v13 isSynchronous])
  {
    id v35 = 0;
    v22 = [(PXFileBackedUIMediaProvider *)self _createImageForKey:v18 error:&v35];
    id v23 = v35;
    ((void (**)(void *, void *, id))v20)[2](v20, v22, v23);
  }
  else
  {
    v24 = [v15 previewImage];

    if (v24)
    {
      v25 = [v15 previewImage];
      v20[2](v20, v25, 0);
    }
    objc_initWeak(&location, self);
    v26 = (void *)MEMORY[0x1E4F28B48];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v29[3] = &unk_1E5DD2078;
    objc_copyWeak(&v33, &location);
    v30 = v18;
    id v31 = v13;
    v32 = v20;
    v27 = [v26 blockOperationWithBlock:v29];
    [(NSOperationQueue *)self->_queue addOperation:v27];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return 0;
}

void __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v10 = *MEMORY[0x1E4F39698];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v8);
  }
}

void __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0;
  v4 = [WeakRetained _createImageForKey:v3 error:&v13];
  id v5 = v13;

  id v6 = [*(id *)(a1 + 40) resultHandlerQueue];
  if (!v6)
  {
    *(id *)(a1 + 48);
    v5;
    id v8 = v4;
    px_dispatch_on_main_queue();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DD0E78;
  id v12 = *(id *)(a1 + 48);
  id v10 = v4;
  id v11 = v5;
  id v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F16620];
  id v7 = (void (**)(id, void *, void))a5;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [v8 url];

  id v11 = (void *)[v9 initWithURL:v10];
  v7[2](v7, v11, 0);

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (PXFileBackedUIMediaProvider)initWithCachingEnabled:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXFileBackedUIMediaProvider;
  v4 = [(PXFileBackedUIMediaProvider *)&v10 init];
  if (v4)
  {
    id v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v4->_queue;
    v4->_queue = v5;

    [(NSOperationQueue *)v4->_queue setMaxConcurrentOperationCount:4];
    [(NSOperationQueue *)v4->_queue setQualityOfService:25];
    id v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v4->_cache;
    v4->_cache = v7;

    v4->_cachingEnabled = a3;
  }
  return v4;
}

- (PXFileBackedUIMediaProvider)init
{
  return [(PXFileBackedUIMediaProvider *)self initWithCachingEnabled:1];
}

@end