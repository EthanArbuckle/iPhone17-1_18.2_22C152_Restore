@interface PXSuggestionsDataSourceManager
+ (NSPredicate)baseFetchPredicate;
+ (id)mostRecentCreationDateForPXSuggestionDataSourceType:(unsigned __int16)a3;
+ (id)typePredicateForDataSourceType:(unsigned __int16)a3;
- (PHFetchResult)fetchResult;
- (PXLibraryFilterState)libraryFilterState;
- (PXSuggestionsDataSourceManager)init;
- (PXSuggestionsDataSourceManager)initWithDataSourceType:(unsigned __int16)a3 libraryFilterState:(id)a4;
- (PXSuggestionsDataSourceManager)initWithLibraryFilterState:(id)a3 fetchResultProvider:(id)a4;
- (id)_createNewDataSourceWithFetchResult:(id)a3;
- (id)createInitialDataSource;
- (id)fetchResultProvider;
- (unsigned)dataSourceType;
- (void)_handleChangeWithDetails:(id)a3;
- (void)_resetDataSource;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
@end

@implementation PXSuggestionsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResultProvider, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
}

- (id)fetchResultProvider
{
  return self->_fetchResultProvider;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (unsigned)dataSourceType
{
  return self->_dataSourceType;
}

- (void)_handleChangeWithDetails:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [PXSuggestionsDataSource alloc];
  v6 = [v4 fetchResultAfterChanges];
  v7 = [(PXSuggestionsDataSource *)v5 initWithSuggestionsFetchResult:v6];

  if ([v4 hasIncrementalChanges])
  {
    v8 = [(PXSectionedDataSourceManager *)self dataSource];
    v9 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v4];
    id v10 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v11 = [v8 identifier];
    uint64_t v12 = [(PXSuggestionsDataSource *)v7 identifier];
    v13 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v16 = &unk_1F02D6208;
    v17[0] = v9;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v15 = (void *)[v10 initWithFromDataSourceIdentifier:v11 toDataSourceIdentifier:v12 sectionChanges:v13 itemChangeDetailsBySection:v14 subitemChangeDetailsByItemBySection:0];
  }
  else
  {
    v15 = 0;
  }
  [(PXSectionedDataSourceManager *)self setDataSource:v7 changeDetails:v15];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXConfigurationObservationContext == a5)
  {
    if ((v6 & 0x10) != 0)
    {
LABEL_4:
      id v11 = v9;
      [(PXSuggestionsDataSourceManager *)self _resetDataSource];
      id v9 = v11;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_34467 != a5)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXSuggestionsDataSourceManager.m" lineNumber:217 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (v6) {
      goto LABEL_4;
    }
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v7 = a3;
  id v4 = [(PXSectionedDataSourceManager *)self dataSource];
  v5 = [v4 suggestions];
  if (v5)
  {
    char v6 = [v7 changeDetailsForFetchResult:v5];
    if (v6) {
      [(PXSuggestionsDataSourceManager *)self _handleChangeWithDetails:v6];
    }
  }
}

- (id)createInitialDataSource
{
  return +[PXSectionedDataSource emptyDataSource];
}

- (void)_resetDataSource
{
  id v7 = [(PXSuggestionsDataSourceManager *)self fetchResultProvider];
  v3 = [(PXSuggestionsDataSourceManager *)self libraryFilterState];
  if (v7 && v3)
  {
    v7[2](v7, [v3 sharingFilter]);
    id v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    fetchResult = self->_fetchResult;
    self->_fetchResult = v4;

    char v6 = [(PXSuggestionsDataSourceManager *)self _createNewDataSourceWithFetchResult:self->_fetchResult];
    [(PXSectionedDataSourceManager *)self setDataSource:v6 changeDetails:0];
  }
}

- (id)_createNewDataSourceWithFetchResult:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v8 = [v7 librarySpecificFetchOptions];

    id v9 = [(id)objc_opt_class() baseFetchPredicate];
    id v10 = objc_msgSend((id)objc_opt_class(), "typePredicateForDataSourceType:", -[PXSuggestionsDataSourceManager dataSourceType](self, "dataSourceType"));
    id v11 = [(PXSuggestionsDataSourceManager *)self libraryFilterState];
    uint64_t v12 = [v11 viewMode];
    if (v12 == 2) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2 * (v12 != 1);
    }
    [v8 setSharingFilter:v13];

    v14 = (void *)MEMORY[0x1E4F28BA0];
    v23[0] = v9;
    v23[1] = v10;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v16 = [v14 andPredicateWithSubpredicates:v15];

    [v8 setPredicate:v16];
    v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v22[0] = v17;
    v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v22[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v8 setSortDescriptors:v19];

    [v8 setFetchLimit:12];
    id v6 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v8];
  }
  v20 = [[PXSuggestionsDataSource alloc] initWithSuggestionsFetchResult:v6];

  return v20;
}

- (PXSuggestionsDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSuggestionsDataSourceManager.m", 131, @"%s is not available as initializer", "-[PXSuggestionsDataSourceManager init]");

  abort();
}

- (PXSuggestionsDataSourceManager)initWithLibraryFilterState:(id)a3 fetchResultProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSuggestionsDataSourceManager;
  id v9 = [(PXSectionedDataSourceManager *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryFilterState, a3);
    uint64_t v11 = [v8 copy];
    id fetchResultProvider = v10->_fetchResultProvider;
    v10->_id fetchResultProvider = (id)v11;

    [(PXSuggestionsDataSourceManager *)v10 _resetDataSource];
    uint64_t v13 = [(PHFetchResult *)v10->_fetchResult photoLibrary];
    objc_msgSend(v13, "px_registerChangeObserver:", v10);

    v14 = +[PXContentSyndicationConfigurationProvider sharedInstance];
    [v14 registerChangeObserver:v10 context:PXConfigurationObservationContext];

    [(PXLibraryFilterState *)v10->_libraryFilterState registerChangeObserver:v10 context:PXLibraryFilterStateObservationContext_34467];
  }

  return v10;
}

- (PXSuggestionsDataSourceManager)initWithDataSourceType:(unsigned __int16)a3 libraryFilterState:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSuggestionsDataSourceManager;
  id v8 = [(PXSectionedDataSourceManager *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    v8->_dataSourceType = a3;
    objc_storeStrong((id *)&v8->_libraryFilterState, a4);
    [(PXSuggestionsDataSourceManager *)v9 _resetDataSource];
    id v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    objc_msgSend(v10, "px_registerChangeObserver:", v9);

    if (v9->_dataSourceType == 2)
    {
      uint64_t v11 = +[PXContentSyndicationConfigurationProvider sharedInstance];
      [v11 registerChangeObserver:v9 context:PXConfigurationObservationContext];
    }
    [(PXLibraryFilterState *)v9->_libraryFilterState registerChangeObserver:v9 context:PXLibraryFilterStateObservationContext_34467];
  }

  return v9;
}

+ (id)mostRecentCreationDateForPXSuggestionDataSourceType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5 = [v4 librarySpecificFetchOptions];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v18[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:1];
  id v8 = +[PXSuggestionsDataSourceManager baseFetchPredicate];
  id v9 = +[PXSuggestionsDataSourceManager typePredicateForDataSourceType:v3];
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v8;
  v17[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

  [v5 setPredicate:v12];
  objc_super v13 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v5];
  v14 = [v13 firstObject];
  v15 = [v14 creationDate];

  return v15;
}

+ (id)typePredicateForDataSourceType:(unsigned __int16)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
      goto LABEL_8;
    case 1u:
      *(void *)&a3 = 1;
      goto LABEL_8;
    case 2u:
      id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState == %d", 1);
      v5 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWidget];
      id v6 = (void *)MEMORY[0x1E4F28BA0];
      v16[0] = v5;
      v16[1] = v4;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      uint64_t v3 = [v6 andPredicateWithSubpredicates:v7];

      id v8 = +[PXContentSyndicationConfigurationProvider sharedInstance];
      char v9 = [v8 showUnsavedSyndicatedContentInFeaturedPhotos];

      if ((v9 & 1) == 0)
      {
        id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"subtype != %d", 306);
        uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
        v15[0] = v3;
        v15[1] = v10;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
        uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

        uint64_t v3 = (void *)v13;
      }

      break;
    case 3u:
      *(void *)&a3 = 4;
LABEL_8:
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", a3);
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

+ (NSPredicate)baseFetchPredicate
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(state == %d || state == %d || state == %d) && version <= %d", 1, 0, 3, 3);
}

@end