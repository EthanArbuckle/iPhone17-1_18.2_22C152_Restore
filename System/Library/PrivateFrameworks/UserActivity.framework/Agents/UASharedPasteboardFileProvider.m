@interface UASharedPasteboardFileProvider
- (BOOL)locked;
- (NSMutableDictionary)providerRequests;
- (NSOperationQueue)_providedItemsOperationQueue;
- (NSURL)_providedItemsURL;
- (UASharedPasteboardFileProvider)initWithURL:(id)a3;
- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5;
- (void)setLocked:(BOOL)a3;
- (void)setProviderRequests:(id)a3;
- (void)unlockWithError:(id)a3;
@end

@implementation UASharedPasteboardFileProvider

- (UASharedPasteboardFileProvider)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UASharedPasteboardFileProvider;
  v6 = [(UASharedPasteboardFileProvider *)&v11 init];
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    providedItemsOperationQueue = v6->_providedItemsOperationQueue;
    v6->_providedItemsOperationQueue = v7;

    objc_storeStrong((id *)&v6->_providedItemsURL, a3);
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(UASharedPasteboardFileProvider *)v6 setProviderRequests:v9];

    [(UASharedPasteboardFileProvider *)v6 setLocked:1];
  }

  return v6;
}

- (void)unlockWithError:(id)a3
{
  id v4 = a3;
  [(UASharedPasteboardFileProvider *)self setLocked:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(UASharedPasteboardFileProvider *)self providerRequests];
  v6 = [v5 allKeys];

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        v13 = [(UASharedPasteboardFileProvider *)self providerRequests];
        v14 = [v13 objectForKeyedSubscript:v12];

        if (v14)
        {
          v15 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Unlocking reader %@", buf, 0xCu);
          }

          ((void (**)(void, id))v14)[2](v14, v4);
        }

        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "providing item to reader %@", (uint8_t *)&v13, 0xCu);
  }

  if ([(UASharedPasteboardFileProvider *)self locked])
  {
    uint64_t v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Currently locked, saving callback for when unlocked", (uint8_t *)&v13, 2u);
    }

    id v11 = objc_retainBlock(v8);
    uint64_t v12 = [(UASharedPasteboardFileProvider *)self providerRequests];
    [v12 setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "_provideItemAtURL called without readerID, creating UUID to act as readerID", v10, 2u);
  }

  id v9 = +[NSUUID UUID];
  [(UASharedPasteboardFileProvider *)self _provideItemAtURL:v7 toReaderWithID:v9 completionHandler:v6];
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)_providedItemsURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)providerRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProviderRequests:(id)a3
{
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerRequests, 0);
  objc_storeStrong((id *)&self->_providedItemsURL, 0);

  objc_storeStrong((id *)&self->_providedItemsOperationQueue, 0);
}

@end