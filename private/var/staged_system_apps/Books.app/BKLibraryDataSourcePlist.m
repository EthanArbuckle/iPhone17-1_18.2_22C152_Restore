@interface BKLibraryDataSourcePlist
+ (id)iTunesSyncedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5;
+ (id)managedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5;
+ (id)sampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5;
+ (id)stashedSampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5;
+ (id)untetheredBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5;
- (BKAssetCoverImageHelping)coverImageHelper;
- (BKAssetMetadataCaching)assetMetadataCache;
- (BKAssetMetadataProvider)assetMetadataProvider;
- (BKLibraryDataSourcePlist)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7;
- (BKLibraryDataSourcePlist)initWithTestPlist:(id)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7;
- (BKLibraryManager)libraryManager;
- (BOOL)_isEntryFamilyPurchase:(id)a3;
- (BOOL)_isFamilyPurchaseAtPath:(id)a3;
- (BOOL)_isSupplementalPDFFromPlistEntry:(id)a3;
- (BOOL)_isiTunesSyncedPlist;
- (BOOL)backgroundTaskCancelled;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)hasDigestChangedSinceFetch;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)q_rewritePlistDictionary:(id)a3 path:(id)a4 notify:(BOOL)a5;
- (BOOL)removeFileWithURL:(id)a3 error:(id *)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (BOOL)wantsPlistEntry:(id)a3;
- (BOOL)writesFullPaths;
- (IMLibraryPlist)plist;
- (NSCache)assetCache;
- (NSCache)assetCacheByTemporaryAssetID;
- (NSFileManager)fileManager;
- (NSMutableDictionary)fullPathToAssetID;
- (NSMutableSet)restoringFromBackupAssetIDs;
- (NSMutableSet)restoringFromBackupTemporaryAssetIDs;
- (NSString)description;
- (NSString)directory;
- (NSString)identifier;
- (NSString)lastFetchDigest;
- (NSString)lastReloadDigest;
- (OS_dispatch_queue)assetsQueue;
- (OS_dispatch_queue)ioQueue;
- (OS_dispatch_queue)itunesuQueue;
- (OS_dispatch_queue)updateAssetMetadataQueue;
- (id)_newEntryFromSummary:(id)a3;
- (id)_pathStringWithoutDirectoryPrefix:(id)a3;
- (id)booksRootPath;
- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3;
- (id)didWritePlistHandler;
- (id)importDestinationPathForAssetImporter:(id)a3;
- (id)plistAssetWithAsset:(id)a3 andURL:(id)a4;
- (id)plistDigest;
- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5;
- (id)q_plistContentsArrayWithError:(id *)a3;
- (id)q_plistContentsWithError:(id *)a3;
- (int64_t)coverSourceRank;
- (int64_t)currentQueueGeneration;
- (int64_t)rank;
- (int64_t)startQueueGeneration;
- (signed)_contentTypeFromPlistEntry:(id)a3 logFailure:(BOOL)a4;
- (unsigned)qualitySetting;
- (void)_addAssetIDsToCacheManager:(id)a3;
- (void)_deleteAssetIDs:(id)a3 assetIDToPath:(id)a4 completion:(id)a5;
- (void)_prioritizeRestorePlistAsset:(id)a3;
- (void)_removeAssetIDsFromCacheManager:(id)a3;
- (void)_setPropertiesOfAsset:(id)a3 withPlistEntry:(id)a4;
- (void)addPlistAssets:(id)a3 completion:(id)a4;
- (void)addPlistAssetsIfNeeded:(id)a3 completion:(id)a4;
- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)deleteAssetIDs:(id)a3 completion:(id)a4;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)p_addPlistAssets:(id)a3 checkForDuplicates:(BOOL)a4 completion:(id)a5;
- (void)prioritizeAssetRestoreWithAssetID:(id)a3;
- (void)q_asyncAddAssetDictionaries:(id)a3 completion:(id)a4;
- (void)q_asyncRemovePlistAssets:(id)a3 notify:(BOOL)a4 completion:(id)a5;
- (void)q_asyncRemovePlistEntriesMatching:(id)a3 notify:(BOOL)a4 completion:(id)a5;
- (void)q_asyncRemovePlistPaths:(id)a3 completion:(id)a4;
- (void)q_asyncReplacePlistEntries:(id)a3 notify:(BOOL)a4 completion:(id)a5;
- (void)q_clearAssetCaches;
- (void)q_deletePlistEntries:(id)a3;
- (void)q_evictFromAssetCaches:(id)a3;
- (void)q_plistWasChangedOnDisk;
- (void)q_processAssetStateChanges:(id)a3;
- (void)q_refreshAssetCachesFromPlistContents:(id)a3;
- (void)reload;
- (void)reloadAssetsForAddingWithAssetIDs:(id)a3;
- (void)reloadIfChanged;
- (void)reloadInGroup:(id)a3;
- (void)removePlistAssets:(id)a3 completion:(id)a4;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAssetCache:(id)a3;
- (void)setAssetCacheByTemporaryAssetID:(id)a3;
- (void)setAssetMetadataCache:(id)a3;
- (void)setAssetMetadataProvider:(id)a3;
- (void)setBackgroundTaskCancelled:(BOOL)a3;
- (void)setCoverImageHelper:(id)a3;
- (void)setCurrentQueueGeneration:(int64_t)a3;
- (void)setDidWritePlistHandler:(id)a3;
- (void)setFullPathToAssetID:(id)a3;
- (void)setLastFetchDigest:(id)a3;
- (void)setLastReloadDigest:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setPlistForUnitTest:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setRestoringFromBackupAssetIDs:(id)a3;
- (void)setRestoringFromBackupTemporaryAssetIDs:(id)a3;
- (void)setStartQueueGeneration:(int64_t)a3;
- (void)setWritesFullPaths:(BOOL)a3;
- (void)updateAsset:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5;
- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5;
- (void)updateFetchDigest;
- (void)updatePlistAssets:(id)a3 completion:(id)a4;
@end

@implementation BKLibraryDataSourcePlist

+ (id)iTunesSyncedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BKLibraryDataSourcePlist alloc] initWithPlistKind:0 identifier:@"com.apple.ibooks.plist.iTunesSynced" assetMetadataProvider:v9 coverImageHelper:v8 assetMetadataCache:v7];

  return v10;
}

+ (id)managedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BKLibraryDataSourcePlistManagedBooks alloc] initWithPlistKind:2 identifier:@"com.apple.ibooks.plist.managed" assetMetadataProvider:v9 coverImageHelper:v8 assetMetadataCache:v7];

  return v10;
}

+ (id)sampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BKLibraryDataSourcePlistSampleBooks alloc] initWithPlistKind:4 identifier:@"com.apple.iBooks.plist.sample" assetMetadataProvider:v9 coverImageHelper:v8 assetMetadataCache:v7];

  return v10;
}

+ (id)untetheredBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BKLibraryDataSourcePlistUntetheredBooks alloc] initWithPlistKind:1 identifier:@"com.apple.ibooks.plist.untethered" assetMetadataProvider:v9 coverImageHelper:v8 assetMetadataCache:v7];

  return v10;
}

+ (id)stashedSampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BKLibraryDataSourcePlistStashedSampleBooks alloc] initWithPlistKind:5 identifier:@"com.apple.iBooks.plist.sample.stashed" assetMetadataProvider:v9 coverImageHelper:v8 assetMetadataCache:v7];

  return v10;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setDidWritePlistHandler:(id)a3
{
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setLibraryManager:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BKLibraryDataSourcePlist)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  kdebug_trace();
  v41.receiver = self;
  v41.super_class = (Class)BKLibraryDataSourcePlist;
  v17 = [(BKLibraryDataSourcePlist *)&v41 init];
  if (v17)
  {
    uint64_t v18 = +[IMLibraryPlist libraryPlistWithKind:a3];
    plist = v17->_plist;
    v17->_plist = (IMLibraryPlist *)v18;

    objc_storeStrong((id *)&v17->_identifier, a4);
    v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    assetCache = v17->_assetCache;
    v17->_assetCache = v20;

    [(NSCache *)v17->_assetCache setName:@"assetCache"];
    v22 = (NSCache *)objc_alloc_init((Class)NSCache);
    assetCacheByTemporaryAssetID = v17->_assetCacheByTemporaryAssetID;
    v17->_assetCacheByTemporaryAssetID = v22;

    [(NSCache *)v17->_assetCacheByTemporaryAssetID setName:@"assetCacheByTemporaryAssetID"];
    uint64_t v24 = +[NSMutableSet set];
    restoringFromBackupAssetIDs = v17->_restoringFromBackupAssetIDs;
    v17->_restoringFromBackupAssetIDs = (NSMutableSet *)v24;

    uint64_t v26 = +[NSMutableSet set];
    restoringFromBackupTemporaryAssetIDs = v17->_restoringFromBackupTemporaryAssetIDs;
    v17->_restoringFromBackupTemporaryAssetIDs = (NSMutableSet *)v26;

    dispatch_queue_t v28 = dispatch_queue_create("BKLibraryDataSourcePlist.assetsQueue", 0);
    assetsQueue = v17->_assetsQueue;
    v17->_assetsQueue = (OS_dispatch_queue *)v28;

    dispatch_queue_t v30 = dispatch_queue_create("BKLibraryDataSourcePlist.updateAssetMetadataQueue", 0);
    updateAssetMetadataQueue = v17->_updateAssetMetadataQueue;
    v17->_updateAssetMetadataQueue = (OS_dispatch_queue *)v30;

    objc_storeWeak((id *)&v17->_assetMetadataProvider, v14);
    objc_storeWeak((id *)&v17->_assetMetadataCache, v16);
    objc_storeWeak((id *)&v17->_coverImageHelper, v15);
    dispatch_queue_t v32 = dispatch_queue_create("BKLibraryDataSourcePlist.ioQueue", 0);
    ioQueue = v17->_ioQueue;
    v17->_ioQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = +[NSMutableDictionary dictionary];
    fullPathToAssetID = v17->_fullPathToAssetID;
    v17->_fullPathToAssetID = (NSMutableDictionary *)v34;

    dispatch_queue_t v36 = dispatch_queue_create("com.apple.iBooks.BKLibraryDataSourcePlist.iTunesU", 0);
    itunesuQueue = v17->_itunesuQueue;
    v17->_itunesuQueue = (OS_dispatch_queue *)v36;

    uint64_t v38 = [(BKLibraryDataSourcePlist *)v17 plistDigest];
    lastReloadDigest = v17->_lastReloadDigest;
    v17->_lastReloadDigest = (NSString *)v38;
  }
  kdebug_trace();

  return v17;
}

- (id)plistDigest
{
  v2 = [(BKLibraryDataSourcePlist *)self plist];
  v3 = [v2 calculateChecksum];

  return v3;
}

- (IMLibraryPlist)plist
{
  return self->_plist;
}

- (void)reloadIfChanged
{
  uint64_t v3 = [(BKLibraryDataSourcePlist *)self lastReloadDigest];
  if (!v3) {
    goto LABEL_3;
  }
  v4 = (void *)v3;
  v5 = [(BKLibraryDataSourcePlist *)self lastReloadDigest];
  v6 = [(BKLibraryDataSourcePlist *)self plistDigest];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_3:
    [(BKLibraryDataSourcePlist *)self reload];
  }
}

- (NSString)lastReloadDigest
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (id)importDestinationPathForAssetImporter:(id)a3
{
  uint64_t v3 = [(BKLibraryDataSourcePlist *)self identifier];
  unsigned int v4 = [v3 isEqualToString:@"com.apple.ibooks.plist.untethered"];

  if (v4)
  {
    v5 = +[IMLibraryPlist purchasesRepositoryPath];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)directory
{
  return (NSString *)[(IMLibraryPlist *)self->_plist directory];
}

- (void)setPlistForUnitTest:(id)a3
{
}

- (BKLibraryDataSourcePlist)initWithTestPlist:(id)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  v12 = (IMLibraryPlist *)a3;
  id v13 = [(BKLibraryDataSourcePlist *)self initWithPlistKind:0 identifier:a4 assetMetadataProvider:a5 coverImageHelper:a6 assetMetadataCache:a7];
  plist = v13->_plist;
  v13->_plist = v12;

  return v13;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  unsigned int v4 = NSStringFromClass(v3);
  v5 = [(BKLibraryDataSourcePlist *)self identifier];
  v6 = [(BKLibraryDataSourcePlist *)self plist];
  unsigned __int8 v7 = [v6 path];
  id v8 = [v7 lastPathComponent];
  id v9 = +[NSString stringWithFormat:@"<%@=%p id=%@ plist=%@ rank=%ld>", v4, self, v5, v8, [(BKLibraryDataSourcePlist *)self rank]];

  return (NSString *)v9;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FE71C;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_addAssetIDsToCacheManager:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 assetID];
        v12 = [(BKLibraryDataSourcePlist *)self identifier];
        id v13 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v11 dataSourceID:v12];
        id v14 = [v10 assetID];
        [v5 setObject:v13 forKeyedSubscript:v14];
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id v15 = +[BCCacheManager defaultCacheManager];
    [v15 addURLs:v5 priority:3 quality:[self qualitySetting] expiresAfter:0];
  }
}

- (void)_removeAssetIDsFromCacheManager:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 assetID];
        v12 = [(BKLibraryDataSourcePlist *)self identifier];
        id v13 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v11 dataSourceID:v12];
        id v14 = [v10 assetID];
        [v5 setObject:v13 forKeyedSubscript:v14];
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id v15 = +[BCCacheManager defaultCacheManager];
    [v15 removeURLs:v5 priority:3 quality:[self qualitySetting]];
  }
}

- (unsigned)qualitySetting
{
  uint64_t v3 = [(BKLibraryDataSourcePlist *)self identifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.iBooks.plist.sample"];

  if (v4) {
    return 204;
  }
  id v6 = [(BKLibraryDataSourcePlist *)self identifier];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.iBooks.plist.sample.stashed"];

  if (v7) {
    return 205;
  }
  else {
    return 206;
  }
}

- (BOOL)_isSupplementalPDFFromPlistEntry:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:v4];
  LODWORD(self) = [(BKLibraryDataSourcePlist *)self _contentTypeFromPlistEntry:v4 logFailure:0];

  if (self == 3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  uint64_t v8 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FF184;
  block[3] = &unk_100A45338;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (int64_t)coverSourceRank
{
  return 4;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 objectForKey:@"assetID"];
  id v10 = [v7 objectForKey:@"permlink"];
  v11 = +[NSURL URLWithString:v10];
  id v12 = [(BKLibraryDataSourcePlist *)self coverImageHelper];
  if (v12)
  {
    id v13 = [v7 objectForKey:@"path"];
    if (v13)
    {
      id v14 = +[NSURL fileURLWithPath:v13];
    }
    else
    {
      id v14 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001FFC48;
    v17[3] = &unk_100A4BE50;
    id v21 = v8;
    id v18 = v11;
    long long v19 = self;
    id v20 = v9;
    [v12 coverImageFromURL:v14 completion:v17];
  }
  else
  {
    id v15 = objc_retainBlock(v8);
    if (v15)
    {
      id v16 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorInvalidAssetError userInfo:0];
      (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v16);
    }
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v25 = a5;
  id v7 = BKLibraryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1007F0A28();
  }

  id v8 = objc_opt_new();
  uint64_t v26 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v14 = [v13 assetID];
        if (v14)
        {
          [v8 addObject:v14];
          uint64_t v15 = [v13 path];
          if (v15)
          {
            id v16 = (void *)v15;
            long long v17 = [v13 dataSourceIdentifier];
            id v18 = [(BKLibraryDataSourcePlist *)self identifier];
            unsigned int v19 = [v17 isEqualToString:v18];

            if (v19)
            {
              id v20 = [v13 path];
              [v26 setObject:v20 forKey:v14];
            }
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100200148;
    v29[3] = &unk_100A46D88;
    id v21 = v25;
    id v30 = v25;
    v22 = v26;
    [(BKLibraryDataSourcePlist *)self _deleteAssetIDs:v8 assetIDToPath:v26 completion:v29];
    v23 = v30;
  }
  else
  {
    id v21 = v25;
    id v24 = objc_retainBlock(v25);
    v23 = v24;
    v22 = v26;
    if (v24) {
      (*((void (**)(id, uint64_t, void))v24 + 2))(v24, 1, 0);
    }
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002002A0;
  v8[3] = &unk_100A4A408;
  id v9 = self;
  id v10 = a3;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  [(BKLibraryDataSourcePlist *)v9 assetForLibraryAsset:v7 completion:v8];
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1007F0B78();
  }

  id v9 = [v6 assetID];
  id v14 = v9;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002004C0;
  v12[3] = &unk_100A46C98;
  id v13 = v7;
  id v11 = v7;
  [(BKLibraryDataSourcePlist *)self fetchAssetsWithIDs:v10 completion:v12];
}

- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BKLibraryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(BKLibraryDataSourcePlist *)self identifier];
    id v13 = [v8 assetID];
    *(_DWORD *)buf = 138544130;
    id v25 = v12;
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2112;
    v29 = v13;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DataSourcePlist: %{public}@ Updating assetID:%{mask.hash}@ with title:(%@)", buf, 0x2Au);
  }
  id v14 = [v8 assetID];
  uint64_t v15 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002007D8;
  v19[3] = &unk_100A45980;
  id v20 = v14;
  id v21 = self;
  id v22 = v9;
  id v23 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v14;
  dispatch_async(v15, v19);
}

- (void)updateAsset:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = BKLibraryLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [(BKLibraryDataSourcePlist *)self identifier];
    id v16 = [v8 assetID];
    id v17 = +[NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138543874;
    id v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v16;
    __int16 v27 = 2112;
    __int16 v28 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Updating asset %@ isEphemeral: %@", buf, 0x20u);
  }
  id v11 = [v8 assetID];
  id v12 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100200C9C;
  v18[3] = &unk_100A46160;
  id v19 = v11;
  id v20 = self;
  BOOL v22 = v6;
  id v21 = v9;
  id v13 = v9;
  id v14 = v11;
  dispatch_async(v12, v18);
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)reload
{
  uint64_t v3 = [(BKLibraryDataSourcePlist *)self libraryManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002010CC;
  v4[3] = &unk_100A4BEC8;
  v4[4] = self;
  [v3 libraryDataSource:self updateWithName:@"reload" block:v4];
}

- (void)reloadInGroup:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKLibraryDataSourcePlist *)self plistDigest];
  [(BKLibraryDataSourcePlist *)self setLastReloadDigest:v5];

  id v6 = [(BKLibraryDataSourcePlist *)self libraryManager];
  [v6 libraryDataSource:self reloadInGroup:v4];
}

- (void)reloadAssetsForAddingWithAssetIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002011D0;
  v3[3] = &unk_100A48D90;
  v3[4] = self;
  [(BKLibraryDataSourcePlist *)self fetchAssetsWithIDs:a3 completion:v3];
}

- (BOOL)hasDigestChangedSinceFetch
{
  uint64_t v3 = [(BKLibraryDataSourcePlist *)self lastFetchDigest];
  if (v3)
  {
    id v4 = [(BKLibraryDataSourcePlist *)self lastFetchDigest];
    unsigned __int8 v5 = [(BKLibraryDataSourcePlist *)self plistDigest];
    unsigned int v6 = [v4 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)updateFetchDigest
{
  id v3 = [(BKLibraryDataSourcePlist *)self plistDigest];
  [(BKLibraryDataSourcePlist *)self setLastFetchDigest:v3];
}

- (BOOL)wantsPlistEntry:(id)a3
{
  return 1;
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = kBKLibraryDataSourceErrorInvalidAssetError;
  if ([v11 length])
  {
    uint64_t v15 = +[BLLibrary defaultBookLibrary];
    id v16 = +[NSURL fileURLWithPath:v11];
    id v17 = [v15 _perUserBookURLForBookURL:v16];

    if (v17)
    {
      id v33 = v9;
      id v18 = [v17 URLByAppendingPathComponent:@"iTunesMetadata.plist"];
      id v19 = +[NSDictionary dictionaryWithContentsOfURL:v18];
      if (v19)
      {
        id v20 = objc_opt_new();
        id v21 = [v19 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
        BOOL v22 = [v21 valueForKeyPath:@"accountInfo.FamilyID"];
        BUStoreIdStringFromObject();
        v23 = id v32 = v10;
        [v20 setFamilyID:v23];

        id v24 = [v21 valueForKeyPath:@"accountInfo.DSPersonID"];
        __int16 v25 = BUStoreIdStringFromObject();
        [v20 setDownloadedDSID:v25];

        __int16 v26 = [v21 valueForKeyPath:@"accountInfo.PurchaserID"];
        __int16 v27 = BUStoreIdStringFromObject();
        [v20 setPurchasedDSID:v27];

        id v10 = v32;
        uint64_t v13 = 0;
      }
      else
      {
        id v20 = 0;
      }

      id v9 = v33;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    __int16 v28 = BKLibraryLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1007F0C18();
    }

    id v20 = 0;
  }
  id v29 = objc_retainBlock(v12);
  __int16 v30 = (void (**)(void, void, void))v29;
  if (v13)
  {
    if (v29)
    {
      id v31 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:v13 userInfo:0];
      ((void (**)(void, void, void *))v30)[2](v30, 0, v31);
    }
  }
  else if (v29)
  {
    (*((void (**)(id, void *, void))v29 + 2))(v29, v20, 0);
  }
}

- (void)addPlistAssetsIfNeeded:(id)a3 completion:(id)a4
{
}

- (void)addPlistAssets:(id)a3 completion:(id)a4
{
}

- (void)p_addPlistAssets:(id)a3 checkForDuplicates:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v55 = a5;
  id v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1007F0CA4();
  }

  v57 = objc_opt_new();
  v56 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v61 = *(void *)v67;
    do
    {
      id v11 = 0;
      id v58 = v10;
      do
      {
        if (*(void *)v67 != v61) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v11);
        uint64_t v13 = [v12 url];
        id v14 = [v12 assetID];
        if (v6)
        {
          uint64_t v15 = [(BKLibraryDataSourcePlist *)self plist];
          id v16 = [v15 contents];
          id v17 = +[IMLibraryPlist entryForAssetID:v14 contents:v16];

          BOOL v18 = v17 == 0;
        }
        else
        {
          BOOL v18 = 1;
        }
        if ([v13 isFileURL])
        {
          id v19 = [v13 path];
          if (![v19 length]) {
            BOOL v18 = 0;
          }

          if (v18)
          {
            id v20 = objc_alloc_init((Class)NSMutableDictionary);
            id v21 = [v12 author];
            id v22 = [v21 length];

            if (v22)
            {
              id v23 = [v12 author];
              [v20 setObject:v23 forKey:@"author"];
            }
            id v24 = [v12 title];
            id v25 = [v24 length];

            if (v25)
            {
              __int16 v26 = [v12 title];
              [v20 setObject:v26 forKey:@"title"];
            }
            __int16 v27 = [v12 genre];
            id v28 = [v27 length];

            if (v28)
            {
              id v29 = [v12 genre];
              [v20 setObject:v29 forKey:@"genre"];
            }
            __int16 v30 = [v12 storeID];
            id v31 = [v30 length];

            if (v31)
            {
              id v32 = [v12 storeID];
              [v20 setObject:v32 forKey:@"storeId"];
            }
            id v33 = [v12 assetID];
            id v34 = [v33 length];

            if (v34)
            {
              v35 = [v12 assetID];
              [v20 setObject:v35 forKey:@"assetID"];
            }
            dispatch_queue_t v36 = [v12 sortTitle];
            id v37 = [v36 length];

            if (v37)
            {
              uint64_t v38 = [v12 sortTitle];
              [v20 setObject:v38 forKey:@"sortTitle"];
            }
            v39 = [v12 sortAuthor];
            id v40 = [v39 length];

            if (v40)
            {
              objc_super v41 = [v12 sortAuthor];
              [v20 setObject:v41 forKey:@"sortAuthor"];
            }
            if ([v12 isProof])
            {
              v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isProof]);
              [v20 setObject:v42 forKey:@"proof"];
            }
            if ([v12 isEphemeral])
            {
              v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isEphemeral]);
              [v20 setObject:v43 forKey:@"ephemeral"];
            }
            v44 = [v12 purchaseDate];

            if (v44)
            {
              v45 = [v12 purchaseDate];
              [v20 setObject:v45 forKey:@"importDate"];
            }
            v46 = [v13 path];
            [v20 setObject:v46 forKey:@"path"];

            id v47 = [(BKLibraryDataSourcePlist *)self _newEntryFromSummary:v20];
            [v57 addObject:v47];
            id v48 = +[BKPlistAsset newBlankAsset];
            [(BKLibraryDataSourcePlist *)self _setPropertiesOfAsset:v48 withPlistEntry:v47];
            v49 = [v12 assetID];
            [v56 setObject:v48 forKeyedSubscript:v49];

            id v10 = v58;
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v10 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v10);
  }

  if ([v57 count])
  {
    v50 = [(BKLibraryDataSourcePlist *)self assetsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100201CC8;
    block[3] = &unk_100A45980;
    void block[4] = self;
    v51 = v56;
    id v63 = v56;
    id v64 = v57;
    v52 = v55;
    id v65 = v55;
    dispatch_async(v50, block);
  }
  else
  {
    v52 = v55;
    id v53 = objc_retainBlock(v55);
    v54 = v53;
    v51 = v56;
    if (v53) {
      (*((void (**)(id, uint64_t, void))v53 + 2))(v53, 1, 0);
    }
  }
}

- (void)removePlistAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1007F0D4C();
  }

  id v9 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v16 = [v15 assetID];
        id v17 = [v16 length];

        if (v17)
        {
          BOOL v18 = [v15 assetID];
          [v9 addObject:v18];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  id v19 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100202144;
  block[3] = &unk_100A45338;
  id v23 = v9;
  id v24 = self;
  id v25 = v7;
  id v20 = v7;
  id v21 = v9;
  dispatch_async(v19, block);
}

- (void)updatePlistAssets:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    id v4 = v5;
  }
}

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  uint64_t v33 = 0;
  id v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  dispatch_queue_t v36 = sub_10000716C;
  id v37 = sub_100007284;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_10000716C;
  id v31 = sub_100007284;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10000716C;
  id v25 = sub_100007284;
  id v26 = 0;
  id v6 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100202580;
  block[3] = &unk_100A440D0;
  void block[4] = self;
  id v7 = v4;
  id v17 = v7;
  BOOL v18 = &v33;
  id v19 = &v27;
  id v20 = &v21;
  dispatch_sync(v6, block);

  if (v34[5] && v28[5] && v22[5]) {
    goto LABEL_14;
  }
  id v8 = [(BKLibraryDataSourcePlist *)self assetMetadataProvider];
  id v9 = [v8 coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:v7];

  id v10 = [v9 objectForKeyedSubscript:@"coverWritingMode"];
  id v11 = [v9 objectForKeyedSubscript:@"language"];
  id v12 = [v9 objectForKeyedSubscript:@"pageProgressionDirection"];
  if (!v34[5] && v10) {
    objc_storeStrong(v34 + 5, v10);
  }
  if (!v28[5] && v11) {
    objc_storeStrong(v28 + 5, v11);
  }
  if (!v22[5] && v12) {
    objc_storeStrong(v22 + 5, v12);
  }

  if (v34[5]) {
LABEL_14:
  }
    [v5 setObject:forKey:];
  id v13 = v28[5];
  if (v13) {
    [v5 setObject:v13 forKey:@"language"];
  }
  id v14 = v22[5];
  if (v14) {
    [v5 setObject:v14 forKey:@"pageProgressionDirection"];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);

  return v5;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10000716C;
  id v22 = sub_100007284;
  id v23 = 0;
  id v9 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002029A4;
  v14[3] = &unk_100A4BEF0;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v17 = &v18;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)q_refreshAssetCachesFromPlistContents:(id)a3
{
  id v4 = +[IMLibraryPlist booksArrayFromPlistEntry:a3];
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKLibraryDataSourcePlist *)self identifier];
    *(_DWORD *)buf = 138543618;
    long long v28 = v6;
    __int16 v29 = 2048;
    id v30 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: q_refreshAssetCachesFromPlistContents: Refreshing asset caches. count: %ld", buf, 0x16u);
  }
  [(BKLibraryDataSourcePlist *)self q_clearAssetCaches];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
        id v13 = +[BKPlistAsset newBlankAsset];
        [(BKLibraryDataSourcePlist *)self _setPropertiesOfAsset:v13 withPlistEntry:v12];
        id v14 = [v13 assetID];
        id v15 = [v14 length];

        if (v15)
        {
          id v16 = [(BKLibraryDataSourcePlist *)self assetCache];
          id v17 = [v13 assetID];
          [v16 setObject:v13 forKey:v17];
        }
        uint64_t v18 = [v13 temporaryAssetID];
        id v19 = [v18 length];

        if (v19)
        {
          uint64_t v20 = [(BKLibraryDataSourcePlist *)self assetCacheByTemporaryAssetID];
          uint64_t v21 = [v13 temporaryAssetID];
          [v20 setObject:v13 forKey:v21];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)q_clearAssetCaches
{
  id v3 = [(BKLibraryDataSourcePlist *)self assetCache];
  [v3 removeAllObjects];

  id v4 = [(BKLibraryDataSourcePlist *)self assetCacheByTemporaryAssetID];
  [v4 removeAllObjects];
}

- (void)q_evictFromAssetCaches:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourcePlist *)self assetCache];
  [v5 removeObjectForKey:v4];

  id v6 = [(BKLibraryDataSourcePlist *)self assetCacheByTemporaryAssetID];
  [v6 removeObjectForKey:v4];
}

- (id)_pathStringWithoutDirectoryPrefix:(id)a3
{
  id v3 = a3;
  id v4 = +[IMLibraryPlist purchasesRepositoryPath];
  id v5 = [v3 stringByReplacingOccurrencesOfString:v4 withString:&stru_100A70340];

  return v5;
}

- (id)_newEntryFromSummary:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKLibraryDataSourcePlist *)self writesFullPaths];
  id v6 = [v4 objectForKey:@"path"];
  if ((v5 & 1) == 0)
  {
    id v7 = [(BKLibraryDataSourcePlist *)self _pathStringWithoutDirectoryPrefix:v6];

    if ([v7 characterAtIndex:0] == 47)
    {
      uint64_t v8 = [v7 substringFromIndex:1];

      id v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "characterAtIndex:", (char *)objc_msgSend(v7, "length") - 1) == 47)
    {
      id v6 = [v7 substringToIndex:[v7 length] - 1];
    }
    else
    {
      id v6 = v7;
    }
  }
  if ([v6 length])
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [v9 setObject:&__kCFBooleanTrue forKey:@"Inserted-By-iBooks"];
    uint64_t v10 = +[IMLibraryPlist keyNameForPath];
    [v9 setObject:v6 forKey:v10];

    id v11 = [v4 objectForKey:@"author"];
    id v12 = [v11 length];

    if (v12)
    {
      id v13 = [v4 objectForKey:@"author"];
      id v14 = +[IMLibraryPlist keyNameForAuthor];
      [v9 setObject:v13 forKey:v14];
    }
    id v15 = [v4 objectForKey:@"title"];
    id v16 = [v15 length];

    if (v16)
    {
      id v17 = [v4 objectForKey:@"title"];
      uint64_t v18 = +[IMLibraryPlist keyNameForTitle];
      [v9 setObject:v17 forKey:v18];
    }
    id v19 = [v4 objectForKey:@"genre"];
    id v20 = [v19 length];

    if (v20)
    {
      uint64_t v21 = [v4 objectForKey:@"genre"];
      long long v22 = +[IMLibraryPlist keyNameForGenre];
      [v9 setObject:v21 forKey:v22];
    }
    long long v23 = [v4 objectForKey:@"storeId"];
    id v24 = [v23 length];

    if (v24)
    {
      long long v25 = [v4 objectForKey:@"storeId"];
      id v26 = +[IMLibraryPlist keyNameForStoreId];
      [v9 setObject:v25 forKey:v26];
    }
    uint64_t v27 = [v4 objectForKey:@"assetID"];
    id v28 = [v27 length];

    if (v28)
    {
      __int16 v29 = [v4 objectForKey:@"assetID"];
      id v30 = +[IMLibraryPlist keyNameForUniqueId];
      [v9 setObject:v29 forKey:v30];
    }
    id v31 = [v4 objectForKey:@"sortAuthor"];
    id v32 = [v31 length];

    if (v32)
    {
      uint64_t v33 = [v4 objectForKey:@"sortAuthor"];
      id v34 = [v4 objectForKey:@"author"];
      unsigned __int8 v35 = [v33 isEqualToString:v34];

      if ((v35 & 1) == 0)
      {
        dispatch_queue_t v36 = [v4 objectForKey:@"sortAuthor"];
        id v37 = +[IMLibraryPlist keyNameForSortAuthor];
        [v9 setObject:v36 forKey:v37];
      }
    }
    id v38 = [v4 objectForKey:@"sortTitle"];
    id v39 = [v38 length];

    if (v39)
    {
      id v40 = [v4 objectForKey:@"sortTitle"];
      objc_super v41 = [v4 objectForKey:@"title"];
      unsigned __int8 v42 = [v40 isEqualToString:v41];

      if ((v42 & 1) == 0)
      {
        v43 = [v4 objectForKey:@"sortTitle"];
        v44 = +[IMLibraryPlist keyNameForSortTitle];
        [v9 setObject:v43 forKey:v44];
      }
    }
    v45 = [v4 objectForKey:@"pageProgressionDirection"];
    id v46 = [v45 length];

    if (v46)
    {
      id v47 = [v4 objectForKey:@"pageProgressionDirection"];
      id v48 = +[IMLibraryPlist keyNameForPageProgression];
      [v9 setObject:v47 forKey:v48];
    }
    v49 = [v4 objectForKey:@"proof"];
    unsigned int v50 = [v49 BOOLValue];

    if (v50)
    {
      v51 = [v4 objectForKey:@"proof"];
      v52 = +[IMLibraryPlist keyNameForProofedAsset];
      [v9 setObject:v51 forKey:v52];
    }
    id v53 = [v4 objectForKey:@"ephemeral"];
    unsigned int v54 = [v53 BOOLValue];

    if (v54)
    {
      id v55 = [v4 objectForKey:@"ephemeral"];
      v56 = +[IMLibraryPlist keyNameForIsEphemeral];
      [v9 setObject:v55 forKey:v56];
    }
    v57 = [v4 objectForKey:@"importDate"];

    if (v57)
    {
      id v58 = [v4 objectForKey:@"importDate"];
      v59 = +[IMLibraryPlist keyNameForImportDate];
      [v9 setObject:v58 forKey:v59];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_isiTunesSyncedPlist
{
  v2 = [(BKLibraryDataSourcePlist *)self identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.ibooks.plist.iTunesSynced"];

  return v3;
}

- (id)q_plistContentsWithError:(id *)a3
{
  unsigned __int8 v5 = +[IMLibraryPlist keyNameForBooksArray];
  id v9 = v5;
  id v6 = [(BKLibraryDataSourcePlist *)self q_plistContentsArrayWithError:a3];
  uint64_t v10 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  return v7;
}

- (id)q_plistContentsArrayWithError:(id *)a3
{
  unsigned __int8 v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007F0F98(self);
  }

  id v91 = objc_alloc_init((Class)NSMutableArray);
  id v96 = objc_alloc_init((Class)NSMutableDictionary);
  id v92 = objc_alloc_init((Class)NSMutableArray);
  v93 = +[BLLibrary defaultBookLibrary];
  v95 = [(BKLibraryDataSourcePlist *)self plist];
  unint64_t v4 = 0;
  v90 = 0;
  do
  {
    unsigned __int8 v5 = +[BLLockFile iTunesSyncLockFile];
    if ([v5 tryLock:0])
    {
      id v6 = [(BKLibraryDataSourcePlist *)self plist];
      uint64_t v7 = [v6 contents];

      int v8 = 1;
      id v9 = v5;
      v90 = (void *)v7;
    }
    else
    {
      int v8 = 0;
      id v9 = v5;
    }
    [v9 unlock];
    uint64_t v10 = BKLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [(BKLibraryDataSourcePlist *)self identifier];
      id v14 = (void *)v13;
      *(_DWORD *)buf = 138543874;
      id v15 = "NO";
      if (v8) {
        id v15 = "YES";
      }
      uint64_t v109 = v13;
      __int16 v110 = 2082;
      v111 = v15;
      __int16 v112 = 1024;
      LODWORD(v113) = v4 + 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ -- read succeeded: %{public}s -- Try # %d", buf, 0x1Cu);
    }
    BOOL v11 = v4 > 8;
    if (v4 > 8) {
      char v12 = 1;
    }
    else {
      char v12 = v8;
    }
    if ((v12 & 1) == 0)
    {
      usleep(0x61A8u);
      BOOL v11 = 0;
    }

    ++v4;
  }
  while ((v11 | v8) != 1);
  id v16 = +[IMLibraryPlist keyNameForBooksArray];
  id v17 = [v90 objectForKey:v16];

  uint64_t v18 = [(BKLibraryDataSourcePlist *)self identifier];
  unsigned int v97 = [v18 isEqualToString:@"com.apple.ibooks.plist.iTunesSynced"];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v17;
  id v100 = [obj countByEnumeratingWithState:&v104 objects:v120 count:16];
  if (v100)
  {
    uint64_t v94 = 0;
    uint64_t v99 = *(void *)v105;
    do
    {
      id v19 = 0;
      do
      {
        if (*(void *)v105 != v99) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v104 + 1) + 8 * (void)v19);
        if ([(BKLibraryDataSourcePlist *)self wantsPlistEntry:v20]
          && (!v97
           || [(BKLibraryDataSourcePlist *)self _contentTypeFromPlistEntry:v20 logFailure:0]))
        {
          v101 = +[IMLibraryPlist storeIdFromPlistEntry:v20];
          id v21 = [v20 mutableCopy];
          long long v22 = +[IMLibraryPlist folderNameFromPlistEntry:v21];
          if ([v22 length])
          {
            long long v23 = [v95 directory];
            if (([v22 hasPrefix:@"/"] & 1) != 0
              || ([v22 hasPrefix:v23] & 1) != 0)
            {
              id v24 = v22;
            }
            else
            {
              long long v25 = [v95 directory];
              id v24 = [v25 stringByAppendingPathComponent:v22];
            }
            [v21 setObject:v24 forKey:@"BKLibraryDataSourcePlist-FullPath"];
            id v26 = [(BKLibraryDataSourcePlist *)self fileManager];
            unsigned __int8 v27 = [v26 fileExistsAtPath:v24];

            if ((v27 & 1) == 0)
            {
              id v37 = +[BKLibrarySharedContainerManager sharedInstance];
              __int16 v29 = [v37 sharedURLForEntry:v20];

              if (!v29) {
                goto LABEL_53;
              }
              id v38 = [(BKLibraryDataSourcePlist *)self fileManager];
              id v39 = [v29 path];
              unsigned int v40 = [v38 fileExistsAtPath:v39];

              if (!v40) {
                goto LABEL_53;
              }
              objc_super v41 = [v29 path];
              [v21 setObject:v41 forKey:@"BKLibraryDataSourcePlist-FullPath"];

              goto LABEL_44;
            }
            if ([v93 _isMultiUser]
              && [v93 _isShareableBook:v20])
            {
              id v28 = +[BKLibrarySharedContainerManager sharedInstance];
              __int16 v29 = [v28 sharedURLForEntry:v20];

              if (!v29
                || ([(BKLibraryDataSourcePlist *)self fileManager],
                    id v30 = objc_claimAutoreleasedReturnValue(),
                    [v29 path],
                    id v31 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v32 = [v30 fileExistsAtPath:v31],
                    v31,
                    v30,
                    (v32 & 1) == 0))
              {
                [v21 removeObjectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                uint64_t v33 = [(BKLibraryDataSourcePlist *)self fileManager];
                id v103 = 0;
                unsigned int v34 = [v33 removeItemAtPath:v24 error:&v103];
                unsigned __int8 v35 = (char *)v103;

                if (v34)
                {
                  dispatch_queue_t v36 = BKLibraryLog();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v109 = (uint64_t)v24;
                    __int16 v110 = 2112;
                    v111 = v35;
                    _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Failed to remove per-user file at path %@. Error: %@", buf, 0x16u);
                  }
                }
LABEL_53:

                v49 = +[NSNumber numberWithBool:0];
                [v21 setObject:v49 forKey:@"BKLibraryDataSourcePlist-Exists"];

                if ((v94 & 1) == 0)
                {
                  unsigned int v50 = [(BKLibraryDataSourcePlist *)self libraryManager];
                  v51 = [v50 delegate];

                  if (objc_opt_respondsToSelector()) {
                    BYTE4(v94) = [v51 isRestoringFromiCloud];
                  }
                  else {
                    BYTE4(v94) = 0;
                  }
                }
                v62 = BKLibraryLog();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                {
                  id v64 = [(BKLibraryDataSourcePlist *)self identifier];
                  id v65 = +[IMLibraryPlist folderNameFromPlistEntry:v21];
                  long long v66 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                  uint64_t v67 = [v21 objectForKey:@"BKLibraryDataSourcePlist-Exists"];
                  long long v68 = (void *)v67;
                  *(_DWORD *)buf = 138544386;
                  CFStringRef v69 = &stru_100A70340;
                  if ((v94 & 0x100000000) != 0) {
                    CFStringRef v69 = @"BUT iCloud Restore in progress, not removing this entry";
                  }
                  uint64_t v109 = (uint64_t)v64;
                  __int16 v110 = 2112;
                  v111 = v65;
                  __int16 v112 = 2112;
                  v113 = v66;
                  __int16 v114 = 2112;
                  uint64_t v115 = v67;
                  __int16 v116 = 2112;
                  CFStringRef v117 = v69;
                  _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%{public}@ Dead Entry: [%@ ==> %@] [Exists: %@] %@", buf, 0x34u);
                }
                if ((v94 & 0x100000000) != 0)
                {
                  BYTE4(v94) = 1;
                }
                else
                {
                  [v92 addObject:v21];
                  BYTE4(v94) = 0;
                }
                LOBYTE(v94) = 1;
LABEL_87:

                goto LABEL_88;
              }
LABEL_44:
            }
            unsigned __int8 v42 = +[NSNumber numberWithBool:1];
            [v21 setObject:v42 forKey:@"BKLibraryDataSourcePlist-Exists"];
          }
          if (![v101 length])
          {
            [(BKLibraryDataSourcePlist *)self q_updateUniqueIDIfNeededInMutableEntry:v21 withOriginalBookEntry:v20];
            [v91 addObject:v21];
            goto LABEL_87;
          }
          v43 = [v96 objectForKey:v101];
          if (v43)
          {
            v44 = +[IMLibraryPlist publicationVersionFromPlistEntry:v43];
            v45 = +[IMLibraryPlist publicationVersionFromPlistEntry:v21];
            id v46 = [v44 longLongValue];
            id v47 = [(__CFString *)v45 longLongValue];
            if ((uint64_t)v47 > (uint64_t)v46)
            {
              id v48 = BKLibraryLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                v70 = [(BKLibraryDataSourcePlist *)self identifier];
                v71 = [v43 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                v72 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                *(_DWORD *)buf = 138544642;
                uint64_t v109 = (uint64_t)v70;
                __int16 v110 = 2112;
                v111 = (const char *)v101;
                __int16 v112 = 2112;
                v113 = v44;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v71;
                __int16 v116 = 2112;
                CFStringRef v117 = v45;
                __int16 v118 = 2112;
                v119 = v72;
                _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item taking over: [Store ID: %@] [Older: %@ -- %@] [Newer: %@ -- %@]", buf, 0x3Eu);
              }
              goto LABEL_84;
            }
            if (v47 != v46)
            {
              v60 = BKLibraryLog();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                v73 = [(BKLibraryDataSourcePlist *)self identifier];
                v74 = [v43 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                v75 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                *(_DWORD *)buf = 138544642;
                uint64_t v109 = (uint64_t)v73;
                __int16 v110 = 2112;
                v111 = (const char *)v101;
                __int16 v112 = 2112;
                v113 = v44;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v74;
                __int16 v116 = 2112;
                CFStringRef v117 = v45;
                __int16 v118 = 2112;
                v119 = v75;
                _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item already in place: [Store ID: %@] [Current: %@ -- %@] [Contender: %@ -- %@]", buf, 0x3Eu);
              }
              goto LABEL_68;
            }
            v52 = +[IMLibraryPlist isSampleFromPlistEntry:v43];
            unsigned int v53 = [v52 BOOLValue];

            unsigned int v54 = +[IMLibraryPlist isSampleFromPlistEntry:v21];
            unsigned int v55 = [v54 BOOLValue];

            v56 = +[IMLibraryPlist folderNameFromPlistEntry:v43];
            BOOL v57 = v56 != 0;

            id v58 = +[IMLibraryPlist folderNameFromPlistEntry:v21];

            if (v58) {
              char v59 = v57;
            }
            else {
              char v59 = 1;
            }
            if ((v59 & 1) == 0)
            {
              id v63 = BKLibraryLog();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                v76 = [(BKLibraryDataSourcePlist *)self identifier];
                *(_DWORD *)buf = 138543618;
                uint64_t v109 = (uint64_t)v76;
                __int16 v110 = 2112;
                v111 = (const char *)v101;
                _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "%{public}@ Item with path taking over item without path: [StoreID: %@]", buf, 0x16u);
              }
              [v92 addObject:v43];
              [v96 setObject:v21 forKey:v101];
              goto LABEL_85;
            }
            if ((v55 | v53 ^ 1))
            {
              if (![(BKLibraryDataSourcePlist *)self _isEntryFamilyPurchase:v43]
                || [(BKLibraryDataSourcePlist *)self _isEntryFamilyPurchase:v21])
              {
                v60 = BKLibraryLog();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  v80 = [(BKLibraryDataSourcePlist *)self identifier];
                  v81 = [v43 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                  v82 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                  *(_DWORD *)buf = 138544642;
                  uint64_t v109 = (uint64_t)v80;
                  __int16 v110 = 2112;
                  v111 = (const char *)v101;
                  __int16 v112 = 2112;
                  v113 = v44;
                  __int16 v114 = 2112;
                  uint64_t v115 = (uint64_t)v81;
                  __int16 v116 = 2112;
                  CFStringRef v117 = v45;
                  __int16 v118 = 2112;
                  v119 = v82;
                  _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%{public}@ Same-Version Right-Rez item already in place: [Store ID: %@] [Current: %@ -- %@] [Contender: %@ -- %@]", buf, 0x3Eu);
                }
LABEL_68:

                [v92 addObject:v21];
LABEL_85:

LABEL_86:
                goto LABEL_87;
              }
              id v48 = BKLibraryLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                v83 = [(BKLibraryDataSourcePlist *)self identifier];
                v84 = [v43 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                v85 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                *(_DWORD *)buf = 138544130;
                uint64_t v109 = (uint64_t)v83;
                __int16 v110 = 2112;
                v111 = (const char *)v101;
                __int16 v112 = 2112;
                v113 = v84;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v85;
                _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%{public}@ Non-family purchase item taking over: [Store ID: %@] [Older: %@] [Newer: %@]", buf, 0x2Au);
              }
            }
            else
            {
              id v48 = BKLibraryLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                v77 = [(BKLibraryDataSourcePlist *)self identifier];
                v78 = [v43 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                v79 = [v21 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
                *(_DWORD *)buf = 138544642;
                uint64_t v109 = (uint64_t)v77;
                __int16 v110 = 2112;
                v111 = (const char *)v101;
                __int16 v112 = 2112;
                v113 = v44;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v78;
                __int16 v116 = 2112;
                CFStringRef v117 = v45;
                __int16 v118 = 2112;
                v119 = v79;
                _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item (same version) taking over sample: [Store ID: %@] [Older: %@ -- %@] [Newer: %@ -- %@]", buf, 0x3Eu);
              }
            }
LABEL_84:

            [v92 addObject:v43];
            [v96 setObject:v21 forKey:v101];
            goto LABEL_85;
          }
          [v96 setObject:v21 forKey:v101];
          goto LABEL_86;
        }
LABEL_88:
        id v19 = (char *)v19 + 1;
      }
      while (v100 != v19);
      id v86 = [obj countByEnumeratingWithState:&v104 objects:v120 count:16];
      id v100 = v86;
    }
    while (v86);
  }

  [(BKLibraryDataSourcePlist *)self q_deletePlistEntries:v92];
  v87 = [v96 allValues];
  [v91 addObjectsFromArray:v87];

  return v91;
}

- (void)q_deletePlistEntries:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v10), (void)v14);
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    char v12 = [(BKLibraryDataSourcePlist *)self plist];
    uint64_t v13 = [v5 allObjects];
    [v12 addDeletedFiles:v13];

    [(BKLibraryDataSourcePlist *)self q_asyncRemovePlistPaths:v5 completion:0];
  }
}

- (NSFileManager)fileManager
{
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    id v4 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    unsigned __int8 v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }

  return fileManager;
}

- (BOOL)_isFamilyPurchaseAtPath:(id)a3
{
  id v4 = a3;
  id v6 = [v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  id v7 = +[NSDictionary dictionaryWithContentsOfFile:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    uint64_t v10 = [v9 valueForKeyPath:@"accountInfo.FamilyID"];
    BOOL v11 = [v9 valueForKeyPath:@"accountInfo.DSPersonID"];
    char v12 = [v9 valueForKeyPath:@"accountInfo.PurchaserID"];
    uint64_t v13 = [(BKLibraryDataSourcePlist *)self libraryManager];
    unsigned __int8 v14 = [v13 isFamilyPurchaseWithFamilyID:v10 purchaserDSID:v12 downloaderDSID:v11];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)_isEntryFamilyPurchase:(id)a3
{
  id v4 = [a3 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
  LOBYTE(self) = [(BKLibraryDataSourcePlist *)self _isFamilyPurchaseAtPath:v4];

  return (char)self;
}

- (void)_setPropertiesOfAsset:(id)a3 withPlistEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(BKLibraryDataSourcePlist *)self _isSupplementalPDFFromPlistEntry:v7];
  uint64_t v9 = +[IMLibraryPlist storeIdFromPlistEntry:v7];
  uint64_t v10 = (void *)v9;
  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = (void *)v9;
  }
  uint64_t v12 = v9;
  v90 = self;
  if (!v11)
  {
    if ([(BKLibraryDataSourcePlist *)self _contentTypeFromPlistEntry:v7 logFailure:0] != 3)goto LABEL_9; {
    uint64_t v12 = +[IMLibraryPlist uniqueIdFromPlistEntry:v7];
    }
    uint64_t v13 = BKLibraryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1007F13A0();
    }

    if (!v12)
    {
LABEL_9:
      unsigned __int8 v14 = v10;
      long long v15 = BKLibraryLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1007F1368(v15, v16, v17, v18, v19, v20, v21, v22);
      }

      objc_opt_class();
      long long v23 = [v7 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
      id v24 = BUDynamicCast();

      if (v24)
      {
        long long v25 = [(BKLibraryDataSourcePlist *)self fullPathToAssetID];
        uint64_t v26 = [v25 objectForKey:v24];

        if (v26)
        {
          uint64_t v27 = v26;
          id v28 = BKLibraryLog();
          uint64_t v10 = v14;
          uint64_t v12 = v27;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_1007F12C8();
          }
          goto LABEL_32;
        }
        id v92 = 0;
        uint64_t v40 = +[BLLibraryUtility identifierFromBookPath:v24 allowHash:0 allowStoreID:0 error:&v92];
        id v41 = v92;
        unsigned __int8 v42 = BKLibraryLog();
        BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG);
        uint64_t v10 = v14;
        uint64_t v12 = v40;
        if (v40 && !v41)
        {
          if (v43) {
            sub_1007F1260();
          }

          id v28 = [(BKLibraryDataSourcePlist *)v90 fullPathToAssetID];
          [v28 setObject:v40 forKey:v24];
          goto LABEL_32;
        }
        if (v43) {
          sub_1007F11F8();
        }

        self = v90;
        if (v12) {
          goto LABEL_33;
        }
      }
      else
      {
        __int16 v29 = BKLibraryLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_1007F1330(v29, v30, v31, v32, v33, v34, v35, v36);
        }

        uint64_t v10 = v14;
      }
      uint64_t v12 = +[IMLibraryPlist uniqueIdFromPlistEntry:v7];
      id v37 = BKLibraryLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_1007F1190();
      }

      if (!v24 || v12) {
        goto LABEL_33;
      }
      id v91 = 0;
      uint64_t v12 = +[BLLibraryUtility identifierFromBookPath:v24 allowHash:1 allowStoreID:0 error:&v91];
      id v28 = v91;
      id v38 = BKLibraryLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        sub_1007F1128();
      }

      if (v12 && !v28)
      {
        id v39 = [(BKLibraryDataSourcePlist *)self fullPathToAssetID];
        [v39 setObject:v12 forKey:v24];
      }
LABEL_32:

LABEL_33:
    }
  }
  v44 = +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:v7];
  if (v44)
  {
    id v45 = v44;
    if (![v44 isEqualToString:&stru_100A70340]) {
      goto LABEL_46;
    }
    BCReportAssertionFailureWithMessage();

    id v46 = BKLibraryLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      sub_1007F10F0(v46, v47, v48, v49, v50, v51, v52, v53);
    }
    id v45 = 0;
  }
  else if (v8)
  {
    id v45 = v10;
    id v46 = BKLibraryLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      sub_1007F1020();
    }
  }
  else
  {
    id v46 = +[IMLibraryPlist permlinkFromPlistEntry:v7];
    id v45 = [v46 identifierFromPermlink];
    unsigned int v54 = BKLibraryLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      sub_1007F1088();
    }
  }
LABEL_46:
  unsigned int v55 = +[BKLibrarySharedContainerManager sharedInstance];
  v56 = [v55 sharedURLForEntry:v7];

  BOOL v57 = +[IMLibraryPlist folderNameFromPlistEntry:v7];
  if (v57)
  {
    [v6 setIsRestoring:0];
  }
  else
  {
    id v58 = +[IMLibraryPlist backupFolderNameFromPlistEntry:v7];
    [v6 setIsRestoring:v58 != 0];
  }
  char v59 = +[IMLibraryPlist backupFolderNameFromPlistEntry:v7];

  if (v59) {
    [v6 setGeneration:0x7FFFFFFFFFFFFFFFLL];
  }
  if ([v6 isRestoring]) {
    uint64_t v60 = 2;
  }
  else {
    uint64_t v60 = 1;
  }
  [v6 setState:v60];
  if (v56)
  {
    [v6 setUrl:v56];
  }
  else
  {
    uint64_t v61 = [v7 objectForKeyedSubscript:@"BKLibraryDataSourcePlist-FullPath"];
    if (v61)
    {
      v62 = [v7 objectForKeyedSubscript:@"BKLibraryDataSourcePlist-FullPath"];
      id v63 = +[NSURL fileURLWithPath:v62];
      [v6 setUrl:v63];
    }
    else
    {
      [v6 setUrl:0];
    }
  }
  [v6 setStoreID:v10];
  id v64 = +[IMLibraryPlist storePlaylistIdFromPlistEntry:v7];
  [v6 setStorePlaylistID:v64];

  [v6 setSupplementalContent:[IMLibraryPlist isSupplementalContentFromPlistEntry:v7]];
  [v6 setAssetID:v12];
  [v6 setTemporaryAssetID:v45];
  id v65 = +[IMLibraryPlist authorFromPlistEntry:v7];
  [v6 setAuthor:v65];

  long long v66 = +[IMLibraryPlist sortAuthorFromPlistEntry:v7];
  [v6 setSortAuthor:v66];
  uint64_t v67 = +[IMLibraryPlist titleFromPlistEntry:v7];
  [v6 setTitle:v67];

  long long v68 = +[IMLibraryPlist sortTitleFromPlistEntry:v7];
  if (![v68 length])
  {
    uint64_t v69 = [v6 title];

    long long v68 = (void *)v69;
  }
  v89 = (void *)v12;
  [v6 setSortTitle:v68];
  v70 = [v6 title];
  if ([v70 length]) {
    goto LABEL_65;
  }
  [v6 sortTitle];
  v72 = v71 = v10;
  id v73 = [v72 length];

  uint64_t v10 = v71;
  if (v73)
  {
    v70 = [v6 sortTitle];
    [v6 setTitle:v70];
LABEL_65:
  }
  v74 = +[IMLibraryPlist genreFromPlistEntry:v7];
  [v6 setGenre:v74];

  v75 = [(BKLibraryDataSourcePlist *)v90 identifier];
  [v6 setDataSourceIdentifier:v75];

  [v6 setContentType:[v90 _contentTypeFromPlistEntry:v7 logFailure:1]];
  v76 = +[IMLibraryPlist isSampleFromPlistEntry:v7];
  [v6 setSample:[v76 BOOLValue]];

  v77 = +[IMLibraryPlist isProofedAssetFromPlistEntry:v7];
  [v6 setProof:[v77 BOOLValue]];

  v78 = +[IMLibraryPlist isExplicitContentFromPlistEntry:v7];
  [v6 setIsExplicit:v78];

  v79 = +[IMLibraryPlist isEphemeralFromPlistEntry:v7];
  [v6 setEphemeral:[v79 BOOLValue]];

  v80 = +[IMLibraryPlist publicationVersionNumberFromPlistEntry:v7];
  [v6 setVersionNumber:v80];

  v81 = +[IMLibraryPlist humanReadablePublicationVersionFromPlistEntry:v7];
  [v6 setVersionNumberHumanReadable:v81];

  v82 = +[IMLibraryPlist scrollDirectionFromPlistEntry:v7];
  v83 = v82;
  if (v82
    && (([v82 isEqualToString:@"horizontal"] & 1) != 0
     || [v83 isEqualToString:@"vertical"]))
  {
    [v6 setScrollDirection:v83];
  }
  v84 = +[IMLibraryPlist languageFromPlistEntry:v7];
  [v6 setLanguage:v84];

  v85 = +[IMLibraryPlist coverWritingModeFromPlistEntry:v7];
  [v6 setCoverWritingMode:v85];

  id v86 = +[IMLibraryPlist pageProgressionFromPlistEntry:v7];
  [v6 setPageProgressionDirection:v86];

  v87 = +[IMLibraryPlist permlinkFromPlistEntry:v7];
  [v6 setPermlink:v87];

  v88 = +[IMLibraryPlist importDateFromPlistEntry:v7];
  if (v88) {
    [v6 setPurchaseDate:v88];
  }
}

- (void)q_processAssetStateChanges:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v30 = (char *)[obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v30)
  {
    uint64_t v6 = *(void *)v35;
    id v7 = &OBJC_METACLASS___BKLibraryCollectionsListMetrics;
    __int16 v29 = self;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        uint64_t v9 = BUDynamicCast();
        uint64_t v10 = v9;
        if (v9)
        {
          BOOL v11 = [v9 assetID];
          uint64_t v12 = [v10 temporaryAssetID];
          if ([v11 length])
          {
            uint64_t v13 = [(BKLibraryDataSourcePlist *)self restoringFromBackupAssetIDs];
            unsigned int v14 = [v13 containsObject:v11];
          }
          else
          {
            unsigned int v14 = 0;
          }
          if ([v12 length])
          {
            [(BKLibraryDataSourcePlist *)self restoringFromBackupTemporaryAssetIDs];
            long long v15 = v7;
            uint64_t v16 = v6;
            uint64_t v18 = v17 = v5;
            unsigned int v19 = [v18 containsObject:v12];

            unsigned __int8 v5 = v17;
            uint64_t v6 = v16;
            id v7 = v15;
          }
          else
          {
            unsigned int v19 = 0;
          }
          int v20 = v14 | v19;
          if ([v10 state] != 1 || v20 == 0 || v11 == 0)
          {
            if ([v10 state] == 2) {
              char v23 = v20;
            }
            else {
              char v23 = 1;
            }
            self = v29;
            if ((v23 & 1) == 0)
            {
              if (v11)
              {
                [v10 setGeneration:0x7FFFFFFFFFFFFFFFLL];
                [v5 addObject:v10];
                id v24 = [(BKLibraryDataSourcePlist *)v29 restoringFromBackupAssetIDs];
                [v24 addObject:v11];

                if (v12)
                {
                  long long v25 = [(BKLibraryDataSourcePlist *)v29 restoringFromBackupTemporaryAssetIDs];
                  [v25 addObject:v12];
                  goto LABEL_30;
                }
              }
            }
          }
          else
          {
            [v10 setGeneration:0x7FFFFFFFFFFFFFFFLL];
            [v5 addObject:v10];
            self = v29;
            uint64_t v26 = [(BKLibraryDataSourcePlist *)v29 restoringFromBackupAssetIDs];
            [v26 removeObject:v11];

            if ([v12 length])
            {
              long long v25 = [(BKLibraryDataSourcePlist *)v29 restoringFromBackupTemporaryAssetIDs];
              [v25 removeObject:v12];
LABEL_30:
            }
          }
        }
      }
      uint64_t v30 = (char *)[obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v30);
  }

  if ([v5 count])
  {
    uint64_t v27 = [(BKLibraryDataSourcePlist *)self libraryManager];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10020583C;
    v31[3] = &unk_100A43DD8;
    id v32 = v5;
    uint64_t v33 = self;
    [v27 addCustomOperationBlock:v31];
  }
}

- (signed)_contentTypeFromPlistEntry:(id)a3 logFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = +[IMLibraryPlist folderNameFromPlistEntry:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[IMLibraryPlist backupFolderNameFromPlistEntry:v5];
  }
  uint64_t v9 = v8;

  if ([v9 length])
  {
    int v10 = +[BKAssetUtilities contentTypeForPath:v9];
  }
  else
  {
    objc_opt_class();
    BOOL v11 = [v5 objectForKey:@"AssetType"];
    uint64_t v12 = BUDynamicCast();

    int v10 = 4 * ([v12 length] != 0);
  }
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = !v4;
  }
  if (!v13)
  {
    unsigned int v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1007F1408();
    }
  }
  return v10;
}

- (void)deleteAssetIDs:(id)a3 completion:(id)a4
{
}

- (void)_deleteAssetIDs:(id)a3 assetIDToPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[NSMutableSet set];
  uint64_t v12 = +[NSMutableSet set];
  BOOL v13 = +[NSMutableArray array];
  unsigned int v14 = [(BKLibraryDataSourcePlist *)self assetsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100205C00;
  block[3] = &unk_100A4BF18;
  void block[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = v12;
  id v25 = v11;
  id v26 = v13;
  id v27 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v9;
  id v20 = v8;
  dispatch_async(v14, block);
}

- (id)booksRootPath
{
  v2 = [(BKLibraryDataSourcePlist *)self plist];
  unsigned __int8 v3 = [v2 path];
  BOOL v4 = [v3 stringByDeletingLastPathComponent];

  return v4;
}

- (BOOL)removeFileWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[AEPdfCache sharedInstance];
  [v7 removeCacheObjectForURL:v6];

  id v8 = [(BKLibraryDataSourcePlist *)self fileManager];
  LOBYTE(a4) = [v8 removeItemAtURL:v6 error:a4];

  return (char)a4;
}

- (void)q_plistWasChangedOnDisk
{
  unsigned __int8 v3 = [(BKLibraryDataSourcePlist *)self libraryManager];
  [v3 reloadDataSource:self completion:0];

  BOOL v4 = [(BKLibraryDataSourcePlist *)self didWritePlistHandler];
  if (v4)
  {
    id v5 = v4;
    v4[2]();
    BOOL v4 = v5;
  }
}

- (BOOL)q_rewritePlistDictionary:(id)a3 path:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v12 = BKLibraryLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007F1470();
    }

    goto LABEL_9;
  }
  id v10 = [(BKLibraryDataSourcePlist *)self currentQueueGeneration];
  if (v10 == (void *)[(BKLibraryDataSourcePlist *)self startQueueGeneration])
  {
    unsigned int v11 = [v8 writeToFile:v9 atomically:1];
    if (v11 && v5)
    {
      [(BKLibraryDataSourcePlist *)self q_plistWasChangedOnDisk];
LABEL_9:
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    BOOL v13 = BKLibraryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1007F14FC();
    }

    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)q_asyncRemovePlistAssets:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100206634;
  v9[3] = &unk_100A4BF40;
  id v10 = a3;
  id v8 = v10;
  [(BKLibraryDataSourcePlist *)self q_asyncRemovePlistEntriesMatching:v9 notify:v6 completion:a5];
}

- (void)q_asyncRemovePlistPaths:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020672C;
  v7[3] = &unk_100A4BF40;
  id v8 = a3;
  id v6 = v8;
  [(BKLibraryDataSourcePlist *)self q_asyncRemovePlistEntriesMatching:v7 notify:1 completion:a4];
}

- (void)q_asyncRemovePlistEntriesMatching:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100206848;
  v9[3] = &unk_100A4BF90;
  void v9[4] = self;
  id v10 = a3;
  BOOL v12 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)q_asyncReplacePlistEntries:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002070E4;
  v9[3] = &unk_100A4BF90;
  void v9[4] = self;
  id v10 = a3;
  BOOL v12 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)q_asyncAddAssetDictionaries:(id)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002078F4;
  block[3] = &unk_100A45338;
  void block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)plistAssetWithAsset:(id)a3 andURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKPlistAsset newBlankAsset];
  id v8 = [v6 assetID];
  [v7 setAssetID:v8];

  id v9 = [v6 storeID];
  [v7 setStoreID:v9];

  id v10 = [v6 storePlaylistID];
  [v7 setStorePlaylistID:v10];

  [v7 setSupplementalContent:[v6 isSupplementalContent]];
  [v7 setUrl:v5];

  id v11 = [v6 title];
  [v7 setTitle:v11];

  BOOL v12 = [v6 sortTitle];
  [v7 setSortTitle:v12];

  BOOL v13 = [v6 author];
  [v7 setAuthor:v13];

  unsigned int v14 = [v6 sortAuthor];

  [v7 setSortAuthor:v14];

  return v7;
}

- (void)prioritizeAssetRestoreWithAssetID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100208190;
    v6[3] = &unk_100A48D90;
    v6[4] = self;
    [(BKLibraryDataSourcePlist *)self fetchAssetsWithIDs:v5 completion:v6];
  }
}

- (void)_prioritizeRestorePlistAsset:(id)a3
{
  id v4 = a3;
  if ([v4 isRestoring])
  {
    id v5 = [v4 temporaryAssetID];
    if (v5)
    {
      id v6 = objc_opt_new();
      [v6 prioritizeAsset:v5 forDataclass:@"Book"];
      id v7 = BKLibraryLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [(BKLibraryDataSourcePlist *)self identifier];
        id v9 = [v4 assetID];
        int v10 = 138412546;
        id v11 = v8;
        __int16 v12 = 2112;
        BOOL v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Prioritizing asset: %@ %@", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      BCReportAssertionFailureWithMessage();
    }
  }
  else
  {
    id v5 = BKLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1007F160C();
    }
  }
}

- (int64_t)currentQueueGeneration
{
  return self->_currentQueueGeneration;
}

- (void)setCurrentQueueGeneration:(int64_t)a3
{
  self->_currentQueueGeneration = a3;
}

- (id)didWritePlistHandler
{
  return self->_didWritePlistHandler;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (OS_dispatch_queue)itunesuQueue
{
  return self->_itunesuQueue;
}

- (OS_dispatch_queue)updateAssetMetadataQueue
{
  return self->_updateAssetMetadataQueue;
}

- (BKAssetMetadataProvider)assetMetadataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetMetadataProvider);

  return (BKAssetMetadataProvider *)WeakRetained;
}

- (void)setAssetMetadataProvider:(id)a3
{
}

- (BKAssetMetadataCaching)assetMetadataCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetMetadataCache);

  return (BKAssetMetadataCaching *)WeakRetained;
}

- (void)setAssetMetadataCache:(id)a3
{
}

- (BKAssetCoverImageHelping)coverImageHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverImageHelper);

  return (BKAssetCoverImageHelping *)WeakRetained;
}

- (void)setCoverImageHelper:(id)a3
{
}

- (NSCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
}

- (NSCache)assetCacheByTemporaryAssetID
{
  return self->_assetCacheByTemporaryAssetID;
}

- (void)setAssetCacheByTemporaryAssetID:(id)a3
{
}

- (NSMutableSet)restoringFromBackupAssetIDs
{
  return self->_restoringFromBackupAssetIDs;
}

- (void)setRestoringFromBackupAssetIDs:(id)a3
{
}

- (NSMutableSet)restoringFromBackupTemporaryAssetIDs
{
  return self->_restoringFromBackupTemporaryAssetIDs;
}

- (void)setRestoringFromBackupTemporaryAssetIDs:(id)a3
{
}

- (NSString)lastFetchDigest
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFetchDigest:(id)a3
{
}

- (void)setLastReloadDigest:(id)a3
{
}

- (int64_t)startQueueGeneration
{
  return self->_startQueueGeneration;
}

- (void)setStartQueueGeneration:(int64_t)a3
{
  self->_startQueueGeneration = a3;
}

- (BOOL)backgroundTaskCancelled
{
  return self->_backgroundTaskCancelled;
}

- (void)setBackgroundTaskCancelled:(BOOL)a3
{
  self->_backgroundTaskCancelled = a3;
}

- (BOOL)writesFullPaths
{
  return self->_writesFullPaths;
}

- (void)setWritesFullPaths:(BOOL)a3
{
  self->_writesFullPaths = a3;
}

- (NSMutableDictionary)fullPathToAssetID
{
  return self->_fullPathToAssetID;
}

- (void)setFullPathToAssetID:(id)a3
{
}

- (OS_dispatch_queue)assetsQueue
{
  return self->_assetsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsQueue, 0);
  objc_storeStrong((id *)&self->_fullPathToAssetID, 0);
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_lastReloadDigest, 0);
  objc_storeStrong((id *)&self->_lastFetchDigest, 0);
  objc_storeStrong((id *)&self->_restoringFromBackupTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_restoringFromBackupAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetCacheByTemporaryAssetID, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_destroyWeak((id *)&self->_coverImageHelper);
  objc_destroyWeak((id *)&self->_assetMetadataCache);
  objc_destroyWeak((id *)&self->_assetMetadataProvider);
  objc_storeStrong((id *)&self->_updateAssetMetadataQueue, 0);
  objc_storeStrong((id *)&self->_itunesuQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong(&self->_didWritePlistHandler, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end