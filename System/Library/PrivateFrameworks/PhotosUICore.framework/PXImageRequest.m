@interface PXImageRequest
- (BOOL)gotFullQualityImage;
- (BOOL)isCanceled;
- (BOOL)resultIsInCloud;
- (CGSize)targetSize;
- (NSError)error;
- (PXDisplayAsset)asset;
- (PXImageRequest)initWithMediaProvider:(id)a3 asset:(id)a4 targetSize:(CGSize)a5 options:(id)a6;
- (PXImageRequestOptions)options;
- (PXUIImageProvider)mediaProvider;
- (UIImage)image;
- (id)description;
- (int64_t)requestID;
- (void)cancel;
- (void)performWithResultHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setGotFullQualityImage:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setRequestID:(int64_t)a3;
- (void)setResultIsInCloud:(BOOL)a3;
@end

@implementation PXImageRequest

void __43__PXImageRequest_performWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = [v6 objectForKeyedSubscript:*(void *)off_1E5DAAFC8];
  objc_msgSend(v7, "setGotFullQualityImage:", objc_msgSend(v8, "BOOLValue") ^ 1);

  v9 = *(void **)(a1 + 32);
  v10 = [v6 objectForKeyedSubscript:*(void *)off_1E5DAAFD0];
  objc_msgSend(v9, "setResultIsInCloud:", objc_msgSend(v10, "BOOLValue"));

  v11 = [v6 objectForKeyedSubscript:*(void *)off_1E5DAAFC0];
  if (v11)
  {
    [*(id *)(a1 + 32) setError:v11];
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%@ recieved error:%@", (uint8_t *)&v14, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setResultIsInCloud:(BOOL)a3
{
  self->_resultIsInCloud = a3;
}

- (void)setGotFullQualityImage:(BOOL)a3
{
  self->_gotFullQualityImage = a3;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (BOOL)gotFullQualityImage
{
  return self->_gotFullQualityImage;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setError:(id)a3
{
}

- (BOOL)resultIsInCloud
{
  return self->_resultIsInCloud;
}

- (void)setImage:(id)a3
{
  self->_image = (UIImage *)a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setRequestID:(int64_t)a3
{
  self->_requestID = a3;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)PXImageRequest;
  v4 = [(PXImageRequest *)&v15 description];
  int64_t v5 = [(PXImageRequest *)self requestID];
  id v6 = [(PXImageRequest *)self asset];
  [(PXImageRequest *)self targetSize];
  v7 = NSStringFromCGSize(v17);
  v8 = [(PXImageRequest *)self image];
  BOOL v9 = [(PXImageRequest *)self gotFullQualityImage];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v11 = v10;
  v12 = [(PXImageRequest *)self error];
  uint64_t v13 = [v3 stringWithFormat:@"<%@ requestID:%ld asset:%p targetSize:%@ image:%@ gotFullQuality:%@ error:%@>", v4, v5, v6, v7, v8, v11, v12];

  return v13;
}

- (void)performWithResultHandler:(id)a3
{
  id v4 = a3;
  mediaProvider = self->_mediaProvider;
  asset = self->_asset;
  options = self->_options;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__PXImageRequest_performWithResultHandler___block_invoke;
  v11[3] = &unk_1E5DCE7D0;
  v11[4] = self;
  id v12 = v4;
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  id v10 = v4;
  self->_requestID = -[PXUIImageProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](mediaProvider, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", asset, 1, options, v11, width, height);
}

- (void)cancel
{
  int64_t v3 = [(PXImageRequest *)self requestID];
  if (v3)
  {
    int64_t v4 = v3;
    int64_t v5 = [(PXImageRequest *)self mediaProvider];
    [v5 cancelImageRequest:v4];
  }
  self->_canceled = 1;
}

- (PXImageRequest)initWithMediaProvider:(id)a3 asset:(id)a4 targetSize:(CGSize)a5 options:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXImageRequest;
  objc_super v15 = [(PXImageRequest *)&v18 init];
  __int16 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaProvider, a3);
    objc_storeStrong((id *)&v16->_asset, a4);
    v16->_targetSize.CGFloat width = width;
    v16->_targetSize.CGFloat height = height;
    objc_storeStrong((id *)&v16->_options, a6);
  }

  return v16;
}

@end