@interface PXWallpaperSmartAlbumPeoplePickerDataSource
- (id)peopleSuggestionSubtypes;
- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3;
@end

@implementation PXWallpaperSmartAlbumPeoplePickerDataSource

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F8E858];
  v6 = [(PXPassiveContentPeoplePickerDataSourceBase *)self photoLibrary];
  uint64_t v7 = [v5 fetchPersonLocalIdentifiersForSuggestionSubtype:602 photoLibrary:v6];

  v35 = (void *)v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
  [v8 minusSet:v4];
  v9 = PLWallpaperGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] TopPeople local identifiers: %{public}@", buf, 0xCu);
  }

  v10 = (void *)MEMORY[0x1E4F8E858];
  v11 = [(PXPassiveContentPeoplePickerDataSourceBase *)self photoLibrary];
  uint64_t v12 = [v10 fetchPersonLocalIdentifiersForSuggestionSubtype:652 photoLibrary:v11];

  v34 = (void *)v12;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v12];
  v36 = v4;
  [v13 minusSet:v4];
  v14 = PLWallpaperGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v13;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] Shuffle People local identifiers: %{public}@", buf, 0xCu);
  }

  v15 = [(PXPassiveContentPeoplePickerDataSourceBase *)self photoLibrary];
  v16 = [v15 librarySpecificFetchOptions];

  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
  v37[0] = v17;
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v37[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v16 setSortDescriptors:v19];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
  [v20 intersectSet:v13];
  v21 = (void *)MEMORY[0x1E4F391F0];
  v22 = [v20 allObjects];
  v23 = [v21 fetchPersonsWithLocalIdentifiers:v22 options:v16];

  [(PXPassiveContentPeoplePickerDataSourceBase *)self setVipPersonsFetchResult:v23];
  v24 = [v23 fetchedObjects];
  v25 = (void *)[v24 copy];
  [(PXPassiveContentPeoplePickerDataSourceBase *)self setVipPersons:v25];

  v26 = PLWallpaperGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v20;
    _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] VIP: %{public}@", buf, 0xCu);
  }

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v13];
  [v27 minusSet:v20];
  v28 = (void *)MEMORY[0x1E4F391F0];
  v29 = [v27 allObjects];
  v30 = [v28 fetchPersonsWithLocalIdentifiers:v29 options:v16];

  [(PXPassiveContentPeoplePickerDataSourceBase *)self setNonVIPPersonsFetchResult:v30];
  v31 = [v30 fetchedObjects];
  v32 = (void *)[v31 copy];
  [(PXPassiveContentPeoplePickerDataSourceBase *)self setNonVIPPersons:v32];

  v33 = PLWallpaperGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v27;
    _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] non-VIP: %{public}@", buf, 0xCu);
  }
}

- (id)peopleSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D43F0];
}

@end