@interface PUMediaProvider
- (PXLoadingStatusManager)loadingStatusManager;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
- (void)setLoadingStatusManager:(id)a3;
@end

@implementation PUMediaProvider

- (void).cxx_destruct
{
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)cancelImageRequest:(int)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:48 description:@"concrete subclass must implement"];
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:43 description:@"concrete subclass must implement"];

  return 0;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:38 description:@"Concrete subclass must implement"];

  return 0;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  [v9 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:32 description:@"concrete subclass must implement"];

  return 0;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:27 description:@"concrete subclass must implement"];

  return 0;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = a5;
    v7 = [v5 errorWithDomain:@"PUMediaProviderErrorDomain" code:1 userInfo:0];
    uint64_t v10 = *MEMORY[0x1E4F39698];
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    (*((void (**)(id, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, v8);
  }
  return 0;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  [v9 handleFailureInMethod:a2 object:self file:@"PUMediaProvider.m" lineNumber:14 description:@"concrete subclass must implement"];

  return 0;
}

@end