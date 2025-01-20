@interface _PXPhotosViewPlacesMomentsDataSourceProvider
- (_PXPhotosViewPlacesMomentsDataSourceProvider)initWithAllowedAssets:(id)a3 photoLibrary:(id)a4;
- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3;
- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3;
@end

@implementation _PXPhotosViewPlacesMomentsDataSourceProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v6 = self->_assets;
  uint64_t v7 = [(NSFastEnumeration *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v31 + 1) + 8 * i) objectID];
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSFastEnumeration *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v13 = [v4 photoLibrary];
  v14 = [v13 librarySpecificFetchOptions];

  [v14 setIncludePlacesSmartAlbum:1];
  v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000203 options:v14];
  v16 = [v15 firstObject];

  v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"representativeDate" ascending:1];
  v36 = v28;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  [v14 setInternalSortDescriptors:v17];

  v18 = [MEMORY[0x1E4F38FF8] fetchMomentsForAssetsWithOIDs:v5 options:v14];
  v19 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v18 containerCollection:v16 options:4097];
  v29 = (void *)v12;
  [(PXPhotosDataSourceConfiguration *)v19 setAllowedOIDs:v12];
  v30 = v4;
  v20 = [v4 filterPredicate];
  [(PXPhotosDataSourceConfiguration *)v19 setFilterPredicate:v20];

  v21 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v19];
  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v35[0] = v22;
  v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v35[1] = v23;
  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v35[2] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  [(PXPhotosDataSource *)v21 setSortDescriptors:v25];

  if ([(PXPhotosDataSource *)v21 numberOfSections] >= 1)
  {
    if ([v16 keyAssetsAtEnd]) {
      uint64_t v26 = [(PXPhotosDataSource *)v21 numberOfSections] - 1;
    }
    else {
      uint64_t v26 = 0;
    }
    [(PXPhotosDataSource *)v21 forceAccurateSection:v26 andSectionsBeforeAndAfter:10];
  }

  return v21;
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  id v4 = a3;
  id v5 = [PXPhotosDataSourceConfiguration alloc];
  v6 = [MEMORY[0x1E4F39150] emptyFetchResultWithPhotoLibrary:self->_photoLibrary];
  uint64_t v7 = [(PXPhotosDataSourceConfiguration *)v5 initWithAssetFetchResult:v6 options:0];

  uint64_t v8 = [v4 filterPredicate];

  [(PXPhotosDataSourceConfiguration *)v7 setFilterPredicate:v8];
  uint64_t v9 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v7];

  return v9;
}

- (_PXPhotosViewPlacesMomentsDataSourceProvider)initWithAllowedAssets:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosViewPlacesMomentsDataSourceProvider;
  uint64_t v9 = [(_PXPhotosViewPlacesMomentsDataSourceProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
  }

  return v10;
}

@end