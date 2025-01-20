@interface ICHTMLSearchIndexerDataSource
- (BOOL)isFolderWithServerShareChanged:(id)a3;
- (id)addNotesFromSubtree:(id)a3;
- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3;
- (id)dataSourceIdentifier;
- (id)newManagedObjectContext;
- (id)persistentStoreCoordinator;
- (unint64_t)indexingPriority;
- (void)contextWillSave:(id)a3;
@end

@implementation ICHTMLSearchIndexerDataSource

- (id)dataSourceIdentifier
{
  return @"Legacy";
}

- (unint64_t)indexingPriority
{
  return 1;
}

- (id)persistentStoreCoordinator
{
  return +[NoteContext persistentStoreCoordinator];
}

- (id)newManagedObjectContext
{
  return +[NoteContext newManagedObjectContext];
}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke;
  v10 = &unk_1E686E128;
  id v4 = v3;
  id v11 = v4;
  v12 = &v13;
  [v4 performBlockAndWait:&v7];
  v5 = objc_msgSend((id)v14[5], "copy", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"store != nil"];
  [v2 addObject:v3];

  id v4 = +[NoteContext visibleNotesPredicate];
  [v2 addObject:v4];

  v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v2];
  v6 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Note"];
  [v6 setResultType:1];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:1];
  v28[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v6 setSortDescriptors:v8];

  [v6 setPredicate:v5];
  v9 = *(void **)(a1 + 32);
  id v27 = 0;
  v10 = [v9 executeFetchRequest:v6 error:&v27];
  id v11 = v27;
  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3();
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Store"];

  [v13 setResultType:1];
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account.didChooseToMigrate != YES"];
  [v13 setPredicate:v14];

  uint64_t v15 = *(void **)(a1 + 32);
  id v26 = 0;
  v16 = [v15 executeFetchRequest:v13 error:&v26];
  id v17 = v26;
  if (v17)
  {
    id v18 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2();
    }
  }
  v19 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Account"];

  [v19 setResultType:1];
  v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"didChooseToMigrate != YES"];
  [v19 setPredicate:v20];

  v21 = *(void **)(a1 + 32);
  id v25 = 0;
  v22 = [v21 executeFetchRequest:v19 error:&v25];
  id v23 = v25;
  if (v23)
  {
    v24 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1();
    }
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v10);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v16);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v22);
}

- (void)contextWillSave:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICHTMLSearchIndexerDataSource;
  [(ICBaseSearchIndexerDataSource *)&v33 contextWillSave:v4];
  v5 = [v4 object];
  v6 = [v5 persistentStoreCoordinator];
  uint64_t v7 = [(ICHTMLSearchIndexerDataSource *)self persistentStoreCoordinator];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = [v5 updatedObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v27 = v5;
      id v28 = v4;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          uint64_t v15 = ICDynamicCast();
          if (v15)
          {
            v16 = [v14 changedValues];
            id v17 = [v16 objectForKeyedSubscript:@"didChooseToMigrate"];

            if (v17)
            {
              if ([v15 didChooseToMigrate])
              {
                id v18 = (void *)MEMORY[0x1E4F83700];
                v19 = [v15 accountIdentifier];
                LOBYTE(v18) = [v18 isAccountReindexedForMigration:v19];

                if ((v18 & 1) == 0)
                {
                  v21 = os_log_create("com.apple.notes", "SearchIndexer");
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                    -[ICHTMLSearchIndexerDataSource contextWillSave:](v15, v21);
                  }

                  v22 = (void *)MEMORY[0x1E4F83700];
                  id v23 = [v15 accountIdentifier];
                  [v22 markAccountReindexedForMigration:v23];

                  char v20 = 0;
                  goto LABEL_17;
                }
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      char v20 = 1;
LABEL_17:
      id v4 = v28;
      v5 = v27;
    }
    else
    {
      char v20 = 1;
    }

    char v24 = ICUseCoreDataCoreSpotlightIntegration();
    if ((v20 & 1) == 0 && (v24 & 1) == 0)
    {
      id v25 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[ICHTMLSearchIndexerDataSource contextWillSave:](v25);
      }

      [(ICBaseSearchIndexerDataSource *)self setNeedsReindexing:1];
      id v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v26 postNotificationName:*MEMORY[0x1E4F836B8] object:self];
    }
  }
}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  return 0;
}

- (id)addNotesFromSubtree:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error fetching HTML accounts: %@", v2, v3, v4, v5, v6);
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error fetching HTML folders: %@", v2, v3, v4, v5, v6);
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error fetching HTML notes: %@", v2, v3, v4, v5, v6);
}

- (void)contextWillSave:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1CFDA4000, log, OS_LOG_TYPE_DEBUG, "A legacy account's migration state changed, so let's re-index everything.", v1, 2u);
}

- (void)contextWillSave:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 accountIdentifier];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1CFDA4000, a2, OS_LOG_TYPE_DEBUG, "legacy account %@ migration state changed to YES, so let's re-index everything.", v4, 0xCu);
}

@end