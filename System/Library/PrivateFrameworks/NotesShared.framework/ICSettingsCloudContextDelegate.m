@interface ICSettingsCloudContextDelegate
- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4;
- (BOOL)deleteCloudObject:(id)a3;
- (ICSettingsCloudContextDelegate)init;
- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4;
- (id)backgroundContextForCloudContext:(id)a3;
- (id)persistentStoreCoordinatorForCloudContext:(id)a3;
- (id)viewContextForCloudContext:(id)a3;
- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5;
@end

@implementation ICSettingsCloudContextDelegate

- (ICSettingsCloudContextDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICSettingsCloudContextDelegate;
  return [(ICSettingsCloudContextDelegate *)&v3 init];
}

- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[ICCloudContext notesZoneID];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    v11 = +[ICNoteContext sharedContext];
    v12 = [v11 snapshotManagedObjectContext];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke;
    v23[3] = &unk_1E64A4500;
    v13 = &v24;
    v14 = (id *)v25;
    id v24 = v8;
    v25[0] = v12;
    v25[1] = self;
    id v15 = v12;
    [v15 performBlockAndWait:v23];
LABEL_5:

    goto LABEL_6;
  }
  v16 = +[ICCloudContext metadataZoneID];
  int v17 = [v7 isEqual:v16];

  if (v17)
  {
    v18 = +[ICNoteContext sharedContext];
    v19 = [v18 managedObjectContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_15;
    v20[3] = &unk_1E64A4218;
    v13 = &v21;
    v14 = &v22;
    id v21 = v8;
    v22 = v18;
    id v15 = v18;
    [v19 performBlock:v20];

    goto LABEL_5;
  }
LABEL_6:
}

void __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  objc_super v3 = +[ICAccount accountWithIdentifier:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  v4 = [v3 allChildObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v9 isDeletable])
        {
          [*(id *)(a1 + 48) deleteCloudObject:v9];
        }
        else
        {
          [v9 clearServerRecords];
          [v9 setInCloud:0];
          [v9 updateChangeCountWithReason:@"User deleted record zone"];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  int v10 = [v3 defaultFolder];

  if (!v10)
  {
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_cold_2((uint64_t *)(a1 + 32), v11);
    }
  }
  if ([*(id *)(a1 + 40) hasChanges])
  {
    v12 = *(void **)(a1 + 40);
    id v16 = 0;
    char v13 = [v12 save:&v16];
    id v14 = v16;
    if ((v13 & 1) == 0)
    {
      id v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_cold_1(v2, (uint64_t)v14, v15);
      }
    }
  }
}

void __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_15(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = [*(id *)(a1 + 40) managedObjectContext];
  objc_super v3 = +[ICAccount accountWithIdentifier:v1 context:v2];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [v3 deviceMigrationStates];
  uint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9++) deleteFromLocalDatabase];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v10 = objc_msgSend(v3, "legacyTombstones", 0);
  v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) deleteFromLocalDatabase];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  +[ICNoteContext setLegacyNotesDisabled:0];
  [v3 setNeedsToBeFetchedFromCloud:1];
}

- (BOOL)deleteCloudObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = objc_msgSend(v4, "objectsToBeDeletedBeforeThisObject", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (![(ICSettingsCloudContextDelegate *)self deleteCloudObject:*(void *)(*((void *)&v12 + 1) + 8 * i)])
          {

            BOOL v10 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [v4 deleteFromLocalDatabase];
  }
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend(v6, "ic_loggingDescription");
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    long long v22 = v9;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %@: %@", buf, 0x16u);
  }
  BOOL v10 = +[ICNoteContext sharedContext];
  v11 = [v10 snapshotManagedObjectContext];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__ICSettingsCloudContextDelegate_cloudContext_sharedZoneWasDeleted_accountID___block_invoke;
  v15[3] = &unk_1E64A4500;
  id v16 = v6;
  id v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v6;
  [v13 performBlockAndWait:v15];
}

void __78__ICSettingsCloudContextDelegate_cloudContext_sharedZoneWasDeleted_accountID___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28F60];
  objc_super v3 = [*(id *)(a1 + 32) ownerName];
  uint64_t v4 = [v2 predicateWithFormat:@"zoneOwnerName == %@", v3];

  v27 = (void *)v4;
  uint64_t v5 = +[ICCloudSyncingObject ic_objectsMatchingPredicate:v4 context:*(void *)(a1 + 40)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = "com.apple.notes";
    uint64_t v9 = "Cloud";
    uint64_t v29 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        id v12 = [v11 recordID];
        id v13 = [v12 zoneID];
        int v14 = [v13 isEqual:*(void *)(a1 + 32)];

        long long v15 = os_log_create(v8, v9);
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            id v17 = [v11 shortLoggingDescription];
            id v18 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138412546;
            v35 = v17;
            __int16 v36 = 2112;
            v37 = v18;
            _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Deleting shared %@ for accountID %@", buf, 0x16u);
          }
          [v11 deleteFromLocalDatabase];
        }
        else
        {
          if (v16)
          {
            long long v19 = [v11 shortLoggingDescription];
            id v20 = [v11 recordID];
            __int16 v21 = [v20 zoneID];
            objc_msgSend(v21, "ic_loggingDescription");
            long long v22 = v9;
            uint64_t v23 = v8;
            v25 = id v24 = v5;
            uint64_t v26 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138412802;
            v35 = v19;
            __int16 v36 = 2112;
            v37 = v25;
            __int16 v38 = 2112;
            uint64_t v39 = v26;
            _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Not deleting shared %@ in wrong zone %@ for account ID %@", buf, 0x20u);

            uint64_t v5 = v24;
            uint64_t v8 = v23;
            uint64_t v9 = v22;
            uint64_t v7 = v28;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "ic_save");
}

- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__9;
  id v20 = __Block_byref_object_dispose__9;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __81__ICSettingsCloudContextDelegate_accountIDsForCloudContext_managedObjectContext___block_invoke;
  id v13 = &unk_1E64A44A8;
  id v7 = v6;
  id v14 = v7;
  long long v15 = &v16;
  [v7 performBlockAndWait:&v10];
  uint64_t v8 = objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __81__ICSettingsCloudContextDelegate_accountIDsForCloudContext_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[ICAccount allCloudKitAccountsInContext:*(void *)(a1 + 32)];
  if ([v2 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "identifier", (void)v10);
          objc_msgSend(v8, "ic_addNonNilObject:", v9);

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (id)persistentStoreCoordinatorForCloudContext:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  uint64_t v4 = [v3 persistentStoreCoordinator];

  return v4;
}

- (id)viewContextForCloudContext:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  uint64_t v4 = [v3 managedObjectContext];

  return v4;
}

- (id)backgroundContextForCloudContext:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  uint64_t v4 = [v3 workerManagedObjectContext];

  return v4;
}

- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4
{
  uint64_t v5 = +[ICNoteContext sharedContext];
  LOBYTE(a4) = [v5 hasContextOptions:a4];

  return a4;
}

void __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error saving after notes zone deleted by user for account ID %@: %@", (uint8_t *)&v4, 0x16u);
}

void __87__ICSettingsCloudContextDelegate_cloudContext_userDidDeleteRecordZoneWithID_accountID___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error recreating default folder for CloudKit account after the user purged the zone for account ID %@", (uint8_t *)&v3, 0xCu);
}

@end