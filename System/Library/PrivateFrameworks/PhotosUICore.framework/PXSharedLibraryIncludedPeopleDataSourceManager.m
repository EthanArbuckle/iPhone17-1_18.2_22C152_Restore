@interface PXSharedLibraryIncludedPeopleDataSourceManager
- (BOOL)viewModelSyncingDisabled;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryIncludedPeopleDataSourceManager)initWithViewModel:(id)a3;
- (id)_infosForPersonIdentifiers:(id)a3;
- (id)createInitialDataSource;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (void)_resetIfNeeded;
- (void)_updateDataSource;
- (void)_updateDataSourceWithItemChanges:(id)a3 fromDataSourceIdentifier:(int64_t)a4;
- (void)_updateViewModel;
- (void)_updateViewModelInitially;
- (void)addInfos:(id)a3;
- (void)addSelectedPersonIdentifiers:(id)a3;
- (void)didCreateInitialDataSource;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)removeAllItems;
- (void)removeInfo:(id)a3;
- (void)replaceInfo:(id)a3 withInfo:(id)a4;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)setViewModelSyncingDisabled:(BOOL)a3;
@end

@implementation PXSharedLibraryIncludedPeopleDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_infosWithoutPeople, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_removedParticipants, 0);
}

- (BOOL)viewModelSyncingDisabled
{
  return self->_viewModelSyncingDisabled;
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_159356 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:550 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((v6 & 0x20) != 0)
  {
    [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _updateDataSource];
    id v9 = v11;
  }
  if (v6 < 0)
  {
    [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _resetIfNeeded];
    id v9 = v11;
  }
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:536 description:@"Resuming changes is not supported in PXSharedLibraryIncludedPeopleDataSourceManager."];

  abort();
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:532 description:@"Pausing changes is not supported in PXSharedLibraryIncludedPeopleDataSourceManager."];

  abort();
}

- (void)replaceInfo:(id)a3 withInfo:(id)a4
{
  id v25 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 493, @"%s must be called on the main thread", "-[PXSharedLibraryIncludedPeopleDataSourceManager replaceInfo:withInfo:]");
  }
  if (v25)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 494, @"Invalid parameter not satisfying: %@", @"oldInfo != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 495, @"Invalid parameter not satisfying: %@", @"newInfo != nil" object file lineNumber description];

LABEL_5:
  v8 = [(PXSectionedDataSourceManager *)self dataSource];
  if ([v8 numberOfSections] != 1)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:498 description:@"Expected there to be only one section"];
  }
  uint64_t v9 = [(NSMutableArray *)self->_infos indexOfObject:v25];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 501, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  [(NSMutableArray *)self->_infos replaceObjectAtIndex:v9 withObject:v7];
  uint64_t v10 = [(NSMutableArray *)self->_infosWithoutPeople indexOfObject:v25];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v10;
    v12 = [v7 person];

    infosWithoutPeople = self->_infosWithoutPeople;
    if (v12) {
      [(NSMutableArray *)infosWithoutPeople removeObject:v25];
    }
    else {
      [(NSMutableArray *)infosWithoutPeople replaceObjectAtIndex:v11 withObject:v7];
    }
  }
  uint64_t v14 = [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants indexOfObject:v25];
  uint64_t v15 = [v7 person];
  v16 = (void *)v15;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v15)
    {
      v17 = [v7 participant];

      if (v17) {
        [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants addObject:v7];
      }
    }
  }
  else if (v15 {
         && ([v7 participant],
  }
             v18 = objc_claimAutoreleasedReturnValue(),
             v18,
             v16,
             v18))
  {
    [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants replaceObjectAtIndex:v14 withObject:v7];
  }
  else
  {
    [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants removeObject:v25];
  }
  v19 = objc_msgSend(off_1E5DA5568, "changeDetailsWithChangedIndexRange:", v9, 1);
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v19, [v8 identifier]);
}

- (void)removeInfo:(id)a3
{
  id v12 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 472, @"%s must be called on the main thread", "-[PXSharedLibraryIncludedPeopleDataSourceManager removeInfo:]");
  }
  if (!v12)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 473, @"Invalid parameter not satisfying: %@", @"info != nil" object file lineNumber description];
  }
  id v5 = [(PXSectionedDataSourceManager *)self dataSource];
  if ([v5 numberOfSections] != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:476 description:@"Expected there to be only one section"];
  }
  id v6 = [v12 participant];
  if (v6) {
    [(NSMutableSet *)self->_removedParticipants addObject:v6];
  }
  uint64_t v7 = [(NSMutableArray *)self->_infos count];
  [(NSMutableArray *)self->_infos removeObject:v12];
  [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants removeObject:v12];
  [(NSMutableArray *)self->_infosWithoutPeople removeObject:v12];
  v8 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", v7, 1);
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v8, [v5 identifier]);
}

- (void)addInfos:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 441, @"%s must be called on the main thread", "-[PXSharedLibraryIncludedPeopleDataSourceManager addInfos:]");
  }
  if (![v5 count])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 442, @"Invalid parameter not satisfying: %@", @"infos.count > 0" object file lineNumber description];
  }
  if ([(id)objc_claimAutoreleasedReturnValue() numberOfSections] ! = [(PXSectionedDataSourceManager *)self dataSource];
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryIncludedPeopleDataSourceManager.m" lineNumber:445 description:@"Expected there to be only one section"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  PXMap();
}

id __59__PXSharedLibraryIncludedPeopleDataSourceManager_addInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 128) containsObject:v3])
  {
    id v4 = 0;
    goto LABEL_9;
  }
  id v5 = [v3 person];
  if (!v5)
  {
    uint64_t v7 = (id *)(a1 + 40);
    goto LABEL_7;
  }
  id v6 = [v3 participant];

  if (v6)
  {
    uint64_t v7 = (id *)(*(void *)(a1 + 32) + 136);
LABEL_7:
    [*v7 addObject:v3];
  }
  id v4 = v3;

LABEL_9:
  return v4;
}

- (void)removeAllItems
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 424, @"%s must be called on the main thread", "-[PXSharedLibraryIncludedPeopleDataSourceManager removeAllItems]");
  }
  PXMap();
}

uint64_t __64__PXSharedLibraryIncludedPeopleDataSourceManager_removeAllItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 participant];
}

- (void)setViewModelSyncingDisabled:(BOOL)a3
{
  if (self->_viewModelSyncingDisabled != a3)
  {
    self->_viewModelSyncingDisabled = a3;
    [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _updateViewModel];
  }
}

- (void)addSelectedPersonIdentifiers:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 409, @"%s must be called on the main thread", "-[PXSharedLibraryIncludedPeopleDataSourceManager addSelectedPersonIdentifiers:]");
  }
  id v5 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _infosForPersonIdentifiers:v7];
  if ([v5 count]) {
    [(PXSharedLibraryIncludedPeopleDataSourceManager *)self addInfos:v5];
  }
}

- (id)_infosForPersonIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self viewModel];
    id v6 = [v5 sourceLibraryInfo];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v7 = v6;

      if (v7)
      {
        v8 = [v7 photoLibrary];
        uint64_t v9 = [v8 librarySpecificFetchOptions];

        [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v4 options:v9];
        uint64_t v10 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "px_fetchedObjectIDsSortedByLocalIdentifiers:", objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithArray:", v4));
        id v11 = objc_alloc(MEMORY[0x1E4F39150]);
        id v12 = [v7 photoLibrary];
        [v11 initWithOids:v10 photoLibrary:v12 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

        PXMap();
      }
    }
    else
    {
    }
  }

  return 0;
}

PXSharedLibraryIncludedPeopleInfo *__77__PXSharedLibraryIncludedPeopleDataSourceManager__infosForPersonIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithPerson:v2];

  return v3;
}

- (void)_updateDataSourceWithItemChanges:(id)a3 fromDataSourceIdentifier:(int64_t)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [[PXSharedLibraryIncludedPeopleDataSource alloc] initWithInfos:self->_infos infosWithBothPeopleAndParticipants:self->_infosWithBothPeopleAndParticipants infosWithoutPeople:self->_infosWithoutPeople];
  id v8 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v9 = [(PXSharedLibraryIncludedPeopleDataSource *)v7 identifier];
  uint64_t v10 = [off_1E5DA5568 changeDetailsWithNoChanges];
  v13 = &unk_1F02D7AB0;
  v14[0] = v6;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  id v12 = (void *)[v8 initWithFromDataSourceIdentifier:a4 toDataSourceIdentifier:v9 sectionChanges:v10 itemChangeDetailsBySection:v11 subitemChangeDetailsByItemBySection:0];
  [(PXSectionedDataSourceManager *)self setDataSource:v7 changeDetails:v12];
}

- (void)_resetIfNeeded
{
  if ([(PXSharedLibraryAssistantViewModel *)self->_viewModel autoSharePolicy] != 2)
  {
    [(NSMutableSet *)self->_removedParticipants removeAllObjects];
    [(NSMutableArray *)self->_infos removeAllObjects];
    [(NSMutableArray *)self->_infosWithBothPeopleAndParticipants removeAllObjects];
    [(NSMutableArray *)self->_infosWithoutPeople removeAllObjects];
    id v3 = [(PXSectionedDataSourceManager *)self dataSourceIfExists];

    if (v3)
    {
      id v4 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self createInitialDataSource];
      [(PXSectionedDataSourceManager *)self setDataSource:v4 changeDetails:0];
    }
  }
}

- (void)_updateDataSource
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel participantDataSource];
  id v5 = [v4 participants];
  uint64_t v6 = [v3 setWithArray:v5];

  [(NSMutableSet *)self->_removedParticipants intersectSet:v6];
  [(PXSectionedDataSourceManager *)self dataSource];
  [(id)objc_claimAutoreleasedReturnValue() allItemsEnumerator];
  objc_claimAutoreleasedReturnValue();
  PXFilter();
}

void __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXFind();
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_6(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(a1[5], "removeInfo:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = [a1[6] count];
  if (result) {
    return [a1[5] addInfos:a1[6]];
  }
  return result;
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 participant];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[PXSharedLibraryIncludedPeopleInfo personForParticipant:v2];
  uint64_t v4 = [PXSharedLibraryIncludedPeopleInfo alloc];
  if (v3) {
    uint64_t v5 = [(PXSharedLibraryIncludedPeopleInfo *)v4 initWithParticipant:v2 person:v3];
  }
  else {
    uint64_t v5 = [(PXSharedLibraryIncludedPeopleInfo *)v4 initWithParticipant:v2];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 participant];
}

BOOL __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 participant];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateViewModel
{
  if ([(PXSharedLibraryIncludedPeopleDataSourceManager *)self viewModelSyncingDisabled])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v4 = [(PXSectionedDataSourceManager *)self dataSource];
    BOOL v3 = [v4 allPersonUUIDs];
  }
  uint64_t v5 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModel__block_invoke;
  v7[3] = &unk_1E5DD07C0;
  id v8 = v3;
  id v6 = v3;
  [v5 performChanges:v7];
}

uint64_t __66__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersonUUIDs:*(void *)(a1 + 32)];
}

- (void)_updateViewModelInitially
{
  BOOL v3 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModelInitially__block_invoke;
  v4[3] = &unk_1E5DD07C0;
  v4[4] = self;
  [v3 performInitialChanges:v4];
}

void __75__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModelInitially__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 dataSource];
  uint64_t v4 = [v5 allPersonUUIDs];
  [v3 setPersonUUIDs:v4];
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  [(PXSectionedDataSourceManager *)&v5 setDataSource:a3 changeDetailsArray:a4];
  [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _updateViewModel];
}

- (void)didCreateInitialDataSource
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  [(PXSectionedDataSourceManager *)&v3 didCreateInitialDataSource];
  [(PXSharedLibraryIncludedPeopleDataSourceManager *)self _updateViewModelInitially];
}

- (id)createInitialDataSource
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self viewModel];
  uint64_t v4 = [v3 sharedLibrary];
  int v5 = [v4 isInPreview];

  if (v5)
  {
    [v3 personUUIDs];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  v27 = v3;
  if ([v3 mode] == 2)
  {
    id v6 = [v3 sharedLibrary];
    PXSharedLibraryUIParticipantsForSharedLibrary(v6, 2u);
  }
  id v7 = [v3 participantDataSource];
  id v8 = [v7 participants];

  long long v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v16 = +[PXSharedLibraryIncludedPeopleInfo personForParticipant:v15];
        v17 = [PXSharedLibraryIncludedPeopleInfo alloc];
        if (v16)
        {
          v18 = [(PXSharedLibraryIncludedPeopleInfo *)v17 initWithParticipant:v15 person:v16];
          v19 = &OBJC_IVAR___PXSharedLibraryIncludedPeopleDataSourceManager__infosWithBothPeopleAndParticipants;
        }
        else
        {
          v18 = [(PXSharedLibraryIncludedPeopleInfo *)v17 initWithParticipant:v15];
          v19 = &OBJC_IVAR___PXSharedLibraryIncludedPeopleDataSourceManager__infosWithoutPeople;
        }
        [*(id *)((char *)&self->super.super.super.isa + *v19) addObject:v18];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = v9;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        [(NSMutableArray *)self->_infos addObject:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v22);
  }

  id v25 = [[PXSharedLibraryIncludedPeopleDataSource alloc] initWithInfos:self->_infos infosWithBothPeopleAndParticipants:self->_infosWithBothPeopleAndParticipants infosWithoutPeople:self->_infosWithoutPeople];
  return v25;
}

id __73__PXSharedLibraryIncludedPeopleDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length])
  {
    objc_super v3 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (PXSharedLibraryIncludedPeopleDataSourceManager)initWithViewModel:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  id v6 = [(PXSectionedDataSourceManager *)&v16 init];
  if (v6)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    infos = v6->_infos;
    v6->_infos = v7;

    long long v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    infosWithBothPeopleAndParticipants = v6->_infosWithBothPeopleAndParticipants;
    v6->_infosWithBothPeopleAndParticipants = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    infosWithoutPeople = v6->_infosWithoutPeople;
    v6->_infosWithoutPeople = v11;

    uint64_t v13 = objc_opt_new();
    removedParticipants = v6->_removedParticipants;
    v6->_removedParticipants = (NSMutableSet *)v13;

    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXSharedLibraryAssistantViewModel *)v6->_viewModel registerChangeObserver:v6 context:PXSharedLibraryAssistantViewModelObservationContext_159356];
  }

  return v6;
}

@end