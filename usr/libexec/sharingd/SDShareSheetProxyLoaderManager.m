@interface SDShareSheetProxyLoaderManager
- (NSMutableArray)loaders;
- (NSString)sessionIdentifier;
- (OS_dispatch_queue)loadingQueue;
- (OS_dispatch_queue)publishingQueue;
- (SDShareSheetProxyLoaderManager)initWithSessionIdentifier:(id)a3;
- (SDShareSheetProxyLoaderManagerDelegate)delegate;
- (id)_existingLoaderForSectionType:(int64_t)a3;
- (void)_didFinishLoadingLoader:(id)a3 cancelled:(BOOL)a4;
- (void)_scheduleLoadingBlock:(id)a3 synchronously:(BOOL)a4;
- (void)loadProxySection:(id)a3;
- (void)proxyLoader:(id)a3 didLoadProxiesWithResult:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLoaders:(id)a3;
- (void)setLoadingQueue:(id)a3;
- (void)setPublishingQueue:(id)a3;
@end

@implementation SDShareSheetProxyLoaderManager

- (SDShareSheetProxyLoaderManager)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SDShareSheetProxyLoaderManager;
  v5 = [(SDShareSheetProxyLoaderManager *)&v17 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = v6;

    uint64_t v8 = +[NSMutableArray array];
    loaders = v5->_loaders;
    v5->_loaders = (NSMutableArray *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.sharingd.sharesheet.proxyLoaderManager.loadingQueue", v10);
    loadingQueue = v5->_loadingQueue;
    v5->_loadingQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.sharingd.sharesheet.proxyLoaderManager.publishingQueue", v13);
    publishingQueue = v5->_publishingQueue;
    v5->_publishingQueue = (OS_dispatch_queue *)v14;
  }
  return v5;
}

- (void)loadProxySection:(id)a3
{
  id v4 = a3;
  v5 = -[SDShareSheetProxyLoaderManager _existingLoaderForSectionType:](self, "_existingLoaderForSectionType:", [v4 type]);
  if (v5)
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cancelling existing loader with same type:%@", buf, 0xCu);
    }

    [v5 cancel];
  }
  v7 = [[SDShareSheetProxyLoader alloc] initWithProxySection:v4];
  [(SDShareSheetProxyLoader *)v7 setDelegate:self];
  uint64_t v8 = [(SDShareSheetProxyLoaderManager *)self loaders];
  [v8 addObject:v7];

  id v9 = [v4 initialBatchSize];
  v10 = +[SDStatusMonitor sharedMonitor];
  unsigned int v11 = [v10 asynchronousProxyLoadingEnabled];

  v12 = share_sheet_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v18 = v9;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "new proxy loader with initial batch size:%ld %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017F870;
  v14[3] = &unk_1008CBF30;
  v15 = v7;
  id v16 = v9;
  v13 = v7;
  [(SDShareSheetProxyLoaderManager *)self _scheduleLoadingBlock:v14 synchronously:(v9 != 0) & ~v11];
}

- (id)_existingLoaderForSectionType:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SDShareSheetProxyLoaderManager *)self loaders];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 proxySection];
        id v11 = [v10 type];

        if (v11 == (id)a3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_scheduleLoadingBlock:(id)a3 synchronously:(BOOL)a4
{
  loadingQueue = self->_loadingQueue;
  if (a4) {
    dispatch_sync(loadingQueue, a3);
  }
  else {
    dispatch_async(loadingQueue, a3);
  }
}

- (void)_didFinishLoadingLoader:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromBOOL();
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "did finish loading all proxies from loader:%@ cancelled:%@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [(SDShareSheetProxyLoaderManager *)self loaders];
  id v10 = [v9 indexOfObject:v6];

  id v11 = share_sheet_log();
  id v12 = v11;
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10017FF20((uint64_t)v6, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "remove proxy loader%@", (uint8_t *)&v15, 0xCu);
    }

    v13 = [(SDShareSheetProxyLoaderManager *)self loaders];
    [v13 removeObject:v6];

    id v12 = [(SDShareSheetProxyLoaderManager *)self delegate];
    long long v14 = [v6 proxySection];
    [v12 proxyLoaderManagerDidFinishLoadingProxySection:v14 cancelled:v4];
  }
}

- (void)proxyLoader:(id)a3 didLoadProxiesWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  publishingQueue = self->_publishingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017FC70;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(publishingQueue, block);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SDShareSheetProxyLoaderManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDShareSheetProxyLoaderManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)loaders
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoaders:(id)a3
{
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)setLoadingQueue:(id)a3
{
}

- (OS_dispatch_queue)publishingQueue
{
  return self->_publishingQueue;
}

- (void)setPublishingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_loaders, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end