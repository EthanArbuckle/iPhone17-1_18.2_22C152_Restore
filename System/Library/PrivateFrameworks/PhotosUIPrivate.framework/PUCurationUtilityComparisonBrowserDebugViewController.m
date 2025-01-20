@interface PUCurationUtilityComparisonBrowserDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchUtilityAssetInformation;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationUtilityComparisonBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_isUtilityForMemoriesButNotUtility, 0);
  objc_storeStrong((id *)&self->_isUtilityAndWas, 0);
  objc_storeStrong((id *)&self->_wasUtilityButIsnt, 0);
  objc_storeStrong((id *)&self->_isUtilityButWasnt, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"JunkClassificationBrowserDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"JunkClassificationBrowserDebugTableViewCellIdentifier"];
    v8 = [v7 detailTextLabel];
    [v8 setNumberOfLines:1];

    v9 = [v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  unint64_t v10 = [v6 item];
  if (v10 > 3)
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", off_1E5F2D100[v10], objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1E5F2D0E0[v10]), "count"));
  }
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
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
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 item])
  {
    if ([v5 item] == 1)
    {
      id v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__wasUtilityButIsnt;
    }
    else
    {
      uint64_t v7 = [v5 item];
      id v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityForMemoriesButNotUtility;
      if (v7 == 2) {
        id v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityAndWas;
      }
    }
  }
  else
  {
    id v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityButWasnt;
  }
  v8 = (void *)MEMORY[0x1E4F39228];
  id v9 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
  unint64_t v10 = objc_msgSend(v8, "px_deprecated_appPhotoLibrary");
  v11 = [v10 librarySpecificFetchOptions];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v25[0] = v12;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v25[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v11 setSortDescriptors:v14];

  v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v9 options:v11];
  v16 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v15 title:&stru_1F06BE7B8];
  v17 = (void *)MEMORY[0x1E4F39008];
  v24 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v19 = [v16 localizedTitle];
  v20 = [v17 transientCollectionListWithCollections:v18 title:v19];

  v21 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v20 options:0];
  [(PUPhotosAlbumViewController *)self->_assetCollectionViewController setAssetCollection:v16 fetchResultContainingAssetCollection:v21 filterPredicate:0];
  v22 = [(PUPhotosAlbumViewController *)self->_assetCollectionViewController collectionView];
  [v22 reloadData];

  v23 = [(PUCurationUtilityComparisonBrowserDebugViewController *)self navigationController];
  [v23 pushViewController:self->_assetCollectionViewController animated:1];
}

- (void)_fetchUtilityAssetInformation
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 photoAnalysisClient];
  id v17 = 0;
  id v5 = [v4 requestUtilityAssetInformationWithError:&v17];
  id v6 = v17;

  uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  isUtilityButWasnt = self->_isUtilityButWasnt;
  self->_isUtilityButWasnt = v7;

  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  wasUtilityButIsnt = self->_wasUtilityButIsnt;
  self->_wasUtilityButIsnt = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  isUtilityAndWas = self->_isUtilityAndWas;
  self->_isUtilityAndWas = v11;

  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  isUtilityForMemoriesButNotUtility = self->_isUtilityForMemoriesButNotUtility;
  self->_isUtilityForMemoriesButNotUtility = v13;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PUCurationUtilityComparisonBrowserDebugViewController__fetchUtilityAssetInformation__block_invoke;
  v16[3] = &unk_1E5F2D0C0;
  v16[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v16];
  v15 = [(PUCurationUtilityComparisonBrowserDebugViewController *)self tableView];
  [v15 reloadData];
}

void __86__PUCurationUtilityComparisonBrowserDebugViewController__fetchUtilityAssetInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  char v5 = [a3 integerValue];
  uint64_t v6 = v5 & 3;
  if (v6 == 1)
  {
    id v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityButWasnt;
    goto LABEL_9;
  }
  if (v6 == 3)
  {
    id v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityAndWas;
    goto LABEL_9;
  }
  char v7 = v5;
  v8 = v10;
  if (v6 == 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1032) addObject:v10];
    v8 = v10;
  }
  if ((v7 & 5) == 4)
  {
    id v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityForMemoriesButNotUtility;
LABEL_9:
    [*(id *)(*(void *)(a1 + 32) + *v9) addObject:v10];
    v8 = v10;
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUCurationUtilityComparisonBrowserDebugViewController;
  [(PUCurationUtilityComparisonBrowserDebugViewController *)&v9 viewDidLoad];
  v3 = [(PUCurationUtilityComparisonBrowserDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUPhotosAlbumViewController alloc];
  char v5 = objc_opt_new();
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  char v7 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5 photoLibrary:v6];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v7;

  [(PUCurationUtilityComparisonBrowserDebugViewController *)self _fetchUtilityAssetInformation];
}

@end