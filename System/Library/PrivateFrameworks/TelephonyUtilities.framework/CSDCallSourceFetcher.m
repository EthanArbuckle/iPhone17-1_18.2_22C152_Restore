@interface CSDCallSourceFetcher
- (CSDCallSourceFetcher)init;
- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3;
- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3 timeout:(double)a4;
- (CSDCallSourceFetcherDataSource)dataSource;
- (NSMutableDictionary)pendingCompletions;
- (OS_dispatch_queue)serialQueue;
- (double)timeout;
- (void)_waitForCallSourceWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchCallSourceForIdentifier:(id)a3 completion:(id)a4;
- (void)handleCallSourcesChanged;
- (void)setDataSource:(id)a3;
- (void)setPendingCompletions:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation CSDCallSourceFetcher

- (CSDCallSourceFetcher)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDCallSourceFetcher.m", 27, @"%s is not available. Use another initializer instead.", "-[CSDCallSourceFetcher init]");

  return 0;
}

- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3
{
  return [(CSDCallSourceFetcher *)self initWithSerialQueue:a3 timeout:10.0];
}

- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDCallSourceFetcher;
  v8 = [(CSDCallSourceFetcher *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serialQueue, a3);
    v9->_timeout = a4;
    uint64_t v10 = +[NSMutableDictionary dictionary];
    pendingCompletions = v9->_pendingCompletions;
    v9->_pendingCompletions = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)fetchCallSourceForIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  id v7 = [(CSDCallSourceFetcher *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(CSDCallSourceFetcher *)self dataSource];
  v9 = [v8 callSourceWithIdentifier:v10];

  if (v9) {
    v6[2](v6, v9);
  }
  else {
    [(CSDCallSourceFetcher *)self _waitForCallSourceWithIdentifier:v10 completion:v6];
  }
}

- (void)handleCallSourcesChanged
{
  v2 = self;
  v3 = [(CSDCallSourceFetcher *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [(CSDCallSourceFetcher *)v2 pendingCompletions];
  v5 = [v4 allKeys];

  id obj = v5;
  id v23 = [v5 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    v21 = v2;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v8 = [(CSDCallSourceFetcher *)v2 dataSource];
        v9 = [v8 callSourceWithIdentifier:v7];

        if (v9)
        {
          v24 = i;
          id v10 = [(CSDCallSourceFetcher *)v2 pendingCompletions];
          v11 = [v10 objectForKeyedSubscript:v7];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v26;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v26 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
                v18 = sub_100008DCC();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v34 = v7;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling fetch completion block for call source with identifier %@", buf, 0xCu);
                }

                (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v9);
              }
              id v14 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
            }
            while (v14);
          }

          v2 = v21;
          v19 = [(CSDCallSourceFetcher *)v21 pendingCompletions];
          [v19 setObject:0 forKeyedSubscript:v7];

          i = v24;
        }
      }
      id v23 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v23);
  }
}

- (void)_waitForCallSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDCallSourceFetcher *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Waiting for call source with identifier %@", buf, 0xCu);
  }

  id v10 = [(CSDCallSourceFetcher *)self pendingCompletions];
  v11 = [v10 objectForKeyedSubscript:v6];

  if (!v11)
  {
    v11 = +[NSMutableSet set];
    id v12 = [(CSDCallSourceFetcher *)self pendingCompletions];
    [v12 setObject:v11 forKeyedSubscript:v6];
  }
  id v13 = [v7 copy];
  id v14 = objc_retainBlock(v13);
  [v11 addObject:v14];

  [(CSDCallSourceFetcher *)self timeout];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  uint64_t v17 = [(CSDCallSourceFetcher *)self serialQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AB014;
  v21[3] = &unk_100506A80;
  v21[4] = self;
  id v22 = v6;
  id v23 = v13;
  id v24 = v7;
  id v18 = v7;
  id v19 = v13;
  id v20 = v6;
  dispatch_after(v16, v17, v21);
}

- (CSDCallSourceFetcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CSDCallSourceFetcherDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableDictionary)pendingCompletions
{
  return self->_pendingCompletions;
}

- (void)setPendingCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end