@interface PLUserFeedback
+ (BOOL)shouldHandleCPLSuggestionChange:(id)a3;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_userFeedbacksMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6;
+ (id)entityName;
+ (id)insertIntoManagedObjectContext:(id)a3 withDictionaryRepresentation:(id)a4;
+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4;
+ (id)newestUserFeedbackInSet:(id)a3;
+ (id)updateUserFeedback:(id)a3 withCPLSuggestionChange:(id)a4 inManagedObjectContext:(id)a5;
+ (id)userFeedbackWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)userFeedbacksToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4;
+ (id)userFeedbacksWithUUIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
- (BOOL)_isPersonFeatureAutonamingType;
- (BOOL)_relationshipsInInvalidState;
- (BOOL)_validateNonNilUUID:(id *)a3;
- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4;
- (BOOL)isSyncableChange;
- (BOOL)isValidForPersistence;
- (BOOL)supportsCloudUpload;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)detailedDescription;
- (id)_objectUsedForPersistence;
- (id)cplSuggestionChange;
- (id)dictionaryRepresentation;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (int64_t)cloudDeletionType;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
@end

@implementation PLUserFeedback

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PLUserFeedback *)self _objectUsedForPersistence];
  [v5 removePersistedFileSystemDataWithPathManager:v4];
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PLUserFeedback *)self _objectUsedForPersistence];
  [v5 persistMetadataToFileSystemWithPathManager:v4];
}

- (BOOL)isValidForPersistence
{
  v2 = [(PLUserFeedback *)self _objectUsedForPersistence];
  char v3 = [v2 isValidForPersistence];

  return v3;
}

- (id)_objectUsedForPersistence
{
  char v3 = [(PLUserFeedback *)self memory];

  if (v3)
  {
    id v4 = [(PLUserFeedback *)self memory];
  }
  else
  {
    id v5 = [(PLUserFeedback *)self person];

    if (v5)
    {
      id v4 = [(PLUserFeedback *)self person];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (int64_t)cloudDeletionType
{
  return 9;
}

- (id)cplSuggestionChange
{
  v23[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(PLUserFeedback *)self scopedIdentifier];
  id v4 = (void *)[MEMORY[0x1E4F599B0] newChangeWithScopedIdentifier:v3 changeType:0];
  [v4 setState:1];
  id v5 = [(PLUserFeedback *)self lastModifiedDate];
  [v4 setCreationDate:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F599C8]);
  v7 = [(PLUserFeedback *)self memory];

  if (!v7)
  {
    v14 = [(PLUserFeedback *)self person];

    if (!v14) {
      goto LABEL_10;
    }
    [v4 setType:102];
    id v8 = objc_alloc_init(MEMORY[0x1E4F599C0]);
    v15 = [(PLUserFeedback *)self person];
    v16 = [v15 personUUID];
    [v8 setPersonIdentifier:v16];

    objc_msgSend(v8, "setType:", -[PLUserFeedback type](self, "type"));
    objc_msgSend(v8, "setFeature:", -[PLUserFeedback feature](self, "feature"));
    v17 = [(PLUserFeedback *)self context];
    [v8 setContext:v17];

    id v22 = v8;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v19 = (void *)[v18 mutableCopy];
    [v6 setPersons:v19];

    if ([(PLUserFeedback *)self feature])
    {
      if (![(PLUserFeedback *)self _isPersonFeatureAutonamingType]) {
        goto LABEL_9;
      }
      uint64_t v20 = 1102;
    }
    else
    {
      uint64_t v20 = 1101;
    }
    [v4 setSubtype:v20];
    goto LABEL_9;
  }
  [v4 setType:101];
  id v8 = objc_alloc_init(MEMORY[0x1E4F599B8]);
  v9 = [(PLUserFeedback *)self memory];
  v10 = [v9 uuid];
  [v8 setMemoryIdentifier:v10];

  objc_msgSend(v8, "setType:", -[PLUserFeedback type](self, "type"));
  objc_msgSend(v8, "setFeature:", -[PLUserFeedback feature](self, "feature"));
  v11 = [(PLUserFeedback *)self context];
  [v8 setContext:v11];

  v23[0] = v8;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v13 = (void *)[v12 mutableCopy];
  [v6 setMemorys:v13];

LABEL_9:
LABEL_10:
  [v4 setRecordList:v6];

  return v4;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  id v4 = [(PLUserFeedback *)self scopeIdentifier];
  id v5 = [(PLUserFeedback *)self uuid];
  id v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLManagedObject *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

- (BOOL)supportsCloudUpload
{
  id v3 = [(PLUserFeedback *)self memory];

  if (v3)
  {
    id v4 = [(PLUserFeedback *)self memory];
LABEL_5:
    id v6 = v4;
    char v7 = [v4 supportsCloudUpload];

    return v7;
  }
  id v5 = [(PLUserFeedback *)self person];

  if (v5)
  {
    id v4 = [(PLUserFeedback *)self person];
    goto LABEL_5;
  }
  return 0;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (BOOL)_isPersonFeatureAutonamingType
{
  int v3 = [(PLUserFeedback *)self feature];
  if (v3 != 1) {
    LOBYTE(v3) = [(PLUserFeedback *)self feature] == 2;
  }
  return v3;
}

- (void)prepareForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)PLUserFeedback;
  [(PLManagedObject *)&v4 prepareForDeletion];
  int v3 = [(PLUserFeedback *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 recordCloudDeletionForObject:self];
  }
}

- (BOOL)validateForUpdate:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLUserFeedback;
  BOOL v5 = -[PLUserFeedback validateForUpdate:](&v8, sel_validateForUpdate_);
  if (v5)
  {
    BOOL v6 = [(PLUserFeedback *)self _validateRelationshipConstraintForInsert:0 error:a3];
    LOBYTE(v5) = 0;
    if (v6) {
      LOBYTE(v5) = [(PLUserFeedback *)self _validateNonNilUUID:a3];
    }
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLUserFeedback;
  BOOL v5 = -[PLUserFeedback validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
  {
    BOOL v5 = [(PLUserFeedback *)self _validateRelationshipConstraintForInsert:1 error:a3];
    if (v5) {
      LOBYTE(v5) = [(PLUserFeedback *)self _validateNonNilUUID:a3];
    }
  }
  return v5;
}

- (BOOL)_validateNonNilUUID:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x19F38C0C0](self, a2)) {
    return 1;
  }
  BOOL v5 = [(PLUserFeedback *)self uuid];
  uint64_t v6 = [v5 length];

  if (v6) {
    return 1;
  }
  if (a3)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Attemping to insert/update UserFeedback with nil UUID";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a3 = [v8 errorWithDomain:v9 code:71001 userInfo:v10];
  }
  v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = [(PLUserFeedback *)self detailedDescription];
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Attemping to insert/update UserFeedback with nil UUID: %@", (uint8_t *)&v13, 0xCu);
  }
  return 0;
}

- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PLUserFeedback *)self _relationshipsInInvalidState])
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (v4) {
        objc_super v7 = @"insert";
      }
      else {
        objc_super v7 = @"update";
      }
      objc_super v8 = [(PLUserFeedback *)self detailedDescription];
      int v10 = 138412546;
      v11 = v7;
      __int16 v12 = 2112;
      int v13 = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_FAULT, "Attemping to %@ an orphaned UserFeedback. An UserFeedback object should always have a Person or Memory relationship set: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return 1;
}

- (BOOL)_relationshipsInInvalidState
{
  int v3 = [(PLUserFeedback *)self person];
  if (v3)
  {
    BOOL v4 = [(PLUserFeedback *)self memory];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  uint64_t v6 = [(PLUserFeedback *)self person];
  if (v6)
  {
    BOOL v5 = 0;
  }
  else
  {
    objc_super v7 = [(PLUserFeedback *)self memory];
    BOOL v5 = v7 == 0;
  }
  if (v3)
  {
    BOOL v4 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(PLUserFeedback *)self uuid];

  if (v4)
  {
    BOOL v5 = [(PLUserFeedback *)self uuid];
    [v3 setObject:v5 forKeyedSubscript:@"PLUserFeedbackUUID"];
  }
  if ([(PLUserFeedback *)self type])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithShort:", -[PLUserFeedback type](self, "type"));
    [v3 setObject:v6 forKeyedSubscript:@"PLUserFeedbackType"];
  }
  if ([(PLUserFeedback *)self feature])
  {
    objc_super v7 = objc_msgSend(NSNumber, "numberWithShort:", -[PLUserFeedback feature](self, "feature"));
    [v3 setObject:v7 forKeyedSubscript:@"PLUserFeedbackFeature"];
  }
  if ([(PLUserFeedback *)self creationType])
  {
    objc_super v8 = objc_msgSend(NSNumber, "numberWithShort:", -[PLUserFeedback creationType](self, "creationType"));
    [v3 setObject:v8 forKeyedSubscript:@"PLUserFeedbackCreationType"];
  }
  uint64_t v9 = [(PLUserFeedback *)self context];

  if (v9)
  {
    int v10 = [(PLUserFeedback *)self context];
    [v3 setObject:v10 forKeyedSubscript:@"PLUserFeedbackContext"];
  }
  v11 = [(PLUserFeedback *)self lastModifiedDate];

  if (v11)
  {
    __int16 v12 = [(PLUserFeedback *)self lastModifiedDate];
    [v3 setObject:v12 forKeyedSubscript:@"PLUserFeedbackLastModifiedDate"];
  }
  return v3;
}

- (NSString)detailedDescription
{
  v16 = NSString;
  uint64_t v15 = [(NSManagedObject *)self pl_shortDescription];
  uint64_t v14 = [(PLUserFeedback *)self uuid];
  id v3 = [(PLUserFeedback *)self memory];
  BOOL v4 = [v3 uuid];
  BOOL v5 = [(PLUserFeedback *)self person];
  uint64_t v6 = [v5 personUUID];
  int v7 = [(PLUserFeedback *)self type];
  int v8 = [(PLUserFeedback *)self feature];
  int v9 = [(PLUserFeedback *)self creationType];
  int v10 = [(PLUserFeedback *)self context];
  v11 = [(PLUserFeedback *)self lastModifiedDate];
  __int16 v12 = [v16 stringWithFormat:@"%@ - UUID %@, Memory %@, Person %@, type %hd, feature %hd, crearionType %hd, context %@, lastModifiedDate %@, isDeleted:%d", v15, v14, v4, v6, v7, v8, v9, v10, v11, -[PLUserFeedback isDeleted](self, "isDeleted")];

  return (NSString *)v12;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"uuid";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 9;
}

+ (id)userFeedbacksToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 0);
  int v8 = (void *)MEMORY[0x1E4F29008];
  int v9 = [NSString stringWithFormat:@"%@", @"lastModifiedDate"];
  int v10 = [v8 sortDescriptorWithKey:v9 ascending:0];
  v26[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  __int16 v12 = [a1 _userFeedbacksMatchingPredicate:v7 sortDescriptors:v11 limit:a4 inManagedObjectContext:v6];
  int v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v19 supportsCloudUpload]) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)updateUserFeedback:(id)a3 withCPLSuggestionChange:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v18 = 0;
    goto LABEL_40;
  }
  int v10 = [v8 creationDate];
  [v7 setLastModifiedDate:v10];

  [v7 setCloudLocalState:1];
  v11 = [v8 recordList];
  if ([v11 memorysCount])
  {
    __int16 v12 = [v11 memorys];
    int v13 = [v12 firstObject];

    objc_msgSend(v7, "setType:", (__int16)-[NSObject type](v13, "type"));
    objc_msgSend(v7, "setFeature:", (__int16)-[NSObject feature](v13, "feature"));
    id v14 = [v13 context];
    [v7 setContext:v14];

    uint64_t v15 = [v13 memoryIdentifier];
    uint64_t v16 = [v9 photoLibrary];
    uint64_t v17 = +[PLMemory memoryWithUUID:v15 inPhotoLibrary:v16];

    if (v17)
    {
      [v7 setMemory:v17];
      goto LABEL_9;
    }
    if (*MEMORY[0x1E4F59AC0])
    {
LABEL_33:

LABEL_34:
      if (!*MEMORY[0x1E4F59AC0])
      {
        v33 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = [v7 detailedDescription];
          *(_DWORD *)v36 = 138412290;
          *(void *)&v36[4] = v34;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Deleting UserFeedback in updateUserFeedback:withCPLSuggestionChange:inManagedObjectContext: %@", v36, 0xCu);
        }
      }
      goto LABEL_38;
    }
    v30 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [v7 detailedDescription];
      *(_DWORD *)v36 = 138412802;
      *(void *)&v36[4] = v15;
      *(_WORD *)&v36[12] = 2112;
      *(void *)&v36[14] = v8;
      *(_WORD *)&v36[22] = 2112;
      v37 = v31;
      v32 = "Failed to find the right PLMemory %@ to associate CPLSuggestion %@ change with, deleting PLUserFeedback %@";
LABEL_31:
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, v32, v36, 0x20u);

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if ([v11 personsCount])
  {
    v19 = [v11 persons];
    int v13 = [v19 firstObject];

    objc_msgSend(v7, "setType:", (__int16)-[NSObject type](v13, "type"));
    objc_msgSend(v7, "setFeature:", (__int16)-[NSObject feature](v13, "feature"));
    uint64_t v20 = [v13 context];
    [v7 setContext:v20];

    uint64_t v15 = [v13 personIdentifier];
    uint64_t v21 = +[PLPerson personWithUUID:v15 inManagedObjectContext:v9];
    if (v21)
    {
      uint64_t v17 = (void *)v21;
      [v7 setPerson:v21];
LABEL_9:

      if (![v7 _relationshipsInInvalidState])
      {
        uint64_t v25 = [v7 person];
        if (v25)
        {
          v26 = (void *)v25;
          int v27 = [v7 _isPersonFeatureAutonamingType];

          if (v27)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v28 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [v7 detailedDescription];
                *(_DWORD *)v36 = 138412290;
                *(void *)&v36[4] = v29;
                _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Posting darwin notification for autonaming user feedback %@", v36, 0xCu);
              }
            }
            pl_notify_post_with_retry();
          }
        }
        id v18 = v7;
        goto LABEL_39;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        int v13 = __CPLAssetsdOSLogDomain();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        uint64_t v15 = [v7 detailedDescription];
        *(_DWORD *)v36 = 138412290;
        *(void *)&v36[4] = v15;
        long long v22 = "UserFeedback relationships are in an invalid state, deleting PLUserFeedback %@";
        long long v23 = v13;
        uint32_t v24 = 12;
LABEL_27:
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, v22, v36, v24);
        goto LABEL_33;
      }
      goto LABEL_38;
    }
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_33;
    }
    v30 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [v7 detailedDescription];
      *(_DWORD *)v36 = 138412802;
      *(void *)&v36[4] = v15;
      *(_WORD *)&v36[12] = 2112;
      *(void *)&v36[14] = v8;
      *(_WORD *)&v36[22] = 2112;
      v37 = v31;
      v32 = "Failed to find the right PLPerson %@ to associate CPLSuggestion %@ change with, deleting PLUserFeedback %@";
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_33;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v13 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    uint64_t v15 = [v7 detailedDescription];
    *(_DWORD *)v36 = 138412546;
    *(void *)&v36[4] = v8;
    *(_WORD *)&v36[12] = 2112;
    *(void *)&v36[14] = v15;
    long long v22 = "Failed to find any PLMemory or PLPerson entries in record list to associate CPLSuggestion %@ change with, dele"
          "ting PLUserFeedback %@";
    long long v23 = v13;
    uint32_t v24 = 22;
    goto LABEL_27;
  }
LABEL_38:
  objc_msgSend(v9, "deleteObject:", v7, *(_OWORD *)v36, *(void *)&v36[16], v37);
  id v18 = 0;
LABEL_39:

LABEL_40:
  return v18;
}

+ (BOOL)shouldHandleCPLSuggestionChange:(id)a3
{
  return [a3 type] - 101 < 2;
}

+ (id)newestUserFeedbackInSet:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastModifiedDate" ascending:0];
    v9[0] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = [v3 sortedArrayUsingDescriptors:v5];

    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)userFeedbacksWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K IN %@", @"uuid", a3];
  id v9 = [a1 _userFeedbacksMatchingPredicate:v8 sortDescriptors:0 limit:0 inManagedObjectContext:v7];

  return v9;
}

+ (id)userFeedbackWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"uuid", a3];
  id v9 = [a1 _userFeedbacksMatchingPredicate:v8 sortDescriptors:0 limit:1 inManagedObjectContext:v7];

  int v10 = [v9 firstObject];

  return v10;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withDictionaryRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"PLUserFeedbackUUID"];

  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:@"PLUserFeedbackUUID"];
    int v10 = [a1 insertIntoManagedObjectContext:v6 withUUID:v9];

    if (v10)
    {
      v11 = [v7 objectForKeyedSubscript:@"PLUserFeedbackType"];
      __int16 v12 = [v11 intValue];

      if (v12) {
        [v10 setType:v12];
      }
      int v13 = [v7 objectForKeyedSubscript:@"PLUserFeedbackFeature"];
      __int16 v14 = [v13 intValue];

      if (v14) {
        [v10 setFeature:v14];
      }
      uint64_t v15 = [v7 objectForKeyedSubscript:@"PLUserFeedbackCreationType"];
      __int16 v16 = [v15 intValue];

      if (v16) {
        [v10 setCreationType:v16];
      }
      uint64_t v17 = [v7 objectForKeyedSubscript:@"PLUserFeedbackContext"];
      if (v17) {
        [v10 setContext:v17];
      }
      id v18 = [v7 objectForKeyedSubscript:@"PLUserFeedbackLastModifiedDate"];
      if (v18) {
        [v10 setLastModifiedDate:v18];
      }
      id v19 = v10;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 entityName];
  id v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  [v9 setUuid:v6];
  [v9 setCreationType:1];
  return v9;
}

+ (id)_userFeedbacksMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  __int16 v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = a3;
  __int16 v14 = [a1 entityName];
  uint64_t v15 = [v12 fetchRequestWithEntityName:v14];

  [v15 setFetchBatchSize:100];
  [v15 setPredicate:v13];

  if (v10) {
    [v15 setSortDescriptors:v10];
  }
  if (a5 >= 1) {
    [v15 setFetchLimit:a5];
  }
  id v22 = 0;
  __int16 v16 = [v11 executeFetchRequest:v15 error:&v22];
  id v17 = v22;
  if (!v16 && !*MEMORY[0x1E4F59AC0])
  {
    id v18 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch user feedbacks: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    id v19 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_13;
  }
  id v19 = v16;
LABEL_13:
  uint64_t v20 = v19;

  return v20;
}

+ (id)entityName
{
  return @"UserFeedback";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLUserFeedback *)self memory];

  if (v5)
  {
    id v6 = [(PLUserFeedback *)self memory];
    if ([v6 isValidForPersistence])
    {
      id v7 = off_1E585ED60;
LABEL_7:
      id v9 = (void *)[objc_alloc(*v7) initWithUserFeedback:self changedKeys:v4];
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v8 = [(PLUserFeedback *)self person];

  if (v8)
  {
    id v6 = [(PLUserFeedback *)self person];
    if ([v6 isValidForPersistence])
    {
      id v7 = off_1E585F438;
      goto LABEL_7;
    }
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (id)payloadID
{
  id v3 = [(PLUserFeedback *)self memory];

  if (v3)
  {
    id v4 = [(PLUserFeedback *)self memory];
    uint64_t v5 = [v4 uuid];
LABEL_5:
    id v7 = (void *)v5;
    id v8 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v5];

    goto LABEL_6;
  }
  id v6 = [(PLUserFeedback *)self person];

  if (v6)
  {
    id v4 = [(PLUserFeedback *)self person];
    uint64_t v5 = [v4 personUUID];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:
  return v8;
}

@end