@interface BooksClient
+ (id)alternatePathForPlist:(id)a3 withNamePrefix:(id)a4;
+ (id)bookExtensions;
+ (id)foregroundRestoreWhitelist;
- (BCAssetDatabase)database;
- (BOOL)addItems:(id)a3 toPlist:(id)a4;
- (BOOL)bumpModificationDate:(id)a3;
- (BOOL)commitOutstandingAssets:(id)a3;
- (BOOL)isRestoreSession;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)raiseLockout;
- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (BOOL)reconcileWithError:(id *)a3 progressCallback:(id)a4;
- (BOOL)reconcileWithProgressCallback:(id)a3;
- (BOOL)shouldBackgroundRestoreFile:(id)a3 backupManager:(id)a4;
- (BooksClient)init;
- (NSMutableArray)pathsForDevice2DeviceRestoreLocal;
- (NSMutableArray)pathsForDevice2DeviceRestoreRedownloadable;
- (id)_bookEstimatedDownloadSizeForPlistEntry:(id)a3;
- (id)_bookSizeOnDiskForPlistEntry:(id)a3;
- (id)_stringFromObject:(id)a3;
- (id)accountInfoForAssetAtPath:(id)a3;
- (id)accountsForAssets;
- (id)appleIDsForAssets;
- (id)assetsRequestedByPersistentIDs:(id)a3 fromPlist:(id)a4;
- (id)bookTitleForPlistEntry:(id)a3;
- (id)booksFromPlist:(id)a3;
- (id)booksInPath:(id)a3;
- (id)currentSyncAnchor;
- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4;
- (id)filesInPath:(id)a3;
- (id)filteredDownloads:(id)a3;
- (id)forwardSyncAssets;
- (id)forwardSyncPersistentIDs;
- (id)installedAssetMetrics;
- (id)knownBooksInPlist:(id)a3;
- (id)outstandingAssetTransfers;
- (id)outstandingAssetTransfersWithDownloadManager:(id)a3;
- (id)persistentIDsFromBookRecords:(id)a3;
- (id)persistentIDsMerged:(BOOL)a3;
- (id)plistByPath:(id)a3;
- (id)reverseSyncAssets;
- (id)reverseSyncPersistentIDs;
- (id)sortedBooksFromPlist:(id)a3;
- (id)storeInfoForItem:(id)a3;
- (id)supportedDataclasses;
- (void)_updateATAssetTotalBytes:(id)a3 plistEntry:(id)a4 restoreFlag:(BOOL)a5;
- (void)addKnownAccountInfo:(id)a3;
- (void)appendIconUrlForPersistentID:(id)a3 toAsset:(id)a4;
- (void)appendPlistEntries:(id)a3 toAssetArray:(id)a4 withRestoreFlag:(BOOL)a5;
- (void)assetDownloadCompleted:(id)a3;
- (void)assetInstallFailed:(id)a3 withError:(id)a4;
- (void)assetInstallSucceeded:(id)a3;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)assetUploadCompleted:(id)a3;
- (void)backupEnded;
- (void)clearSyncData;
- (void)dealloc;
- (void)deleteArtworkExcludingFileNames:(id)a3;
- (void)deleteOrphanedFiles;
- (void)deleteOrphanedFilesInPath:(id)a3 knownToPlist:(id)a4;
- (void)generateDirectories;
- (void)handleError:(id)a3 forAsset:(id)a4;
- (void)installedAssetMetrics:(id *)a3 forPlistPath:(id)a4;
- (void)iteratePathsForPlist:(id)a3 processingBlock:(id)a4;
- (void)lowerLockout;
- (void)nonAssetDiskSpaceMetrics:(id *)a3 directory:(id)a4 recursive:(BOOL)a5;
- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4;
- (void)prepareForBackup;
- (void)processDeletesFiles;
- (void)regenerateEstimatedDownloadSizesForPlist:(id)a3;
- (void)regeneratePersistentIDsForPlist:(id)a3;
- (void)removeAssetByPersistentID:(id)a3;
- (void)removeDatabase;
- (void)removeItemAtPath:(id)a3;
- (void)removeItemByPersistentID:(id)a3 fromPlist:(id)a4;
- (void)removeItemsByPersistentID:(id)a3 fromPlist:(id)a4;
- (void)removeKnownItems:(id)a3;
- (void)removePromisedAssets;
- (void)removePromisedAssetsByPath:(id)a3;
- (void)restoreEndedWithError:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setPathsForDevice2DeviceRestoreLocal:(id)a3;
- (void)setPathsForDevice2DeviceRestoreRedownloadable:(id)a3;
- (void)setRestoreSession:(BOOL)a3;
- (void)syncEndedWithSuccess:(BOOL)a3;
- (void)trimOutstandingAssetList;
- (void)updateAssets:(id)a3 withSSDownloads:(id)a4 andDownloadCompletePathMap:(id)a5;
@end

@implementation BooksClient

- (BooksClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)BooksClient;
  v2 = [(BooksClient *)&v7 init];
  if (v2)
  {
    v3 = BCDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v11 = v2;
      __int16 v12 = 2080;
      v13 = "Nov 10 2024";
      __int16 v14 = 2080;
      v15 = "02:42:10";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "initialized %@ -- %s; %s", buf, 0x20u);
    }
    [(BooksClient *)v2 generateDirectories];
    v4 = objc_alloc_init(BCLockout);
    v2->_lockout = v4;
    [(BCLockout *)v4 setPath:@"/var/mobile/Media/Books/Sync/.bookSync.lock"];
    CFStringRef v9 = @"com.apple.sync.books.began";
    [(BCLockout *)v2->_lockout setStartNotifications:+[NSArray arrayWithObjects:&v9 count:1]];
    v8[0] = @"com.apple.sync.books.finished";
    v8[1] = @"com.apple.books.plist.changed";
    [(BCLockout *)v2->_lockout setEndNotifications:+[NSArray arrayWithObjects:v8 count:2]];
    v2->_plistsByPath = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_plist_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.atc.Books.BooksClient.plists", 0);
    v5 = (NSFileCoordinator *)objc_alloc_init((Class)NSFileCoordinator);
    v2->_relativePathsToBackup = 0;
    v2->_fileCoord = v5;
    v2->_appleIDs = 0;
    v2->_accountInfos = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_appleIDs = 0;
  self->_accountInfos = 0;

  self->_relativePathsToBackup = 0;
  self->_pathsForDevice2DeviceRestoreRedownloadable = 0;

  self->_pathsForDevice2DeviceRestoreLocal = 0;
  self->_lockout = 0;
  [(BooksClient *)self setDatabase:0];

  self->_plistsByPath = 0;
  dispatch_release((dispatch_object_t)self->_plist_queue);
  self->_plist_queue = 0;

  self->_fileCoord = 0;
  v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_13C58();
  }
  v4.receiver = self;
  v4.super_class = (Class)BooksClient;
  [(BooksClient *)&v4 dealloc];
}

- (BOOL)raiseLockout
{
  v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "raiseLockout %@", (uint8_t *)&v5, 0xCu);
  }
  return [(BCLockout *)self->_lockout lock:1];
}

- (void)lowerLockout
{
  [(BCLockout *)self->_lockout unlock];
  v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "lowerLockout %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)supportedDataclasses
{
  v2 = BCDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_13CC0();
  }
  return +[NSArray arrayWithObject:@"Book"];
}

- (id)currentSyncAnchor
{
  v2 = BCDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_13D28();
  }
  return @"0";
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  if (a3)
  {
    CFStringRef v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "reconcileSync %@", buf, 0xCu);
    }
    [(BCAssetDatabase *)[(BooksClient *)self database] removeOutstandingAssetsByRestoreFlag:0 keepDownloadedAssetRows:1];
    [(BooksClient *)self processDeletesFiles];
    [(BooksClient *)self regeneratePersistentIDsForPlist:@"/var/mobile/Media/Books/Books.plist"];
    [(BooksClient *)self regeneratePersistentIDsForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
    [(BooksClient *)self setRestoreSession:0];
    return [(BooksClient *)self reconcileWithError:a6 progressCallback:a5];
  }
  else
  {
    v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "reconcileSync ATSyncNoSync", buf, 2u);
    }
    return 1;
  }
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = BCDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "syncEndedWithSuccess: %d", (uint8_t *)v5, 8u);
  }
}

- (BOOL)bumpModificationDate:(id)a3
{
  id v4 = objc_alloc_init((Class)NSDate);
  id v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v4, NSFileModificationDate, 0);

  uint64_t v9 = 0;
  BOOL v6 = [+[NSFileManager defaultManager] setAttributes:v5 ofItemAtPath:a3 error:&v9];
  if (!v6)
  {
    if (v9)
    {
      objc_super v7 = BCDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_13DCC();
      }
    }
  }

  return v6;
}

- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  BOOL v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "#D2D Reconciling restore of type:%u", buf, 8u);
  }
  objc_super v7 = +[NSFileManager defaultManager];
  id v9 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Books.plist" withNamePrefix:@"Backup-"];
  id v10 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist" withNamePrefix:@"Backup-"];
  id v11 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Managed/Managed.plist" withNamePrefix:@"Backup-"];
  if ([(NSFileManager *)v7 fileExistsAtPath:v9])
  {
    __int16 v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Restoring Books.plist from Backup-Books.plist.", buf, 2u);
    }
    [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Books.plist"];
    [(NSFileManager *)v7 copyItemAtPath:v9 toPath:@"/var/mobile/Media/Books/Books.plist" error:0];
  }
  if ([(NSFileManager *)v7 fileExistsAtPath:v10])
  {
    v13 = BCDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Restoring Purchases.plist from Backup-Purchases.plist.", buf, 2u);
    }
    [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
    [(NSFileManager *)v7 copyItemAtPath:v10 toPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist" error:0];
    [(BooksClient *)self bumpModificationDate:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  }
  if ([(NSFileManager *)v7 fileExistsAtPath:v11]
    && objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEnterpriseBookBackupAllowed"))
  {
    __int16 v14 = BCDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Restoring Managed.plist from Backup-Managed.plist.", buf, 2u);
    }
    [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Managed/Managed.plist"];
    [(NSFileManager *)v7 copyItemAtPath:v11 toPath:@"/var/mobile/Media/Books/Managed/Managed.plist" error:0];
    [(BooksClient *)self bumpModificationDate:@"/var/mobile/Media/Books/Managed/Managed.plist"];
  }
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Books.plist"), "resetPaths");
  [(BooksClient *)self bumpModificationDate:@"/var/mobile/Media/Books/Books.plist"];
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Purchases/Purchases.plist"), "resetPaths");
  [(BooksClient *)self bumpModificationDate:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  if ([(NSFileManager *)v7 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Books.plist"])
  {
    v15 = BCDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Removing Sync/Books.plist.", buf, 2u);
    }
    [(NSFileManager *)v7 removeItemAtPath:@"/var/mobile/Media/Books/Sync/Books.plist" error:0];
  }
  v16 = BCDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = (BooksClient *)@"/var/mobile/Media/Books/Sync/Books.plist";
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Creating Sync: %@", buf, 0xCu);
  }
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v18 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Books.plist"), "books");
  v19 = BCDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (BooksClient *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v30 = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Found %lu books in Books.plist.", buf, 0xCu);
  }
  if ([v18 count]) {
    [v17 addObjectsFromArray:v18];
  }
  id v21 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Purchases/Purchases.plist"), "books");
  v22 = BCDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (BooksClient *)[v21 count];
    *(_DWORD *)buf = 134217984;
    v30 = v23;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Found %lu books in Purchases.plist.", buf, 0xCu);
  }
  if ([v21 count]) {
    [v17 addObjectsFromArray:v21];
  }
  v24 = BCDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (BooksClient *)[v17 count];
    *(_DWORD *)buf = 134217984;
    v30 = v25;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Merging two backups: Total entries: %lu", buf, 0xCu);
  }
  if ([v17 count]) {
    objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Sync/Books.plist"), "addItems:", v17);
  }

  v26 = BCDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "reconcileRestoreWithError %@", buf, 0xCu);
  }
  [(BooksClient *)self setRestoreSession:1];
  return [(BooksClient *)self reconcileWithError:a4 progressCallback:0];
}

- (void)restoreEndedWithError:(id)a3
{
  id v4 = BCDefaultLog();
  id v5 = v4;
  if (a3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_13E80();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "restoreEndedWithError: nil", v6, 2u);
  }
}

- (id)outstandingAssetTransfers
{
  [(BooksClient *)self trimOutstandingAssetList];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(BooksClient *)self reverseSyncAssets];
  BOOL v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = [v5 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Reverse Sync %lu items", buf, 0xCu);
  }
  if ([v5 count]) {
    [v4 addObjectsFromArray:v5];
  }
  id v7 = [(BooksClient *)self forwardSyncAssets];
  v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 count];
    *(_DWORD *)buf = 134217984;
    id v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Forward Sync %lu items", buf, 0xCu);
  }
  if ([v7 count]) {
    [v4 addObjectsFromArray:v7];
  }
  id v10 = BCDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "ATAssets: %@", (uint8_t *)&v12, 0xCu);
  }
  return v4;
}

- (id)outstandingAssetTransfersWithDownloadManager:(id)a3
{
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Getting outstanding assets for transfer.", buf, 2u);
  }
  id v6 = [(BooksClient *)self outstandingAssetTransfers];
  if ([v6 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) setVariantOptions:&off_21878];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v7);
    }
    id v10 = [(BooksClient *)self filteredDownloads:a3];
    id v11 = [(BCAssetDatabase *)[(BooksClient *)self database] downloadCompletePathMap];
    int v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "filteredDownloads: %@", buf, 0xCu);
    }
    [(BooksClient *)self updateAssets:v6 withSSDownloads:v10 andDownloadCompletePathMap:v11];
  }
  else
  {
    id v13 = BCDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "No assets, not filtering downloads.", buf, 2u);
    }
  }
  return v6;
}

- (void)clearSyncData
{
  BOOL v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "clearSyncData called", v4, 2u);
  }
  [(BooksClient *)self removeDatabase];
  [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Sync/Upload.plist"];
  [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Sync/Artwork/"];
  if ([(BooksClient *)self raiseLockout])
  {
    [(BooksClient *)self processDeletesFiles];
    [(BooksClient *)self deleteOrphanedFiles];
    [(BooksClient *)self removePromisedAssets];
  }
  [(BooksClient *)self lowerLockout];
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v9 = BCDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = a3;
    __int16 v14 = 1024;
    *(_DWORD *)long long v15 = v6;
    *(_WORD *)&v15[4] = 2112;
    *(void *)&v15[6] = a5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "assetTransfer: %@ success:%d error:%@", (uint8_t *)&v12, 0x1Cu);
  }
  if (v6)
  {
    if ([a3 isDownload]) {
      [(BooksClient *)self assetDownloadCompleted:a3];
    }
    else {
      [(BooksClient *)self assetUploadCompleted:a3];
    }
  }
  else
  {
    id v10 = BCDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v11 = @"Not Recoverable";
      if (a5)
      {
        if (!objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", @"ATError")
          || [a5 code] == (char *)&dword_4 + 3
          || [a5 code] == &dword_8
          || [a5 code] == (char *)&dword_C + 2
          || [a5 code] == &dword_10
          || [a5 code] == (char *)&dword_8 + 1
          || [a5 code] == (char *)&dword_10 + 2
          || [a5 code] == &dword_4
          || [a5 code] == (char *)&dword_10 + 3
          || [a5 code] == &dword_14
          || [a5 code] == (char *)&dword_18 + 1
          || [a5 code] == (char *)&dword_18 + 3
          || [a5 code] == &dword_18
          || [a5 code] == (char *)&dword_1C + 3
          || [a5 code] == &stru_20
          || [a5 code] == (char *)&stru_20.cmd + 1)
        {
          CFStringRef v11 = @"Recoverable";
        }
        else
        {
          CFStringRef v11 = @"Recoverable";
          if ([a5 code] != (char *)&stru_20.cmd + 2
            && [a5 code] != (char *)&stru_20.cmd + 3)
          {
            CFStringRef v11 = @"Not Recoverable";
          }
        }
      }
      int v12 = 138412802;
      id v13 = (id)v11;
      __int16 v14 = 2112;
      *(void *)long long v15 = a3;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = a5;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%@ Error -- Asset: %@; Transfer Error: %@",
        (uint8_t *)&v12,
        0x20u);
    }
    [(BooksClient *)self handleError:a5 forAsset:a3];
  }
}

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "assetTransferEndedWithSuccess: %d", (uint8_t *)v6, 8u);
  }
  if (v3) {
    [(BooksClient *)self removeItemAtPath:@"/var/mobile/Media/Books/Sync/Upload.plist"];
  }
}

- (void)assetInstallSucceeded:(id)a3
{
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    id v9 = [a3 identifier];
    __int16 v10 = 1024;
    unsigned int v11 = [a3 isDownload];
    __int16 v12 = 2112;
    id v13 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "assetInstallSucceeded -- %@ [isDownload: %d] Asset: %@", (uint8_t *)&v8, 0x1Cu);
  }
  if ([a3 isDownload])
  {
    if ([a3 isRestore])
    {
      BOOL v6 = BCDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = a3;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "assetInstallSucceeded -- %@ [isRestore: YES] now installing the asset", (uint8_t *)&v8, 0xCu);
      }
      [(BooksClient *)self assetDownloadCompleted:a3];
    }
    else
    {
      id v7 = BCDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = a3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "assetInstallSucceeded -- %@ [isRestore: NO] just removing this asset from the outstanding database", (uint8_t *)&v8, 0xCu);
      }
      if (objc_msgSend(objc_msgSend(a3, "identifier"), "length")) {
        -[BCAssetDatabase removeOutstandingAssetByPersistentID:](-[BooksClient database](self, "database"), "removeOutstandingAssetByPersistentID:", [a3 identifier]);
      }
    }
  }
}

- (void)assetInstallFailed:(id)a3 withError:(id)a4
{
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (a4)
    {
      if (objc_msgSend(objc_msgSend(a4, "domain"), "isEqualToString:", @"ATError"))
      {
        sub_14088(a4, (const __CFString **)v9);
        CFStringRef v8 = *(const __CFString **)v9;
      }
      else
      {
        CFStringRef v8 = @"Recoverable";
      }
    }
    else
    {
      CFStringRef v8 = @"Not Recoverable";
    }
    *(_DWORD *)id v9 = 138412802;
    *(void *)&v9[4] = v8;
    __int16 v10 = 2112;
    id v11 = a3;
    __int16 v12 = 2112;
    id v13 = a4;
    _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%@ Error -- Asset: %@; Install Error: %@", v9, 0x20u);
  }
  [(BooksClient *)self handleError:a4 forAsset:a3];
}

- (id)installedAssetMetrics
{
  BOOL v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_14450();
  }
  [(BooksClient *)self processDeletesFiles];
  id v4 = +[NSArray arrayWithObjects:@"/var/mobile/Media/Books/Purchases/Purchases.plist", @"/var/mobile/Media/Books/Books.plist", @"/var/mobile/Media/Books/Managed/Managed.plist", 0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        [(BooksClient *)self installedAssetMetrics:&v23 forPlistPath:v11];
        v7 += v23;
        v8 += v24;
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  __int16 v12 = BCDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_143E8();
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(BooksClient *)self nonAssetDiskSpaceMetrics:&v23 directory:@"/var/mobile/Media/Books/" recursive:0];
  id v13 = BCDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_14380();
  }
  uint64_t v14 = v23 + v7;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(BooksClient *)self nonAssetDiskSpaceMetrics:&v23 directory:@"/var/mobile/Media/Books/Purchases/" recursive:0];
  long long v15 = BCDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_14318();
  }
  uint64_t v16 = v14 + v23;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(BooksClient *)self nonAssetDiskSpaceMetrics:&v23 directory:@"/var/mobile/Media/Books/Sync/" recursive:1];
  long long v17 = BCDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_142B0();
  }
  uint64_t v18 = v16 + v23;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(BooksClient *)self nonAssetDiskSpaceMetrics:&v23 directory:@"/var/mobile/Media/Books/Managed/" recursive:1];
  v19 = BCDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_14248();
  }
  uint64_t v20 = v18 + v23;
  id v21 = BCDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_141E0();
  }
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v8), @"_Count", +[NSNumber numberWithLongLong:v20], @"_PhysicalSize", 0);
}

- (BOOL)shouldBackgroundRestoreFile:(id)a3 backupManager:(id)a4
{
  id v4 = [a3 path];
  if (([v4 hasPrefix:@"/var/mobile/Media/Books/Sync"] & 1) == 0
    && ![v4 hasPrefix:@"/var/mobile/Media/Books/Managed"])
  {
    unsigned int v7 = [v4 hasPrefix:@"/var/mobile/Media/Books"];
    if (!v7) {
      return v7;
    }
    if (objc_msgSend(+[BooksClient foregroundRestoreWhitelist](BooksClient, "foregroundRestoreWhitelist"), "containsObject:", v4))
    {
      id v5 = BCDefaultLog();
      BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v7) = 0;
      if (!v9) {
        return v7;
      }
      int v15 = 138412290;
      id v16 = v4;
      uint64_t v8 = "Restoring in foreground: %@";
      goto LABEL_5;
    }
    unsigned int v10 = objc_msgSend(+[BooksClient bookExtensions](BooksClient, "bookExtensions"), "containsObject:", objc_msgSend(objc_msgSend(v4, "pathExtension"), "lowercaseString"));
    uint64_t v11 = BCDefaultLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v15 = 138412290;
        id v16 = v4;
        id v13 = "Found book in backup, restoring in background: %@";
LABEL_15:
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      int v15 = 138412290;
      id v16 = v4;
      id v13 = "Restoring in background: %@";
      goto LABEL_15;
    }
    LOBYTE(v7) = 1;
    return v7;
  }
  id v5 = BCDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v7) = 0;
  if (v6)
  {
    int v15 = 138412290;
    id v16 = v4;
    uint64_t v8 = "Restoring managed or sync file in foreground: %@";
LABEL_5:
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)assetDownloadCompleted:(id)a3
{
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Asset downloaded successfully: %@", buf, 0xCu);
  }
  if ((objc_msgSend(objc_msgSend(a3, "path"), "hasPrefix:", @"/") & 1) == 0
    && objc_msgSend(objc_msgSend(a3, "path"), "length")
    && (objc_msgSend(objc_msgSend(a3, "path"), "hasPrefix:", @"/var/mobile/Media/") & 1) == 0)
  {
    [a3 setPath:objc_msgSend(@"/var/mobile/Media/", "stringByAppendingString:", objc_msgSend(a3, "path"))];
  }
  BOOL v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [a3 isRestore];
    unsigned int v8 = [a3 bypassStore];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "isRestore: %d; BypassStore: %d", buf, 0xEu);
  }
  if (objc_msgSend(objc_msgSend(a3, "path"), "length") && objc_msgSend(objc_msgSend(a3, "identifier"), "length"))
  {
    BOOL v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [a3 path];
      id v11 = [a3 identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "assetDownloadCompleted -- Updating OustandingAsset database %@ -> %@", buf, 0x16u);
    }
    -[BCAssetDatabase setDownloadPath:forOutstandingAssetsByPersistentID:](-[BooksClient database](self, "database"), "setDownloadPath:forOutstandingAssetsByPersistentID:", [a3 path], objc_msgSend(a3, "identifier"));
  }
  else
  {
    BOOL v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_14554();
    }
  }
  id v13 = objc_msgSend(objc_msgSend(a3, "path"), "stringByDeletingLastPathComponent");
  if (([v13 hasSuffix:@"/"] & 1) == 0) {
    id v13 = [v13 stringByAppendingString:@"/"];
  }
  if ([v13 isEqualToString:@"/var/mobile/Media/Books/"])
  {
    uint64_t v14 = BooksPlistPath;
  }
  else
  {
    if (![v13 isEqualToString:@"/var/mobile/Media/Books/Purchases/"]) {
      goto LABEL_25;
    }
    uint64_t v14 = PurchasesPlistPath;
  }
  int v15 = *v14;
  if (*v14)
  {
    id v17 = [(BooksClient *)self plistByPath:v15];
    uint64_t v18 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v17 books]);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v30 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_706C;
    v22[3] = &unk_204D0;
    v22[4] = a3;
    v22[5] = v18;
    v22[6] = buf;
    [(NSMutableArray *)v18 enumerateObjectsUsingBlock:v22];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [v17 replaceItems:v18];
    }
    else
    {
      uint64_t v20 = BCDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v23 = 138412802;
        id v24 = a3;
        __int16 v25 = 2112;
        long long v26 = v15;
        __int16 v27 = 2112;
        long long v28 = v18;
        _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "assetDownloadCompleted -- Couldn't find entry in plist for asset %@.  PlistPath: %@ Entries: %@", v23, 0x20u);
      }
      if (objc_msgSend(objc_msgSend(a3, "identifier"), "length"))
      {
        id v21 = BCDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_144EC();
        }
        -[BCAssetDatabase removeOutstandingAssetByPersistentID:](-[BooksClient database](self, "database"), "removeOutstandingAssetByPersistentID:", [a3 identifier]);
      }
    }
    _Block_object_dispose(buf, 8);
    return;
  }
LABEL_25:
  v19 = BCDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_14484();
  }
}

- (void)assetUploadCompleted:(id)a3
{
  id v4 = BCDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Asset uploaded successfully: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)prepareForBackup
{
  BOOL v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Preparing for backup.", buf, 2u);
  }

  self->_appleIDs = 0;
  self->_accountInfos = 0;

  self->_relativePathsToBackup = 0;
  [(BooksClient *)self setPathsForDevice2DeviceRestoreRedownloadable:+[NSMutableArray array]];
  [(BooksClient *)self setPathsForDevice2DeviceRestoreLocal:+[NSMutableArray array]];
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  id v6 = +[NSFileManager defaultManager];
  [(BooksClient *)self processDeletesFiles];
  [(BooksClient *)self regeneratePersistentIDsForPlist:@"/var/mobile/Media/Books/Books.plist"];
  [(BooksClient *)self regeneratePersistentIDsForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  [(BooksClient *)self regenerateEstimatedDownloadSizesForPlist:@"/var/mobile/Media/Books/Books.plist"];
  [(BooksClient *)self regenerateEstimatedDownloadSizesForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  id v7 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Books.plist" withNamePrefix:@"Backup-"];
  [(BooksClient *)self removeItemAtPath:v7];
  [(NSFileManager *)v6 copyItemAtPath:@"/var/mobile/Media/Books/Books.plist" toPath:v7 error:0];
  id v8 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist" withNamePrefix:@"Backup-"];
  [(BooksClient *)self removeItemAtPath:v8];
  [(NSFileManager *)v6 copyItemAtPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist" toPath:v8 error:0];
  BOOL v9 = +[NSArray arrayWithObjects:@"/var/mobile/Media/Books/iBooksData.plist", @"/var/mobile/Media/Books/iBooksData2.plist", @"/var/mobile/Media/Books/Sync/Artwork/", v7, v8, 0];
  v38 = v5;
  [v5 addObjectsFromArray:v9];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([(NSFileManager *)v6 fileExistsAtPath:v14])
        {
          int v15 = self;
          id v16 = BCDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v14;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "#D2D: Adding potential D2D Local path: %@", buf, 0xCu);
          }
          self = v15;
          [(NSMutableArray *)v15->_pathsForDevice2DeviceRestoreLocal addObject:v14];
        }
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_7958;
  v44[3] = &unk_204F8;
  v44[4] = self;
  v44[5] = v38;
  [(BooksClient *)self iteratePathsForPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist" processingBlock:v44];
  [(BooksClient *)self iteratePathsForPlist:@"/var/mobile/Media/Books/Books.plist" processingBlock:v44];
  unsigned int v17 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEnterpriseBookBackupAllowed");
  uint64_t v18 = BCDefaultLog();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Backing up managed content.", buf, 2u);
    }
    id v20 = +[BooksClient alternatePathForPlist:@"/var/mobile/Media/Books/Managed/Managed.plist" withNamePrefix:@"Backup-"];
    [(BooksClient *)self removeItemAtPath:v20];
    [(NSFileManager *)v6 copyItemAtPath:@"/var/mobile/Media/Books/Managed/Managed.plist" toPath:v20 error:0];
    [v38 addObject:v20];
    if ([(NSFileManager *)v6 fileExistsAtPath:v20])
    {
      id v21 = BCDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v20;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "#D2D: Adding potential D2D Local path: %@", buf, 0xCu);
      }
      [(NSMutableArray *)self->_pathsForDevice2DeviceRestoreLocal addObject:v20];
    }
    [(BooksClient *)self iteratePathsForPlist:@"/var/mobile/Media/Books/Managed/Managed.plist" processingBlock:v44];
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Enterprise backup is not allowed - skipping managed content.", buf, 2u);
  }
  id v22 = [@"/var/mobile/Media/Books/" length];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v23 = [v38 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v38);
        }
        id v27 = *(id *)(*((void *)&v40 + 1) + 8 * (void)j);
        if ([v27 hasPrefix:@"/var/mobile/Media/Books/"])
        {
          id v27 = [v27 substringFromIndex:v22];
          if (![v27 length]) {
            continue;
          }
        }
        [v4 addObject:v27];
      }
      id v24 = [v38 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v24);
  }
  self->_relativePathsToBackup = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v4];
  long long v28 = BCDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    relativePathsToBackup = self->_relativePathsToBackup;
    *(_DWORD *)buf = 138412290;
    id v51 = relativePathsToBackup;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "computed pathsToBackup %@", buf, 0xCu);
  }
  char v30 = BCDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(BooksClient *)self pathsForDevice2DeviceRestoreRedownloadable];
    *(_DWORD *)buf = 138412290;
    id v51 = v31;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "#D2D: computed pathsForDevice2DeviceRestoreRedownloadable %@", buf, 0xCu);
  }
  v32 = BCDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [(BooksClient *)self pathsForDevice2DeviceRestoreLocal];
    *(_DWORD *)buf = 138412290;
    id v51 = v33;
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "#D2D: computed pathsForDevice2DeviceRestoreLocal %@", buf, 0xCu);
  }
  v34 = BCDefaultLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    appleIDs = self->_appleIDs;
    *(_DWORD *)buf = 138412290;
    id v51 = appleIDs;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "computed AppleIDs %@", buf, 0xCu);
  }
  v36 = BCDefaultLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    accountInfos = self->_accountInfos;
    *(_DWORD *)buf = 138412290;
    id v51 = accountInfos;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "computed accountInfos %@", buf, 0xCu);
  }
}

- (void)backupEnded
{
  BOOL v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "backupEnded called", v4, 2u);
  }

  self->_appleIDs = 0;
  self->_accountInfos = 0;

  self->_relativePathsToBackup = 0;
  [(BooksClient *)self setPathsForDevice2DeviceRestoreRedownloadable:0];
  [(BooksClient *)self setPathsForDevice2DeviceRestoreLocal:0];
}

- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4
{
  if (!self->_relativePathsToBackup) {
    [(BooksClient *)self prepareForBackup];
  }
  if (a3)
  {
    id v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      relativePathsToBackup = self->_relativePathsToBackup;
      int v10 = 138412290;
      id v11 = relativePathsToBackup;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "pathsToBackup %@", (uint8_t *)&v10, 0xCu);
    }
    *a3 = self->_relativePathsToBackup;
  }
  if (a4)
  {
    BOOL v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      LODWORD(v11) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "pathsToNotBackup count: %d", (uint8_t *)&v10, 8u);
    }
    *a4 = 0;
  }
}

- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4
{
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "#D2D: enumeratePathsForBackupType:%u", buf, 8u);
  }
  if (!self->_relativePathsToBackup) {
    [(BooksClient *)self prepareForBackup];
  }
  int v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_7EB8;
  id v13 = &unk_20520;
  int v15 = a3;
  id v14 = a4;
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    if ((sub_7EB8((uint64_t)&v10, self->_pathsForDevice2DeviceRestoreLocal, 0) & 1) == 0)
    {
      id v8 = [(BooksClient *)self pathsForDevice2DeviceRestoreRedownloadable];
      v12((uint64_t)&v10, v8, 2);
    }
  }
  else if (a3 == 1)
  {
    v12((uint64_t)&v10, [(BooksClient *)self pathsForDevice2DeviceRestoreLocal], 0);
  }
  return 0;
}

- (id)appleIDsForAssets
{
  appleIDs = self->_appleIDs;
  if (!appleIDs)
  {
    id v4 = BCDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Calling prepareForBackup from appleIDsForAssets", v6, 2u);
    }
    [(BooksClient *)self prepareForBackup];
    appleIDs = self->_appleIDs;
  }
  return appleIDs;
}

- (id)accountsForAssets
{
  accountInfos = self->_accountInfos;
  if (!accountInfos)
  {
    id v4 = BCDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Calling prepareForBackup from accountInfosForAssets", v6, 2u);
    }
    [(BooksClient *)self prepareForBackup];
    accountInfos = self->_accountInfos;
  }
  return accountInfos;
}

- (void)trimOutstandingAssetList
{
  id v3 = [(BooksClient *)self persistentIDsMerged:1];
  id v4 = BCDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = [v3 count];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Trimming Outstanding Asset List: %lu known items", (uint8_t *)&v5, 0xCu);
  }
  [(BCAssetDatabase *)[(BooksClient *)self database] removeOutstandingAssetsByPersistentIDs:v3];
}

- (BOOL)reconcileWithError:(id *)a3 progressCallback:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v8 = [(BooksClient *)self reconcileWithProgressCallback:a4];
  [(BCLockout *)self->_lockout unlock];

  if (a3)
  {
    *a3 = 0;
    id v9 = 0;
    if (*a3)
    {
      int v10 = BCDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_145FC((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
      }
      return v8;
    }
  }
  else
  {
    id v17 = 0;
  }
  if (!v8)
  {
    uint64_t v18 = BCDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_145BC();
    }
  }
  return v8;
}

- (BOOL)reconcileWithProgressCallback:(id)a3
{
  if (a3) {
    id v4 = (Block_layout *)a3;
  }
  else {
    id v4 = &stru_20560;
  }
  v4->invoke(v4, a2, 0.0);
  id v5 = [(BooksClient *)self reverseSyncPersistentIDs];
  id v6 = [(BooksClient *)self sortedBooksFromPlist:@"/var/mobile/Media/Books/Sync/Books.plist"];
  if ([(BooksClient *)self isRestoreSession]) {
    id v6 = objc_msgSend(v6, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"%K != nil || %K != nil", @"Path", @"Backup-Path"));
  }
  id v7 = [(BooksClient *)self persistentIDsFromBookRecords:v6];
  [(BCAssetDatabase *)[(BooksClient *)self database] removeOutstandingAssetMissingFromPersistentIDs:v7];
  BOOL v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_146D4();
  }
  id v9 = BCDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1466C();
  }
  v4->invoke(v4, 0.166666667);
  id v10 = [(BooksClient *)self persistentIDsMerged:1];
  uint64_t v11 = BCDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Assets we have: %@", buf, 0xCu);
  }
  [(BCAssetDatabase *)[(BooksClient *)self database] removeOutstandingAssetsByPersistentIDs:v10];
  id v12 = objc_msgSend(objc_msgSend(v7, "presortedArrayRemovingMatchingPresortedStrings:", v10), "presortedArrayRemovingMatchingPresortedStrings:", v5);
  if (![(BooksClient *)self isRestoreSession])
  {
    id v13 = objc_msgSend(-[BCAssetDatabase outstandingAssetsByRestoreFlag:](-[BooksClient database](self, "database"), "outstandingAssetsByRestoreFlag:", 1), "valueForKey:", @"Persistent ID");
    if ([v13 count]) {
      id v12 = objc_msgSend(v12, "presortedArrayRemovingMatchingPresortedStrings:", objc_msgSend(v13, "sortedArrayUsingSelector:", "compare:"));
    }
  }
  uint64_t v14 = BCDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Assets we need: %@", buf, 0xCu);
  }
  v4->invoke(v4, 0.333333333);
  id v15 = [(BooksClient *)self persistentIDsMerged:0];
  uint64_t v16 = BCDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Assets we've seen: %@", buf, 0xCu);
  }
  id v26 = v5;
  id v17 = objc_msgSend(objc_msgSend(v15, "presortedArrayRemovingMatchingPresortedStrings:", v7), "presortedArrayRemovingMatchingPresortedStrings:", v5);
  uint64_t v18 = BCDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v17;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Assets to exclude: %@", buf, 0xCu);
  }
  if ([v12 count])
  {
    BOOL v19 = -[BooksClient commitOutstandingAssets:](self, "commitOutstandingAssets:", [v6 presortedArrayOfObjectsContainingMatchingKey:@"Persistent ID" matchingPresortedStrings:v12]);
    id v20 = [v12 presortedArrayRemovingMatchingPresortedStrings:v15];
    id v21 = BCDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v20;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Assets To append: %@", buf, 0xCu);
    }
    id v22 = [v6 presortedArrayOfObjectsContainingMatchingKey:@"Persistent ID" matchingPresortedStrings:v20];
  }
  else
  {
    id v22 = 0;
    BOOL v19 = 1;
  }
  id v23 = [v7 arrayByAddingObjectsFromArray:v26];
  v4->invoke(v4, 0.5);
  id v24 = +[BCPlist promisableItemsFromItems:v22];
  if (![v24 count] && !objc_msgSend(v17, "count"))
  {
    BOOL v19 = 1;
    goto LABEL_32;
  }
  if ([(BooksClient *)self raiseLockout])
  {
    [(BooksClient *)self removeKnownItems:v17];
    [(BooksClient *)self addItems:v24 toPlist:@"/var/mobile/Media/Books/Books.plist"];
    [(BooksClient *)self lowerLockout];
LABEL_32:
    v4->invoke(v4, 0.666666667);
    [(BooksClient *)self deleteOrphanedFiles];
    [(BooksClient *)self deleteArtworkExcludingFileNames:v23];
    [(BCAssetDatabase *)[(BooksClient *)self database] removeInstalledAssetsExcluding:v23];
    v4->invoke(v4, 0.833333333);
    goto LABEL_33;
  }
  BOOL v19 = 0;
LABEL_33:
  v4->invoke(v4, 1.0);
  return v19;
}

- (void)regeneratePersistentIDsForPlist:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a3), "regenerateMissingPersistentIDs");
}

- (void)regenerateEstimatedDownloadSizesForPlist:(id)a3
{
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a3), "regenerateMissingEstimatedDownloadSizes");
}

- (void)removePromisedAssetsByPath:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = [(BooksClient *)self plistByPath:a3];
  id v7 = objc_msgSend(objc_msgSend(v6, "unfilteredPersistentIDs"), "arrayRemovingMatchingStrings:", objc_msgSend(v6, "existingPersistentIDs"));
  BOOL v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = [v7 count];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "removePromisedAssetsByPath: %@ -- %d assets", (uint8_t *)&v9, 0x12u);
  }
  if ([v7 count]) {
    [v6 removeItemsByPersistentID:v7];
  }
}

- (void)removePromisedAssets
{
  id v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Removing promised assets by Books.plist.", buf, 2u);
  }
  [(BooksClient *)self removePromisedAssetsByPath:@"/var/mobile/Media/Books/Books.plist"];
  id v4 = BCDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Removing promised assets by Purchases.plist.", v5, 2u);
  }
  [(BooksClient *)self removePromisedAssetsByPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
}

- (void)removeAssetByPersistentID:(id)a3
{
  if ([a3 length])
  {
    [(BCAssetDatabase *)[(BooksClient *)self database] removeOutstandingAssetByPersistentID:a3];
    if ([(BooksClient *)self raiseLockout])
    {
      [(BooksClient *)self removeItemByPersistentID:a3 fromPlist:@"/var/mobile/Media/Books/Books.plist"];
      [(BooksClient *)self removeItemByPersistentID:a3 fromPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
      [(BooksClient *)self lowerLockout];
    }
    [(BooksClient *)self lowerLockout];
  }
}

- (void)handleError:(id)a3 forAsset:(id)a4
{
  if (a3
    && (!objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"ATError")
     || [a3 code] == (char *)&dword_4 + 3
     || [a3 code] == &dword_8
     || [a3 code] == (char *)&dword_C + 2
     || [a3 code] == &dword_10
     || [a3 code] == (char *)&dword_8 + 1
     || [a3 code] == (char *)&dword_10 + 2
     || [a3 code] == &dword_4
     || [a3 code] == (char *)&dword_10 + 3
     || [a3 code] == &dword_14
     || [a3 code] == (char *)&dword_18 + 1
     || [a3 code] == (char *)&dword_18 + 3
     || [a3 code] == &dword_18
     || [a3 code] == (char *)&dword_1C + 3
     || [a3 code] == &stru_20
     || [a3 code] == (char *)&stru_20.cmd + 1
     || [a3 code] == (char *)&stru_20.cmd + 2
     || [a3 code] == (char *)&stru_20.cmd + 3))
  {
    id v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_14894(a4, v7);
    }
  }
  else
  {
    id v8 = [a4 identifier];
    if ([v8 length])
    {
      unsigned int v9 = [a4 isDownload];
      id v10 = BCDefaultLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11) {
          sub_147A4((uint64_t)v8, self, v10);
        }
        [(BooksClient *)self removeAssetByPersistentID:v8];
      }
      else if (v11)
      {
        sub_1482C();
      }
    }
    else
    {
      unsigned int v12 = BCDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1473C();
      }
    }
  }
}

- (void)processDeletesFiles
{
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Books.plist"), "processDeletesFile");
  id v3 = [(BooksClient *)self plistByPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];

  [v3 processDeletesFile];
}

- (void)iteratePathsForPlist:(id)a3 processingBlock:(id)a4
{
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_14914();
    if (!a4) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  id v8 = [(BooksClient *)self booksFromPlist:a3];
  id v9 = [a3 stringByDeletingLastPathComponent];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = (void *)BCDynamicCast(v15, v14);
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = (void *)BCDynamicCast(v17, (uint64_t)[v16 objectForKey:@"Path"]);
        if ([v18 length]) {
          (*((void (**)(id, id, void *))a4 + 2))(a4, [v9 stringByAppendingPathComponent:v18], v16);
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (id)_stringFromObject:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = BCDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1497C((uint64_t)v3, v5);
    }
    return 0;
  }

  return [v3 stringValue];
}

- (id)storeInfoForItem:(id)a3
{
  id v5 = [a3 objectForKey:@"Item ID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
  {
    id v6 = objc_alloc_init((Class)ATStoreInfo);
    objc_msgSend(v6, "setAdamID:", objc_msgSend(v5, "numberFromHexDigits"));
    objc_msgSend(v6, "setDSID:", objc_msgSend(-[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"DSID")), "numberFromHexDigits"));
    objc_msgSend(v6, "setCollectionID:", objc_msgSend(-[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Collection ID")), "numberFromHexDigits"));
    if ([a3 objectForKey:@"Is Protected"]) {
      objc_msgSend(v6, "setDrmFree:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(-[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Is Protected")), "BOOLValue") ^ 1));
    }
    objc_msgSend(v6, "setStorefrontID:", objc_msgSend(objc_msgSend(-[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Storefront ID")), "numberFromHexDigits"), "stringValue"));
    objc_msgSend(v6, "setXID:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"XID")));
    objc_msgSend(v6, "setFlavor:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Flavor")));
    CFStringRef v7 = @"Apple ID";
  }
  else
  {
    id v8 = [a3 objectForKey:@"s"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 unsignedLongLongValue]) {
      goto LABEL_25;
    }
    id v6 = objc_alloc_init((Class)ATStoreInfo);
    [v6 setAdamID:v8];
    objc_msgSend(v6, "setDSID:", objc_msgSend(a3, "objectForKey:", @"DSID"));
    objc_msgSend(v6, "setCollectionID:", objc_msgSend(a3, "objectForKey:", @"Collection ID"));
    objc_msgSend(v6, "setVersionID:", objc_msgSend(a3, "objectForKey:", @"Version ID"));
    objc_msgSend(v6, "setStorefrontID:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Storefront ID")));
    objc_msgSend(v6, "setXID:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"XID")));
    objc_msgSend(v6, "setFlavor:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Flavor")));
    objc_msgSend(v6, "setDimensions:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"Dimensions")));
    CFStringRef v7 = @"AppleID";
  }
  objc_msgSend(v6, "setAppleID:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(a3, "objectForKey:", v7)));
  if (!v6) {
    return v6;
  }
  if (!objc_msgSend(objc_msgSend(v6, "DSID"), "unsignedLongLongValue"))
  {

LABEL_25:
    id v6 = 0;
    return v6;
  }
  if (!objc_msgSend(objc_msgSend(v6, "adamID"), "unsignedLongLongValue"))
  {
    id v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_14B38();
    }
  }
  if (!objc_msgSend(objc_msgSend(v6, "storefrontID"), "length"))
  {
    id v10 = BCDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_14AD0();
    }
  }
  if (!objc_msgSend(objc_msgSend(v6, "appleID"), "length"))
  {
    id v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_14A68();
    }
  }
  if (!objc_msgSend(objc_msgSend(v6, "flavor"), "length") && !objc_msgSend(v6, "drmFree"))
  {
    uint64_t v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_14A00();
    }
  }
  return v6;
}

- (void)appendIconUrlForPersistentID:(id)a3 toAsset:(id)a4
{
  id v5 = [@"/var/mobile/Media/Books/Sync/Artwork/" stringByAppendingPathComponent:a3];
  if ([+[NSFileManager defaultManager] fileExistsAtPath:v5])
  {
    id v6 = +[NSURL fileURLWithPath:v5 isDirectory:0];
    CFStringRef v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_14BA0();
    }
    [a4 setIcon:v6];
  }
  else
  {
    id v8 = BCDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_14C08();
    }
  }
}

- (id)bookTitleForPlistEntry:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)BCDynamicCast(v4, (uint64_t)[a3 objectForKey:@"Name"]);
  if ([v5 length]) {
    return v5;
  }
  uint64_t v7 = objc_opt_class();
  id v8 = [a3 objectForKey:@"Artist"];

  return (id)BCDynamicCast(v7, (uint64_t)v8);
}

- (id)_bookEstimatedDownloadSizeForPlistEntry:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [a3 objectForKeyedSubscript:@"Estimated Download Size"];

  return (id)BCDynamicCast(v4, (uint64_t)v5);
}

- (id)_bookSizeOnDiskForPlistEntry:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [a3 objectForKeyedSubscript:@"Size On Disk"];

  return (id)BCDynamicCast(v4, (uint64_t)v5);
}

- (void)_updateATAssetTotalBytes:(id)a3 plistEntry:(id)a4 restoreFlag:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(BooksClient *)self bookTitleForPlistEntry:a4];
  id v10 = [(BooksClient *)self _bookEstimatedDownloadSizeForPlistEntry:a4];
  if (v10 || (id v10 = [(BooksClient *)self _bookSizeOnDiskForPlistEntry:a4]) != 0)
  {
    id v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v9;
      __int16 v25 = 2112;
      CFStringRef v26 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Set totalBytes for asset '%@' to %@", (uint8_t *)&v23, 0x16u);
    }
    id v12 = [(__CFString *)v10 unsignedLongLongValue];
LABEL_6:
    [a3 setTotalBytes:v12];
    return;
  }
  if (v5)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = (void *)BCDynamicCast(v13, (uint64_t)[a4 objectForKeyedSubscript:@"Backup-Path"]);
    if (!v14)
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v14 = (void *)BCDynamicCast(v15, (uint64_t)[a4 objectForKeyedSubscript:@"Path"]);
    }
    uint64_t v16 = (__CFString *)[v14 pathExtension];
    if (!v16)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v16 = (__CFString *)BCDynamicCast(v17, (uint64_t)[a4 objectForKeyedSubscript:@"Extension"]);
    }
    uint64_t v18 = objc_opt_class();
    if (objc_msgSend((id)BCDynamicCast(v18, (uint64_t)objc_msgSend(a4, "objectForKeyedSubscript:", @"Storefront ID")), "isEqual:", &off_218A0))uint64_t v19 = 25; {
    else
    }
      uint64_t v19 = 5;
    if ([(__CFString *)v16 caseInsensitiveCompare:@"ibooks"]) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 100;
    }
    long long v21 = BCDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138413314;
      id v24 = v9;
      __int16 v25 = 2114;
      CFStringRef v26 = v16;
      __int16 v27 = 2114;
      CFStringRef v28 = @"Estimated Download Size";
      __int16 v29 = 2114;
      CFStringRef v30 = @"Size On Disk";
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Asset '%@' (%{public}@) is missing both '%{public}@' and '%{public}@', use guesstimate of %lluMB", (uint8_t *)&v23, 0x34u);
    }
    id v12 = (id)(v20 << 20);
    goto LABEL_6;
  }
  long long v22 = BCDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    id v24 = v9;
    __int16 v25 = 2114;
    CFStringRef v26 = @"Estimated Download Size";
    __int16 v27 = 2114;
    CFStringRef v28 = @"Size On Disk";
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Asset '%@' is missing both '%{public}@' and '%{public}@' and not restore, skip guesstimate", (uint8_t *)&v23, 0x20u);
  }
}

- (id)assetsRequestedByPersistentIDs:(id)a3 fromPlist:(id)a4
{
  id v22 = objc_alloc_init((Class)NSAutoreleasePool);
  __int16 v25 = self;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(BooksClient *)self plistByPath:a4];
  if ([a3 count]) {
    id v8 = objc_msgSend(objc_msgSend(v7, "books", v22), "arrayOfObjectsContainingMatchingKey:matchingStrings:", @"Persistent ID", a3);
  }
  else {
    id v8 = 0;
  }
  if (objc_msgSend(v8, "count", v22))
  {
    id v24 = objc_msgSend(objc_msgSend(a4, "stringByDeletingLastPathComponent"), "substringFromIndex:", objc_msgSend(@"/var/mobile/Media/", "length"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v28 = *(void *)v30;
      id obj = v8;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = (void *)BCDynamicCast(v13, v12);
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = (void *)BCDynamicCast(v15, (uint64_t)[v14 objectForKey:@"Path"]);
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = (void *)BCDynamicCast(v17, (uint64_t)[v14 objectForKey:@"Persistent ID"]);
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = (void *)BCDynamicCast(v19, (uint64_t)[v14 objectForKey:@"iTunesU Permlink"]);
          if ([v16 length] && objc_msgSend(v18, "length") && !objc_msgSend(v20, "length")) {
            objc_msgSend(v26, "addObject:", +[ATAsset uploadAssetWithIdentifier:dataclass:sourcePath:prettyName:](ATAsset, "uploadAssetWithIdentifier:dataclass:sourcePath:prettyName:", v18, @"Book", objc_msgSend(v24, "stringByAppendingPathComponent:", v16), -[BooksClient bookTitleForPlistEntry:](v25, "bookTitleForPlistEntry:", v14)));
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }
  }

  return v26;
}

- (id)reverseSyncAssets
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(BooksClient *)self reverseSyncPersistentIDs];
  if ([v5 count])
  {
    id v6 = [(BooksClient *)self assetsRequestedByPersistentIDs:v5 fromPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
    id v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      CFStringRef v14 = @"/var/mobile/Media/Books/Purchases/Purchases.plist";
      __int16 v15 = 2048;
      id v16 = [v6 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Reverse Sync from: %@ -- %lu items", (uint8_t *)&v13, 0x16u);
    }
    if ([v6 count]) {
      [v4 addObjectsFromArray:v6];
    }
    id v8 = [(BooksClient *)self assetsRequestedByPersistentIDs:v5 fromPlist:@"/var/mobile/Media/Books/Books.plist"];
    id v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 count];
      int v13 = 138412546;
      CFStringRef v14 = @"/var/mobile/Media/Books/Books.plist";
      __int16 v15 = 2048;
      id v16 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Reverse Sync from: %@ -- %lu items", (uint8_t *)&v13, 0x16u);
    }
    if ([v8 count]) {
      [v4 addObjectsFromArray:v8];
    }
  }
  else
  {
    id v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "No Reverse Sync items requested.", (uint8_t *)&v13, 2u);
    }
  }

  return v4;
}

- (void)appendPlistEntries:(id)a3 toAssetArray:(id)a4 withRestoreFlag:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = +[NSDate date];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a3;
  id v8 = [a3 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v8) {
    goto LABEL_19;
  }
  id v9 = v8;
  uint64_t v31 = *(void *)v33;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v33 != v31) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v12 = objc_opt_class();
      int v13 = (void *)BCDynamicCast(v12, v11);
      id v14 = -[BooksClient _stringFromObject:](self, "_stringFromObject:", [v13 objectForKey:@"Persistent ID"]);
      if ([v14 length])
      {
        id v15 = [(BooksClient *)self bookTitleForPlistEntry:v13];
        id v16 = [(BooksClient *)self storeInfoForItem:v13];
        id v17 = v16;
        if (!v5 || v16)
        {
          id v19 = +[ATAsset downloadAssetWithIdentifier:v14 dataclass:@"Book" prettyName:v15];
          [v19 setIsRestore:v5];
          [v19 setStoreInfo:v17];
          if (v5) {
            objc_msgSend(v19, "setPath:", -[BooksClient _stringFromObject:](self, "_stringFromObject:", objc_msgSend(v13, "objectForKey:", @"Backup-Path")));
          }
          __int16 v25 = BCDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v19;
            __int16 v38 = 1024;
            LODWORD(v39) = v5;
            id v22 = v25;
            int v23 = "Constructing download asset: %@, isRestore: %d";
            uint32_t v24 = 18;
LABEL_15:
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
          }
        }
        else
        {
          uint64_t v18 = objc_opt_class();
          id v19 = +[ATAsset iCloudRestoreAssetWithIdentifier:dataclass:assetType:restorePath:displayName:](ATAsset, "iCloudRestoreAssetWithIdentifier:dataclass:assetType:restorePath:displayName:", v14, @"Book", 0, BCDynamicCast(v18, (uint64_t)[v13 objectForKey:@"Backup-Path"]), v15);
          uint64_t v20 = BCDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v13 objectForKey:@"Backup-Path"];
            *(_DWORD *)buf = 138412546;
            id v37 = v19;
            __int16 v38 = 2112;
            id v39 = v21;
            id v22 = v20;
            int v23 = "Constructing iCloud Restore Asset: %@, from path %@";
            uint32_t v24 = 22;
            goto LABEL_15;
          }
        }
        [(BooksClient *)self _updateATAssetTotalBytes:v19 plistEntry:v13 restoreFlag:v5];
        [(BooksClient *)self appendIconUrlForPersistentID:v14 toAsset:v19];
        [a4 addObject:v19];
        continue;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  }
  while (v9);
LABEL_19:
  id v26 = BCDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    [+[NSDate date] timeIntervalSinceDate:v28];
    *(_DWORD *)buf = 134217984;
    id v37 = v27;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "BOOKSCLIENT: Finished to build up the ATAssets to be restored in %.4f ms", buf, 0xCu);
  }
}

- (id)forwardSyncAssets
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = [(BCAssetDatabase *)[(BooksClient *)self database] outstandingAssetsByRestoreFlag:1];
  id v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = [v5 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Forward Sync as Restore %lu items", (uint8_t *)&v11, 0xCu);
  }
  [(BooksClient *)self appendPlistEntries:v5 toAssetArray:v3 withRestoreFlag:1];
  id v7 = [(BCAssetDatabase *)[(BooksClient *)self database] outstandingAssetsByRestoreFlag:0];
  id v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Forward Sync as Sync %lu items", (uint8_t *)&v11, 0xCu);
  }
  [(BooksClient *)self appendPlistEntries:v7 toAssetArray:v3 withRestoreFlag:0];

  return v3;
}

- (id)plistByPath:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_A5DC;
  int v11 = sub_A5EC;
  uint64_t v12 = 0;
  plist_queue = self->_plist_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A5F8;
  block[3] = &unk_20588;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(plist_queue, block);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)booksFromPlist:(id)a3
{
  id v3 = [(BooksClient *)self plistByPath:a3];

  return [v3 books];
}

- (id)sortedBooksFromPlist:(id)a3
{
  id v3 = [(BooksClient *)self plistByPath:a3];

  return [v3 booksSortedByKey:@"Persistent ID"];
}

- (BOOL)addItems:(id)a3 toPlist:(id)a4
{
  if ([a3 count]
    && (objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a4), "addItems:", a3) & 1) == 0)
  {
    id v8 = BCDefaultLog();
    BOOL v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      sub_14C70();
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)persistentIDsMerged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = [(BooksClient *)self plistByPath:@"/var/mobile/Media/Books/Books.plist"];
  id v7 = [(BooksClient *)self plistByPath:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  if (v3)
  {
    id v8 = [v6 existingPersistentIDs];
    id v9 = [v7 existingPersistentIDs];
  }
  else
  {
    id v8 = [v6 unfilteredPersistentIDs];
    id v9 = [v7 unfilteredPersistentIDs];
  }
  id v10 = v9;
  int v11 = +[NSMutableArray arrayWithArray:v8];
  [(NSMutableArray *)v11 addObjectsFromArray:v10];
  [(NSMutableArray *)v11 sortUsingSelector:"compare:"];
  uint64_t v12 = v11;

  return v11;
}

+ (id)alternatePathForPlist:(id)a3 withNamePrefix:(id)a4
{
  if (![a4 length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"BooksClient.m" lineNumber:1695 description:@"empty prefix is not allowed"];
  }
  if (![a3 length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"BooksClient.m" lineNumber:1696 description:@"empty input path is not allowed"];
  }
  id v8 = [a3 lastPathComponent];
  id v9 = objc_msgSend(objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", a4);

  return [v9 stringByAppendingString:v8];
}

- (id)reverseSyncPersistentIDs
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Sync/Upload.plist"), "uploadsByPersistentID");
  id v5 = v4;

  return v4;
}

- (id)forwardSyncPersistentIDs
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", @"/var/mobile/Media/Books/Sync/Books.plist"), "sortedPersistentIDs:", 0);
  id v5 = v4;

  return v4;
}

- (id)persistentIDsFromBookRecords:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        int v11 = (void *)BCDynamicCast(v10, v9);
        uint64_t v12 = objc_opt_class();
        int v13 = (void *)BCDynamicCast(v12, (uint64_t)[v11 objectForKey:@"Persistent ID"]);
        if ([v13 length]) {
          [v4 addObject:v13];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return [v4 sortedArrayUsingSelector:"compare:"];
}

- (id)filesInPath:(id)a3
{
  id v8 = 0;
  id v4 = BCDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "filesInPath: %@", buf, 0xCu);
  }
  id v5 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:&v8];
  if (v8)
  {
    id v6 = BCDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "error: %@", buf, 0xCu);
    }
  }
  return v5;
}

+ (id)bookExtensions
{
  if (qword_26DD8 != -1) {
    dispatch_once(&qword_26DD8, &stru_205C8);
  }
  return (id)qword_26DD0;
}

+ (id)foregroundRestoreWhitelist
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ADFC;
  block[3] = &unk_205F0;
  block[4] = a1;
  if (qword_26DE8 != -1) {
    dispatch_once(&qword_26DE8, block);
  }
  return (id)qword_26DE0;
}

- (id)booksInPath:(id)a3
{
  id v4 = +[NSMutableArray array];
  uint64_t v20 = 0;
  id v5 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:&v20];
  id v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "In Path: %@", buf, 0xCu);
  }
  if (v20)
  {
    uint64_t v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v20;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "error: %@", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        int v13 = BCDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v12;
          _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "booksInPath Iterating: %@", buf, 0xCu);
        }
        if (objc_msgSend(+[BooksClient bookExtensions](BooksClient, "bookExtensions"), "containsObject:", objc_msgSend(objc_msgSend(v12, "pathExtension"), "lowercaseString")))objc_msgSend(v4, "addObject:", v12); {
        int v11 = (char *)v11 + 1;
        }
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v9);
  }
  id v14 = BCDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = a3;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "booksInPath %@ - %@", buf, 0x16u);
  }
  return v4;
}

- (id)knownBooksInPlist:(id)a3
{
  id v3 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a3), "sortedPaths");
  if ([v3 count]) {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];
  }
  else {
    id v4 = 0;
  }
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "knownBooksInPlist %@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (void)deleteArtworkExcludingFileNames:(id)a3
{
  id v12 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = objc_msgSend(-[BooksClient filesInPath:](self, "filesInPath:", @"/var/mobile/Media/Books/Sync/Artwork/"), "arrayRemovingMatchingStrings:", a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [@"/var/mobile/Media/Books/Sync/Artwork/" stringByAppendingPathComponent:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        int v11 = BCDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v10;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "deleting [%@]", buf, 0xCu);
        }
        [(BooksClient *)self removeItemAtPath:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)deleteOrphanedFilesInPath:(id)a3 knownToPlist:(id)a4
{
  id v23 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = objc_msgSend(-[BooksClient booksInPath:](self, "booksInPath:", a3), "arrayRemovingMatchingStrings:", -[BooksClient knownBooksInPlist:](self, "knownBooksInPlist:", a4));
  id v8 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(a3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v28 + 1) + 8 * i)));
      }
      id v10 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }
  id v13 = [(BCAssetDatabase *)[(BooksClient *)self database] outstandingAssetDownloadCompletePathsMatchingArray:v8];
  id v14 = [v8 arrayRemovingMatchingStrings:v13];
  long long v15 = BCDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v13;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "pendingInstall %@", buf, 0xCu);
  }
  long long v16 = BCDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v14;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "orphanedPaths %@", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        id v21 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        id v22 = BCDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v21;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "deleting [%@]", buf, 0xCu);
        }
        [(BooksClient *)self removeItemAtPath:v21];
      }
      id v18 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }
}

- (void)deleteOrphanedFiles
{
  [(BooksClient *)self deleteOrphanedFilesInPath:@"/var/mobile/Media/Books/" knownToPlist:@"/var/mobile/Media/Books/Books.plist"];

  [(BooksClient *)self deleteOrphanedFilesInPath:@"/var/mobile/Media/Books/Purchases/" knownToPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
}

- (void)removeItemAtPath:(id)a3
{
  uint64_t v10 = 0;
  id v5 = +[NSFileManager defaultManager];
  if ([(NSFileManager *)v5 fileExistsAtPath:a3])
  {
    id v6 = +[NSURL fileURLWithPath:a3];
    fileCoord = self->_fileCoord;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B858;
    v9[3] = &unk_20618;
    v9[4] = 0;
    v9[5] = v5;
    v9[6] = a3;
    [(NSFileCoordinator *)fileCoord coordinateWritingItemAtURL:v6 options:1 error:&v10 byAccessor:v9];
  }
  else
  {
    id v8 = BCDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_14CE4();
    }
  }
}

- (void)installedAssetMetrics:(id *)a3 forPlistPath:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  [(BooksClient *)self regeneratePersistentIDsForPlist:a4];
  v36 = self;
  id v8 = objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a4), "entriesWithPath");
  if ([v8 count])
  {
    id v34 = v7;
    long long v35 = a3;
    id v9 = BCDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_14DBC();
    }
    v43[0] = 0;
    v43[1] = 0;
    id v10 = -[BCAssetDatabase cachedInstalledAssetsByPersistentIDs:metrics:](-[BooksClient database](self, "database"), "cachedInstalledAssetsByPersistentIDs:metrics:", +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(objc_msgSend(v8, "valueForKeyPath:", @"Persistent ID"), "arrayRemovingNonStrings")), v43);
    unint64_t v11 = v43[0];
    id v12 = [v8 arrayRemovingObjectsByKey:@"Persistent ID" matchingStrings:v10];
    id v13 = (char *)[v12 count];
    id v14 = &v13[(void)[v10 count]];
    id v38 = v12;
    if (v14 != [v8 count])
    {
      long long v15 = BCDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v30 = [v10 count];
        id v31 = [v12 count];
        id v32 = [v8 count];
        *(_DWORD *)buf = 138413058;
        id v46 = a4;
        __int16 v47 = 2048;
        id v48 = v30;
        __int16 v49 = 2048;
        id v50 = v31;
        id v12 = v38;
        __int16 v51 = 2048;
        id v52 = v32;
        _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Unexpected count mismatch: %@ -- Cached: %lu; Uncached: %lu; Total: %lu",
          buf,
          0x2Au);
      }
    }
    id v33 = v8;
    if ([v12 count])
    {
      id v37 = [a4 stringByDeletingLastPathComponent];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v16 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v16)
      {
        id v17 = v16;
        id v18 = 0;
        uint64_t v19 = *(void *)v40;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v12);
            }
            uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v20);
            uint64_t v22 = objc_opt_class();
            id v23 = (void *)BCDynamicCast(v22, v21);
            uint64_t v24 = objc_opt_class();
            long long v25 = (void *)BCDynamicCast(v24, (uint64_t)[v23 objectForKey:@"Persistent ID"]);
            if (([v25 isEqualToString:v18] & 1) == 0)
            {
              id v18 = v25;
              uint64_t v26 = objc_opt_class();
              id v27 = objc_msgSend(v37, "stringByAppendingPathComponent:", BCDynamicCast(v26, (uint64_t)objc_msgSend(v23, "objectForKey:", @"Path")));
              uint64_t v28 = ATGetDiskUsageForPath();
              if (v28)
              {
                if ([v18 length]) {
                  [(BCAssetDatabase *)[(BooksClient *)v36 database] insertInstalledAssetByPersistentID:v18 withSize:v28];
                }
              }
              else
              {
                long long v29 = BCDefaultLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v46 = v27;
                  _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "expected non-zero from ATGetDiskUsageForPath: %@", buf, 0xCu);
                }
              }
              v11 += v28;
              id v12 = v38;
            }
            uint64_t v20 = (char *)v20 + 1;
          }
          while (v17 != v20);
          id v17 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v17);
      }
    }
    id v7 = v34;
    a3 = v35;
    id v8 = v33;
  }
  else
  {
    unint64_t v11 = 0;
  }
  a3->var0 = v11;
  a3->var1 = (unint64_t)[v8 count];
}

- (void)nonAssetDiskSpaceMetrics:(id *)a3 directory:(id)a4 recursive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = +[NSFileManager defaultManager];
  id v9 = +[NSURL fileURLWithPath:a4 isDirectory:1];
  v23[0] = NSURLTotalFileAllocatedSizeKey;
  v23[1] = NSURLIsDirectoryKey;
  id v10 = +[NSArray arrayWithObjects:v23 count:2];
  id v11 = +[BooksClient bookExtensions];
  id v12 = [(NSFileManager *)v8 enumeratorAtURL:v9 includingPropertiesForKeys:v10 options:1 errorHandler:0];
  id v13 = [(NSDirectoryEnumerator *)v12 nextObject];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      if ((objc_msgSend(v11, "containsObject:", objc_msgSend(objc_msgSend(v14, "pathExtension"), "lowercaseString")) & 1) == 0)
      {
        id v22 = 0;
        [v14 getResourceValue:&v22 forKey:NSURLIsDirectoryKey error:0];
        if ([v22 BOOLValue])
        {
          if (v5) {
            -[BooksClient nonAssetDiskSpaceMetrics:directory:recursive:](self, "nonAssetDiskSpaceMetrics:directory:recursive:", a3, [v14 path], 1);
          }
        }
        else
        {
          id v21 = 0;
          [v14 getResourceValue:&v21 forKey:NSURLTotalFileAllocatedSizeKey error:0];
          if ([v21 longLongValue])
          {
            [v21 longLongValue];
            v16 += ATGetPhysicalSizeForLogicalSize();
            ++v15;
          }
        }
      }
      id v14 = [(NSDirectoryEnumerator *)v12 nextObject];
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v15 = 0;
  }
  unint64_t v18 = a3->var1 + v15;
  a3->var0 += v16;
  a3->var1 = v18;
}

- (void)addKnownAccountInfo:(id)a3
{
  if (a3 && !self->_accountInfos)
  {
    self->_accountInfos = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_appleIDs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  id v5 = [a3 appleID];
  if (v5 && ([(NSMutableSet *)self->_appleIDs containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)self->_accountInfos addObject:a3];
    appleIDs = self->_appleIDs;
    id v7 = [a3 appleID];
    [(NSMutableSet *)appleIDs addObject:v7];
  }
}

- (BOOL)commitOutstandingAssets:(id)a3
{
  id v3 = a3;
  if ([a3 count])
  {
    id v5 = -[BCAssetDatabase cachedOutstandingAssetsByPersistentIDs:](-[BooksClient database](self, "database"), "cachedOutstandingAssetsByPersistentIDs:", objc_msgSend(objc_msgSend(v3, "valueForKeyPath:", @"Persistent ID"), "arrayRemovingNonStrings"));
    if ([v5 count])
    {
      id v6 = [v3 arrayRemovingObjectsByKey:@"Persistent ID" matchingStrings:v5];
      id v7 = [v3 arrayOfObjectsContainingMatchingKey:@"Persistent ID" matchingStrings:v5];
      id v8 = (char *)[v6 count];
      id v9 = &v8[(void)[v5 count]];
      if (v9 != [v3 count])
      {
        id v10 = BCDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v13 = 134218496;
          id v14 = [v5 count];
          __int16 v15 = 2048;
          id v16 = [v6 count];
          __int16 v17 = 2048;
          id v18 = [v3 count];
          _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Unexpected count mismatch: Cached: %lu; Uncached: %lu; Total: %lu",
            (uint8_t *)&v13,
            0x20u);
        }
      }
      id v3 = v6;
    }
    else
    {
      id v7 = 0;
    }
    if ([v3 count]) {
      [(BCAssetDatabase *)[(BooksClient *)self database] insertOutstandingAssetDictionaries:v3 isRestore:[(BooksClient *)self isRestoreSession]];
    }
    if ([v7 count]) {
      [(BCAssetDatabase *)[(BooksClient *)self database] updateOutstandingAssetDictionaries:v7 isRestore:[(BooksClient *)self isRestoreSession]];
    }
  }
  id v11 = BCDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "commit Assets To Request Succeeded", (uint8_t *)&v13, 2u);
  }
  return 1;
}

- (void)removeItemByPersistentID:(id)a3 fromPlist:(id)a4
{
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removing %@ from %{public}@.", (uint8_t *)&v8, 0x16u);
  }
  [(BooksClient *)self removeItemsByPersistentID:+[NSArray arrayWithObject:a3] fromPlist:a4];
}

- (void)removeItemsByPersistentID:(id)a3 fromPlist:(id)a4
{
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removing %@ from %{public}@.", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(-[BooksClient plistByPath:](self, "plistByPath:", a4), "removeItemsByPersistentID:", a3);
}

- (void)removeKnownItems:(id)a3
{
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Remove known items.", v6, 2u);
  }
  if ([a3 count])
  {
    [(BooksClient *)self removeItemsByPersistentID:a3 fromPlist:@"/var/mobile/Media/Books/Books.plist"];
    [(BooksClient *)self removeItemsByPersistentID:a3 fromPlist:@"/var/mobile/Media/Books/Purchases/Purchases.plist"];
  }
}

- (void)generateDirectories
{
  v2 = +[NSFileManager defaultManager];
  v4[0] = NSFileOwnerAccountName;
  v4[1] = NSFileGroupOwnerAccountName;
  v5[0] = @"mobile";
  v5[1] = @"mobile";
  id v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  if (![(NSFileManager *)v2 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/"]) {
    [(NSFileManager *)v2 createDirectoryAtPath:@"/var/mobile/Media/Books/Sync/" withIntermediateDirectories:1 attributes:v3 error:0];
  }
  if (![(NSFileManager *)v2 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Database/"]) {
    [(NSFileManager *)v2 createDirectoryAtPath:@"/var/mobile/Media/Books/Sync/Database/" withIntermediateDirectories:1 attributes:v3 error:0];
  }
  if (![(NSFileManager *)v2 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Artwork/"]) {
    [(NSFileManager *)v2 createDirectoryAtPath:@"/var/mobile/Media/Books/Sync/Artwork/" withIntermediateDirectories:1 attributes:v3 error:0];
  }
  if (![(NSFileManager *)v2 fileExistsAtPath:@"/var/mobile/Media/Books/Purchases/"]) {
    [(NSFileManager *)v2 createDirectoryAtPath:@"/var/mobile/Media/Books/Purchases/" withIntermediateDirectories:1 attributes:v3 error:0];
  }
}

- (id)accountInfoForAssetAtPath:(id)a3
{
  if ([+[NSFileManager defaultManager] isDirectoryPath:a3])
  {
    id v4 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [a3 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);
    id v5 = v4;
    if (!v4) {
      goto LABEL_12;
    }
    if ([(NSDictionary *)v4 objectForKey:@"itemId"])
    {
      id v6 = [(NSDictionary *)v5 objectForKey:@"isSample"];
      if (!v6
        || (id v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([v7 BOOLValue] & 1) == 0)
      {
        uint64_t v8 = objc_opt_class();
        id v9 = (void *)BCDynamicCast(v8, (uint64_t)[(NSDictionary *)v5 objectForKey:@"com.apple.iTunesStore.downloadInfo"]);
        uint64_t v10 = objc_opt_class();
        id v11 = (void *)BCDynamicCast(v10, (uint64_t)[v9 objectForKey:@"accountInfo"]);
        uint64_t v12 = objc_opt_class();
        int v13 = (void *)BCDynamicCast(v12, (uint64_t)[v11 objectForKey:@"AppleID"]);
        if ([v13 length])
        {
          if (v13)
          {
LABEL_9:
            uint64_t v14 = objc_opt_class();
            uint64_t v15 = BCDynamicCast(v14, (uint64_t)[v11 objectForKeyedSubscript:@"DSPersonID"]);
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = BCDynamicCast(v16, (uint64_t)[v11 objectForKeyedSubscript:@"AltDSID"]);
            id v5 = (NSDictionary *)objc_alloc_init((Class)ATMutableAccountInfo);
            [(NSDictionary *)v5 setDSID:v15];
            [(NSDictionary *)v5 setAppleID:v13];
            [(NSDictionary *)v5 setAltDSID:v17];
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v18 = objc_opt_class();
          int v13 = (void *)BCDynamicCast(v18, (uint64_t)[(NSDictionary *)v5 objectForKey:@"apple-id"]);
          if (v13) {
            goto LABEL_9;
          }
        }
      }
    }
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (void)removeDatabase
{
  id v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_14DF0();
  }
  [(BooksClient *)self setDatabase:0];
  +[BCAssetDatabase removeDatabase];
}

- (BCAssetDatabase)database
{
  result = self->_database;
  if (!result)
  {
    id v4 = BCDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_14E24();
    }
    id v5 = objc_alloc_init(BCAssetDatabase);
    self->_database = (BCAssetDatabase *)[[ThreadSafeProxy alloc] initWithObject:v5];

    return self->_database;
  }
  return result;
}

- (id)filteredDownloads:(id)a3
{
  id v3 = [a3 downloads];
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = SSDownloadPropertyKind;
    uint64_t v9 = SSDownloadKindEBook;
    uint64_t v10 = SSDownloadPropertyLibraryItemIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v12, "valueForProperty:", v8), "isEqualToString:", v9))
        {
          id v13 = [v12 valueForProperty:v10];
          if ([v13 length]) {
            [(NSMutableDictionary *)v4 setValue:v12 forKey:v13];
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)updateAssets:(id)a3 withSSDownloads:(id)a4 andDownloadCompletePathMap:(id)a5
{
  uint64_t v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v32 = [a3 count];
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = [a4 count];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%d assets; %d downloads", buf, 0xEu);
  }
  if ([a3 count] && (objc_msgSend(a4, "count") || objc_msgSend(a5, "count")))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v28;
      *(void *)&long long v9 = 138412290;
      long long v25 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(a3);
          }
          id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "identifier", v25);
          if ([v14 length])
          {
            id v15 = [a4 objectForKey:v14];
            long long v16 = v15;
            if (v15)
            {
              objc_msgSend(v13, "setStorePID:", objc_msgSend(v15, "persistentIdentifier"));
            }
            else
            {
              long long v17 = BCDefaultLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v25;
                *(void *)id v32 = v14;
                _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "ATAsset with no matching SSDownload [My PID: %@]", buf, 0xCu);
              }
            }
            uint64_t v18 = objc_opt_class();
            uint64_t v19 = (void *)BCDynamicCast(v18, (uint64_t)[a5 objectForKey:v14]);
            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v19 length])
                {
                  if ([+[NSFileManager defaultManager] fileExistsAtPath:v19])
                  {
                    [v13 setPath:v19];
                    uint64_t v20 = BCDefaultLog();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      id v21 = [v13 path];
                      *(_DWORD *)buf = 138412546;
                      *(void *)id v32 = v14;
                      *(_WORD *)&v32[8] = 2112;
                      id v33 = v21;
                      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Setting installOnly : [identifier: %@] -- [Asset path: %@]", buf, 0x16u);
                    }
                    [v13 setInstallOnly:1];
                    continue;
                  }
                  id v22 = BCDefaultLog();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)id v32 = v14;
                    *(_WORD *)&v32[8] = 2112;
                    id v33 = v19;
                    _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Cannot set installOnly : [identifier: %@] -- [Asset path: %@] [Path does not exist]", buf, 0x16u);
                  }
                }
              }
            }
            id v23 = BCDefaultLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v16 downloadPhaseIdentifier];
              *(_DWORD *)buf = 138412802;
              *(void *)id v32 = v14;
              *(_WORD *)&v32[8] = 2112;
              id v33 = v24;
              __int16 v34 = 2112;
              long long v35 = v19;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Have Asset for Download : [identifier: %@] -- [DownloadPhase: %@] [DownloadCompletePath: %@]", buf, 0x20u);
            }
          }
        }
        id v10 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)isRestoreSession
{
  return self->_restoreSession;
}

- (void)setRestoreSession:(BOOL)a3
{
  self->_restoreSession = a3;
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableArray)pathsForDevice2DeviceRestoreRedownloadable
{
  return self->_pathsForDevice2DeviceRestoreRedownloadable;
}

- (void)setPathsForDevice2DeviceRestoreRedownloadable:(id)a3
{
}

- (NSMutableArray)pathsForDevice2DeviceRestoreLocal
{
  return self->_pathsForDevice2DeviceRestoreLocal;
}

- (void)setPathsForDevice2DeviceRestoreLocal:(id)a3
{
}

@end