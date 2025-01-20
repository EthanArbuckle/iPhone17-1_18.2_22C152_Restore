@interface PUAudioClassificationBrowserDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchAudioClassifications;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUAudioClassificationBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_assetsByAudioClassificationName, 0);
  objc_storeStrong((id *)&self->_audioClassificationNames, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"AudioClassificationBrowserDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = [[PUAudioClassificationBrowserDebugViewCell alloc] initWithStyle:3 reuseIdentifier:@"AudioClassificationBrowserDebugTableViewCellIdentifier"];
    v8 = [(PUAudioClassificationBrowserDebugViewCell *)v7 detailTextLabel];
    [v8 setNumberOfLines:1];

    v9 = [(PUAudioClassificationBrowserDebugViewCell *)v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  v10 = -[NSArray objectAtIndexedSubscript:](self->_audioClassificationNames, "objectAtIndexedSubscript:", [v6 item]);
  v11 = [(NSMutableDictionary *)self->_assetsByAudioClassificationName objectForKeyedSubscript:v10];
  v12 = [NSString stringWithFormat:@"%@ (%lu)", v10, objc_msgSend(v11, "count")];
  [(PUAudioClassificationBrowserDebugViewCell *)v7 setAudioClassificationName:v10];
  v13 = [(PUAudioClassificationBrowserDebugViewCell *)v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_audioClassificationNames count];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = -[NSArray objectAtIndexedSubscript:](self->_audioClassificationNames, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  id v6 = [(NSMutableDictionary *)self->_assetsByAudioClassificationName objectForKeyedSubscript:v5];
  v7 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v6 title:v5];
  v8 = (void *)MEMORY[0x1E4F39008];
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v10 = [v7 localizedTitle];
  v11 = [v8 transientCollectionListWithCollections:v9 title:v10];

  v12 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v11 options:0];
  [(PUPhotosAlbumViewController *)self->_assetCollectionViewController setAssetCollection:v7 fetchResultContainingAssetCollection:v12 filterPredicate:0];
  [(PUAudioClassificationAssetBrowserDebugViewController *)self->_assetCollectionViewController setAudioClassificationName:v5];
  v13 = [(PUAudioClassificationBrowserDebugViewController *)self navigationController];
  [v13 pushViewController:self->_assetCollectionViewController animated:1];
}

- (void)_fetchAudioClassifications
{
  v59[1] = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  assetsByAudioClassificationName = self->_assetsByAudioClassificationName;
  v41 = self;
  self->_assetsByAudioClassificationName = v3;

  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = [v5 librarySpecificFetchOptions];

  v59[0] = *MEMORY[0x1E4F394E0];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  [v6 setFetchPropertySets:v7];

  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtypes & %d) != 0", 8);
  [v6 setPredicate:v8];

  [v6 setChunkSizeForFetch:500];
  v36 = v6;
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  context = (void *)MEMORY[0x1B3E7C430]();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v10 = v9;
  uint64_t v39 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v39)
  {
    uint64_t v11 = *(void *)v52;
    uint64_t v37 = *(void *)v52;
    id v38 = v10;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v10);
        }
        v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1B3E7C430]();
        v15 = [v13 mediaAnalysisProperties];
        v16 = [v15 mediaAnalysisTimeStamp];

        if (!v16)
        {
          v26 = @"Unanalyzed";
LABEL_24:
          v19 = [(NSMutableDictionary *)v41->_assetsByAudioClassificationName objectForKeyedSubscript:v26];
          if (!v19)
          {
            v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [(NSMutableDictionary *)v41->_assetsByAudioClassificationName setObject:v19 forKeyedSubscript:v26];
          }
          [(NSArray *)v19 addObject:v13];
          goto LABEL_27;
        }
        v40 = v14;
        int v17 = [v15 audioClassification];
        if (!v17)
        {
          v26 = @"No Audio Classification";
          goto LABEL_24;
        }
        LOWORD(v18) = v17;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v19 = v41->_audioClassificationNames;
        uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v48;
LABEL_10:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v19);
            }
            if (v18)
            {
              uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * v23);
              id v25 = [(NSMutableDictionary *)v41->_assetsByAudioClassificationName objectForKeyedSubscript:v24];
              if (!v25)
              {
                id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [(NSMutableDictionary *)v41->_assetsByAudioClassificationName setObject:v25 forKeyedSubscript:v24];
              }
              [v25 addObject:v13];
            }
            if ((unsigned __int16)v18 < 2u) {
              break;
            }
            int v18 = (__int16)v18 >> 1;
            if (v21 == ++v23)
            {
              uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v47 objects:v57 count:16];
              if (v21) {
                goto LABEL_10;
              }
              break;
            }
          }
          uint64_t v11 = v37;
          id v10 = v38;
        }
        v14 = v40;
LABEL_27:
      }
      uint64_t v39 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v39);
  }

  v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v56[0] = v27;
  v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v56[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v30 = [(NSMutableDictionary *)v41->_assetsByAudioClassificationName objectEnumerator];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * j) sortUsingDescriptors:v29];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v32);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUAudioClassificationBrowserDebugViewController__fetchAudioClassifications__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = v41;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PUAudioClassificationBrowserDebugViewController__fetchAudioClassifications__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUAudioClassificationBrowserDebugViewController;
  [(PUAudioClassificationBrowserDebugViewController *)&v9 viewDidLoad];
  v3 = [(PUAudioClassificationBrowserDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUAudioClassificationAssetBrowserDebugViewController alloc];
  v5 = objc_opt_new();
  id v6 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  audioClassificationNames = self->_audioClassificationNames;
  self->_audioClassificationNames = (NSArray *)&unk_1F078B4E0;

  [(PUAudioClassificationBrowserDebugViewController *)self _fetchAudioClassifications];
}

@end