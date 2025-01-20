@interface ICAttachmentPreviewImage
@end

@implementation ICAttachmentPreviewImage

void __42__ICAttachmentPreviewImage_UI__imageCache__block_invoke()
{
  if (!imageCache_imageCache)
  {
    imageCache_imageCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F83398]);
    MEMORY[0x1F41817F8]();
  }
}

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke(uint64_t a1)
{
  v2 = [ICAttachmentPreviewImageLoader alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) cachedOrientedImage];
  [*(id *)(a1 + 40) scale];
  uint64_t v4 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v2, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v3, v7, 0, *(void *)(a1 + 48), 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_3;
  v9[3] = &unk_1E5FD9520;
  objc_copyWeak(v11, (id *)(a1 + 32));
  v11[1] = *(id *)(a1 + 40);
  char v12 = a3;
  id v8 = v5;
  id v10 = v8;
  [v7 performBlock:v9];

  objc_destroyWeak(v11);
}

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    BOOL v3 = [WeakRetained imageID] == *(void *)(a1 + 48);
    id WeakRetained = v5;
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 56)) {
        [v5 setCachedOrientedImage:v4];
      }
      else {
        [v5 setCachedImage:v4];
      }
      id WeakRetained = v5;
    }
  }
}

void __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F832E0] concurrentFileLoadLimitSemaphore];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v14 = [MEMORY[0x1E4F832E0] concurrentFileLoadLimitSemaphore];
    dispatch_semaphore_signal(v14);
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F832E0] imageCache];
    uint64_t v4 = [v3 imageForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v7 = [*(id *)(a1 + 40) loadImage];
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        id v10 = [MEMORY[0x1E4F832E0] imageCache];
        [v10 setImage:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 32)];
      }
    }
    v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_2;
    block[3] = &unk_1E5FD9570;
    *(_OWORD *)v15 = *(_OWORD *)(a1 + 48);
    id v12 = v15[0];
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *(void *)(a1 + 64);
    dispatch_async(v11, block);

    v13 = [MEMORY[0x1E4F832E0] concurrentFileLoadLimitSemaphore];
    dispatch_semaphore_signal(v13);
  }
}

void *__62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_2(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    return (void *)(*(uint64_t (**)(void, void))(result[4] + 16))(result[4], *(void *)(*(void *)(result[6] + 8) + 40));
  }
  return result;
}

uint64_t __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __37__ICAttachmentPreviewImage_UI__image__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end