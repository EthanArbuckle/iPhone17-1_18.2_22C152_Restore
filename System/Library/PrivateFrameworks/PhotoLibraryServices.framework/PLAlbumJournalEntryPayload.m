@interface PLAlbumJournalEntryPayload
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
- (NSOrderedSet)assetUUIDs;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4;
@end

@implementation PLAlbumJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4 = a3;
  v5 = +[PLManagedAlbum validKindsForPersistence];
  v6 = [v4 objectForKeyedSubscript:@"kind"];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
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
  return +[PLManagedAlbum entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_97237 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_97237, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_97238;
  return v2;
}

void __66__PLAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_97238;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_97238 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLAlbumJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_97239 != -1) {
    dispatch_once(&modelProperties_onceToken_97239, block);
  }
  v2 = (void *)modelProperties_modelProperties_97240;
  return v2;
}

uint64_t __45__PLAlbumJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_97240;
  modelProperties_modelProperties_97240 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_97240;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLAlbumJournalEntryPayload;
  id v4 = objc_msgSendSuper2(&v9, sel_nonPersistedModelPropertiesDescription);
  uint64_t v5 = (void *)[v3 initWithDictionary:v4];

  v10 = @"searchIndexRebuildState";
  v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

+ (id)modelPropertiesDescription
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PLAlbumJournalEntryPayload;
  id v4 = objc_msgSendSuper2(&v10, sel_modelPropertiesDescription);
  uint64_t v5 = (void *)[v3 initWithDictionary:v4];

  v11 = @"assets";
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assets" relatedEntityPropertyNames:v6 shouldPrefetchRelationship:0];

  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v5 addEntriesFromDictionary:v8];

  return v5;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v9 isEqualToKey:@"assets"])
  {
    v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v10];

    unsigned __int8 v12 = [v11 isEqualToOrderedSet:v8];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAlbumJournalEntryPayload;
    unsigned __int8 v12 = [(PLGenericAlbumJournalEntryPayload *)&v14 comparePayloadValue:v8 toObjectDictionaryValue:v10 forPayloadProperty:v9];
  }
  return v12;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLAlbumJournalEntryPayload;
  [(PLGenericAlbumJournalEntryPayload *)&v20 updateAlbum:v6 includePendingChanges:v4];
  v7 = [(PLAlbumJournalEntryPayload *)self assetUUIDs];
  id v8 = objc_opt_class();
  id v9 = [v6 assets];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PLAlbumJournalEntryPayload_updateAlbum_includePendingChanges___block_invoke;
  v16[3] = &unk_1E58722C8;
  BOOL v19 = v4;
  id v10 = v7;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  unsigned __int8 v12 = [v8 sortedObjectsToAddWithUUIDs:v10 uuidKey:@"uuid" andExistingObjects:v9 fetchBlock:v16];

  if (v12)
  {
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = [v11 uuid];
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Updating assets in album %@ to match persisted UUID ordering from %@", buf, 0x16u);
    }
    v15 = [v11 mutableAssets];
    [v15 addObjectsFromArray:v12];
  }
}

id __64__PLAlbumJournalEntryPayload_updateAlbum_includePendingChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48) | 2;
  id v3 = [*(id *)(a1 + 32) array];
  BOOL v4 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v5 = +[PLManagedAsset assetsWithUUIDs:v3 options:v2 inManagedObjectContext:v4];

  return v5;
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  uint64_t v6 = [v5 intValue];
  v7 = [(PLGenericAlbumJournalEntryPayload *)self title];
  id v8 = [v4 photoLibrary];

  id v9 = +[PLGenericAlbum insertNewAlbumWithKind:v6 title:v7 intoLibrary:v8];

  return v9;
}

- (NSOrderedSet)assetUUIDs
{
  id v3 = [(NSMutableDictionary *)self->super.super._payloadAttributes objectForKeyedSubscript:@"assets"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v3];

  return (NSOrderedSet *)v4;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"assets"])
  {
    id v8 = [v7 key];

    id v9 = [v6 objectForKeyedSubscript:v8];
    id v10 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumJournalEntryPayload;
    id v10 = [(PLGenericAlbumJournalEntryPayload *)&v12 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"assets"])
  {
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v10];

    v13.receiver = self;
    v13.super_class = (Class)PLAlbumJournalEntryPayload;
    [(PLGenericAlbumJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v9];
    id v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumJournalEntryPayload;
    [(PLGenericAlbumJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v10 toDescriptionBuilder:v9];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v13 isEqualToKey:@"assets"])
  {
    objc_super v14 = [(id)objc_opt_class() fetchRelationshipPropertyValuesForRelationshipName:@"assets" fromManagedObject:v12 usingPayloadProperty:v13];
    v15 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringArray:v14];
    [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v15];

    BOOL v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAlbumJournalEntryPayload;
    BOOL v16 = [(PLGenericAlbumJournalEntryPayload *)&v18 updatePayloadAttributes:v10 andNilAttributes:v11 withManagedObject:v12 forPayloadProperty:v13];
  }

  return v16;
}

@end