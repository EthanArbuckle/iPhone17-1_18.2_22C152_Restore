@interface PLMemoryJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4;
- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSOrderedSet)customUserAssetUUIDs;
- (NSSet)curatedAssetUUIDs;
- (NSSet)extendedCuratedAssetUUIDs;
- (NSSet)movieCuratedAssetUUIDs;
- (NSSet)representativeAssetUUIDs;
- (NSSet)userCuratedAssetUUIDs;
- (NSSet)userRemovedAssetUUIDs;
- (NSString)keyAssetUUID;
- (PLMemoryJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4;
- (id)insertMemoryFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6;
@end

@implementation PLMemoryJournalEntryPayload

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v10 isEqualToKey:@"movieAssetState"])
  {
    if ([v10 isEqualToKey:@"keyAsset"])
    {
      unsigned __int8 v13 = [v9 isEqualToString:v8];
LABEL_6:
      BOOL v12 = v13;
      goto LABEL_17;
    }
    if (([v10 isEqualToKey:@"curatedAssets"] & 1) != 0
      || ([v10 isEqualToKey:@"extendedCuratedAssets"] & 1) != 0
      || ([v10 isEqualToKey:@"movieCuratedAssets"] & 1) != 0
      || ([v10 isEqualToKey:@"userCuratedAssets"] & 1) != 0
      || ([v10 isEqualToKey:@"userRemovedAssets"] & 1) != 0
      || [v10 isEqualToKey:@"representativeAssets"])
    {
      v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      char v15 = [v14 isEqualToSet:v8];
    }
    else
    {
      if (![v10 isEqualToKey:@"customUserAssets"])
      {
        v17.receiver = self;
        v17.super_class = (Class)PLMemoryJournalEntryPayload;
        unsigned __int8 v13 = [(PLManagedObjectJournalEntryPayload *)&v17 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
        goto LABEL_6;
      }
      v14 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
      char v15 = [v14 isEqualToOrderedSet:v8];
    }
    BOOL v12 = v15;

    goto LABEL_17;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  BOOL v24 = 0;
  uint64_t v11 = [v9 count];
  BOOL v24 = v11 == [v8 count];
  if (*((unsigned char *)v22 + 24))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__PLMemoryJournalEntryPayload_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty___block_invoke;
    v18[3] = &unk_1E586BF40;
    id v19 = v8;
    v20 = &v21;
    [v9 enumerateKeysAndObjectsUsingBlock:v18];

    BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v21, 8);
LABEL_17:

  return v12;
}

void __94__PLMemoryJournalEntryPayload_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
  }
  else {
    id v8 = v7;
  }
  id v9 = v8;
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  char v11 = [v10 isEqual:v9];

  if ((v11 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v39 = a6;
  if ([v10 requiresConversion])
  {
    id v13 = v11;
    v14 = [v10 key];
    int v15 = [v14 isEqualToString:@"movieAssetState"];

    if (v15)
    {
      payloadAttributes = self->super._payloadAttributes;
      objc_super v17 = [v10 key];
      v18 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v17];
      [v13 setMovieAssetState:v18];
    }
    else if ([v10 isEqualToKey:@"userFeedbacks"])
    {
      v37 = v13;
      v38 = v10;
      id v34 = v11;
      v36 = self;
      v22 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"userFeedbacks"];
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = v22;
      uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v47 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v29 = [v28 objectForKeyedSubscript:@"userFeedbackUUID"];
            if (v29)
            {
              v30 = [v37 managedObjectContext];
              v31 = +[PLUserFeedback insertIntoManagedObjectContext:v30 withUUID:v29];

              v32 = [v38 subRelationshipProperties];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __98__PLMemoryJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
              v42[3] = &unk_1E586FCF0;
              v42[4] = v36;
              id v43 = v31;
              id v44 = v39;
              v45 = v28;
              id v33 = v31;
              [v32 enumerateKeysAndObjectsUsingBlock:v42];

              [v23 addObject:v33];
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v25);
      }

      id v13 = v37;
      [v37 setUserFeedbacks:v23];

      id v10 = v38;
      id v11 = v34;
    }
  }
  else
  {
    id v19 = [v10 key];
    int v20 = [v19 isEqualToString:@"viewCount"];

    if (v20)
    {
      uint64_t v21 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"viewCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41.receiver = self;
        v41.super_class = (Class)PLMemoryJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v41 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v39];
      }
    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)PLMemoryJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v40 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v39];
    }
  }
}

uint64_t __98__PLMemoryJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyPayloadProperty:a3 toManagedObject:*(void *)(a1 + 40) key:a2 payloadAttributesToUpdate:*(void *)(a1 + 48) payloadDictionary:*(void *)(a1 + 56) info:0];
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
LABEL_10:
    id v11 = (void *)v10;

    goto LABEL_11;
  }
  if (([v7 isEqualToKey:@"curatedAssets"] & 1) != 0
    || ([v7 isEqualToKey:@"extendedCuratedAssets"] & 1) != 0
    || ([v7 isEqualToKey:@"movieCuratedAssets"] & 1) != 0
    || ([v7 isEqualToKey:@"userCuratedAssets"] & 1) != 0
    || ([v7 isEqualToKey:@"userRemovedAssets"] & 1) != 0
    || [v7 isEqualToKey:@"representativeAssets"])
  {
    id v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    goto LABEL_10;
  }
  if ([v7 isEqualToKey:@"customUserAssets"])
  {
    id v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v9];
    goto LABEL_10;
  }
  v13.receiver = self;
  v13.super_class = (Class)PLMemoryJournalEntryPayload;
  id v11 = [(PLManagedObjectJournalEntryPayload *)&v13 payloadValueFromAttributes:v6 forPayloadProperty:v7];
LABEL_11:

  return v11;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"keyAsset"])
  {
    id v11 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
    v15.receiver = self;
    v15.super_class = (Class)PLMemoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v15 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }
  else if (([v8 isEqualToString:@"curatedAssets"] & 1) != 0 {
         || ([v8 isEqualToString:@"extendedCuratedAssets"] & 1) != 0
  }
         || ([v8 isEqualToString:@"movieCuratedAssets"] & 1) != 0
         || ([v8 isEqualToString:@"userCuratedAssets"] & 1) != 0
         || ([v8 isEqualToString:@"userRemovedAssets"] & 1) != 0
         || [v8 isEqualToString:@"representativeAssets"])
  {
    id v11 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    v14.receiver = self;
    v14.super_class = (Class)PLMemoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v14 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }
  else
  {
    if (![v8 isEqualToString:@"customUserAssets"])
    {
      v12.receiver = self;
      v12.super_class = (Class)PLMemoryJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
      goto LABEL_11;
    }
    id v11 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v9];
    v13.receiver = self;
    v13.super_class = (Class)PLMemoryJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }

LABEL_11:
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if (![v13 isEqualToKey:@"movieAssetState"])
  {
    if ([v13 isEqualToKey:@"keyAsset"])
    {
      objc_super v15 = [v14 keyAsset];
      v16 = [v15 uuid];
      objc_super v17 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v16];
      v18 = [v13 key];
      [v10 setObject:v17 forKeyedSubscript:v18];

      goto LABEL_21;
    }
    if ([v13 isEqualToKey:@"curatedAssets"])
    {
      uint64_t v19 = [v14 curatedAssets];
    }
    else if ([v13 isEqualToKey:@"extendedCuratedAssets"])
    {
      uint64_t v19 = [v14 extendedCuratedAssets];
    }
    else if ([v13 isEqualToKey:@"movieCuratedAssets"])
    {
      uint64_t v19 = [v14 movieCuratedAssets];
    }
    else if ([v13 isEqualToKey:@"userCuratedAssets"])
    {
      uint64_t v19 = [v14 userCuratedAssets];
    }
    else if ([v13 isEqualToKey:@"representativeAssets"])
    {
      uint64_t v19 = [v14 representativeAssets];
    }
    else
    {
      if ([v13 isEqualToKey:@"customUserAssets"])
      {
        int v20 = [v14 customUserAssets];
        uint64_t v21 = [v13 relatedEntityPropertyNames];
        v22 = [v21 anyObject];
        objc_super v15 = [v20 valueForKey:v22];

        uint64_t v23 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringOrderedSet:v15];
LABEL_20:
        v16 = (void *)v23;
        [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v23];
        goto LABEL_21;
      }
      if (![v13 isEqualToKey:@"userRemovedAssets"])
      {
        BOOL v27 = 0;
        goto LABEL_22;
      }
      uint64_t v19 = [v14 userRemovedAssets];
    }
    uint64_t v24 = (void *)v19;
    uint64_t v25 = [v13 relatedEntityPropertyNames];
    uint64_t v26 = [v25 anyObject];
    objc_super v15 = [v24 valueForKey:v26];

    uint64_t v23 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringSet:v15];
    goto LABEL_20;
  }
  objc_super v15 = [v14 movieAssetState];
  v16 = [v13 key];
  [v10 setObject:v15 forKeyedSubscript:v16];
LABEL_21:

  BOOL v27 = 1;
LABEL_22:

  return v27;
}

- (NSOrderedSet)customUserAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customUserAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self orderedSetForUUIDEncodedData:v3];

  return (NSOrderedSet *)v4;
}

- (NSSet)representativeAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"representativeAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (NSSet)userRemovedAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"userRemovedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (NSSet)userCuratedAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"userCuratedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (NSSet)movieCuratedAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"movieCuratedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (NSString)keyAssetUUID
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyAsset"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return (NSString *)v4;
}

- (NSSet)extendedCuratedAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"extendedCuratedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (NSSet)curatedAssetUUIDs
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"curatedAssets"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return (NSSet *)v4;
}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = [v6 set];
  id v9 = [(PLMemoryJournalEntryPayload *)self representativeAssetUUIDs];
  [v8 unionSet:v9];

  id v10 = [(PLMemoryJournalEntryPayload *)self curatedAssetUUIDs];
  [v8 unionSet:v10];

  id v11 = [(PLMemoryJournalEntryPayload *)self extendedCuratedAssetUUIDs];
  [v8 unionSet:v11];

  id v12 = [(PLMemoryJournalEntryPayload *)self movieCuratedAssetUUIDs];
  [v8 unionSet:v12];

  id v13 = [(PLMemoryJournalEntryPayload *)self userCuratedAssetUUIDs];
  [v8 unionSet:v13];

  id v14 = [(PLMemoryJournalEntryPayload *)self userRemovedAssetUUIDs];
  [v8 unionSet:v14];

  objc_super v15 = [(PLMemoryJournalEntryPayload *)self customUserAssetUUIDs];
  v16 = [v15 set];
  [v8 unionSet:v16];

  objc_super v17 = [(PLMemoryJournalEntryPayload *)self keyAssetUUID];
  if (v17) {
    [v8 addObject:v17];
  }
  v18 = [v8 allObjects];
  id v24 = 0;
  unint64_t v19 = +[PLManagedAsset countForAssetsWithUUIDs:v18 includePendingChanges:v4 inManagedObjectContext:v7 error:&v24];

  id v20 = v24;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = self;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in memory metadata %@, %@", buf, 0x16u);
    }
  }
  BOOL v22 = v19 == [v8 count];

  return v22;
}

- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = [(PLMemoryJournalEntryPayload *)self curatedAssetUUIDs];
  [v7 unionSet:v8];

  id v9 = [(PLMemoryJournalEntryPayload *)self extendedCuratedAssetUUIDs];
  [v7 unionSet:v9];

  id v10 = [(PLMemoryJournalEntryPayload *)self movieCuratedAssetUUIDs];
  [v7 unionSet:v10];

  id v11 = [(PLMemoryJournalEntryPayload *)self userCuratedAssetUUIDs];
  [v7 unionSet:v11];

  id v12 = [(PLMemoryJournalEntryPayload *)self userRemovedAssetUUIDs];
  [v7 unionSet:v12];

  id v13 = [(PLMemoryJournalEntryPayload *)self representativeAssetUUIDs];
  [v7 unionSet:v13];

  id v14 = [(PLMemoryJournalEntryPayload *)self keyAssetUUID];

  if (v14)
  {
    objc_super v15 = [(PLMemoryJournalEntryPayload *)self keyAssetUUID];
    [v7 addObject:v15];
  }
  if (v4) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  objc_super v17 = [v7 allObjects];
  v18 = [v6 managedObjectContext];
  uint64_t v64 = v16;
  unint64_t v19 = +[PLManagedAsset assetsWithUUIDs:v17 options:v16 inManagedObjectContext:v18];

  uint64_t v20 = [v19 count];
  BOOL v66 = v20 == [v7 count];
  uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
  BOOL v22 = [(PLMemoryJournalEntryPayload *)self curatedAssetUUIDs];
  uint64_t v23 = [v21 predicateWithFormat:@"%K in %@", @"uuid", v22];
  uint64_t v24 = [v19 filteredArrayUsingPredicate:v23];

  v65 = (void *)v24;
  uint64_t v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
  [v6 setCuratedAssets:v25];

  uint64_t v26 = (void *)MEMORY[0x1E4F28F60];
  __int16 v27 = [(PLMemoryJournalEntryPayload *)self extendedCuratedAssetUUIDs];
  id v28 = [v26 predicateWithFormat:@"%K in %@", @"uuid", v27];
  uint64_t v29 = [v19 filteredArrayUsingPredicate:v28];

  v63 = (void *)v29;
  v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v29];
  [v6 setExtendedCuratedAssets:v30];

  v31 = (void *)MEMORY[0x1E4F28F60];
  v32 = [(PLMemoryJournalEntryPayload *)self movieCuratedAssetUUIDs];
  id v33 = [v31 predicateWithFormat:@"%K in %@", @"uuid", v32];
  uint64_t v34 = [v19 filteredArrayUsingPredicate:v33];

  v62 = (void *)v34;
  v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v34];
  [v6 setMovieCuratedAssets:v35];

  v36 = (void *)MEMORY[0x1E4F28F60];
  v37 = [(PLMemoryJournalEntryPayload *)self userCuratedAssetUUIDs];
  v38 = [v36 predicateWithFormat:@"%K in %@", @"uuid", v37];
  uint64_t v39 = [v19 filteredArrayUsingPredicate:v38];

  v61 = (void *)v39;
  objc_super v40 = [MEMORY[0x1E4F1CAD0] setWithArray:v39];
  [v6 setUserCuratedAssets:v40];

  objc_super v41 = (void *)MEMORY[0x1E4F28F60];
  v42 = [(PLMemoryJournalEntryPayload *)self representativeAssetUUIDs];
  id v43 = [v41 predicateWithFormat:@"%K in %@", @"uuid", v42];
  id v44 = [v19 filteredArrayUsingPredicate:v43];

  v45 = [MEMORY[0x1E4F1CAD0] setWithArray:v44];
  [v6 setRepresentativeAssets:v45];

  long long v46 = (void *)MEMORY[0x1E4F28F60];
  long long v47 = [(PLMemoryJournalEntryPayload *)self userRemovedAssetUUIDs];
  long long v48 = [v46 predicateWithFormat:@"%K in %@", @"uuid", v47];
  long long v49 = [v19 filteredArrayUsingPredicate:v48];

  v50 = [MEMORY[0x1E4F1CAD0] setWithArray:v49];
  [v6 setUserRemovedAssets:v50];

  uint64_t v51 = [(PLMemoryJournalEntryPayload *)self keyAssetUUID];

  if (v51)
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke;
    v71[3] = &unk_1E586BEF0;
    v71[4] = self;
    uint64_t v52 = [v19 indexOfObjectPassingTest:v71];
    if (v52 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v66 = 0;
    }
    else
    {
      v53 = [v19 objectAtIndexedSubscript:v52];
      [v6 setKeyAsset:v53];
    }
  }
  v54 = [(PLMemoryJournalEntryPayload *)self customUserAssetUUIDs];
  v55 = objc_opt_class();
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke_2;
  v67[3] = &unk_1E586BF18;
  id v56 = v54;
  id v68 = v56;
  uint64_t v70 = v64;
  id v57 = v6;
  id v69 = v57;
  v58 = [v55 sortedObjectsToAddWithUUIDs:v56 uuidKey:@"uuid" andExistingObjects:0 fetchBlock:v67];
  if (v58)
  {
    v59 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v58];
    [v57 setCustomUserAssets:v59];
  }
  return v66;
}

uint64_t __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  BOOL v4 = [*(id *)(a1 + 32) keyAssetUUID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) array];
  uint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v5 = +[PLManagedAsset assetsWithUUIDs:v2 options:v3 inManagedObjectContext:v4];

  return v5;
}

- (PLMemoryJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [(id)objc_opt_class() modelProperties];
    id v10 = [v9 objectForKeyedSubscript:@"userFeedbacks"];
    id v11 = [v10 subRelationshipProperties];
    id v12 = [v11 allKeys];
    id v13 = [v8 setWithArray:v12];

    if ([v7 intersectsSet:v13])
    {
      id v14 = [v6 memory];
      objc_super v15 = [v6 payloadID];
      uint64_t v16 = [(id)objc_opt_class() payloadVersion];
      objc_super v17 = [MEMORY[0x1E4F1CAD0] setWithObject:@"userFeedbacks"];
      v18 = [(id)objc_opt_class() modelProperties];
      v21.receiver = self;
      v21.super_class = (Class)PLMemoryJournalEntryPayload;
      unint64_t v19 = [(PLManagedObjectJournalEntryPayload *)&v21 initWithPayloadID:v15 payloadVersion:v16 managedObject:v14 changedKeys:v17 modelProperties:v18];
    }
    else
    {

      unint64_t v19 = 0;
    }
  }
  else
  {

    unint64_t v19 = 0;
  }

  return v19;
}

- (id)insertMemoryFromDataInManagedObjectContext:(id)a3
{
  BOOL v4 = +[PLManagedObject insertInManagedObjectContext:a3];
  uint64_t v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  id v6 = [v5 payloadIDString];
  [v4 setUuid:v6];

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v4 payloadAttributesToUpdate:0];
  return v4;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  BOOL v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"pendingState", a4);
  BOOL v5 = [v4 intValue] == 0;

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
  return +[PLMemory entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLMemoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_59558 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_59558, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_59559;
  return v2;
}

void __67__PLMemoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_59559;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_59559 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLMemoryJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_59560 != -1) {
    dispatch_once(&modelProperties_onceToken_59560, block);
  }
  v2 = (void *)modelProperties_modelProperties_59561;
  return v2;
}

uint64_t __46__PLMemoryJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  uint64_t v3 = (void *)modelProperties_modelProperties_59561;
  modelProperties_modelProperties_59561 = v2;

  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_59561;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v32[20] = *MEMORY[0x1E4F143B8];
  v31[0] = @"graphMemoryIdentifier";
  id v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[0] = v28;
  v31[1] = @"storyColorGradeKind";
  __int16 v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[1] = v27;
  v31[2] = @"storySerializedTitleCategory";
  uint64_t v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[2] = v26;
  v31[3] = @"cloudDeleteState";
  uint64_t v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[3] = v25;
  v31[4] = @"cloudLocalState";
  uint64_t v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[4] = v24;
  v31[5] = @"lastMoviePlayedDate";
  uint64_t v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[5] = v23;
  v31[6] = @"lastViewedDate";
  BOOL v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[6] = v22;
  v31[7] = @"lastEnrichmentDate";
  objc_super v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[7] = v21;
  v31[8] = @"pendingPlayCount";
  uint64_t v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[8] = v20;
  v31[9] = @"pendingShareCount";
  unint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[9] = v19;
  v31[10] = @"pendingViewCount";
  v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[10] = v18;
  v31[11] = @"featuredState";
  objc_super v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[11] = v17;
  v31[12] = @"syndicatedContentState";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[12] = v16;
  v31[13] = @"sharingComposition";
  objc_super v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[13] = v15;
  v31[14] = @"searchIndexRebuildState";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[14] = v14;
  v31[15] = @"startDate";
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[15] = v13;
  v31[16] = @"endDate";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[16] = v2;
  v31[17] = @"sourceGeneratedMemory";
  uint64_t v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[17] = v3;
  v31[18] = @"targetUserEditedMemory";
  BOOL v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v32[18] = v4;
  v31[19] = @"userFeedbacks";
  v29[0] = @"cloudDeleteState";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v30[0] = v5;
  v29[1] = @"cloudLocalState";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v30[1] = v6;
  v29[2] = @"memory";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v30[2] = v7;
  v29[3] = @"person";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v30[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v9 subRelationshipEntityName:0 isToMany:1 isAdditionalEntityName:1 info:0];
  v32[19] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:20];

  return v11;
}

+ (id)modelPropertiesDescription
{
  v55[31] = *MEMORY[0x1E4F143B8];
  v54[0] = @"uuid";
  uint64_t v51 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v55[0] = v51;
  v54[1] = @"title";
  v50 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[1] = v50;
  v54[2] = @"subtitle";
  long long v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[2] = v49;
  v54[3] = @"creationDate";
  long long v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[3] = v48;
  v54[4] = @"assetListPredicate";
  long long v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[4] = v47;
  v54[5] = @"blacklistedFeature";
  long long v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[5] = v46;
  v54[6] = @"category";
  v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[6] = v45;
  v54[7] = @"favorite";
  id v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[7] = v44;
  v54[8] = @"movieAssetState";
  id v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[8] = v43;
  v54[9] = @"movieData";
  v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[9] = v42;
  v54[10] = @"notificationState";
  objc_super v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[10] = v41;
  v54[11] = @"pendingState";
  objc_super v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"pending" andType:100 info:0];
  v55[11] = v40;
  v54[12] = @"creationType";
  uint64_t v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"creationType" andType:100 info:0];
  v55[12] = v39;
  v54[13] = @"photosGraphData";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[13] = v38;
  v54[14] = @"photosGraphVersion";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[14] = v37;
  v54[15] = @"playCount";
  v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[15] = v36;
  v54[16] = @"rejected";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[16] = v35;
  v54[17] = @"score";
  uint64_t v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[17] = v34;
  v54[18] = @"shareCount";
  id v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[18] = v33;
  v54[19] = @"subcategory";
  v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[19] = v32;
  v54[20] = @"userActionOptions";
  v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userCreated" andType:100 info:0];
  v55[20] = v31;
  v54[21] = @"viewCount";
  v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55[21] = v30;
  v54[22] = @"keyAsset";
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"keyAsset" relatedEntityPropertyNames:v2 shouldPrefetchRelationship:1];

  v55[22] = v29;
  v54[23] = @"curatedAssets";
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  id v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"curatedAssets" relatedEntityPropertyNames:v3 shouldPrefetchRelationship:1];

  v55[23] = v28;
  v54[24] = @"extendedCuratedAssets";
  BOOL v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  __int16 v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"extendedCuratedAssets" relatedEntityPropertyNames:v4 shouldPrefetchRelationship:1];

  v55[24] = v27;
  v54[25] = @"movieCuratedAssets";
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"movieCuratedAssets" relatedEntityPropertyNames:v5 shouldPrefetchRelationship:1];

  v55[25] = v26;
  v54[26] = @"userCuratedAssets";
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userCuratedAssets" relatedEntityPropertyNames:v6 shouldPrefetchRelationship:1];

  v55[26] = v25;
  v54[27] = @"representativeAssets";
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"representativeAssets" relatedEntityPropertyNames:v7 shouldPrefetchRelationship:1];

  v55[27] = v24;
  v54[28] = @"customUserAssets";
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  uint64_t v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"customUserAssets" relatedEntityPropertyNames:v8 shouldPrefetchRelationship:1];

  v55[28] = v23;
  v54[29] = @"userRemovedAssets";
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  BOOL v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userRemovedAssets" relatedEntityPropertyNames:v9 shouldPrefetchRelationship:1];

  v55[29] = v22;
  v54[30] = @"userFeedbacks";
  uint64_t v10 = +[PLUserFeedback entityName];
  v52[0] = @"uuid";
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackUUID" andType:700 info:0];
  v53[0] = v11;
  v52[1] = @"type";
  id v12 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackType" andType:100 info:0];
  v53[1] = v12;
  v52[2] = @"feature";
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackFeature" andType:100 info:0];
  v53[2] = v13;
  v52[3] = @"creationType";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackCreationType" andType:100 info:0];
  v53[3] = v14;
  v52[4] = @"context";
  objc_super v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackContext" andType:700 info:0];
  v53[4] = v15;
  v52[5] = @"lastModifiedDate";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackLastModifiedDate" andType:900 info:0];
  v53[5] = v16;
  objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:6];
  v18 = (void *)v10;
  unint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbacks" subRelationshipProperties:v17 subRelationshipEntityName:v10 isToMany:1 isAdditionalEntityName:1 info:0];
  v55[30] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:31];

  return v20;
}

@end