@interface PXPhotoKitAssetFilePromise
+ (id)filePromiseWithAsset:(id)a3 error:(id *)a4;
- (NSString)fileType;
- (PHAsset)asset;
- (id)fileNameForType:(id)a3;
- (void)writeToURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PXPhotoKitAssetFilePromise

+ (id)filePromiseWithAsset:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = 0;
  v8 = [MEMORY[0x1E4F38F38] exportRequestForAsset:v7 error:&v19];
  id v9 = v19;
  if (v8)
  {
    v10 = [v8 variants];
    v11 = [v10 objectForKeyedSubscript:&unk_1F02D6BF8];
    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }

    if ([v7 isRAW])
    {
      uint64_t v13 = [(id)*MEMORY[0x1E4F44410] identifier];
    }
    else
    {
      v16 = [NSNumber numberWithInteger:v12];
      uint64_t v13 = [v10 objectForKeyedSubscript:v16];
    }
    v15 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v15 + 4, a3);
    objc_storeStrong(v15 + 1, v8);
    v15[2] = (id)v12;
    id v17 = v15[5];
    v15[5] = (id)v13;
  }
  else
  {
    v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "No export request for asset %@ with error %@.", buf, 0x16u);
    }

    v15 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_exportRequest, 0);
}

- (NSString)fileType
{
  return self->_fileType;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)writeToURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXPhotoKitAssetFilePromise *)self asset];
  id v9 = objc_alloc_init(MEMORY[0x1E4F38F40]);
  [v9 setTreatLivePhotoAsStill:1];
  [v9 setFlattenSlomoVideos:1];
  [v9 setDontAllowRAW:1];
  [v9 setVariant:self->_variant];
  exportRequest = self->_exportRequest;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__PXPhotoKitAssetFilePromise_writeToURL_completionHandler___block_invoke;
  v14[3] = &unk_1E5DB4AA8;
  id v15 = v8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  [(PHAssetExportRequest *)exportRequest exportWithOptions:v9 completionHandler:v14];
}

void __59__PXPhotoKitAssetFilePromise_writeToURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) playbackStyle];
  if ((unint64_t)(v7 - 1) < 3)
  {
    v8 = (void *)MEMORY[0x1E4F393D8];
  }
  else
  {
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (!v7)
      {
        v14 = PLUIGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Trying to drag unsupported playback style", buf, 2u);
        }
      }
      goto LABEL_11;
    }
    v8 = (void *)MEMORY[0x1E4F393E0];
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:*v8];
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = *(void *)(a1 + 40);
    id v15 = 0;
    [v11 copyItemAtURL:v10 toURL:v12 error:&v15];
    id v13 = v15;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:

    goto LABEL_15;
  }
LABEL_11:
  if (!v6)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No export URL available for %@", *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:
}

- (id)fileNameForType:(id)a3
{
  v4 = [(PXPhotoKitAssetFilePromise *)self asset];
  id v5 = (void *)MEMORY[0x1E4F8CDF8];
  id v6 = [(PXPhotoKitAssetFilePromise *)self fileType];
  uint64_t v7 = [v5 typeWithIdentifier:v6];

  v8 = objc_msgSend(v4, "px_exportFilename");
  uint64_t v9 = [v8 stringByDeletingPathExtension];
  if (v7)
  {
    v10 = [MEMORY[0x1E4F8CDF8] preferredOrFallbackFilenameExtensionForType:v7];
  }
  else
  {
    v10 = @"data";
  }
  id v11 = [v9 stringByAppendingPathExtension:v10];

  return v11;
}

@end