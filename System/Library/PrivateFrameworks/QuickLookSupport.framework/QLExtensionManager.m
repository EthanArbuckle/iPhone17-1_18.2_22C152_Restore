@interface QLExtensionManager
+ (BOOL)extension:(id)a3 supportsExactType:(id)a4;
+ (id)sharedManager;
+ (void)_resetSharedManager;
+ (void)_setSharedManager:(id)a3;
- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8;
- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7;
- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9;
- (QLExtensionManagerCache)previewExtensionCache;
- (QLExtensionManagerCache)previewHighMemoryExtensionCache;
- (QLExtensionManagerCache)thumbnailExtensionCache;
- (QLExtensionManagerCache)thumbnailHighMemoryExtensionCache;
- (QLExtensionManagerCache)thumbnailSecureExtensionCache;
- (id)_applicationPathForBundleId:(id)a3;
- (id)_cachesForExtensionType:(unint64_t)a3 shouldUseRestrictedExtension:(BOOL)a4;
- (id)_extensionPointNameForExtensionType:(unint64_t)a3;
- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8;
- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9;
- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10;
- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9;
- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10;
- (void)_addQueryAttributesToExtensionQuery:(id)a3 withContentType:(id)a4 appBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7;
- (void)_setupCache;
- (void)extensionContextForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtensionOnly:(BOOL)a5 appBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 withCompletionHandler:(id)a10;
- (void)setPreviewExtensionCache:(id)a3;
- (void)setPreviewHighMemoryExtensionCache:(id)a3;
- (void)setThumbnailExtensionCache:(id)a3;
- (void)setThumbnailHighMemoryExtensionCache:(id)a3;
- (void)setThumbnailSecureExtensionCache:(id)a3;
@end

@implementation QLExtensionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedManager;
  return v2;
}

uint64_t __35__QLExtensionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(QLExtensionManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

  v2 = (void *)_sharedManager;
  return [v2 _setupCache];
}

+ (void)_setSharedManager:(id)a3
{
}

+ (void)_resetSharedManager
{
  v2 = objc_alloc_init(QLExtensionManager);
  v3 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v2;

  v4 = (void *)_sharedManager;
  [v4 _setupCache];
}

+ (BOOL)extension:(id)a3 supportsExactType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v7 = [v5 attributes];
  v8 = [v7 objectForKeyedSubscript:@"QLSupportedContentTypes"];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__QLExtensionManager_extension_supportsExactType___block_invoke;
  v11[3] = &unk_2642F2448;
  v13 = &v14;
  id v9 = v6;
  id v12 = v9;
  [v8 enumerateObjectsUsingBlock:v11];
  LOBYTE(v7) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

uint64_t __50__QLExtensionManager_extension_supportsExactType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 caseInsensitiveCompare:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)_setupCache
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = [QLExtensionManagerCache alloc];
  uint64_t v32 = *MEMORY[0x263F07FF8];
  uint64_t v4 = v32;
  v33[0] = @"com.apple.quicklook.preview";
  id v5 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  id v6 = [(QLExtensionManagerCache *)v3 initWithMatchingAttributes:v5];
  previewExtensionCache = self->_previewExtensionCache;
  self->_previewExtensionCache = v6;

  v8 = [QLExtensionManagerCache alloc];
  uint64_t v30 = v4;
  v31 = @"com.apple.quicklook.thumbnail";
  id v9 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v10 = [(QLExtensionManagerCache *)v8 initWithMatchingAttributes:v9];
  thumbnailExtensionCache = self->_thumbnailExtensionCache;
  self->_thumbnailExtensionCache = v10;

  id v12 = [QLExtensionManagerCache alloc];
  uint64_t v28 = v4;
  v29 = @"com.apple.quicklook.preview.highmemory";
  v13 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  uint64_t v14 = [(QLExtensionManagerCache *)v12 initWithMatchingAttributes:v13];
  previewHighMemoryExtensionCache = self->_previewHighMemoryExtensionCache;
  self->_previewHighMemoryExtensionCache = v14;

  uint64_t v16 = [QLExtensionManagerCache alloc];
  uint64_t v26 = v4;
  v27 = @"com.apple.quicklook.thumbnail.highmemory";
  char v17 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v18 = [(QLExtensionManagerCache *)v16 initWithMatchingAttributes:v17];
  thumbnailHighMemoryExtensionCache = self->_thumbnailHighMemoryExtensionCache;
  self->_thumbnailHighMemoryExtensionCache = v18;

  v20 = [QLExtensionManagerCache alloc];
  uint64_t v24 = v4;
  v25 = @"com.apple.quicklook.thumbnail.secure";
  v21 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v22 = [(QLExtensionManagerCache *)v20 initWithMatchingAttributes:v21];
  thumbnailSecureExtensionCache = self->_thumbnailSecureExtensionCache;
  self->_thumbnailSecureExtensionCache = v22;

  [(QLExtensionManagerCache *)self->_previewExtensionCache beginMatchingExtensions];
  [(QLExtensionManagerCache *)self->_thumbnailExtensionCache beginMatchingExtensions];
  [(QLExtensionManagerCache *)self->_previewHighMemoryExtensionCache beginMatchingExtensions];
  [(QLExtensionManagerCache *)self->_thumbnailHighMemoryExtensionCache beginMatchingExtensions];
  [(QLExtensionManagerCache *)self->_thumbnailSecureExtensionCache beginMatchingExtensions];
}

- (id)_cachesForExtensionType:(unint64_t)a3 shouldUseRestrictedExtension:(BOOL)a4
{
  BOOL v4 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__QLExtensionManager__cachesForExtensionType_shouldUseRestrictedExtension___block_invoke;
  block[3] = &unk_2642F2228;
  block[4] = self;
  if (_cachesForExtensionType_shouldUseRestrictedExtension__onceToken != -1) {
    dispatch_once(&_cachesForExtensionType_shouldUseRestrictedExtension__onceToken, block);
  }
  int v6 = _os_feature_enabled_impl();
  int v7 = _os_feature_enabled_impl();
  if (a3)
  {
    if (v7 | v6 & v4) {
      v8 = &_cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches;
    }
    else {
      v8 = &_cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches;
    }
    id v9 = (void *)*v8;
  }
  else
  {
    id v9 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches;
  }
  return v9;
}

void __75__QLExtensionManager__cachesForExtensionType_shouldUseRestrictedExtension___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) previewExtensionCache];
  v18[0] = v2;
  v3 = [*(id *)(a1 + 32) previewHighMemoryExtensionCache];
  v18[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  id v5 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches = v4;

  int v6 = [*(id *)(a1 + 32) thumbnailSecureExtensionCache];
  v17[0] = v6;
  int v7 = [*(id *)(a1 + 32) thumbnailExtensionCache];
  v17[1] = v7;
  v8 = [*(id *)(a1 + 32) thumbnailHighMemoryExtensionCache];
  v17[2] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v10 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches = v9;

  v11 = [*(id *)(a1 + 32) thumbnailExtensionCache];
  v16[0] = v11;
  id v12 = [*(id *)(a1 + 32) thumbnailHighMemoryExtensionCache];
  v16[1] = v12;
  v13 = [*(id *)(a1 + 32) thumbnailSecureExtensionCache];
  v16[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v15 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches = v14;
}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9
{
  LOBYTE(v12) = 0;
  uint64_t v9 = [(QLExtensionManager *)self extensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:a5 applicationBundleIdentifier:a6 extensionPath:a7 extensionType:a8 generationType:a9 shouldUseRestrictedExtension:v12];
  BOOL v10 = v9 != 0;

  return v10;
}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8
{
  return [(QLExtensionManager *)self existsExtensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:0 applicationBundleIdentifier:a5 extensionPath:a6 extensionType:a7 generationType:a8];
}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7
{
  return [(QLExtensionManager *)self existsExtensionForContentType:a3 allowExtensionsForParentTypes:a4 applicationBundleIdentifier:a5 extensionPath:0 extensionType:a6 generationType:a7];
}

- (void)extensionContextForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtensionOnly:(BOOL)a5 appBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 withCompletionHandler:(id)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v17 = a10;
  LOBYTE(v21) = 0;
  v18 = [(QLExtensionManager *)self extensionForContentType:a3 allowExtensionsForParentTypes:v14 firstPartyExtension:v13 applicationBundleIdentifier:a6 extensionPath:a7 extensionType:a8 generationType:a9 shouldUseRestrictedExtension:v21];
  v19 = v18;
  if (!v18)
  {
LABEL_9:
    (*((void (**)(id, void, void, void))v17 + 2))(v17, 0, 0, 0);
    goto LABEL_10;
  }
  if (a8 != 1 && ([v18 isGenerationPreview] & 1) == 0)
  {
    v20 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v20 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F31000, v20, OS_LOG_TYPE_ERROR, "Extension contexts can be provided for non-UI extensions only. #Remote", buf, 2u);
    }
    goto LABEL_9;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __192__QLExtensionManager_extensionContextForContentType_allowExtensionsForParentTypes_firstPartyExtensionOnly_appBundleIdentifier_extensionPath_extensionType_generationType_withCompletionHandler___block_invoke;
  v22[3] = &unk_2642F2470;
  id v23 = v19;
  id v24 = v17;
  [v23 beginExtensionRequestWithInputItems:0 completion:v22];

LABEL_10:
}

void __192__QLExtensionManager_extensionContextForContentType_allowExtensionsForParentTypes_firstPartyExtensionOnly_appBundleIdentifier_extensionPath_extensionType_generationType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      int v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_217F31000, v7, OS_LOG_TYPE_FAULT, "Error while instantiating extension's object: %@ #Remote", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [*(id *)(a1 + 32) _extensionContextForUUID:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  v19 = v18;
  BOOL v20 = v16 != 0;
  BOOL v21 = a9 == 1 && v16 != 0;
  if (a8 != 1) {
    BOOL v20 = 0;
  }
  if (!v20 && !v18 && !v17 && !v21)
  {
    v22 = 0;
    goto LABEL_35;
  }
  id v23 = objc_opt_new();
  id v36 = v16;
  id v37 = v17;
  [(QLExtensionManager *)self _addQueryAttributesToExtensionQuery:v23 withContentType:v16 appBundleIdentifier:v17 extensionType:a8 generationType:a9];
  v38 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = [(QLExtensionManager *)self _cachesForExtensionType:a8 shouldUseRestrictedExtension:a10];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        v22 = [*(id *)(*((void *)&v39 + 1) + 8 * i) extensionWithMatchingAttributes:v23 allowExtensionsForParentTypes:v14 extensionPath:v19 firstPartyExtension:v13];
        if (v22)
        {
          if (!a10)
          {

            goto LABEL_28;
          }
          [v38 addObject:v22];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  if (a10)
  {
    v29 = [v23 objectForKeyedSubscript:@"QLSupportedContentTypes"];
    v22 = +[QLExtensionManagerCache bestMatchingExtensionsFromSupportingExtensions:v38 includingExtensionsWithSupportingParentTypes:v14 byContentType:v29];

    if (v22)
    {
LABEL_28:
      v31 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v31 = _qlsLogHandle;
      }
      id v17 = v37;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = v31;
        v33 = [v22 extension];
        v34 = [v33 identifier];
        *(_DWORD *)buf = 138412802;
        v44 = v34;
        __int16 v45 = 2112;
        id v16 = v36;
        id v46 = v36;
        __int16 v47 = 2112;
        v48 = v37;
        _os_log_impl(&dword_217F31000, v32, OS_LOG_TYPE_DEBUG, "Found extension: %@ for content type: %@, bundle identifier: %@. #Remote", buf, 0x20u);

        goto LABEL_34;
      }
LABEL_33:
      id v16 = v36;
      goto LABEL_34;
    }
  }
  uint64_t v30 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    uint64_t v30 = _qlsLogHandle;
  }
  id v17 = v37;
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v22 = 0;
    goto LABEL_33;
  }
  *(_DWORD *)buf = 138412802;
  id v16 = v36;
  v44 = v36;
  __int16 v45 = 2112;
  id v46 = v37;
  __int16 v47 = 2112;
  v48 = v19;
  _os_log_impl(&dword_217F31000, v30, OS_LOG_TYPE_DEBUG, "Did not find any extension matching content type: %@ and application bundle identifier: %@. with specified path %@ #Remote", buf, 0x20u);
  v22 = 0;
LABEL_34:

LABEL_35:
  return v22;
}

- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(QLExtensionManager *)self qlExtensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:0 applicationBundleIdentifier:a5 extensionPath:a6 extensionType:a7 generationType:a8 shouldUseRestrictedExtension:v10];
}

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10
{
  LOBYTE(v13) = a10;
  uint64_t v10 = [(QLExtensionManager *)self qlExtensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:a5 applicationBundleIdentifier:a6 extensionPath:a7 extensionType:a8 generationType:a9 shouldUseRestrictedExtension:v13];
  uint64_t v11 = [v10 extension];

  return v11;
}

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8
{
  LOBYTE(v9) = 0;
  return [(QLExtensionManager *)self extensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:0 applicationBundleIdentifier:a5 extensionPath:a6 extensionType:a7 generationType:a8 shouldUseRestrictedExtension:v9];
}

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(QLExtensionManager *)self extensionForContentType:a3 allowExtensionsForParentTypes:a4 firstPartyExtension:0 applicationBundleIdentifier:a5 extensionPath:a6 extensionType:a7 generationType:a8 shouldUseRestrictedExtension:v10];
}

- (id)_extensionPointNameForExtensionType:(unint64_t)a3
{
  if (a3) {
    return @"com.apple.quicklook.thumbnail";
  }
  else {
    return @"com.apple.quicklook.preview";
  }
}

- (void)_addQueryAttributesToExtensionQuery:(id)a3 withContentType:(id)a4 appBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:@"QLSupportedContentTypes"];
  }
  if (!v13) {
    goto LABEL_9;
  }
  BOOL v14 = [(QLExtensionManager *)self _applicationPathForBundleId:v13];
  if (v14)
  {
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x263F07FB0]];
LABEL_8:

LABEL_9:
    if (a7 == 2) {
      [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"QLSupportsSearchableItems"];
    }
    goto LABEL_11;
  }
  v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:v13];
  id v16 = [v15 bundlePath];

  if (v16)
  {
    id v17 = [v15 bundlePath];
    [v11 setObject:v17 forKeyedSubscript:@"kQLExtensionFrameworkPath"];

    goto LABEL_8;
  }
  id v18 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v18 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412290;
    id v20 = v13;
    _os_log_impl(&dword_217F31000, v18, OS_LOG_TYPE_ERROR, "Could not retrieve application extension because Quick Look could not figure out the path from the bundle identifier: %@. #Remote", (uint8_t *)&v19, 0xCu);
  }

LABEL_11:
}

- (id)_applicationPathForBundleId:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v11];
  id v5 = v11;
  if (!v4)
  {
    uint64_t v6 = MEMORY[0x263F16100];
    int v7 = *(NSObject **)(MEMORY[0x263F16100] + 128);
    if (!v7)
    {
      QLTInitLogging();
      int v7 = *(NSObject **)(v6 + 128);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(QLExtensionManager *)(uint64_t)v3 _applicationPathForBundleId:v7];
    }
  }
  v8 = [v4 URL];
  uint64_t v9 = [v8 path];

  return v9;
}

- (QLExtensionManagerCache)thumbnailExtensionCache
{
  return self->_thumbnailExtensionCache;
}

- (void)setThumbnailExtensionCache:(id)a3
{
}

- (QLExtensionManagerCache)previewExtensionCache
{
  return self->_previewExtensionCache;
}

- (void)setPreviewExtensionCache:(id)a3
{
}

- (QLExtensionManagerCache)previewHighMemoryExtensionCache
{
  return self->_previewHighMemoryExtensionCache;
}

- (void)setPreviewHighMemoryExtensionCache:(id)a3
{
}

- (QLExtensionManagerCache)thumbnailHighMemoryExtensionCache
{
  return self->_thumbnailHighMemoryExtensionCache;
}

- (void)setThumbnailHighMemoryExtensionCache:(id)a3
{
}

- (QLExtensionManagerCache)thumbnailSecureExtensionCache
{
  return self->_thumbnailSecureExtensionCache;
}

- (void)setThumbnailSecureExtensionCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailSecureExtensionCache, 0);
  objc_storeStrong((id *)&self->_thumbnailHighMemoryExtensionCache, 0);
  objc_storeStrong((id *)&self->_previewHighMemoryExtensionCache, 0);
  objc_storeStrong((id *)&self->_previewExtensionCache, 0);
  objc_storeStrong((id *)&self->_thumbnailExtensionCache, 0);
}

- (void)_applicationPathForBundleId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_217F31000, log, OS_LOG_TYPE_ERROR, "No application record for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end