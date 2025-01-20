@interface BKLibraryDataSourceUbiquityiOS
+ (id)mapUbiquityMetadataToPlistMetadata:(id)a3;
- (BKAssetCoverImageHelping)coverImageHelper;
- (BKAssetMetadataCaching)assetMetadataCache;
- (BKLibraryDataSourceUbiquityiOS)initWithUbiquityStatusMonitor:(id)a3 assetMetadataCache:(id)a4 coverImageHelper:(id)a5 imageSource:(id)a6;
- (BKLibraryImageSource)imageSource;
- (BKLibraryManager)libraryManager;
- (BKUbiquitousBooksUploadReporting)uploadReporter;
- (BOOL)_assetHasChanged:(id)a3 updatedAsset:(id)a4;
- (BOOL)_deleteFromAllDevicesURL:(id)a3;
- (BOOL)_evictFromDeviceURL:(id)a3 assetID:(id)a4;
- (BOOL)_isFileExistsError:(id)a3;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)emptyCacheDirectory;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)handledInitialMetadataQuery;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)iq_downloadingAssetID:(id)a3;
- (BOOL)iq_updateThumbnailIfNeededForAssetID:(id)a3;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)shouldArchivePathFixupRevision;
- (BOOL)skipThumbnailGeneration;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (BUCoalescingCallBlock)coalescedPersistCachedValues;
- (IMUbiquityDocumentsObserver)ubiquityDocumentsObserver;
- (IMUbiquityStatusMonitor)ubiquityStatusMonitor;
- (NSHashTable)cq_metadataQueryHandlingObservers;
- (NSMutableDictionary)iq_assetFromAssetID;
- (NSMutableDictionary)iq_assetIDFromURL;
- (NSMutableDictionary)iq_counterpartURLFromAssetID;
- (NSMutableDictionary)iq_downloadingAssetIDsFromParentAssetID;
- (NSMutableDictionary)iq_downloadingProgressFromAssetID;
- (NSMutableDictionary)iq_insertionDateFromAssetID;
- (NSMutableDictionary)iq_urlFromAssetID;
- (NSMutableSet)iq_downloadingAssetIDs;
- (NSMutableSet)iq_uploadingAssetIDs;
- (NSOperationQueue)uncompressQueue;
- (NSString)identifier;
- (NSURL)unzippedCounterpartCacheURL;
- (OS_dispatch_queue)completionHandlerQueue;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_queue)persistToDiskQueue;
- (OS_dispatch_queue)processMetadataQueryQueue;
- (OS_dispatch_queue)processUbiquityMetadataQueue;
- (OS_dispatch_queue)updateAssetMetadataQueue;
- (OS_dispatch_queue)uploadDownloadQueue;
- (OS_dispatch_queue)workQueue;
- (id)_counterpartURLForURL:(id)a3;
- (id)_coverCacheURLsForAssetIDs:(id)a3;
- (id)_persistedInfoURL;
- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3;
- (id)iq_createTempUbiquityAssetFromMetadataDict:(id)a3;
- (id)iq_createUbiquityAssetFromMetadataDict:(id)a3;
- (id)iq_downloadProgressStatusesWithAssetID:(id)a3 item:(id)a4;
- (id)iq_overallDownloadProgressValueForAssetID:(id)a3;
- (id)madeUbiquitousNotifyBlock;
- (id)p_moveToUbiquityItemAtURL:(id)a3 preferredFileNameWithoutPathExtension:(id)a4;
- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5;
- (id)udq_reportDownloadProgressIfNeeded:(id)a3;
- (id)umq_metadataDictsFromUbiquityDocumentItems:(id)a3;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (unint64_t)propagateDataProperties;
- (void)_addAssetsToCoverCacheManager:(id)a3;
- (void)_addLocalAssetsForURLs:(id)a3 completion:(id)a4;
- (void)_addSupplementalContentMetadataFromAsset:(id)a3 toExistingAsset:(id)a4;
- (void)_loadCounterpartInfo;
- (void)_makeBooksUbiquitous:(id)a3 completion:(id)a4;
- (void)_readPersistedInfoFromDisk;
- (void)_removeAssetIDsFromCoverCacheManager:(id)a3;
- (void)_removeCounterpartsForAssetIDs:(id)a3;
- (void)_reportProgressWithItems:(id)a3;
- (void)_requestReOpenWithConflictDictionary:(id)a3 requestOpenAssetIDs:(id)a4;
- (void)_triggerDownload:(id)a3 assetID:(id)a4;
- (void)_unclaimAssetIDs:(id)a3;
- (void)_updateUbiquityAssetID:(id)a3 withMetadata:(id)a4;
- (void)addMetadataQueryHandlingObserver:(id)a3;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)cb_persistInfoToDisk;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)extractOperationDidFail:(id)a3;
- (void)extractOperationDidFinish:(id)a3;
- (void)fetchAllUbiquitousBooksWithCompletion:(id)a3;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)handleFileGenerationChangedNotification:(id)a3;
- (void)iq_addOrUpdateDownloadingAssetID:(id)a3 progressValue:(double)a4;
- (void)iq_clearAllCachesAndPersistentInfoFromDisk;
- (void)iq_clearCachesForAssetIDs:(id)a3;
- (void)iq_populateAssetIDFromURLDictionary;
- (void)iq_purgeUnzippedBooksCacheIfNeededExceptURL:(id)a3;
- (void)iq_removeDownloadingAssetID:(id)a3;
- (void)iq_setUbiquityDocumentMonitoringEnabled:(BOOL)a3;
- (void)iq_updateCachedAssetGeneration:(id)a3 url:(id)a4;
- (void)makeBooksUbiquitous:(id)a3 completion:(id)a4;
- (void)mq_batchOfItemsDidBecomeAvailable:(id)a3;
- (void)mq_batchOfItemsDidChange:(id)a3;
- (void)mq_itemsDidBecomeAvailable:(id)a3;
- (void)mq_itemsDidBecomeUnavailable:(id)a3;
- (void)mq_itemsDidChange:(id)a3;
- (void)p_schedulePersistInfoToDisk;
- (void)removeMetadataQueryHandlingObserver:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAssetMetadataCache:(id)a3;
- (void)setCoalescedPersistCachedValues:(id)a3;
- (void)setCompletionHandlerQueue:(id)a3;
- (void)setCoverImageHelper:(id)a3;
- (void)setCq_metadataQueryHandlingObservers:(id)a3;
- (void)setEmptyCacheDirectory:(BOOL)a3;
- (void)setHandledInitialMetadataQuery:(BOOL)a3;
- (void)setImageSource:(id)a3;
- (void)setIq_assetFromAssetID:(id)a3;
- (void)setIq_assetIDFromURL:(id)a3;
- (void)setIq_counterpartURLFromAssetID:(id)a3;
- (void)setIq_downloadingAssetIDs:(id)a3;
- (void)setIq_downloadingAssetIDsFromParentAssetID:(id)a3;
- (void)setIq_downloadingProgressFromAssetID:(id)a3;
- (void)setIq_insertionDateFromAssetID:(id)a3;
- (void)setIq_uploadingAssetIDs:(id)a3;
- (void)setIq_urlFromAssetID:(id)a3;
- (void)setIvarQueue:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setMadeUbiquitousNotifyBlock:(id)a3;
- (void)setPersistToDiskQueue:(id)a3;
- (void)setProcessMetadataQueryQueue:(id)a3;
- (void)setProcessUbiquityMetadataQueue:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setShouldArchivePathFixupRevision:(BOOL)a3;
- (void)setSkipThumbnailGeneration:(BOOL)a3;
- (void)setUbiquityDocumentsObserver:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)setUncompressQueue:(id)a3;
- (void)setUpdateAssetMetadataQueue:(id)a3;
- (void)setUploadDownloadQueue:(id)a3;
- (void)setUploadReporter:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)ubiquityDocumentsObserver:(id)a3 didLoadWithItems:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeAvailable:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeUnavailable:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidChange:(id)a4;
- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4;
- (void)udq_reportUploadProgressIfNeeded:(id)a3 completedAssetIDs:(id)a4 failedAssets:(id)a5;
- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5;
@end

@implementation BKLibraryDataSourceUbiquityiOS

- (int64_t)rank
{
  return self->_rank;
}

- (BKLibraryDataSourceUbiquityiOS)initWithUbiquityStatusMonitor:(id)a3 assetMetadataCache:(id)a4 coverImageHelper:(id)a5 imageSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  kdebug_trace();
  v15 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "initWithUbiquityStatusMonitor", buf, 2u);
  }

  v77.receiver = self;
  v77.super_class = (Class)BKLibraryDataSourceUbiquityiOS;
  v16 = [(BKLibraryDataSourceUbiquityiOS *)&v77 init];
  if (v16)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.ivarQueue", v17);
    ivarQueue = v16->_ivarQueue;
    v16->_ivarQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.uploadDownloadQueue", v20);
    uploadDownloadQueue = v16->_uploadDownloadQueue;
    v16->_uploadDownloadQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.workQueue", v23);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.updateAssetMetadataQueue", v26);
    updateAssetMetadataQueue = v16->_updateAssetMetadataQueue;
    v16->_updateAssetMetadataQueue = (OS_dispatch_queue *)v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.persistToDiskQueue", v29);
    persistToDiskQueue = v16->_persistToDiskQueue;
    v16->_persistToDiskQueue = (OS_dispatch_queue *)v30;

    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.processMetadataQueryQueue", v32);
    processMetadataQueryQueue = v16->_processMetadataQueryQueue;
    v16->_processMetadataQueryQueue = (OS_dispatch_queue *)v33;

    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.processUbiquityMetadataQueue", v35);
    processUbiquityMetadataQueue = v16->_processUbiquityMetadataQueue;
    v16->_processUbiquityMetadataQueue = (OS_dispatch_queue *)v36;

    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.completionHandlerQueue", v38);
    completionHandlerQueue = v16->_completionHandlerQueue;
    v16->_completionHandlerQueue = (OS_dispatch_queue *)v39;

    uint64_t v41 = objc_opt_new();
    uncompressQueue = v16->_uncompressQueue;
    v16->_uncompressQueue = (NSOperationQueue *)v41;

    [(NSOperationQueue *)v16->_uncompressQueue setMaxConcurrentOperationCount:1];
    objc_storeWeak((id *)&v16->_imageSource, v14);
    if (!v11) {
      BCReportAssertionFailureWithMessage();
    }
    objc_storeStrong((id *)&v16->_ubiquityStatusMonitor, a3);
    [v11 addObserver:v16];
    v43 = +[NSUserDefaults standardUserDefaults];
    v16->_skipThumbnailGeneration = [v43 BOOLForKey:@"BKSkipUbiquityThumbnailing"];

    uint64_t v44 = objc_opt_new();
    iq_urlFromAssetID = v16->_iq_urlFromAssetID;
    v16->_iq_urlFromAssetID = (NSMutableDictionary *)v44;

    uint64_t v46 = objc_opt_new();
    iq_counterpartURLFromAssetID = v16->_iq_counterpartURLFromAssetID;
    v16->_iq_counterpartURLFromAssetID = (NSMutableDictionary *)v46;

    uint64_t v48 = objc_opt_new();
    iq_assetIDFromURL = v16->_iq_assetIDFromURL;
    v16->_iq_assetIDFromURL = (NSMutableDictionary *)v48;

    uint64_t v50 = objc_opt_new();
    iq_assetFromAssetID = v16->_iq_assetFromAssetID;
    v16->_iq_assetFromAssetID = (NSMutableDictionary *)v50;

    uint64_t v52 = objc_opt_new();
    iq_insertionDateFromAssetID = v16->_iq_insertionDateFromAssetID;
    v16->_iq_insertionDateFromAssetID = (NSMutableDictionary *)v52;

    uint64_t v54 = objc_opt_new();
    iq_uploadingAssetIDs = v16->_iq_uploadingAssetIDs;
    v16->_iq_uploadingAssetIDs = (NSMutableSet *)v54;

    uint64_t v56 = objc_opt_new();
    iq_downloadingProgressFromAssetID = v16->_iq_downloadingProgressFromAssetID;
    v16->_iq_downloadingProgressFromAssetID = (NSMutableDictionary *)v56;

    uint64_t v58 = objc_opt_new();
    iq_downloadingAssetIDsFromParentAssetID = v16->_iq_downloadingAssetIDsFromParentAssetID;
    v16->_iq_downloadingAssetIDsFromParentAssetID = (NSMutableDictionary *)v58;

    uint64_t v60 = +[NSHashTable hashTableWithOptions:517];
    cq_metadataQueryHandlingObservers = v16->_cq_metadataQueryHandlingObservers;
    v16->_cq_metadataQueryHandlingObservers = (NSHashTable *)v60;

    objc_storeWeak((id *)&v16->_assetMetadataCache, v12);
    objc_storeWeak((id *)&v16->_coverImageHelper, v13);
    v62 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v63 = [v62 lastObject];

    v64 = [v63 stringByAppendingPathComponent:@"BKLibraryDataSourceUbiquityiOS"];

    v65 = [v64 stringByAppendingPathComponent:@"unzipped-books"];

    uint64_t v66 = +[NSURL fileURLWithPath:v65];
    unzippedCounterpartCacheURL = v16->_unzippedCounterpartCacheURL;
    v16->_unzippedCounterpartCacheURL = (NSURL *)v66;

    v68 = +[NSFileManager defaultManager];
    if (([v68 fileExistsAtPath:v65] & 1) == 0)
    {
      v16->_emptyCacheDirectory = 1;
      [v68 createDirectoryAtPath:v65 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v69 = objc_alloc((Class)BUCoalescingCallBlock);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1001166DC;
    v75[3] = &unk_100A47648;
    v70 = v16;
    v76 = v70;
    id v71 = [v69 initWithNotifyBlock:v75 blockDescription:@"BKLibraryDataSourceUbiquityiOS"];
    id v72 = v70[25];
    v70[25] = v71;

    [v70[25] setCoalescingDelay:0.5];
    v73 = +[NSNotificationCenter defaultCenter];
    [v73 addObserver:v70 selector:"handleFileGenerationChangedNotification:" name:BCUbiqityFileGenerationDidChangeNotification object:0];

    [v70 _readPersistedInfoFromDisk];
    [v70 _loadCounterpartInfo];
  }
  kdebug_trace();

  return v16;
}

- (NSURL)unzippedCounterpartCacheURL
{
  return self->_unzippedCounterpartCacheURL;
}

- (void)setUploadReporter:(id)a3
{
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setMadeUbiquitousNotifyBlock:(id)a3
{
}

- (void)setLibraryManager:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ibooks.datasource.ubiquity";
}

- (void)addMetadataQueryHandlingObserver:(id)a3
{
  id v4 = a3;
  completionHandlerQueue = self->_completionHandlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007855C;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(completionHandlerQueue, v7);
}

- (void)_readPersistedInfoFromDisk
{
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001038C;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

- (id)_persistedInfoURL
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];

  id v4 = [v3 URLByAppendingPathComponent:@"BKLibraryDataSourceUbiquityiOS" isDirectory:0];

  return v4;
}

- (void)_loadCounterpartInfo
{
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DCEC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(IMUbiquityDocumentsObserver *)self->_ubiquityDocumentsObserver tearDownQuery];
  ubiquityDocumentsObserver = self->_ubiquityDocumentsObserver;
  self->_ubiquityDocumentsObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryDataSourceUbiquityiOS;
  [(BKLibraryDataSourceUbiquityiOS *)&v5 dealloc];
}

- (void)removeMetadataQueryHandlingObserver:(id)a3
{
  id v4 = a3;
  completionHandlerQueue = self->_completionHandlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001168DC;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(completionHandlerQueue, v7);
}

- (BOOL)isEnabled
{
  return [(IMUbiquityStatusMonitor *)self->_ubiquityStatusMonitor isICloudDriveEnabled];
}

- (unint64_t)propagateDataProperties
{
  return 0x2000;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001169B8;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116C64;
  block[3] = &unk_100A45338;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(ivarQueue, block);
}

- (int64_t)coverSourceRank
{
  return 3;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a5;
  id v10 = a3;
  kdebug_trace();
  id v11 = [v10 objectForKey:@"assetID"];
  id v12 = [v10 objectForKey:@"title"];

  ivarQueue = self->_ivarQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100117128;
  v17[3] = &unk_100A476E8;
  id v18 = v11;
  v19 = self;
  CGFloat v22 = width;
  CGFloat v23 = height;
  id v20 = v12;
  id v21 = v9;
  id v14 = v9;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(ivarQueue, v17);
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v22 = [v8 count];
    __int16 v23 = 1024;
    BOOL v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "deleteAssets: count: %ld exhaustive: %d", buf, 0x12u);
  }

  id v11 = [v8 valueForKey:@"assetID"];
  id v12 = [v11 bu_arrayByRemovingNSNulls];

  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100117708;
  v16[3] = &unk_100A46160;
  id v17 = v12;
  id v18 = self;
  BOOL v20 = v6;
  id v19 = v9;
  id v14 = v9;
  id v15 = v12;
  dispatch_async(workQueue, v16);
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  kdebug_trace();
  id v9 = [v8 assetID];
  id v10 = [v8 title];

  if ([v9 length])
  {
    ivarQueue = self->_ivarQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100117CC4;
    v15[3] = &unk_100A45980;
    v15[4] = self;
    id v16 = v9;
    id v17 = v10;
    id v18 = v7;
    dispatch_async(ivarQueue, v15);
  }
  else
  {
    id v12 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007EB60C();
    }

    id v13 = (void (**)(id, void, uint64_t, void *))objc_retainBlock(v7);
    if (v13)
    {
      id v14 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorInvalidAssetError userInfo:0];
      v13[2](v13, 0, 1, v14);
    }
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 assetID];
  if ([v7 length])
  {
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100118AA8;
    block[3] = &unk_100A45338;
    void block[4] = self;
    id v13 = v7;
    id v14 = v6;
    dispatch_async(ivarQueue, block);
  }
  else
  {
    id v9 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007EB808();
    }

    id v10 = (void (**)(id, void, void *))objc_retainBlock(v6);
    if (v10)
    {
      id v11 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorInvalidAssetError userInfo:0];
      v10[2](v10, 0, v11);
    }
  }
}

- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = [a3 assetID];
  if ([v8 length])
  {
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100118ED0;
    block[3] = &unk_100A443C8;
    void block[4] = self;
    id v12 = v8;
    id v13 = v7;
    dispatch_async(ivarQueue, block);
  }
  else
  {
    id v10 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EB8AC();
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

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 1;
}

- (BOOL)canMakeAssetsLocal
{
  return 1;
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ubiquityStatusChangedToAvailableWithNewIdentity: %{public}@ oldIdentity: %{public}@", buf, 0x16u);
  }

  completionHandlerQueue = self->_completionHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011920C;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async(completionHandlerQueue, block);
}

- (void)ubiquityDocumentsObserver:(id)a3 didLoadWithItems:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011951C;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeAvailable:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119B54;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeUnavailable:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119CA0;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidChange:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119E0C;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);
}

- (id)umq_metadataDictsFromUbiquityDocumentItems:(id)a3
{
  id v3 = a3;
  id v19 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = BCMetadataXattrAssetID;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 url:v19];
        id v11 = +[BCUbiquityMetadataHelper ubiquityMetadataForURL:v10 options:-262145 needsCoordination:1];
        id v12 = [v11 mutableCopy];

        __int16 v13 = [v12 objectForKeyedSubscript:v7];
        id v14 = v13;
        if (v12 && [v13 length])
        {
          id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isLocal]);
          [v12 setObject:v15 forKeyedSubscript:@"isLocal"];

          id v16 = [v9 contentChangedDate];
          [v12 setObject:v16 forKeyedSubscript:@"contentChangedDate"];

          id v17 = [v9 contentFileSize];
          [v12 setObject:v17 forKeyedSubscript:@"contentFileSize"];

          [v12 setObject:v10 forKeyedSubscript:@"itemURL"];
          [v19 addObject:v12];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v19;
}

- (void)mq_itemsDidBecomeAvailable:(id)a3
{
  id v11 = a3;
  id v4 = [v11 count];
  if (v4)
  {
    unint64_t v5 = (unint64_t)v4;
    unint64_t v6 = 0;
    unint64_t v7 = (unint64_t)v4;
    do
    {
      unint64_t v8 = v7 - 64;
      if (v7 >= 0x40) {
        uint64_t v9 = 64;
      }
      else {
        uint64_t v9 = v7;
      }
      id v10 = [v11 subarrayWithRange:v6, v9];
      [(BKLibraryDataSourceUbiquityiOS *)self mq_batchOfItemsDidBecomeAvailable:v10];

      v6 += 64;
      unint64_t v7 = v8;
    }
    while (v6 < v5);
  }
}

- (void)mq_batchOfItemsDidBecomeAvailable:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  unint64_t v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    unint64_t v7 = [v4 valueForKey:@"url"];
    unint64_t v8 = [v7 bu_prettyDescription];
    *(_DWORD *)buf = 134218242;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mq_batchOfItemsDidBecomeAvailable: count:%ld itemURLs:(%@)", buf, 0x16u);
  }
  [(BKLibraryDataSourceUbiquityiOS *)self _reportProgressWithItems:v4];
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011A34C;
  v11[3] = &unk_100A43DD8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(processUbiquityMetadataQueue, v11);
}

- (void)mq_itemsDidBecomeUnavailable:(id)a3
{
  id v4 = a3;
  unint64_t v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mq_itemsDidBecomeUnavailable: %@", buf, 0xCu);
  }

  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011AAE0;
  block[3] = &unk_100A443C8;
  id v8 = v4;
  id v15 = v8;
  id v16 = self;
  id v9 = v6;
  id v17 = v9;
  dispatch_sync(ivarQueue, block);
  if ([v9 count])
  {
    completionHandlerQueue = self->_completionHandlerQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10011AC8C;
    v11[3] = &unk_100A43DD8;
    id v12 = v9;
    __int16 v13 = self;
    dispatch_async(completionHandlerQueue, v11);
  }
}

- (void)mq_itemsDidChange:(id)a3
{
  id v4 = a3;
  unint64_t v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    unint64_t v7 = [v4 valueForKey:@"url"];
    id v8 = [v7 bu_prettyDescription];
    int v16 = 134218242;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mq_itemsDidChange: count: %lu, items:%@", (uint8_t *)&v16, 0x16u);
  }
  id v9 = [v4 count];
  if (v9)
  {
    unint64_t v10 = (unint64_t)v9;
    unint64_t v11 = 0;
    unint64_t v12 = (unint64_t)v9;
    do
    {
      unint64_t v13 = v12 - 64;
      if (v12 >= 0x40) {
        uint64_t v14 = 64;
      }
      else {
        uint64_t v14 = v12;
      }
      id v15 = [v4 subarrayWithRange:v11, v14];
      [(BKLibraryDataSourceUbiquityiOS *)self mq_batchOfItemsDidChange:v15];

      v11 += 64;
      unint64_t v12 = v13;
    }
    while (v11 < v10);
  }
}

- (void)mq_batchOfItemsDidChange:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  unint64_t v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 valueForKey:@"url"];
    *(_DWORD *)buf = 138412290;
    unint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mq_batchOfItemsDidChange: %@", buf, 0xCu);
  }
  [(BKLibraryDataSourceUbiquityiOS *)self _reportProgressWithItems:v4];
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011B008;
  v9[3] = &unk_100A43DD8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(processUbiquityMetadataQueue, v9);
}

- (BOOL)_assetHasChanged:(id)a3 updatedAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 generation] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v6 generation];
    BOOL v7 = (uint64_t)v8 > (uint64_t)[v5 generation];
  }

  return v7;
}

- (void)_requestReOpenWithConflictDictionary:(id)a3 requestOpenAssetIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[BKAppDelegate sceneManager];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C6A0;
  block[3] = &unk_100A443C8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_reportProgressWithItems:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  uploadDownloadQueue = self->_uploadDownloadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011C7B4;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(uploadDownloadQueue, v7);
}

- (BOOL)iq_downloadingAssetID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_iq_downloadingProgressFromAssetID objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)iq_addOrUpdateDownloadingAssetID:(id)a3 progressValue:(double)a4
{
  id v11 = a3;
  id v6 = +[NSNumber numberWithDouble:a4];
  [(NSMutableDictionary *)self->_iq_downloadingProgressFromAssetID setObject:v6 forKeyedSubscript:v11];

  id v7 = [(NSMutableDictionary *)self->_iq_assetFromAssetID objectForKeyedSubscript:v11];
  id v8 = [v7 storePlaylistID];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_iq_downloadingAssetIDsFromParentAssetID objectForKeyedSubscript:v8];
    if (!v9)
    {
      iq_downloadingAssetIDsFromParentAssetID = self->_iq_downloadingAssetIDsFromParentAssetID;
      id v9 = objc_opt_new();
      [(NSMutableDictionary *)iq_downloadingAssetIDsFromParentAssetID setObject:v9 forKeyedSubscript:v8];
    }
    [v9 addObject:v11];
  }
}

- (void)iq_removeDownloadingAssetID:(id)a3
{
  id v8 = a3;
  [(NSMutableDictionary *)self->_iq_downloadingProgressFromAssetID removeObjectForKey:v8];
  BOOL v4 = [(NSMutableDictionary *)self->_iq_assetFromAssetID objectForKeyedSubscript:v8];
  id v5 = [v4 storePlaylistID];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_iq_downloadingAssetIDsFromParentAssetID objectForKeyedSubscript:v5];
    id v7 = v6;
    if (v6)
    {
      [v6 removeObject:v8];
      if (![v7 count]) {
        [(NSMutableDictionary *)self->_iq_downloadingAssetIDsFromParentAssetID removeObjectForKey:v5];
      }
    }
  }
}

- (id)iq_overallDownloadProgressValueForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_iq_downloadingProgressFromAssetID objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(NSMutableDictionary *)self->_iq_downloadingAssetIDsFromParentAssetID objectForKeyedSubscript:v4];
    if ([v6 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v18;
        double v11 = 0.0;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingProgressFromAssetID, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
            uint64_t v14 = v13;
            if (v13)
            {
              [v13 floatValue];
              double v11 = v11 + v15;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
      else
      {
        double v11 = 0.0;
      }

      id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 / (double)(unint64_t)[v7 count]);
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)iq_downloadProgressStatusesWithAssetID:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 isDownloading];
  unsigned int v9 = [v7 isLocal];
  v42 = v7;
  uint64_t v10 = [v7 downloadingPercent];
  [v10 floatValue];
  double v12 = (float)(v11 / 100.0);

  uint64_t v13 = 7;
  if (v9) {
    uint64_t v13 = 5;
  }
  double v14 = 1.0;
  if (!v9) {
    double v14 = v12;
  }
  if (v8) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = v13;
  }
  if (!v8) {
    double v12 = v14;
  }
  [(BKLibraryDataSourceUbiquityiOS *)self iq_addOrUpdateDownloadingAssetID:v6 progressValue:v12];
  id v16 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  id v17 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v6 state:v15 progressValue:-1 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:v12];
  [v16 addObject:v17];
  v43 = v6;
  long long v18 = [(NSMutableDictionary *)self->_iq_assetFromAssetID objectForKeyedSubscript:v6];
  uint64_t v19 = [v18 storePlaylistID];

  v40 = (void *)v19;
  if (v19)
  {
    long long v20 = -[BKLibraryDataSourceUbiquityiOS iq_overallDownloadProgressValueForAssetID:](self, "iq_overallDownloadProgressValueForAssetID:", v19, v19);
    [v20 floatValue];
    double v22 = v21;

    long long v23 = self;
    long long v24 = [(NSMutableDictionary *)self->_iq_downloadingAssetIDsFromParentAssetID objectForKeyedSubscript:v19];
    if ((unint64_t)[v24 count] > 1) {
      uint64_t v15 = 4;
    }
    id v25 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v19 supplementalContentState:v15 progressValue:-1 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:v22];

    [v16 addObject:v25];
    uint64_t v41 = v25;
  }
  else
  {
    uint64_t v41 = v17;
    long long v23 = self;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v26 = v16;
  id v27 = [v26 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v45;
    uint64_t v30 = BSUIUbiquityDownloadStatusNotification;
    uint64_t v31 = BSUIUbiquityDownloadProgressKey;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        dispatch_queue_t v33 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v34 = objc_alloc_init((Class)BSUIUbiquityDownloadProgress);
        v35 = [v33 assetID];
        [v34 setAssetIdentifier:v35];

        [v33 progressValue];
        dispatch_queue_t v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v34 setProgress:v36];

        v37 = +[NSNotificationCenter defaultCenter];
        uint64_t v48 = v31;
        id v49 = v34;
        v38 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [v37 postNotificationName:v30 object:v23 userInfo:v38];
      }
      id v28 = [v26 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v28);
  }

  return v26;
}

- (id)udq_reportDownloadProgressIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 url];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  dispatch_queue_t v33 = sub_100006FC4;
  id v34 = sub_1000071CC;
  id v35 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D6A4;
  block[3] = &unk_100A452E8;
  uint64_t v29 = &v30;
  void block[4] = self;
  id v7 = v5;
  id v28 = v7;
  dispatch_sync(ivarQueue, block);
  if ([(id)v31[5] length])
  {
    uint64_t v21 = 0;
    double v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = sub_100006FC4;
    id v25 = sub_1000071CC;
    id v26 = 0;
    if ([v4 isDownloading])
    {
      unsigned int v8 = [v4 downloadingPercent];
      if (v8)
      {
        unsigned int v9 = self->_ivarQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10011D6F4;
        v17[3] = &unk_100A477B0;
        uint64_t v19 = &v21;
        void v17[4] = self;
        long long v20 = &v30;
        id v18 = v4;
        dispatch_sync(v9, v17);
      }
    }
    else
    {
      float v11 = self->_ivarQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10011D750;
      v13[3] = &unk_100A477D8;
      v13[4] = self;
      uint64_t v15 = &v30;
      id v14 = v4;
      id v16 = &v21;
      dispatch_sync(v11, v13);
    }
    id v10 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v30, 8);

  return v10;
}

- (void)udq_reportUploadProgressIfNeeded:(id)a3 completedAssetIDs:(id)a4 failedAssets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = [v8 url];
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_100006FC4;
  v64 = sub_1000071CC;
  id v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011DFAC;
  block[3] = &unk_100A47800;
  uint64_t v54 = &v60;
  void block[4] = self;
  id v13 = v11;
  id v53 = v13;
  v55 = &v56;
  dispatch_sync(ivarQueue, block);
  if ([(id)v61[5] length])
  {
    id v14 = [v8 uploadingError];
    unsigned int v15 = [v8 isUploading];
    if (v14) {
      unsigned int v16 = 0;
    }
    else {
      unsigned int v16 = v15;
    }
    if (v16 == 1)
    {
      if (!*((unsigned char *)v57 + 24))
      {
        id v17 = [v8 uploadingPercent];
        id v18 = v17;
        if (v17)
        {
          workQueue = self->_workQueue;
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10011E014;
          v48[3] = &unk_100A464B0;
          uint64_t v50 = self;
          v51 = &v60;
          id v49 = v17;
          dispatch_async(workQueue, v48);
        }
        long long v20 = self->_ivarQueue;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10011E160;
        v47[3] = &unk_100A44170;
        v47[4] = self;
        v47[5] = &v60;
        dispatch_sync(v20, v47);
      }
    }
    else
    {
      unsigned __int8 v21 = [v8 isUploaded];
      if (v14) {
        char v22 = v21;
      }
      else {
        char v22 = 1;
      }
      if (v22)
      {
        uint64_t v23 = BKLibraryDataSourceUbiquityLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = v61[5];
          *(_DWORD *)buf = 141558786;
          *(void *)&uint8_t buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2160;
          uint64_t v67 = 1752392040;
          LOWORD(v68) = 2112;
          *(void *)((char *)&v68 + 2) = v13;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "udq_reportUploadProgressIfNeeded: Item is now local. assetID: %{mask.hash}@ url: %{mask.hash}@", buf, 0x2Au);
        }

        if (*((unsigned char *)v57 + 24))
        {
          id v25 = self->_workQueue;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10011E2FC;
          v42[3] = &unk_100A452E8;
          long long v44 = &v60;
          v42[4] = self;
          id v43 = v13;
          dispatch_async(v25, v42);
          id v26 = self->_ivarQueue;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10011E4B4;
          v41[3] = &unk_100A44170;
          v41[4] = self;
          v41[5] = &v60;
          dispatch_sync(v26, v41);
          [v9 addObject:v61[5]];
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          uint64_t v67 = (uint64_t)sub_100006FC4;
          *(void *)&long long v68 = sub_1000071CC;
          *((void *)&v68 + 1) = 0;
          dispatch_queue_t v33 = self->_ivarQueue;
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10011E518;
          v36[3] = &unk_100A47828;
          v36[4] = self;
          dispatch_queue_t v39 = &v60;
          id v37 = v13;
          v40 = buf;
          id v38 = v8;
          dispatch_sync(v33, v36);
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            id v34 = self->_workQueue;
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10011E64C;
            v35[3] = &unk_100A44170;
            v35[4] = self;
            v35[5] = buf;
            dispatch_async(v34, v35);
          }

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        id v27 = BKLibraryDataSourceUbiquityLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1007EBA04();
        }

        id v28 = [v8 unresolvedConflict];
        uint64_t v29 = v28;
        if (v28 && [v28 BOOLValue])
        {
          uint64_t v30 = BKLibraryDataSourceUbiquityLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_1007EB990();
          }
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        uint64_t v67 = (uint64_t)sub_100006FC4;
        *(void *)&long long v68 = sub_1000071CC;
        *((void *)&v68 + 1) = 0;
        uint64_t v31 = self->_ivarQueue;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10011E174;
        v46[3] = &unk_100A45570;
        v46[4] = self;
        v46[5] = buf;
        v46[6] = &v60;
        dispatch_sync(v31, v46);
        if (*(void *)(*(void *)&buf[8] + 40) && [v14 code] == (id)4354)
        {
          [v10 addObject:*(void *)(*(void *)&buf[8] + 40)];
          uint64_t v32 = self->_workQueue;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_10011E1D0;
          v45[3] = &unk_100A44058;
          v45[4] = self;
          v45[5] = &v60;
          dispatch_async(v32, v45);
        }
        _Block_object_dispose(buf, 8);
      }
    }
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
}

- (BOOL)iq_updateThumbnailIfNeededForAssetID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  if (v4)
  {
    id v5 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 141558274;
      uint64_t v9 = 1752392040;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iq_updateThumbnailIfNeededForAssetID: Refreshing imageCache. assetID: %{mask.hash}@", (uint8_t *)&v8, 0x16u);
    }

    id v6 = +[BCCacheManager defaultCacheManager];
    [v6 incrementVersionForIdentifier:v3];
  }
  return v4 != 0;
}

- (id)_counterpartURLForURL:(id)a3
{
  id v4 = [a3 path];
  id v5 = [v4 lastPathComponent];

  if ([v5 length])
  {
    id v6 = [(BKLibraryDataSourceUbiquityiOS *)self unzippedCounterpartCacheURL];
    id v7 = [v6 URLByAppendingPathComponent:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_removeCounterpartsForAssetIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011EB00;
  block[3] = &unk_100A443C8;
  id v7 = v4;
  id v26 = v7;
  id v27 = self;
  id v8 = v5;
  id v28 = v8;
  dispatch_sync(ivarQueue, block);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v22;
    *(void *)&long long v11 = 138412290;
    long long v19 = v11;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
        unsigned int v16 = +[NSFileManager defaultManager];
        id v20 = 0;
        [v16 removeItemAtURL:v15 error:&v20];
        id v17 = v20;

        if (v17)
        {
          id v18 = BKLibraryDataSourceUbiquityLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v30 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "\"_removeCounterpartForAssetID: removeItemAtURL failed. error: %@\"", buf, 0xCu);
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v12);
  }
}

- (void)iq_purgeUnzippedBooksCacheIfNeededExceptURL:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  id v34 = self;
  id v6 = [(BKLibraryDataSourceUbiquityiOS *)self unzippedCounterpartCacheURL];
  uint64_t v7 = [v6 path];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = v5;
  dispatch_queue_t v33 = (void *)v7;
  id v8 = [v5 enumeratorAtPath:v7];
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v32 = v4;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v42;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = [v33 stringByAppendingPathComponent:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        uint64_t v15 = [v35 attributesOfItemAtPath:v14 error:0];
        unsigned int v16 = [v15 objectForKeyedSubscript:NSFileSize];
        id v17 = [v16 longValue];

        v11 += (unint64_t)v17;
        if (v11 > 0x3200000)
        {

          id v8 = [v32 lastPathComponent];
          id v18 = [(BKLibraryDataSourceUbiquityiOS *)v34 unzippedCounterpartCacheURL];
          id v40 = 0;
          long long v19 = [v35 contentsOfDirectoryAtURL:v18 includingPropertiesForKeys:0 options:0 error:&v40];
          id v31 = v40;

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v37;
            uint64_t v24 = BCMetadataXattrAssetID;
            do
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v37 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v26 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
                id v27 = [v26 path];
                id v28 = [v27 lastPathComponent];
                unsigned __int8 v29 = [v28 isEqualToString:v8];

                if ((v29 & 1) == 0)
                {
                  id v30 = [v26 bu_extendedAttributeNamed:v24 iCloudSyncable:1];
                  if ([v30 length]) {
                    [(NSMutableDictionary *)v34->_iq_counterpartURLFromAssetID setObject:0 forKeyedSubscript:v30];
                  }
                  [v35 removeItemAtURL:v26 error:0];
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v22);
          }

          goto LABEL_22;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_22:
    id v4 = v32;
  }
}

- (id)iq_createUbiquityAssetFromMetadataDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:BCMetadataXattrAssetID];
  id v6 = [v4 objectForKeyedSubscript:@"itemURL"];
  if (v6 && [v5 length])
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"isLocal"];
    unsigned int v20 = [v7 BOOLValue];

    id v8 = [v4 objectForKeyedSubscript:@"contentChangedDate"];
    id v9 = [v4 objectForKeyedSubscript:@"contentFileSize"];
    id v21 = [v9 longLongValue];

    [(NSMutableDictionary *)self->_iq_urlFromAssetID setObject:v6 forKeyedSubscript:v5];
    [(NSMutableDictionary *)self->_iq_assetIDFromURL setObject:v5 forKeyedSubscript:v6];
    id v10 = [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID objectForKeyedSubscript:v5];

    if (!v10)
    {
      unint64_t v11 = +[NSDate date];
      [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID setObject:v11 forKeyedSubscript:v5];
    }
    BOOL v12 = [(BKLibraryDataSourceUbiquityiOS *)self iq_downloadingAssetID:v5];
    uint64_t v13 = [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID objectForKeyedSubscript:v5];
    objc_opt_class();
    id v14 = [v4 objectForKeyedSubscript:@"contentChangedDate"];
    uint64_t v15 = BUDynamicCast();

    unsigned int v16 = [(BKLibraryDataSourceUbiquityiOS *)self identifier];
    id v17 = +[BKUbiquityAsset newAssetFromMetadata:v4 url:v6 downloaded:v20 downloading:v12 filesize:0x7FFFFFFFFFFFFFFFLL dataSourceIdentifier:v16 insertionDate:v13 updateDate:v15];

    id v18 = [(NSMutableDictionary *)self->_iq_counterpartURLFromAssetID objectForKeyedSubscript:v5];
    if (v18) {
      [v17 setUrl:v18];
    }
    if (v8) {
      [v17 setUpdateDate:v8];
    }
    if (v21 != (id)-1) {
      [v17 setFileSize:];
    }
    [(NSMutableDictionary *)self->_iq_assetFromAssetID setObject:v17 forKeyedSubscript:v5];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)iq_createTempUbiquityAssetFromMetadataDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:BCMetadataXattrAssetID];
  id v6 = [v4 objectForKeyedSubscript:@"itemURL"];
  if (v6 && [v5 length])
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"isLocal"];
    unsigned int v21 = [v7 BOOLValue];

    id v8 = [v4 objectForKeyedSubscript:@"contentChangedDate"];
    id v9 = [v4 objectForKeyedSubscript:@"contentFileSize"];
    id v22 = [v9 longLongValue];

    id v10 = [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID objectForKeyedSubscript:v5];
    unint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[NSDate date];
    }
    id v14 = v12;

    BOOL v15 = [(BKLibraryDataSourceUbiquityiOS *)self iq_downloadingAssetID:v5];
    objc_opt_class();
    unsigned int v16 = [v4 objectForKeyedSubscript:@"contentChangedDate"];
    id v17 = BUDynamicCast();

    id v18 = [(BKLibraryDataSourceUbiquityiOS *)self identifier];
    id v13 = +[BKUbiquityAsset newAssetFromMetadata:v4 url:v6 downloaded:v21 downloading:v15 filesize:0x7FFFFFFFFFFFFFFFLL dataSourceIdentifier:v18 insertionDate:v14 updateDate:v17];

    long long v19 = [(NSMutableDictionary *)self->_iq_counterpartURLFromAssetID objectForKeyedSubscript:v5];
    if (v19) {
      [v13 setUrl:v19];
    }
    if (v8) {
      [v13 setUpdateDate:v8];
    }
    if (v22 != (id)-1) {
      [v13 setFileSize:];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)iq_clearCachesForAssetIDs:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_iq_urlFromAssetID objectForKeyedSubscript:v9];
        [(NSMutableDictionary *)self->_iq_urlFromAssetID setObject:0 forKeyedSubscript:v9];
        if (v10) {
          [(NSMutableDictionary *)self->_iq_assetIDFromURL setObject:0 forKeyedSubscript:v10];
        }
        [(NSMutableDictionary *)self->_iq_assetFromAssetID setObject:0 forKeyedSubscript:v9];
        [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID setObject:0 forKeyedSubscript:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  if ([v4 count]) {
    [(BKLibraryDataSourceUbiquityiOS *)self p_schedulePersistInfoToDisk];
  }
}

- (void)_unclaimAssetIDs:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10011F678;
  long long v11 = &unk_100A43DD8;
  long long v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(ivarQueue, &v8);
  -[BKLibraryDataSourceUbiquityiOS _removeCounterpartsForAssetIDs:](self, "_removeCounterpartsForAssetIDs:", v6, v8, v9, v10, v11, v12);
  [(BKLibraryDataSourceUbiquityiOS *)self _removeAssetIDsFromCoverCacheManager:v6];
  uint64_t v7 = [(BKLibraryDataSourceUbiquityiOS *)self libraryManager];
  [v7 libraryDataSource:self removedAssetsWithAssetIDs:v6 orTemporaryAssetIDs:0];
}

- (BOOL)_deleteFromAllDevicesURL:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if (v3)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = sub_100006FC4;
    BOOL v15 = sub_1000071CC;
    id v16 = 0;
    void v9[5] = &v11;
    id v10 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10011F8B8;
    v9[3] = &unk_100A47788;
    v9[4] = &v17;
    +[NSURL coordinateWritingItemAtURL:v3 options:1 error:&v10 byAccessor:v9];
    id v4 = v10;
    if (v4 || v12[5])
    {
      id v5 = BKLibraryDataSourceUbiquityLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = v12[5];
        *(_DWORD *)buf = 141558786;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2112;
        id v24 = v3;
        __int16 v25 = 2112;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "_deleteFromAllDevicesURL: removeItemAtURL failed. url: %{mask.hash}@ coordinateError: %@ removeError: %@", buf, 0x2Au);
      }
    }
    _Block_object_dispose(&v11, 8);

    BOOL v6 = *((unsigned char *)v18 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)_evictFromDeviceURL:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = +[NSFileManager defaultManager];
    id v18 = 0;
    unsigned int v9 = [v8 evictUbiquitousItemAtURL:v6 error:&v18];
    id v10 = v18;

    if (v9)
    {
      uint64_t v11 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v7 state:0 progressValue:-1 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:0.0];
      long long v12 = +[NSNotificationCenter defaultCenter];
      uint64_t v13 = BKLibraryDownloadStatusNotification;
      uint64_t v20 = BKLibraryDownloadStatusKey;
      long long v14 = +[NSSet setWithObject:v11];
      unsigned int v21 = v14;
      BOOL v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      [v12 postNotificationName:v13 object:self userInfo:v15];

      id v19 = v7;
      id v16 = +[NSArray arrayWithObjects:&v19 count:1];
      [(BKLibraryDataSourceUbiquityiOS *)self _removeCounterpartsForAssetIDs:v16];
    }
    else
    {
      uint64_t v11 = BKLibraryDataSourceUbiquityLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1007EBB20();
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_triggerDownload:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BKLibraryDataSourceUbiquityLog();
  unsigned int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v24 = 1752392040;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_triggerDownload: url: %{mask.hash}@", buf, 0x16u);
    }

    if (v7)
    {
      id v10 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v7 state:2 progressValue:-1 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:0.0];
      uint64_t v11 = +[NSNotificationCenter defaultCenter];
      uint64_t v12 = BKLibraryDownloadStatusNotification;
      uint64_t v21 = BKLibraryDownloadStatusKey;
      uint64_t v13 = +[NSSet setWithObject:v10];
      uint64_t v22 = v13;
      long long v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [v11 postNotificationName:v12 object:self userInfo:v14];
    }
    else
    {
      id v10 = BKLibraryDataSourceUbiquityLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1007EBBC4();
      }
    }

    unsigned int v9 = +[NSFileAccessIntent readingIntentWithURL:v6 options:0];
    BOOL v15 = objc_opt_new();
    uint64_t v20 = v9;
    id v16 = +[NSArray arrayWithObjects:&v20 count:1];
    uint64_t v17 = objc_opt_new();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011FEA0;
    v18[3] = &unk_100A453E8;
    id v19 = v6;
    [v15 coordinateAccessWithIntents:v16 queue:v17 byAccessor:v18];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1007EBB90();
  }
}

- (void)iq_setUbiquityDocumentMonitoringEnabled:(BOOL)a3
{
  if (a3
    && ([(BKLibraryDataSourceUbiquityiOS *)self ubiquityStatusMonitor],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isICloudDriveEnabled],
        v4,
        v5))
  {
    id v6 = [(BKLibraryDataSourceUbiquityiOS *)self ubiquityDocumentsObserver];

    id v7 = BKLibraryDataSourceUbiquityLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Restarting query.", buf, 2u);
      }

      unsigned int v9 = [(BKLibraryDataSourceUbiquityiOS *)self ubiquityDocumentsObserver];
      [v9 restartQuery];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Creating new observer.", v16, 2u);
      }

      id v12 = objc_alloc((Class)IMUbiquityDocumentsObserver);
      uint64_t v13 = [(BKLibraryDataSourceUbiquityiOS *)self ubiquityStatusMonitor];
      id v14 = [v12 initWithDelegate:self ubquityStatusMonitor:v13 directoriesSubpath:0];
      [(BKLibraryDataSourceUbiquityiOS *)self setUbiquityDocumentsObserver:v14];
    }
  }
  else
  {
    id v10 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Shutting down observer.", v15, 2u);
    }

    uint64_t v11 = [(BKLibraryDataSourceUbiquityiOS *)self ubiquityDocumentsObserver];
    [v11 tearDownQuery];

    [(BKLibraryDataSourceUbiquityiOS *)self setUbiquityDocumentsObserver:0];
  }
}

- (void)iq_clearAllCachesAndPersistentInfoFromDisk
{
  [(NSMutableDictionary *)self->_iq_urlFromAssetID removeAllObjects];
  [(NSMutableDictionary *)self->_iq_assetFromAssetID removeAllObjects];
  [(NSMutableDictionary *)self->_iq_assetIDFromURL removeAllObjects];
  [(NSMutableDictionary *)self->_iq_insertionDateFromAssetID removeAllObjects];
  id v4 = +[NSFileManager defaultManager];
  id v3 = [(BKLibraryDataSourceUbiquityiOS *)self _persistedInfoURL];
  [v4 removeItemAtURL:v3 error:0];
}

- (void)p_schedulePersistInfoToDisk
{
}

- (void)cb_persistInfoToDisk
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100006FC4;
  void v7[4] = sub_1000071CC;
  id v8 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120310;
  block[3] = &unk_100A44170;
  void block[4] = self;
  void block[5] = v7;
  dispatch_sync(ivarQueue, block);
  persistToDiskQueue = self->_persistToDiskQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001204D0;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = v7;
  dispatch_async(persistToDiskQueue, v5);
  _Block_object_dispose(v7, 8);
}

- (void)iq_populateAssetIDFromURLDictionary
{
  iq_urlFromAssetID = self->_iq_urlFromAssetID;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001205F0;
  v3[3] = &unk_100A47870;
  v3[4] = self;
  [(NSMutableDictionary *)iq_urlFromAssetID enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)_addLocalAssetsForURLs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001206C8;
  block[3] = &unk_100A45338;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(processUbiquityMetadataQueue, block);
}

- (void)handleFileGenerationChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleFileGenerationChangedNotification: %@", buf, 0xCu);
  }

  objc_opt_class();
  id v6 = [v4 userInfo];
  id v7 = BUDynamicCast();

  objc_opt_class();
  id v8 = [v7 objectForKeyedSubscript:BCUbiqityFileChangedKeyURL];
  id v9 = BUDynamicCast();

  objc_opt_class();
  id v10 = [v7 objectForKeyedSubscript:BCUbiqityFileChangedKeyGeneration];
  uint64_t v11 = BUDynamicCast();

  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120D94;
  block[3] = &unk_100A443C8;
  void block[4] = self;
  id v16 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v11;
  dispatch_sync(ivarQueue, block);
}

- (void)iq_updateCachedAssetGeneration:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_iq_assetIDFromURL objectForKeyedSubscript:a4];
  id v8 = [(NSMutableDictionary *)self->_iq_assetFromAssetID objectForKeyedSubscript:v7];
  if (v8)
  {
    [v8 setGeneration:[v6 longLongValue]];
    [(BKLibraryDataSourceUbiquityiOS *)self p_schedulePersistInfoToDisk];
    completionHandlerQueue = self->_completionHandlerQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100120EA4;
    v10[3] = &unk_100A43DD8;
    v10[4] = self;
    id v11 = v8;
    dispatch_async(completionHandlerQueue, v10);
  }
}

- (void)_updateUbiquityAssetID:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    updateAssetMetadataQueue = self->_updateAssetMetadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100121014;
    block[3] = &unk_100A443C8;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_async(updateAssetMetadataQueue, block);
  }
}

- (void)_addAssetsToCoverCacheManager:(id)a3
{
  id v4 = [a3 bu_arrayByRemovingNSNulls];
  id v7 = [v4 valueForKey:@"assetID"];

  unsigned int v5 = [(BKLibraryDataSourceUbiquityiOS *)self _coverCacheURLsForAssetIDs:v7];
  if ([v5 count])
  {
    id v6 = +[BCCacheManager defaultCacheManager];
    [v6 addURLs:v5 priority:3 quality:202 expiresAfter:0];
  }
}

- (void)_removeAssetIDsFromCoverCacheManager:(id)a3
{
  id v6 = [(BKLibraryDataSourceUbiquityiOS *)self _coverCacheURLsForAssetIDs:a3];
  if ([v6 count])
  {
    id v3 = +[BCCacheManager defaultCacheManager];
    [v3 removeURLs:v6 priority:3 quality:206];
    id v4 = [v6 allKeys];
    unsigned int v5 = +[NSSet setWithArray:v4];
    [v3 incrementVersionForIdentifiers:v5];
  }
}

- (id)_coverCacheURLsForAssetIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v10, @"com.apple.ibooks.datasource.ubiquity", (void)v14 dataSourceID];
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

- (void)makeBooksUbiquitous:(id)a3 completion:(id)a4
{
}

- (void)fetchAllUbiquitousBooksWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012149C;
  v4[3] = &unk_100A46800;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryDataSourceUbiquityiOS *)v5 fetchAssetIDsWithCompletion:v4];
}

- (void)_makeBooksUbiquitous:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_makeBooksUbiquitous: count: %ld", buf, 0xCu);
  }

  if ([v6 count])
  {
    id v9 = [(BKLibraryDataSourceUbiquityiOS *)self libraryManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100121740;
    v12[3] = &unk_100A455C0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v9 performBackgroundReadOnlyBlock:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)_addSupplementalContentMetadataFromAsset:(id)a3 toExistingAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 isSupplementalContent])
  {
    id v7 = [v6 assetID];
    uint64_t v8 = [v6 storeID];
    if ([v8 length])
    {
      id v9 = [v6 storePlaylistID];
      if ([v9 length])
      {
        unsigned __int8 v10 = [v6 isSupplementalContent];

        if (v10)
        {
          id v11 = [v5 storeID];
          if (![v11 length])
          {
LABEL_17:

            goto LABEL_18;
          }
          id v12 = [v5 storePlaylistID];
          id v13 = [v12 length];

          if (v13)
          {
            id v14 = [v6 storePlaylistID];
            long long v15 = [v5 storePlaylistID];
            unsigned __int8 v16 = [v14 isEqual:v15];

            if ((v16 & 1) == 0)
            {
              uint64_t v20 = BKLibraryBookImportLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                uint64_t v21 = [v6 storePlaylistID];
                uint64_t v22 = [v5 storePlaylistID];
                int v30 = 141559298;
                uint64_t v31 = 1752392040;
                __int16 v32 = 2112;
                dispatch_queue_t v33 = v7;
                __int16 v34 = 2160;
                uint64_t v35 = 1752392040;
                __int16 v36 = 2112;
                long long v37 = v21;
                __int16 v38 = 2160;
                uint64_t v39 = 1752392040;
                __int16 v40 = 2112;
                long long v41 = v22;
                __int16 v23 = "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for different storePlaylistID (ol"
                      "d=%{mask.hash}@, new=%{mask.hash}@)";
                goto LABEL_22;
              }
LABEL_16:

              uint64_t v24 = [v5 storePlaylistID];
              __int16 v25 = [v5 storeID];
              [v6 setSupplementalContent:1 playlistID:v24 storeID:v25];

              id v11 = +[BKUbiquityMetadataHelper sharedInstance];
              id v26 = [v5 isSupplementalContent];
              __int16 v27 = [v5 storePlaylistID];
              uint64_t v28 = [v5 storeID];
              unsigned __int8 v29 = [v6 url];
              [v11 setUbiquityMetadataIsSupplemental:v26 playlistID:v27 storeID:v28 forURL:v29];

              goto LABEL_17;
            }
            long long v17 = [v6 storeID];
            id v18 = [v5 storeID];
            unsigned __int8 v19 = [v17 isEqual:v18];

            if ((v19 & 1) == 0)
            {
              uint64_t v20 = BKLibraryBookImportLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                uint64_t v21 = [v6 storeID];
                uint64_t v22 = [v5 storeID];
                int v30 = 141559298;
                uint64_t v31 = 1752392040;
                __int16 v32 = 2112;
                dispatch_queue_t v33 = v7;
                __int16 v34 = 2160;
                uint64_t v35 = 1752392040;
                __int16 v36 = 2112;
                long long v37 = v21;
                __int16 v38 = 2160;
                uint64_t v39 = 1752392040;
                __int16 v40 = 2112;
                long long v41 = v22;
                __int16 v23 = "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for different storeID (old=%{mask"
                      ".hash}@, new=%{mask.hash}@";
LABEL_22:
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v30, 0x3Eu);

                goto LABEL_16;
              }
              goto LABEL_16;
            }
          }
LABEL_18:

          goto LABEL_19;
        }
LABEL_14:
        uint64_t v20 = BKLibraryBookImportLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 141558274;
          uint64_t v31 = 1752392040;
          __int16 v32 = 2112;
          dispatch_queue_t v33 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for missing supplemental content properties", (uint8_t *)&v30, 0x16u);
        }
        goto LABEL_16;
      }
    }
    goto LABEL_14;
  }
LABEL_19:
}

- (id)p_moveToUbiquityItemAtURL:(id)a3 preferredFileNameWithoutPathExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100006FC4;
  uint64_t v21 = sub_1000071CC;
  id v22 = 0;
  uint64_t v8 = [(BKLibraryDataSourceUbiquityiOS *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100122B2C;
  v13[3] = &unk_100A45EE0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  unsigned __int8 v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (BOOL)_isFileExistsError:(id)a3
{
  id v3 = a3;
  NSErrorDomain v4 = [v3 domain];

  if (v4 == NSCocoaErrorDomain)
  {
    id v6 = [v3 userInfo];
    id v7 = [v6 objectForKey:NSUnderlyingErrorKey];

    uint64_t v8 = [v7 domain];
    BOOL v5 = v8 == NSPOSIXErrorDomain && [v7 code] == (id)17;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  return 0;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_100006FC4;
    id v22 = sub_1000071CC;
    id v23 = 0;
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001234A0;
    block[3] = &unk_100A452E8;
    uint64_t v17 = &v18;
    void block[4] = self;
    id v16 = v8;
    dispatch_sync(ivarQueue, block);
    uint64_t v11 = v19[5];
    if (v11)
    {
      id v12 = +[BCUbiquityMetadataHelper ubiquityMetadataForURL:v11 options:-262145 needsCoordination:v5];
      id v13 = [(id)objc_opt_class() mapUbiquityMetadataToPlistMetadata:v12];
    }
    else
    {
      id v13 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)mapUbiquityMetadataToPlistMetadata:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    NSErrorDomain v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
    objc_opt_class();
    BOOL v5 = [v3 objectForKeyedSubscript:BCMetadataXattrAssetID];
    id v6 = BUDynamicCast();

    if ([v6 length])
    {
      id v7 = +[IMLibraryPlist keyNameForUniqueId];
      [v4 setObject:v6 forKey:v7];
    }
    objc_opt_class();
    id v8 = [v3 objectForKeyedSubscript:BCMetadataXattrTitle];
    id v9 = BUDynamicCast();

    if ([v9 length])
    {
      id v10 = +[IMLibraryPlist keyNameForTitle];
      [v4 setObject:v9 forKey:v10];
    }
    objc_opt_class();
    uint64_t v11 = [v3 objectForKeyedSubscript:BCMetadataXattrSortTitle];
    id v12 = BUDynamicCast();

    if ([v12 length])
    {
      id v13 = +[IMLibraryPlist keyNameForSortTitle];
      [v4 setObject:v12 forKey:v13];
    }
    objc_opt_class();
    id v14 = [v3 objectForKeyedSubscript:BCMetadataXattrAuthor];
    id v15 = BUDynamicCast();

    id v16 = +[BKLibraryAsset actualAuthorFromMetedata:v15];

    if ([v16 length])
    {
      uint64_t v17 = +[IMLibraryPlist keyNameForAuthor];
      [v4 setObject:v16 forKey:v17];
    }
    long long v68 = v16;
    objc_opt_class();
    uint64_t v18 = [v3 objectForKeyedSubscript:BCMetadataXattrSortAuthor];
    uint64_t v19 = BUDynamicCast();

    if ([v19 length])
    {
      uint64_t v20 = +[IMLibraryPlist keyNameForSortAuthor];
      [v4 setObject:v19 forKey:v20];
    }
    objc_opt_class();
    uint64_t v21 = [v3 objectForKeyedSubscript:BCMetadataXattrGenre];
    id v22 = BUDynamicCast();

    id v23 = v22;
    if ([v22 length])
    {
      uint64_t v24 = +[IMLibraryPlist keyNameForGenre];
      [v4 setObject:v23 forKey:v24];
    }
    uint64_t v66 = v23;
    objc_opt_class();
    __int16 v25 = [v3 objectForKeyedSubscript:BCMetadataXattrComments];
    id v26 = BUDynamicCast();

    __int16 v27 = v26;
    if ([v26 length])
    {
      uint64_t v28 = +[IMLibraryPlist keyNameForComments];
      [v4 setObject:v27 forKey:v28];
    }
    id v65 = v27;
    objc_opt_class();
    unsigned __int8 v29 = [v3 objectForKeyedSubscript:BCMetadataXattrBookDescription];
    int v30 = BUDynamicCast();

    uint64_t v31 = v30;
    if ([v30 length])
    {
      __int16 v32 = +[IMLibraryPlist keyNameForBookDescription];
      [v4 setObject:v31 forKey:v32];
    }
    v64 = v31;
    id v71 = v6;
    objc_opt_class();
    dispatch_queue_t v33 = [v3 objectForKeyedSubscript:BCMetadataXattrYear];
    __int16 v34 = BUDynamicCast();

    if ([v34 length])
    {
      uint64_t v35 = +[IMLibraryPlist keyNameForYear];
      [v4 setObject:v34 forKey:v35];
    }
    v63 = v34;
    objc_opt_class();
    __int16 v36 = [v3 objectForKeyedSubscript:BCMetadataXattrExplicit];
    long long v37 = BUDynamicCast();

    id v72 = v37;
    if (v37)
    {
      __int16 v38 = [NSNumber numberWithBool:[v37 BOOLValue:v63, v64, v65, v66]];
      if (v38)
      {
        uint64_t v39 = +[IMLibraryPlist keyNameForExplicitContent];
        [v4 setObject:v38 forKey:v39];
      }
    }
    v70 = v9;
    objc_opt_class();
    __int16 v40 = [v3 objectForKeyedSubscript:BCMetadataXattrLastOpened];
    long long v41 = BUDynamicCast();

    if (v41)
    {
      long long v42 = +[IMLibraryPlist keyNameForLastOpened];
      [v4 setObject:v41 forKey:v42];
    }
    id v69 = v12;
    objc_opt_class();
    long long v43 = [v3 objectForKeyedSubscript:BCMetadataXattrFirstOpened];
    long long v44 = BUDynamicCast();

    if (v44)
    {
      long long v45 = +[IMLibraryPlist keyNameForFirstOpened];
      [v4 setObject:v44 forKey:v45];
    }
    uint64_t v67 = v19;
    objc_opt_class();
    long long v46 = [v3 objectForKeyedSubscript:BCMetadataXattrRating];
    long long v47 = BUDynamicCast();

    if (v47)
    {
      uint64_t v48 = +[IMLibraryPlist keyNameForRating];
      [v4 setObject:v47 forKey:v48];
    }
    objc_opt_class();
    id v49 = [v3 objectForKeyedSubscript:BCMetadataXattrGeneration];
    uint64_t v50 = BUDynamicCast();

    if (v50)
    {
      v51 = +[IMLibraryPlist keyNameForGeneration];
      [v4 setObject:v50 forKey:v51];
    }
    objc_opt_class();
    uint64_t v52 = [v3 objectForKeyedSubscript:BCMetadataXattrIsSupplementalContent];
    id v53 = BUDynamicCast();

    if (v53)
    {
      uint64_t v54 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v72 BOOLValue]);
      if (v54)
      {
        v55 = +[IMLibraryPlist keyNameForIsSupplementalContent];
        [v4 setObject:v54 forKey:v55];
      }
    }
    objc_opt_class();
    uint64_t v56 = [v3 objectForKeyedSubscript:BCMetadataXattrStoreID];
    v57 = BUDynamicCast();

    if ([v57 length])
    {
      uint64_t v58 = +[IMLibraryPlist keyNameForStoreId];
      [v4 setObject:v57 forKey:v58];
    }
    objc_opt_class();
    char v59 = [v3 objectForKeyedSubscript:BCMetadataXattrStorePlaylistID];
    uint64_t v60 = BUDynamicCast();

    if ([v60 length])
    {
      v61 = +[IMLibraryPlist keyNameForStorePlaylistId];
      [v4 setObject:v60 forKey:v61];
    }
  }
  else
  {
    NSErrorDomain v4 = 0;
  }

  return v4;
}

- (void)extractOperationDidFinish:(id)a3
{
  NSErrorDomain v4 = [a3 userContext];
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100123E9C;
  v7[3] = &unk_100A43DD8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

- (void)extractOperationDidFail:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001241D0;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (BKUbiquitousBooksUploadReporting)uploadReporter
{
  return self->_uploadReporter;
}

- (id)madeUbiquitousNotifyBlock
{
  return self->_madeUbiquitousNotifyBlock;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (NSMutableDictionary)iq_urlFromAssetID
{
  return self->_iq_urlFromAssetID;
}

- (void)setIq_urlFromAssetID:(id)a3
{
}

- (NSMutableDictionary)iq_counterpartURLFromAssetID
{
  return self->_iq_counterpartURLFromAssetID;
}

- (void)setIq_counterpartURLFromAssetID:(id)a3
{
}

- (NSMutableDictionary)iq_assetIDFromURL
{
  return self->_iq_assetIDFromURL;
}

- (void)setIq_assetIDFromURL:(id)a3
{
}

- (NSMutableDictionary)iq_assetFromAssetID
{
  return self->_iq_assetFromAssetID;
}

- (void)setIq_assetFromAssetID:(id)a3
{
}

- (NSMutableDictionary)iq_insertionDateFromAssetID
{
  return self->_iq_insertionDateFromAssetID;
}

- (void)setIq_insertionDateFromAssetID:(id)a3
{
}

- (NSMutableSet)iq_uploadingAssetIDs
{
  return self->_iq_uploadingAssetIDs;
}

- (void)setIq_uploadingAssetIDs:(id)a3
{
}

- (NSMutableSet)iq_downloadingAssetIDs
{
  return self->_iq_downloadingAssetIDs;
}

- (void)setIq_downloadingAssetIDs:(id)a3
{
}

- (NSMutableDictionary)iq_downloadingProgressFromAssetID
{
  return self->_iq_downloadingProgressFromAssetID;
}

- (void)setIq_downloadingProgressFromAssetID:(id)a3
{
}

- (NSMutableDictionary)iq_downloadingAssetIDsFromParentAssetID
{
  return self->_iq_downloadingAssetIDsFromParentAssetID;
}

- (void)setIq_downloadingAssetIDsFromParentAssetID:(id)a3
{
}

- (OS_dispatch_queue)completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

- (void)setCompletionHandlerQueue:(id)a3
{
}

- (NSHashTable)cq_metadataQueryHandlingObservers
{
  return self->_cq_metadataQueryHandlingObservers;
}

- (void)setCq_metadataQueryHandlingObservers:(id)a3
{
}

- (OS_dispatch_queue)uploadDownloadQueue
{
  return self->_uploadDownloadQueue;
}

- (void)setUploadDownloadQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)updateAssetMetadataQueue
{
  return self->_updateAssetMetadataQueue;
}

- (void)setUpdateAssetMetadataQueue:(id)a3
{
}

- (OS_dispatch_queue)processUbiquityMetadataQueue
{
  return self->_processUbiquityMetadataQueue;
}

- (void)setProcessUbiquityMetadataQueue:(id)a3
{
}

- (OS_dispatch_queue)processMetadataQueryQueue
{
  return self->_processMetadataQueryQueue;
}

- (void)setProcessMetadataQueryQueue:(id)a3
{
}

- (OS_dispatch_queue)persistToDiskQueue
{
  return self->_persistToDiskQueue;
}

- (void)setPersistToDiskQueue:(id)a3
{
}

- (NSOperationQueue)uncompressQueue
{
  return self->_uncompressQueue;
}

- (void)setUncompressQueue:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedPersistCachedValues
{
  return self->_coalescedPersistCachedValues;
}

- (void)setCoalescedPersistCachedValues:(id)a3
{
}

- (IMUbiquityDocumentsObserver)ubiquityDocumentsObserver
{
  return self->_ubiquityDocumentsObserver;
}

- (void)setUbiquityDocumentsObserver:(id)a3
{
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (BOOL)handledInitialMetadataQuery
{
  return self->_handledInitialMetadataQuery;
}

- (void)setHandledInitialMetadataQuery:(BOOL)a3
{
  self->_handledInitialMetadataQuery = a3;
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

- (BKLibraryImageSource)imageSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageSource);

  return (BKLibraryImageSource *)WeakRetained;
}

- (void)setImageSource:(id)a3
{
}

- (BOOL)shouldArchivePathFixupRevision
{
  return self->_shouldArchivePathFixupRevision;
}

- (void)setShouldArchivePathFixupRevision:(BOOL)a3
{
  self->_shouldArchivePathFixupRevision = a3;
}

- (BOOL)skipThumbnailGeneration
{
  return self->_skipThumbnailGeneration;
}

- (void)setSkipThumbnailGeneration:(BOOL)a3
{
  self->_skipThumbnailGeneration = a3;
}

- (BOOL)emptyCacheDirectory
{
  return self->_emptyCacheDirectory;
}

- (void)setEmptyCacheDirectory:(BOOL)a3
{
  self->_emptyCacheDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unzippedCounterpartCacheURL, 0);
  objc_destroyWeak((id *)&self->_imageSource);
  objc_destroyWeak((id *)&self->_coverImageHelper);
  objc_destroyWeak((id *)&self->_assetMetadataCache);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquityDocumentsObserver, 0);
  objc_storeStrong((id *)&self->_coalescedPersistCachedValues, 0);
  objc_storeStrong((id *)&self->_uncompressQueue, 0);
  objc_storeStrong((id *)&self->_persistToDiskQueue, 0);
  objc_storeStrong((id *)&self->_processMetadataQueryQueue, 0);
  objc_storeStrong((id *)&self->_processUbiquityMetadataQueue, 0);
  objc_storeStrong((id *)&self->_updateAssetMetadataQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uploadDownloadQueue, 0);
  objc_storeStrong((id *)&self->_cq_metadataQueryHandlingObservers, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDsFromParentAssetID, 0);
  objc_storeStrong((id *)&self->_iq_downloadingProgressFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDs, 0);
  objc_storeStrong((id *)&self->_iq_uploadingAssetIDs, 0);
  objc_storeStrong((id *)&self->_iq_insertionDateFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_assetFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_assetIDFromURL, 0);
  objc_storeStrong((id *)&self->_iq_counterpartURLFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_urlFromAssetID, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong(&self->_madeUbiquitousNotifyBlock, 0);
  objc_storeStrong((id *)&self->_uploadReporter, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end