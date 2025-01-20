@interface UIPasteboard(PhotosUICore)
+ (id)px_newPasteboardItemProviderForAsset:()PhotosUICore fileURL:utiType:;
+ (id)px_newPasteboardRepresentationForAsset:()PhotosUICore data:utiType:;
- (id)px_assets;
- (uint64_t)px_containsAssets;
@end

@implementation UIPasteboard(PhotosUICore)

- (uint64_t)px_containsAssets
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.mobileslideshow.asset.localidentifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = [a1 containsPasteboardTypes:v2];

  return v3;
}

- (id)px_assets
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [a1 valuesForPasteboardType:@"com.apple.mobileslideshow.asset.localidentifier" inItemSet:0];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
          if (v9) {
            [v2 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v5);
  }
  v28 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v10 = objc_msgSend(MEMORY[0x1E4F390A0], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:");
  v11 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v2 options:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        v19 = [v18 localIdentifier];
        [v12 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v15);
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v2;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * k)];
        if (v26) {
          [v20 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v23);
  }

  return v20;
}

+ (id)px_newPasteboardItemProviderForAsset:()PhotosUICore fileURL:utiType:
{
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F28D78];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  id v12 = v7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke;
  v24[3] = &unk_1E5DCC950;
  id v25 = v12;
  [v11 registerFileRepresentationForTypeIdentifier:v9 fileOptions:0 visibility:0 loadHandler:v24];

  id v13 = [v10 localIdentifier];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke_2;
  uint64_t v22 = &unk_1E5DCC978;
  id v23 = v13;
  id v14 = v13;
  [v11 registerDataRepresentationForTypeIdentifier:@"com.apple.mobileslideshow.asset.localidentifier" visibility:3 loadHandler:&v19];
  objc_msgSend(v10, "fetchPropertySetsIfNeeded", v19, v20, v21, v22);
  uint64_t v15 = [v10 originalMetadataProperties];

  uint64_t v16 = [v15 originalFilename];
  v17 = [v16 stringByDeletingPathExtension];

  [v11 setSuggestedName:v17];
  return v11;
}

+ (id)px_newPasteboardRepresentationForAsset:()PhotosUICore data:utiType:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 localIdentifier];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = v10;
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:@"com.apple.mobileslideshow.asset.localidentifier"];
  }
  if (v7 && v8) {
    [v11 setObject:v7 forKeyedSubscript:v8];
  }

  return v11;
}

@end