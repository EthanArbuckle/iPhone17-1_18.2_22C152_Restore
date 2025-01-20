@interface PXUIMediaProvider
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
@end

@implementation PXUIMediaProvider

void __89__PXUIMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [v7 imageOrientation];
  if (v7)
  {
    CGImageRef v6 = CGImageRetain((CGImageRef)[v7 CGImage]);
    CFAutorelease(v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__PXUIMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_26545A158;
  id v18 = v13;
  id v14 = v13;
  int64_t v15 = -[PXUIMediaProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  v10 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"PXUIMediaProvider.m", 43, @"Concrete subclass must implement %@", v10 object file lineNumber description];

  return 0;
}

@end