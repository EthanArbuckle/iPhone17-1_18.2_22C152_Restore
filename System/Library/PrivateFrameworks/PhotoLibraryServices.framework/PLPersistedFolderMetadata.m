@interface PLPersistedFolderMetadata
+ (BOOL)isValidPath:(id)a3;
+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildUUIDs:(id)a4 sourceDescription:(id)a5 includePendingChanges:(BOOL)a6;
- (BOOL)_readMetadata;
- (BOOL)customSortAscending;
- (BOOL)isInTrash;
- (BOOL)isPinned;
- (BOOL)isProjectAlbumRootFolder;
- (BOOL)isPrototype;
- (BOOL)isRootFolder;
- (NSMutableOrderedSet)childUUIDs;
- (NSNumber)kind;
- (NSString)cloudGUID;
- (NSString)remappedUUID;
- (NSString)title;
- (NSString)uuid;
- (NSURL)metadataURL;
- (PLManagedFolder)folder;
- (PLPersistedFolderMetadata)init;
- (PLPersistedFolderMetadata)initWithPLManagedFolder:(id)a3 pathManager:(id)a4;
- (PLPersistedFolderMetadata)initWithPersistedDataAtURL:(id)a3;
- (id)description;
- (id)insertFolderFromDataInManagedObjectContext:(id)a3;
- (int)customSortKey;
- (void)_saveMetadata;
- (void)removePersistedData;
- (void)setChildUUIDs:(id)a3;
- (void)setCloudGUID:(id)a3;
- (void)setCustomSortAscending:(BOOL)a3;
- (void)setCustomSortKey:(int)a3;
- (void)setFolder:(id)a3;
- (void)setInTrash:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPrototype:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateChildrenOrderingInFolder:(id)a3 includePendingChanges:(BOOL)a4;
@end

@implementation PLPersistedFolderMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_remappedUUID, 0);
  objc_storeStrong((id *)&self->_childUUIDs, 0);
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

- (void)setFolder:(id)a3
{
}

- (PLManagedFolder)folder
{
  return self->_folder;
}

- (NSString)remappedUUID
{
  return self->_remappedUUID;
}

- (void)setChildUUIDs:(id)a3
{
}

- (NSMutableOrderedSet)childUUIDs
{
  return self->_childUUIDs;
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
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v4 encodeInteger:1 forKey:@"version"];
  if (self->_folder) {
    folder = self->_folder;
  }
  else {
    folder = self;
  }
  v6 = [folder title];
  if (v6) {
    [v4 encodeObject:v6 forKey:@"title"];
  }
  if (self->_folder) {
    v7 = self->_folder;
  }
  else {
    v7 = self;
  }
  v8 = [v7 kind];
  if (v8) {
    [v4 encodeObject:v8 forKey:@"kind"];
  }
  if (self->_folder) {
    v9 = self->_folder;
  }
  else {
    v9 = self;
  }
  v10 = [v9 uuid];
  if (v10) {
    [v4 encodeObject:v10 forKey:@"uuid"];
  }
  if (self->_folder) {
    v11 = self->_folder;
  }
  else {
    v11 = self;
  }
  v12 = [v11 cloudGUID];
  if (v12) {
    [v4 encodeObject:v12 forKey:@"cloudGUID"];
  }
  if (self->_folder) {
    v13 = self->_folder;
  }
  else {
    v13 = self;
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "isPinned"));
  if (v14) {
    [v4 encodeObject:v14 forKey:@"isPinned"];
  }
  v55 = (void *)v14;
  if (self->_folder) {
    v15 = self->_folder;
  }
  else {
    v15 = self;
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "isPrototype"));
  if (v16) {
    [v4 encodeObject:v16 forKey:@"isPrototype"];
  }
  v54 = (void *)v16;
  if (self->_folder) {
    v17 = self->_folder;
  }
  else {
    v17 = self;
  }
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "isInTrash"));
  if (v18) {
    [v4 encodeObject:v18 forKey:@"isInTrash"];
  }
  v53 = (void *)v18;
  if (self->_folder) {
    v19 = self->_folder;
  }
  else {
    v19 = self;
  }
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "customSortAscending"));
  if (v20) {
    [v4 encodeObject:v20 forKey:@"customSortAscending"];
  }
  if (self->_folder) {
    v21 = self->_folder;
  }
  else {
    v21 = self;
  }
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "customSortKey"));
  if (v22) {
    [v4 encodeObject:v22 forKey:@"customSortKey"];
  }
  v51 = (void *)v22;
  v52 = (void *)v20;
  v23 = self->_folder;
  if (v23)
  {
    v46 = v12;
    v47 = v10;
    v48 = v8;
    v49 = v6;
    v45 = v3;
    v24 = [(PLManagedFolder *)v23 albums];
    uint64_t v25 = [v24 count];
    v50 = (char *)malloc_type_malloc(16 * v25, 0x749C91F1uLL);
    if (v25)
    {
      uint64_t v26 = 0;
      v27 = v50;
      do
      {
        v28 = (void *)MEMORY[0x1E4F8BA08];
        v29 = [v24 objectAtIndex:v26];
        v30 = [v29 uuid];
        [v28 parseUUIDString:v30 uuidBuffer:v27];

        ++v26;
        v27 += 16;
      }
      while (v25 != v26);
    }

    v3 = v45;
LABEL_54:
    v8 = v48;
    v6 = v49;
    v12 = v46;
    v10 = v47;
    if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  v31 = [(PLPersistedFolderMetadata *)self childUUIDs];
  uint64_t v25 = [v31 count];

  v32 = (char *)malloc_type_malloc(16 * v25, 0x1AD349EFuLL);
  v50 = v32;
  if (v25)
  {
    v46 = v12;
    v47 = v10;
    v48 = v8;
    v49 = v6;
    uint64_t v33 = 0;
    v34 = v32;
    do
    {
      v35 = (void *)MEMORY[0x1E4F8BA08];
      v36 = [(PLPersistedFolderMetadata *)self childUUIDs];
      v37 = [v36 objectAtIndex:v33];
      [v35 parseUUIDString:v37 uuidBuffer:v34];

      ++v33;
      v34 += 16;
    }
    while (v25 != v33);
    goto LABEL_54;
  }
LABEL_55:
  v38 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v50 length:16 * v25 freeWhenDone:1];
  [v4 encodeObject:v38 forKey:@"assetUUIDs"];

LABEL_56:
  v39 = (void *)MEMORY[0x1E4F8B900];
  v40 = [v4 encodedData];
  v41 = [(PLPersistedFolderMetadata *)self metadataURL];
  [v39 persistMetadata:v40 fileURL:v41];

  v42 = (void *)MEMORY[0x1E4F8B908];
  v43 = [(PLPersistedFolderMetadata *)self metadataURL];
  v44 = [v43 path];
  [v42 changeFileOwnerToMobileAtPath:v44 error:0];
}

- (BOOL)_readMetadata
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PLPersistedFolderMetadata *)self metadataURL];
  v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      [(PLPersistedFolderMetadata *)self setTitle:v8];

      v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
      [(PLPersistedFolderMetadata *)self setKind:v9];

      v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
      [(PLPersistedFolderMetadata *)self setUuid:v10];

      v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"cloudGUID"];
      [(PLPersistedFolderMetadata *)self setCloudGUID:v11];

      v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isPinned"];
      -[PLPersistedFolderMetadata setPinned:](self, "setPinned:", [v12 BOOLValue]);

      v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isPrototype"];
      -[PLPersistedFolderMetadata setPrototype:](self, "setPrototype:", [v13 BOOLValue]);

      uint64_t v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isInTrash"];
      -[PLPersistedFolderMetadata setInTrash:](self, "setInTrash:", [v14 BOOLValue]);

      v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"customSortAscending"];
      -[PLPersistedFolderMetadata setCustomSortAscending:](self, "setCustomSortAscending:", [v15 BOOLValue]);

      uint64_t v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"customSortKey"];
      -[PLPersistedFolderMetadata setCustomSortKey:](self, "setCustomSortKey:", [v16 intValue]);

      v17 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"assetUUIDs"];
      unint64_t v18 = [v17 length];
      unint64_t v19 = v18 >> 4;
      uint64_t v20 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v18 >> 4];
      [(PLPersistedFolderMetadata *)self setChildUUIDs:v20];

      id v21 = v17;
      uint64_t v22 = [v21 bytes];
      if (v18 >= 0x10)
      {
        uint64_t v23 = v22;
        uint64_t v24 = 0;
        unsigned int v25 = 1;
        do
        {
          memset(v29, 0, sizeof(v29));
          uuid_unparse((const unsigned __int8 *)(v23 + 16 * v24), v29);
          uint64_t v26 = [NSString stringWithCString:v29 encoding:4];
          [(NSMutableOrderedSet *)self->_childUUIDs addObject:v26];

          uint64_t v24 = v25;
        }
        while (v19 > v25++);
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
  if (self->_folder) {
    self = (PLPersistedFolderMetadata *)self->_folder;
  }
  v28 = [(PLPersistedFolderMetadata *)self title];
  if (v2->_folder) {
    folder = v2->_folder;
  }
  else {
    folder = v2;
  }
  v29 = [folder kind];
  if (v2->_folder) {
    v4 = v2->_folder;
  }
  else {
    v4 = v2;
  }
  v5 = [v4 uuid];
  if (v2->_folder) {
    v6 = v2->_folder;
  }
  else {
    v6 = v2;
  }
  BOOL v7 = [v6 cloudGUID];
  if (v2->_folder) {
    v8 = v2->_folder;
  }
  else {
    v8 = v2;
  }
  v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "isPinned"));
  if (v2->_folder) {
    v10 = v2->_folder;
  }
  else {
    v10 = v2;
  }
  v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "isPrototype"));
  if (v2->_folder) {
    v12 = v2->_folder;
  }
  else {
    v12 = v2;
  }
  v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "isInTrash"));
  if (v2->_folder) {
    uint64_t v14 = v2->_folder;
  }
  else {
    uint64_t v14 = v2;
  }
  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "customSortAscending"));
  if (v2->_folder) {
    uint64_t v16 = v2->_folder;
  }
  else {
    uint64_t v16 = v2;
  }
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "customSortKey"));
  unint64_t v18 = v2->_folder;
  if (v18)
  {
    BOOL v19 = [(PLGenericAlbum *)v18 isFolder];
    uint64_t v20 = v2->_folder;
    if (v19) {
      [(PLManagedFolder *)v20 albums];
    }
    else {
    id v21 = [(PLManagedFolder *)v20 assets];
    }
  }
  else
  {
    id v21 = [(PLPersistedFolderMetadata *)v2 childUUIDs];
  }
  uint64_t v22 = v21;
  uint64_t v23 = [v21 count];

  v30.receiver = v2;
  v30.super_class = (Class)PLPersistedFolderMetadata;
  uint64_t v24 = [(PLPersistedFolderMetadata *)&v30 description];
  unsigned int v25 = [(PLManagedFolder *)v2->_folder objectID];
  id v27 = [v24 stringByAppendingFormat:@" album %@ : title:%@, uuid:%@, cloudGUID:%@, kind:%@, pin:%@, prototype:%@, trash:%@, sort:%@ asc:%@, childCount:%lu", v25, v28, v5, v7, v29, v9, v11, v13, v15, v17, v23];

  return v27;
}

- (void)updateChildrenOrderingInFolder:(id)a3 includePendingChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_class();
  id v10 = [(PLPersistedFolderMetadata *)self childUUIDs];
  v8 = [(PLPersistedFolderMetadata *)self metadataURL];
  v9 = [v8 path];
  [v7 updateChildrenOrderingInFolder:v6 usingChildUUIDs:v10 sourceDescription:v9 includePendingChanges:v4];
}

- (id)insertFolderFromDataInManagedObjectContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NSNumber *)self->_kind intValue];
  if ((v5 - 3998) < 2)
  {
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Can't replace singleton root folder from metadata", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v5 == 1553)
    {
      title = self->_title;
      BOOL v7 = [v4 photoLibrary];
      v8 = title;
      uint64_t v9 = 1553;
      goto LABEL_8;
    }
    if (v5 == 4000)
    {
      id v6 = self->_title;
      BOOL v7 = [v4 photoLibrary];
      v8 = v6;
      uint64_t v9 = 4000;
LABEL_8:
      v12 = +[PLManagedFolder insertNewFolderWithTitle:v8 kind:v9 intoLibrary:v7];

      goto LABEL_12;
    }
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      kind = self->_kind;
      uint64_t v14 = [(NSURL *)self->_metadataURL path];
      int v16 = 138412546;
      v17 = kind;
      __int16 v18 = 2112;
      BOOL v19 = v14;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unknown Folder Kind %@ at %@", (uint8_t *)&v16, 0x16u);
    }
  }

  v12 = 0;
LABEL_12:
  [v12 setUuid:self->_uuid];
  if (self->_cloudGUID) {
    objc_msgSend(v12, "setCloudGUID:");
  }
  if (self->_inTrash && [v12 canMoveToTrash]) {
    [v12 applyTrashedState:1 cascade:1];
  }
  if (self->_pinned) {
    [v12 setIsPinned:1];
  }
  if (self->_prototype) {
    [v12 setIsPrototype:1];
  }
  [v12 setCustomSortAscending:self->_customSortAscending];
  [v12 setCustomSortKey:self->_customSortKey];

  return v12;
}

- (void)removePersistedData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  metadataURL = self->_metadataURL;
  id v11 = 0;
  char v5 = [v3 removeItemAtURL:metadataURL error:&v11];
  id v6 = v11;

  if ((v5 & 1) == 0)
  {
    BOOL v7 = PLUnderlyingPOSIXError();
    uint64_t v8 = [v7 code];

    if (v8 != 2)
    {
      uint64_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(NSURL *)self->_metadataURL path];
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to remove persisted folder metadata %@ %@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)isProjectAlbumRootFolder
{
  v2 = [(PLPersistedFolderMetadata *)self kind];
  BOOL v3 = [v2 intValue] == 3998;

  return v3;
}

- (BOOL)isRootFolder
{
  v2 = [(PLPersistedFolderMetadata *)self kind];
  BOOL v3 = [v2 intValue] == 3999;

  return v3;
}

- (PLPersistedFolderMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPersistedFolderMetadata;
  char v5 = [(PLPersistedFolderMetadata *)&v9 init];
  id v6 = v5;
  if (v5
    && ([(PLPersistedFolderMetadata *)v5 setMetadataURL:v4],
        ![(PLPersistedFolderMetadata *)v6 _readMetadata]))
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = v6;
  }

  return v7;
}

- (PLPersistedFolderMetadata)initWithPLManagedFolder:(id)a3 pathManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PLPersistedFolderMetadata;
  objc_super v9 = [(PLPersistedFolderMetadata *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    [(PLPersistedFolderMetadata *)v10 setInTrash:0];
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v8 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
    v13 = [v11 fileURLWithPath:v12 isDirectory:1];

    __int16 v14 = NSString;
    id v15 = [(PLManagedFolder *)v10->_folder uuid];
    uint64_t v16 = [v14 stringWithFormat:@"%@.%@", v15, PLFolderMetadataExtension];

    v17 = [v13 URLByAppendingPathComponent:v16];
    [(PLPersistedFolderMetadata *)v10 setMetadataURL:v17];
  }
  return v10;
}

- (PLPersistedFolderMetadata)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLPersistedFolderMetadata.m" lineNumber:60 description:@"Can't initialize a PLPersistedFolderMetadata object using -init."];

  return 0;
}

+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildUUIDs:(id)a4 sourceDescription:(id)a5 includePendingChanges:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 childCollections];
  v13 = [v12 valueForKey:@"uuid"];

  int v14 = [v10 isEqual:v13];
  id v15 = PLMigrationGetLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      int v17 = [v13 count];
      __int16 v18 = [v9 uuid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v34 = v17;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v18;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Persisted child collection UUIDs (%d total) match database ordering for folder %@", buf, 0x12u);
    }
  }
  else
  {
    if (v16)
    {
      objc_super v19 = [v9 uuid];
      *(_DWORD *)buf = 138412546;
      *(void *)v34 = v19;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = v11;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Updating children in folder %@ to match persisted UUID ordering from %@", buf, 0x16u);
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F1C0D0];
    id v21 = +[PLGenericAlbum entityName];
    id v15 = [v20 fetchRequestWithEntityName:v21];

    uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v23 = [v10 array];
    uint64_t v24 = [v22 predicateWithFormat:@"uuid in %@", v23];
    [v15 setPredicate:v24];

    if (v6) {
      [v15 setIncludesPendingChanges:1];
    }
    unsigned int v25 = [v9 managedObjectContext];
    id v32 = 0;
    uint64_t v26 = [v25 executeFetchRequest:v15 error:&v32];
    id v27 = v32;

    if (v26)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __116__PLPersistedFolderMetadata_updateChildrenOrderingInFolder_usingChildUUIDs_sourceDescription_includePendingChanges___block_invoke;
      v30[3] = &unk_1E586C990;
      id v31 = v10;
      v28 = [v26 sortedArrayUsingComparator:v30];

      v29 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v28];
      [v9 addChildCollections:v29];
    }
  }
}

uint64_t __116__PLPersistedFolderMetadata_updateChildrenOrderingInFolder_usingChildUUIDs_sourceDescription_includePendingChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 uuid];
  unint64_t v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v6 uuid];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return v8 > v11;
  }
}

+ (BOOL)isValidPath:(id)a3
{
  BOOL v3 = [a3 pathExtension];
  char v4 = [v3 isEqualToString:PLFolderMetadataExtension];

  return v4;
}

@end