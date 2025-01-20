@interface StoreKitClient
- (BOOL)_isPaymentRestricted;
- (BOOL)addPaymentTransaction:(id)a3 withOptions:(id)a4;
- (BOOL)buyMicroPaymentOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4;
- (BOOL)finishPaymentWithMessage:(id)a3;
- (BOOL)isEqualToXPCConnection:(id)a3 paymentQueueClient:(id)a4;
- (BOOL)isSandboxed;
- (BOOL)removePaymentWithObjectID:(id)a3;
- (NSArray)openTransactions;
- (NSManagedObjectID)firstReadyPaymentID;
- (NSManagedObjectID)microPaymentClientID;
- (NSString)clientIdentifier;
- (StoreKitClient)initWithMicroPaymentClientID:(id)a3;
- (StoreKitClient)initWithXPCClient:(id)a3;
- (XPCClient)XPCClient;
- (id)_clientIdentifier;
- (id)_clientIdentity;
- (id)_copyAccountIDsForRefreshReason:(int64_t)a3;
- (id)_copyDownloadsForDownloadIDs:(id)a3 properties:(id)a4 context:(id)a5;
- (id)_initStoreKitClient;
- (id)_lastQueueCheckDate;
- (int64_t)clientState;
- (void)_cancelDownloadsForDownloadIDs:(id)a3;
- (void)_cancelDownloadsForPayments:(id)a3;
- (void)_completeBuyRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5;
- (void)_completeFinishRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5;
- (void)_dispatchAsync:(id)a3;
- (void)_finishLoadQueueOperation:(id)a3;
- (void)_finishRestoreOperation:(id)a3;
- (void)_mergeBatchResponse:(id)a3 forRestoreOperation:(id)a4;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4;
- (void)_reloadClientProperties;
- (void)_sendBuyRequestForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendDownloadChangesets:(id)a3;
- (void)_sendFinishRequestForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendMergeResults:(id)a3;
- (void)_sendMessage:(int64_t)a3 forPayments:(id)a4;
- (void)_sendPaymentsAdded:(id)a3;
- (void)_sendPaymentsRemoved:(id)a3;
- (void)_sendPaymentsUpdated:(id)a3;
- (void)_sendRestoreCompletedWithError:(id)a3;
- (void)_setClientState:(int64_t)a3;
- (void)_showPaymentsRestrictedAlert;
- (void)_showPrivacyPromptForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)cancelDownloadsWithIDs:(id)a3;
- (void)createMicroPaymentClientIfNecessary;
- (void)dealloc;
- (void)pauseDownloadsWithIDs:(id)a3;
- (void)refreshFromServerWithReason:(int64_t)a3;
- (void)refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4;
- (void)restoreCompletedTransactionsWithApplicationUsername:(id)a3;
- (void)resumeDownloadsWithIDs:(id)a3;
- (void)sendDownloadChangesets:(id)a3;
- (void)sendPaymentsUpdatedWithObjectIDs:(id)a3;
- (void)sendPurchaseIntents:(id)a3 forApp:(id)a4;
- (void)setPaymentQueueClient:(id)a3;
- (void)setXPCClient:(id)a3;
- (void)startDownloadsWithIDs:(id)a3;
- (void)startPaymentWithObjectID:(id)a3 withCompletionBlock:(id)a4;
- (void)updatePaymentWithObjectID:(id)a3 purchaseResponse:(id)a4;
@end

@implementation StoreKitClient

- (id)_initStoreKitClient
{
  v6.receiver = self;
  v6.super_class = (Class)StoreKitClient;
  v2 = [(StoreKitClient *)&v6 init];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.itunesstored.StoreKitClient.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);

    id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.itunesstored.StoreKitClient.external.%p", v2);
    v2->_externalQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);
  }
  return v2;
}

- (StoreKitClient)initWithMicroPaymentClientID:(id)a3
{
  id v4 = [(StoreKitClient *)self _initStoreKitClient];
  if (v4) {
    v4->_databaseClientObjectID = (NSManagedObjectID *)a3;
  }
  return v4;
}

- (StoreKitClient)initWithXPCClient:(id)a3
{
  id v4 = [(StoreKitClient *)self _initStoreKitClient];
  if (v4) {
    v4->_client = (XPCClient *)a3;
  }
  return v4;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  externalQueue = self->_externalQueue;
  if (externalQueue) {
    dispatch_release(externalQueue);
  }
  [(LoadCompletedMicroPaymentsOperation *)self->_restoreOperation setCompletionBlock:0];
  [(LoadCompletedMicroPaymentsOperation *)self->_restoreOperation setPaymentBatchBlock:0];

  [(LoadMicroPaymentQueuesOperation *)self->_loadQueueOperation setCompletionBlock:0];
  v6.receiver = self;
  v6.super_class = (Class)StoreKitClient;
  [(StoreKitClient *)&v6 dealloc];
}

- (BOOL)addPaymentTransaction:(id)a3 withOptions:(id)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011ECA8;
  v7[3] = &unk_1003A6FE0;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)cancelDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011F51C;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (NSString)clientIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10011F948;
  uint64_t v10 = sub_10011F958;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011F964;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)clientState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011FA48;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)createMicroPaymentClientIfNecessary
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FAD0;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (NSManagedObjectID)firstReadyPaymentID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_10011F948;
  uint64_t v10 = sub_10011F958;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011FE10;
  v5[3] = &unk_1003A64B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (NSManagedObjectID *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEqualToXPCConnection:(id)a3 paymentQueueClient:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001200EC;
  v7[3] = &unk_1003A7008;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isSandboxed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100120418;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSManagedObjectID)microPaymentClientID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_10011F948;
  uint64_t v10 = sub_10011F958;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100120540;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSManagedObjectID *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)openTransactions
{
  char v3 = (NSArray *)+[NSMutableArray array];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100120608;
  v6[3] = &unk_1003A3380;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

- (void)pauseDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100120878;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (void)refreshFromServerWithReason:(int64_t)a3
{
}

- (void)refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100120C98;
  v4[3] = &unk_1003A6488;
  v4[5] = a4;
  v4[6] = a3;
  v4[4] = self;
  [(StoreKitClient *)self _dispatchAsync:v4];
}

- (BOOL)removePaymentWithObjectID:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120D58;
  block[3] = &unk_1003A7030;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)restoreCompletedTransactionsWithApplicationUsername:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100120E80;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (void)resumeDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10012144C;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (void)sendDownloadChangesets:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100121868;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)sendPaymentsUpdatedWithObjectIDs:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001218E8;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setPaymentQueueClient:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100121AAC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setXPCClient:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100121BD8;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)startDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100121D00;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (void)startPaymentWithObjectID:(id)a3 withCompletionBlock:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100122424;
  v4[3] = &unk_1003A7080;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  [(StoreKitClient *)self _dispatchAsync:v4];
}

- (void)updatePaymentWithObjectID:(id)a3 purchaseResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012286C;
  v4[3] = &unk_1003A3410;
  v4[4] = a3;
  v4[5] = a4;
  void v4[6] = self;
  [(StoreKitClient *)self _dispatchAsync:v4];
}

- (void)sendPurchaseIntents:(id)a3 forApp:(id)a4
{
  uint64_t v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v11), "productIdentifier"));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  v12 = [[LoadMicroPaymentProductsOperation alloc] initWithProductIdentifiers:v7];

  v13 = objc_alloc_init(StoreKitClientIdentity);
  [(StoreKitClientIdentity *)v13 setBundleIdentifier:a4];
  id v14 = +[LSApplicationProxy applicationProxyForIdentifier:a4];
  if ((objc_msgSend(objc_msgSend(v14, "appState"), "isValid") & 1) != 0
    || (id v14 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", a4), v15 = objc_msgSend(objc_msgSend(v14, "containingBundle"), "bundleType"), objc_msgSend(v15, "isEqualToString:", LSUserApplicationType)))
  {
    uint64_t v16 = (uint64_t)[v14 profileValidated];
  }
  else
  {
    uint64_t v16 = 1;
  }
  [(StoreKitClientIdentity *)v13 setSandboxed:v16];
  [(LoadMicroPaymentProductsOperation *)v12 setClientIdentity:v13];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100122B50;
  v17[3] = &unk_1003A3410;
  v17[4] = v12;
  v17[5] = self;
  v17[6] = a4;
  [(LoadMicroPaymentProductsOperation *)v12 setCompletionBlock:v17];
  [(id)sub_10004FC58() addOperation:v12];
}

- (XPCClient)XPCClient
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_10011F948;
  uint64_t v10 = sub_10011F958;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100122FCC;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (XPCClient *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)finishPaymentWithMessage:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001230B4;
  block[3] = &unk_1003A7030;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_networkTypeChangedNotification:(id)a3
{
  if ([+[ISNetworkObserver sharedInstance] networkType]&& (id)[(StoreKitClient *)self clientState] == (id)3)
  {
    [(StoreKitClient *)self refreshFromServerWithReason:1];
  }
}

- (void)_cancelDownloadsForDownloadIDs:(id)a3
{
  if ([a3 count])
  {
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
      int v13 = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2048;
      id v16 = [a3 count];
      LODWORD(v11) = 22;
      char v10 = &v13;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v13, v11);
        free(v8);
        char v10 = (int *)v9;
        SSFileLog();
      }
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100123920;
    v12[3] = &unk_1003A5F80;
    v12[4] = a3;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v10), "modifyUsingTransactionBlock:", v12);
  }
}

- (void)_cancelDownloadsForPayments:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) downloads];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) downloadID];
              if (v15) {
                [v5 addObject:v15];
              }
              uint64_t v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  [(StoreKitClient *)self _cancelDownloadsForDownloadIDs:v5];
}

- (id)_clientIdentifier
{
  id v2 = [(StoreKitClient *)self _clientIdentity];

  return [v2 bundleIdentifier];
}

- (id)_clientIdentity
{
  id result = self->_clientIdentity;
  if (!result)
  {
    [(StoreKitClient *)self _reloadClientProperties];
    return self->_clientIdentity;
  }
  return result;
}

- (id)_copyAccountIDsForRefreshReason:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  if (self->_databaseClientObjectID)
  {
    id v5 = objc_msgSend(objc_msgSend(+[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"), "objectWithID:", self->_databaseClientObjectID), "payments");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) userDSID];
          if (v10) {
            [v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    +[NSThread endManagedContextSession];
  }
  if (![v4 count])
  {
    if (objc_msgSend(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "bundleIdentifier")), "isBetaApp"))
    {
      id v11 = objc_msgSend(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeAppStoreBeta), "ams_activeiTunesAccount");
      if (v11)
      {
LABEL_19:
        id v13 = objc_msgSend(v11, "ams_DSID");
        goto LABEL_21;
      }
      id v12 = &AMSAccountMediaTypeAppStore;
    }
    else
    {
      if (!objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "isSandboxed"))
      {
        id v13 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
LABEL_21:
        if (v13) {
          [v4 addObject:v13];
        }
        return v4;
      }
      id v12 = &AMSAccountMediaTypeAppStoreSandbox;
    }
    id v11 = objc_msgSend(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", *v12), "ams_activeiTunesAccount");
    if (!v11) {
      return v4;
    }
    goto LABEL_19;
  }
  return v4;
}

- (void)_completeBuyRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100123DA4;
  v5[3] = &unk_1003A70A8;
  v5[4] = a4;
  v5[5] = a3;
  void v5[6] = self;
  v5[7] = a5;
  [(StoreKitClient *)self _dispatchAsync:v5];
}

- (void)_completeFinishRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100124254;
  v5[3] = &unk_1003A70A8;
  v5[4] = a4;
  v5[5] = a3;
  void v5[6] = self;
  v5[7] = a5;
  [(StoreKitClient *)self _dispatchAsync:v5];
}

- (id)_copyDownloadsForDownloadIDs:(id)a3 properties:(id)a4 context:(id)a5
{
  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [a5 objectWithID:self->_databaseClientObjectID];
  id v10 = +[MicroPaymentDownload downloadEntityFromContext:a5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  id v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
        id v16 = objc_alloc_init((Class)NSFetchRequest);
        [v16 setEntity:v10];
        [v16 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(downloadID=%@) AND (payment.client=%@)", v15, v9)];
        [v16 setPropertiesToFetch:a4];
        id v17 = [a5 executeFetchRequest:v16 error:0];
        if ([v17 count] == (id)1) {
          objc_msgSend(v19, "addObject:", objc_msgSend(v17, "objectAtIndex:", 0));
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  return v19;
}

- (void)_dispatchAsync:(id)a3
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.StoreKitClient");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001247AC;
  block[3] = &unk_1003A40D0;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_finishLoadQueueOperation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100124860;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (void)_finishRestoreOperation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100124D84;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(StoreKitClient *)self _dispatchAsync:v3];
}

- (BOOL)_isPaymentRestricted
{
  if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0)) {
    return 1;
  }
  id v4 = [(id)ISWeakLinkedClassForString() sharedConnection];
  if ([v4 effectiveRestrictedBoolValueForSetting:ISWeakLinkedStringConstantForString()] == 2) {
    return objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "ignoresInAppPurchaseRestriction") ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_lastQueueCheckDate
{
  if (!self->_databaseClientObjectID) {
    return 0;
  }
  id v2 = objc_msgSend(objc_msgSend(+[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"), "objectWithID:", self->_databaseClientObjectID), "lastQueueCheckDate");
  +[NSThread endManagedContextSession];
  return v2;
}

- (void)_mergeBatchResponse:(id)a3 forRestoreOperation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001251CC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v4, a4);
}

- (void)_refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4
{
  +[ISLoadURLBagOperation incrementNetworkCounterForBagContext:](ISLoadURLBagOperation, "incrementNetworkCounterForBagContext:", +[SSURLBagContext contextWithBagType:0]);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(StoreKitClient *)self _setClientState:0];
  }
  if (self->_state == 1)
  {
    if (!a3)
    {
      id v7 = +[SSLogConfig sharedDaemonConfig];
      if (!v7) {
        id v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
        v9 &= 2u;
      }
      if (v9)
      {
        int v35 = 138543618;
        uint64_t v36 = objc_opt_class();
        __int16 v37 = 2112;
        id v38 = [(StoreKitClient *)self _clientIdentifier];
        LODWORD(v32) = 22;
        v31 = &v35;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v35, v32);
          free(v11);
          v31 = (int *)v12;
          SSFileLog();
        }
      }
      -[LoadMicroPaymentQueuesOperation setReason:](self->_loadQueueOperation, "setReason:", 0, v31);
    }
  }
  else
  {
    id v13 = [(StoreKitClient *)self _copyAccountIDsForRefreshReason:a3];
    uint64_t v14 = v13;
    if (a4) {
      [v13 addObject:a4];
    }
    if ([v14 count])
    {
      id v33 = [v14 allObjects];
      id v15 = +[SSLogConfig sharedDaemonConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_INFO)) {
        v17 &= 2u;
      }
      if (v17)
      {
        int v35 = 138544130;
        uint64_t v36 = objc_opt_class();
        __int16 v37 = 2048;
        id v38 = (id)a3;
        __int16 v39 = 2112;
        id v40 = [(StoreKitClient *)self _clientIdentifier];
        __int16 v41 = 2112;
        id v42 = [v33 componentsJoinedByString:@","];
        LODWORD(v32) = 42;
        v31 = &v35;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          id v19 = (void *)v18;
          long long v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v35, v32);
          free(v19);
          v31 = (int *)v20;
          SSFileLog();
        }
      }
      loadQueueOperation = self->_loadQueueOperation;
      if (loadQueueOperation)
      {
        [(LoadMicroPaymentQueuesOperation *)loadQueueOperation setCompletionBlock:0];

        self->_loadQueueOperation = 0;
      }
      long long v22 = objc_alloc_init(LoadMicroPaymentQueuesOperation);
      self->_loadQueueOperation = v22;
      [(LoadMicroPaymentQueuesOperation *)v22 setClientIdentity:[(StoreKitClient *)self _clientIdentity]];
      [(LoadMicroPaymentQueuesOperation *)self->_loadQueueOperation setLastQueueCheckDate:[(StoreKitClient *)self _lastQueueCheckDate]];
      [(LoadMicroPaymentQueuesOperation *)self->_loadQueueOperation setReason:a3];
      [(LoadMicroPaymentQueuesOperation *)self->_loadQueueOperation setShouldRunWithBackgroundPriority:1];
      [(LoadMicroPaymentQueuesOperation *)self->_loadQueueOperation setUserDSIDs:v33];
      long long v23 = +[SSWeakReference weakReferenceWithObject:self];
      long long v24 = self->_loadQueueOperation;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10012590C;
      v34[3] = &unk_1003A3380;
      v34[4] = v23;
      v34[5] = v22;
      [(LoadMicroPaymentQueuesOperation *)v24 setCompletionBlock:v34];
      self->_lastRefreshReason = a3;
      [(StoreKitClient *)self _setClientState:1];
      [(id)sub_10004FC58() addOperation:self->_loadQueueOperation];
    }
    else
    {
      id v25 = +[SSLogConfig sharedDaemonConfig];
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig];
      }
      unsigned int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_INFO)) {
        v27 &= 2u;
      }
      if (v27)
      {
        int v35 = 138543362;
        uint64_t v36 = objc_opt_class();
        LODWORD(v32) = 12;
        v31 = &v35;
        uint64_t v28 = _os_log_send_and_compose_impl();
        if (v28)
        {
          v29 = (void *)v28;
          v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v35, v32);
          free(v29);
          v31 = (int *)v30;
          SSFileLog();
        }
      }
    }
  }
  +[ISLoadURLBagOperation decrementNetworkCounterForBagContext:](ISLoadURLBagOperation, "decrementNetworkCounterForBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0, v31));
}

- (void)_reloadClientProperties
{
  clientIdentity = self->_clientIdentity;
  if (!clientIdentity)
  {
    clientIdentity = objc_alloc_init(StoreKitClientIdentity);
    self->_clientIdentity = clientIdentity;
  }
  if (self->_client && ![(StoreKitClientIdentity *)clientIdentity usesIdentityAttributes])
  {
    [(StoreKitClientIdentity *)self->_clientIdentity setBundleIdentifier:[(XPCClient *)self->_client clientIdentifier]];
    id v5 = self->_clientIdentity;
    uint64_t v6 = [(XPCClient *)self->_client isAppleSigned] ^ 1;
    [(StoreKitClientIdentity *)v5 setSandboxed:v6];
  }
  else if (self->_databaseClientObjectID)
  {
    id v4 = objc_msgSend(+[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"), "objectWithID:", self->_databaseClientObjectID);
    -[StoreKitClientIdentity setBundleIdentifier:](self->_clientIdentity, "setBundleIdentifier:", [v4 identifier]);
    -[StoreKitClientIdentity setBundleVersion:](self->_clientIdentity, "setBundleVersion:", [v4 bundleVersion]);
    -[StoreKitClientIdentity setStoreVersion:](self->_clientIdentity, "setStoreVersion:", [v4 storeVersion]);
    -[StoreKitClientIdentity setStoreIdentifier:](self->_clientIdentity, "setStoreIdentifier:", [v4 storeIdentifier]);
    -[StoreKitClientIdentity setVendorIdentifier:](self->_clientIdentity, "setVendorIdentifier:", [v4 vendorIdentifier]);
    -[StoreKitClientIdentity setAllowsBootstrapCellularData:](self->_clientIdentity, "setAllowsBootstrapCellularData:", objc_msgSend(objc_msgSend(v4, "allowsBootstrapCellularData"), "BOOLValue"));
    -[StoreKitClientIdentity setHidesConfirmationDialogs:](self->_clientIdentity, "setHidesConfirmationDialogs:", objc_msgSend(objc_msgSend(v4, "hidesConfirmationDialogs"), "BOOLValue"));
    -[StoreKitClientIdentity setIgnoresInAppPurchaseRestriction:](self->_clientIdentity, "setIgnoresInAppPurchaseRestriction:", objc_msgSend(objc_msgSend(v4, "ignoresInAppPurchaseRestriction"), "BOOLValue"));
    -[StoreKitClientIdentity setReceiptDirectoryPath:](self->_clientIdentity, "setReceiptDirectoryPath:", [v4 receiptDirectoryPath]);
    -[StoreKitClientIdentity setRequiresAuthenticationForPayment:](self->_clientIdentity, "setRequiresAuthenticationForPayment:", objc_msgSend(objc_msgSend(v4, "requiresAuthenticationForPayment"), "BOOLValue"));
    -[StoreKitClientIdentity setSandboxed:](self->_clientIdentity, "setSandboxed:", objc_msgSend(objc_msgSend(v4, "sandboxed"), "BOOLValue"));
    -[StoreKitClientIdentity setUsesIdentityAttributes:](self->_clientIdentity, "setUsesIdentityAttributes:", objc_msgSend(objc_msgSend(v4, "usesIdentityAttributes"), "BOOLValue"));
    +[NSThread endManagedContextSession];
  }
}

- (void)_showPrivacyPromptForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = [a3 objectID];
  id v7 = [PrivacyPromptOperation alloc];
  unsigned int v8 = [(PrivacyPromptOperation *)v7 initWithPrivacyIdentifier:SSPrivacyIdentifierAppStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100125C2C;
  v9[3] = &unk_1003A70F8;
  v9[4] = +[SSWeakReference weakReferenceWithObject:self];
  v9[5] = v6;
  v9[6] = v8;
  v9[7] = a4;
  [(PrivacyPromptOperation *)v8 setCompletion:v9];
  [(id)sub_10004FC58() addOperation:v8];
}

- (void)_sendBuyRequestForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = objc_alloc_init(BuyMicroPaymentOperation);
  -[BuyMicroPaymentOperation setApplicationUsername:](v7, "setApplicationUsername:", [a3 applicationUsername]);
  -[BuyMicroPaymentOperation setBuyParameters:](v7, "setBuyParameters:", [a3 actionParams]);
  [(BuyMicroPaymentOperation *)v7 setClientAuditTokenData:[(XPCClient *)self->_client auditTokenData]];
  [(BuyMicroPaymentOperation *)v7 setClientIdentity:[(StoreKitClient *)self _clientIdentity]];
  -[BuyMicroPaymentOperation setPartnerIdentifier:](v7, "setPartnerIdentifier:", [a3 partnerIdentifier]);
  -[BuyMicroPaymentOperation setPartnerTransactionIdentifier:](v7, "setPartnerTransactionIdentifier:", [a3 partnerTransactionIdentifier]);
  -[BuyMicroPaymentOperation setProductIdentifier:](v7, "setProductIdentifier:", [a3 productIdentifier]);
  -[BuyMicroPaymentOperation setRequestData:](v7, "setRequestData:", [a3 requestData]);
  -[BuyMicroPaymentOperation setOriginatingStorefront:](v7, "setOriginatingStorefront:", [a3 originatingStorefront]);
  -[BuyMicroPaymentOperation setDiscountIdentifier:](v7, "setDiscountIdentifier:", [a3 discountIdentifier]);
  -[BuyMicroPaymentOperation setDiscountKeyIdentifier:](v7, "setDiscountKeyIdentifier:", [a3 discountKeyIdentifier]);
  -[BuyMicroPaymentOperation setDiscountNonceString:](v7, "setDiscountNonceString:", [a3 discountNonceString]);
  -[BuyMicroPaymentOperation setDiscountSignature:](v7, "setDiscountSignature:", [a3 discountSignature]);
  -[BuyMicroPaymentOperation setDiscountTimestamp:](v7, "setDiscountTimestamp:", [a3 discountTimestamp]);
  [(BuyMicroPaymentOperation *)v7 setDelegate:self];
  id v8 = [a3 quantity];
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 integerValue];
  }
  else {
    uint64_t v9 = 1;
  }
  [(BuyMicroPaymentOperation *)v7 setQuantity:v9];
  -[BuyMicroPaymentOperation setSimulatesAskToBuyInSandbox:](v7, "setSimulatesAskToBuyInSandbox:", objc_msgSend(objc_msgSend(a3, "simulatesAskToBuyInSandbox"), "BOOLValue"));
  id v10 = [a3 objectID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100126228;
  v11[3] = &unk_1003A70A8;
  v11[4] = +[SSWeakReference weakReferenceWithObject:self];
  v11[5] = v7;
  v11[6] = v10;
  v11[7] = a4;
  [(BuyMicroPaymentOperation *)v7 setCompletionBlock:v11];
  [(id)sub_10004FC58() addOperation:v7];
}

- (void)_sendDownloadChangesets:(id)a3
{
  if ([(XPCClient *)self->_client canReceiveMessages])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "0", 20006);
    sub_100174DCC(v5, "1", (__CFString *)a3);
    [(SSXPCConnection *)[(XPCClient *)self->_client outputConnection] sendMessage:v5];
    xpc_release(v5);
  }
  else
  {
    client = self->_client;
    [(XPCClient *)client sendCoalescedMessageWithIdentifier:20001];
  }
}

- (void)_sendFinishRequestForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = objc_alloc_init(FinishMicroPaymentOperation);
  [(FinishMicroPaymentOperation *)v7 setClientIdentity:[(StoreKitClient *)self _clientIdentity]];
  -[FinishMicroPaymentOperation setTransactionIdentifier:](v7, "setTransactionIdentifier:", [a3 transactionIdentifier]);
  -[FinishMicroPaymentOperation setUserDSID:](v7, "setUserDSID:", [a3 userDSID]);
  id v8 = [a3 objectID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100126438;
  v9[3] = &unk_1003A70A8;
  v9[4] = +[SSWeakReference weakReferenceWithObject:self];
  v9[5] = v7;
  v9[6] = v8;
  v9[7] = a4;
  [(FinishMicroPaymentOperation *)v7 setCompletionBlock:v9];
  [(id)sub_10004FC58() addOperation:v7];
}

- (void)_sendMergeResults:(id)a3
{
  if (a3)
  {
    if ([(XPCClient *)self->_client canReceiveMessages])
    {
      -[StoreKitClient _sendPaymentsAdded:](self, "_sendPaymentsAdded:", [a3 addedPayments]);
      id v5 = [a3 changedPayments];
      [(StoreKitClient *)self _sendPaymentsUpdated:v5];
    }
    else
    {
      client = self->_client;
      [(XPCClient *)client sendCoalescedMessageWithIdentifier:20001];
    }
  }
}

- (void)_sendMessage:(int64_t)a3 forPayments:(id)a4
{
  if (![(XPCClient *)self->_client canReceiveMessages]) {
    goto LABEL_15;
  }
  id v7 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((char *)objc_msgSend(objc_msgSend(v12, "state"), "integerValue") - 5 <= (char *)0xFFFFFFFFFFFFFFFDLL)
        {
          id v13 = [v12 copyPaymentTransaction];
          if (v13)
          {
            uint64_t v14 = v13;
            [(__CFString *)v7 addObject:v13];
          }
        }
      }
      id v9 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  if (v7)
  {
    if ([(__CFString *)v7 count])
    {
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v15, "0", a3);
      sub_100174DCC(v15, "1", v7);
      [(SSXPCConnection *)[(XPCClient *)self->_client outputConnection] sendMessage:v15];
      xpc_release(v15);
    }
  }
  else
  {
LABEL_15:
    [(XPCClient *)self->_client sendCoalescedMessageWithIdentifier:20001];
    id v7 = 0;
  }
}

- (void)_sendPaymentsAdded:(id)a3
{
}

- (void)_sendPaymentsRemoved:(id)a3
{
  if ([(XPCClient *)self->_client canReceiveMessages])
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 20004);
    SSXPCDictionarySetCFObject();
    [(SSXPCConnection *)[(XPCClient *)self->_client outputConnection] sendMessage:v4];
    xpc_release(v4);
  }
  else
  {
    client = self->_client;
    [(XPCClient *)client sendCoalescedMessageWithIdentifier:20001];
  }
}

- (void)_sendPaymentsUpdated:(id)a3
{
}

- (void)_sendRestoreCompletedWithError:(id)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "0", 20005);
  if (a3)
  {
    uint64_t v6 = sub_100050134(a3);
    id v7 = (__CFString *)sub_100174DC0(v6);
    sub_100174DCC(v5, "1", v7);
  }
  [(SSXPCConnection *)[(XPCClient *)self->_client outputConnection] sendMessage:v5];

  xpc_release(v5);
}

- (void)_setClientState:(int64_t)a3
{
  if (self->_state != a3)
  {
    xpc_object_t v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = v5;
    if (self->_state == 3) {
      [(NSNotificationCenter *)v5 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
    }
    self->_state = a3;
    if (a3 == 3)
    {
      uint64_t v7 = ISNetworkTypeChangedNotification;
      [(NSNotificationCenter *)v6 addObserver:self selector:"_networkTypeChangedNotification:" name:v7 object:0];
    }
  }
}

- (void)_showPaymentsRestrictedAlert
{
  id v2 = objc_alloc_init((Class)ISDialog);
  objc_msgSend(v2, "setButtons:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OK", &stru_1003B9B00, 0))));
  objc_msgSend(v2, "setMessage:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MICRO_PAYMENTS_RESTRICTED_BODY", &stru_1003B9B00, 0));
  objc_msgSend(v2, "setTitle:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MICRO_PAYMENTS_RESTRICTED_TITLE", &stru_1003B9B00, 0));
  objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", +[ISDialogOperation operationWithDialog:](ISDialogOperation, "operationWithDialog:", v2));
}

- (BOOL)buyMicroPaymentOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126B18;
  v7[3] = &unk_1003A6FE0;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end