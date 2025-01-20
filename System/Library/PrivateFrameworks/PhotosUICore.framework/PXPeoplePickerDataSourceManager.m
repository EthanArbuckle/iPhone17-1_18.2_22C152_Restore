@interface PXPeoplePickerDataSourceManager
+ (id)currentDataSourceManager;
- (PXPeoplePickerDataSourceManager)init;
- (id)createInitialDataSource;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)deselectAllLocalIdentifiers;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setDisabledLocalIdentifiers:(id)a3;
- (void)setLocalIdentifiers:(id)a3 selected:(BOOL)a4;
- (void)setPeople:(id)a3;
- (void)setSuggestedLocalIdentifiers:(id)a3 withPhotoLibrary:(id)a4;
@end

@implementation PXPeoplePickerDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_suggestedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedLocalIdentifiers, 0);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXSectionedDataSourceManager *)self dataSource];
  v9 = [v7 objectForKeyedSubscript:@"currentDataSource"];

  if (v9 == v8)
  {
    v10 = [v7 objectForKeyedSubscript:@"preparedDataSource"];
    id v11 = [v7 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v21 = 0;
    v10 = [v8 dataSourceUpdatedWithChange:v6 changeDetails:&v21];
    id v11 = v21;
  }
  v12 = v11;
  if (v10 != v8)
  {
    id v20 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v13 = [v8 identifier];
    uint64_t v14 = [v10 identifier];
    v15 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v22 = &unk_1F02D5C68;
    v23[0] = v12;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v16 = self;
    v18 = id v17 = v6;
    v19 = (void *)[v20 initWithFromDataSourceIdentifier:v13 toDataSourceIdentifier:v14 sectionChanges:v15 itemChangeDetailsBySection:v18 subitemChangeDetailsByItemBySection:0];

    id v6 = v17;
    [(PXSectionedDataSourceManager *)v16 setDataSource:v10 changeDetails:v19];
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__22163;
  id v17 = __Block_byref_object_dispose__22164;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXPeoplePickerDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v5 = (void *)v14[5];
  id v11 = 0;
  id v6 = [v5 dataSourceUpdatedWithChange:v4 changeDetails:&v11];
  id v7 = v11;
  uint64_t v8 = v14[5];
  v19[0] = @"currentDataSource";
  v19[1] = @"preparedDataSource";
  v20[0] = v8;
  v20[1] = v6;
  v19[2] = @"preparedChangeDetails";
  v20[2] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __64__PXPeoplePickerDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)deselectAllLocalIdentifiers
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerDataSourceManager.m", 278, @"%s must be called on the main thread", "-[PXPeoplePickerDataSourceManager deselectAllLocalIdentifiers]");
  }
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  [(PXPeoplePickerDataSourceManager *)self setLocalIdentifiers:selectedLocalIdentifiers selected:0];
}

- (void)setLocalIdentifiers:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerDataSourceManager.m", 231, @"%s must be called on the main thread", "-[PXPeoplePickerDataSourceManager setLocalIdentifiers:selected:]");
  }
  if (![v7 count])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 232, @"Invalid parameter not satisfying: %@", @"localIdentifiers.count > 0" object file lineNumber description];
  }
  uint64_t v8 = [(PXSectionedDataSourceManager *)self dataSource];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke;
  aBlock[3] = &unk_1E5DB12D0;
  id v9 = v8;
  id v42 = v9;
  v10 = (void (**)(void *, id))_Block_copy(aBlock);
  id v11 = v10;
  if (v4)
  {
    [(NSMutableArray *)self->_selectedLocalIdentifiers addObjectsFromArray:v7];
    v11[2](v11, v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }
  else
  {
    v10[2](v10, v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)self->_selectedLocalIdentifiers removeObjectsInArray:v7];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }
  uint64_t v14 = [PXPeoplePickerDataSource alloc];
  uint64_t v15 = [v9 _fetchResult];
  v16 = [v9 disabledLocalIdentifiers];
  v35 = v12;
  id v17 = [(PXPeoplePickerDataSource *)v14 initWithFetchResult:v15 disabledLocalIdentifiers:v16 allSelectedLocalIdentifiers:self->_selectedLocalIdentifiers newlySelectedObjectIDs:v12 newlyDeselectedObjectIDs:v13];

  id v18 = [v9 _fetchResult];
  v19 = [v18 fetchedObjects];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_3;
  v39[3] = &unk_1E5DB12F8;
  id v34 = v7;
  id v40 = v34;
  uint64_t v20 = [v19 indexOfObjectPassingTest:v39];
  v37 = v11;
  v38 = self;
  v36 = v13;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v21 = 0;
  }
  else
  {
    v22 = [v19 objectAtIndexedSubscript:v20];
    v45[0] = v22;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  }
  v23 = [(PXPeoplePickerDataSource *)v17 _fetchResult];
  v24 = [v23 fetchedObjects];
  v25 = [off_1E5DA5568 changeDetailsFromArray:v19 toArray:v24 changedObjects:v21];

  id v26 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v27 = [v9 identifier];
  uint64_t v28 = [(PXPeoplePickerDataSource *)v17 identifier];
  v29 = [off_1E5DA5568 changeDetailsWithNoChanges];
  v43 = &unk_1F02D5C68;
  v44 = v25;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v31 = (void *)[v26 initWithFromDataSourceIdentifier:v27 toDataSourceIdentifier:v28 sectionChanges:v29 itemChangeDetailsBySection:v30 subitemChangeDetailsByItemBySection:0];

  [(PXSectionedDataSourceManager *)v38 setDataSource:v17 changeDetails:v31];
}

void __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  [*(id *)(a1 + 32) _fetchResult];
  objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  PXMap();
}

uint64_t __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 localIdentifier];
  id v4 = [*(id *)(a1 + 32) firstObject];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 localIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = [v3 objectID];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setDisabledLocalIdentifiers:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerDataSourceManager.m", 212, @"%s must be called on the main thread", "-[PXPeoplePickerDataSourceManager setDisabledLocalIdentifiers:]");
  }
  if (![v5 count])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 213, @"Invalid parameter not satisfying: %@", @"disabledLocalIdentifiers.count > 0" object file lineNumber description];
  }
  [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v6 = [(id)objc_claimAutoreleasedReturnValue() _fetchResult];
  id v7 = [PXPeoplePickerDataSource alloc];
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  [(PXPeoplePickerDataSource *)v7 initWithFetchResult:v6 disabledLocalIdentifiers:v5 allSelectedLocalIdentifiers:selectedLocalIdentifiers newlySelectedObjectIDs:v9 newlyDeselectedObjectIDs:v10];

  v5;
  PXMap();
}

id __63__PXPeoplePickerDataSourceManager_setDisabledLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  if ([v2 containsObject:v4]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setSuggestedLocalIdentifiers:(id)a3 withPhotoLibrary:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = (NSArray *)a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a4;
  if (([v8 isMainThread] & 1) == 0)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerDataSourceManager.m", 187, @"%s must be called on the main thread", "-[PXPeoplePickerDataSourceManager setSuggestedLocalIdentifiers:withPhotoLibrary:]");
  }
  if (self->_people)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 188, @"Invalid parameter not satisfying: %@", @"_people == nil" object file lineNumber description];
  }
  if (self->_suggestedLocalIdentifiers)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 189, @"Invalid parameter not satisfying: %@", @"_suggestedLocalIdentifiers == nil" object file lineNumber description];

    suggestedLocalIdentifiers = self->_suggestedLocalIdentifiers;
  }
  else
  {
    suggestedLocalIdentifiers = 0;
  }
  self->_suggestedLocalIdentifiers = v7;
  id v11 = v7;

  id v12 = [v9 librarySpecificFetchOptions];
  id v13 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  v35 = v12;
  [v12 setIncludedDetectionTypes:v13];

  id v34 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v11 options:v12];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v11];
  v32 = objc_msgSend(v34, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v33);
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F39150]) initWithOids:v32 photoLibrary:v9 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  uint64_t v14 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v15 = [PXPeoplePickerDataSource alloc];
  v16 = [v14 disabledLocalIdentifiers];
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  uint64_t v20 = [(PXPeoplePickerDataSource *)v15 initWithFetchResult:v31 disabledLocalIdentifiers:v16 allSelectedLocalIdentifiers:selectedLocalIdentifiers newlySelectedObjectIDs:v18 newlyDeselectedObjectIDs:v19];

  id v21 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
  id v22 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v23 = [v14 identifier];
  uint64_t v24 = [(PXPeoplePickerDataSource *)v20 identifier];
  v25 = [off_1E5DA5568 changeDetailsWithNoChanges];
  v36 = &unk_1F02D5C68;
  v37[0] = v21;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  uint64_t v27 = (void *)[v22 initWithFromDataSourceIdentifier:v23 toDataSourceIdentifier:v24 sectionChanges:v25 itemChangeDetailsBySection:v26 subitemChangeDetailsByItemBySection:0];
  [(PXSectionedDataSourceManager *)self setDataSource:v20 changeDetails:v27];
}

- (void)setPeople:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = (PHFetchResult *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerDataSourceManager.m", 168, @"%s must be called on the main thread", "-[PXPeoplePickerDataSourceManager setPeople:]");
  }
  if (self->_people)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 169, @"Invalid parameter not satisfying: %@", @"_people == nil" object file lineNumber description];
  }
  if (self->_suggestedLocalIdentifiers)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 170, @"Invalid parameter not satisfying: %@", @"_suggestedLocalIdentifiers == nil" object file lineNumber description];
  }
  people = self->_people;
  self->_people = v5;
  id v7 = v5;

  uint64_t v8 = [(PHFetchResult *)v7 photoLibrary];
  objc_msgSend(v8, "px_registerChangeObserver:", self);

  id v9 = [(PXSectionedDataSourceManager *)self dataSource];
  id v10 = [PXPeoplePickerDataSource alloc];
  id v11 = [v9 disabledLocalIdentifiers];
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  uint64_t v15 = [(PXPeoplePickerDataSource *)v10 initWithFetchResult:v7 disabledLocalIdentifiers:v11 allSelectedLocalIdentifiers:selectedLocalIdentifiers newlySelectedObjectIDs:v13 newlyDeselectedObjectIDs:v14];

  v16 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
  id v17 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v18 = [v9 identifier];
  uint64_t v19 = [(PXPeoplePickerDataSource *)v15 identifier];
  uint64_t v20 = [off_1E5DA5568 changeDetailsWithNoChanges];
  id v26 = &unk_1F02D5C68;
  v27[0] = v16;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  id v22 = (void *)[v17 initWithFromDataSourceIdentifier:v18 toDataSourceIdentifier:v19 sectionChanges:v20 itemChangeDetailsBySection:v21 subitemChangeDetailsByItemBySection:0];
  [(PXSectionedDataSourceManager *)self setDataSource:v15 changeDetails:v22];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeoplePickerDataSourceManager;
  [(PXPeoplePickerDataSourceManager *)&v3 performChanges:a3];
}

- (id)createInitialDataSource
{
  uint64_t v2 = [PXPeoplePickerDataSource alloc];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  id v5 = [(PXPeoplePickerDataSource *)v2 initWithFetchResult:0 disabledLocalIdentifiers:MEMORY[0x1E4F1CBF0] allSelectedLocalIdentifiers:MEMORY[0x1E4F1CBF0] newlySelectedObjectIDs:v3 newlyDeselectedObjectIDs:v4];

  return v5;
}

- (PXPeoplePickerDataSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeoplePickerDataSourceManager;
  uint64_t v2 = [(PXSectionedDataSourceManager *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    selectedLocalIdentifiers = v2->_selectedLocalIdentifiers;
    v2->_selectedLocalIdentifiers = v3;
  }
  return v2;
}

+ (id)currentDataSourceManager
{
  uint64_t v2 = objc_alloc_init(PXPeoplePickerDataSourceManager);
  return v2;
}

@end