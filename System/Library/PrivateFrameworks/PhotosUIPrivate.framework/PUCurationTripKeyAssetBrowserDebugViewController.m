@interface PUCurationTripKeyAssetBrowserDebugViewController
- (BOOL)updateSpec;
- (PHPhotosHighlight)tripHighlight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)iconicSceneScores:(id)a3;
- (void)_update;
- (void)setTripHighlight:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUCurationTripKeyAssetBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripHighlight, 0);
  objc_storeStrong((id *)&self->_iconicSceneScores, 0);
  objc_storeStrong((id *)&self->_childHighlights, 0);
  objc_storeStrong((id *)&self->_tripKeyAssetUUID, 0);
}

- (PHPhotosHighlight)tripHighlight
{
  return self->_tripHighlight;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)PUCurationTripKeyAssetBrowserDebugViewController;
  id v6 = a4;
  v7 = [(PUPhotosGridViewController *)&v24 collectionView:a3 cellForItemAtIndexPath:v6];
  v8 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "item"));

  childHighlights = self->_childHighlights;
  uint64_t v11 = [v6 item];

  v12 = [(PHFetchResult *)childHighlights objectAtIndexedSubscript:v11];
  iconicSceneScores = self->_iconicSceneScores;
  v14 = [v9 uuid];
  v15 = [(NSDictionary *)iconicSceneScores objectForKey:v14];
  [v15 doubleValue];
  double v17 = v16;

  [v9 curationScore];
  objc_msgSend(v7, "setCurationScore:");
  [v9 overallAestheticScore];
  [v7 setAestheticScore:v18];
  [v12 promotionScore];
  objc_msgSend(v7, "setPromotionScore:");
  [v7 setIconicSceneScore:v17];
  v19 = [v9 uuid];
  if ([v19 isEqualToString:self->_tripKeyAssetUUID]) {
    [MEMORY[0x1E4FB1618] greenColor];
  }
  else {
  v20 = [MEMORY[0x1E4FB1618] redColor];
  }
  [v7 setColor:v20];

  v21 = [v12 localizedTitle];
  [v7 setTitle:v21];

  v22 = [v12 localizedSubtitle];
  [v7 setSubtitle:v22];

  return v7;
}

- (void)setTripHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_tripHighlight, a3);
  if ([(PUCurationTripKeyAssetBrowserDebugViewController *)self isViewLoaded])
  {
    [(PUCurationTripKeyAssetBrowserDebugViewController *)self _update];
  }
}

- (id)iconicSceneScores:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = NSNumber;
        v12 = objc_msgSend(v10, "iconicScoreProperties", (void)v16);
        [v12 iconicScore];
        v13 = objc_msgSend(v11, "numberWithDouble:");

        v14 = [v10 uuid];
        [v4 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_update
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (self->_tripHighlight)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v4 = [v3 librarySpecificFetchOptions];

    id v5 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:self->_tripHighlight referenceAsset:0];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 uuid];
    tripKeyAssetUUID = self->_tripKeyAssetUUID;
    self->_tripKeyAssetUUID = v7;

    v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v10 = [v9 librarySpecificFetchOptions];

    uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v32[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [v10 setSortDescriptors:v12];

    v13 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:self->_tripHighlight options:v10];
    childHighlights = self->_childHighlights;
    self->_childHighlights = v13;

    v15 = [MEMORY[0x1E4F8E7F8] requiredFetchPropertySets];
    [v4 setFetchPropertySets:v15];

    long long v16 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:self->_childHighlights options:v4];
    long long v17 = [v16 allValues];
    long long v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v31 = v18;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v20 = [v17 sortedArrayUsingDescriptors:v19];

    uint64_t v21 = [(PUCurationTripKeyAssetBrowserDebugViewController *)self iconicSceneScores:v20];
    iconicSceneScores = self->_iconicSceneScores;
    self->_iconicSceneScores = v21;

    v23 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v20 title:0];
    objc_super v24 = (void *)MEMORY[0x1E4F39008];
    v30 = v23;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    v26 = [v23 localizedTitle];
    v27 = [v24 transientCollectionListWithCollections:v25 title:v26];

    v28 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v27 options:0];
    [(PUPhotosAlbumViewController *)self setAssetCollection:v23 fetchResultContainingAssetCollection:v28 filterPredicate:0];
  }
  else
  {
    [(PUPhotosAlbumViewController *)self setAssetCollection:0 fetchResultContainingAssetCollection:0 filterPredicate:0];
  }
  v29 = [(PUCurationTripKeyAssetBrowserDebugViewController *)self collectionView];
  [v29 reloadData];
}

- (BOOL)updateSpec
{
  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationTripKeyAssetBrowserDebugViewController;
  [(PUPhotosAlbumViewController *)&v4 viewDidLoad];
  id v3 = [(PUCurationTripKeyAssetBrowserDebugViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  [(PUCurationTripKeyAssetBrowserDebugViewController *)self _update];
}

@end