@interface MLSyncClient
- (BOOL)_applyMediaPinningSettings;
- (BOOL)_evaluateUploadTrackDatabaseChangeStep:(id)a3;
- (BOOL)_hasRelevantChangesToSync;
- (BOOL)_performReconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)_processArtworkIdentifier:(id)a3 artworkToken:(id)a4 artworkType:(int64_t)a5 mediaType:(unsigned int)a6 sourceType:(int64_t)a7;
- (BOOL)_processUploadTrackOperations;
- (BOOL)_rebuildCachedPlaylistSettings;
- (BOOL)_shouldCancelActiveSessionsForLegacyPairedDevices;
- (BOOL)_shouldSyncPlaylistWithPersistentId:(int64_t)a3 forSupportedMediaTypes:(id)a4 includeNonLibraryContent:(BOOL)a5 pairedDeviceCanProcessStandaloneCollections:(BOOL)a6;
- (BOOL)_syncedPlaylistIdInMediaLibrary;
- (BOOL)_verifySyncPlistFiles;
- (BOOL)isEnabled;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7;
- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (BOOL)reconcileUpgradeWithError:(id *)a3;
- (MLSyncClient)init;
- (id)_DSIDsForAssets;
- (id)_artworkAssetsToSyncWithMaximumTotalSize:(unint64_t)a3 totalSize:(unint64_t *)a4;
- (id)_existingOutstandingAssetTransfersWithDownloadManager:(id)a3;
- (id)_geniusAssetsToSync;
- (id)_getDownloadStatusForCurrentPinningSettings;
- (id)_getPlaylistSyncSettings;
- (id)_library;
- (id)_songArtworkSizeVariant;
- (id)_syncPlistFiles;
- (id)_trackAssetsToSyncWithMediaType:(unsigned int)a3 withAllowedPids:(id)a4 maximumTotalSize:(unint64_t)a5 totalSize:(unint64_t *)a6;
- (id)_tracksNeedingDownloadPredicateWithMediaType:(unsigned int)a3;
- (id)_tracksToSyncPredicateWithMediaType:(unsigned int)a3;
- (id)accountsForAssets;
- (id)appleIDsForAssets;
- (id)assetDataClass;
- (id)currentSyncAnchor;
- (id)disabledAssetTypes;
- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4;
- (id)installedAssetMetrics;
- (id)outstandingAssetTransfersWithDownloadManager:(id)a3;
- (id)revisionVersionToken;
- (id)supportedDataclasses;
- (id)syncDataClass;
- (unint64_t)_sizeForDownloadedTracksWithMediaType:(unsigned int)a3 minimumKeepLocalValue:(int)a4;
- (unint64_t)currentRevision;
- (void)_applyLibrarySettingsFromSyncParams:(id)a3;
- (void)_cancelSyncSessionsWithSessionIdentifier:(id)a3 groupingKey:(id)a4 waitToFinish:(BOOL)a5 withError:(id)a6;
- (void)_clearAllRevisionsFromLibrary;
- (void)_clearCachedPlaylistSettings;
- (void)_clearDatabasePropertiesForRestore:(int)a3;
- (void)_handleATCStartupCompletedNotification:(id)a3;
- (void)_handleAccountsDidChange;
- (void)_handleContentsChangedNotification:(id)a3;
- (void)_handleDisplayValuesChangedNotification:(id)a3;
- (void)_handleNanoBooksAppUnregistered;
- (void)_handleNanoMusicAppUnregistered;
- (void)_handleNonContentsPropertiesDidChangeNotification:(id)a3;
- (void)_handleSessionsDidChangeNotification:(id)a3;
- (void)_handleStatusReportRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleStoreFrontDidChange;
- (void)_handleSyncDefaultsSyncSettingsDidChangeNotification:(id)a3;
- (void)_handleUpdateSettingsRequest:(id)a3 onMessageLink:(id)a4;
- (void)_invokeHasChangesCallbackWithPriority:(int)a3;
- (void)_migrateSyncSettings;
- (void)_postAssetTotal:(unint64_t)a3;
- (void)_postCurrentAssetNumber:(unint64_t)a3;
- (void)_processCompletedAssets;
- (void)_purgeContentForMediaType:(unsigned int)a3;
- (void)_rebuildStoreManifests;
- (void)_resetLastSyncedVersionForSyncedPlaylist;
- (void)_sendUpdatedSettings;
- (void)_setAutoEnableCloudLibrary;
- (void)_setPreExistingStoreAccountIds;
- (void)_syncPlaylistToCurrentRevision;
- (void)_syncUpdatedSettingsToPairedDevice;
- (void)_updateSyncPlaylistToCurrentRevision;
- (void)_validatePlaylistSettings;
- (void)applyChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 fromStream:(id)a5 withSyncParams:(id)a6 withProgressHandler:(id)a7 withCompletionHandler:(id)a8;
- (void)assetInstallFailed:(id)a3 withError:(id)a4;
- (void)assetSync:(id)a3 didCompleteWithError:(id)a4;
- (void)assetSyncDidCompleteWithError:(id)a3;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)assetsToSyncWithCompletion:(id)a3;
- (void)cancelSyncOperations;
- (void)clearSyncData;
- (void)dealloc;
- (void)getChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 afterRevision:(unint64_t)a5 upToRevision:(unint64_t)a6 withSyncParams:(id)a7 intoOutputStream:(id)a8 withStartHandler:(id)a9 withProgressHandler:(id)a10 withCompletionHandler:(id)a11;
- (void)getDataForArtworkAsset:(id)a3 withCompletion:(id)a4;
- (void)getDataForAsset:(id)a3 withCompletion:(id)a4;
- (void)getDataForGeniusAsset:(id)a3 withCompletion:(id)a4;
- (void)getDataForTrackAsset:(id)a3 withCompletion:(id)a4;
- (void)initiateAssetDownloadsWithCompletion:(id)a3;
- (void)initiateSyncOrKeepLocalSessionWithOptions:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
- (void)metadataUpdate:(id)a3 forAsset:(id)a4 withNewAnchor:(id)a5;
- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4;
- (void)resetSyncDataWithCompletion:(id)a3;
- (void)sessionDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncCompletedWithError:(id)a3;
@end

@implementation MLSyncClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepLocalEventHandlerWrapper, 0);
  objc_storeStrong((id *)&self->_temporaryDownloads, 0);
  objc_storeStrong((id *)&self->_observedSessions, 0);
  objc_storeStrong((id *)&self->_cachedPlaylistSettings, 0);
  objc_storeStrong((id *)&self->_modifiedPlaylistsPIDs, 0);
  objc_storeStrong((id *)&self->_downloadedAssets, 0);
  objc_destroyWeak((id *)&self->_messageLink);
  objc_storeStrong(&self->_nanoMediaDaemonPlugin, 0);
  objc_storeStrong(&self->_nanoMediaSyncService, 0);
  objc_storeStrong(&self->_nanoMediaSyncInfoUpdater, 0);
  objc_storeStrong(&self->_nanoMusicRecommendationManager, 0);
  objc_storeStrong(&self->_nanoMediaPinningManager, 0);
  objc_storeStrong(&self->_nanoMediaSettingsSynchronizer, 0);
  objc_storeStrong(&self->_nanoSyncSettings, 0);
  objc_storeStrong((id *)&self->_callBackQueue, 0);
  objc_storeStrong((id *)&self->_cachedSettingsQueue, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncClientDelegate, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_lastAssetNumberPostDate, 0);
  objc_storeStrong((id *)&self->_autoCreatedSmartPlaylistsPIDs, 0);
  objc_storeStrong((id *)&self->_pendingUploads, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)_handleNanoBooksAppUnregistered
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46D6C;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleNanoMusicAppUnregistered
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46E58;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_purgeContentForMediaType:(unsigned int)a3
{
  v5 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v30 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Purging content for media type %d", buf, 8u);
  }

  v6 = [(MLSyncClient *)self _library];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_47388;
  v27[3] = &unk_9A730;
  unsigned int v28 = a3;
  [v6 databaseConnectionAllowingWrites:1 withBlock:v27];
  v7 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyIsLocal equalToInteger:1];
  v8 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyMediaType equalToInt64:a3];
  v34[0] = v7;
  v34[1] = v8;
  v9 = +[NSArray arrayWithObjects:v34 count:2];
  v10 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v9];

  v11 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v6 predicate:v10 orderingTerms:0];
  v12 = +[NSMutableArray array];
  v13 = +[NSMutableArray array];
  uint64_t v33 = ML3TrackPropertyFilePath;
  v14 = +[NSArray arrayWithObjects:&v33 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_47460;
  v23[3] = &unk_99F10;
  id v15 = v13;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v17 = v6;
  id v26 = v17;
  [v11 enumeratePersistentIDsAndProperties:v14 usingBlock:v23];

  v18 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v30 = a3;
    __int16 v31 = 2114;
    id v32 = v16;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Purging assets for media type %d: %{public}@", buf, 0x12u);
  }

  v19 = +[NSSet setWithArray:v16];
  ML3DeleteAssetsAtPaths();

  if ([v15 count])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_47520;
    v20[3] = &unk_9ABE8;
    id v21 = v15;
    id v22 = v17;
    [v22 performDatabaseTransactionWithBlock:v20];
  }
}

- (void)initiateSyncOrKeepLocalSessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"MLSyncPolicyChangedObserverStartKeepLocalSessionEnqueueAssetsKey"];
  id v6 = [v5 BOOLValue];

  v7 = [v4 objectForKey:@"MLSyncPolicyChangedObserverStartKeepLocalSessionForceNoDelayKey"];

  id v8 = [v7 BOOLValue];
  v9 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v6;
    __int16 v12 = 1024;
    int v13 = (int)v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "starting background keep local session with enqueueAssets=%{BOOL}u, forceNoDelay=%{BOOL}u", (uint8_t *)v11, 0xEu);
  }

  v10 = [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper keepLocalEventHandler];
  [v10 startKeepLocalSessionInBackground:1 enqueueAssets:v6 forceNoDelay:v8 withCompletion:0];
}

- (void)sessionDidFinish:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_478E8;
  v7[3] = &unk_9A930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_getDownloadStatusForCurrentPinningSettings
{
  id v17 = [(MLSyncClient *)self _library];
  v2 = +[NSMutableDictionary dictionary];
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v16 = +[ML3ComparisonPredicate predicateWithProperty:ML3EntityPropertyKeepLocal value:&off_9C9D8 comparison:3];
  v5 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v17);
  v42[0] = ML3TrackPropertyBaseLocationID;
  v42[1] = ML3TrackPropertyTotalSize;
  v42[2] = ML3TrackPropertyTotalTime;
  v42[3] = ML3TrackPropertyMediaType;
  id v6 = +[NSArray arrayWithObjects:v42 count:4];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_47E50;
  v18[3] = &unk_9A710;
  id v7 = v4;
  id v19 = v7;
  id v22 = &v38;
  v23 = &v30;
  id v8 = v3;
  id v20 = v8;
  id v24 = &v34;
  id v25 = &v26;
  id v9 = v2;
  id v21 = v9;
  [v5 enumeratePersistentIDsAndProperties:v6 usingBlock:v18];
  v10 = +[NSNumber numberWithUnsignedLongLong:v39[3]];
  v11 = +[NSNumber numberWithUnsignedLongLong:v31[3]];
  __int16 v12 = +[NSNumber numberWithUnsignedLongLong:v35[3]];
  int v13 = +[NSNumber numberWithUnsignedLongLong:v27[3]];
  v14 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"DownloadedAssetCountForSyncSettings", v11, @"DownloadedAssetByteCountForSyncSettings", v12, @"AssetsToDownloadCountForSyncSettings", v13, @"KeepLocalAssetByteCountForSyncSettings", v9, @"DetailedRequestInfoByAssetType", v8, @"DetailedDownloadInfoByAssetType", v7, @"ItemsWithEstimatedFileSize", 0];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

- (void)_syncPlaylistToCurrentRevision
{
  v3 = [(MLSyncClient *)self _library];
  id v4 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
  if ([v4 longLongValue]
    && [self->_nanoSyncSettings assetSyncType] == (char *)&dword_0 + 1)
  {
    v5 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistPersistentID];
    id v6 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistVersion];
    id v7 = objc_msgSend(objc_alloc((Class)ML3Container), "initWithPersistentID:inLibrary:", objc_msgSend(v4, "longLongValue"), v3);
    id v8 = [v7 valueForProperty:ML3EntityPropertyRevision];
    id v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134350080;
      id v11 = [v5 longLongValue];
      __int16 v12 = 2048;
      id v13 = [v6 longLongValue];
      __int16 v14 = 2050;
      id v15 = [v4 longLongValue];
      __int16 v16 = 2048;
      id v17 = [v8 longLongValue];
      __int16 v18 = 1024;
      BOOL v19 = v6 != v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "lastFullySyncedPlaylistId:%{public}lld, last saved revision:[%lld], playListId:%{public}lld, new revision:[%lld], shouldSync:%d", buf, 0x30u);
    }

    if (v6 != v8) {
      [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:1];
    }
  }
}

- (BOOL)_rebuildCachedPlaylistSettings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  cachedSettingsQueue = self->_cachedSettingsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_483F8;
  v5[3] = &unk_9A6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedSettingsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_clearCachedPlaylistSettings
{
  cachedSettingsQueue = self->_cachedSettingsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_487F0;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(cachedSettingsQueue, block);
}

- (void)_handleATCStartupCompletedNotification:(id)a3
{
  id v4 = a3;
  v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Handling atc startup completed notification", buf, 2u);
  }

  uint64_t v6 = [(MLSyncClient *)self _library];
  +[MPMediaQuery setFilteringDisabled:1];
  id v7 = +[MPMediaLibrary defaultMediaLibrary];
  [v7 setCloudFilteringType:1];

  uint64_t v8 = +[MLSyncClientEnvironmentPolicyChangeHandler sharedInstance];
  [v8 addObserver:self];

  char v9 = +[MLSyncClientKeepLocalEventHandlerWrapper sharedInstance];
  keepLocalEventHandlerWrapper = self->_keepLocalEventHandlerWrapper;
  self->_keepLocalEventHandlerWrapper = v9;

  [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper initializeKeepLocalHandlerWithQueue:self->_queue library:v6];
  [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper startKeepLocalHandler];
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2050000000;
  id v11 = (void *)qword_A4AF8;
  uint64_t v38 = qword_A4AF8;
  if (!qword_A4AF8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    uint64_t v32 = sub_48E7C;
    uint64_t v33 = &unk_9AB58;
    uint64_t v34 = &v35;
    sub_48E7C((uint64_t)buf);
    id v11 = (void *)v36[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v35, 8);
  id v13 = [v12 sharedDefaults];
  id nanoSyncSettings = self->_nanoSyncSettings;
  self->_id nanoSyncSettings = v13;

  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2050000000;
  id v15 = (void *)qword_A4B08;
  uint64_t v38 = qword_A4B08;
  if (!qword_A4B08)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    uint64_t v32 = sub_48F44;
    uint64_t v33 = &unk_9AB58;
    uint64_t v34 = &v35;
    sub_48F44((uint64_t)buf);
    id v15 = (void *)v36[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v35, 8);
  id v17 = [v16 sharedSynchronizer];
  id nanoMediaSettingsSynchronizer = self->_nanoMediaSettingsSynchronizer;
  self->_id nanoMediaSettingsSynchronizer = v17;

  [self->_nanoMediaSettingsSynchronizer beginObservingUpdates];
  [(MLSyncClient *)self _migrateSyncSettings];
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2050000000;
  BOOL v19 = (void *)qword_A4B10;
  uint64_t v38 = qword_A4B10;
  if (!qword_A4B10)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    uint64_t v32 = sub_4900C;
    uint64_t v33 = &unk_9AB58;
    uint64_t v34 = &v35;
    sub_4900C((uint64_t)buf);
    BOOL v19 = (void *)v36[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v35, 8);
  id v21 = [v20 sharedManager];
  id nanoMusicRecommendationManager = self->_nanoMusicRecommendationManager;
  self->_id nanoMusicRecommendationManager = v21;

  [self->_nanoMusicRecommendationManager setWantsContentsUpdate:1];
  [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleNonContentsPropertiesDidChangeNotification:" name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  notificationCenter = self->_notificationCenter;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  id v24 = (void *)qword_A4B18;
  uint64_t v38 = qword_A4B18;
  if (!qword_A4B18)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    uint64_t v32 = sub_490D4;
    uint64_t v33 = &unk_9AB58;
    uint64_t v34 = &v35;
    id v25 = sub_49124();
    uint64_t v26 = dlsym(v25, "NMSMediaPinningManagerDownloadInfoDidInvalidateNotification");
    *(void *)(v34[1] + 24) = v26;
    qword_A4B18 = *(void *)(v34[1] + 24);
    id v24 = (void *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (v24)
  {
    [(NSNotificationCenter *)notificationCenter addObserver:self selector:"_handleMediaPinningContentsInvalidatedNotification:" name:*v24 object:0];
    [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleSessionsDidChangeNotification:" name:ATSessionsDidChangeNotification object:0];
    [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleContentsChangedNotification:" name:ML3MusicLibraryContentsDidChangeNotification object:0];
    [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleDisplayValuesChangedNotification:" name:ML3MusicLibraryDisplayValuesDidChangeNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_49294, @"com.apple.mobileipod-prefsChanged", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_4928C, @"com.apple.itunesstored.accountschanged", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_49284, @"com.apple.StoreServices.StoreFrontChanged", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_49278, @"com.apple.itunescloudd.artworkDownloadsDidCompleteNotification", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_49294, @"com.apple.Music-SortAlbums", 0, CFNotificationSuspensionBehaviorDrop);
    [(MLSyncClient *)self _syncPlaylistToCurrentRevision];
    [(MLSyncClient *)self _rebuildCachedPlaylistSettings];
  }
  else
  {
    uint64_t v28 = +[NSAssertionHandler currentHandler];
    uint64_t v29 = +[NSString stringWithUTF8String:"NSString *getNMSMediaPinningManagerDownloadInfoDidInvalidateNotification(void)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"MLSyncClient.m", 154, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_resetLastSyncedVersionForSyncedPlaylist
{
  if ([self->_nanoSyncSettings assetSyncType] == (char *)&dword_0 + 1)
  {
    char v3 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
    id v4 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistPersistentID];
    v5 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistVersion];
    uint64_t v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134349824;
      id v8 = [v4 longLongValue];
      __int16 v9 = 2048;
      id v10 = [v5 longLongValue];
      __int16 v11 = 2050;
      id v12 = [v3 longLongValue];
      __int16 v13 = 2048;
      id v14 = [&off_9C9D8 longLongValue];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "updating synced playlist from %{public}lld[%lld] ==> %{public}lld[%lld]", (uint8_t *)&v7, 0x2Au);
    }

    if (v3) {
      [self->_nanoSyncSettings setLastFullySentAssetSyncPlaylistPersistentID:v3];
    }
    [self->_nanoSyncSettings setLastFullySentAssetSyncPlaylistVersion:&off_9C9D8];
  }
}

- (void)_updateSyncPlaylistToCurrentRevision
{
  char v3 = [(MLSyncClient *)self _library];
  id v4 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
  if ([v4 longLongValue]
    && [self->_nanoSyncSettings assetSyncType] == (char *)&dword_0 + 1)
  {
    v5 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistPersistentID];
    uint64_t v6 = [self->_nanoSyncSettings lastFullySentAssetSyncPlaylistVersion];
    id v7 = objc_msgSend(objc_alloc((Class)ML3Container), "initWithPersistentID:inLibrary:", objc_msgSend(v4, "longLongValue"), v3);
    id v8 = [v7 valueForProperty:ML3EntityPropertyRevision];
    __int16 v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349824;
      id v11 = [v5 longLongValue];
      __int16 v12 = 2048;
      id v13 = [v6 longLongValue];
      __int16 v14 = 2050;
      id v15 = [v4 longLongValue];
      __int16 v16 = 2048;
      id v17 = [v8 longLongValue];
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "updating synced playlist from %{public}lld[%lld] ==> %{public}lld[%lld]", buf, 0x2Au);
    }

    if (v4) {
      [self->_nanoSyncSettings setLastFullySentAssetSyncPlaylistPersistentID:v4];
    }
    if (v8) {
      [self->_nanoSyncSettings setLastFullySentAssetSyncPlaylistVersion:v8];
    }
  }
}

- (void)_handleUpdateSettingsRequest:(id)a3 onMessageLink:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 parameters];
  id v8 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    id v24 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "received updated settings %{public}@", (uint8_t *)&v23, 0xCu);
  }

  LOBYTE(v23) = 0;
  __int16 v9 = [v7 objectForKey:@"ShowAllMusic"];
  id v10 = [v7 objectForKey:@"SoundCheckEnabled"];
  id v11 = [v7 objectForKey:@"MusicSortingPreference"];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MusicShowCloudMediaEnabledSetting", @"com.apple.mobileipod", (Boolean *)&v23);
  int v13 = v23;
  __int16 v14 = (void *)CFPreferencesCopyAppValue(@"SortAlbums", @"com.apple.Music");
  if (CFPreferencesGetAppBooleanValue(@"MusicSoundCheckEnabledSetting", @"com.apple.mobileipod", (Boolean *)&v23))
  {
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = v23 == 0;
  }
  int v16 = v15;
  if (v9)
  {
    BOOL v17 = AppBooleanValue || v13 == 0;
    int v18 = v17;
    if (v18 != [v9 BOOLValue])
    {
      CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSetting", v9, @"com.apple.mobileipod");
      CFPreferencesAppSynchronize(@"com.apple.mobileipod");
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, ICCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification, 0, 0, 1u);
    }
  }
  if (!v10 || v16 == [v10 BOOLValue])
  {
    int v20 = 0;
  }
  else
  {
    CFPreferencesSetAppValue(@"MusicSoundCheckEnabledSetting", v10, @"com.apple.mobileipod");
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    int v20 = 1;
  }
  if (([v11 isEqualToString:v14] & 1) == 0)
  {
    CFPreferencesSetAppValue(@"SortAlbums", v11, @"com.apple.Music");
    CFPreferencesAppSynchronize(@"com.apple.Music");
    int v20 = 1;
  }
  id v21 = [v7 objectForKey:@"Playlist"];
  if (v20) {
    notify_post("com.apple.mobileipod-prefsChanged");
  }
  id v22 = [v5 responseWithError:0 parameters:0];
  [v6 sendResponse:v22 withCompletion:&stru_9A6C0];
}

- (void)_handleStatusReportRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MLSyncClient *)self _library];
  BOOL v9 = [(MLSyncClient *)self _syncedPlaylistIdInMediaLibrary];
  id v10 = [(MLSyncClient *)self _tracksToSyncPredicateWithMediaType:8];
  id v11 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v8 predicate:v10 orderingTerms:0];

  __int16 v12 = [(MLSyncClient *)self _tracksNeedingDownloadPredicateWithMediaType:8];
  int v13 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v8 predicate:v12 orderingTerms:0];

  id v14 = [v11 countOfEntities];
  id v15 = [v13 countOfEntities];
  v21[0] = @"TrackCount";
  int v16 = +[NSNumber numberWithUnsignedInteger:v14];
  v22[0] = v16;
  v21[1] = @"TrackRemainingCount";
  BOOL v17 = +[NSNumber numberWithUnsignedInteger:v15];
  v22[1] = v17;
  v21[2] = @"UnknownSyncedPlaylistId";
  int v18 = +[NSNumber numberWithBool:v9];
  v22[2] = v18;
  BOOL v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  int v20 = [v7 responseWithError:0 parameters:v19];

  [v6 sendResponse:v20 withCompletion:0];
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 command];
  unsigned int v8 = [v7 isEqualToString:@"UpdateSettings"];

  if (v8)
  {
    [(MLSyncClient *)self _handleUpdateSettingsRequest:v6 onMessageLink:v13];
  }
  else
  {
    BOOL v9 = [v6 command];
    unsigned int v10 = [v9 isEqualToString:@"StatusReport"];

    if (v10)
    {
      [(MLSyncClient *)self _handleStatusReportRequest:v6 onMessageLink:v13];
    }
    else
    {
      id v11 = +[NSError errorWithDomain:@"ATError" code:21 userInfo:0];
      __int16 v12 = [v6 responseWithError:v11 parameters:0];
      [v13 sendResponse:v12 withCompletion:&stru_9A6A0];
    }
  }
}

- (void)_validatePlaylistSettings
{
  char v3 = [(MLSyncClient *)self _library];
  if ([self->_nanoSyncSettings assetSyncType] == (char *)&dword_0 + 1)
  {
    id v4 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
    id v5 = [v4 longLongValue];

    if (v5)
    {
      id v6 = [objc_alloc((Class)ML3Container) initWithPersistentID:v5 inLibrary:v3];
      if (([v6 existsInLibrary] & 1) == 0)
      {
        id v7 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 134217984;
          id v9 = v5;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "asset sync playlist %lld has been removed - clearing settings", (uint8_t *)&v8, 0xCu);
        }

        [self->_nanoSyncSettings setAssetSyncType:0];
        [self->_nanoSyncSettings setAssetSyncPlaylistPersistentID:&off_9C9D8];
      }
    }
  }
}

- (void)_sendUpdatedSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);
  if ([WeakRetained isInitialized])
  {
    id v4 = +[NSMutableDictionary dictionary];
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(@"MusicSoundCheckEnabledSetting", @"com.apple.mobileipod", &keyExistsAndHasValidFormat))
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = keyExistsAndHasValidFormat == 0;
    }
    uint64_t v6 = v5;
    id v7 = (void *)CFPreferencesCopyAppValue(@"SortAlbums", @"com.apple.Music");
    int v8 = +[NSNumber numberWithUnsignedChar:v6];
    [v4 setObject:v8 forKey:@"SoundCheckEnabled"];

    id v9 = +[NSNumber numberWithUnsignedChar:1];
    [v4 setObject:v9 forKey:@"ShowAllMusic"];

    if (v7) {
      [v4 setObject:v7 forKey:@"MusicSortingPreference"];
    }
    [(MLSyncClient *)self _validatePlaylistSettings];
    unsigned int v10 = [(MLSyncClient *)self _getPlaylistSyncSettings];
    if (v10) {
      [v4 setObject:v10 forKey:@"Playlist"];
    }
    id v11 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "sending updated music settings %{public}@", buf, 0xCu);
    }

    id v12 = [objc_alloc((Class)ATRequest) initWithCommand:@"UpdateSettings" dataClass:@"MediaMessages" parameters:v4];
    [WeakRetained sendRequest:v12 withCompletion:&stru_9A680];
  }
}

- (void)messageLinkWasClosed:(id)a3
{
  p_messageLink = &self->_messageLink;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_messageLink);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_messageLink, 0);
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  if ([a3 endpointType] == 1)
  {
    [(MLSyncClient *)self _sendUpdatedSettings];
  }
}

- (void)messageLinkWasOpened:(id)a3
{
  p_messageLink = &self->_messageLink;
  id v5 = a3;
  objc_storeWeak((id *)p_messageLink, v5);
  [v5 addRequestHandler:self forDataClass:@"MediaMessages"];
}

- (void)_invokeHasChangesCallbackWithPriority:(int)a3
{
  if ([(MLSyncClient *)self isEnabled])
  {
    id v3 = +[ATDeviceService sharedInstance];
    [v3 syncChangesForDataClass:@"Media" withPriority:2];
  }
}

- (void)_handleStoreFrontDidChange
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "account store front did change changed - requesting a sync", v4, 2u);
  }

  [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:2];
}

- (void)_handleAccountsDidChange
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "account settings have changed - requesting a sync", v4, 2u);
  }

  [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:2];
}

- (void)_syncUpdatedSettingsToPairedDevice
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4A59C;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)_shouldCancelActiveSessionsForLegacyPairedDevices
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 getActivePairedDevice];
  if (v4)
  {
    unsigned int v5 = NRWatchOSVersionForRemoteDevice();
    BOOL v6 = v5 < 0x40000;
  }
  else
  {
    id v7 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Sync Registry reports no active paired device", (uint8_t *)&v11, 0xCu);
    }

    BOOL v6 = 0;
    unsigned int v5 = -1;
  }
  int v8 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "will not";
    int v11 = 138543874;
    id v12 = self;
    if (v6) {
      id v9 = "will";
    }
    __int16 v13 = 1024;
    unsigned int v14 = v5;
    __int16 v15 = 2080;
    int v16 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Device is running %u - companion %s cancel active sessions", (uint8_t *)&v11, 0x1Cu);
  }

  return v6;
}

- (void)_handleSessionsDidChangeNotification:(id)a3
{
  id v4 = +[ATSession sessionsWithSessionTypeIdentifier:ATSessionTypeDeviceSync];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isCancelled] & 1) == 0
          && ([v9 isFinished] & 1) == 0)
        {
          unsigned int v10 = [v9 dataClass];
          unsigned int v11 = [v10 isEqualToString:@"Media"];

          if (v11) {
            [v9 addObserver:self];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_handleSyncDefaultsSyncSettingsDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4A9A8;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_hasRelevantChangesToSync
{
  id v3 = [(MLSyncClient *)self _library];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  unint64_t lastSyncedRevision = self->_lastSyncedRevision;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4AD04;
  v15[3] = &unk_9A5C8;
  v15[4] = &v16;
  objc_msgSend(v3, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", lastSyncedRevision, +[ML3Track revisionTrackingCode](ML3Track, "revisionTrackingCode"), 3, &off_9D010, 0, v15);
  if (!*((unsigned char *)v17 + 24))
  {
    unint64_t v5 = self->_lastSyncedRevision;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_4AD1C;
    v14[3] = &unk_9A5F0;
    v14[4] = &v16;
    objc_msgSend(v3, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:usingBlock:", v5, +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode"), 3, v14);
  }
  int v6 = _os_feature_enabled_impl();
  uint64_t v7 = v17;
  if (v6)
  {
    if (!*((unsigned char *)v17 + 24))
    {
      unint64_t v8 = self->_lastSyncedRevision;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_4AD34;
      v13[3] = &unk_9A618;
      v13[4] = &v16;
      objc_msgSend(v3, "enumerateAlbumArtistPersistentIDsAfterRevision:revisionTrackingCode:usingBlock:", v8, +[ML3AlbumArtist revisionTrackingCode](ML3AlbumArtist, "revisionTrackingCode"), v13);
      uint64_t v7 = v17;
      if (!*((unsigned char *)v17 + 24))
      {
        unint64_t v9 = self->_lastSyncedRevision;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_4AD4C;
        v12[3] = &unk_9A640;
        v12[4] = &v16;
        objc_msgSend(v3, "enumerateAlbumPersistentIDsAfterRevision:revisionTrackingCode:usingBlock:", v9, +[ML3Album revisionTrackingCode](ML3Album, "revisionTrackingCode"), v12);
        uint64_t v7 = v17;
      }
    }
  }
  char v10 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)_handleNonContentsPropertiesDidChangeNotification:(id)a3
{
  if ([(MLSyncClient *)self _hasRelevantChangesToSync])
  {
    [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:2];
  }
}

- (void)_handleDisplayValuesChangedNotification:(id)a3
{
  if ([(MLSyncClient *)self _hasRelevantChangesToSync])
  {
    [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:2];
  }
}

- (void)_handleContentsChangedNotification:(id)a3
{
  if (self->_syncClientDelegate)
  {
    id v7 = [(MLSyncClient *)self _library];
    id v4 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
    id v5 = [v4 longLongValue];

    if (v5)
    {
      id v6 = [objc_alloc((Class)ML3Container) initWithPersistentID:v5 inLibrary:v7];
      if (([v6 existsInLibrary] & 1) == 0) {
        [(MLSyncClient *)self _syncUpdatedSettingsToPairedDevice];
      }
    }
    if ([(MLSyncClient *)self _hasRelevantChangesToSync]) {
      [(MLSyncClient *)self _invokeHasChangesCallbackWithPriority:2];
    }
  }
}

- (BOOL)_syncedPlaylistIdInMediaLibrary
{
  return 1;
}

- (BOOL)_applyMediaPinningSettings
{
  return 1;
}

- (id)_getPlaylistSyncSettings
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:4];
  id v4 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
  if (v4) {
    [v3 setObject:v4 forKey:@"SyncPlaylistID"];
  }
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [self->_nanoSyncSettings assetSyncLimitType]);
  [v3 setObject:v5 forKey:@"SyncLimitType"];

  id v6 = [self->_nanoSyncSettings assetSyncLimit];
  if (v6) {
    [v3 setObject:v6 forKey:@"SyncLimit"];
  }
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [self->_nanoSyncSettings assetSyncType]);
  [v3 setObject:v7 forKey:@"SyncType"];

  return v3;
}

- (void)getDataForGeniusAsset:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:@"ATError" code:3 userInfo:0];
  (*((void (**)(id, id, void, void))a4 + 2))(v5, v6, 0, 0);
}

- (void)getDataForArtworkAsset:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(MLSyncClient *)self _library];
  unint64_t v9 = [v6 assetType];
  unsigned int v10 = [v9 isEqualToString:@"Playlist"];

  if (v10) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = 1;
  }
  long long v12 = (void **)ML3Container_ptr;
  if (!v10) {
    long long v12 = (void **)ML3Track_ptr;
  }
  long long v13 = *v12;
  long long v14 = [v6 identifier];
  id v15 = objc_msgSend(v13, "newWithPersistentID:inLibrary:", objc_msgSend(v14, "longLongValue"), v8);

  v50 = v15;
  id v16 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v15 artworkType:v11];
  v49 = [v16 availableArtworkToken];
  if ([v49 length])
  {
    id v17 = objc_alloc((Class)ML3Artwork);
    uint64_t v18 = [v16 availableArtworkToken];
    id v19 = [v17 initWithToken:v18 artworkType:1 musicLibrary:v8];
  }
  else
  {
    id v19 = 0;
  }
  int v20 = [v19 originalFileURL];
  id v21 = +[NSFileManager defaultManager];
  if (v19
    && ([v20 path],
        id v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v21 fileExistsAtPath:v22],
        v22,
        v23))
  {
    v48 = v21;
    id v24 = [v6 variantOptions];
    id v25 = [v24 objectForKey:@"Dimensions"];

    uint64_t v26 = [v6 variantOptions];
    v27 = [v26 objectForKey:@"Quality"];

    v46 = v27;
    if (v27)
    {
      [v27 floatValue];
      double v29 = v28;
    }
    else
    {
      double v29 = 0.9;
    }
    v47 = v8;
    if (v25 && [v25 count] == (char *)&dword_0 + 2)
    {
      uint64_t v31 = [v25 objectAtIndexedSubscript:0];
      signed int v32 = [v31 intValue];

      uint64_t v33 = [v25 objectAtIndexedSubscript:1];
      signed int v34 = [v33 intValue];

      if (v32 <= v34) {
        int v35 = v34;
      }
      else {
        int v35 = v32;
      }
      double v36 = (double)v35;
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4B5C4;
      block[3] = &unk_9A5A0;
      id v52 = v20;
      double v55 = v29;
      double v56 = v36;
      id v54 = v7;
      id v53 = v6;
      dispatch_async(queue, block);

      uint64_t v38 = v52;
    }
    else
    {
      v45 = (void (**)(id, void, void *, void *))v7;
      v39 = [v20 path];
      uint64_t v38 = [v48 attributesOfItemAtPath:v39 error:0];

      if (v38)
      {
        uint64_t v40 = [v38 objectForKeyedSubscript:NSFileSize];
        objc_msgSend(v6, "setTotalBytes:", objc_msgSend(v40, "unsignedLongLongValue"));
      }
      v59[0] = @"_AssetFileName";
      uint64_t v41 = [v20 lastPathComponent];
      v60[0] = v41;
      v59[1] = @"_AssetSize";
      v42 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 totalBytes]);
      v60[1] = v42;
      v43 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];

      v44 = +[NSInputStream inputStreamWithURL:v20];
      v45[2](v45, 0, v44, v43);

      id v7 = v45;
    }

    unint64_t v8 = v47;
    id v21 = v48;
  }
  else
  {
    uint64_t v30 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v20;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "no original artwork file for asset at path %{public}@", buf, 0xCu);
    }

    id v25 = +[NSError errorWithDomain:@"ATError" code:3 userInfo:0];
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v25, 0, 0);
  }
}

- (void)getDataForTrackAsset:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *, void *))a4;
  unint64_t v8 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "getDataForTrackAsset %{public}@", buf, 0xCu);
  }

  unint64_t v9 = [v6 identifier];
  id v10 = [v9 longLongValue];

  int v35 = +[NSFileManager defaultManager];
  signed int v34 = [(MLSyncClient *)self _library];
  id v11 = [objc_alloc((Class)ML3Track) initWithPersistentID:v10 inLibrary:v34];
  uint64_t v12 = ML3TrackPropertyIsDeprotected;
  uint64_t v13 = ML3TrackPropertyTotalSize;
  v42[0] = ML3TrackPropertyIsDeprotected;
  v42[1] = ML3TrackPropertyTotalSize;
  uint64_t v14 = ML3TrackPropertyStoreProtectionType;
  uint64_t v15 = ML3TrackPropertyIsStoreRedownloadable;
  v42[2] = ML3TrackPropertyStoreProtectionType;
  v42[3] = ML3TrackPropertyIsStoreRedownloadable;
  id v16 = +[NSArray arrayWithObjects:v42 count:4];
  id v17 = [v11 getValuesForProperties:v16];

  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v18 = [v17 valueForKey:v12];
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    int v20 = [v17 valueForKey:v13];
    objc_msgSend(v6, "setTotalBytes:", objc_msgSend(v20, "unsignedLongLongValue"));

    id v21 = [v11 absoluteFilePath];
    char v36 = 0;
    if (v21)
    {
      if ([v35 fileExistsAtPath:v21 isDirectory:&v36])
      {
        if (!v36)
        {
          CFStringRef v39 = @"MLAssetProtectionType";
          float v28 = [v17 valueForKey:v14];
          uint64_t v40 = v28;
          double v29 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

          v37[0] = @"_AssetFileName";
          uint64_t v30 = [v21 lastPathComponent];
          v38[0] = v30;
          v37[1] = @"_AssetSize";
          uint64_t v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 totalBytes]);
          v37[2] = @"_AssetClientParams";
          v38[1] = v31;
          v38[2] = v29;
          signed int v32 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

          uint64_t v33 = +[NSInputStream inputStreamWithFileAtPath:v21];
          v7[2](v7, 0, v33, v32);

          goto LABEL_19;
        }
        id v22 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v44 = v21;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Not providing track asset since its a directory: '%{public}@'", buf, 0xCu);
        }
      }
      else
      {
        unsigned int v23 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v44 = v21;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "track has an invalid file path '%{public}@' - clearing location data", buf, 0xCu);
        }

        id v22 = +[NSNumber numberWithLongLong:v10];
        uint64_t v41 = v22;
        id v24 = +[NSArray arrayWithObjects:&v41 count:1];
        +[ML3Track clearLocationFromLibrary:v34 persistentIDs:v24 disableKeepLocal:0];
      }
    }
  }
  id v25 = [v17 valueForKey:v15];
  unsigned __int8 v26 = [v25 BOOLValue];

  if ((v26 & 1) == 0) {
    uint64_t v27 = 26;
  }
  else {
LABEL_16:
  }
    uint64_t v27 = 16;
  id v21 = +[NSError errorWithDomain:@"ATError" code:v27 userInfo:0];
  ((void (**)(id, void *, void *, void *))v7)[2](v7, v21, 0, 0);
LABEL_19:
}

- (void)getDataForAsset:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4BE8C;
  block[3] = &unk_9A578;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)assetSyncDidCompleteWithError:(id)a3
{
  id v4 = a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27[0] = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "assetSync complete. err=%{public}@", buf, 0xCu);
  }

  id v6 = [(MLSyncClient *)self _library];
  [(MLSyncClient *)self _processCompletedAssets];
  if (self->_performPostSyncUpdates)
  {
    [(MLSyncClient *)self assetTransferEndedWithSuccess:v4 == 0];
    self->_performPostSyncUpdates = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);
  unint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained endpointType] == 1)
    {
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = [objc_alloc((Class)ATRequest) initWithCommand:@"StatusReport" dataClass:@"MediaMessages" parameters:0];
      int v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      id v22 = sub_4C3B0;
      unsigned int v23 = &unk_9A490;
      id v24 = self;
      dispatch_semaphore_t v25 = v9;
      id v11 = v9;
      [v8 sendRequest:v10 withCompletion:&v20];
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v10 = [self->_nanoSyncSettings assetSyncPlaylistPersistentID];
      if (![v10 longLongValue])
      {
LABEL_17:

        goto LABEL_18;
      }
      unsigned int v12 = [(MLSyncClient *)self _syncedPlaylistIdInMediaLibrary];
      uint64_t v13 = [(MLSyncClient *)self _tracksNeedingDownloadPredicateWithMediaType:8];
      id v11 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v6 predicate:v13 orderingTerms:0];

      id v14 = [v11 countOfEntities];
      uint64_t v15 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v27[0]) = v14;
        WORD2(v27[0]) = 1024;
        *(_DWORD *)((char *)v27 + 6) = v12;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "remainingaAssetsCount=%d, syncedPlaylistIdInMediaLibrary=%d", buf, 0xEu);
      }

      if (v14) {
        unsigned int v16 = 0;
      }
      else {
        unsigned int v16 = v12;
      }
      if (v16 == 1) {
        [(MLSyncClient *)self _updateSyncPlaylistToCurrentRevision];
      }
    }

    goto LABEL_17;
  }
LABEL_18:
  id v17 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v18 = [v17 isWatch];

  if (v18)
  {
    unsigned int v19 = [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper keepLocalEventHandler];
    [v19 startKeepLocalSessionInBackground:1];

    [v6 databaseConnectionAllowingWrites:0 withBlock:&stru_9A4D0];
  }
}

- (void)_processCompletedAssets
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(NSMutableArray *)self->_downloadedAssets count];
    *(_DWORD *)buf = 67109120;
    unsigned int v8 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "processing %d completed assets", buf, 8u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4CBAC;
  block[3] = &unk_9AF48;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)assetSync:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "failed to sync asset %{public}@. error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    queue = self->_queue;
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    unsigned int v16 = sub_4D880;
    id v17 = &unk_9A930;
    unsigned int v18 = self;
    id v10 = v6;
    id v19 = v10;
    dispatch_sync(queue, &v14);
    id v11 = objc_msgSend(v10, "variantOptions", v14, v15, v16, v17, v18);
    unsigned int v12 = [v11 objectForKey:@"AssetParts"];
    uint64_t v13 = (char *)[v12 unsignedIntegerValue];

    if ((unint64_t)[(NSMutableArray *)self->_downloadedAssets count] > 0x63
      || v13 == (unsigned char *)&dword_0 + 1)
    {
      [(MLSyncClient *)self _processCompletedAssets];
    }
  }
}

- (id)_geniusAssetsToSync
{
  id v2 = objc_alloc_init((Class)NSMutableOrderedSet);

  return v2;
}

- (id)_artworkAssetsToSyncWithMaximumTotalSize:(unint64_t)a3 totalSize:(unint64_t *)a4
{
  id v7 = objc_alloc_init((Class)NSMutableOrderedSet);
  unsigned int v8 = [(MLSyncClient *)self _songArtworkSizeVariant];
  dispatch_semaphore_t v9 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v10 = [v9 isWatch];

  id v11 = [(MLSyncClient *)self _library];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_4DB98;
  v33[3] = &unk_9A440;
  uint64_t v36 = 102400;
  uint64_t v37 = a4;
  unint64_t v38 = a3;
  id v12 = v8;
  id v34 = v12;
  unsigned __int8 v39 = v10;
  id v13 = v7;
  id v35 = v13;
  [v11 databaseConnectionAllowingWrites:0 withBlock:v33];
  uint64_t v14 = ML3ContainerPropertySyncId;
  uint64_t v15 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertySyncId value:&off_9C9D8 comparison:2];
  uint64_t v41 = v15;
  unsigned int v16 = +[NSArray arrayWithObjects:&v41 count:1];
  id v17 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v16];

  unsigned int v18 = +[ML3Container queryWithLibrary:v11 predicate:v17 orderingTerms:0];
  v40[0] = ML3ContainerPropertyName;
  v40[1] = v14;
  id v19 = +[NSArray arrayWithObjects:v40 count:2];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_4DC74;
  v26[3] = &unk_9A468;
  uint64_t v30 = 102400;
  uint64_t v31 = a4;
  unint64_t v32 = a3;
  id v27 = v11;
  id v28 = v12;
  id v20 = v13;
  id v29 = v20;
  id v21 = v12;
  id v22 = v11;
  [v18 enumeratePersistentIDsAndProperties:v19 usingBlock:v26];

  id v23 = v29;
  id v24 = v20;

  return v24;
}

- (id)_songArtworkSizeVariant
{
  if (qword_A4AE0 != -1) {
    dispatch_once(&qword_A4AE0, &stru_9A3F0);
  }
  id v2 = (void *)qword_A4AD8;

  return v2;
}

- (id)_trackAssetsToSyncWithMediaType:(unsigned int)a3 withAllowedPids:(id)a4 maximumTotalSize:(unint64_t)a5 totalSize:(unint64_t *)a6
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v82 = objc_alloc_init((Class)NSMutableOrderedSet);
  dispatch_semaphore_t v9 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v79 = [v9 isWatch];

  unsigned __int8 v10 = [(MLSyncClient *)self _library];
  id v11 = +[NSMutableArray arrayWithCapacity:10];
  int v78 = v6;
  id v12 = [(MLSyncClient *)self _tracksNeedingDownloadPredicateWithMediaType:v6];
  uint64_t v13 = +[ML3PersistentIDsPredicate predicateWithPersistentIDs:v8 shouldContain:1];
  uint64_t v14 = &ATGetPhysicalSizeForLogicalSize_ptr;
  id v54 = v8;
  id v52 = (void *)v13;
  if (v8)
  {
    v110[0] = v12;
    v110[1] = v13;
    uint64_t v15 = +[NSArray arrayWithObjects:v110 count:2];
    id v16 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v15];
  }
  else
  {
    id v16 = v12;
  }
  id v53 = v12;
  if (v16)
  {
    id v17 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v10 predicate:v16 orderingTerms:0];
    [v11 addObject:v17];
  }
  v51 = v16;
  if (v79)
  {
    int v18 = _os_feature_enabled_impl();
    if (v78 == 8)
    {
      if (v18)
      {
        uint64_t v19 = +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", ML3EntityPropertyKeepLocal, &off_9C9D8, 3, v16, v52, v12, v54);
        uint64_t v20 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyBaseLocationID value:&off_9C9D8 comparison:1];
        uint64_t v21 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyRemoteLocationID value:&off_9CA50 comparison:1];
        v74 = +[ML3BitMaskPredicate predicateWithProperty:ML3TrackPropertyMediaType mask:1032 value:8];
        v109[0] = v74;
        v109[1] = v21;
        v80 = (void *)v21;
        v83 = (void *)v20;
        v109[2] = v20;
        id v22 = +[NSArray arrayWithObjects:v109 count:3];
        id v23 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v22];

        id v24 = +[ML3Album queryWithLibrary:v10 predicate:v19];
        +[NSMutableArray array];
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_4EC78;
        v103[3] = &unk_9ABC0;
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v104 = v25;
        v72 = v24;
        [v24 enumeratePersistentIDsUsingBlock:v103];
        if ([v25 count])
        {
          unsigned __int8 v26 = +[ML3Album trackForeignPersistentID];
          id v27 = +[ML3ContainsPredicate predicateWithProperty:v26 values:v25];

          v108[0] = v27;
          v108[1] = v23;
          id v28 = +[NSArray arrayWithObjects:v108 count:2];
          id v29 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v28];
          uint64_t v30 = +[ML3Track queryWithLibrary:v10 predicate:v29 orderingTerms:0];
          [v11 addObject:v30];
        }
        v68 = v25;
        uint64_t v31 = +[NSMutableArray array];
        v70 = (void *)v19;
        unint64_t v32 = +[ML3Container queryWithLibrary:v10 predicate:v19];
        v100[0] = _NSConcreteStackBlock;
        v100[1] = 3221225472;
        v100[2] = sub_4ECD8;
        v100[3] = &unk_9A3A8;
        id v101 = v10;
        id v33 = v31;
        id v102 = v33;
        id v34 = v32;
        [v32 enumeratePersistentIDsUsingBlock:v100];
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v35 = v33;
        id v36 = [v35 countByEnumeratingWithState:&v96 objects:v107 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v97;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v97 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = +[ML3Track containerQueryWithContainer:*(void *)(*((void *)&v96 + 1) + 8 * i) predicate:v23];
              [v11 addObject:v40];
            }
            id v37 = [v35 countByEnumeratingWithState:&v96 objects:v107 count:16];
          }
          while (v37);
        }

        uint64_t v14 = &ATGetPhysicalSizeForLogicalSize_ptr;
      }
    }
  }
  v81 = v10;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = v11;
  id v84 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
  if (v84)
  {
    uint64_t v75 = *(void *)v93;
    uint64_t v73 = ML3TrackPropertyPodcastExternalGUID;
    uint64_t v71 = ML3TrackPropertyStoreAccountID;
    uint64_t v69 = ML3TrackPropertyStoreItemID;
    uint64_t v67 = ML3TrackPropertyStoreFlavor;
    uint64_t v66 = ML3TrackPropertyStoreMatchedStatus;
    uint64_t v65 = ML3TrackPropertyStoreRedownloadedStatus;
    uint64_t v64 = ML3TrackPropertyStoreSagaID;
    uint64_t v63 = ML3TrackPropertySyncID;
    uint64_t v62 = ML3TrackPropertyNeedsRestore;
    uint64_t v61 = ML3TrackPropertyIsRental;
    uint64_t v60 = ML3TrackPropertyTitle;
    uint64_t v59 = ML3TrackPropertyTotalSize;
    uint64_t v58 = ML3TrackPropertyStorePlaybackEndpointType;
    uint64_t v57 = ML3TrackPropertyStoreRedownloadParameters;
    uint64_t v56 = ML3TrackPropertySubscriptionStoreItemID;
    uint64_t v41 = ML3TrackPropertySyncRedownloadParams;
    uint64_t v42 = ML3TrackPropertyStoreCloudAssetAvailable;
    uint64_t v43 = ML3EntityPropertyKeepLocal;
    uint64_t v44 = ML3TrackPropertyTotalTime;
    uint64_t v45 = ML3TrackPropertyPurchaseHistoryRedownloadParameters;
    do
    {
      for (j = 0; j != v84; j = (char *)j + 1)
      {
        if (*(void *)v93 != v75) {
          objc_enumerationMutation(obj);
        }
        v47 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
        v105[0] = v73;
        v105[1] = v71;
        v105[2] = v69;
        v105[3] = v67;
        v105[4] = v66;
        v105[5] = v65;
        v105[6] = v64;
        v105[7] = v63;
        v105[8] = v62;
        v105[9] = v61;
        v105[10] = v60;
        v105[11] = v59;
        v105[12] = v58;
        v105[13] = v57;
        v105[14] = v56;
        v105[15] = v41;
        v105[16] = v42;
        v105[17] = v43;
        v105[18] = v44;
        v105[19] = v45;
        objc_msgSend(v14[294], "arrayWithObjects:count:", v105, 20, v51);
        v49 = v48 = v14;
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_4ED48;
        v85[3] = &unk_9A3D0;
        int v90 = v78;
        v88 = a6;
        unint64_t v89 = a5;
        id v86 = v81;
        char v91 = v79;
        id v87 = v82;
        [v47 enumeratePersistentIDsAndProperties:v49 usingBlock:v85];

        uint64_t v14 = v48;
      }
      id v84 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
    }
    while (v84);
  }

  return v82;
}

- (id)_tracksNeedingDownloadPredicateWithMediaType:(unsigned int)a3
{
  id v3 = [(MLSyncClient *)self _tracksToSyncPredicateWithMediaType:*(void *)&a3];
  uint64_t v4 = ML3TrackPropertyBaseLocationID;
  id v5 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyBaseLocationID equalToInt64:0];
  uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:v4 equalToInt64:200];
  v21[0] = v5;
  v21[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v21 count:2];
  id v8 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v7];

  dispatch_semaphore_t v9 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreCloudAssetAvailable equalToInt64:1];
  v20[0] = v9;
  unsigned __int8 v10 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyIsInMyLibrary equalToInt64:1];
  v20[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v20 count:2];
  id v12 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v11];

  v19[0] = v3;
  v19[1] = v12;
  v18[0] = v3;
  v18[1] = v8;
  uint64_t v13 = +[NSArray arrayWithObjects:v18 count:2];
  uint64_t v14 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v13];
  v19[2] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v19 count:3];
  id v16 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v15];

  return v16;
}

- (unint64_t)_sizeForDownloadedTracksWithMediaType:(unsigned int)a3 minimumKeepLocalValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [(MLSyncClient *)self _library];
  if (a3 == 8)
  {
    id v8 = [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper keepLocalEventHandler];
    id v9 = [v8 sizeOfMediaItemsDownloadedForAutomaticallyPinnedCollectionsWithMusicLibrary:v7];
  }
  else
  {
    uint64_t v10 = ML3EntityPropertyKeepLocal;
    id v11 = +[NSNumber numberWithInt:v4];
    id v12 = +[ML3ComparisonPredicate predicateWithProperty:v10 value:v11 comparison:4];
    uint64_t v13 = +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", ML3TrackPropertyBaseLocationID, &off_9C9D8, 2, v12);
    v19[1] = v13;
    uint64_t v14 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyMediaType equalToInt64:a3];
    v19[2] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v19 count:3];
    id v8 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v15];

    id v16 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v7 predicate:v8 orderingTerms:0];
    id v17 = [v16 valueForAggregateFunction:ML3QueryAggregateFunctionTotal onEntitiesForProperty:ML3TrackPropertyTotalSize];
    id v9 = [v17 unsignedLongLongValue];
  }
  return (unint64_t)v9;
}

- (id)_tracksToSyncPredicateWithMediaType:(unsigned int)a3
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertySyncID value:&off_9C9D8 comparison:2];
  v8[0] = v3;
  uint64_t v4 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyNeedsRestore equalToInt64:1];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  uint64_t v6 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v5];

  return v6;
}

- (void)assetsToSyncWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4FB14;
  v7[3] = &unk_9AAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)assetDataClass
{
  return @"Media";
}

- (BOOL)_shouldSyncPlaylistWithPersistentId:(int64_t)a3 forSupportedMediaTypes:(id)a4 includeNonLibraryContent:(BOOL)a5 pairedDeviceCanProcessStandaloneCollections:(BOOL)a6
{
  id v10 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v11 = [(MLSyncClient *)self _library];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4FE8C;
  v15[3] = &unk_9A380;
  id v16 = @"SELECT is_hidden, smart_is_genius, contained_media_type, distinguished_kind, is_ignorable_itunes_playlist, cloud_is_subscribed FROM container WHERE container.ROWID = ?";
  int64_t v19 = a3;
  id v12 = v10;
  BOOL v20 = a6;
  id v17 = v12;
  int v18 = &v22;
  BOOL v21 = a5;
  [v11 databaseConnectionAllowingWrites:0 withBlock:v15];
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)syncCompletedWithError:(id)a3
{
  id v4 = a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "sync session completed. err=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    id v6 = +[MLMediaLibraryService sharedMediaLibraryService];
    [v6 cancelImportOperation:7 completionHandler:&stru_9A330];
  }
  else
  {
    self->_unint64_t lastSyncedRevision = [(MLSyncClient *)self currentRevision];
  }
}

- (void)resetSyncDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MLSyncClient *)self _library];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5045C;
  v7[3] = &unk_9A2F0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeSource:3 withCompletionHandler:v7];
}

- (void)_applyLibrarySettingsFromSyncParams:(id)a3
{
  id v4 = a3;
  id v5 = [(MLSyncClient *)self _library];
  id v6 = [v4 objectForKey:@"MLCloudAccountID"];
  id v7 = [v6 unsignedLongLongValue];

  id v8 = [v4 objectForKey:@"MLJaliscoAccountID"];
  id v9 = [v8 unsignedLongLongValue];

  id v10 = [v4 objectForKey:@"MLCloudDatabaseRevision"];
  id v43 = [v10 unsignedLongValue];

  id v11 = [v4 objectForKey:@"MLJaliscoDatabaseRevision"];
  id v44 = [v11 unsignedLongValue];

  id v12 = [v4 objectForKey:@"MLSyncParamMLSagaDatabaseUserVersion"];
  id v39 = [v12 unsignedLongValue];

  char v13 = [v4 objectForKey:@"MLSagaClientFeaturesVersion"];
  uint64_t v14 = [v4 objectForKey:@"MLSyncParamMLSagaClientAddToLibraryWhenFavoriting"];
  uint64_t v15 = [v5 sagaAccountID];
  id v16 = [v15 longLongValue];

  id v17 = [v5 jaliscoAccountID];
  id v18 = [v17 longLongValue];

  id v19 = [v5 sagaOnDiskDatabaseRevision];
  id v41 = [v5 jaliscoOnDiskDatabaseRevision];
  id v42 = [v5 sagaDatabaseUserVersion];
  uint64_t v45 = (void *)v14;
  if (v7 == v16)
  {
    if (!v7) {
      goto LABEL_14;
    }
LABEL_12:
    id v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v7, v39);
    goto LABEL_15;
  }
  BOOL v20 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v48 = v16;
    __int16 v49 = 2048;
    id v50 = v7;
    __int16 v51 = 2114;
    uint64_t v52 = v14;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "updating cloud account id from paired device: %lld --> %lld, addEntityToLibraryWhenFavoritingBehavior=%{public}@", buf, 0x20u);
  }

  if (v7)
  {
    BOOL v21 = +[NSNumber numberWithUnsignedLongLong:v7];
    [v5 setSagaAccountID:v21];

    [v5 setSagaOnDiskDatabaseRevision:v43];
    [v5 setSagaClientFeaturesVersion:v13];
    if (v45) {
      objc_msgSend(v5, "setSagaCloudFavoriteSongAddToLibraryBehavior:", (int)objc_msgSend(v45, "intValue"));
    }
    uint64_t v22 = (void *)MSVCopySystemBuildVersion();
    if ([v22 length]) {
      [v5 setSagaLastCloudUpdateClientBuildVersion:v22];
    }

    goto LABEL_12;
  }
  [v5 clearSagaCloudAccountID];
  [v5 setSagaOnDiskDatabaseRevision:0];
  [v5 clearSagaClientFeaturesVersion];
  [v5 clearSagaCloudFavoriteSongAddToLibraryBehavior];
  [v5 clearSagaLastUpdatedClientBuildVersion];
LABEL_14:
  id v23 = 0;
LABEL_15:
  uint64_t v24 = +[ICUserIdentityStore defaultIdentityStore];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_50C04;
  v46[3] = &unk_9A2C8;
  v46[4] = v7;
  v46[5] = v16;
  [v24 setActiveLockerAccountWithDSID:v23 completionHandler:v46];

  if (v9 != v18)
  {
    char v25 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v48 = v18;
      __int16 v49 = 2048;
      id v50 = v9;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "updating jalisco account id from paired device: %lld --> %lld", buf, 0x16u);
    }

    if (v9)
    {
      unsigned __int8 v26 = +[NSNumber numberWithUnsignedLongLong:v9];
      [v5 setJaliscoAccountID:v26];

      id v27 = v44;
    }
    else
    {
      [v5 clearJaliscoAccountID];
      id v27 = 0;
    }
    [v5 setJaliscoOnDiskDatabaseRevision:v27];
  }
  if (!v19)
  {
    [v5 setSagaOnDiskDatabaseRevision:v43];
    [v5 setSagaClientFeaturesVersion:v13];
    uint64_t v31 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v48 = v43;
      __int16 v49 = 2114;
      id v50 = v13;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "setting saga on disk revision=%llu, sagaClientFeaturesVersion=%{public}@", buf, 0x16u);
    }
    id v29 = v44;
    goto LABEL_32;
  }
  BOOL v28 = v7 == v16;
  id v29 = v44;
  if (v28 && v43 > v19)
  {
    uint64_t v30 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "paired device has newer saga revision - triggering a poll", buf, 2u);
    }

    uint64_t v31 = objc_alloc_init((Class)ICCloudClient);
    [v31 updateSagaLibraryWithReason:3 completionHandler:0];
LABEL_32:
  }
  if (!v41)
  {
    [v5 setJaliscoOnDiskDatabaseRevision:v29];
    unint64_t v32 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v48 = v29;
      id v33 = "setting jalisco on disk revision=%llu";
      id v34 = v32;
      uint32_t v35 = 12;
      goto LABEL_40;
    }
LABEL_41:

    goto LABEL_42;
  }
  if (v9 == v18 && v29 > v41)
  {
    unint64_t v32 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v48 = v41;
      __int16 v49 = 2048;
      id v50 = v29;
      id v33 = "paired device has newer jalisco revision (ours:%llu, theirs: %llu";
      id v34 = v32;
      uint32_t v35 = 22;
LABEL_40:
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
LABEL_42:
  if (!v42) {
    [v5 setSagaDatabaseUserVersion:v40];
  }
  id v36 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [v4 objectForKey:@"MLSyncParamStorefrontIdentifier"];
    *(_DWORD *)buf = 138412290;
    id v48 = v37;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "setting storefront id to %@", buf, 0xCu);
  }
  uint64_t v38 = [v4 objectForKey:@"MLSyncParamStorefrontIdentifier"];
  [v5 setStorefrontIdentifier:v38];
}

- (void)applyChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 fromStream:(id)a5 withSyncParams:(id)a6 withProgressHandler:(id)a7 withCompletionHandler:(id)a8
{
  id v46 = a5;
  id v12 = a6;
  v47 = (void (**)(id, void, id))a7;
  id v44 = (void (**)(id, id, uint64_t, uint64_t))a8;
  char v13 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v46;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "writing incoming sync changes from stream %{public}@. params=%{public}@", buf, 0x16u);
  }

  uint64_t v14 = [(MLSyncClient *)self _library];
  uint64_t v15 = [v12 objectForKey:@"SyncItemCount"];
  id v16 = [v15 unsignedIntegerValue];

  v47[2](v47, 0, v16);
  uint64_t v45 = [v12 objectForKey:@"FormatType"];
  id v17 = [v12 objectForKey:@"LibraryUUID"];
  id v18 = [v12 objectForKey:@"SyncItemCount"];
  id v42 = [v18 longLongValue];

  id v19 = [v14 syncLibraryID];
  BOOL v20 = v19;
  if (v19 == v17) {
    unsigned __int8 v41 = 1;
  }
  else {
    unsigned __int8 v41 = [v19 isEqual:v17];
  }

  BOOL v21 = [v12 objectForKey:@"MLSyncParamCanProcessCollectionsAsStandaloneCollections"];
  unsigned int v40 = [v21 BOOLValue];

  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  id v82 = 0;
  id v82 = [v14 currentRevision];
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  uint64_t v78 = v80[3];
  if (([@"Proto" isEqualToString:v45] & 1) == 0)
  {
    id v37 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_ERROR, "unsupported format type %{public}@", buf, 0xCu);
    }

    id v27 = +[NSError errorWithDomain:@"ATError" code:11 userInfo:0];
    v44[2](v44, v27, v80[3], v76[3]);
    goto LABEL_13;
  }
  if (v46 && v42)
  {
    id v22 = [objc_alloc((Class)MSVStreamReader) initWithInputStream:v46 queue:self->_queue];
    id v23 = objc_alloc_init((Class)MSVFileBufferedPipe);
    uint64_t v24 = [v23 fileHandleForWriting];
    char v25 = [v23 fileHandleForReading];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_51400;
    block[3] = &unk_9A1E0;
    void block[4] = self;
    id v27 = v22;
    id v71 = v27;
    id v39 = v23;
    id v72 = v39;
    id v28 = v24;
    id v73 = v28;
    id v29 = v25;
    id v74 = v29;
    dispatch_sync(queue, block);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3042000000;
    id v84 = sub_51468;
    v85 = sub_51474;
    objc_initWeak(v86, v27);
    uint64_t v63 = _NSConcreteStackBlock;
    uint64_t v64 = 3221225472;
    uint64_t v65 = sub_5147C;
    uint64_t v66 = &unk_9A230;
    uint64_t v67 = self;
    id v68 = v28;
    uint64_t v69 = buf;
    id v38 = v68;
    objc_msgSend(v27, "readAllDataIntoFileHandle:withCompletion:");
    id v30 = objc_alloc((Class)ML3MutableDatabaseImport);
    uint64_t v31 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
    id v32 = [v30 initWithLibraryPath:v31 trackData:0 playlistData:0];

    [v32 setFileHandle:v29];
    [v32 setIsServerImport:a4 == 1];
    [v32 setSyncLibraryID:v17];
    [v32 setSuspendable:0];
    [v32 setPairedDeviceCanProcessStandaloneCollections:v40];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    void v60[2] = sub_515FC;
    v60[3] = &unk_9A258;
    uint64_t v61 = v47;
    id v62 = v42;
    id v33 = objc_retainBlock(v60);
    id v34 = +[MLMediaLibraryService sharedMediaLibraryService];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_51658;
    v48[3] = &unk_9A2A8;
    id v35 = v29;
    id v49 = v35;
    id v50 = self;
    id v36 = v39;
    id v51 = v36;
    double v55 = buf;
    uint64_t v56 = &v79;
    uint64_t v57 = &v75;
    int v58 = a4;
    id v52 = v12;
    char v59 = v41 ^ 1;
    id v53 = v14;
    id v54 = v44;
    [v34 performImport:v32 fromSource:7 withProgressBlock:v33 completionHandler:v48];

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(v86);

LABEL_13:
    goto LABEL_17;
  }
  if (!a4) {
    [(MLSyncClient *)self _applyLibrarySettingsFromSyncParams:v12];
  }
  v44[2](v44, 0, v80[3], v76[3]);
LABEL_17:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
}

- (void)getChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 afterRevision:(unint64_t)a5 upToRevision:(unint64_t)a6 withSyncParams:(id)a7 intoOutputStream:(id)a8 withStartHandler:(id)a9 withProgressHandler:(id)a10 withCompletionHandler:(id)a11
{
  id v87 = a7;
  id v80 = a8;
  uint64_t v81 = (void (**)(id, void *))a9;
  id v84 = (void (**)(id, void, char *))a10;
  uint64_t v79 = (void (**)(id, void))a11;
  uint64_t v139 = 0;
  v140 = (id *)&v139;
  uint64_t v141 = 0x3032000000;
  v142 = sub_52914;
  v143 = sub_52924;
  id v144 = 0;
  id v72 = self;
  char v13 = [(MLSyncClient *)self _library];
  unsigned int v82 = _os_feature_enabled_impl();
  uint64_t v14 = [v87 objectForKey:@"MLSyncParamCanProcessCollectionsAsStandaloneCollections"];
  unsigned int v74 = [v14 BOOLValue];

  if (a4 == 1)
  {
    if (v82)
    {
      id v15 = objc_msgSend(v13, "countOfChangedPersistentIdsAfterRevision:revisionTrackingCode:maximumRevisionType:", a5, +[ML3AlbumArtist revisionTrackingCode](ML3AlbumArtist, "revisionTrackingCode"), 3);
      id v16 = (char *)objc_msgSend(v13, "countOfChangedPersistentIdsAfterRevision:revisionTrackingCode:maximumRevisionType:", a5, +[ML3Album revisionTrackingCode](ML3Album, "revisionTrackingCode"), 1);
    }
    else
    {
      id v16 = 0;
      id v15 = 0;
    }
    id v18 = objc_msgSend(v13, "countOfChangedPersistentIdsAfterRevision:revisionTrackingCode:maximumRevisionType:", a5, +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode"), 3);
    unint64_t v17 = (unint64_t)objc_msgSend(v13, "countOfChangedPersistentIdsAfterRevision:revisionTrackingCode:maximumRevisionType:", a5, +[ML3Track revisionTrackingCode](ML3Track, "revisionTrackingCode"), 3);
  }
  else
  {
    unint64_t v17 = (unint64_t)objc_msgSend(v13, "countOfChangedPersistentIdsAfterRevision:revisionTrackingCode:maximumRevisionType:", a5, +[ML3Track revisionTrackingCode](ML3Track, "revisionTrackingCode"), 1);
    id v16 = 0;
    id v15 = 0;
    id v18 = 0;
  }
  if (a3 == 2) {
    int v19 = 1;
  }
  else {
    int v19 = 2;
  }
  unsigned int v75 = v19;
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  v138[3] = 0;
  uint64_t v77 = +[ICDeviceInfo currentDeviceInfo];
  v157[0] = @"Proto";
  v156[0] = @"FormatType";
  v156[1] = @"SyncItemCount";
  v85 = &v16[(void)v15 + (unint64_t)v18 + v17];
  BOOL v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  v157[1] = v20;
  v157[2] = &__kCFBooleanTrue;
  v156[2] = @"SupportsNonLibraryContent";
  v156[3] = @"MLSyncParamCanProcessCollectionsAsStandaloneCollections";
  BOOL v21 = +[NSNumber numberWithBool:v82];
  v157[3] = v21;
  id v22 = +[NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:4];
  id v23 = +[NSMutableDictionary dictionaryWithDictionary:v22];

  if (a4 == 1)
  {
    uint64_t v24 = [v13 libraryUID];
    [v23 setObject:v24 forKey:@"LibraryUUID"];

    char v25 = [v13 sagaAccountID];
    id v26 = [v25 longLongValue];

    id v27 = [v13 jaliscoAccountID];
    id v28 = [v27 longLongValue];

    id v29 = [v13 sagaOnDiskDatabaseRevision];
    id v30 = [v13 jaliscoOnDiskDatabaseRevision];
    id v31 = [v13 sagaDatabaseUserVersion];
    id v32 = [v13 sagaClientFeaturesVersion];
    id v33 = [v13 sagaCloudFavoriteSongAddToLibraryBehavior];
    id v34 = +[NSNumber numberWithUnsignedLongLong:v26];
    [v23 setObject:v34 forKey:@"MLCloudAccountID"];

    id v35 = +[NSNumber numberWithUnsignedLongLong:v28];
    [v23 setObject:v35 forKey:@"MLJaliscoAccountID"];

    id v36 = +[NSNumber numberWithInteger:v29];
    [v23 setObject:v36 forKey:@"MLCloudDatabaseRevision"];

    id v37 = +[NSNumber numberWithInteger:v30];
    [v23 setObject:v37 forKey:@"MLJaliscoDatabaseRevision"];

    id v38 = +[NSNumber numberWithInteger:v31];
    [v23 setObject:v38 forKey:@"MLSyncParamMLSagaDatabaseUserVersion"];

    if (v32) {
      CFStringRef v39 = v32;
    }
    else {
      CFStringRef v39 = &stru_9B528;
    }
    [v23 setObject:v39 forKey:@"MLSagaClientFeaturesVersion"];
    unsigned int v40 = [v13 storefrontIdentifier];
    if (v40) {
      [v23 setObject:v40 forKey:@"MLSyncParamStorefrontIdentifier"];
    }
    if (v33)
    {
      unsigned __int8 v41 = +[NSNumber numberWithInteger:v33];
      [v23 setObject:v41 forKey:@"MLSyncParamMLSagaClientAddToLibraryWhenFavoriting"];
    }
  }
  else if ([v77 isWatch])
  {
    [v23 setObject:&off_9CFB0 forKey:@"SupportedMediaTypes"];
  }
  id v42 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219266;
    *(void *)&uint8_t buf[4] = a5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a6;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v152) = a3;
    WORD2(v152) = 2048;
    *(void *)((char *)&v152 + 6) = v85;
    HIWORD(v152) = 2114;
    id v153 = v23;
    __int16 v154 = 2114;
    id v155 = v87;
    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "gathering changes for sync. fromRevision=%lld, toRevision=%lld, syncType=%d, totalEntityCount=%lld, syncParams=%{public}@, requestSyncParams=%{public}@", buf, 0x3Au);
  }

  v81[2](v81, v23);
  v84[2](v84, 0, v85);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v152 = sub_52914;
  *((void *)&v152 + 1) = sub_52924;
  id v153 = [objc_alloc((Class)ML3ProtoSyncExportSession) initWithLibrary:v13 outputStream:v80 syncType:v75];
  id v43 = [*(id *)(*(void *)&buf[8] + 40) begin:v85];
  id v44 = +[NSMutableSet set];
  uint64_t v45 = +[NSMutableSet set];
  v76 = +[NSMutableSet set];
  id v46 = [v87 objectForKey:@"SupportsNonLibraryContent"];
  unsigned int v73 = [v46 BOOLValue];

  if (a5) {
    BOOL v47 = a3 == 2;
  }
  else {
    BOOL v47 = 1;
  }
  id v48 = [v87 objectForKey:@"SupportedMediaTypes"];
  if (a4
    || (id v49 = objc_alloc_init((Class)ICCloudClient),
        unsigned int v50 = [v49 isAuthenticated],
        v49,
        !v50))
  {
    if ((v82 & v74) == 1)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v52 = v51;
      uint64_t v134 = 0;
      v135 = &v134;
      uint64_t v136 = 0x2020000000;
      uint64_t v137 = 0;
      id v53 = +[ML3AlbumArtist revisionTrackingCode];
      v123[0] = _NSConcreteStackBlock;
      v123[1] = 3221225472;
      v123[2] = sub_5292C;
      v123[3] = &unk_9A140;
      int v132 = a4;
      BOOL v133 = v47;
      v126 = &v134;
      v127 = &v139;
      v128 = buf;
      id v124 = v45;
      v129 = v138;
      v130 = v85;
      id v54 = v84;
      id v125 = v54;
      unint64_t v131 = a6;
      [v13 enumerateAlbumArtistPersistentIDsAfterRevision:a5 revisionTrackingCode:v53 usingBlock:v123];
      double v55 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v56 = v135[3];
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)v149 = 134218240;
        *(void *)&v149[4] = v56;
        *(_WORD *)&v149[12] = 2048;
        *(double *)&v149[14] = v57 - v52;
        _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "finished exporting %lld album artists in %2f seconds", v149, 0x16u);
      }

      if (!v140[5])
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v59 = v58;
        *(void *)v149 = 0;
        *(void *)&v149[8] = v149;
        *(void *)&v149[16] = 0x2020000000;
        uint64_t v150 = 0;
        id v60 = +[ML3Album revisionTrackingCode];
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472;
        v112[2] = sub_52E0C;
        v112[3] = &unk_9A168;
        v115 = v149;
        int v121 = a4;
        BOOL v122 = v47;
        id v113 = v76;
        v116 = &v139;
        v117 = buf;
        v118 = v138;
        v119 = v85;
        v114 = v54;
        unint64_t v120 = a6;
        [v13 enumerateAlbumPersistentIDsAfterRevision:a5 revisionTrackingCode:v60 usingBlock:v112];
        uint64_t v61 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v62 = *(void *)(*(void *)&v149[8] + 24);
          +[NSDate timeIntervalSinceReferenceDate];
          *(_DWORD *)v145 = 134218240;
          uint64_t v146 = v62;
          __int16 v147 = 2048;
          double v148 = v63 - v59;
          _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "finished exporting %lld album in %2f seconds", v145, 0x16u);
        }

        _Block_object_dispose(v149, 8);
      }

      _Block_object_dispose(&v134, 8);
    }
  }
  else
  {

    id v48 = &__NSArray0__struct;
  }
  if (!v140[5])
  {
    uint64_t v64 = [v13 checkoutReaderConnection];
    id v65 = +[ML3Track revisionTrackingCode];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_530B4;
    v101[3] = &unk_9A190;
    unint64_t v108 = a6;
    int v110 = a4;
    BOOL v111 = v47;
    v105 = &v139;
    v106 = buf;
    id v102 = v44;
    id v66 = v64;
    id v103 = v66;
    v107 = v138;
    v109 = v85;
    uint64_t v67 = v84;
    id v104 = v67;
    [v13 enumeratePersistentIDsAfterRevision:a5 revisionTrackingCode:v65 maximumRevisionType:3 forMediaTypes:v48 inUsersLibrary:v73 ^ 1 usingBlock:v101];
    [v13 checkInDatabaseConnection:v66];

    BOOL v68 = a4 != 1;
    if (v140[5]) {
      BOOL v68 = 1;
    }
    if (!v68)
    {
      id v69 = +[ML3Container revisionTrackingCode];
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_5370C;
      v89[3] = &unk_9A1B8;
      unint64_t v95 = a6;
      v89[4] = v72;
      char v99 = v73;
      char v100 = v74;
      id v90 = v48;
      long long v92 = &v139;
      unsigned int v98 = a3;
      long long v93 = buf;
      long long v94 = v138;
      unint64_t v96 = a5;
      long long v97 = v85;
      char v91 = v67;
      [v13 enumeratePersistentIDsAfterRevision:a5 revisionTrackingCode:v69 maximumRevisionType:3 usingBlock:v89];
    }
  }
  v70 = [*(id *)(*(void *)&buf[8] + 40) end];
  if (v140[5]) {
    id v71 = v140[5];
  }
  else {
    id v71 = v70;
  }
  objc_storeStrong(v140 + 5, v71);
  ((void (**)(id, id))v79)[2](v79, v140[5]);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v138, 8);

  _Block_object_dispose(&v139, 8);
}

- (id)revisionVersionToken
{
  id v2 = [(MLSyncClient *)self _library];
  id v3 = [v2 libraryUID];

  return v3;
}

- (unint64_t)currentRevision
{
  id v2 = [(MLSyncClient *)self _library];
  id v3 = [v2 currentRevision];

  return (unint64_t)v3;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)syncDataClass
{
  return @"Media";
}

- (id)_library
{
  library = self->_library;
  if (!library)
  {
    id v4 = +[ML3MusicLibrary autoupdatingSharedLibrary];
    id v5 = self->_library;
    self->_library = v4;

    library = self->_library;
  }

  return library;
}

- (void)_cancelSyncSessionsWithSessionIdentifier:(id)a3 groupingKey:(id)a4 waitToFinish:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  id v25 = a4;
  id v9 = a6;
  id v10 = +[ATSession sessionsWithSessionTypeIdentifier:a3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    uint64_t v23 = *(void *)v33;
    uint64_t v24 = v10;
    do
    {
      uint64_t v14 = 0;
      id v26 = v12;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v14);
        if (([v15 isCancelled] & 1) == 0
          && ([v15 isFinished] & 1) == 0)
        {
          id v27 = v14;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v16 = [v15 sessionTasksWithGroupingKey:v25];
          id v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v29;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v29 != v19) {
                  objc_enumerationMutation(v16);
                }
                BOOL v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                if (([v21 isCancelled] & 1) == 0
                  && ([v21 isFinished] & 1) == 0)
                {
                  id v22 = _ATLogCategorySyncBundle();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v37 = v15;
                    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "canceling session %{public}@", buf, 0xCu);
                  }

                  [v15 setError:v9];
                  [v15 cancel];
                  if (v7) {
                    [v15 waitToFinish];
                  }
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
            }
            while (v18);
          }

          uint64_t v13 = v23;
          id v10 = v24;
          id v12 = v26;
          uint64_t v14 = v27;
        }
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v12);
  }
}

- (void)_migrateSyncSettings
{
  id v2 = &ATGetPhysicalSizeForLogicalSize_ptr;
  id v3 = +[ATDeviceSettings sharedInstance];
  id v4 = [v3 versionForDataclass:@"Media"];
  id v5 = _ATLogCategorySyncBundle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v4 > 2)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      id v25 = v4;
      __int16 v26 = 2048;
      uint64_t v27 = 2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Media sync setting version (%lu) is newer than current version (%lu) - skipping migration", buf, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      id v25 = v4;
      __int16 v26 = 2048;
      uint64_t v27 = 2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Migrating media sync settings. version=%lu, latest version=%lu", buf, 0x16u);
    }

    BOOL v7 = &ATGetPhysicalSizeForLogicalSize_ptr;
    while ((unint64_t)v4 < 2)
    {
      id v8 = [v7[252] currentDeviceInfo];
      unsigned int v9 = [v8 isWatch];

      id v4 = &dword_0 + 2;
      if (v9)
      {
        id v10 = [v3 endpointInfo];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = objc_msgSend(v10, "allKeys", 0);
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              id v17 = [v3 syncStateForLibrary:v16 dataClass:@"Media"];
              id v18 = [v17 mutableCopy];

              if (v18)
              {
                [v18 setLastServerRevision:0];
                [v3 setSyncState:v18 forLibrary:v16 dataClass:@"Media"];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v13);
        }

        id v4 = &dword_0 + 2;
        id v2 = &ATGetPhysicalSizeForLogicalSize_ptr;
        BOOL v7 = &ATGetPhysicalSizeForLogicalSize_ptr;
      }
    }
    id v5 = [v2[244] sharedInstance];
    [v5 setVersion:2 forDataclass:@"Media"];
  }
}

- (id)_DSIDsForAssets
{
  id v2 = [(MLSyncClient *)self _library];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_541E8;
  v5[3] = &unk_9A118;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v6 = v3;
  [v2 databaseConnectionAllowingWrites:0 withBlock:v5];

  return v3;
}

- (id)accountsForAssets
{
  id v3 = [(MLSyncClient *)self _library];
  id v18 = +[NSMutableSet set];
  id v4 = [(MLSyncClient *)self _DSIDsForAssets];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v9 unsignedLongLongValue])
        {
          id v10 = [v3 accountCacheDatabase];
          id v11 = [v9 unsignedLongLongValue];
          id v19 = 0;
          id v20 = 0;
          unsigned int v12 = [v10 getPropertiesForDSID:v11 appleID:&v20 altDSID:&v19];
          id v13 = v20;
          id v14 = v19;

          if (v12) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            id v16 = objc_alloc_init((Class)ATMutableAccountInfo);
            [v16 setDSID:v9];
            [v16 setAppleID:v13];
            [v16 setAltDSID:v14];
            [v18 addObject:v16];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return v18;
}

- (id)appleIDsForAssets
{
  id v3 = [(MLSyncClient *)self _library];
  id v4 = [(MLSyncClient *)self _DSIDsForAssets];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v12 = objc_msgSend(v3, "accountCacheDatabase", (void)v15);
        id v13 = objc_msgSend(v12, "appleIDForDSID:", objc_msgSend(v11, "longLongValue"));

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_postCurrentAssetNumber:(unint64_t)a3
{
  if (byte_A4AD4
    || (uint32_t v8 = notify_register_check("com.apple.mlsync.currentAssetNumber", &dword_A4AD0), byte_A4AD4 = v8 == 0, !v8))
  {
    notify_set_state(dword_A4AD0, a3);
    id obj = +[NSDate date];
    lastAssetNumberPostDate = self->_lastAssetNumberPostDate;
    p_lastAssetNumberPostDate = &self->_lastAssetNumberPostDate;
    if (!lastAssetNumberPostDate || (objc_msgSend(obj, "timeIntervalSinceDate:"), v7 >= 1.0))
    {
      notify_post("com.apple.mlsync.currentAssetNumber");
      objc_storeStrong((id *)p_lastAssetNumberPostDate, obj);
    }
  }
}

- (void)_postAssetTotal:(unint64_t)a3
{
  if (byte_A4ACC
    || (uint32_t v4 = notify_register_check("com.apple.mlsync.assetTotal", &dword_A4AC8), byte_A4ACC = v4 == 0, !v4))
  {
    notify_set_state(dword_A4AC8, a3);
    notify_post("com.apple.mlsync.assetTotal");
  }
}

- (id)disabledAssetTypes
{
  id v2 = objc_opt_new();
  id v3 = objc_alloc_init((Class)ICCloudClient);
  unsigned int v4 = [v3 isAuthenticated];

  if (v4) {
    [v2 addObjectsFromArray:&off_9CF80];
  }
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.tv" allowPlaceholder:1 error:0];
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.videos" allowPlaceholder:1 error:0];
  double v7 = [v5 applicationState];
  if ([v7 isValid])
  {
  }
  else
  {
    uint32_t v8 = [v6 applicationState];
    unsigned __int8 v9 = [v8 isValid];

    if ((v9 & 1) == 0) {
      [v2 addObjectsFromArray:&off_9CF98];
    }
  }

  return v2;
}

- (void)clearSyncData
{
  id v2 = [(MLSyncClient *)self _library];
  [v2 deleteDatabaseProperty:@"MLSyncClientSyncAnchor"];
}

- (BOOL)_processArtworkIdentifier:(id)a3 artworkToken:(id)a4 artworkType:(int64_t)a5 mediaType:(unsigned int)a6 sourceType:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = +[ATAirlock sharedInstance];
  long long v15 = [v14 artworkPathForDataclass:@"Media" artworkIdentifier:v12];

  if (v15)
  {
    if ([v13 length])
    {
      long long v16 = [(MLSyncClient *)self _library];
      long long v17 = +[ML3MusicLibrary artworkRelativePathFromToken:v13];
      if ([v16 hasOriginalArtworkForRelativePath:v17])
      {
        long long v18 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v39 = v13;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Artwork already exists on disk, checking database consistency (artworkToken: %{public}@)", buf, 0xCu);
        }

        unsigned __int8 v19 = [v16 importExistingOriginalArtworkWithArtworkToken:v13 artworkType:a5 sourceType:a7 mediaType:v8];
        goto LABEL_35;
      }
      long long v21 = +[NSFileManager defaultManager];
      id v37 = 0;
      long long v22 = [v21 attributesOfItemAtPath:v15 error:&v37];
      id v36 = v37;

      if (v22)
      {
        if ((unint64_t)[v22 fileSize] <= 0xA00000)
        {
          long long v23 = +[NSURL fileURLWithPath:v15 isDirectory:0];
          unsigned int v26 = [v16 importOriginalArtworkFromFileURL:v23 withArtworkToken:v13 artworkType:a5 sourceType:a7 mediaType:v8];
          uint64_t v27 = _ATLogCategorySyncBundle();
          long long v28 = v27;
          if (v26)
          {
            id v25 = v36;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v39 = v13;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Inserted new artwork for token: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v39 = v13;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Failed to insert new artwork for token: %{public}@", buf, 0xCu);
            }

            long long v29 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              long long v30 = +[NSFileManager defaultManager];
              long long v31 = [v30 subpathsAtPath:@"/var/mobile/Media/Airlock/Media/"];
              *(_DWORD *)buf = 138543362;
              id v39 = v31;
              _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Airlock contents %{public}@", buf, 0xCu);
            }
            id v32 = v15;
            if (unlink((const char *)[v32 fileSystemRepresentation]) != -1)
            {
              unsigned __int8 v19 = 1;
              goto LABEL_20;
            }
            long long v28 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              long long v33 = __error();
              long long v34 = strerror(*v33);
              *(_DWORD *)buf = 138543618;
              id v39 = v32;
              __int16 v40 = 2080;
              unsigned __int8 v41 = v34;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Could not remove artwork file from %{public}@: %s", buf, 0x16u);
            }
            id v25 = v36;
          }

          unsigned __int8 v19 = 1;
          goto LABEL_34;
        }
        long long v23 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [v22 fileSize];
          *(_DWORD *)buf = 134217984;
          id v39 = v24;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Artwork file too big: %llu bytes. Discarding.", buf, 0xCu);
        }
      }
      else
      {
        long long v23 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v39 = v15;
          __int16 v40 = 2114;
          id v25 = v36;
          unsigned __int8 v41 = (char *)v36;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Could not read file attributes for %{public}@: %{public}@", buf, 0x16u);
          unsigned __int8 v19 = 0;
LABEL_34:

LABEL_35:
          goto LABEL_36;
        }
      }
      unsigned __int8 v19 = 0;
LABEL_20:
      id v25 = v36;
      goto LABEL_34;
    }
    long long v16 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v12;
      id v20 = "Malformed artwork token on artwork asset with identifier: %{public}@";
      goto LABEL_11;
    }
  }
  else
  {
    long long v16 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v12;
      id v20 = "Artwork (%{public}@) for asset had no path";
LABEL_11:
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
    }
  }
  unsigned __int8 v19 = 0;
LABEL_36:

  return v19;
}

- (BOOL)_evaluateUploadTrackDatabaseChangeStep:(id)a3
{
  id v4 = a3;
  id v5 = [(MLSyncClient *)self _library];
  id v6 = [v4 objectForKey:@"pid"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v8 = (uint64_t)[v6 longLongValue];
    unsigned __int8 v9 = +[ML3Track newWithPersistentID:v8 inLibrary:v5];
    if ([v9 existsInLibrary])
    {
      id v10 = v9;
      goto LABEL_7;
    }
    id v11 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertySyncID equalToInt64:v8];
    id v10 = +[ML3Track anyInLibrary:v5 predicate:v11 options:3];

    if ([v10 existsInLibrary])
    {
LABEL_7:
      id v29 = 0;
      id v30 = ML3TrackPropertyFilePath;
      [v10 getValues:&v29 forProperties:&v30 count:1];
      id v12 = (char *)&v33 + 1;
      uint64_t quot = v8;
      do
      {
        lldiv_t v14 = lldiv(quot, 10);
        uint64_t quot = v14.quot;
        if (v14.rem >= 0) {
          LOBYTE(v15) = v14.rem;
        }
        else {
          uint64_t v15 = -v14.rem;
        }
        *(v12 - 2) = v15 + 48;
        long long v16 = (const UInt8 *)(v12 - 2);
        --v12;
      }
      while (v14.quot);
      if (v8 < 0)
      {
        *(v12 - 2) = 45;
        long long v16 = (const UInt8 *)(v12 - 2);
      }
      long long v17 = (__CFString *)CFStringCreateWithBytes(0, v16, (char *)&v33 - (char *)v16, 0x8000100u, 0);
      long long v18 = v29;
      unsigned __int8 v19 = v18;
      if (v18 && (unint64_t)[v18 length] > 1)
      {
        long long v28 = v17;
        id v20 = +[ATAsset uploadAssetWithIdentifier:v17 dataclass:@"Media" sourcePath:v19 prettyName:0];
        long long v22 = [v4 objectForKey:@"delete_after_upload"];
        unsigned int v23 = [v22 BOOLValue];

        if (v23)
        {
          id v24 = +[NSNumber numberWithBool:1];
          id v25 = +[NSDictionary dictionaryWithObject:v24 forKey:@"delete_after_upload"];
          [v20 setVariantOptions:v25];
        }
        unsigned int v26 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v20;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Enqueuing asset upload request: %{public}@", buf, 0xCu);
        }

        long long v17 = v28;
        [(NSMutableDictionary *)self->_pendingUploads setValue:v20 forKey:v28];
      }
      else
      {
        id v20 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Invalid upload source path %{public}@", buf, 0xCu);
        }
      }

      goto LABEL_27;
    }
    long long v21 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Got upload_track for non-existant track: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Got upload_track with invalid pid: %{public}@", buf, 0xCu);
    }
  }
LABEL_27:

  return isKindOfClass & 1;
}

- (id)_syncPlistFiles
{
  id v2 = +[NSMutableArray array];
  id v3 = +[NSFileManager defaultManager];
  id v21 = 0;
  id v4 = [v3 contentsOfDirectoryAtPath:@"/var/mobile/Media/iTunes_Control/Sync/Media/" error:&v21];
  id v5 = v21;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      lldiv_t v14 = v4;
      id v15 = v5;
      long long v16 = v3;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [@"/var/mobile/Media/iTunes_Control/Sync/Media/" stringByAppendingPathComponent:v11];
          if ([v11 hasPrefix:@"Sync_"]
            && [v11 hasSuffix:@".plist"])
          {
            [v2 addObject:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v8);
      id v5 = v15;
      id v3 = v16;
      id v4 = v14;
    }
  }
  else
  {
    id v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v23 = @"/var/mobile/Media/iTunes_Control/Sync/Media/";
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Could not read %{public}@: %{public}@", buf, 0x16u);
    }
  }

  [v2 sortUsingSelector:"compare:"];

  return v2;
}

- (void)initiateAssetDownloadsWithCompletion:(id)a3
{
  keepLocalEventHandlerWrapper = self->_keepLocalEventHandlerWrapper;
  id v4 = a3;
  id v5 = [(MLSyncClientKeepLocalEventHandlerWrapper *)keepLocalEventHandlerWrapper keepLocalEventHandler];
  [v5 startKeepLocalSessionInBackground:0 enqueueAssets:1 withCompletion:v4];
}

- (void)metadataUpdate:(id)a3 forAsset:(id)a4 withNewAnchor:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_55654;
  block[3] = &unk_9AA18;
  id v15 = v7;
  id v16 = v8;
  dispatch_semaphore_t v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(utilityQueue, block);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)installedAssetMetrics
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MLSyncClient *)self _library];
  v25[0] = ML3TrackPropertyMediaType;
  v25[1] = ML3TrackPropertyTotalSize;
  v25[2] = ML3TrackPropertyIsTemporaryCloudDownload;
  v25[3] = ML3TrackPropertyChosenByAutoFill;
  v25[4] = ML3TrackPropertyIsMusicShow;
  id v6 = +[NSArray arrayWithObjects:v25 count:5];
  id v7 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyBaseLocationID value:&off_9C9D8 comparison:2];
  id v8 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v4 predicate:v7 orderingTerms:0];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_55BEC;
  v23[3] = &unk_9A980;
  id v9 = v3;
  id v24 = v9;
  [v8 enumeratePersistentIDsAndProperties:v6 usingBlock:v23];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_55DD4;
  void v19[3] = &unk_9A0C8;
  id v10 = v4;
  id v20 = v10;
  id v11 = v6;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  [v10 enumeratePurgeableAlbumTracksForUrgency:2 usingBlock:v19];
  id v13 = [v12 objectForKey:@"Music"];
  if (!v13)
  {
    id v13 = +[NSMutableDictionary dictionaryWithCapacity:2];
    [v12 setObject:v13 forKey:@"Music"];
  }
  lldiv_t v14 = [v13 objectForKey:@"_Count"];
  id v15 = [v14 unsignedLongLongValue];

  id v16 = +[NSNumber numberWithUnsignedLongLong:v15];
  [v13 setObject:v16 forKey:@"_Count"];

  for (uint64_t i = 4; i != -1; --i)

  return v12;
}

- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  id v7 = [(MLSyncClient *)self _library];
  id v8 = +[NSFileManager defaultManager];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_564D8;
  block[3] = &unk_9A028;
  id v12 = v6;
  id v41 = v12;
  id v42 = &v43;
  dispatch_semaphore_t v40 = v10;
  id v13 = v10;
  dispatch_async(v11, block);

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (a3 == 3 && *((unsigned char *)v44 + 24))
  {
    lldiv_t v14 = [v7 databasePath];
    unsigned int v15 = [v8 fileExistsAtPath:v14];
    id v16 = v44;
    if (v15)
    {
      (*((void (**)(id, void *, void, uint64_t *))v12 + 2))(v12, v14, 0, v44 + 3);
      id v16 = v44;
      if (*((unsigned char *)v44 + 24))
      {
        dispatch_semaphore_t v17 = [v14 stringByAppendingString:@"-wal"];
        if ([v8 fileExistsAtPath:v17]) {
          (*((void (**)(id, void *, void, uint64_t *))v12 + 2))(v12, v17, 0, v44 + 3);
        }

        id v16 = v44;
        if (*((unsigned char *)v44 + 24))
        {
          long long v18 = [v14 stringByAppendingString:@"-shm"];
          if ([v8 fileExistsAtPath:v18]) {
            (*((void (**)(id, void *, void, uint64_t *))v12 + 2))(v12, v18, 0, v44 + 3);
          }

          id v16 = v44;
        }
      }
    }
    if (*((unsigned char *)v16 + 24))
    {
      long long v19 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyHasNonPurgeableAsset equalToInteger:1];
      v48[0] = v19;
      id v20 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreProtectionType equalToInt64:0];
      v48[1] = v20;
      id v21 = +[NSArray arrayWithObjects:v48 count:2];
      id v22 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v21];

      CFStringRef v23 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v7 predicate:v22 orderingTerms:0];
      uint64_t v47 = ML3TrackPropertyIsStoreRedownloadable;
      id v24 = +[NSArray arrayWithObjects:&v47 count:1];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      void v34[2] = sub_56590;
      v34[3] = &unk_9A050;
      id v25 = v7;
      id v35 = v25;
      id v26 = v8;
      id v36 = v26;
      id v27 = v12;
      id v37 = v27;
      id v38 = &v43;
      [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:v34];

      if (*((unsigned char *)v44 + 24))
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_5667C;
        v29[3] = &unk_9A0A0;
        id v30 = v25;
        id v31 = v26;
        id v32 = v27;
        uint64_t v33 = &v43;
        [v30 databaseConnectionAllowingWrites:0 withBlock:v29];
      }
    }
  }
  _Block_object_dispose(&v43, 8);

  return 0;
}

- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4
{
  id v5 = +[NSMutableArray array];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = dispatch_get_global_queue(0, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_56E4C;
  v12[3] = &unk_9A930;
  id v9 = v5;
  id v13 = v9;
  dispatch_semaphore_t v14 = v7;
  dispatch_semaphore_t v10 = v7;
  dispatch_async(v8, v12);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = v9;
  *a3 = v11;
}

- (void)assetInstallFailed:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v8 = [(MLSyncClient *)self _library];
  if (sub_6B248(v6)) {
    self->_hadUnsucessfulAssetTransfer = 1;
  }
  sub_6B428(v9, v8, v6, @"install");
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v11 = [(MLSyncClient *)self _library];
  id v12 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v37 = 138543618;
    *(void *)&v37[4] = v8;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v9;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "asset transfer completed for asset %{public}@. err=%{public}@", v37, 0x16u);
  }

  id v13 = [v8 variantOptions];
  dispatch_semaphore_t v14 = [v13 objectForKey:@"AssetParts"];
  unsigned __int8 v15 = [v14 unsignedIntegerValue];

  if ([v8 isDownload])
  {
    if (v15)
    {
      id v16 = [v8 assetType];
      unsigned int v17 = [v16 isEqualToString:@"Music"];

      if (v17)
      {
        ++self->_currentAssetNumber;
        -[MLSyncClient _postCurrentAssetNumber:](self, "_postCurrentAssetNumber:");
      }
    }
  }
  if (a4)
  {
    if ([v8 isDownload])
    {
      long long v18 = v8;
      long long v19 = v11;
      int v20 = 1;
LABEL_13:
      sub_6C218(v18, v19, v20);
      goto LABEL_25;
    }
    id v22 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v37 = 138543362;
      *(void *)&v37[4] = v8;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Asset upload complete: %{public}@", v37, 0xCu);
    }

    CFStringRef v23 = [v8 identifier];
    id v24 = [v8 variantOptions];
    id v25 = [v24 objectForKey:@"delete_after_upload"];
    unsigned int v26 = [v25 BOOLValue];

    if (!v26)
    {
LABEL_24:
      -[NSMutableDictionary removeObjectForKey:](self->_pendingUploads, "removeObjectForKey:", v23, *(_OWORD *)v37, *(void *)&v37[16]);

      goto LABEL_25;
    }
    id v27 = [v23 longLongValue];
    long long v28 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertySyncID equalToInt64:v27];
    id v29 = +[ML3Track anyInLibrary:v11 predicate:v28 options:3];

    unsigned int v30 = [v29 deleteFromLibrary];
    id v31 = _ATLogCategorySyncBundle();
    id v32 = v31;
    if (v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v37 = 138543362;
        *(void *)&v37[4] = v29;
        uint64_t v33 = "Deleted track after upload by host request: %{public}@";
        long long v34 = v32;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        uint32_t v36 = 12;
LABEL_22:
        _os_log_impl(&dword_0, v34, v35, v33, v37, v36);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v37 = 138543618;
      *(void *)&v37[4] = v8;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v29;
      uint64_t v33 = "Could not deleted track after upload by host request: %{public}@, %{public}@";
      long long v34 = v32;
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      uint32_t v36 = 22;
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  self->_hadUnsucessfulAssetTransfer = 1;
  if (([v8 isDownload] & 1) != 0
    || ([v8 path], id v21 = objc_claimAutoreleasedReturnValue(), v21, !v21))
  {
    long long v18 = v8;
    long long v19 = v11;
    int v20 = 0;
    goto LABEL_13;
  }
LABEL_25:
}

- (void)cancelSyncOperations
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[MLMediaLibraryService sharedMediaLibraryService];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_57450;
  v5[3] = &unk_99FB0;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  [v3 cancelImportOperation:5 completionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = [(MLSyncClient *)self _library];
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Media asset transfer completed. success=%d", (uint8_t *)&buf, 8u);
  }

  self->_currentAssetNumber = 1;
  [(MLSyncClient *)self _postAssetTotal:0];
  [v33 setSyncGenerationID:ML3CreateIntegerUUID()];
  [v33 removeTombstonesForDeletedItems];
  if ([(NSArray *)self->_autoCreatedSmartPlaylistsPIDs count])
  {
    id v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      autoCreatedSmartPlaylistsPIDs = self->_autoCreatedSmartPlaylistsPIDs;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = autoCreatedSmartPlaylistsPIDs;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing canned smart playlists: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    +[ML3Container deleteAutoCreatedBuiltInSmartPlaylistsPIDs:self->_autoCreatedSmartPlaylistsPIDs inLibrary:v33];
    dispatch_semaphore_t v7 = self->_autoCreatedSmartPlaylistsPIDs;
    self->_autoCreatedSmartPlaylistsPIDs = 0;
  }
  else
  {
    dispatch_semaphore_t v7 = +[NSNumber numberWithBool:1];
    [v33 setValue:v7 forDatabaseProperty:@"autoCreatedSmartPlaylistsDeleted"];
  }

  id v8 = +[NSNumber numberWithInt:1];
  [v33 setValue:v8 forDatabaseProperty:@"createdBuiltInSmartPlaylists"];

  if ([(NSMutableSet *)self->_modifiedPlaylistsPIDs count])
  {
    id v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(NSMutableSet *)self->_modifiedPlaylistsPIDs count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Evaluating %lu playlists for Up-pinning...", (uint8_t *)&buf, 0xCu);
    }

    id v11 = +[NSMutableSet set];
    id v12 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyHasNonPurgeableAsset value:&off_9C9F0 comparison:1];
    id v27 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v33 predicate:v12 orderingTerms:&__NSArray0__struct];

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_57AD4;
    v43[3] = &unk_9ABC0;
    id v30 = v11;
    id v44 = v30;
    [v27 enumeratePersistentIDsUsingBlock:v43];
    if ([v30 count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = self->_modifiedPlaylistsPIDs;
      id v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v34)
      {
        uint64_t v32 = *(void *)v40;
        uint64_t v35 = ML3ContainerPropertyDistinguishedKind;
        uint64_t v13 = ML3ContainerPropertySmartCriteria;
        uint64_t v14 = ML3ContainerPropertyKeepLocal;
        do
        {
          for (uint64_t i = 0; i != v34; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v40 != v32) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v17 = +[ML3Container newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [v16 longLongValue], v33);
            v50[0] = v35;
            v50[1] = v13;
            v50[2] = v14;
            long long v18 = +[NSArray arrayWithObjects:v50 count:3];
            long long v19 = [v17 getValuesForProperties:v18];

            int v20 = [v19 objectForKeyedSubscript:v35];
            unsigned int v21 = [v20 intValue];

            id v22 = [v19 objectForKeyedSubscript:v13];

            CFStringRef v23 = [v19 objectForKeyedSubscript:v14];
            unsigned int v24 = [v23 intValue];

            if (!v21 && !v22 && v24 - 1 >= 0xFFFFFFFE)
            {
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v48 = 0x2020000000;
              char v49 = 1;
              id v25 = +[ML3Track containerQueryWithContainer:v17];
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_57B34;
              v36[3] = &unk_99F88;
              id v37 = v30;
              p_long long buf = &buf;
              [v25 enumeratePersistentIDsUsingBlock:v36];
              if (*(unsigned char *)(*((void *)&buf + 1) + 24))
              {
                unsigned int v26 = _ATLogCategorySyncBundle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v45 = 138543362;
                  char v46 = v16;
                  _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Up-pinning playlist with persistentID: %{public}@", v45, 0xCu);
                }

                [v17 setValue:&off_9C9F0 forProperty:v14];
              }

              _Block_object_dispose(&buf, 8);
            }
          }
          id v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v39 objects:v51 count:16];
        }
        while (v34);
      }
    }
    [(NSMutableSet *)self->_modifiedPlaylistsPIDs removeAllObjects];
  }
  notify_post((const char *)[ML3MusicLibraryBackgroundTasksShouldStopSuppressingChangesNotification UTF8String]);
}

- (id)outstandingAssetTransfersWithDownloadManager:(id)a3
{
  id v54 = a3;
  v70 = self;
  BOOL v68 = [(MLSyncClient *)self _library];
  self->_hadUnsucessfulAssetTransfer = 0;
  id v4 = +[ML3OrderingTerm orderingTermWithProperty:ML3TrackPropertyAlbumArtistOrder];
  v127[0] = v4;
  id v5 = +[ML3OrderingTerm orderingTermWithProperty:ML3TrackPropertyAlbumOrder];
  v127[1] = v5;
  dispatch_semaphore_t v6 = +[ML3OrderingTerm orderingTermWithProperty:ML3TrackPropertyDiscNumber];
  v127[2] = v6;
  dispatch_semaphore_t v7 = +[ML3OrderingTerm orderingTermWithProperty:ML3TrackPropertyTrackNumber];
  v127[3] = v7;
  uint64_t v56 = +[NSArray arrayWithObjects:v127 count:4];

  id v8 = (void *)ML3TrackPropertyStoreSagaID;
  id v9 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreSagaID equalToInt64:0];
  v126[0] = v9;
  id v10 = (void *)ML3TrackPropertySyncID;
  id v11 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertySyncID value:&off_9C9D8 comparison:2];
  v126[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v126 count:2];
  id v53 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v12];

  uint64_t v13 = (void *)ML3TrackPropertyNeedsRestore;
  double v52 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyNeedsRestore equalToInt64:1];
  v125[0] = v53;
  v125[1] = v52;
  uint64_t v14 = +[NSArray arrayWithObjects:v125 count:2];
  uint64_t v67 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v14];

  unsigned int v50 = +[ML3Track unrestrictedQueryWithLibrary:v68 predicate:v67 orderingTerms:v56];
  unsigned __int8 v15 = [v68 valueForDatabaseProperty:@"MLJaliscoHasCloudGeniusData"];
  unsigned __int8 v48 = [v15 BOOLValue];

  *(void *)&long long v101 = ML3TrackPropertyBaseLocationID;
  *((void *)&v101 + 1) = ML3TrackPropertyDownloadIdentifier;
  id v102 = ML3TrackPropertyMediaType;
  id v103 = ML3TrackPropertyGlobalID;
  id v104 = ML3TrackPropertyGeniusChecksum;
  id v105 = ML3TrackPropertyPendingGeniusChecksum;
  id v106 = ML3TrackPropertyPodcastExternalGUID;
  id v107 = ML3TrackPropertyStoreAccountID;
  id v108 = ML3TrackPropertyStoreItemID;
  id v109 = ML3TrackPropertyStoreFlavor;
  id v110 = ML3TrackPropertyStoreMatchedStatus;
  id v111 = ML3TrackPropertyStoreRedownloadedStatus;
  id v112 = v8;
  id v113 = v10;
  id v114 = v13;
  id v115 = ML3TrackPropertyIsRental;
  id v116 = ML3TrackPropertyTitle;
  id v117 = ML3TrackPropertyPurchaseHistoryRedownloadParameters;
  id v118 = ML3TrackPropertyMatchRedownloadParameters;
  id v119 = ML3TrackPropertyLyricsChecksum;
  id v120 = ML3TrackPropertyLyricsPendingChecksum;
  id v121 = ML3TrackPropertyStorePlaybackEndpointType;
  id v122 = ML3TrackPropertySubscriptionStoreItemID;
  id v123 = ML3TrackPropertyTotalSize;
  id v124 = ML3TrackPropertyTotalTime;
  char v46 = [(MLSyncClient *)v70 _existingOutstandingAssetTransfersWithDownloadManager:v54];
  uint64_t v45 = +[NSMutableSet set];
  id v44 = +[NSMutableSet set];
  id v66 = +[NSArray arrayWithObjects:&v101 count:25];
  uint64_t v64 = +[NSMutableArray array];
  id v16 = +[NSMutableArray array];
  id v17 = +[NSMutableArray array];
  long long v18 = +[NSMutableArray array];
  long long v19 = +[NSMutableArray array];
  int v20 = +[NSMutableArray array];
  unsigned int v21 = +[NSMutableArray array];
  id v22 = +[NSMutableArray array];
  uint64_t v92 = 0;
  long long v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  CFStringRef v23 = +[ML3OrderingTerm orderingTermWithProperty:ML3TrackPropertyDatePlayed direction:2];
  char v100 = v23;
  double v55 = +[NSArray arrayWithObjects:&v100 count:1];

  unsigned int v24 = +[ML3Track unrestrictedQueryWithLibrary:v68 predicate:v67 orderingTerms:v55];
  [v24 setLimit:20];
  double v51 = v24;
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_58818;
  v90[3] = &unk_9A980;
  id v25 = objc_alloc_init((Class)NSMutableSet);
  id v91 = v25;
  [v51 enumeratePersistentIDsAndProperties:v66 usingBlock:v90];
  unsigned int v26 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v25 count];
    *(_DWORD *)long long buf = 134217984;
    id v99 = v27;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Will mark tracks for priority download: %lu", buf, 0xCu);
  }

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_58940;
  v74[3] = &unk_99F60;
  v74[4] = v70;
  id v62 = v16;
  id v75 = v62;
  id v65 = v64;
  id v76 = v65;
  id v61 = v17;
  id v77 = v61;
  id v63 = v19;
  id v78 = v63;
  id v60 = v18;
  id v79 = v60;
  id v59 = v20;
  id v80 = v59;
  id v58 = v21;
  id v81 = v58;
  id v57 = v22;
  id v82 = v57;
  id v28 = v68;
  id v83 = v28;
  id v42 = v46;
  id v84 = v42;
  id v47 = v45;
  id v85 = v47;
  unsigned __int8 v89 = v48;
  id v49 = v44;
  id v86 = v49;
  id v69 = v25;
  id v87 = v69;
  v88 = &v92;
  [v50 enumeratePersistentIDsAndProperties:v66 usingBlock:v74];
  id v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)-[NSMutableDictionary count](v70->_pendingUploads, "count")+ (void)[v65 count]+ (unint64_t)objc_msgSend(v61, "count")+ (void)objc_msgSend(v62, "count")+ (unint64_t)objc_msgSend(v60, "count")+ (void)objc_msgSend(v63, "count")+ (unint64_t)objc_msgSend(v59, "count")+ (unint64_t)objc_msgSend(v57, "count")+ (void)objc_msgSend(v58, "count"));
  id v30 = [(NSMutableDictionary *)v70->_pendingUploads allValues];
  [v29 addObjectsFromArray:v30];

  [v29 addObjectsFromArray:v65];
  [v29 addObjectsFromArray:v63];
  [v29 addObjectsFromArray:v62];
  [v29 addObjectsFromArray:v61];
  [v29 addObjectsFromArray:v60];
  [v29 addObjectsFromArray:v59];
  [v29 addObjectsFromArray:v58];
  [v29 addObjectsFromArray:v57];
  id v31 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyCloudGlobalID equalToValue:&stru_9B528];
  v97[0] = v31;
  uint64_t v32 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:0];
  v97[1] = v32;
  uint64_t v33 = +[NSArray arrayWithObjects:v97 count:2];
  id v34 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v33];

  uint64_t v35 = +[ML3Container queryWithLibrary:v28 predicate:v34 orderingTerms:0];
  v96[0] = ML3ContainerPropertyName;
  v96[1] = ML3ContainerPropertySyncId;
  uint32_t v36 = +[NSArray arrayWithObjects:v96 count:2];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_5923C;
  v71[3] = &unk_9A958;
  id v37 = v28;
  id v72 = v37;
  id v38 = v29;
  id v73 = v38;
  [v35 enumeratePersistentIDsAndProperties:v36 usingBlock:v71];

  [(MLSyncClient *)v70 _postAssetTotal:v93[3]];
  v70->_currentAssetNumber = 1;
  [(MLSyncClient *)v70 _postCurrentAssetNumber:1];

  _Block_object_dispose(&v92, 8);
  for (uint64_t i = 192; i != -8; i -= 8)

  long long v40 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v101) = 138543362;
    *(void *)((char *)&v101 + 4) = v38;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "outstandingAssetTransfers = %{public}@", (uint8_t *)&v101, 0xCu);
  }

  return v38;
}

- (id)_existingOutstandingAssetTransfersWithDownloadManager:(id)a3
{
  id v17 = a3;
  BOOL v3 = +[NSMutableDictionary dictionary];
  id v4 = v17;
  if (v17)
  {
    [v17 downloads];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v27 = 0;
          id v28 = &v27;
          uint64_t v29 = 0x2020000000;
          id v10 = (void *)qword_A4AF0;
          uint64_t v30 = qword_A4AF0;
          if (!qword_A4AF0)
          {
            id v22 = _NSConcreteStackBlock;
            uint64_t v23 = 3221225472;
            unsigned int v24 = sub_5972C;
            id v25 = &unk_9AB58;
            unsigned int v26 = &v27;
            id v11 = sub_56B70();
            id v12 = dlsym(v11, "SSDownloadPropertyLibraryItemIdentifier");
            *(void *)(v26[1] + 24) = v12;
            qword_A4AF0 = *(void *)(v26[1] + 24);
            id v10 = (void *)v28[3];
          }
          _Block_object_dispose(&v27, 8);
          if (!v10)
          {
            unsigned __int8 v15 = +[NSAssertionHandler currentHandler];
            id v16 = +[NSString stringWithUTF8String:"NSString *getSSDownloadPropertyLibraryItemIdentifier(void)"];
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"MLSyncClient.m", 143, @"%s", dlerror());

            __break(1u);
          }
          uint64_t v13 = [v9 valueForProperty:*v10];
          if ([v13 length]) {
            [v3 setValue:v9 forKey:v13];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v18 objects:v31 count:16];
      }
      while (v6);
    }

    id v4 = v17;
  }

  return v3;
}

- (void)_clearDatabasePropertiesForRestore:(int)a3
{
  id v4 = [(MLSyncClient *)self _library];
  id v5 = v4;
  if ((a3 & 0xFFFFFFFD) == 1)
  {
    id v6 = [v4 valueForDatabaseProperty:@"MLCloudDatabaseRevision"];
    unsigned int v7 = [v6 intValue];
    if (v7)
    {
      unsigned int v8 = v7;
      id v9 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109376;
        LODWORD(v14[0]) = a3;
        WORD2(v14[0]) = 1024;
        *(_DWORD *)((char *)v14 + 6) = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Setting value to skip genius upload flow for restore type=%d, currentDatabaseVersion=%d", (uint8_t *)&v13, 0xEu);
      }

      [v5 setValue:&__kCFBooleanTrue forDatabaseProperty:@"MLSagaInitiateClientResetSync"];
    }
  }
  [v5 deleteDatabaseProperty:@"MLCloudDatabaseRevision"];
  [v5 deleteDatabaseProperty:@"MLJaliscoDatabaseRevision"];
  [v5 deleteDatabaseProperty:@"MLSyncClientLastSyncedRevision"];
  [v5 deleteDatabaseProperty:@"MLSyncClientSyncAnchor"];
  [v5 deleteDatabaseProperty:@"MLArtistHeroImageImportDate"];
  [v5 deleteDatabaseProperty:@"MLArtworkShouldConvertToASTC"];
  [v5 deleteDatabaseProperty:@"MLLastUploadedExplicitContentAllowedBoolean"];
  id v10 = +[NSUUID UUID];
  id v11 = [v10 UUIDString];

  [v5 setValue:v11 forDatabaseProperty:@"MLRestoreToken"];
  id v12 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14[0] = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Set MLRestoreToken to unlock post-restore downloads in Podcasts app, token %{public}@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_rebuildStoreManifests
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  BOOL v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_59A50;
  block[3] = &unk_9AF48;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_setPreExistingStoreAccountIds
{
  dispatch_semaphore_t v2 = +[NSMutableArray array];
  BOOL v3 = +[ICUserIdentityStore defaultIdentityStore];
  id v27 = 0;
  id v4 = [v3 userIdentitiesForAllStoreAccountsWithError:&v27];
  id v5 = v27;

  dispatch_semaphore_t v6 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v4 count];
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v30 = v7;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Found %d store accounts with error=%{public}@", buf, 0x12u);
  }
  long long v21 = v5;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = +[ICUserIdentityStore defaultIdentityStore];
        id v22 = 0;
        unsigned __int8 v15 = [v14 DSIDForUserIdentity:v13 outError:&v22];
        id v16 = v22;

        if (v15)
        {
          [v2 addObject:v15];
          id v17 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v15 longLongValue];
            *(_DWORD *)long long buf = 134217984;
            *(void *)uint64_t v30 = v18;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Adding DSID=%lld to all known store identifiers", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v2 count])
  {
    long long v19 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)uint64_t v30 = v2;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Archiving all known store identifiers=%{public}@", buf, 0xCu);
    }

    long long v20 = +[ATDeviceSettings sharedInstance];
    [v20 setPreExistingStoreIdentifiers:v2];
  }
}

- (void)_setAutoEnableCloudLibrary
{
  dispatch_semaphore_t v2 = [(MLSyncClient *)self _library];
  BOOL v3 = +[ATDeviceSettings sharedInstance];
  id v4 = [v3 getCurrentInstallDisposition];
  id v5 = v4;
  if (v4)
  {
    dispatch_semaphore_t v6 = [v4 objectForKey:@"WasDeviceUpgraded"];
    unsigned __int8 v7 = [v6 BOOLValue];

    id v8 = [v5 objectForKey:@"WasDeviceRestoredFromBackup"];
    unsigned int v9 = [v8 BOOLValue];

    id v10 = [v5 objectForKey:@"WasDeviceRestoredFromCloudBackup"];
    unsigned int v11 = [v10 BOOLValue];

    [v2 deleteDatabaseProperty:@"MLEnableICMLConfig"];
    if ((v7 & 1) != 0 || (v9 & v11) != 0)
    {
      id v12 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Device was upgraded OR restored from cloud backup", buf, 2u);
      }

      uint64_t v13 = [v2 valueForDatabaseProperty:@"MLCloudAccountID"];
      uint64_t v14 = v13;
      if (v13 && [v13 intValue])
      {
        unsigned __int8 v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v14, @"MLActiveAccountDSID", &off_9C9F0, @"MLAutoEnableICML", 0];
        id v16 = 0;
        if (!v15)
        {
LABEL_9:
          id v17 = v16;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        id v18 = +[ICUserIdentity activeAccount];
        long long v19 = +[ICUserIdentityStore defaultIdentityStore];
        id v29 = 0;
        long long v20 = [v19 DSIDForUserIdentity:v18 outError:&v29];
        id v21 = v29;
        id v16 = v21;
        if (!v20 || v21)
        {
          id v22 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            id v31 = v16;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Error (%{public}@) getting the active account DSID", buf, 0xCu);
          }

          unsigned __int8 v15 = 0;
        }
        else
        {
          unsigned __int8 v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v20, @"MLActiveAccountDSID", &off_9C9D8, @"MLAutoEnableICML", 0];
        }

        if (!v15) {
          goto LABEL_9;
        }
      }
      id v28 = v16;
      long long v23 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v28];
      id v17 = v28;

      if (!v23 || v17)
      {
        long long v24 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          id v31 = v17;
          __int16 v32 = 2112;
          uint64_t v33 = v15;
          long long v25 = "Error (%{public}@ serializing config dictionary %{Public}@";
          long long v26 = v24;
          uint32_t v27 = 22;
          goto LABEL_24;
        }
      }
      else
      {
        [v2 setValue:v23 forDatabaseProperty:@"MLEnableICMLConfig"];
        long long v24 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v31 = v15;
          long long v25 = "Setting autoEnableICML=%{public}@";
          long long v26 = v24;
          uint32_t v27 = 12;
LABEL_24:
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }

      goto LABEL_26;
    }
  }
  else
  {
    [v2 deleteDatabaseProperty:@"MLEnableICMLConfig"];
  }
LABEL_27:
}

- (void)_clearAllRevisionsFromLibrary
{
  BOOL v3 = [(MLSyncClient *)self _library];
  [(MLSyncClient *)self _setAutoEnableCloudLibrary];
  [v3 deleteDatabaseProperty:@"MLCloudDatabaseRevision"];
  [v3 deleteDatabaseProperty:@"MLJaliscoDatabaseRevision"];
  [v3 deleteDatabaseProperty:@"MLSyncClientLastSyncedRevision"];
  [v3 deleteDatabaseProperty:@"MLSyncClientSyncAnchor"];
  [v3 deleteDatabaseProperty:@"MLArtistHeroImageImportDate"];
  [v3 deleteDatabaseProperty:@"MLArtworkShouldConvertToASTC"];
  [v3 deleteDatabaseProperty:@"MLLastUploadedExplicitContentAllowedBoolean"];
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];

  [v3 setValue:v5 forDatabaseProperty:@"MLRestoreToken"];
  dispatch_semaphore_t v6 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Set MLRestoreToken to unlock post-restore downloads in Podcasts app, token %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)reconcileUpgradeWithError:(id *)a3
{
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting reconcile for upgrade", v6, 2u);
  }

  [(MLSyncClient *)self _setAutoEnableCloudLibrary];
  [(MLSyncClient *)self _setPreExistingStoreAccountIds];
  return 1;
}

- (BOOL)_performReconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  [(MLSyncClient *)self _library];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5A574;
  v9[3] = &unk_99F38;
  unsigned int v11 = self;
  SEL v12 = a2;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  int v13 = a3;
  char v14 = 1;
  id v7 = v10;
  [v7 performDatabaseTransactionWithBlock:v9];

  return 1;
}

- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v8 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v13 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Reconciling restore of type %d", buf, 8u);
  }

  if (v5 == 1 || v5 == 3)
  {
    BOOL v9 = [(MLSyncClient *)self _performReconcileRestoreOfType:v5 withError:a4];
    [(MLSyncClient *)self _setPreExistingStoreAccountIds];
  }
  else
  {
    if (v5 == 2)
    {
      [(MLSyncClient *)self _setPreExistingStoreAccountIds];
    }
    else
    {
      id v10 = +[NSAssertionHandler currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MLSyncClient.m", 627, @"unexpected restore type %d", v5);
    }
    return 1;
  }
  return v9;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  id v60 = a4;
  id v59 = a5;
  uint64_t v86 = 0;
  id v87 = &v86;
  uint64_t v88 = 0x2020000000;
  char v89 = 0;
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x3032000000;
  id v83 = sub_52914;
  id v84 = sub_52924;
  id v85 = 0;
  id v62 = self;
  id v61 = [(MLSyncClient *)self _library];
  id v10 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v92 = a3;
    *(_WORD *)&v92[4] = 2114;
    *(void *)&v92[6] = v60;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "reconcileSync. syncType=%d, anchor=%{public}@", buf, 0x12u);
  }

  [(NSMutableDictionary *)self->_pendingUploads removeAllObjects];
  if (a3)
  {
    unsigned int v11 = +[ML3Container autoCreatedBuiltInSmartPlaylistsPIDs:v61];
    autoCreatedSmartPlaylistsPIDs = self->_autoCreatedSmartPlaylistsPIDs;
    self->_autoCreatedSmartPlaylistsPIDs = v11;

    int v13 = [v61 valueForDatabaseProperty:@"MLSyncClientLastSyncedRevision"];
    id v14 = [v13 longLongValue];

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_5C2F4;
    v78[3] = &unk_99E70;
    id v15 = v61;
    id v79 = v15;
    +[ML3Container enumeratePersistentIDsInLibrary:v15 afterRevision:v14 usingBlock:v78];
    unsigned __int8 v16 = [(MLSyncClient *)v62 _verifySyncPlistFiles];
    *((unsigned char *)v87 + 24) = v16;
    if (v16)
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      utilityQueue = v62->_utilityQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5C488;
      block[3] = &unk_99EE8;
      unsigned int v77 = a3;
      id v70 = v60;
      id v75 = &v86;
      id v76 = &v80;
      id v74 = v59;
      id v71 = v62;
      id v72 = v15;
      dispatch_semaphore_t v73 = v17;
      long long v19 = v17;
      dispatch_async(utilityQueue, block);
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v21 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "failed to validate sync plist files - ignoring", buf, 2u);
      }

      id v22 = [objc_alloc((Class)NSError) initWithDomain:@"ATError" code:4 userInfo:0];
      long long v23 = (void *)v81[5];
      v81[5] = (uint64_t)v22;

      notify_post((const char *)[ML3MusicLibraryBackgroundTasksShouldStopSuppressingChangesNotification UTF8String]);
    }
  }
  else
  {
    long long v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "sync type is ATSyncNoSync - nothing to do", buf, 2u);
    }

    notify_post((const char *)[ML3MusicLibraryBackgroundTasksShouldStopSuppressingChangesNotification UTF8String]);
  }
  if (*((unsigned char *)v87 + 24))
  {
    unsigned __int8 v24 = [(MLSyncClient *)v62 _processUploadTrackOperations];
    *((unsigned char *)v87 + 24) = v24;
  }
  else if (a6)
  {
    *a6 = (id) v81[5];
  }
  if (a3 == 2)
  {
    if (*((unsigned char *)v87 + 24))
    {
      uint64_t i = 0;
    }
    else
    {
      long long v26 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "recovering temporarily moved assets", buf, 2u);
      }

      uint32_t v27 = +[NSFileManager defaultManager];
      id v28 = [v27 enumeratorAtPath:@"/var/mobile/Media/Airlock/tmp/iTunes_Control/Music/"];
      id v29 = 0;
      for (uint64_t i = 0; ; uint64_t i = v32)
      {
        uint64_t v30 = [v28 nextObject];

        if (!v30) {
          break;
        }
        id v31 = [@"/var/mobile/Media/iTunes_Control/Music/" stringByAppendingPathComponent:v30];
        if ([v27 fileExistsAtPath:v31])
        {
          id v32 = i;
        }
        else
        {
          uint64_t v33 = [@"/var/mobile/Media/Airlock/tmp/iTunes_Control/Music/" stringByAppendingPathComponent:v30];
          id v68 = i;
          unsigned __int8 v34 = [v27 linkItemAtPath:v33 toPath:v31 error:&v68];
          id v32 = v68;

          if ((v34 & 1) == 0)
          {
            uint64_t v35 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              *(void *)uint64_t v92 = v30;
              *(_WORD *)&v92[8] = 2114;
              *(void *)&v92[10] = v32;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "failed to restore Music asset %{public}@ back from tmp location. err=%{public}@", buf, 0x16u);
            }
          }
        }

        id v29 = (void *)v30;
      }
    }
    uint32_t v36 = +[NSFileManager defaultManager];
    id v67 = i;
    unsigned __int8 v37 = [v36 removeItemAtPath:@"/var/mobile/Media/Airlock/tmp/" error:&v67];
    id v38 = v67;

    if ((v37 & 1) == 0)
    {
      long long v39 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)uint64_t v92 = v38;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Could not remove temporary itunes asset directory. err=%{public}@", buf, 0xCu);
      }
    }
    [v61 updateTrackIntegrity];
  }
  long long v41 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "cleaning up...", buf, 2u);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v42 = [(MLSyncClient *)v62 _syncPlistFiles];
  id v43 = [v42 countByEnumeratingWithState:&v63 objects:v90 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v64;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v64 != v44) {
          objc_enumerationMutation(v42);
        }
        id v46 = *(id *)(*((void *)&v63 + 1) + 8 * (void)j);
        if (unlink((const char *)[v46 fileSystemRepresentation]) == -1)
        {
          id v47 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v48 = __error();
            id v49 = strerror(*v48);
            *(_DWORD *)long long buf = 136315394;
            *(void *)uint64_t v92 = v49;
            *(_WORD *)&v92[8] = 2114;
            *(void *)&v92[10] = v46;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Error: %s removing plist at %{public}@", buf, 0x16u);
          }
        }
        id v50 = [v46 stringByAppendingPathExtension:@"cig"];
        BOOL v51 = unlink((const char *)[v50 fileSystemRepresentation]) == -1;

        if (v51)
        {
          double v52 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            id v53 = __error();
            id v54 = strerror(*v53);
            *(_DWORD *)long long buf = 136315138;
            *(void *)uint64_t v92 = v54;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "Could not remove sync plists cig: %s", buf, 0xCu);
          }
        }
      }
      id v43 = [v42 countByEnumeratingWithState:&v63 objects:v90 count:16];
    }
    while (v43);
  }

  double v55 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = *((unsigned __int8 *)v87 + 24);
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)uint64_t v92 = v56;
    _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "reconcileSync complete. success=%d", buf, 8u);
  }

  BOOL v57 = *((unsigned char *)v87 + 24) != 0;
  _Block_object_dispose(&v80, 8);

  _Block_object_dispose(&v86, 8);
  return v57;
}

- (BOOL)_processUploadTrackOperations
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(MLSyncClient *)self _syncPlistFiles];
  id v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = &ATGetPhysicalSizeForLogicalSize_ptr;
    dispatch_semaphore_t v6 = &ATGetPhysicalSizeForLogicalSize_ptr;
    uint64_t v7 = *(void *)v30;
    uint64_t v19 = *(void *)v30;
    do
    {
      id v8 = 0;
      id v20 = v4;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v24 = objc_msgSend(v5[297], "dataWithContentsOfFile:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v8), v19);
        BOOL v9 = objc_msgSend(v6[316], "propertyListWithData:options:format:error:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v23 = v9;
          id v10 = [v9 objectForKey:@"operations"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v21 = v10;
            id v11 = v10;
            id v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v26 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  unsigned __int8 v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                  dispatch_semaphore_t v17 = [v16 objectForKey:@"operation"];
                  if ([v17 isEqualToString:@"upload_track"]) {
                    [(MLSyncClient *)self _evaluateUploadTrackDatabaseChangeStep:v16];
                  }
                }
                id v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v13);
            }

            uint64_t v5 = &ATGetPhysicalSizeForLogicalSize_ptr;
            dispatch_semaphore_t v6 = &ATGetPhysicalSizeForLogicalSize_ptr;
            uint64_t v7 = v19;
            id v4 = v20;
            id v10 = v21;
          }

          BOOL v9 = v23;
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v4);
      id v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  return 1;
}

- (BOOL)_verifySyncPlistFiles
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(MLSyncClient *)self _syncPlistFiles];
  id v2 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        dispatch_semaphore_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v7 = [v6 stringByAppendingPathExtension:@"cig"];
        id v8 = +[NSData dataWithContentsOfFile:v7];
        [v6 UTF8String];
        id v9 = v8;
        [v9 bytes];
        [v9 length];
        sub_67C4();
        if (v10)
        {
          int v12 = v10;
          id v13 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = [v9 length];
            *(_DWORD *)long long buf = 134218240;
            uint64_t v22 = v12;
            __int16 v23 = 2048;
            id v24 = v14;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "This tastes like anise-flavored gasoline. GrappaVerify error = %ld cig length = %ld", buf, 0x16u);
          }

          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a6;
  notify_post((const char *)[ML3MusicLibraryBackgroundTasksShouldSuppressChangesNotification UTF8String]);
  BOOL v11 = [(MLSyncClient *)self _library];
  self->_grappaID = a5;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_5D13C;
  v34[3] = &unk_99E20;
  void v34[4] = self;
  id v35 = v11;
  unsigned int v36 = a5;
  id v25 = v35;
  [v35 performReadOnlyDatabaseTransactionWithBlock:v34];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v12 = [(MLSyncClient *)self _syncPlistFiles];
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        if (unlink((const char *)[v17 fileSystemRepresentation]) == -1)
        {
          long long v18 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            long long v19 = __error();
            long long v20 = strerror(*v19);
            *(_DWORD *)long long buf = 138543618;
            id v38 = v17;
            __int16 v39 = 2080;
            long long v40 = v20;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Could not remove sync plist at %{public}@ during prepare: %s", buf, 0x16u);
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v14);
  }

  id v21 = +[NSFileManager defaultManager];
  [v21 removeItemAtPath:@"/var/tmp/Media/" error:0];

  uint64_t v22 = +[NSFileManager defaultManager];
  [v22 createDirectoryAtPath:@"/var/tmp/Media/" withIntermediateDirectories:1 attributes:0 error:0];

  __int16 v23 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Prepared!", buf, 2u);
  }

  return 1;
}

- (id)currentSyncAnchor
{
  id v2 = [(MLSyncClient *)self _library];
  id v3 = [v2 valueForDatabaseProperty:@"MLSyncClientSyncAnchor"];

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"0";
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObjects:@"Media", 0];
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  id v3 = [(MLSyncClient *)self _library];
  [v3 reconnectToDatabase];

  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self];
  CFStringRef v4 = (const __CFString *)ATStartupCompleteNotification;
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self name:ATStartupCompleteNotification object:0];
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self name:@"com.apple.nanomusic.sync.defaults" object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanoregistry.devicedidpair", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanoregistry.devicedidunpair", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileipod-prefsChanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.accountschanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.StoreFrontChanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunescloudd.artworkDownloadsDidCompleteNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.Music-SortAlbums", 0);
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self name:ML3MusicLibraryContentsDidChangeNotification object:0];
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self name:ML3MusicLibraryDisplayValuesDidChangeNotification object:0];
  dispatch_semaphore_t v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];

  if ([v7 isEqualToString:@"com.apple.atc"])
  {
    [(MLSyncClientKeepLocalEventHandlerWrapper *)self->_keepLocalEventHandlerWrapper stopKeepLocalHandler];
    id v8 = +[MLSyncClientEnvironmentPolicyChangeHandler sharedInstance];
    [v8 removeObserver:self];
  }
  v9.receiver = self;
  v9.super_class = (Class)MLSyncClient;
  [(MLSyncClient *)&v9 dealloc];
}

- (MLSyncClient)init
{
  v35.receiver = self;
  v35.super_class = (Class)MLSyncClient;
  id v2 = [(MLSyncClient *)&v35 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.MusicLibrarySyncBundle.MLSyncClient.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_semaphore_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.amp.MusicLibrarySyncBundle.MLSyncClient.utilityQueue", v6);
    utilityQueue = v2->_utilityQueue;
    v2->_utilityQueue = (OS_dispatch_queue *)v7;

    objc_super v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.amp.MusicLibrarySyncBundle.MLSyncClient.cachedSettingsQueue", v9);
    cachedSettingsQueue = v2->_cachedSettingsQueue;
    v2->_cachedSettingsQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.amp.MusicLibrarySyncBundle.MLSyncClient.callBackQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callBackQueue = v2->_callBackQueue;
    v2->_callBackQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSMutableArray array];
    downloadedAssets = v2->_downloadedAssets;
    v2->_downloadedAssets = (NSMutableArray *)v14;

    uint64_t v16 = +[NSMutableArray array];
    streams = v2->_streams;
    v2->_streams = (NSMutableArray *)v16;

    long long v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingUploads = v2->_pendingUploads;
    v2->_pendingUploads = v18;

    autoCreatedSmartPlaylistsPIDs = v2->_autoCreatedSmartPlaylistsPIDs;
    v2->_autoCreatedSmartPlaylistsPIDs = 0;

    uint64_t v21 = +[NSNotificationCenter defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v21;

    uint64_t v23 = +[NSMutableSet set];
    modifiedPlaylistsPIDs = v2->_modifiedPlaylistsPIDs;
    v2->_modifiedPlaylistsPIDs = (NSMutableSet *)v23;

    uint64_t v25 = +[NSMutableArray array];
    observedSessions = v2->_observedSessions;
    v2->_observedSessions = (NSMutableArray *)v25;

    notify_post((const char *)[ML3MusicLibraryBackgroundTasksShouldStopSuppressingChangesNotification UTF8String]);
    id v27 = +[NSBundle mainBundle];
    id v28 = [v27 bundleIdentifier];

    unsigned int v29 = [v28 isEqualToString:@"com.apple.atc"];
    long long v30 = _ATLogCategorySyncBundle();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Performing startup actions specific for atc", buf, 2u);
      }

      [(NSNotificationCenter *)v2->_notificationCenter addObserver:v2 selector:"_handleATCStartupCompletedNotification:" name:ATStartupCompleteNotification object:0];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_5D8D8, @"com.apple.nanoregistry.devicedidpair", 0, CFNotificationSuspensionBehaviorDrop);
      long long v33 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v33, v2, (CFNotificationCallback)sub_5D8C8, @"com.apple.nanoregistry.devicedidunpair", 0, CFNotificationSuspensionBehaviorDrop);
    }
    else
    {
      if (v31)
      {
        *(_DWORD *)long long buf = 138543362;
        unsigned __int8 v37 = v28;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Ignoring startup actions for %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

@end