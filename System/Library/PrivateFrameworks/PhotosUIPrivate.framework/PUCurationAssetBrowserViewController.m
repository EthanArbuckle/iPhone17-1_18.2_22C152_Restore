@interface PUCurationAssetBrowserViewController
- (NSMutableArray)assetContainers;
- (PHPhotoLibrary)photoLibrary;
- (PNScoreConfiguration)scoreConfiguration;
- (id)assetContainersForAssets:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)scoreByAssetForPlistPath:(id)a3;
- (void)_update;
- (void)setAssetContainers:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setScoreConfiguration:(id)a3;
- (void)setScoreConfiguration:(id)a3 forAssetUUIDs:(id)a4;
- (void)setScoreConfiguration:(id)a3 withAssets:(id)a4;
- (void)setScoreConfiguration:(id)a3 withFaces:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationAssetBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
  objc_storeStrong((id *)&self->_assetContainers, 0);
  objc_storeStrong((id *)&self->photoLibrary, 0);
}

- (void)setScoreConfiguration:(id)a3
{
}

- (PNScoreConfiguration)scoreConfiguration
{
  return self->_scoreConfiguration;
}

- (void)setAssetContainers:(id)a3
{
}

- (NSMutableArray)assetContainers
{
  return self->_assetContainers;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->photoLibrary;
}

- (id)scoreByAssetForPlistPath:(id)a3
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:a3];
}

- (id)assetContainersForAssets:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = [(PUCurationAssetBrowserViewController *)self scoreConfiguration];
    uint64_t v7 = [v6 dataType];

    if (v7 == 1)
    {
      v8 = (void *)MEMORY[0x1E4F8E840];
      v9 = [(PUCurationAssetBrowserViewController *)self photoLibrary];
      v10 = [(PUCurationAssetBrowserViewController *)self scoreConfiguration];
      v11 = objc_msgSend(v8, "plistPathForPhotoLibrary:dataType:", v9, objc_msgSend(v10, "dataType"));

      v12 = [(PUCurationAssetBrowserViewController *)self scoreByAssetForPlistPath:v11];
    }
    else
    {
      v12 = 0;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v28 = v4;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      double v17 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v20 = [(PUCurationAssetBrowserViewController *)self scoreConfiguration];
          uint64_t v21 = [v20 dataType];

          if (v21)
          {
            if (v21 != 1) {
              goto LABEL_16;
            }
            v22 = [v19 uuid];
            v23 = [v12 objectForKeyedSubscript:v22];
            [v23 doubleValue];
            double v17 = v24;
          }
          else
          {
            v22 = [v19 mediaAnalysisProperties];
            [v22 wallpaperScore];
            double v17 = v25;
          }

LABEL_16:
          if (v17 > 0.0)
          {
            v26 = objc_alloc_init(PUCurationAssetContainer);
            [(PUCurationAssetContainer *)v26 setScore:v17];
            [(PUCurationAssetContainer *)v26 setAsset:v19];
            [v5 addObject:v26];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    id v4 = v28;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PUCurationAssetBrowserViewController;
  id v6 = a4;
  uint64_t v7 = [(PUPhotosGridViewController *)&v14 collectionView:a3 cellForItemAtIndexPath:v6];
  v8 = [(PUCurationAssetBrowserViewController *)self assetContainers];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  [v10 score];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v11);
  [v7 setScore:v12];

  return v7;
}

- (void)_update
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(PUCurationAssetBrowserViewController *)self assetContainers];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(PUCurationAssetBrowserViewController *)self assetContainers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * v10) asset];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E4F38EE8];
  id v13 = [(PUCurationAssetBrowserViewController *)self scoreConfiguration];
  objc_super v14 = [v13 name];
  uint64_t v15 = [(PUCurationAssetBrowserViewController *)self photoLibrary];
  uint64_t v16 = [v12 transientAssetCollectionWithAssets:v5 title:v14 identifier:0 photoLibrary:v15];

  double v17 = (void *)MEMORY[0x1E4F39008];
  v27 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v19 = [v16 localizedTitle];
  v20 = [v17 transientCollectionListWithCollections:v18 title:v19];

  uint64_t v21 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v20 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v16 fetchResultContainingAssetCollection:v21 filterPredicate:0];
  v22 = [(PUCurationAssetBrowserViewController *)self collectionView];
  [v22 reloadData];
}

- (void)setScoreConfiguration:(id)a3 withAssets:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(PUCurationAssetBrowserViewController *)self setScoreConfiguration:a3];
  uint64_t v7 = [v6 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 firstObject];
    uint64_t v9 = [v8 photoLibrary];
    [(PUCurationAssetBrowserViewController *)self setPhotoLibrary:v9];

    uint64_t v10 = [(PUCurationAssetBrowserViewController *)self assetContainersForAssets:v6];
    [(PUCurationAssetBrowserViewController *)self setAssetContainers:v10];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"score" ascending:0];
    v12 = [(PUCurationAssetBrowserViewController *)self assetContainers];
    v14[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v12 sortUsingDescriptors:v13];
  }
  else
  {
    [(PUCurationAssetBrowserViewController *)self setAssetContainers:0];
  }
  if ([(PUCurationAssetBrowserViewController *)self isViewLoaded]) {
    [(PUCurationAssetBrowserViewController *)self _update];
  }
}

- (void)setScoreConfiguration:(id)a3 forAssetUUIDs:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F39228];
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v6, "px_systemPhotoLibrary");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v14 librarySpecificFetchOptions];
  uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v7 options:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
  v12 = [v10 fetchedObjects];
  id v13 = (void *)[v11 initWithArray:v12];

  [(PUCurationAssetBrowserViewController *)self setScoreConfiguration:v8 withAssets:v13];
}

- (void)setScoreConfiguration:(id)a3 withFaces:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v7 = *MEMORY[0x1E4F394E8];
  uint64_t v15 = *MEMORY[0x1E4F39448];
  uint64_t v16 = v7;
  uint64_t v8 = *MEMORY[0x1E4F39458];
  uint64_t v17 = *MEMORY[0x1E4F394E0];
  uint64_t v18 = v8;
  uint64_t v19 = *MEMORY[0x1E4F39538];
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 arrayWithObjects:&v15 count:5];
  id v13 = objc_msgSend(v6, "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v10, v12, v15, v16, v17, v18, v19, v20);

  id v14 = [v13 allValues];
  [(PUCurationAssetBrowserViewController *)self setScoreConfiguration:v11 withAssets:v14];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationAssetBrowserViewController;
  [(PUPhotosAlbumViewController *)&v4 viewDidLoad];
  id v3 = [(PUCurationAssetBrowserViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  [(PUCurationAssetBrowserViewController *)self _update];
}

@end