@interface PXFlexMusicImageLoader
@end

@implementation PXFlexMusicImageLoader

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) maxSize];
  CFURLRef v3 = v2;
  v22[0] = *MEMORY[0x1E4F2FF08];
  *(void *)buf = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v22 count:1];
  CGImageSourceRef v5 = CGImageSourceCreateWithURL(v3, v4);

  if (v5) {
    PXCreateCGImageFromImageSourceWithMaxPixelSize();
  }
  v6 = (void *)[[NSString alloc] initWithFormat:@"FlexMusic returned a local file URL, but we could not use it to create an image: %@", v3];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  v22[0] = *MEMORY[0x1E4F28228];
  *(void *)buf = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v22 count:1];
  v9 = (void *)[v7 initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:3 userInfo:v8];

  id v10 = v9;
  id v11 = v10;
  v12 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v13;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to decode artwork image from URL: %@. Error: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_47;
  block[3] = &unk_1E5DD0D90;
  uint64_t v14 = *(void *)(a1 + 40);
  id v17 = v11;
  uint64_t v18 = 0;
  block[4] = v14;
  id v15 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  CFURLRef v3 = [*(id *)(a1 + 32) artworkAsset];
  CFDictionaryRef v4 = (void *)[v2 initWithFormat:@"Finished download data from Flex Music song, but we could not use it to create an image: %@", v3];

  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28228];
  v13[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v7 = objc_msgSend(v6, "px_dictionaryBySettingObject:forKey:", *(void *)(a1 + 40), *MEMORY[0x1E4F28A50]);
  uint64_t v8 = [v5 initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:3 userInfo:v7];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v8;

  id v11 = [*(id *)(a1 + 32) completionHandler];
  v11[2]();
}

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_47(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) completionHandler];
  v2[2]();
}

void __47___PXFlexMusicImageLoader_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFDictionaryRef v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleDownloadCompleted:a2 error:v5];
}

@end