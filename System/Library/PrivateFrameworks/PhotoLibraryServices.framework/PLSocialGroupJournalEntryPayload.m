@interface PLSocialGroupJournalEntryPayload
+ (id)entityName;
+ (id)fetchPredicateInContext:(id)a3;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)payloadAdapterForManagedObject:(id)a3;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6;
- (id)insertSocialGroupInManagedObjectContext:(id)a3;
- (id)keyAssetUUID;
- (id)memberPersonUUIDs;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (int64_t)keyAssetPickSource;
- (signed)socialGroupVerifiedType;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
@end

@implementation PLSocialGroupJournalEntryPayload

- (signed)socialGroupVerifiedType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"verifiedType"];
  signed __int16 v3 = [v2 integerValue];

  return v3;
}

- (int64_t)keyAssetPickSource
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyAssetPickSource"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)memberPersonUUIDs
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"members"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v3];

  return v4;
}

- (id)keyAssetUUID
{
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyAsset"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return v4;
}

- (id)insertSocialGroupInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[PLSocialGroup newNodeContainerWithManagedObjectContext:v4];
  v6 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v7 = [v6 payloadIDString];
  [v5 setUuid:v7];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__44536;
  v18[4] = __Block_byref_object_dispose__44537;
  id v19 = 0;
  v8 = [(id)objc_opt_class() modelProperties];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke;
  v14[3] = &unk_1E586A2B0;
  v14[4] = self;
  id v9 = v5;
  id v15 = v9;
  v17 = v18;
  id v10 = v4;
  id v16 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  v11 = v16;
  id v12 = v9;

  _Block_object_dispose(v18, 8);
  return v12;
}

void __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v8 = [v6 key];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    goto LABEL_29;
  }
  if (([v6 requiresConversion] & 1) == 0
    && ([v6 isEqualToKey:@"keyAssetPickSource"] & 1) == 0
    && ([v6 isEqualToKey:@"verifiedType"] & 1) == 0)
  {
    [*(id *)(a1 + 40) setValue:v9 forKey:v5];
    goto LABEL_29;
  }
  if (![v6 isEqualToKey:@"verifiedType"])
  {
    if (![v6 isEqualToKey:@"keyAsset"])
    {
      if ([v6 isEqualToKey:@"members"])
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v26 = [*(id *)(a1 + 32) memberPersonUUIDs];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke_84;
        v38[3] = &unk_1E586A288;
        id v39 = *(id *)(a1 + 48);
        v13 = v25;
        uint64_t v27 = *(void *)(a1 + 32);
        v40 = v13;
        uint64_t v41 = v27;
        [v26 enumerateObjectsUsingBlock:v38];

        v28 = *(void **)(a1 + 40);
        uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
        id v37 = *(id *)(v29 + 40);
        char v30 = [v28 setMembers:v13 error:&v37];
        objc_storeStrong((id *)(v29 + 40), v37);
        if ((v30 & 1) == 0)
        {
          v31 = PLMigrationGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138412290;
            v46 = v32;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "insertSocialGroupInManagedObjectContext: error setting social group members: %@", buf, 0xCu);
          }
        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    id v15 = [*(id *)(a1 + 32) keyAssetUUID];
    v13 = +[PLManagedAsset assetWithUUID:v15 inManagedObjectContext:*(void *)(a1 + 48)];

    if (!v13)
    {
      v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v33 = [*(id *)(a1 + 32) keyAssetUUID];
        v34 = [*(id *)(a1 + 32) payloadID];
        uint64_t v35 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v46 = v33;
        __int16 v47 = 2114;
        v48 = v34;
        __int16 v49 = 2112;
        uint64_t v50 = v35;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Key asset %{public}@ not found for social group %{public}@ with payload: %@", buf, 0x20u);
      }
      goto LABEL_27;
    }
    id v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v43 = *(id *)(v17 + 40);
    char v18 = [v16 setKeyAsset:v13 error:&v43];
    objc_storeStrong((id *)(v17 + 40), v43);
    if (v18)
    {
      id v19 = *(void **)(a1 + 40);
      uint64_t v20 = [*(id *)(a1 + 32) keyAssetPickSource];
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      id v42 = *(id *)(v21 + 40);
      LOBYTE(v19) = [v19 setKeyAssetPickSource:v20 error:&v42];
      objc_storeStrong((id *)(v21 + 40), v42);
      if (v19)
      {
LABEL_28:

        goto LABEL_29;
      }
      v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v46 = v23;
        v24 = "insertSocialGroupInManagedObjectContext: error setting social group key asset pick source: %@";
LABEL_26:
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
      }
    }
    else
    {
      v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v36 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v46 = v36;
        v24 = "insertSocialGroupInManagedObjectContext: error setting social group key asset: %@";
        goto LABEL_26;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) socialGroupVerifiedType];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v12 + 40);
  LOBYTE(v10) = [v10 setSocialGroupVerifiedType:v11 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v10 & 1) == 0)
  {
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v46 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "insertSocialGroupInManagedObjectContext: error setting social group verified type: %@", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:
}

void __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PLPerson personWithUUID:v3 inManagedObjectContext:*(void *)(a1 + 32)];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 48) payloadID];
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138543874;
      id v9 = v3;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Social group member %{public}@ not found for social group %{public}@ with payload: %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToKey:@"members"])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    char v12 = [v11 isEqualToSet:v8];
  }
  else
  {
    if ([v10 isEqualToKey:@"keyAsset"])
    {
      uint64_t v13 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyAssetPickSource"];
      uint64_t v14 = [v13 integerValue];

      if (v14 != 1)
      {
        char v12 = v8 == 0;
        goto LABEL_9;
      }
      unsigned __int8 v15 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v18, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v17.receiver, v17.super_class, self, PLSocialGroupJournalEntryPayload);
    }
    else
    {
      unsigned __int8 v15 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v17, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, self, PLSocialGroupJournalEntryPayload, v18.receiver, v18.super_class);
    }
    char v12 = v15;
  }
LABEL_9:

  return v12;
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
LABEL_5:
    uint64_t v11 = (void *)v10;

    goto LABEL_7;
  }
  if ([v7 isEqualToKey:@"members"])
  {
    id v8 = [v7 key];
    id v9 = [v6 objectForKeyedSubscript:v8];
    uint64_t v10 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)PLSocialGroupJournalEntryPayload;
  uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)&v13 payloadValueFromAttributes:v6 forPayloadProperty:v7];
LABEL_7:

  return v11;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"keyAsset"])
  {
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
    v14.receiver = self;
    v14.super_class = (Class)PLSocialGroupJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v14 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }
  else
  {
    if (![v8 isEqualToString:@"members"])
    {
      v12.receiver = self;
      v12.super_class = (Class)PLSocialGroupJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
      goto LABEL_7;
    }
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
    v13.receiver = self;
    v13.super_class = (Class)PLSocialGroupJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v10];
  }

LABEL_7:
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if ([v13 isEqualToKey:@"keyAsset"])
  {
    if ([v14 keyAssetPickSource] != 1
      || ([v14 keyAsset], unsigned __int8 v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v23 = [v13 key];
      [v11 addObject:v23];

      if ([v14 keyAssetPickSource] == 1)
      {
        v24 = PLMigrationGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "updatePayloadAttributes: nil social group key asset but pick source is user", buf, 2u);
        }
      }
      goto LABEL_12;
    }
    id v16 = [v14 keyAsset];
    objc_super v17 = [v16 uuid];
    objc_super v18 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v17];
    id v19 = [v13 key];
    [v10 setObject:v18 forKeyedSubscript:v19];
  }
  else
  {
    if (![v13 isEqualToKey:@"members"])
    {
      BOOL v25 = 0;
      goto LABEL_14;
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = [v14 members];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __113__PLSocialGroupJournalEntryPayload_updatePayloadAttributes_andNilAttributes_withSourceObject_forPayloadProperty___block_invoke;
    v27[3] = &unk_1E586A260;
    id v28 = v20;
    id v16 = v20;
    [v21 enumerateObjectsUsingBlock:v27];

    v22 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringArray:v16];
    [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v22];
  }
LABEL_12:
  BOOL v25 = 1;
LABEL_14:

  return v25;
}

void __113__PLSocialGroupJournalEntryPayload_updatePayloadAttributes_andNilAttributes_withSourceObject_forPayloadProperty___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 personUUID];
  [v2 addObject:v3];
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = [[PLSocialGroupPayloadAdapter alloc] initWithManagedObject:v3];

  return v4;
}

+ (id)fetchPredicateInContext:(id)a3
{
  return +[PLSocialGroup predicateForAllSocialGroupsInContext:a3];
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
  return @"SocialGroup";
}

+ (id)entityName
{
  return +[PLGraphNode entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PLSocialGroupJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_44573 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_44573, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_44574;
  return v2;
}

void __72__PLSocialGroupJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_44574;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_44574 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLSocialGroupJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_44575 != -1) {
    dispatch_once(&modelProperties_onceToken_44575, block);
  }
  v2 = (void *)modelProperties_modelProperties_44576;
  return v2;
}

uint64_t __51__PLSocialGroupJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_44576;
  modelProperties_modelProperties_44576 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_44576;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)modelPropertiesDescription
{
  v19[12] = *MEMORY[0x1E4F143B8];
  v18[0] = @"uuid";
  objc_super v17 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v19[0] = v17;
  v18[1] = @"customTitle";
  id v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19[1] = v16;
  v18[2] = @"manualOrder";
  unsigned __int8 v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19[2] = v15;
  v18[3] = @"automaticOrder";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19[3] = v2;
  v18[4] = @"socialGroupVerifiedType";
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"verifiedType" andType:100 info:0];
  v19[4] = v3;
  void v18[5] = @"keyAssetPickSource";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19[5] = v4;
  v18[6] = @"keyAsset";
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"keyAsset" relatedEntityPropertyNames:v5 shouldPrefetchRelationship:1];

  v19[6] = v6;
  v18[7] = @"members";
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"members" relatedEntityPropertyNames:v7 shouldPrefetchRelationship:1];

  v19[7] = v8;
  v18[8] = @"changeFlag0";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v19[8] = v9;
  v18[9] = @"changeFlag1";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v19[9] = v10;
  v18[10] = @"changeFlag2";
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v19[10] = v11;
  v18[11] = @"changeFlag3";
  id v12 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v19[11] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:12];

  return v13;
}

@end