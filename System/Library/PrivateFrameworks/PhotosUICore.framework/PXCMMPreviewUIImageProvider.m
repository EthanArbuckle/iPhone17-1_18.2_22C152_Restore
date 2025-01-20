@interface PXCMMPreviewUIImageProvider
- (id)_underlyingAssetMediaProviderForUnderlyingAsset:(id)a3;
- (id)_underlyingAssetsFromPreviewAssets:(id)a3;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (void)cancelImageRequest:(int64_t)a3;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PXCMMPreviewUIImageProvider

- (void).cxx_destruct
{
}

- (id)_underlyingAssetsFromPreviewAssets:(id)a3
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  v7 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PXCMMPreviewUIImageProvider__underlyingAssetsFromPreviewAssets___block_invoke;
  v12[3] = &unk_1E5DC5988;
  SEL v14 = a2;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateObjectsUsingBlock:v12];

  v9 = v13;
  id v10 = v8;

  return v10;
}

void __66__PXCMMPreviewUIImageProvider__underlyingAssetsFromPreviewAssets___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v11);
    v12 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
    [v4 handleFailureInMethod:v9, v10, @"PXCMMPreviewUIImageProvider.m", 160, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v8, v12 object file lineNumber description];
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v4 handleFailureInMethod:v5, v6, @"PXCMMPreviewUIImageProvider.m", 160, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v8 object file lineNumber description];
  }

LABEL_3:
  v3 = [v19 underlyingAsset];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = objc_msgSend(v3, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:v14, v15, @"PXCMMPreviewUIImageProvider.m", 161, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"previewAsset.underlyingAsset", v17, v18 object file lineNumber description];
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)_underlyingAssetMediaProviderForUnderlyingAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 148, @"Invalid parameter not satisfying: %@", @"underlyingAsset" object file lineNumber description];
  }
  underlyingAssetMediaProvider = self->_underlyingAssetMediaProvider;
  if (!underlyingAssetMediaProvider)
  {
    v7 = [off_1E5DA7108 defaultManager];
    id v8 = [v7 imageProviderForAsset:v5];
    uint64_t v9 = self->_underlyingAssetMediaProvider;
    self->_underlyingAssetMediaProvider = v8;

    underlyingAssetMediaProvider = self->_underlyingAssetMediaProvider;
  }
  uint64_t v10 = underlyingAssetMediaProvider;

  return v10;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = v14;
  if (!v17)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 85, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v24 object file lineNumber description];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v25);
    v26 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 85, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v24, v26 object file lineNumber description];

LABEL_12:
    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  if (v16) {
    goto LABEL_4;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 86, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

LABEL_4:
  v18 = [v17 underlyingAsset];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      v31 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
      [v28 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 89, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"previewAsset.underlyingAsset", v30, v31 object file lineNumber description];
    }
    id v19 = [(PXCMMPreviewUIImageProvider *)self _underlyingAssetMediaProviderForUnderlyingAsset:v18];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __97__PXCMMPreviewUIImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v32[3] = &unk_1E5DC5960;
    id v33 = v17;
    id v34 = v16;
    int64_t v20 = objc_msgSend(v19, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v18, a5, v15, v32, width, height);
  }
  else
  {
    _ReturnPreviewImage(v17, v16);
    int64_t v20 = 0;
  }

  return v20;
}

void __97__PXCMMPreviewUIImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (a2
    && ([v9 objectForKeyedSubscript:*MEMORY[0x1E4F39710]],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 BOOLValue],
        v6,
        !v7))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _ReturnPreviewImage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (void)stopCachingImagesForAllAssets
{
  if (self->_underlyingAssetMediaProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    underlyingAssetMediaProvider = self->_underlyingAssetMediaProvider;
    [(PXMediaProvider *)underlyingAssetMediaProvider stopCachingImagesForAllAssets];
  }
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v11 = a6;
  if (self->_underlyingAssetMediaProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = [(PXCMMPreviewUIImageProvider *)self _underlyingAssetsFromPreviewAssets:v13];
    -[PXMediaProvider startCachingImagesForAssets:targetSize:contentMode:options:](self->_underlyingAssetMediaProvider, "startCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);
  }
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a6;
  id v11 = [(PXCMMPreviewUIImageProvider *)self _underlyingAssetsFromPreviewAssets:a3];
  if ([v11 count])
  {
    v12 = [v11 firstObject];
    id v13 = [(PXCMMPreviewUIImageProvider *)self _underlyingAssetMediaProviderForUnderlyingAsset:v12];

    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v13, "startCachingImagesForAssets:targetSize:contentMode:options:", v11, a5, v14, width, height);
    }
  }
}

- (void)cancelImageRequest:(int64_t)a3
{
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = v14;
  if (!v17)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 27, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v24 object file lineNumber description];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v25);
    v26 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 27, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v24, v26 object file lineNumber description];

LABEL_12:
    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  if (v16) {
    goto LABEL_4;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 28, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

LABEL_4:
  v18 = [v17 underlyingAsset];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      v31 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
      [v28 handleFailureInMethod:a2, self, @"PXCMMPreviewUIImageProvider.m", 31, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"previewAsset.underlyingAsset", v30, v31 object file lineNumber description];
    }
    id v19 = [(PXCMMPreviewUIImageProvider *)self _underlyingAssetMediaProviderForUnderlyingAsset:v18];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __99__PXCMMPreviewUIImageProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v32[3] = &unk_1E5DC5960;
    id v33 = v17;
    id v34 = v16;
    int64_t v20 = objc_msgSend(v19, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v18, a5, v15, v32, width, height);
  }
  else
  {
    _ReturnPreviewCGImage(v17, v16);
    int64_t v20 = 0;
  }

  return v20;
}

void __99__PXCMMPreviewUIImageProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v9 = v6;
  if (a2
    && ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F39710]],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        !v8))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _ReturnPreviewCGImage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
}

@end