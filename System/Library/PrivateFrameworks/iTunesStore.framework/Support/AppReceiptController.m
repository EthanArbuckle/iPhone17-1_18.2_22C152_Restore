@interface AppReceiptController
+ (BOOL)connectionHasEntitlement:(id)a3;
+ (id)sharedController;
+ (void)getApplicationReceiptPathWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)refreshAllReceipts:(id)a3 connection:(id)a4;
+ (void)refreshAppReceipt:(id)a3 connection:(id)a4;
- (AppReceiptController)init;
- (id)_operationQueue;
- (void)_addOperation:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)dealloc;
@end

@implementation AppReceiptController

- (AppReceiptController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppReceiptController;
  v2 = [(AppReceiptController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.AppReceiptController", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_operationQueue)
  {
    dispatch_queue_t v3 = +[Daemon daemon];
    [v3 removeKeepAliveOperationQueue:self->_operationQueue];

    [(ISOperationQueue *)self->_operationQueue cancelAllOperations];
  }
  v4.receiver = self;
  v4.super_class = (Class)AppReceiptController;
  [(AppReceiptController *)&v4 dealloc];
}

+ (BOOL)connectionHasEntitlement:(id)a3
{
  id v3 = a3;
  char HasEntitlement = SSXPCConnectionHasEntitlement();
  if ((HasEntitlement & 1) == 0)
  {
    v5 = (void *)SSXPCConnectionCopyClientIdentifier();
    objc_super v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      objc_super v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)v14 = 138412546;
      *(void *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v5;
      id v10 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16]);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return HasEntitlement;
}

+ (void)getApplicationReceiptPathWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015A408;
  v10[3] = &unk_1003A3268;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"getApplicationReceiptPathWithMessage:connection:" forMessage:700];
  [v4 addObserver:a1 selector:"refreshAllReceipts:connection:" forMessage:117];
  [v4 addObserver:a1 selector:"refreshAppReceipt:connection:" forMessage:10011];
}

+ (void)refreshAllReceipts:(id)a3 connection:(id)a4
{
  id v4 = a4;
  unsigned int v5 = [(id)objc_opt_class() connectionHasEntitlement:v4];

  if (v5)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v13) = 138412290;
      *(void *)((char *)&v13 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v13 + 4);
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        return;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v13, v12, v13);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
}

+ (void)refreshAppReceipt:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (xpc_dictionary_get_BOOL(v5, "3")) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  if (xpc_dictionary_get_BOOL(v5, "2")) {
    uint64_t v8 = v7 | 2;
  }
  else {
    uint64_t v8 = v7;
  }
  BOOL v9 = xpc_dictionary_get_BOOL(v5, "1");
  if ((SSXPCConnectionHasEntitlement() & 1) != 0 || SSXPCConnectionHasEntitlement())
  {
    id v10 = objc_alloc((Class)sub_100174E00());
    id v11 = xpc_dictionary_get_value(v5, "4");
    id v12 = [v10 initWithXPCEncoding:v11];

    if (v12)
    {
      uint64_t v13 = [v12 storeExternalVersion];
      if (v13
        && (v14 = (void *)v13,
            [v12 storeItemIdentifier],
            v15 = objc_claimAutoreleasedReturnValue(),
            v15,
            v14,
            v15))
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = v8 | v9 | 4;
      }
      v18 = [[XPCClient alloc] initWithInputConnection:v6];
      v24 = [(XPCClient *)v18 clientIdentifier];
      v25 = +[AppReceiptController sharedController];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10015AB88;
      v29[3] = &unk_1003A7F40;
      id v30 = v12;
      id v31 = v24;
      uint64_t v35 = v16;
      id v32 = v5;
      id v33 = v6;
      id v34 = v25;
      id v26 = v25;
      id v27 = v24;
      id v17 = v12;
      [v26 _dispatchAsync:v29];

      goto LABEL_27;
    }
  }
  id v17 = (id)SSXPCConnectionCopyClientIdentifier();
  if ([v17 length])
  {
    v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [(XPCClient *)v18 shouldLog];
    if ([(XPCClient *)v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [(XPCClient *)v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      v20 &= 2u;
    }
    if (v20)
    {
      int v36 = 138412546;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v17;
      id v22 = v37;
      LODWORD(v28) = 22;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_27:

        goto LABEL_28;
      }
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v36, v28);
      free(v23);
      SSFileLog();
    }

    goto LABEL_27;
  }
LABEL_28:
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AD74;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401F20 != -1) {
    dispatch_once(&qword_100401F20, block);
  }
  v2 = (void *)qword_100401F18;

  return v2;
}

- (void)_addOperation:(id)a3
{
  id v4 = a3;
  objc_setAssociatedObject(v4, "com.apple.itunesstore.AppReceiptController.self", self, (void *)0x301);
  id v5 = [(AppReceiptController *)self _operationQueue];
  [v5 addOperation:v4];
}

- (void)_dispatchAsync:(id)a3
{
  id v4 = a3;
  id v5 = +[Daemon daemon];
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.ReceiptRevocation"];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AEF0;
  block[3] = &unk_1003A31C8;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(ISOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    id v6 = +[Daemon daemon];
    [v6 addKeepAliveOperationQueue:self->_operationQueue];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end