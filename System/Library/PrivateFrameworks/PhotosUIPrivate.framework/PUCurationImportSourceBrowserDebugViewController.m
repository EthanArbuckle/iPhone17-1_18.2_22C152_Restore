@interface PUCurationImportSourceBrowserDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchImportSources;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationImportSourceBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_assetsByImportSource, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"ImportSourceBrowserDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = [[PUCurationImportSourceBrowserDebugViewCell alloc] initWithStyle:3 reuseIdentifier:@"ImportSourceBrowserDebugTableViewCellIdentifier"];
    v8 = [(PUCurationImportSourceBrowserDebugViewCell *)v7 detailTextLabel];
    [v8 setNumberOfLines:1];

    v9 = [(PUCurationImportSourceBrowserDebugViewCell *)v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "item"));
  v11 = [(NSMutableDictionary *)self->_assetsByImportSource objectForKeyedSubscript:v10];
  [v10 integerValue];
  v12 = PHAssetImportSourceDescription();
  v13 = [NSString stringWithFormat:@"%@ (%lu)", v12, objc_msgSend(v11, "count")];
  [(PUCurationImportSourceBrowserDebugViewCell *)v7 setImportSourceName:v12];
  v14 = [(PUCurationImportSourceBrowserDebugViewCell *)v7 textLabel];
  [v14 setText:v13];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 10;
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
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a4, "item", a3));
  id v6 = [(NSMutableDictionary *)self->_assetsByImportSource objectForKeyedSubscript:v5];
  [v5 integerValue];
  v7 = PHAssetImportSourceDescription();
  v8 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v6 title:v7];
  v9 = (void *)MEMORY[0x1E4F39008];
  v15[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v11 = [v8 localizedTitle];
  v12 = [v9 transientCollectionListWithCollections:v10 title:v11];

  v13 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v12 options:0];
  [(PUPhotosAlbumViewController *)self->_assetCollectionViewController setAssetCollection:v8 fetchResultContainingAssetCollection:v13 filterPredicate:0];
  [(PUCurationImportSourceAssetBrowserDebugViewController *)self->_assetCollectionViewController setImportSourceName:v7];
  v14 = [(PUCurationImportSourceBrowserDebugViewController *)self navigationController];
  [v14 pushViewController:self->_assetCollectionViewController animated:1];
}

- (void)_fetchImportSources
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  assetsByImportSource = self->_assetsByImportSource;
  self->_assetsByImportSource = v3;

  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = [v5 librarySpecificFetchOptions];

  v41[0] = *MEMORY[0x1E4F394B8];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v6 setFetchPropertySets:v7];

  [v6 setChunkSizeForFetch:500];
  v27 = v6;
  v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  context = (void *)MEMORY[0x1B3E7C430]();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1B3E7C430](v9);
        v15 = objc_msgSend(v13, "importProperties", context);
        v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "importedBy"));
        id v17 = [(NSMutableDictionary *)self->_assetsByImportSource objectForKeyedSubscript:v16];
        if (!v17)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(NSMutableDictionary *)self->_assetsByImportSource setObject:v17 forKeyedSubscript:v16];
        }
        [v17 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v39[0] = v18;
  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v39[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v21 = [(NSMutableDictionary *)self->_assetsByImportSource objectEnumerator];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v25++), "sortUsingDescriptors:", v20, context);
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PUCurationImportSourceBrowserDebugViewController__fetchImportSources__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__PUCurationImportSourceBrowserDebugViewController__fetchImportSources__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PUCurationImportSourceBrowserDebugViewController;
  [(PUCurationImportSourceBrowserDebugViewController *)&v8 viewDidLoad];
  v3 = [(PUCurationImportSourceBrowserDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUCurationImportSourceAssetBrowserDebugViewController alloc];
  v5 = objc_opt_new();
  id v6 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  [(PUCurationImportSourceBrowserDebugViewController *)self _fetchImportSources];
}

@end