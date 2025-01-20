@interface PXSimulatedUIMediaProvider
+ (id)defaultMediaProviderWithMediaProvider:(id)a3;
- (PXSimulatedUIMediaProvider)init;
- (PXSimulatedUIMediaProvider)initWithMediaProvider:(id)a3;
- (PXUIMediaProvider)mediaProvider;
- (id)_simulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
@end

@implementation PXSimulatedUIMediaProvider

- (void).cxx_destruct
{
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  v9 = [(PXSimulatedUIMediaProvider *)self _simulatedMediaRequestWithOriginalOptions:a4 simulatedResultHandler:a5];
  v10 = [(PXSimulatedUIMediaProvider *)self mediaProvider];
  v11 = [v9 simulatedOptions];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PXSimulatedUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5DC9DF8;
  id v16 = v9;
  id v12 = v9;
  int64_t v13 = [v10 requestAnimatedImageForAsset:v8 options:v11 resultHandler:v15];

  return v13;
}

void __81__PXSimulatedUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[PXSimulatedUIMediaProvider requestAnimatedImageForAsset:options:resultHandler:]_block_invoke"];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v7 handleFailureInFunction:v8, @"PXSimulatedUIMediaProvider.m", 113, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"result", v10, v11 file lineNumber description];
    }
  }
  [*(id *)(a1 + 32) handleOriginalResult:v12 info:v6];
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v14 = [(PXSimulatedUIMediaProvider *)self _simulatedMediaRequestWithOriginalOptions:a6 simulatedResultHandler:a7];
  v15 = [(PXSimulatedUIMediaProvider *)self mediaProvider];
  id v16 = [v14 simulatedOptions];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__PXSimulatedUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E5DC9DD0;
  id v21 = v14;
  id v17 = v14;
  int64_t v18 = objc_msgSend(v15, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v16, v20, width, height);

  return v18;
}

void __100__PXSimulatedUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[PXSimulatedUIMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:]_block_invoke"];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v7 handleFailureInFunction:v8, @"PXSimulatedUIMediaProvider.m", 104, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"result", v10, v11 file lineNumber description];
    }
  }
  [*(id *)(a1 + 32) handleOriginalResult:v12 info:v6];
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  v9 = [(PXSimulatedUIMediaProvider *)self _simulatedMediaRequestWithOriginalOptions:a4 simulatedResultHandler:a5];
  v10 = [(PXSimulatedUIMediaProvider *)self mediaProvider];
  v11 = [v9 simulatedOptions];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PXSimulatedUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5DC9DA8;
  id v16 = v9;
  id v12 = v9;
  int64_t v13 = [v10 requestPlayerItemForVideo:v8 options:v11 resultHandler:v15];

  return v13;
}

uint64_t __78__PXSimulatedUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleOriginalResult:a2 info:a3];
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v14 = [(PXSimulatedUIMediaProvider *)self _simulatedMediaRequestWithOriginalOptions:a6 simulatedResultHandler:a7];
  v15 = [(PXSimulatedUIMediaProvider *)self mediaProvider];
  id v16 = [v14 simulatedOptions];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__PXSimulatedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E5DCBFC0;
  id v21 = v14;
  id v17 = v14;
  int64_t v18 = objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v16, v20, width, height);

  return v18;
}

uint64_t __96__PXSimulatedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleOriginalResult:a2 info:a3];
}

- (id)_simulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  return +[_PXSimulatedMediaRequest defaultSimulatedMediaRequestWithOriginalOptions:a3 simulatedResultHandler:a4];
}

- (PXSimulatedUIMediaProvider)initWithMediaProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSimulatedUIMediaProvider;
  id v6 = [(PXSimulatedUIMediaProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaProvider, a3);
  }

  return v7;
}

- (PXSimulatedUIMediaProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSimulatedUIMediaProvider.m", 63, @"%s is not available as initializer", "-[PXSimulatedUIMediaProvider init]");

  abort();
}

+ (id)defaultMediaProviderWithMediaProvider:(id)a3
{
  id v3 = a3;
  v4 = +[PXMediaProviderSettings sharedInstance];
  if ([v4 wantsSimulation]) {
    id v5 = [[PXSimulatedUIMediaProvider alloc] initWithMediaProvider:v3];
  }
  else {
    id v5 = (PXSimulatedUIMediaProvider *)v3;
  }
  id v6 = v5;

  return v6;
}

@end