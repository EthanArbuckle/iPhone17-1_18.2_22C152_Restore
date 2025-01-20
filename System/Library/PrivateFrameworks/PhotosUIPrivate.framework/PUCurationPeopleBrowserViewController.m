@interface PUCurationPeopleBrowserViewController
- (NSMutableDictionary)facesByPersonLocalIdentifier;
- (PNScoreConfiguration)scoreConfiguration;
- (PUCurationAssetBrowserViewController)assetBrowserViewController;
- (PUCurationPeopleBrowserViewController)initWithScoreConfiguration:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAssetBrowserViewController:(id)a3;
- (void)setFacesByPersonLocalIdentifier:(id)a3;
- (void)setScoreConfiguration:(id)a3;
@end

@implementation PUCurationPeopleBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
}

- (void)setFacesByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)facesByPersonLocalIdentifier
{
  return self->_facesByPersonLocalIdentifier;
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  uint64_t v7 = [v5 row];

  id v15 = [v6 personAtIndex:v7];

  v8 = [(PUCurationPeopleBrowserViewController *)self facesByPersonLocalIdentifier];
  v9 = [v15 localIdentifier];
  v10 = [v8 objectForKeyedSubscript:v9];

  v11 = [(PUCurationPeopleBrowserViewController *)self assetBrowserViewController];
  v12 = [(PUCurationPeopleBrowserViewController *)self scoreConfiguration];
  [v11 setScoreConfiguration:v12 withFaces:v10];

  v13 = [(PUCurationPeopleBrowserViewController *)self navigationController];
  v14 = [(PUCurationPeopleBrowserViewController *)self assetBrowserViewController];
  [v13 pushViewController:v14 animated:1];
}

- (PUCurationPeopleBrowserViewController)initWithScoreConfiguration:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PUCurationPeopleBrowserViewController_initWithScoreConfiguration___block_invoke;
  aBlock[3] = &unk_1E5F2BC78;
  v6 = self;
  v21 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  v19.receiver = v6;
  v19.super_class = (Class)PUCurationPeopleBrowserViewController;
  v8 = [(PXPeopleDetailSettingsViewController *)&v19 initWithDataSourceReloadBlock:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scoreConfiguration, a3);
    v10 = [v5 name];
    [(PUCurationPeopleBrowserViewController *)v9 setTitle:v10];

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    facesByPersonLocalIdentifier = v9->_facesByPersonLocalIdentifier;
    v9->_facesByPersonLocalIdentifier = v11;

    v13 = [(PUCurationPeopleBrowserViewController *)v9 px_extendedTraitCollection];
    [v13 userInterfaceIdiom];
    objc_opt_class();

    v14 = [PUCurationAssetBrowserViewController alloc];
    id v15 = objc_opt_new();
    uint64_t v16 = [(PUPhotosAlbumViewController *)v14 initWithSpec:v15];
    assetBrowserViewController = v9->_assetBrowserViewController;
    v9->_assetBrowserViewController = (PUCurationAssetBrowserViewController *)v16;
  }
  return v9;
}

id __68__PUCurationPeopleBrowserViewController_initWithScoreConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v20 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  uint64_t v16 = [v20 librarySpecificFetchOptions];
  v1 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchPersonsWithOptions:");
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1B3E7C430]();
        v8 = [v20 librarySpecificFetchOptions];
        v9 = [MEMORY[0x1E4F39050] fetchFacesForPerson:v6 options:v8];
        if ([v9 count])
        {
          v10 = [v9 fetchedObjects];
          v11 = [*(id *)(a1 + 32) facesByPersonLocalIdentifier];
          v12 = [v6 localIdentifier];
          [v11 setObject:v10 forKeyedSubscript:v12];

          [v19 addObject:v6];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F39150]);
  v14 = (void *)[v13 initWithObjects:v19 photoLibrary:v20 fetchType:*MEMORY[0x1E4F39670] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v14;
}

@end