@interface NSItemProvider
@end

@implementation NSItemProvider

void __78__NSItemProvider_PhotosUICore__px_createStreamShareSourceWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    v11 = _PXItemProviderTemporaryURL(v5, v10);

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v12 removeItemAtURL:v11 error:0];

    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    [v13 moveItemAtURL:v5 toURL:v11 error:&v29];
    id v7 = v29;

    if (v7)
    {
      v14 = PLDragAndDropGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v31 = "-[NSItemProvider(PhotosUICore) px_createStreamShareSourceWithCompletionBlock:]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        __int16 v34 = 2112;
        id v35 = v7;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "%s: failed to move to tmp location file for %@ error: %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_32;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F8AC20]);
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "_px_shareMediaTypeFromUniformTypeIdentifier:", *(void *)(a1 + 40));
    [v16 setMediaType:v17];
    if ((unint64_t)(v17 - 1) < 2)
    {
      if (v5)
      {
        [v16 setMediaURL:v11];
LABEL_16:
        uint64_t v20 = *(void *)(a1 + 48);
        if (v20) {
          (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v16, 0);
        }
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      v21 = PLDragAndDropGetLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v24 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v31 = v24;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      v23 = "Couldn't get url from provider:%@ error:%@";
      goto LABEL_24;
    }
    if (v17)
    {
      if (v17 != 3)
      {
LABEL_26:
        if (*(void *)(a1 + 48))
        {
          v26 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Couldn't share item from provider %@", *(void *)(a1 + 32));
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        v27 = PLDragAndDropGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v31 = v28;
          _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_DEFAULT, "Couldn't share item with provider %@", buf, 0xCu);
        }

        goto LABEL_31;
      }
      uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "_px_sharedMediaVideoComplementFromURL:", v11);
      if (v18)
      {
        v19 = (void *)v18;
        [v16 setVideoComplement:v18];
        [v16 setMediaURL:v11];

        goto LABEL_16;
      }
      v21 = PLDragAndDropGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v31 = v25;
        __int16 v32 = 2112;
        uint64_t v33 = 0;
        v23 = "Couldn't get live photo from provider:%@ error:%@";
        goto LABEL_24;
      }
    }
    else
    {
      v21 = PLDragAndDropGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = 0;
        v23 = "Media type unknown, couldn't get url from provider:%@ error:%@";
LABEL_24:
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  id v7 = v6;
  v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v31 = "-[NSItemProvider(PhotosUICore) px_createStreamShareSourceWithCompletionBlock:]_block_invoke";
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "%s: failed to load file representation for %@ error: %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_33:
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__26369;
  v18[4] = __Block_byref_object_dispose__26370;
  id v19 = 0;
  id v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_191;
  v13[3] = &unk_1E5DBDC78;
  v8 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  id v16 = v9;
  uint64_t v17 = v18;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2;
  v10[3] = &unk_1E5DB1870;
  id v11 = *(id *)(a1 + 56);
  v12 = v18;
  [v7 performChanges:v13 completionHandler:v10];

  _Block_object_dispose(v18, 8);
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    v8 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v33 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "%s: failed to load file representation for %@ error: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v10 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    id v11 = _PXItemProviderTemporaryURL(v5, v10);

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v12 removeItemAtURL:v11 error:0];

    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    [v13 copyItemAtURL:v5 toURL:v11 error:&v29];
    id v7 = (uint64_t (*)(uint64_t, uint64_t))v29;

    if (v7)
    {
      id v14 = PLDragAndDropGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v33 = v7;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "%s: failed to move to tmp location file for %@ error: %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v33 = __Block_byref_object_copy__26369;
      __int16 v34 = __Block_byref_object_dispose__26370;
      id v35 = 0;
      id v16 = objc_msgSend(*(id *)(a1 + 32), "_px_assetResourceBagsFromUniformTypeIdentifier:atURL:", *(void *)(a1 + 40), v11);
      if ([v16 count])
      {
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_204;
        v24[3] = &unk_1E5DCA7A8;
        id v25 = v5;
        id v26 = *(id *)(a1 + 48);
        id v27 = v16;
        v28 = buf;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2_205;
        v20[3] = &unk_1E5DBF868;
        id v22 = *(id *)(a1 + 56);
        v23 = buf;
        id v21 = v11;
        [v17 performChanges:v24 completionHandler:v20];
      }
      else
      {
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Couldn't get valid resources %@", *(void *)(a1 + 32));
        uint64_t v18 = PLDragAndDropGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)v30 = 138412290;
          uint64_t v31 = v19;
          _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't share item with provider %@", v30, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }

      _Block_object_dispose(buf, 8);
    }
  }
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_204(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F38F70]);
  [v2 setShouldMoveFile:0];
  v3 = [*(id *)(a1 + 32) lastPathComponent];
  [v2 setOriginalFilename:v3];

  v4 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
  [v4 setImportSessionID:*(void *)(a1 + 40)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "resourceType", (void)v17);
        v12 = [v10 url];
        [v4 addResourceWithType:v11 fileURL:v12 options:v2];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v13 = [v4 placeholderForCreatedAsset];
  uint64_t v14 = [v13 localIdentifier];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2_205(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke_2";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "%s: failed to perform creationRequest with error: %@", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = (void *)[v5 copy];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v5;
  [v9 removeItemAtURL:v10 error:&v14];
  id v11 = v14;

  if (v11)
  {
    v12 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v16 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%s: failed to remove item at url  %@ with error: %@", buf, 0x20u);
    }
  }
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_191(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_px_assetResourceTypeFromUniformTypeIdentifier:", *(void *)(a1 + 40));
  id v8 = objc_alloc_init(MEMORY[0x1E4F38F70]);
  [v8 setShouldMoveFile:0];
  v3 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
  [v3 setImportSessionID:*(void *)(a1 + 48)];
  [v3 addResourceWithType:v2 data:*(void *)(a1 + 56) options:v8];
  v4 = [v3 placeholderForCreatedAsset];
  uint64_t v5 = [v4 localIdentifier];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    uint64_t v7 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke_2";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%s: failed to perform creationRequest with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

@end