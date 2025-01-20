@interface PLJournalManagerCore
- (BOOL)appendSnapshotWithJournal:(id)a3 usingManagedObjectContext:(id)a4 changedKeys:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7;
- (BOOL)createSnapshotWithJournal:(id)a3 createOnlyIfNecessary:(BOOL)a4 usingManagedObjectContext:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7;
- (BOOL)saveHistoryToken:(id)a3 error:(id *)a4;
- (Class)payloadClassForPayloadClassID:(id)a3;
- (NSArray)payloadClasses;
- (NSSet)payloadClassIDs;
- (NSString)name;
- (NSURL)baseURL;
- (NSURL)historyTokenURL;
- (PLJournalManagerCore)init;
- (PLJournalManagerCore)initWithName:(id)a3 baseURL:(id)a4 payloadClasses:(id)a5;
- (id)_nextValidPayloadWithObjectEnumerator:(id)a3 changedKeys:(id)a4 payloadClass:(Class)a5;
- (id)_objectEnumeratorForJournal:(id)a3 usingManagedObjectContext:(id)a4 error:(id *)a5;
- (id)payloadClassesForAdditionalEntityName:(id)a3;
- (id)payloadClassesForEntityName:(id)a3;
- (id)readHistoryTokenWithError:(id *)a3;
- (void)removeHistoryToken;
- (void)validatePayloadClassesForManagedObjectModel:(id)a3;
@end

@implementation PLJournalManagerCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadClasses, 0);
  objc_storeStrong((id *)&self->_payloadClassesByPayloadClassID, 0);
  objc_storeStrong((id *)&self->_payloadClassesByAdditionalEntityName, 0);
  objc_storeStrong((id *)&self->_payloadClassesByEntityName, 0);
  objc_storeStrong((id *)&self->_payloadClassIDs, 0);
  objc_storeStrong((id *)&self->_historyTokenURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)payloadClasses
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (id)_objectEnumeratorForJournal:(id)a3 usingManagedObjectContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)[v9 payloadClass];
  v12 = [v11 relationshipKeyPathsForPrefetching];
  v13 = objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "entityName");
  if (!v13)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "payloadClassID");
    [v20 handleFailureInMethod:a2, self, @"PLJournalManagerCore.m", 218, @"nil entityName for payloadClassID: %@", v21 object file lineNumber description];
  }
  v14 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v13];
  [v14 setFetchBatchSize:100];
  [v14 setReturnsObjectsAsFaults:0];
  [v14 setRelationshipKeyPathsForPrefetching:v12];
  v15 = objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "snapshotSortDescriptors");
  [v14 setSortDescriptors:v15];

  [v14 setShouldRefreshRefetchedObjects:1];
  [v14 setIncludesSubentities:0];
  v16 = [v11 fetchPredicateInContext:v10];
  [v14 setPredicate:v16];

  v17 = [v10 executeFetchRequest:v14 error:a5];

  v18 = [v17 objectEnumerator];

  return v18;
}

- (BOOL)appendSnapshotWithJournal:(id)a3 usingManagedObjectContext:(id)a4 changedKeys:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v31 = 0;
  v15 = [(PLJournalManagerCore *)self _objectEnumeratorForJournal:v12 usingManagedObjectContext:v13 error:&v31];
  id v16 = v31;
  v17 = v16;
  if (v15)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __105__PLJournalManagerCore_appendSnapshotWithJournal_usingManagedObjectContext_changedKeys_entryLimit_error___block_invoke;
    v24[3] = &unk_1E5867B48;
    v28 = v30;
    unint64_t v29 = a6;
    v24[4] = self;
    id v25 = v15;
    id v26 = v14;
    id v27 = v12;
    id v23 = v17;
    char v18 = [v27 appendSnapshotUsingNextEntryBlock:v24 error:&v23];
    id v19 = v23;

    _Block_object_dispose(v30, 8);
    id v20 = v19;
    if (v18)
    {
      BOOL v21 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v20 = v16;
  }
  if (a7)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a7 = v20;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_8:

  return v21;
}

id __105__PLJournalManagerCore_appendSnapshotWithJournal_usingManagedObjectContext_changedKeys_entryLimit_error___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v4 = *(void *)(v3 + 24);
    if (v4 >= v2)
    {
      id v9 = 0;
      goto LABEL_12;
    }
    *(void *)(v3 + 24) = v4 + 1;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_nextValidPayloadWithObjectEnumerator:changedKeys:payloadClass:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "payloadClass"));
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = [PLJournalEntry alloc];
    if (v6) {
      uint64_t v8 = [(PLJournalEntry *)v7 initForUpdateWithPayload:v5];
    }
    else {
      uint64_t v8 = [(PLJournalEntry *)v7 initForInsertWithPayload:v5];
    }
    id v9 = (void *)v8;
  }
  else
  {
    id v9 = 0;
  }

LABEL_12:
  return v9;
}

- (BOOL)createSnapshotWithJournal:(id)a3 createOnlyIfNecessary:(BOOL)a4 usingManagedObjectContext:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v29 = 0;
  id v14 = [(PLJournalManagerCore *)self _objectEnumeratorForJournal:v12 usingManagedObjectContext:v13 error:&v29];
  id v15 = v29;
  id v16 = v15;
  if (v14)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __115__PLJournalManagerCore_createSnapshotWithJournal_createOnlyIfNecessary_usingManagedObjectContext_entryLimit_error___block_invoke;
    v23[3] = &unk_1E5867B20;
    id v26 = v28;
    unint64_t v27 = a6;
    v23[4] = self;
    id v24 = v14;
    id v25 = v12;
    id v22 = v16;
    char v17 = [v25 createSnapshotUsingNextPayloadBlock:v23 createOnlyIfNecessary:v10 error:&v22];
    id v18 = v22;

    _Block_object_dispose(v28, 8);
    id v19 = v18;
    if (v17)
    {
      BOOL v20 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v19 = v15;
  }
  if (a7)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a7 = v19;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_8:

  return v20;
}

id __115__PLJournalManagerCore_createSnapshotWithJournal_createOnlyIfNecessary_usingManagedObjectContext_entryLimit_error___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 < v1)
  {
    *(void *)(v2 + 24) = v3 + 1;
LABEL_4:
    unint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_nextValidPayloadWithObjectEnumerator:changedKeys:payloadClass:", *(void *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 48), "payloadClass"));
    goto LABEL_6;
  }
  unint64_t v4 = 0;
LABEL_6:
  return v4;
}

- (id)_nextValidPayloadWithObjectEnumerator:(id)a3 changedKeys:(id)a4 payloadClass:(Class)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v8 nextObject];
  if (v10)
  {
    *(void *)&long long v11 = 138543618;
    long long v21 = v11;
    do
    {
      id v12 = -[objc_class payloadAdapterForManagedObject:](a5, "payloadAdapterForManagedObject:", v10, v21);
      id v13 = [v12 payloadID];
      if (v13)
      {
        uint64_t v14 = [v12 payloadForChangedKeys:v9];
        if (v14)
        {
          id v19 = (void *)v14;

          goto LABEL_11;
        }
      }
      else
      {
        id v15 = PLMigrationGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          name = self->_name;
          char v17 = [v10 objectID];
          *(_DWORD *)buf = v21;
          id v23 = name;
          __int16 v24 = 2114;
          id v25 = v17;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@] Skipping payload for snapshot with nil payloadID for object: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v18 = [v8 nextObject];

      BOOL v10 = (void *)v18;
    }
    while (v18);
  }
  id v19 = 0;
LABEL_11:

  return v19;
}

- (void)removeHistoryToken
{
}

- (BOOL)saveHistoryToken:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLJournalManagerCore.m", 128, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [(NSURL *)self->_baseURL path];
  [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

  BOOL v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  id v16 = @"currentHistoryToken";
  v17[0] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:0];
  BOOL v13 = +[PLJournalFile writeData:v12 toURL:self->_historyTokenURL atomically:1 error:a4];

  return v13;
}

- (id)readHistoryTokenWithError:(id *)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9B8];
  v5 = [(PLJournalManagerCore *)self historyTokenURL];
  uint64_t v6 = [v4 dataWithContentsOfURL:v5 options:1 error:a3];

  if (v6)
  {
    uint64_t v13 = 0;
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:&v13 error:a3];
    id v8 = [v7 objectForKeyedSubscript:@"currentHistoryToken"];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:a3];
      BOOL v10 = v9;
      if (v9) {
        long long v11 = (void *)[v9 copy];
      }
      else {
        long long v11 = 0;
      }
    }
    else
    {
      long long v11 = 0;
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)payloadClassesForAdditionalEntityName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_payloadClassesByAdditionalEntityName objectForKeyedSubscript:a3];
}

- (id)payloadClassesForEntityName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_payloadClassesByEntityName objectForKeyedSubscript:a3];
}

- (Class)payloadClassForPayloadClassID:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_payloadClassesByPayloadClassID objectForKeyedSubscript:a3];
}

- (void)validatePayloadClassesForManagedObjectModel:(id)a3
{
  id v4 = a3;
  payloadClassesByEntityName = self->_payloadClassesByEntityName;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke;
  v7[3] = &unk_1E5876060;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)payloadClassesByEntityName enumerateKeysAndObjectsUsingBlock:v7];
}

void __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke_2;
  v4[3] = &unk_1E5867AF8;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 validatePayloadPropertiesForManagedObjectModel:*(void *)(a1 + 32)];
}

- (NSSet)payloadClassIDs
{
  return (NSSet *)self->_payloadClassIDs;
}

- (NSURL)historyTokenURL
{
  return self->_historyTokenURL;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)name
{
  return self->_name;
}

- (PLJournalManagerCore)initWithName:(id)a3 baseURL:(id)a4 payloadClasses:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PLJournalManagerCore;
  id v12 = [(PLJournalManagerCore *)&v28 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_baseURL, a4);
    uint64_t v14 = [(NSURL *)v13->_baseURL URLByAppendingPathComponent:@"HistoryToken"];
    uint64_t v15 = [v14 URLByAppendingPathExtension:@"plist"];
    historyTokenURL = v13->_historyTokenURL;
    v13->_historyTokenURL = (NSURL *)v15;

    objc_storeStrong((id *)&v13->_payloadClasses, a5);
    char v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payloadClassesByPayloadClassID = v13->_payloadClassesByPayloadClassID;
    v13->_payloadClassesByPayloadClassID = v17;

    id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payloadClassesByEntityName = v13->_payloadClassesByEntityName;
    v13->_payloadClassesByEntityName = v19;

    long long v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payloadClassesByAdditionalEntityName = v13->_payloadClassesByAdditionalEntityName;
    v13->_payloadClassesByAdditionalEntityName = v21;

    id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    payloadClassIDs = v13->_payloadClassIDs;
    v13->_payloadClassIDs = v23;

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__PLJournalManagerCore_initWithName_baseURL_payloadClasses___block_invoke;
    v26[3] = &unk_1E5867AD0;
    unint64_t v27 = v13;
    [v11 enumerateObjectsUsingBlock:v26];
  }
  return v13;
}

void __60__PLJournalManagerCore_initWithName_baseURL_payloadClasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [a2 payloadClassID];
  [v4 setObject:a2 forKeyedSubscript:v5];

  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  id v7 = [a2 entityName];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v9 = *(void **)(*(void *)(a1 + 32) + 40);
    id v10 = [a2 entityName];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [v8 addObject:a2];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = objc_msgSend(a2, "additionalEntityNames", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v17 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v16];
        if (!v17)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [*(id *)(*(void *)(a1 + 32) + 48) setObject:v17 forKeyedSubscript:v16];
        }
        [v17 addObject:a2];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 32);
  id v19 = [a2 payloadClassID];
  [v18 addObject:v19];
}

- (PLJournalManagerCore)init
{
  uint64_t v2 = (PLFeatureProcessingSnapshot *)_PFAssertFailHandler();
  [(PLFeatureProcessingSnapshot *)v2 .cxx_destruct];
  return result;
}

@end