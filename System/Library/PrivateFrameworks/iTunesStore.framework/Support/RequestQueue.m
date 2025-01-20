@interface RequestQueue
- (ISOperationQueue)operationQueue;
- (RequestQueue)init;
- (id)operationForConnection:(id)a3;
- (void)_cancelRequest:(id)a3 connection:(id)a4;
- (void)_disconnectRequest:(id)a3 connection:(id)a4;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)cancelOperationForConnection:(id)a3;
- (void)dealloc;
- (void)disconnectOperationForConnection:(id)a3;
- (void)observeXPCServer:(id)a3;
- (void)setClient:(id)a3 forOperation:(id)a4;
- (void)setOperationQueue:(id)a3;
@end

@implementation RequestQueue

- (RequestQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)RequestQueue;
  v2 = [(RequestQueue *)&v5 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.itunesstored.%@.%p", objc_opt_class(), v2];
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)RequestQueue;
  [(RequestQueue *)&v4 dealloc];
}

- (void)addOperation:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000650E8;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  objc_setAssociatedObject(a3, "com.apple.itunesstored.RequestQueue.client", a4, (void *)0x301);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000651E4;
  v8[3] = &unk_1003A4AE8;
  v8[4] = a3;
  v8[5] = a5;
  [a3 setCompletionBlock:v8];
  [(RequestQueue *)self addOperation:a3];
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  xpc_retain(a5);
  xpc_retain(a4);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006537C;
  v12[3] = &unk_1003A4B10;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  [a3 setCompletionBlock:v12];
  v11 = [[XPCClient alloc] initWithInputConnection:a5];
  objc_setAssociatedObject(a3, "com.apple.itunesstored.RequestQueue.client", v11, (void *)0x301);
  [(RequestQueue *)self addOperation:a3];
}

- (void)cancelOperationForConnection:(id)a3
{
  id v3 = [(RequestQueue *)self operationForConnection:a3];
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2112;
      v14 = v4;
      LODWORD(v10) = 22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v11, v10);
        free(v9);
        SSFileLog();
      }
    }
    objc_setAssociatedObject(v4, "com.apple.itunesstored.RequestQueue.client", 0, (void *)0x301);
    [v4 cancel];
  }
}

- (void)disconnectOperationForConnection:(id)a3
{
  id v3 = [(RequestQueue *)self operationForConnection:a3];
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2112;
      v14 = v4;
      LODWORD(v10) = 22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v11, v10);
        free(v9);
        SSFileLog();
      }
    }
    objc_setAssociatedObject(v4, "com.apple.itunesstored.RequestQueue.client", 0, (void *)0x301);
  }
}

- (void)observeXPCServer:(id)a3
{
  [a3 addObserver:self selector:"_cancelRequest:connection:" forMessage:63];

  [a3 addObserver:self selector:"_disconnectRequest:connection:" forMessage:64];
}

- (id)operationForConnection:(id)a3
{
  objc_super v4 = [(RequestQueue *)self operationQueue];
  if (!v4) {
    objc_super v4 = (ISOperationQueue *)+[ISOperationQueue mainQueue];
  }
  id v5 = [(ISOperationQueue *)v4 operations];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id AssociatedObject = objc_getAssociatedObject(v10, "com.apple.itunesstored.RequestQueue.client");
        if (AssociatedObject)
        {
          id v12 = [AssociatedObject copyInputConnection];
          if (v12 == a3)
          {
            xpc_release(a3);
            return v10;
          }
          xpc_release(v12);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (ISOperationQueue)operationQueue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1000659C4;
  uint64_t v10 = sub_1000659D4;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000659E0;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (ISOperationQueue *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClient:(id)a3 forOperation:(id)a4
{
}

- (void)setOperationQueue:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065AA0;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)_cancelRequest:(id)a3 connection:(id)a4
{
}

- (void)_disconnectRequest:(id)a3 connection:(id)a4
{
}

@end