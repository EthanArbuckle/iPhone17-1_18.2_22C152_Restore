@interface QLCacheIndexDatabase
- (BOOL)add:(unint64_t)a3 blobInfosStartingAtColumn:(unint64_t)a4 ofSteppedStatement:(sqlite3_stmt *)a5 toArray:(id)a6;
- (BOOL)beginTransaction;
- (BOOL)doesExist;
- (BOOL)getBlobInfoForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 externalGeneratorDataHash:(unint64_t)a9 bitmapDataBlobInfo:(id *)a10 plistBufferBlobInfo:(id *)a11;
- (BOOL)insertOrUpdateImageDataForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 bitmapFormat:(id)a9 bitmapDataBlobInfo:(id)a10 metadataBlobInfo:(id)a11 flavor:(int)a12 contentRect:(CGRect)a13 externalGeneratorDataHash:(unint64_t)a14 lastHitDate:(id)a15;
- (BOOL)isValid;
- (BOOL)itemIsMissingRemoteThumbnail:(id)a3;
- (BOOL)removeReservedBufferWithBlobInfo:(id)a3;
- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3;
- (FPItemManager)itemManager;
- (QLCacheIndexDatabase)initWithPath:(id)a3;
- (QLSqliteDatabase)database;
- (id)_removeThumbnailsFromStatement:(sqlite3_stmt *)a3;
- (id)allBuffersIncludingReserved:(BOOL)a3;
- (id)allReservedBuffers;
- (id)batchOfFileProviderItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4;
- (id)batchOfRegularItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4;
- (id)enumeratorForAllUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4;
- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3;
- (id)itemsGroupedByProviderDomain:(id)a3;
- (id)lastCrapWithDate:(id *)a3;
- (id)queryCacheForFileRequests:(id)a3;
- (id)removeAllThumbnailsForCacheId:(unint64_t)a3;
- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3;
- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3 whichAreRemaining:(BOOL)a4;
- (id)removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3;
- (id)removeFilesWithFileInfo:(id)a3;
- (id)removeOldThumbnails;
- (id)removePercentageOldestThumbnails:(unint64_t)a3;
- (id)removeThumbnailForFileIdentifier:(id)a3;
- (id)removeThumbnailsForDeletedFiles;
- (id)removeThumbnailsOlderThanDate:(id)a3;
- (id)removeThumbnailsWithCacheIds:(id)a3;
- (unint64_t)_cacheIdForFileIdentifier:(id)a3 createVersion:(id *)a4;
- (unint64_t)fileEntryCount;
- (unint64_t)insertOrUpdateThumbnailWithVersionedFileIdentifier:(id)a3 shouldInvalidAllThumbnailSizes:(BOOL *)a4 added:(BOOL *)a5;
- (unint64_t)maxThumbnailLifeTime;
- (unint64_t)missingRemoteThumbnailsCountForFileProviderIds:(id)a3;
- (unint64_t)reserveBufferCount;
- (unint64_t)reserveBufferSize;
- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3;
- (unint64_t)thumbnailCount;
- (void)_createTables;
- (void)_deleteAllTables;
- (void)addReservedBufferWithBlobInfo:(id)a3;
- (void)checkpoint;
- (void)close;
- (void)do:(id)a3;
- (void)doesExist;
- (void)endTransaction;
- (void)isValid;
- (void)noteRemoteThumbnailMissingForItems:(id)a3;
- (void)noteRemoteThumbnailPresentForItems:(id)a3;
- (void)open;
- (void)removeBasicFilesWithRowids:(id)a3;
- (void)removeUbiquitousFilesWithRowids:(id)a3;
- (void)reset;
- (void)save;
- (void)setItemManager:(id)a3;
- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4;
@end

@implementation QLCacheIndexDatabase

- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(QLCacheIndexDatabase *)self _cacheIdForFileIdentifier:a4 createVersion:0];
  if (v7)
  {
    unint64_t v8 = v7;
    v9 = [v6 allKeys];
    v10 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "UPDATE thumbnails SET hit_count=hit_count+?, last_hit_date=?                              WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=?                                    AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?");
    v26 = v10;
    if (v10)
    {
      v11 = v10;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v17 = [v6 objectForKey:v16];
            -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", [v17 unsignedIntValue], 1, v11);
            database = self->_database;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v11 = v26;
            -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 2, v26);
            [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:v8 atIndex:3 inStatement:v11];
            v19 = self->_database;
            [v16 size];
            [(QLSqliteDatabase *)v19 bindInt:(int)v20 atIndex:4 inStatement:v11];
            -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", [v16 iconMode], 5, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v16 badgeType], 6, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v16 iconVariant], 7, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", (int)[v16 interpolationQuality], 8, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v16 externalGeneratorDataHash], 9, v11);
            [(QLSqliteDatabase *)self->_database stepStatement:v11];
            [(QLSqliteDatabase *)self->_database resetStatement:v11 unbindValuesThroughIndex:0];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      [(QLSqliteDatabase *)self->_database finalizeStatement:&v26];
    }
    else
    {
    }
  }
}

- (void)save
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "save index database", v2, v3, v4, v5, v6);
}

- (void)endTransaction
{
}

- (BOOL)beginTransaction
{
  return [(QLSqliteDatabase *)self->_database beginTransaction];
}

- (id)queryCacheForFileRequests:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[QLCacheIndexDatabaseQueryEnumerator alloc] initWithSqliteDatabase:self->_database fileRequests:v4];

  return v5;
}

- (unint64_t)_cacheIdForFileIdentifier:(id)a3 createVersion:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 statementToFindCacheIdInDatabase:self->_database];
  uint64_t v18 = v7;
  char v17 = 0;
  if ([(QLSqliteDatabase *)self->_database stepStatement:v7 didReturnData:&v17]) {
    BOOL v8 = v17 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = objc_msgSend((id)objc_opt_class(), "cacheIdFromRowId:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v7));
    if (a4)
    {
      id v10 = [(QLSqliteDatabase *)self->_database newDataFromColumn:1 inStatement:v7 copyBytes:0];
      id v16 = 0;
      v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v16];
      id v12 = v16;
      id v13 = v11;
      *a4 = v13;
      if (!v13)
      {
        uint64_t v14 = _log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v10;
          __int16 v21 = 2112;
          id v22 = v6;
          __int16 v23 = 2112;
          id v24 = v12;
          _os_log_error_impl(&dword_1DDC5E000, v14, OS_LOG_TYPE_ERROR, "cannot create the version based on data %@, for file %@: %@", buf, 0x20u);
        }
      }
    }
  }
  [(QLSqliteDatabase *)self->_database finalizeStatement:&v18];

  return v9;
}

- (id)removeOldThumbnails
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v3 - (double)self->_maxThumbnailLifeTime];
  uint64_t v5 = [(QLCacheIndexDatabase *)self removeThumbnailsOlderThanDate:v4];

  return v5;
}

- (id)removeThumbnailsOlderThanDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[QLCacheIndexDatabase removeThumbnailsOlderThanDate:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT rowid, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE last_hit_date<?");
  if (v12)
  {
    id v13 = v12;
    database = self->_database;
    [v4 timeIntervalSinceReferenceDate];
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v13);
    v19 = [(QLSqliteDatabase *)self->_database prepareStatement:"DELETE FROM missing_remote_thumbnails WHERE date<?"];
    v15 = self->_database;
    [v4 timeIntervalSinceReferenceDate];
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](v15, "bindDouble:atIndex:inStatement:", 1, v13);
    [(QLSqliteDatabase *)self->_database stepStatement:v19];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v19];
    uint64_t v16 = [(QLCacheIndexDatabase *)self _removeThumbnailsFromStatement:v13];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F1C978] array];
  }
  char v17 = (void *)v16;

  return v17;
}

- (id)_removeThumbnailsFromStatement:(sqlite3_stmt *)a3
{
  id v13 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  char v12 = 0;
  if ([(QLSqliteDatabase *)self->_database stepStatement:a3 didReturnData:&v12]) {
    BOOL v7 = v12 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    do
    {
      unint64_t v8 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:a3];
      uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
      [v6 addObject:v9];

      [(QLCacheIndexDatabase *)self add:2 blobInfosStartingAtColumn:1 ofSteppedStatement:a3 toArray:v5];
      if ([(QLSqliteDatabase *)self->_database stepStatement:a3 didReturnData:&v12]) {
        BOOL v10 = v12 == 0;
      }
      else {
        BOOL v10 = 1;
      }
    }
    while (!v10);
  }
  [(QLSqliteDatabase *)self->_database finalizeStatement:&v13];
  if ([v6 count])
  {
    id v13 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", [@"DELETE FROM thumbnails WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" UTF8String]);
    [(QLSqliteDatabase *)self->_database runStatement:v13 withBoundNumbers:v6 startingAtIndex:1 stepHandler:0];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v13];
  }

  return v5;
}

- (void)do:(id)a3
{
}

- (QLCacheIndexDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLCacheIndexDatabase;
  uint64_t v5 = [(QLCacheIndexDatabase *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"index.sqlite"];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    unint64_t v8 = objc_alloc_init(QLSqliteDatabase);
    database = v5->_database;
    v5->_database = v8;

    v5->_maxThumbnailLifeTime = (int)_QLSAppPreferencesIntValueForKey();
    BOOL v10 = _log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[QLCacheIndexDatabase initWithPath:]((uint64_t)&v5->_maxThumbnailLifeTime, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return v5;
}

- (BOOL)doesExist
{
  double v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [v3 fileExistsAtPath:self->_databasePath];

  uint64_t v5 = _log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(QLCacheIndexDatabase *)v4 doesExist];
  }

  return v4;
}

- (void)open
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "open index database", v2, v3, v4, v5, v6);
}

- (BOOL)isValid
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v18 = 0;
  if ([(QLSqliteDatabase *)self->_database isOpened])
  {
    uint64_t v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT value FROM preferences WHERE key='version'"];
    objc_super v18 = v3;
    buf[0] = 0;
    if (v3)
    {
      uint64_t v4 = v3;
      BOOL v5 = [(QLSqliteDatabase *)self->_database stepStatement:v3 didReturnData:buf];
      database = self->_database;
      if (!v5 || buf[0] == 0)
      {
        [(QLSqliteDatabase *)database finalizeStatement:&v18];
      }
      else
      {
        id v11 = [(QLSqliteDatabase *)database newStringFromColumn:0 inStatement:v4 uniqueInStringTable:0];
        int v12 = [v11 intValue];
        int v13 = v12;
        if (v12 != 12)
        {
          uint64_t v14 = _log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = [v11 intValue];
            *(_DWORD *)buf = 67109376;
            int v20 = v15;
            __int16 v21 = 1024;
            int v22 = 12;
            _os_log_impl(&dword_1DDC5E000, v14, OS_LOG_TYPE_INFO, "index database current version %d, version expected %d", buf, 0xEu);
          }
        }
        buf[0] = 0;
        BOOL v16 = [(QLSqliteDatabase *)self->_database stepStatement:v4 didReturnData:buf];
        int v17 = buf[0];

        [(QLSqliteDatabase *)self->_database finalizeStatement:&v18];
        if (v13 == 12 && v16 && !v17 && ![(QLSqliteDatabase *)self->_database isCorrupted])
        {
          uint64_t v8 = _log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            -[QLCacheIndexDatabase isValid]();
          }
          BOOL v9 = 1;
          goto LABEL_12;
        }
      }
    }
  }
  uint64_t v8 = _log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[QLCacheIndexDatabase isValid]();
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (void)close
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "close index database", v2, v3, v4, v5, v6);
}

- (void)reset
{
  uint64_t v3 = _log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1DDC5E000, v3, OS_LOG_TYPE_INFO, "reset index database", v4, 2u);
  }

  unlink([(NSString *)self->_databasePath fileSystemRepresentation]);
}

- (void)checkpoint
{
}

- (unint64_t)insertOrUpdateThumbnailWithVersionedFileIdentifier:(id)a3 shouldInvalidAllThumbnailSizes:(BOOL *)a4 added:(BOOL *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [v8 version];
  *a4 = 0;
  uint64_t v10 = [v8 fileIdentifier];
  id v21 = 0;
  unint64_t v11 = [(QLCacheIndexDatabase *)self _cacheIdForFileIdentifier:v10 createVersion:&v21];
  id v12 = v21;

  *a5 = v11 == 0;
  if (v11)
  {
    if (v12) {
      char v13 = [v9 isEqual:v12] ^ 1;
    }
    else {
      char v13 = 1;
    }
    *a4 = v13;
    BOOL v16 = _log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[QLCacheIndexDatabase insertOrUpdateThumbnailWithVersionedFileIdentifier:shouldInvalidAllThumbnailSizes:added:](a4, (uint64_t)v8, v16);
    }

    if (*a4)
    {
      int v17 = _log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v20 = [v8 fileIdentifier];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        v26 = v20;
        _os_log_debug_impl(&dword_1DDC5E000, v17, OS_LOG_TYPE_DEBUG, "version from database %@, version from disk %@, for %@", buf, 0x20u);
      }
      uint64_t v18 = [v8 statementToUpdateRecordWithCacheIdentifier:v11 inDatabase:self->_database];
      *(void *)buf = v18;
      if (v18)
      {
        [(QLSqliteDatabase *)self->_database stepStatement:v18];
        [(QLSqliteDatabase *)self->_database finalizeStatement:buf];
        goto LABEL_15;
      }
LABEL_14:
      unint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v14 = [v8 statementToInsertIntoDatabase:self->_database];
    *(void *)buf = v14;
    if (!v14) {
      goto LABEL_14;
    }
    [(QLSqliteDatabase *)self->_database stepStatement:v14];
    [(QLSqliteDatabase *)self->_database finalizeStatement:buf];
    int v15 = [v8 fileIdentifier];
    unint64_t v11 = objc_msgSend((id)objc_opt_class(), "cacheIdFromRowId:", -[QLSqliteDatabase lastInsertRowId](self->_database, "lastInsertRowId"));
  }
LABEL_15:

  return v11;
}

- (BOOL)getBlobInfoForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 externalGeneratorDataHash:(unint64_t)a9 bitmapDataBlobInfo:(id *)a10 plistBufferBlobInfo:(id *)a11
{
  uint64_t v12 = *(void *)&a8;
  uint64_t v15 = a5;
  v19 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?");
  __int16 v25 = v19;
  if (v19)
  {
    int v20 = v19;
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v19];
    [(QLSqliteDatabase *)self->_database bindInt:(int)a4 atIndex:2 inStatement:v20];
    [(QLSqliteDatabase *)self->_database bindInt:v15 atIndex:3 inStatement:v20];
    [(QLSqliteDatabase *)self->_database bindInt:a6 atIndex:4 inStatement:v20];
    [(QLSqliteDatabase *)self->_database bindInt:a7 atIndex:5 inStatement:v20];
    [(QLSqliteDatabase *)self->_database bindInt:v12 atIndex:6 inStatement:v20];
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a9 atIndex:7 inStatement:v20];
    char v24 = 0;
    BOOL v21 = [(QLSqliteDatabase *)self->_database stepStatement:v20 didReturnData:&v24];
    if (v24) {
      BOOL v22 = v21;
    }
    else {
      BOOL v22 = 0;
    }
    if (v22)
    {
      *a10 = objc_alloc_init(QLCacheBlobInfo);
      *a11 = objc_alloc_init(QLCacheBlobInfo);
      objc_msgSend(*a10, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v20));
      objc_msgSend(*a10, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 1, v20));
      objc_msgSend(*a11, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 2, v20));
      objc_msgSend(*a11, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 3, v20));
      [(QLSqliteDatabase *)self->_database stepStatement:v20 didReturnData:&v24];
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v25];
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (BOOL)insertOrUpdateImageDataForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 bitmapFormat:(id)a9 bitmapDataBlobInfo:(id)a10 metadataBlobInfo:(id)a11 flavor:(int)a12 contentRect:(CGRect)a13 externalGeneratorDataHash:(unint64_t)a14 lastHitDate:(id)a15
{
  uint64_t v61 = *(void *)&a8;
  uint64_t v17 = a5;
  CGRect v65 = a13;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a15;
  if (a3)
  {
    __int16 v25 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT rowid FROM thumbnails WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?"];
    v64 = v25;
    if (v25)
    {
      [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v25];
      [(QLSqliteDatabase *)self->_database bindInt:(int)a4 atIndex:2 inStatement:v25];
      [(QLSqliteDatabase *)self->_database bindInt:v17 atIndex:3 inStatement:v25];
      [(QLSqliteDatabase *)self->_database bindInt:a6 atIndex:4 inStatement:v25];
      int64_t v59 = a7;
      [(QLSqliteDatabase *)self->_database bindInt:a7 atIndex:5 inStatement:v25];
      [(QLSqliteDatabase *)self->_database bindInt:v61 atIndex:6 inStatement:v25];
      [(QLSqliteDatabase *)self->_database bindInt:a14 atIndex:7 inStatement:v25];
      id v63 = 0;
      v60 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v21 requiringSecureCoding:1 error:&v63];
      id v26 = v63;
      char v62 = 0;
      BOOL v27 = [(QLSqliteDatabase *)self->_database stepStatement:v25 didReturnData:&v62];
      database = self->_database;
      if (v27 && v62)
      {
        uint64_t v29 = [(QLSqliteDatabase *)database unsignedLongLongFromColumn:0 inStatement:v25];
        [(QLSqliteDatabase *)self->_database finalizeStatement:&v64];
        v64 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "UPDATE thumbnails SET width=?, height=?, bitmapFormat=?, bitmapdata_location=?, bitmapdata_length=?, plistbuffer_location=?, plistbuffer_length=?, flavor=?, content_rect=?, icon_variant=?, interpolation=?, externalGeneratorDataHash=? WHERE rowid=?");
        if (v64)
        {
          v30 = self->_database;
          uint64_t v31 = [v21 width];
          [(QLSqliteDatabase *)v30 bindUnsignedLongLong:v31 atIndex:1 inStatement:v64];
          v32 = self->_database;
          uint64_t v33 = [v21 height];
          [(QLSqliteDatabase *)v32 bindUnsignedLongLong:v33 atIndex:2 inStatement:v64];
          v34 = v60;
          [(QLSqliteDatabase *)self->_database bindObject:v60 atIndex:3 inStatement:v64];
          v35 = self->_database;
          uint64_t v36 = [v22 location];
          [(QLSqliteDatabase *)v35 bindUnsignedLongLong:v36 atIndex:4 inStatement:v64];
          v37 = self->_database;
          uint64_t v38 = [v22 length];
          [(QLSqliteDatabase *)v37 bindUnsignedLongLong:v38 atIndex:5 inStatement:v64];
          v39 = self->_database;
          uint64_t v40 = [v23 location];
          [(QLSqliteDatabase *)v39 bindUnsignedLongLong:v40 atIndex:6 inStatement:v64];
          v41 = self->_database;
          uint64_t v42 = [v23 length];
          [(QLSqliteDatabase *)v41 bindUnsignedLongLong:v42 atIndex:7 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindInt:a12 atIndex:8 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindBytes:&v65 length:32 atIndex:9 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindInt:v59 atIndex:10 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindInt:v61 atIndex:11 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a14 atIndex:12 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:v29 atIndex:13 inStatement:v64];
LABEL_14:
          LOBYTE(v25) = [(QLSqliteDatabase *)self->_database stepStatement:v64];
          [(QLSqliteDatabase *)self->_database finalizeStatement:&v64];

          goto LABEL_15;
        }
      }
      else
      {
        [(QLSqliteDatabase *)database finalizeStatement:&v64];
        v64 = [(QLSqliteDatabase *)self->_database prepareStatement:"INSERT INTO thumbnails (file_id, size, icon_mode, width, height, bitmapFormat, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length, flavor, content_rect, hit_count, last_hit_date, badge_type, icon_variant, interpolation, externalGeneratorDataHash) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
        if (v64)
        {
          if (v24) {
            v43 = v24;
          }
          else {
            v43 = (void *)MEMORY[0x1E4F1C9C8];
          }
          [v43 timeIntervalSinceReferenceDate];
          double v45 = v44;
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:(unint64_t)a4 atIndex:2 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:v17 atIndex:3 inStatement:v64];
          v46 = self->_database;
          uint64_t v47 = [v21 width];
          [(QLSqliteDatabase *)v46 bindUnsignedLongLong:v47 atIndex:4 inStatement:v64];
          v48 = self->_database;
          uint64_t v49 = [v21 height];
          [(QLSqliteDatabase *)v48 bindUnsignedLongLong:v49 atIndex:5 inStatement:v64];
          v34 = v60;
          [(QLSqliteDatabase *)self->_database bindObject:v60 atIndex:6 inStatement:v64];
          v50 = self->_database;
          uint64_t v51 = [v22 location];
          [(QLSqliteDatabase *)v50 bindUnsignedLongLong:v51 atIndex:7 inStatement:v64];
          v52 = self->_database;
          uint64_t v53 = [v22 length];
          [(QLSqliteDatabase *)v52 bindUnsignedLongLong:v53 atIndex:8 inStatement:v64];
          v54 = self->_database;
          uint64_t v55 = [v23 location];
          [(QLSqliteDatabase *)v54 bindUnsignedLongLong:v55 atIndex:9 inStatement:v64];
          v56 = self->_database;
          uint64_t v57 = [v23 length];
          [(QLSqliteDatabase *)v56 bindUnsignedLongLong:v57 atIndex:10 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindInt:a12 atIndex:11 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindBytes:&v65 length:32 atIndex:12 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindInt:1 atIndex:13 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindDouble:14 atIndex:v64 inStatement:v45];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a6 atIndex:15 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:v59 atIndex:16 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:(int)v61 atIndex:17 inStatement:v64];
          [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a14 atIndex:18 inStatement:v64];
          goto LABEL_14;
        }
      }

      LOBYTE(v25) = 0;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }
LABEL_15:

  return (char)v25;
}

- (id)removeThumbnailForFileIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(QLCacheIndexDatabase *)self _cacheIdForFileIdentifier:v4 createVersion:0];
  uint8_t v6 = [(QLCacheIndexDatabase *)self removeAllThumbnailsForCacheId:v5];
  uint64_t v7 = objc_opt_class();

  [v7 removeFromDatabase:self->_database fileWithCacheId:v5];
  return v6;
}

- (id)removeAllThumbnailsForCacheId:(unint64_t)a3
{
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint8_t v6 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id=?");
  uint64_t v18 = v6;
  if (!v6)
  {
    id v14 = v5;
LABEL_14:
    uint64_t v10 = v14;
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v6];
  char v17 = 0;
  while ([(QLSqliteDatabase *)self->_database stepStatement:v7 didReturnData:&v17]
       && v17 != 0)
    [(QLCacheIndexDatabase *)self add:2 blobInfosStartingAtColumn:0 ofSteppedStatement:v7 toArray:v5];
  [(QLSqliteDatabase *)self->_database finalizeStatement:&v18];
  BOOL v9 = [(QLSqliteDatabase *)self->_database prepareStatement:"DELETE FROM thumbnails WHERE file_id=?"];
  BOOL v16 = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9)
  {
    unint64_t v11 = v9;
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v9];
    BOOL v12 = [(QLSqliteDatabase *)self->_database stepStatement:v11];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v16];
    if (v12) {
      char v13 = v5;
    }
    else {
      char v13 = v10;
    }
    id v14 = v13;
    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (id)removePercentageOldestThumbnails:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = (double)[(QLCacheIndexDatabase *)self thumbnailCount];
  unint64_t v6 = vcvtpd_u64_f64((double)a3 / 100.0 * v5);
  uint64_t v7 = _log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218496;
    unint64_t v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = v6;
    __int16 v16 = 2048;
    unint64_t v17 = (unint64_t)v5;
    _os_log_debug_impl(&dword_1DDC5E000, v7, OS_LOG_TYPE_DEBUG, "Removing %llu%% oldest thumbnails, which is %lu thumbnails out of total of %lu", (uint8_t *)&v12, 0x20u);
  }

  id v8 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT rowid, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails ORDER BY last_hit_date ASC LIMIT ?");
  if (v8)
  {
    BOOL v9 = v8;
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:v6 atIndex:1 inStatement:v8];
    [(QLCacheIndexDatabase *)self _removeThumbnailsFromStatement:v9];
  }
  else
  {
    [MEMORY[0x1E4F1C978] array];
  uint64_t v10 = };
  return v10;
}

- (id)batchOfFileProviderItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4
{
  uint64_t v7 = [MEMORY[0x1E4F3A678] queryStringToFindCacheIds];
  id v8 = [v7 stringByAppendingFormat:@" rowid > ? LIMIT 50"];

  database = self->_database;
  id v10 = v8;
  uint64_t v11 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [v10 UTF8String]);
  uint64_t v22 = v11;
  if (v11)
  {
    uint64_t v12 = v11;
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v11];
    char v21 = 0;
    unint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v14 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v12 didReturnData:&v21]) {
      BOOL v15 = v21 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      do
      {
        __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F3A680]) initWithSteppedStatement:v12 database:self->_database];
        unint64_t v17 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v12];
        if (v17 > v14) {
          unint64_t v14 = v17;
        }
        uint64_t v18 = [v16 fileIdentifier];
        v19 = [v18 itemID];
        [v13 addObject:v19];
      }
      while ([(QLSqliteDatabase *)self->_database stepStatement:v12 didReturnData:&v21]&& v21);
    }
    if (a4) {
      *a4 = v14;
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v22];
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)batchOfRegularItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4
{
  uint64_t v7 = [MEMORY[0x1E4F3A668] queryStringToFindCacheIds];
  id v8 = [v7 stringByAppendingFormat:@" rowid > ? LIMIT 50"];

  database = self->_database;
  id v10 = v8;
  uint64_t v11 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [v10 UTF8String]);
  uint64_t v21 = v11;
  if (v11)
  {
    uint64_t v12 = v11;
    [(QLSqliteDatabase *)self->_database bindUnsignedLongLong:a3 atIndex:1 inStatement:v11];
    char v20 = 0;
    unint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v14 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v12 didReturnData:&v20]) {
      BOOL v15 = v20 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      do
      {
        __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F3A670]) initWithSteppedStatement:v12 database:self->_database];
        unint64_t v17 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v12];
        if (v17 > v14) {
          unint64_t v14 = v17;
        }
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
        [v13 setObject:v16 forKeyedSubscript:v18];
      }
      while ([(QLSqliteDatabase *)self->_database stepStatement:v12 didReturnData:&v20]&& v20);
    }
    if (a4) {
      *a4 = v14;
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v21];
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

- (id)removeThumbnailsForDeletedFiles
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(QLCacheIndexDatabase *)self itemManager];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F25D38] defaultManager];
  }
  uint64_t v7 = v6;

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = [(QLCacheIndexDatabase *)self batchOfFileProviderItemsStartingAtRowId:0 endingAtRowId:&v43];
  if ([v9 count])
  {
    BOOL v27 = self;
    uint64_t v28 = v3;
    do
    {
      uint64_t v29 = v43;
      id v10 = dispatch_group_create();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            dispatch_group_enter(v10);
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke;
            v35[3] = &unk_1E6D0C448;
            id v36 = v8;
            uint64_t v37 = v16;
            uint64_t v38 = v10;
            [v7 fetchItemForItemID:v16 completionHandler:v35];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v13);
      }

      dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      self = v27;
      v33[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2;
      v33[3] = &unk_1E6D0C498;
      v33[4] = v27;
      uint64_t v3 = v28;
      id v34 = v28;
      [v8 enumerateKeysAndObjectsUsingBlock:v33];

      uint64_t v17 = v29;
      BOOL v9 = [(QLCacheIndexDatabase *)v27 batchOfFileProviderItemsStartingAtRowId:v29 endingAtRowId:&v43];
    }
    while ([v9 count]);
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [(QLCacheIndexDatabase *)self batchOfRegularItemsStartingAtRowId:v17 endingAtRowId:&v43];
  if ([v18 count])
  {
    do
    {
      uint64_t v19 = v43;
      char v20 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_152;
      v30[3] = &unk_1E6D0C4C0;
      id v31 = v20;
      id v32 = v21;
      id v22 = v21;
      id v23 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v30];
      [(QLCacheIndexDatabase *)self removeBasicFilesWithRowids:v23];
      id v24 = [(QLCacheIndexDatabase *)self removeThumbnailsWithCacheIds:v22];
      [v3 addObjectsFromArray:v24];

      __int16 v25 = [(QLCacheIndexDatabase *)self batchOfRegularItemsStartingAtRowId:v19 endingAtRowId:&v43];

      uint64_t v18 = v25;
    }
    while ([v25 count]);
  }
  else
  {
    __int16 v25 = v18;
  }

  return v3;
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  double v5 = [*(id *)(a1 + 40) providerDomainID];
  id v9 = [v4 objectForKeyedSubscript:v5];

  if (v9)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) providerDomainID];
    [v6 setObject:v9 forKeyedSubscript:v7];

    if (a2) {
      goto LABEL_3;
    }
  }
  id v8 = [*(id *)(a1 + 40) identifier];
  [v9 addObject:v8];

LABEL_3:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) prepareStatement:"SELECT rowid FROM provider_files WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"];
  uint64_t v22 = v9;
  if (v9)
  {
    uint64_t v10 = v9;
    [*(id *)(*(void *)(a1 + 32) + 8) bindObject:v5 atIndex:1 inStatement:v9];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_149;
    v18[3] = &unk_1E6D0C470;
    v18[4] = v11;
    uint64_t v21 = v10;
    id v13 = v7;
    id v19 = v13;
    id v14 = v8;
    id v20 = v14;
    [v12 runStatement:v10 withBoundObjects:v6 startingAtIndex:2 stepHandler:v18];
    [*(id *)(*(void *)(a1 + 32) + 8) finalizeStatement:&v22];
    [*(id *)(a1 + 32) removeUbiquitousFilesWithRowids:v13];
    BOOL v15 = *(void **)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 32) removeThumbnailsWithCacheIds:v14];
    [v15 addObjectsFromArray:v16];
  }
  else
  {
    uint64_t v17 = _log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_cold_1();
    }
  }
}

uint64_t __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_149(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = [v2 unsignedLongLongFromColumn:0 inStatement:*(void *)(a1 + 56)];

  id v4 = *(void **)(a1 + 40);
  id v5 = [NSNumber numberWithUnsignedLongLong:v3];
  [v4 addObject:v5];

  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E4F3A678], "cacheIdFromRowId:", v3));
  [v6 addObject:v7];

  return 1;
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_152(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 fileIdentifier];
  if (fsgetpath(v10, 0x400uLL, &v9, objc_msgSend(v6, "fileId", objc_msgSend(v6, "fsid"))) <= 0)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E4F3A668], "cacheIdFromRowId:", objc_msgSend(v5, "unsignedLongLongValue")));
    [v7 addObject:v8];
  }
}

- (BOOL)add:(unint64_t)a3 blobInfosStartingAtColumn:(unint64_t)a4 ofSteppedStatement:(sqlite3_stmt *)a5 toArray:(id)a6
{
  for (id i = a6; a3; --a3)
  {
    uint64_t v11 = objc_alloc_init(QLCacheBlobInfo);
    [(QLCacheBlobInfo *)v11 setLocation:[(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:a4 inStatement:a5]];
    [(QLCacheBlobInfo *)v11 setLength:[(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:(a4 + 1) inStatement:a5]];
    if ([(QLCacheBlobInfo *)v11 length]) {
      [i addObject:v11];
    }

    a4 = (a4 + 2);
  }

  return 1;
}

- (id)removeThumbnailsWithCacheIds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", objc_msgSend(@"SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id IN  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", "UTF8String"));
    id v20 = v5;
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      database = self->_database;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      BOOL v15 = __53__QLCacheIndexDatabase_removeThumbnailsWithCacheIds___block_invoke;
      uint64_t v16 = &unk_1E6D0C4E8;
      uint64_t v17 = self;
      id v19 = v6;
      id v9 = v7;
      id v18 = v9;
      [(QLSqliteDatabase *)database runStatement:v6 withBoundNumbers:v4 startingAtIndex:1 stepHandler:&v13];
      -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v20, v13, v14, v15, v16, v17);
      id v20 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", [@"DELETE FROM thumbnails WHERE file_id IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" UTF8String]);
      [(QLSqliteDatabase *)self->_database runStatement:v20 withBoundNumbers:v4 startingAtIndex:1 stepHandler:0];
      [(QLSqliteDatabase *)self->_database finalizeStatement:&v20];
      uint64_t v10 = v18;
      id v11 = v9;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __53__QLCacheIndexDatabase_removeThumbnailsWithCacheIds___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)removeUbiquitousFilesWithRowids:(id)a3
{
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [@"DELETE FROM provider_files WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" UTF8String]);
  [(QLSqliteDatabase *)self->_database runStatement:v6 withBoundNumbers:v5 startingAtIndex:1 stepHandler:0];

  [(QLSqliteDatabase *)self->_database finalizeStatement:&v6];
}

- (void)removeBasicFilesWithRowids:(id)a3
{
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [@"DELETE FROM basic_files WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" UTF8String]);
  [(QLSqliteDatabase *)self->_database runStatement:v6 withBoundNumbers:v5 startingAtIndex:1 stepHandler:0];

  [(QLSqliteDatabase *)self->_database finalizeStatement:&v6];
}

- (id)removeFilesWithFileInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v10 = _log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v9 fileIdentifier];
          *(_DWORD *)buf = 138412290;
          v30 = v11;
          _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "removing file %@", buf, 0xCu);
        }
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "cacheId"));
        [v4 addObject:v12];

        uint64_t v13 = [v9 fileIdentifier];
        uint64_t v14 = [v13 fileIdentifier];
        BOOL v15 = objc_opt_class();

        uint64_t v16 = [v15 tableName];
        LODWORD(v14) = [v16 isEqualToString:@"basic_files"];

        if (v14)
        {
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "rowIdFromCacheId:", objc_msgSend(v9, "cacheId")));
          id v18 = v23;
        }
        else
        {
          id v19 = [v15 tableName];
          int v20 = [v19 isEqualToString:@"provider_files"];

          if (!v20) {
            continue;
          }
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "rowIdFromCacheId:", objc_msgSend(v9, "cacheId")));
          id v18 = v22;
        }
        [v18 addObject:v17];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  return [(QLCacheIndexDatabase *)self removeFilesFromUninstalledFileProvidersWithIdentifiers:a3 whichAreRemaining:1];
}

- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  return [(QLCacheIndexDatabase *)self removeFilesFromUninstalledFileProvidersWithIdentifiers:a3 whichAreRemaining:0];
}

- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3 whichAreRemaining:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = @"IN";
  if (v4) {
    uint64_t v7 = @"NOT IN";
  }
  id v8 = v7;
  id v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT rowid FROM provider_files WHERE fileProviderId %@ ("), v8;
  uint64_t v10 = [MEMORY[0x1E4F28E78] string];
  if ([v6 count])
  {
    unint64_t v11 = 0;
    do
    {
      if (v11) {
        uint64_t v12 = @",?";
      }
      else {
        uint64_t v12 = @"?";
      }
      [v10 appendString:v12];
      ++v11;
    }
    while (v11 < [v6 count]);
  }
  [v9 appendString:v10];
  [v9 appendString:@""]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  database = self->_database;
  id v16 = v9;
  uint64_t v17 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [v16 UTF8String]);
  uint64_t v48 = v17;
  if (v17)
  {
    uint64_t v18 = v17;
    long long v40 = v14;
    long long v41 = v13;
    if ([v6 count])
    {
      unint64_t v19 = 0;
      do
      {
        int v20 = self->_database;
        uint64_t v21 = [v6 objectAtIndexedSubscript:v19];
        [(QLSqliteDatabase *)v20 bindObject:v21 atIndex:++v19 inStatement:v18];
      }
      while (v19 < [v6 count]);
    }
    id v22 = self->_database;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __97__QLCacheIndexDatabase_removeFilesFromUninstalledFileProvidersWithIdentifiers_whichAreRemaining___block_invoke;
    v44[3] = &unk_1E6D0C470;
    v44[4] = self;
    uint64_t v47 = v18;
    id v23 = v41;
    id v45 = v23;
    id v24 = v40;
    id v46 = v24;
    [(QLSqliteDatabase *)v22 runStatement:v18 stepHandler:v44];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v48];
    long long v25 = _log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDC5E000, v25, OS_LOG_TYPE_DEFAULT, "Clearing download deny list for removed domains during fileprovider uninstallation", buf, 2u);
    }
    id v38 = v16;

    long long v39 = v8;
    long long v26 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"DELETE FROM missing_remote_thumbnails WHERE fileProviderId %@ ("), v8;
    [v26 appendString:v10];
    [v26 appendString:@""]);
    long long v27 = self->_database;
    id v28 = v26;
    uint64_t v29 = -[QLSqliteDatabase prepareStatement:](v27, "prepareStatement:", [v28 UTF8String]);
    *(void *)buf = v29;
    if (!v29)
    {
      v30 = _log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:]();
      }
    }
    if ([v6 count])
    {
      unint64_t v31 = 0;
      do
      {
        uint64_t v32 = self->_database;
        uint64_t v33 = [v6 objectAtIndexedSubscript:v31];
        [(QLSqliteDatabase *)v32 bindObject:v33 atIndex:++v31 inStatement:v29];
      }
      while (v31 < [v6 count]);
    }
    [(QLSqliteDatabase *)self->_database runStatement:v29 stepHandler:0];
    [(QLSqliteDatabase *)self->_database finalizeStatement:buf];
    id v34 = _log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v42 = 0;
      _os_log_impl(&dword_1DDC5E000, v34, OS_LOG_TYPE_DEFAULT, "Finished clearing download deny list for removed domains during fileprovider uninstallation", v42, 2u);
    }

    [(QLCacheIndexDatabase *)self removeUbiquitousFilesWithRowids:v23];
    v35 = [(QLCacheIndexDatabase *)self removeThumbnailsWithCacheIds:v24];

    id v16 = v38;
    id v8 = v39;
    id v14 = v40;
    id v13 = v41;
  }
  else
  {
    id v36 = _log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:]();
    }

    v35 = 0;
  }

  return v35;
}

uint64_t __97__QLCacheIndexDatabase_removeFilesFromUninstalledFileProvidersWithIdentifiers_whichAreRemaining___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = [v2 unsignedLongLongFromColumn:0 inStatement:*(void *)(a1 + 56)];

  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:v3];
  [v4 addObject:v5];

  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E4F3A678], "cacheIdFromRowId:", v3));
  [v6 addObject:v7];

  return 1;
}

- (unint64_t)missingRemoteThumbnailsCountForFileProviderIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT count(itemId) FROM missing_remote_thumbnails WHERE fileProviderId IN (");
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      if (v6) {
        uint64_t v7 = @",?";
      }
      else {
        uint64_t v7 = @"?";
      }
      [v5 appendString:v7];
      ++v6;
    }
    while (v6 < [v4 count]);
  }
  [v5 appendString:@""]);
  database = self->_database;
  id v9 = v5;
  unint64_t v10 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", [v9 UTF8String]);
  unint64_t v14 = v10;
  if (v10)
  {
    char v13 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v10 didReturnData:&v13]) {
      BOOL v11 = v13 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v10];
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v14];
  }

  return v10;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLSqliteDatabase *)self->_database prepareStatement:"UPDATE thumbnails SET last_hit_date=?"];
  id v8 = v5;
  if (v5)
  {
    database = self->_database;
    [v4 timeIntervalSinceReferenceDate];
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v5);
    LOBYTE(v5) = [(QLSqliteDatabase *)self->_database stepStatement:v5];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v8];
  }

  return (char)v5;
}

- (id)enumeratorForAllUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4
{
  id v4 = [[QLCacheIndexDatabaseFileInfoEnumerator alloc] initWithSqliteDatabase:self->_database toEnumerateUbiquitousFiles:a3 extraInfo:a4];
  return v4;
}

- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT SUM(bitmapdata_length) FROM thumbnails WHERE last_hit_date<?"];
  unint64_t v10 = v5;
  if (v5)
  {
    database = self->_database;
    [v4 timeIntervalSinceReferenceDate];
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v5);
    char v9 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v5 didReturnData:&v9]) {
      BOOL v7 = v9 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v5];
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v10];
  }

  return (unint64_t)v5;
}

- (id)allReservedBuffers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT location, length FROM reserved_buffer");
  char v9 = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    char v8 = 0;
    while ([(QLSqliteDatabase *)self->_database stepStatement:v5 didReturnData:&v8]
         && v8 != 0)
      [(QLCacheIndexDatabase *)self add:1 blobInfosStartingAtColumn:0 ofSteppedStatement:v5 toArray:v3];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v9];
  }
  return v3;
}

- (id)allBuffersIncludingReserved:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails");
  uint64_t v12 = v6;
  if (v6)
  {
    BOOL v7 = v6;
    char v11 = 0;
    while ([(QLSqliteDatabase *)self->_database stepStatement:v7 didReturnData:&v11]
         && v11 != 0)
      [(QLCacheIndexDatabase *)self add:2 blobInfosStartingAtColumn:0 ofSteppedStatement:v7 toArray:v5];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v12];
    if (v3)
    {
      char v9 = [(QLCacheIndexDatabase *)self allReservedBuffers];
      [v5 addObjectsFromArray:v9];
    }
  }
  return v5;
}

- (void)addReservedBufferWithBlobInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLSqliteDatabase *)self->_database prepareStatement:"INSERT INTO reserved_buffer (location, length) VALUES (?, ?)"];
  char v8 = v5;
  if (v5)
  {
    unint64_t v6 = v5;
    BOOL v7 = _log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[QLCacheIndexDatabase addReservedBufferWithBlobInfo:](v4, v7);
    }

    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v4 location], 1, v6);
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v4 length], 2, v6);
    [(QLSqliteDatabase *)self->_database stepStatement:v6];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v8];
  }
}

- (BOOL)removeReservedBufferWithBlobInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLSqliteDatabase *)self->_database prepareStatement:"DELETE FROM reserved_buffer WHERE location=?"];
  BOOL v7 = v5;
  if (v5)
  {
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", [v4 location], 1, v5);
    LOBYTE(v5) = [(QLSqliteDatabase *)self->_database stepStatement:v5];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v7];
  }

  return (char)v5;
}

- (unint64_t)reserveBufferCount
{
  BOOL v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT count(location) FROM reserved_buffer"];
  BOOL v7 = v3;
  if (v3)
  {
    char v6 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v3 didReturnData:&v6]) {
      BOOL v4 = v6 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v3];
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v7];
  }
  return (unint64_t)v3;
}

- (unint64_t)reserveBufferSize
{
  BOOL v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT SUM(length) FROM reserved_buffer"];
  BOOL v7 = v3;
  if (v3)
  {
    char v6 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v3 didReturnData:&v6]) {
      BOOL v4 = v6 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v3];
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v7];
  }
  return (unint64_t)v3;
}

- (void)_createTables
{
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE preferences (key TEXT UNIQUE PRIMARY KEY, value TEXT)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE INDEX key ON preferences (key)"];
  -[QLSqliteDatabase execute:](self->_database, "execute:", "INSERT INTO preferences (key, value) VALUES ('version', '%d')", 12);
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE basic_files (fileId INTEGER PRIMARY KEY, fsid INTEGER, version BLOB)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE provider_files (fileProviderId TEXT, itemId TEXT, version BLOB)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE UNIQUE INDEX fileProviderIdItemId ON provider_files (fileProviderId, itemId)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE thumbnails (file_id INTEGER, size REAL, icon_mode INTEGER, hit_count INTEGER, last_hit_date REAL, width INTEGER, height INTEGER, bitmapFormat BLOB, bitmapdata_location INTEGER, bitmapdata_length INTEGER, plistbuffer_location INTEGER, plistbuffer_length INTEGER, flavor INTEGER, content_rect BLOB, badge_type INTEGER, icon_variant INTEGER, interpolation INTEGER, externalGeneratorDataHash INTEGER)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE UNIQUE INDEX size ON thumbnails (file_id, size, icon_mode, badge_type, icon_variant, interpolation, externalGeneratorDataHash)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE INDEX last_hit_date ON thumbnails (last_hit_date)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE reserved_buffer (location INTEGER, length INTEGER)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE UNIQUE INDEX location_reserved_buffer ON reserved_buffer (location)"];
  [(QLSqliteDatabase *)self->_database execute:"CREATE TABLE missing_remote_thumbnails (fileProviderId TEXT, itemId TEXT, version BLOB, date REAL)"];
  database = self->_database;
  [(QLSqliteDatabase *)database execute:"CREATE UNIQUE INDEX missing_remote_thumbnails_index ON missing_remote_thumbnails (fileProviderId, itemId)"];
}

- (void)_deleteAllTables
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT name FROM sqlite_master WHERE type='table'"];
  uint64_t v21 = v3;
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v5 = objc_opt_new();
    char v20 = 0;
    if ([(QLSqliteDatabase *)self->_database stepStatement:v4 didReturnData:&v20]) {
      BOOL v6 = v20 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      do
      {
        id v7 = [(QLSqliteDatabase *)self->_database newStringFromColumn:0 inStatement:v4 uniqueInStringTable:0];
        id v8 = [NSString alloc];
        id v9 = v7;
        unint64_t v10 = objc_msgSend(v8, "initWithFormat:", @"DROP TABLE %s", objc_msgSend(v9, "UTF8String"));
        [v5 addObject:v10];
      }
      while ([(QLSqliteDatabase *)self->_database stepStatement:v4 didReturnData:&v20]&& v20);
    }
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v21];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[QLSqliteDatabase execute:](self->_database, "execute:", [*(id *)(*((void *)&v16 + 1) + 8 * i) UTF8String]);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (unint64_t)fileEntryCount
{
  if (![(QLSqliteDatabase *)self->_database isOpened]) {
    return 0;
  }
  BOOL v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT sum(count) FROM (SELECT COUNT(*) AS count FROM basic_files UNION ALL SELECT COUNT(*) AS count FROM provider_files)"];
  id v7 = v3;
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  [(QLSqliteDatabase *)self->_database stepStatement:v3];
  unint64_t v5 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v4];
  [(QLSqliteDatabase *)self->_database finalizeStatement:&v7];
  return v5;
}

- (unint64_t)thumbnailCount
{
  if (![(QLSqliteDatabase *)self->_database isOpened]) {
    return 0;
  }
  BOOL v3 = [(QLSqliteDatabase *)self->_database prepareStatement:"SELECT COUNT(*) FROM thumbnails"];
  id v7 = v3;
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  [(QLSqliteDatabase *)self->_database stepStatement:v3];
  unint64_t v5 = [(QLSqliteDatabase *)self->_database unsignedLongLongFromColumn:0 inStatement:v4];
  [(QLSqliteDatabase *)self->_database finalizeStatement:&v7];
  return v5;
}

- (id)lastCrapWithDate:(id *)a3
{
  return [(QLSqliteDatabase *)self->_database lastCrapWithDate:a3];
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count])
    {
      unint64_t v5 = 0;
      BOOL v6 = @"INSERT OR REPLACE INTO missing_remote_thumbnails(fileProviderId, itemId, version, date) VALUES ";
      do
      {
        if (v5)
        {
          uint64_t v7 = [(__CFString *)v6 stringByAppendingString:@","];

          BOOL v6 = (__CFString *)v7;
        }
        id v8 = [(__CFString *)v6 stringByAppendingString:@"(?,?,?,?)"];

        ++v5;
        BOOL v6 = v8;
      }
      while (v5 < [v4 count]);
    }
    else
    {
      id v8 = @"INSERT OR REPLACE INTO missing_remote_thumbnails(fileProviderId, itemId, version, date) VALUES ";
    }
    database = self->_database;
    id v24 = v8;
    uint64_t v10 = [(QLSqliteDatabase *)database prepareStatement:[(__CFString *)v24 UTF8String]];
    uint64_t v25 = v10;
    if ([v4 count])
    {
      unint64_t v11 = 0;
      uint64_t v12 = 4;
      do
      {
        uint64_t v13 = self->_database;
        uint64_t v14 = [v4 objectAtIndexedSubscript:v11];
        BOOL v15 = [v14 providerDomainID];
        [(QLSqliteDatabase *)v13 bindObject:v15 atIndex:(v12 - 3) inStatement:v10];

        long long v16 = self->_database;
        long long v17 = [v4 objectAtIndexedSubscript:v11];
        long long v18 = [v17 itemIdentifier];
        [(QLSqliteDatabase *)v16 bindObject:v18 atIndex:(v12 - 2) inStatement:v10];

        long long v19 = self->_database;
        char v20 = [v4 objectAtIndexedSubscript:v11];
        uint64_t v21 = [v20 itemVersion];
        id v22 = [v21 contentVersion];
        [(QLSqliteDatabase *)v19 bindObject:v22 atIndex:(v12 - 1) inStatement:v10];

        uint64_t v23 = self->_database;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        -[QLSqliteDatabase bindDouble:atIndex:inStatement:](v23, "bindDouble:atIndex:inStatement:", v12, v10);
        ++v11;
        uint64_t v12 = (v12 + 4);
      }
      while ([v4 count] > v11);
    }
    [(QLSqliteDatabase *)self->_database stepStatement:v10];
    [(QLSqliteDatabase *)self->_database finalizeStatement:&v25];
  }
}

- (id)itemsGroupedByProviderDomain:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "providerDomainID", (void)v15);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];

        if (!v12)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v13 = [v10 providerDomainID];
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(QLCacheIndexDatabase *)self itemsGroupedByProviderDomain:v4];
    uint64_t v6 = self->_database;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__QLCacheIndexDatabase_noteRemoteThumbnailPresentForItems___block_invoke;
    v8[3] = &unk_1E6D0C510;
    id v9 = v6;
    uint64_t v10 = "DELETE FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    uint64_t v7 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __59__QLCacheIndexDatabase_noteRemoteThumbnailPresentForItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) itemIdentifier];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [*(id *)(a1 + 32) prepareStatement:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) bindObject:v5 atIndex:1 inStatement:v14];
  [*(id *)(a1 + 32) runStatement:v14 withBoundObjects:v7 startingAtIndex:2 stepHandler:0];
  [*(id *)(a1 + 32) finalizeStatement:&v14];
}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  id v4 = [(QLCacheIndexDatabase *)self itemsGroupedByProviderDomain:a3];
  id v5 = self->_database;
  uint64_t v19 = -[QLSqliteDatabase prepareStatement:](v5, "prepareStatement:", "SELECT itemId, version FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke;
  long long v15 = &unk_1E6D0C560;
  long long v16 = v5;
  uint64_t v18 = v19;
  id v7 = v6;
  id v17 = v7;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v12];
  -[QLSqliteDatabase finalizeStatement:](v8, "finalizeStatement:", &v19, v12, v13, v14, v15);
  uint64_t v9 = v17;
  id v10 = v7;

  return v10;
}

void __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy_;
  id v46 = __Block_byref_object_dispose_;
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v13 = [v12 itemVersion];
        uint64_t v14 = [v13 contentVersion];
        long long v15 = [v12 itemIdentifier];
        [v7 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) bindObject:v5 atIndex:1 inStatement:*(void *)(a1 + 48)];
  long long v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = [v7 allKeys];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke_236;
  v33[3] = &unk_1E6D0C538;
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 48);
  id v34 = v19;
  uint64_t v37 = v20;
  id v21 = v7;
  id v35 = v21;
  id v36 = &v42;
  [v16 runStatement:v17 withBoundObjects:v18 startingAtIndex:2 stepHandler:v33];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v8;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v22);
        }
        long long v26 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        long long v27 = (void *)v43[5];
        id v28 = objc_msgSend(v26, "itemIdentifier", (void)v29);
        LOBYTE(v27) = [v27 containsObject:v28];

        if ((v27 & 1) == 0) {
          [*(id *)(a1 + 40) addObject:v26];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v48 count:16];
    }
    while (v23);
  }

  _Block_object_dispose(&v42, 8);
}

uint64_t __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke_236(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) newStringFromColumn:0 inStatement:*(void *)(a1 + 56) uniqueInStringTable:0];
  id v3 = (void *)[*(id *)(a1 + 32) newDataFromColumn:1 inStatement:*(void *)(a1 + 56) copyBytes:0];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v2];
  if (([v4 isEqual:v3] & 1) != 0 || !v3 && !objc_msgSend(v4, "length")) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v2];
  }

  return 1;
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  id v4 = a3;
  id v5 = self->_database;
  uint64_t v6 = [(QLSqliteDatabase *)v5 prepareStatement:"SELECT version FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId = ?"];
  uint64_t v21 = v6;
  id v7 = [v4 providerDomainID];
  [(QLSqliteDatabase *)v5 bindObject:v7 atIndex:1 inStatement:v6];

  id v8 = [v4 itemIdentifier];
  [(QLSqliteDatabase *)v5 bindObject:v8 atIndex:2 inStatement:v6];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__QLCacheIndexDatabase_itemIsMissingRemoteThumbnail___block_invoke;
  v12[3] = &unk_1E6D0C538;
  uint64_t v9 = v5;
  uint64_t v13 = v9;
  uint64_t v16 = v6;
  id v10 = v4;
  id v14 = v10;
  long long v15 = &v17;
  [(QLSqliteDatabase *)v9 runStatement:v6 stepHandler:v12];
  [(QLSqliteDatabase *)v9 finalizeStatement:&v21];
  LOBYTE(v6) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v6;
}

BOOL __53__QLCacheIndexDatabase_itemIsMissingRemoteThumbnail___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) newDataFromColumn:0 inStatement:*(void *)(a1 + 56) copyBytes:0];
  id v3 = [*(id *)(a1 + 40) itemVersion];
  id v4 = [v3 contentVersion];

  if (([v4 isEqualToData:v2] & 1) != 0 || !v2 && !objc_msgSend(v4, "length")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  BOOL v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;

  return v5;
}

- (unint64_t)maxThumbnailLifeTime
{
  return self->_maxThumbnailLifeTime;
}

- (QLSqliteDatabase)database
{
  return (QLSqliteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (FPItemManager)itemManager
{
  return (FPItemManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)initWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)doesExist
{
}

- (void)isValid
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "index database is valid", v2, v3, v4, v5, v6);
}

- (void)insertOrUpdateThumbnailWithVersionedFileIdentifier:(unsigned char *)a1 shouldInvalidAllThumbnailSizes:(uint64_t)a2 added:(os_log_t)log .cold.1(unsigned char *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "";
  if (!*a1) {
    uint64_t v3 = " not";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "all thumbnails should%s be invalidate for %@", (uint8_t *)&v4, 0x16u);
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Could not prepare statement to find rowids to delete deleted items", v2, v3, v4, v5, v6);
}

- (void)removeThumbnailsOlderThanDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Could not prepare statement to retrieve rowids for fileprovider uninstallation", v2, v3, v4, v5, v6);
}

- (void)removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Could not prepare statement to clear download deny list for fileprovider uninstallation", v2, v3, v4, v5, v6);
}

- (void)addReservedBufferWithBlobInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = [a1 location];
  __int16 v6 = 2048;
  uint64_t v7 = [a1 length];
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "Adding reserved buffer (%llu, %llu)", (uint8_t *)&v4, 0x16u);
}

@end