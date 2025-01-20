@interface PUPXMediaProvider
- (PUPXMediaProvider)init;
- (PUPXMediaProvider)initWithUnderlyingMediaProvider:(id)a3;
- (PXUIMediaProvider)underlyingMediaProvider;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
@end

@implementation PUPXMediaProvider

- (void).cxx_destruct
{
}

- (PXUIMediaProvider)underlyingMediaProvider
{
  return self->_underlyingMediaProvider;
}

- (void)cancelImageRequest:(int)a3
{
  id v4 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  [v4 cancelImageRequest:a3];
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  int v12 = [v11 requestAnimatedImageForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  int v12 = [v11 requestPlayerItemForVideo:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  int v12 = [v11 requestImageURLForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  int v12 = [v11 requestImageDataForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(PUPXMediaProvider *)self underlyingMediaProvider];
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (PUPXMediaProvider)initWithUnderlyingMediaProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXMediaProvider;
  v6 = [(PUPXMediaProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingMediaProvider, a3);
  }

  return v7;
}

- (PUPXMediaProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXMediaProvider.m", 22, @"%s is not available as initializer", "-[PUPXMediaProvider init]");

  abort();
}

@end