@interface IMUbiquityDocumentsObserver
- (BCICloudIdentityToken)identity;
- (IMUbiquityDocumentsObserver)init;
- (IMUbiquityDocumentsObserver)initWithDelegate:(id)a3 ubquityStatusMonitor:(id)a4 directoriesSubpath:(id)a5;
- (IMUbiquityDocumentsObserverDelegate)delegate;
- (IMUbiquityStatusMonitor)ubiquityStatusMonitor;
- (NSMetadataQuery)query;
- (NSString)description;
- (NSString)directoriesSubpath;
- (NSURL)containerURL;
- (NSURL)noSyncURL;
- (OS_dispatch_queue)queue;
- (id)_dataURL;
- (id)_documentsURL;
- (id)_identityData;
- (id)_itemsForMetadataItems:(id)a3;
- (id)_noSyncURL;
- (id)_replacementObjectForResultObject:(id)a3;
- (void)dealloc;
- (void)documentsURL:(id)a3;
- (void)mq_queryDidFinish:(id)a3;
- (void)mq_queryDidStart:(id)a3;
- (void)mq_queryDidUpdate:(id)a3;
- (void)mq_setupQuery:(id)a3;
- (void)mq_tearDownQuery;
- (void)q_createSubpathDirectories;
- (void)restartQuery;
- (void)setContainerURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectoriesSubpath:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setNoSyncURL:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)tearDownQuery;
- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4;
@end

@implementation IMUbiquityDocumentsObserver

- (IMUbiquityDocumentsObserver)init
{
  return 0;
}

- (IMUbiquityDocumentsObserver)initWithDelegate:(id)a3 ubquityStatusMonitor:(id)a4 directoriesSubpath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IMUbiquityDocumentsObserver;
  v11 = [(IMUbiquityDocumentsObserver *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_ubiquityStatusMonitor, v9);
    objc_storeStrong((id *)&v12->_directoriesSubpath, a5);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.iBooks.IMUbiquityDocumentsObserver", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    [v9 addObserver:v12];
    v15 = v12->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_15B878;
    v17[3] = &unk_2C3AF8;
    v18 = v12;
    id v19 = v9;
    dispatch_barrier_async(v15, v17);
  }
  return v12;
}

- (void)dealloc
{
  if (self->_query)
  {
    v3 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1EF1C4();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IMUbiquityDocumentsObserver;
  [(IMUbiquityDocumentsObserver *)&v4 dealloc];
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v5 = a3;
  v6 = [(IMUbiquityDocumentsObserver *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15BB6C;
  v8[3] = &unk_2C3AF8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(v6, v8);
}

- (void)restartQuery
{
  v3 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_DEFAULT, "Starting new query", buf, 2u);
  }

  [(IMUbiquityDocumentsObserver *)self tearDownQuery];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15BD1C;
  v4[3] = &unk_2C58F0;
  v4[4] = self;
  [(IMUbiquityDocumentsObserver *)self documentsURL:v4];
}

- (void)tearDownQuery
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15BF88;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BCICloudIdentityToken)identity
{
  identity = self->_identity;
  if (!identity)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
    id v5 = [WeakRetained ubiquityIdentityToken];
    v6 = self->_identity;
    self->_identity = v5;

    identity = self->_identity;
  }

  return identity;
}

- (void)documentsURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(IMUbiquityDocumentsObserver *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_15C0A4;
    v6[3] = &unk_2C4678;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)mq_setupQuery:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "Setting up query", v10, 2u);
  }

  if (!+[NSThread isMainThread])
  {
    v6 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1EF284();
    }
  }
  [(IMUbiquityDocumentsObserver *)self setQuery:v4];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"mq_queryDidStart:" name:NSMetadataQueryDidStartGatheringNotification object:v4];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"mq_queryDidFinish:" name:NSMetadataQueryDidFinishGatheringNotification object:v4];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"mq_queryDidUpdate:" name:NSMetadataQueryDidUpdateNotification object:v4];

  [v4 startQuery];
}

- (void)mq_tearDownQuery
{
  if (!+[NSThread isMainThread])
  {
    v3 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1EF284();
    }
  }
  id v4 = [(IMUbiquityDocumentsObserver *)self query];
  if (v4)
  {
    id v5 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1EF2C4();
    }

    [(IMUbiquityDocumentsObserver *)self setQuery:0];
    [v4 stopQuery];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:NSMetadataQueryDidStartGatheringNotification object:v4];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:v4];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NSMetadataQueryDidUpdateNotification object:v4];
  }
}

- (void)mq_queryDidStart:(id)a3
{
  v3 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_DEFAULT, "Query did start", v4, 2u);
  }
}

- (void)mq_queryDidFinish:(id)a3
{
  id v4 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "Query did finish", buf, 2u);
  }

  id v5 = [(IMUbiquityDocumentsObserver *)self query];
  [v5 disableUpdates];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(IMUbiquityDocumentsObserver *)self query];
  dispatch_queue_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_15C5F0;
  v16 = &unk_2CA4B8;
  id v8 = v6;
  id v17 = v8;
  v18 = self;
  [v7 enumerateResultsUsingBlock:&v13];

  id v9 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 count:v13, v14, v15, v16];
    *(_DWORD *)buf = 134218242;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "Found %lu downloaded items:%@", buf, 0x16u);
  }

  v11 = [(IMUbiquityDocumentsObserver *)self delegate];
  [v11 ubiquityDocumentsObserver:self didLoadWithItems:v8];

  v12 = [(IMUbiquityDocumentsObserver *)self query];
  [v12 enableUpdates];
}

- (void)mq_queryDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "mq_queryDidUpdate %@", (uint8_t *)&v18, 0xCu);
  }

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:NSMetadataQueryUpdateAddedItemsKey];
  id v8 = [(IMUbiquityDocumentsObserver *)self _itemsForMetadataItems:v7];

  id v9 = [v6 objectForKeyedSubscript:NSMetadataQueryUpdateChangedItemsKey];
  id v10 = [(IMUbiquityDocumentsObserver *)self _itemsForMetadataItems:v9];

  v11 = [v6 objectForKeyedSubscript:NSMetadataQueryUpdateRemovedItemsKey];
  v12 = [(IMUbiquityDocumentsObserver *)self _itemsForMetadataItems:v11];

  dispatch_queue_t v13 = BKLibraryDataSourceUbiquityLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v8 count];
    id v15 = [v10 count];
    id v16 = [v12 count];
    int v18 = 134219266;
    id v19 = v14;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    __int16 v22 = 2048;
    id v23 = v15;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2048;
    id v27 = v16;
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl(&def_7D91C, v13, OS_LOG_TYPE_INFO, "mq_queryDidUpdate added %lu:(%@) changed %lu:(%@) removed %lu:(%@)", (uint8_t *)&v18, 0x3Eu);
  }

  id v17 = [(IMUbiquityDocumentsObserver *)self delegate];
  if ([v8 count]) {
    [v17 ubiquityDocumentsObserver:self itemsDidBecomeAvailable:v8];
  }
  if ([v12 count]) {
    [v17 ubiquityDocumentsObserver:self itemsDidBecomeUnavailable:v12];
  }
  if ([v10 count]) {
    [v17 ubiquityDocumentsObserver:self itemsDidChange:v10];
  }
}

- (id)_identityData
{
  v2 = [(IMUbiquityDocumentsObserver *)self identity];
  if (v2)
  {
    v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_documentsURL
{
  v3 = [(IMUbiquityDocumentsObserver *)self containerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"Documents"];

  id v5 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v5)
  {
    id v6 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v7 = [v4 URLByAppendingPathComponent:v6];

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_dataURL
{
  v3 = [(IMUbiquityDocumentsObserver *)self containerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"Data"];

  id v5 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v5)
  {
    id v6 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v7 = [v4 URLByAppendingPathComponent:v6];

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_noSyncURL
{
  noSyncURL = self->_noSyncURL;
  if (!noSyncURL)
  {
    id v4 = [(IMUbiquityDocumentsObserver *)self containerURL];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 URLByAppendingPathComponent:@"metadata.nosync"];
      uint64_t v7 = +[NSFileManager defaultManager];
      id v8 = [v6 path];
      unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

      if (v9)
      {
        id v10 = BKLibraryDataSourceUbiquityLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1EF2F8();
        }

        v11 = v6;
        v12 = self->_noSyncURL;
        self->_noSyncURL = v11;
      }
      else
      {
        id v22 = 0;
        unsigned int v13 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:&v22];
        v12 = (NSURL *)v22;
        id v14 = BKLibraryDataSourceUbiquityLog();
        id v15 = (NSURL *)v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_1EF32C();
          }

          id v16 = v6;
          id v15 = self->_noSyncURL;
          self->_noSyncURL = v16;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          sub_1EF360();
        }
      }
    }

    noSyncURL = self->_noSyncURL;
  }
  id v17 = noSyncURL;
  int v18 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v18)
  {
    id v19 = [(IMUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v20 = [(NSURL *)v17 URLByAppendingPathComponent:v19];

    id v17 = (NSURL *)v20;
  }

  return v17;
}

- (void)q_createSubpathDirectories
{
  v3 = [(IMUbiquityDocumentsObserver *)self _documentsURL];
  id v4 = [(IMUbiquityDocumentsObserver *)self _dataURL];
  id v5 = [(IMUbiquityDocumentsObserver *)self _noSyncURL];
  +[NSFileManager defaultManager];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15CDDC;
  v8[3] = &unk_2CA4E0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  id v10 = v11;
  uint64_t v7 = objc_retainBlock(v8);
  ((void (*)(void *, void *))v7[2])(v7, v3);
  ((void (*)(void *, void *))v7[2])(v7, v4);
  ((void (*)(void *, void *))v7[2])(v7, v5);

  _Block_object_dispose(v11, 8);
}

- (id)_itemsForMetadataItems:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_15CF90;
  v11 = &unk_2CA4B8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v13 = self;
  id v5 = v12;
  [v4 enumerateObjectsUsingBlock:&v8];

  id v6 = [v5 copy:v8, v9, v10, v11];

  return v6;
}

- (id)_replacementObjectForResultObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 valueForAttribute:NSMetadataItemURLKey];
  [v4 setUrl:v5];

  id v6 = [v3 valueForAttribute:NSMetadataUbiquitousItemDownloadingStatusKey];
  if ([v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusCurrent]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = (uint64_t)[v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusDownloaded];
  }
  id v8 = [v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusNotDownloaded];
  [v4 setIsLocal:v7];
  [v4 setIsNotLocal:v8];
  if ((v7 & 1) != 0 || !v8)
  {
    [v4 setIsDownloading:0];
  }
  else
  {
    uint64_t v9 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsDownloadingKey];
    id v10 = [v9 BOOLValue];

    [v4 setIsDownloading:v10];
    if (v10)
    {
      v11 = [v3 valueForAttribute:NSMetadataUbiquitousItemPercentDownloadedKey];
      [v4 setDownloadingPercent:v11];
    }
  }
  id v12 = [v3 valueForAttribute:NSMetadataUbiquitousItemUploadingErrorKey];
  unsigned int v13 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsUploadingKey];
  id v14 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsUploadedKey];
  if (![v13 BOOLValue] || v12)
  {
    if ([v14 BOOLValue]) {
      [v4 setIsUploaded:1];
    }
    else {
      [v4 setUploadingError:v12];
    }
  }
  else
  {
    [v4 setIsUploading:1];
    id v15 = [v3 valueForAttribute:NSMetadataUbiquitousItemPercentUploadedKey];
    [v4 setUploadingPercent:v15];
  }
  objc_opt_class();
  id v16 = [v3 valueForAttribute:@"kMDItemFSContentChangeDate"];
  id v17 = BUDynamicCast();
  [v4 setContentChangedDate:v17];

  objc_opt_class();
  int v18 = [v3 valueForAttribute:@"kMDItemFSCreationDate"];
  id v19 = BUDynamicCast();
  [v4 setContentCreationDate:v19];

  objc_opt_class();
  uint64_t v20 = [v3 valueForAttribute:@"kMDItemFSSize"];
  __int16 v21 = BUDynamicCast();
  [v4 setContentFileSize:v21];

  id v22 = [v3 valueForAttribute:NSMetadataUbiquitousItemHasUnresolvedConflictsKey];
  [v4 setUnresolvedConflict:v22];

  return v4;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(IMUbiquityDocumentsObserver *)self identity];
  id v6 = [(IMUbiquityDocumentsObserver *)self containerURL];
  uint64_t v7 = [(IMUbiquityDocumentsObserver *)self noSyncURL];
  id v8 = [(IMUbiquityDocumentsObserver *)self ubiquityStatusMonitor];
  uint64_t v9 = +[NSString stringWithFormat:@"<%@(%p) identity='%@' containerURL='%@' noSyncURL='%@'>\n\tubiquityStatusMonitor = %@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (IMUbiquityDocumentsObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMUbiquityDocumentsObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)directoriesSubpath
{
  return self->_directoriesSubpath;
}

- (void)setDirectoriesSubpath:(id)a3
{
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);

  return (IMUbiquityStatusMonitor *)WeakRetained;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void)setIdentity:(id)a3
{
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
}

- (NSURL)noSyncURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNoSyncURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSyncURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_ubiquityStatusMonitor);
  objc_storeStrong((id *)&self->_directoriesSubpath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end