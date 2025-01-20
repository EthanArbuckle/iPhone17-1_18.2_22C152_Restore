@interface BEURLSchemeHandler
+ (id)schemeHandlerForCacheItem:(id)a3;
- (BEProtocolCacheItem)cacheItem;
- (BEURLSchemeHandler)init;
- (NSArray)supportedSchemes;
- (NSMapTable)taskToURLHandlerMap;
- (NSMapTable)urlHandlerToTaskMap;
- (id)_taskForHandler:(id)a3;
- (os_unfair_lock_s)accessLock;
- (void)_executeBlockWithLock:(id)a3;
- (void)_removeTaskForHandler:(id)a3;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setCacheItem:(id)a3;
- (void)setTaskToURLHandlerMap:(id)a3;
- (void)setUrlHandlerToTaskMap:(id)a3;
- (void)urlHandler:(id)a3 didFailWithError:(id)a4;
- (void)urlHandler:(id)a3 didReceiveData:(id)a4;
- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4;
- (void)urlHandlerDidFinish:(id)a3;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation BEURLSchemeHandler

- (BEURLSchemeHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)BEURLSchemeHandler;
  v2 = [(BEURLSchemeHandler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    urlHandlerToTaskMap = v2->_urlHandlerToTaskMap;
    v2->_urlHandlerToTaskMap = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    taskToURLHandlerMap = v2->_taskToURLHandlerMap;
    v2->_taskToURLHandlerMap = (NSMapTable *)v5;

    v2->_accessLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)schemeHandlerForCacheItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BEURLSchemeHandler);
  [(BEURLSchemeHandler *)v4 setCacheItem:v3];

  return v4;
}

- (NSArray)supportedSchemes
{
  return +[BEURLHandler supportedSchemes];
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5 = a4;
  v6 = [BEURLHandler alloc];
  v7 = [(BEURLSchemeHandler *)self cacheItem];
  objc_super v8 = [(BEURLHandler *)v6 initWithQueueMode:1 cacheItem:v7];

  [(BEURLHandler *)v8 setDelegate:self];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2E250;
  v12[3] = &unk_3C0348;
  v12[4] = self;
  id v13 = v5;
  v14 = v8;
  v9 = v8;
  id v10 = v5;
  [(BEURLSchemeHandler *)self _executeBlockWithLock:v12];
  v11 = [v10 request];
  [(BEURLHandler *)v9 loadRequest:v11];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_2E3E8;
  v15 = sub_2E3F8;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2E400;
  v8[3] = &unk_3C1078;
  v8[4] = self;
  id v10 = &v11;
  id v7 = a4;
  id v9 = v7;
  [(BEURLSchemeHandler *)self _executeBlockWithLock:v8];
  [(id)v12[5] stopLoading];

  _Block_object_dispose(&v11, 8);
}

- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E560;
  block[3] = &unk_3C0348;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)urlHandler:(id)a3 didReceiveData:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E67C;
  block[3] = &unk_3C0348;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)urlHandlerDidFinish:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2E76C;
  v4[3] = &unk_3C04B8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)urlHandler:(id)a3 didFailWithError:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E88C;
  block[3] = &unk_3C0348;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_taskForHandler:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_2E3E8;
  id v16 = sub_2E3F8;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2EAA8;
  v8[3] = &unk_3C0320;
  uint64_t v11 = &v12;
  id v9 = self;
  id v3 = a3;
  id v10 = v3;
  [(BEURLSchemeHandler *)v9 _executeBlockWithLock:v8];
  v4 = (void *)v13[5];
  if (!v4)
  {
    id v5 = _BookEPUBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
    }

    v4 = (void *)v13[5];
  }
  id v6 = v4;

  _Block_object_dispose(&v12, 8);

  return v6;
}

- (void)_removeTaskForHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2EBA8;
  v4[3] = &unk_3C04B8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BEURLSchemeHandler *)v5 _executeBlockWithLock:v4];
}

- (void)_executeBlockWithLock:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_accessLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
}

- (NSMapTable)urlHandlerToTaskMap
{
  return self->_urlHandlerToTaskMap;
}

- (void)setUrlHandlerToTaskMap:(id)a3
{
}

- (NSMapTable)taskToURLHandlerMap
{
  return self->_taskToURLHandlerMap;
}

- (void)setTaskToURLHandlerMap:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToURLHandlerMap, 0);
  objc_storeStrong((id *)&self->_urlHandlerToTaskMap, 0);

  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end