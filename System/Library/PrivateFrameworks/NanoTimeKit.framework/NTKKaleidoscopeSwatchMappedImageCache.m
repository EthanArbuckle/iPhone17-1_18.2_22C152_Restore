@interface NTKKaleidoscopeSwatchMappedImageCache
+ (id)keyForAsset:(id)a3 style:(id)a4 resourceDirectory:(id)a5;
+ (id)sharedCache;
- (id)_init;
- (void)_cleanCache;
- (void)_pruneUnusedKeys;
- (void)_removeImagesForKeysMatching:(id)a3;
- (void)faceCollectionDidLoad:(id)a3;
@end

@implementation NTKKaleidoscopeSwatchMappedImageCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_1 != -1) {
    dispatch_once(&sharedCache_onceToken_1, &__block_literal_global_85);
  }
  v2 = (void *)sharedCache_sharedCache_0;
  return v2;
}

void __52__NTKKaleidoscopeSwatchMappedImageCache_sharedCache__block_invoke()
{
  id v0 = [[NTKKaleidoscopeSwatchMappedImageCache alloc] _init];
  v1 = (void *)sharedCache_sharedCache_0;
  sharedCache_sharedCache_0 = (uint64_t)v0;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeSwatchMappedImageCache;
  v2 = [(NTKKaleidoscopeSwatchMappedImageCache *)&v5 initWithUniqueIdentifier:@"com.apple.nanotimekit.face.kaleidoscope.swatches"];
  v3 = v2;
  if (v2) {
    [(NTKKaleidoscopeSwatchMappedImageCache *)v2 _cleanCache];
  }
  return v3;
}

- (void)_removeImagesForKeysMatching:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKKaleidoscopeSwatchMappedImageCache *)self allKeys];
  v6 = (void *)[v5 copy];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke;
  v13[3] = &unk_1E62C4C30;
  id v14 = v4;
  id v7 = v4;
  v8 = [v6 indexesOfObjectsPassingTest:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke_2;
  v10[3] = &unk_1E62C4C58;
  id v11 = v6;
  v12 = self;
  id v9 = v6;
  [v8 enumerateIndexesUsingBlock:v10];
}

uint64_t __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKKaleidoscopeSwatchMappedImageCache: removing key %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) removeImageForKey:v3];
}

+ (id)keyForAsset:(id)a3 style:(id)a4 resourceDirectory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10 = +[NTKPhotosReader readerForResourceDirectory:v9];
    id v11 = [v10 firstObject];
    v12 = [v11 imageURL];
    v13 = [v12 URLByDeletingPathExtension];
    id v14 = [v13 lastPathComponent];
  }
  else
  {
    id v14 = 0;
  }
  v15 = NSString;
  v16 = NTKBuildVersion();
  v17 = [v15 stringWithFormat:@"%@-%@-%@", v16, v8, v7];

  if ([v7 asset] == 1000 && v14)
  {
    uint64_t v18 = [v17 stringByAppendingFormat:@"-%@", v14];

    v17 = (void *)v18;
  }

  return v17;
}

- (void)_cleanCache
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[NTKCompanionFaceCollectionsManager sharedInstance];
  id v4 = [v3 sharedLibraryFaceCollectionsForAllDevices];
  libraryCollections = self->_libraryCollections;
  self->_libraryCollections = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  loadedCollections = self->_loadedCollections;
  self->_loadedCollections = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_libraryCollections;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "addObserver:", self, (void)v16);
        id v14 = self->_loadedCollections;
        v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "hasLoaded"));
        [(NSMutableArray *)v14 addObject:v15];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(NTKKaleidoscopeSwatchMappedImageCache *)self _pruneUnusedKeys];
  [(NTKKaleidoscopeSwatchMappedImageCache *)self _removeImagesForKeysMatching:&__block_literal_global_18_0];
}

uint64_t __52__NTKKaleidoscopeSwatchMappedImageCache__cleanCache__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = NTKBuildVersion();
  int v4 = [v2 hasPrefix:v3];

  return v4 ^ 1u;
}

- (void)_pruneUnusedKeys
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = self->_loadedCollections;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v4)
  {

LABEL_14:
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    libraryCollections = self->_libraryCollections;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke;
    v20[3] = &unk_1E62C4CC8;
    id v12 = v9;
    id v21 = v12;
    id v13 = v10;
    id v22 = v13;
    v23 = self;
    [(NSArray *)libraryCollections enumerateObjectsUsingBlock:v20];
    id v14 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v13;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "NTKKaleidoscopeSwatchMappedImageCache: extant keys: %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_28;
    v17[3] = &unk_1E62C4CF0;
    id v18 = v12;
    id v19 = v13;
    id v15 = v13;
    id v16 = v12;
    [(NTKKaleidoscopeSwatchMappedImageCache *)self _removeImagesForKeysMatching:v17];

    return;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v25;
  char v7 = 1;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v3);
      }
      if (v7) {
        char v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) BOOLValue];
      }
      else {
        char v7 = 0;
      }
    }
    uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  }
  while (v5);

  if (v7) {
    goto LABEL_14;
  }
}

void __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F19A30];
  uint64_t v5 = [v3 deviceUUID];
  uint64_t v6 = [v4 deviceForNRDeviceUUID:v5];

  char v7 = objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:v6])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = +[NTKEnumeratedEditOption optionAtIndex:v8 forDevice:v6];
      [v7 addObject:v9];

      ++v8;
    }
    while (v8 < +[NTKEnumeratedEditOption numberOfOptionsForDevice:v6]);
  }
  uint64_t v10 = +[NTKKaleidoscopeAssetOption optionWithAsset:1000 forDevice:v6];
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [NSString stringWithFormat:@"%@", v10];
  [v11 addObject:v12];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_2;
  v17[3] = &unk_1E62C4CA0;
  id v18 = v7;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v19 = v13;
  uint64_t v20 = v14;
  id v21 = v10;
  id v15 = v10;
  id v16 = v7;
  [v3 enumerateFacesUsingBlock:v17];
}

void __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 resourceDirectory];
  if ([v3 faceStyle] == 23 && v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(a1 + 40);
          uint64_t v11 = objc_msgSend((id)objc_opt_class(), "keyForAsset:style:resourceDirectory:", *(void *)(a1 + 56), *(void *)(*((void *)&v12 + 1) + 8 * v9), v4, (void)v12);
          [v10 addObject:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "containsString:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11))
        {

          uint64_t v9 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (void)faceCollectionDidLoad:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_libraryCollections indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_loadedCollections setObject:MEMORY[0x1E4F1CC38] atIndexedSubscript:v4];
  }
  [(NTKKaleidoscopeSwatchMappedImageCache *)self _pruneUnusedKeys];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedCollections, 0);
  objc_storeStrong((id *)&self->_libraryCollections, 0);
  objc_storeStrong(&self->_activeDeviceNotificationBlock, 0);
}

@end