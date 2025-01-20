@interface PLFolderJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildCollectionUUIDs:(id)a4 includePendingChanges:(BOOL)a5;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)isProjectAlbumRootFolder;
- (BOOL)isRootFolder;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSOrderedSet)childCollectionUUIDs;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4;
@end

@implementation PLFolderJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4 = a3;
  v5 = +[PLManagedFolder validKindsForPersistence];
  v6 = [v4 objectForKeyedSubscript:@"kind"];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildCollectionUUIDs:(id)a4 includePendingChanges:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 childCollections];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__PLFolderJournalEntryPayload_updateChildrenOrderingInFolder_usingChildCollectionUUIDs_includePendingChanges___block_invoke;
  v19[3] = &unk_1E58722C8;
  id v11 = v9;
  id v20 = v11;
  BOOL v22 = a5;
  id v12 = v8;
  id v21 = v12;
  v13 = [a1 sortedObjectsToAddWithUUIDs:v11 uuidKey:@"uuid" andExistingObjects:v10 fetchBlock:v19];

  if (v13)
  {
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v12 uuid];
      *(_DWORD *)buf = 138412546;
      *(void *)v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(void *)&v24[10] = v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Updating children in folder %@ to match persisted UUID ordering from %@", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];
    [v12 removeChildCollections:v16];
    [v12 addChildCollections:v16];
  }
  else
  {
    if (![v11 count]) {
      goto LABEL_6;
    }
    v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v11 count];
      v18 = [v12 uuid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v24 = v17;
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Persisted child collection UUIDs (%d total) match database ordering for folder %@", buf, 0x12u);
    }
  }

LABEL_6:
}

id __110__PLFolderJournalEntryPayload_updateChildrenOrderingInFolder_usingChildCollectionUUIDs_includePendingChanges___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLGenericAlbum entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [*(id *)(a1 + 32) array];
  v7 = [v5 predicateWithFormat:@"uuid in %@", v6];
  [v4 setPredicate:v7];

  if (*(unsigned char *)(a1 + 48)) {
    [v4 setIncludesPendingChanges:1];
  }
  id v8 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v11 = 0;
  id v9 = [v8 executeFetchRequest:v4 error:&v11];

  return v9;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (id)payloadClassID
{
  return +[PLManagedFolder entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLFolderJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_64663 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_64663, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_64664;
  return v2;
}

void __67__PLFolderJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_64664;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_64664 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLFolderJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_64665 != -1) {
    dispatch_once(&modelProperties_onceToken_64665, block);
  }
  v2 = (void *)modelProperties_modelProperties_64666;
  return v2;
}

uint64_t __46__PLFolderJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_64666;
  modelProperties_modelProperties_64666 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_64666;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)modelPropertiesDescription
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLFolderJournalEntryPayload;
  id v4 = objc_msgSendSuper2(&v11, sel_modelPropertiesDescription);
  uint64_t v5 = (void *)[v3 initWithDictionary:v4];

  v12[0] = @"uuid";
  v12[1] = @"kind";
  v13 = @"childCollections";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"childCollections" relatedEntityPropertyNames:v7 shouldPrefetchRelationship:1];

  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToKey:@"childCollections"])
  {
    id v23 = v10;
    id v11 = v9;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (+[PLFolderJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLFolderJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLAlbumJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLFetchingAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLFetchingAlbumJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLProjectAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:v18 additionalEntityName:0])
          {
            v19 = [v18 objectForKeyedSubscript:@"uuid"];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    uint64_t v20 = [v12 count];
    if (v8 || v20) {
      unsigned __int8 v21 = [v12 isEqualToOrderedSet:v8];
    }
    else {
      unsigned __int8 v21 = 1;
    }
    id v10 = v23;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PLFolderJournalEntryPayload;
    unsigned __int8 v21 = [(PLGenericAlbumJournalEntryPayload *)&v24 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
  }

  return v21;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PLFolderJournalEntryPayload;
  id v6 = a3;
  [(PLGenericAlbumJournalEntryPayload *)&v9 updateAlbum:v6 includePendingChanges:v4];
  v7 = objc_opt_class();
  id v8 = [(PLFolderJournalEntryPayload *)self childCollectionUUIDs];
  [v7 updateChildrenOrderingInFolder:v6 usingChildCollectionUUIDs:v8 includePendingChanges:v4];
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  int v6 = [v5 intValue];

  if ((v6 - 3998) < 2)
  {
    id v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Can't replace singleton root folder from payload", (uint8_t *)&v18, 2u);
    }
  }
  else
  {
    if (v6 == 1553)
    {
      v7 = [(PLGenericAlbumJournalEntryPayload *)self title];
      id v8 = [v4 photoLibrary];
      objc_super v9 = v7;
      uint64_t v10 = 1553;
      goto LABEL_8;
    }
    if (v6 == 4000)
    {
      v7 = [(PLGenericAlbumJournalEntryPayload *)self title];
      id v8 = [v4 photoLibrary];
      objc_super v9 = v7;
      uint64_t v10 = 4000;
LABEL_8:
      id v12 = +[PLManagedFolder insertNewFolderWithTitle:v9 kind:v10 intoLibrary:v8];

      goto LABEL_12;
    }
    id v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(PLGenericAlbumJournalEntryPayload *)self kind];
      uint64_t v14 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
      int v18 = 138412546;
      v19 = v13;
      __int16 v20 = 2112;
      unsigned __int8 v21 = v14;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unknown Folder Kind %@ for uuid %@", (uint8_t *)&v18, 0x16u);
    }
  }

  id v12 = 0;
LABEL_12:
  uint64_t v15 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  uint64_t v16 = [v15 payloadIDString];
  [v12 setUuid:v16];

  return v12;
}

- (BOOL)isProjectAlbumRootFolder
{
  uint64_t v2 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  BOOL v3 = [v2 intValue] == 3998;

  return v3;
}

- (BOOL)isRootFolder
{
  uint64_t v2 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  BOOL v3 = [v2 intValue] == 3999;

  return v3;
}

- (NSOrderedSet)childCollectionUUIDs
{
  BOOL v3 = [(NSMutableDictionary *)self->super.super._payloadAttributes objectForKeyedSubscript:@"childCollections"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v3];

  return (NSOrderedSet *)v4;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"childCollections"])
  {
    id v8 = [v7 key];

    objc_super v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLFolderJournalEntryPayload;
    uint64_t v10 = [(PLGenericAlbumJournalEntryPayload *)&v12 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"childCollections"])
  {
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v10];

    v13.receiver = self;
    v13.super_class = (Class)PLFolderJournalEntryPayload;
    [(PLGenericAlbumJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v9];
    id v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLFolderJournalEntryPayload;
    [(PLGenericAlbumJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v10 toDescriptionBuilder:v9];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v13 isEqualToKey:@"childCollections"])
  {
    v47.receiver = self;
    v47.super_class = (Class)PLFolderJournalEntryPayload;
    BOOL v34 = [(PLGenericAlbumJournalEntryPayload *)&v47 updatePayloadAttributes:v10 andNilAttributes:v11 withManagedObject:v12 forPayloadProperty:v13];
    goto LABEL_21;
  }
  v37 = self;
  id v38 = v13;
  id v40 = v11;
  id v41 = v10;
  id v39 = v12;
  id v14 = v12;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = v14;
  uint64_t v16 = [v14 childCollections];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (!v17) {
    goto LABEL_19;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v49;
  __int16 v20 = off_1E585E000;
  v42 = v16;
  id v43 = v15;
  uint64_t v45 = *(void *)v49;
  do
  {
    uint64_t v21 = 0;
    uint64_t v46 = v18;
    do
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
      id v23 = [(__objc2_class *)v20[405] validKindsForPersistence];
      objc_super v24 = [v22 kind];
      if ([v23 containsObject:v24]) {
        goto LABEL_12;
      }
      long long v25 = +[PLManagedAlbum validKindsForPersistence];
      long long v26 = [v22 kind];
      if ([v25 containsObject:v26]) {
        goto LABEL_11;
      }
      long long v27 = +[PLFetchingAlbum validKindsForPersistence];
      long long v28 = [v22 kind];
      if ([v27 containsObject:v28])
      {

        uint64_t v19 = v45;
        __int16 v20 = off_1E585E000;
LABEL_11:

        uint64_t v18 = v46;
LABEL_12:

LABEL_13:
        v29 = [v22 uuid];
        [v15 addObject:v29];

        goto LABEL_14;
      }
      uint64_t v30 = +[PLProjectAlbum validKindsForPersistence];
      v31 = [v22 kind];
      char v44 = [v30 containsObject:v31];

      id v15 = v43;
      uint64_t v16 = v42;

      uint64_t v19 = v45;
      uint64_t v18 = v46;
      __int16 v20 = off_1E585E000;
      if (v44) {
        goto LABEL_13;
      }
LABEL_14:
      ++v21;
    }
    while (v18 != v21);
    uint64_t v32 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
    uint64_t v18 = v32;
  }
  while (v32);
LABEL_19:

  v33 = [(PLManagedObjectJournalEntryPayload *)v37 encodedDataForUUIDStringOrderedSet:v15];
  id v11 = v40;
  id v10 = v41;
  id v13 = v38;
  [(PLManagedObjectJournalEntryPayload *)v37 updatePayloadAttributes:v41 andNilAttributes:v40 forPayloadProperty:v38 withUUIDStringData:v33];

  BOOL v34 = 1;
  id v12 = v39;
LABEL_21:

  return v34;
}

@end