@interface PLPersonJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
+ (void)updateMergeTargetPersonWithPersonUUIDMapping:(id)a3 fromDataInManagedObjectContext:(id)a4;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSDictionary)contactMatchingDictionary;
- (NSNumber)detectionType;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)mergeTargetPersonUUID;
- (NSString)personUri;
- (PLPersonJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4;
- (id)insertPersonFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (int)cloudVerifiedType;
- (int)type;
- (int)verifiedType;
- (signed)keyFacePickSource;
- (unsigned)manualOrder;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6;
@end

@implementation PLPersonJournalEntryPayload

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v8 isEqualToKey:@"contactDict"])
  {
    unsigned __int8 v11 = [v9 isEqual:v10];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLPersonJournalEntryPayload;
    unsigned __int8 v11 = [(PLManagedObjectJournalEntryPayload *)&v14 comparePayloadValue:v10 toObjectDictionaryValue:v9 forPayloadProperty:v8];
  }
  BOOL v12 = v11;

  return v12;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v45 = a6;
  int v13 = [v10 requiresConversion];
  id v14 = v11;
  v15 = [v10 key];
  v16 = v15;
  if (v13)
  {
    int v17 = [v15 isEqualToString:@"contactDict"];

    if (v17)
    {
      v18 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"verifiedType"];
      int v19 = [v18 intValue];

      if (v19 != -2)
      {
        payloadAttributes = self->super._payloadAttributes;
        v21 = [v10 key];
        v22 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v21];
        [v14 setContactMatchingDictionary:v22];
      }
    }
    else if ([v10 isEqualToKey:@"userFeedbacks"])
    {
      v43 = v14;
      v44 = v10;
      id v41 = v12;
      v29 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"userFeedbacks"];
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v29;
      uint64_t v31 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v52 != v33) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v36 = [v35 objectForKeyedSubscript:@"userFeedbackUUID"];
            if (v36)
            {
              v37 = [v43 managedObjectContext];
              v38 = +[PLUserFeedback insertIntoManagedObjectContext:v37 withUUID:v36];

              v39 = [v44 subRelationshipProperties];
              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v47[2] = __98__PLPersonJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
              v47[3] = &unk_1E586FCF0;
              v47[4] = self;
              id v48 = v38;
              id v49 = v45;
              v50 = v35;
              id v40 = v38;
              [v39 enumerateKeysAndObjectsUsingBlock:v47];

              [v30 addObject:v40];
            }
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v32);
      }

      id v14 = v43;
      [v43 setUserFeedbacks:v30];

      id v10 = v44;
      id v12 = v41;
    }
  }
  else
  {
    int v23 = [v15 isEqualToString:@"uri"];

    if (v23)
    {
      v24 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"verifiedType"];
      int v25 = [v24 intValue];

      if (v25 != -2)
      {
        v26 = self->super._payloadAttributes;
        v27 = [v10 key];
        v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];
        [v14 setPersonUri:v28];
      }
    }
    else
    {
      v46.receiver = self;
      v46.super_class = (Class)PLPersonJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v46 applyPayloadProperty:v10 toManagedObject:v14 key:v12 payloadAttributesToUpdate:v45];
    }
  }
}

uint64_t __98__PLPersonJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyPayloadProperty:a3 toManagedObject:*(void *)(a1 + 40) key:a2 payloadAttributesToUpdate:*(void *)(a1 + 48) payloadDictionary:*(void *)(a1 + 56) info:0];
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"mergeTarget"])
  {
    id v8 = [v7 key];

    id v9 = [v6 objectForKeyedSubscript:v8];
    id v10 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLPersonJournalEntryPayload;
    id v10 = [(PLManagedObjectJournalEntryPayload *)&v12 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"mergeTarget"])
  {
    uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v10];

    v13.receiver = self;
    v13.super_class = (Class)PLPersonJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v13 appendAttributeKey:v8 value:v11 toDescriptionBuilder:v9];
    id v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLPersonJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v10 toDescriptionBuilder:v9];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v10;
  if ([v11 isEqualToKey:@"mergeTarget"])
  {
    objc_super v13 = [v12 mergeTargetPerson];
    id v14 = [v13 personUUID];
    v15 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v14];
    v16 = [v11 key];
    [v9 setObject:v15 forKeyedSubscript:v16];
  }
  else
  {
    if (![v11 isEqualToKey:@"contactDict"])
    {
      BOOL v17 = 0;
      goto LABEL_7;
    }
    objc_super v13 = [v12 contactMatchingDictionary];
    id v14 = [v11 key];
    [v9 setObject:v13 forKeyedSubscript:v14];
  }

  BOOL v17 = 1;
LABEL_7:

  return v17;
}

- (NSString)mergeTargetPersonUUID
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mergeTarget"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return (NSString *)v4;
}

- (NSDictionary)contactMatchingDictionary
{
  return (NSDictionary *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"contactDict"];
}

- (signed)keyFacePickSource
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keyFacePickSource"];
  signed __int16 v3 = [v2 integerValue];

  return v3;
}

- (int)cloudVerifiedType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"cloudVerifiedType"];
  int v3 = [v2 integerValue];

  return v3;
}

- (int)verifiedType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"verifiedType"];
  int v3 = [v2 integerValue];

  return v3;
}

- (int)type
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"type"];
  int v3 = [v2 integerValue];

  return v3;
}

- (unsigned)manualOrder
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"order"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSString)personUri
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"uri"];
}

- (NSString)displayName
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"displayName"];
}

- (NSString)fullName
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"fullName"];
}

- (NSNumber)detectionType
{
  return (NSNumber *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"detectionType"];
}

- (PLPersonJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4
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
    objc_super v13 = [v8 setWithArray:v12];

    if ([v7 intersectsSet:v13])
    {
      id v14 = [v6 person];
      v15 = [v6 payloadID];
      uint64_t v16 = [(id)objc_opt_class() payloadVersion];
      BOOL v17 = [MEMORY[0x1E4F1CAD0] setWithObject:@"userFeedbacks"];
      v18 = [(id)objc_opt_class() modelProperties];
      v21.receiver = self;
      v21.super_class = (Class)PLPersonJournalEntryPayload;
      int v19 = [(PLManagedObjectJournalEntryPayload *)&v21 initWithPayloadID:v15 payloadVersion:v16 managedObject:v14 changedKeys:v17 modelProperties:v18];
    }
    else
    {

      int v19 = 0;
    }
  }
  else
  {

    int v19 = 0;
  }

  return v19;
}

- (id)insertPersonFromDataInManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  id v6 = [v5 payloadIDString];
  id v7 = [(PLPersonJournalEntryPayload *)self fullName];
  id v8 = +[PLPerson insertIntoManagedObjectContext:v4 withPersonUUID:v6 fullName:v7 verifiedType:[(PLPersonJournalEntryPayload *)self verifiedType]];

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v8 payloadAttributesToUpdate:0];
  return v8;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"verifiedType"];
  if ([v5 integerValue])
  {
    id v6 = [v4 objectForKeyedSubscript:@"personUUID"];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
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
  return +[PLPerson entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLPersonJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_80278 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_80278, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_80279;
  return v2;
}

void __67__PLPersonJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_80279;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_80279 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLPersonJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_80280 != -1) {
    dispatch_once(&modelProperties_onceToken_80280, block);
  }
  v2 = (void *)modelProperties_modelProperties_80281;
  return v2;
}

uint64_t __46__PLPersonJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  unsigned int v3 = (void *)modelProperties_modelProperties_80281;
  modelProperties_modelProperties_80281 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_80281;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  v42[30] = *MEMORY[0x1E4F143B8];
  v41[0] = @"cloudDeleteState";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[0] = v38;
  v41[1] = @"cloudLocalState";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[1] = v37;
  v41[2] = @"faceCount";
  v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[2] = v36;
  v41[3] = @"inPersonNamingModel";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[3] = v35;
  v41[4] = @"questionType";
  v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[4] = v34;
  v41[5] = @"genderType";
  uint64_t v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[5] = v33;
  v41[6] = @"ageType";
  uint64_t v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[6] = v32;
  v41[7] = @"suggestedForClientType";
  uint64_t v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[7] = v31;
  v41[8] = @"mergeCandidateConfidence";
  id v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[8] = v30;
  v41[9] = @"mdID";
  v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[9] = v29;
  v41[10] = @"cloudDetectionType";
  v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[10] = v28;
  v41[11] = @"isMeConfidence";
  v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[11] = v27;
  v41[12] = @"associatedFaceGroup";
  v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[12] = v26;
  v41[13] = @"faceCrops";
  int v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[13] = v25;
  v41[14] = @"rejectedFacesNeedingFaceCrops";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[14] = v24;
  v41[15] = @"clusterRejectedFaces";
  int v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[15] = v23;
  v41[16] = @"detectedFaces";
  v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[16] = v22;
  v41[17] = @"detectedTorsos";
  objc_super v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[17] = v21;
  v41[18] = @"temporalDetectedFaces";
  v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[18] = v20;
  v41[19] = @"keyFace";
  int v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[19] = v19;
  v41[20] = @"rejectedFaces";
  v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[20] = v18;
  v41[21] = @"invalidMergeCandidates";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[21] = v17;
  v41[22] = @"mergeCandidates";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[22] = v16;
  v41[23] = @"mergeCandidatesWithConfidence";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[23] = v15;
  v41[24] = @"mergeSourcePersons";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[24] = v14;
  v41[25] = @"personReferences";
  objc_super v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[25] = v13;
  v41[26] = @"shareParticipant";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[26] = v2;
  v41[27] = @"edgesIn";
  unsigned int v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[27] = v3;
  v41[28] = @"edgesOut";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v42[28] = v4;
  v41[29] = @"userFeedbacks";
  v39[0] = @"cloudDeleteState";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v40[0] = v5;
  v39[1] = @"cloudLocalState";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v40[1] = v6;
  v39[2] = @"memory";
  BOOL v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v40[2] = v7;
  v39[3] = @"person";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v40[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v9 subRelationshipEntityName:0 isToMany:1 isAdditionalEntityName:1 info:0];
  v42[29] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:30];

  return v11;
}

+ (id)modelPropertiesDescription
{
  v29[14] = *MEMORY[0x1E4F143B8];
  v28[0] = @"personUUID";
  int v25 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v29[0] = v25;
  v28[1] = @"detectionType";
  v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[1] = v24;
  v28[2] = @"fullName";
  int v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[2] = v23;
  v28[3] = @"displayName";
  v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[3] = v22;
  v28[4] = @"personUri";
  objc_super v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"uri" andType:700 info:0];
  v29[4] = v21;
  v28[5] = @"manualOrder";
  v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"order" andType:200 info:0];
  v29[5] = v20;
  v28[6] = @"type";
  int v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"type" andType:200 info:0];
  v29[6] = v19;
  v28[7] = @"verifiedType";
  v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[7] = v18;
  v28[8] = @"cloudVerifiedType";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[8] = v17;
  v28[9] = @"keyFacePickSource";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[9] = v16;
  v28[10] = @"contactMatchingDictionary";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"contactDict" andType:1800 info:0];
  v29[10] = v15;
  v28[11] = @"assetSortOrder";
  id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29[11] = v14;
  v28[12] = @"mergeTargetPerson";
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"personUUID"];
  unsigned int v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"mergeTarget" relatedEntityPropertyNames:v2 shouldPrefetchRelationship:1];

  v29[12] = v3;
  v28[13] = @"userFeedbacks";
  v26[0] = @"uuid";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackUUID" andType:700 info:0];
  v27[0] = v4;
  v26[1] = @"type";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackType" andType:100 info:0];
  v27[1] = v5;
  v26[2] = @"feature";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackFeature" andType:100 info:0];
  v27[2] = v6;
  v26[3] = @"creationType";
  BOOL v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackCreationType" andType:100 info:0];
  v27[3] = v7;
  v26[4] = @"context";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackContext" andType:700 info:0];
  v27[4] = v8;
  v26[5] = @"lastModifiedDate";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbackLastModifiedDate" andType:900 info:0];
  v27[5] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"userFeedbacks" subRelationshipProperties:v10 subRelationshipEntityName:0 isToMany:1 isAdditionalEntityName:1 info:0];
  v29[13] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:14];

  return v12;
}

+ (void)updateMergeTargetPersonWithPersonUUIDMapping:(id)a3 fromDataInManagedObjectContext:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v21 = *(void *)v23;
    *(void *)&long long v8 = 138412546;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = objc_msgSend(v5, "objectForKey:", v11, v20);
        objc_super v13 = +[PLPerson personWithUUID:v11 inManagedObjectContext:v6];
        id v14 = +[PLPerson personWithUUID:v12 inManagedObjectContext:v6];
        v15 = [v14 finalMergeTargetPerson];

        uint64_t v16 = PLMigrationGetLog();
        BOOL v17 = v16;
        if (v13) {
          BOOL v18 = v15 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v27 = v12;
            __int16 v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to find merge target person with UUID %@ for person with UUID %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v15;
            __int16 v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Setting merge target person %@ for %@", buf, 0x16u);
          }

          [v13 setMergeTargetPerson:v15];
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }
}

@end