@interface PXExistingMemoriesDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (PXExistingMemoriesDebugViewController)initWithName:(id)a3 options:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_photosDetailsContextForMemory:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchExistingMemories;
- (void)configureCell:(id)a3 withItem:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXExistingMemoriesDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itemsBySectionName, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
}

- (void)_fetchExistingMemories
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 librarySpecificFetchOptions];

  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v38[0] = v5;
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v38[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v4 setSortDescriptors:v7];

  v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];
  if ([v8 count])
  {
    v29 = self;
    v30 = v4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    v28 = v8;
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = 0;
      v13 = 0;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v17 = [[PXExistingMemoriesDebugCollectionItem alloc] initWithMemory:v16];
          v18 = [v16 creationDate];
          v19 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v18 dateStyle:1 timeStyle:0];
          v20 = v19;
          if (!v13 || ([v19 isEqualToString:v12] & 1) == 0)
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            id v22 = v20;
            [v9 addObject:v22];
            [(NSDictionary *)v32 setObject:v21 forKeyedSubscript:v22];
            v12 = v22;
            v13 = v21;
          }
          [v13 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    v23 = [v9 reverseObjectEnumerator];
    uint64_t v24 = [v23 allObjects];
    sectionNames = v29->_sectionNames;
    v29->_sectionNames = (NSArray *)v24;

    itemsBySectionName = v29->_itemsBySectionName;
    v29->_itemsBySectionName = v32;
    v27 = v32;

    v4 = v30;
    v8 = v28;
  }
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v14 = [v5 memory];
  [v6 setMemory:v14];
  v7 = [MEMORY[0x1E4FB1618] labelColor];
  v8 = [v6 textLabel];
  id v9 = [v5 name];
  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  [v8 setText:v10];
  [v8 setTextColor:v7];
  uint64_t v11 = [v6 detailTextLabel];
  v12 = [v5 description];
  [v11 setText:v12];

  [v11 setTextColor:v7];
  [v11 sizeToFit];
  v13 = [v5 memory];

  [v6 setAccessoryType:4 * (v13 != 0)];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"ExistingMemoriesDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = [[PXExistingMemoriesDebugViewCell alloc] initWithStyle:3 reuseIdentifier:@"ExistingMemoriesDebugTableViewCellIdentifier"];
    v8 = [(PXExistingMemoriesDebugViewCell *)v7 detailTextLabel];
    [v8 setNumberOfLines:2];

    id v9 = [(PXExistingMemoriesDebugViewCell *)v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  uint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v11 = [(NSDictionary *)self->_itemsBySectionName objectForKeyedSubscript:v10];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  [(PXExistingMemoriesDebugViewController *)self configureCell:v7 withItem:v13];
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(NSArray *)self->_sectionNames objectAtIndexedSubscript:a4];
  id v6 = [(NSDictionary *)self->_itemsBySectionName objectForKeyedSubscript:v5];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NSArray *)self->_sectionNames objectAtIndexedSubscript:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionNames count];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  sectionNames = self->_sectionNames;
  id v6 = a4;
  -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", [v6 section]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v7 = -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:");
  uint64_t v8 = [v6 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  uint64_t v10 = [v9 memory];
  if (v10)
  {
    id v11 = (id)[MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v10 referenceAsset:0];
    uint64_t v12 = [[PXDebugMemoriesViewController alloc] initWithMemory:v10 memoryInfo:0];
    v13 = [(PXExistingMemoriesDebugViewController *)self navigationController];
    objc_msgSend(v13, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v12, 1, 0, 0);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  sectionNames = self->_sectionNames;
  id v6 = a4;
  int64_t v7 = -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v8 = [(NSDictionary *)self->_itemsBySectionName objectForKeyedSubscript:v7];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndexedSubscript:v9];

  id v11 = [v10 description];
  uint64_t v12 = [v11 rangeOfString:@"\n"];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    double v13 = 44.0;
  }
  else {
    double v13 = 66.0;
  }

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  sectionNames = self->_sectionNames;
  id v6 = a4;
  -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", [v6 section]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v7 = -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:");
  uint64_t v8 = [v6 row];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];

  uint64_t v10 = [v9 memory];
  if (v10)
  {
    id v11 = [(PXExistingMemoriesDebugViewController *)self _photosDetailsContextForMemory:v10];
    uint64_t v12 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v11 options:0];
    double v13 = [(PXExistingMemoriesDebugViewController *)self navigationController];
    [v13 pushViewController:v12 animated:1];
  }
}

- (id)_photosDetailsContextForMemory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F39008];
  id v16 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v16 count:1];
  int64_t v7 = objc_msgSend(v3, "transientCollectionListWithCollections:title:", v6, 0, v16, v17);

  uint64_t v8 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v7 options:0];
  uint64_t v9 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v8 options:0];
  [(PXPhotosDataSourceConfiguration *)v9 setHideHiddenAssets:1];
  uint64_t v10 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v9];
  id v11 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v5 useVerboseSmartDescription:0];
  uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v5 referenceAsset:0];
  double v13 = [PXPhotosDetailsContext alloc];

  id v14 = [(PXPhotosDetailsContext *)v13 initWithPhotosDataSource:v10 displayTitleInfo:v11 parentContext:0 keyAssetsFetchResult:v12];
  return v14;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PXExistingMemoriesDebugViewController;
  [(PXExistingMemoriesDebugViewController *)&v7 viewDidLoad];
  v3 = [(PXExistingMemoriesDebugViewController *)self navigationItem];
  v4 = v3;
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"Existing Memories";
  }
  [v3 setTitle:name];

  id v6 = [(PXExistingMemoriesDebugViewController *)self tableView];
  [v6 setEstimatedRowHeight:44.0];

  [(PXExistingMemoriesDebugViewController *)self _fetchExistingMemories];
}

- (PXExistingMemoriesDebugViewController)initWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXExistingMemoriesDebugViewController;
  uint64_t v9 = [(PXExistingMemoriesDebugViewController *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

@end