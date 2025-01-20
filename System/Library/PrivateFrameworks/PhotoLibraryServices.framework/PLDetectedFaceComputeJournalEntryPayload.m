@interface PLDetectedFaceComputeJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)entityName;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadAdapterForManagedObject:(id)a3;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation PLDetectedFaceComputeJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    char v8 = 1;
    goto LABEL_13;
  }
  v9 = [v6 objectForKeyedSubscript:@"assetForFace.uuid"];
  if (!v9)
  {
    v4 = [v7 objectForKeyedSubscript:@"assetForFace.cloudAssetGUID"];
    if (!v4)
    {
      BOOL v11 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = [v7 objectForKeyedSubscript:@"assetForFace.trashedState"];
  BOOL v11 = [v10 integerValue] == 0;

  if (!v9) {
    goto LABEL_8;
  }
LABEL_9:

  v12 = [v7 objectForKeyedSubscript:@"personForFace.personUUID"];
  if (v12)
  {
    v13 = [v7 objectForKeyedSubscript:@"personForFace.verifiedType"];
    BOOL v14 = [v13 integerValue] != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  char v8 = v11 && v14;
LABEL_13:

  return v8;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3 = a3;
  v4 = [(PLJournalEntryPayloadUpdateAdapter *)[PLDetectedFaceComputePayloadAdapter alloc] initWithManagedObject:v3];

  return v4;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 anyObject];
  v9 = [v8 additionalAttributes];
  unsigned int v10 = [v9 faceAnalysisVersion];

  BOOL v11 = 0;
  if (v8 && v10 <= 1)
  {
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceComputeJournalEntryPayload;
    if ([(PLDetectedFaceJournalEntryPayload *)&v14 insertWithAssets:v6 inManagedObjectContext:v7])
    {
      v12 = [v8 additionalAttributes];
      BOOL v11 = 1;
      [v12 setFaceAnalysisVersion:1];
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a5;
  id v10 = a4;
  if ([v9 isEqualToKey:@"person"])
  {
    uint64_t v11 = [v10 objectForKeyedSubscript:@"personUUID"];

    if (v8 | v11) {
      unsigned __int8 v12 = [(id)v11 isEqualToString:v8];
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceComputeJournalEntryPayload;
    unsigned __int8 v12 = [(PLDetectedFaceJournalEntryPayload *)&v14 comparePayloadValue:v8 toObjectDictionaryValue:v10 forPayloadProperty:v9];
  }
  return v12;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (id)entityName
{
  return +[PLDetectedFace entityName];
}

+ (id)payloadClassID
{
  v2 = [a1 entityName];
  id v3 = [v2 stringByAppendingString:@"Compute"];

  return v3;
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PLDetectedFaceComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_49577 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_49577, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_49578;
  return v2;
}

void __80__PLDetectedFaceComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_49578;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_49578 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PLDetectedFaceComputeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_49579 != -1) {
    dispatch_once(&modelProperties_onceToken_49579, block);
  }
  v2 = (void *)modelProperties_modelProperties_49580;
  return v2;
}

uint64_t __59__PLDetectedFaceComputeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_49580;
  modelProperties_modelProperties_49580 = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_49580;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLDetectedFaceComputeJournalEntryPayload;
  id v3 = objc_msgSendSuper2(&v8, sel_nonPersistedModelPropertiesDescription);
  v4 = [v2 dictionaryWithDictionary:v3];

  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  [v4 setObject:v5 forKeyedSubscript:@"rejectedPersons"];

  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  [v4 setObject:v6 forKeyedSubscript:@"clusterRejectedPersons"];

  return v4;
}

+ (id)modelPropertiesDescription
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLDetectedFaceComputeJournalEntryPayload;
  id v3 = objc_msgSendSuper2(&v12, sel_modelPropertiesDescription);
  v4 = [v2 dictionaryWithDictionary:v3];

  [v4 removeObjectForKey:@"rejectedPersons"];
  [v4 removeObjectForKey:@"clusterRejectedPersons"];
  v14[0] = @"personUUID";
  v14[1] = @"verifiedType";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"person" relatedEntityPropertyNames:v6 shouldPrefetchRelationship:1];

  [v4 setObject:v7 forKeyedSubscript:@"personForFace"];
  v13[0] = @"uuid";
  v13[1] = @"cloudAssetGUID";
  v13[2] = @"trashedState";
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"asset" relatedEntityPropertyNames:v9 shouldPrefetchRelationship:1];

  [v4 setObject:v10 forKeyedSubscript:@"assetForFace"];
  return v4;
}

@end