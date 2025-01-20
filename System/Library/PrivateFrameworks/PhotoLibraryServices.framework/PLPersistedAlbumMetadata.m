@interface PLPersistedAlbumMetadata
+ (BOOL)isValidPath:(id)a3;
- (BOOL)_readMetadata;
- (BOOL)allowsOverwrite;
- (BOOL)customSortAscending;
- (BOOL)isFolder;
- (BOOL)isInTrash;
- (BOOL)isPinned;
- (BOOL)isPrototype;
- (NSData)userQueryData;
- (NSMutableOrderedSet)assetUUIDs;
- (NSNumber)kind;
- (NSString)cloudGUID;
- (NSString)customKeyAssetUUID;
- (NSString)importSessionID;
- (NSString)importedByBundleIdentifier;
- (NSString)projectDocumentType;
- (NSString)title;
- (NSString)uuid;
- (NSURL)metadataURL;
- (PLGenericAlbum)genericAlbum;
- (PLPersistedAlbumMetadata)init;
- (PLPersistedAlbumMetadata)initWithPLGenericAlbum:(id)a3 pathManager:(id)a4;
- (PLPersistedAlbumMetadata)initWithPersistedDataAtURL:(id)a3;
- (PLPersistedAlbumMetadata)initWithTitle:(id)a3 uuid:(id)a4 cloudGUID:(id)a5 kind:(id)a6 assetUUIDs:(id)a7 persistedAlbumDataDirectory:(id)a8;
- (id)_fetchChildUUIDs;
- (id)description;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (int)customSortKey;
- (void)_saveMetadata;
- (void)removePersistedAlbumData;
- (void)setAllowsOverwrite:(BOOL)a3;
- (void)setAssetUUIDs:(id)a3;
- (void)setCloudGUID:(id)a3;
- (void)setCustomKeyAssetUUID:(id)a3;
- (void)setCustomSortAscending:(BOOL)a3;
- (void)setCustomSortKey:(int)a3;
- (void)setGenericAlbum:(id)a3;
- (void)setImportSessionID:(id)a3;
- (void)setImportedByBundleIdentifier:(id)a3;
- (void)setInTrash:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setPinned:(BOOL)a3;
- (void)setProjectDocumentType:(id)a3;
- (void)setPrototype:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserQueryData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateChildrenOrderingInAlbum:(id)a3 includePendingAssetChanges:(BOOL)a4;
@end

@implementation PLPersistedAlbumMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_genericAlbum, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userQueryData, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_customKeyAssetUUID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setMetadataURL:(id)a3
{
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setGenericAlbum:(id)a3
{
}

- (PLGenericAlbum)genericAlbum
{
  return self->_genericAlbum;
}

- (void)setAllowsOverwrite:(BOOL)a3
{
  self->_allowsOverwrite = a3;
}

- (BOOL)allowsOverwrite
{
  return self->_allowsOverwrite;
}

- (void)setProjectDocumentType:(id)a3
{
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setUserQueryData:(id)a3
{
}

- (NSData)userQueryData
{
  return self->_userQueryData;
}

- (void)setImportSessionID:(id)a3
{
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setAssetUUIDs:(id)a3
{
}

- (NSMutableOrderedSet)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setCustomKeyAssetUUID:(id)a3
{
}

- (NSString)customKeyAssetUUID
{
  return self->_customKeyAssetUUID;
}

- (void)setCustomSortKey:(int)a3
{
  self->_customSortKey = a3;
}

- (int)customSortKey
{
  return self->_customSortKey;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  self->_customSortAscending = a3;
}

- (BOOL)customSortAscending
{
  return self->_customSortAscending;
}

- (void)setInTrash:(BOOL)a3
{
  self->_inTrash = a3;
}

- (BOOL)isInTrash
{
  return self->_inTrash;
}

- (void)setPrototype:(BOOL)a3
{
  self->_prototype = a3;
}

- (BOOL)isPrototype
{
  return self->_prototype;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setKind:(id)a3
{
}

- (NSNumber)kind
{
  return self->_kind;
}

- (void)setCloudGUID:(id)a3
{
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)_saveMetadata
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if ([(PLPersistedAlbumMetadata *)self allowsOverwrite]) {
    goto LABEL_3;
  }
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PLPersistedAlbumMetadata *)self metadataURL];
  v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7 = (void *)MEMORY[0x19F38D3B0]();
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v8 encodeInteger:1 forKey:@"version"];
    if (self->_genericAlbum) {
      genericAlbum = self->_genericAlbum;
    }
    else {
      genericAlbum = self;
    }
    v10 = [genericAlbum title];
    if (v10) {
      [v8 encodeObject:v10 forKey:@"title"];
    }
    if (self->_genericAlbum) {
      v11 = self->_genericAlbum;
    }
    else {
      v11 = self;
    }
    v12 = [v11 kind];
    if (v12) {
      [v8 encodeObject:v12 forKey:@"kind"];
    }
    if (self->_genericAlbum) {
      v13 = self->_genericAlbum;
    }
    else {
      v13 = self;
    }
    v14 = [v13 uuid];
    if (v14) {
      [v8 encodeObject:v14 forKey:@"uuid"];
    }
    if (self->_genericAlbum) {
      v15 = self->_genericAlbum;
    }
    else {
      v15 = self;
    }
    v16 = [v15 cloudGUID];
    if (v16) {
      [v8 encodeObject:v16 forKey:@"cloudGUID"];
    }
    if (self->_genericAlbum) {
      v17 = self->_genericAlbum;
    }
    else {
      v17 = self;
    }
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "isPinned"));
    if (v18) {
      [v8 encodeObject:v18 forKey:@"isPinned"];
    }
    v78 = (void *)v18;
    if (self->_genericAlbum) {
      v19 = self->_genericAlbum;
    }
    else {
      v19 = self;
    }
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "isPrototype"));
    if (v20) {
      [v8 encodeObject:v20 forKey:@"isPrototype"];
    }
    v77 = (void *)v20;
    if (self->_genericAlbum) {
      v21 = self->_genericAlbum;
    }
    else {
      v21 = self;
    }
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "isInTrash"));
    if (v22) {
      [v8 encodeObject:v22 forKey:@"isInTrash"];
    }
    v76 = (void *)v22;
    if (self->_genericAlbum) {
      v23 = self->_genericAlbum;
    }
    else {
      v23 = self;
    }
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "customSortAscending"));
    if (v24) {
      [v8 encodeObject:v24 forKey:@"customSortAscending"];
    }
    v75 = (void *)v24;
    if (self->_genericAlbum) {
      v25 = self->_genericAlbum;
    }
    else {
      v25 = self;
    }
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v25, "customSortKey"));
    if (v26) {
      [v8 encodeObject:v26 forKey:@"customSortKey"];
    }
    v74 = (void *)v26;
    v27 = self->_genericAlbum;
    if (v27)
    {
      v28 = [(PLGenericAlbum *)v27 customKeyAsset];
      uint64_t v29 = [v28 uuid];

      if (!v29)
      {
LABEL_51:
        if (self->_genericAlbum) {
          v30 = self->_genericAlbum;
        }
        else {
          v30 = self;
        }
        uint64_t v31 = [v30 importSessionID];
        if (v31) {
          [v8 encodeObject:v31 forKey:@"importSessionID"];
        }
        v72 = (void *)v31;
        if (self->_genericAlbum) {
          v32 = self->_genericAlbum;
        }
        else {
          v32 = self;
        }
        uint64_t v33 = [v32 importedByBundleIdentifier];
        if (v33) {
          [v8 encodeObject:v33 forKey:@"importedByBundleIdentifier"];
        }
        v71 = (void *)v33;
        v34 = self->_genericAlbum;
        v73 = (void *)v29;
        if (!v34) {
          goto LABEL_76;
        }
        v35 = [(PLGenericAlbum *)v34 userQueryData];

        v36 = self->_genericAlbum;
        if (v35)
        {
          v37 = [(PLGenericAlbum *)v36 userQueryData];
          [v8 encodeObject:v37 forKey:@"userQueryData"];

LABEL_86:
          v58 = (void *)MEMORY[0x1E4F8B900];
          v59 = [v8 encodedData];
          v60 = [(PLPersistedAlbumMetadata *)self metadataURL];
          [v58 persistMetadata:v59 fileURL:v60];

          v61 = (void *)MEMORY[0x1E4F8B908];
          v62 = [(PLPersistedAlbumMetadata *)self metadataURL];
          v63 = [v62 path];
          [v61 changeFileOwnerToMobileAtPath:v63 error:0];

          return;
        }
        if (v36)
        {
          v38 = [(PLPersistedAlbumMetadata *)self _fetchChildUUIDs];
          v39 = v38;
          v70 = v7;
          if (v38)
          {
            v66 = v16;
            v68 = v14;
            v65 = v10;
            uint64_t v40 = [v38 count];
            v79 = (char *)malloc_type_malloc(16 * v40, 0xD36CB00uLL);
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            v64 = v39;
            id v41 = v39;
            uint64_t v42 = [v41 countByEnumeratingWithState:&v81 objects:v85 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = 0;
              uint64_t v45 = *(void *)v82;
              do
              {
                uint64_t v46 = 0;
                v47 = &v79[16 * v44];
                do
                {
                  if (*(void *)v82 != v45) {
                    objc_enumerationMutation(v41);
                  }
                  [MEMORY[0x1E4F8BA08] parseUUIDString:*(void *)(*((void *)&v81 + 1) + 8 * v46++) uuidBuffer:v47];
                  v47 += 16;
                }
                while (v43 != v46);
                v44 += v46;
                uint64_t v43 = [v41 countByEnumeratingWithState:&v81 objects:v85 count:16];
              }
              while (v43);
            }

            v10 = v65;
            v16 = v66;
            v14 = v68;
            v48 = v79;
            v39 = v64;
          }
          else
          {
            v48 = 0;
            uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
LABEL_76:
          v70 = v7;
          v49 = [(PLPersistedAlbumMetadata *)self assetUUIDs];
          uint64_t v40 = [v49 count];

          v50 = (char *)malloc_type_malloc(16 * v40, 0x5267FEC8uLL);
          v48 = v50;
          if (!v40)
          {
LABEL_85:
            v57 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v48 length:16 * v40 freeWhenDone:1];
            [v8 encodeObject:v57 forKey:@"assetUUIDs"];

            v7 = v70;
            goto LABEL_86;
          }
          v67 = v16;
          v69 = v14;
          v51 = v10;
          uint64_t v52 = 0;
          v80 = v50;
          v53 = v50;
          do
          {
            v54 = (void *)MEMORY[0x1E4F8BA08];
            v55 = [(PLPersistedAlbumMetadata *)self assetUUIDs];
            v56 = [v55 objectAtIndex:v52];
            [v54 parseUUIDString:v56 uuidBuffer:v53];

            ++v52;
            v53 += 16;
          }
          while (v40 != v52);
          v10 = v51;
          v14 = v69;
          v16 = v67;
          v48 = v80;
        }
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v7 = v70;
          if (v48) {
            free(v48);
          }
          goto LABEL_86;
        }
        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v29 = [(PLPersistedAlbumMetadata *)self customKeyAssetUUID];
      if (!v29) {
        goto LABEL_51;
      }
    }
    [v8 encodeObject:v29 forKey:@"customKeyAssetUUID"];
    goto LABEL_51;
  }
}

- (id)_fetchChildUUIDs
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PLGenericAlbum *)self->_genericAlbum managedObjectContext];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  char v6 = +[PLManagedAsset entityName];
  v7 = [v5 fetchRequestWithEntityName:v6];

  v8 = (void *)MEMORY[0x1E4F1C0A8];
  v9 = +[PLManagedAlbum entityName];
  v10 = [v8 entityForName:v9 inManagedObjectContext:v4];

  v11 = (void *)MEMORY[0x1E4F1C0A8];
  v12 = +[PLImportSession entityName];
  v13 = [v11 entityForName:v12 inManagedObjectContext:v4];

  v14 = [(PLGenericAlbum *)self->_genericAlbum entity];
  int v15 = [v14 isKindOfEntity:v10];

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4F28F60];
    v17 = [(PLGenericAlbum *)self->_genericAlbum objectID];
    uint64_t v18 = [v16 predicateWithFormat:@"%K CONTAINS %@", @"albums", v17];
    [v7 setPredicate:v18];

    v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"albums" ascending:1];
    v41[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v7 setSortDescriptors:v20];
  }
  else
  {
    v21 = [(PLGenericAlbum *)self->_genericAlbum entity];
    int v22 = [v21 isKindOfEntity:v13];

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v24 = [(PLGenericAlbum *)self->_genericAlbum objectID];
      v25 = [v23 predicateWithFormat:@"%K == %@", @"importSession", v24];
      [v7 setPredicate:v25];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v26 = [(PLGenericAlbum *)self->_genericAlbum entity];
      [v24 handleFailureInMethod:a2, self, @"PLPersistedAlbumMetadata.m", 409, @"Unsupported entity type: %@", v26 object file lineNumber description];
    }
  }
  [v7 setResultType:2];
  uint64_t v40 = @"uuid";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v7 setPropertiesToFetch:v27];

  [v7 setAllocationType:2];
  v28 = [(PLGenericAlbum *)self->_genericAlbum managedObjectContext];
  id v35 = 0;
  uint64_t v29 = [v28 executeFetchRequest:v7 error:&v35];
  id v30 = v35;

  if (v29)
  {
    uint64_t v31 = objc_msgSend(v29, "_pl_map:", &__block_literal_global_55708);
  }
  else
  {
    v32 = PLBackendGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = [(PLGenericAlbum *)self->_genericAlbum objectID];
      *(_DWORD *)buf = 138543618;
      v37 = v33;
      __int16 v38 = 2112;
      id v39 = v30;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch uuids in album ID: %{public}@, error: %@", buf, 0x16u);
    }
    uint64_t v31 = 0;
  }

  return v31;
}

uint64_t __44__PLPersistedAlbumMetadata__fetchChildUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"uuid"];
}

- (BOOL)_readMetadata
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PLPersistedAlbumMetadata *)self metadataURL];
  v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      [(PLPersistedAlbumMetadata *)self setTitle:v8];

      v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
      [(PLPersistedAlbumMetadata *)self setKind:v9];

      v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
      [(PLPersistedAlbumMetadata *)self setUuid:v10];

      v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"cloudGUID"];
      [(PLPersistedAlbumMetadata *)self setCloudGUID:v11];

      v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isPinned"];
      -[PLPersistedAlbumMetadata setPinned:](self, "setPinned:", [v12 BOOLValue]);

      v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isPrototype"];
      -[PLPersistedAlbumMetadata setPrototype:](self, "setPrototype:", [v13 BOOLValue]);

      v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isInTrash"];
      -[PLPersistedAlbumMetadata setInTrash:](self, "setInTrash:", [v14 BOOLValue]);

      int v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"customSortAscending"];
      -[PLPersistedAlbumMetadata setCustomSortAscending:](self, "setCustomSortAscending:", [v15 BOOLValue]);

      v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"customSortKey"];
      -[PLPersistedAlbumMetadata setCustomSortKey:](self, "setCustomSortKey:", [v16 intValue]);

      v17 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"customKeyAssetUUID"];
      [(PLPersistedAlbumMetadata *)self setCustomKeyAssetUUID:v17];

      uint64_t v18 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"importSessionID"];
      [(PLPersistedAlbumMetadata *)self setImportSessionID:v18];

      v19 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"importedByBundleIdentifier"];
      [(PLPersistedAlbumMetadata *)self setImportedByBundleIdentifier:v19];

      uint64_t v20 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"userQueryData"];
      [(PLPersistedAlbumMetadata *)self setUserQueryData:v20];
      v21 = [(PLPersistedAlbumMetadata *)self userQueryData];

      if (!v21)
      {
        int v22 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"assetUUIDs"];
        unint64_t v23 = [v22 length];
        unint64_t v24 = v23 >> 4;
        v25 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v23 >> 4];
        [(PLPersistedAlbumMetadata *)self setAssetUUIDs:v25];

        id v26 = v22;
        uint64_t v27 = [v26 bytes];
        if (v23 >= 0x10)
        {
          uint64_t v28 = v27;
          uint64_t v29 = 0;
          unsigned int v30 = 1;
          do
          {
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)(v28 + 16 * v29), out);
            uint64_t v31 = [NSString stringWithCString:out encoding:4];
            [(NSMutableOrderedSet *)self->_assetUUIDs addObject:v31];

            uint64_t v29 = v30;
          }
          while (v24 > v30++);
        }

        BOOL v7 = v6 != 0;
      }
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
  v2 = self;
  if (self->_genericAlbum) {
    self = (PLPersistedAlbumMetadata *)self->_genericAlbum;
  }
  uint64_t v3 = [(PLPersistedAlbumMetadata *)self title];
  if (v2->_genericAlbum) {
    genericAlbum = v2->_genericAlbum;
  }
  else {
    genericAlbum = v2;
  }
  v37 = [genericAlbum kind];
  if (v2->_genericAlbum) {
    v5 = v2->_genericAlbum;
  }
  else {
    v5 = v2;
  }
  v36 = [v5 uuid];
  if (v2->_genericAlbum) {
    char v6 = v2->_genericAlbum;
  }
  else {
    char v6 = v2;
  }
  uint64_t v35 = [v6 cloudGUID];
  if (v2->_genericAlbum) {
    BOOL v7 = v2->_genericAlbum;
  }
  else {
    BOOL v7 = v2;
  }
  unsigned int v8 = [v7 isPinned];
  if (v2->_genericAlbum) {
    v9 = v2->_genericAlbum;
  }
  else {
    v9 = v2;
  }
  unsigned int v10 = [v9 isPrototype];
  if (v2->_genericAlbum) {
    v11 = v2->_genericAlbum;
  }
  else {
    v11 = v2;
  }
  unsigned int v12 = [v11 isInTrash];
  if (v2->_genericAlbum) {
    v13 = v2->_genericAlbum;
  }
  else {
    v13 = v2;
  }
  unsigned int v14 = [v13 customSortAscending];
  if (v2->_genericAlbum) {
    int v15 = v2->_genericAlbum;
  }
  else {
    int v15 = v2;
  }
  unsigned int v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "customSortKey"));
  v16 = v2->_genericAlbum;
  __int16 v38 = (void *)v3;
  unsigned int v32 = v8;
  unsigned int v33 = v14;
  if (v16)
  {
    v17 = [(PLGenericAlbum *)v16 customKeyAsset];
    id v39 = [v17 uuid];
  }
  else
  {
    id v39 = [(PLPersistedAlbumMetadata *)v2 customKeyAssetUUID];
  }
  if (v2->_genericAlbum) {
    uint64_t v18 = v2->_genericAlbum;
  }
  else {
    uint64_t v18 = v2;
  }
  v19 = [v18 importSessionID];
  if (v2->_genericAlbum) {
    uint64_t v20 = v2->_genericAlbum;
  }
  else {
    uint64_t v20 = v2;
  }
  v21 = [v20 importedByBundleIdentifier];
  if (v2->_genericAlbum) {
    int v22 = v2->_genericAlbum;
  }
  else {
    int v22 = v2;
  }
  uint64_t v31 = [v22 userQueryData];
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A0]) initWithData:v31];
  if (v23)
  {
    unint64_t v24 = v2->_genericAlbum;
    if (v24) {
      [(PLGenericAlbum *)v24 assets];
    }
    else {
    id v26 = [(PLPersistedAlbumMetadata *)v2 assetUUIDs];
    }
    uint64_t v25 = [v26 count];
  }
  else
  {
    uint64_t v25 = 0;
  }
  v40.receiver = v2;
  v40.super_class = (Class)PLPersistedAlbumMetadata;
  uint64_t v27 = [(PLPersistedAlbumMetadata *)&v40 description];
  uint64_t v28 = [(PLGenericAlbum *)v2->_genericAlbum objectID];
  id v34 = [v27 stringByAppendingFormat:@" album %@ : title:%@, uuid:%@, cloudGUID:%@, importSessionID:%@, kind:%@, pin:%d, prototype:%d, trash:%d, sort:%d asc:%@, keyAsset:%@, childCount:%lu, userQuery:%@ importedByBundleIdentifier:%@", v28, v38, v36, v35, v19, v37, v32, v10, v12, v33, v30, v39, v25, v23, v21];

  return v34;
}

- (void)updateChildrenOrderingInAlbum:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PLPersistedAlbumMetadata *)self assetUUIDs];
  unsigned int v8 = [v6 assets];
  v9 = [v8 valueForKey:@"uuid"];

  int v10 = [v7 isEqual:v9];
  v11 = PLMigrationGetLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v13 = [v9 count];
      unsigned int v14 = [v6 uuid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v25 = v13;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v14;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Persisted asset UUIDs (%d total) match database ordering for album %@", buf, 0x12u);
    }
  }
  else
  {
    if (v12)
    {
      int v15 = [v6 uuid];
      v16 = [(PLPersistedAlbumMetadata *)self metadataURL];
      v17 = [v16 path];
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v25 = v15;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v17;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Updating assets in album %@ to match persisted UUID ordering from %@", buf, 0x16u);
    }
    uint64_t v18 = [v7 array];
    v19 = [v6 photoLibrary];
    uint64_t v20 = +[PLManagedAsset assetsWithUUIDs:v18 options:v4 inLibrary:v19];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__PLPersistedAlbumMetadata_updateChildrenOrderingInAlbum_includePendingAssetChanges___block_invoke;
    v22[3] = &unk_1E586C990;
    id v23 = v7;
    v11 = [v20 sortedArrayUsingComparator:v22];

    v21 = [v6 mutableAssets];
    [v21 addObjectsFromArray:v11];
  }
}

uint64_t __85__PLPersistedAlbumMetadata_updateChildrenOrderingInAlbum_includePendingAssetChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  BOOL v7 = [a2 uuid];
  unint64_t v8 = [v5 indexOfObject:v7];

  v9 = *(void **)(a1 + 32);
  int v10 = [v6 uuid];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return v8 > v11;
  }
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NSNumber *)self->_kind intValue];
  id v6 = 0;
  if (v5 > 1549)
  {
    switch(v5)
    {
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1639:
      case 1640:
      case 1641:
        goto LABEL_3;
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1633:
      case 1638:
        goto LABEL_25;
      default:
        if ((v5 - 3998) >= 9 && (v5 - 3571) >= 3) {
          goto LABEL_25;
        }
        goto LABEL_3;
    }
  }
  if (v5 <= 1499)
  {
    BOOL v17 = v5 > 0x10 || ((1 << v5) & 0x19004) == 0;
    if (!v17 || v5 == 1000 || v5 == 1100)
    {
LABEL_3:
      uint64_t v7 = [(NSNumber *)self->_kind intValue];
      title = self->_title;
      v9 = [v4 photoLibrary];
      id v6 = +[PLGenericAlbum insertNewAlbumWithKind:v7 title:title intoLibrary:v9];

LABEL_4:
      if (v6)
      {
        [(__CFString *)v6 setUuid:self->_uuid];
        if (self->_cloudGUID) {
          -[__CFString setCloudGUID:](v6, "setCloudGUID:");
        }
        if (self->_inTrash && [(__CFString *)v6 canMoveToTrash]) {
          [(__CFString *)v6 applyTrashedState:1 cascade:1];
        }
        if (self->_pinned) {
          [(__CFString *)v6 setIsPinned:1];
        }
        if (self->_prototype) {
          [(__CFString *)v6 setIsPrototype:1];
        }
        [(__CFString *)v6 setCustomSortAscending:self->_customSortAscending];
        [(__CFString *)v6 setCustomSortKey:self->_customSortKey];
        customKeyAssetUUID = self->_customKeyAssetUUID;
        if (customKeyAssetUUID)
        {
          unint64_t v11 = +[PLManagedAsset assetWithUUID:customKeyAssetUUID inManagedObjectContext:v4];
          if (v11) {
            [(__CFString *)v6 setCustomKeyAsset:v11];
          }
        }
        if (self->_userQueryData) {
          -[__CFString setUserQueryData:](v6, "setUserQueryData:");
        }
        if (self->_importedByBundleIdentifier) {
          -[__CFString setImportedByBundleIdentifier:](v6, "setImportedByBundleIdentifier:");
        }
        goto LABEL_28;
      }
    }
  }
  else
  {
    switch(v5)
    {
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1505:
      case 1508:
        goto LABEL_3;
      case 1506:
        importSessionID = self->_importSessionID;
        if (importSessionID)
        {
          id v6 = +[PLImportSession insertNewImportSessionAlbumWithImportSessionID:importSessionID inManagedObjectContext:v4];
          goto LABEL_4;
        }
        id v6 = @"ImportSession missing importSessionID";
        break;
      case 1507:
        if (self->_userQueryData)
        {
          v19 = [v4 photoLibrary];
          id v6 = +[PLGenericAlbum insertNewSmartAlbumIntoLibrary:v19];

          [(__CFString *)v6 setTitle:self->_title];
          goto LABEL_4;
        }
        id v6 = @"User Smart Album missing userQueryData";
        break;
      case 1509:
      case 1510:
        BOOL v12 = NSString;
        int v13 = PLStringFromPLAlbumKind(v5);
        id v6 = [v12 stringWithFormat:@"%@ Album is not supported for persistence", v13];

        break;
      default:
        break;
    }
  }
LABEL_25:
  unsigned int v14 = PLMigrationGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138412546;
    v21 = uuid;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to create album %@: %@", buf, 0x16u);
  }

  id v6 = 0;
LABEL_28:

  return v6;
}

- (void)removePersistedAlbumData
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtURL:self->_metadataURL error:0];
}

- (PLPersistedAlbumMetadata)initWithTitle:(id)a3 uuid:(id)a4 cloudGUID:(id)a5 kind:(id)a6 assetUUIDs:(id)a7 persistedAlbumDataDirectory:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PLPersistedAlbumMetadata;
  uint64_t v20 = [(PLPersistedAlbumMetadata *)&v26 init];
  v21 = v20;
  if (v20)
  {
    [(PLPersistedAlbumMetadata *)v20 setAllowsOverwrite:1];
    __int16 v22 = [NSString stringWithFormat:@"%@.%@", v15, PLPersistedAlbumExtension];
    id v23 = [v19 URLByAppendingPathComponent:v22];
    [(PLPersistedAlbumMetadata *)v21 setMetadataURL:v23];

    [(PLPersistedAlbumMetadata *)v21 setTitle:v14];
    [(PLPersistedAlbumMetadata *)v21 setUuid:v15];
    if (v16) {
      [(PLPersistedAlbumMetadata *)v21 setCloudGUID:v16];
    }
    [(PLPersistedAlbumMetadata *)v21 setKind:v17];
    uint64_t v24 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v18];
    [(PLPersistedAlbumMetadata *)v21 setAssetUUIDs:v24];
  }
  return v21;
}

- (PLPersistedAlbumMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPersistedAlbumMetadata;
  int v5 = [(PLPersistedAlbumMetadata *)&v9 init];
  id v6 = v5;
  if (v5
    && ([(PLPersistedAlbumMetadata *)v5 setAllowsOverwrite:1],
        [(PLPersistedAlbumMetadata *)v6 setMetadataURL:v4],
        ![(PLPersistedAlbumMetadata *)v6 _readMetadata]))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = v6;
  }

  return v7;
}

- (PLPersistedAlbumMetadata)initWithPLGenericAlbum:(id)a3 pathManager:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLPersistedAlbumMetadata;
  uint64_t v7 = [(PLPersistedAlbumMetadata *)&v19 init];
  unint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_genericAlbum, a3);
    [(PLPersistedAlbumMetadata *)v8 setAllowsOverwrite:1];
    [(PLPersistedAlbumMetadata *)v8 setInTrash:0];
    objc_super v9 = [v6 managedObjectContext];
    int v10 = [v9 pathManager];

    unint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v12 = [v10 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
    int v13 = [v11 fileURLWithPath:v12 isDirectory:1];

    id v14 = NSString;
    id v15 = [(PLGenericAlbum *)v8->_genericAlbum uuid];
    id v16 = [v14 stringWithFormat:@"%@.%@", v15, PLPersistedAlbumExtension];

    id v17 = [v13 URLByAppendingPathComponent:v16];
    [(PLPersistedAlbumMetadata *)v8 setMetadataURL:v17];
  }
  return v8;
}

- (PLPersistedAlbumMetadata)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLPersistedAlbumMetadata.m" lineNumber:71 description:@"Can't initialize a PLPersistedAlbumMetadata object using -init."];

  return 0;
}

+ (BOOL)isValidPath:(id)a3
{
  id v3 = [a3 pathExtension];
  char v4 = [v3 isEqualToString:PLPersistedAlbumExtension];

  return v4;
}

@end