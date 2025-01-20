@interface PXPersonsSectionedDataSourceManager
- (PHPhotoLibrary)photoLibrary;
- (PXPersonsSectionedDataSourceManager)initWithPhotoLibrary:(id)a3;
- (PXPhotoLibraryLocalDefaults)localDefaults;
- (id)createInitialDataSource;
- (int64_t)_personTypeForSection:(int64_t)a3;
- (unint64_t)peopleHomeSortingType;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)reloadData;
- (void)setPeopleHomeSortingType:(unint64_t)a3;
@end

@implementation PXPersonsSectionedDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPeopleHomeSortingType:(unint64_t)a3
{
  self->_peopleHomeSortingType = a3;
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (void)reloadData
{
  localDefaults = self->_localDefaults;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](self, "peopleHomeSortingType"));
  [(PXPhotoLibraryLocalDefaults *)localDefaults setNumber:v4 forKey:@"PXPeopleHomeSortingType"];

  id v10 = [(PXPersonsSectionedDataSourceManager *)self photoLibrary];
  v5 = peopleHomeFetchResults(v10);
  v6 = [PXPersonsSectionedDataSource alloc];
  v7 = [(PXSectionedDataSourceManager *)self dataSource];
  v8 = [v7 faceTiles];
  v9 = [(PXPersonsSectionedDataSource *)v6 initWithPhotoLibrary:v10 personsSections:v5 faceTiles:v8 peopleHomeSortingType:[(PXPersonsSectionedDataSourceManager *)self peopleHomeSortingType]];

  [(PXSectionedDataSourceManager *)self setDataSource:v9 changeDetails:0];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47 = self;
  v49 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v5 = [v49 numberOfSections];
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v46 = v5;
  if (v5 < 1)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = 0;
    uint64_t v8 = 0;
    int64x2_t v9 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    int64x2_t v45 = v9;
    v9.i64[0] = 134217984;
    int64x2_t v43 = v9;
    do
    {
      v59[0] = objc_msgSend(v49, "identifier", *(_OWORD *)&v43);
      v59[1] = v8;
      int64x2_t v60 = v45;
      id v10 = [v49 objectsInIndexPath:v59];
      unint64_t v11 = [(PXPersonsSectionedDataSourceManager *)v47 _personTypeForSection:v8];
      if (v11 >= 2) {
        PXAssertGetLog();
      }
      v12 = [v10 photoLibrary];
      v13 = peopleHomeFetchResultForType(v11, v12);

      v14 = [v4 changeDetailsForFetchResult:v10];
      v15 = [v14 changedObjects];

      uint64_t v16 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v10 toFetchResult:v13 changedObjects:v15];
      v17 = (void *)v16;
      if (v16)
      {
        v50 = (void *)v16;
        v51 = v15;
        v52 = v13;
        v53 = v10;
        uint64_t v54 = v8;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v18 = v10;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v56 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v24 = [v23 objectID];
              if ([v4 keyFaceChangedForPersonOID:v24])
              {
                v25 = +[PXPeopleFaceCropManager sharedManager];
                [v25 invalidateCacheForPerson:v23];

                v26 = [v23 localIdentifier];
                [v6 addObject:v26];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v61 count:16];
          }
          while (v20);
        }

        v17 = v50;
        v27 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v50];
        uint64_t v8 = v54;
        v28 = [NSNumber numberWithInteger:v54];
        [v44 setObject:v27 forKeyedSubscript:v28];

        v29 = [v50 fetchResultAfterChanges];
        [v48 addObject:v29];

        char v7 = 1;
        v13 = v52;
        id v10 = v53;
        v15 = v51;
      }
      else
      {
        [v48 addObject:v10];
      }

      ++v8;
    }
    while (v8 != v46);
  }
  v30 = [v49 faceTiles];
  if ([v6 count])
  {
    v31 = (void *)[v30 mutableCopy];
    [v31 removeObjectsForKeys:v6];
    uint64_t v32 = [v31 copy];

    v30 = (void *)v32;
  }
  if (v7)
  {
    localDefaults = v47->_localDefaults;
    v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](v47, "peopleHomeSortingType"));
    [(PXPhotoLibraryLocalDefaults *)localDefaults setNumber:v34 forKey:@"PXPeopleHomeSortingType"];

    v35 = [PXPersonsSectionedDataSource alloc];
    v36 = [(PXPersonsSectionedDataSourceManager *)v47 photoLibrary];
    v37 = [(PXPersonsSectionedDataSource *)v35 initWithPhotoLibrary:v36 personsSections:v48 faceTiles:v30 peopleHomeSortingType:[(PXPersonsSectionedDataSourceManager *)v47 peopleHomeSortingType]];

    id v38 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v39 = [v49 identifier];
    uint64_t v40 = [(PXPersonsSectionedDataSource *)v37 identifier];
    v41 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v42 = (void *)[v38 initWithFromDataSourceIdentifier:v39 toDataSourceIdentifier:v40 sectionChanges:v41 itemChangeDetailsBySection:v44 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)v47 setDataSource:v37 changeDetails:v42];
  }
}

- (int64_t)_personTypeForSection:(int64_t)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  if (a3 != 1) {
    PXAssertGetLog();
  }
  return 0;
}

- (id)createInitialDataSource
{
  v3 = [(PXPersonsSectionedDataSourceManager *)self photoLibrary];
  objc_msgSend(v3, "px_registerChangeObserver:", self);
  peopleHomeFetchResults(v3);
  objc_claimAutoreleasedReturnValue();
  PXFlatMap();
}

uint64_t __62__PXPersonsSectionedDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  return [a2 fetchedObjects];
}

- (PXPersonsSectionedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPersonsSectionedDataSourceManager;
  id v6 = [(PXSectionedDataSourceManager *)&v12 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = [(PXPersonsSectionedDataSourceManager *)v7 photoLibrary];
    uint64_t v9 = objc_msgSend(v8, "px_localDefaults");
    localDefaults = v7->_localDefaults;
    v7->_localDefaults = (PXPhotoLibraryLocalDefaults *)v9;
  }
  return v7;
}

@end