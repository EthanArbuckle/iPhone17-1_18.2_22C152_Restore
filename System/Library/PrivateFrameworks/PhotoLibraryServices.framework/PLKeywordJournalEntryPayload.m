@interface PLKeywordJournalEntryPayload
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (NSString)title;
- (id)insertKeywordFromDataInManagedObjectContext:(id)a3;
@end

@implementation PLKeywordJournalEntryPayload

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
  return +[PLManagedKeyword entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PLKeywordJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_4325 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_4325, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_4326;
  return v2;
}

void __68__PLKeywordJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_4326;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_4326 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PLKeywordJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_4327 != -1) {
    dispatch_once(&modelProperties_onceToken_4327, block);
  }
  v2 = (void *)modelProperties_modelProperties_4328;
  return v2;
}

uint64_t __47__PLKeywordJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_4328;
  modelProperties_modelProperties_4328 = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_4328;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"assetAttributes";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)modelPropertiesDescription
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"uuid";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v8[0] = v2;
  v7[1] = @"title";
  v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8[1] = v3;
  v7[2] = @"shortcut";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (NSString)title
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"title"];
}

- (id)insertKeywordFromDataInManagedObjectContext:(id)a3
{
  v4 = +[PLManagedObject insertInManagedObjectContext:a3];
  uint64_t v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v6 = [v5 payloadIDString];
  [v4 setUuid:v6];

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v4 payloadAttributesToUpdate:0];
  return v4;
}

@end