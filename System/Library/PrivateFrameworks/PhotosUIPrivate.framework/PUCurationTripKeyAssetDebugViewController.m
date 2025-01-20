@interface PUCurationTripKeyAssetDebugViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)updateSpec;
- (PUCurationTripKeyAssetDebugViewController)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_fetchHighlights;
- (void)viewDidLoad;
@end

@implementation PUCurationTripKeyAssetDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripHighlights, 0);
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  id v6 = a4;
  v7 = [(PUPhotosGridViewController *)&v14 collectionView:a3 cellForItemAtIndexPath:v6];
  tripHighlights = self->_tripHighlights;
  uint64_t v9 = objc_msgSend(v6, "item", v14.receiver, v14.super_class);

  v10 = [(PHFetchResult *)tripHighlights objectAtIndexedSubscript:v9];
  v11 = [v10 localizedTitle];
  [v7 setTitle:v11];

  v12 = [v10 localizedSubtitle];
  [v7 setSubtitle:v12];

  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  assetCollectionViewController = self->_assetCollectionViewController;
  id v6 = -[PHFetchResult objectAtIndexedSubscript:](self->_tripHighlights, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  [(PUCurationTripKeyAssetBrowserDebugViewController *)assetCollectionViewController setTripHighlight:v6];

  v7 = [(PUCurationTripKeyAssetDebugViewController *)self navigationController];
  [v7 pushViewController:self->_assetCollectionViewController animated:1];

  return 0;
}

- (void)_fetchHighlights
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 librarySpecificFetchOptions];

  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d OR type == %d", 1, 2);
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v26[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v4 setSortDescriptors:v7];

  v8 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v4];
  tripHighlights = self->_tripHighlights;
  self->_tripHighlights = v8;

  v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v11 = [v10 librarySpecificFetchOptions];

  v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:self->_tripHighlights options:v11];
  v13 = [v12 allValues];
  objc_super v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v25 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v16 = [v13 sortedArrayUsingDescriptors:v15];

  v17 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v16 title:0];
  v18 = (void *)MEMORY[0x1E4F39008];
  v24 = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v20 = [v17 localizedTitle];
  v21 = [v18 transientCollectionListWithCollections:v19 title:v20];

  v22 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v21 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v17 fetchResultContainingAssetCollection:v22 filterPredicate:0];
  v23 = [(PUCurationTripKeyAssetDebugViewController *)self collectionView];
  [v23 reloadData];
}

- (BOOL)updateSpec
{
  return 0;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  [(PUPhotosAlbumViewController *)&v10 viewDidLoad];
  v3 = [(PUCurationTripKeyAssetDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUCurationTripKeyAssetBrowserDebugViewController alloc];
  v5 = objc_opt_new();
  id v6 = [(PUPhotosGridViewController *)self photoLibrary];
  v7 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5 photoLibrary:v6];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v7;

  uint64_t v9 = [(PUCurationTripKeyAssetDebugViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  [(PUCurationTripKeyAssetDebugViewController *)self _fetchHighlights];
}

- (PUCurationTripKeyAssetDebugViewController)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [(PUCurationTripKeyAssetDebugViewController *)self px_extendedTraitCollection];
  [v4 userInterfaceIdiom];
  v5 = (objc_class *)objc_opt_class();

  id v6 = objc_alloc_init(v5);
  v9.receiver = self;
  v9.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  v7 = [(PUPhotosAlbumViewController *)&v9 initWithSpec:v6 photoLibrary:v3];

  return v7;
}

@end