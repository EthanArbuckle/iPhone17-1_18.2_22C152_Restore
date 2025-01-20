@interface MBServiceCache
+ (MBServiceCache)cacheWithPath:(id)a3;
+ (id)systemPath;
- (BOOL)_rebuildSnapshot:(id)a3 backupUDID:(id)a4 service:(id)a5 error:(id *)a6;
- (BOOL)areAllFilesCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4;
- (BOOL)areFilesMissingEncryptionKey;
- (BOOL)containsFailedRestoreFilesForRestoreID:(unint64_t)a3;
- (BOOL)containsRestoreFilesForRestoreID:(unint64_t)a3;
- (BOOL)containsRestoreFilesWithState:(int)a3 forRestoreID:(unint64_t)a4;
- (BOOL)encryptedFilesExistForBackupUDID:(id)a3;
- (BOOL)encryptedFilesExistForBackupUDID:(id)a3 keybagID:(int64_t)a4;
- (BOOL)isDomainNameEnabled:(id)a3;
- (BOOL)isRefreshNeededForBackupUDID:(id)a3;
- (BOOL)isStaleSnapshotID:(unint64_t)a3 backupUDID:(id)a4;
- (BOOL)refreshForBackupUDID:(id)a3 service:(id)a4 deleted:(BOOL *)a5 error:(id *)a6;
- (BOOL)restoreFileExistsWithDomainName:(id)a3 relativePath:(id)a4 backupUDID:(id)a5;
- (BOOL)restoreFilesExistForDomainName:(id)a3 backupUDID:(id)a4 size:(unint64_t *)a5;
- (MBDomainManager)domainManager;
- (MBServiceCache)initWithPath:(id)a3 domainManager:(id)a4;
- (id)_disabledDomainNames;
- (id)_fileChangeFromStmt:(id)a3;
- (id)_fileIDEnumeratorWithStmt:(id)a3;
- (id)_fileWithStmt:(id)a3;
- (id)_lastRefreshPropertyKeyForBackupUDID:(id)a3;
- (id)_prepare:(id)a3;
- (id)_restoreFileWithStmt:(id)a3;
- (id)_restoreFilesWithStmt:(id)a3;
- (id)_snapshotWithStmt:(id)a3;
- (id)activeDomainNamesForBackupUDID:(id)a3;
- (id)backupForUDID:(id)a3 lastModified:(int64_t *)a4;
- (id)configuration;
- (id)creationDate;
- (id)dateOfLastRefreshForBackupUDID:(id)a3;
- (id)deletedFileIDEnumeratorForBackupUDID:(id)a3;
- (id)domainInfoForName:(id)a3 backupUDID:(id)a4;
- (id)domainNamesForBackupUDID:(id)a3;
- (id)encryptedFileIDEnumeratorForBackupUDID:(id)a3;
- (id)encryptionKeyForFileWithID:(id)a3 backupUDID:(id)a4;
- (id)encryptionKeyForFileWithInodeNumber:(unint64_t)a3;
- (id)fileChangeEnumerator;
- (id)fileChangeIDsWithResult:(int)a3 offset:(unint64_t)a4 limit:(unint64_t)a5;
- (id)fileForID:(id)a3 backupUDID:(id)a4;
- (id)fileForID:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (id)fileIDEnumeratorForSnapshotID:(unint64_t)a3 backupUDID:(id)a4;
- (id)filesToRestoreForDomainName:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7;
- (id)keyBagInfoForBackupUDID:(id)a3;
- (id)pathsForFilesMissingEncryptionKeyWithOffset:(unint64_t)a3 limit:(unint64_t)a4;
- (id)pathsToRestoreForDomain:(id)a3 absolutePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7;
- (id)propertyForKey:(id)a3;
- (id)protectionClassesToRestoreByPathWithOffset:(unint64_t)a3 limit:(unint64_t)a4;
- (id)relativePathsOfPlaceholderResourcesWithBundleID:(id)a3 lastModified:(int64_t)a4;
- (id)restoreBackupUDID;
- (id)restoreFailuresForDataClass:(id)a3 assetType:(id)a4 range:(_NSRange)a5;
- (id)restoreFileForFileID:(id)a3;
- (id)restoreFileForItemID:(unint64_t)a3;
- (id)restoreFilesForBackupUDID:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5;
- (id)restoreFilesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 restoreID:(unint64_t)a5 pendingOnly:(BOOL)a6 offset:(unint64_t)a7 limit:(unint64_t)a8;
- (id)restoreModeForBackgroundAppWithRestoreID:(unint64_t)a3;
- (id)snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4;
- (id)snapshotsForBackupUDID:(id)a3;
- (int64_t)_lastInsertRowID;
- (int64_t)localCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4;
- (int64_t)restoreBackupLastModified;
- (int64_t)restoreSnapshotID;
- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4;
- (unint64_t)nextBackupSizeWithUDID:(id)a3;
- (unint64_t)restoreIDForMode:(id)a3;
- (void)_exec:(id)a3;
- (void)_finalizeAll;
- (void)_logProfile;
- (void)_profile:(id)a3 time:(double)a4;
- (void)_raise:(id)a3;
- (void)_remove;
- (void)_removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4;
- (void)addBackup:(id)a3 lastModified:(int64_t)a4;
- (void)addDisabledDomainNames:(id)a3 restricted:(BOOL)a4;
- (void)addFile:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5 committed:(BOOL)a6;
- (void)addFileChange:(id)a3;
- (void)addFileMissingEncryptionKeyWithPath:(id)a3;
- (void)addKeyBagInfo:(id)a3 forBackupUDID:(id)a4;
- (void)addRestoreFailure:(id)a3;
- (void)addRestoreFile:(id)a3;
- (void)addSnapshot:(id)a3 backupUDID:(id)a4;
- (void)analyze;
- (void)begin;
- (void)close;
- (void)dealloc;
- (void)end;
- (void)fileChangeCount:(unint64_t *)a3 size:(unint64_t *)a4;
- (void)forceRefreshForBackupUDID:(id)a3;
- (void)keybagUUID:(id *)a3 keybagID:(unsigned int *)a4 forBackupUDID:(id)a5;
- (void)mergeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5;
- (void)open;
- (void)prioritizeRestoreFileWithFileID:(id)a3;
- (void)removeAccount;
- (void)removeAllBackups;
- (void)removeAllDisabledDomains;
- (void)removeAllFileChanges;
- (void)removeAllFileEncryptionKeys;
- (void)removeAllFilesMissingEncryptionKey;
- (void)removeAllProtectionClassesToRestore;
- (void)removeAllRestores;
- (void)removeBackupForUDID:(id)a3;
- (void)removeDisabledDomainNames:(id)a3;
- (void)removeDomainName:(id)a3 backupUDID:(id)a4 lastModified:(int64_t)a5;
- (void)removeFileEncryptionKeyForInodeNumber:(unint64_t)a3;
- (void)removeFileID:(id)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (void)removeFileMissingEncryptionKeyWithPath:(id)a3;
- (void)removePropertyForKey:(id)a3;
- (void)removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5;
- (void)repair;
- (void)restoreFilesCount:(unint64_t *)a3 size:(unint64_t *)a4 forRestoreID:(unint64_t)a5 backupUDID:(id)a6;
- (void)rollback;
- (void)setCommitted:(BOOL)a3 forFileID:(id)a4 snapshotID:(unint64_t)a5 backupUDID:(id)a6;
- (void)setCommitted:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setDisabledDomainNames:(id)a3 restrictedDomainNames:(id)a4;
- (void)setDomainManager:(id)a3;
- (void)setFileEncryptionKey:(id)a3 forInodeNumber:(unint64_t)a4;
- (void)setKeyBagInfo:(id)a3 forBackupUDID:(id)a4;
- (void)setLastModified:(int64_t)a3 forBackupUDID:(id)a4;
- (void)setLastModified:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (void)setLocalCommitted:(int64_t)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (void)setPlaceholderResourceRelativePaths:(id)a3 lastModified:(int64_t)a4 forBundleID:(id)a5;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setProtectionClass:(unsigned __int8)a3 toRestoreForDomainName:(id)a4 relativePath:(id)a5;
- (void)setRestoreBackupLastModified:(int64_t)a3;
- (void)setRestoreBackupUDID:(id)a3;
- (void)setRestoreID:(unint64_t)a3 forDomainName:(id)a4 relativePath:(id)a5 backupUDID:(id)a6;
- (void)setRestoreID:(unint64_t)a3 forRestoreFile:(id)a4;
- (void)setRestoreID:(unint64_t)a3 forType:(int)a4 value:(id)a5;
- (void)setRestoreSnapshotID:(int64_t)a3;
- (void)setResult:(int)a3 forFileChangeID:(id)a4;
- (void)setStale:(BOOL)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5;
- (void)setState:(int)a3 forFileID:(id)a4 restoreID:(unint64_t)a5;
- (void)setState:(int)a3 forRestoreID:(unint64_t)a4;
- (void)updateFileChangesAfterCommittingSnapshot;
- (void)updateFileChangesAfterRemovingDomainName:(id)a3;
- (void)vacuum;
- (void)verifyBackupUDID:(id)a3 service:(id)a4;
@end

@implementation MBServiceCache

+ (id)systemPath
{
  v2 = (void *)MBGetCacheDir();
  return [v2 stringByAppendingPathComponent:@"cache.db"];
}

+ (MBServiceCache)cacheWithPath:(id)a3
{
  v3 = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", a3, objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0)));
  return v3;
}

- (MBServiceCache)initWithPath:(id)a3 domainManager:(id)a4
{
  if (!a4) {
    __assert_rtn("-[MBServiceCache initWithPath:domainManager:]", "MBServiceCache.m", 283, "domainManager");
  }
  v13.receiver = self;
  v13.super_class = (Class)MBServiceCache;
  v6 = [(MBServiceCache *)&v13 init];
  if (v6)
  {
    v6->_path = (NSString *)a3;
    v6->_domainManager = (MBDomainManager *)a4;
    v6->_stmtsBySQL = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = MBGetSQLLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      v6->_countAndTimeBySQL = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    if (qword_100482678 != -1) {
      dispatch_once(&qword_100482678, &stru_100415C90);
    }
    v8 = (void *)qword_100482680;
    objc_sync_enter((id)qword_100482680);
    v9 = (NSMutableSet *)[(id)qword_100482680 objectForKeyedSubscript:a3];
    v6->_upToDateBackupUDIDs = v9;
    if (!v9)
    {
      v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v6->_upToDateBackupUDIDs = v10;
      [(id)qword_100482680 setObject:v10 forKeyedSubscript:a3];
    }
    objc_sync_exit(v8);
    upToDateBackupUDIDs = v6->_upToDateBackupUDIDs;
    objc_sync_enter(upToDateBackupUDIDs);
    [(NSMutableSet *)v6->_upToDateBackupUDIDs removeAllObjects];
    objc_sync_exit(upToDateBackupUDIDs);
  }
  return v6;
}

- (void)dealloc
{
  [(MBServiceCache *)self close];

  v3.receiver = self;
  v3.super_class = (Class)MBServiceCache;
  [(MBServiceCache *)&v3 dealloc];
}

- (void)_remove
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing cache db", buf, 2u);
    _MBLog();
  }
  [+[NSFileManager defaultManager] removeItemAtPath:self->_path error:0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = (void *)MBSQLiteJournalSuffixes();
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [+[NSFileManager defaultManager] removeItemAtPath:[(NSString *)self->_path stringByAppendingString:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)] error:0];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_raise:(id)a3
{
  id v4 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&v15];
  db = self->_db;
  if (db)
  {
    uint64_t v6 = sqlite3_errcode(db);
    uint64_t v7 = sqlite3_errmsg(self->_db);
    id v4 = objc_msgSend(v4, "stringByAppendingFormat:", @" (%d(%d)/%s)", v6, sqlite3_extended_errcode(self->_db), v7);
    if (!self->_corrupt && (v6 == 26 || v6 == 11))
    {
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v12 = v6;
        __int16 v13 = 2080;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing corrupt backup cache db (%d/%s)", buf, 0x12u);
        uint64_t v9 = v6;
        long long v10 = v7;
        _MBLog();
      }
      self->_corrupt = 1;
      [(MBServiceCache *)self close];
      [(MBServiceCache *)self _remove];
    }
  }
  +[NSException raise:NSGenericException, @"%@", v4 format];
}

- (void)_profile:(id)a3 time:(double)a4
{
  uint64_t v7 = MBGetSQLLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(NSMutableDictionary *)self->_countAndTimeBySQL objectForKeyedSubscript:a3];
    if (v8)
    {
      uint64_t v9 = v8;
      objc_msgSend(v8, "setObject:atIndexedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "integerValue") + 1), 0);
      objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", 1), "doubleValue");
      long long v11 = +[NSNumber numberWithDouble:v10 + a4];
      [v9 setObject:v11 atIndexedSubscript:1];
    }
    else
    {
      int v12 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), +[NSNumber numberWithDouble:a4], 0);
      countAndTimeBySQL = self->_countAndTimeBySQL;
      [(NSMutableDictionary *)countAndTimeBySQL setObject:v12 forKeyedSubscript:a3];
    }
  }
}

- (void)_logProfile
{
  objc_super v3 = MBGetSQLLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = MBGetSQLLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SQL: Profile", buf, 2u);
      _MBLog();
    }
    id v5 = [(NSMutableDictionary *)self->_countAndTimeBySQL allKeys];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001C7EFC;
    v25[3] = &unk_100415CB8;
    v25[4] = self;
    id v6 = [v5 sortedArrayUsingComparator:v25];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_countAndTimeBySQL, "objectForKeyedSubscript:", v11, v18, v19, v20);
          id v13 = objc_msgSend(objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "integerValue");
          objc_msgSend(objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "doubleValue");
          uint64_t v15 = v14;
          v16 = MBGetSQLLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = sub_1001C7FD4(v11);
            *(_DWORD *)buf = 134218498;
            id v27 = v13;
            __int16 v28 = 2048;
            uint64_t v29 = v15;
            __int16 v30 = 2112;
            id v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "SQL: %6ld  %6.3f s  %@", buf, 0x20u);
            id v20 = sub_1001C7FD4(v11);
            uint64_t v19 = v15;
            id v18 = v13;
            _MBLog();
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v8);
    }
  }
}

- (void)_exec:(id)a3
{
  if (!self->_db) {
    [(MBServiceCache *)self _raise:@"Database is closed"];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  if (sqlite3_exec(self->_db, (const char *)[a3 UTF8String], 0, 0, 0)) {
    [(MBServiceCache *)self _raise:@"Error executing SQL: \"%@\"", a3];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7 - v6;
  [(MBServiceCache *)self _profile:a3 time:v8];
}

- (id)_prepare:(id)a3
{
  if (!self->_db) {
    [(MBServiceCache *)self _raise:@"Database is closed"];
  }
  double v6 = (MBSCacheStmt *)[(NSMutableDictionary *)self->_stmtsBySQL objectForKeyedSubscript:a3];
  if (v6)
  {
    double v7 = v6;
    if (![(MBSCacheStmt *)v6 isReset]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceCache.m", 427, @"Statement not reset after last use: \"%@\"", a3 object file lineNumber description];
    }
  }
  else
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(self->_db, (const char *)[a3 UTF8String], -1, &ppStmt, 0)) {
      [(MBServiceCache *)self _raise:@"Error preparing statement: %@", a3];
    }
    double v8 = [MBSCacheStmt alloc];
    double v7 = [(MBSCacheStmt *)v8 initWithCache:self SQL:a3 stmt:ppStmt];
    [(NSMutableDictionary *)self->_stmtsBySQL setObject:v7 forKeyedSubscript:a3];
  }
  return v7;
}

- (void)_finalizeAll
{
}

- (int64_t)_lastInsertRowID
{
  db = self->_db;
  if (!db)
  {
    [(MBServiceCache *)self _raise:@"Database is closed"];
    db = self->_db;
  }
  return sqlite3_last_insert_rowid(db);
}

- (void)open
{
  uint64_t v13 = 0;
  if (self->_openCount < 1)
  {
    objc_super v3 = [(NSString *)self->_path stringByDeletingLastPathComponent];
    if (![+[NSFileManager defaultManager] createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v13])[(MBServiceCache *)self _raise:@"Error creating cache dir at %@: %@", v3, v13]; {
    id v4 = MBGetDefaultLog();
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Opening cache db", buf, 2u);
      _MBLog();
    }
    p_db = &self->_db;
    if (sqlite3_open([(NSString *)self->_path fileSystemRepresentation], &self->_db))
    {
      [(MBServiceCache *)self _raise:@"Error opening cache db at %@", self->_path];
LABEL_21:
      [(MBServiceCache *)self _exec:@"pragma synchronous = normal"];
      goto LABEL_22;
    }
    if (sqlite3_busy_timeout(*p_db, 900000)) {
      [(MBServiceCache *)self _raise:@"Error setting cache db busy timeout"];
    }
    double v6 = MBGetSQLLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sqlite3_trace_v2(*p_db, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_1001C85A8, 0);
    }
    [(MBServiceCache *)self begin];
    [(MBServiceCache *)self _exec:@"create table if not exists Properties (\n    key                    text primary key,\n    value                  text\n);\n"];
    id v7 = [(MBServiceCache *)self propertyForKey:@"SchemaVersion"];
    if (v7)
    {
      id v8 = v7;
      if ([v7 isEqualToString:@"26"])
      {
LABEL_20:
        [(MBServiceCache *)self end];
        goto LABEL_21;
      }
      uint64_t v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        CFStringRef v17 = @"26";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-creating cache db because schema version changed (%@ != %@)", buf, 0x16u);
        id v11 = v8;
        CFStringRef v12 = @"26";
        _MBLog();
      }
      [(MBServiceCache *)self _finalizeAll];
      [(MBServiceCache *)self _exec:@"drop table if exists Properties;\ndrop table if exists Backups;\ndrop table if exists Snapshots;\ndrop table if exists Files;\ndrop table if exists FileExtendedAttributes;\ndrop table if exists DisabledDomains;\ndrop table if exists FileChanges;\ndrop table if exists FilesMissingEncryptionKey;\ndrop table if exists FileEncryptionKeys;\ndrop table if exists Restores;\ndrop table if exists RestoreFiles;\ndrop table if exists PlaceholderIcons;\ndrop table if exists FileProtectionClassesToRestore;\ndrop table if exists RestoreFailures;\ndrop table if exists PlaceholderResources;\ndrop table if exists KeyBagInfo;\n"];
      [(MBServiceCache *)self _exec:@"create table if not exists Properties (\n    key                    text primary key,\n    value                  text\n);\n"];
    }
    [(MBServiceCache *)self _exec:&cfstr_CreateTableIfN_20];
    [(MBServiceCache *)self setProperty:@"26" forKey:@"SchemaVersion"];
    [+[NSDate date] timeIntervalSinceReferenceDate];
    [(MBServiceCache *)self setProperty:+[NSString stringWithFormat:@"%f", v10] forKey:@"Created"];
    goto LABEL_20;
  }
  if (!self->_db) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:460 description:@"Missing handle for open cache db"];
  }
LABEL_22:
  ++self->_openCount;
}

- (void)close
{
  int64_t openCount = self->_openCount;
  if (openCount >= 1)
  {
    if (openCount == 1)
    {
      if (!self->_db) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:530 description:@"Missing handle for open cache db"];
      }
      id v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Closing cache db", v5, 2u);
        _MBLog();
      }
      [(MBServiceCache *)self _finalizeAll];
      if (sqlite3_close(self->_db)) {
        [(MBServiceCache *)self _raise:@"Error closing database"];
      }
      self->_db = 0;
      [(MBServiceCache *)self _logProfile];
      int64_t openCount = self->_openCount;
    }
    self->_int64_t openCount = openCount - 1;
  }
}

- (void)begin
{
}

- (void)end
{
}

- (void)rollback
{
}

- (void)analyze
{
}

- (void)vacuum
{
}

- (id)propertyForKey:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:570 description:@"Null key"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"select value from Properties where key = ?"];
  [v5 bindText:a3 atIndex:1];
  if ([v5 step]) {
    id v6 = [v5 textColumn:0];
  }
  else {
    id v6 = 0;
  }
  [v5 reset];
  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    if (a3)
    {
LABEL_3:
      id v7 = [(MBServiceCache *)self _prepare:@"insert or replace into Properties (key, value) values (?,?)"];
      [v7 bindText:a4 atIndex:1];
      [v7 bindText:a3 atIndex:2];
      [v7 step];
      [v7 reset];
      return;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:585 description:@"Null key"];
    if (a3) {
      goto LABEL_3;
    }
  }
  [(MBServiceCache *)self removePropertyForKey:a4];
}

- (void)removePropertyForKey:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:599 description:@"Null key"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"delete from Properties where key = ?"];
  [v5 bindText:a3 atIndex:1];
  [v5 step];
  [v5 reset];
}

- (id)creationDate
{
  objc_msgSend(-[MBServiceCache propertyForKey:](self, "propertyForKey:", @"Created"), "floatValue");
  double v3 = v2;
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v3];
}

- (id)configuration
{
  uint64_t v8 = 0;
  id result = self->_configuration;
  if (!result)
  {
    id v4 = [(MBServiceCache *)self propertyForKey:@"Configuration"];
    if (v4)
    {
      id v5 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", [v4 dataUsingEncoding:4], 0, 0, &v8);
      if (v5)
      {
LABEL_8:
        id result = [[MBServiceConfiguration alloc] initWithPropertyList:v5];
        self->_configuration = (MBServiceConfiguration *)result;
        return result;
      }
      id v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error deserializing configuration from cache: %@", buf, 0xCu);
        uint64_t v7 = v8;
        _MBLog();
      }
      [(MBServiceCache *)self removePropertyForKey:@"Configuration", v7];
    }
    id v5 = 0;
    goto LABEL_8;
  }
  return result;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v9 = 0;
  [(MBServiceCache *)self begin];
  if ([a3 propertyList])
  {
    id v6 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", [a3 propertyList], 100, 0, &v9);
    if (!v6)
    {
      uint64_t v8 = +[NSAssertionHandler currentHandler];
      [(NSAssertionHandler *)v8 handleFailureInMethod:a2, self, @"MBServiceCache.m", 639, @"Error serializing configuration: %@", v9 object file lineNumber description];
    }
    id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
  }
  else
  {
    id v7 = 0;
  }
  [(MBServiceCache *)self setProperty:v7 forKey:@"Configuration"];
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", [a3 domainNamesNotToBackUp], 1);
  [(MBServiceCache *)self end];

  self->_configuration = (MBServiceConfiguration *)a3;
}

- (void)removeAccount
{
  [(MBServiceCache *)self removeAllBackups];
  [(MBServiceCache *)self removeAllFileChanges];
  [(MBServiceCache *)self removeAllDisabledDomains];
  [(MBServiceCache *)self removeAllRestores];
}

- (id)backupForUDID:(id)a3 lastModified:(int64_t *)a4
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:664 description:@"Null backup UDID"];
  }
  id v8 = [(MBServiceCache *)self _prepare:@"select lastModified, attributes from Backups where backupUDID = ?"];
  [v8 bindText:a3 atIndex:1];
  if (![v8 step])
  {
    id v9 = 0;
    goto LABEL_9;
  }
  id v9 = +[MBSBackup backup];
  [v9 setBackupUDID:MBDataWithString()];
  if (![v9 backupUDID])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceCache.m", 673, @"Failed to convert backup UDID: \"%@\"", a3 object file lineNumber description];
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a4) {
LABEL_6:
  }
    *a4 = (int64_t)[v8 int64Column:0];
LABEL_7:
  objc_msgSend(v9, "setAttributes:", -[MBSBackupAttributes initWithData:]([MBSBackupAttributes alloc], "initWithData:", objc_msgSend(v8, "blobColumn:", 1)));
  objc_msgSend(v9, "setSnapshots:", objc_msgSend(-[MBServiceCache snapshotsForBackupUDID:](self, "snapshotsForBackupUDID:", a3), "mutableCopy"));
LABEL_9:
  [v8 reset];
  return v9;
}

- (void)keybagUUID:(id *)a3 keybagID:(unsigned int *)a4 forBackupUDID:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(-[MBServiceCache backupForUDID:lastModified:](self, "backupForUDID:lastModified:", a5, 0), "snapshots"), "lastObject");
  id v8 = v7;
  if (a3) {
    *a3 = objc_msgSend(objc_msgSend(v7, "attributes"), "keybagUUID");
  }
  if (a4) {
    *a4 = objc_msgSend(objc_msgSend(v8, "attributes"), "keybagID");
  }
}

- (void)addBackup:(id)a3 lastModified:(int64_t)a4
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:691 description:@"Null backup"];
  }
  if ([a3 backupUDID])
  {
    if (a4) {
      goto LABEL_5;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:692 description:@"Null backup UDID"];
    if (a4) {
      goto LABEL_5;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:693 description:@"Zero backup last modified time"];
LABEL_5:
  id v8 = [(MBServiceCache *)self _prepare:@"insert or replace into Backups values (?,?,?)"];
  [a3 backupUDID];
  [v8 bindText:MBStringWithData() atIndex:1];
  [v8 bindInt64:a4 atIndex:2];
  objc_msgSend(v8, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "attributes"), "data"), 3);
  [v8 step];
  [v8 reset];
}

- (void)removeDomainName:(id)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:704 description:@"Null domain name"];
    if (a4) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:705 description:@"Null backup UDID"];
LABEL_3:
  id v10 = [(MBServiceCache *)self _prepare:@"update Snapshots set lastModified = ? where snapshotID in (select snapshotID from Files where backupUDID = ? and domainName = ?)"];
  [v10 bindInt64:a5 atIndex:1];
  [v10 bindText:a4 atIndex:2];
  [v10 bindText:a3 atIndex:3];
  [v10 step];
  [v10 reset];
  id v11 = [(MBServiceCache *)self _prepare:@"delete from Files where backupUDID = ? and domainName = ?"];
  [v11 bindText:a4 atIndex:1];
  [v11 bindText:a3 atIndex:2];
  [v11 step];
  [v11 reset];
  [(MBServiceCache *)self setLastModified:a5 forBackupUDID:a4];
}

- (void)setLastModified:(int64_t)a3 forBackupUDID:(id)a4
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:724 description:@"Null backup UDID"];
  }
  id v7 = [(MBServiceCache *)self _prepare:@"update Backups set lastModified = ? where backupUDID = ?"];
  [v7 bindInt64:a3 atIndex:1];
  [v7 bindText:a4 atIndex:2];
  [v7 step];
  [v7 reset];
}

- (void)removeBackupForUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:734 description:@"Null backup UDID"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"delete from Backups where backupUDID = ?"];
  [v5 bindText:a3 atIndex:1];
  [v5 step];
  [v5 reset];
}

- (void)removeAllBackups
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from Backups"];
  [v2 step];
  [v2 reset];
}

- (id)_snapshotWithStmt:(id)a3
{
  id v4 = +[MBSSnapshot snapshot];
  objc_msgSend(v4, "setSnapshotID:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v4, "setLastModified:", objc_msgSend(a3, "int64Column:", 2));
  objc_msgSend(v4, "setCommitted:", objc_msgSend(a3, "int64Column:", 3));
  objc_msgSend(v4, "setAttributes:", -[MBSSnapshotAttributes initWithData:]([MBSSnapshotAttributes alloc], "initWithData:", objc_msgSend(a3, "blobColumn:", 6)));
  return v4;
}

- (id)snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v7 = [(MBServiceCache *)self _prepare:@"select * from Snapshots where backupUDID = ? and snapshotID = ?"];
  [v7 bindText:a4 atIndex:1];
  [v7 bindInteger:a3 atIndex:2];
  if ([v7 step]) {
    id v8 = [(MBServiceCache *)self _snapshotWithStmt:v7];
  }
  else {
    id v8 = 0;
  }
  [v7 reset];
  return v8;
}

- (id)snapshotsForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:776 description:@"Null backup UDID"];
  }
  id v5 = +[NSMutableArray array];
  id v6 = [(MBServiceCache *)self _prepare:@"select * from Snapshots where backupUDID = ?"];
  [v6 bindText:a3 atIndex:1];
  if ([v6 step])
  {
    do
      objc_msgSend(v5, "addObject:", -[MBServiceCache _snapshotWithStmt:](self, "_snapshotWithStmt:", v6));
    while (([v6 step] & 1) != 0);
  }
  [v6 reset];
  [v5 sortUsingComparator:&stru_100415CD8];
  return v5;
}

- (void)addSnapshot:(id)a3 backupUDID:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:794 description:@"Null snapshot"];
    if (a4) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:795 description:@"Null backup UDID"];
LABEL_3:
  id v8 = [(MBServiceCache *)self _prepare:@"insert or replace into Snapshots values (?,?,?,?,?,?,?)"];
  [v8 bindText:a4 atIndex:1];
  objc_msgSend(v8, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 2);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "lastModified"), 3);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "committed"), 4);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "committed"), 5);
  [v8 bindInt:0 atIndex:6];
  objc_msgSend(v8, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "attributes"), "data"), 7);
  [v8 step];
  [v8 reset];
}

- (void)_removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"delete from Snapshots where backupUDID = ? and snapshotID = ?"];
  [v6 bindText:a4 atIndex:1];
  [v6 bindInteger:a3 atIndex:2];
  [v6 step];
  [v6 reset];
}

- (void)removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  id v9 = [(MBServiceCache *)self snapshotsForBackupUDID:a4];
  if ([v9 count])
  {
    id v10 = 0;
    while (1)
    {
      id v11 = [v9 objectAtIndexedSubscript:v10];
      if ([v11 snapshotID] == a3) {
        break;
      }
      if (++v10 >= [v9 count]) {
        return;
      }
    }
    if ([v11 committed])
    {
      if (v10 < (char *)[v9 count] - 1)
      {
        unint64_t v12 = objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", v10 + 1), "snapshotID");
        uint64_t v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v25 = a3;
          __int16 v26 = 2048;
          unint64_t v27 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Merging snapshot %lu into snapshot %lu", buf, 0x16u);
          unint64_t v21 = a3;
          unint64_t v23 = v12;
          _MBLog();
        }
        id v14 = [(MBServiceCache *)self _prepare:@"update or ignore Files set snapshotID = ? where backupUDID = ? and snapshotID = ?", v21, v23];
        [v14 bindInteger:v12 atIndex:1];
        [v14 bindText:a4 atIndex:2];
        [v14 bindInteger:a3 atIndex:3];
        [v14 step];
        [v14 reset];
        id v15 = [(MBServiceCache *)self _prepare:@"update Files set duplicateFileID = null, duplicateSnapshotID = 0 where backupUDID = ? and snapshotID = ? and duplicateSnapshotID = ?"];
        [v15 bindText:a4 atIndex:1];
        [v15 bindInteger:v12 atIndex:2];
        [v15 bindInteger:a3 atIndex:3];
        [v15 step];
        [v15 reset];
        if (!v10)
        {
          __int16 v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Discarding deleted files from snapshot %lu", buf, 0xCu);
            unint64_t v22 = v12;
            _MBLog();
          }
          id v17 = [(MBServiceCache *)self _prepare:@"delete from Files where backupUDID = ? and snapshotID = ? and deleted = 1", v22];
          [v17 bindText:a4 atIndex:1];
          [v17 bindInteger:v12 atIndex:2];
          [v17 step];
          [v17 reset];
        }
        id v18 = [(MBServiceCache *)self _prepare:@"update Snapshots set lastModified = ? where backupUDID = ? and snapshotID = ?"];
        [v18 bindInt64:a5 atIndex:1];
        [v18 bindText:a4 atIndex:2];
        [v18 bindInteger:v12 atIndex:3];
        [v18 step];
        [v18 reset];
        goto LABEL_20;
      }
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removing last snapshot", buf, 2u);
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removing uncommitted snapshot", buf, 2u);
LABEL_19:
        _MBLog();
      }
    }
LABEL_20:
    [(MBServiceCache *)self _removeSnapshotForID:a3 backupUDID:a4];
  }
}

- (void)mergeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  id v10 = [(MBServiceCache *)self snapshotsForBackupUDID:a4];
  if (![v10 count]) {
    return;
  }
  uint64_t v11 = 0;
  while (1)
  {
    id v12 = [v10 objectAtIndexedSubscript:v11];
    if ([v12 snapshotID] == a3) {
      break;
    }
    if (++v11 >= (unint64_t)[v10 count]) {
      return;
    }
  }
  if (![v12 committed])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:880 description:@"Cannot merge uncommitted snapshots"];
    if (v11) {
      goto LABEL_8;
    }
LABEL_17:
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:881 description:@"Cannot merge first snapshot"];
    goto LABEL_8;
  }
  if (!v11) {
    goto LABEL_17;
  }
LABEL_8:
  int64_t v13 = -[MBServiceCache localCommittedForSnapshotID:backupUDID:](self, "localCommittedForSnapshotID:backupUDID:", [v12 snapshotID], a4);
  unint64_t v14 = objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1), "snapshotID");
  id v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Merging snapshot %lu into snapshot %lu", buf, 0x16u);
    unint64_t v21 = a3;
    unint64_t v23 = v14;
    _MBLog();
  }
  id v16 = [(MBServiceCache *)self _prepare:@"update or replace Files set snapshotID = ? where backupUDID = ? and snapshotID = ?", v21, v23];
  [v16 bindInteger:v14 atIndex:1];
  [v16 bindText:a4 atIndex:2];
  [v16 bindInteger:a3 atIndex:3];
  [v16 step];
  [v16 reset];
  id v17 = [(MBServiceCache *)self _prepare:@"update Files set duplicateFileID = null, duplicateSnapshotID = 0 where backupUDID = ? and snapshotID = ? and duplicateSnapshotID = ?"];
  [v17 bindText:a4 atIndex:1];
  [v17 bindInteger:v14 atIndex:2];
  [v17 bindInteger:a3 atIndex:3];
  [v17 step];
  [v17 reset];
  if (v11 == 1)
  {
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Discarding deleted files from snapshot %lu", buf, 0xCu);
      unint64_t v22 = v14;
      _MBLog();
    }
    id v19 = [(MBServiceCache *)self _prepare:@"delete from Files where backupUDID = ? and snapshotID = ? and deleted = 1", v22];
    [v19 bindText:a4 atIndex:1];
    [v19 bindInteger:v14 atIndex:2];
    [v19 step];
    [v19 reset];
  }
  id v20 = [(MBServiceCache *)self _prepare:@"update Snapshots set lastModified = ?, committed = ?, localCommitted = ?, attributes = ? where backupUDID = ? and snapshotID = ?"];
  [v20 bindInt64:a5 atIndex:1];
  objc_msgSend(v20, "bindInt64:atIndex:", objc_msgSend(v12, "committed"), 2);
  [v20 bindInt64:v13 atIndex:3];
  objc_msgSend(v20, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(v12, "attributes"), "data"), 4);
  [v20 bindText:a4 atIndex:5];
  [v20 bindInteger:v14 atIndex:6];
  [v20 step];
  [v20 reset];
  [(MBServiceCache *)self _removeSnapshotForID:a3 backupUDID:a4];
}

- (BOOL)areAllFilesCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"select count(*) from Files where backupUDID = ? and snapshotID = ? and committed = 0"];
  [v6 bindText:a4 atIndex:1];
  [v6 bindInteger:a3 atIndex:2];
  if ([v6 step])
  {
    BOOL v7 = [v6 intColumn:0] == 0;
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Snapshot not found: %d", a3 format];
    BOOL v7 = 0;
  }
  [v6 reset];
  return v7;
}

- (void)setLastModified:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  if (!a5) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:947 description:@"Null backup UDID"];
  }
  id v9 = [(MBServiceCache *)self _prepare:@"update Snapshots set lastModified = ? where backupUDID = ? and snapshotID = ?"];
  [v9 bindInt64:a3 atIndex:1];
  [v9 bindText:a5 atIndex:2];
  [v9 bindInteger:a4 atIndex:3];
  [v9 step];
  [v9 reset];
}

- (void)setCommitted:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  if (!a5) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:958 description:@"Null backup UDID"];
  }
  if (![(MBServiceCache *)self areAllFilesCommittedForSnapshotID:a4 backupUDID:a5])[+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:959 description:@"Not all files in snapshot have been committed"]; {
  id v10 = [(MBServiceCache *)self _prepare:@"update Snapshots set committed = ? where backupUDID = ? and snapshotID = ?"];
  }
  [v10 bindInt64:a3 atIndex:1];
  [v10 bindText:a5 atIndex:2];
  [v10 bindInteger:a4 atIndex:3];
  [v10 step];
  [v10 reset];
}

- (BOOL)isStaleSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"select stale from Snapshots where backupUDID = ? and snapshotID = ?"];
  [v6 bindText:a4 atIndex:1];
  [v6 bindInteger:a3 atIndex:2];
  if ([v6 step])
  {
    BOOL v7 = [v6 intColumn:0] != 0;
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Snapshot not found: %d", a3 format];
    BOOL v7 = 0;
  }
  [v6 reset];
  return v7;
}

- (void)setStale:(BOOL)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(MBServiceCache *)self _prepare:@"update Snapshots set stale = ? where backupUDID = ? and snapshotID = ?"];
  [v8 bindInt:v7 atIndex:1];
  [v8 bindText:a5 atIndex:2];
  [v8 bindInteger:a4 atIndex:3];
  [v8 step];
  [v8 reset];
}

- (int64_t)localCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"select localCommitted from Snapshots where backupUDID = ? and snapshotID = ?"];
  [v6 bindText:a4 atIndex:1];
  [v6 bindInteger:a3 atIndex:2];
  if ([v6 step])
  {
    id v7 = [v6 int64Column:0];
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Snapshot not found: %d", a3 format];
    id v7 = 0;
  }
  [v6 reset];
  return (int64_t)v7;
}

- (void)setLocalCommitted:(int64_t)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v8 = [(MBServiceCache *)self _prepare:@"update Snapshots set localCommitted = ? where backupUDID = ? and snapshotID = ?"];
  [v8 bindInt64:a3 atIndex:1];
  [v8 bindText:a5 atIndex:2];
  [v8 bindInteger:a4 atIndex:3];
  [v8 step];
  [v8 reset];
}

- (id)_fileWithStmt:(id)a3
{
  id v5 = [a3 int64Column:0];
  id v6 = [a3 textColumn:4];
  id v7 = [a3 textColumn:5];
  id v8 = [(MBDomainManager *)self->_domainManager domainForName:v6];
  if (!v8) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:205, @"Domain not found: %@", v6 format]);
  }
  id v9 = +[MBFile fileWithDomain:v8 relativePath:v7];
  -[MBFile setSnapshotID:](v9, "setSnapshotID:", (int)[a3 intColumn:2]);
  -[MBFile setCommitted:](v9, "setCommitted:", [a3 intColumn:9] != 0);
  -[MBFile setDeleted:](v9, "setDeleted:", [a3 intColumn:10] != 0);
  -[MBFile setTarget:](v9, "setTarget:", [a3 textColumn:13]);
  -[MBFile setKeybagID:](v9, "setKeybagID:", [a3 intColumn:14]);
  -[MBFile setEncryptionKey:](v9, "setEncryptionKey:", [a3 blobColumn:15]);
  -[MBFile setEncryptionKeyVersion:](v9, "setEncryptionKeyVersion:", (int)[a3 intColumn:16]);
  -[MBFile setDecryptedSize:](v9, "setDecryptedSize:", [a3 int64Column:17]);
  -[MBFile setDigest:](v9, "setDigest:", [a3 blobColumn:6]);
  int v22 = 0;
  long long v21 = 0u;
  long long v16 = 0u;
  int v23 = (unsigned __int16)[a3 intColumn:18];
  *(void *)&long long v21 = (int)[a3 intColumn:19];
  DWORD1(v16) = [a3 intColumn:20];
  DWORD2(v16) = [a3 intColumn:21];
  id v18 = [a3 int64Column:22];
  id v19 = [a3 int64Column:23];
  id v17 = [a3 int64Column:24];
  id v20 = [a3 int64Column:7];
  HIWORD(v23) = [a3 intColumn:25];
  [(MBFile *)v9 setNode:&v16];
  signed int v10 = [a3 intColumn:25];
  uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:v10];
  if (v10)
  {
    id v12 = [(MBServiceCache *)self _prepare:@"select name, value from FileExtendedAttributes where fileRowID = ?"];
    [v12 bindInt64:v5 atIndex:1];
    if ([v12 step])
    {
      do
      {
        id v13 = [v12 textColumn:0];
        unint64_t v14 = (NSData *)[v12 blobColumn:1];
        if (!v14) {
          unint64_t v14 = +[NSData data];
        }
        [(NSMutableDictionary *)v11 setObject:v14 forKeyedSubscript:v13];
      }
      while (([v12 step] & 1) != 0);
    }
    [v12 reset];
  }
  [(MBFile *)v9 setExtendedAttributes:v11];
  return v9;
}

- (id)fileForID:(id)a3 backupUDID:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1082 description:@"Null file ID"];
    if (a4) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1083 description:@"Null backup UDID"];
LABEL_3:
  id v8 = +[NSMutableArray array];
  id v9 = [(MBServiceCache *)self _prepare:@"select * from Files where backupUDID = ? and fileID = ?"];
  [v9 bindText:a4 atIndex:1];
  objc_msgSend(v9, "bindText:atIndex:", objc_msgSend(a3, "string"), 2);
  if ([v9 step])
  {
    do
      objc_msgSend(v8, "addObject:", -[MBServiceCache _fileWithStmt:](self, "_fileWithStmt:", v9));
    while (([v9 step] & 1) != 0);
  }
  [v9 reset];
  [v8 sortUsingComparator:&stru_100415CF8];
  return [v8 lastObject];
}

- (id)fileForID:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1105 description:@"Null file ID"];
    if (a5) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1106 description:@"Null backup UDID"];
LABEL_3:
  id v10 = [(MBServiceCache *)self _prepare:@"select * from Files where backupUDID = ? and snapshotID = ? and fileID = ?"];
  [v10 bindText:a5 atIndex:1];
  [v10 bindInteger:a4 atIndex:2];
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a3, "string"), 3);
  if ([v10 step]) {
    id v11 = [(MBServiceCache *)self _fileWithStmt:v10];
  }
  else {
    id v11 = 0;
  }
  [v10 reset];
  return v11;
}

- (BOOL)encryptedFilesExistForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1123 description:@"Null backup UDID"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"select count(*) from Files where backupUDID = ? and encryptionKey is not null"];
  [v5 bindText:a3 atIndex:1];
  if ([v5 step]) {
    BOOL v6 = [v5 intColumn:0] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  [v5 reset];
  return v6;
}

- (BOOL)encryptedFilesExistForBackupUDID:(id)a3 keybagID:(int64_t)a4
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1137 description:@"Null backup UDID"];
  }
  id v7 = [(MBServiceCache *)self _prepare:@"select count(*) from Files where backupUDID = ? and keybagID = ? and encryptionKey is not null"];
  [v7 bindText:a3 atIndex:1];
  [v7 bindInteger:a4 atIndex:2];
  if ([v7 step]) {
    BOOL v8 = [v7 intColumn:0] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  [v7 reset];
  return v8;
}

- (void)addFile:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5 committed:(BOOL)a6
{
  BOOL v6 = a6;
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1152 description:@"Null file"];
  }
  if (([a3 verifyWithError:0] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1153 description:@"Invalid file"];
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "duplicateFile"), "fileID"), "isEqualToData:", objc_msgSend(a3, "fileID"))&& objc_msgSend(objc_msgSend(a3, "duplicateFile"), "snapshotID") == a4)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBServiceCache.m", 1155, @"Self-referencing duplicate file: %@:%@ (%@)", [a3 domain], objc_msgSend(a3, "relativePath"), objc_msgSend(a3, "fileID"));
    if (a5) {
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    goto LABEL_8;
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1156 description:@"Null backup UDID"];
LABEL_8:
  id v12 = [(MBServiceCache *)self _prepare:@"insert or replace into Files values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"];
  [v12 bindText:a5 atIndex:1];
  [v12 bindInt:a4 atIndex:2];
  [a3 fileID];
  [v12 bindText:MBStringWithData() atIndex:3];
  objc_msgSend(v12, "bindText:atIndex:", objc_msgSend(a3, "domain"), 4);
  CFStringRef v13 = (const __CFString *)[a3 relativePath];
  if (v13) {
    CFStringRef v14 = v13;
  }
  else {
    CFStringRef v14 = &stru_100418BA8;
  }
  [v12 bindText:v14 atIndex:5];
  objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(a3, "signature"), 6);
  objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(a3, "size"), 7);
  objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(a3, "added"), 8);
  [v12 bindInt:v6 atIndex:9];
  objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(a3, "hasAttributes") ^ 1, 10);
  objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFile"), "fileID"), 11);
  objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFile"), "snapshotID"), 12);
  if ([a3 hasAttributes])
  {
    id v15 = [a3 attributes];
    objc_msgSend(v12, "bindText:atIndex:", objc_msgSend(v15, "target"), 13);
    objc_msgSend(v12, "bindInteger:atIndex:", objc_msgSend(v15, "keybagID"), 14);
    objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(v15, "encryptionKey"), 15);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "encryptionKeyVersion"), 16);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "decryptedSize"), 17);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "mode"), 18);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "inodeNumber"), 19);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "userID"), 20);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "groupID"), 21);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "lastModified"), 22);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "lastStatusChange"), 23);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "birth"), 24);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "protectionClass"), 25);
    objc_msgSend(v12, "bindInteger:atIndex:", objc_msgSend(v15, "extendedAttributesCount"), 26);
  }
  [v12 step];
  [v12 reset];
  if (objc_msgSend(objc_msgSend(a3, "attributes"), "extendedAttributesCount"))
  {
    int64_t v16 = [(MBServiceCache *)self _lastInsertRowID];
    id v17 = [(MBServiceCache *)self _prepare:@"insert or replace into FileExtendedAttributes values (?,?,?)"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = objc_msgSend(objc_msgSend(a3, "attributes"), "extendedAttributes");
    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          int v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v17 bindInt64:v16 atIndex:1];
          objc_msgSend(v17, "bindText:atIndex:", objc_msgSend(v23, "name"), 2);
          objc_msgSend(v17, "bindBlob:atIndex:", objc_msgSend(v23, "value"), 3);
          [v17 step];
          [v17 reset];
        }
        id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }
  }
}

- (void)removeFileID:(id)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v8 = [(MBServiceCache *)self _prepare:@"delete from Files where backupUDID = ? and snapshotID = ? and fileID = ?"];
  [v8 bindText:a5 atIndex:1];
  [v8 bindInteger:a4 atIndex:2];
  objc_msgSend(v8, "bindText:atIndex:", objc_msgSend(a3, "string"), 3);
  [v8 step];
  [v8 reset];
}

- (void)setCommitted:(BOOL)a3 forFileID:(id)a4 snapshotID:(unint64_t)a5 backupUDID:(id)a6
{
  BOOL v9 = a3;
  id v10 = [(MBServiceCache *)self _prepare:@"update Files set committed = ? where fileID = ? and snapshotID = ? and backupUDID = ?"];
  [v10 bindInt:v9 atIndex:1];
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a4, "string"), 2);
  [v10 bindInteger:a5 atIndex:3];
  [v10 bindText:a6 atIndex:4];
  [v10 step];
  [v10 reset];
}

- (id)_fileIDEnumeratorWithStmt:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001CB2B0;
  v4[3] = &unk_100415D20;
  v4[5] = self;
  v4[6] = a2;
  v4[4] = a3;
  return +[MBSCacheEnumerator enumeratorWithStmt:a3 block:v4];
}

- (id)fileIDEnumeratorForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1236 description:@"Null backup UDID"];
  }
  id v7 = [(MBServiceCache *)self _prepare:@"select fileID from Files where backupUDID = ? and snapshotID = ?"];
  [v7 bindText:a4 atIndex:1];
  [v7 bindInteger:a3 atIndex:2];
  return [(MBServiceCache *)self _fileIDEnumeratorWithStmt:v7];
}

- (id)encryptedFileIDEnumeratorForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1246 description:@"Null backup UDID"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"select fileID from Files where backupUDID = ? and encryptionKey is not null and encryptionKeyVersion > 1 and keybagID > 2"];
  [v5 bindText:a3 atIndex:1];
  return [(MBServiceCache *)self _fileIDEnumeratorWithStmt:v5];
}

- (id)deletedFileIDEnumeratorForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1255 description:@"Null backup UDID"];
  }
  id v5 = [(MBServiceCache *)self _prepare:@"select distinct fileID from Files where backupUDID = ? and fileID not in (select fileID from FileChanges)"];
  [v5 bindText:a3 atIndex:1];
  return [(MBServiceCache *)self _fileIDEnumeratorWithStmt:v5];
}

- (id)encryptionKeyForFileWithID:(id)a3 backupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"select encryptionKey from Files where backupUDID = ? and fileID = ? and encryptionKeyVersion >= 2 order by snapshotID desc limit 1"];
  [v6 bindText:a4 atIndex:1];
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "string"), 2);
  if ([v6 step]) {
    id v7 = [v6 blobColumn:0];
  }
  else {
    id v7 = 0;
  }
  [v6 reset];
  return v7;
}

- (unint64_t)nextBackupSizeWithUDID:(id)a3
{
  id v5 = [(MBServiceCache *)self _prepare:@"select sum(size) from Files, Snapshots where Files.backupUDID = ?1 and Snapshots.backupUDID = ?1 and Files.snapshotID = Snapshots.snapshotID and Snapshots.committed != 0 and duplicateFileID is null"];
  [v5 bindText:a3 atIndex:1];
  if ([v5 step]) {
    id v6 = [v5 int64Column:0];
  }
  else {
    id v6 = 0;
  }
  [v5 reset];
  id v7 = [(MBServiceCache *)self _prepare:@"select sum(size) from FileChanges where (type = 1 or type = 2) and duplicateFileID is null and domainName not in (select domainName from DisabledDomains)"];
  if ([v7 step]) {
    id v8 = [v7 int64Column:0];
  }
  else {
    id v8 = 0;
  }
  [v7 reset];
  return (unint64_t)v6 + (void)v8;
}

- (id)domainNamesForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1304 description:@"Null backup UDID"];
  }
  id v5 = +[NSMutableArray array];
  id v6 = [(MBServiceCache *)self _prepare:@"select domainName from Files where backupUDID = ? and domainName is not null union select domainName from FileChanges where domainName is not null"];
  [v6 bindText:a3 atIndex:1];
  if ([v6 step])
  {
    do
      objc_msgSend(v5, "addObject:", objc_msgSend(v6, "textColumn:", 0));
    while (([v6 step] & 1) != 0);
  }
  [v6 reset];
  return v5;
}

- (id)activeDomainNamesForBackupUDID:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1319 description:@"Null backup UDID"];
  }
  id v5 = +[NSMutableArray array];
  id v6 = [(MBServiceCache *)self _prepare:@"select distinct domainName from Files where backupUDID = ? and domainName is not null"];
  [v6 bindText:a3 atIndex:1];
  if ([v6 step])
  {
    do
      objc_msgSend(v5, "addObject:", objc_msgSend(v6, "textColumn:", 0));
    while (([v6 step] & 1) != 0);
  }
  [v6 reset];
  return v5;
}

- (id)domainInfoForName:(id)a3 backupUDID:(id)a4
{
  id v7 = [(MBServiceCache *)self _prepare:@"select sum(size) from Files, Snapshots where Files.backupUDID = ?1 and Snapshots.backupUDID = ?1 and Files.snapshotID = Snapshots.snapshotID and Files.domainName = ?2 and Snapshots.committed != 0 and duplicateFileID is null"];
  [v7 bindText:a4 atIndex:1];
  [v7 bindText:a3 atIndex:2];
  if ([v7 step]) {
    id v8 = [v7 int64Column:0];
  }
  else {
    id v8 = 0;
  }
  [v7 reset];
  id v9 = [(MBServiceCache *)self _prepare:@"select sum(size) from FileChanges where domainName = ? and (type = 1 or type = 2) and duplicateFileID is null"];
  [v9 bindText:a3 atIndex:1];
  if ([v9 step]) {
    id v10 = [v9 int64Column:0];
  }
  else {
    id v10 = 0;
  }
  [v9 reset];
  id v11 = [(MBServiceCache *)self _prepare:@"select restricted from DisabledDomains where domainName = ?"];
  [v11 bindText:a3 atIndex:1];
  unsigned int v12 = [v11 step];
  if (v12) {
    BOOL v13 = [v11 intColumn:0] != 0;
  }
  else {
    BOOL v13 = 0;
  }
  [v11 reset];
  return +[MBDomainInfo domainInfoWithName:a3 systemApp:0 remoteSize:v8 localSize:v10 enabled:v12 ^ 1 restricted:v13];
}

- (id)_disabledDomainNames
{
  id result = self->_disabledDomainNames;
  if (!result)
  {
    self->_disabledDomainNames = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v4 = [(MBServiceCache *)self _prepare:@"select domainName from DisabledDomains"];
    if ([v4 step])
    {
      do
        -[NSMutableSet addObject:](self->_disabledDomainNames, "addObject:", [v4 textColumn:0]);
      while (([v4 step] & 1) != 0);
    }
    [v4 reset];
    return self->_disabledDomainNames;
  }
  return result;
}

- (BOOL)isDomainNameEnabled:(id)a3
{
  return objc_msgSend(-[MBServiceCache _disabledDomainNames](self, "_disabledDomainNames"), "containsObject:", a3) ^ 1;
}

- (void)setDisabledDomainNames:(id)a3 restrictedDomainNames:(id)a4
{
  self->_disabledDomainNames = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  [(MBServiceCache *)self begin];
  [(MBServiceCache *)self removeAllDisabledDomains];
  [(MBServiceCache *)self addDisabledDomainNames:a3 restricted:0];
  [(MBServiceCache *)self addDisabledDomainNames:a4 restricted:1];
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "domainNamesNotToBackUp"), 1);
  [(MBServiceCache *)self end];
}

- (void)addDisabledDomainNames:(id)a3 restricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MBServiceCache *)self _prepare:@"insert or replace into DisabledDomains values (?,?)"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(a3);
        }
        [v7 bindText:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) atIndex:1];
        [v7 bindInt:v4 atIndex:2];
        [v7 step];
        [v7 reset];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  -[NSMutableSet addObjectsFromArray:](self->_disabledDomainNames, "addObjectsFromArray:", [a3 allObjects]);
}

- (void)removeDisabledDomainNames:(id)a3
{
  id v5 = [(MBServiceCache *)self _prepare:@"delete from DisabledDomains where domainName = ?"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        [v5 bindText:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) atIndex:1];
        [v5 step];
        [v5 reset];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(NSMutableSet *)self->_disabledDomainNames minusSet:a3];
}

- (void)removeAllDisabledDomains
{
  id v3 = [(MBServiceCache *)self _prepare:@"delete from DisabledDomains"];
  [v3 step];
  [v3 reset];
  disabledDomainNames = self->_disabledDomainNames;
  [(NSMutableSet *)disabledDomainNames removeAllObjects];
}

- (id)_lastRefreshPropertyKeyForBackupUDID:(id)a3
{
  if (a3) {
    return +[NSString stringWithFormat:@"%@.%@", @"DateOfLastRefresh", a3];
  }
  else {
    return @"DateOfLastRefresh";
  }
}

- (id)dateOfLastRefreshForBackupUDID:(id)a3
{
  id result = [(MBServiceCache *)self propertyForKey:[(MBServiceCache *)self _lastRefreshPropertyKeyForBackupUDID:a3]];
  if (result)
  {
    [result doubleValue];
    return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  return result;
}

- (BOOL)isRefreshNeededForBackupUDID:(id)a3
{
  upToDateBackupUDIDs = self->_upToDateBackupUDIDs;
  objc_sync_enter(upToDateBackupUDIDs);
  LOBYTE(a3) = [(NSMutableSet *)self->_upToDateBackupUDIDs containsObject:a3] ^ 1;
  objc_sync_exit(upToDateBackupUDIDs);
  return (char)a3;
}

- (void)forceRefreshForBackupUDID:(id)a3
{
  upToDateBackupUDIDs = self->_upToDateBackupUDIDs;
  objc_sync_enter(upToDateBackupUDIDs);
  [(NSMutableSet *)self->_upToDateBackupUDIDs removeObject:a3];
  objc_sync_exit(upToDateBackupUDIDs);
}

- (BOOL)_rebuildSnapshot:(id)a3 backupUDID:(id)a4 service:(id)a5 error:(id *)a6
{
  id v7 = a5;
  long long v11 = 0;
  long long v12 = ATClientController_ptr;
  while (1)
  {
    id v13 = objc_alloc_init((Class)v12[97]);
    id v14 = objc_msgSend(v7, "listFilesForBackupUDID:snapshotID:offset:limit:error:", a4, objc_msgSend(a3, "snapshotID"), v11, objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "listFilesCount"), a6);
    if (!v14) {
      break;
    }
    long long v15 = v14;
    if (![v14 count]) {
      goto LABEL_34;
    }
    v37 = v11;
    v38 = v13;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v15;
    id v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v41;
      while (2)
      {
        id v19 = 0;
        do
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v19);
          if (![v20 verifyWithError:a6])
          {
            if (!a6)
            {
              v32 = v38;
              goto LABEL_31;
            }
            id v29 = *a6;
            id v13 = v38;
            if (!*a6) {
              goto LABEL_28;
            }
            goto LABEL_27;
          }
          uint64_t v21 = a6;
          int v22 = +[MBFileID fileIDWithData:](MBFileID, "fileIDWithData:", [v20 fileID]);
          id v23 = [v20 MBFileWithDomainManager:self->_domainManager];
          id v24 = -[MBServiceCache fileForID:snapshotID:backupUDID:](self, "fileForID:snapshotID:backupUDID:", v22, [a3 snapshotID], a4);
          if ([a3 committed]
            || ![v23 isRegularFile]
            || objc_msgSend(objc_msgSend(objc_msgSend(v20, "duplicateFile"), "fileID"), "length"))
          {
            uint64_t v25 = 1;
          }
          else if (v24 {
                 && [v24 isCommitted]
          }
                 && objc_msgSend(objc_msgSend(v24, "digest"), "isEqualToData:", objc_msgSend(v20, "signature")))
          {
            uint64_t v25 = [v24 isStatusChangedComparedToFile:v23] ^ 1;
          }
          else
          {
            uint64_t v25 = 0;
          }
          [(MBServiceCache *)self addFile:v20 snapshotID:0 backupUDID:a4 committed:v25];
          id v19 = (char *)v19 + 1;
          a6 = v21;
        }
        while (v17 != v19);
        id v26 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        id v17 = v26;
        if (v26) {
          continue;
        }
        break;
      }
    }
    id v27 = [obj count];
    BOOL v28 = v27 >= objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "listFilesCount");
    id v13 = v38;
    id v7 = a5;
    long long v12 = ATClientController_ptr;
    if (!v28)
    {
LABEL_34:
      [v13 drain];
      -[MBServiceCache _removeSnapshotForID:backupUDID:](self, "_removeSnapshotForID:backupUDID:", [a3 snapshotID], a4);
      [(MBServiceCache *)self addSnapshot:a3 backupUDID:a4];
      id v35 = [(MBServiceCache *)self _prepare:@"update Files set snapshotID = ? where snapshotID = 0"];
      BOOL v33 = 1;
      objc_msgSend(v35, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 1);
      [v35 step];
      [v35 reset];
      return v33;
    }
    long long v11 = &v37[(void)[obj count]];
    [v38 drain];
  }
  if (a6)
  {
    id v29 = *a6;
    if (*a6) {
LABEL_27:
    }
      id v30 = v29;
LABEL_28:
    [v13 drain];
    if (*a6) {
      id v31 = *a6;
    }
  }
  else
  {
    v32 = v13;
LABEL_31:
    [v32 drain];
  }
  return 0;
}

- (BOOL)refreshForBackupUDID:(id)a3 service:(id)a4 deleted:(BOOL *)a5 error:(id *)a6
{
  if (*(double *)&a3 == 0.0)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1524 description:@"Null backup UDID"];
    if (a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
    goto LABEL_3;
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1525 description:@"Null service"];
LABEL_3:
  id v107 = 0;
  if (a5) {
    *a5 = 0;
  }
  if ([(MBServiceCache *)self isRefreshNeededForBackupUDID:a3])
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v110 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Refreshing cache for backup %@", buf, 0xCu);
      v78 = (NSDictionary *)a3;
      _MBLog();
    }
    id v82 = objc_alloc_init((Class)NSAutoreleasePool);
    if (!self->_configurationUpToDate)
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Getting configuration", buf, 2u);
        _MBLog();
      }
      long long v15 = +[MBServiceConfiguration configurationWithURL:MBServiceConfigurationURL() error:a6];
      if (!v15)
      {
        if (a6)
        {
          if (*a6) {
            id v75 = *a6;
          }
          objc_msgSend(v82, "drain", v78);
          if (*a6) {
            id v76 = *a6;
          }
        }
        else
        {
          [v82 drain];
        }
        return 0;
      }
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&id v17 = COERCE_DOUBLE([(MBServiceConfiguration *)v15 propertyList]);
        *(_DWORD *)buf = 138412290;
        double v110 = *(double *)&v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Configuration: %@", buf, 0xCu);
        v78 = [(MBServiceConfiguration *)v15 propertyList];
        _MBLog();
      }
      -[MBServiceCache setConfiguration:](self, "setConfiguration:", v15, v78);
      self->_configurationUpToDate = 1;
    }
    uint64_t v106 = 0;
    id v18 = objc_msgSend(a4, "backupForUDID:lastModified:error:", a3, &v106, &v107, v78);
    if (v18
      || (+[MBError isError:v107 withCode:4] & 1) != 0)
    {
      [(MBServiceCache *)self begin];
      uint64_t v105 = 0;
      v87 = self;
      id v19 = [(MBServiceCache *)self backupForUDID:a3 lastModified:&v105];
      id v20 = v19;
      if (!v18)
      {
        id v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Backup not found by service", buf, 2u);
          _MBLog();
        }
        if (v20)
        {
          if (a5) {
            *a5 = 1;
          }
          [(MBServiceCache *)self removeBackupForUDID:a3];
        }
        goto LABEL_94;
      }
      if (v19)
      {
        if (v105 != v106)
        {
          uint64_t v21 = MBGetDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)&int v22 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:(double)v105]);
            id v23 = +[NSDate dateWithTimeIntervalSince1970:(double)v106];
            *(_DWORD *)buf = 138412546;
            double v110 = *(double *)&v22;
            __int16 v111 = 2112;
            v112 = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Backup modified (%@ != %@)", buf, 0x16u);
            v79 = +[NSDate dateWithTimeIntervalSince1970:(double)v105];
            v80 = +[NSDate dateWithTimeIntervalSince1970:(double)v106];
            _MBLog();
          }
          -[MBServiceCache setLastModified:forBackupUDID:](self, "setLastModified:forBackupUDID:", v106, a3, v79, v80);
        }
      }
      else
      {
        id v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Backup not found in cache", buf, 2u);
          _MBLog();
        }
        [(MBServiceCache *)self addBackup:v18 lastModified:v106];
      }
      id v84 = a4;
      id v28 = +[NSMutableDictionary dictionary];
      id v29 = +[NSMutableDictionary dictionary];
      v83 = a6;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v30 = [v18 snapshots];
      id v31 = [v30 countByEnumeratingWithState:&v101 objects:v117 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v102;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v102 != v32) {
              objc_enumerationMutation(v30);
            }
            objc_msgSend(v28, "setObject:forKey:", *(void *)(*((void *)&v101 + 1) + 8 * i), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i), "snapshotID")));
          }
          id v31 = [v30 countByEnumeratingWithState:&v101 objects:v117 count:16];
        }
        while (v31);
      }
      if (v20)
      {
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v34 = [v20 snapshots];
        id v35 = [v34 countByEnumeratingWithState:&v97 objects:v116 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v98;
          do
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v98 != v36) {
                objc_enumerationMutation(v34);
              }
              objc_msgSend(v29, "setObject:forKey:", *(void *)(*((void *)&v97 + 1) + 8 * (void)j), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v97 + 1) + 8 * (void)j), "snapshotID")));
            }
            id v35 = [v34 countByEnumeratingWithState:&v97 objects:v116 count:16];
          }
          while (v35);
        }
      }
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v38 = [v28 countByEnumeratingWithState:&v93 objects:v115 count:16];
      if (!v38) {
        goto LABEL_83;
      }
      uint64_t v85 = *(void *)v94;
LABEL_51:
      id v86 = v38;
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v94 != v85) {
          objc_enumerationMutation(v28);
        }
        uint64_t v40 = *(void *)(*((void *)&v93 + 1) + 8 * v39);
        id v41 = [v28 objectForKeyedSubscript:v40];
        unsigned int v42 = [v41 snapshotID];
        id v43 = [v29 objectForKeyedSubscript:v40];
        v44 = v43;
        if (!v43) {
          break;
        }
        if (![v43 committed]
          && [(MBServiceCache *)v87 isStaleSnapshotID:v42 backupUDID:a3])
        {
          v45 = MBGetDefaultLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&double v110 = v42;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Rebuilding uncommitted snapshot %lu", buf, 0xCu);
            v79 = (NSDate *)v42;
            _MBLog();
          }
          goto LABEL_78;
        }
        id v46 = [v44 lastModified];
        if (v46 != [v41 lastModified])
        {
          v58 = MBGetDefaultLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 lastModified]);
            v60 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 lastModified]);
            *(_DWORD *)buf = 134218498;
            *(void *)&double v110 = v42;
            __int16 v111 = 2112;
            v112 = v59;
            __int16 v113 = 2112;
            v114 = v60;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Rebuilding modified snapshot %lu (%@ != %@)", buf, 0x20u);
            a6 = v83;
            v80 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 lastModified]);
            v81 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 lastModified]);
            v79 = (NSDate *)v42;
            _MBLog();
          }
          goto LABEL_78;
        }
        v47 = MBGetDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&double v110 = v42;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Snapshot %lu is unmodified", buf, 0xCu);
          v79 = (NSDate *)v42;
          _MBLog();
        }
        id v48 = objc_msgSend(v44, "lastModified", v79);
        if (v48 != [v41 lastModified])
        {
          v49 = MBGetDefaultLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 lastModified]);
            v51 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 lastModified]);
            *(_DWORD *)buf = 134218498;
            *(void *)&double v110 = v42;
            __int16 v111 = 2112;
            v112 = v50;
            __int16 v113 = 2112;
            v114 = v51;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu last-modified value (%@ != %@)", buf, 0x20u);
            a6 = v83;
            v80 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 lastModified]);
            v81 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 lastModified]);
            v79 = (NSDate *)v42;
            _MBLog();
          }
          -[MBServiceCache setLastModified:forSnapshotID:backupUDID:](v87, "setLastModified:forSnapshotID:backupUDID:", objc_msgSend(v41, "lastModified", v79, v80, v81), v42, a3);
        }
        id v52 = [v44 committed];
        if (v52 != [v41 committed])
        {
          v53 = MBGetDefaultLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 committed]);
            v55 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 committed]);
            *(_DWORD *)buf = 134218498;
            *(void *)&double v110 = v42;
            __int16 v111 = 2112;
            v112 = v54;
            __int16 v113 = 2112;
            v114 = v55;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu committed value (%@ != %@)", buf, 0x20u);
            a6 = v83;
            v80 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v44 committed]);
            v81 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v41 committed]);
            v79 = (NSDate *)v42;
            _MBLog();
          }
          -[MBServiceCache setCommitted:forSnapshotID:backupUDID:](v87, "setCommitted:forSnapshotID:backupUDID:", objc_msgSend(v41, "committed", v79), v42, a3);
        }
        if ((objc_msgSend(objc_msgSend(objc_msgSend(v44, "attributes"), "dictionaryRepresentation"), "isEqualToDictionary:", objc_msgSend(objc_msgSend(v41, "attributes"), "dictionaryRepresentation")) & 1) == 0)
        {
          v56 = MBGetDefaultLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&double v110 = v42;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu attributes", buf, 0xCu);
            v79 = (NSDate *)v42;
            _MBLog();
          }
          -[MBServiceCache addSnapshot:backupUDID:](v87, "addSnapshot:backupUDID:", v41, a3, v79);
        }
LABEL_79:
        if (!-[MBServiceCache localCommittedForSnapshotID:backupUDID:](v87, "localCommittedForSnapshotID:backupUDID:", v42, a3))-[MBServiceCache setLocalCommitted:snapshotID:backupUDID:](v87, "setLocalCommitted:snapshotID:backupUDID:", [v41 committed], v42, a3); {
        if (v86 == (id)++v39)
        }
        {
          id v38 = [v28 countByEnumeratingWithState:&v93 objects:v115 count:16];
          if (v38) {
            goto LABEL_51;
          }
LABEL_83:
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v61 = [v29 countByEnumeratingWithState:&v89 objects:v108 count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v90;
            do
            {
              for (k = 0; k != v61; k = (char *)k + 1)
              {
                if (*(void *)v90 != v62) {
                  objc_enumerationMutation(v29);
                }
                v64 = *(void **)(*((void *)&v89 + 1) + 8 * (void)k);
                if (![v28 objectForKeyedSubscript:v64])
                {
                  *(double *)&v65 = COERCE_DOUBLE([v64 integerValue]);
                  v66 = MBGetDefaultLog();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    double v110 = *(double *)&v65;
                    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Deleting snapshot %lu from cache", buf, 0xCu);
                    v79 = v65;
                    _MBLog();
                  }
                  -[MBServiceCache _removeSnapshotForID:backupUDID:](v87, "_removeSnapshotForID:backupUDID:", v65, a3, v79);
                }
              }
              id v61 = [v29 countByEnumeratingWithState:&v89 objects:v108 count:16];
            }
            while (v61);
          }
LABEL_94:
          [(MBServiceCache *)v87 end];
          [(MBServiceCache *)v87 analyze];
          [v82 drain];
          [+[NSDate date] timeIntervalSinceReferenceDate];
          v68 = +[NSString stringWithFormat:@"%f", v67];
          [(MBServiceCache *)v87 setProperty:v68 forKey:[(MBServiceCache *)v87 _lastRefreshPropertyKeyForBackupUDID:a3]];
          [(MBServiceCache *)v87 setProperty:v68 forKey:[(MBServiceCache *)v87 _lastRefreshPropertyKeyForBackupUDID:0]];
          v69 = MBGetDefaultLog();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            +[NSDate timeIntervalSinceReferenceDate];
            *(_DWORD *)buf = 134217984;
            double v110 = v70 - v12;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Refreshed cache in %0.3f s", buf, 0xCu);
            +[NSDate timeIntervalSinceReferenceDate];
            _MBLog();
          }
          upToDateBackupUDIDs = v87->_upToDateBackupUDIDs;
          objc_sync_enter(upToDateBackupUDIDs);
          [(NSMutableSet *)v87->_upToDateBackupUDIDs addObject:a3];
          objc_sync_exit(upToDateBackupUDIDs);
          [(MBServiceCache *)v87 repair];
          return 1;
        }
      }
      v57 = MBGetDefaultLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&double v110 = v42;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Adding snapshot %lu to cache", buf, 0xCu);
        v79 = (NSDate *)v42;
        _MBLog();
      }
LABEL_78:
      if (!-[MBServiceCache _rebuildSnapshot:backupUDID:service:error:](v87, "_rebuildSnapshot:backupUDID:service:error:", v41, a3, v84, a6, v79))
      {
        if (a6 && *a6) {
          id v72 = *a6;
        }
        [v82 drain];
        if (a6 && *a6) {
          id v73 = *a6;
        }
        BOOL v25 = 0;
        [(MBServiceCache *)v87 rollback];
        return v25;
      }
      goto LABEL_79;
    }
    if (a6)
    {
      *a6 = v107;
      [v82 drain];
      id v74 = v107;
    }
    else
    {
      [v82 drain];
    }
    return 0;
  }
  id v24 = MBGetDefaultLog();
  BOOL v25 = 1;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v110 = *(double *)&a3;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Not refreshing cache because backup is up-to-date: %@", buf, 0xCu);
    _MBLog();
    return 1;
  }
  return v25;
}

- (void)repair
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Repairing cache if needed", buf, 2u);
    _MBLog();
  }
  id v4 = [(MBServiceCache *)self _prepare:@"select count(*) from Files where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID"];
  [v4 step];
  id v5 = [v4 intColumn:0];
  [v4 reset];
  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = (int)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Repairing %d self referencing duplicate files in cache", buf, 8u);
      id v8 = v5;
      _MBLog();
    }
    id v7 = [(MBServiceCache *)self _prepare:@"update Files set duplicateFileID = null, duplicateSnapshotID = 0 where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID", v8];
    [v7 step];
    [v7 reset];
  }
}

- (void)verifyBackupUDID:(id)a3 service:(id)a4
{
  uint64_t v20 = 0;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Verifying cache", buf, 2u);
    _MBLog();
  }
  id v9 = [(MBServiceCache *)self _prepare:@"select count(*) from Files where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID"];
  [v9 step];
  id v10 = [v9 intColumn:0];
  [v9 reset];
  if (v10) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceCache.m", 1735, @"%d self referencing duplicate files in cache", v10 object file lineNumber description];
  }
  double v11 = [[MBServiceCache alloc] initWithPath:MBTemporaryPath() domainManager:self->_domainManager];
  [(MBServiceCache *)v11 open];
  byte_10047F418 = 1;
  if (![(MBServiceCache *)v11 refreshForBackupUDID:a3 service:a4 deleted:0 error:&v20])
  {
    double v12 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v12 handleFailureInMethod:a2, self, @"MBServiceCache.m", 1744, @"Failed to refresh temporary cache: %@", v20 object file lineNumber description];
  }
  byte_10047F418 = 0;
  id v13 = [(MBServiceCache *)v11 _prepare:@"select * from Backups where backupUDID = ?"];
  [v13 bindText:a3 atIndex:1];
  id v14 = [(MBServiceCache *)self _prepare:@"select * from Backups where backupUDID = ?"];
  [v14 bindText:a3 atIndex:1];
  [v13 verifyEqualToStmt:v14 exceptColumnNumbers:0];
  id v15 = [(MBServiceCache *)v11 _prepare:@"select * from Snapshots where backupUDID = ? order by snapshotID"];
  [v15 bindText:a3 atIndex:1];
  id v16 = [(MBServiceCache *)self _prepare:@"select * from Snapshots where backupUDID = ? order by snapshotID"];
  [v16 bindText:a3 atIndex:1];
  objc_msgSend(v15, "verifyEqualToStmt:exceptColumnNumbers:", v16, +[NSSet setWithObjects:](NSSet, "setWithObjects:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5), 0));
  id v17 = [(MBServiceCache *)v11 _prepare:@"select * from Files where backupUDID = ? order by snapshotID, fileID"];
  [v17 bindText:a3 atIndex:1];
  id v18 = [(MBServiceCache *)self _prepare:@"select * from Files where backupUDID = ? order by snapshotID, fileID"];
  [v18 bindText:a3 atIndex:1];
  objc_msgSend(v17, "verifyEqualToStmt:exceptColumnNumbers:", v18, +[NSSet setWithObjects:](NSSet, "setWithObjects:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9), 0));
  [(MBServiceCache *)v11 close];
  [(MBServiceCache *)v11 _remove];
}

- (id)_fileChangeFromStmt:(id)a3
{
  id v6 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", [a3 textColumn:0]);
  if (!v6) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1787 description:@"Failed to convert file change ID"];
  }
  id v7 = [a3 blobColumn:4];
  id v8 = [a3 intColumn:5];
  if (v7)
  {
    id v9 = v8;
    id v10 = objc_alloc_init(MBSFileReference);
    [(MBSFileReference *)v10 setFileID:v7];
    [(MBSFileReference *)v10 setSnapshotID:v9];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = +[MBServiceFileChange fileChange];
  [v11 setFileID:v6];
  objc_msgSend(v11, "setType:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v11, "setDomainName:", objc_msgSend(a3, "textColumn:", 2));
  objc_msgSend(v11, "setRelativePath:", objc_msgSend(a3, "textColumn:", 3));
  [v11 setDuplicateFileReference:v10];
  objc_msgSend(v11, "setSize:", objc_msgSend(a3, "int64Column:", 6));
  objc_msgSend(v11, "setResult:", objc_msgSend(a3, "intColumn:", 7));
  return v11;
}

- (id)fileChangeEnumerator
{
  return +[MBSFileChangeEnumerator enumeratorWithCache:self];
}

- (id)fileChangeIDsWithResult:(int)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = +[NSMutableArray array];
  id v10 = [(MBServiceCache *)self _prepare:@"select fileID from FileChanges where result = ? limit ? offset ?"];
  [v10 bindInt:v7 atIndex:1];
  [v10 bindInteger:a5 atIndex:2];
  [v10 bindInteger:a4 atIndex:3];
  if ([v10 step])
  {
    do
      objc_msgSend(v9, "addObject:", +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(v10, "textColumn:", 0)));
    while (([v10 step] & 1) != 0);
  }
  [v10 reset];
  return v9;
}

- (void)addFileChange:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1830 description:@"Null file change"];
  }
  if (![a3 fileID]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1831 description:@"Null file change ID"];
  }
  if (![a3 domainName]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1832 description:@"Null file change domain"];
  }
  if (![a3 relativePath]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1833 description:@"Null file change relative path"];
  }
  id v6 = [(MBServiceCache *)self _prepare:@"insert into FileChanges values (?,?,?,?,?,?,?,?)"];
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a3, "fileID"), "string"), 1);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "type"), 2);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "domainName"), 3);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "relativePath"), 4);
  objc_msgSend(v6, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "fileID"), 5);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "snapshotID"), 6);
  objc_msgSend(v6, "bindInt64:atIndex:", objc_msgSend(a3, "size"), 7);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "result"), 8);
  [v6 step];
  [v6 reset];
}

- (void)setResult:(int)a3 forFileChangeID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:1849 description:@"Null fileID"];
  }
  id v7 = [(MBServiceCache *)self _prepare:@"update FileChanges set result = ? where fileID = ?"];
  [v7 bindInt:v5 atIndex:1];
  objc_msgSend(v7, "bindText:atIndex:", objc_msgSend(a4, "string"), 2);
  [v7 step];
  [v7 reset];
}

- (void)fileChangeCount:(unint64_t *)a3 size:(unint64_t *)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"select count(*), sum(size) from FileChanges where (type = 1 or type = 2) and duplicateFileID is null and domainName not in (select domainName from DisabledDomains)"];
  if ([v6 step])
  {
    if (a3) {
      *a3 = (int)[v6 intColumn:0];
    }
    if (a4) {
      *a4 = (unint64_t)[v6 int64Column:1];
    }
  }
  [v6 reset];
}

- (void)updateFileChangesAfterCommittingSnapshot
{
  id v3 = [(MBServiceCache *)self _prepare:@"delete from FileChanges where type = 3"];
  [v3 step];
  [v3 reset];
  id v4 = [(MBServiceCache *)self _prepare:@"update FileChanges set type = 0 where (type = 1 or type = 2) and domainName not in (select domainName from DisabledDomains)"];
  [v4 step];
  [v4 reset];
  id v5 = [(MBServiceCache *)self _prepare:@"update FileChanges set type = 1 where (type = 0 or type = 2) and domainName in (select domainName from DisabledDomains)"];
  [v5 step];
  [v5 reset];
}

- (void)updateFileChangesAfterRemovingDomainName:(id)a3
{
  id v5 = [(MBServiceCache *)self _prepare:@"delete from FileChanges where domainName = ? and type = 3"];
  [v5 bindText:a3 atIndex:1];
  [v5 step];
  [v5 reset];
  id v6 = [(MBServiceCache *)self _prepare:@"update FileChanges set type = 1 where domainName = ?"];
  [v6 bindText:a3 atIndex:1];
  [v6 step];
  [v6 reset];
}

- (void)removeAllFileChanges
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from FileChanges"];
  [v2 step];
  [v2 reset];
}

- (BOOL)areFilesMissingEncryptionKey
{
  id v2 = [(MBServiceCache *)self _prepare:@"select count(*) from FilesMissingEncryptionKey"];
  if ([v2 step]) {
    BOOL v3 = [v2 intColumn:0] != 0;
  }
  else {
    BOOL v3 = 0;
  }
  [v2 reset];
  return v3;
}

- (id)pathsForFilesMissingEncryptionKeyWithOffset:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7 = +[NSMutableArray array];
  id v8 = [(MBServiceCache *)self _prepare:@"select path from FilesMissingEncryptionKey limit ? offset ?"];
  [v8 bindInteger:a4 atIndex:1];
  [v8 bindInteger:a3 atIndex:2];
  if ([v8 step])
  {
    do
      objc_msgSend(v7, "addObject:", objc_msgSend(v8, "textColumn:", 0));
    while (([v8 step] & 1) != 0);
  }
  [v8 reset];
  return v7;
}

- (void)addFileMissingEncryptionKeyWithPath:(id)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"insert or replace into FilesMissingEncryptionKey values (?)"];
  [v4 bindText:a3 atIndex:1];
  [v4 step];
  [v4 reset];
}

- (void)removeFileMissingEncryptionKeyWithPath:(id)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"delete from FilesMissingEncryptionKey where path = ?"];
  [v4 bindText:a3 atIndex:1];
  [v4 step];
  [v4 reset];
}

- (void)removeAllFilesMissingEncryptionKey
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from FilesMissingEncryptionKey"];
  [v2 step];
  [v2 reset];
}

- (id)encryptionKeyForFileWithInodeNumber:(unint64_t)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"select encryptionKey from FileEncryptionKeys where inodeNumber = ?"];
  [v4 bindInt64:a3 atIndex:1];
  if ([v4 step]) {
    id v5 = [v4 blobColumn:0];
  }
  else {
    id v5 = 0;
  }
  [v4 reset];
  return v5;
}

- (void)setFileEncryptionKey:(id)a3 forInodeNumber:(unint64_t)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"insert or replace into FileEncryptionKeys values (?,?)"];
  [v6 bindInt64:a4 atIndex:1];
  [v6 bindBlob:a3 atIndex:2];
  [v6 step];
  [v6 reset];
}

- (void)removeFileEncryptionKeyForInodeNumber:(unint64_t)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"delete from FileEncryptionKeys where inodeNumber = ?"];
  [v4 bindInt64:a3 atIndex:1];
  [v4 step];
  [v4 reset];
}

- (void)removeAllFileEncryptionKeys
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from FileEncryptionKeys"];
  [v2 step];
  [v2 reset];
}

- (unint64_t)restoreIDForMode:(id)a3
{
  if ([a3 value]) {
    CFStringRef v5 = @"select restoreID from Restores where type = ? and value = ?";
  }
  else {
    CFStringRef v5 = @"select restoreID from Restores where type = ? and value is null";
  }
  id v6 = [(MBServiceCache *)self _prepare:v5];
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "type"), 1);
  if ([a3 value]) {
    objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "value"), 2);
  }
  if ([v6 step])
  {
    signed int v7 = [v6 intColumn:0];
    [v6 reset];
    if (v7) {
      return v7;
    }
  }
  else
  {
    [v6 reset];
  }
  if ([a3 isForeground])
  {
    unint64_t v8 = 1;
  }
  else
  {
    id v9 = [(MBServiceCache *)self _prepare:@"select max(restoreID)+1 from Restores"];
    if ([v9 step]) {
      unint64_t v8 = (int)[v9 intColumn:0];
    }
    else {
      unint64_t v8 = 2;
    }
    [v9 reset];
  }
  id v10 = [(MBServiceCache *)self _prepare:@"insert into Restores values (?,?,?)"];
  [v10 bindInt:v8 atIndex:1];
  objc_msgSend(v10, "bindInt:atIndex:", objc_msgSend(a3, "type"), 2);
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a3, "value"), 3);
  [v10 step];
  [v10 reset];
  return v8;
}

- (id)restoreModeForBackgroundAppWithRestoreID:(unint64_t)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"select value from Restores where restoreID = ? and type = ?"];
  [v4 bindInt:a3 atIndex:1];
  [v4 bindInt:1 atIndex:2];
  if ([v4 step]) {
    CFStringRef v5 = +[MBServiceRestoreMode restoreModeWithType:value:](MBServiceRestoreMode, "restoreModeWithType:value:", 1, [v4 textColumn:0]);
  }
  else {
    CFStringRef v5 = 0;
  }
  [v4 reset];
  return v5;
}

- (void)setRestoreID:(unint64_t)a3 forType:(int)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = [(MBServiceCache *)self _prepare:@"select restoreID from Restores where type = ? and value = ?"];
  [v9 bindInt:v6 atIndex:1];
  [v9 bindText:a5 atIndex:2];
  if ([v9 step])
  {
    do
    {
      id v10 = [v9 intColumn:0];
      id v11 = [(MBServiceCache *)self _prepare:@"update Restores set restoreID = ? where restoreID = ?"];
      [v11 bindInt:a3 atIndex:1];
      [v11 bindInt:v10 atIndex:2];
      [v11 step];
      [v11 reset];
      id v12 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set restoreID = ? where restoreID = ?"];
      [v12 bindInt:a3 atIndex:1];
      [v12 bindInt:v10 atIndex:2];
      [v12 step];
      [v12 reset];
    }
    while (([v9 step] & 1) != 0);
  }
  [v9 reset];
}

- (void)removeAllRestores
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from Restores"];
  [v2 step];
  [v2 reset];
}

- (id)restoreBackupUDID
{
  return [(MBServiceCache *)self propertyForKey:@"RestoreBackupUDID"];
}

- (void)setRestoreBackupUDID:(id)a3
{
}

- (int64_t)restoreSnapshotID
{
  id v2 = [(MBServiceCache *)self propertyForKey:@"RestoreSnapshotID"];
  return (int64_t)[v2 integerValue];
}

- (void)setRestoreSnapshotID:(int64_t)a3
{
  id v4 = +[NSString stringWithFormat:@"%d", a3];
  [(MBServiceCache *)self setProperty:v4 forKey:@"RestoreSnapshotID"];
}

- (int64_t)restoreBackupLastModified
{
  id v2 = [(MBServiceCache *)self propertyForKey:@"RestoreBackupLastModified"];
  return (int64_t)[v2 longLongValue];
}

- (void)setRestoreBackupLastModified:(int64_t)a3
{
  id v4 = +[NSString stringWithFormat:@"%lld", a3];
  [(MBServiceCache *)self setProperty:v4 forKey:@"RestoreBackupLastModified"];
}

- (BOOL)containsRestoreFilesForRestoreID:(unint64_t)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"select count(*) from RestoreFiles where restoreID = ? and state != 2 and state != 3"];
  [v4 bindInteger:a3 atIndex:1];
  if ([v4 step]) {
    BOOL v5 = [v4 intColumn:0] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  [v4 reset];
  return v5;
}

- (BOOL)containsRestoreFilesWithState:(int)a3 forRestoreID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = [(MBServiceCache *)self _prepare:@"select count(*) from RestoreFiles where restoreID = ? and state = ?"];
  [v6 bindInteger:a4 atIndex:1];
  [v6 bindInt:v5 atIndex:2];
  if ([v6 step]) {
    BOOL v7 = [v6 intColumn:0] != 0;
  }
  else {
    BOOL v7 = 0;
  }
  [v6 reset];
  return v7;
}

- (BOOL)containsFailedRestoreFilesForRestoreID:(unint64_t)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"select count(*) from RestoreFiles where restoreID = ? and state = 4"];
  [v4 bindInteger:a3 atIndex:1];
  if ([v4 step]) {
    BOOL v5 = [v4 intColumn:0] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  [v4 reset];
  return v5;
}

- (id)_restoreFileWithStmt:(id)a3
{
  id v4 = +[MBServiceRestoreFile restoreFile];
  objc_msgSend(v4, "setRestoreID:", (int)objc_msgSend(a3, "intColumn:", 0));
  objc_msgSend(v4, "setFileID:", +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(a3, "textColumn:", 1)));
  objc_msgSend(v4, "setSnapshotID:", (int)objc_msgSend(a3, "intColumn:", 2));
  objc_msgSend(v4, "setItemID:", (int)objc_msgSend(a3, "intColumn:", 3));
  objc_msgSend(v4, "setState:", objc_msgSend(a3, "intColumn:", 4));
  objc_msgSend(v4, "setPriority:", (int)objc_msgSend(a3, "intColumn:", 5));
  return v4;
}

- (id)_restoreFilesWithStmt:(id)a3
{
  id v5 = +[NSMutableArray array];
  if ([a3 step])
  {
    do
      objc_msgSend(v5, "addObject:", -[MBServiceCache _restoreFileWithStmt:](self, "_restoreFileWithStmt:", a3));
    while (([a3 step] & 1) != 0);
  }
  return v5;
}

- (void)restoreFilesCount:(unint64_t *)a3 size:(unint64_t *)a4 forRestoreID:(unint64_t)a5 backupUDID:(id)a6
{
  id v10 = [(MBServiceCache *)self _prepare:@"select count(*), sum(f.size) FROM RestoreFiles rf JOIN Files f ON f.fileID = rf.fileID AND f.snapshotID = rf.snapshotID WHERE rf.restoreID = ? AND rf.state = 0 AND f.backupUDID = ? AND NOT (f.domainName LIKE 'AppDomain-%' AND (f.encryptionKey IS NOT NULL OR (f.protectionClass != 0 AND f.protectionClass != 4)))"];
  [v10 bindInteger:a5 atIndex:1];
  [v10 bindText:a6 atIndex:2];
  if ([v10 step])
  {
    if (a3) {
      *a3 = (int)[v10 intColumn:0];
    }
    if (a4) {
      *a4 = (unint64_t)[v10 int64Column:1];
    }
  }
  [v10 reset];
}

- (id)restoreFilesForBackupUDID:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  id v9 = [(MBServiceCache *)self _prepare:@"select RestoreFiles.* from RestoreFiles, Files where Files.backupUDID = ? and Files.fileID = RestoreFiles.fileID order by Files.domainName, Files.relativePath limit ? offset ?"];
  [v9 bindText:a3 atIndex:1];
  [v9 bindInteger:a5 atIndex:2];
  [v9 bindInteger:a4 atIndex:3];
  id v10 = [(MBServiceCache *)self _restoreFilesWithStmt:v9];
  [v9 reset];
  return v10;
}

- (id)restoreFilesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 restoreID:(unint64_t)a5 pendingOnly:(BOOL)a6 offset:(unint64_t)a7 limit:(unint64_t)a8
{
  if (a6) {
    CFStringRef v15 = @"and RestoreFiles.state = 0 limit ?";
  }
  else {
    CFStringRef v15 = @"order by Files.added limit ? offset ?";
  }
  id v16 = -[MBServiceCache _prepare:](self, "_prepare:", objc_msgSend(@"select RestoreFiles.* from RestoreFiles, Files where RestoreFiles.restoreID = ? and RestoreFiles.snapshotID = ? and Files.backupUDID = ? and Files.snapshotID = ? and Files.fileID = RestoreFiles.fileID ", "stringByAppendingString:", v15));
  [v16 bindInteger:a5 atIndex:1];
  [v16 bindInteger:a3 atIndex:2];
  [v16 bindText:a4 atIndex:3];
  [v16 bindInteger:a3 atIndex:4];
  [v16 bindInteger:a8 atIndex:5];
  if (!a6) {
    [v16 bindInteger:a7 atIndex:6];
  }
  id v17 = [(MBServiceCache *)self _restoreFilesWithStmt:v16];
  [v16 reset];
  return v17;
}

- (id)restoreFileForFileID:(id)a3
{
  id v5 = [(MBServiceCache *)self _prepare:@"select * from RestoreFiles where fileID = ?"];
  objc_msgSend(v5, "bindText:atIndex:", objc_msgSend(a3, "string"), 1);
  if ([v5 step]) {
    id v6 = [(MBServiceCache *)self _restoreFileWithStmt:v5];
  }
  else {
    id v6 = 0;
  }
  [v5 reset];
  return v6;
}

- (id)restoreFileForItemID:(unint64_t)a3
{
  id v5 = [(MBServiceCache *)self _prepare:@"select * from RestoreFiles where itemID = ?"];
  [v5 bindInt64:a3 atIndex:1];
  if ([v5 step]) {
    id v6 = [(MBServiceCache *)self _restoreFileWithStmt:v5];
  }
  else {
    id v6 = 0;
  }
  [v5 reset];
  return v6;
}

- (void)addRestoreFile:(id)a3
{
  if (![a3 restoreID]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2260 description:@"Restored ID not set"];
  }
  if (![a3 fileID]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2261 description:@"File ID not set"];
  }
  if (![a3 snapshotID]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2262 description:@"Snapshot ID not set"];
  }
  id v6 = [(MBServiceCache *)self _prepare:@"insert or replace into RestoreFiles values (?,?,?,?,?,0)"];
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a3, "restoreID"), 1);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a3, "fileID"), "string"), 2);
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 3);
  objc_msgSend(v6, "bindInt64:atIndex:", objc_msgSend(a3, "itemID"), 4);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "state"), 5);
  [v6 step];
  [v6 reset];
}

- (void)setRestoreID:(unint64_t)a3 forRestoreFile:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set restoreID = ? where restoreID = ? and fileID = ?"];
  [v6 bindInteger:a3 atIndex:1];
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a4, "restoreID"), 2);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a4, "fileID"), "string"), 3);
  [v6 step];
  [v6 reset];
}

- (void)setRestoreID:(unint64_t)a3 forDomainName:(id)a4 relativePath:(id)a5 backupUDID:(id)a6
{
  id v10 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set restoreID = ? where fileID in (select distinct fileID from Files where backupUDID = ? and domainName = ? and relativePath like (? || '%'))"];
  [v10 bindInteger:a3 atIndex:1];
  [v10 bindText:a6 atIndex:2];
  [v10 bindText:a4 atIndex:3];
  [v10 bindText:a5 atIndex:4];
  [v10 step];
  [v10 reset];
}

- (void)setState:(int)a3 forFileID:(id)a4 restoreID:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  id v8 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set state = ? where restoreID = ? and fileID = ?"];
  [v8 bindInt:v7 atIndex:1];
  [v8 bindInteger:a5 atIndex:2];
  objc_msgSend(v8, "bindText:atIndex:", objc_msgSend(a4, "string"), 3);
  [v8 step];
  [v8 reset];
}

- (void)setState:(int)a3 forRestoreID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set state = ? where restoreID = ?"];
  [v6 bindInt:v5 atIndex:1];
  [v6 bindInteger:a4 atIndex:2];
  [v6 step];
  [v6 reset];
}

- (void)prioritizeRestoreFileWithFileID:(id)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"update RestoreFiles set priority = (select max(priority)+1 from RestoreFiles) where fileID = ?"];
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "string"), 1);
  [v4 step];
  [v4 reset];
}

- (id)filesToRestoreForDomainName:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  BOOL v10 = a5;
  id v14 = +[NSMutableArray array];
  id v15 = +[NSMutableString string];
  [v15 appendString:@"select RestoreFiles.fileID, RestoreFiles.snapshotID, RestoreFiles.priority from RestoreFiles, Files"];
  [v15 appendFormat:@" where Files.backupUDID = '%@'", a6];
  [v15 appendString:@" and Files.snapshotID = RestoreFiles.snapshotID"];
  [v15 appendString:@" and Files.fileID = RestoreFiles.fileID"];
  if (a3) {
    [v15 appendFormat:@" and Files.domainName = '%@'", a3];
  }
  if (a4 && [a4 length]) {
    [v15 appendFormat:@" and Files.relativePath like '%@%%'", a4];
  }
  if (v10) {
    CFStringRef v16 = @" and RestoreFiles.state = 0";
  }
  else {
    CFStringRef v16 = @" and RestoreFiles.state != 2 and RestoreFiles.state != 3";
  }
  [v15 appendString:v16];
  [v15 appendString:@" order by RestoreFiles.priority desc, Files.lastModified desc limit ? offset ?"];
  id v17 = [(MBServiceCache *)self _prepare:v15];
  [v17 bindInt64:length atIndex:1];
  [v17 bindInt64:location atIndex:2];
  if ([v17 step])
  {
    do
    {
      id v18 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", [v17 textColumn:0]);
      uint64_t v19 = (int)[v17 intColumn:1];
      uint64_t v20 = (int)[v17 intColumn:2];
      id v21 = [(MBServiceCache *)self fileForID:v18 snapshotID:v19 backupUDID:a6];
      [v21 setPriority:v20];
      [v14 addObject:v21];
    }
    while (([v17 step] & 1) != 0);
  }
  [v17 reset];
  return v14;
}

- (id)pathsToRestoreForDomain:(id)a3 absolutePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  BOOL v10 = a5;
  id v14 = +[NSMutableArray array];
  id v15 = +[NSMutableString string];
  [v15 appendString:@"select distinct(Restores.value) from Restores, RestoreFiles, Files"];
  [v15 appendFormat:@" where Files.backupUDID = '%@'", a6];
  [v15 appendString:@" and Restores.restoreID = RestoreFiles.restoreID"];
  [v15 appendString:@" and Files.snapshotID = RestoreFiles.snapshotID"];
  [v15 appendString:@" and Files.fileID = RestoreFiles.fileID"];
  if (a3) {
    [v15 appendFormat:@" and Files.domainName = '%@'", a3];
  }
  if (a4 && [a4 length]) {
    [v15 appendFormat:@" and Restores.value like '%@%%'", a4];
  }
  if (v10) {
    CFStringRef v16 = @" and RestoreFiles.state = 0";
  }
  else {
    CFStringRef v16 = @" and RestoreFiles.state != 2 and RestoreFiles.state != 3";
  }
  [v15 appendString:v16];
  [v15 appendString:@" order by Restores.value asc limit ? offset ?"];
  id v17 = [(MBServiceCache *)self _prepare:v15];
  [v17 bindInt64:length atIndex:1];
  [v17 bindInt64:location atIndex:2];
  if ([v17 step])
  {
    do
      objc_msgSend(v14, "addObject:", objc_msgSend(v17, "textColumn:", 0));
    while (([v17 step] & 1) != 0);
  }
  [v17 reset];
  return v14;
}

- (BOOL)restoreFileExistsWithDomainName:(id)a3 relativePath:(id)a4 backupUDID:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_9:
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2397 description:@"Null relative path"];
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2396 description:@"Null domain name"];
  if (!a4) {
    goto LABEL_9;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_10:
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2398 description:@"Null backup UDID"];
LABEL_4:
  id v10 = [(MBServiceCache *)self _prepare:@"select count(*) from Files cross join RestoreFiles where Files.backupUDID = ? and Files.snapshotID = RestoreFiles.snapshotID and Files.fileID = RestoreFiles.fileID and Files.domainName = ? and Files.relativePath = ? and RestoreFiles.state != 2 and RestoreFiles.state != 3"];
  [v10 bindText:a5 atIndex:1];
  [v10 bindText:a3 atIndex:2];
  [v10 bindText:a4 atIndex:3];
  if ([v10 step]) {
    BOOL v11 = [v10 intColumn:0] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 reset];
  return v11;
}

- (BOOL)restoreFilesExistForDomainName:(id)a3 backupUDID:(id)a4 size:(unint64_t *)a5
{
  if (!a3)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2421 description:@"Null domain name"];
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceCache.m" lineNumber:2422 description:@"Null backup UDID"];
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = [(MBServiceCache *)self _prepare:@"select count(*), sum(Files.size) from Files cross join RestoreFiles where Files.backupUDID = ? and Files.snapshotID = RestoreFiles.snapshotID and Files.fileID = RestoreFiles.fileID and Files.domainName = ? and RestoreFiles.state != 2 and RestoreFiles.state != 3"];
  [v10 bindText:a4 atIndex:1];
  [v10 bindText:a3 atIndex:2];
  if ([v10 step] && objc_msgSend(v10, "intColumn:", 0))
  {
    BOOL v11 = 1;
    if (a5) {
      *a5 = (unint64_t)[v10 int64Column:1];
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  [v10 reset];
  return v11;
}

- (id)protectionClassesToRestoreByPathWithOffset:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [(MBServiceCache *)self _prepare:@"select domainName, relativePath, protectionClass from FileProtectionClassesToRestore limit ? offset ?"];
  [v8 bindInteger:a4 atIndex:1];
  [v8 bindInteger:a3 atIndex:2];
  if ([v8 step])
  {
    do
    {
      id v9 = [v8 textColumn:0];
      id v10 = [v8 textColumn:1];
      unsigned __int8 v11 = [v8 intColumn:2];
      id v12 = [(MBDomainManager *)self->_domainManager domainForName:v9];
      if (v12)
      {
        id v13 = v12;
        if (([v12 isUninstalledAppDomain] & 1) == 0)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11), objc_msgSend(objc_msgSend(v13, "rootPath"), "stringByAppendingPathComponent:", v10));
          continue;
        }
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v13;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "App uninstalled for protection class to restore: %@:%@", buf, 0x16u);
          id v17 = v13;
          id v18 = v10;
LABEL_8:
          _MBLog();
        }
      }
      else
      {
        id v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = 0;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Domain not found for protection class to restore: %@:%@", buf, 0x16u);
          id v17 = 0;
          id v18 = v10;
          goto LABEL_8;
        }
      }
    }
    while ((objc_msgSend(v8, "step", v17, v18) & 1) != 0);
  }
  [v8 reset];
  return v7;
}

- (void)setProtectionClass:(unsigned __int8)a3 toRestoreForDomainName:(id)a4 relativePath:(id)a5
{
  uint64_t v7 = a3;
  id v8 = [(MBServiceCache *)self _prepare:@"insert or replace into FileProtectionClassesToRestore values (?,?,?)"];
  [v8 bindText:a4 atIndex:1];
  [v8 bindText:a5 atIndex:2];
  [v8 bindInt:v7 atIndex:3];
  [v8 step];
  [v8 reset];
}

- (void)removeAllProtectionClassesToRestore
{
  id v2 = [(MBServiceCache *)self _prepare:@"delete from FileProtectionClassesToRestore"];
  [v2 step];
  [v2 reset];
}

- (void)addRestoreFailure:(id)a3
{
  id v4 = [(MBServiceCache *)self _prepare:@"insert or replace into RestoreFailures values (?,?,?,?,?,?)"];
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "identifier"), 1);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "dataclass"), 2);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "assetType"), 3);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "displayName"), 4);
  objc_msgSend(v4, "bindBlob:atIndex:", objc_msgSend(a3, "icon"), 5);
  if ([a3 error]) {
    objc_msgSend(v4, "bindBlob:atIndex:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(a3, "error"), 1, 0), 6);
  }
  [v4 step];
  [v4 reset];
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  CFStringRef v6 = @"and dataclass = ?";
  CFStringRef v7 = &stru_100418BA8;
  if (!a3) {
    CFStringRef v6 = &stru_100418BA8;
  }
  if (a4) {
    CFStringRef v7 = @"and assetType = ?";
  }
  id v8 = [(MBServiceCache *)self _prepare:+[NSString stringWithFormat:@"select count(*) from RestoreFailures where 1 %@ %@", v6, v7]];
  id v9 = v8;
  if (a3)
  {
    [v8 bindText:a3 atIndex:1];
    uint64_t v10 = 2;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v10 = 1;
  if (a4) {
LABEL_7:
  }
    [v9 bindText:a4 atIndex:v10];
LABEL_8:
  if ([v9 step]) {
    unint64_t v11 = (int)[v9 intColumn:0];
  }
  else {
    unint64_t v11 = 0;
  }
  [v9 reset];
  return v11;
}

- (id)restoreFailuresForDataClass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = +[NSMutableArray array];
  CFStringRef v11 = @"and dataclass = ?";
  CFStringRef v12 = &stru_100418BA8;
  if (!a3) {
    CFStringRef v11 = &stru_100418BA8;
  }
  if (a4) {
    CFStringRef v12 = @"and assetType = ?";
  }
  id v13 = [(MBServiceCache *)self _prepare:+[NSString stringWithFormat:@"select identifier, dataclass, assetType, displayName, icon, error from RestoreFailures where 1 %@ %@ order by dataclass, identifier limit ? offset ?", v11, v12]];
  id v14 = v13;
  if (a3)
  {
    [v13 bindText:a3 atIndex:1];
    int v15 = 2;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v15 = 1;
  if (a4)
  {
LABEL_7:
    int v16 = v15 + 1;
    objc_msgSend(v14, "bindText:atIndex:", a4);
    int v15 = v16;
  }
LABEL_8:
  uint64_t v17 = (v15 + 1);
  objc_msgSend(v14, "bindInteger:atIndex:", length);
  [v14 bindInteger:location atIndex:v17];
  if ([v14 step])
  {
    do
    {
      id v18 = objc_alloc_init((Class)MBRestoreFailure);
      objc_msgSend(v18, "setIdentifier:", objc_msgSend(v14, "textColumn:", 0));
      objc_msgSend(v18, "setDataclass:", objc_msgSend(v14, "textColumn:", 1));
      objc_msgSend(v18, "setAssetType:", objc_msgSend(v14, "textColumn:", 2));
      objc_msgSend(v18, "setDisplayName:", objc_msgSend(v14, "textColumn:", 3));
      objc_msgSend(v18, "setIcon:", objc_msgSend(v14, "blobColumn:", 4));
      id v19 = [v14 blobColumn:5];
      if (v19) {
        objc_msgSend(v18, "setError:", +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v19, 0));
      }
      [v10 addObject:v18];
    }
    while (([v14 step] & 1) != 0);
  }
  [v14 reset];
  return v10;
}

- (id)relativePathsOfPlaceholderResourcesWithBundleID:(id)a3 lastModified:(int64_t)a4
{
  id v7 = +[NSMutableSet set];
  [(MBServiceCache *)self begin];
  id v8 = [(MBServiceCache *)self _prepare:@"select relativePath from PlaceholderResources where bundleID = ? and lastModified = ?"];
  [v8 bindText:a3 atIndex:1];
  [v8 bindInt64:a4 atIndex:2];
  if ([v8 step])
  {
    do
      objc_msgSend(v7, "addObject:", objc_msgSend(v8, "textColumn:", 0));
    while (([v8 step] & 1) != 0);
  }
  [v8 reset];
  [(MBServiceCache *)self end];
  return v7;
}

- (void)setPlaceholderResourceRelativePaths:(id)a3 lastModified:(int64_t)a4 forBundleID:(id)a5
{
  [(MBServiceCache *)self begin];
  id v9 = [(MBServiceCache *)self _prepare:@"delete from PlaceholderResources where bundleID = ?"];
  [v9 bindText:a5 atIndex:1];
  [v9 step];
  [v9 reset];
  id v10 = [(MBServiceCache *)self _prepare:@"insert or replace into PlaceholderResources values (?,?,?)"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v14);
        [v10 bindText:a5 atIndex:1];
        [v10 bindText:v15 atIndex:2];
        [v10 bindInt64:a4 atIndex:3];
        [v10 step];
        [v10 reset];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
  [(MBServiceCache *)self end];
}

- (void)setKeyBagInfo:(id)a3 forBackupUDID:(id)a4
{
  id v7 = [(MBServiceCache *)self _prepare:@"delete from KeyBagInfo where backupUDID = ?"];
  [v7 bindText:a4 atIndex:1];
  [v7 step];
  [v7 reset];
  id v8 = [(MBServiceCache *)self _prepare:@"insert into KeyBagInfo values (?,?,?)"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        [v8 bindText:a4 atIndex:1];
        objc_msgSend(v8, "bindInt:atIndex:", objc_msgSend(v13, "bagID"), 2);
        objc_msgSend(v8, "bindBlob:atIndex:", +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v13, "uuid"), 16, 0), 3);
        [v8 step];
        [v8 reset];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)addKeyBagInfo:(id)a3 forBackupUDID:(id)a4
{
  id v6 = [(MBServiceCache *)self _prepare:@"insert into KeyBagInfo values (?,?,?)"];
  [v6 bindText:a4 atIndex:1];
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "bagID"), 2);
  objc_msgSend(v6, "bindBlob:atIndex:", +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(a3, "uuid"), 16, 0), 3);
  [v6 step];
  [v6 reset];
}

- (id)keyBagInfoForBackupUDID:(id)a3
{
  id v5 = +[NSMutableSet set];
  id v6 = [(MBServiceCache *)self _prepare:@"select keybagID,keybagUUID from KeyBagInfo where backupUDID = ?"];
  [v6 bindText:a3 atIndex:1];
  if ([v6 step])
  {
    while (1)
    {
      id v7 = [v6 blobColumn:1];
      if ((unint64_t)[v7 length] <= 0xF) {
        break;
      }
      objc_msgSend(v5, "addObject:", +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", objc_msgSend(v6, "intColumn:", 0), objc_msgSend(v7, "bytes")));
      if (([v6 step] & 1) == 0) {
        goto LABEL_4;
      }
    }
    [v6 reset];
    return 0;
  }
  else
  {
LABEL_4:
    [v6 reset];
    if ([v5 count]) {
      return v5;
    }
    else {
      return 0;
    }
  }
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (void)setDomainManager:(id)a3
{
}

@end