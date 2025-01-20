@interface PUWrappingPXMediaProvider
- (PUMediaProvider)wrappedMediaProvider;
- (PUWrappingPXMediaProvider)initWithWrappedMediaProvider:(id)a3;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int64_t)a3;
@end

@implementation PUWrappingPXMediaProvider

- (void).cxx_destruct
{
}

- (PUMediaProvider)wrappedMediaProvider
{
  return self->_wrappedMediaProvider;
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  [v4 cancelImageRequest:a3];
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v17 = [v14 photoKitRequestOptions];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__PUWrappingPXMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E5F2D7D0;
  id v21 = v13;
  id v18 = v13;
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v20, width, height);

  return (int)a5;
}

uint64_t __99__PUWrappingPXMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PUWrappingPXMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5F2D7F8;
  id v16 = v8;
  id v13 = v8;
  LODWORD(v9) = [v11 requestAnimatedImageForAsset:v10 options:v12 resultHandler:v15];

  return (int)v9;
}

uint64_t __80__PUWrappingPXMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWrappingPXMediaProvider.m", 60, @"%s is not implemented", "-[PUWrappingPXMediaProvider requestStreamForVideo:options:resultHandler:]");

  abort();
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWrappingPXMediaProvider.m", 56, @"%s is not implemented", "-[PUWrappingPXMediaProvider requestURLForVideo:options:resultHandler:]");

  abort();
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PUWrappingPXMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5F25460;
  id v16 = v8;
  id v13 = v8;
  LODWORD(v9) = [v11 requestPlayerItemForVideo:v10 options:v12 resultHandler:v15];

  return (int)v9;
}

uint64_t __77__PUWrappingPXMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PUWrappingPXMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5F2D7A8;
  id v16 = v8;
  id v13 = v8;
  LODWORD(v9) = [v11 requestImageURLForAsset:v10 options:v12 resultHandler:v15];

  return (int)v9;
}

uint64_t __75__PUWrappingPXMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PUWrappingPXMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5F25438;
  id v16 = v8;
  id v13 = v8;
  LODWORD(v9) = [v11 requestImageDataForAsset:v10 options:v12 resultHandler:v15];

  return (int)v9;
}

uint64_t __76__PUWrappingPXMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(PUWrappingPXMediaProvider *)self wrappedMediaProvider];
  v17 = [v14 photoKitRequestOptions];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__PUWrappingPXMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E5F2DA80;
  id v21 = v13;
  id v18 = v13;
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v20, width, height);

  return (int)a5;
}

void __97__PUWrappingPXMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v9 = a3;
  id v6 = v5;
  uint64_t v7 = [v6 CGImage];
  uint64_t v8 = [v6 imageOrientation];

  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v7, v8, v9);
}

- (PUWrappingPXMediaProvider)initWithWrappedMediaProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUWrappingPXMediaProvider;
  id v6 = [(PUWrappingPXMediaProvider *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedMediaProvider, a3);
  }

  return v7;
}

@end