@interface ICAttachmentPreviewImage(UI)
+ (id)imageCache;
+ (id)orientedImage:()UI withTransform:background:backgroundTransform:;
- (BOOL)hasCachedImage;
- (id)asyncImage:()UI aboutToLoadHandler:;
- (id)cachedImage;
- (id)cachedOrientedImage;
- (id)image;
- (id)imageWithBackground:()UI;
- (id)newImageLoaderForUpdatingImageOnCompletion:()UI asyncDataLoading:;
- (id)orientedImage;
- (id)orientedImageID;
- (id)orientedImageWithBackground:()UI;
- (uint64_t)clearCachedImage;
- (uint64_t)clearCachedOrientedImage;
- (uint64_t)newImageLoaderForUpdatingImageOnCompletion:()UI;
- (uint64_t)previewImageOrientation;
- (void)orientedImageTransform;
- (void)setCachedImage:()UI;
- (void)setCachedOrientedImage:()UI;
- (void)writeOrientedPreviewToDisk;
@end

@implementation ICAttachmentPreviewImage(UI)

+ (id)imageCache
{
  if (imageCache_onceToken != -1) {
    dispatch_once(&imageCache_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)imageCache_imageCache;
  return v0;
}

- (id)cachedImage
{
  v2 = [a1 identifier];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F832E0] imageCache];
    v4 = [a1 identifier];
    v5 = [v3 imageForKey:v4];
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to get cached image, but the identifier is nil", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (void)setCachedImage:()UI
{
  id v4 = a3;
  v5 = [a1 identifier];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F832E0] imageCache];
    v7 = [a1 identifier];
    if (v4) {
      [v6 setImage:v4 forKey:v7];
    }
    else {
      [v6 removeImageForKey:v7];
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to set cached image, but the identifier is nil", v8, 2u);
    }
  }
}

- (BOOL)hasCachedImage
{
  v1 = [a1 cachedImage];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)clearCachedImage
{
  return [a1 setCachedImage:0];
}

- (id)orientedImageID
{
  BOOL v2 = [a1 identifier];

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F28E78];
    id v4 = [a1 identifier];
    v5 = [v3 stringWithString:v4];

    [v5 appendString:*MEMORY[0x1E4F83038]];
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to get oriented image ID, but the identifier is nil", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (id)cachedOrientedImage
{
  BOOL v2 = [a1 identifier];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F832E0] imageCache];
    id v4 = [a1 orientedImageID];
    v5 = [v3 imageForKey:v4];
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to get cached oriented image, but the identifier is nil", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (void)setCachedOrientedImage:()UI
{
  id v4 = a3;
  v5 = [a1 identifier];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F832E0] imageCache];
    v7 = [a1 orientedImageID];
    if (v4) {
      [v6 setImage:v4 forKey:v7];
    }
    else {
      [v6 removeImageForKey:v7];
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to set cached oriented image, but the identifier is nil", v8, 2u);
    }
  }
}

- (uint64_t)clearCachedOrientedImage
{
  return [a1 setCachedOrientedImage:0];
}

- (void)orientedImageTransform
{
  v3 = [a1 attachment];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 attachmentModel];
    v5 = v4;
    if (v4)
    {
      [v4 previewImageOrientationTransform];
    }
    else
    {
      a2[1] = 0u;
      a2[2] = 0u;
      *a2 = 0u;
    }

    v3 = v8;
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *a2 = *MEMORY[0x1E4F1DAB8];
    a2[1] = v7;
    a2[2] = *(_OWORD *)(v6 + 32);
  }
}

- (id)orientedImage
{
  BOOL v2 = [a1 cachedOrientedImage];
  if (!v2)
  {
    BOOL v2 = [a1 image];
    if (v2)
    {
      uint64_t v3 = [a1 previewImageOrientation];
      if (v3)
      {
        uint64_t v4 = v3;
        id v5 = objc_alloc(MEMORY[0x1E4FB1818]);
        uint64_t v6 = objc_msgSend(v2, "ic_CGImage");
        [v2 scale];
        uint64_t v7 = objc_msgSend(v5, "initWithCGImage:scale:orientation:", v6, v4);

        BOOL v2 = (void *)v7;
      }
    }
    [a1 setCachedOrientedImage:v2];
  }
  return v2;
}

- (uint64_t)previewImageOrientation
{
  v1 = [a1 attachment];
  BOOL v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 attachmentModel];
    uint64_t v4 = [v3 previewImageOrientation];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)imageWithBackground:()UI
{
  id v5 = (void *)MEMORY[0x1E4F832E0];
  uint64_t v6 = [a1 image];
  [a1 orientedImageTransform];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v7;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v8 = [v5 orientedImage:v6 withTransform:v10 background:a3 backgroundTransform:v11];

  return v8;
}

- (id)orientedImageWithBackground:()UI
{
  id v5 = (void *)MEMORY[0x1E4F832E0];
  uint64_t v6 = [a1 image];
  [a1 orientedImageTransform];
  [a1 orientedImageTransform];
  long long v7 = [v5 orientedImage:v6 withTransform:v10 background:a3 backgroundTransform:&v9];

  return v7;
}

+ (id)orientedImage:()UI withTransform:background:backgroundTransform:
{
  long long v6 = a4[1];
  v11[0] = *a4;
  v11[1] = v6;
  v11[2] = a4[2];
  long long v7 = a6[1];
  v10[0] = *a6;
  v10[1] = v7;
  v10[2] = a6[2];
  id v8 = +[ICAttachmentPreviewImageLoader orientedImage:a3 withTransform:v11 background:a5 backgroundTransform:v10];
  return v8;
}

- (uint64_t)newImageLoaderForUpdatingImageOnCompletion:()UI
{
  return [a1 newImageLoaderForUpdatingImageOnCompletion:a3 asyncDataLoading:0];
}

- (id)newImageLoaderForUpdatingImageOnCompletion:()UI asyncDataLoading:
{
  long long v7 = [a1 cachedImage];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [a1 previewImageURL];
  if (v9) {
    [v8 addObject:v9];
  }
  if ([a1 isPasswordProtected])
  {
    if (![a1 isAuthenticated]) {
      goto LABEL_10;
    }
    v10 = [a1 decryptedImageData];
    v11 = [ICAttachmentPreviewImageLoader alloc];
    v12 = [a1 cachedOrientedImage];
    [a1 scale];
    uint64_t v13 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v11, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v7, v12, v10, v8, a4);
    v14 = (void *)v32[5];
    v32[5] = v13;
  }
  else if (a4)
  {
    v15 = [ICAttachmentPreviewImageLoader alloc];
    v10 = [a1 cachedOrientedImage];
    [a1 scale];
    uint64_t v16 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v15, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v7, v10, 0, v8, 1);
    v17 = (void *)v32[5];
    v32[5] = v16;
  }
  else
  {
    v18 = [a1 fileQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke;
    block[3] = &unk_1E5FD94F8;
    v30 = &v31;
    id v27 = v7;
    v28 = a1;
    id v29 = v8;
    dispatch_sync(v18, block);

    v10 = v27;
  }

LABEL_10:
  uint64_t v19 = [a1 previewImageOrientation];
  [(id)v32[5] setImageOrientation:v19];
  if (a3)
  {
    v20 = (void *)[a1 imageID];
    objc_initWeak(&location, a1);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_2;
    v23[3] = &unk_1E5FD9548;
    objc_copyWeak(v24, &location);
    v24[1] = v20;
    [(id)v32[5] setImageDidLoadBlock:v23];
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  id v21 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (id)asyncImage:()UI aboutToLoadHandler:
{
  id v6 = a3;
  long long v7 = a4;
  id v8 = [a1 identifier];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  uint64_t v33 = __Block_byref_object_dispose__2;
  uint64_t v9 = [MEMORY[0x1E4F832E0] imageCache];
  id v34 = [v9 imageForKey:v8];

  if (!v30[5])
  {
    if (v7) {
      v7[2](v7);
    }
    v10 = (void *)[a1 newImageLoaderForUpdatingImageOnCompletion:0 asyncDataLoading:1];
    if ([v10 canLoadImage])
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x2020000000;
      char v28 = 0;
      v11 = [a1 fileQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke;
      block[3] = &unk_1E5FD9598;
      v25 = v27;
      v26 = &v29;
      id v22 = v8;
      id v23 = v10;
      id v24 = v6;
      id v12 = v10;
      dispatch_async(v11, block);

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_3;
      aBlock[3] = &unk_1E5FD95C0;
      aBlock[4] = v27;
      uint64_t v13 = _Block_copy(aBlock);

      _Block_object_dispose(v27, 8);
      if (v13) {
        goto LABEL_9;
      }
    }
    else
    {
      [a1 setNeedsToBeFetchedFromCloud:1];
    }
  }
  v14 = dispatch_get_global_queue(0, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_4;
  v17[3] = &unk_1E5FD95E8;
  id v18 = v6;
  uint64_t v19 = &v29;
  dispatch_async(v14, v17);

  uint64_t v13 = 0;
LABEL_9:
  v15 = _Block_copy(v13);

  _Block_object_dispose(&v29, 8);
  return v15;
}

- (id)image
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICAttachmentPreviewImage_UI__image__block_invoke;
  v7[3] = &unk_1E5FD9610;
  uint64_t v9 = &v10;
  uint64_t v3 = v2;
  id v8 = v3;
  id v4 = (id)[a1 asyncImage:v7 aboutToLoadHandler:0];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)writeOrientedPreviewToDisk
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Failed to get oriented image ref", v1, 2u);
}

@end