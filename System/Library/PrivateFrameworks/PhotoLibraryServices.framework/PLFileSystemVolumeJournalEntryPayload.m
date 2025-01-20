@interface PLFileSystemVolumeJournalEntryPayload
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (id)insertFileSystemVolumeFromDataInManagedObjectContext:(id)a3;
@end

@implementation PLFileSystemVolumeJournalEntryPayload

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
  return +[PLFileSystemVolume entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PLFileSystemVolumeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames;
  return v2;
}

void __77__PLFileSystemVolumeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLFileSystemVolumeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken != -1) {
    dispatch_once(&modelProperties_onceToken, block);
  }
  v2 = (void *)modelProperties_modelProperties;
  return v2;
}

uint64_t __56__PLFileSystemVolumeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties;
  modelProperties_modelProperties = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"resources";
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
  v7[1] = @"name";
  v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8[1] = v3;
  v7[2] = @"volumeUuidString";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"volumeUuid" andType:700 info:0];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)insertFileSystemVolumeFromDataInManagedObjectContext:(id)a3
{
  v4 = +[PLManagedObject insertInManagedObjectContext:a3];
  uint64_t v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v6 = [v5 payloadIDString];
  [v4 setUuid:v6];

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v4 payloadAttributesToUpdate:0];
  return v4;
}

@end