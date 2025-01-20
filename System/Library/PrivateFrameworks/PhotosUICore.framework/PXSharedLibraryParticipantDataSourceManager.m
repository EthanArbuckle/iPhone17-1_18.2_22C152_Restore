@interface PXSharedLibraryParticipantDataSourceManager
+ (id)aggregatedDataSource;
+ (id)aggregatedDataSourceWithParticipants:(id)a3;
- (id)createInitialDataSource;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (void)addParticipants:(id)a3;
- (void)performChanges:(id)a3;
- (void)removeParticipantAtIndex:(unint64_t)a3;
- (void)replaceDataSourceWithDataSource:(id)a3;
- (void)resumeChangeDelivery:(id)a3;
@end

@implementation PXSharedLibraryParticipantDataSourceManager

- (void)resumeChangeDelivery:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryParticipantDataSourceManager.m" lineNumber:118 description:@"Resuming changes is not supported in PXSharedLibraryParticipantDataSourceManager."];

  abort();
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryParticipantDataSourceManager.m" lineNumber:114 description:@"Pausing changes is not supported in PXSharedLibraryParticipantDataSourceManager."];

  abort();
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantDataSourceManager;
  [(PXSharedLibraryParticipantDataSourceManager *)&v3 performChanges:a3];
}

- (void)removeParticipantAtIndex:(unint64_t)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXSectionedDataSourceManager *)self dataSource];
  id v5 = [v4 participants];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [v6 objectAtIndexedSubscript:a3];
  [v6 removeObjectAtIndex:a3];
  id v8 = [[PXSharedLibraryParticipantDataSource alloc] _initWithParticipants:v6];
  v21[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v10 = [v4 participants];
  v11 = [v8 participants];
  v12 = [off_1E5DA5568 changeDetailsFromArray:v10 toArray:v11 changedObjects:v9];

  id v13 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v14 = [v4 identifier];
  uint64_t v15 = [v8 identifier];
  v19 = &unk_1F02D8FF8;
  v20 = v12;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v17 = (void *)[v13 initWithFromDataSourceIdentifier:v14 toDataSourceIdentifier:v15 sectionChanges:v12 itemChangeDetailsBySection:v16 subitemChangeDetailsByItemBySection:0];

  [(PXSectionedDataSourceManager *)self setDataSource:v8 changeDetails:v17];
}

- (void)addParticipants:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXSectionedDataSourceManager *)self dataSource];
  if (([v6 canAddParticipants] & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSourceManager.m", 60, @"Invalid parameter not satisfying: %@", @"currentDataSource.canAddParticipants" object file lineNumber description];
  }
  unint64_t v7 = [v5 count];
  if (v7 > 5 - [v6 numberOfParticipants])
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSourceManager.m", 61, @"Invalid parameter not satisfying: %@", @"newParticipants.count <= PXSharedLibraryParticipantsMaxCount - currentDataSource.numberOfParticipants" object file lineNumber description];
  }
  v41 = self;
  v42 = v6;
  id v8 = [v6 participants];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  v11 = [v10 cachedPrimaryAppleAccount];
  v12 = [v11 username];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v19 = [v18 appleIDAddress];
        uint64_t v20 = [v19 caseInsensitiveCompare:v12];

        if (([v8 containsObject:v18] & 1) == 0
          && ([v9 containsObject:v18] & 1) == 0
          && v20)
        {
          [v9 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v15);
  }

  v21 = v42;
  if ([v9 count])
  {
    v22 = [v42 participants];
    v23 = (void *)[v22 mutableCopy];

    uint64_t v24 = [v42 numberOfParticipants];
    uint64_t v25 = [v9 count];
    v39 = v23;
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v24, v25);
    [v23 insertObjects:v9 atIndexes:v40];
    id v26 = [[PXSharedLibraryParticipantDataSource alloc] _initWithParticipants:v23];
    v38 = (void *)[v13 copy];
    v27 = [v42 participants];
    v37 = v26;
    v28 = [v26 participants];
    v29 = [off_1E5DA5568 changeDetailsFromArray:v27 toArray:v28 changedObjects:v38];

    id v30 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v31 = [v42 identifier];
    uint64_t v32 = [v26 identifier];
    v47 = &unk_1F02D8FF8;
    v48 = v29;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v34 = (void *)[v30 initWithFromDataSourceIdentifier:v31 toDataSourceIdentifier:v32 sectionChanges:v29 itemChangeDetailsBySection:v33 subitemChangeDetailsByItemBySection:0];

    v21 = v42;
    [(PXSectionedDataSourceManager *)v41 setDataSource:v37 changeDetails:v34];
  }
}

- (void)replaceDataSourceWithDataSource:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v6 = [v5 identifier];
  if (v6 != [v4 identifier])
  {
    unint64_t v7 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    id v8 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v9 = [v5 identifier];
    uint64_t v10 = [v4 identifier];
    id v13 = &unk_1F02D8FF8;
    v14[0] = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v12 = (void *)[v8 initWithFromDataSourceIdentifier:v9 toDataSourceIdentifier:v10 sectionChanges:v7 itemChangeDetailsBySection:v11 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)self setDataSource:v4 changeDetails:v12];
  }
}

- (id)createInitialDataSource
{
  v2 = objc_opt_class();
  return (id)[v2 aggregatedDataSource];
}

+ (id)aggregatedDataSource
{
  return (id)[a1 aggregatedDataSourceWithParticipants:MEMORY[0x1E4F1CBF0]];
}

+ (id)aggregatedDataSourceWithParticipants:(id)a3
{
  id v3 = a3;
  id v4 = [[PXSharedLibraryParticipantDataSource alloc] _initWithParticipants:v3];

  return v4;
}

@end