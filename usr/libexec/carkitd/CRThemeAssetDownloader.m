@interface CRThemeAssetDownloader
- (BOOL)assetQueue_queryInProgress;
- (CRThemeAssetDownloadObserving)downloadObserver;
- (CRThemeAssetDownloader)init;
- (NSMapTable)assetQueue_currentlyDownloadingAssets;
- (NSSet)assetRequests;
- (OS_dispatch_queue)assetQueue;
- (id)_assetQueue_installedAssets;
- (void)_assetQueue_cancelUnusedDownloads;
- (void)_assetQueue_notifyObserverOfAsset:(id)a3 forAssetRequest:(id)a4;
- (void)_assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:(id)a3 version:(id)a4 progress:(id)a5;
- (void)_assetQueue_notifyObserverOfFailedDownloadForAssetRequest:(id)a3 version:(id)a4 error:(id)a5;
- (void)_assetQueue_processPerAssetRequestAllAssets:(id)a3 completion:(id)a4;
- (void)_assetQueue_queryUpdatedAssetsForRequests:(id)a3;
- (void)_assetQueue_removeAssets:(id)a3;
- (void)_assetQueue_removeAssetsBeforeVersion:(id)a3;
- (void)_assetQueue_removeUnusedAssets;
- (void)_assetQueue_requestAssetCatalogDownload;
- (void)handleDownloadHintForAssetRequest:(id)a3;
- (void)removeAssetsBeforeVersion:(id)a3;
- (void)setAssetQueue_queryInProgress:(BOOL)a3;
- (void)setAssetRequests:(id)a3;
- (void)setDownloadObserver:(id)a3;
@end

@implementation CRThemeAssetDownloader

- (CRThemeAssetDownloader)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRThemeAssetDownloader;
  v2 = [(CRThemeAssetDownloader *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.carkit.ThemeAssetDownloader", v3);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMapTable strongToWeakObjectsMapTable];
    assetQueue_currentlyDownloadingAssets = v2->_assetQueue_currentlyDownloadingAssets;
    v2->_assetQueue_currentlyDownloadingAssets = (NSMapTable *)v6;

    [(CRThemeAssetDownloader *)v2 setAssetQueue_queryInProgress:0];
  }
  return v2;
}

- (void)setAssetRequests:(id)a3
{
  id v4 = a3;
  v5 = [(CRThemeAssetDownloader *)self assetQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061534;
  v7[3] = &unk_1000BD3A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleDownloadHintForAssetRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CRThemeAssetDownloader *)self assetQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000616EC;
  v7[3] = &unk_1000BD3A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeAssetsBeforeVersion:(id)a3
{
  id v4 = a3;
  v5 = [(CRThemeAssetDownloader *)self assetQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000618C8;
  v7[3] = &unk_1000BD3A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_assetQueue_requestAssetCatalogDownload
{
  v3 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting theme assets catalog download", buf, 2u);
  }

  id v5 = objc_alloc_init((Class)MADownloadOptions);
  [v5 setAllowsCellularAccess:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000619D8;
  v6[3] = &unk_1000BF608;
  v6[4] = self;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.CarDDPAssets" options:v5 completionWithError:v6];
}

- (void)_assetQueue_queryUpdatedAssetsForRequests:(id)a3
{
  id v4 = a3;
  id v5 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    unsigned int v6 = [(CRThemeAssetDownloader *)self assetQueue_queryInProgress];
    v7 = CarThemeAssetsLogging();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        objc_super v9 = "asset query already in progress";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, buf, 2u);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "starting asset query for %@", buf, 0xCu);
    }

    [(CRThemeAssetDownloader *)self setAssetQueue_queryInProgress:1];
    v7 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.CarDDPAssets"];
    [v7 returnTypes:2];
    [v7 setDoNotBlockBeforeFirstUnlock:1];
    id v10 = [v7 queryMetaDataSync];
    v11 = [v7 results];
    if (v10)
    {
      if (v10 != (id)2)
      {
        v15 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100076020();
        }

        goto LABEL_24;
      }
      v12 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100076088(v12);
      }

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100061ECC;
      v23[3] = &unk_1000BF630;
      v23[4] = self;
      [(CRThemeAssetDownloader *)self _assetQueue_processPerAssetRequestAllAssets:v11 completion:v23];
    }
    else
    {
      unsigned __int8 v13 = [v7 isCatalogFetchedWithinThePastFewDays:3];
      if ((v13 & 1) == 0)
      {
        v14 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000760CC(v14);
        }
      }
      objc_initWeak((id *)buf, self);
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_100061EE0;
      v19 = &unk_1000BF6D0;
      v20 = self;
      id v21 = v4;
      objc_copyWeak(&v22, (id *)buf);
      [(CRThemeAssetDownloader *)self _assetQueue_processPerAssetRequestAllAssets:v11 completion:&v16];
      objc_destroyWeak(&v22);

      objc_destroyWeak((id *)buf);
      if (v13) {
        goto LABEL_24;
      }
    }
    [(CRThemeAssetDownloader *)self _assetQueue_requestAssetCatalogDownload];
LABEL_24:
    -[CRThemeAssetDownloader setAssetQueue_queryInProgress:](self, "setAssetQueue_queryInProgress:", 0, v16, v17, v18, v19, v20);

    goto LABEL_25;
  }
  v7 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    objc_super v9 = "no asset requests to query";
    goto LABEL_7;
  }
LABEL_25:
}

- (id)_assetQueue_installedAssets
{
  v2 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.CarDDPAssets"];
  [v3 returnTypes:1];
  [v3 setDoNotBlockBeforeFirstUnlock:1];
  if ([v3 queryMetaDataSync])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 results];
  }

  return v4;
}

- (void)_assetQueue_cancelUnusedDownloads
{
  id v3 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v3);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v24 = self;
  id v4 = [(CRThemeAssetDownloader *)self assetQueue_currentlyDownloadingAssets];
  id v5 = [v4 objectEnumerator];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v25 = *(void *)v31;
    *(void *)&long long v7 = 138412546;
    long long v22 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = [v10 cr_assetVersion:v22];
        v12 = [v11 identifier];

        if (v12)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          unsigned __int8 v13 = [(CRThemeAssetDownloader *)v24 assetRequests];
          id v14 = [v13 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) assetIdentifier];
                unsigned __int8 v19 = [v12 isEqualToString:v18];

                if (v19)
                {

                  id v21 = CarThemeAssetsLogging();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v22;
                    v35 = v12;
                    __int16 v36 = 2112;
                    v37 = v10;
                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "still need ongoing download for assetID %@: %@", buf, 0x16u);
                  }

                  goto LABEL_21;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          v20 = CarThemeAssetsLogging();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v35 = v12;
            __int16 v36 = 2112;
            v37 = v10;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cancelling download for assetID %@: %@", buf, 0x16u);
          }

          [v10 cancelDownloadSync];
        }
LABEL_21:
      }
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v8);
  }
}

- (void)_assetQueue_removeAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v13 = [v11 cr_assetVersion];
          *(_DWORD *)buf = 138543618;
          unsigned __int8 v19 = v13;
          __int16 v20 = 2112;
          id v21 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing asset %{public}@: %@", buf, 0x16u);
        }
        [v11 purgeSync];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)_assetQueue_removeUnusedAssets
{
  id v3 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v3);

  [(CRThemeAssetDownloader *)self _assetQueue_cancelUnusedDownloads];
  id v4 = [(CRThemeAssetDownloader *)self _assetQueue_installedAssets];
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100062BE8;
    v7[3] = &unk_1000BF6F8;
    void v7[4] = self;
    id v5 = +[NSPredicate predicateWithBlock:v7];
    id v6 = [v4 filteredArrayUsingPredicate:v5];

    [(CRThemeAssetDownloader *)self _assetQueue_removeAssets:v6];
  }
}

- (void)_assetQueue_removeAssetsBeforeVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CRThemeAssetDownloader *)self _assetQueue_installedAssets];
  id v7 = [v4 identifier];
  id v8 = +[MAAsset cr_themeAsset_filteredAssets:v6 matchingAssetIdentifier:v7 maximumSDKVersion:0 maximumCompatibilityVersion:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100062E8C;
  v12[3] = &unk_1000BF6F8;
  id v13 = v4;
  id v9 = v4;
  id v10 = +[NSPredicate predicateWithBlock:v12];
  v11 = [v8 filteredArrayUsingPredicate:v10];

  [(CRThemeAssetDownloader *)self _assetQueue_removeAssets:v11];
}

- (void)_assetQueue_processPerAssetRequestAllAssets:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v6 = (void (**)(id, void *, void *, void *))a4;
  id v7 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v7);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(CRThemeAssetDownloader *)self assetRequests];
  id v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v23;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
        id v10 = [v9 assetIdentifier];
        v11 = [v9 maximumSDKVersion];
        v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 maximumCompatibilityVersion]);
        id v13 = +[MAAsset cr_themeAsset_filteredAssets:v20 matchingAssetIdentifier:v10 maximumSDKVersion:v11 maximumCompatibilityVersion:v12];

        long long v14 = +[MAAsset cr_themeAsset_highestVersionAssetInAssets:v13];
        long long v15 = +[MAAsset cr_installedAssetsInAssets:v13];
        long long v16 = +[MAAsset cr_themeAsset_highestVersionAssetInAssets:v15];
        if (v14 != v16)
        {
          if (!v6) {
            goto LABEL_9;
          }
LABEL_8:
          v6[2](v6, v9, v16, v14);
          goto LABEL_9;
        }

        long long v14 = 0;
        if (v6) {
          goto LABEL_8;
        }
LABEL_9:

        id v8 = (char *)v8 + 1;
      }
      while (v21 != v8);
      id v17 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v21 = v17;
    }
    while (v17);
  }
}

- (void)_assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:(id)a3 version:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v11);

  v12 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "download attempt for asset request: %@ version: %@", (uint8_t *)&v16, 0x16u);
  }

  id v13 = [(CRThemeAssetDownloader *)self downloadObserver];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    long long v15 = [(CRThemeAssetDownloader *)self downloadObserver];
    [v15 assetDownloader:self attemptingDownloadForAssetRequest:v8 version:v9 progress:v10];
  }
}

- (void)_assetQueue_notifyObserverOfAsset:(id)a3 forAssetRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 cr_assetVersion];
  uint64_t v10 = [v6 getLocalFileUrl];
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v10 version:v9];
    id v13 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      __int16 v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "notifying observer of asset: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    char v14 = [(CRThemeAssetDownloader *)self downloadObserver];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      int v16 = [(CRThemeAssetDownloader *)self downloadObserver];
      [v16 assetDownloader:self hasAsset:v12 forAssetRequest:v7];
    }
  }
  else
  {
    v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100076270(v6);
    }
  }
}

- (void)_assetQueue_notifyObserverOfFailedDownloadForAssetRequest:(id)a3 version:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CRThemeAssetDownloader *)self assetQueue];
  dispatch_assert_queue_V2(v11);

  v12 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "download failed for asset request: %@ version: %@ error: %@", (uint8_t *)&v16, 0x20u);
  }

  id v13 = [(CRThemeAssetDownloader *)self downloadObserver];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    char v15 = [(CRThemeAssetDownloader *)self downloadObserver];
    [v15 assetDownloader:self failedDownloadForAssetRequest:v8 version:v9 error:v10];
  }
}

- (NSSet)assetRequests
{
  return self->_assetRequests;
}

- (CRThemeAssetDownloadObserving)downloadObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadObserver);

  return (CRThemeAssetDownloadObserving *)WeakRetained;
}

- (void)setDownloadObserver:(id)a3
{
}

- (OS_dispatch_queue)assetQueue
{
  return self->_assetQueue;
}

- (NSMapTable)assetQueue_currentlyDownloadingAssets
{
  return self->_assetQueue_currentlyDownloadingAssets;
}

- (BOOL)assetQueue_queryInProgress
{
  return self->_assetQueue_queryInProgress;
}

- (void)setAssetQueue_queryInProgress:(BOOL)a3
{
  self->_assetQueue_queryInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetQueue_currentlyDownloadingAssets, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
  objc_destroyWeak((id *)&self->_downloadObserver);

  objc_storeStrong((id *)&self->_assetRequests, 0);
}

@end