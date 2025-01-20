@interface StorePreorderQueue
+ (id)sharedPreorderQueue;
+ (void)cancelPreordersWithMessage:(id)a3 connection:(id)a4;
+ (void)checkQueueWithMessage:(id)a3 connection:(id)a4;
+ (void)getPreordersWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)registerManagerWithMessage:(id)a3 connection:(id)a4;
- (StorePreorderQueue)init;
- (id)_clientForConnection:(id)a3;
- (id)_copyPreorderAccountIdentifiers;
- (id)_preorderQueryWithAccountID:(id)a3 database:(id)a4;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_handleCheckQueueFinish:(id)a3;
- (void)_handleLoadQueueFinish:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_sendChangeNotificationForKinds:(id)a3;
- (void)addPreordersWithItems:(id)a3 accountID:(id)a4;
- (void)checkPreorderQueue;
- (void)dealloc;
- (void)removePreordersWithPreorderIdentifiers:(id)a3;
@end

@implementation StorePreorderQueue

- (StorePreorderQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)StorePreorderQueue;
  v2 = [(StorePreorderQueue *)&v5 init];
  if (v2)
  {
    v2->_clients = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.StorePreorderQueue", 0);
    v3 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    v2->_operationQueue = v3;
    [(ISOperationQueue *)v3 setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", v2->_operationQueue);
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "removeKeepAliveOperationQueue:", self->_operationQueue);
  [(ISOperationQueue *)self->_operationQueue cancelAllOperations];

  v3.receiver = self;
  v3.super_class = (Class)StorePreorderQueue;
  [(StorePreorderQueue *)&v3 dealloc];
}

+ (id)sharedPreorderQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F799C;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401DC0 != -1) {
    dispatch_once(&qword_100401DC0, block);
  }
  return (id)qword_100401DB8;
}

- (void)addPreordersWithItems:(id)a3 accountID:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F7A5C;
  v4[3] = &unk_1003A6550;
  v4[4] = a3;
  v4[5] = a4;
  v4[6] = self;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v4);
}

- (void)checkPreorderQueue
{
  if (!objc_msgSend(-[ISOperationQueue operations](self->_operationQueue, "operations"), "count"))
  {
    id v3 = [(StorePreorderQueue *)self _copyPreorderAccountIdentifiers];
    id v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v24 = 138412546;
      uint64_t v25 = objc_opt_class();
      __int16 v26 = 2048;
      id v27 = [v3 count];
      LODWORD(v17) = 22;
      v16 = &v24;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v24, v17);
        free(v8);
        v16 = (int *)v9;
        SSFileLog();
      }
    }
    if (objc_msgSend(v3, "count", v16))
    {
      v10 = objc_alloc_init(CancelPreordersOperation);
      [(ISOperationQueue *)self->_operationQueue addOperation:v10];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v3);
            }
            v15 = [[CheckPreorderQueueOperation alloc] initWithAccountIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000F8054;
            v18[3] = &unk_1003A3380;
            v18[4] = self;
            v18[5] = v15;
            [(CheckPreorderQueueOperation *)v15 setCompletionBlock:v18];
            [(ISOperationQueue *)self->_operationQueue addOperation:v15];
          }
          id v12 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)removePreordersWithPreorderIdentifiers:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F81F0;
  v8[3] = &unk_1003A65A0;
  v8[4] = a3;
  v8[5] = v5;
  v8[6] = &v9;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v8);
  if (*((unsigned char *)v10 + 24) && [v5 count])
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F8454;
    block[3] = &unk_1003A3380;
    block[4] = self;
    void block[5] = v5;
    dispatch_async(dispatchQueue, block);
  }

  _Block_object_dispose(&v9, 8);
}

+ (void)cancelPreordersWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F84F0;
  v4[3] = &unk_1003A65F0;
  v4[5] = a3;
  objc_msgSend(+[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)checkQueueWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F8B80;
  v4[3] = &unk_1003A6618;
  objc_msgSend(+[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"), "_handleMessage:connection:usingBlock:", a3, a4, v4);
}

+ (void)getPreordersWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F8D98;
  v4[3] = &unk_1003A6640;
  objc_msgSend(+[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"cancelPreordersWithMessage:connection:" forMessage:35];
  [a3 addObserver:a1 selector:"checkQueueWithMessage:connection:" forMessage:36];
  [a3 addObserver:a1 selector:"getPreordersWithMessage:connection:" forMessage:34];

  [a3 addObserver:a1 selector:"registerManagerWithMessage:connection:" forMessage:33];
}

+ (void)registerManagerWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F92AC;
  v4[3] = &unk_1003A6668;
  v4[5] = a3;
  objc_msgSend(+[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"), "_handleMessage:connection:usingBlock:", a3, a4, v4);
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F9690;
  v4[3] = &unk_1003A3380;
  void v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForConnection:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  clients = self->_clients;
  id v6 = [(NSMutableArray *)clients countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(clients);
      }
      v10 = *(PreorderQueueClient **)(*((void *)&v16 + 1) + 8 * v9);
      id v11 = [(XPCClient *)v10 copyInputConnection];
      id v12 = v11;
      if (v11) {
        xpc_release(v11);
      }
      if (v12 == a3 && v10 != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)clients countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v10 = [(XPCClient *)[PreorderQueueClient alloc] initWithInputConnection:a3];
    [(NSMutableArray *)self->_clients addObject:v10];
    v14 = v10;
  }
  return v10;
}

- (id)_copyPreorderAccountIdentifiers
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F9A50;
  v5[3] = &unk_1003A6690;
  v5[4] = v2;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v5);
  id v3 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if (v3) {
    objc_msgSend(v2, "addObject:", objc_msgSend(v3, "uniqueIdentifier"));
  }
  return v2;
}

- (void)_handleCheckQueueFinish:(id)a3
{
  if ([a3 success])
  {
    id v5 = [a3 accountIdentifier];
    id v6 = [a3 numberOfPreordersInQueue];
    if (v6)
    {
      id v7 = v6;
      *(void *)long long v20 = 0;
      *(void *)&v20[8] = v20;
      *(void *)&v20[16] = 0x2020000000;
      char v21 = 0;
      if (objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "accountWithUniqueIdentifier:", v5), "isAuthenticated"))
      {
        *(unsigned char *)(*(void *)&v20[8] + 24) = 1;
      }
      else
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000F9F28;
        v18[3] = &unk_1003A66B8;
        v18[4] = self;
        v18[5] = v5;
        void v18[6] = v20;
        v18[7] = v7;
        objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v18);
        if (!*(unsigned char *)(*(void *)&v20[8] + 24))
        {
LABEL_18:
          _Block_object_dispose(v20, 8);
          return;
        }
      }
      v14 = [[LoadPreorderQueueOperation alloc] initWithAccountIdentifier:v5];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000F9F84;
      v17[3] = &unk_1003A3380;
      v17[4] = self;
      v17[5] = v14;
      [(LoadPreorderQueueOperation *)v14 setCompletionBlock:v17];
      [(ISOperationQueue *)self->_operationQueue addOperation:v14];

      goto LABEL_18;
    }
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)long long v20 = 138412546;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v5;
      LODWORD(v16) = 22;
      v15 = (NSString *)v20;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        id v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v20, v16);
        free(v12);
        v15 = v13;
        SSFileLog();
      }
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000F9EE8;
    v19[3] = &unk_1003A3F68;
    v19[4] = self;
    v19[5] = v5;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v15), "modifyUsingTransactionBlock:", v19);
  }
}

- (void)_handleLoadQueueFinish:(id)a3
{
  if ([a3 success])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000FA05C;
    v5[3] = &unk_1003A3F68;
    v5[4] = a3;
    void v5[5] = self;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v5);
  }
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FA8D0;
  v10[3] = &unk_1003A66E0;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a3;
  v10[7] = a5;
  dispatch_async(dispatchQueue, v10);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FA9D4;
  v10[3] = &unk_1003A6708;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_async(dispatchQueue, v10);
}

- (id)_preorderQueryWithAccountID:(id)a3 database:(id)a4
{
  id v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"store_account_id" equalToValue:a3];

  return +[PreorderEntity queryWithDatabase:a4 predicate:v5];
}

- (void)_sendChangeNotificationForKinds:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  clients = self->_clients;
  id v5 = [(NSMutableArray *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(clients);
        }
        unsigned int v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "itemKinds"), "intersectsSet:", a3)) {
          [v9 sendCoalescedMessageWithIdentifier:1007];
        }
      }
      id v6 = [(NSMutableArray *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

@end