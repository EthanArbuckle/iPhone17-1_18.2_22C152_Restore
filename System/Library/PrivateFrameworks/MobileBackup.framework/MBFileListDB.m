@interface MBFileListDB
+ (id)_fileMetadataForPath:(id)a3 fetchXattrs:(BOOL)a4 db:(id)a5 error:(id *)a6;
+ (id)openDatabaseIn:(id)a3 commitID:(id)a4 domainName:(id)a5 error:(id *)a6;
+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 domainName:(id)a5 error:(id *)a6;
- (BOOL)_adjustInodesForVolumeTransition:(id *)a3;
- (BOOL)_clearInProgressVolumeTransition:(id *)a3;
- (BOOL)_fetchPropertyValue:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)_fetchVolumeUUID:(id *)a3 error:(id *)a4;
- (BOOL)_markAllFilesAsDeleted:(id *)a3;
- (BOOL)_markInProgressVolumeTransition:(id *)a3;
- (BOOL)_openOrCreateWithError:(id *)a3;
- (BOOL)_openWithError:(id *)a3;
- (BOOL)_removePropertyValueForKey:(id)a3 error:(id *)a4;
- (BOOL)_setPropertyValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)_setVolumeUUID:(id)a3 error:(id *)a4;
- (BOOL)_truncateDeletedFiles:(id *)a3;
- (BOOL)beginTranscriptionForVolumeUUID:(id)a3 error:(id *)a4;
- (BOOL)canReuseAssetsAcrossVolumeTransition:(BOOL *)a3 isResuming:(BOOL *)a4 error:(id *)a5;
- (BOOL)close:(id *)a3;
- (BOOL)computeAssetRecordIDChecksumWithPrefix:(id)a3 checksum:(int64_t *)a4 error:(id *)a5;
- (BOOL)enumerateAssetRecordIdSuffixForNonEmptyFiles:(id *)a3 block:(id)a4;
- (BOOL)enumerateFileMetadataWithError:(id *)a3 block:(id)a4;
- (BOOL)enumerateFilesWithDomain:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateSymlinkTargets:(id *)a3 block:(id)a4;
- (BOOL)fetchAssetMetdataWithInode:(unint64_t)a3 genCount:(unsigned int)a4 outAssetMetadata:(id *)a5 error:(id *)a6;
- (BOOL)fetchEncryptionKeyForInode:(unint64_t)a3 outEncryptionKey:(id *)a4 error:(id *)a5;
- (BOOL)fetchFileListStats:(id *)a3 error:(id *)a4;
- (BOOL)finishTranscription:(id *)a3;
- (BOOL)isTransitioningVolumes;
- (BOOL)markAllFilesAsDeleted:(id *)a3;
- (BOOL)markFileAsPresent:(id)a3 error:(id *)a4;
- (BOOL)setFileMetadata:(id)a3 forPath:(id)a4 error:(id *)a5;
- (NSString)domainName;
- (NSString)path;
- (NSUUID)volumeUUIDToUpdateAfterTranscription;
- (PQLConnection)db;
- (id)_initWithPath:(id)a3 domainName:(id)a4;
- (id)_initializeDatabaseAt:(id)a3 withFlags:(int)a4 error:(id *)a5;
- (id)description;
- (id)fileMetadataForPath:(id)a3 fetchXattrs:(BOOL)a4 error:(id *)a5;
- (unint64_t)countAssetsWithNilSignature:(id *)a3;
- (unint64_t)countFiles:(id *)a3;
- (unint64_t)countFilesMarkedAsDeleted:(id *)a3;
- (void)dealloc;
- (void)setVolumeUUIDToUpdateAfterTranscription:(id)a3;
@end

@implementation MBFileListDB

+ (id)openDatabaseIn:(id)a3 commitID:(id)a4 domainName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  v14 = MBFileListDBPath(v10, (uint64_t)v11, v12);
  id v15 = [[MBFileListDB alloc] _initWithPath:v14 domainName:v12];
  if ([v15 _openWithError:a6]) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  double v17 = CFAbsoluteTimeGetCurrent();
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = a1;
    __int16 v22 = 2048;
    double v23 = v17 - Current;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Opened %@ in %.3fs", buf, 0x16u);
    _MBLog();
  }

  return v16;
}

+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 domainName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  v14 = MBFileListDBPath(v10, (uint64_t)v11, v12);
  id v15 = [[MBFileListDB alloc] _initWithPath:v14 domainName:v12];
  id v26 = 0;
  unsigned __int8 v16 = [v15 _openOrCreateWithError:&v26];
  id v17 = v26;
  v18 = v17;
  if (v16)
  {
LABEL_2:
    id v19 = v15;
    goto LABEL_14;
  }
  v20 = [v17 domain];
  if ([v20 isEqualToString:PQLSqliteErrorDomain])
  {
    if ([v18 code] == (id)11)
    {

      goto LABEL_10;
    }
    BOOL v21 = [v18 code] == (id)26;

    if (v21)
    {
LABEL_10:
      [v15 close:0];
      __int16 v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v14;
        __int16 v29 = 2112;
        double v30 = *(double *)&v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Invalid FileList database at %@, deleting it and trying again: %@", buf, 0x16u);
        _MBLog();
      }

      unlink((const char *)[v14 fileSystemRepresentation]);
      if ([v15 _openOrCreateWithError:a6]) {
        goto LABEL_2;
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (a6)
  {
    id v19 = 0;
    *a6 = v18;
    goto LABEL_14;
  }
LABEL_13:
  id v19 = 0;
LABEL_14:

  double v23 = CFAbsoluteTimeGetCurrent();
  v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = a1;
    __int16 v29 = 2048;
    double v30 = v23 - Current;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Opened/created %@ in %.3fs", buf, 0x16u);
    _MBLog();
  }

  return v19;
}

- (id)_initWithPath:(id)a3 domainName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBFileListDB;
  v9 = [(MBFileListDB *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_domainName, a4);
    db = v10->_db;
    v10->_db = 0;
  }
  return v10;
}

- (BOOL)_openWithError:(id *)a3
{
  v5 = +[NSFileManager defaultManager];
  v6 = [(MBFileListDB *)self path];
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [(MBFileListDB *)self path];
    v9 = [(MBFileListDB *)self _initializeDatabaseAt:v8 withFlags:2 error:a3];
    db = self->_db;
    self->_db = v9;

    return self->_db != 0;
  }
  else
  {
    if (a3)
    {
      id v12 = [(MBFileListDB *)self path];
      *a3 = +[MBError errorWithCode:4 path:v12 format:@"Database not found"];
    }
    return 0;
  }
}

- (BOOL)_openOrCreateWithError:(id *)a3
{
  v5 = [(MBFileListDB *)self path];
  v6 = [v5 stringByDeletingLastPathComponent];

  unsigned __int8 v7 = +[NSFileManager defaultManager];
  v15[0] = NSFileOwnerAccountName;
  v15[1] = NSFileGroupOwnerAccountName;
  v16[0] = @"mobile";
  v16[1] = @"mobile";
  id v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  unsigned int v9 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:a3];

  if (v9)
  {
    id v10 = [(MBFileListDB *)self path];
    id v11 = [(MBFileListDB *)self _initializeDatabaseAt:v10 withFlags:6 error:a3];
    db = self->_db;
    self->_db = v11;

    BOOL v13 = self->_db != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_initializeDatabaseAt:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (!v8) {
    __assert_rtn("-[MBFileListDB _initializeDatabaseAt:withFlags:error:]", "MBFileListDB.m", 153, "path");
  }
  unsigned int v9 = v8;
  id v10 = +[NSURL fileURLWithPath:v8];
  id v11 = objc_opt_new();
  if ([v11 openAtURL:v10 withFlags:v6 error:a5])
  {
    id v28 = v10;
    __int16 v29 = a5;
    CFStringRef v36 = @"CREATE TABLE IF NOT EXISTS FileMetadata (relativePath TEXT NOT NULL PRIMARY KEY, inode INTEGER NOT NULL, size INTEGER NOT NULL, birth INTEGER NOT NULL, modified INTEGER NOT NULL, statusChanged INTEGER NOT NULL, userID INTEGER NOT NULL, groupID INTEGER NOT NULL, mode INTEGER NOT NULL, flags INTEGER NOT NULL, protectionClass INTEGER NOT NULL, xattrs BLOB);";
    v27 = +[NSArray arrayWithObjects:&v36 count:1];
    id v26 = +[MBPQLSchemaUpgrade upgradeWithVersion:1 shouldVacuum:0 statements:v27];
    v37[0] = v26;
    v35[0] = @"CREATE INDEX IF NOT EXISTS FileMetadataInodeIndex ON FileMetadata (inode);";
    v35[1] = @"CREATE TABLE IF NOT EXISTS SymlinkTargets (inode INTEGER NOT NULL PRIMARY KEY, targetPath TEXT NOT NULL);";
    v25 = +[NSArray arrayWithObjects:v35 count:2];
    id v12 = +[MBPQLSchemaUpgrade upgradeWithVersion:2 shouldVacuum:0 statements:v25];
    v37[1] = v12;
    v34[0] = @"CREATE TABLE IF NOT EXISTS Assets (inode INTEGER NOT NULL PRIMARY KEY, genCount INTEGER NOT NULL, recordIDSuffix TEXT, assetType INTEGER NOT NULL, compressionMethod INTEGER NOT NULL, encryptionKey BLOB, assetSignature BLOB, assetSize INTEGER NOT NULL);";
    v34[1] = @"CREATE INDEX IF NOT EXISTS AssetSignatureIsNull ON Assets (assetSignature) WHERE assetSignature IS NULL";
    BOOL v13 = +[NSArray arrayWithObjects:v34 count:2];
    v14 = +[MBPQLSchemaUpgrade upgradeWithVersion:3 shouldVacuum:0 statements:v13];
    v37[2] = v14;
    CFStringRef v33 = @"CREATE TABLE IF NOT EXISTS Properties(key TEXT NOT NULL PRIMARY KEY, value BLOB);";
    id v15 = +[NSArray arrayWithObjects:&v33 count:1];
    unsigned __int8 v16 = +[MBPQLSchemaUpgrade upgradeWithVersion:4 shouldVacuum:0 statements:v15];
    v37[3] = v16;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100243834;
    v30[3] = &unk_100416080;
    v30[4] = self;
    id v17 = +[MBPQLSchemaUpgrade upgradeWithVersion:5 shouldVacuum:0 upgradeBlock:v30];
    v37[4] = v17;
    v18 = +[NSArray arrayWithObjects:v37 count:5];
    unsigned int v19 = [v11 performSchemaUpgrades:v18 isReadOnly:0 error:v29];

    if (!v19)
    {
      id v20 = 0;
      goto LABEL_7;
    }
    if ([v11 setupPragmas])
    {
      id v20 = v11;
LABEL_7:
      id v10 = v28;
      goto LABEL_14;
    }
    id v10 = v28;
    if (v29)
    {
      *__int16 v29 = [v11 lastError];
    }
    BOOL v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = [v11 lastError];
      *(_DWORD *)buf = 138412290;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to setup pragmas: %@", buf, 0xCu);

      v24 = [v11 lastError];
      _MBLog();
    }
  }
  id v20 = 0;
LABEL_14:

  return v20;
}

- (void)dealloc
{
  if (self->_db)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      id v8 = path;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      v5 = self->_path;
      _MBLog();
    }
  }
  -[MBFileListDB close:](self, "close:", 0, v5);
  v6.receiver = self;
  v6.super_class = (Class)MBFileListDB;
  [(MBFileListDB *)&v6 dealloc];
}

- (BOOL)close:(id *)a3
{
  v5 = self->_db;
  if (v5)
  {
    db = self->_db;
    self->_db = 0;

    double Current = CFAbsoluteTimeGetCurrent();
    id v16 = 0;
    unsigned __int8 v8 = [(PQLConnection *)v5 close:&v16];
    id v9 = v16;
    if (v8)
    {
      int v10 = 0;
    }
    else
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = self;
        __int16 v19 = 2112;
        double v20 = *(double *)&v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to close %@: %@", buf, 0x16u);
        _MBLog();
      }

      if (a3) {
        *a3 = v9;
      }
      int v10 = 1;
    }

    double v13 = CFAbsoluteTimeGetCurrent();
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 2048;
      double v20 = v13 - Current;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Closed %@ in %.3fs", buf, 0x16u);
      _MBLog();
    }

    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_setPropertyValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return [(PQLConnection *)self->_db executeWithError:a5, @"INSERT OR REPLACE INTO Properties (key, value) VALUES (%@, %@)", a4, a3 sql];
}

- (BOOL)_removePropertyValueForKey:(id)a3 error:(id *)a4
{
  return [(PQLConnection *)self->_db executeWithError:a4, @"DELETE FROM Properties WHERE key = %@", a3 sql];
}

- (BOOL)_fetchPropertyValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(MBFileListDB *)self db];
  LOBYTE(a5) = [v9 fetchObjectOfClass:objc_opt_class(), a3, a5, @"SELECT value FROM Properties WHERE key = %@", v8 outObject error sql];

  return (char)a5;
}

+ (id)_fileMetadataForPath:(id)a3 fetchXattrs:(BOOL)a4 db:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = v10;
  if (v8) {
    CFStringRef v12 = @"SELECT FileMetadata.inode, FileMetadata.size, FileMetadata.birth, FileMetadata.modified, FileMetadata.statusChanged, FileMetadata.userID, FileMetadata.groupID, FileMetadata.mode, FileMetadata.flags, FileMetadata.protectionClass, FileMetadata.xattrs, Assets.genCount, recordIDSuffix, encryptionKey, compressionMethod, assetType, assetSize, assetSignature FROM FileMetadata LEFT JOIN Assets ON FileMetadata.inode = Assets.inode WHERE relativePath = %@;";
  }
  else {
    CFStringRef v12 = @"SELECT FileMetadata.inode, FileMetadata.size, FileMetadata.birth, FileMetadata.modified, FileMetadata.statusChanged, FileMetadata.userID, FileMetadata.groupID, FileMetadata.mode, FileMetadata.flags, FileMetadata.protectionClass, IIF(FileMetadata.xattrs IS NULL, 0, 1), Assets.genCount, recordIDSuffix, encryptionKey, compressionMethod, assetType, assetSize, assetSignature FROM FileMetadata LEFT JOIN Assets ON FileMetadata.inode = Assets.inode WHERE relativePath = %@;";
  }
  id v13 = objc_msgSend(v10, "fetch:", v12, v9);
  if ([v13 next])
  {
    unsigned int v28 = 0;
    uint64_t v27 = 0;
    long long v26 = 0u;
    memset(v25, 0, sizeof(v25));
    [v13 getNode:v25 fromIndex:&v28];
    if (v8)
    {
      v14 = [v13 xattrsFromIndex:&v28];
      HIBYTE(v27) = HIBYTE(v27) & 0xFB | (4 * (v14 != 0));
    }
    else
    {
      v14 = 0;
      if ([v13 BOOLAtIndex:v28]) {
        char v18 = 4;
      }
      else {
        char v18 = 0;
      }
      HIBYTE(v27) = HIBYTE(v27) & 0xFB | v18;
      ++v28;
    }
    int v19 = WORD2(v27) & 0xF000;
    if (v19 == 40960)
    {
      id v24 = 0;
      unsigned int v22 = objc_msgSend(v11, "fetchObjectOfClass:outObject:error:sql:", objc_opt_class(), &v24, a6, @"SELECT targetPath FROM SymlinkTargets WHERE inode = %llu", (void)v26);
      id v21 = v24;
      double v20 = 0;
      id v17 = 0;
      if (!v22) {
        goto LABEL_21;
      }
    }
    else if (v19 == 0x8000)
    {
      ++v28;
      DWORD2(v26) = objc_msgSend(v13, "intAtIndex:");
      double v20 = [v13 assetMetadataFromIndex:&v28];
      id v21 = 0;
    }
    else
    {
      id v21 = 0;
      double v20 = 0;
    }
    id v17 = +[MBFileMetadata fileMetadataFromNode:v25 xattrs:v14 linkTarget:v21 assetMetadata:v20 error:a6];

LABEL_21:
    goto LABEL_22;
  }
  id v15 = [v11 lastError];
  id v16 = [v15 excludingNotFound];

  if (a6) {
    *a6 = v16;
  }

  id v17 = 0;
LABEL_22:

  return v17;
}

- (BOOL)fetchAssetMetdataWithInode:(unint64_t)a3 genCount:(unsigned int)a4 outAssetMetadata:(id *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  BOOL v11 = self->_db;
  if (!v11) {
    __assert_rtn("-[MBFileListDB fetchAssetMetdataWithInode:genCount:outAssetMetadata:error:]", "MBFileListDB.m", 322, "db");
  }
  if (!a5) {
    __assert_rtn("-[MBFileListDB fetchAssetMetdataWithInode:genCount:outAssetMetadata:error:]", "MBFileListDB.m", 323, "outAssetMetadata");
  }
  CFStringRef v12 = v11;
  id v13 = [(PQLConnection *)self->_db fetch:@"SELECT recordIDSuffix, encryptionKey, compressionMethod, assetType, assetSize, assetSignature FROM Assets WHERE inode = %llu AND genCount = %d", a3, v8];
  if ([v13 next])
  {
    int v18 = 0;
    *a5 = [v13 assetMetadataFromIndex:&v18];
    BOOL v14 = 1;
  }
  else
  {
    id v15 = [(PQLConnection *)v12 lastError];
    id v16 = [v15 excludingNotFound];

    BOOL v14 = v16 == 0;
    if (v16)
    {
      if (a6) {
        *a6 = v16;
      }
    }
    else
    {
      *a5 = 0;
    }
  }
  return v14;
}

- (BOOL)fetchEncryptionKeyForInode:(unint64_t)a3 outEncryptionKey:(id *)a4 error:(id *)a5
{
  id v9 = self->_db;
  if (!v9) {
    __assert_rtn("-[MBFileListDB fetchEncryptionKeyForInode:outEncryptionKey:error:]", "MBFileListDB.m", 345, "db");
  }
  if (!a4) {
    __assert_rtn("-[MBFileListDB fetchEncryptionKeyForInode:outEncryptionKey:error:]", "MBFileListDB.m", 346, "outEncryptionKey");
  }
  id v10 = v9;
  id v11 = [(PQLConnection *)self->_db fetch:@"SELECT encryptionKey FROM Assets WHERE inode = %llu", a3];
  if ([v11 next])
  {
    *a4 = [v11 dataAtIndex:0];
    BOOL v12 = 1;
  }
  else
  {
    id v13 = [(PQLConnection *)v10 lastError];
    BOOL v14 = [v13 excludingNotFound];

    BOOL v12 = v14 == 0;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
    }
    else
    {
      *a4 = 0;
    }
  }
  return v12;
}

- (id)fileMetadataForPath:(id)a3 fetchXattrs:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_100244354;
  id v21 = sub_100244364;
  id v22 = 0;
  db = self->_db;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10024436C;
  v13[3] = &unk_100416F60;
  id v15 = &v17;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  BOOL v16 = a4;
  if ([(PQLConnection *)db groupInTransaction:v13 error:a5]) {
    id v11 = (id)v18[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)_fetchVolumeUUID:(id *)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100244354;
  id v14 = sub_100244364;
  id v15 = 0;
  id v6 = [(PQLConnection *)self->_db fetch:@"SELECT value FROM Properties WHERE key = %@", @"volumeUUID"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100244524;
  v9[3] = &unk_100416F88;
  v9[4] = &v10;
  unsigned __int8 v7 = [v6 enumerateWithError:a4 block:v9];
  if (v7) {
    *a3 = (id) v11[5];
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)_markInProgressVolumeTransition:(id *)a3
{
  char v10 = 1;
  v5 = +[NSData dataWithBytes:&v10 length:1];
  BOOL v6 = [(MBFileListDB *)self _setPropertyValue:v5 forKey:@"volumeTransitionIsInProgress" error:a3];
  if (v6)
  {
    unsigned __int8 v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      domainName = self->_domainName;
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = domainName;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Marked in progress volume transition for %@", buf, 0xCu);
      _MBLog();
    }
  }
  return v6;
}

- (BOOL)_clearInProgressVolumeTransition:(id *)a3
{
  return [(MBFileListDB *)self _removePropertyValueForKey:@"volumeTransitionIsInProgress" error:a3];
}

- (BOOL)_setVolumeUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MBFileListDB *)self _clearInProgressVolumeTransition:a4]
    && [(PQLConnection *)self->_db executeWithError:a4, @"INSERT OR REPLACE INTO Properties (key, value) VALUES (%@, %@)", @"volumeUUID", v6 sql])
  {
    unsigned __int8 v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      domainName = self->_domainName;
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = domainName;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated backupVolumeUUID for %@ to %@", buf, 0x16u);
      _MBLog();
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)canReuseAssetsAcrossVolumeTransition:(BOOL *)a3 isResuming:(BOOL *)a4 error:(id *)a5
{
  if (!a3) {
    __assert_rtn("-[MBFileListDB canReuseAssetsAcrossVolumeTransition:isResuming:error:]", "MBFileListDB.m", 416, "outCanReuseAssets");
  }
  if (!a4) {
    __assert_rtn("-[MBFileListDB canReuseAssetsAcrossVolumeTransition:isResuming:error:]", "MBFileListDB.m", 417, "outIsResuming");
  }
  id v22 = 0;
  unsigned int v9 = -[MBFileListDB _fetchPropertyValue:forKey:error:](self, "_fetchPropertyValue:forKey:error:", &v22, @"volumeTransitionIsInProgress");
  id v10 = v22;
  id v11 = v10;
  if (!v9)
  {
    BOOL v17 = 0;
    goto LABEL_11;
  }
  if (!v10)
  {
    uint64_t v19 = [(MBFileListDB *)self db];
    id v20 = objc_msgSend(v19, "fetchCountWithError:sql:", a5, @"SELECT COUNT(*) FROM FileMetadata WHERE (inode & %llu) != 0", 0x8000000000000000);

    if (!v20)
    {
      BOOL v13 = 0;
      BOOL v16 = 1;
      goto LABEL_9;
    }
    BOOL v17 = 0;
    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
    uint64_t v12 = MBGetDefaultLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = 0;
      goto LABEL_8;
    }
    id v21 = [(MBFileListDB *)self domainName];
    *(_DWORD *)buf = 138412546;
    id v24 = v21;
    __int16 v25 = 2048;
    id v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Cannot perform volume transition for %@ - found %llu unsupported inodes", buf, 0x16u);

    id v15 = [(MBFileListDB *)self domainName];
    _MBLog();
    BOOL v13 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = MBGetDefaultLog();
  BOOL v13 = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v14 = [(MBFileListDB *)self domainName];
    *(_DWORD *)buf = 138412290;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Can perform volume transition for %@ - in progress marker detected", buf, 0xCu);

    id v15 = [(MBFileListDB *)self domainName];
    _MBLog();
LABEL_7:
  }
LABEL_8:

  BOOL v16 = v13;
LABEL_9:
  *a4 = v13;
  *a3 = v16;
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_adjustInodesForVolumeTransition:(id *)a3
{
  if (![(PQLConnection *)self->_db executeWithError:a3, @"UPDATE FileMetadata SET inode = (inode | %llu)", 0x8000000000000000 sql]|| ![(PQLConnection *)self->_db executeWithError:a3, @"UPDATE Assets SET inode = (inode | %llu)", 0x8000000000000000 sql]|| ![(PQLConnection *)self->_db executeWithError:a3, @"UPDATE SymlinkTargets SET inode = (inode | %llu)", 0x8000000000000000 sql])
  {
    return 0;
  }
  return [(MBFileListDB *)self _markInProgressVolumeTransition:a3];
}

- (BOOL)beginTranscriptionForVolumeUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBFileListDB beginTranscriptionForVolumeUUID:error:]", "MBFileListDB.m", 471, "volumeUUID");
  }
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100244BE8;
  v11[3] = &unk_100416FB0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  unsigned __int8 v9 = [(PQLConnection *)db groupInTransaction:v11 error:a4];

  return v9;
}

- (BOOL)isTransitioningVolumes
{
  v2 = [(MBFileListDB *)self volumeUUIDToUpdateAfterTranscription];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_markAllFilesAsDeleted:(id *)a3
{
  unsigned int v5 = [(PQLConnection *)self->_db executeWithError:a3 sql:@"CREATE TEMPORARY TABLE MetadataToDelete (relativePath PRIMARY KEY);"];
  if (v5)
  {
    db = self->_db;
    LOBYTE(v5) = [(PQLConnection *)db executeWithError:a3 sql:@"INSERT OR IGNORE INTO MetadataToDelete (relativePath) SELECT relativePath FROM FileMetadata;"];
  }
  return v5;
}

- (BOOL)markAllFilesAsDeleted:(id *)a3
{
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100245000;
  v5[3] = &unk_100416080;
  v5[4] = self;
  return [(PQLConnection *)db groupInTransaction:v5 error:a3];
}

- (BOOL)markFileAsPresent:(id)a3 error:(id *)a4
{
  id v6 = self->_db;
  unsigned __int8 v7 = -[PQLConnection execute:](v6, "execute:", @"DELETE FROM MetadataToDelete WHERE relativePath = %@;",
                          a3);
  BOOL v8 = v7;
  if (a4 && (v7 & 1) == 0)
  {
    *a4 = [(PQLConnection *)v6 lastError];
  }

  return v8;
}

- (BOOL)setFileMetadata:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  db = self->_db;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100245150;
  v14[3] = &unk_100416FB0;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = [(PQLConnection *)db groupInTransaction:v14 error:a5];

  return (char)a5;
}

- (unint64_t)countFilesMarkedAsDeleted:(id *)a3
{
  return [(PQLConnection *)self->_db fetchCountWithError:a3 sql:@"SELECT COUNT(*) FROM MetadataToDelete;"];
}

- (unint64_t)countFiles:(id *)a3
{
  return [(PQLConnection *)self->_db fetchCountWithError:a3 sql:@"SELECT COUNT(*) FROM FileMetadata;"];
}

- (unint64_t)countAssetsWithNilSignature:(id *)a3
{
  return [(PQLConnection *)self->_db fetchCountWithError:a3, @"SELECT COUNT(*) FROM Assets WHERE assetSignature IS NULL AND assetType != %llu", 4 sql];
}

- (BOOL)_truncateDeletedFiles:(id *)a3
{
    && [(PQLConnection *)self->_db executeWithError:a3, @"DELETE FROM SymlinkTargets WHERE inode NOT IN(SELECT inode FROM FileMetadata WHERE (mode & %d) == %d)", 61440, 40960 sql])
  {
    return [(PQLConnection *)self->_db executeWithError:a3, @"DELETE FROM Assets WHERE inode NOT IN(SELECT inode FROM FileMetadata WHERE (mode & %d) == %d)", 61440, 0x8000 sql];
  }
  else
  {
    return 0;
  }
}

- (BOOL)finishTranscription:(id *)a3
{
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100245598;
  v5[3] = &unk_100416080;
  v5[4] = self;
  return [(PQLConnection *)db groupInTransaction:v5 error:a3];
}

- (BOOL)enumerateSymlinkTargets:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(PQLConnection *)self->_db fetch:@"SELECT inode, targetPath FROM SymlinkTargets;"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002456E8;
  v10[3] = &unk_100413728;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = [v7 enumerateWithError:a3 block:v10];

  return (char)a3;
}

- (BOOL)enumerateFilesWithDomain:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PQLConnection *)self->_db fetch:@"SELECT inode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath FROM FileMetadata;"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100245850;
  v14[3] = &unk_100416FD8;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a4) = [v10 enumerateWithError:a4 block:v14];

  return (char)a4;
}

- (BOOL)enumerateFileMetadataWithError:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = self->_db;
  id v8 = [(PQLConnection *)v7 fetch:@"SELECT relativePath FROM FileMetadata ORDER BY relativePath ASC"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002459B4;
  v12[3] = &unk_100417000;
  v12[4] = self;
  BOOL v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v12];

  return (char)a3;
}

- (BOOL)enumerateAssetRecordIdSuffixForNonEmptyFiles:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = self->_db;
  id v8 = [(PQLConnection *)v7 fetch:@"SELECT recordIDSuffix FROM FileMetadata INNER JOIN Assets ON FileMetadata.inode = Assets.inode WHERE assetType != %llu", 4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100245B20;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)computeAssetRecordIDChecksumWithPrefix:(id)a3 checksum:(int64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v9 = [(PQLConnection *)self->_db fetch:@"SELECT recordIDSuffix FROM Assets WHERE assetType != %llu", 4];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100245CB8;
  v15[3] = &unk_100417028;
  id v10 = v8;
  id v16 = v10;
  BOOL v17 = &v18;
  unsigned __int8 v11 = [v9 enumerateWithError:a5 block:v15];
  BOOL v12 = v11;
  if (a4) {
    unsigned __int8 v13 = v11;
  }
  else {
    unsigned __int8 v13 = 0;
  }
  if (v13) {
    *a4 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (BOOL)fetchFileListStats:(id *)a3 error:(id *)a4
{
  if (!a3) {
    return 1;
  }
  a3->var4 = 0;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100245DD0;
  v6[3] = &unk_100417068;
  v6[4] = a3;
  return [(PQLConnection *)db groupInTransaction:v6 error:a4];
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  unsigned int v5 = [(MBFileListDB *)self path];
  id v6 = +[NSString stringWithFormat:@"<%s: %p path=%@>", Name, self, v5];;

  return v6;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (PQLConnection)db
{
  return self->_db;
}

- (NSUUID)volumeUUIDToUpdateAfterTranscription
{
  return self->_volumeUUIDToUpdateAfterTranscription;
}

- (void)setVolumeUUIDToUpdateAfterTranscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUIDToUpdateAfterTranscription, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end