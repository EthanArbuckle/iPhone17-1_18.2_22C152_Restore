@interface PLDeferredRebuildFaceJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (id)insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3;
@end

@implementation PLDeferredRebuildFaceJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"uuid", a4);
  BOOL v5 = v4 != 0;

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
  return +[PLDeferredRebuildFace entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PLDeferredRebuildFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_96369 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_96369, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_96370;
  return v2;
}

void __80__PLDeferredRebuildFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_96370;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_96370 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PLDeferredRebuildFaceJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_96371 != -1) {
    dispatch_once(&modelProperties_onceToken_96371, block);
  }
  v2 = (void *)modelProperties_modelProperties_96372;
  return v2;
}

uint64_t __59__PLDeferredRebuildFaceJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_96372;
  modelProperties_modelProperties_96372 = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_96372;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)modelPropertiesDescription
{
  v21[16] = *MEMORY[0x1E4F143B8];
  v20[0] = @"uuid";
  v19 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v21[0] = v19;
  v20[1] = @"faceUUID";
  v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[1] = v18;
  v20[2] = @"assetCloudGUID";
  v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[2] = v17;
  v20[3] = @"assetUUID";
  v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[3] = v16;
  v20[4] = @"personUUID";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[4] = v15;
  v20[5] = @"centerX";
  v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[5] = v14;
  v20[6] = @"centerY";
  v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[6] = v13;
  v20[7] = @"size";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[7] = v2;
  v20[8] = @"hidden";
  v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[8] = v3;
  v20[9] = @"manual";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[9] = v4;
  v20[10] = @"representative";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[10] = v5;
  v20[11] = @"rejected";
  v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[11] = v6;
  v20[12] = @"clusterRejected";
  v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[12] = v7;
  v20[13] = @"nameSource";
  v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[13] = v8;
  v20[14] = @"cloudNameSource";
  v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[14] = v9;
  v20[15] = @"faceAlgorithmVersion";
  v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21[15] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:16];

  return v11;
}

- (id)insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3
{
  v4 = +[PLManagedObject insertInManagedObjectContext:a3];
  uint64_t v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v6 = [v5 payloadIDString];
  [v4 setUuid:v6];

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v4 payloadAttributesToUpdate:0];
  return v4;
}

@end