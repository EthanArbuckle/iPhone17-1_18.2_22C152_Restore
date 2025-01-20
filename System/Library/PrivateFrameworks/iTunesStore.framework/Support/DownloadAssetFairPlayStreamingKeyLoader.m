@interface DownloadAssetFairPlayStreamingKeyLoader
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (DownloadAssetFairPlayStreamingKeyLoader)initWithDownloadEntity:(id)a3;
- (DownloadAssetFairPlayStreamingKeyLoaderDelegate)delegate;
- (IPodLibraryItem)libraryItem;
- (id)_pastisCertificateURL;
- (id)_pastisKeyServerURL;
- (id)_track;
- (int64_t)downloadIdentifier;
- (int64_t)rentalIdentifier;
- (int64_t)storeItemIdentifier;
- (void)_persistKeys;
- (void)_persistURI:(id)a3 persistentContentKey:(id)a4;
- (void)applyResourceLoaderDelegate:(id)a3;
- (void)persistKeys;
- (void)setDelegate:(id)a3;
@end

@implementation DownloadAssetFairPlayStreamingKeyLoader

- (DownloadAssetFairPlayStreamingKeyLoader)initWithDownloadEntity:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DownloadAssetFairPlayStreamingKeyLoader;
  v5 = [(DownloadAssetFairPlayStreamingKeyLoader *)&v17 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.itunesstore.PipelineDownloadTaskState", 0);
    resourceLoaderQueue = v5->_resourceLoaderQueue;
    v5->_resourceLoaderQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstore.PipelineDownloadTaskState.persistKeys", 0);
    persistenceQueue = v5->_persistenceQueue;
    v5->_persistenceQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    mutableCachedKeys = v5->_mutableCachedKeys;
    v5->_mutableCachedKeys = v10;

    if (v4)
    {
      v12 = [v4 valueForProperty:@"rental_id"];
      v5->_rentalIdentifier = (int64_t)[v12 integerValue];

      v13 = [v4 valueForProperty:@"store_item_id"];
      v5->_storeItemIdentifier = (int64_t)[v13 integerValue];

      v5->_downloadIdentifier = (int64_t)[v4 persistentID];
      v14 = (IPodLibraryItem *)[v4 copyDownloadingIPodLibraryItem];
      libraryItem = v5->_libraryItem;
      v5->_libraryItem = v14;
    }
  }

  return v5;
}

- (void)applyResourceLoaderDelegate:(id)a3
{
}

- (void)persistKeys
{
  persistenceQueue = self->_persistenceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094034;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_barrier_sync(persistenceQueue, block);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5 = a4;
  if (SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest())
  {
    dispatch_queue_t v6 = [(DownloadAssetFairPlayStreamingKeyLoader *)self _pastisCertificateURL];
    if (v6)
    {
      v7 = [(DownloadAssetFairPlayStreamingKeyLoader *)self _pastisKeyServerURL];
      BOOL v8 = v7 != 0;
      if (v7)
      {
        v30 = v6;
        SSVAVFoundationFramework();
        v9 = SSVWeakLinkedStringConstantForString();
        SSVAVFoundationFramework();
        v10 = SSVWeakLinkedStringConstantForString();
        v11 = [v5 contentInformationRequest];
        v12 = v11;
        if (v11)
        {
          v13 = [v11 allowedContentTypes];
          unsigned __int8 v14 = [v13 containsObject:v9];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
        objc_initWeak(location, self);
        v24 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000944C4;
        block[3] = &unk_1003A5088;
        objc_copyWeak(&v38, location);
        unsigned __int8 v39 = v14;
        id v32 = v5;
        id v33 = v30;
        id v34 = v7;
        v35 = self;
        id v36 = v9;
        id v37 = v10;
        id v25 = v10;
        dispatch_queue_t v6 = v30;
        id v26 = v25;
        id v27 = v9;
        dispatch_async(v24, block);

        objc_destroyWeak(&v38);
        objc_destroyWeak(location);
      }
      else
      {
        v12 = +[SSLogConfig sharediTunesStoreConfig];
        if (!v12)
        {
          v12 = +[SSLogConfig sharedConfig];
        }
        unsigned int v19 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          v19 |= 2u;
        }
        v20 = [v12 OSLogObject];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          v19 &= 2u;
        }
        if (v19)
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = (id)objc_opt_class();
          id v21 = *(id *)((char *)location + 4);
          LODWORD(v29) = 12;
          v22 = (void *)_os_log_send_and_compose_impl();

          if (v22)
          {
            v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, location, v29);
            free(v22);
            SSFileLog();
          }
        }
        else
        {
        }
      }

      goto LABEL_30;
    }
    v7 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      v15 |= 2u;
    }
    v16 = [v7 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v17 = *(id *)((char *)location + 4);
      LODWORD(v29) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_17:
        BOOL v8 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, location, v29);
      free(v18);
      SSFileLog();
    }

    goto LABEL_17;
  }
  BOOL v8 = 0;
LABEL_31:

  return v8;
}

- (id)_pastisCertificateURL
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  v3 = +[SSURLBag URLBagForContext:v2];
  id v4 = [v3 valueForKey:@"fps-cert" error:0];
  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_pastisKeyServerURL
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  v3 = +[SSURLBag URLBagForContext:v2];
  id v4 = [v3 valueForKey:@"fps-request" error:0];
  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_persistKeys
{
  v3 = [(DownloadAssetFairPlayStreamingKeyLoader *)self _track];
  id v4 = +[ML3MusicLibrary sharedLibrary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100094EFC;
  v6[3] = &unk_1003A50B0;
  id v7 = v3;
  BOOL v8 = self;
  id v5 = v3;
  [v4 performDatabaseTransactionWithBlock:v6];
}

- (void)_persistURI:(id)a3 persistentContentKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  persistenceQueue = self->_persistenceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000956A8;
  block[3] = &unk_1003A4298;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(persistenceQueue, block);
}

- (id)_track
{
  v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreItemID equalToInt64:self->_storeItemIdentifier];
  id v4 = +[ML3MusicLibrary sharedLibrary];
  id v5 = +[ML3Track anyInLibrary:v4 predicate:v3];

  if (!v5)
  {
    id v6 = [(DownloadAssetFairPlayStreamingKeyLoader *)self libraryItem];
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v11 = objc_opt_class();
      id v12 = v11;
      [v6 itemMediaPath];
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 22;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13) {
        goto LABEL_13;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v21, v19);
      free(v13);
      SSFileLog();
    }

LABEL_13:
    unsigned __int8 v14 = +[IPodLibrary deviceIPodLibrary];
    uint64_t v20 = 0;
    id v15 = [v14 addLibraryItem:v6 error:&v20];

    if (v15)
    {
      id v16 = objc_alloc((Class)ML3Track);
      id v17 = +[ML3MusicLibrary sharedLibrary];
      id v5 = [v16 initWithPersistentID:v15 inLibrary:v17];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (DownloadAssetFairPlayStreamingKeyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DownloadAssetFairPlayStreamingKeyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (IPodLibraryItem)libraryItem
{
  return self->_libraryItem;
}

- (int64_t)rentalIdentifier
{
  return self->_rentalIdentifier;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutableCachedKeys, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);

  objc_storeStrong((id *)&self->_resourceLoaderQueue, 0);
}

@end