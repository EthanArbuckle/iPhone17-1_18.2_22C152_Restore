@interface WFCoreDataCollection
+ (id)descriptorFetchRequest;
+ (id)fetchRequest;
+ (id)recordPropertyMap;
- (BOOL)isFolder;
- (NSArray)collectionOrdering;
- (NSArray)shortcutOrdering;
- (NSOrderedSet)deserializedLastRemoteCollectionOrdering;
- (NSOrderedSet)deserializedLastRemoteCollectionOrderingSubset;
- (NSOrderedSet)deserializedLastRemoteShortcutOrdering;
- (NSOrderedSet)deserializedLastRemoteShortcutOrderingSubset;
- (WFWorkflowIcon)workflowIcon;
- (id)descriptor;
- (void)setCollectionOrdering:(id)a3;
- (void)setDeserializedLastRemoteCollectionOrdering:(id)a3;
- (void)setDeserializedLastRemoteCollectionOrderingSubset:(id)a3;
- (void)setDeserializedLastRemoteShortcutOrdering:(id)a3;
- (void)setDeserializedLastRemoteShortcutOrderingSubset:(id)a3;
- (void)setShortcutOrdering:(id)a3;
- (void)setWorkflowIcon:(id)a3;
@end

@implementation WFCoreDataCollection

- (WFWorkflowIcon)workflowIcon
{
  v2 = [(WFCoreDataCollection *)self icon];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB4A50]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v2, "backgroundColorValue"), (unsigned __int16)objc_msgSend(v2, "glyphNumber"), 0);

  return (WFWorkflowIcon *)v3;
}

- (id)descriptor
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDataCollection *)self identifier];

  if (v3)
  {
    v4 = [(WFCoreDataCollection *)self workflowIcon];
    if (v4)
    {
      v5 = [(WFCoreDataCollection *)self workflowIcon];
      uint64_t v6 = [v5 glyphCharacter];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4FB4A28] defaultGlyphCharacter];
    }

    uint64_t v13 = [(WFCoreDataCollection *)self name];
    v14 = (void *)v13;
    v15 = &stru_1F229A4D8;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    id v17 = objc_alloc(MEMORY[0x1E4FB4A28]);
    v18 = [(WFCoreDataCollection *)self identifier];
    v12 = objc_msgSend(v17, "initWithIdentifier:isFolder:name:glyphCharacter:isDeleted:", v18, -[WFCoreDataCollection isFolder](self, "isFolder"), v16, v6, -[WFCoreDataCollection tombstoned](self, "tombstoned"));
  }
  else
  {
    v7 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = [(WFCoreDataCollection *)self name];
      v9 = [(WFCoreDataCollection *)self parents];
      v10 = [(WFCoreDataCollection *)self collections];
      v11 = [(WFCoreDataCollection *)self shortcuts];
      int v20 = 136316674;
      v21 = "-[WFCoreDataCollection(RecordStorage) descriptor]";
      __int16 v22 = 2114;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = v9;
      __int16 v26 = 2114;
      v27 = v10;
      __int16 v28 = 2114;
      v29 = v11;
      __int16 v30 = 2050;
      uint64_t v31 = [(WFCoreDataCollection *)self lastSyncedHash];
      __int16 v32 = 1026;
      int v33 = [(WFCoreDataCollection *)self tombstoned];
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Trying to create a descriptor for a collection with nil identifier, name = %{public}@, parents = %{public}@, collections = %{public}@, shortcuts = %{public}@, lastSyncedHash = %{public}lld, tombstoned = %{public}d", (uint8_t *)&v20, 0x44u);
    }
    v12 = 0;
  }
  return v12;
}

- (BOOL)isFolder
{
  v3 = [(WFCoreDataCollection *)self identifier];
  if (v3)
  {
    v4 = WFGetBuiltInCollectionIdentifiers(1);
    v5 = [(WFCoreDataCollection *)self identifier];
    char v6 = [v4 containsObject:v5];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (id)descriptorFetchRequest
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  v7[0] = @"identifier";
  v7[1] = @"name";
  v7[2] = @"icon";
  v7[3] = @"tombstoned";
  v7[4] = @"lastSyncedEncryptedSchemaVersion";
  v7[5] = @"wantedEncryptedSchemaVersion";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  [v2 setPropertiesToFetch:v3];

  v6[0] = @"icon";
  v6[1] = @"parents";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Collection"];
}

- (void)setDeserializedLastRemoteCollectionOrderingSubset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [a3 array];
    id v11 = 0;
    char v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      v10 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteCollectionOrderingSubset:]";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote collection ordering subset into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    [(WFCoreDataCollection *)v8 setLastRemoteCollectionOrderingSubsetData:v9];
  }
  else
  {
    [(WFCoreDataCollection *)self setLastRemoteCollectionOrderingSubsetData:0];
  }
}

- (NSOrderedSet)deserializedLastRemoteCollectionOrderingSubset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDataCollection *)self lastRemoteCollectionOrderingSubsetData];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [(WFCoreDataCollection *)self lastRemoteCollectionOrderingSubsetData];
    id v10 = 0;
    char v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    }
    else
    {

      char v6 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteCollectionOrderingSubset]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote collection ordering subset from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteCollectionOrdering:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [a3 array];
    id v11 = 0;
    char v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      id v10 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteCollectionOrdering:]";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote collection ordering into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    [(WFCoreDataCollection *)v8 setLastRemoteCollectionOrderingData:v9];
  }
  else
  {
    [(WFCoreDataCollection *)self setLastRemoteCollectionOrderingData:0];
  }
}

- (NSOrderedSet)deserializedLastRemoteCollectionOrdering
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDataCollection *)self lastRemoteCollectionOrderingData];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [(WFCoreDataCollection *)self lastRemoteCollectionOrderingData];
    id v10 = 0;
    char v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    }
    else
    {

      char v6 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteCollectionOrdering]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote collection ordering from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteShortcutOrderingSubset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [a3 array];
    id v11 = 0;
    char v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      id v10 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteShortcutOrderingSubset:]";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote shortcut ordering subset into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    [(WFCoreDataCollection *)v8 setLastRemoteShortcutOrderingSubsetData:v9];
  }
  else
  {
    [(WFCoreDataCollection *)self setLastRemoteShortcutOrderingSubsetData:0];
  }
}

- (NSOrderedSet)deserializedLastRemoteShortcutOrderingSubset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDataCollection *)self lastRemoteShortcutOrderingSubsetData];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [(WFCoreDataCollection *)self lastRemoteShortcutOrderingSubsetData];
    id v10 = 0;
    char v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    }
    else
    {

      char v6 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteShortcutOrderingSubset]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote shortcut ordering subset from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteShortcutOrdering:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [a3 array];
    id v11 = 0;
    char v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      id v10 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteShortcutOrdering:]";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote shortcut ordering into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    [(WFCoreDataCollection *)v8 setLastRemoteShortcutOrderingData:v9];
  }
  else
  {
    [(WFCoreDataCollection *)self setLastRemoteShortcutOrderingData:0];
  }
}

- (NSOrderedSet)deserializedLastRemoteShortcutOrdering
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDataCollection *)self lastRemoteShortcutOrderingData];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [(WFCoreDataCollection *)self lastRemoteShortcutOrderingData];
    id v10 = 0;
    char v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    }
    else
    {

      char v6 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteShortcutOrdering]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote shortcut ordering from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setCollectionOrdering:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    v5 = [(WFCoreDataCollection *)self managedObjectContext];
    char v6 = v9;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFCoreDataWorkflow.m", 696, @"Invalid parameter not satisfying: %@", @"collectionOrdering" object file lineNumber description];

    v5 = [(WFCoreDataCollection *)self managedObjectContext];
    char v6 = 0;
  }
  id v7 = WFCoreDataCollectionsWithIdentifiers(v6, 0, v5);
  [(WFCoreDataCollection *)self setCollections:v7];
}

- (NSArray)collectionOrdering
{
  return (NSArray *)WFOrderedSetFromOrderedRelationshipProperty(self, @"collections", @"identifier");
}

- (void)setShortcutOrdering:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFCoreDataWorkflow.m", 687, @"Invalid parameter not satisfying: %@", @"shortcutOrdering" object file lineNumber description];
  }
  v27 = self;
  char v6 = [(WFCoreDataCollection *)self managedObjectContext];
  id v7 = v5;
  v8 = +[WFCoreDataWorkflow fetchRequest];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"workflowID", v7];
  [v8 setPredicate:v9];

  [v8 setReturnsObjectsAsFaults:0];
  id v10 = [v6 executeFetchRequest:v8 error:0];
  id v11 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v18 = [v17 workflowID];
        [v11 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  v19 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v7;
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
        v25 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        if (v25) {
          [v19 addObject:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v22);
  }

  [(WFCoreDataCollection *)v27 setShortcuts:v19];
}

- (NSArray)shortcutOrdering
{
  return (NSArray *)WFOrderedSetFromOrderedRelationshipProperty(self, @"shortcuts", @"workflowID");
}

- (void)setWorkflowIcon:(id)a3
{
  id v9 = a3;
  v4 = [(WFCoreDataCollection *)self icon];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C0A8];
    v8 = [(WFCoreDataCollection *)self managedObjectContext];
    id v6 = [v7 insertNewObjectForEntityForName:@"ShortcutIcon" inManagedObjectContext:v8];
  }
  if (v9)
  {
    objc_msgSend(v6, "setBackgroundColorValue:", objc_msgSend(v9, "backgroundColorValue"));
    objc_msgSend(v6, "setGlyphNumber:", objc_msgSend(v9, "glyphCharacter"));
  }
  [(WFCoreDataCollection *)self setIcon:v6];
}

+ (id)recordPropertyMap
{
  v5[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"icon";
  v4[1] = @"deleted";
  v5[0] = @"workflowIcon";
  v5[1] = @"tombstoned";
  v4[2] = @"lastRemoteShortcutOrdering";
  v4[3] = @"lastRemoteShortcutOrderingSubset";
  v5[2] = @"deserializedLastRemoteShortcutOrdering";
  v5[3] = @"deserializedLastRemoteShortcutOrderingSubset";
  v4[4] = @"lastRemoteCollectionOrdering";
  v4[5] = @"lastRemoteCollectionOrderingSubset";
  v5[4] = @"deserializedLastRemoteCollectionOrdering";
  v5[5] = @"deserializedLastRemoteCollectionOrderingSubset";
  v4[6] = @"wantedEncryptedSchemaVersion";
  v4[7] = @"lastSyncedEncryptedSchemaVersion";
  v5[6] = @"wantedEncryptedSchemaVersion";
  v5[7] = @"lastSyncedEncryptedSchemaVersion";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

@end