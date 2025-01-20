@interface FMDOperationQueue
- (Action)headAction;
- (BOOL)addRequest:(id)a3;
- (BOOL)cancelRequest:(id)a3;
- (BOOL)isPaused;
- (BOOL)replacedExsitingAction:(id)a3;
- (BOOL)shouldAddAction:(id)a3;
- (FMDOperationQueue)initWithIdentifier:(id)a3;
- (NSMutableArray)requests;
- (NSOperationQueue)requestsOperationQueue;
- (NSString)identifier;
- (id)description;
- (id)wrapAction:(id)a3;
- (unint64_t)queueCount;
- (void)processRequests;
- (void)setHeadAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setQueueCount:(unint64_t)a3;
- (void)setRequests:(id)a3;
- (void)setRequestsOperationQueue:(id)a3;
@end

@implementation FMDOperationQueue

- (FMDOperationQueue)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDOperationQueue;
  v5 = [(FMDOperationQueue *)&v10 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSOperationQueue);
    [(FMDOperationQueue *)v5 setRequestsOperationQueue:v6];

    v7 = [(FMDOperationQueue *)v5 requestsOperationQueue];
    [v7 setMaxConcurrentOperationCount:1];

    v8 = +[NSMutableArray array];
    [(FMDOperationQueue *)v5 setRequests:v8];

    [(FMDOperationQueue *)v5 setIdentifier:v4];
    [(FMDOperationQueue *)v5 setQueueCount:0];
    [(FMDOperationQueue *)v5 setIsPaused:0];
  }

  return v5;
}

- (BOOL)addRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [(FMDOperationQueue *)self requestsOperationQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009F064;
    v7[3] = &unk_1002D9238;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v5 addOperationWithBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

- (BOOL)cancelRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = sub_1000596B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ action to be removed - %@", buf, 0x16u);
    }

    id v6 = [(FMDOperationQueue *)self requestsOperationQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009F3D0;
    v8[3] = &unk_1002D9238;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v6 addOperationWithBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

- (void)processRequests
{
  if ([(FMDOperationQueue *)self isPaused])
  {
    v3 = sub_1000596B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      id v4 = "%@ queue paused";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    }
  }
  else
  {
    v5 = [(FMDOperationQueue *)self requests];
    id v6 = [v5 count];

    if (v6)
    {
      if ((id)[(FMDOperationQueue *)self queueCount] == (id)1)
      {
        v3 = sub_1000596B0();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v7 = [(FMDOperationQueue *)self headAction];
          *(_DWORD *)buf = 138412546;
          v21 = self;
          __int16 v22 = 2112;
          v23 = v7;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Queue BUSY with %@", buf, 0x16u);
        }
      }
      else
      {
        id v8 = [(FMDOperationQueue *)self requests];
        id v9 = [v8 objectAtIndex:0];
        [(FMDOperationQueue *)self setHeadAction:v9];

        id v10 = [(FMDOperationQueue *)self headAction];
        uint64_t v11 = objc_opt_class();
        v12 = [(FMDOperationQueue *)self headAction];
        v3 = +[NSString stringWithFormat:@"%@-%p", v11, v12];

        v13 = sub_1000596B0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = self;
          __int16 v22 = 2112;
          v23 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ HEAD ACTION - %@", buf, 0x16u);
        }

        __int16 v14 = [(FMDOperationQueue *)self headAction];

        if (v14)
        {
          id v15 = [(FMDOperationQueue *)self requests];
          [v15 removeObjectAtIndex:0];
        }
        v16 = [(FMDOperationQueue *)self headAction];
        v17 = [(FMDOperationQueue *)self wrapAction:v16];

        v18 = +[ActionManager sharedManager];
        id v19 = [v18 enqueueAction:v17];

        [(FMDOperationQueue *)self setQueueCount:(char *)[(FMDOperationQueue *)self queueCount] + 1];
      }
    }
    else
    {
      [(FMDOperationQueue *)self setHeadAction:0];
      v3 = sub_1000596B0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = self;
        id v4 = "%@ no actions found";
        goto LABEL_10;
      }
    }
  }
}

- (id)wrapAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [FMDActionDecorator alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009F9A0;
  v8[3] = &unk_1002D93C8;
  objc_copyWeak(&v9, &location);
  id v6 = [(FMDActionDecorator *)v5 initWithAction:v4 usingCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)shouldAddAction:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(FMDOperationQueue *)self requests];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) shouldCancelAction:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)replacedExsitingAction:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = [(FMDOperationQueue *)self requests];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009FDD0;
  v10[3] = &unk_1002DC928;
  id v6 = v4;
  id v11 = v6;
  long long v12 = &v18;
  long long v13 = &v14;
  [v5 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v15 + 24))
  {
    id v7 = [(FMDOperationQueue *)self requests];
    [v7 replaceObjectAtIndex:v19[3] withObject:v6];

    BOOL v8 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(FMDOperationQueue *)self identifier];
  v5 = [(FMDOperationQueue *)self headAction];
  id v6 = +[NSString stringWithFormat:@"%@-%p-%@-%@", v3, self, v4, v5];

  return v6;
}

- (NSMutableArray)requests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequests:(id)a3
{
}

- (Action)headAction
{
  return self->_headAction;
}

- (void)setHeadAction:(id)a3
{
}

- (NSOperationQueue)requestsOperationQueue
{
  return self->_requestsOperationQueue;
}

- (void)setRequestsOperationQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)queueCount
{
  return self->_queueCount;
}

- (void)setQueueCount:(unint64_t)a3
{
  self->_queueCount = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_requestsOperationQueue, 0);
  objc_storeStrong((id *)&self->_headAction, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

@end