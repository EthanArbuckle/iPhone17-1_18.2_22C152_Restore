@interface PUFilmstripMediaProvider
- (AVAsset)asset;
- (AVAssetImageGenerator)_imageGenerator;
- (AVVideoComposition)videoComposition;
- (BOOL)deliversImagesInOrder;
- (NSCache)_imageCache;
- (PUFilmstripMediaProvider)init;
- (PUFilmstripMediaProvider)initWithAVAsset:(id)a3 videoComposition:(id)a4;
- (UIImage)placeholderImage;
- (double)timeTolerance;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)_requestNumber;
- (void)_deliverPendingResults;
- (void)_deliverPlaceholderImage;
- (void)_deliverResult:(id)a3;
- (void)_didGenerateImage:(id)a3 error:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 generatorResult:(int64_t)a7 forResult:(id)a8;
- (void)_generateImageForResult:(id)a3;
- (void)_handleSourceTimeLoadedForAsset:(id)a3 time:(double)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 requestNumber:(int64_t)a7;
- (void)_performIvarRead:(id)a3;
- (void)_performIvarWrite:(id)a3;
- (void)_setImageCache:(id)a3;
- (void)_setImageGenerator:(id)a3;
- (void)_setRequestNumber:(int64_t)a3;
- (void)cancelAllRequests;
- (void)cancelImageRequest:(int)a3;
- (void)dealloc;
- (void)setDeliversImagesInOrder:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setTimeTolerance:(double)a3;
@end

@implementation PUFilmstripMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageCache, 0);
  objc_storeStrong((id *)&self->__imageGenerator, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_ivarQueue_pendingResults, 0);
  objc_storeStrong((id *)&self->_ivarQueue_completionHandlersByRequestNumber, 0);
  objc_storeStrong((id *)&self->_ivarQueue_resultsByRequestNumber, 0);
  objc_storeStrong((id *)&self->_imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

- (void)_setImageCache:(id)a3
{
}

- (NSCache)_imageCache
{
  return self->__imageCache;
}

- (void)_setRequestNumber:(int64_t)a3
{
  self->__requestNumber = a3;
}

- (int64_t)_requestNumber
{
  return self->__requestNumber;
}

- (void)_setImageGenerator:(id)a3
{
}

- (AVAssetImageGenerator)_imageGenerator
{
  return self->__imageGenerator;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)deliversImagesInOrder
{
  return self->_deliversImagesInOrder;
}

- (double)timeTolerance
{
  return self->_timeTolerance;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)_deliverPlaceholderImage
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__26768;
  v3[4] = __Block_byref_object_dispose__26769;
  id v4 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke;
  v2[3] = &unk_1E5F2E200;
  v2[4] = self;
  v2[5] = v3;
  [(PUFilmstripMediaProvider *)self _performIvarRead:v2];
  px_dispatch_on_main_queue();
  _Block_object_dispose(v3, 8);
}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) placeholderImage];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_3;
  v5[3] = &unk_1E5F255A0;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_3(uint64_t a1, uint64_t a2, void (**a3)(void, void, void))
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F396F8];
  v9[0] = @"PHImageResultIsPlaceholderKey";
  v9[1] = v5;
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = MEMORY[0x1E4F1CC38];
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  v7 = a3;
  v8 = [v6 dictionaryWithObjects:v10 forKeys:v9 count:2];
  ((void (**)(void, uint64_t, void *))a3)[2](v7, v4, v8);
}

- (void)_deliverResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "requestNumber"));
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__124;
  v20 = __Block_byref_object_dispose__125;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__PUFilmstripMediaProvider__deliverResult___block_invoke;
  v13[3] = &unk_1E5F2E0D0;
  v15 = &v16;
  v13[4] = self;
  id v6 = v5;
  id v14 = v6;
  [(PUFilmstripMediaProvider *)self _performIvarRead:v13];
  uint64_t v7 = v17[5];
  if (v7)
  {
    v8 = [v4 image];
    v9 = [v4 resultInfo];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__PUFilmstripMediaProvider__deliverResult___block_invoke_2;
  v11[3] = &unk_1E5F2ECC8;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  [(PUFilmstripMediaProvider *)self _performIvarWrite:v11];

  _Block_object_dispose(&v16, 8);
}

void __43__PUFilmstripMediaProvider__deliverResult___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __43__PUFilmstripMediaProvider__deliverResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_deliverPendingResults
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(PUFilmstripMediaProvider *)self deliversImagesInOrder])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__26768;
    v24 = __Block_byref_object_dispose__26769;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke;
    v19[3] = &unk_1E5F2E200;
    v19[4] = self;
    v19[5] = &v20;
    [(PUFilmstripMediaProvider *)self _performIvarRead:v19];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (1)
    {
      id v4 = [(id)v21[5] firstObject];
      int v5 = [v4 isReadyForDelivery];

      if (!v5) {
        break;
      }
      id v6 = [(id)v21[5] firstObject];
      [(PUFilmstripMediaProvider *)self _deliverResult:v6];
      [v3 addObject:v6];
      [(id)v21[5] removeObjectAtIndex:0];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_2;
    v17[3] = &unk_1E5F2ECC8;
    v17[4] = self;
    id v11 = v3;
    id v18 = v11;
    [(PUFilmstripMediaProvider *)self _performIvarWrite:v17];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__26768;
    v24 = __Block_byref_object_dispose__26769;
    id v25 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_3;
    v16[3] = &unk_1E5F2E200;
    v16[4] = self;
    v16[5] = &v20;
    [(PUFilmstripMediaProvider *)self _performIvarWrite:v16];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = (id)v21[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          -[PUFilmstripMediaProvider _deliverResult:](self, "_deliverResult:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v26 count:16];
      }
      while (v8);
    }

    _Block_object_dispose(&v20, 8);
  }
}

void __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsInArray:*(void *)(a1 + 40)];
}

uint64_t __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isReadyForDelivery == YES"];
  uint64_t v4 = [v2 filteredArrayUsingPredicate:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v7 removeObjectsInArray:v8];
}

- (void)_didGenerateImage:(id)a3 error:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 generatorResult:(int64_t)a7 forResult:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v13)
  {
    imageCache = self->__imageCache;
    id v18 = [v15 asset];
    [(NSCache *)imageCache setObject:v13 forKey:v18];
  }
  if (a7 == 2)
  {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F39690]];
  }
  else if (!v13 || a7 == 1)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v19 setObject:@"AVAssetImageGenerator failed to generate an image for the requested time" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    if (v14) {
      [v19 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUFilmstripMediaProviderErrorDomain" code:1 userInfo:v19];
    [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F39698]];
  }
  [v15 setImage:v13];
  [v15 setResultInfo:v16];
  long long v21 = *(_OWORD *)&a6->var0;
  int64_t var3 = a6->var3;
  [v15 setActualTime:&v21];
  [v15 setIsReadyForDelivery:1];
  px_dispatch_on_main_queue();
}

uint64_t __103__PUFilmstripMediaProvider__didGenerateImage_error_requestedTime_actualTime_generatorResult_forResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverPendingResults];
}

- (void)_generateImageForResult:(id)a3
{
  id v4 = a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke;
  v25[3] = &unk_1E5F2ECC8;
  v25[4] = self;
  id v5 = v4;
  id v26 = v5;
  id v6 = (void *)MEMORY[0x1B3E7C430]([(PUFilmstripMediaProvider *)self _performIvarWrite:v25]);
  id v7 = [(PUFilmstripMediaProvider *)self _imageGenerator];
  uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  double v10 = v9;

  [v5 targetSize];
  objc_msgSend(v7, "setMaximumSize:", v10 * v11, v10 * v12);
  memset(&v24, 0, sizeof(v24));
  id v13 = [v5 asset];
  [v13 sourceTime];
  CMTimeMakeWithSeconds(&v24, v14, 600);

  objc_initWeak(&location, self);
  imageGenerationQueue = self->_imageGenerationQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_2;
  v18[3] = &unk_1E5F25578;
  id v19 = v7;
  CMTime v22 = v24;
  id v16 = v7;
  objc_copyWeak(&v21, &location);
  id v17 = v5;
  id v20 = v17;
  dispatch_async(imageGenerationQueue, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  return [v2 sortUsingSelector:sel_compare_];
}

void __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v3 = [MEMORY[0x1E4F29238] valueWithCMTime:&v10];
  v12[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_3;
  v5[3] = &unk_1E5F25550;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 40);
  [v2 generateCGImagesAsynchronouslyForTimes:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1B3E7C430]();
  double v12 = 0;
  if (a3 && !v10)
  {
    double v12 = [MEMORY[0x1E4FB1818] imageWithCGImage:a3];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 64);
  long long v15 = *a4;
  uint64_t v16 = *((void *)a4 + 2);
  [WeakRetained _didGenerateImage:v12 error:v10 requestedTime:&v17 actualTime:&v15 generatorResult:a5 forResult:v14];
}

- (void)dealloc
{
  [(AVAssetImageGenerator *)self->__imageGenerator cancelAllCGImageGeneration];
  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripMediaProvider;
  [(PUFilmstripMediaProvider *)&v3 dealloc];
}

- (void)cancelAllRequests
{
  [(AVAssetImageGenerator *)self->__imageGenerator cancelAllCGImageGeneration];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PUFilmstripMediaProvider_cancelAllRequests__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUFilmstripMediaProvider *)self _performIvarWrite:v3];
}

uint64_t __45__PUFilmstripMediaProvider_cancelAllRequests__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v2 removeAllObjects];
}

- (void)cancelImageRequest:(int)a3
{
  v9[0] = 0;
  v9[1] = v9;
  void v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__26768;
  v9[4] = __Block_byref_object_dispose__26769;
  id v10 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke;
  v7[3] = &unk_1E5F25528;
  v7[4] = self;
  v7[5] = v9;
  int v8 = a3;
  [(PUFilmstripMediaProvider *)self _performIvarRead:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke_2;
  v5[3] = &unk_1E5F25528;
  void v5[4] = self;
  v5[5] = v9;
  int v6 = a3;
  [(PUFilmstripMediaProvider *)self _performIvarWrite:v5];
  [(PUFilmstripMediaProvider *)self _deliverPendingResults];
  _Block_object_dispose(v9, 8);
}

void __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 removeObjectForKey:v3];
}

- (void)_handleSourceTimeLoadedForAsset:(id)a3 time:(double)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 requestNumber:(int64_t)a7
{
  double height = a5.height;
  double width = a5.width;
  id v12 = a3;
  id v13 = objc_alloc_init(PUFilmstripMediaProviderResult);
  [(PUFilmstripMediaProviderResult *)v13 setAsset:v12];

  if (a6 == 1)
  {
    if (width <= height) {
      double width = 100000.0;
    }
    else {
      double height = 100000.0;
    }
  }
  -[PUFilmstripMediaProviderResult setTargetSize:](v13, "setTargetSize:", width, height);
  [(PUFilmstripMediaProviderResult *)v13 setRequestNumber:a7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__PUFilmstripMediaProvider__handleSourceTimeLoadedForAsset_time_targetSize_contentMode_requestNumber___block_invoke;
  v15[3] = &unk_1E5F2D2C8;
  uint64_t v16 = v13;
  int64_t v17 = a7;
  v15[4] = self;
  uint64_t v14 = v13;
  [(PUFilmstripMediaProvider *)self _performIvarWrite:v15];
  [(PUFilmstripMediaProvider *)self _generateImageForResult:v14];
}

void __102__PUFilmstripMediaProvider__handleSourceTimeLoadedForAsset_time_targetSize_contentMode_requestNumber___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  uint64_t v2 = *(void **)(a1[4] + 32);
  id v3 = [NSNumber numberWithInteger:a1[6]];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void (**)(void, void, void))v15;
  LODWORD(v17) = 0;
  if (v13 && v15)
  {
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      LODWORD(v17) = 0;
    }
    else
    {
      id v19 = [(NSCache *)self->__imageCache objectForKey:v13];
      if (v19)
      {
        ((void (**)(void, void *, void))v16)[2](v16, v19, 0);
        LODWORD(v17) = 0;
      }
      else
      {
        id v20 = [(PUFilmstripMediaProvider *)self placeholderImage];
        if (v20)
        {
          uint64_t v21 = *MEMORY[0x1E4F396F8];
          v32[0] = @"PHImageResultIsPlaceholderKey";
          v32[1] = v21;
          v33[0] = MEMORY[0x1E4F1CC38];
          v33[1] = MEMORY[0x1E4F1CC38];
          CMTime v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
          ((void (**)(void, void *, void *))v16)[2](v16, v20, v22);
        }
        int64_t v23 = [(PUFilmstripMediaProvider *)self _requestNumber];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v29[3] = &unk_1E5F2B448;
        int64_t v17 = (void *)(v23 + 1);
        v29[4] = self;
        int64_t v31 = v23 + 1;
        v30 = v16;
        [(PUFilmstripMediaProvider *)self _performIvarWrite:v29];
        [(PUFilmstripMediaProvider *)self _setRequestNumber:v17];
        objc_initWeak(&location, self);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
        v25[3] = &unk_1E5F25500;
        objc_copyWeak(v27, &location);
        id v26 = v13;
        v27[1] = *(id *)&width;
        v27[2] = *(id *)&height;
        v27[3] = (id)a5;
        v27[4] = v17;
        [v26 loadSourceTimeWithCompletionHandler:v25];

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
      }
    }
  }

  return (int)v17;
}

void __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = _Block_copy(v5);
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v3 setObject:v2 forKeyedSubscript:v4];
}

void __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _handleSourceTimeLoadedForAsset:time:targetSize:contentMode:requestNumber:](WeakRetained, "_handleSourceTimeLoadedForAsset:time:targetSize:contentMode:requestNumber:", *(void *)(a1 + 32), *(void *)(a1 + 64), *(void *)(a1 + 72), a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    id WeakRetained = PLUIGetLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1AE9F8000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load source time for asset: %@. Error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)setDeliversImagesInOrder:(BOOL)a3
{
  if (self->_deliversImagesInOrder != a3)
  {
    self->_deliversImagesInOrder = a3;
    if (!a3) {
      [(PUFilmstripMediaProvider *)self _deliverPendingResults];
    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(PUFilmstripMediaProvider *)self _deliverPlaceholderImage];
    id v5 = v6;
  }
}

- (void)setTimeTolerance:(double)a3
{
  self->_timeTolerance = a3;
  imageGenerator = self->__imageGenerator;
  Float64 v5 = a3 * 0.5;
  CMTimeMakeWithSeconds(&v8, a3 * 0.5, 100);
  [(AVAssetImageGenerator *)imageGenerator setRequestedTimeToleranceAfter:&v8];
  id v6 = self->__imageGenerator;
  CMTimeMakeWithSeconds(&v7, v5, 100);
  [(AVAssetImageGenerator *)v6 setRequestedTimeToleranceBefore:&v7];
}

- (void)_performIvarWrite:(id)a3
{
}

- (void)_performIvarRead:(id)a3
{
}

- (PUFilmstripMediaProvider)init
{
  return [(PUFilmstripMediaProvider *)self initWithAVAsset:0 videoComposition:0];
}

- (PUFilmstripMediaProvider)initWithAVAsset:(id)a3 videoComposition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PUFilmstripMediaProvider;
  CMTime v8 = [(PUFilmstripMediaProvider *)&v35 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v6];
      imageGenerator = v8->__imageGenerator;
      v8->__imageGenerator = (AVAssetImageGenerator *)v9;

      [(AVAssetImageGenerator *)v8->__imageGenerator setAppliesPreferredTrackTransform:1];
      uint64_t v11 = v8->__imageGenerator;
      CMTimeMake(&v34, 1, 2);
      [(AVAssetImageGenerator *)v11 setRequestedTimeToleranceAfter:&v34];
      __int16 v12 = v8->__imageGenerator;
      CMTimeMake(&v33, 1, 2);
      [(AVAssetImageGenerator *)v12 setRequestedTimeToleranceBefore:&v33];
      [(AVAssetImageGenerator *)v8->__imageGenerator setVideoComposition:v7];
      id v13 = [(AVAssetImageGenerator *)v8->__imageGenerator customVideoCompositor];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = [(AVAssetImageGenerator *)v8->__imageGenerator customVideoCompositor];
        [v15 setLabel:@"PUFilmstripMediaProvider"];
      }
    }
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int64_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.PUFilmstripMediaProvider.ivar", v17);
    ivarQueue = v8->_ivarQueue;
    v8->_ivarQueue = (OS_dispatch_queue *)v18;

    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.PUFilmstripMediaProvider.imageGeneration", v21);
    imageGenerationQueue = v8->_imageGenerationQueue;
    v8->_imageGenerationQueue = (OS_dispatch_queue *)v22;

    CMTime v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ivarQueue_completionHandlersByRequestNumber = v8->_ivarQueue_completionHandlersByRequestNumber;
    v8->_ivarQueue_completionHandlersByRequestNumber = v24;

    id v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ivarQueue_resultsByRequestNumber = v8->_ivarQueue_resultsByRequestNumber;
    v8->_ivarQueue_resultsByRequestNumber = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    ivarQueue_pendingResults = v8->_ivarQueue_pendingResults;
    v8->_ivarQueue_pendingResults = v28;

    v30 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v8->__imageCache;
    v8->__imageCache = v30;
  }
  return v8;
}

@end