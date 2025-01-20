@interface WFCoreDataCollectionModel
- (BOOL)isDeleted;
- (BOOL)isFolder;
- (BOOL)isRootCollection;
- (NSData)cloudKitFolderRecordMetadata;
- (NSData)cloudKitOrderingRecordMetadata;
- (NSManagedObject)managedObject;
- (NSOrderedSet)collectionOrdering;
- (NSOrderedSet)lastRemoteCollectionOrdering;
- (NSOrderedSet)lastRemoteCollectionOrderingSubset;
- (NSOrderedSet)lastRemoteShortcutOrdering;
- (NSOrderedSet)lastRemoteShortcutOrderingSubset;
- (NSOrderedSet)shortcutOrdering;
- (NSString)name;
- (NSString)workflowType;
- (WFCoreDataCollection)coreDataCollection;
- (WFCoreDataCollectionModel)initWithManagedObject:(id)a3 database:(id)a4;
- (WFDatabase)database;
- (WFWorkflowIcon)icon;
- (id)identifier;
- (int64_t)lastSyncedEncryptedSchemaVersion;
- (int64_t)lastSyncedHash;
- (int64_t)wantedEncryptedSchemaVersion;
- (void)setCloudKitFolderRecordMetadata:(id)a3;
- (void)setCloudKitOrderingRecordMetadata:(id)a3;
- (void)setCollectionOrdering:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLastRemoteCollectionOrdering:(id)a3;
- (void)setLastRemoteCollectionOrderingSubset:(id)a3;
- (void)setLastRemoteShortcutOrdering:(id)a3;
- (void)setLastRemoteShortcutOrderingSubset:(id)a3;
- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3;
- (void)setLastSyncedHash:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setShortcutOrdering:(id)a3;
- (void)setWantedEncryptedSchemaVersion:(int64_t)a3;
@end

@implementation WFCoreDataCollectionModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowType, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_coreDataCollection, 0);
}

- (NSString)workflowType
{
  return self->_workflowType;
}

- (BOOL)isRootCollection
{
  return self->_isRootCollection;
}

- (WFDatabase)database
{
  return self->_database;
}

- (WFCoreDataCollection)coreDataCollection
{
  return self->_coreDataCollection;
}

- (void)setCloudKitOrderingRecordMetadata:(id)a3
{
}

- (NSData)cloudKitOrderingRecordMetadata
{
  return (NSData *)[(WFCoreDataCollection *)self->_coreDataCollection cloudKitOrderingRecordMetadata];
}

- (void)setCloudKitFolderRecordMetadata:(id)a3
{
}

- (NSData)cloudKitFolderRecordMetadata
{
  return (NSData *)[(WFCoreDataCollection *)self->_coreDataCollection cloudKitFolderRecordMetadata];
}

- (void)setShortcutOrdering:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFCoreDataCollectionModel *)self shortcutOrdering];
  char v6 = [v4 isEqualToOrderedSet:v5];

  if ((v6 & 1) == 0)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(WFCoreDataCollectionModel *)self identifier];
      *(_DWORD *)buf = 136315650;
      v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
      __int16 v29 = 2112;
      v30 = v8;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting shortcut ordering for %@: %@", buf, 0x20u);
    }
    database = self->_database;
    if (database) {
      database = (WFDatabase *)database->_library;
    }
    v10 = database;
    BOOL v11 = [(WFCoreDataCollectionModel *)self isFolder];
    v12 = [v4 array];
    v13 = [(WFCoreDataCollectionModel *)self identifier];
    if (v11)
    {
      id v26 = 0;
      char v14 = [(WFDatabase *)v10 setShortcutOrdering:v12 forFolderIdentifier:v13 error:&v26];
      id v15 = v26;

      if ((v14 & 1) == 0)
      {
        v16 = getWFGeneralLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [(WFCoreDataCollectionModel *)self identifier];
          *(_DWORD *)buf = 136315650;
          v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
          __int16 v29 = 2112;
          v30 = v17;
          __int16 v31 = 2112;
          id v32 = v15;
          v18 = "%s Unable to set shortcut ordering for folder: %@ %@";
LABEL_13:
          _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0x20u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v25 = 0;
      char v19 = [(WFDatabase *)v10 setShortcutOrdering:v12 forCollectionIdentifier:v13 error:&v25];
      id v15 = v25;

      if ((v19 & 1) == 0)
      {
        v16 = getWFGeneralLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [(WFCoreDataCollectionModel *)self identifier];
          *(_DWORD *)buf = 136315650;
          v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
          __int16 v29 = 2112;
          v30 = v17;
          __int16 v31 = 2112;
          id v32 = v15;
          v18 = "%s Unable to set shortcut ordering for collection: %@ %@";
          goto LABEL_13;
        }
LABEL_14:
      }
    }

    v20 = [(WFCoreDataCollectionModel *)self database];
    [v20 saveLibraryToDatabase:v10];

    v21 = [(WFCoreDataCollectionModel *)self database];
    id v22 = objc_alloc(MEMORY[0x1E4FB4698]);
    v23 = [(WFCoreDataCollectionModel *)self identifier];
    v24 = (void *)[v22 initWithIdentifier:v23 objectType:2];
    [v21 addPendingUpdatedDescriptor:v24];
  }
}

- (NSOrderedSet)shortcutOrdering
{
  if ([(WFCoreDataCollectionModel *)self isFolder])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB4A70]);
    id v4 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v5 = [v3 initWithFolderIdentifier:v4];
LABEL_8:
    char v6 = (void *)v5;

    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (![(WFCoreDataCollectionModel *)self isRootCollection])
  {
    v7 = [(WFCoreDataCollectionModel *)self workflowType];

    if (!v7) {
      goto LABEL_12;
    }
    id v8 = objc_alloc(MEMORY[0x1E4FB4A70]);
    id v4 = [(WFCoreDataCollectionModel *)self workflowType];
    uint64_t v5 = [v8 initWithWorkflowType:v4];
    goto LABEL_8;
  }
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:1];
  if (v6)
  {
LABEL_9:
    uint64_t v9 = [(WFCoreDataCollectionModel *)self database];
    v10 = (void *)v9;
    if (v9) {
      BOOL v11 = *(void **)(v9 + 120);
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = v11;
    v13 = [v12 shortcutIdentifiersWithQuery:v6 error:0];

    char v14 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];

    goto LABEL_13;
  }
LABEL_12:
  char v14 = objc_opt_new();
LABEL_13:
  return (NSOrderedSet *)v14;
}

- (void)setLastRemoteShortcutOrderingSubset:(id)a3
{
}

- (NSOrderedSet)lastRemoteShortcutOrderingSubset
{
  return [(WFCoreDataCollection *)self->_coreDataCollection deserializedLastRemoteShortcutOrderingSubset];
}

- (void)setLastRemoteShortcutOrdering:(id)a3
{
}

- (NSOrderedSet)lastRemoteShortcutOrdering
{
  return [(WFCoreDataCollection *)self->_coreDataCollection deserializedLastRemoteShortcutOrdering];
}

- (void)setCollectionOrdering:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFCoreDataCollectionModel *)self collectionOrdering];
  char v6 = [v4 isEqualToOrderedSet:v5];

  if ((v6 & 1) == 0 && [(WFCoreDataCollectionModel *)self isRootCollection])
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(WFCoreDataCollectionModel *)self identifier];
      *(_DWORD *)buf = 136315650;
      v63 = "-[WFCoreDataCollectionModel setCollectionOrdering:]";
      __int16 v64 = 2112;
      v65 = v8;
      __int16 v66 = 2112;
      id v67 = v4;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting collection ordering for %@: %@", buf, 0x20u);
    }
    database = self->_database;
    if (database) {
      database = (WFDatabase *)database->_library;
    }
    v10 = database;
    BOOL v11 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v45 = v4;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v58;
      v47 = v55;
      uint64_t v48 = *(void *)v58;
      id v49 = v12;
      do
      {
        uint64_t v16 = 0;
        uint64_t v50 = v14;
        do
        {
          if (*(void *)v58 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v57 + 1) + 8 * v16);
          v18 = -[WFDatabase folderWithIdentifier:error:](v10, "folderWithIdentifier:error:", v17, 0, v45, v47);
          if (v18)
          {
            [v11 addObject:v18];
          }
          else
          {
            char v19 = [(WFCoreDataCollectionModel *)self database];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke;
            v56[3] = &unk_1E6558358;
            v56[4] = self;
            v56[5] = v17;
            v20 = [v19 performOperationWithReason:@"getting collection for id" block:v56 error:0];

            if (v20)
            {
              v21 = [v20 name];
              uint64_t v22 = -[WFDatabase insertFolderWithName:icon:identifier:error:](v10, "insertFolderWithName:icon:identifier:error:", v21, [v20 glyphCharacter], v17, 0);
              v23 = v11;
              v24 = (void *)v22;
              id v25 = v23;
              [v23 addObject:v22];

              id v26 = [(WFCoreDataCollectionModel *)self database];
              v54[0] = MEMORY[0x1E4F143A8];
              v54[1] = 3221225472;
              v55[0] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_2;
              v55[1] = &unk_1E6554F10;
              v55[2] = self;
              v55[3] = v17;
              v27 = [v26 performOperationWithReason:@"getting collection ordering for id" block:v54 error:0];

              if (v27)
              {
                v28 = [v27 array];
                [(WFDatabase *)v10 setShortcutOrdering:v28 forFolderIdentifier:v17 error:0];
              }
              BOOL v11 = v25;
              uint64_t v15 = v48;
              id v12 = v49;
            }

            uint64_t v14 = v50;
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v14);
    }

    uint64_t v29 = [v11 count];
    if (v29 == [v12 count])
    {
      v30 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_3;
      v52[3] = &unk_1E6554F38;
      id v31 = v30;
      id v53 = v31;
      [v11 enumerateObjectsUsingBlock:v52];
      id v32 = [(WFCoreDataCollectionModel *)self collectionOrdering];
      char v33 = [v31 isEqualToOrderedSet:v32];

      if ((v33 & 1) == 0)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
        id v51 = 0;
        v35 = v11;
        char v36 = [(WFDatabase *)v10 moveFolders:v11 toIndexes:v34 error:&v51];
        id v37 = v51;

        if ((v36 & 1) == 0)
        {
          v38 = getWFGeneralLogObject();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = [(WFCoreDataCollectionModel *)self identifier];
            *(_DWORD *)buf = 136315650;
            v63 = "-[WFCoreDataCollectionModel setCollectionOrdering:]";
            __int16 v64 = 2112;
            v65 = v39;
            __int16 v66 = 2112;
            id v67 = v37;
            _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_ERROR, "%s Unable to set collection ordering for collection: %@ %@", buf, 0x20u);
          }
        }

        BOOL v11 = v35;
      }
    }
    v40 = [(WFCoreDataCollectionModel *)self database];
    [v40 saveLibraryToDatabase:v10];

    v41 = [(WFCoreDataCollectionModel *)self database];
    id v42 = objc_alloc(MEMORY[0x1E4FB4698]);
    v43 = [(WFCoreDataCollectionModel *)self identifier];
    v44 = (void *)[v42 initWithIdentifier:v43 objectType:2];
    [v41 addPendingUpdatedDescriptor:v44];

    id v4 = v46;
  }
}

id __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) database];
  id v3 = [v2 objectOfClass:objc_opt_class() withIdentifier:*(void *)(a1 + 40) forKey:@"identifier" createIfNecessary:0 properties:0];

  id v4 = [v3 descriptor];

  return v4;
}

id __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) database];
  id v3 = [v2 objectOfClass:objc_opt_class() withIdentifier:*(void *)(a1 + 40) forKey:@"identifier" createIfNecessary:0 properties:0];

  id v4 = [v3 deserializedLastRemoteShortcutOrdering];

  return v4;
}

void __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

- (NSOrderedSet)collectionOrdering
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(WFCoreDataCollectionModel *)self isRootCollection])
  {
    id v3 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [(WFCoreDataCollectionModel *)self database];
    uint64_t v5 = (void *)v4;
    if (v4) {
      char v6 = *(void **)(v4 + 120);
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;
    id v8 = [v7 folders];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
          [v3 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v3 = objc_opt_new();
  }
  return (NSOrderedSet *)v3;
}

- (void)setLastRemoteCollectionOrderingSubset:(id)a3
{
}

- (NSOrderedSet)lastRemoteCollectionOrderingSubset
{
  return [(WFCoreDataCollection *)self->_coreDataCollection deserializedLastRemoteCollectionOrderingSubset];
}

- (void)setLastRemoteCollectionOrdering:(id)a3
{
}

- (NSOrderedSet)lastRemoteCollectionOrdering
{
  return [(WFCoreDataCollection *)self->_coreDataCollection deserializedLastRemoteCollectionOrdering];
}

- (BOOL)isFolder
{
  if ([(WFCoreDataCollectionModel *)self isRootCollection]) {
    return 0;
  }
  uint64_t v4 = [(WFCoreDataCollectionModel *)self workflowType];
  BOOL v3 = v4 == 0;

  return v3;
}

- (BOOL)isDeleted
{
  BOOL v3 = [(WFCoreDataCollectionModel *)self isFolder];
  if (v3)
  {
    uint64_t v4 = [(WFCoreDataCollectionModel *)self database];
    uint64_t v5 = (void *)v4;
    if (v4) {
      char v6 = *(void **)(v4 + 120);
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;
    id v8 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v9 = [v7 folderWithIdentifier:v8 error:0];
    char v10 = [v9 isDeleted];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return [(WFCoreDataCollection *)self->_coreDataCollection lastSyncedEncryptedSchemaVersion];
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return [(WFCoreDataCollection *)self->_coreDataCollection wantedEncryptedSchemaVersion];
}

- (void)setLastSyncedHash:(int64_t)a3
{
}

- (int64_t)lastSyncedHash
{
  return [(WFCoreDataCollection *)self->_coreDataCollection lastSyncedHash];
}

- (void)setIcon:(id)a3
{
  id v18 = a3;
  [(WFCoreDataCollection *)self->_coreDataCollection setWorkflowIcon:v18];
  uint64_t v4 = [(WFCoreDataCollectionModel *)self icon];
  char v5 = [v18 isEqual:v4];

  if ((v5 & 1) == 0 && [(WFCoreDataCollectionModel *)self isFolder])
  {
    database = self->_database;
    if (database) {
      database = (WFDatabase *)database->_library;
    }
    id v7 = database;
    id v8 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v9 = [(WFDatabase *)v7 folderWithIdentifier:v8 error:0];

    char v10 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v11 = [v9 name];
    id v12 = -[WFDatabase updateFolderWithIdentifier:newName:newIcon:error:](v7, "updateFolderWithIdentifier:newName:newIcon:error:", v10, v11, [v18 glyphCharacter], 0);

    uint64_t v13 = [(WFCoreDataCollectionModel *)self database];
    [v13 saveLibraryToDatabase:v7];

    uint64_t v14 = [(WFCoreDataCollectionModel *)self database];
    id v15 = objc_alloc(MEMORY[0x1E4FB4698]);
    long long v16 = [(WFCoreDataCollectionModel *)self identifier];
    long long v17 = (void *)[v15 initWithIdentifier:v16 objectType:2];
    [v14 addPendingUpdatedDescriptor:v17];
  }
}

- (WFWorkflowIcon)icon
{
  if ([(WFCoreDataCollectionModel *)self isFolder])
  {
    uint64_t v3 = [(WFCoreDataCollectionModel *)self database];
    uint64_t v4 = (void *)v3;
    if (v3) {
      char v5 = *(void **)(v3 + 120);
    }
    else {
      char v5 = 0;
    }
    id v6 = v5;
    id v7 = [(WFCoreDataCollectionModel *)self identifier];
    id v8 = [v6 folderWithIdentifier:v7 error:0];
    uint64_t v9 = [v8 glyphCharacter];
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4A50]) initWithPaletteColor:0 glyphCharacter:v9 customImageData:0];
  return (WFWorkflowIcon *)v10;
}

- (void)setName:(id)a3
{
  id v17 = a3;
  [(WFCoreDataCollection *)self->_coreDataCollection setName:v17];
  uint64_t v4 = [(WFCoreDataCollectionModel *)self name];
  char v5 = [v17 isEqualToString:v4];

  if ((v5 & 1) == 0 && [(WFCoreDataCollectionModel *)self isFolder])
  {
    database = self->_database;
    if (database) {
      database = (WFDatabase *)database->_library;
    }
    id v7 = database;
    id v8 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v9 = [(WFDatabase *)v7 folderWithIdentifier:v8 error:0];

    char v10 = [(WFCoreDataCollectionModel *)self identifier];
    uint64_t v11 = -[WFDatabase updateFolderWithIdentifier:newName:newIcon:error:](v7, "updateFolderWithIdentifier:newName:newIcon:error:", v10, v17, [v9 glyphCharacter], 0);

    id v12 = [(WFCoreDataCollectionModel *)self database];
    [v12 saveLibraryToDatabase:v7];

    uint64_t v13 = [(WFCoreDataCollectionModel *)self database];
    id v14 = objc_alloc(MEMORY[0x1E4FB4698]);
    id v15 = [(WFCoreDataCollectionModel *)self identifier];
    long long v16 = (void *)[v14 initWithIdentifier:v15 objectType:2];
    [v13 addPendingUpdatedDescriptor:v16];
  }
}

- (NSString)name
{
  if ([(WFCoreDataCollectionModel *)self isFolder])
  {
    uint64_t v3 = [(WFCoreDataCollectionModel *)self database];
    uint64_t v4 = (void *)v3;
    if (v3) {
      char v5 = *(void **)(v3 + 120);
    }
    else {
      char v5 = 0;
    }
    id v6 = v5;
    id v7 = [(WFCoreDataCollectionModel *)self identifier];
    id v8 = [v6 folderWithIdentifier:v7 error:0];
    uint64_t v9 = [v8 name];
  }
  else
  {
    uint64_t v9 = &stru_1F229A4D8;
  }
  return (NSString *)v9;
}

- (id)identifier
{
  return (id)[(WFCoreDataCollection *)self->_coreDataCollection identifier];
}

- (NSManagedObject)managedObject
{
  return (NSManagedObject *)self->_coreDataCollection;
}

- (WFCoreDataCollectionModel)initWithManagedObject:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v8 ? (uint64_t v9 = 0) : (uint64_t v9 = (void *)v8[15]),
        (id v10 = v9, v10, v10)
     && (v18.receiver = self,
         v18.super_class = (Class)WFCoreDataCollectionModel,
         uint64_t v11 = [(WFCoreDataCollectionModel *)&v18 init],
         (self = v11) != 0)))
  {
    objc_storeStrong((id *)&v11->_coreDataCollection, a3);
    objc_storeStrong((id *)&self->_database, a4);
    id v12 = [(WFCoreDataCollectionModel *)self identifier];
    self->_isRootCollection = [v12 isEqualToString:@"Root"];

    uint64_t v13 = [(WFCoreDataCollectionModel *)self identifier];
    WFWorkflowTypeForCollectionIdentifier(v13);
    id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    workflowType = self->_workflowType;
    self->_workflowType = v14;

    self = self;
    long long v16 = self;
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

@end