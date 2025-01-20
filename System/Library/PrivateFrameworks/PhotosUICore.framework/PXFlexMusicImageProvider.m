@interface PXFlexMusicImageProvider
- (OS_dispatch_queue)imageLoadingQueue;
- (PXFlexMusicImageProvider)init;
- (id)createImageLoaderForRequest:(id)a3;
- (id)imageCacheKeyForRequest:(id)a3;
- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5;
@end

@implementation PXFlexMusicImageProvider

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)imageLoadingQueue
{
  return self->_imageLoadingQueue;
}

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9 = a3;
  v10 = [a4 asset];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    v19 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 99, @"%@ should be an instance inheriting from %@, but it is %@", @"request.asset", v17, v19 object file lineNumber description];
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 99, @"%@ should be an instance inheriting from %@, but it is nil", @"request.asset", v17 object file lineNumber description];
  }

LABEL_3:
  id v11 = v9;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 100, @"%@ should be an instance inheriting from %@, but it is %@", @"imageLoader", v22, v24 object file lineNumber description];
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 100, @"%@ should be an instance inheriting from %@, but it is nil", @"imageLoader", v22 object file lineNumber description];
  }

LABEL_5:
  v12 = (void *)[v11 image];
  v13 = [v11 error];
  if (v12) {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v12];
  }
  if (a5) {
    *a5 = v13;
  }

  return v12;
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5 = a3;
  v6 = [v5 asset];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 94, @"%@ should be an instance inheriting from %@, but it is %@", @"request.asset", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 94, @"%@ should be an instance inheriting from %@, but it is nil", @"request.asset", v18 object file lineNumber description];
  }

LABEL_3:
  v7 = [_PXFlexMusicImageLoader alloc];
  v8 = [v5 asset];
  [v5 targetSize];
  double v10 = v9;
  double v12 = v11;

  v13 = [(PXFlexMusicImageProvider *)self imageLoadingQueue];
  v14 = -[_PXFlexMusicImageLoader initWithArtworkAsset:maxSize:sharedImageLoadingQueue:](v7, "initWithArtworkAsset:maxSize:sharedImageLoadingQueue:", v8, v13, v10, v12);

  return v14;
}

- (id)imageCacheKeyForRequest:(id)a3
{
  id v5 = a3;
  v6 = [v5 asset];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    v22 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 83, @"%@ should be an instance inheriting from %@, but it is %@", @"request.asset", v20, v22 object file lineNumber description];
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 83, @"%@ should be an instance inheriting from %@, but it is nil", @"request.asset", v20 object file lineNumber description];
  }

LABEL_3:
  v7 = [v5 asset];
  v8 = NSString;
  double v9 = [v7 audioAsset];
  double v10 = [v9 identifier];
  [v5 targetSize];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v24.width = v12;
  v24.height = v14;
  v15 = NSStringFromCGSize(v24);
  v16 = [v8 stringWithFormat:@"%@-%@", v10, v15];

  return v16;
}

- (PXFlexMusicImageProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXFlexMusicImageProvider;
  if ([(PXAudioAssetImageProvider *)&v3 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

@end