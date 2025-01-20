@interface PLAlbumListJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSOrderedSet)albumUUIDs;
- (id)insertAlbumListFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (signed)albumListType;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)updateAlbumList:(id)a3;
@end

@implementation PLAlbumListJournalEntryPayload

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v9 isEqualToKey:@"albums"])
  {
    v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v10];

    unsigned __int8 v12 = [v11 isEqualToOrderedSet:v8];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAlbumListJournalEntryPayload;
    unsigned __int8 v12 = [(PLManagedObjectJournalEntryPayload *)&v14 comparePayloadValue:v8 toObjectDictionaryValue:v10 forPayloadProperty:v9];
  }
  return v12;
}

- (void)updateAlbumList:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLAlbumListJournalEntryPayload *)self albumUUIDs];
  v6 = [v4 albums];
  v7 = [v6 valueForKey:@"uuid"];

  if ([v5 isEqual:v7])
  {
    id v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = [(PLAlbumListJournalEntryPayload *)self albumListType];
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Persisted albumList %d UUIDs match existing UUID ordering", buf, 8u);
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([v5 count])
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v16 = [(PLAlbumListJournalEntryPayload *)self albumListType];
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Sorting albumList %d to match UUID ordering %@", buf, 0x12u);
    }

    id v10 = [v4 albumsSortingComparator];
    v11 = [v4 albums];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PLAlbumListJournalEntryPayload_updateAlbumList___block_invoke;
    v12[3] = &unk_1E5868040;
    id v14 = v10;
    id v13 = v5;
    id v8 = v10;
    [v11 sortUsingComparator:v12];

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __50__PLAlbumListJournalEntryPayload_updateAlbumList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [v5 uuid];
    unint64_t v10 = [v8 indexOfObject:v9];

    v11 = *(void **)(a1 + 32);
    unsigned __int8 v12 = [v6 uuid];
    unint64_t v13 = [v11 indexOfObject:v12];

    if (v10 >= v13) {
      uint64_t v7 = v10 > v13;
    }
    else {
      uint64_t v7 = -1;
    }
  }

  return v7;
}

- (id)insertAlbumListFromDataInManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (+[PLManagedAlbumList isValidTypeForPersistence:[(PLAlbumListJournalEntryPayload *)self albumListType]])
  {
    uint64_t v5 = [(PLAlbumListJournalEntryPayload *)self albumListType];
    id v6 = [v4 photoLibrary];
    uint64_t v7 = +[PLManagedAlbumList _singletonListWithType:v5 library:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (signed)albumListType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"identifier"];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (NSOrderedSet)albumUUIDs
{
  signed __int16 v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"albums"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v3];

  return (NSOrderedSet *)v4;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"albums"])
  {
    id v8 = [v7 key];

    id v9 = [v6 objectForKeyedSubscript:v8];
    unint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumListJournalEntryPayload;
    unint64_t v10 = [(PLManagedObjectJournalEntryPayload *)&v12 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"albums"])
  {
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v10];

    v13.receiver = self;
    v13.super_class = (Class)PLAlbumListJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v9];
    id v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumListJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v10 toDescriptionBuilder:v9];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v13 isEqualToKey:@"albums"];
  if (v14)
  {
    v15 = [v12 albums];
    int v16 = [v13 relatedEntityPropertyNames];
    __int16 v17 = [v16 anyObject];
    v18 = [v15 valueForKey:v17];

    uint64_t v19 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringOrderedSet:v18];
    [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v19];
  }
  return v14;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"identifier", a4);
  BOOL v5 = +[PLManagedAlbumList isValidTypeForPersistence:](PLManagedAlbumList, "isValidTypeForPersistence:", (__int16)[v4 integerValue]);

  return v5;
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
  return +[PLManagedAlbumList entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PLAlbumListJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_29326 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_29326, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_29327;
  return v2;
}

void __70__PLAlbumListJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_29327;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_29327 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PLAlbumListJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_29328 != -1) {
    dispatch_once(&modelProperties_onceToken_29328, block);
  }
  v2 = (void *)modelProperties_modelProperties_29329;
  return v2;
}

uint64_t __49__PLAlbumListJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  signed __int16 v3 = (void *)modelProperties_modelProperties_29329;
  modelProperties_modelProperties_29329 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_29329;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"needsReorderingNumber";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v6[0] = v2;
  signed __int16 v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)modelPropertiesDescription
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"uuid";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v9[0] = v2;
  v8[1] = @"identifier";
  signed __int16 v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v9[1] = v3;
  v8[2] = @"albums";
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"albums" relatedEntityPropertyNames:v4 shouldPrefetchRelationship:1];

  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

@end