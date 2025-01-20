@interface PLPersistedPersonMetadata
+ (BOOL)_deleteMetadataFileWithMetadataURL:(id)a3;
+ (BOOL)deleteMetadataFileForPersonUUID:(id)a3 pathManager:(id)a4;
+ (BOOL)isValidPath:(id)a3;
+ (BOOL)isValidPath:(id)a3 outPersonUUID:(id *)a4;
+ (id)_clusterRejectedFaceIDsWithPerson:(id)a3;
+ (id)_detectedFacesToArchiveWithPerson:(id)a3;
+ (id)_fetchFacesWithPredicate:(id)a3 resultType:(unint64_t)a4 managedObjectContext:(id)a5 error:(id *)a6;
+ (id)_metadataFileURLForPersonUUID:(id)a3 pathManager:(id)a4;
+ (id)_persistedFaceMetadataWithFaces:(id)a3 keyFace:(id)a4 clusterRejectedFaceIDs:(id)a5;
+ (id)_rejectedFacesToArchiveWithPerson:(id)a3;
+ (id)personUUIDsToDedupeWithMetadataURLs:(id)a3 cplEnabled:(BOOL)a4;
+ (id)urlsForPersistedPersonsInMetadataDirectoryOfLibrary:(id)a3;
+ (id)urlsForPersistedPersonsInMetadataDirectoryWithPathManager:(id)a3;
+ (void)performPostImportMigrationFromVersion:(unint64_t)a3 fromDataInManagedObjectContext:(id)a4;
+ (void)updateMergeTargetPersonWithPersonUUIDMapping:(id)a3 fromDataInManagedObjectContext:(id)a4;
- (BOOL)_insertDetectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5;
- (BOOL)_insertRejectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5;
- (BOOL)_readUUID;
- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4;
- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 diff:(id *)a4;
- (BOOL)readDetectedFaces;
- (BOOL)readDetectedFacesFromKeyedUnarchiver:(id)a3;
- (BOOL)readMetadata;
- (BOOL)updateFacesInPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5;
- (NSArray)detectedFaces;
- (NSArray)rejectedFaces;
- (NSArray)userFeedbacksDictionaryArray;
- (NSDate)userFeedbackLastModifiedDate;
- (NSDictionary)contactMatchingDictionary;
- (NSNumber)detectionType;
- (NSSet)userFeedbacks;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)mergeTargetPersonUUID;
- (NSString)personUUID;
- (NSString)personUri;
- (NSString)userFeedbackContext;
- (NSString)userFeedbackUUID;
- (NSURL)metadataURL;
- (PLPersistedPersonMetadata)init;
- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 metadataURL:(id)a4;
- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 pathManager:(id)a4;
- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 cplEnabled:(BOOL)a4;
- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 deferUnarchiving:(BOOL)a4 cplEnabled:(BOOL)a5;
- (PLPerson)person;
- (id)_metadataData;
- (id)description;
- (id)detectedFaceIdentifiers;
- (id)insertPersonFromDataInManagedObjectContext:(id)a3;
- (id)jsonDictionary;
- (int)cloudVerifiedType;
- (int)type;
- (int)verifiedType;
- (int64_t)fromVersion;
- (signed)assetSortOrder;
- (signed)keyFacePickSource;
- (signed)userFeedbackFeature;
- (signed)userFeedbackType;
- (unsigned)manualOrder;
- (void)_addAssetUUIDsFromFaces:(id)a3 toMutableSet:(id)a4;
- (void)_saveMetadata;
- (void)removePersistedData;
- (void)setAssetSortOrder:(signed __int16)a3;
- (void)setCloudVerifiedType:(int)a3;
- (void)setContactMatchingDictionary:(id)a3;
- (void)setDetectedFaces:(id)a3;
- (void)setDetectionType:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFromVersion:(int64_t)a3;
- (void)setFullName:(id)a3;
- (void)setKeyFacePickSource:(signed __int16)a3;
- (void)setManualOrder:(unsigned int)a3;
- (void)setMergeTargetPersonUUID:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPersonUUID:(id)a3;
- (void)setPersonUri:(id)a3;
- (void)setRejectedFaces:(id)a3;
- (void)setType:(int)a3;
- (void)setUserFeedbacks:(id)a3;
- (void)setUserFeedbacksDictionaryArray:(id)a3;
- (void)setVerifiedType:(int)a3;
@end

@implementation PLPersistedPersonMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, 0);
  objc_storeStrong((id *)&self->_userFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedbackLastModifiedDate, 0);
  objc_storeStrong((id *)&self->_userFeedbackContext, 0);
  objc_storeStrong((id *)&self->_userFeedbackUUID, 0);
  objc_storeStrong((id *)&self->_contactMatchingDictionary, 0);
  objc_storeStrong((id *)&self->_rejectedFaces, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_personUri, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_mergeTargetPersonUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
}

- (void)setMetadataURL:(id)a3
{
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setPerson:(id)a3
{
}

- (PLPerson)person
{
  return self->_person;
}

- (void)setFromVersion:(int64_t)a3
{
  self->_fromVersion = a3;
}

- (int64_t)fromVersion
{
  return self->_fromVersion;
}

- (void)setAssetSortOrder:(signed __int16)a3
{
  self->_assetSortOrder = a3;
}

- (signed)assetSortOrder
{
  return self->_assetSortOrder;
}

- (void)setUserFeedbacksDictionaryArray:(id)a3
{
}

- (NSArray)userFeedbacksDictionaryArray
{
  return self->_userFeedbacksDictionaryArray;
}

- (void)setUserFeedbacks:(id)a3
{
}

- (NSSet)userFeedbacks
{
  return self->_userFeedbacks;
}

- (NSDate)userFeedbackLastModifiedDate
{
  return self->_userFeedbackLastModifiedDate;
}

- (NSString)userFeedbackContext
{
  return self->_userFeedbackContext;
}

- (signed)userFeedbackFeature
{
  return self->_userFeedbackFeature;
}

- (signed)userFeedbackType
{
  return self->_userFeedbackType;
}

- (NSString)userFeedbackUUID
{
  return self->_userFeedbackUUID;
}

- (void)setKeyFacePickSource:(signed __int16)a3
{
  self->_keyFacePickSource = a3;
}

- (signed)keyFacePickSource
{
  return self->_keyFacePickSource;
}

- (void)setContactMatchingDictionary:(id)a3
{
}

- (NSDictionary)contactMatchingDictionary
{
  return self->_contactMatchingDictionary;
}

- (void)setRejectedFaces:(id)a3
{
}

- (NSArray)rejectedFaces
{
  return self->_rejectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setCloudVerifiedType:(int)a3
{
  self->_cloudVerifiedType = a3;
}

- (int)cloudVerifiedType
{
  return self->_cloudVerifiedType;
}

- (void)setVerifiedType:(int)a3
{
  self->_verifiedType = a3;
}

- (int)verifiedType
{
  return self->_verifiedType;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setManualOrder:(unsigned int)a3
{
  self->_manualOrder = a3;
}

- (unsigned)manualOrder
{
  return self->_manualOrder;
}

- (void)setPersonUri:(id)a3
{
}

- (NSString)personUri
{
  return self->_personUri;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setMergeTargetPersonUUID:(id)a3
{
}

- (NSString)mergeTargetPersonUUID
{
  return self->_mergeTargetPersonUUID;
}

- (void)setDetectionType:(id)a3
{
  self->_detectionType = (NSNumber *)a3;
}

- (NSNumber)detectionType
{
  return self->_detectionType;
}

- (void)setPersonUUID:(id)a3
{
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (id)jsonDictionary
{
  v33[13] = *MEMORY[0x1E4F143B8];
  v32[0] = @"personUUID";
  v31 = [(PLPersistedPersonMetadata *)self personUUID];
  v33[0] = v31;
  v32[1] = @"detectionType";
  uint64_t v3 = [(PLPersistedPersonMetadata *)self detectionType];
  v30 = (void *)v3;
  v4 = &unk_1EEBEF8D0;
  if (v3) {
    v4 = (void *)v3;
  }
  v33[1] = v4;
  v32[2] = @"fromVersion";
  v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLPersistedPersonMetadata fromVersion](self, "fromVersion"));
  v33[2] = v29;
  v32[3] = @"verifiedType";
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonMetadata verifiedType](self, "verifiedType"));
  v33[3] = v28;
  v32[4] = @"fullName";
  uint64_t v5 = [(PLPersistedPersonMetadata *)self fullName];
  v27 = (void *)v5;
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = &stru_1EEB2EB80;
  }
  v33[4] = v6;
  v32[5] = @"displayName";
  uint64_t v7 = [(PLPersistedPersonMetadata *)self displayName];
  if (v7) {
    v8 = (__CFString *)v7;
  }
  else {
    v8 = &stru_1EEB2EB80;
  }
  v33[5] = v8;
  v32[6] = @"personUri";
  uint64_t v9 = [(PLPersistedPersonMetadata *)self personUri];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1EEB2EB80;
  }
  v33[6] = v11;
  v32[7] = @"contactMatchingDictionary";
  uint64_t v12 = [(PLPersistedPersonMetadata *)self contactMatchingDictionary];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1EEB2EB80;
  }
  v33[7] = v14;
  v32[8] = @"manualOrder";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
  v33[8] = v15;
  v32[9] = @"personType";
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonMetadata type](self, "type"));
  v33[9] = v16;
  v32[10] = @"keyFacePickSource";
  v17 = objc_msgSend(NSNumber, "numberWithShort:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
  v33[10] = v17;
  v32[11] = @"detectedFacesCount";
  v18 = NSNumber;
  v19 = [(PLPersistedPersonMetadata *)self detectedFaces];
  v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v33[11] = v20;
  v32[12] = @"rejectedFacesCount";
  v21 = NSNumber;
  v22 = [(PLPersistedPersonMetadata *)self rejectedFaces];
  v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
  v33[12] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:13];

  return v24;
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 diff:(id *)a4
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PLPersistedPersonMetadata *)self personUUID];
  v8 = +[PLPerson personWithUUID:v7 inManagedObjectContext:v6];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = [(PLPersistedPersonMetadata *)self fullName];
    uint64_t v12 = [v8 fullName];
    char IsEqual = PLObjectIsEqual();

    if ((IsEqual & 1) == 0)
    {
      v14 = [(PLPersistedPersonMetadata *)self fullName];
      objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v14, @"fullName");

      v15 = [v8 fullName];
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v15, @"fullName");
    }
    v16 = [(PLPersistedPersonMetadata *)self displayName];
    v17 = [v8 displayName];
    char v18 = PLObjectIsEqual();

    if ((v18 & 1) == 0)
    {
      v19 = [(PLPersistedPersonMetadata *)self displayName];
      objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v19, @"displayName");

      v20 = [v8 displayName];
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v20, @"displayName");
    }
    int v21 = [(PLPersistedPersonMetadata *)self verifiedType];
    if (v21 != [v8 verifiedType])
    {
      v22 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonMetadata verifiedType](self, "verifiedType"));
      [v9 setObject:v22 forKey:@"verifiedType"];

      v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "verifiedType"));
      [v10 setObject:v23 forKey:@"verifiedType"];
    }
    if ([(PLPersistedPersonMetadata *)self verifiedType] != -2)
    {
      v24 = [(PLPersistedPersonMetadata *)self personUri];
      v25 = [v8 personUri];
      char v26 = PLObjectIsEqual();

      if ((v26 & 1) == 0)
      {
        v27 = [(PLPersistedPersonMetadata *)self personUri];
        objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v27, @"personUri");

        v28 = [v8 personUri];
        objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v28, @"personUri");
      }
      v29 = [(PLPersistedPersonMetadata *)self contactMatchingDictionary];
      v30 = [v8 contactMatchingDictionary];
      char v31 = PLObjectIsEqual();

      if ((v31 & 1) == 0)
      {
        v32 = [(PLPersistedPersonMetadata *)self contactMatchingDictionary];
        objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v32, @"contactMatchingDictionary");

        v33 = [v8 contactMatchingDictionary];
        objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v33, @"contactMatchingDictionary");
      }
    }
    unsigned int v34 = [(PLPersistedPersonMetadata *)self manualOrder];
    if (v34 != [v8 manualOrder])
    {
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
      [v9 setObject:v35 forKey:@"manualOrder"];

      v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "manualOrder"));
      [v10 setObject:v36 forKey:@"manualOrder"];
    }
    int v37 = [(PLPersistedPersonMetadata *)self type];
    if (v37 != [v8 type])
    {
      v38 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonMetadata type](self, "type"));
      [v9 setObject:v38 forKey:@"personType"];

      v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "type"));
      [v10 setObject:v39 forKey:@"personType"];
    }
    int v40 = [(PLPersistedPersonMetadata *)self keyFacePickSource];
    if (v40 != [v8 keyFacePickSource])
    {
      v41 = objc_msgSend(NSNumber, "numberWithShort:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
      [v9 setObject:v41 forKey:@"keyFacePickSource"];

      v42 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v8, "keyFacePickSource"));
      [v10 setObject:v42 forKey:@"keyFacePickSource"];
    }
    v43 = [(PLPersistedPersonMetadata *)self detectionType];

    if (v43)
    {
      v44 = [(PLPersistedPersonMetadata *)self detectionType];
      int v45 = [v44 intValue];
      int v46 = [v8 detectionType];

      if (v45 != v46)
      {
        v47 = NSNumber;
        v48 = [(PLPersistedPersonMetadata *)self detectionType];
        v49 = objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "intValue"));
        [v9 setObject:v49 forKey:@"detectionType"];

LABEL_26:
        v51 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v8, "detectionType"));
        [v10 setObject:v51 forKey:@"detectionType"];
      }
    }
    else if ([v8 detectionType] != 1)
    {
      [v9 setObject:&unk_1EEBEF8D0 forKey:@"detectionType"];
      goto LABEL_26;
    }
    if (a4)
    {
      v53[0] = @"metadata";
      v53[1] = @"library";
      v54[0] = v9;
      v54[1] = v10;
      *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
    }
    if ([v9 count]) {
      BOOL v50 = 0;
    }
    else {
      BOOL v50 = [v10 count] == 0;
    }

    goto LABEL_33;
  }
  BOOL v50 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_33:

  return v50;
}

- (void)_saveMetadata
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [(PLPersistedPersonMetadata *)self _metadataData];
  uint64_t v5 = (void *)MEMORY[0x1E4F8B900];
  id v6 = [(PLPersistedPersonMetadata *)self metadataURL];
  [v5 persistMetadata:v4 fileURL:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4F8B908];
  v8 = [(PLPersistedPersonMetadata *)self metadataURL];
  uint64_t v9 = [v8 path];
  [v7 changeFileOwnerToMobileAtPath:v9 error:0];
}

- (id)_metadataData
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeInteger:10 forKey:@"version"];
  if (self->_person) {
    person = self->_person;
  }
  else {
    person = self;
  }
  uint64_t v5 = [person personUUID];
  if (v5)
  {
    id v6 = [NSString stringWithUTF8String:"personUUID"];
    [v3 encodeObject:v5 forKey:v6];
  }
  uint64_t v7 = self->_person;
  if (v7) {
    goto LABEL_7;
  }
  v62 = [(PLPersistedPersonMetadata *)self detectionType];

  if (v62)
  {
    uint64_t v7 = self->_person;
    if (!v7)
    {
      v63 = [(PLPersistedPersonMetadata *)self detectionType];
      __int16 v8 = [v63 intValue];

      goto LABEL_8;
    }
LABEL_7:
    __int16 v8 = [(PLPerson *)v7 detectionType];
LABEL_8:
    [v3 encodeInt:v8 forKey:@"detectionType"];
  }
  if (self->_person) {
    uint64_t v9 = self->_person;
  }
  else {
    uint64_t v9 = self;
  }
  uint64_t v10 = [v9 fullName];
  if (v10)
  {
    v11 = [NSString stringWithUTF8String:"fullName"];
    [v3 encodeObject:v10 forKey:v11];
  }
  if (self->_person) {
    uint64_t v12 = self->_person;
  }
  else {
    uint64_t v12 = self;
  }
  uint64_t v13 = [v12 displayName];
  if (v13)
  {
    v14 = [NSString stringWithUTF8String:"displayName"];
    [v3 encodeObject:v13 forKey:v14];
  }
  if (self->_person) {
    v15 = self->_person;
  }
  else {
    v15 = self;
  }
  unsigned int v16 = [v15 manualOrder];
  if (v16) {
    [v3 encodeInteger:v16 forKey:@"manualOrder"];
  }
  if (self->_person) {
    v17 = self->_person;
  }
  else {
    v17 = self;
  }
  uint64_t v18 = [v17 type];
  if (v18) {
    [v3 encodeInt32:v18 forKey:@"personType"];
  }
  if (self->_person) {
    v19 = self->_person;
  }
  else {
    v19 = self;
  }
  uint64_t v20 = [v19 keyFacePickSource];
  if (v20) {
    [v3 encodeInt32:v20 forKey:@"keyFacePickSource"];
  }
  if (self->_person) {
    int v21 = self->_person;
  }
  else {
    int v21 = self;
  }
  uint64_t v22 = [v21 verifiedType];
  if (!v22 || (int v23 = v22, [v3 encodeInt32:v22 forKey:@"verifiedType"], v23 != -2))
  {
    if (self->_person) {
      v24 = self->_person;
    }
    else {
      v24 = self;
    }
    v25 = [v24 personUri];
    if (v25)
    {
      char v26 = [NSString stringWithUTF8String:"personUri"];
      [v3 encodeObject:v25 forKey:v26];
    }
    if (self->_person) {
      v27 = self->_person;
    }
    else {
      v27 = self;
    }
    v28 = [v27 contactMatchingDictionary];
    if (v28) {
      [v3 encodeObject:v28 forKey:@"contactMatchingDictionary"];
    }
  }
  v67 = (void *)v13;
  v68 = (void *)v10;
  if (self->_person) {
    v29 = self->_person;
  }
  else {
    v29 = self;
  }
  uint64_t v30 = [v29 cloudVerifiedType];
  if (v30) {
    [v3 encodeInt32:v30 forKey:@"cloudVerifiedType"];
  }
  if (self->_person) {
    char v31 = self->_person;
  }
  else {
    char v31 = self;
  }
  v32 = [v31 userFeedbacks];
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v34 = v32;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v70 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = [*(id *)(*((void *)&v69 + 1) + 8 * i) dictionaryRepresentation];
        [v33 addObject:v39];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v36);
  }

  if ([v33 count]) {
    [v3 encodeObject:v33 forKey:@"userFeedbacks"];
  }
  if (self->_person) {
    int v40 = self->_person;
  }
  else {
    int v40 = self;
  }
  uint64_t v41 = [v40 assetSortOrder];
  if (v41) {
    [v3 encodeInt32:v41 forKey:@"assetSortOrder"];
  }
  if (self->_person)
  {
    v42 = [(id)objc_opt_class() _detectedFacesToArchiveWithPerson:self->_person];
    if ([v42 count])
    {
      v43 = [(PLPerson *)self->_person keyFace];
      v44 = [(id)objc_opt_class() _persistedFaceMetadataWithFaces:v42 keyFace:v43 clusterRejectedFaceIDs:0];
      uint64_t v45 = [v42 count];
      if (v45 != [v44 count])
      {
        int v46 = v5;
        v47 = PLMigrationGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          int v48 = [v42 count];
          int v49 = [v44 count];
          *(_DWORD *)buf = 138412546;
          v74 = v46;
          __int16 v75 = 1024;
          int v76 = v48 - v49;
          _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "Failed to encode some detected faces as metadata for %@ (%d failed)", buf, 0x12u);
        }

        uint64_t v5 = v46;
      }
      [v3 encodeObject:v44 forKey:@"detectedFaces"];
    }
    BOOL v50 = v5;
    v51 = [(id)objc_opt_class() _rejectedFacesToArchiveWithPerson:self->_person];
    v52 = [(id)objc_opt_class() _clusterRejectedFaceIDsWithPerson:self->_person];
    if ([v51 count])
    {
      v53 = objc_opt_class();
      v54 = [MEMORY[0x1E4F1CAD0] setWithArray:v52];
      v55 = [v53 _persistedFaceMetadataWithFaces:v51 keyFace:0 clusterRejectedFaceIDs:v54];

      uint64_t v56 = [v51 count];
      if (v56 != [v55 count])
      {
        v57 = PLMigrationGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          int v66 = [v51 count];
          int v58 = [v55 count];
          *(_DWORD *)buf = 138412546;
          v74 = v50;
          __int16 v75 = 1024;
          int v76 = v66 - v58;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to encode some rejected faces as metadata for %@ (%d failed)", buf, 0x12u);
        }
      }
      [v3 encodeObject:v55 forKey:@"rejectedFaces"];
    }
    v59 = [(PLPerson *)self->_person mergeTargetPerson];
    v60 = [v59 personUUID];

    if (v60)
    {
      v61 = [NSString stringWithUTF8String:"mergeTargetPersonUUID"];
      [v3 encodeObject:v60 forKey:v61];
    }
    uint64_t v5 = v50;
  }
  else
  {
    v42 = [(PLPersistedPersonMetadata *)self detectedFaces];
    if ([v42 count]) {
      [v3 encodeObject:v42 forKey:@"detectedFaces"];
    }
    v51 = [(PLPersistedPersonMetadata *)self rejectedFaces];
    if ([v51 count]) {
      [v3 encodeObject:v51 forKey:@"rejectedFaces"];
    }
  }

  v64 = [v3 encodedData];

  return v64;
}

- (BOOL)readMetadata
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PLPersistedPersonMetadata *)self metadataURL];
  uint64_t v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    uint64_t v7 = v6;
    BOOL v8 = v6 != 0;
    if (!v6)
    {
LABEL_57:

      goto LABEL_58;
    }
    unint64_t v9 = [v6 decodeIntegerForKey:@"version"];
    [(PLPersistedPersonMetadata *)self setFromVersion:v9];
    uint64_t v10 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"personUUID"];
    [(PLPersistedPersonMetadata *)self setPersonUUID:v10];

    if ([v7 containsValueForKey:@"detectionType"])
    {
      v11 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v7, "decodeIntForKey:", @"detectionType"));
      [(PLPersistedPersonMetadata *)self setDetectionType:v11];
    }
    uint64_t v12 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"mergeTargetPersonUUID"];
    [(PLPersistedPersonMetadata *)self setMergeTargetPersonUUID:v12];

    uint64_t v13 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = &stru_1EEB2EB80;
    }
    unsigned int v16 = v15;

    int v58 = v16;
    [(PLPersistedPersonMetadata *)self setFullName:v16];
    uint64_t v17 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    uint64_t v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = &stru_1EEB2EB80;
    }
    uint64_t v20 = v19;

    v57 = v20;
    [(PLPersistedPersonMetadata *)self setDisplayName:v20];
    -[PLPersistedPersonMetadata setManualOrder:](self, "setManualOrder:", [v7 decodeIntegerForKey:@"manualOrder"]);
    -[PLPersistedPersonMetadata setType:](self, "setType:", [v7 decodeInt32ForKey:@"personType"]);
    int v56 = [v7 containsValueForKey:@"keyFacePickSource"];
    if (v56) {
      -[PLPersistedPersonMetadata setKeyFacePickSource:](self, "setKeyFacePickSource:", (__int16)[v7 decodeInt32ForKey:@"keyFacePickSource"]);
    }
    int v21 = [v7 containsValueForKey:@"verifiedType"];
    char v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v7 decodeInt32ForKey:@"verifiedType"];
      [(PLPersistedPersonMetadata *)self setVerifiedType:v23];
      if ([v7 containsValueForKey:@"cloudVerifiedType"])
      {
        uint64_t v24 = [v7 decodeInt32ForKey:@"cloudVerifiedType"];
        v25 = self;
      }
      else
      {
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Person metatdata contains verifiedType but not cloudVerifiedType", buf, 2u);
        }

        v25 = self;
        uint64_t v24 = v23;
      }
      [(PLPersistedPersonMetadata *)v25 setCloudVerifiedType:v24];
    }
    else
    {
      char v26 = PLMigrationGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(PLPersistedPersonMetadata *)self personUUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v65 = (uint64_t)v27;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Person metadata for %@ does not contain verifiedType, needs fixup later", buf, 0xCu);
      }
    }
    if ([(PLPersistedPersonMetadata *)self verifiedType] != -2)
    {
      v29 = [v7 decodePropertyListForKey:@"contactMatchingDictionary"];
      [(PLPersistedPersonMetadata *)self setContactMatchingDictionary:v29];

      uint64_t v30 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"personUri"];
      [(PLPersistedPersonMetadata *)self setPersonUri:v30];
    }
    char v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, objc_opt_class(), 0);
    uint64_t v37 = [v7 decodeObjectOfClasses:v36 forKey:@"userFeedbacks"];
    [(PLPersistedPersonMetadata *)self setUserFeedbacksDictionaryArray:v37];

    -[PLPersistedPersonMetadata setAssetSortOrder:](self, "setAssetSortOrder:", (__int16)[v7 decodeIntForKey:@"assetSortOrder"]);
    if (v9 >= 2)
    {
      [(PLPersistedPersonMetadata *)self readDetectedFacesFromKeyedUnarchiver:v7];
      v39 = [(PLPersistedPersonMetadata *)self detectedFaces];
      BOOL v38 = [v39 count] != 0;

      if (v9 < 5)
      {
        int v40 = PLMigrationGetLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [(PLPersistedPersonMetadata *)self personUUID];
          *(_DWORD *)buf = 138412290;
          uint64_t v65 = (uint64_t)v44;
          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Dropping all rejected faces for person %@", buf, 0xCu);
        }
      }
      else
      {
        int v40 = +[PLPersistedPersonFaceMetadata _persistedFacesWithUnarchiver:v7 key:@"rejectedFaces"];
        uint64_t v41 = PLMigrationGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = [v40 count];
          v43 = [(PLPersistedPersonMetadata *)self personUUID];
          *(_DWORD *)buf = 134218242;
          uint64_t v65 = v42;
          __int16 v66 = 2112;
          v67 = v43;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Found %ld rejected faces for person %@", buf, 0x16u);
        }
        [(PLPersistedPersonMetadata *)self setRejectedFaces:v40];
      }

      if (v22) {
        goto LABEL_42;
      }
    }
    else
    {
      BOOL v38 = 0;
      if (v22) {
        goto LABEL_42;
      }
    }
    if (self->_cplEnabled)
    {
      uint64_t v45 = [(PLPersistedPersonMetadata *)self fullName];
      if ([v45 length] || -[PLPersistedPersonMetadata type](self, "type"))
      {
      }
      else
      {
        v54 = [(PLPersistedPersonMetadata *)self contactMatchingDictionary];
        if (v54) {
          int v55 = 1;
        }
        else {
          int v55 = v38;
        }

        if (v55 != 1)
        {
          uint64_t v46 = 0xFFFFFFFFLL;
          goto LABEL_41;
        }
      }
    }
    uint64_t v46 = 1;
LABEL_41:
    [(PLPersistedPersonMetadata *)self setVerifiedType:v46];
    [(PLPersistedPersonMetadata *)self setCloudVerifiedType:v46];
LABEL_42:
    if ((v56 & 1) == 0)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v47 = [(PLPersistedPersonMetadata *)self detectedFaces];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v60;
        while (2)
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v60 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            if ([v52 isRepresentative])
            {
              if ([v52 nameSource] == 1
                || [v52 nameSource] == 3)
              {
                [(PLPersistedPersonMetadata *)self setKeyFacePickSource:1];
              }
              goto LABEL_55;
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v49) {
            continue;
          }
          break;
        }
      }
LABEL_55:
    }
    BOOL v8 = 1;
    goto LABEL_57;
  }
  BOOL v8 = 0;
LABEL_58:

  return v8;
}

- (BOOL)readDetectedFacesFromKeyedUnarchiver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"version"];
    if (v6 >= 2)
    {
      unint64_t v7 = v6;
      BOOL v8 = +[PLPersistedPersonFaceMetadata _persistedFacesWithUnarchiver:v5 key:@"detectedFaces"];
      unint64_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v8 count];
        v11 = [(PLPersistedPersonMetadata *)self personUUID];
        int v14 = 134218242;
        uint64_t v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Found %ld detected faces (pre-migration) for person %@", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v12 = +[PLPersistedPersonFaceMetadata _migrateDetectedFaces:v8 forPersonMetadata:self fromVersion:v7];

      [(PLPersistedPersonMetadata *)self setDetectedFaces:v12];
    }
  }

  return v5 != 0;
}

- (BOOL)readDetectedFaces
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = [(PLPersistedPersonMetadata *)self metadataURL];
  uint64_t v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    BOOL v7 = [(PLPersistedPersonMetadata *)self readDetectedFacesFromKeyedUnarchiver:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_readUUID
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = [(PLPersistedPersonMetadata *)self metadataURL];
  uint64_t v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      BOOL v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"personUUID"];
      [(PLPersistedPersonMetadata *)self setPersonUUID:v8];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  if (self->_person) {
    person = self->_person;
  }
  else {
    person = self;
  }
  id v4 = +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:person indent:0];
  uint64_t v5 = self->_person;
  if (v5)
  {
    unint64_t v6 = [(PLPerson *)v5 objectID];
    [v6 description];
  }
  else
  {
    unint64_t v6 = [(PLPersistedPersonMetadata *)self metadataURL];
    [v6 path];
  BOOL v7 = };

  [v4 appendName:@"source" object:v7];
  objc_msgSend(v4, "appendName:integerValue:", @"version", -[PLPersistedPersonMetadata fromVersion](self, "fromVersion"));
  [v4 appendName:@"personUUID" typeCode:"@" value:&self->_personUUID];
  [v4 appendName:@"detectionType" typeCode:"@" value:&self->_detectionType];
  [v4 appendName:@"verifiedType" typeCode:"i" value:&self->_verifiedType];
  [v4 appendName:@"fullName" typeCode:"@" value:&self->_fullName];
  [v4 appendName:@"displayName" typeCode:"@" value:&self->_displayName];
  [v4 appendName:@"manualOrder" typeCode:"I" value:&self->_manualOrder];
  [v4 appendName:@"type" typeCode:"i" value:&self->_type];
  [v4 appendName:@"cloudVerifiedType" typeCode:"i" value:&self->_cloudVerifiedType];
  if (self->_person) {
    BOOL v8 = self->_person;
  }
  else {
    BOOL v8 = self;
  }
  unint64_t v9 = [v8 detectedFaces];
  int v10 = [v9 count];

  if (self->_person) {
    v11 = self->_person;
  }
  else {
    v11 = self;
  }
  uint64_t v12 = [v11 rejectedFaces];
  int v13 = [v12 count];

  [v4 appendName:@"faces" integerValue:v10];
  [v4 appendName:@"rejected" integerValue:v13];
  int v14 = [v4 build];

  return v14;
}

- (BOOL)_insertRejectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  int v10 = [(PLPersistedPersonMetadata *)self rejectedFaces];
  v11 = [[PLFaceRebuildHelper alloc] initWithContext:v9];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __104__PLPersistedPersonMetadata__insertRejectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke;
  v25 = &unk_1E586F390;
  uint64_t v12 = v11;
  char v26 = v12;
  id v13 = v8;
  id v27 = v13;
  v29 = &v42;
  BOOL v33 = a5;
  id v14 = v9;
  id v28 = v14;
  uint64_t v30 = &v38;
  char v31 = &v34;
  uint64_t v32 = &v46;
  +[PLPersistedPersonFaceMetadata enumerateMatchedAssetsWithMetadata:v10 inContext:v14 withBlock:&v22];
  uint64_t v15 = PLMigrationGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *((_DWORD *)v43 + 6);
    int v17 = *((_DWORD *)v39 + 6);
    int v18 = *((_DWORD *)v35 + 6);
    v19 = objc_msgSend(v13, "personUUID", v22, v23, v24, v25, v26, v27);
    *(_DWORD *)buf = 67109890;
    int v51 = v16;
    __int16 v52 = 1024;
    int v53 = v17;
    __int16 v54 = 1024;
    int v55 = v18;
    __int16 v56 = 2112;
    v57 = v19;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt %d rejected faces, deferred %d, dropped %d for %@", buf, 0x1Eu);
  }
  BOOL v20 = *((_DWORD *)v47 + 6) == *((_DWORD *)v43 + 6);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v20;
}

void __104__PLPersistedPersonMetadata__insertRejectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) rebuildRejectedFace:v5 onAsset:v6 person:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 56);
LABEL_11:
    ++*(_DWORD *)(*(void *)(v7 + 8) + 24);
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 88)
    || ([v5 assetCloudGUID], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    uint64_t v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Dropping unmatched face: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 72);
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = [*(id *)(a1 + 40) personUUID];
  v11 = [v5 _insertDeferredRebuildFaceFromDataInManagedObjectContext:v9 personUUID:v10 isRejected:1];

  if (v11) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }

LABEL_12:
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
}

- (BOOL)_insertDetectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  int v10 = [(PLPersistedPersonMetadata *)self detectedFaces];
  v11 = [[PLFaceRebuildHelper alloc] initWithContext:v9];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __104__PLPersistedPersonMetadata__insertDetectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke;
  v25 = &unk_1E586F390;
  uint64_t v12 = v11;
  char v26 = v12;
  id v13 = v8;
  id v27 = v13;
  v29 = &v42;
  BOOL v33 = a5;
  id v14 = v9;
  id v28 = v14;
  uint64_t v30 = &v38;
  char v31 = &v34;
  uint64_t v32 = &v46;
  +[PLPersistedPersonFaceMetadata enumerateMatchedAssetsWithMetadata:v10 inContext:v14 withBlock:&v22];
  uint64_t v15 = PLMigrationGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *((_DWORD *)v43 + 6);
    int v17 = *((_DWORD *)v39 + 6);
    int v18 = *((_DWORD *)v35 + 6);
    v19 = objc_msgSend(v13, "personUUID", v22, v23, v24, v25, v26, v27);
    *(_DWORD *)buf = 67109890;
    int v51 = v16;
    __int16 v52 = 1024;
    int v53 = v17;
    __int16 v54 = 1024;
    int v55 = v18;
    __int16 v56 = 2112;
    v57 = v19;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt %d detected faces, deferred %d, dropped %d for person %@", buf, 0x1Eu);
  }
  BOOL v20 = *((_DWORD *)v47 + 6) == *((_DWORD *)v43 + 6);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v20;
}

void __104__PLPersistedPersonMetadata__insertDetectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) rebuildDetectedFace:v5 onAsset:v6 person:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 56);
LABEL_13:
    ++*(_DWORD *)(*(void *)(v7 + 8) + 24);
    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 88)
    || ([v5 assetCloudGUID], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    uint64_t v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Dropping unmatched face: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 72);
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = [*(id *)(a1 + 40) personUUID];
  v11 = [v5 _insertDeferredRebuildFaceFromDataInManagedObjectContext:v9 personUUID:v10 isRejected:0];

  if (v11)
  {
    if ([v5 isRepresentative]) {
      [v11 setRepresentative:1];
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }

LABEL_14:
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = [v6 set];
  uint64_t v9 = [(PLPersistedPersonMetadata *)self detectedFaces];
  [(PLPersistedPersonMetadata *)self _addAssetUUIDsFromFaces:v9 toMutableSet:v8];

  int v10 = [(PLPersistedPersonMetadata *)self rejectedFaces];
  [(PLPersistedPersonMetadata *)self _addAssetUUIDsFromFaces:v10 toMutableSet:v8];

  v11 = [v8 allObjects];
  id v17 = 0;
  unint64_t v12 = +[PLManagedAsset countForAssetsWithUUIDs:v11 includePendingChanges:v4 inManagedObjectContext:v7 error:&v17];

  id v13 = v17;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in person metadata %@, %@", buf, 0x16u);
    }
  }
  BOOL v15 = v12 == [v8 count];

  return v15;
}

- (void)_addAssetUUIDsFromFaces:(id)a3 toMutableSet:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) assetUUID];
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)updateFacesInPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(PLPersistedPersonMetadata *)self _insertDetectedFacesOnPerson:v9 fromDataInManagedObjectContext:v8 deferUnmatched:v5];
  LOBYTE(v5) = [(PLPersistedPersonMetadata *)self _insertRejectedFacesOnPerson:v9 fromDataInManagedObjectContext:v8 deferUnmatched:v5];

  return v5 && v10;
}

- (id)insertPersonFromDataInManagedObjectContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PLPersistedPersonMetadata *)self personUUID];
  id v6 = [(PLPersistedPersonMetadata *)self fullName];
  uint64_t v7 = +[PLPerson insertIntoManagedObjectContext:v4 withPersonUUID:v5 fullName:v6 verifiedType:[(PLPersistedPersonMetadata *)self verifiedType]];

  id v8 = [(PLPersistedPersonMetadata *)self detectionType];

  if (v8)
  {
    id v9 = [(PLPersistedPersonMetadata *)self detectionType];
    objc_msgSend(v7, "setDetectionType:", (__int16)objc_msgSend(v9, "intValue"));
  }
  objc_msgSend(v7, "setCloudVerifiedType:", -[PLPersistedPersonMetadata cloudVerifiedType](self, "cloudVerifiedType"));
  BOOL v10 = [(PLPersistedPersonMetadata *)self displayName];
  [v7 setDisplayName:v10];

  objc_msgSend(v7, "setManualOrder:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
  objc_msgSend(v7, "setType:", -[PLPersistedPersonMetadata type](self, "type"));
  if ([(PLPersistedPersonMetadata *)self verifiedType] != -2)
  {
    v11 = [(PLPersistedPersonMetadata *)self personUri];
    [v7 setPersonUri:v11];

    long long v12 = [(PLPersistedPersonMetadata *)self contactMatchingDictionary];
    [v7 setContactMatchingDictionary:v12];
  }
  objc_msgSend(v7, "setKeyFacePickSource:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = [(PLPersistedPersonMetadata *)self userFeedbacksDictionaryArray];
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
        v19 = +[PLUserFeedback insertIntoManagedObjectContext:v4 withDictionaryRepresentation:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  [v7 setUserFeedbacks:v13];
  objc_msgSend(v7, "setAssetSortOrder:", -[PLPersistedPersonMetadata assetSortOrder](self, "assetSortOrder"));

  return v7;
}

- (void)removePersistedData
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PLPersistedPersonMetadata *)self metadataURL];
  [v3 _deleteMetadataFileWithMetadataURL:v4];
}

- (id)detectedFaceIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(PLPersistedPersonMetadata *)self detectedFaces];
  BOOL v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(PLPersistedPersonMetadata *)self detectedFaces];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) _identifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 deferUnarchiving:(BOOL)a4 cplEnabled:(BOOL)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLPersistedPersonMetadata;
  BOOL v10 = [(PLPersistedPersonMetadata *)&v14 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v10->_metadataURL, a3);
  v11->_cplEnabled = a5;
  if (!v6)
  {
    if (![(PLPersistedPersonMetadata *)v11 readMetadata]) {
      goto LABEL_4;
    }
LABEL_6:
    long long v12 = v11;
    goto LABEL_7;
  }
  if ([(PLPersistedPersonMetadata *)v11 _readUUID]) {
    goto LABEL_6;
  }
LABEL_4:
  long long v12 = 0;
LABEL_7:

  return v12;
}

- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 cplEnabled:(BOOL)a4
{
  return [(PLPersistedPersonMetadata *)self initWithPersistedDataAtURL:a3 deferUnarchiving:0 cplEnabled:a4];
}

- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 metadataURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLPersistedPersonMetadata;
  id v9 = [(PLPersistedPersonMetadata *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_metadataURL, a4);
    v11 = [v7 photoLibrary];
    v10->_cplEnabled = [v11 isCloudPhotoLibraryEnabled];
  }
  return v10;
}

- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 pathManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [v7 personUUID];
  BOOL v10 = [v8 _metadataFileURLForPersonUUID:v9 pathManager:v6];

  v11 = [(PLPersistedPersonMetadata *)self initWithPLPerson:v7 metadataURL:v10];
  return v11;
}

- (PLPersistedPersonMetadata)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLPersistedPersonMetadata.m" lineNumber:558 description:@"Can't initialize a PLPersistedPersonMetadata object using -init."];

  return 0;
}

+ (void)performPostImportMigrationFromVersion:(unint64_t)a3 fromDataInManagedObjectContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Post-import migration of persons from metadata version %lu", (uint8_t *)&v11, 0xCu);
  }

  if (a3 <= 9)
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Resetting manual order on persons", (uint8_t *)&v11, 2u);
    }

    id v8 = [v5 photoLibrary];
    id v9 = [v8 libraryServicesManager];
    BOOL v10 = [v9 modelMigrator];
    [v10 resetManualOrderForNonFavoritePeopleInManagedObjectContext:v5];
  }
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
        int v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v12 = objc_msgSend(v5, "objectForKey:", v11, v20);
        uint64_t v13 = +[PLPerson personWithUUID:v11 inManagedObjectContext:v6];
        objc_super v14 = +[PLPerson personWithUUID:v12 inManagedObjectContext:v6];
        long long v15 = [v14 finalMergeTargetPerson];

        long long v16 = PLMigrationGetLog();
        uint64_t v17 = v16;
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
            id v27 = v12;
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
            id v27 = v15;
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

+ (id)personUUIDsToDedupeWithMetadataURLs:(id)a3 cplEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  context = (void *)MEMORY[0x19F38D3B0]();
  id v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Deduping person metadata archives based on their sets of faces", buf, 2u);
  }

  uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v13 = [[PLPersistedPersonMetadata alloc] initWithPersistedDataAtURL:v12 deferUnarchiving:1 cplEnabled:v4];
        uint64_t v14 = [(PLPersistedPersonMetadata *)v13 personUUID];
        if (v14)
        {
          long long v15 = (void *)v14;
          BOOL v16 = [(PLPersistedPersonMetadata *)v13 readDetectedFaces];

          if (v16)
          {
            uint64_t v17 = [(PLPersistedPersonMetadata *)v13 detectedFaceIdentifiers];
            uint64_t v18 = [v17 count];

            if (!v18) {
              goto LABEL_16;
            }
            v19 = [(PLPersistedPersonMetadata *)v13 personUUID];
            [v32 addObject:v19];

            long long v20 = [(PLPersistedPersonMetadata *)v13 detectedFaceIdentifiers];
            uint64_t v21 = [(PLPersistedPersonMetadata *)v13 personUUID];
            [v31 setObject:v20 forKey:v21];
            goto LABEL_14;
          }
        }
        long long v20 = PLMigrationGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [v12 path];
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)v21;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata at %@, this person will not be deduped", buf, 0xCu);
LABEL_14:
        }
LABEL_16:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v9);
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke;
  v37[3] = &unk_1E586F3B8;
  id v22 = v31;
  id v38 = v22;
  [v32 sortUsingComparator:v37];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke_2;
  v33[3] = &unk_1E586F3E0;
  id v34 = v22;
  id v35 = v32;
  id v23 = v29;
  id v36 = v23;
  id v24 = v32;
  id v25 = v22;
  [v24 enumerateObjectsUsingBlock:v33];
  uint64_t v26 = PLMigrationGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v23 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v27;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Found %ld person duplicates, these will be skipped while rebuilding persons", buf, 0xCu);
  }

  return v23;
}

uint64_t __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  unint64_t v8 = [v7 count];

  uint64_t v9 = [*(id *)(a1 + 32) objectForKey:v6];

  unint64_t v10 = [v9 count];
  if (v8 < v10) {
    return -1;
  }
  else {
    return v8 > v10;
  }
}

void __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = objc_msgSend(a1[4], "objectForKey:");
  while (++a3 < (unint64_t)[a1[5] count])
  {
    id v6 = [a1[5] objectAtIndex:a3];
    id v7 = [a1[4] objectForKey:v6];
    if ([v5 isSubsetOfSet:v7])
    {
      [a1[6] addObject:v8];

      break;
    }
  }
}

+ (id)_persistedFaceMetadataWithFaces:(id)a3 keyFace:(id)a4 clusterRejectedFaceIDs:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v8;
  unint64_t v10 = [v8 objectID];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v16 = [v15 objectID];
        uint64_t v17 = [v10 isEqual:v16];

        uint64_t v18 = [v15 objectID];
        uint64_t v19 = [v9 containsObject:v18];

        long long v20 = +[PLPersistedPersonFaceMetadata _persistedFaceMetadataWithDetectedFace:v15 isKeyFace:v17 isClusterRejected:v19];
        if (v20) {
          [v24 addObject:v20];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  return v24;
}

+ (id)_clusterRejectedFaceIDsWithPerson:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS %@", @"clusterRejectedPersons", v4];
  id v6 = [v4 managedObjectContext];
  id v12 = 0;
  id v7 = [a1 _fetchFacesWithPredicate:v5 resultType:1 managedObjectContext:v6 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = [v4 personUUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch clusterRejectedFaceIDsWithPerson %@: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)_rejectedFacesToArchiveWithPerson:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS %@", @"rejectedPersons", v4];
  id v6 = [v4 managedObjectContext];
  id v12 = 0;
  id v7 = [a1 _fetchFacesWithPredicate:v5 resultType:0 managedObjectContext:v6 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = [v4 personUUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch rejectedFacesToArchiveWithPerson %@: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)_detectedFacesToArchiveWithPerson:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v4 objectID];
  id v7 = [v5 predicateWithFormat:@"%K = %@", @"personForFace", v6];

  id v8 = +[PLDetectedFace predicateForArchival];
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v7;
  v23[1] = v8;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v11 = [v9 andPredicateWithSubpredicates:v10];

  id v12 = [v4 managedObjectContext];
  id v18 = 0;
  uint64_t v13 = [a1 _fetchFacesWithPredicate:v11 resultType:0 managedObjectContext:v12 error:&v18];
  id v14 = v18;

  if (!v13)
  {
    __int16 v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v4 personUUID];
      *(_DWORD *)buf = 138412546;
      long long v20 = v16;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch detectedFacesToArchiveFromPerson %@: %@", buf, 0x16u);
    }
  }

  return v13;
}

+ (id)_fetchFacesWithPredicate:(id)a3 resultType:(unint64_t)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[PLDetectedFace fetchRequest];
  [v11 setPredicate:v10];

  [v11 setFetchBatchSize:100];
  [v11 setResultType:a4];
  if (a4 != 1)
  {
    id v12 = +[PLPersistedPersonFaceMetadata _detectedFaceRelationshipKeyPathsToPrefetch];
    [v11 setRelationshipKeyPathsForPrefetching:v12];
  }
  id v17 = 0;
  uint64_t v13 = [v9 executeFetchRequest:v11 error:&v17];
  id v14 = v17;
  __int16 v15 = v14;
  if (a6 && !v13) {
    *a6 = v14;
  }

  return v13;
}

+ (BOOL)_deleteMetadataFileWithMetadataURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    char v8 = [v7 removeItemAtURL:v3 error:&v17];
    id v9 = v17;

    id v10 = PLMigrationGetLog();
    uint64_t v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v3;
        id v12 = "Removed person persistence data at URL %@";
        uint64_t v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 12;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v3;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      id v12 = "Failed to remove person persistence data at URL (%@) with error: %@";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v9 = PLMigrationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Attempting to remove person persistence data that does not exist at URL %@", buf, 0xCu);
  }
  char v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)deleteMetadataFileForPersonUUID:(id)a3 pathManager:(id)a4
{
  id v4 = a1;
  id v5 = [a1 _metadataFileURLForPersonUUID:a3 pathManager:a4];
  LOBYTE(v4) = [v4 _deleteMetadataFileWithMetadataURL:v5];

  return (char)v4;
}

+ (id)urlsForPersistedPersonsInMetadataDirectoryWithPathManager:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [a3 privateDirectoryWithSubType:5 createIfNeeded:0 error:0];
  int v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:0 error:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__PLPersistedPersonMetadata_urlsForPersistedPersonsInMetadataDirectoryWithPathManager___block_invoke;
  v11[3] = &__block_descriptor_40_e15_B16__0__NSURL_8l;
  v11[4] = a1;
  id v9 = objc_msgSend(v8, "_pl_filter:", v11);

  return v9;
}

uint64_t __87__PLPersistedPersonMetadata_urlsForPersistedPersonsInMetadataDirectoryWithPathManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  uint64_t v4 = [v2 isValidPath:v3];

  return v4;
}

+ (id)urlsForPersistedPersonsInMetadataDirectoryOfLibrary:(id)a3
{
  uint64_t v4 = [a3 pathManager];
  id v5 = [a1 urlsForPersistedPersonsInMetadataDirectoryWithPathManager:v4];

  return v5;
}

+ (id)_metadataFileURLForPersonUUID:(id)a3 pathManager:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a3;
  id v7 = [a4 privateDirectoryWithSubType:5 createIfNeeded:1 error:0];
  char v8 = [v5 fileURLWithPath:v7 isDirectory:1];

  id v9 = [NSString stringWithFormat:@"%@.%@", v6, PLFaceMetadataExtension];

  id v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

+ (BOOL)isValidPath:(id)a3 outPersonUUID:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 pathExtension];
  int v7 = [v6 isEqualToString:PLFaceMetadataExtension];
  BOOL v8 = v7;
  if (a4 && v7)
  {
    id v9 = [v5 pathComponents];
    id v10 = [v9 lastObject];

    *a4 = [v10 stringByDeletingPathExtension];
  }
  return v8;
}

+ (BOOL)isValidPath:(id)a3
{
  return [a1 isValidPath:a3 outPersonUUID:0];
}

@end