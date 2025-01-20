@interface NPTOLibraryInfo
- (BOOL)isSyncNeeded;
- (BOOL)isSyncing;
- (NPTOLibraryInfo)initWithDevice:(id)a3;
- (NSDate)lastUpdatedDate;
- (NSDictionary)collectionTargetMap;
- (id)_collectionTargetMapFileURL;
- (id)_syncNeededFileURL;
- (id)_syncingFileURL;
- (id)collectionTargetMapChangeObserverWithQueue:(id)a3 block:(id)a4;
- (id)syncNeededChangeObserverWithQueue:(id)a3 block:(id)a4;
- (id)syncingChangeObserverWithQueue:(id)a3 block:(id)a4;
- (void)_createLibraryDirectoryIfNeeded;
- (void)setCollectionTargetMap:(id)a3;
- (void)setSyncNeeded;
- (void)setSyncing:(BOOL)a3;
@end

@implementation NPTOLibraryInfo

- (NPTOLibraryInfo)initWithDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPTOLibraryInfo;
  v5 = [(NPTOLibraryInfo *)&v17 init];
  if (v5)
  {
    v6 = nanophotos_log_sync_oversize();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_21ECC3000, v6, OS_LOG_TYPE_DEFAULT, "Creating library info for device: %@", buf, 0xCu);
    }

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F575E8]];
    v8 = NSURL;
    v9 = [v7 stringByAppendingPathComponent:@"NanoPhotos"];
    uint64_t v10 = [v8 fileURLWithPath:v9 isDirectory:1];
    libraryURL = v5->_libraryURL;
    v5->_libraryURL = (NSURL *)v10;

    v12 = (NPTONotificationCenter *)-[NPTONotificationCenter initWithDevice:]([NPTONotificationCenter alloc], v4);
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = v12;

    v14 = [[NPTOPreferencesAccessor alloc] initWithDevice:v4];
    legacyPreferencesAccessor = v5->_legacyPreferencesAccessor;
    v5->_legacyPreferencesAccessor = v14;
  }
  return v5;
}

- (NSDate)lastUpdatedDate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
  id v10 = 0;
  uint64_t v3 = *MEMORY[0x263EFF5F8];
  id v9 = 0;
  char v4 = [v2 getResourceValue:&v10 forKey:v3 error:&v9];
  id v5 = v10;
  id v6 = v9;

  if ((v4 & 1) == 0)
  {
    v7 = nanophotos_log_sync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_21ECC3000, v7, OS_LOG_TYPE_ERROR, "Failed to read modification date for library collection target map due to %@", buf, 0xCu);
    }
  }
  return (NSDate *)v5;
}

- (id)_collectionTargetMapFileURL
{
  if (a1)
  {
    a1 = [a1[1] URLByAppendingPathComponent:@"collectionTargetMap"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isSyncing
{
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
  id v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (id)_syncingFileURL
{
  if (a1)
  {
    a1 = [a1[1] URLByAppendingPathComponent:@"syncing"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(NPTOLibraryInfo *)self isSyncing] != a3)
  {
    if (v3)
    {
      -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
      id v5 = [MEMORY[0x263F08850] defaultManager];
      char v6 = -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
      v7 = [v6 path];
      char v8 = [v5 createFileAtPath:v7 contents:0 attributes:0];

      if ((v8 & 1) == 0)
      {
        id v9 = nanophotos_log_sync();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21ECC3000, v9, OS_LOG_TYPE_ERROR, "Failed to create syncing file.", buf, 2u);
        }
      }
      id v10 = [MEMORY[0x263F08850] defaultManager];
      v11 = -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
      id v12 = [v11 path];
      id v22 = 0;
      char v13 = [v10 removeItemAtPath:v12 error:&v22];
      id v14 = v22;

      if (v13) {
        goto LABEL_13;
      }
      v15 = nanophotos_log_sync();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      v16 = "Failed to remove syncneeded file: %@";
    }
    else
    {
      objc_super v17 = [MEMORY[0x263F08850] defaultManager];
      v18 = -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
      id v19 = [v18 path];
      id v21 = 0;
      char v20 = [v17 removeItemAtPath:v19 error:&v21];
      id v14 = v21;

      if (v20)
      {
LABEL_13:

        -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, @"com.apple.NanoPhotos.Syncing.changed");
        goto LABEL_14;
      }
      v15 = nanophotos_log_sync();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      v16 = "Failed to remove syncing file: %@";
    }
    _os_log_error_impl(&dword_21ECC3000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_14:
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"IsSyncing"];
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"Syncing"];
}

- (void)_createLibraryDirectoryIfNeeded
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) path];
    BOOL v3 = [MEMORY[0x263F08850] defaultManager];
    char v4 = [v3 fileExistsAtPath:v2];

    if ((v4 & 1) == 0)
    {
      id v5 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v6 = *(void *)(a1 + 8);
      id v10 = 0;
      char v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v10];
      id v8 = v10;

      if ((v7 & 1) == 0)
      {
        id v9 = nanophotos_log_sync();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v12 = v8;
          _os_log_error_impl(&dword_21ECC3000, v9, OS_LOG_TYPE_ERROR, "Failed to create library directory: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)_syncNeededFileURL
{
  if (a1)
  {
    a1 = [a1[1] URLByAppendingPathComponent:@"syncneeded"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)syncingChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, @"com.apple.NanoPhotos.Syncing.changed", a3, a4);
}

- (NSDictionary)collectionTargetMap
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF8F8];
  BOOL v3 = -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
  char v4 = [v2 dataWithContentsOfURL:v3];

  id v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [NSDictionary classForKeyedUnarchiver];
  uint64_t v8 = [MEMORY[0x263EFF8C0] classForKeyedUnarchiver];
  uint64_t v9 = [MEMORY[0x263F08C38] classForKeyedUnarchiver];
  uint64_t v10 = [NSString classForKeyedUnarchiver];
  uint64_t v11 = [NSNumber classForKeyedUnarchiver];
  id v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_msgSend(MEMORY[0x263EFF8F8], "classForKeyedUnarchiver"), 0);
  id v17 = 0;
  uint64_t v13 = [v5 unarchivedObjectOfClasses:v12 fromData:v4 error:&v17];
  id v14 = v17;

  if (v14)
  {
    v15 = nanophotos_log_sync();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_error_impl(&dword_21ECC3000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive library collection target map data %@, error: %@", buf, 0x16u);
    }
  }
  return (NSDictionary *)v13;
}

- (void)setCollectionTargetMap:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5
    || ([(NPTOLibraryInfo *)self collectionTargetMap],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(NPTOLibraryInfo *)self collectionTargetMap];
    char v7 = [v5 isEqual:v6];

    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        id v21 = 0;
        uint64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v21];
        id v9 = v21;
        if (v9)
        {
          uint64_t v10 = nanophotos_log_sync();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v23 = v5;
            __int16 v24 = 2112;
            id v25 = v9;
            _os_log_error_impl(&dword_21ECC3000, v10, OS_LOG_TYPE_ERROR, "Failed to archive library collection target map %@, error: %@", buf, 0x16u);
          }
        }
        -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
        uint64_t v11 = -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
        id v20 = 0;
        char v12 = [v8 writeToURL:v11 options:1 error:&v20];
        id v13 = v20;

        if ((v12 & 1) == 0)
        {
          id v14 = nanophotos_log_sync();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v13;
            _os_log_error_impl(&dword_21ECC3000, v14, OS_LOG_TYPE_ERROR, "Failed to write collection target map file: %@", buf, 0xCu);
          }
        }
        goto LABEL_18;
      }
    }
    else
    {

      if ((v7 & 1) == 0)
      {
        v15 = [MEMORY[0x263F08850] defaultManager];
        v16 = -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
        id v17 = [v16 path];
        id v19 = 0;
        char v18 = [v15 removeItemAtPath:v17 error:&v19];
        id v9 = v19;

        if (v18)
        {
LABEL_19:

          -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, @"com.apple.NanoPhotos.Library.changed");
          goto LABEL_20;
        }
        uint64_t v8 = nanophotos_log_sync();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v9;
          _os_log_error_impl(&dword_21ECC3000, v8, OS_LOG_TYPE_ERROR, "Failed to remove collection target map file: %@", buf, 0xCu);
        }
LABEL_18:

        goto LABEL_19;
      }
    }
  }
LABEL_20:
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"ExpectedLibrarySize"];
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"NumberOfPhotos"];
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"WatchCollectionList"];
  [(NPTOPreferencesAccessor *)self->_legacyPreferencesAccessor removeObjectForKey:@"LibraryCollectionTargetMapData"];
}

- (id)collectionTargetMapChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, @"com.apple.NanoPhotos.Library.changed", a3, a4);
}

- (BOOL)isSyncNeeded
{
  BOOL v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
  id v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (void)setSyncNeeded
{
  -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
  BOOL v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
  id v5 = [v4 path];
  char v6 = [v3 createFileAtPath:v5 contents:0 attributes:0];

  if ((v6 & 1) == 0)
  {
    char v7 = nanophotos_log_sync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_21ECC3000, v7, OS_LOG_TYPE_ERROR, "Failed to create syncneeded file.", v8, 2u);
    }
  }
  -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, @"com.apple.NanoPhotos.SyncNeeded.changed");
}

- (id)syncNeededChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, @"com.apple.NanoPhotos.SyncNeeded.changed", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyPreferencesAccessor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

@end