@interface PLMemoryComputeJournalEntryPayload
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
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSSet)assetIdentifiers;
- (NSSet)curatedAssetUUIDs;
- (NSSet)extendedCuratedAssetUUIDs;
- (NSSet)representativeAssetUUIDs;
- (NSString)keyAssetUUID;
- (id)_allAssetUUIDs;
- (id)_memoryInManagedObjectContext:(id)a3 error:(id *)a4;
- (id)_remapToLocalIdentifiersForCloudIdentifiers:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (int64_t)assetIdentifierType;
- (unint64_t)assetIdentifierCount;
- (void)_setAsset:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6;
- (void)_setAssets:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6;
- (void)_updateMemory:(id)a3 withAssets:(id)a4;
- (void)setCuratedAssetUUIDs:(id)a3;
- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3;
@end

@implementation PLMemoryComputeJournalEntryPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAssetIdentifierForCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAssetIdentifiers, 0);
}

- (id)_remapToLocalIdentifiersForCloudIdentifiers:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithSet:v5];

  localAssetIdentifierForCloudIdentifiers = self->_localAssetIdentifierForCloudIdentifiers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PLMemoryComputeJournalEntryPayload__remapToLocalIdentifiersForCloudIdentifiers___block_invoke;
  v10[3] = &unk_1E58756D0;
  id v8 = v6;
  id v11 = v8;
  [(NSDictionary *)localAssetIdentifierForCloudIdentifiers enumerateKeysAndObjectsUsingBlock:v10];

  return v8;
}

void __82__PLMemoryComputeJournalEntryPayload__remapToLocalIdentifiersForCloudIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    [*(id *)(a1 + 32) removeObject:v6];
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)_updateMemory:(id)a3 withAssets:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(PLMemoryComputeJournalEntryPayload *)self assetIdentifierType] == 1) {
    id v8 = @"cloudAssetGUID";
  }
  else {
    id v8 = @"uuid";
  }
  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [(PLMemoryComputeJournalEntryPayload *)self curatedAssetUUIDs];
  id v11 = [v9 predicateWithFormat:@"%K in %@", v8, v10];
  v12 = [v6 filteredSetUsingPredicate:v11];
  [v7 setCuratedAssets:v12];

  v13 = (void *)MEMORY[0x1E4F28F60];
  v14 = [(PLMemoryComputeJournalEntryPayload *)self extendedCuratedAssetUUIDs];
  v15 = [v13 predicateWithFormat:@"%K in %@", v8, v14];
  v16 = [v6 filteredSetUsingPredicate:v15];
  [v7 setExtendedCuratedAssets:v16];

  v17 = (void *)MEMORY[0x1E4F28F60];
  id v20 = [(PLMemoryComputeJournalEntryPayload *)self representativeAssetUUIDs];
  v18 = [v17 predicateWithFormat:@"%K in %@", v8, v20];
  v19 = [v6 filteredSetUsingPredicate:v18];

  [v7 setRepresentativeAssets:v19];
}

- (id)_allAssetUUIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(PLMemoryComputeJournalEntryPayload *)self keyAssetUUID];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(PLMemoryComputeJournalEntryPayload *)self curatedAssetUUIDs];
  if (v5) {
    [v3 unionSet:v5];
  }
  id v6 = [(PLMemoryComputeJournalEntryPayload *)self extendedCuratedAssetUUIDs];

  if (v6) {
    [v3 unionSet:v6];
  }
  id v7 = [(PLMemoryComputeJournalEntryPayload *)self representativeAssetUUIDs];

  if (v7) {
    [v3 unionSet:v7];
  }

  return v3;
}

- (void)_setAssets:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6
{
  id v20 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"assetIDType"];
  uint64_t v14 = [v13 integerValue];

  v15 = [v20 valueForKey:@"cloudAssetGUID"];
  v16 = v15;
  if (!v14)
  {
    if ([v15 count]) {
      v17 = &unk_1EEBEFD20;
    }
    else {
      v17 = &unk_1EEBEFD38;
    }
    [v10 setObject:v17 forKeyedSubscript:@"assetIDType"];
  }
  if (![v16 count])
  {
    uint64_t v18 = [v20 valueForKey:@"uuid"];

    v16 = (void *)v18;
  }
  v19 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringSet:v16];
  [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v12 withUUIDStringData:v19];
}

- (void)_setAsset:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6
{
  id v21 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  if (v21)
  {
    v13 = [v10 objectForKeyedSubscript:@"assetIDType"];
    uint64_t v14 = [v13 integerValue];

    if (!v14)
    {
      v15 = [v21 cloudAssetGUID];
      if (v15) {
        v16 = &unk_1EEBEFD20;
      }
      else {
        v16 = &unk_1EEBEFD38;
      }
      [v10 setObject:v16 forKeyedSubscript:@"assetIDType"];
    }
    v17 = [v21 cloudAssetGUID];
    if (v17) {
      [v21 cloudAssetGUID];
    }
    else {
    uint64_t v18 = [v21 uuid];
    }
    v19 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v18];
    id v20 = [v12 key];

    [v10 setObject:v19 forKeyedSubscript:v20];
  }
  else
  {
    v17 = [v12 key];

    [v11 addObject:v17];
  }
}

- (id)_memoryInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  id v8 = [(id)objc_opt_class() entityName];
  v9 = [v6 fetchRequestWithEntityName:v8];

  [v9 setFetchBatchSize:1];
  [v9 setFetchLimit:1];
  id v10 = (void *)MEMORY[0x1E4F28F60];
  id v11 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  id v12 = [v10 predicateWithFormat:@"%K == %@", @"uuid", v11];
  [v9 setPredicate:v12];

  v13 = [v7 executeFetchRequest:v9 error:a4];

  return v13;
}

- (int64_t)assetIdentifierType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"assetIDType"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3
{
}

- (unint64_t)assetIdentifierCount
{
  if (self->_allAssetIdentifiers)
  {
    allAssetIdentifiers = self->_allAssetIdentifiers;
    return [(NSMutableSet *)allAssetIdentifiers count];
  }
  else
  {
    v4 = [(PLMemoryComputeJournalEntryPayload *)self assetIdentifiers];
    unint64_t v5 = [v4 count];

    return v5;
  }
}

- (NSSet)assetIdentifiers
{
  int64_t v3 = [(PLMemoryComputeJournalEntryPayload *)self _allAssetUUIDs];
  allAssetIdentifiers = self->_allAssetIdentifiers;
  self->_allAssetIdentifiers = v3;

  unint64_t v5 = self->_allAssetIdentifiers;
  return (NSSet *)v5;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = [(PLMemoryComputeJournalEntryPayload *)self _memoryInManagedObjectContext:v7 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to look up compute cache memory %{public}@ on restore, skipping: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (![v8 count])
  {
    id v10 = +[PLManagedObject insertInManagedObjectContext:v7];
    id v11 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
    id v12 = [v11 payloadIDString];
    [v10 setUuid:v12];

    [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v10 payloadAttributesToUpdate:0];
    [(PLMemoryComputeJournalEntryPayload *)self _updateMemory:v10 withAssets:v6];
LABEL_6:
  }
  return v8 != 0;
}

- (NSSet)representativeAssetUUIDs
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"representativeAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];
  unint64_t v5 = [(PLMemoryComputeJournalEntryPayload *)self _remapToLocalIdentifiersForCloudIdentifiers:v4];

  return (NSSet *)v5;
}

- (NSSet)extendedCuratedAssetUUIDs
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"extendedCuratedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];
  unint64_t v5 = [(PLMemoryComputeJournalEntryPayload *)self _remapToLocalIdentifiersForCloudIdentifiers:v4];

  return (NSSet *)v5;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
  id v4 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringSet:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"curatedAssets"];
}

- (NSSet)curatedAssetUUIDs
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"curatedAssets"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];
  unint64_t v5 = [(PLMemoryComputeJournalEntryPayload *)self _remapToLocalIdentifiersForCloudIdentifiers:v4];

  return (NSSet *)v5;
}

- (NSString)keyAssetUUID
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyAsset"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  if (v4)
  {
    unint64_t v5 = [(NSDictionary *)self->_localAssetIdentifierForCloudIdentifiers objectForKeyedSubscript:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v10 isEqualToKey:@"curatedAssets"] & 1) != 0
    || ([v10 isEqualToKey:@"extendedCuratedAssets"] & 1) != 0
    || [v10 isEqualToKey:@"representativeAssets"])
  {
    if ([(PLMemoryComputeJournalEntryPayload *)self assetIdentifierType] == 1) {
      id v11 = @"cloudAssetGUID";
    }
    else {
      id v11 = @"uuid";
    }
    id v12 = [v9 valueForKey:v11];
    v13 = [(PLMemoryComputeJournalEntryPayload *)self _remapToLocalIdentifiersForCloudIdentifiers:v8];
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    unsigned __int8 v15 = [v13 isEqualToSet:v14];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLMemoryComputeJournalEntryPayload;
    unsigned __int8 v15 = [(PLManagedObjectJournalEntryPayload *)&v17 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
  }

  return v15;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"keyAsset"])
  {
    id v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
LABEL_7:
    id v11 = (void *)v10;

    goto LABEL_8;
  }
  if (([v7 isEqualToKey:@"curatedAssets"] & 1) != 0
    || ([v7 isEqualToKey:@"extendedCuratedAssets"] & 1) != 0
    || [v7 isEqualToKey:@"representativeAssets"])
  {
    id v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)PLMemoryComputeJournalEntryPayload;
  id v11 = [(PLManagedObjectJournalEntryPayload *)&v13 payloadValueFromAttributes:v6 forPayloadProperty:v7];
LABEL_8:

  return v11;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if ([v13 isEqualToKey:@"keyAsset"])
  {
    unsigned __int8 v15 = [v14 keyAsset];
    [(PLMemoryComputeJournalEntryPayload *)self _setAsset:v15 forPayloadProperty:v13 payloadAttributes:v10 andNilAttributes:v11];
  }
  else
  {
    if ([v13 isEqualToKey:@"curatedAssets"])
    {
      uint64_t v16 = [v14 curatedAssets];
    }
    else if ([v13 isEqualToKey:@"extendedCuratedAssets"])
    {
      uint64_t v16 = [v14 extendedCuratedAssets];
    }
    else
    {
      if (![v13 isEqualToKey:@"representativeAssets"])
      {
        BOOL v17 = 0;
        goto LABEL_11;
      }
      uint64_t v16 = [v14 representativeAssets];
    }
    unsigned __int8 v15 = (void *)v16;
    [(PLMemoryComputeJournalEntryPayload *)self _setAssets:v16 forPayloadProperty:v13 payloadAttributes:v10 andNilAttributes:v11];
  }

  BOOL v17 = 1;
LABEL_11:

  return v17;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  if (a4) {
    return 1;
  }
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"pendingState"];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v5 objectForKeyedSubscript:@"rejected"];

  char v9 = [v8 BOOLValue];
  if (v7 == 2) {
    return v9 ^ 1;
  }
  else {
    return 0;
  }
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = [(PLJournalEntryPayloadUpdateAdapter *)[PLMemoryComputePayloadAdapter alloc] initWithManagedObject:v3];

  return v4;
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
  return +[PLMemory entityName];
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
  block[2] = __74__PLMemoryComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_93157 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_93157, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_93158;
  return v2;
}

void __74__PLMemoryComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_93158;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_93158 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PLMemoryComputeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_93159 != -1) {
    dispatch_once(&modelProperties_onceToken_93159, block);
  }
  v2 = (void *)modelProperties_modelProperties_93160;
  return v2;
}

uint64_t __53__PLMemoryComputeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_93160;
  modelProperties_modelProperties_93160 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_93160;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v39[34] = *MEMORY[0x1E4F143B8];
  v38[0] = @"storyColorGradeKind";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[0] = v37;
  v38[1] = @"storySerializedTitleCategory";
  v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[1] = v36;
  v38[2] = @"cloudDeleteState";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[2] = v35;
  v38[3] = @"cloudLocalState";
  v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[3] = v34;
  v38[4] = @"lastMoviePlayedDate";
  v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[4] = v33;
  v38[5] = @"lastViewedDate";
  v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[5] = v32;
  v38[6] = @"lastEnrichmentDate";
  v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[6] = v31;
  v38[7] = @"pendingPlayCount";
  v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[7] = v30;
  v38[8] = @"pendingShareCount";
  v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[8] = v29;
  v38[9] = @"pendingViewCount";
  v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[9] = v28;
  v38[10] = @"featuredState";
  v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[10] = v27;
  v38[11] = @"syndicatedContentState";
  v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[11] = v26;
  v38[12] = @"sharingComposition";
  v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[12] = v25;
  v38[13] = @"searchIndexRebuildState";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[13] = v24;
  v38[14] = @"startDate";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[14] = v23;
  v38[15] = @"endDate";
  v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[15] = v22;
  v38[16] = @"assetListPredicate";
  id v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[16] = v21;
  v38[17] = @"blacklistedFeature";
  uint64_t v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[17] = v20;
  v38[18] = @"favorite";
  id v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[18] = v19;
  v38[19] = @"movieAssetState";
  __int16 v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[19] = v18;
  v38[20] = @"movieData";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[20] = v17;
  v38[21] = @"notificationState";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[21] = v16;
  v38[22] = @"playCount";
  unsigned __int8 v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[22] = v15;
  v38[23] = @"shareCount";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[23] = v14;
  v38[24] = @"viewCount";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[24] = v2;
  v38[25] = @"rejected";
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[25] = v3;
  v38[26] = @"userActionOptions";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[26] = v4;
  v38[27] = @"movieCuratedAssets";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[27] = v5;
  v38[28] = @"userCuratedAssets";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[28] = v6;
  v38[29] = @"customUserAssets";
  uint64_t v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[29] = v7;
  v38[30] = @"userRemovedAssets";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[30] = v8;
  v38[31] = @"userFeedbacks";
  char v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[31] = v9;
  v38[32] = @"targetUserEditedMemory";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[32] = v10;
  v38[33] = @"sourceGeneratedMemory";
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v39[33] = v11;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:34];

  return v13;
}

+ (id)modelPropertiesDescription
{
  v32[15] = *MEMORY[0x1E4F143B8];
  v31[0] = @"uuid";
  v26 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v32[0] = v26;
  v31[1] = @"title";
  v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[1] = v25;
  v31[2] = @"subtitle";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[2] = v24;
  v31[3] = @"creationDate";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[3] = v23;
  v31[4] = @"category";
  v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[4] = v22;
  v31[5] = @"pendingState";
  id v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"pending" andType:100 info:0];
  v32[5] = v21;
  v31[6] = @"photosGraphData";
  uint64_t v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[6] = v20;
  v31[7] = @"photosGraphVersion";
  id v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[7] = v19;
  v31[8] = @"score";
  __int16 v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[8] = v18;
  v31[9] = @"subcategory";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[9] = v17;
  v31[10] = @"graphMemoryIdentifier";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32[10] = v16;
  v31[11] = @"keyAsset";
  v30[0] = @"uuid";
  v30[1] = @"cloudAssetGUID";
  unsigned __int8 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"keyAsset" relatedEntityPropertyNames:v2 shouldPrefetchRelationship:1];

  v32[11] = v3;
  v31[12] = @"curatedAssets";
  v29[0] = @"uuid";
  v29[1] = @"cloudAssetGUID";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"curatedAssets" relatedEntityPropertyNames:v5 shouldPrefetchRelationship:1];

  v32[12] = v6;
  v31[13] = @"extendedCuratedAssets";
  v28[0] = @"uuid";
  v28[1] = @"cloudAssetGUID";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  char v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"extendedCuratedAssets" relatedEntityPropertyNames:v8 shouldPrefetchRelationship:1];

  v32[13] = v9;
  v31[14] = @"representativeAssets";
  v27[0] = @"uuid";
  v27[1] = @"cloudAssetGUID";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  id v12 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"representativeAssets" relatedEntityPropertyNames:v11 shouldPrefetchRelationship:1];

  v32[14] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:15];

  return v13;
}

@end