@interface PUCurationLocationBrowserViewController
- (BOOL)saveToPlistForScoreDictionary:(id)a3 dataType:(int64_t)a4;
- (NSArray)availableLocations;
- (PHPhotoLibrary)photoLibrary;
- (PNScoreConfiguration)scoreConfiguration;
- (PUCurationAssetBrowserViewController)assetBrowserViewController;
- (PUCurationLocationBrowserViewController)initWithScoreConfiguration:(id)a3;
- (id)assetUUIDsByGeoHash;
- (id)cityNameForGeoHashWithAsseUUIDsByGeoHash:(id)a3;
- (id)geoHashContainers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAssetBrowserViewController:(id)a3;
- (void)setAvailableLocations:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setScoreConfiguration:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationLocationBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
  objc_storeStrong((id *)&self->_availableLocations, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setAssetBrowserViewController:(id)a3
{
}

- (PUCurationAssetBrowserViewController)assetBrowserViewController
{
  return self->_assetBrowserViewController;
}

- (void)setScoreConfiguration:(id)a3
{
}

- (PNScoreConfiguration)scoreConfiguration
{
  return self->_scoreConfiguration;
}

- (void)setAvailableLocations:(id)a3
{
}

- (NSArray)availableLocations
{
  return self->_availableLocations;
}

- (BOOL)saveToPlistForScoreDictionary:(id)a3 dataType:(int64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F8E840];
  id v7 = a3;
  v8 = [(PUCurationLocationBrowserViewController *)self photoLibrary];
  v9 = [v6 plistPathForPhotoLibrary:v8 dataType:a4];

  LOBYTE(v8) = [v7 writeToFile:v9 atomically:1];
  return (char)v8;
}

- (id)assetUUIDsByGeoHash
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PUCurationLocationBrowserViewController *)self photoLibrary];
  v5 = [v4 photoAnalysisClient];

  id v36 = 0;
  v6 = [v5 requestGeoHashForAssetLocalIdentifiers:0 geoHashSize:@"6" error:&v36];
  id v7 = v36;
  if (PULocationBrowserLog_onceToken != -1) {
    dispatch_once(&PULocationBrowserLog_onceToken, &__block_literal_global_88248);
  }
  v8 = (id)PULocationBrowserLog_log;
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v7;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Error requesting for geoHash for assetLocalIdentifiers: %@", buf, 0xCu);
    }
    id v10 = v3;
  }
  else
  {
    id v35 = 0;
    v11 = [v5 requestIconicSceneScoreForAssetLocalIdentifiers:MEMORY[0x1E4F1CBF0] error:&v35];
    id v7 = v35;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v7;
        _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Error requesting for iconicScore for assetLocalIdentifiers: %@", buf, 0xCu);
      }
      id v12 = v3;
    }
    else
    {
      v13 = [(PUCurationLocationBrowserViewController *)self scoreConfiguration];
      uint64_t v14 = [v13 dataType];

      v15 = [MEMORY[0x1E4F8E840] scoreConfigurationNamePrefixForDataType:v14];
      if (![(PUCurationLocationBrowserViewController *)self saveToPlistForScoreDictionary:v11 dataType:v14]&& os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v15;
        _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Fail to save plist %@ for iconicScore", buf, 0xCu);
      }
      if ([v6 count] && objc_msgSend(v11, "count"))
      {
        v28 = v15;
        v29 = v9;
        v30 = v5;
        v16 = [v6 allKeys];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              v22 = [v6 objectForKeyedSubscript:v21];
              v23 = [v11 objectForKeyedSubscript:v21];

              if (v23)
              {
                id v24 = [v3 objectForKeyedSubscript:v22];
                if (!v24)
                {
                  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [v3 setObject:v24 forKeyedSubscript:v22];
                }
                [v24 addObject:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v18);
        }
        id v25 = v3;

        id v7 = 0;
        v5 = v30;
        v15 = v28;
        v9 = v29;
      }
      else
      {
        id v26 = v3;
      }
    }
  }

  return v3;
}

- (id)cityNameForGeoHashWithAsseUUIDsByGeoHash:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [v4 allKeys];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v6;
  v9 = v5;
  obuint64_t j = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        v15 = [v4 objectForKeyedSubscript:v14];
        v16 = [v15 firstObject];
        if (v16)
        {
          [v9 addObject:v16];
          [v7 setObject:v14 forKeyedSubscript:v16];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v11);
  }
  long long v34 = v4;

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v18 = [(PUCurationLocationBrowserViewController *)self photoLibrary];
  uint64_t v19 = [v18 librarySpecificFetchOptions];

  uint64_t v45 = *MEMORY[0x1E4F39518];
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [v19 setFetchPropertySets:v20];

  long long v32 = v19;
  long long v33 = v9;
  uint64_t v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v9 options:v19];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        uint64_t v27 = [v26 localizedGeoDescription];
        if (v27) {
          v28 = (__CFString *)v27;
        }
        else {
          v28 = @"City Unavailable";
        }
        v29 = [v26 uuid];
        v30 = [v7 objectForKeyedSubscript:v29];

        [v17 setObject:v28 forKeyedSubscript:v30];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v23);
  }

  return v17;
}

- (id)geoHashContainers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(PUCurationLocationBrowserViewController *)self assetUUIDsByGeoHash];
  if ([v3 count])
  {
    id v4 = [(PUCurationLocationBrowserViewController *)self cityNameForGeoHashWithAsseUUIDsByGeoHash:v3];
    [v3 allKeys];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v10 = [v4 objectForKeyedSubscript:v9];
          uint64_t v11 = [PUCurationGeoHashContainer alloc];
          uint64_t v12 = [v3 objectForKeyedSubscript:v9];
          v13 = [(PUCurationGeoHashContainer *)v11 initWithGeoHash:v9 assetUUIDs:v12 cityName:v10];

          if ([(PUCurationGeoHashContainer *)v13 assetCount] >= 1) {
            [v19 addObject:v13];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v6);
    }
    uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetCount" ascending:0];
    v24[0] = v14;
    v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"geoHash" ascending:0];
    v24[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    [v19 sortUsingDescriptors:v16];
  }

  return v19;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PUCurationLocationBrowserViewController *)self availableLocations];
  uint64_t v7 = [v5 row];

  id v13 = [v6 objectAtIndex:v7];

  id v8 = [(PUCurationLocationBrowserViewController *)self assetBrowserViewController];
  uint64_t v9 = [(PUCurationLocationBrowserViewController *)self scoreConfiguration];
  uint64_t v10 = [v13 assetUUIDs];
  [v8 setScoreConfiguration:v9 forAssetUUIDs:v10];

  uint64_t v11 = [(PUCurationLocationBrowserViewController *)self navigationController];
  uint64_t v12 = [(PUCurationLocationBrowserViewController *)self assetBrowserViewController];
  [v11 pushViewController:v12 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"locationCellIdentifier" forIndexPath:v6];
  id v8 = [(PUCurationLocationBrowserViewController *)self availableLocations];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndex:v9];

  uint64_t v11 = NSString;
  uint64_t v12 = [v10 geoHash];
  id v13 = [v10 cityName];
  uint64_t v14 = [v11 stringWithFormat:@"%@, %@, %ld assets", v12, v13, objc_msgSend(v10, "assetCount")];
  v15 = [v7 textLabel];
  [v15 setText:v14];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PUCurationLocationBrowserViewController *)self availableLocations];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PUCurationLocationBrowserViewController;
  [(PUCurationLocationBrowserViewController *)&v6 viewDidLoad];
  id v3 = [(PUCurationLocationBrowserViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"locationCellIdentifier"];

  id v4 = [(PUCurationLocationBrowserViewController *)self geoHashContainers];
  availableLocations = self->_availableLocations;
  self->_availableLocations = v4;
}

- (PUCurationLocationBrowserViewController)initWithScoreConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUCurationLocationBrowserViewController;
  int64_t v5 = [(PUCurationLocationBrowserViewController *)&v13 init];
  if (v5)
  {
    objc_super v6 = [v4 name];
    [(PUCurationLocationBrowserViewController *)v5 setTitle:v6];

    uint64_t v7 = [(PUCurationLocationBrowserViewController *)v5 px_extendedTraitCollection];
    [v7 userInterfaceIdiom];
    objc_opt_class();

    id v8 = [PUCurationAssetBrowserViewController alloc];
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [(PUPhotosAlbumViewController *)v8 initWithSpec:v9];
    [(PUCurationLocationBrowserViewController *)v5 setAssetBrowserViewController:v10];

    [(PUCurationLocationBrowserViewController *)v5 setScoreConfiguration:v4];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    [(PUCurationLocationBrowserViewController *)v5 setPhotoLibrary:v11];
  }
  return v5;
}

@end