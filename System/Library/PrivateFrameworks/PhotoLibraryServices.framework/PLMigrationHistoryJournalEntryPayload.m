@interface PLMigrationHistoryJournalEntryPayload
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (id)insertMigrationHistoryFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6;
@end

@implementation PLMigrationHistoryJournalEntryPayload

- (id)insertMigrationHistoryFromDataInManagedObjectContext:(id)a3
{
  v4 = +[PLManagedObject insertInManagedObjectContext:a3];
  v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v6 = [v5 payloadIDString];
  objc_msgSend(v4, "setIndex:", objc_msgSend(v6, "longLongValue"));

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v4 payloadAttributesToUpdate:0];
  return v4;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToKey:@"globalKeyValues"])
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    BOOL v11 = [(PLManagedObjectJournalEntryPayload *)&v13 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
  }

  return v11;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 requiresConversion])
  {
    v14 = [v10 key];
    int v15 = [v14 isEqualToString:@"globalKeyValues"];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4F29248];
      id v17 = v11;
      v18 = [v16 valueTransformerForName:@"PLGlobalKeyValueAnyTransformer"];
      payloadAttributes = self->super._payloadAttributes;
      v20 = [v10 key];
      v21 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v20];
      v22 = [v18 transformedValue:v21];
      [v17 setGlobalKeyValues:v22];
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v23 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
  }
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"globalKeyValues"])
  {
    id v8 = [MEMORY[0x1E4F29248] valueTransformerForName:@"PLGlobalKeyValueAnyTransformer"];
    id v9 = [v7 key];
    id v10 = [v6 objectForKeyedSubscript:v9];
    id v11 = [v8 transformedValue:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    id v11 = [(PLManagedObjectJournalEntryPayload *)&v13 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }

  return v11;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"globalKeyValues"])
  {
    id v11 = [MEMORY[0x1E4F29248] valueTransformerForName:@"PLGlobalKeyValueAnyTransformer"];
    id v12 = [v11 transformedValue:v9];
    v14.receiver = self;
    v14.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v14 appendAttributeKey:v8 value:v12 toDescriptionBuilder:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  int v11 = [v10 isEqualToKey:@"globalKeyValues"];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F29248] valueTransformerForName:@"PLGlobalKeyValueAnyTransformer"];
    objc_super v13 = [v9 globalKeyValues];
    objc_super v14 = [v12 reverseTransformedValue:v13];
    int v15 = [v10 key];
    [v8 setObject:v14 forKeyedSubscript:v15];
  }
  return v11;
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
  return +[PLMigrationHistory entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PLMigrationHistoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_100391 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_100391, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_100392;
  return v2;
}

void __77__PLMigrationHistoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_100392;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_100392 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLMigrationHistoryJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_100393 != -1) {
    dispatch_once(&modelProperties_onceToken_100393, block);
  }
  v2 = (void *)modelProperties_modelProperties_100394;
  return v2;
}

uint64_t __56__PLMigrationHistoryJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  v3 = (void *)modelProperties_modelProperties_100394;
  modelProperties_modelProperties_100394 = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_100394;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)modelPropertiesDescription
{
  v20[15] = *MEMORY[0x1E4F143B8];
  v19[0] = @"index";
  v18 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v20[0] = v18;
  v19[1] = @"modelVersion";
  id v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[1] = v17;
  v19[2] = @"sourceModelVersion";
  v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[2] = v16;
  v19[3] = @"migrationType";
  int v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[3] = v15;
  v19[4] = @"osVersion";
  objc_super v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[4] = v14;
  v19[5] = @"migrationDate";
  objc_super v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[5] = v13;
  v19[6] = @"forceRebuildReason";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[6] = v2;
  v19[7] = @"origin";
  v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[7] = v3;
  v19[8] = @"globalKeyValues";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[8] = v4;
  v19[9] = @"storeUUID";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[9] = v5;
  v19[10] = @"frameworkUUID";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[10] = v6;
  v19[11] = @"hardwareModel";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[11] = v7;
  v19[12] = @"deviceUniqueID";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[12] = v8;
  v19[13] = @"cplEnabled";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[13] = v9;
  v19[14] = @"initialSyncDate";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[14] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:15];

  return v11;
}

@end