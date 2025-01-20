@interface MBCKCache
- (BOOL)_isNotFoundError:(id)a3;
- (BOOL)_openWithFlags:(int)a3 error:(id *)a4;
- (BOOL)committedManifestContainsDomain:(id)a3 relativePath:(id)a4 pendingManifestID:(id)a5 error:(id *)a6;
- (BOOL)computeSignatureRetainCountsWithError:(id *)a3;
- (BOOL)domainShouldRestoreToSafeHarbor:(id)a3 error:(id *)a4;
- (BOOL)hasBackupContentsWithError:(id *)a3;
- (BOOL)hasPendingBackupContents:(id *)a3;
- (BOOL)invalidated;
- (BOOL)previousSnapshotHasSkippedFiles;
- (BOOL)readOnly;
- (BOOL)removeAllScannedDomains:(id *)a3;
- (BOOL)saveAccount:(id)a3 error:(id *)a4;
- (BOOL)saveDevice:(id)a3 error:(id *)a4;
- (MBCKCache)initWithTracker:(id)a3;
- (MBCKCacheTracker)tracker;
- (NSNumber)size;
- (NSString)path;
- (OS_dispatch_queue)sharedQueue;
- (id)_clientLastError:(id)a3;
- (id)_enumerateObjectsOfClass:(Class)a3 callback:(id)a4 format:(id)a5;
- (id)_enumerateRestoreFilesForDomain:(id)a3 state:(unint64_t)a4 negatingStateAndErrorState:(BOOL)a5 foundRestorable:(id)a6 range:(_NSRange)a7;
- (id)_executeSQL:(id)a3;
- (id)_fetchObjectOfClass:(Class)a3 error:(id *)a4 format:(id)a5;
- (id)_invalidatedError;
- (id)_makePQLConnectionWithFlags:(int)a3 error:(id *)a4;
- (id)_openPQLConnectionWithFlags:(int)a3 error:(id *)a4;
- (id)_removePropertyForKey:(id)a3;
- (id)addDependentDomains:(id)a3 forApp:(id)a4;
- (id)addFile:(id)a3 toManifest:(id)a4;
- (id)addFileToRestoreFiles:(id)a3;
- (id)addManifest:(id)a3 toPendingSnapshot:(id)a4;
- (id)addManifestPage:(id)a3 forManifestID:(id)a4 pageIndex:(unint64_t)a5;
- (id)addPendingSnapshot:(id)a3;
- (id)addSnapshotIntoFileChanges:(id)a3;
- (id)clearAgentForDomainRestoresWithAgentDomain:(id)a3;
- (id)clearAllRestoreData;
- (id)commitSnapshot:(id)a3;
- (id)decrementRetainCountForSignature:(id)a3 volumeType:(unint64_t)a4 error:(id *)a5;
- (id)deleteCloudFilePendingDeleteWithFileID:(id)a3;
- (id)deleteCloudFilesPendingDelete;
- (id)deleteCloudFilesPendingDeleteForManifestID:(id)a3;
- (id)deleteManifestPagesForManifestID:(id)a3;
- (id)dependentDomainsForApp:(id)a3 error:(id *)a4;
- (id)domainNameForManifestID:(id)a3 error:(id *)a4;
- (id)domainNamesForRestoreFailures:(id *)a3;
- (id)encryptionKeyForFileWithInodeNumber:(unint64_t)a3 volumeType:(unint64_t)a4 error:(id *)a5;
- (id)enumerateChangedDomainNames:(id)a3;
- (id)enumerateCloudFilesPendingDeleteForManifestID:(id)a3 withFoundFileID:(id)a4;
- (id)enumerateDomainNames:(id)a3;
- (id)enumerateDomainNamesOfPendingSnapshot:(id)a3 domainCallback:(id)a4;
- (id)enumerateFileChangesForDomainName:(id)a3 skipUnmodified:(BOOL)a4 foundChange:(id)a5;
- (id)enumerateFiles:(id)a3;
- (id)enumerateFilesForManifest:(id)a3 foundFile:(id)a4;
- (id)enumerateFilesForSnapshotOrderedByDomain:(id)a3 block:(id)a4;
- (id)enumerateFilesMissingEncryptionKeys:(id)a3;
- (id)enumerateKeybagUUIDsForAllFiles:(id)a3;
- (id)enumerateManifestsForSnapshot:(id)a3 foundManifest:(id)a4;
- (id)enumeratePendingRestorableDomainsWithCallback:(id)a3;
- (id)enumeratePendingRestoreFilesForAnyDomainOrderAscendingWithBlock:(id)a3;
- (id)enumeratePendingRestoreFilesForDomain:(id)a3 excludingType:(unint64_t)a4 foundRestorable:(id)a5;
- (id)enumeratePendingRestoreFilesForDomain:(id)a3 forType:(unint64_t)a4 orderAscending:(BOOL)a5 foundRestorable:(id)a6;
- (id)enumeratePendingRestoreFilesForDomain:(id)a3 orderAscending:(BOOL)a4 foundRestorable:(id)a5;
- (id)enumeratePendingRestoreRegularFilesForAnyDomainOrderAscendingWithBlock:(id)a3;
- (id)enumerateRestoreFilesForDomain:(id)a3 excludingState:(unint64_t)a4 foundRestorable:(id)a5 range:(_NSRange)a6;
- (id)enumerateRestoreFilesForDomain:(id)a3 state:(unint64_t)a4 foundRestorable:(id)a5 range:(_NSRange)a6;
- (id)enumerateSnapshotIDs:(id)a3;
- (id)enumerateSnapshots:(id)a3;
- (id)fetchDomainRestoreStateForDomain:(id)a3 callback:(id)a4;
- (id)fetchDomainsWithTopNFileCounts:(unint64_t)a3 error:(id *)a4;
- (id)fetchDomainsWithTopNSizes:(unint64_t)a3 error:(id *)a4;
- (id)fetchFileFromFileID:(id)a3 error:(id *)a4;
- (id)fetchFileWithDomain:(id)a3 relativePath:(id)a4 snapshotID:(id)a5 error:(id *)a6;
- (id)fetchManifestPageForManifestID:(id)a3 pageIndex:(unint64_t)a4 error:(id *)a5;
- (id)fetchMostRecentSnapshotForDevice:(id)a3 error:(id *)a4;
- (id)fetchMostRecentSnapshotWithError:(id *)a3;
- (id)fetchPendingRestoreSizeForDomain:(id)a3 callback:(id)a4;
- (id)fetchRestorableFileForPath:(id)a3 error:(id *)a4;
- (id)fetchRestoreSizeForDomain:(id)a3 callback:(id)a4;
- (id)fileAssetMetadataForSignature:(id)a3 volumeType:(unint64_t)a4;
- (id)fileSeen:(id)a3 changeType:(unint64_t)a4;
- (id)hasDomainBeenBackedUp:(id)a3 backedUp:(BOOL *)a4;
- (id)hasRestoreFilesWithCallback:(id)a3;
- (id)lastBackedUpFileForFile:(id)a3 error:(id *)a4;
- (id)lastBackedUpFileWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (id)markAllFileChangesAsDeleted;
- (id)markFileAsCopyable:(id)a3;
- (id)markFileChangesAsUnmodifiedForDomainNames:(id)a3;
- (id)mergeManifest:(id)a3 withNewerManifest:(id)a4 outputManifest:(id)a5 mergeDeletions:(BOOL)a6;
- (id)moveManifest:(id)a3 toSnapshot:(id)a4;
- (id)performInTransaction:(id)a3;
- (id)prioritizeRestoreFileWithDomain:(id)a3 relativePath:(id)a4;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (id)rebuildEncryptionKeysTable;
- (id)removeAllFileChanges;
- (id)removeAllFileEncryptionKeys;
- (id)removeAllFilesMissingEncryptionKeys;
- (id)removeAllOrphanedItems;
- (id)removeAllOrphanedItemsForSnapshot:(id)a3;
- (id)removeDeletedFileChanges;
- (id)removeDeletedRestoreFiles;
- (id)removeManifestAndFiles:(id)a3;
- (id)removeSnapshot:(id)a3;
- (id)removeSnapshotID:(id)a3;
- (id)removeUncommittedFileWithDomain:(id)a3 relativePath:(id)a4 pendingManifestID:(id)a5;
- (id)retainCountForSignature:(id)a3 volumeType:(unint64_t)a4 error:(id *)a5;
- (id)setDomainRestoreAgent:(id)a3 forDomain:(id)a4;
- (id)setDomainRestoreState:(unint64_t)a3 forDomain:(id)a4;
- (id)setDomainShouldRestoreToSafeHarbor:(BOOL)a3 forDomain:(id)a4;
- (id)setFileEncryptionKey:(id)a3 forInodeNumber:(unint64_t)a4 volumeType:(unint64_t)a5 atPath:(id)a6;
- (id)setFileMissingEncryptionKeyForPath:(id)a3;
- (id)setFileStateToCompleted:(id)a3;
- (id)setFileStateToPending:(id)a3;
- (id)setProperty:(id)a3 forKey:(id)a4;
- (id)setRestoreState:(unint64_t)a3 forDeviceUUID:(id)a4 snapshotUUID:(id)a5;
- (id)setRestoreState:(unint64_t)a3 forFile:(id)a4;
- (id)setRestoreState:(unint64_t)a3 forFilesInDomain:(id)a4;
- (id)setRestoreType:(int)a3 forFile:(id)a4;
- (id)summarizeCloudFilesPendingDeleteForManifestID:(id)a3 callback:(id)a4;
- (id)summarizeFileChanges:(id)a3;
- (id)summarizeFileChangesForAllChanges:(id)a3;
- (id)summarizeFileChangesForDomainName:(id)a3 foundChanges:(id)a4;
- (id)summarizeFileChangesGroupByDomain:(id)a3;
- (id)updateDecodedAssetPath:(id)a3 forSignature:(id)a4 volumeType:(unint64_t)a5;
- (id)updateFile:(id)a3;
- (id)updateScannedDomain:(id)a3 withSize:(unint64_t)a4;
- (id)updateStashPath:(id)a3 forSignature:(id)a4 volumeType:(unint64_t)a5 isDecrypted:(BOOL)a6;
- (id)uploadedFileInPendingSnapshotWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (int)countManifestPagesForManifestID:(id)a3 error:(id *)a4;
- (int)countManifestsForSnapshot:(id)a3 error:(id *)a4;
- (int64_t)checksumForManifest:(id)a3 error:(id *)a4;
- (int64_t)checksumForManifest:(id)a3 shouldLog:(BOOL)a4 error:(id *)a5;
- (unint64_t)countDomainHmacForManifest:(id)a3 error:(id *)a4;
- (unint64_t)countFilesForManifest:(id)a3 error:(id *)a4;
- (unint64_t)countFilesForManifestID:(id)a3 error:(id *)a4;
- (unint64_t)countFilesMissingEncryptionKeysWithError:(id *)a3;
- (unint64_t)countRestoreFilesWithSourceDeviceInode:(unint64_t)a3 signature:(id)a4 volumeType:(unint64_t)a5 error:(id *)a6;
- (unint64_t)fetchRestoreFileStateForFileID:(id)a3 error:(id *)a4;
- (unint64_t)fetchRestoreStateForDeviceUUID:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (unint64_t)sizeOfDomain:(id)a3 error:(id *)a4;
- (unint64_t)sizeOfPendingRestore:(id *)a3;
- (unint64_t)sizeOfScannedDomain:(id)a3 error:(id *)a4;
- (unint64_t)sizeOfSnapshot:(id)a3 error:(id *)a4;
- (void)_invalidate;
- (void)_perform:(id)a3;
- (void)_removeCorruptDatabaseWithError:(id)a3 completion:(id)a4;
- (void)beginBatch;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)removeFileEncryptionKeyForInode:(unint64_t)a3 volumeType:(unint64_t)a4;
- (void)setReadOnly:(BOOL)a3;
- (void)setSharedQueue:(id)a3;
- (void)setTracker:(id)a3;
@end

@implementation MBCKCache

- (MBCKCache)initWithTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKCache initWithTracker:]", "MBCKCache.m", 366, "tracker");
  }
  v5 = v4;
  v11.receiver = self;
  v11.super_class = (Class)MBCKCache;
  v6 = [(MBCKCache *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 path];
    path = v6->_path;
    v6->_path = (NSString *)v7;

    [(MBCKCache *)v6 setTracker:v5];
    v9 = [v5 sharedQueue];
    [(MBCKCache *)v6 setSharedQueue:v9];
  }
  return v6;
}

- (void)dealloc
{
  v3 = self->_pdb;
  id v4 = v3;
  if (v3)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DABF8;
    block[3] = &unk_100411128;
    v8 = v3;
    dispatch_async(queue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)MBCKCache;
  [(MBCKCache *)&v6 dealloc];
}

- (BOOL)_openWithFlags:(int)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v5 = [(MBCKCache *)self tracker];
  v37 = v5;
  if (!v5) {
    __assert_rtn("-[MBCKCache _openWithFlags:error:]", "MBCKCache.m", 390, "tracker");
  }
  objc_super v6 = [v5 path];
  v39 = v6;
  if (!v6) {
    __assert_rtn("-[MBCKCache _openWithFlags:error:]", "MBCKCache.m", 392, "path");
  }
  v38 = [v6 stringByDeletingLastPathComponent];
  if (!v38) {
    __assert_rtn("-[MBCKCache _openWithFlags:error:]", "MBCKCache.m", 394, "dir");
  }
  id v8 = 0;
  BOOL v35 = a3 & 1;
  char v9 = 1;
  uint64_t v10 = PQLSqliteErrorDomain;
  *(void *)&long long v7 = 138412290;
  long long v33 = v7;
  while (1)
  {
    char v11 = v9;

    v12 = +[NSFileManager defaultManager];
    v45[0] = NSFileOwnerAccountName;
    v45[1] = NSFileGroupOwnerAccountName;
    v46[0] = @"mobile";
    v46[1] = @"mobile";
    v13 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    id v42 = 0;
    unsigned __int8 v14 = [v12 createDirectoryAtPath:v38 withIntermediateDirectories:1 attributes:v13 error:&v42];
    id v15 = v42;

    if ((v14 & 1) == 0)
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v44 = v39;
        *(_WORD *)&v44[8] = 2112;
        *(void *)&v44[10] = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to create the directory at %@: %@", buf, 0x16u);
        _MBLog();
      }

      id v8 = v15;
      goto LABEL_34;
    }
    id v41 = v15;
    v16 = [(MBCKCache *)self _makePQLConnectionWithFlags:a3 error:&v41];
    id v8 = v41;

    if (v16 || v35) {
      break;
    }
    v18 = [v8 domain];
    if ([v18 isEqualToString:v10])
    {
      BOOL v19 = [v8 code] == (id)13;

      if (v19)
      {
        v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v44 = 30;
          *(_WORD *)&v44[4] = 2114;
          *(void *)&v44[6] = v8;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Sleeping for %d seconds: %{public}@", buf, 0x12u);
          _MBLog();
        }

        sleep(0x1Eu);
        MBExit(1);
      }
    }
    else
    {
    }
    id v40 = 0;
    unsigned __int8 v20 = objc_msgSend(v37, "_removeDatabaseAtPath:error:", v39, &v40, v31, v32, v33);
    id v21 = v40;
    if ((v20 & 1) == 0)
    {
      v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v44 = v39;
        *(_WORD *)&v44[8] = 2112;
        *(void *)&v44[10] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to remove the db at %@: %@", buf, 0x16u);
        v31 = v39;
        id v32 = v21;
        _MBLog();
      }
    }
    if (!v8) {
      __assert_rtn("-[MBCKCache _openWithFlags:error:]", "MBCKCache.m", 430, "localError");
    }

    char v9 = 0;
    if ((v11 & 1) == 0) {
      goto LABEL_35;
    }
  }
  if (!v16)
  {
LABEL_34:
    if (!v8) {
      __assert_rtn("-[MBCKCache _openWithFlags:error:]", "MBCKCache.m", 440, "localError");
    }
LABEL_35:
    if (a4)
    {
      id v8 = v8;
      v16 = 0;
      *a4 = v8;
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_38;
  }
  atomic_store(1u, (unsigned int *)&self->_openCount);
  self->_readOnly = v35;
  objc_storeStrong((id *)&self->_pdb, v16);
  v24 = [v16 serialQueue];
  queue = self->_queue;
  self->_queue = v24;

  v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (a3) {
      int v27 = 111;
    }
    else {
      int v27 = 119;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v44 = v27;
    *(_WORD *)&v44[4] = 2112;
    *(void *)&v44[6] = v16;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Opened r/%c PQL connection %@", buf, 0x12u);
    _MBLog();
  }

LABEL_38:
  return v16 != 0;
}

- (BOOL)invalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u) & 1) == 0)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      long long v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating cache connection %p", buf, 0xCu);
      _MBLog();
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DB520;
    block[3] = &unk_100411128;
    void block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (void)close
{
  int add = atomic_fetch_add(&self->_openCount, 0xFFFFFFFF);
  if (add <= 0) {
    __assert_rtn("-[MBCKCache close]", "MBCKCache.m", 473, "0 < openCount");
  }
  if (add == 1)
  {
    id v4 = [(MBCKCache *)self tracker];
    if (!v4) {
      __assert_rtn("-[MBCKCache close]", "MBCKCache.m", 476, "tracker");
    }
    id v5 = v4;
    [v4 _closeCache:self];
  }
}

- (id)performInTransaction:(id)a3
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1000D9658;
  unsigned __int8 v14 = sub_1000D9668;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DB890;
  v6[3] = &unk_100412C60;
  long long v7 = self;
  char v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)beginBatch
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000DBA50;
  v2[3] = &unk_100411128;
  v2[4] = self;
  [(MBCKCache *)self _perform:v2];
}

- (void)flush
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000DBAC8;
  v2[3] = &unk_100411128;
  v2[4] = self;
  [(MBCKCache *)self _perform:v2];
}

- (void)_removeCorruptDatabaseWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedQueue = self->_sharedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBB98;
  block[3] = &unk_100412998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedQueue, block);
}

- (id)_openPQLConnectionWithFlags:(int)a3 error:(id *)a4
{
  if (!a4) {
    __assert_rtn("-[MBCKCache _openPQLConnectionWithFlags:error:]", "MBCKCache.m", 531, "error");
  }
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  id v7 = [(MBCKCache *)self tracker];
  if (!v7) {
    __assert_rtn("-[MBCKCache _openPQLConnectionWithFlags:error:]", "MBCKCache.m", 536, "tracker");
  }
  id v8 = v7;
  uint64_t v9 = [v7 path];
  if (!v9) {
    __assert_rtn("-[MBCKCache _openPQLConnectionWithFlags:error:]", "MBCKCache.m", 538, "path");
  }
  id v10 = (void *)v9;
  uint64_t v11 = +[NSURL fileURLWithPath:v9];
  if (!v11) {
    __assert_rtn("-[MBCKCache _openPQLConnectionWithFlags:error:]", "MBCKCache.m", 540, "url");
  }
  id v12 = (void *)v11;
  objc_initWeak(&location, self);
  id v13 = objc_alloc_init((Class)PQLConnection);
  int v14 = v5 & 1;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DC028;
  v29[3] = &unk_100412CA8;
  objc_copyWeak(&v31, &location);
  id v15 = v10;
  id v30 = v15;
  char v32 = v5 & 1;
  [v13 setSqliteErrorHandler:v29];
  v16 = [v13 sqliteErrorHandler];
  [v13 setAutoRollbackHandler:v16];

  id v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"cache-%p", self);
  [v13 setLabel:v17];

  uint64_t v18 = +[MBBehaviorOptions sharedOptions];
  objc_msgSend(v13, "setTraced:", objc_msgSend((id)v18, "sqlTrace"));

  [v13 setCrashIfUsedAfterClose:1];
  [v13 setStatementCacheMaxCount:30];
  id v28 = 0;
  LOBYTE(v18) = [v13 openAtURL:v12 withFlags:v5 error:&v28];
  id v19 = v28;
  id v20 = v19;
  if ((v18 & 1) == 0)
  {
    if (!v19)
    {
      id v21 = "localError";
      int v22 = 600;
      goto LABEL_30;
    }
    if (!v14
      || [v19 code] != (id)14
      || ([v20 domain],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned int v24 = [v23 isEqualToString:PQLSqliteErrorDomain],
          v23,
          !v24))
    {

LABEL_20:
      id v20 = v20;
      id v13 = 0;
      *a4 = v20;
      goto LABEL_21;
    }
    uint64_t v25 = +[MBError errorWithCode:4 error:v20 format:@"Can't find the cache database"];

    id v20 = (id)v25;
LABEL_19:

    if (v20) {
      goto LABEL_20;
    }
    id v21 = "pdb || localError";
    int v22 = 615;
LABEL_30:
    __assert_rtn("-[MBCKCache _openPQLConnectionWithFlags:error:]", "MBCKCache.m", v22, v21);
  }
  if (!v14 && ([v13 setupPragmas] & 1) == 0)
  {
    uint64_t v26 = [v13 lastError];

    id v20 = (id)v26;
    if (!v26)
    {
      id v20 = +[MBError errorWithCode:1 format:@"setupPragmas failed"];
    }
    [v13 close:0];
    goto LABEL_19;
  }
  if (!v13)
  {
    id v21 = "pdb";
    int v22 = 611;
    goto LABEL_30;
  }
LABEL_21:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v13;
}

- (id)_makePQLConnectionWithFlags:(int)a3 error:(id *)a4
{
  if (!a4) {
    __assert_rtn("-[MBCKCache _makePQLConnectionWithFlags:error:]", "MBCKCache.m", 622, "error");
  }
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v56 = [(MBCKCache *)self tracker];
  if (!v56) {
    __assert_rtn("-[MBCKCache _makePQLConnectionWithFlags:error:]", "MBCKCache.m", 626, "tracker");
  }
  id v7 = [(MBCKCache *)self _openPQLConnectionWithFlags:v5 error:a4];
  id v8 = v7;
  if (!v7) {
    goto LABEL_27;
  }
  uint64_t v9 = [v7 userVersion];
  id v10 = [v9 unsignedIntValue];

  if (v10 > 0x12)
  {
    int v22 = v8;
LABEL_22:
    unsigned int v23 = 0;
    unsigned int v24 = 2;
    uint64_t v25 = &dword_100000018;
    uint64_t v26 = ATClientController_ptr;
    do
    {
      unsigned int v27 = v23;
      unsigned int v23 = v24;
      if (v24 <= v27)
      {
        v54 = [v26[96] currentHandler];
        [v54 handleFailureInMethod:a2 object:self file:@"MBCKCache.m" lineNumber:710 description:@"Cache versions are not ordered correctly!"];

        uint64_t v26 = ATClientController_ptr;
      }
      unsigned int v24 = *(_DWORD *)((char *)&unk_100412CC8 + v25);
      v25 += 24;
    }
    while (v25 != 672);
    if (v10 >= 0x1C)
    {
LABEL_47:
      v36 = +[MBBehaviorOptions sharedOptions];
      [v36 sqlBatchTime];
      double v38 = v37;

      v39 = +[MBBehaviorOptions sharedOptions];
      id v40 = [v39 sqlBatchCount];

      [v22 useBatchingWithDelay:v40 changeCount:v38];
      [v22 useSerialQueue];
      id v8 = [v22 serialQueue];
      dispatch_queue_set_specific(v8, self, self, 0);
    }
    else
    {
      if ((v5 & 1) == 0)
      {
        id v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 28;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Migrating CK cache database from version %d to %d", buf, 0xEu);
          id v50 = v10;
          uint64_t v51 = 28;
          _MBLog();
        }

        uint64_t v29 = 0;
        uint64_t v30 = 2;
        id v31 = &dword_100412CE0;
        while (1)
        {
          if ((v29 & 0xFFFFFFEF) == 0xB)
          {
            if (v30 == v10)
            {
              id v42 = MBGetDefaultLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v30;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Found invalid database version %d", buf, 8u);
                _MBLog();
              }

              [v22 close:0];
              id v41 = +[MBError errorWithCode:1, @"Found invalid database version %d", v30 format];
              goto LABEL_52;
            }
          }
          else if (v30 > v10)
          {
            char v32 = MBGetDefaultLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v30;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Migrating database from version %d to %d", buf, 0xEu);
              id v50 = v10;
              uint64_t v51 = v30;
              _MBLog();
            }

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&long long v72 = sub_1000D9658;
            *((void *)&v72 + 1) = sub_1000D9668;
            id v73 = 0;
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_1000DD8C0;
            v57[3] = &unk_100412F70;
            int v61 = v29;
            id v58 = v56;
            int v62 = (int)v10;
            int v63 = v30;
            id v8 = v22;
            v59 = v8;
            v60 = buf;
            if (([v8 performWithFlags:10 action:v57] & 1) == 0)
            {
              v45 = MBGetDefaultLog();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                v46 = *(void **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v65 = 67109634;
                int v66 = (int)v10;
                __int16 v67 = 1024;
                int v68 = v30;
                __int16 v69 = 2114;
                v70 = v46;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Migration from version %d to %d failed: %{public}@", v65, 0x18u);
                _MBLog();
              }

              [v8 close:0];
              *a4 = *(id *)(*(void *)&buf[8] + 40);

              id v47 = v58;
              goto LABEL_64;
            }

            if (((0xBEBDFFFuLL >> v29) & 1) == 0)
            {
              if (([v8 execute:@"vacuum;"] & 1) == 0)
              {
                v48 = [v8 lastError];
                v49 = MBGetDefaultLog();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v65 = 67109634;
                  int v66 = (int)v10;
                  __int16 v67 = 1024;
                  int v68 = v30;
                  __int16 v69 = 2114;
                  v70 = v48;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Vacuum after migration from version %d to %d failed: %{public}@", v65, 0x18u);
                  _MBLog();
                }

                [v8 close:0];
                id v47 = v48;
                *a4 = v47;
LABEL_64:

                _Block_object_dispose(buf, 8);
                goto LABEL_53;
              }
              long long v33 = MBGetDefaultLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v65 = 67109376;
                int v66 = (int)v10;
                __int16 v67 = 1024;
                int v68 = v30;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Vacuumed after migrating database from version %d to %d", v65, 0xEu);
                id v50 = v10;
                uint64_t v51 = v30;
                _MBLog();
              }
            }
            -[NSObject setUserVersion:](v8, "setUserVersion:", v30, v50, v51, v52, v53);
            v34 = [v8 userVersion];
            id v10 = [v34 unsignedIntValue];

            _Block_object_dispose(buf, 8);
          }
          ++v29;
          unsigned int v35 = *v31;
          v31 += 6;
          uint64_t v30 = v35;
          if (v29 == 27) {
            goto LABEL_47;
          }
        }
      }
      [v22 close:0];
      id v41 = +[MBError errorWithCode:1 format:@"Can't migrate RO database"];
LABEL_52:
      *a4 = v41;
      id v8 = v22;
LABEL_53:
      int v22 = 0;
    }
    goto LABEL_54;
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v11 = [v8 url];
    id v12 = [v11 path];

    if (!v12) {
      __assert_rtn("-[MBCKCache _makePQLConnectionWithFlags:error:]", "MBCKCache.m", 645, "path");
    }
    id v13 = (sqlite3 *)[v8 dbHandle];
    if (!v13) {
      __assert_rtn("-[MBCKCache _makePQLConnectionWithFlags:error:]", "MBCKCache.m", 647, "dbHandle");
    }
    int v14 = v13;
    *(_DWORD *)v65 = 61;
    uint64_t v15 = sqlite3_file_control(v13, 0, 101, v65);
    v16 = MBGetDefaultLog();
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = sqlite3_extended_errcode(v14);
        id v19 = sqlite3_errmsg(v14);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v15;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v18;
        LOWORD(v72) = 2080;
        *(void *)((char *)&v72 + 2) = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to truncate the database at %@: %d(%d): %s", buf, 0x22u);
        uint64_t v52 = sqlite3_extended_errcode(v14);
        v53 = sqlite3_errmsg(v14);
        id v50 = v12;
        uint64_t v51 = v15;
        _MBLog();
      }

      [v8 close:0];
      id v64 = 0;
      unsigned __int8 v20 = [v56 _removeDatabaseAtPath:v12 error:&v64];
      id v8 = v64;
      if ((v20 & 1) == 0)
      {
        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to remove the database at %@: %@", buf, 0x16u);
          id v50 = v12;
          uint64_t v51 = (uint64_t)v8;
          _MBLog();
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = 19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Truncated the database at %@, cacheVersion:%d, minCacheVersionForUpgrade:%d", buf, 0x18u);
        uint64_t v51 = (uint64_t)v10;
        uint64_t v52 = 19;
        id v50 = v12;
        _MBLog();
      }

      [v8 close:0];
    }

    int v22 = [(MBCKCache *)self _openPQLConnectionWithFlags:v5 error:a4];

    if (v22)
    {
      id v10 = 0;
      goto LABEL_22;
    }
LABEL_27:
    int v22 = 0;
    goto LABEL_55;
  }
  [v8 close:0];
  +[MBError errorWithCode:1 format:@"Can't upgrade RO database"];
  int v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

LABEL_55:
  return v22;
}

- (BOOL)_isNotFoundError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)12)
  {
    id v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:PQLSqliteErrorDomain];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_clientLastError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)12
    && ([v3 domain],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToString:PQLSqliteErrorDomain],
        v4,
        (v5 & 1) != 0))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (void)_perform:(id)a3
{
  block = (void (**)(void))a3;
  specific = (MBCKCache *)dispatch_get_specific(self);
  queue = self->_queue;
  if (specific == self)
  {
    dispatch_assert_queue_V2(queue);
    block[2]();
  }
  else
  {
    dispatch_assert_queue_not_V2(queue);
    dispatch_sync((dispatch_queue_t)self->_queue, block);
  }
}

- (id)_invalidatedError
{
  return +[MBError errorWithCode:1 format:@"The PQL connection was invalidated"];
}

- (id)_executeSQL:(id)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000D9658;
  v16 = sub_1000D9668;
  id v17 = 0;
  uint64_t v11 = &v19;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DDD2C;
  v6[3] = &unk_1004117A0;
  id v7 = self;
  uint64_t v9 = &v12;
  id v3 = a3;
  id v8 = v3;
  id v10 = &v11;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)_enumerateObjectsOfClass:(Class)a3 callback:(id)a4 format:(id)a5
{
  id v8 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unsigned int v23 = sub_1000D9658;
  unsigned int v24 = sub_1000D9668;
  id v25 = 0;
  uint64_t v19 = &v27;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DDF2C;
  v13[3] = &unk_100412F98;
  v13[4] = self;
  v16 = &v20;
  id v9 = a5;
  id v14 = v9;
  id v17 = &v19;
  Class v18 = a3;
  id v10 = v8;
  id v15 = v10;
  [(MBCKCache *)self _perform:v13];
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)_fetchObjectOfClass:(Class)a3 error:(id *)a4 format:(id)a5
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1000D9658;
  id v28 = sub_1000D9668;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1000D9658;
  uint64_t v22 = sub_1000D9668;
  id v23 = 0;
  id v17 = &v31;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DE2F4;
  v10[3] = &unk_100412FC0;
  id v11 = self;
  id v13 = &v24;
  id v14 = &v18;
  Class v15 = a3;
  id v6 = a5;
  id v12 = v6;
  v16 = &v17;
  [(MBCKCache *)v11 _perform:v10];
  id v7 = (void *)v19[5];
  if (a4 && !v7)
  {
    *a4 = (id) v25[5];
    id v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  id v11 = a3;
  if (!v11)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Null key: %@", buf, 0xCu);
    }
  }
  if (sub_1001E70C4(v11 != 0, a4, @"Null key: %@", v6, v7, v8, v9, v10, (uint64_t)v11))
  {
    id v13 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a4, @"SELECT value FROM Properties WHERE key = %@ AND key IS NOT NULL", v11 error format];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v13 = a4;
  if (!v13)
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Null key: %@", buf, 0xCu);
    }
  }
  Class v15 = _MBAssert(v13 != 0, @"Null key: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v13);
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    if (v6) {
      [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Properties (key, value) VALUES (%@, %@)", v13, v6];
    }
    else {
    id v17 = [(MBCKCache *)self _removePropertyForKey:v13];
    }
  }
  uint64_t v18 = v17;

  return v18;
}

- (id)_removePropertyForKey:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Null key: %@", buf, 0xCu);
    }
  }
  uint64_t v12 = _MBAssert(v10 != 0, @"Null key: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    [(MBCKCache *)self _executeSQL:@"DELETE FROM Properties WHERE key == %@", v10];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  Class v15 = v14;

  return v15;
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [a3 devicesByUUID];
  uint64_t v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
      id v13 = [v12 deviceUUID];
      id v14 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Devices (deviceUUID, device) VALUES (%@, %@)", v13, v12];

      if (v14) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to add device: %@", buf, 0xCu);
      _MBLog();
    }

    BOOL v17 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_9:

  Class v15 = +[NSDate date];
  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

  uint64_t v16 = [v7 base64EncodedStringWithOptions:0];
  id v14 = [(MBCKCache *)self setProperty:v16 forKey:@"AccountSaved"];

  BOOL v17 = v14 == 0;
  if (v14)
  {
    uint64_t v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to set cached at date for account: %@", buf, 0xCu);
      _MBLog();
    }

    if (a4) {
LABEL_17:
    }
      *a4 = v14;
  }
LABEL_18:

  return v17;
}

- (BOOL)saveDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 deviceUUID];
  id v8 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Devices (deviceUUID, device) VALUES (%@, %@)", v7, v6];

  if (v8)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to add device: %@", buf, 0xCu);
      _MBLog();
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v8 == 0;
}

- (BOOL)hasBackupContentsWithError:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000D9658;
  Class v15 = sub_1000D9668;
  id v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DEC94;
  v6[3] = &unk_1004120A0;
  void v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(MBCKCache *)self _perform:v6];
  if (a3) {
    *a3 = (id) v12[5];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (BOOL)hasPendingBackupContents:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000D9658;
  Class v15 = sub_1000D9668;
  id v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DEEB8;
  v6[3] = &unk_1004120A0;
  void v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(MBCKCache *)self _perform:v6];
  if (a3) {
    *a3 = (id) v12[5];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (NSNumber)size
{
  id v3 = +[NSFileManager defaultManager];
  char v4 = [(MBCKCache *)self path];
  uint64_t v5 = [v3 attributesOfItemAtPath:v4 error:0];

  id v6 = (char *)[v5 fileSize];
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(MBCKCache *)self path];
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = v8;
    __int16 v40 = 2114;
    id v41 = v9;
    __int16 v42 = 2048;
    v43 = v6;
    __int16 v44 = 2048;
    id v45 = [v5 fileSystemFileNumber];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@, size:%llu, inode:%llu", buf, 0x2Au);

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(MBCKCache *)self path];
    id v29 = v6;
    id v30 = [v5 fileSystemFileNumber];
    uint64_t v27 = v10;
    id v28 = v11;
    _MBLog();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v12 = MBSQLiteJournalSuffixes();
  id v32 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    uint64_t v13 = *(void *)v34;
    uint64_t v31 = v3;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v16 = [(MBCKCache *)self path];
        BOOL v17 = [v16 stringByAppendingString:v15];

        if ([v3 fileExistsAtPath:v17])
        {
          uint64_t v18 = [v3 attributesOfItemAtPath:v17 error:0];

          id v19 = [v18 fileSize];
          uint64_t v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            long long v21 = v6;
            uint64_t v22 = objc_opt_class();
            id v23 = [v18 fileSystemFileNumber];
            *(_DWORD *)buf = 138544130;
            uint64_t v39 = v22;
            __int16 v40 = 2114;
            id v41 = v17;
            __int16 v42 = 2048;
            v43 = (char *)v19;
            __int16 v44 = 2048;
            id v45 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@: %{public}@, size:%llu, inode:%llu", buf, 0x2Au);
            uint64_t v24 = objc_opt_class();
            id v29 = (char *)v19;
            id v30 = [v18 fileSystemFileNumber];
            uint64_t v27 = v24;
            id v28 = v17;
            id v6 = v21;
            id v3 = v31;
            _MBLog();
          }

          id v6 = &v6[(void)v19];
          uint64_t v5 = v18;
        }
      }
      id v32 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }

  id v25 = +[NSNumber numberWithUnsignedLongLong:v6];

  return (NSNumber *)v25;
}

- (id)addPendingSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 snapshotID];
  unsigned int v6 = [v4 committed];
  uint64_t v7 = [v4 created];
  uint64_t v8 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Snapshots (snapshotID, committed, created, snapshot) VALUES (%@, %d, %@, %@)", v5, v6, v7, v4];

  return v8;
}

- (id)commitSnapshot:(id)a3
{
  id v4 = a3;
  [v4 setCommitted:1];
  uint64_t v5 = [v4 created];
  unsigned int v6 = [v4 snapshotID];
  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"UPDATE Snapshots SET committed = 1, created = %@, snapshot = %@ WHERE snapshotID = %@", v5, v4, v6];

  return v7;
}

- (id)removeSnapshotID:(id)a3
{
  if (a3)
  {
    id v4 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Snapshots WHERE snapshotID = %@", a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)removeSnapshot:(id)a3
{
  id v4 = [a3 snapshotID];
  uint64_t v5 = [(MBCKCache *)self removeSnapshotID:v4];

  return v5;
}

- (id)enumerateSnapshots:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v4 format:@"SELECT snapshot FROM Snapshots ORDER BY created DESC"];

  return v5;
}

- (id)enumerateSnapshotIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v4 format:@"SELECT snapshotID FROM Snapshots ORDER BY created DESC"];

  return v5;
}

- (id)fetchMostRecentSnapshotWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(MBCKCache *)self _fetchObjectOfClass:v5 error:a3 format:@"SELECT snapshot FROM Snapshots ORDER BY created DESC LIMIT 1"];
}

- (id)fetchMostRecentSnapshotForDevice:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000D9658;
  id v16 = sub_1000D9668;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DF7B0;
  v9[3] = &unk_100412FE8;
  id v5 = a3;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = [(MBCKCache *)self enumerateSnapshots:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)sizeOfSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000D9658;
  id v17 = sub_1000D9668;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DF9A4;
  v8[3] = &unk_1004129C0;
  uint64_t v9 = self;
  uint64_t v11 = &v13;
  id v5 = a3;
  id v10 = v5;
  uint64_t v12 = &v19;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }
  unint64_t v6 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)addManifest:(id)a3 toPendingSnapshot:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 manifestID];
  id v7 = [v5 snapshotID];
  uint64_t v8 = [v5 domainName];
  uint64_t v9 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Manifests (manifestID, snapshotID, domain, manifest) VALUES (%@, %@, %@, %@)", v6, v7, v8, v5];

  return v9;
}

- (id)enumerateManifestsForSnapshot:(id)a3 foundManifest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v7 snapshotID];

  id v10 = [(MBCKCache *)self _enumerateObjectsOfClass:v8, v6, @"SELECT manifest FROM Manifests WHERE snapshotID = %@", v9 callback format];

  return v10;
}

- (id)removeManifestAndFiles:(id)a3
{
  id v4 = [a3 manifestID];
  id v5 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Manifests WHERE manifestID = %@", v4];

  return v5;
}

- (int)countManifestsForSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000D9658;
  uint64_t v21 = sub_1000D9668;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DFDE0;
  v8[3] = &unk_1004129C0;
  uint64_t v9 = self;
  uint64_t v11 = &v17;
  id v5 = a3;
  id v10 = v5;
  uint64_t v12 = &v13;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v18[5];
  }
  int v6 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (id)addManifestPage:(id)a3 forManifestID:(id)a4 pageIndex:(unint64_t)a5
{
  return [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO ManifestPages (manifestID, pageIndex, manifestPage) VALUES (%@, %lu, %@)", a4, a5, a3];
}

- (int)countManifestPagesForManifestID:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000D9658;
  uint64_t v21 = sub_1000D9668;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E007C;
  v8[3] = &unk_1004129C0;
  uint64_t v9 = self;
  uint64_t v11 = &v17;
  id v5 = a3;
  id v10 = v5;
  uint64_t v12 = &v13;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v18[5];
  }
  int v6 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (id)deleteManifestPagesForManifestID:(id)a3
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM ManifestPages WHERE manifestID = %@", a3];
}

- (id)fetchManifestPageForManifestID:(id)a3 pageIndex:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a5, @"SELECT manifestPage from ManifestPages WHERE manifestID = %@ AND pageIndex = %lu", v8, a4 error format];

  return v9;
}

- (id)updateFile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fileID];
  int v6 = [(MBCKCache *)self _executeSQL:@"UPDATE Files SET file = %@ WHERE fileID = %@", v4, v5];

  return v6;
}

- (id)addFile:(id)a3 toManifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 deleted] & 1) != 0
    || ([v6 isDirectory] & 1) != 0
    || (id v8 = [v6 protectionClass], v8 == 255)
    || (id v9 = v8,
        +[MBProtectionClassUtils canOpenWhenLocked:v8]))
  {
    id v10 = [v6 fileID];
    uint64_t v11 = [v7 manifestID];
    uint64_t v12 = [v6 domainName];
    uint64_t v13 = [v6 relativePath];
    uint64_t v14 = [v6 modified];
    uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 deleted]);
    int v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 fileType]);
    -[MBCKCache _executeSQL:](self, "_executeSQL:", @"INSERT OR REPLACE INTO Files (fileID, manifestID, domain, relativePath, modified, deleted, fileType, file, size) VALUES (%@, %@, %@, %@, %@, %@, %@, %@, %llu)", v10, v11, v12, v13, v14, v15, v16, v6, [v6 size], v19);
  }
  else
  {
    [v6 fileID];
    id v10 = v20 = v9;
    uint64_t v11 = [v7 manifestID];
    uint64_t v12 = [v6 domainName];
    uint64_t v13 = [v6 relativePath];
    uint64_t v14 = [v6 modified];
    uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 deleted]);
    int v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 fileType]);
    -[MBCKCache _executeSQL:](self, "_executeSQL:", @"INSERT OR REPLACE INTO Files (fileID, manifestID, domain, relativePath, modified, deleted, fileType, file, size, protectionClass) VALUES (%@, %@, %@, %@, %@, %@, %@, %@, %llu, %d)", v10, v11, v12, v13, v14, v15, v16, v6, [v6 size], v20);
  uint64_t v17 = };

  return v17;
}

- (int64_t)checksumForManifest:(id)a3 error:(id *)a4
{
  return [(MBCKCache *)self checksumForManifest:a3 shouldLog:0 error:a4];
}

- (int64_t)checksumForManifest:(id)a3 shouldLog:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (v6)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Cache] Calculating checksum for %@", buf, 0xCu);
      _MBLog();
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E0770;
  v16[3] = &unk_100413010;
  BOOL v17 = v6;
  v16[4] = self;
  v16[5] = &v18;
  id v10 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v16, @"SELECT fileID FROM Files WHERE manifestID = %@", v8 callback format];
  uint64_t v11 = v10;
  if (a5) {
    *a5 = v10;
  }
  if (v6)
  {
    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (void *)v19[3];
      *(_DWORD *)buf = 134218242;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[Cache] %llx checksum for %@", buf, 0x16u);
      _MBLog();
    }
  }
  int64_t v14 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v14;
}

- (id)moveManifest:(id)a3 toSnapshot:(id)a4
{
  return [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Manifests (manifestID, snapshotID, domain) SELECT manifestID, %@, domain FROM Manifests WHERE manifestID == %@", a4, a3];
}

- (id)mergeManifest:(id)a3 withNewerManifest:(id)a4 outputManifest:(id)a5 mergeDeletions:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Files (fileID, manifestID, domain, modified, relativePath, deleted, fileType, size, file, protectionClass) SELECT  fileID,     %@,     domain, modified, relativePath, deleted, fileType, size, file, protectionClass FROM Files WHERE manifestID == %@", v12, v11];
  if (!v13)
  {
    uint64_t v13 = [(MBCKCache *)self _executeSQL:@"INSERT OR IGNORE INTO Files (fileID, manifestID, domain, modified, relativePath, deleted, fileType, size, file, protectionClass) SELECT  fileID,     %@,     domain, modified, relativePath, deleted, fileType, size, file, protectionClass FROM Files WHERE manifestID == %@", v12, v10];
    if (!v13 && !a6)
    {
      uint64_t v13 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Files WHERE manifestID == %@ AND deleted == 1 AND fileID IN (SELECT fileID FROM Files WHERE manifestID == %@)", v12, v11];
    }
  }

  return v13;
}

- (id)enumerateFilesForManifest:(id)a3 foundFile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = [v7 manifestID];

  id v10 = [(MBCKCache *)self _enumerateObjectsOfClass:v8, v6, @"SELECT file FROM Files WHERE manifestID = %@ ORDER BY relativePath ASC", v9 callback format];

  return v10;
}

- (id)enumerateFilesForSnapshotOrderedByDomain:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  uint64_t v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E0BF0;
  v12[3] = &unk_100413038;
  v12[4] = self;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)removeUncommittedFileWithDomain:(id)a3 relativePath:(id)a4 pendingManifestID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Files WHERE domain = %@ AND relativePath = %@ AND manifestID = %@", v8, v9, a5];
  if (!v10)
  {
    id v10 = [(MBCKCache *)self _executeSQL:@"DELETE FROM FileChanges WHERE domain = %@ AND relativePath = %@", v8, v9];
  }
  id v11 = v10;

  return v11;
}

- (id)enumerateFiles:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v4 format:@"SELECT file FROM Files"];

  return v5;
}

- (id)fetchFileFromFileID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a4, @"SELECT file FROM Files where fileID = %@ LIMIT 1", v6 error format];

  return v7;
}

- (id)domainNameForManifestID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a4, @"SELECT domain FROM Manifests where manifestID = %@", v6 error format];

  return v7;
}

- (BOOL)committedManifestContainsDomain:(id)a3 relativePath:(id)a4 pendingManifestID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1000D9658;
  long long v33 = sub_1000D9668;
  id v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E1138;
  v19[3] = &unk_100413060;
  v19[4] = self;
  id v23 = &v29;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  __int16 v24 = &v25;
  [(MBCKCache *)self _perform:v19];
  uint64_t v16 = (void *)v30[5];
  if (v16)
  {
    BOOL v17 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    BOOL v17 = *((unsigned char *)v26 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (unint64_t)countFilesForManifest:(id)a3 error:(id *)a4
{
  id v6 = [a3 manifestID];
  unint64_t v7 = [(MBCKCache *)self countFilesForManifestID:v6 error:a4];

  return v7;
}

- (unint64_t)countFilesForManifestID:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000D9658;
  id v21 = sub_1000D9668;
  id v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1400;
  v8[3] = &unk_1004129C0;
  id v9 = self;
  id v11 = &v17;
  id v5 = a3;
  id v10 = v5;
  id v12 = &v13;
  [(MBCKCache *)v9 _perform:v8];
  unint64_t v6 = v14[3];
  if (a4 && !v6)
  {
    *a4 = (id) v18[5];
    unint64_t v6 = v14[3];
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (unint64_t)countDomainHmacForManifest:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000D9658;
  id v21 = sub_1000D9668;
  id v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1670;
  v8[3] = &unk_1004129C0;
  id v9 = self;
  id v11 = &v17;
  id v5 = a3;
  id v10 = v5;
  id v12 = &v13;
  [(MBCKCache *)v9 _perform:v8];
  unint64_t v6 = v14[3];
  if (a4 && !v6)
  {
    *a4 = (id) v18[5];
    unint64_t v6 = v14[3];
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (id)fetchFileWithDomain:(id)a3 relativePath:(id)a4 snapshotID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a6, @"SELECT file FROM Files WHERE domain = %@ AND relativePath = %@ AND manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID = %@)", v12, v11, v10 error format];

  return v13;
}

- (unint64_t)countRestoreFilesWithSourceDeviceInode:(unint64_t)a3 signature:(id)a4 volumeType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1000D9658;
  uint64_t v27 = sub_1000D9668;
  id v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E19C0;
  v12[3] = &unk_100413088;
  uint64_t v13 = self;
  uint64_t v15 = &v23;
  unint64_t v17 = a3;
  id v8 = a4;
  unint64_t v18 = a5;
  id v14 = v8;
  uint64_t v16 = &v19;
  [(MBCKCache *)v13 _perform:v12];
  unint64_t v9 = v20[3];
  if (!v9)
  {
    if (a6)
    {
      id v10 = (void *)v24[5];
      if (v10) {
        *a6 = v10;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)setFileStateToPending:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000D9658;
  uint64_t v16 = sub_1000D9668;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1C40;
  v8[3] = &unk_1004130B0;
  id v11 = &v12;
  unint64_t v9 = self;
  id v3 = a3;
  id v10 = v3;
  id v4 = [(MBCKCache *)v9 performInTransaction:v8];
  id v5 = v13;
  if (v4 && !v13[5])
  {
    objc_storeStrong(v13 + 5, v4);
    id v5 = v13;
  }
  id v6 = v5[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)setFileStateToCompleted:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000D9658;
  uint64_t v16 = sub_1000D9668;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1E50;
  v8[3] = &unk_1004130B0;
  id v11 = &v12;
  unint64_t v9 = self;
  id v3 = a3;
  id v10 = v3;
  id v4 = [(MBCKCache *)v9 performInTransaction:v8];
  id v5 = v13;
  if (v4 && !v13[5])
  {
    objc_storeStrong(v13 + 5, v4);
    id v5 = v13;
  }
  id v6 = v5[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)summarizeCloudFilesPendingDeleteForManifestID:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  id v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E22A4;
  v12[3] = &unk_100413038;
  void v12[4] = self;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)enumerateCloudFilesPendingDeleteForManifestID:(id)a3 withFoundFileID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v6, @"SELECT fileID FROM CloudFilesPendingDelete WHERE manifestID = %@", v7 callback format];

  return v8;
}

- (id)deleteCloudFilesPendingDeleteForManifestID:(id)a3
{
  return [(MBCKCache *)self _executeSQL:@"DELETE from CloudFilesPendingDelete WHERE manifestID = %@", a3];
}

- (id)deleteCloudFilePendingDeleteWithFileID:(id)a3
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM CloudFilesPendingDelete where fileID=%@", a3];
}

- (id)deleteCloudFilesPendingDelete
{
  return [(MBCKCache *)self _executeSQL:@"DELETE from CloudFilesPendingDelete"];
}

- (id)enumerateKeybagUUIDsForAllFiles:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  id v20 = sub_1000D9668;
  id v21 = +[NSMutableSet set];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E26E0;
  v15[3] = &unk_1004130D8;
  v15[4] = &v16;
  id v5 = [(MBCKCache *)self enumerateFiles:v15];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = (id)v17[5];
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * i));
        }
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

- (id)addSnapshotIntoFileChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _executeSQL:@"INSERT or REPLACE INTO FileChanges (domain, relativePath, size, changeType, shouldCopy) SELECT domain, relativePath, size, %d, 0 FROM Files WHERE deleted == 0 AND (manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID == %@))", 0, v4];
  if (!v5)
  {
    id v5 = [(MBCKCache *)self _executeSQL:@"INSERT or REPLACE INTO FileChanges (domain, relativePath, size, changeType, shouldCopy) SELECT domain, relativePath, size, %d, 0 FROM Files WHERE deleted == 1 AND (manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID == %@))", 3, v4];
  }
  id v6 = v5;

  return v6;
}

- (id)markFileChangesAsUnmodifiedForDomainNames:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(MBCKCache *)self _executeSQL:@"UPDATE FileChanges SET changeType = %d WHERE domain = %@", 0, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12];
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)markAllFileChangesAsDeleted
{
  return [(MBCKCache *)self _executeSQL:@"UPDATE FileChanges SET changeType = %d", 3];
}

- (id)removeAllFileChanges
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM FileChanges"];
}

- (id)removeDeletedFileChanges
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM FileChanges WHERE changeType = %d", 3];
}

- (id)fileSeen:(id)a3 changeType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 domainName];
  uint64_t v8 = [v6 relativePath];
  id v9 = [v6 size];

  id v10 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO FileChanges (domain, relativePath, size, changeType, shouldCopy) VALUES (%@, %@, %llu, %lu, 0)", v7, v8, v9, a4];

  return v10;
}

- (id)markFileAsCopyable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainName];
  id v6 = [v4 relativePath];

  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"UPDATE FileChanges SET shouldCopy = 1 WHERE domain = %@ AND relativePath = %@", v5, v6];

  return v7;
}

- (id)lastBackedUpFileWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a5, @"WITH LastBackedUpFiles(file,created) AS( SELECT file, %llu from Files where domain = %@ AND relativePath = %@ AND SUBSTR(fileID, 0, 36) == (SELECT SUBSTR(value,3,36) from Properties where key == %@) UNION ALL  SELECT Files.file, Snapshots.created FROM Files,Manifests,Snapshots WHERE Files.domain = %@ AND Files.relativePath = %@ AND Files.manifestID == Manifests.manifestID AND Manifests.snapshotID == Snapshots.snapshotID)SELECT file from LastBackedUpFiles ORDER BY created DESC LIMIT 1", 0x7FFFFFFFFFFFFFFFLL, v9, v8, @"PendingSnapshotID", v9, v8 error format];

  return v10;
}

- (id)uploadedFileInPendingSnapshotWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a5, @" SELECT file from Files where domain = %@ AND relativePath = %@ AND SUBSTR(manifestID, 0, 36) == (SELECT SUBSTR(value,3,36) from Properties where key == %@)", v9, v8, @"PendingSnapshotID" error format];

  return v10;
}

- (id)lastBackedUpFileForFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 domainName];
  id v8 = [v6 relativePath];

  id v9 = [(MBCKCache *)self lastBackedUpFileWithDomainName:v7 relativePath:v8 error:a4];

  return v9;
}

- (id)enumerateFileChangesForDomainName:(id)a3 skipUnmodified:(BOOL)a4 foundChange:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1000D9658;
  uint64_t v23 = sub_1000D9668;
  id v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E2E20;
  v14[3] = &unk_100413100;
  v14[4] = self;
  id v17 = &v19;
  BOOL v18 = a4;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  [(MBCKCache *)self _perform:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)summarizeFileChangesForDomainName:(id)a3 foundChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  id v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E310C;
  v12[3] = &unk_100413038;
  void v12[4] = self;
  id v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)summarizeFileChangesForAllChanges:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000D9658;
  id v14 = sub_1000D9668;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E335C;
  v6[3] = &unk_100412C60;
  id v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)summarizeFileChanges:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000D9658;
  id v14 = sub_1000D9668;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E35A4;
  v6[3] = &unk_100412C60;
  id v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)hasDomainBeenBackedUp:(id)a3 backedUp:(BOOL *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v7 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), &v12, @"SELECT domain FROM FileChanges WHERE domain = %@ LIMIT 1", v6 error format];

  id v8 = v12;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  BOOL v10 = !v9;
  *a4 = v10;

  return v8;
}

- (id)summarizeFileChangesGroupByDomain:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000D9658;
  id v14 = sub_1000D9668;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E38E8;
  v6[3] = &unk_100412C60;
  id v7 = self;
  BOOL v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)previousSnapshotHasSkippedFiles
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000D9658;
  id v15 = sub_1000D9668;
  id v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3BC0;
  v6[3] = &unk_1004120A0;
  void v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(MBCKCache *)self _perform:v6];
  if (v12[5])
  {
    unsigned __int8 v2 = MBGetDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to check if previous snapshot has skipped files", v5, 2u);
      _MBLog();
    }

    BOOL v3 = 0;
    *((unsigned char *)v8 + 24) = 0;
  }
  else
  {
    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v3;
}

- (id)encryptionKeyForFileWithInodeNumber:(unint64_t)a3 volumeType:(unint64_t)a4 error:(id *)a5
{
  return [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a5, @"WITH AllEncryptionKeys(key,ordinal) AS (SELECT key, 1 FROM FoundEncryptionKeys WHERE inode = %llu AND volumeType = %lu AND key IS NOT NULL UNION ALL SELECT key, 2 FROM EncryptionKeys WHERE inode = %llu AND volumeType = %lu AND key IS NOT NULL) SELECT key from AllEncryptionKeys ORDER BY ordinal ASC LIMIT 1", a3, a4, a3, a4 error format];
}

- (id)setFileMissingEncryptionKeyForPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self setFileEncryptionKey:0 forInodeNumber:0 volumeType:0 atPath:v4];
  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to track the missing encryption key for %@: %@", buf, 0x16u);
      _MBLog();
    }
  }
  return v5;
}

- (id)setFileEncryptionKey:(id)a3 forInodeNumber:(unint64_t)a4 volumeType:(unint64_t)a5 atPath:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = v11;
  if (!v11 || (!a5 ? (BOOL v13 = v10 != 0) : (BOOL v13 = 0), (v10 != 0) != (a4 != 0) || v13))
  {
    uint64_t v14 = +[MBError errorWithCode:1 format:@"Invalid call to setFileEncryptionKey"];
  }
  else
  {
    uint64_t v14 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO FoundEncryptionKeys (inode, volumeType, path, key) VALUES (%llu, %lu, %@, %@)", a4, a5, v11, v10];
  }
  id v15 = (void *)v14;

  return v15;
}

- (void)removeFileEncryptionKeyForInode:(unint64_t)a3 volumeType:(unint64_t)a4
{
  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"DELETE FROM FoundEncryptionKeys WHERE inode = %llu AND volumeType = %lu", a3, a4];
  if (v7)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v13 = a3;
      __int16 v14 = 2048;
      unint64_t v15 = a4;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove the cached encryption key (FoundEncryptionKeys) for inode %llu volumeType %lu: %@", buf, 0x20u);
      id v11 = v7;
      _MBLog();
    }
  }
  id v9 = [(MBCKCache *)self _executeSQL:@"DELETE FROM EncryptionKeys WHERE inode = %llu AND volumeType = %lu", a3, a4, v11];

  if (v9)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v13 = a3;
      __int16 v14 = 2048;
      unint64_t v15 = a4;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove the cached encryption key (EncryptionKeys) for inode %llu volumeType %lu: %@", buf, 0x20u);
      _MBLog();
    }
  }
}

- (id)removeAllFileEncryptionKeys
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM FoundEncryptionKeys WHERE key IS NOT NULL"];
}

- (id)removeAllFilesMissingEncryptionKeys
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM FoundEncryptionKeys WHERE key IS NULL AND inode = 0 AND volumeType = 0"];
}

- (id)enumerateFilesMissingEncryptionKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v4 format:@"SELECT path FROM FoundEncryptionKeys WHERE key IS NULL AND inode = 0 AND volumeType = 0"];

  return v5;
}

- (unint64_t)countFilesMissingEncryptionKeysWithError:(id *)a3
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000D9658;
  id v11 = sub_1000D9668;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E428C;
  v6[3] = &unk_1004120A0;
  void v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v13;
  [(MBCKCache *)self _perform:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  unint64_t v4 = v14[3];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (id)rebuildEncryptionKeysTable
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  id v5 = [(MBCKCache *)self _executeSQL:@"DELETE FROM EncryptionKeys"];
  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to remove all the cached encryption keys: %@", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }

    id v7 = v5;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v9 = v8;
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v9 - v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removed all cached encryption keys in %.3fs", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    id v41 = sub_1000D9658;
    __int16 v42 = sub_1000D9668;
    id v43 = 0;
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000E47F8;
    v24[3] = &unk_100413128;
    v24[6] = &v25;
    v24[7] = &buf;
    v24[4] = self;
    v24[5] = &v29;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000E4B10;
    v22[3] = &unk_100413150;
    v22[4] = self;
    uint64_t v13 = objc_retainBlock(v24);
    id v23 = v13;
    double v14 = [(MBCKCache *)self performInTransaction:v22];
    if (v14 == 0.0 && (double v14 = COERCE_DOUBLE(*(id *)(*((void *)&buf + 1) + 40)), v14 == 0.0))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v18 = v17;
      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v30[3];
        uint64_t v21 = v26[3];
        *(_DWORD *)long long v33 = 134218496;
        double v34 = v18 - v12;
        __int16 v35 = 2048;
        uint64_t v36 = v20;
        __int16 v37 = 2048;
        uint64_t v38 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rebuilt the cached encryption keys table in %.3fs (%llu keys, %llu bytes)", v33, 0x20u);
        _MBLog();
      }

      id v7 = 0;
    }
    else
    {
      uint64_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v33 = 138412290;
        double v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to enumerate all the files from the Files table: %@", v33, 0xCu);
        _MBLog();
      }

      id v7 = *(id *)&v14;
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&buf, 8);
  }
  return v7;
}

- (unint64_t)sizeOfDomain:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1000D9658;
  double v17 = sub_1000D9668;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E4CE4;
  v8[3] = &unk_1004129C0;
  double v9 = self;
  double v11 = &v13;
  id v5 = a3;
  id v10 = v5;
  double v12 = &v19;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }
  unint64_t v6 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)enumerateDomainNames:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v4 format:@"SELECT DISTINCT(domain) FROM Manifests WHERE snapshotID IN (SELECT snapshotID FROM Snapshots)"];

  return v5;
}

- (id)enumerateChangedDomainNames:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v4, @"SELECT DISTINCT(domain) FROM FileChanges WHERE changeType != %lu", 0 callback format];

  return v5;
}

- (id)enumerateDomainNamesOfPendingSnapshot:(id)a3 domainCallback:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v5 format:@"SELECT DISTINCT(domain) FROM Files WHERE manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots))"];
  if (!v6)
  {
    unint64_t v6 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v5 format:@"SELECT DISTINCT(domain) FROM Files WHERE manifestID NOT IN (SELECT manifestID FROM Manifests)"];
    if (!v6)
    {
      unint64_t v6 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class() callback:v5 format:@"SELECT DISTINCT(domain) FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots) AND manifestID NOT IN (SELECT manifestID FROM Files)"];
    }
  }
  id v7 = v6;

  return v7;
}

- (BOOL)computeSignatureRetainCountsWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = sub_1000D9658;
  uint64_t v13 = sub_1000D9668;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E50CC;
  v8[3] = &unk_100413178;
  void v8[4] = self;
  v8[5] = &v9;
  id v4 = [(MBCKCache *)self performInTransaction:v8];
  id v5 = (void *)v10[5];
  if (!v5)
  {
    if (!v4)
    {
      BOOL v6 = 1;
      goto LABEL_8;
    }
    id v5 = v4;
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v6 = 0;
  *a3 = v5;
LABEL_8:

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)decrementRetainCountForSignature:(id)a3 volumeType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!_os_feature_enabled_impl())
  {
    uint64_t v11 = &off_100439F18;
    goto LABEL_13;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1000D9658;
  uint64_t v28 = sub_1000D9668;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1000D9658;
  uint64_t v22 = sub_1000D9668;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E53F4;
  v13[3] = &unk_1004131A0;
  v13[4] = self;
  id v14 = v8;
  uint64_t v15 = &v24;
  uint64_t v16 = &v18;
  unint64_t v17 = a4;
  uint64_t v9 = [(MBCKCache *)self performInTransaction:v13];
  id v10 = (void *)v25[5];
  if (v10)
  {
    if (!a5)
    {
LABEL_10:
      uint64_t v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v11 = (_UNKNOWN **)(id)v19[5];
      goto LABEL_12;
    }
    if (!a5) {
      goto LABEL_10;
    }
    id v10 = v9;
  }
  uint64_t v11 = 0;
  *a5 = v10;
LABEL_12:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

LABEL_13:
  return v11;
}

- (id)retainCountForSignature:(id)a3 volumeType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = objc_opt_class();
    id v15 = 0;
    id v10 = [v8 base64EncodedStringWithOptions:0];
    uint64_t v11 = [(MBCKCache *)self _fetchObjectOfClass:v9, &v15, @"SELECT retainCount from HardlinkCloneFiles WHERE signature = %@ AND volumeType = %lu", v10, a4 error format];
    id v12 = v15;

    if (v12)
    {
      uint64_t v13 = 0;
      if (a5) {
        *a5 = v12;
      }
    }
    else
    {
      uint64_t v13 = v11;
    }
  }
  else
  {
    uint64_t v13 = &off_100439F18;
  }

  return v13;
}

- (id)updateStashPath:(id)a3 forSignature:(id)a4 volumeType:(unint64_t)a5 isDecrypted:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  if (_os_feature_enabled_impl())
  {
    id v12 = [v11 base64EncodedStringWithOptions:0];
    uint64_t v13 = [(MBCKCache *)self _executeSQL:@"UPDATE HardlinkCloneFiles SET stashPath = %@, stashedAssetIsDecrypted = %d WHERE signature = %@ AND volumeType = %lu", v10, v6, v12, a5];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)fileAssetMetadataForSignature:(id)a3 volumeType:(unint64_t)a4
{
  id v6 = a3;
  if (!_os_feature_enabled_impl())
  {
    id v10 = 0;
    goto LABEL_11;
  }
  uint64_t v36 = 0;
  __int16 v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_1000D9658;
  uint64_t v40 = sub_1000D9668;
  id v41 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_1000D9658;
  id v30 = sub_1000D9668;
  id v31 = 0;
  [v6 base64EncodedStringWithOptions:0];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1000D9658;
  uint64_t v24 = sub_1000D9668;
  id v25 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E5CA8;
  v13[3] = &unk_1004131C8;
  v13[4] = self;
  id v15 = &v20;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = &v26;
  unint64_t v19 = a4;
  id v14 = v7;
  uint64_t v16 = &v36;
  unint64_t v17 = &v32;
  [(MBCKCache *)self _perform:v13];
  if (v21[5])
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v21[5];
      *(_DWORD *)long long buf = 138412546;
      id v43 = v7;
      __int16 v44 = 2112;
      uint64_t v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error fetching cached file metadata for %@: %@", buf, 0x16u);
      _MBLog();
    }
  }
  else
  {
    if (v37[5] || v27[5])
    {
      id v11 = [MBCKFileAssetMetadata alloc];
      id v10 = [(MBCKFileAssetMetadata *)v11 initWithStashedAssetPath:v37[5] stashedAssetIsDecrypted:*((unsigned __int8 *)v33 + 24) decodedAssetPath:v27[5]];
      goto LABEL_10;
    }
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found nil stashed and decoded asset path for %@", buf, 0xCu);
      _MBLog();
    }
  }

  id v10 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

LABEL_11:
  return v10;
}

- (id)updateDecodedAssetPath:(id)a3 forSignature:(id)a4 volumeType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    id v10 = [v9 base64EncodedStringWithOptions:0];
    id v11 = [(MBCKCache *)self _executeSQL:@"UPDATE HardlinkCloneFiles SET decodedAssetPath = %@ WHERE signature = %@ AND volumeType = %lu", v8, v10, a5];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)addFileToRestoreFiles:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainName];

  if (v5)
  {
    id v6 = [v4 signature];
    if (!v6 && [v4 size]) {
      __assert_rtn("-[MBCKCache addFileToRestoreFiles:]", "MBCKCache.m", 2370, "file.signature || file.size == 0");
    }

    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_1000D9658;
    unint64_t v19 = sub_1000D9668;
    id v20 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E6074;
    v12[3] = &unk_1004130B0;
    id v14 = &v15;
    void v12[4] = self;
    id v13 = v4;
    uint64_t v7 = [(MBCKCache *)self performInTransaction:v12];
    id v8 = (void *)v7;
    id v9 = (void *)v16[5];
    if (v9 || (id v9 = (void *)v7) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = +[MBError errorWithCode:1 format:@"Invalid domain name"];
  }

  return v10;
}

- (id)prioritizeRestoreFileWithDomain:(id)a3 relativePath:(id)a4
{
  if (a3) {
    [(MBCKCache *)self _executeSQL:@"UPDATE RestoreFiles SET priority = (SELECT COALESCE(MAX(priority),0)+1 FROM RestoreFiles) WHERE domain = %@ AND relativePath = %@", a3, a4];
  }
  else {
  id v4 = +[MBError errorWithCode:1 format:@"Invalid domain name"];
  }
  return v4;
}

- (id)removeDeletedRestoreFiles
{
  return [(MBCKCache *)self _executeSQL:@"DELETE FROM RestoreFiles WHERE fileID IN (SELECT fileID FROM Files WHERE deleted = 1)"];
}

- (id)setRestoreState:(unint64_t)a3 forFile:(id)a4
{
  id v6 = [a4 fileID];
  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"UPDATE RestoreFiles SET restoreState = %lu WHERE fileID = %@", a3, v6];

  return v7;
}

- (id)setRestoreType:(int)a3 forFile:(id)a4
{
  uint64_t v5 = a3;
  id v6 = [a4 fileID];
  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"UPDATE RestoreFiles SET restoreType = %lu WHERE fileID = %@", v5, v6];

  return v7;
}

- (id)setRestoreState:(unint64_t)a3 forFilesInDomain:(id)a4
{
  return [(MBCKCache *)self _executeSQL:@"UPDATE RestoreFiles SET restoreState = %lu WHERE fileID IN (SELECT RestoreFiles.fileID FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.domain = %@)", a3, a4];
}

- (id)hasRestoreFilesWithCallback:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000D9658;
  id v14 = sub_1000D9668;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E6468;
  v6[3] = &unk_100412C60;
  uint64_t v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(MBCKCache *)v7 _perform:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)enumerateRestoreFilesForDomain:(id)a3 state:(unint64_t)a4 foundRestorable:(id)a5 range:(_NSRange)a6
{
  return -[MBCKCache _enumerateRestoreFilesForDomain:state:negatingStateAndErrorState:foundRestorable:range:](self, "_enumerateRestoreFilesForDomain:state:negatingStateAndErrorState:foundRestorable:range:", a3, a4, 0, a5, a6.location, a6.length);
}

- (id)enumerateRestoreFilesForDomain:(id)a3 excludingState:(unint64_t)a4 foundRestorable:(id)a5 range:(_NSRange)a6
{
  return -[MBCKCache _enumerateRestoreFilesForDomain:state:negatingStateAndErrorState:foundRestorable:range:](self, "_enumerateRestoreFilesForDomain:state:negatingStateAndErrorState:foundRestorable:range:", a3, a4, 1, a5, a6.location, a6.length);
}

- (id)_enumerateRestoreFilesForDomain:(id)a3 state:(unint64_t)a4 negatingStateAndErrorState:(BOOL)a5 foundRestorable:(id)a6 range:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a3;
  id v14 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1000D9658;
  id v31 = sub_1000D9668;
  id v32 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E6728;
  v19[3] = &unk_1004131F0;
  v19[4] = self;
  uint64_t v22 = &v27;
  unint64_t v23 = a4;
  BOOL v26 = a5;
  id v15 = v13;
  id v20 = v15;
  NSUInteger v24 = location;
  NSUInteger v25 = length;
  id v16 = v14;
  id v21 = v16;
  [(MBCKCache *)self _perform:v19];
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)enumeratePendingRestoreFilesForAnyDomainOrderAscendingWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v4, @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.restoreState < %lu ORDER BY Files.relativePath ASC", 11 callback format];

  return v5;
}

- (id)enumeratePendingRestoreRegularFilesForAnyDomainOrderAscendingWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v4, @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.restoreState < %lu AND Files.fileType = 0 ORDER BY Files.relativePath ASC", 11 callback format];

  return v5;
}

- (id)enumeratePendingRestoreFilesForDomain:(id)a3 orderAscending:(BOOL)a4 foundRestorable:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  if (v5) {
    CFStringRef v11 = @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.restoreState < %lu AND Files.domain = %@ ORDER BY Files.relativePath ASC";
  }
  else {
    CFStringRef v11 = @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.restoreState < %lu AND Files.domain = %@ ORDER BY Files.relativePath DESC";
  }
  uint64_t v12 = -[MBCKCache _enumerateObjectsOfClass:callback:format:](self, "_enumerateObjectsOfClass:callback:format:", v10, v8, v11, 11, v9);

  return v12;
}

- (id)enumeratePendingRestoreFilesForDomain:(id)a3 forType:(unint64_t)a4 orderAscending:(BOOL)a5 foundRestorable:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = objc_opt_class();
  if (v6) {
    CFStringRef v13 = @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE Files.fileType = %lu AND Files.domain = %@ ORDER BY Files.relativePath ASC";
  }
  else {
    CFStringRef v13 = @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE Files.fileType = %lu AND Files.domain = %@ ORDER BY Files.relativePath DESC";
  }
  id v14 = -[MBCKCache _enumerateObjectsOfClass:callback:format:](self, "_enumerateObjectsOfClass:callback:format:", v12, v10, v13, a4, v11);

  return v14;
}

- (id)enumeratePendingRestoreFilesForDomain:(id)a3 excludingType:(unint64_t)a4 foundRestorable:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v8, @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE Files.fileType != %lu AND Files.domain = %@ ORDER BY Files.relativePath", a4, v9 callback format];

  return v10;
}

- (id)fetchRestorableFileForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKCache fetchRestorableFileForPath:error:]", "MBCKCache.m", 2520, "absolutePath");
  }
  uint64_t v7 = v6;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000D9658;
  id v21 = sub_1000D9668;
  id v22 = 0;
  uint64_t v8 = objc_opt_class();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E6D7C;
  v14[3] = &unk_100413218;
  id v16 = &v17;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(MBCKCache *)self _enumerateObjectsOfClass:v8, v14, @"SELECT Files.file FROM RestoreFiles JOIN Files ON Files.fileID = RestoreFiles.fileID WHERE absolutePath = %@", v9 callback format];
  id v11 = v10;
  if (a4) {
    *a4 = v10;
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (unint64_t)fetchRestoreFileStateForFileID:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000D9658;
  uint64_t v17 = sub_1000D9668;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E6F38;
  v8[3] = &unk_1004129C0;
  id v9 = self;
  id v11 = &v13;
  id v5 = a3;
  id v10 = v5;
  id v12 = &v19;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }
  unint64_t v6 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)enumeratePendingRestorableDomainsWithCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKCache *)self _enumerateObjectsOfClass:objc_opt_class(), v4, @"SELECT DISTINCT(Files.domain) FROM RestoreFiles JOIN Files on Files.fileID = RestoreFiles.fileID WHERE RestoreFiles.restoreState < %lu", 11 callback format];

  return v5;
}

- (id)setDomainRestoreState:(unint64_t)a3 forDomain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MBCKCache *)self _executeSQL:@"UPDATE RestoreDomains SET state = %lu WHERE domain = %@", a3, v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(MBCKCache *)self _executeSQL:@"INSERT OR IGNORE INTO RestoreDomains (state, domain) VALUES (%lu, %@)", a3, v6];
  }
  id v10 = v9;

  return v10;
}

- (id)setDomainRestoreAgent:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MBCKCache *)self _executeSQL:@"UPDATE RestoreDomains SET agent = %@ WHERE domain = %@", v6, v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(MBCKCache *)self _executeSQL:@"INSERT OR IGNORE INTO RestoreDomains (agent, domain, state) VALUES (%@, %@, %lu)", v6, v7, 1];
  }
  id v11 = v10;

  return v11;
}

- (id)clearAgentForDomainRestoresWithAgentDomain:(id)a3
{
  return [(MBCKCache *)self _executeSQL:@"UPDATE RestoreDomains SET agent = NULL WHERE agent = %@", a3];
}

- (id)setDomainShouldRestoreToSafeHarbor:(BOOL)a3 forDomain:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MBCKCache *)self _executeSQL:@"UPDATE RestoreDomains SET safeHarbor = %d WHERE domain = %@", v4, v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(MBCKCache *)self _executeSQL:@"INSERT OR IGNORE INTO RestoreDomains (safeHarbor, domain, state) VALUES (%d, %@, %lu)", v4, v6, 1];
  }
  id v10 = v9;

  return v10;
}

- (BOOL)domainShouldRestoreToSafeHarbor:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1000D9658;
  uint64_t v22 = sub_1000D9668;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E743C;
  v9[3] = &unk_1004129C0;
  id v10 = self;
  id v12 = &v18;
  id v5 = a3;
  id v11 = v5;
  uint64_t v13 = &v14;
  [(MBCKCache *)v10 _perform:v9];
  if (a4)
  {
    id v6 = (void *)v19[5];
    if (v6) {
      *a4 = v6;
    }
  }
  char v7 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v7;
}

- (id)fetchDomainRestoreStateForDomain:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  uint64_t v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E7684;
  v12[3] = &unk_100413038;
  void v12[4] = self;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)fetchPendingRestoreSizeForDomain:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  uint64_t v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E7924;
  v12[3] = &unk_100413038;
  void v12[4] = self;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)fetchRestoreSizeForDomain:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1000D9658;
  uint64_t v20 = sub_1000D9668;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E7BB4;
  v12[3] = &unk_100413038;
  void v12[4] = self;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(MBCKCache *)self _perform:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (unint64_t)fetchRestoreStateForDeviceUUID:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1000D9658;
  id v23 = sub_1000D9668;
  id v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E7E80;
  v14[3] = &unk_100412B50;
  void v14[4] = self;
  char v17 = &v19;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  uint64_t v18 = &v25;
  [(MBCKCache *)self _perform:v14];
  if (a5) {
    *a5 = (id) v20[5];
  }
  unint64_t v12 = v26[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)setRestoreState:(unint64_t)a3 forDeviceUUID:(id)a4 snapshotUUID:(id)a5
{
  return [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO Restores (state, deviceUUID, snapshotUUID) VALUES (%lu, %@, %@)", a3, a4, a5];
}

- (id)clearAllRestoreData
{
  id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Restores;"];
  if (!v3)
  {
    id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM RestoreFiles;"];
    if (!v3)
    {
      id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM RestoreDomains;"];
    }
  }
  return v3;
}

- (BOOL)removeAllScannedDomains:(id *)a3
{
  BOOL v4 = [(MBCKCache *)self _executeSQL:@"DELETE FROM ScannedDomains"];
  id v5 = v4;
  if (a3 && v4) {
    *a3 = v4;
  }

  return v5 == 0;
}

- (id)updateScannedDomain:(id)a3 withSize:(unint64_t)a4
{
  return [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO ScannedDomains (domain, size) VALUES (%@, %llu)", a3, a4];
}

- (unint64_t)sizeOfScannedDomain:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000D9658;
  char v17 = sub_1000D9668;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E81FC;
  v8[3] = &unk_1004129C0;
  id v9 = self;
  id v11 = &v13;
  id v5 = a3;
  id v10 = v5;
  unint64_t v12 = &v19;
  [(MBCKCache *)v9 _perform:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }
  unint64_t v6 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)domainNamesForRestoreFailures:(id *)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000D9658;
  id v16 = sub_1000D9668;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E8450;
  v8[3] = &unk_100413240;
  id v9 = self;
  id v11 = &v12;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v10 = v4;
  [(MBCKCache *)v9 _perform:v8];
  id v5 = (void *)v13[5];
  if (v5)
  {
    unint64_t v6 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    unint64_t v6 = [v4 allObjects];
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (unint64_t)sizeOfPendingRestore:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000D9658;
  id v17 = sub_1000D9668;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E86BC;
  v7[3] = &unk_100413268;
  v7[4] = self;
  v7[5] = &v13;
  v7[6] = v8;
  v7[7] = &v9;
  [(MBCKCache *)self _perform:v7];
  if (a3)
  {
    id v4 = (void *)v14[5];
    if (v4) {
      *a3 = v4;
    }
  }
  unint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (id)dependentDomainsForApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MBCKCache *)self _fetchObjectOfClass:objc_opt_class(), a4, @"SELECT dependentDomains from RestoreApps where domain = %@", v6 error format];

  id v8 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v7 error:0];
  uint64_t v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];

  return v9;
}

- (id)addDependentDomains:(id)a3 forApp:(id)a4
{
  id v6 = a4;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  id v8 = [(MBCKCache *)self _executeSQL:@"INSERT OR REPLACE INTO RestoreApps (domain, dependentDomains) VALUES (%@, %@)", v6, v7];

  return v8;
}

- (id)fetchDomainsWithTopNFileCounts:(unint64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000D9658;
  id v18 = sub_1000D9668;
  id v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E8A94;
  v9[3] = &unk_1004117A0;
  id v10 = self;
  uint64_t v12 = &v14;
  unint64_t v13 = a3;
  id v5 = (id)objc_opt_new();
  id v11 = v5;
  [(MBCKCache *)v10 _perform:v9];
  id v6 = (void *)v15[5];
  if (v6)
  {
    id v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    id v7 = v5;
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)fetchDomainsWithTopNSizes:(unint64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000D9658;
  id v18 = sub_1000D9668;
  id v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E8D40;
  v9[3] = &unk_1004117A0;
  id v10 = self;
  uint64_t v12 = &v14;
  unint64_t v13 = a3;
  id v5 = (id)objc_opt_new();
  id v11 = v5;
  [(MBCKCache *)v10 _perform:v9];
  id v6 = (void *)v15[5];
  if (v6)
  {
    id v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    id v7 = v5;
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)removeAllOrphanedItemsForSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 snapshotID];
  id v6 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Files WHERE manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots) AND snapshotID != %@)", v5];

  if (!v6)
  {
    id v7 = [v4 snapshotID];
    id v6 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots) AND snapshotID != %@", v7];
  }
  id v8 = v6;

  return v8;
}

- (id)removeAllOrphanedItems
{
  id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Files WHERE manifestID IN (SELECT manifestID FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots))"];
  if (!v3)
  {
    id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Files WHERE manifestID NOT IN (SELECT manifestID FROM Manifests)"];
    if (!v3)
    {
      id v3 = [(MBCKCache *)self _executeSQL:@"DELETE FROM Manifests WHERE snapshotID NOT IN (SELECT snapshotID FROM Snapshots)"];
    }
  }
  id v4 = v3;

  return v4;
}

- (MBCKCacheTracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (OS_dispatch_queue)sharedQueue
{
  return self->_sharedQueue;
}

- (void)setSharedQueue:(id)a3
{
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pdb, 0);
}

@end