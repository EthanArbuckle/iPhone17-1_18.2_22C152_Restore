@interface BKLibraryDataSourceBLDownload
- (BKLibraryDataSourceBLDownload)init;
- (BKLibraryDataSourcePlistWriting)iTunesSyncedBooksPlistCleaner;
- (BKLibraryManager)libraryManager;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)explicitContentRestricted;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSArray)restoreControllers;
- (NSMutableDictionary)assetsWithDownloadingChildAssets;
- (NSMutableDictionary)downloadingAssets;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (double)lastDownloadQueueReload;
- (id)_createDownloadStatusForReportingAsset:(id)a3 downloadingAsset:(id)a4;
- (id)_reportingAssetsForDownloadingAsset:(id)a3;
- (id)_reportingAssetsForDownloadingAsset:(id)a3 includeUntrackedParent:(BOOL)a4;
- (id)_updateDownloadingAssetAndCreateDownloadStatuses:(id)a3 from:(id)a4;
- (id)_updateDownloadingAssets:(id)a3;
- (id)didLoadSupplementalAssetHandler;
- (id)generationChangeHandler;
- (id)reloadCounterpartHandler;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (unint64_t)downloadQueueGeneration;
- (void)_addReportingItemToCoverCache:(id)a3;
- (void)_performBlockOnAllAssetsForAssetID:(id)a3 block:(id)a4;
- (void)_removeReportingItemFromCoverCache:(id)a3;
- (void)_reportAudiobookDownloadProgress:(id)a3;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)cancelDownloadForAssetID:(id)a3;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)p_checkForInactiveQueue;
- (void)pauseDownloadForAssetID:(id)a3;
- (void)reloadDownloadQueue;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)restartDownloadForAssetID:(id)a3;
- (void)resumeDownloadForAssetID:(id)a3;
- (void)setAssetsWithDownloadingChildAssets:(id)a3;
- (void)setDidLoadSupplementalAssetHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadQueueGeneration:(unint64_t)a3;
- (void)setDownloadingAssets:(id)a3;
- (void)setExplicitContentRestricted:(BOOL)a3;
- (void)setGenerationChangeHandler:(id)a3;
- (void)setITunesSyncedBooksPlistCleaner:(id)a3;
- (void)setLastDownloadQueueReload:(double)a3;
- (void)setLibraryManager:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setReloadCounterpartHandler:(id)a3;
- (void)setRestoreControllers:(id)a3;
- (void)togglePausedForAssetID:(id)a3 orTemporaryAssetID:(id)a4;
- (void)updateDownloadStatus;
@end

@implementation BKLibraryDataSourceBLDownload

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRestoreControllers:(id)a3
{
}

- (void)setReloadCounterpartHandler:(id)a3
{
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
}

- (void)setITunesSyncedBooksPlistCleaner:(id)a3
{
}

- (void)setGenerationChangeHandler:(id)a3
{
}

- (void)setDidLoadSupplementalAssetHandler:(id)a3
{
}

- (void)reloadDownloadQueue
{
  v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  if (v5 - self->_lastDownloadQueueReload <= 14400.0)
  {
    v7 = BCBookDownloadLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suppressing reloadFromServer due to time clamp", v8, 2u);
    }
  }
  else
  {
    self->_lastDownloadQueueReload = v5;
    v6 = BCBookDownloadLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Triggering reloadFromServer", buf, 2u);
    }

    v7 = +[BLDownloadQueue sharedInstance];
    [v7 reloadFromServerWithCompletion:&stru_100A4AB78];
  }
}

- (BKLibraryDataSourceBLDownload)init
{
  kdebug_trace();
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryDataSourceBLDownload;
  v3 = [(BKLibraryDataSourceBLDownload *)&v13 init];
  if (v3)
  {
    double v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.BKLibraryDataSourceBLDownload.dispatchQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = +[BLDownloadQueue sharedInstance];
    [v7 addObserver:v3];

    uint64_t v8 = objc_opt_new();
    downloadingAssets = v3->_downloadingAssets;
    v3->_downloadingAssets = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    assetsWithDownloadingChildAssets = v3->_assetsWithDownloadingChildAssets;
    v3->_assetsWithDownloadingChildAssets = (NSMutableDictionary *)v10;
  }
  kdebug_trace();
  return v3;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ibooks.progress.bldownload";
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  v3 = +[BLDownloadQueue sharedInstance];
  [v3 removeObserver:self];

  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = 0;

  downloadingAssets = self->_downloadingAssets;
  self->_downloadingAssets = 0;

  assetsWithDownloadingChildAssets = self->_assetsWithDownloadingChildAssets;
  self->_assetsWithDownloadingChildAssets = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryDataSourceBLDownload;
  [(BKLibraryDataSourceBLDownload *)&v7 dealloc];
}

- (void)p_checkForInactiveQueue
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  double v4 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D1004;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (id)_updateDownloadingAssets:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 bk_assetIdentifier];
  if (![v5 length]) {
    goto LABEL_34;
  }
  v6 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    v55 = (BKBLDownloadAsset *)v7;
    v56 = v5;
    uint64_t v8 = [(BKLibraryDataSourceBLDownload *)self _reportingAssetsForDownloadingAsset:v7];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v58;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v58 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v14 = [v13 title];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = [v13 author];

            if (v16) {
              continue;
            }
          }
          if ([v13 updateMetadata:v4])
          {
            v17 = BCBookDownloadLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v13 identifier];
              *(_DWORD *)buf = 138543362;
              v65 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "download metadata updated identifier=%{public}@", buf, 0xCu);
            }
            v19 = [(BKLibraryDataSourceBLDownload *)self libraryManager];
            v61 = v13;
            v20 = +[NSArray arrayWithObjects:&v61 count:1];
            [v19 libraryDataSource:self updatedAssets:v20];

            [(BKLibraryDataSourceBLDownload *)self _addReportingItemToCoverCache:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v10);
    }

    v21 = v55;
    dispatch_queue_t v5 = v56;
    goto LABEL_35;
  }
  if ([v4 isAudiobook])
  {
    v22 = [v4 storePlaylistID];
    id v23 = [v22 longLongValue];

    if (!v23)
    {
LABEL_34:
      v21 = 0;
      goto LABEL_35;
    }
  }
  v24 = [BKBLDownloadAsset alloc];
  v25 = [(BKLibraryDataSourceBLDownload *)self identifier];
  v21 = [(BKBLDownloadAsset *)v24 initWithBLDownloadStatus:v4 dataSourceIdentifier:v25 isParent:0];

  v26 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
  [v26 setObject:v21 forKeyedSubscript:v5];

  v27 = BCBookDownloadLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(BKBLDownloadAsset *)v21 identifier];
    *(_DWORD *)buf = 138412290;
    v65 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "download new asset=%@", buf, 0xCu);
  }
  v29 = [v4 storePlaylistID];
  id v30 = [v29 longLongValue];

  if (!v30) {
    goto LABEL_33;
  }
  v31 = [v4 storePlaylistID];
  v32 = [v31 stringValue];

  v33 = [(BKLibraryDataSourceBLDownload *)self assetsWithDownloadingChildAssets];
  v34 = [v33 objectForKeyedSubscript:v32];

  if (!v34)
  {
    v35 = [BKBLDownloadAsset alloc];
    v36 = [(BKLibraryDataSourceBLDownload *)self identifier];
    v34 = [(BKBLDownloadAsset *)v35 initWithBLDownloadStatus:v4 dataSourceIdentifier:v36 isParent:1];

    v37 = [(BKLibraryDataSourceBLDownload *)self assetsWithDownloadingChildAssets];
    [v37 setObject:v34 forKeyedSubscript:v32];

    v38 = BCBookDownloadLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [(BKBLDownloadAsset *)v34 identifier];
      *(_DWORD *)buf = 138412290;
      v65 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "created parent=%@ for tracking", buf, 0xCu);
    }
  }
  unsigned int v40 = [v4 isAudiobook];
  char v41 = v40;
  if (v40)
  {
    v42 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
    [v42 setObject:v34 forKeyedSubscript:v32];

    v43 = BCBookDownloadLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [(BKBLDownloadAsset *)v34 identifier];
      *(_DWORD *)buf = 138412290;
      v65 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "download new parent=%@", buf, 0xCu);
    }
    v45 = [(BKLibraryDataSourceBLDownload *)self libraryManager];
    v68 = v34;
    v46 = +[NSArray arrayWithObjects:&v68 count:1];
    [v45 libraryDataSource:self addedAssets:v46];

    [(BKLibraryDataSourceBLDownload *)self _addReportingItemToCoverCache:v34];
  }
  v47 = BCBookDownloadLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = [(BKBLDownloadAsset *)v34 identifier];
    [(BKBLDownloadAsset *)v21 identifier];
    v49 = v21;
    v51 = v50 = v5;
    *(_DWORD *)buf = 138412546;
    v65 = v48;
    __int16 v66 = 2112;
    v67 = v51;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "set parent=%@ for child=%@", buf, 0x16u);

    dispatch_queue_t v5 = v50;
    v21 = v49;
  }
  [(BKBLDownloadAsset *)v34 addChild:v21];

  if ((v41 & 1) == 0)
  {
LABEL_33:
    v52 = [(BKLibraryDataSourceBLDownload *)self libraryManager];
    v63 = v21;
    v53 = +[NSArray arrayWithObjects:&v63 count:1];
    [v52 libraryDataSource:self addedAssets:v53];

    [(BKLibraryDataSourceBLDownload *)self _addReportingItemToCoverCache:v21];
  }
LABEL_35:

  return v21;
}

- (void)_addReportingItemToCoverCache:(id)a3
{
  id v3 = a3;
  id v4 = [v3 thumbnailImageURL];
  dispatch_queue_t v5 = [v4 absoluteString];

  if (v5)
  {
    v6 = +[BCCacheManager defaultCacheManager];
    uint64_t v7 = [v3 identifier];
    v15 = v7;
    v16 = v5;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v6 addURLs:v8 priority:5 quality:201 expiresAfter:10];
LABEL_7:

    goto LABEL_8;
  }
  id v9 = [v3 storeID];

  if (v9)
  {
    id v10 = BCBookDownloadLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v3 storeID];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding fallback store ID to cover cache: %@", buf, 0xCu);
    }
    v6 = +[BCCacheManager defaultCacheManager];
    uint64_t v7 = [v3 storeID];
    v12 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v12 count:1];
    [v6 addProductProfileIDs:v8 priority:5];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_removeReportingItemFromCoverCache:(id)a3
{
  id v3 = a3;
  id v4 = [v3 thumbnailImageURL];
  dispatch_queue_t v5 = [v4 absoluteString];

  if (v5)
  {
    v6 = +[BCCacheManager defaultCacheManager];
    uint64_t v7 = [v3 identifier];
    id v9 = v7;
    id v10 = v5;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v6 removeURLs:v8 priority:3 quality:201];
  }
}

- (id)_reportingAssetsForDownloadingAsset:(id)a3
{
  return [(BKLibraryDataSourceBLDownload *)self _reportingAssetsForDownloadingAsset:a3 includeUntrackedParent:0];
}

- (id)_reportingAssetsForDownloadingAsset:(id)a3 includeUntrackedParent:(BOOL)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  uint64_t v8 = [v6 parent];
  id v9 = [v8 identifier];

  if (v9)
  {
    if (a4) {
      goto LABEL_4;
    }
    id v10 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
    uint64_t v11 = [v8 identifier];
    v12 = [v10 objectForKeyedSubscript:v11];

    if (v12) {
LABEL_4:
    }
      [v7 addObject:v8];
  }
  if (([v6 isAudiobook] & 1) == 0) {
    [v7 addObject:v6];
  }

  return v7;
}

- (id)_updateDownloadingAssetAndCreateDownloadStatuses:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  id v9 = [(BKLibraryDataSourceBLDownload *)self _reportingAssetsForDownloadingAsset:v6 includeUntrackedParent:1];
  if ([v9 count])
  {
    if (v7) {
      [v6 setDownloadStatus:v7];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = -[BKLibraryDataSourceBLDownload _createDownloadStatusForReportingAsset:downloadingAsset:](self, "_createDownloadStatusForReportingAsset:downloadingAsset:", *(void *)(*((void *)&v18 + 1) + 8 * i), v6, (void)v18);
          [v8 addObject:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  v16 = [v6 parent:v18];
  [(BKLibraryDataSourceBLDownload *)self _reportAudiobookDownloadProgress:v16];

  return v8;
}

- (id)_createDownloadStatusForReportingAsset:(id)a3 downloadingAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 identifier], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [v6 identifier];
    id v10 = [v6 bytesDownloaded];
    id v11 = [v6 bytesTotal];
    id v12 = [v6 children];
    id v13 = [v12 count];

    uint64_t v14 = [v6 activeChildren];
    id v15 = [v14 count];

    [v6 progress];
    if (v16 >= 0.05) {
      float v17 = v16;
    }
    else {
      float v17 = 0.05;
    }
    id v18 = [v6 downloadState];
    switch((unint64_t)v18)
    {
      case 2uLL:
        long long v19 = BCBookDownloadLog();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        int v33 = 138543618;
        v34 = v9;
        __int16 v35 = 2048;
        double v36 = v17;
        long long v20 = "download status: asset=%{public}@ progress=%f REQUESTED";
        goto LABEL_24;
      case 3uLL:
        long long v19 = BCBookDownloadLog();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        int v33 = 138543618;
        v34 = v9;
        __int16 v35 = 2048;
        double v36 = v17;
        long long v20 = "download status: asset=%{public}@ progress=%f WAITING";
LABEL_24:
        id v23 = v19;
        uint32_t v24 = 22;
        break;
      case 4uLL:
        long long v19 = BCBookDownloadLog();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        int v33 = 138544642;
        v34 = v9;
        __int16 v35 = 2048;
        double v36 = v17;
        __int16 v37 = 2048;
        id v38 = v10;
        __int16 v39 = 2048;
        id v40 = v11;
        __int16 v41 = 2048;
        id v42 = v13;
        __int16 v43 = 2048;
        id v44 = v15;
        long long v20 = "download status: asset=%{public}@ progress=%f bytes=%lld/%lld children=%lu active=%lu";
        id v23 = v19;
        uint32_t v24 = 62;
        break;
      case 5uLL:
        long long v19 = BCBookDownloadLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138543618;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f DOWNLOADED", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v22 = 5;
        goto LABEL_33;
      case 6uLL:
        long long v19 = BCBookDownloadLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138543618;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f PAUSED", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v22 = 6;
        goto LABEL_33;
      case 7uLL:
        long long v19 = BCBookDownloadLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138543618;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f FAILED", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v22 = 7;
        goto LABEL_33;
      case 8uLL:
        long long v19 = BCBookDownloadLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138543618;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f CANCELED", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v22 = 8;
        goto LABEL_33;
      default:
        uint64_t v22 = (uint64_t)v18;
        long long v19 = BCBookDownloadLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138543874;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v17;
          __int16 v37 = 1024;
          LODWORD(v38) = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f state=%d (unexpected)", (uint8_t *)&v33, 0x1Cu);
        }
        goto LABEL_33;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v33, v24);
LABEL_26:
    uint64_t v22 = 4;
LABEL_33:

    if (![v6 isParent]) {
      goto LABEL_35;
    }
    v25 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
    v26 = [v6 identifier];
    v27 = [v25 objectForKeyedSubscript:v26];

    if (!v27)
    {
      id v32 = objc_alloc((Class)BKLibraryDownloadStatus);
      v29 = [v6 identifier];
      id v30 = [v32 initWithAssetID:v29 supplementalContentState:v22 progressValue:[v6 secondsRemaining] timeRemaining:[v6 bytesDownloaded] fileSize:[v6 bytesTotal] bytesDownloaded:v17];
    }
    else
    {
LABEL_35:
      id v28 = objc_alloc((Class)BKLibraryDownloadStatus);
      v29 = [v6 identifier];
      id v30 = [v28 initWithAssetID:v29 state:v22 progressValue:[v6 secondsRemaining] timeRemaining:[v6 bytesDownloaded] fileSize:[v6 bytesTotal] bytesDownloaded:v17];
    }
    long long v21 = v30;
  }
  else
  {
    id v9 = BCBookDownloadLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007EF4E0(v7, v6, v9);
    }
    long long v21 = 0;
  }

  return v21;
}

- (void)_reportAudiobookDownloadProgress:(id)a3
{
  id v4 = a3;
  if ([v4 isParent])
  {
    id v5 = objc_alloc_init((Class)BSUIAudioBookDownloadProgress);
    id v6 = [v4 identifier];
    [v5 setAssetIdentifier:v6];

    [v4 progress];
    id v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v5 setProgress:v7];

    id v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = BSUIAudioBookDownloadStatusNotification;
    uint64_t v11 = BSUIAudioBookDownloadProgressKey;
    id v12 = v5;
    id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v8 postNotificationName:v9 object:self userInfo:v10];
  }
}

- (void)_performBlockOnAllAssetsForAssetID:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  if (v9)
  {
    id v10 = (void *)v9;

LABEL_4:
    id v12 = [v10 parent];

    if (v12)
    {
      uint64_t v13 = [v10 parent];

      id v10 = (void *)v13;
    }
    uint64_t v14 = [v10 children];
    id v15 = [v14 count];

    if (v15)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      float v16 = [v10 activeChildren];
      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          long long v20 = 0;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            v7[2](v7, *(void *)(*((void *)&v28 + 1) + 8 * (void)v20));
            long long v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v18);
      }
    }
    else if ([v10 active])
    {
      ((void (**)(id, void *))v7)[2](v7, v10);
    }
    goto LABEL_20;
  }
  uint64_t v11 = [(BKLibraryDataSourceBLDownload *)self assetsWithDownloadingChildAssets];
  id v10 = [v11 objectForKeyedSubscript:v6];

  if (v10) {
    goto LABEL_4;
  }
  long long v21 = BCBookDownloadLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1007EF5A4((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
  }

  id v10 = 0;
LABEL_20:
}

- (void)updateDownloadStatus
{
  id v3 = BCBookDownloadLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007EF610(v3);
  }

  id v4 = [(BKLibraryDataSourceBLDownload *)self downloadingAssets];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D2834;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)pauseDownloadForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = BCBookDownloadLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pauseDownloadForAssetID:%@", buf, 0xCu);
  }

  id v6 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D2B68;
  v8[3] = &unk_100A43DD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)resumeDownloadForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = BCBookDownloadLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resumeDownloadForAssetID:%@", buf, 0xCu);
  }

  id v6 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D2E58;
  v8[3] = &unk_100A43DD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)cancelDownloadForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = BCBookDownloadLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cancelDownloadForAssetID:%@", buf, 0xCu);
  }

  id v6 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D3148;
  v8[3] = &unk_100A43DD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)restartDownloadForAssetID:(id)a3
{
  id v3 = BCBookDownloadLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not implemented - what does this mean?  Cancel followed by a start?", v4, 2u);
  }
}

- (void)togglePausedForAssetID:(id)a3 orTemporaryAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BCBookDownloadLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "togglePausedForAssetID:%@ orTemporaryAssetID:%@", buf, 0x16u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = v7;
  }
  id v10 = v9;
  if (v10)
  {
    id v11 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001D34DC;
    v12[3] = &unk_100A43DD8;
    v12[4] = self;
    id v13 = v10;
    dispatch_async(v11, v12);
  }
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  id v6 = BCBookDownloadLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BKLibraryDataSourceBLDownload] downloadQueue:downloadStatesDidChange: %@", buf, 0xCu);
  }

  id v7 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D3AE8;
  v9[3] = &unk_100A43DD8;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = BCBookDownloadLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BKLibraryDataSourceBLDownload] didCompleteWithError: %@", buf, 0xCu);
  }

  id v10 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001D3FB4;
  v12[3] = &unk_100A43DD8;
  id v13 = v7;
  uint64_t v14 = self;
  id v11 = v7;
  dispatch_async(v10, v12);
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D5040;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = +[NSMutableArray array];
  id v9 = [(BKLibraryDataSourceBLDownload *)self dispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001D52D8;
  v13[3] = &unk_100A45980;
  id v14 = v6;
  id v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    id v5 = v6;
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
  id v7 = a5;
  id v8 = [a3 permanentOrTemporaryAssetID];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D55F0;
  block[3] = &unk_100A45338;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(dispatchQueue, block);
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 permanentOrTemporaryAssetID];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D579C;
  block[3] = &unk_100A45338;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
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

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (BOOL)explicitContentRestricted
{
  return self->_explicitContentRestricted;
}

- (void)setExplicitContentRestricted:(BOOL)a3
{
  self->_explicitContentRestricted = a3;
}

- (id)generationChangeHandler
{
  return self->_generationChangeHandler;
}

- (id)reloadCounterpartHandler
{
  return self->_reloadCounterpartHandler;
}

- (id)didLoadSupplementalAssetHandler
{
  return self->_didLoadSupplementalAssetHandler;
}

- (NSArray)restoreControllers
{
  return self->_restoreControllers;
}

- (BKLibraryDataSourcePlistWriting)iTunesSyncedBooksPlistCleaner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iTunesSyncedBooksPlistCleaner);

  return (BKLibraryDataSourcePlistWriting *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)downloadingAssets
{
  return self->_downloadingAssets;
}

- (void)setDownloadingAssets:(id)a3
{
}

- (NSMutableDictionary)assetsWithDownloadingChildAssets
{
  return self->_assetsWithDownloadingChildAssets;
}

- (void)setAssetsWithDownloadingChildAssets:(id)a3
{
}

- (double)lastDownloadQueueReload
{
  return self->_lastDownloadQueueReload;
}

- (void)setLastDownloadQueueReload:(double)a3
{
  self->_lastDownloadQueueReload = a3;
}

- (unint64_t)downloadQueueGeneration
{
  return self->_downloadQueueGeneration;
}

- (void)setDownloadQueueGeneration:(unint64_t)a3
{
  self->_downloadQueueGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsWithDownloadingChildAssets, 0);
  objc_storeStrong((id *)&self->_downloadingAssets, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_iTunesSyncedBooksPlistCleaner);
  objc_storeStrong((id *)&self->_restoreControllers, 0);
  objc_storeStrong(&self->_didLoadSupplementalAssetHandler, 0);
  objc_storeStrong(&self->_reloadCounterpartHandler, 0);
  objc_storeStrong(&self->_generationChangeHandler, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end