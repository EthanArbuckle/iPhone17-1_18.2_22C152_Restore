@interface PLAssetJournalEntryPayloadResource
+ (BOOL)isValidForPersistenceWithRecipeID:(unsigned int)a3;
+ (void)_applyLargeVideoRecipeRefactorFixToExternalResource:(id)a3 withAsset:(id)a4;
- (BOOL)isAdjusted;
- (BOOL)isEqualToPayloadResource:(id)a3;
- (BOOL)isOriginalResource;
- (BOOL)isPrimaryResource;
- (BOOL)isReferenceResource;
- (BOOL)isValidForPersistence;
- (NSData)bookmarkData;
- (NSDictionary)payloadAttributes;
- (NSString)bookmarkPath;
- (NSString)description;
- (NSString)uniformTypeIdentifierString;
- (NSString)volumeUuidString;
- (PLAssetJournalEntryPayloadResource)initWithPayloadAttributes:(id)a3 payload:(id)a4;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (id)fourCharCodeName;
- (id)validatedExternalResourceWithAsset:(id)a3 isCPLEnabled:(BOOL)a4;
- (signed)trashedState;
- (unint64_t)cplType;
- (unsigned)dataStoreClassID;
- (unsigned)recipeID;
- (unsigned)resourceType;
- (unsigned)version;
- (void)appendToDescriptionBuilder:(id)a3;
- (void)mergePayloadResource:(id)a3 nilAttributes:(id)a4;
- (void)updateStoredResource:(id)a3;
@end

@implementation PLAssetJournalEntryPayloadResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
}

- (NSDictionary)payloadAttributes
{
  return self->_payloadAttributes;
}

- (NSString)description
{
  return [(NSDictionary *)self->_payloadAttributes description];
}

- (BOOL)isValidForPersistence
{
  v3 = objc_opt_class();
  uint64_t v4 = [(PLAssetJournalEntryPayloadResource *)self recipeID];
  return [v3 isValidForPersistenceWithRecipeID:v4];
}

- (BOOL)isReferenceResource
{
  v3 = [(PLAssetJournalEntryPayloadResource *)self bookmarkData];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PLAssetJournalEntryPayloadResource *)self bookmarkPath];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)isAdjusted
{
  return [(PLAssetJournalEntryPayloadResource *)self version] == 2
      || [(PLAssetJournalEntryPayloadResource *)self version] == 1;
}

- (BOOL)isPrimaryResource
{
  if ([(PLAssetJournalEntryPayloadResource *)self resourceType])
  {
    unsigned int v3 = [(PLAssetJournalEntryPayloadResource *)self resourceType];
    if (v3 != 1) {
      LOBYTE(v3) = [(PLAssetJournalEntryPayloadResource *)self resourceType] == 2;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PLAssetJournalEntryPayloadResource *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PLAssetJournalEntryPayloadResource *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (signed)trashedState
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"inTrash"];
  signed __int16 v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)bookmarkPath
{
  return (NSString *)[(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"bookmarkPath"];
}

- (NSData)bookmarkData
{
  return (NSData *)[(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"bookmarkData"];
}

- (NSString)volumeUuidString
{
  payload = self->_payload;
  signed __int16 v3 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"volume"];
  BOOL v4 = [(PLManagedObjectJournalEntryPayload *)payload UUIDStringForData:v3];

  return (NSString *)v4;
}

- (id)fourCharCodeName
{
  return [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"codec"];
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  v2 = [(PLAssetJournalEntryPayloadResource *)self uniformTypeIdentifierString];
  signed __int16 v3 = +[PLUniformTypeIdentifier utiWithIdentifier:v2];

  return (PLUniformTypeIdentifier *)v3;
}

- (NSString)uniformTypeIdentifierString
{
  return (NSString *)[(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"uti"];
}

- (unsigned)recipeID
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"recipeID"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unsigned)version
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"version"];
  unsigned int v3 = [v2 unsignedShortValue];

  return v3;
}

- (unsigned)resourceType
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"type"];
  unsigned int v3 = [v2 unsignedShortValue];

  return v3;
}

- (unsigned)dataStoreClassID
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"storeID"];
  unsigned __int16 v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)cplType
{
  v2 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"subType"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)mergePayloadResource:(id)a3 nilAttributes:(id)a4
{
  id v12 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v8 = (NSDictionary *)[[v6 alloc] initWithDictionary:self->_payloadAttributes];
  v9 = [v7 payloadAttributes];

  [(NSDictionary *)v8 addEntriesFromDictionary:v9];
  if ([v12 count])
  {
    v10 = [v12 allObjects];
    [(NSDictionary *)v8 removeObjectsForKeys:v10];
  }
  payloadAttributes = self->_payloadAttributes;
  self->_payloadAttributes = v8;
}

- (BOOL)isEqualToPayloadResource:(id)a3
{
  id v4 = a3;
  if ([v4 cplType]
    && [v4 resourceType] != 5
    && (uint64_t v5 = [v4 cplType], v5 == -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"))
    && (int v6 = [v4 version], v6 == -[PLAssetJournalEntryPayloadResource version](self, "version")))
  {
    char v7 = 1;
  }
  else
  {
    int v8 = [v4 resourceType];
    if (v8 == [(PLAssetJournalEntryPayloadResource *)self resourceType]
      && (int v9 = [v4 version], v9 == -[PLAssetJournalEntryPayloadResource version](self, "version"))
      && (int v10 = [v4 recipeID], v10 == -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID")))
    {
      v11 = [v4 uniformTypeIdentifierString];
      id v12 = [(PLAssetJournalEntryPayloadResource *)self uniformTypeIdentifierString];
      char v7 = [v11 isEqualToString:v12];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)appendToDescriptionBuilder:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_payloadAttributes allKeys];
  int v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        if ([v11 isEqualToString:@"volume"])
        {
          uint64_t v12 = [(PLAssetJournalEntryPayloadResource *)self volumeUuidString];
LABEL_8:
          v13 = (__CFString *)v12;
          [v4 appendName:v11 object:v12];
          goto LABEL_19;
        }
        if ([v11 isEqualToString:@"type"])
        {
          v14 = NSString;
          unsigned int v15 = [(PLAssetJournalEntryPayloadResource *)self resourceType];
          v16 = @"invalid";
          if (v15 <= 0x1F) {
            v16 = off_1E58641E0[v15];
          }
          v13 = v16;
          uint64_t v17 = [(PLAssetJournalEntryPayloadResource *)self resourceType];
          goto LABEL_17;
        }
        if ([v11 isEqualToString:@"version"])
        {
          v14 = NSString;
          unsigned int v18 = [(PLAssetJournalEntryPayloadResource *)self version];
          v19 = @"cur";
          if (v18 <= 2) {
            v19 = off_1E58642E0[v18];
          }
          v13 = v19;
          uint64_t v17 = [(PLAssetJournalEntryPayloadResource *)self version];
LABEL_17:
          [v14 stringWithFormat:@"%@ (%d)", v13, v17];
          v20 = LABEL_18:;
          [v4 appendName:v11 object:v20];

          goto LABEL_19;
        }
        if (![v11 isEqualToString:@"recipeID"])
        {
          if (![v11 isEqualToString:@"subType"])
          {
            uint64_t v12 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:v11];
            goto LABEL_8;
          }
          v25 = NSString;
          objc_msgSend(MEMORY[0x1E4F59940], "shortDescriptionForResourceType:", -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          [v25 stringWithFormat:@"%@ (%lu)", v13, -[PLAssetJournalEntryPayloadResource cplType](self, "cplType")];
          goto LABEL_18;
        }
        v21 = +[PLResourceRecipe recipeFromID:[(PLAssetJournalEntryPayloadResource *)self recipeID]];
        v13 = v21;
        v22 = NSString;
        if (v21)
        {
          v23 = [(__CFString *)v21 description];
          v24 = [v22 stringWithFormat:@"%@ (%d_%d, %d)", v23, -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID") >> 16, (unsigned __int16)-[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID") >> 1, -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID")];
          [v4 appendName:v11 object:v24];
        }
        else
        {
          v23 = objc_msgSend(NSString, "stringWithFormat:", @"None (%d)", -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
          [v4 appendName:v11 object:v23];
        }

LABEL_19:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v8 = v26;
    }
    while (v26);
  }
}

- (void)updateStoredResource:(id)a3
{
  id v17 = a3;
  id v4 = [(PLAssetJournalEntryPayloadResource *)self volumeUuidString];

  if (v4)
  {
    uint64_t v5 = [(PLAssetJournalEntryPayloadResource *)self volumeUuidString];
    int v6 = [v17 managedObjectContext];
    uint64_t v7 = +[PLFileSystemVolume volumeForObjectUUID:v5 context:v6];
    [v17 setFileSystemVolume:v7];
  }
  if ([(PLAssetJournalEntryPayloadResource *)self isReferenceResource])
  {
    uint64_t v8 = [v17 managedObjectContext];
    uint64_t v9 = +[PLManagedObject insertInManagedObjectContext:v8];

    uint64_t v10 = [(PLAssetJournalEntryPayloadResource *)self bookmarkData];
    [v9 setBookmarkData:v10];

    v11 = [(PLAssetJournalEntryPayloadResource *)self bookmarkPath];
    [v9 setPathRelativeToVolume:v11];

    [v17 setFileSystemBookmark:v9];
    uint64_t v12 = [[PLPrimaryResourceDataStoreReferenceFileKey alloc] initWithResourceType:[(PLAssetJournalEntryPayloadResource *)self resourceType]];
    v13 = [(PLPrimaryResourceDataStoreReferenceFileKey *)v12 keyData];
    [v17 setDataStoreKeyData:v13];

    [v17 setLocalAvailability:1];
  }
  int v14 = [(PLAssetJournalEntryPayloadResource *)self trashedState];
  unsigned int v15 = v17;
  if (v14)
  {
    objc_msgSend(v17, "setTrashedState:", -[PLAssetJournalEntryPayloadResource trashedState](self, "trashedState"));
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v17 setTrashedDate:v16];

    unsigned int v15 = v17;
  }
}

- (id)validatedExternalResourceWithAsset:(id)a3 isCPLEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(PLValidatedExternalCloudResource);
  [(PLValidatedExternalResource *)v7 setResourceType:[(PLAssetJournalEntryPayloadResource *)self resourceType]];
  [(PLValidatedExternalResource *)v7 setVersion:[(PLAssetJournalEntryPayloadResource *)self version]];
  [(PLValidatedExternalResource *)v7 setRecipeID:[(PLAssetJournalEntryPayloadResource *)self recipeID]];
  uint64_t v8 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"length"];
  -[PLValidatedExternalResource setDataLength:](v7, "setDataLength:", [v8 longLongValue]);

  uint64_t v9 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"uwidth"];
  -[PLValidatedExternalResource setUnorientedWidth:](v7, "setUnorientedWidth:", [v9 longLongValue]);

  uint64_t v10 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"uheight"];
  -[PLValidatedExternalResource setUnorientedHeight:](v7, "setUnorientedHeight:", [v10 longLongValue]);

  v11 = [(PLAssetJournalEntryPayloadResource *)self uniformTypeIdentifierString];
  uint64_t v12 = +[PLUniformTypeIdentifier utiWithIdentifier:v11];

  [(PLValidatedExternalResource *)v7 setUniformTypeIdentifier:v12];
  v13 = [(PLAssetJournalEntryPayloadResource *)self fourCharCodeName];

  if (v13)
  {
    int v14 = [(PLAssetJournalEntryPayloadResource *)self fourCharCodeName];
    [(PLValidatedExternalResource *)v7 setCodecFourCharCode:v14];
  }
  [(PLValidatedExternalCloudResource *)v7 setCplType:[(PLAssetJournalEntryPayloadResource *)self cplType]];
  unsigned int v15 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"fingerprint"];
  [(PLValidatedExternalCloudResource *)v7 setFingerprint:v15];

  v16 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"stableHash"];
  [(PLValidatedExternalCloudResource *)v7 setStableHash:v16];

  if (v4 && [(PLValidatedExternalCloudResource *)v7 cplType])
  {
    id v17 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"remoteAvailability"];
    -[PLValidatedExternalCloudResource setRemoteAvailability:](v7, "setRemoteAvailability:", (__int16)[v17 integerValue]);

    unsigned int v18 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"cloudLocalState"];
    -[PLValidatedExternalCloudResource setCloudLocalState:](v7, "setCloudLocalState:", (__int16)[v18 integerValue]);
  }
  else
  {
    [(PLValidatedExternalCloudResource *)v7 setRemoteAvailability:0];
    [(PLValidatedExternalCloudResource *)v7 setCloudLocalState:0];
  }
  v19 = [v6 master];
  v20 = [v19 creationDate];
  [(PLValidatedExternalCloudResource *)v7 setMasterDateCreated:v20];

  v21 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"ptpTrashedState"];
  -[PLValidatedExternalResource setPtpTrashedState:](v7, "setPtpTrashedState:", [v21 integerValue]);

  v22 = [(NSDictionary *)self->_payloadAttributes objectForKeyedSubscript:@"sidecarIndex"];
  [(PLValidatedExternalResource *)v7 setSidecarIndex:v22];

  if (![(PLAssetJournalEntryPayloadResource *)self isReferenceResource])
  {
    [(id)objc_opt_class() _applyLargeVideoRecipeRefactorFixToExternalResource:v7 withAsset:v6];
    if ([(PLAssetJournalEntryPayloadResource *)self cplType] == 1)
    {
      v23 = [v6 mainFileURL];
      [(PLValidatedExternalResource *)v7 setFileURL:v23];
    }
    else
    {
      v24 = [v6 pathManager];
      if ([v24 isUBF])
      {
        if (v12)
        {
          id v25 = objc_alloc(MEMORY[0x1E4F8B978]);
          uint64_t v26 = [v6 uuid];
          v27 = [v12 identifier];
          long long v28 = objc_msgSend(v25, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v26, 0, v27, -[PLValidatedExternalResource version](v7, "version"), -[PLValidatedExternalResource resourceType](v7, "resourceType"), -[PLValidatedExternalResource recipeID](v7, "recipeID"), 0);

          long long v29 = [v24 readOnlyUrlWithIdentifier:v28];
          [(PLValidatedExternalResource *)v7 setFileURL:v29];
        }
        else
        {
          v38 = PLMigrationGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = [v6 uuid];
            *(_DWORD *)buf = 138412546;
            v51 = v39;
            __int16 v52 = 2112;
            v53 = self;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Resource payload has nil UTI, cannot derive resource URL, assetUUID: %@, payload: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        long long v30 = [v12 identifier];
        long long v31 = +[PLManagedAsset preferredFileExtensionForType:v30];

        id v49 = v31;
        [v49 UTF8String];
        [(PLValidatedExternalResource *)v7 version];
        [(PLValidatedExternalResource *)v7 recipeID];
        [(PLValidatedExternalResource *)v7 resourceType];
        v47 = [v6 filename];
        v45 = [v6 directory];
        id v48 = [v24 photoDirectoryWithType:1];
        [v48 UTF8String];
        id v46 = [v24 photoDirectoryWithType:4];
        [v46 UTF8String];
        id v44 = [v24 photoDirectoryWithType:9];
        uint64_t v43 = [v44 UTF8String];
        id v32 = [v24 photoDirectoryWithType:10];
        uint64_t v33 = [v32 UTF8String];
        id v34 = [v24 photoDirectoryWithType:18];
        uint64_t v35 = [v34 UTF8String];
        id v36 = [v24 photoDirectoryWithType:12];
        uint64_t v42 = [v36 UTF8String];
        uint64_t v41 = v33;
        v37 = PLDCIMURLForResourceProperties();
        -[PLValidatedExternalResource setFileURL:](v7, "setFileURL:", v37, v43, v41, v35, v42, "");
      }
    }
  }

  return v7;
}

- (PLAssetJournalEntryPayloadResource)initWithPayloadAttributes:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAssetJournalEntryPayloadResource;
  uint64_t v9 = [(PLAssetJournalEntryPayloadResource *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadAttributes, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

+ (BOOL)isValidForPersistenceWithRecipeID:(unsigned int)a3
{
  return (a3 - 327687 > 6 || ((1 << (a3 - 7)) & 0x55) == 0) && a3 != 65747 && a3 != 65749;
}

+ (void)_applyLargeVideoRecipeRefactorFixToExternalResource:(id)a3 withAsset:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 recipeID] == 131473)
  {
    id v7 = [v6 pathManager];
    if ([v7 isUBF])
    {
      id v8 = [v5 uniformTypeIdentifier];
      uint64_t v9 = [v8 identifier];

      if (v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F8B978]);
        v11 = [v6 uuid];
        objc_super v12 = objc_msgSend(v10, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v11, 0, v9, objc_msgSend(v5, "version"), objc_msgSend(v5, "resourceType"), objc_msgSend(v5, "recipeID"), 0);

        id v13 = [v7 readOnlyUrlWithIdentifier:v12];
        if (unlink((const char *)[v13 fileSystemRepresentation]) && *__error() != 2)
        {
          int v14 = PLMigrationGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v15 = *__error();
            v16 = __error();
            id v17 = strerror(*v16);
            *(_DWORD *)buf = 67109634;
            int v19 = v15;
            __int16 v20 = 2082;
            v21 = v17;
            __int16 v22 = 2082;
            uint64_t v23 = [v13 fileSystemRepresentation];
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "unlink failed with errno %d (%{public}s) for path %{public}s", buf, 0x1Cu);
          }
        }
      }
    }
    [v5 setRecipeID:131077];
  }
}

@end