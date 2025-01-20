@interface NSManagedObjectContext(IC)
- (BOOL)ic_isMainThreadContext;
- (id)ic_debugName;
- (id)ic_objectIDFromURL:()IC;
- (id)ic_objectsWithIDs:()IC;
- (uint64_t)ic_existingObjectWithID:()IC;
- (uint64_t)ic_save;
- (uint64_t)ic_saveWithLogDescription:()IC;
- (uint64_t)ic_saveWithLogDescription:()IC arguments:;
- (void)ic_performBlock:()IC andPerformBlockOnMainThread:;
- (void)ic_performBlockAndWait:()IC andPerformBlockAndWaitOnMainThread:;
- (void)ic_refreshObject:()IC mergeChanges:;
- (void)setIc_debugName:()IC;
@end

@implementation NSManagedObjectContext(IC)

- (uint64_t)ic_existingObjectWithID:()IC
{
  return objc_msgSend(MEMORY[0x263EFF280], "ic_existingObjectWithID:context:", a3, a1);
}

- (uint64_t)ic_saveWithLogDescription:()IC
{
  return objc_msgSend(a1, "ic_saveWithLogDescription:arguments:", a3, &a9);
}

- (uint64_t)ic_saveWithLogDescription:()IC arguments:
{
  id v6 = a3;
  if ([v6 length]) {
    v7 = (void *)[[NSString alloc] initWithFormat:v6 arguments:a4];
  }
  else {
    v7 = 0;
  }
  v8 = [a1 persistentStoreCoordinator];
  v9 = [v8 persistentStores];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    if ([a1 hasChanges])
    {
      id v15 = 0;
      uint64_t v11 = [a1 save:&v15];
      v12 = v15;
      if (v11)
      {
        v13 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:]();
        }
      }
      else
      {
        +[ICTelemetryManager postBasicEvent:5];
        v13 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:]();
        }
      }
    }
    else
    {
      v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:].cold.4();
      }
      uint64_t v11 = 1;
    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:]();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Not saving context because it has no changes {description: %@}", v1, 0xCu);
}

- (id)ic_objectIDFromURL:()IC
{
  id v4 = a3;
  v5 = [a1 persistentStoreCoordinator];
  id v6 = objc_msgSend(v5, "ic_managedObjectIDForURIRepresentation:", v4);

  return v6;
}

- (void)ic_refreshObject:()IC mergeChanges:
{
  id v6 = a3;
  v7 = [a1 persistentStoreCoordinator];
  v8 = [v7 persistentStores];
  v9 = [v6 objectID];
  uint64_t v10 = [v9 persistentStore];
  int v11 = [v8 containsObject:v10];

  if (v11)
  {
    [a1 refreshObject:v6 mergeChanges:a4];
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[NSManagedObjectContext(IC) ic_refreshObject:mergeChanges:](v6, v12);
    }
  }
}

- (id)ic_debugName
{
  return objc_getAssociatedObject(a1, (const void *)ICNSManagedObjectContextDebugNameKey);
}

- (void)setIc_debugName:()IC
{
}

- (BOOL)ic_isMainThreadContext
{
  return [a1 concurrencyType] == 2;
}

- (uint64_t)ic_save
{
  return objc_msgSend(a1, "ic_saveWithLogDescription:", 0);
}

- (void)ic_performBlock:()IC andPerformBlockOnMainThread:
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__NSManagedObjectContext_IC__ic_performBlock_andPerformBlockOnMainThread___block_invoke;
  v10[3] = &unk_2640CE1E0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 performBlock:v10];
}

- (void)ic_performBlockAndWait:()IC andPerformBlockAndWaitOnMainThread:
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__NSManagedObjectContext_IC__ic_performBlockAndWait_andPerformBlockAndWaitOnMainThread___block_invoke;
  v9[3] = &unk_2640CDC70;
  id v10 = v6;
  id v7 = v6;
  id v8 = a4;
  [a1 performBlockAndWait:v9];
  performBlockOnMainThreadAndWait(v8);
}

- (id)ic_objectsWithIDs:()IC
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "objectWithID:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_20C263000, v0, OS_LOG_TYPE_FAULT, "Cannot save context because it doesn't have any persistent stores {description: %@}", v1, 0xCu);
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Saved context {description: %@}", v1, 0xCu);
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20C263000, v1, OS_LOG_TYPE_ERROR, "Cannot save context {error: %@, description: %@}", v2, 0x16u);
}

- (void)ic_refreshObject:()IC mergeChanges:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 objectID];
  uint64_t v5 = [a1 objectID];
  id v6 = [v5 persistentStore];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Not refreshing object because persistent store is not reachable {objectID: %@, persistentStore: %@}", (uint8_t *)&v7, 0x16u);
}

@end