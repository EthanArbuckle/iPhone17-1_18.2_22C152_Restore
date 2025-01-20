@interface PLImportSessionJournalEntryPayload
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSSet)assetUUIDs;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4;
@end

@implementation PLImportSessionJournalEntryPayload

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
  return +[PLImportSession entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PLImportSessionJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_12052 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_12052, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_12053;
  return v2;
}

void __74__PLImportSessionJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_12053;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_12053 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PLImportSessionJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_12054 != -1) {
    dispatch_once(&modelProperties_onceToken_12054, block);
  }
  v2 = (void *)modelProperties_modelProperties_12055;
  return v2;
}

uint64_t __53__PLImportSessionJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_12055;
  modelProperties_modelProperties_12055 = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_12055;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)modelPropertiesDescription
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PLImportSessionJournalEntryPayload;
  v4 = objc_msgSendSuper2(&v10, sel_modelPropertiesDescription);
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
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];

    unsigned __int8 v12 = [v11 isEqualToSet:v8];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLImportSessionJournalEntryPayload;
    unsigned __int8 v12 = [(PLGenericAlbumJournalEntryPayload *)&v14 comparePayloadValue:v8 toObjectDictionaryValue:v10 forPayloadProperty:v9];
  }
  return v12;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLImportSessionJournalEntryPayload;
  [(PLGenericAlbumJournalEntryPayload *)&v15 updateAlbum:v6 includePendingChanges:v4];
  v7 = [(PLImportSessionJournalEntryPayload *)self assetUUIDs];
  id v8 = [v7 allObjects];
  id v9 = [v6 managedObjectContext];
  id v10 = +[PLManagedAsset assetsWithUUIDs:v8 options:v4 | 2 inManagedObjectContext:v9];

  if (v10)
  {
    id v11 = v6;
    unsigned __int8 v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v11 uuid];
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Updating assets in import session %@ to match persisted UUID from %@", buf, 0x16u);
    }
    objc_super v14 = [v11 mutableAssets];
    [v14 addObjectsFromArray:v10];
  }
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLGenericAlbumJournalEntryPayload *)self importSessionID];
  id v6 = +[PLImportSession insertNewImportSessionAlbumWithImportSessionID:v5 inManagedObjectContext:v4];

  return v6;
}

- (NSSet)assetUUIDs
{
  id v3 = [(NSMutableDictionary *)self->super.super._payloadAttributes objectForKeyedSubscript:@"assets"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"assets"])
  {
    id v8 = [v7 key];

    id v9 = [v6 objectForKeyedSubscript:v8];
    id v10 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLImportSessionJournalEntryPayload;
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
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v10];

    v13.receiver = self;
    v13.super_class = (Class)PLImportSessionJournalEntryPayload;
    [(PLGenericAlbumJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v9];
    id v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLImportSessionJournalEntryPayload;
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
    objc_super v15 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringArray:v14];
    [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v15];

    BOOL v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLImportSessionJournalEntryPayload;
    BOOL v16 = [(PLGenericAlbumJournalEntryPayload *)&v18 updatePayloadAttributes:v10 andNilAttributes:v11 withManagedObject:v12 forPayloadProperty:v13];
  }

  return v16;
}

@end