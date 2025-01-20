@interface PLFaceCrop
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_faceCropsMatchingPredicate:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5;
+ (id)allFaceCropsInPhotoLibrary:(id)a3;
+ (id)batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs:(id)a3 library:(id)a4;
+ (id)entityName;
+ (id)faceCropsToUploadInPhotoLibrary:(id)a3 limit:(unint64_t)a4;
+ (id)faceCropsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)faceCropsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6;
+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6;
+ (id)insertOrUpdateWithCPLFaceCrop:(id)a3 inPhotoLibrary:(id)a4;
+ (id)listOfSyncedProperties;
+ (int)_nameSourceForFaceFromFaceCrop:(id)a3;
+ (int)_trainingFaceTypeForFaceFromFaceCrop:(id)a3;
+ (int64_t)_cloudTypeToPushFromLocalType:(signed __int16)a3 cachedCloudType:(unsigned __int16)a4;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (signed)_localTypeFromCloudType:(int64_t)a3;
+ (void)resetCloudStateInPhotoLibrary:(id)a3;
- (BOOL)isSyncableChange;
- (BOOL)needsPersistenceUpdate;
- (BOOL)supportsCloudUpload;
- (NSString)debugDescription;
- (id)cplFaceCropChange;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (int64_t)cloudDeletionType;
- (void)applyPropertiesToTrainingFace;
- (void)prepareForDeletion;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)willSave;
@end

@implementation PLFaceCrop

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *((unsigned char *)&self->super._willSaveCallCount + 2);
}

- (NSString)debugDescription
{
  v3 = NSString;
  v4 = [(PLFaceCrop *)self uuid];
  v5 = [(PLFaceCrop *)self resourceData];
  uint64_t v6 = [v5 length];
  unsigned int v7 = [(PLFaceCrop *)self type] - 1;
  if (v7 > 4) {
    v8 = @"none";
  }
  else {
    v8 = off_1E586FD30[v7];
  }
  v9 = [(PLFaceCrop *)self person];
  v10 = [v9 personUUID];
  unsigned int v11 = [(PLFaceCrop *)self state];
  if (v11 > 2) {
    v12 = @"unknown";
  }
  else {
    v12 = off_1E586FD58[(unsigned __int16)v11];
  }
  int v13 = [(PLFaceCrop *)self cloudLocalState];
  v14 = [(PLFaceCrop *)self invalidMergeCandidatePersonUUID];
  v15 = [v3 stringWithFormat:@"FaceCrop: UUID: %@ ResourceData: %lu bytes Type: %@ Person: %@ State: %@ Cloud State: %d Invalid merge candidate UUID: %@", v4, v6, v8, v10, v12, v13, v14];

  return (NSString *)v15;
}

- (id)cplFaceCropChange
{
  v3 = [(PLFaceCrop *)self scopedIdentifier];
  v4 = (void *)[MEMORY[0x1E4F59880] newRecordWithScopedIdentifier:v3];
  v5 = [(PLFaceCrop *)self person];
  uint64_t v6 = [v5 personUUID];
  [v4 setPersonIdentifier:v6];

  objc_msgSend(v4, "setFaceCropType:", objc_msgSend((id)objc_opt_class(), "_cloudTypeToPushFromLocalType:cachedCloudType:", -[PLFaceCrop type](self, "type"), -[PLFaceCrop cloudType](self, "cloudType")));
  unsigned int v7 = [(PLFaceCrop *)self resourceData];
  [v4 setResourceData:v7];

  if ([MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome])
  {
    v8 = [(PLFaceCrop *)self invalidMergeCandidatePersonUUID];
    [v4 setRejectedPersonIdentifier:v8];
  }
  return v4;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  v4 = [(PLFaceCrop *)self scopeIdentifier];
  v5 = [(PLFaceCrop *)self uuid];
  uint64_t v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLManagedObject *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

- (BOOL)isSyncableChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PLFaceCrop *)self changedValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCloudUpload
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F59840] serverSupportsVision];
  if (v3)
  {
    uint64_t v4 = [(PLFaceCrop *)self person];
    uint64_t v5 = v4;
    if (v4)
    {
      if ([v4 verifiedType])
      {

        if (objc_msgSend((id)objc_opt_class(), "_cloudTypeToPushFromLocalType:cachedCloudType:", -[PLFaceCrop type](self, "type"), -[PLFaceCrop cloudType](self, "cloudType")))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        uint64_t v5 = [NSString stringWithFormat:@"FaceCrop %@ with unknown cloud type is an error", self];
        if (*MEMORY[0x1E4F59AC0])
        {
LABEL_15:

          LOBYTE(v3) = 0;
          return v3;
        }
        uint64_t v6 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v10 = v5;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v6 = [NSString stringWithFormat:@"FaceCrop %@ linked to unverified person %@", self, v5];
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_14;
      }
      unsigned int v7 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      long long v10 = v6;
    }
    else
    {
      uint64_t v6 = [NSString stringWithFormat:@"Missing person for faceCrop %@", self];
      if (*MEMORY[0x1E4F59AC0])
      {
        uint64_t v5 = 0;
        goto LABEL_14;
      }
      unsigned int v7 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      long long v10 = v6;
    }
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    goto LABEL_13;
  }
  return v3;
}

- (void)applyPropertiesToTrainingFace
{
  id v6 = [(PLFaceCrop *)self person];
  int v3 = [(PLFaceCrop *)self face];
  if ([(PLFaceCrop *)self type] == 2 || [(PLFaceCrop *)self type] == 4)
  {
    uint64_t v4 = [v6 mutableRejectedFaces];
    [v4 addObject:v3];
  }
  else
  {
    uint64_t v5 = [v6 mutableFaces];
    [v5 addObject:v3];

    [v3 fixPersonRelationshipsForFaceTorsoOrTemporal];
  }
  objc_msgSend(v3, "setEffectiveNameSource:", objc_msgSend((id)objc_opt_class(), "_nameSourceForFaceFromFaceCrop:", self));
  objc_msgSend(v3, "setTrainingType:", objc_msgSend((id)objc_opt_class(), "_trainingFaceTypeForFaceFromFaceCrop:", self));
}

- (int64_t)cloudDeletionType
{
  return 5;
}

- (void)prepareForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)PLFaceCrop;
  [(PLManagedObject *)&v4 prepareForDeletion];
  int v3 = [(PLFaceCrop *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0) {
    [v3 recordCloudDeletionForObject:self];
  }
}

- (void)willSave
{
  v23.receiver = self;
  v23.super_class = (Class)PLFaceCrop;
  [(PLManagedObject *)&v23 willSave];
  int v3 = [(PLFaceCrop *)self changedValues];
  objc_super v4 = [v3 objectForKey:@"person"];
  if (v4)
  {
    uint64_t v5 = [(PLFaceCrop *)self face];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
      if (v4 == v6) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = v4;
      }
      id v8 = v7;

      if ([(PLFaceCrop *)self type] == 4 || [(PLFaceCrop *)self type] == 2)
      {
        long long v9 = [(PLFaceCrop *)self face];
        long long v10 = [v9 rejectedPersons];
        uint64_t v11 = [v10 anyObject];

        if (v11)
        {
          if ([v11 isEqual:v8])
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          if (v4 == v6)
          {
            uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
LABEL_14:
            int v13 = (void *)v12;
            uint64_t v14 = [(PLFaceCrop *)self face];
            [v14 setRejectedPersons:v13];

LABEL_23:
            goto LABEL_25;
          }
LABEL_13:
          uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
          goto LABEL_14;
        }
        if (v4 != v6) {
          goto LABEL_13;
        }
LABEL_24:
        uint64_t v11 = 0;
        goto LABEL_25;
      }
      if ([(PLFaceCrop *)self type] != 3
        && [(PLFaceCrop *)self type] != 1
        && [(PLFaceCrop *)self type] != 5)
      {
        goto LABEL_26;
      }
      v15 = [(PLFaceCrop *)self face];
      uint64_t v11 = [v15 associatedPersonForFaceOrTorso:1 orTemporal:0];

      if (v11)
      {
        if ([v11 isEqual:v8]) {
          goto LABEL_25;
        }
      }
      else if (v4 == v6)
      {
        goto LABEL_24;
      }
      int v13 = [(PLFaceCrop *)self face];
      [v13 setAssociatedPerson:v8];
      goto LABEL_23;
    }
  }
LABEL_27:
  v16 = [(PLFaceCrop *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PLFaceCrop *)self setNeedsPersistenceUpdate:0];
    if (([(PLFaceCrop *)self isDeleted] & 1) == 0
      && ([(PLFaceCrop *)self isSyncableChange]
       || [(PLFaceCrop *)self isInserted]))
    {
      [(PLFaceCrop *)self setNeedsPersistenceUpdate:1];
    }
  }
  v17 = [(PLManagedObject *)self photoLibrary];
  v18 = [v17 libraryServicesManager];

  if (v18)
  {
    if ([v18 wellKnownPhotoLibraryIdentifier] == 3)
    {
      v19 = [(PLManagedObject *)self photoLibrary];
      v20 = [v19 managedObjectContext];

      if (v20)
      {
        [v20 recordNeedsBackgroundJobProcessing];
      }
      else
      {
        v21 = PLSyndicationGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "PersonSync: MOC is nil, unable to register for background job processing", v22, 2u);
        }

        v20 = 0;
      }
LABEL_42:
    }
  }
  else if ((MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "PLFaceCrop willSave: LSM is nil, not registering for background job processing", v22, 2u);
    }
    goto LABEL_42;
  }
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1C038]);
  unsigned int v7 = [a1 entityName];
  id v8 = (void *)[v6 initWithEntityName:v7];

  long long v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState != %d", 0);
  [v8 setResultType:2];
  [v8 setPropertiesToUpdate:&unk_1EEBF29C8];
  [v8 setPredicate:v9];
  long long v10 = [v4 managedObjectContext];
  id v15 = 0;
  uint64_t v11 = [v10 executeRequest:v8 error:&v15];
  id v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v11 result];
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ faceCrop", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    int v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update faceCrop: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (id)insertOrUpdateWithCPLFaceCrop:(id)a3 inPhotoLibrary:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 scopedIdentifier];
  long long v9 = [v8 identifier];

  long long v10 = [v6 personIdentifier];
  uint64_t v11 = [v7 managedObjectContext];
  id v12 = +[PLPerson personWithUUID:v10 inManagedObjectContext:v11];
  int v13 = [v12 finalMergeTargetPerson];

  if (v13)
  {
    uint64_t v14 = objc_msgSend(a1, "_localTypeFromCloudType:", objc_msgSend(v6, "faceCropType"));
    v40[0] = v9;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    v16 = [a1 faceCropsWithUUIDs:v15 inPhotoLibrary:v7];

    if ([v16 count])
    {
      id v17 = [v16 firstObject];
      uint64_t v18 = [v6 resourceData];
      [v17 setResourceData:v18];

      [v17 setType:v14];
      if (v17) {
        goto LABEL_4;
      }
    }
    else
    {
      v21 = [v6 resourceData];
      id v17 = [a1 insertIntoPhotoLibrary:v7 withUUID:v9 resourceData:v21 type:v14];

      if (v17)
      {
LABEL_4:
        v19 = [v17 person];
        [v17 setCloudLocalState:1];
        [v17 setPerson:v13];
        objc_msgSend(v17, "setCloudType:", (unsigned __int16)objc_msgSend(v6, "faceCropType"));
        if ([v19 verifiedType] == -2)
        {
          v20 = [v19 mergeTargetPerson];
          if (v20)
          {
          }
          else if ([v13 verifiedType] == 1)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v22 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                id v35 = v6;
                __int16 v36 = 2112;
                v37 = v19;
                __int16 v38 = 2112;
                v39 = v13;
                _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Setting inferred merge target due to cplFaceCropChange %@ moving from tombstone person %@ to user-verified person %@", buf, 0x20u);
              }
            }
            [v19 setCPLSyncedMergeTarget:v13];
          }
        }
        if (![MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome]) {
          goto LABEL_32;
        }
        objc_super v23 = [v6 rejectedPersonIdentifier];
        if (![v23 length])
        {
          [v17 setInvalidMergeCandidatePersonUUID:0];
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
        v32 = v9;
        v24 = [v7 managedObjectContext];
        v33 = v23;
        v25 = +[PLPerson personWithUUID:v23 inManagedObjectContext:v24];
        uint64_t v26 = [v25 finalMergeTargetPerson];

        v27 = (void *)v26;
        if (v26)
        {
          v28 = [v13 mutableInvalidMergeCandidates];
          [v28 addObject:v26];

          v27 = (void *)v26;
          v29 = [v13 mutableMergeCandidates];
          [v29 removeObject:v26];
        }
        else
        {
          if (*MEMORY[0x1E4F59AC0])
          {
LABEL_30:
            objc_super v23 = v33;
            [v17 setInvalidMergeCandidatePersonUUID:v33];

            long long v9 = v32;
            goto LABEL_31;
          }
          v29 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v6 scopedIdentifier];
            *(_DWORD *)buf = 138412546;
            id v35 = v33;
            __int16 v36 = 2112;
            v37 = v30;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Did not find invalid merge candidate with person UUID %@ for cplFaceCropChange %@", buf, 0x16u);

            v27 = 0;
          }
        }

        goto LABEL_30;
      }
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      v19 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v6;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error, unable to find face crop to update or insert new face crop for %@", buf, 0xCu);
      }
      goto LABEL_32;
    }
LABEL_10:
    id v17 = 0;
LABEL_33:

    goto LABEL_34;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    v16 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v6;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unable to find person for cplFaceCropChange %@, skipping", buf, 0xCu);
    }
    goto LABEL_10;
  }
  id v17 = 0;
LABEL_34:

  return v17;
}

+ (signed)_localTypeFromCloudType:(int64_t)a3
{
  if ((~(_BYTE)a3 & 0xC) != 0) {
    signed __int16 v3 = 0;
  }
  else {
    signed __int16 v3 = 5;
  }
  if ((a3 & 4) != 0) {
    __int16 v4 = 2;
  }
  else {
    __int16 v4 = 4;
  }
  if ((a3 & 2) != 0) {
    signed __int16 v3 = v4;
  }
  if ((a3 & 4) != 0) {
    signed __int16 v5 = 1;
  }
  else {
    signed __int16 v5 = 3;
  }
  if (a3) {
    return v5;
  }
  else {
    return v3;
  }
}

+ (int64_t)_cloudTypeToPushFromLocalType:(signed __int16)a3 cachedCloudType:(unsigned __int16)a4
{
  switch(a3)
  {
    case 0:
      return a4;
    case 1:
      uint64_t v5 = 5;
      return v5 | a4 & 0xFFF0;
    case 2:
      uint64_t v5 = 6;
      return v5 | a4 & 0xFFF0;
    case 3:
      uint64_t v5 = 1;
      return v5 | a4 & 0xFFF0;
    case 4:
      uint64_t v5 = 2;
      return v5 | a4 & 0xFFF0;
    case 5:
      uint64_t v5 = 12;
      return v5 | a4 & 0xFFF0;
    default:
      uint64_t v5 = 0;
      return v5 | a4 & 0xFFF0;
  }
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  v2 = (void *)listOfSyncedProperties_result_80611;
  return v2;
}

void __36__PLFaceCrop_listOfSyncedProperties__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"type", @"person", @"resourceData", 0);
  v1 = (void *)listOfSyncedProperties_result_80611;
  listOfSyncedProperties_result_80611 = v0;
}

+ (int)_nameSourceForFaceFromFaceCrop:(id)a3
{
  unsigned int v3 = [a3 type] - 1;
  if (v3 > 4) {
    return 0;
  }
  else {
    return dword_19BA9EC3C[v3];
  }
}

+ (int)_trainingFaceTypeForFaceFromFaceCrop:(id)a3
{
  int result = [a3 type];
  if (result >= 6) {
    return 2;
  }
  return result;
}

+ (id)batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLFaceCrop.m", 240, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__80622;
  objc_super v23 = __Block_byref_object_dispose__80623;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke;
  v14[3] = &unk_1E5873DC0;
  id v9 = v8;
  id v15 = v9;
  id v18 = a1;
  id v10 = v7;
  id v16 = v10;
  id v17 = &v19;
  [v9 performBlockAndWait:v14];
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  unsigned int v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"face", *(void *)(a1 + 40)];
  __int16 v4 = [*(id *)(a1 + 56) _faceCropsMatchingPredicate:v3 limit:0 inManagedObjectContext:v2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke_2;
  v8[3] = &__block_descriptor_40_e39___NSManagedObjectID_16__0__PLFaceCrop_8l;
  v8[4] = *(void *)(a1 + 56);
  uint64_t v5 = objc_msgSend(v4, "_pl_indexBy:", v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectIDsForRelationshipNamed:@"face"];
  unsigned int v3 = [v2 firstObject];

  return v3;
}

+ (id)faceCropsToUploadInPhotoLibrary:(id)a3 limit:(unint64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "predicateWithFormat:", @"cloudLocalState == %d", 0);
  id v9 = [v7 managedObjectContext];

  id v10 = [a1 _faceCropsMatchingPredicate:v8 limit:a4 inManagedObjectContext:v9];

  return v10;
}

+ (id)faceCropsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"uuid IN %@", a3];
  id v9 = [a1 _faceCropsMatchingPredicate:v8 limit:0 inManagedObjectContext:v7];

  return v9;
}

+ (id)faceCropsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = [a4 managedObjectContext];
  id v8 = [a1 faceCropsWithUUIDs:v6 inManagedObjectContext:v7];

  return v8;
}

+ (id)allFaceCropsInPhotoLibrary:(id)a3
{
  __int16 v4 = [a3 managedObjectContext];
  uint64_t v5 = [a1 _faceCropsMatchingPredicate:0 limit:0 inManagedObjectContext:v4];

  return v5;
}

+ (id)_faceCropsMatchingPredicate:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F38D3B0]();
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = [a1 entityName];
  int v13 = [v11 fetchRequestWithEntityName:v12];

  if (v8) {
    [v13 setPredicate:v8];
  }
  if (!a4 || ([v13 setFetchLimit:a4], a4 - 101 <= 0xFFFFFFFFFFFFFF9BLL)) {
    [v13 setFetchBatchSize:100];
  }
  id v18 = 0;
  uint64_t v14 = [v9 executeFetchRequest:v13 error:&v18];
  id v15 = v18;
  if (!v14 && !*MEMORY[0x1E4F59AC0])
  {
    id v16 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch faceCrops: %@", buf, 0xCu);
    }
  }

  return v14;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"uuid";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 5;
}

+ (id)entityName
{
  return @"FaceCrop";
}

+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6
{
  uint64_t v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    uint64_t v14 = [a1 entityName];
    [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v14 inManagedObjectContext:v11];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLFaceCrop.m", 144, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

    uint64_t v14 = [a1 entityName];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v14, 0, 0);
  id v15 = };

  if (v15)
  {
    [v15 setUuid:v12];
    [v15 setResourceData:v13];
    [v15 setType:v6];
  }

  return v15;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6
{
  uint64_t v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLFaceCrop.m", 139, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  uint64_t v14 = [v11 managedObjectContext];
  id v15 = [a1 insertIntoManagedObjectContext:v14 withUUID:v12 resourceData:v13 type:v6];

  return v15;
}

@end