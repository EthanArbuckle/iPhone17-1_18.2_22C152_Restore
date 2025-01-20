@interface MBRestorePlanDB
+ (id)_createSchemaStatements;
+ (id)createDatabaseAt:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6;
+ (id)openDatabaseAt:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6;
- (BOOL)_addRemainingProgress:(id)a3 forDomainID:(unint64_t)a4 domainName:(id)a5 readOnlyDB:(id)a6 error:(id *)a7;
- (BOOL)_ingest:(id)a3 into:(id)a4 error:(id *)a5;
- (BOOL)_recordAssetState:(unint64_t)a3 inode:(unint64_t)a4 domainID:(unint64_t)a5 failure:(id)a6 restoreType:(int)a7 error:(id *)a8;
- (BOOL)_recordRestorableState:(unint64_t)a3 restorableID:(unint64_t)a4 domainID:(unint64_t)a5 inode:(unint64_t)a6 restoreType:(int)a7 error:(id *)a8;
- (BOOL)_skipDomainID:(unint64_t)a3 into:(id)a4 error:(id *)a5;
- (BOOL)_withReadOnlyDB:(id *)a3 accessor:(id)a4;
- (BOOL)addRemainingProgress:(id)a3 forDomainNames:(id)a4 error:(id *)a5;
- (BOOL)atcRestorableForAbsolutePath:(id)a3 error:(id *)a4 domainProvider:(id)a5 restorableAccessor:(id)a6;
- (BOOL)close:(id *)a3;
- (BOOL)enumerateBundleIDsWithPlaceholderIPAsWithError:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateDomainNamesByTotalAssetSize:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateDomainNamesPendingRestoreWithError:(id *)a3 enumerator:(id)a4;
- (BOOL)enumerateRestoreFailuresOfType:(int)a3 isFatal:(BOOL)a4 error:(id *)a5 enumerator:(id)a6;
- (BOOL)fetchPendingRestoreSize:(int64_t *)a3 remainingFileCount:(int64_t *)a4 totalFileCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)incrementPriorityOfRestorableForDomain:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (BOOL)ingestFileListForDomainNamed:(id)a3 error:(id *)a4;
- (BOOL)isPopulated;
- (BOOL)skipDomains:(id)a3 error:(id *)a4;
- (NSString)path;
- (NSString)restoreSnapshotsDirectoryRoot;
- (id)_atcPathsByDomainNameForPaths:(id)a3 error:(id *)a4;
- (id)_failuresFor:(int)a3 isFatal:(BOOL)a4 domainsNamesOut:(id)a5 error:(id *)a6;
- (id)_initWithPath:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6;
- (id)_upgradeFileListDatabaseForDomainName:(id)a3 error:(id *)a4;
- (id)_validRWDatabase:(id *)a3;
- (id)atcRestorePlansForAbsolutePaths:(id)a3 domainProvider:(id)a4 error:(id *)a5;
- (id)description;
- (id)planForDomain:(id)a3 restoreType:(int)a4 error:(id *)a5;
- (id)restoreVerificationSummary:(id *)a3;
- (unint64_t)_domainIDForDomainName:(id)a3 inDB:(id)a4 error:(id *)a5;
- (unint64_t)_verificationStateForDomainID:(unint64_t)a3 error:(id *)a4;
- (unint64_t)fatalErrorCount:(id *)a3;
- (void)dealloc;
@end

@implementation MBRestorePlanDB

- (id)_failuresFor:(int)a3 isFatal:(BOOL)a4 domainsNamesOut:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  +[NSMutableArray array];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10016184C;
  v15[3] = &unk_100414AF8;
  id v16 = v10;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v11;
  id v12 = v10;
  LODWORD(a6) = [(MBRestorePlanDB *)self enumerateRestoreFailuresOfType:v8 isFatal:v7 error:a6 enumerator:v15];

  if (a6) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)createDatabaseAt:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    __assert_rtn("+[MBRestorePlanDB createDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 253, "path");
  }
  if (!v10) {
    __assert_rtn("+[MBRestorePlanDB createDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 254, "restoreSnapshotsDir");
  }
  id v12 = v11;
  if (!v11) {
    __assert_rtn("+[MBRestorePlanDB createDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 255, "snapshotUUID");
  }
  if (!a6) {
    __assert_rtn("+[MBRestorePlanDB createDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 256, "error");
  }
  id v13 = +[NSFileManager defaultManager];
  unsigned int v14 = objc_msgSend(v13, "mb_moveAsideAndMarkPurgeableDBFilesAtPath:error:", v9, a6);

  if (v14) {
    id v15 = [[MBRestorePlanDB alloc] _initWithPath:v9 restoreSnapshotsDir:v10 snapshotUUID:v12 error:a6];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (id)openDatabaseAt:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    __assert_rtn("+[MBRestorePlanDB openDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 266, "path");
  }
  if (!v10) {
    __assert_rtn("+[MBRestorePlanDB openDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 267, "restoreSnapshotsDir");
  }
  id v12 = v11;
  if (!v11) {
    __assert_rtn("+[MBRestorePlanDB openDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 268, "snapshotUUID");
  }
  if (!a6) {
    __assert_rtn("+[MBRestorePlanDB openDatabaseAt:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 269, "error");
  }
  id v13 = +[NSFileManager defaultManager];
  unsigned __int8 v14 = [v13 fileExistsAtPath:v9];

  if (v14)
  {
    id v15 = [[MBRestorePlanDB alloc] _initWithPath:v9 restoreSnapshotsDir:v10 snapshotUUID:v12 error:a6];
  }
  else
  {
    +[MBError errorWithCode:4 path:v9 format:@"No restore plan database found"];
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_initWithPath:(id)a3 restoreSnapshotsDir:(id)a4 snapshotUUID:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11) {
    __assert_rtn("-[MBRestorePlanDB _initWithPath:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 280, "path");
  }
  if (!v12) {
    __assert_rtn("-[MBRestorePlanDB _initWithPath:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 281, "restoreSnapshotsDir");
  }
  unsigned __int8 v14 = v13;
  if (!v13) {
    __assert_rtn("-[MBRestorePlanDB _initWithPath:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 282, "snapshotUUID");
  }
  if (!a6) {
    __assert_rtn("-[MBRestorePlanDB _initWithPath:restoreSnapshotsDir:snapshotUUID:error:]", "MBRestorePlanDB.m", 283, "error");
  }
  v26.receiver = self;
  v26.super_class = (Class)MBRestorePlanDB;
  id v15 = [(MBRestorePlanDB *)&v26 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_restoreSnapshotsDirectoryRoot, a4);
    objc_storeStrong((id *)&v16->_snapshotUUID, a5);
    objc_storeStrong((id *)&v16->_path, a3);
    id v17 = [_RWPlanDB alloc];
    v18 = [(id)objc_opt_class() _createSchemaStatements];
    v19 = +[MBPQLSchemaUpgrade upgradeWithVersion:1 shouldVacuum:0 statements:v18];
    v27 = v19;
    v20 = +[NSArray arrayWithObjects:&v27 count:1];
    v21 = [(MBSQLiteDB *)v17 initWithPath:v11 readOnly:0 shouldDeleteOnFailureToOpen:0 usePQLBatching:0 schemaCurrentVersion:1 schemaMinDatabaseVersionForUpgrade:1 error:a6 schemaUpgrades:v20];
    readWriteDB = v16->_readWriteDB;
    v16->_readWriteDB = v21;

    v23 = v16->_readWriteDB;
    if (!v23
      || (id v24 = [(MBSQLiteDB *)v23 fetchCountWithError:a6 sql:@"\nSELECT COUNT(*)\n  FROM Restorables"], v16->_restorableCount = (unint64_t)v24, v24 == (id)0x7FFFFFFFFFFFFFFFLL))
    {

      id v16 = 0;
    }
  }

  return v16;
}

+ (id)_createSchemaStatements
{
  v4[0] = @"\nPRAGMA foreign_keys = ON;";
  v4[1] = @"\nCREATE TABLE IF NOT EXISTS Domains (\ndomainID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \ndomain TEXT NOT NULL UNIQUE, \ntotalAssetRecords INTEGER NOT NULL, \ntotalAssetBytes INTEGER NOT NULL, \ntotalXattrBytes INTEGER NOT NULL, \ntotalRegularAssets INTEGER NOT NULL, \ntotalEmptyAssets INTEGER NOT NULL, \ntotalDBAssets INTEGER NOT NULL, \ntotalEncryptedAssets INTEGER NOT NULL, \ntotalItems INTEGER NOT NULL, \ntotalDirs INTEGER NOT NULL, \ntotalSymlinks INTEGER NOT NULL, \ntotalZeroByteFiles INTEGER NOT NULL, \ntotalAssetFiles INTEGER NOT NULL, \ntotalXattrItems INTEGER NOT NULL, \ntotalHardlinks INTEGER NOT NULL, \ntotalATCItems INTEGER NOT NULL, \nrootPath TEXT, \nengineState INTEGER NOT NULL, \nverificationStatus INTEGER NOT NULL\n);";
  v4[2] = @"\nCREATE INDEX IF NOT EXISTS DomainIdx ON Domains(\ndomain\n);";
  v4[3] = @"\nCREATE TABLE IF NOT EXISTS Restorables (\nrestorableID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \ndomainID INTEGER NOT NULL, \ntype INTEGER NOT NULL, \nrelativePath TEXT NOT NULL, \ninode INTEGER NOT NULL, size INTEGER NOT NULL, birth INTEGER NOT NULL, modified INTEGER NOT NULL, statusChanged INTEGER NOT NULL, userID INTEGER NOT NULL, groupID INTEGER NOT NULL, mode INTEGER NOT NULL, flags INTEGER NOT NULL, protectionClass INTEGER NOT NULL, \nxattrs BLOB, \npriority INTEGER NOT NULL, \nrestoreState INTEGER NOT NULL, \nabsolutePath TEXT, \nFOREIGN KEY (domainID) REFERENCES Domains(domainID)\n);";
  v4[4] = @"\nCREATE INDEX IF NOT EXISTS RestorableStateIdx ON Restorables(\nrestoreState, domainID, type, relativePath\n);";
  v4[5] = @"\nCREATE INDEX IF NOT EXISTS RestorableDomainInodeIdx ON Restorables(\ndomainID, inode\n);";
  v4[6] = @"\nCREATE TABLE IF NOT EXISTS RestorableSymlinkTargets (\ndomainID INTEGER NOT NULL, \ninode INTEGER NOT NULL, \ntargetPath TEXT NOT NULL, \nlinkCount INTEGER NOT NULL, \nPRIMARY KEY (domainID, inode), \nFOREIGN KEY (inode) REFERENCES Restorables (inode), \nFOREIGN KEY (domainID) REFERENCES Domains(domainID)\n);";
  v4[7] = @"\nCREATE TABLE IF NOT EXISTS RestorableAssets (\ndomainID INTEGER NOT NULL, \ninode INTEGER NOT NULL, \ngenCount INTEGER NOT NULL, \nrecordIDSuffix TEXT, \ncompressionMethod INTEGER NOT NULL, \nassetType INTEGER NOT NULL, \nassetSize INTEGER NOT NULL, \nassetSignature BLOB, \nencryptionKey BLOB, \nlinkCount INTEGER NOT NULL, \nassetState INTEGER NOT NULL, \nPRIMARY KEY (domainID, inode), \nFOREIGN KEY (inode) REFERENCES Restorables (inode), \nFOREIGN KEY (domainID) REFERENCES Domains(domainID)\n);";
  v4[8] = @"\nCREATE INDEX IF NOT EXISTS RestoreAssetStateIdx ON RestorableAssets(\nassetState, domainID, inode\n);";
  v4[9] = @"\nCREATE TABLE IF NOT EXISTS Errors (\nerrorID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \ncount INTEGER NOT NULL, \ntimestamp REAL NOT NULL, \nerrorDomain TEXT NOT NULL, \nerrorCode INTEGER NOT NULL, \ndescription TEXT NOT NULL, \ndomainID INTEGER NOT NULL, \nrestoreType INTEGER NOT NULL, \ninode INTEGER, \nrestorableID INTEGER, \nFOREIGN KEY (domainID) REFERENCES Domains(domainID), \nFOREIGN KEY (inode) REFERENCES Restorables (inode), \nFOREIGN KEY (restorableID) REFERENCES Restorables (restorableID)\n);";
  v4[10] = @"\nCREATE INDEX IF NOT EXISTS RestoreErrorIdx ON Errors (\nerrorDomain, errorCode, domainID, restoreType, inode, restorableID\n);";
  v4[11] = @"\nCREATE TABLE IF NOT EXISTS FatalErrorRelationships (\nerrorID INTEGER NOT NULL, \nparentErrorID INTEGER, \nPRIMARY KEY (errorID, parentErrorID), \nFOREIGN KEY (errorID) REFERENCES Errors (errorID), \nFOREIGN KEY (parentErrorID) REFERENCES Errors (errorID)\n);";
  v2 = +[NSArray arrayWithObjects:v4 count:12];
  return v2;
}

- (void)dealloc
{
  if (self->_readWriteDB)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = path;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "=plan= Database (%@) should be closed before dealloc", buf, 0xCu);
      v5 = self->_path;
      _MBLog();
    }

    [(MBRestorePlanDB *)self close:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)MBRestorePlanDB;
  [(MBRestorePlanDB *)&v6 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; path:%@, items:%ld>",
           objc_opt_class(),
           self,
           self->_path,
           self->_restorableCount);
}

- (BOOL)isPopulated
{
  return self->_restorableCount != 0;
}

- (BOOL)close:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_readWriteDB;
  if (v5)
  {
    readWriteDB = v4->_readWriteDB;
    v4->_readWriteDB = 0;

    objc_sync_exit(v4);
    id v11 = 0;
    unsigned __int8 v7 = [(MBSQLiteDB *)v5 close:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0)
    {
      id v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=plan= Error closing %@: %@", buf, 0x16u);
        _MBLog();
      }

      if (a3) {
        *a3 = v8;
      }
    }
  }
  else
  {
    objc_sync_exit(v4);

    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)_validRWDatabase:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB _validRWDatabase:]", "MBRestorePlanDB.m", 472, "error");
  }
  readWriteDB = self->_readWriteDB;
  if (readWriteDB)
  {
    v4 = readWriteDB;
  }
  else
  {
    *a3 = +[MBError errorWithCode:16 path:self->_path format:@"Restore plan is closed"];
    objc_super v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = *a3;
      *(_DWORD *)buf = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "=plan= Restore plan is unexpectedly closed: %@", buf, 0xCu);
      _MBLog();
    }
  }
  return readWriteDB;
}

- (BOOL)ingestFileListForDomainNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB ingestFileListForDomainNamed:error:]", "MBRestorePlanDB.m", 484, "domainName");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB ingestFileListForDomainNamed:error:]", "MBRestorePlanDB.m", 485, "error");
  }
  id v7 = v6;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=plan= Ingesting file list for %@ into %@", buf, 0x16u);
    _MBLog();
  }

  id v9 = [(MBRestorePlanDB *)self _validRWDatabase:a4];
  if (v9)
  {
    uint64_t v10 = [(MBRestorePlanDB *)self _upgradeFileListDatabaseForDomainName:v7 error:a4];
    id v11 = (void *)v10;
    if (v10 && [v9 executeWithError:a4, @"ATTACH DATABASE %@ AS %@;", v10, v7 sql])
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002B21B8;
      v19[3] = &unk_1004181E8;
      v19[4] = self;
      id v12 = v7;
      id v20 = v12;
      id v13 = v9;
      id v21 = v13;
      unsigned __int8 v14 = [v13 groupInTransaction:v19 error:a4];

      id v18 = 0;
      LOBYTE(v13) = [v13 executeWithError:&v18, @"DETACH DATABASE %@;", v12 sql];
      id v15 = v18;
      if ((v13 & 1) == 0)
      {
        id v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=plan= Error detaching file list database: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)_ingest:(id)a3 into:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBRestorePlanDB _ingest:into:error:]", "MBRestorePlanDB.m", 515, "domainName");
  }
  uint64_t v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBRestorePlanDB _ingest:into:error:]", "MBRestorePlanDB.m", 516, "readWriteDB");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB _ingest:into:error:]", "MBRestorePlanDB.m", 517, "error");
  }
  objc_msgSend(v9, "fetchObjectOfClass:error:sql:", objc_opt_class(), a5, @"\nINSERT INTO Domains (\ndomain, \nengineState, \ntotalItems, \ntotalDirs, \ntotalSymlinks, \ntotalHardlinks, \ntotalXattrItems, \ntotalZeroByteFiles, \ntotalAssetFiles, \ntotalAssetBytes, \ntotalXattrBytes, \ntotalAssetRecords, \ntotalRegularAssets, \ntotalEmptyAssets, \ntotalDBAssets, \ntotalEncryptedAssets, \ntotalATCItems, \nrootPath, \nverificationStatus\n) VALUES (%@, %u, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, NULL, %u)\nRETURNING domainID;",
    v8,
    1,
  id v11 = 1);
  id v12 = v11;
  if (!v11) {
    goto LABEL_15;
  }
  id v13 = [v11 unsignedLongLongValue];
  if (!objc_msgSend(v10, "executeWithError:sql:", a5, @"\nINSERT INTO Restorables (\ninode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \ntype, \ndomainID, \npriority, \nrestoreState\n) SELECT \ninode, size, birth, modified, statusChanged, userID, groupID, mode, flags, protectionClass, xattrs, relativePath, \nmode & %u, \n  %llu, 0, %u\n  FROM FileMetadata\n  ORDER BY relativePath;",
                        57344,
                        v13,
                        1))
    goto LABEL_15;
  id v14 = [v10 fetchCountWithError:a5 sql:@"SELECT COUNT(*) FROM Restorables;"];
  self->_restorableCount = (unint64_t)v14;
  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  if (v14)
  {
    if (objc_msgSend(v10, "executeWithError:sql:", a5, @"\nINSERT INTO RestorableSymlinkTargets (\ninode, \ntargetPath, \nlinkCount, \ndomainID\n) SELECT \ninode, targetPath, 0, %llu\n  FROM SymlinkTargets;",
                         v13)
      && objc_msgSend(v10, "executeWithError:sql:", a5, @"\nUPDATE RestorableSymlinkTargets\n  SET  linkCount = Temporary.linkCount\n FROM(\n   SELECT COUNT(*) as linkCount, domainID, inode \n   FROM Restorables\n   WHERE domainID = %llu \n   GROUP BY domainID, inode\n) AS Temporary \n WHERE RestorableSymlinkTargets.domainID = Temporary.domainID\n   AND RestorableSymlinkTargets.inode = Temporary.inode;",
                         v13)
      && objc_msgSend(v10, "executeWithError:sql:", a5, @"\nINSERT INTO RestorableAssets (\ninode, genCount, recordIDSuffix, compressionMethod, assetType, assetSize, assetSignature, \nencryptionKey, \nlinkCount, \ndomainID, \nassetState\n) SELECT \ninode, genCount, recordIDSuffix, compressionMethod, assetType, assetSize, assetSignature, \nencryptionKey, \n0, \n%llu, \nIIF(assetType == %llu, %u, %u)\n FROM Assets ORDER BY assetSize;",
                         v13,
                         4,
                         2,
                         1)
      && objc_msgSend(v10, "executeWithError:sql:", a5, @"\nUPDATE RestorableAssets\n  SET  linkCount = Temporary.linkCount\n FROM (\n   SELECT COUNT(*) as linkCount, domainID, inode \n   FROM Restorables\n   WHERE domainID = %llu\n   GROUP BY domainID, inode\n) AS Temporary \n WHERE RestorableAssets.domainID = Temporary.domainID\n   AND RestorableAssets.inode = Temporary.inode;",
                         v13)
      && objc_msgSend(v10, "executeWithError:sql:", a5, @"\nUPDATE Domains\n SET (\ntotalAssetRecords, \ntotalAssetBytes, \ntotalRegularAssets, \ntotalEmptyAssets, \ntotalDBAssets, \ntotalEncryptedAssets, \ntotalHardlinks\n) = (\n SELECT \nCOUNT(*),\nIFNULL(SUM(assetSize), 0),\nIFNULL(SUM(IIF(assetType == %llu, 1, 0)), 0),\nIFNULL(SUM(IIF(assetType == %llu, 1, 0)), 0),\nIFNULL(SUM(IIF(assetType == %llu, 1, 0)), 0),\nIFNULL(SUM(IIF(assetType == %llu, 1, 0)), 0),\nIFNULL(SUM(IIF(linkCount > 1, 1, 0)), 0)\n FROM RestorableAssets\n WHERE domainID = %llu\n) WHERE domainID = %llu;",
                         1,
                         4,
                         3,
                         2,
                         v13,
                         v13))
    {
      unsigned __int8 v15 = objc_msgSend(v10, "executeWithError:sql:", a5, @"\nUPDATE Domains\n SET (\ntotalItems, \ntotalDirs, \ntotalSymlinks, \ntotalZeroByteFiles, \ntotalAssetFiles, \ntotalXattrItems, \ntotalXattrBytes\n) = (\n SELECT \nCOUNT(*),\nIFNULL(SUM(IIF(type == %u, 1, 0)), 0),\nIFNULL(SUM(IIF(type == %u, 1, 0)), 0),\nIFNULL(SUM(IIF(type == %u AND size == 0, 1, 0)), 0),\nIFNULL(SUM(IIF(type == %u AND size != 0, 1, 0)), 0),\nIFNULL(SUM(IIF(xattrs IS NULL, 0, 1)), 0),\nIFNULL(SUM(LENGTH(xattrs)), 0)\n FROM Restorables\n WHERE domainID = %llu\n) WHERE domainID = %llu;",
                               0x4000,
                               40960,
                               0x8000,
                               0x8000,
                               v13,
                               v13);
      goto LABEL_16;
    }
LABEL_15:
    unsigned __int8 v15 = 0;
    goto LABEL_16;
  }
  unsigned __int8 v15 = 1;
LABEL_16:

  return v15;
}

- (id)_upgradeFileListDatabaseForDomainName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB _upgradeFileListDatabaseForDomainName:error:]", "MBRestorePlanDB.m", 703, "domainName");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _upgradeFileListDatabaseForDomainName:error:]", "MBRestorePlanDB.m", 704, "error");
  }
  id v7 = v6;
  id v8 = +[MBFileListDB openDatabaseIn:self->_restoreSnapshotsDirectoryRoot commitID:self->_snapshotUUID domainName:v6 error:a4];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 path];
    id v16 = 0;
    unsigned __int8 v11 = [v9 close:&v16];
    id v12 = v16;
    if (v11)
    {
      id v13 = v10;
    }
    else
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=plan= Error closing file list database %@: %@", buf, 0x16u);
        _MBLog();
      }

      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_recordRestorableState:(unint64_t)a3 restorableID:(unint64_t)a4 domainID:(unint64_t)a5 inode:(unint64_t)a6 restoreType:(int)a7 error:(id *)a8
{
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _recordRestorableState:restorableID:domainID:inode:restoreType:error:]", "MBRestorePlanDB.m", 721, "restorableID");
  }
  if (!a8) {
    __assert_rtn("-[MBRestorePlanDB _recordRestorableState:restorableID:domainID:inode:restoreType:error:]", "MBRestorePlanDB.m", 722, "error");
  }
  if (!a3) {
    return 1;
  }
  uint64_t v10 = *(void *)&a7;
  id v14 = [(MBRestorePlanDB *)self _validRWDatabase:a8];
  unsigned __int8 v15 = v14;
  if (v14)
  {
    id v24 = 0;
    unsigned __int8 v16 = objc_msgSend(v14, "executeWithError:sql:", &v24, @"\n UPDATE Restorables\n    SET restoreState = %u\n  WHERE restorableID = %llu;",
                             a3,
                             a4);
    id v17 = v24;
    id v18 = v17;
    if (a3 == 6)
    {
      if (*a8)
      {
        id v19 = *a8;
        id v20 = +[NSNumber numberWithUnsignedLongLong:a6];
        id v21 = +[NSNumber numberWithUnsignedLongLong:a4];
        [v15 _recordFailure:v19 domainID:a5 restoreType:v10 inode:v20 restorableID:v21 error:a8];
      }
      BOOL v22 = 0;
    }
    else
    {
      if ((v16 & 1) == 0) {
        *a8 = v17;
      }
      if (a3 == 1) {
        BOOL v22 = 0;
      }
      else {
        BOOL v22 = v16;
      }
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_recordAssetState:(unint64_t)a3 inode:(unint64_t)a4 domainID:(unint64_t)a5 failure:(id)a6 restoreType:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a6;
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _recordAssetState:inode:domainID:failure:restoreType:error:]", "MBRestorePlanDB.m", 764, "inode");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB _recordAssetState:inode:domainID:failure:restoreType:error:]", "MBRestorePlanDB.m", 765, "domainID");
  }
  if (!a8) {
    __assert_rtn("-[MBRestorePlanDB _recordAssetState:inode:domainID:failure:restoreType:error:]", "MBRestorePlanDB.m", 766, "error");
  }
  unsigned __int8 v15 = v14;
  if (a3)
  {
    unsigned __int8 v16 = [(MBRestorePlanDB *)self _validRWDatabase:a8];
    id v17 = v16;
    if (v16
      && objc_msgSend(v16, "executeWithError:sql:", a8, @"\n UPDATE RestorableAssets\n    SET assetState = %u\n  WHERE domainID = %llu\n    AND inode = %llu", a3, a5, a4))
    {
      if (a3 - 5 < 0xFFFFFFFFFFFFFFFELL
        || !v15
        || (+[NSNumber numberWithUnsignedLongLong:a4],
            id v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v17 _recordFailure:v15 domainID:a5 restoreType:v9 inode:v18 restorableID:0 error:a8], v18, v19))
      {
        LOBYTE(v19) = 1;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 1;
  }

  return v19;
}

- (BOOL)atcRestorableForAbsolutePath:(id)a3 error:(id *)a4 domainProvider:(id)a5 restorableAccessor:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    __assert_rtn("-[MBRestorePlanDB atcRestorableForAbsolutePath:error:domainProvider:restorableAccessor:]", "MBRestorePlanDB.m", 797, "absolutePath");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB atcRestorableForAbsolutePath:error:domainProvider:restorableAccessor:]", "MBRestorePlanDB.m", 798, "error");
  }
  if (!v11) {
    __assert_rtn("-[MBRestorePlanDB atcRestorableForAbsolutePath:error:domainProvider:restorableAccessor:]", "MBRestorePlanDB.m", 799, "domainProvider");
  }
  if (!v12) {
    __assert_rtn("-[MBRestorePlanDB atcRestorableForAbsolutePath:error:domainProvider:restorableAccessor:]", "MBRestorePlanDB.m", 800, "accessor");
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B2A80;
  v18[3] = &unk_100418238;
  id v21 = v11;
  id v22 = v12;
  id v19 = v10;
  id v20 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  BOOL v16 = [(MBRestorePlanDB *)self _withReadOnlyDB:a4 accessor:v18];

  return v16;
}

- (id)atcRestorePlansForAbsolutePaths:(id)a3 domainProvider:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBRestorePlanDB atcRestorePlansForAbsolutePaths:domainProvider:error:]", "MBRestorePlanDB.m", 855, "absolutePaths");
  }
  id v10 = (void (**)(void, void))v9;
  if (!v9) {
    __assert_rtn("-[MBRestorePlanDB atcRestorePlansForAbsolutePaths:domainProvider:error:]", "MBRestorePlanDB.m", 856, "domainProvider");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB atcRestorePlansForAbsolutePaths:domainProvider:error:]", "MBRestorePlanDB.m", 857, "error");
  }
  v31 = [(MBRestorePlanDB *)self _validRWDatabase:a5];
  id v11 = [(MBRestorePlanDB *)self _atcPathsByDomainNameForPaths:v8 error:a5];
  if (v11)
  {
    id v12 = +[NSMutableArray array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v29 = *(void *)v33;
      v27 = v11;
      id v28 = v8;
      v30 = v12;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v18 = [v13 objectForKeyedSubscript:v17];
          unint64_t v19 = [(MBRestorePlanDB *)self _domainIDForDomainName:v17 inDB:v31 error:a5];
          if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_17;
          }
          unint64_t v20 = v19;
          id v21 = a5;
          uint64_t v22 = v10[2](v10, v17);
          if (!v22)
          {
            *a5 = +[MBError errorWithCode:1, @"Failed to get domain for %@", v17 format];
LABEL_17:

            id v25 = 0;
            id v11 = v27;
            id v8 = v28;
            id v12 = v30;
            goto LABEL_18;
          }
          id v23 = (void *)v22;
          id v24 = [[_RestoreDomainPlanATC alloc] _initWithParentPlan:self domain:v22 domainID:v20 atcPaths:v18];
          [v30 addObject:v24];

          a5 = v21;
        }
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        id v11 = v27;
        id v8 = v28;
        id v12 = v30;
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v25 = v12;
LABEL_18:
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)_atcPathsByDomainNameForPaths:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB _atcPathsByDomainNameForPaths:error:]", "MBRestorePlanDB.m", 888, "absolutePaths");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _atcPathsByDomainNameForPaths:error:]", "MBRestorePlanDB.m", 889, "error");
  }
  id v7 = v6;
  +[NSMutableDictionary dictionary];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002B32A4;
  v13[3] = &unk_100418288;
  id v14 = v7;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v9 = v7;
  unsigned int v10 = [(MBRestorePlanDB *)self _withReadOnlyDB:a4 accessor:v13];

  if (v10) {
    id v11 = v8;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)incrementPriorityOfRestorableForDomain:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 name];
  if (!v10) {
    __assert_rtn("-[MBRestorePlanDB incrementPriorityOfRestorableForDomain:relativePath:error:]", "MBRestorePlanDB.m", 962, "domainName");
  }
  if (!v9) {
    __assert_rtn("-[MBRestorePlanDB incrementPriorityOfRestorableForDomain:relativePath:error:]", "MBRestorePlanDB.m", 963, "relativePath");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB incrementPriorityOfRestorableForDomain:relativePath:error:]", "MBRestorePlanDB.m", 964, "error");
  }
  id v11 = (void *)v10;
  id v12 = [(MBRestorePlanDB *)self _validRWDatabase:a5];
  unsigned __int8 v13 = objc_msgSend(v12, "executeWithError:sql:", a5, @"\n UPDATE Restorables\n    SET priority = (\n      SELECT COALESCE(MAX( priority), 0) + 1\n      FROM Restorables\n   )   \n  WHERE relativePath = %@\n   AND  Restorables.domainID IN (\n    SELECT Domains.domainID\n      FROM Domains\n     WHERE Domains.domain = %@\n  );",
                           v9,
                           v11);

  return v13;
}

- (BOOL)enumerateDomainNamesPendingRestoreWithError:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB enumerateDomainNamesPendingRestoreWithError:enumerator:]", "MBRestorePlanDB.m", 982, "error");
  }
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB enumerateDomainNamesPendingRestoreWithError:enumerator:]", "MBRestorePlanDB.m", 983, "enumerator");
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002B3A80;
  v10[3] = &unk_1004182B0;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(MBRestorePlanDB *)self _withReadOnlyDB:a3 accessor:v10];

  return v8;
}

- (BOOL)enumerateBundleIDsWithPlaceholderIPAsWithError:(id *)a3 enumerator:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002B3CF8;
  v8[3] = &unk_1004182B0;
  id v9 = a4;
  id v6 = v9;
  LOBYTE(a3) = [(MBRestorePlanDB *)self _withReadOnlyDB:a3 accessor:v8];

  return (char)a3;
}

- (BOOL)addRemainingProgress:(id)a3 forDomainNames:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBRestorePlanDB addRemainingProgress:forDomainNames:error:]", "MBRestorePlanDB.m", 1030, "progress");
  }
  uint64_t v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBRestorePlanDB addRemainingProgress:forDomainNames:error:]", "MBRestorePlanDB.m", 1031, "domainNames");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB addRemainingProgress:forDomainNames:error:]", "MBRestorePlanDB.m", 1032, "error");
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002B404C;
  v15[3] = &unk_1004182D8;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v11 = v8;
  id v12 = v10;
  BOOL v13 = [(MBRestorePlanDB *)self _withReadOnlyDB:a5 accessor:v15];

  return v13;
}

- (BOOL)_addRemainingProgress:(id)a3 forDomainID:(unint64_t)a4 domainName:(id)a5 readOnlyDB:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11) {
    __assert_rtn("-[MBRestorePlanDB _addRemainingProgress:forDomainID:domainName:readOnlyDB:error:]", "MBRestorePlanDB.m", 1059, "progress");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _addRemainingProgress:forDomainID:domainName:readOnlyDB:error:]", "MBRestorePlanDB.m", 1060, "domainID");
  }
  id v14 = v13;
  if (!v13) {
    __assert_rtn("-[MBRestorePlanDB _addRemainingProgress:forDomainID:domainName:readOnlyDB:error:]", "MBRestorePlanDB.m", 1061, "readOnlyDB");
  }
  if (!a7) {
    __assert_rtn("-[MBRestorePlanDB _addRemainingProgress:forDomainID:domainName:readOnlyDB:error:]", "MBRestorePlanDB.m", 1062, "error");
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  objc_msgSend(v13, "fetchSQL:", @"\nSELECT \n  SUM (assetSize),\n  COUNT(*)\n FROM  RestorableAssets\n JOIN  Restorables ON\n      (RestorableAssets.inode = Restorables.inode\n   AND RestorableAssets.domainID = Restorables.domainID\n     )\n WHERE RestorableAssets.assetState = %u\n   AND Restorables.restoreState != %u\n   AND Restorables.restoreState != %u\n   AND RestorableAssets.domainID = %llu\n GROUP BY RestorableAssets.inode;",
    1,
    2,
    5,
  id v15 = a4);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1002B46E4;
  v44[3] = &unk_100418300;
  v44[4] = &v49;
  v44[5] = &v45;
  unsigned __int8 v16 = [v15 enumerateWithError:a7 block:v44];

  if (v16)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    objc_msgSend(v14, "fetchSQL:", @"\n SELECT \n    IFNULL(SUM(IIF(type == %u, 1, 0)), 0),\n    IFNULL(SUM(IIF(type == %u, 1, 0)), 0),\n    IFNULL(SUM(IIF(type == %u AND restoreState == %u, 1, 0)), 0),\n    IFNULL(SUM(IIF(type == %u AND restoreState == %u, 1, 0)), 0)\n FROM   Restorables\n WHERE (restoreState = %u\n     OR restoreState = %u\n      )\n    AND domainID = %llu;",
      0x8000,
      40960,
      0x4000,
      1,
      0x4000,
      4,
      1,
      4,
    uint64_t v17 = a4);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002B4794;
    v27[3] = &unk_100418328;
    v27[4] = &v40;
    v27[5] = &v36;
    v27[6] = &v32;
    v27[7] = &v28;
    unsigned __int8 v18 = [v17 enumerateWithError:a7 block:v27];

    if (v18)
    {
      unint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = v46[3];
        uint64_t v21 = v50[3];
        uint64_t v22 = v41[3];
        uint64_t v23 = v37[3];
        uint64_t v24 = v33[3];
        uint64_t v25 = v29[3];
        *(_DWORD *)buf = 134219522;
        uint64_t v54 = v20;
        __int16 v55 = 2048;
        uint64_t v56 = v21;
        __int16 v57 = 2048;
        uint64_t v58 = v22;
        __int16 v59 = 2048;
        uint64_t v60 = v23;
        __int16 v61 = 2048;
        uint64_t v62 = v24;
        __int16 v63 = 2048;
        uint64_t v64 = v25;
        __int16 v65 = 2112;
        id v66 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=plan= Notifying progressModel of pending assetCount %llu assetSize %llu regCount %llu symlink %llu dir (%llu + %llu) for domain %@", buf, 0x48u);
        _MBLog();
      }

      [v11 willTransferItemsWithSize:v50[3] count:v41[3] + v46[3] + v37[3] + 2 * v33[3] + v29[3]];
    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v18;
}

- (unint64_t)_domainIDForDomainName:(id)a3 inDB:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBRestorePlanDB _domainIDForDomainName:inDB:error:]", "MBRestorePlanDB.m", 1144, "domainName");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB _domainIDForDomainName:inDB:error:]", "MBRestorePlanDB.m", 1145, "error");
  }
  id v9 = v8;
  id v10 = objc_msgSend(v8, "fetchCountWithError:sql:", a5, @"\n SELECT domainID\n   FROM Domains\n  WHERE domain = %@;",
          v7);

  return (unint64_t)v10;
}

- (id)planForDomain:(id)a3 restoreType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (!v8) {
    __assert_rtn("-[MBRestorePlanDB planForDomain:restoreType:error:]", "MBRestorePlanDB.m", 1155, "domain");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB planForDomain:restoreType:error:]", "MBRestorePlanDB.m", 1156, "error");
  }
  id v9 = v8;
  id v10 = [(MBRestorePlanDB *)self _validRWDatabase:a5];
  if (v10)
  {
    id v11 = [v9 name];
    id v17 = 0;
    unint64_t v12 = [(MBRestorePlanDB *)self _domainIDForDomainName:v11 inDB:v10 error:&v17];
    id v13 = v17;

    if (v12 == 0x7FFFFFFFFFFFFFFFLL
      && ([v13 excludingNotFound],
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      id v15 = 0;
      *a5 = v13;
    }
    else
    {
      id v15 = [(_RestoreDomainPlanBase *)[_RestoreDomainPlanStandard alloc] _initWithParentPlan:self domain:v9 domainID:v12 restoreType:v6];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_withReadOnlyDB:(id *)a3 accessor:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB _withReadOnlyDB:accessor:]", "MBRestorePlanDB.m", 1178, "error");
  }
  id v7 = (uint64_t (**)(void, void, void))v6;
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB _withReadOnlyDB:accessor:]", "MBRestorePlanDB.m", 1179, "accessor");
  }
  if ([(MBRestorePlanDB *)self isPopulated])
  {
    id v8 = [(MBRestorePlanDB *)self _validRWDatabase:a3];
    id v9 = [v8 openReadOnlyInstance:objc_opt_class() error:a3];

    if (v9)
    {
      char v10 = ((uint64_t (**)(void, void *, id *))v7)[2](v7, v9, a3);
      [v9 close:0];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

- (BOOL)fetchPendingRestoreSize:(int64_t *)a3 remainingFileCount:(int64_t *)a4 totalFileCount:(int64_t *)a5 error:(id *)a6
{
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB fetchPendingRestoreSize:remainingFileCount:totalFileCount:error:]", "MBRestorePlanDB.m", 1196, "outPendingRestoreSize");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB fetchPendingRestoreSize:remainingFileCount:totalFileCount:error:]", "MBRestorePlanDB.m", 1197, "outFileCount");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB fetchPendingRestoreSize:remainingFileCount:totalFileCount:error:]", "MBRestorePlanDB.m", 1198, "outTotalFileCount");
  }
  if (!a6) {
    __assert_rtn("-[MBRestorePlanDB fetchPendingRestoreSize:remainingFileCount:totalFileCount:error:]", "MBRestorePlanDB.m", 1199, "error");
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B4CDC;
  v7[3] = &unk_100418348;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a5;
  return [(MBRestorePlanDB *)self _withReadOnlyDB:a6 accessor:v7];
}

- (BOOL)enumerateRestoreFailuresOfType:(int)a3 isFatal:(BOOL)a4 error:(id *)a5 enumerator:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  if (!v8) {
    __assert_rtn("-[MBRestorePlanDB enumerateRestoreFailuresOfType:isFatal:error:enumerator:]", "MBRestorePlanDB.m", 1257, "restoreType");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB enumerateRestoreFailuresOfType:isFatal:error:enumerator:]", "MBRestorePlanDB.m", 1258, "error");
  }
  id v11 = v10;
  if (!v10) {
    __assert_rtn("-[MBRestorePlanDB enumerateRestoreFailuresOfType:isFatal:error:enumerator:]", "MBRestorePlanDB.m", 1259, "enumerator");
  }
  +[NSNumber numberWithUnsignedInt:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002B5250;
  v16[3] = &unk_100418370;
  BOOL v19 = a4;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v11;
  id v12 = v11;
  id v13 = v17;
  BOOL v14 = [(MBRestorePlanDB *)self _withReadOnlyDB:a5 accessor:v16];

  return v14;
}

- (unint64_t)fatalErrorCount:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB fatalErrorCount:]", "MBRestorePlanDB.m", 1276, "error");
  }
  v4 = -[MBRestorePlanDB _validRWDatabase:](self, "_validRWDatabase:");
  v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 fetchCountWithError:a3 sql:@"\nSELECT COUNT(*)\n  FROM FatalErrorRelationships\n WHERE parentErrorID IS NULL"];
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)restoreVerificationSummary:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB restoreVerificationSummary:]", "MBRestorePlanDB.m", 1291, "error");
  }
  v3 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v4 = -[MBRestorePlanDB _validRWDatabase:](self, "_validRWDatabase:");
  v5 = [v4 fetchSQL:@"\n  SELECT verificationStatus, COUNT(*)\n    FROM Domains\nGROUP BY verificationStatus"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002B5560;
  v9[3] = &unk_100418328;
  v9[4] = &v22;
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  LOBYTE(v3) = [v5 enumerateWithError:v3 block:v9];

  if (v3)
  {
    unint64_t v6 = [MBRestoreVerificationSummary alloc];
    id v7 = [(MBRestoreVerificationSummary *)v6 initWithDomainsNotVerifiedCount:v23[3] domainsPassingVerificationCount:v19[3] domainsFailingVerificationCount:v15[3] domainsSkippedVerificationCount:v11[3]];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v7;
}

- (BOOL)skipDomains:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBRestorePlanDB skipDomains:error:]", "MBRestorePlanDB.m", 1341, "domainNames");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB skipDomains:error:]", "MBRestorePlanDB.m", 1342, "error");
  }
  id v7 = v6;
  uint64_t v8 = [(MBRestorePlanDB *)self _validRWDatabase:a4];
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002B5824;
    v11[3] = &unk_100416FB0;
    id v12 = v7;
    uint64_t v13 = self;
    unsigned __int8 v9 = [v8 groupInTransaction:v11 error:a4];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_skipDomainID:(unint64_t)a3 into:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB _skipDomainID:into:error:]", "MBRestorePlanDB.m", 1375, "domainID");
  }
  uint64_t v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBRestorePlanDB _skipDomainID:into:error:]", "MBRestorePlanDB.m", 1376, "pdb");
  }
  if (!a5) {
    __assert_rtn("-[MBRestorePlanDB _skipDomainID:into:error:]", "MBRestorePlanDB.m", 1377, "error");
  }
  if ([v7 _recordVerificationState:4 domainID:a3 error:a5]
    && objc_msgSend(v8, "executeWithError:sql:", a5, @"\n UPDATE Domains\n    SET engineState = %u\n  WHERE domainID = %llu;",
                       10,
                       a3))
  {
    unsigned __int8 v9 = objc_msgSend(v8, "executeWithError:sql:", a5, @"\n UPDATE Restorables\n    SET restoreState = %u\n  WHERE domainID = %llu;",
                            2,
                            a3);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)_verificationStateForDomainID:(unint64_t)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB _verificationStateForDomainID:error:]", "MBRestorePlanDB.m", 1403, "domainID");
  }
  if (!a4) {
    __assert_rtn("-[MBRestorePlanDB _verificationStateForDomainID:error:]", "MBRestorePlanDB.m", 1404, "error");
  }
  id v6 = [(MBRestorePlanDB *)self _validRWDatabase:a4];
  objc_msgSend(v6, "fetchObjectOfClass:error:sql:", objc_opt_class(), a4, @"\n SELECT verificationStatus\n   FROM Domains\n  WHERE domainID = %llu;",
  id v7 = a3);

  if (v7) {
    unint64_t v8 = [v7 unsignedIntValue];
  }
  else {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)enumerateDomainNamesByTotalAssetSize:(id *)a3 enumerator:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestorePlanDB enumerateDomainNamesByTotalAssetSize:enumerator:]", "MBRestorePlanDB.m", 1420, "error");
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002B5C48;
  v10[3] = &unk_1004182B0;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(MBRestorePlanDB *)self _withReadOnlyDB:a3 accessor:v10];

  return v8;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)restoreSnapshotsDirectoryRoot
{
  return self->_restoreSnapshotsDirectoryRoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreSnapshotsDirectoryRoot, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_readWriteDB, 0);
}

@end