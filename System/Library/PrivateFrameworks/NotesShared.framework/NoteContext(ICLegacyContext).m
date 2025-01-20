@interface NoteContext(ICLegacyContext)
- (BOOL)nonEmptyNoteExistsForLegacyAccountWithObjectID:()ICLegacyContext;
- (id)allVisibleNoteObjectIDsForAccountWithObjectID:()ICLegacyContext;
- (id)allVisibleNotesForAccountWithObjectID:()ICLegacyContext;
- (id)allVisibleNotesInFolder:()ICLegacyContext;
- (id)attachmentForIdentifier:()ICLegacyContext;
- (id)existingObjectWithID:()ICLegacyContext error:;
- (id)ic_objectsWithIDs:()ICLegacyContext;
- (id)objectWithID:()ICLegacyContext;
- (uint64_t)countOfVisibleNotesForAccount:()ICLegacyContext;
- (uint64_t)countOfVisibleNotesForAccountWithObjectID:()ICLegacyContext;
- (void)performBlock:()ICLegacyContext;
- (void)performBlockAndWait:()ICLegacyContext;
- (void)reset;
@end

@implementation NoteContext(ICLegacyContext)

- (BOOL)nonEmptyNoteExistsForLegacyAccountWithObjectID:()ICLegacyContext
{
  v1 = objc_msgSend(a1, "allVisibleNotesForAccountWithObjectID:");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)allVisibleNotesForAccountWithObjectID:()ICLegacyContext
{
  id v4 = a3;
  v5 = [a1 collectionForObjectID:v4];
  if (v5)
  {
    v6 = [a1 allVisibleNotesInCollection:v5 sorted:1];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NoteContext(ICLegacyContext) allVisibleNotesForAccountWithObjectID:]((uint64_t)v4, v7);
    }

    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)allVisibleNotesInFolder:()ICLegacyContext
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteCollectionObject) != nil)", "-[NoteContext(ICLegacyContext) allVisibleNotesInFolder:]", 1, 0, @"Expected non-nil value for '%s'", "noteCollectionObject");
  }
  v6 = [a1 allVisibleNotesInCollection:v5];

  return v6;
}

- (uint64_t)countOfVisibleNotesForAccountWithObjectID:()ICLegacyContext
{
  BOOL v2 = objc_msgSend(a1, "collectionForObjectID:");
  if (!v2) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteCollectionObject) != nil)", "-[NoteContext(ICLegacyContext) countOfVisibleNotesForAccountWithObjectID:]", 1, 0, @"Expected non-nil value for '%s'", "noteCollectionObject");
  }
  uint64_t v3 = [a1 countOfVisibleNotesInCollection:v2];

  return v3;
}

- (uint64_t)countOfVisibleNotesForAccount:()ICLegacyContext
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((accountObject) != nil)", "-[NoteContext(ICLegacyContext) countOfVisibleNotesForAccount:]", 1, 0, @"Expected non-nil value for '%s'", "accountObject");
  }
  uint64_t v6 = [a1 countOfVisibleNotesInCollection:v5];

  return v6;
}

- (id)allVisibleNoteObjectIDsForAccountWithObjectID:()ICLegacyContext
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 collectionForObjectID:v4];
  if (v5)
  {
    os_log_t v6 = (os_log_t)[a1 newFetchRequestForNotes];
    v7 = [MEMORY[0x1E4F82D78] visibleNotesPredicate];
    v21[0] = v7;
    v8 = [v5 predicateForNotes];
    v21[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

    v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];
    [v6 setPredicate:v10];

    [v6 setResultType:1];
    v11 = [a1 managedObjectContext];
    id v18 = 0;
    v12 = [v11 executeFetchRequest:v6 error:&v18];
    id v13 = v18;

    if (v13)
    {
      v14 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(NoteContext(ICLegacyContext) *)(uint64_t)v4 allVisibleNoteObjectIDsForAccountWithObjectID:v14];
      }
    }
  }
  else
  {
    os_log_t v6 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Collection is nil fetching note IDs for account %@", buf, 0xCu);
    }
    v12 = 0;
  }

  if (v12) {
    v15 = v12;
  }
  else {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v16 = v15;

  return v16;
}

- (void)performBlock:()ICLegacyContext
{
  id v4 = a3;
  v5 = [a1 managedObjectContext];
  uint64_t v6 = [v5 concurrencyType];

  if (v6)
  {
    id v8 = [a1 managedObjectContext];
    [v8 performBlock:v4];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NoteContext(ICLegacyContext) performBlock:]();
    }

    v4[2](v4);
  }
}

- (void)performBlockAndWait:()ICLegacyContext
{
  id v4 = a3;
  v5 = [a1 managedObjectContext];
  uint64_t v6 = [v5 concurrencyType];

  if (v6)
  {
    id v8 = [a1 managedObjectContext];
    [v8 performBlockAndWait:v4];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NoteContext(ICLegacyContext) performBlockAndWait:]();
    }

    v4[2](v4);
  }
}

- (id)objectWithID:()ICLegacyContext
{
  id v4 = a3;
  v5 = [a1 managedObjectContext];
  uint64_t v6 = [v5 objectWithID:v4];

  return v6;
}

- (id)existingObjectWithID:()ICLegacyContext error:
{
  id v6 = a3;
  v7 = [a1 managedObjectContext];
  id v8 = [v7 existingObjectWithID:v6 error:a4];

  return v8;
}

- (id)ic_objectsWithIDs:()ICLegacyContext
{
  id v4 = a3;
  v5 = [a1 managedObjectContext];
  id v6 = objc_msgSend(v5, "ic_objectsWithIDs:", v4);

  return v6;
}

- (void)reset
{
  id v1 = [a1 managedObjectContext];
  [v1 reset];
}

- (id)attachmentForIdentifier:()ICLegacyContext
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"NoteAttachment"];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(contentID ==[c] %@)", v4];
  [v5 setPredicate:v6];
  v7 = [a1 managedObjectContext];
  id v13 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v13];
  id v9 = v13;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(NoteContext(ICLegacyContext) *)(uint64_t)v4 attachmentForIdentifier:v10];
    }
  }
  v11 = [v8 firstObject];

  return v11;
}

- (void)allVisibleNotesForAccountWithObjectID:()ICLegacyContext .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[NoteContext(ICLegacyContext) allVisibleNotesForAccountWithObjectID:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "%s: noteCollectionObject is unexpectedly nil, objectID = %@", (uint8_t *)&v2, 0x16u);
}

- (void)allVisibleNoteObjectIDsForAccountWithObjectID:()ICLegacyContext .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error fetching visible note object IDs for account %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)performBlock:()ICLegacyContext .cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v1, v2, "Trying to call performBlock on a legacy context with confinement concurrency type: %@", v3, v4, v5, v6, 2u);
}

- (void)performBlockAndWait:()ICLegacyContext .cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v1, v2, "Trying to call performBlockAndWait on a legacy context with confinement concurrency type: %@", v3, v4, v5, v6, 2u);
}

- (void)attachmentForIdentifier:()ICLegacyContext .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a2 userInfo];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  v10 = a2;
  __int16 v11 = 2112;
  v12 = v6;
  _os_log_fault_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_FAULT, "Error getting attachment with content ID (%@):  %@, %@", (uint8_t *)&v7, 0x20u);
}

@end