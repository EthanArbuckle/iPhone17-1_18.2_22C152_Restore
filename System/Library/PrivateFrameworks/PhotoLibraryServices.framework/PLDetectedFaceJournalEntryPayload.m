@interface PLDetectedFaceJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)insertFaceFromDataInManagedObjectContext:(id)a3 allowDeferred:(BOOL *)a4;
- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4;
- (BOOL)isClusterRejected;
- (BOOL)isDeferrable;
- (BOOL)isHidden;
- (BOOL)isKeyFace;
- (BOOL)isManual;
- (BOOL)isRepresentative;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSSet)assetIdentifiers;
- (NSString)assetUUID;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)size;
- (id)_insertDeferredRebuildFaceForPersonUUID:(id)a3 inManagedObjectContext:(id)a4;
- (id)_insertDeferredRebuildFacesFromDataInManagedObjectContext:(id)a3;
- (id)_insertDetectedFaceWithAsset:(id)a3 inManagedObjectContext:(id)a4 checkExisting:(BOOL)a5;
- (id)clusterRejectedPersonsUUIDs;
- (id)detectionType;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (id)personUUID;
- (id)rejectedPersonsUUIDs;
- (int)cloudNameSource;
- (int)faceAlgorithmVersion;
- (int)nameSource;
- (int64_t)assetIdentifierType;
- (unint64_t)assetIdentifierCount;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)setAssetUUID:(id)a3;
- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3;
@end

@implementation PLDetectedFaceJournalEntryPayload

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToKey:@"asset"])
  {
    if ([(PLDetectedFaceJournalEntryPayload *)self assetIdentifierType])
    {
      if ([(PLDetectedFaceJournalEntryPayload *)self assetIdentifierType] != 1)
      {
        uint64_t v12 = 0;
        goto LABEL_11;
      }
      v11 = @"cloudAssetGUID";
    }
    else
    {
      v11 = @"uuid";
    }
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
LABEL_11:
    if (!(v8 | v12))
    {
      BOOL v14 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v15 = (void *)v12;
    uint64_t v16 = v8;
    goto LABEL_14;
  }
  if (([v10 isEqualToKey:@"rejectedPersons"] & 1) != 0
    || [v10 isEqualToKey:@"clusterRejectedPersons"])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    char v13 = [(id)v12 isEqualToSet:v8];
LABEL_15:
    BOOL v14 = v13;
    goto LABEL_16;
  }
  if ([v10 isEqualToKey:@"personBeingKeyFace"])
  {
    if (![(id)v8 BOOLValue])
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    uint64_t v12 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];
    v15 = v9;
    uint64_t v16 = v12;
LABEL_14:
    char v13 = [v15 isEqualToString:v16];
    goto LABEL_15;
  }
  if ([v10 isEqualToKey:@"person"])
  {
    unsigned __int8 v18 = [v9 isEqualToString:v8];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    unsigned __int8 v18 = [(PLManagedObjectJournalEntryPayload *)&v19 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
  }
  BOOL v14 = v18;
LABEL_17:

  return v14;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToKey:@"asset"] & 1) != 0
    || [v7 isEqualToKey:@"person"])
  {
    unint64_t v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
LABEL_7:
    v11 = (void *)v10;

    goto LABEL_8;
  }
  if (([v7 isEqualToKey:@"rejectedPersons"] & 1) != 0
    || [v7 isEqualToKey:@"clusterRejectedPersons"])
  {
    unint64_t v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)PLDetectedFaceJournalEntryPayload;
  v11 = [(PLManagedObjectJournalEntryPayload *)&v13 payloadValueFromAttributes:v6 forPayloadProperty:v7];
LABEL_8:

  return v11;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 isEqualToString:@"asset"] & 1) != 0
    || [v8 isEqualToString:@"person"])
  {
    v11 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v14 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }
  else
  {
    if (([v8 isEqualToString:@"rejectedPersons"] & 1) == 0
      && ![v8 isEqualToString:@"clusterRejectedPersons"])
    {
      v12.receiver = self;
      v12.super_class = (Class)PLDetectedFaceJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
      goto LABEL_8;
    }
    v11 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    v13.receiver = self;
    v13.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }

LABEL_8:
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if (![v13 isEqualToKey:@"asset"])
  {
    if (([v13 isEqualToKey:@"rejectedPersons"] & 1) != 0
      || [v13 isEqualToKey:@"clusterRejectedPersons"])
    {
      if ([v13 isEqualToKey:@"clusterRejectedPersons"]) {
        [v14 clusterRejectedPersons];
      }
      else {
      uint64_t v16 = [v14 rejectedPersons];
      }
      unsigned __int8 v18 = [v13 relatedEntityPropertyNames];
      objc_super v19 = [v18 anyObject];
      v20 = [v16 valueForKey:v19];

      v21 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringSet:v20];
      [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v21];
    }
    else
    {
      if ([v13 isEqualToKey:@"person"])
      {
        uint64_t v16 = [v14 associatedPersonForFaceOrTorso:1 orTemporal:0];
        v20 = [v16 personUUID];
        v28 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v20];
        v29 = [v13 key];
        [v10 setObject:v28 forKeyedSubscript:v29];
      }
      else
      {
        if (![v13 isEqualToKey:@"personBeingKeyFace"])
        {
          BOOL v26 = 0;
          goto LABEL_17;
        }
        v30 = NSNumber;
        uint64_t v16 = [v14 personBeingKeyFace];
        v20 = [v30 numberWithInt:v16 != 0];
        v28 = [v13 key];
        [v10 setObject:v20 forKeyedSubscript:v28];
      }
    }
LABEL_16:

    BOOL v26 = 1;
LABEL_17:

    return v26;
  }
  v15 = [v14 associatedAssetForFaceOrTorso:1 orTemporal:0];
  if (v15)
  {
    uint64_t v16 = v15;
    v17 = [v15 cloudAssetGUID];
    if (v17) {
      [v16 cloudAssetGUID];
    }
    else {
    v22 = [v16 uuid];
    }
    v23 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v22];
    v24 = [v13 key];
    [v10 setObject:v23 forKeyedSubscript:v24];

    v20 = [v16 cloudAssetGUID];
    if (v20) {
      v25 = &unk_1EEBEF690;
    }
    else {
      v25 = &unk_1EEBEF6A8;
    }
    [v10 setObject:v25 forKeyedSubscript:@"assetIDType"];
    goto LABEL_16;
  }
  v31 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  return [(PLDetectedFaceJournalEntryPayload *)v31 faceAlgorithmVersion];
}

- (int)faceAlgorithmVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"faceAlgorithmVersion"];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)isDeferrable
{
  [(PLDetectedFaceJournalEntryPayload *)self centerX];
  if (v3 == 0.0) {
    return 0;
  }
  [(PLDetectedFaceJournalEntryPayload *)self bodyCenterX];
  if (v4 != 0.0) {
    return 0;
  }
  v5 = [(PLDetectedFaceJournalEntryPayload *)self detectionType];
  if (v5)
  {
    id v6 = [(PLDetectedFaceJournalEntryPayload *)self detectionType];
    BOOL v7 = [v6 integerValue] == 1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)clusterRejectedPersonsUUIDs
{
  double v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"clusterRejectedPersons"];
  double v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return v4;
}

- (id)rejectedPersonsUUIDs
{
  double v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"rejectedPersons"];
  double v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return v4;
}

- (BOOL)isClusterRejected
{
  v2 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  return [(PLDetectedFaceJournalEntryPayload *)v2 cloudNameSource];
}

- (int)cloudNameSource
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"cloudNameSource"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)nameSource
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"nameSource"];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)isRepresentative
{
  v2 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  return [(PLDetectedFaceJournalEntryPayload *)v2 isManual];
}

- (BOOL)isManual
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"manual"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isHidden
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"hidden"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)detectionType
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"detectionType"];
}

- (double)bodyHeight
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bodyHeight"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)bodyWidth
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bodyWidth"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)bodyCenterY
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bodyCenterY"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)bodyCenterX
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bodyCenterX"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)size
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"size"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)centerY
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"centerY"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)centerX
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"centerX"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setAssetUUID:(id)a3
{
  id v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"asset"];
}

- (NSString)assetUUID
{
  double v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"asset"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return (NSString *)v4;
}

- (BOOL)isKeyFace
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"personBeingKeyFace"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)personUUID
{
  char v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"person"];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return v4;
}

- (int64_t)assetIdentifierType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"assetIDType"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3
{
  id v5 = [a3 allValues];
  id v4 = [v5 firstObject];
  [(PLDetectedFaceJournalEntryPayload *)self setAssetUUID:v4];
}

- (unint64_t)assetIdentifierCount
{
  v2 = [(PLDetectedFaceJournalEntryPayload *)self assetUUID];
  unint64_t v3 = v2 != 0;

  return v3;
}

- (NSSet)assetIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(PLDetectedFaceJournalEntryPayload *)self assetUUID];
  if (v4) {
    [v3 addObject:v4];
  }

  return (NSSet *)v3;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 anyObject];
  id v8 = [(PLDetectedFaceJournalEntryPayload *)self _insertDetectedFaceWithAsset:v7 inManagedObjectContext:v6 checkExisting:1];

  return v8 != 0;
}

- (BOOL)insertFaceFromDataInManagedObjectContext:(id)a3 allowDeferred:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = +[PLCloudAssetPayloadRestore assetForPayload:self inManagedObjectContext:v6];
  if (v7)
  {
    uint64_t v8 = [(PLDetectedFaceJournalEntryPayload *)self _insertDetectedFaceWithAsset:v7 inManagedObjectContext:v6 checkExisting:0];
    id v9 = (void *)v8;
  }
  else
  {
    if (a4)
    {
      if (*a4)
      {
        id v9 = [(PLDetectedFaceJournalEntryPayload *)self _insertDeferredRebuildFacesFromDataInManagedObjectContext:v6];
      }
      else
      {
        id v9 = 0;
      }
      *a4 = [v9 count] != 0;
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v8 = [v9 count];
  }
  BOOL v10 = v8 != 0;

  return v10;
}

- (id)_insertDeferredRebuildFacesFromDataInManagedObjectContext:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLDetectedFaceJournalEntryPayload *)self isDeferrable])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(PLDetectedFaceJournalEntryPayload *)self assetIdentifierType] == 1)
    {
      id v6 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];

      if (v6)
      {
        BOOL v7 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];
        uint64_t v8 = [(PLDetectedFaceJournalEntryPayload *)self _insertDeferredRebuildFaceForPersonUUID:v7 inManagedObjectContext:v4];

        if (v8)
        {
          if ([(PLDetectedFaceJournalEntryPayload *)self isKeyFace]) {
            [v8 setRepresentative:1];
          }
          [v5 addObject:v8];
        }
      }
      id v9 = [(PLDetectedFaceJournalEntryPayload *)self rejectedPersonsUUIDs];
      BOOL v10 = [(PLDetectedFaceJournalEntryPayload *)self clusterRejectedPersonsUUIDs];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [(PLDetectedFaceJournalEntryPayload *)self _insertDeferredRebuildFaceForPersonUUID:*(void *)(*((void *)&v30 + 1) + 8 * i) inManagedObjectContext:v4];
            uint64_t v16 = v15;
            if (v15)
            {
              [v15 setRejected:1];
              [v16 setClusterRejected:1];
              [v5 addObject:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v9;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
            if ((objc_msgSend(v10, "containsObject:", v22, (void)v26) & 1) == 0)
            {
              v23 = [(PLDetectedFaceJournalEntryPayload *)self _insertDeferredRebuildFaceForPersonUUID:v22 inManagedObjectContext:v4];
              v24 = v23;
              if (v23)
              {
                [v23 setRejected:1];
                [v5 addObject:v24];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v19);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_insertDetectedFaceWithAsset:(id)a3 inManagedObjectContext:(id)a4 checkExisting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [[PLFaceRebuildHelper alloc] initWithContext:v9];
  uint64_t v11 = v10;
  if (v5
    && ([(PLFaceRebuildHelper *)v10 findExistingDetectedFaceForRebuildFace:self onAsset:v8], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = (void *)v12;
    id v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v13 uuid];
      *(_DWORD *)buf = 138543618;
      v63 = v15;
      __int16 v64 = 2112;
      v65 = self;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Found existing DetectedFace (%{public}@) for payload: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v13 = [(PLFaceRebuildHelper *)v11 insertDetectedFaceForRebuildFace:self onAsset:v8];
    if (!v13) {
      goto LABEL_47;
    }
    v47 = v11;
    uint64_t v16 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
    id v17 = [v16 payloadIDString];
    [v13 setUuid:v17];

    uint64_t v18 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];

    uint64_t v19 = off_1E585F000;
    if (v18)
    {
      uint64_t v20 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];
      v21 = +[PLPerson personWithUUID:v20 inManagedObjectContext:v9];

      if (v21)
      {
        [v13 setAssociatedPerson:v21];
        if ([(PLDetectedFaceJournalEntryPayload *)self isKeyFace])
        {
          uint64_t v22 = [v21 keyFace];

          if (!v22) {
            objc_msgSend(v21, "setKeyFace:pickSource:", v13, objc_msgSend(v21, "keyFacePickSource"));
          }
        }
        if ((_PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass((void *)*MEMORY[0x1E4F17570]) & 1) == 0
          && ([(PLDetectedFaceJournalEntryPayload *)self nameSource] == 1
           || [(PLDetectedFaceJournalEntryPayload *)self nameSource] == 5))
        {
          [v13 setConfirmedFaceCropGenerationState:1];
        }
      }
      else
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = [(PLDetectedFaceJournalEntryPayload *)self personUUID];
          v25 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
          *(_DWORD *)buf = 138543874;
          v63 = v24;
          __int16 v64 = 2114;
          v65 = v25;
          __int16 v66 = 2112;
          v67 = self;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);
        }
      }
    }
    id v48 = v8;
    v46 = [(PLDetectedFaceJournalEntryPayload *)self rejectedPersonsUUIDs];
    v51 = self;
    long long v26 = [(PLDetectedFaceJournalEntryPayload *)self clusterRejectedPersonsUUIDs];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v56 objects:v61 count:16];
    id v50 = v9;
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v57 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = +[PLPerson personWithUUID:*(void *)(*((void *)&v56 + 1) + 8 * i) inManagedObjectContext:v9];
          if (v31)
          {
            [v13 addRejectedPerson:v31];
            [v13 addClusterRejectedPerson:v31];
            [v13 addRejectedPersonNeedingFaceCrops:v31];
          }
          else
          {
            long long v32 = PLMigrationGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              long long v33 = [(PLDetectedFaceJournalEntryPayload *)v51 personUUID];
              v34 = [(PLManagedObjectJournalEntryPayload *)v51 payloadID];
              *(_DWORD *)buf = 138543874;
              v63 = v33;
              __int16 v64 = 2114;
              v65 = v34;
              __int16 v66 = 2112;
              v67 = v51;
              id v9 = v50;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Cluster rejected person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);

              uint64_t v19 = off_1E585F000;
            }
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v28);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v14 = v46;
    uint64_t v35 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v53;
      v49 = v13;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v14);
          }
          uint64_t v39 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          if (([v26 containsObject:v39] & 1) == 0)
          {
            v40 = [(__objc2_class *)v19[132] personWithUUID:v39 inManagedObjectContext:v9];
            if (v40)
            {
              [v13 addRejectedPerson:v40];
            }
            else
            {
              v41 = PLMigrationGetLog();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v42 = [(PLDetectedFaceJournalEntryPayload *)v51 personUUID];
                [(PLManagedObjectJournalEntryPayload *)v51 payloadID];
                v43 = v14;
                v44 = (PLDetectedFaceJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v63 = v42;
                __int16 v64 = 2114;
                v65 = v44;
                __int16 v66 = 2112;
                v67 = v51;
                id v9 = v50;
                _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Rejected person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);

                id v14 = v43;
                uint64_t v13 = v49;

                uint64_t v19 = off_1E585F000;
              }
            }
          }
        }
        uint64_t v36 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v36);
    }

    uint64_t v11 = v47;
    id v8 = v48;
  }

LABEL_47:
  return v13;
}

- (id)_insertDeferredRebuildFaceForPersonUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  BOOL v7 = +[PLManagedObject insertInManagedObjectContext:a4];
  id v8 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  id v9 = [v8 payloadIDString];
  [v7 setFaceUUID:v9];

  BOOL v10 = [MEMORY[0x1E4F8BA08] UUIDString];
  [v7 setUuid:v10];

  [(PLDetectedFaceJournalEntryPayload *)self centerX];
  objc_msgSend(v7, "setCenterX:");
  [(PLDetectedFaceJournalEntryPayload *)self centerY];
  objc_msgSend(v7, "setCenterY:");
  [(PLDetectedFaceJournalEntryPayload *)self size];
  objc_msgSend(v7, "setSize:");
  objc_msgSend(v7, "setManual:", -[PLDetectedFaceJournalEntryPayload isManual](self, "isManual"));
  objc_msgSend(v7, "setHidden:", -[PLDetectedFaceJournalEntryPayload isHidden](self, "isHidden"));
  objc_msgSend(v7, "setNameSource:", -[PLDetectedFaceJournalEntryPayload nameSource](self, "nameSource"));
  objc_msgSend(v7, "setCloudNameSource:", -[PLDetectedFaceJournalEntryPayload cloudNameSource](self, "cloudNameSource"));
  uint64_t v11 = [(PLDetectedFaceJournalEntryPayload *)self assetUUID];
  [v7 setAssetCloudGUID:v11];

  uint64_t v12 = [(PLDetectedFaceJournalEntryPayload *)self assetUUID];
  [v7 setAssetUUID:v12];

  [v7 setPersonUUID:v6];
  if ([(PLDetectedFaceJournalEntryPayload *)self faceAlgorithmVersion]) {
    uint64_t v13 = [(PLDetectedFaceJournalEntryPayload *)self faceAlgorithmVersion];
  }
  else {
    uint64_t v13 = 1;
  }
  [v7 setFaceAlgorithmVersion:v13];
  return v7;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (!a4)
  {
    id v9 = [v6 objectForKeyedSubscript:@"nameSource"];
    unsigned int v10 = [v9 integerValue];

    uint64_t v11 = [v7 objectForKeyedSubscript:@"manual"];
    char v12 = [v11 BOOLValue];
    if ((v12 & 1) != 0 || (BOOL v8 = 0, v10 <= 5) && ((1 << v10) & 0x2A) != 0)
    {
      id v4 = [v7 objectForKeyedSubscript:@"assetForFace.uuid"];
      if (v4)
      {
        BOOL v8 = 1;
        if (v12) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v13 = [v7 objectForKeyedSubscript:@"assetForFace.cloudAssetGUID"];
        BOOL v8 = v13 != 0;

        if (v12)
        {
LABEL_12:

LABEL_13:
          goto LABEL_14;
        }
      }
    }
    if (v10 > 5 || ((1 << v10) & 0x2A) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v8 = 1;
LABEL_14:

  return v8;
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
  return +[PLDetectedFace entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PLDetectedFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_72057 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_72057, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_72058;
  return v2;
}

void __73__PLDetectedFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_72058;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_72058 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PLDetectedFaceJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_72059 != -1) {
    dispatch_once(&modelProperties_onceToken_72059, block);
  }
  v2 = (void *)modelProperties_modelProperties_72060;
  return v2;
}

uint64_t __52__PLDetectedFaceJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_72060;
  modelProperties_modelProperties_72060 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_72060;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v60[55] = *MEMORY[0x1E4F143B8];
  v59[0] = @"adjustmentVersion";
  long long v58 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[0] = v58;
  v59[1] = @"ageType";
  long long v57 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[1] = v57;
  v59[2] = @"assetVisible";
  long long v56 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[2] = v56;
  v59[3] = @"blurScore";
  long long v55 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[3] = v55;
  v59[4] = @"clusterSequenceNumber";
  long long v54 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[4] = v54;
  v59[5] = @"vuObservationID";
  long long v53 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[5] = v53;
  v59[6] = @"confirmedFaceCropGenerationState";
  long long v52 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[6] = v52;
  v59[7] = @"eyeMakeupType";
  v51 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[7] = v51;
  v59[8] = @"duration";
  id v50 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[8] = v50;
  v59[9] = @"eyesState";
  v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[9] = v49;
  v59[10] = @"facialHairType";
  id v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[10] = v48;
  v59[11] = @"genderType";
  v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[11] = v47;
  v59[12] = @"glassesType";
  v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[12] = v46;
  v59[13] = @"groupingIdentifier";
  v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[13] = v45;
  v59[14] = @"hairColorType";
  v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[14] = v44;
  v59[15] = @"hasSmile";
  v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[15] = v43;
  v59[16] = @"isLeftEyeClosed";
  v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[16] = v42;
  v59[17] = @"isRightEyeClosed";
  v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[17] = v41;
  v59[18] = @"lipMakeupType";
  v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[18] = v40;
  v59[19] = @"faceExpressionType";
  uint64_t v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[19] = v39;
  v59[20] = @"headgearType";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[20] = v38;
  v59[21] = @"hairType";
  uint64_t v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[21] = v37;
  v59[22] = @"poseType";
  uint64_t v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[22] = v36;
  v59[23] = @"skintoneType";
  uint64_t v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[23] = v35;
  v59[24] = @"ethnicityType";
  v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[24] = v34;
  v59[25] = @"hasFaceMask";
  long long v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[25] = v33;
  v59[26] = @"gazeType";
  long long v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[26] = v32;
  v59[27] = @"gazeCenterX";
  long long v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[27] = v31;
  v59[28] = @"gazeCenterY";
  long long v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[28] = v30;
  v59[29] = @"gazeRectString";
  uint64_t v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[29] = v29;
  v59[30] = @"gazeAngle";
  uint64_t v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[30] = v28;
  v59[31] = @"gazeConfidence";
  uint64_t v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[31] = v27;
  v59[32] = @"masterIdentifier";
  long long v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[32] = v26;
  v59[33] = @"roll";
  v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[33] = v25;
  v59[34] = @"poseYaw";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[34] = v24;
  v59[35] = @"qualityMeasure";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[35] = v23;
  v59[36] = @"quality";
  uint64_t v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[36] = v22;
  v59[37] = @"smileType";
  v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[37] = v21;
  v59[38] = @"sourceHeight";
  uint64_t v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[38] = v20;
  v59[39] = @"sourceWidth";
  uint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[39] = v19;
  v59[40] = @"startTime";
  uint64_t v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[40] = v18;
  v59[41] = @"cloudLocalState";
  id v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[41] = v17;
  v59[42] = @"isInTrash";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[42] = v16;
  v59[43] = @"trainingType";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[43] = v15;
  v59[44] = @"vipModelType";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[44] = v14;
  v59[45] = @"assetForTorso";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[45] = v2;
  v59[46] = @"personForTorso";
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[46] = v3;
  v59[47] = @"assetForTemporalDetectedFaces";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[47] = v4;
  v59[48] = @"personForTemporalDetectedFaces";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[48] = v5;
  v59[49] = @"faceCrop";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[49] = v6;
  v59[50] = @"faceGroup";
  BOOL v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[50] = v7;
  v59[51] = @"faceGroupBeingKeyFace";
  BOOL v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[51] = v8;
  v59[52] = @"faceprint";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[52] = v9;
  v59[53] = @"rejectedPersonsNeedingFaceCrops";
  unsigned int v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[53] = v10;
  v59[54] = @"detectionTraits";
  uint64_t v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v60[54] = v11;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:55];

  return v13;
}

+ (id)modelPropertiesDescription
{
  v31[19] = *MEMORY[0x1E4F143B8];
  v30[0] = @"uuid";
  uint64_t v28 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v31[0] = v28;
  v30[1] = @"centerX";
  uint64_t v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[1] = v27;
  v30[2] = @"centerY";
  long long v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[2] = v26;
  v30[3] = @"size";
  v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[3] = v25;
  v30[4] = @"bodyCenterX";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[4] = v24;
  v30[5] = @"bodyCenterY";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[5] = v23;
  v30[6] = @"bodyWidth";
  uint64_t v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[6] = v22;
  v30[7] = @"bodyHeight";
  v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[7] = v21;
  v30[8] = @"detectionType";
  uint64_t v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[8] = v20;
  v30[9] = @"nameSource";
  uint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[9] = v19;
  v30[10] = @"cloudNameSource";
  uint64_t v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[10] = v18;
  v30[11] = @"hidden";
  id v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[11] = v17;
  v30[12] = @"manual";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[12] = v16;
  v30[13] = @"faceAlgorithmVersion";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31[13] = v2;
  v30[14] = @"assetForFace";
  v29[0] = @"uuid";
  v29[1] = @"cloudAssetGUID";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"asset" relatedEntityPropertyNames:v4 shouldPrefetchRelationship:1];

  v31[14] = v5;
  v30[15] = @"rejectedPersons";
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  BOOL v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"rejectedPersons" relatedEntityPropertyNames:v6 shouldPrefetchRelationship:1];

  v31[15] = v7;
  v30[16] = @"clusterRejectedPersons";
  BOOL v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"clusterRejectedPersons" relatedEntityPropertyNames:v8 shouldPrefetchRelationship:1];

  v31[16] = v9;
  v30[17] = @"personForFace";
  unsigned int v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  uint64_t v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"person" relatedEntityPropertyNames:v10 shouldPrefetchRelationship:1];

  v31[17] = v11;
  v30[18] = @"personBeingKeyFace";
  char v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"personBeingKeyFace" relatedEntityPropertyNames:v12 shouldPrefetchRelationship:1];

  v31[18] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:19];

  return v14;
}

@end