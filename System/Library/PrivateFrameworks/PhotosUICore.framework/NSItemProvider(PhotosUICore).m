@interface NSItemProvider(PhotosUICore)
- (id)_px_assetResourceBagsFromUniformTypeIdentifier:()PhotosUICore atURL:;
- (id)_px_bestTypeIdentifierForItemProvider:()PhotosUICore;
- (id)_px_sharedMediaVideoComplementFromURL:()PhotosUICore;
- (uint64_t)_px_assetResourceTypeFromUniformTypeIdentifier:()PhotosUICore;
- (uint64_t)_px_isSupportedUniformTypeIdentifier:()PhotosUICore;
- (uint64_t)_px_shareMediaTypeFromUniformTypeIdentifier:()PhotosUICore;
- (void)px_createAssetWithImportSessionID:()PhotosUICore completionBlock:;
- (void)px_createStreamShareSourceWithCompletionBlock:()PhotosUICore;
@end

@implementation NSItemProvider(PhotosUICore)

- (uint64_t)_px_shareMediaTypeFromUniformTypeIdentifier:()PhotosUICore
{
  v0 = objc_msgSend(MEMORY[0x1E4F8CDF8], "typeWithIdentifier:");
  if (PFIsLivePhotoBundleType())
  {
    uint64_t v1 = 3;
  }
  else if ([v0 conformsToType:*MEMORY[0x1E4F44448]])
  {
    uint64_t v1 = 1;
  }
  else if ([v0 conformsToType:*MEMORY[0x1E4F44400]])
  {
    uint64_t v1 = 2;
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

- (id)_px_sharedMediaVideoComplementFromURL:()PhotosUICore
{
  v3 = (objc_class *)MEMORY[0x1E4F8CE20];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleAtURL:v4];

  return v5;
}

- (id)_px_assetResourceBagsFromUniformTypeIdentifier:()PhotosUICore atURL:
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:a3];
  if (PFIsLivePhotoBundleType())
  {
    v7 = (_PXAssetResourceBag *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v5];
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [(_PXAssetResourceBag *)v7 imagePath];
    v10 = [v8 fileURLWithPath:v9];

    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [(_PXAssetResourceBag *)v7 videoPath];
    v13 = [v11 fileURLWithPath:v12];

    v14 = [[_PXAssetResourceBag alloc] initWithResourceType:1 atURL:v10];
    v15 = [[_PXAssetResourceBag alloc] initWithResourceType:9 atURL:v13];
    v22[0] = v14;
    v22[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

LABEL_8:
    goto LABEL_9;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44448]])
  {
    v7 = [[_PXAssetResourceBag alloc] initWithResourceType:2 atURL:v5];
    v21 = v7;
    v17 = (void *)MEMORY[0x1E4F1C978];
    v18 = &v21;
LABEL_7:
    v16 = [v17 arrayWithObjects:v18 count:1];
    goto LABEL_8;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44400]])
  {
    v7 = [[_PXAssetResourceBag alloc] initWithResourceType:1 atURL:v5];
    v20 = v7;
    v17 = (void *)MEMORY[0x1E4F1C978];
    v18 = &v20;
    goto LABEL_7;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (uint64_t)_px_assetResourceTypeFromUniformTypeIdentifier:()PhotosUICore
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }
  if ([v4 conformsToType:*MEMORY[0x1E4F44448]]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = [v4 conformsToType:*MEMORY[0x1E4F44400]];
  }

  return v5;
}

- (uint64_t)_px_isSupportedUniformTypeIdentifier:()PhotosUICore
{
  v0 = objc_msgSend(MEMORY[0x1E4F8CDF8], "typeWithIdentifier:");
  if (([v0 conformsToType:*MEMORY[0x1E4F44448]] & 1) != 0
    || ([v0 conformsToType:*MEMORY[0x1E4F44400]] & 1) != 0)
  {
    uint64_t v1 = 1;
  }
  else
  {
    uint64_t v1 = PFIsLivePhotoBundleType();
  }

  return v1;
}

- (id)_px_bestTypeIdentifierForItemProvider:()PhotosUICore
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [a3 registeredTypeIdentifiersWithFileOptions:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        char v10 = PFIsLivePhotoBundleType();

        if (v10)
        {
          v18 = PFCurrentPlatformLivePhotoBundleType();
          id v17 = [v18 identifier];

          goto LABEL_21;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if (objc_msgSend(a1, "_px_isSupportedUniformTypeIdentifier:", v16, (void)v20))
        {
          id v17 = v16;
          goto LABEL_21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      id v17 = 0;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_21:

  return v17;
}

- (void)px_createStreamShareSourceWithCompletionBlock:()PhotosUICore
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_px_bestTypeIdentifierForItemProvider:", a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__NSItemProvider_PhotosUICore__px_createStreamShareSourceWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E5DB7BE0;
  id v10 = v5;
  id v11 = v4;
  v9[4] = a1;
  id v6 = v5;
  id v7 = v4;
  id v8 = (id)[a1 loadFileRepresentationForTypeIdentifier:v6 completionHandler:v9];
}

- (void)px_createAssetWithImportSessionID:()PhotosUICore completionBlock:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "_px_bestTypeIdentifierForItemProvider:", a1);
  v9 = +[PXDragAndDropSettings sharedInstance];
  int v10 = [v9 useData];

  if (v10)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke;
    v26[3] = &unk_1E5DB1898;
    id v11 = &v27;
    v26[4] = a1;
    long long v27 = v8;
    uint64_t v12 = &v28;
    uint64_t v13 = &v29;
    id v28 = v6;
    id v29 = v7;
    id v14 = v6;
    id v15 = v8;
    id v16 = v7;
    id v17 = (id)[a1 loadDataRepresentationForTypeIdentifier:v15 completionHandler:v26];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_197;
    void v22[3] = &unk_1E5DB18C0;
    id v11 = &v25;
    uint64_t v12 = &v23;
    v22[4] = a1;
    long long v23 = v8;
    uint64_t v13 = &v24;
    id v24 = v6;
    id v25 = v7;
    id v18 = v6;
    id v19 = v8;
    id v20 = v7;
    id v21 = (id)[a1 loadFileRepresentationForTypeIdentifier:v19 completionHandler:v22];
  }
}

@end