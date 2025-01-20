@interface PLFetchingAlbumJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (void)_fixHasLocationSmartAlbum;
- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3;
@end

@implementation PLFetchingAlbumJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4 = a3;
  v5 = +[PLFetchingAlbum validKindsForPersistence];
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
  return 2;
}

+ (id)payloadClassID
{
  return +[PLFetchingAlbum entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PLFetchingAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_53715 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_53715, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_53716;
  return v2;
}

void __74__PLFetchingAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_53716;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_53716 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PLFetchingAlbumJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_53717 != -1) {
    dispatch_once(&modelProperties_onceToken_53717, block);
  }
  v2 = (void *)modelProperties_modelProperties_53718;
  return v2;
}

uint64_t __53__PLFetchingAlbumJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_53718;
  modelProperties_modelProperties_53718 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_53718;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLFetchingAlbumJournalEntryPayload;
  id v4 = objc_msgSendSuper2(&v11, sel_nonPersistedModelPropertiesDescription);
  uint64_t v5 = (void *)[v3 initWithDictionary:v4];

  v12[0] = @"customQueryParameters";
  v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v13[0] = v6;
  v12[1] = @"customQueryType";
  v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v13[1] = v7;
  v12[2] = @"searchIndexRebuildState";
  v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  id v4 = a3;
  if ([(PLManagedObjectJournalEntryPayload *)self payloadVersion] <= 1) {
    [(PLFetchingAlbumJournalEntryPayload *)self _fixHasLocationSmartAlbum];
  }
  v5.receiver = self;
  v5.super_class = (Class)PLFetchingAlbumJournalEntryPayload;
  [(PLManagedObjectJournalEntryPayload *)&v5 migrateMergedPayloadWithUpdatePayloads:v4];
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v3 = [a3 photoLibrary];
  id v4 = +[PLGenericAlbum insertNewSmartAlbumIntoLibrary:v3];

  return v4;
}

- (void)_fixHasLocationSmartAlbum
{
  id v5 = [(PLGenericAlbumJournalEntryPayload *)self userQueryData];
  id v3 = +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:");
  if (+[PLQueryHandler fixUserQueryDataInQuery:v3])
  {
    id v4 = +[PLQueryHandler dataFromQuery:v3];
    [(PLGenericAlbumJournalEntryPayload *)self setUserQueryData:v4];
  }
}

@end