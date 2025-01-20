@interface PHAWallpaperGalleryDemoHelper
+ (id)_sampleDemoConifg;
+ (id)_shuffleConfig;
+ (id)_suggestedPhotoConfig;
- (PHAWallpaperGalleryDemoHelper)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (id)_demoShuffleDescriptors;
- (id)_demoSuggestedPhotoDescriptors;
- (id)_descriptorConfigsFromDictionaries:(id)a3;
- (id)_fetchWallpaperSuggestionWithKeyAssetUUID:(id)a3;
- (id)demoDescriptors;
@end

@implementation PHAWallpaperGalleryDemoHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (id)_fetchWallpaperSuggestionWithKeyAssetUUID:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F38EB8];
  v18[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v8 = [v5 fetchAssetsWithUUIDs:v6 options:v7];
  v9 = [v8 firstObject];

  if (v9)
  {
    v10 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v11 = [MEMORY[0x1E4F39310] predicateForAllTopWallpaperSuggestions];
    [v10 setPredicate:v11];

    v12 = [MEMORY[0x1E4F39310] fetchAssetCollectionsContainingAsset:v9 withType:8 options:v10];
    v13 = [v12 firstObject];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_debug_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEBUG, "[PHAWallpaperGalleryDemoHelper] cannot find asset: %@", (uint8_t *)&v16, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_descriptorConfigsFromDictionaries:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [[PHAWallpaperDemoDescriptorConfig alloc] initWithDictionary:v11];
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v11;
            _os_log_debug_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEBUG, "[PHAWallpaperGalleryDemoHelper] failed to create descriptor config from: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_demoShuffleDescriptors
{
  v3 = [(NSDictionary *)self->_config objectForKeyedSubscript:@"Shuffle"];
  if ([v3 count])
  {
    v19 = [[PHAWallpaperShuffleDescriptorGenerator alloc] initWithPhotoLibrary:self->_photoLibrary loggingConnection:self->_loggingConnection];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = v3;
    id v5 = [(PHAWallpaperGalleryDemoHelper *)self _descriptorConfigsFromDictionaries:v3];
    if ([v5 count])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
        uint64_t v8 = [v7 assetUUID];
        uint64_t v9 = [(PHAWallpaperGalleryDemoHelper *)self _fetchWallpaperSuggestionWithKeyAssetUUID:v8];

        if (v9)
        {
          v10 = [(PHAWallpaperShuffleDescriptorGenerator *)v19 descriptorForSuggestion:v9];
          uint64_t v11 = NSString;
          v12 = [MEMORY[0x1E4F8CD00] descriptorTypeStringWithType:2];
          v13 = [v9 uuid];
          v14 = [v11 stringWithFormat:@"%@|%d|%@", v12, v6, v13];
          [v10 setIdentifier:v14];

          long long v15 = [v7 titleKey];

          if (v15)
          {
            long long v16 = [v7 titleKey];
            [v10 setDisplayNameLocalizationKey:v16];
          }
          [v4 addObject:v10];
        }
        ++v6;
      }
      while ([v5 count] > v6);
    }

    v3 = v18;
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_demoSuggestedPhotoDescriptors
{
  v2 = self;
  v29[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_config objectForKeyedSubscript:@"SuggestedPhoto"];
  if ([v3 count])
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24 = v3;
    id v4 = [(PHAWallpaperGalleryDemoHelper *)v2 _descriptorConfigsFromDictionaries:v3];
    if ([v4 count])
    {
      unint64_t v5 = 0;
      v25 = v4;
      v26 = v2;
      do
      {
        unint64_t v6 = [v4 objectAtIndexedSubscript:v5];
        uint64_t v7 = [v6 assetUUID];
        uint64_t v8 = [(PHAWallpaperGalleryDemoHelper *)v2 _fetchWallpaperSuggestionWithKeyAssetUUID:v7];
        if (v8)
        {
          id v9 = objc_alloc(MEMORY[0x1E4F8CD28]);
          v10 = [v8 uuid];
          uint64_t v11 = objc_msgSend(v9, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v7, v10, objc_msgSend(v8, "subtype"));

          if ([v8 availableFeatures]) {
            uint64_t v12 = 3;
          }
          else {
            uint64_t v12 = 1;
          }
          id v13 = objc_alloc(MEMORY[0x1E4F8CD00]);
          v29[0] = v11;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
          long long v15 = (void *)[v13 initWithDescriptorType:v12 media:v14];

          long long v16 = (void *)MEMORY[0x1E4F8CD00];
          long long v17 = [v8 uuid];
          v28 = v17;
          long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          v19 = [v16 descriptorIdentifierForDescriptorType:v12 uuids:v18];

          uint64_t v20 = [NSString stringWithFormat:@"%d-%@", v5, v19];
          [v15 setIdentifier:v20];

          v21 = [v6 styleCategory];

          if (v21)
          {
            uint64_t v22 = [v6 styleCategory];
            [v15 setStyleCategory:v22];
          }
          [v27 addObject:v15];

          id v4 = v25;
          v2 = v26;
        }

        ++v5;
      }
      while ([v4 count] > v5);
    }

    v3 = v24;
  }
  else
  {
    id v27 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v27;
}

- (id)demoDescriptors
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PHAWallpaperGalleryDemoHelper *)self _demoSuggestedPhotoDescriptors];
  [v3 addObjectsFromArray:v4];

  unint64_t v5 = [(PHAWallpaperGalleryDemoHelper *)self _demoShuffleDescriptors];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (PHAWallpaperGalleryDemoHelper)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAWallpaperGalleryDemoHelper;
  id v9 = [(PHAWallpaperGalleryDemoHelper *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Media/PhotoData/Configuration/WallpaperDemo/DemoConfig.plist"];
    config = v10->_config;
    v10->_config = (NSDictionary *)v11;
  }
  return v10;
}

+ (id)_shuffleConfig
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"AssetUUID";
  v14[1] = @"TitleKey";
  v15[0] = @"929100F2-8AA2-413B-AB24-423FAB866205";
  v15[1] = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[0] = v2;
  v12[0] = @"AssetUUID";
  v12[1] = @"TitleKey";
  v13[0] = @"1F4DE92C-1EF8-48C3-A95B-C4ED8B948E45";
  v13[1] = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_LANDSCAPE";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v16[1] = v3;
  v10[0] = @"AssetUUID";
  v10[1] = @"TitleKey";
  v11[0] = @"E738E8EA-BE67-4778-AF34-1ECAE5DCBD9F";
  v11[1] = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_PETS";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v16[2] = v4;
  v8[0] = @"AssetUUID";
  v8[1] = @"TitleKey";
  v9[0] = @"0BA9BF90-A38D-47C0-AE23-BBAD20105270";
  v9[1] = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_PEOPLE";
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v16[3] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  return v6;
}

+ (id)_suggestedPhotoConfig
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"AssetUUID";
  v17[1] = @"StyleCategory";
  v18[0] = @"D85F0B18-CCF8-4D5D-AF4C-67572C1A21C5";
  v18[1] = @"BlackWhite";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v19[0] = v2;
  v15[0] = @"AssetUUID";
  v15[1] = @"StyleCategory";
  v16[0] = @"A8E7E0F1-9836-403B-A66B-47825D57055A";
  v16[1] = @"TrueColors";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v19[1] = v3;
  v13[0] = @"AssetUUID";
  v13[1] = @"StyleCategory";
  v14[0] = @"ABB4B8CB-5385-4527-B975-6B2332F16D4E";
  v14[1] = @"BlackWhite";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v19[2] = v4;
  v11[0] = @"AssetUUID";
  v11[1] = @"StyleCategory";
  v12[0] = @"A198882A-8571-4A6E-818D-FC692555C6EF";
  v12[1] = @"TrueColors";
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v19[3] = v5;
  v9[0] = @"AssetUUID";
  v9[1] = @"StyleCategory";
  v10[0] = @"FF09A649-221A-45AD-9BB0-D9976CF0C0BC";
  v10[1] = @"TrueColors";
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v19[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];

  return v7;
}

+ (id)_sampleDemoConifg
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"SuggestedPhoto";
  id v3 = [a1 _suggestedPhotoConfig];
  v7[1] = @"Shuffle";
  v8[0] = v3;
  id v4 = [a1 _shuffleConfig];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

@end