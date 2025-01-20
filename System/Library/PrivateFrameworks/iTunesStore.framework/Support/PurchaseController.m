@interface PurchaseController
+ (id)sharedController;
+ (void)addPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)cancelPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)connectClientWithMessage:(id)a3 connection:(id)a4;
+ (void)finishPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)getPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)insertPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)movePurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (BOOL)_cancelPurchasesWithBatchIdentifier:(int64_t)a3 client:(id)a4 response:(id)a5;
- (PurchaseController)init;
- (id)_authenticationOperationQueue;
- (id)_clientForMessage:(id)a3 connection:(id)a4;
- (id)_clientForUniqueIdentifier:(int64_t)a3;
- (id)_newEncodedPurchaseEntityPropertiesWithResponse:(id)a3;
- (id)_newPurchaseIdentifiersFromEncodedArray:(id)a3;
- (id)_newPurchasesFromEncodedArray:(id)a3 client:(id)a4;
- (id)_newResponsesToPurchasesForClient:(id)a3 inDatabase:(id)a4;
- (id)_placeholderAppPathForBundleIdentifier:(id)a3;
- (id)_purchaseOperationQueue;
- (void)_addEncodedPurchases:(id)a3 forClient:(id)a4;
- (void)_addPurchases:(id)a3 forClient:(id)a4;
- (void)_authenticateForPurchases:(id)a3 client:(id)a4;
- (void)_beginPurchaseBatch:(id)a3 forClient:(id)a4;
- (void)_cancelEncodedPurchases:(id)a3 forClient:(id)a4;
- (void)_cancelPurchasesForLackOfDiskSpace:(id)a3 client:(id)a4;
- (void)_checkStoreDownloadQueuesForPurchase:(id)a3 response:(id)a4;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_connectClient:(id)a3 withOutputConnection:(id)a4;
- (void)_dispatchAsync:(id)a3;
- (void)_enqueueNextPurchase;
- (void)_filterPurchases:(id)a3 withTransaction:(id)a4 block:(id)a5;
- (void)_finishAuthenticationRequestForBatchIdentifier:(int64_t)a3 client:(id)a4 withAccountID:(id)a5 error:(id)a6;
- (void)_finishEncodedPurchaseIdentifiers:(id)a3 forClient:(id)a4;
- (void)_finishPurchaseRequestForClientUniqueID:(int64_t)a3 withResponse:(id)a4;
- (void)_garbageCollectInflightPurchases;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_insertEncodedPurchases:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5;
- (void)_markInFlightCanceledPurchaseIdentifier:(id)a3;
- (void)_moveEncodedPurchaseIDs:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5;
- (void)_sendAuthenticateRequestForClientUniqueID:(int64_t)a3 withContext:(id)a4 responseHandler:(id)a5;
- (void)_showNotEnoughDiskSpaceDialogForPurchases:(id)a3;
- (void)_showPurchasesFailedDialogWithFirstTitle:(id)a3 count:(int64_t)a4;
- (void)addPurchases:(id)a3;
- (void)beginPurchaseBatch:(id)a3;
- (void)cancelPurchasesForDownloadsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation PurchaseController

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  xpc_retain(a4);
  xpc_retain(a3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000080A0;
  v9[3] = &unk_1003A70A8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = a5;
  [(PurchaseController *)self _dispatchAsync:v9];
}

- (void)_connectClient:(id)a3 withOutputConnection:(id)a4
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
    *(_DWORD *)v17 = 138412546;
    *(void *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a3;
    LODWORD(v15) = 22;
    v14 = (NSString *)v17;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v17, v15);
      free(v11);
      v14 = v12;
      SSFileLog();
    }
  }
  BOOL v13 = objc_msgSend(a3, "outputConnection", v14) == 0;
  [a3 setOutputConnectionWithConnection:a4];
  [a3 ackConnection];
  if (v13 && [a3 finishesPurchases])
  {
    *(void *)v17 = 0;
    *(void *)&v17[8] = v17;
    *(void *)&v17[16] = 0x3052000000;
    v18 = sub_100193380;
    v19 = sub_100193390;
    uint64_t v20 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000BB6C;
    v16[3] = &unk_1003A88B0;
    v16[5] = a3;
    v16[6] = v17;
    v16[4] = self;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v16);
    if ([*(id *)(*(void *)&v17[8] + 40) count]) {
      [a3 sendResponses:*(void *)(*(void *)&v17[8] + 40)];
    }

    _Block_object_dispose(v17, 8);
  }
}

- (id)_newResponsesToPurchasesForClient:(id)a3 inDatabase:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v11[0] = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"client_id", [a3 uniqueIdentifier]);
  v11[1] = +[SSSQLiteComparisonPredicate predicateWithProperty:@"state" equalToLongLong:2];
  CFStringRef v10 = @"order_id";
  v9[0] = @"encoded_data";
  v9[1] = @"encoded_error";
  v9[2] = @"encoded_response";
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100194D44;
  v8[3] = &unk_1003A32B8;
  v8[4] = v6;
  objc_msgSend(+[PurchaseEntity queryWithDatabase:predicate:orderingProperties:](PurchaseEntity, "queryWithDatabase:predicate:orderingProperties:", a4, +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)), "enumeratePersistentIDsAndProperties:count:usingBlock:", v9, 3, v8);
  return v6;
}

- (id)_clientForMessage:(id)a3 connection:(id)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  clients = self->_clients;
  id v8 = [(NSMutableArray *)clients countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v8)
  {
LABEL_13:
    if ((SSXPCConnectionHasEntitlement() & 1) == 0 && !SSXPCConnectionHasEntitlement()) {
      return 0;
    }
    v12 = [[PurchaseManagerClient alloc] initWithInputConnection:a4];
    uint64_t v15 = self->_clients;
    if (!v15)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_clients = v15;
    }
    [(NSMutableArray *)v15 addObject:v12];
    objc_opt_class();
    v16 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    v17 = [(XPCClient *)v12 clientIdentifier];
    if (v16 && v17)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005020;
      v22[3] = &unk_1003A8B48;
      v22[4] = v17;
      v22[5] = v16;
      v22[6] = v12;
      objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v22);
    }
    else if (!v16)
    {
LABEL_22:
      [(PurchaseManagerClient *)v12 setUseRemoteAuthentication:xpc_dictionary_get_BOOL(a3, "3")];
      v18 = v12;
      v19 = [[DownloadManagerClient alloc] initWithInputConnection:a4];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000BE3C;
      v21[3] = &unk_1003A89B8;
      v21[4] = v19;
      objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v21);

      return v12;
    }

    goto LABEL_22;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v24;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v24 != v10) {
      objc_enumerationMutation(clients);
    }
    v12 = *(PurchaseManagerClient **)(*((void *)&v23 + 1) + 8 * v11);
    id v13 = [(XPCClient *)v12 copyInputConnection];
    xpc_release(v13);
    if (v13 == a4 && v12 != 0) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [(NSMutableArray *)clients countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }
}

- (void)_dispatchAsync:(id)a3
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.PurchaseController");
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008030;
  v6[3] = &unk_1003A8B70;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(dispatchQueue, v6);
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192B4C;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401FE0 != -1) {
    dispatch_once(&qword_100401FE0, block);
  }
  return (id)qword_100401FD8;
}

+ (void)getPurchasesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[PurchaseController sharedController];

  [v6 _handleMessage:a3 connection:a4 usingReplyBlock:&stru_1003A8918];
}

+ (void)connectClientWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003E9C;
  v4[3] = &unk_1003A88D8;
  v4[4] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

- (PurchaseController)init
{
  v4.receiver = self;
  v4.super_class = (Class)PurchaseController;
  v2 = [(PurchaseController *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.PurchaseController", 0);
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  id v4 = +[Daemon daemon];
  v5 = v4;
  if (self->_authenticationOperationQueue)
  {
    objc_msgSend(v4, "removeKeepAliveOperationQueue:");
  }
  if (self->_purchaseOperationQueue)
  {
    objc_msgSend(v5, "removeKeepAliveOperationQueue:");
  }
  v6.receiver = self;
  v6.super_class = (Class)PurchaseController;
  [(PurchaseController *)&v6 dealloc];
}

- (void)addPurchases:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100192BE0;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(PurchaseController *)self _dispatchAsync:v3];
}

- (void)beginPurchaseBatch:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100192C5C;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(PurchaseController *)self _dispatchAsync:v3];
}

- (void)cancelPurchasesForDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100192CD8;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(PurchaseController *)self _dispatchAsync:v3];
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100193458;
  v2[3] = &unk_1003A33A8;
  v2[4] = self;
  [(PurchaseController *)self _dispatchAsync:v2];
}

+ (void)addPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001934F0;
  v4[3] = &unk_1003A88D8;
  v4[4] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)cancelPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100193640;
  v4[3] = &unk_1003A88D8;
  void v4[5] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)finishPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019380C;
  v4[3] = &unk_1003A88D8;
  v4[4] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)insertPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019395C;
  v4[3] = &unk_1003A88D8;
  v4[4] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)movePurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100193AC4;
  v4[3] = &unk_1003A88D8;
  v4[4] = a3;
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "_handleMessage:connection:usingReplyBlock:", a3, a4, v4);
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"addPurchasesWithMessage:connection:" forMessage:98];
  [a3 addObserver:a1 selector:"cancelPurchasesWithMessage:connection:" forMessage:99];
  [a3 addObserver:a1 selector:"connectClientWithMessage:connection:" forMessage:104];
  [a3 addObserver:a1 selector:"getPurchasesWithMessage:connection:" forMessage:100];
  [a3 addObserver:a1 selector:"finishPurchasesWithMessage:connection:" forMessage:101];
  [a3 addObserver:a1 selector:"insertPurchasesWithMessage:connection:" forMessage:102];

  [a3 addObserver:a1 selector:"movePurchasesWithMessage:connection:" forMessage:103];
}

- (void)_addEncodedPurchases:(id)a3 forClient:(id)a4
{
  id v6 = -[PurchaseController _newPurchasesFromEncodedArray:client:](self, "_newPurchasesFromEncodedArray:client:", a3);
  [(PurchaseController *)self _addPurchases:v6 forClient:a4];
}

- (void)_cancelEncodedPurchases:(id)a3 forClient:(id)a4
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
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
      int v16 = 138412802;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2048;
      size_t count = xpc_array_get_count(a3);
      __int16 v20 = 2112;
      id v21 = a4;
      LODWORD(v14) = 32;
      id v13 = &v16;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v16, v14);
        free(v11);
        id v13 = (int *)v12;
        SSFileLog();
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100193ED0;
    v15[3] = &unk_1003A8990;
    v15[4] = a3;
    v15[5] = self;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v13), "modifyUsingPurchaseTransactionBlock:", v15);
  }
}

- (void)_finishEncodedPurchaseIdentifiers:(id)a3 forClient:(id)a4
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138412802;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2048;
      size_t count = xpc_array_get_count(a3);
      __int16 v19 = 2112;
      id v20 = a4;
      LODWORD(v13) = 32;
      v12 = &v15;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v15, v13);
        free(v10);
        v12 = (int *)v11;
        SSFileLog();
      }
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100194210;
    v14[3] = &unk_1003A89B8;
    v14[4] = a3;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v12), "modifyUsingPurchaseTransactionBlock:", v14);
  }
}

- (void)_insertEncodedPurchases:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5
{
  id v8 = [(PurchaseController *)self _newPurchasesFromEncodedArray:a3 client:a5];
  if ([v8 count])
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)v42 = 138412802;
      *(void *)&v42[4] = objc_opt_class();
      *(_WORD *)&v42[12] = 2048;
      *(void *)&v42[14] = [v8 count];
      *(_WORD *)&v42[22] = 2112;
      id v43 = a5;
      LODWORD(v27) = 32;
      long long v25 = (NSString *)v42;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v42, v27);
        free(v13);
        long long v25 = v14;
        SSFileLog();
      }
    }
    *(void *)v42 = 0;
    *(void *)&v42[8] = v42;
    *(void *)&v42[16] = 0x3052000000;
    id v43 = sub_100193380;
    v44 = sub_100193390;
    uint64_t v45 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3052000000;
    v33 = sub_100193380;
    v34 = sub_100193390;
    uint64_t v35 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001947CC;
    v29[3] = &unk_1003A8A08;
    v29[4] = self;
    v29[5] = v8;
    v29[8] = &v30;
    v29[9] = a4;
    v29[6] = a5;
    v29[7] = v42;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v25), "modifyUsingPurchaseTransactionBlock:", v29);
    if ([*(id *)(*(void *)&v42[8] + 40) count])
    {
      id v15 = +[SSLogConfig sharedDaemonConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v15 shouldLog];
      unsigned int v17 = [v15 shouldLogToDisk];
      __int16 v18 = [v15 OSLogObject];
      if (v17) {
        v16 |= 2u;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v19 = objc_opt_class();
        id v20 = [*(id *)(*(void *)&v42[8] + 40) count];
        int v36 = 138412802;
        uint64_t v37 = v19;
        __int16 v38 = 2048;
        id v39 = v20;
        __int16 v40 = 2112;
        id v41 = a5;
        LODWORD(v27) = 32;
        long long v26 = &v36;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          long long v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v36, v27);
          free(v22);
          long long v26 = (int *)v23;
          SSFileLog();
        }
      }
      long long v24 = *(void **)(*(void *)&v42[8] + 40);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100194A60;
      v28[3] = &unk_1003A8A30;
      v28[4] = a5;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v28, v26);
    }
    [(PurchaseController *)self _authenticateForPurchases:v31[5] client:a5];
    [(PurchaseController *)self _enqueueNextPurchase];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v42, 8);
  }
}

- (void)_markInFlightCanceledPurchaseIdentifier:(id)a3
{
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
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2112;
    id v17 = a3;
    LODWORD(v13) = 22;
    uint64_t v12 = &v14;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      id v9 = (void *)v8;
      unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      uint64_t v12 = (int *)v10;
      SSFileLog();
    }
  }
  inflightCanceledIdentifiers = self->_inflightCanceledIdentifiers;
  if (!inflightCanceledIdentifiers)
  {
    inflightCanceledIdentifiers = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_inflightCanceledIdentifiers = inflightCanceledIdentifiers;
  }
  -[NSMutableSet addObject:](inflightCanceledIdentifiers, "addObject:", a3, v12);
}

- (void)_moveEncodedPurchaseIDs:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5
{
  id v7 = -[PurchaseController _newPurchaseIdentifiersFromEncodedArray:](self, "_newPurchaseIdentifiersFromEncodedArray:", a3, a4, a5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100194D38;
  v8[3] = &unk_1003A8A58;
  v8[4] = v7;
  void v8[5] = a4;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v8);
  [(PurchaseController *)self _enqueueNextPurchase];
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 finishesPurchases])
    {
      dispatchQueue = self->_dispatchQueue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100194F04;
      v6[3] = &unk_1003A3380;
      v6[4] = self;
      v6[5] = v4;
      dispatch_async(dispatchQueue, v6);
    }
  }
}

- (void)_addPurchases:(id)a3 forClient:(id)a4
{
  if ([a3 count])
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
      *(_DWORD *)__int16 v40 = 138412802;
      *(void *)&v40[4] = objc_opt_class();
      *(_WORD *)&v40[12] = 2048;
      *(void *)&v40[14] = [a3 count];
      *(_WORD *)&v40[22] = 2112;
      id v41 = a4;
      LODWORD(v25) = 32;
      long long v23 = (NSString *)v40;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        int v11 = (void *)v10;
        uint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v40, v25);
        free(v11);
        long long v23 = v12;
        SSFileLog();
      }
    }
    *(void *)__int16 v40 = 0;
    *(void *)&v40[8] = v40;
    *(void *)&v40[16] = 0x3052000000;
    id v41 = sub_100193380;
    v42 = sub_100193390;
    uint64_t v43 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3052000000;
    v31 = sub_100193380;
    uint64_t v32 = sub_100193390;
    uint64_t v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10019539C;
    v27[3] = &unk_1003A8A80;
    v27[4] = self;
    v27[5] = a3;
    v27[7] = v40;
    v27[8] = &v28;
    v27[6] = a4;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v23), "modifyUsingPurchaseTransactionBlock:", v27);
    if ([*(id *)(*(void *)&v40[8] + 40) count])
    {
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      unsigned int v15 = [v13 shouldLogToDisk];
      __int16 v16 = [v13 OSLogObject];
      if (v15) {
        v14 |= 2u;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        v14 &= 2u;
      }
      if (v14)
      {
        uint64_t v17 = objc_opt_class();
        id v18 = [*(id *)(*(void *)&v40[8] + 40) count];
        int v34 = 138412802;
        uint64_t v35 = v17;
        __int16 v36 = 2048;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = a4;
        LODWORD(v25) = 32;
        long long v24 = &v34;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          id v20 = (void *)v19;
          uint64_t v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v34, v25);
          free(v20);
          long long v24 = (int *)v21;
          SSFileLog();
        }
      }
      v22 = *(void **)(*(void *)&v40[8] + 40);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10019562C;
      v26[3] = &unk_1003A8A30;
      v26[4] = a4;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v26, v24);
    }
    if ([(id)v29[5] count]) {
      [(PurchaseController *)self _beginPurchaseBatch:v29[5] forClient:a4];
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v40, 8);
  }
}

- (void)_authenticateForPurchases:(id)a3 client:(id)a4
{
  if (SSRestrictionsShouldRequirePasswordImmediately()
    && (unint64_t)[a3 count] >= 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * v10) ignoresForcedPasswordRestriction]) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      id v11 = objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "batchIdentifier");
      authenticatingBatchIdentifiers = self->_authenticatingBatchIdentifiers;
      if (!authenticatingBatchIdentifiers)
      {
        authenticatingBatchIdentifiers = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
        self->_authenticatingBatchIdentifiers = authenticatingBatchIdentifiers;
      }
      [(NSMutableIndexSet *)authenticatingBatchIdentifiers addIndex:v11];
      id v13 = [[PurchaseAuthenticateOperation alloc] initWithPurchases:a3];
      -[PurchaseAuthenticateOperation setClientIdentifierHeader:](v13, "setClientIdentifierHeader:", [a4 clientIdentifierHeader]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001958C4;
      v14[3] = &unk_1003A8AA8;
      void v14[5] = a4;
      v14[6] = v11;
      v14[4] = +[SSWeakReference weakReferenceWithObject:self];
      [(PurchaseAuthenticateOperation *)v13 setAuthenticationBlock:v14];
      objc_msgSend(-[PurchaseController _authenticationOperationQueue](self, "_authenticationOperationQueue"), "addOperation:", v13);
    }
  }
}

- (id)_authenticationOperationQueue
{
  id result = self->_authenticationOperationQueue;
  if (!result)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    self->_authenticationOperationQueue = v4;
    [(ISOperationQueue *)v4 setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)self->_authenticationOperationQueue setName:@"com.apple.itunesstored.PurchaseController.auth"];
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", self->_authenticationOperationQueue);
    return self->_authenticationOperationQueue;
  }
  return result;
}

- (void)_beginPurchaseBatch:(id)a3 forClient:(id)a4
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (!v7) {
    goto LABEL_22;
  }
  id v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v29;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if ([v12 createsDownloads]) {
        v9 += (uint64_t)[v12 expectedDownloadFileSize];
      }
    }
    id v8 = [a3 countByEnumeratingWithState:&v28 objects:v38 count:16];
  }
  while (v8);
  if (v9)
  {
    id v13 = objc_alloc((Class)NSDictionary);
    unsigned int v14 = +[NSNumber numberWithInteger:1];
    id v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, kCPFreeSpaceEffortLevelKey, 0);
    long long v16 = +[NSURL fileURLWithPath:NSHomeDirectory()];
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v19 &= 2u;
    }
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      id v21 = [a3 count];
      int v32 = 138412802;
      uint64_t v33 = v20;
      __int16 v34 = 2048;
      uint64_t v35 = v9;
      __int16 v36 = 2048;
      id v37 = v21;
      LODWORD(v26) = 32;
      uint64_t v25 = &v32;
      uint64_t v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        long long v23 = (void *)v22;
        long long v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v32, v26);
        free(v23);
        uint64_t v25 = (int *)v24;
        SSFileLog();
      }
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100195C94;
    v27[3] = &unk_1003A8AD0;
    v27[4] = self;
    v27[5] = a3;
    v27[6] = a4;
    [+[ISDevice sharedInstance] requestFreeSpace:v9 atPath:v16 withOptions:v15 completionBlock:v27];
  }
  else
  {
LABEL_22:
    [(PurchaseController *)self _authenticateForPurchases:a3 client:a4];
    [(PurchaseController *)self _enqueueNextPurchase];
  }
}

- (void)_cancelPurchasesForLackOfDiskSpace:(id)a3 client:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001963E4;
  v7[3] = &unk_1003A89B8;
  v7[4] = a3;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v7);
  [a4 sendError:SSError() forPurchases:a3];
  [(PurchaseController *)self _showNotEnoughDiskSpaceDialogForPurchases:a3];
}

- (BOOL)_cancelPurchasesWithBatchIdentifier:(int64_t)a3 client:(id)a4 response:(id)a5
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [(PurchaseController *)self _newEncodedPurchaseEntityPropertiesWithResponse:a5];
  if (a4) {
    char v11 = [a4 finishesPurchases] ^ 1;
  }
  else {
    char v11 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10019664C;
  v14[3] = &unk_1003A8B20;
  char v15 = v11;
  v14[6] = &v16;
  void v14[7] = a3;
  v14[4] = v9;
  void v14[5] = v10;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v14);
  if (*((unsigned char *)v17 + 24) && [v9 count]) {
    [a4 sendResponse:a5 forPurchases:v9];
  }

  char v12 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (void)_checkStoreDownloadQueuesForPurchase:(id)a3 response:(id)a4
{
  id v6 = [a3 valueForDownloadProperty:SSDownloadPropertyKind];
  id v7 = [a4 userIdentifier];
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
    int v15 = 138412546;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2112;
    id v18 = v6;
    LODWORD(v14) = 22;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      char v12 = (void *)v11;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v14);
      free(v12);
      SSFileLog();
    }
  }
  if (v6)
  {
    if (v7)
    {
      id v13 = objc_alloc_init(StoreDownloadQueueRequest);
      [(StoreDownloadQueueRequest *)v13 setAccountIdentifier:v7];
      -[StoreDownloadQueueRequest setCancelsDuplicateDownloads:](v13, "setCancelsDuplicateDownloads:", objc_msgSend(objc_msgSend(a3, "valueForDownloadProperty:", SSDownloadPropertyShouldCancelIfDuplicate), "BOOLValue"));
      -[StoreDownloadQueueRequest setPurchaseIdentifier:](v13, "setPurchaseIdentifier:", [a3 uniqueIdentifier]);
      [(StoreDownloadQueueRequest *)v13 setQueueIdentifier:sub_1000AAFC0((uint64_t)v6)];
      [(StoreDownloadQueueRequest *)v13 setReason:@"trigger-download"];
      objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"), "checkQueuesWithRequest:", v13);
    }
  }
  else
  {
    objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"), "checkQueuesWithReason:accountID:", @"trigger-download", v7);
  }
}

- (id)_clientForUniqueIdentifier:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clients = self->_clients;
  id v5 = [(NSMutableArray *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(clients);
    }
    unsigned int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 uniqueIdentifier] == (id)a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_enqueueNextPurchase
{
  if (![(NSMutableSet *)self->_purchasingIdentifiers count])
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3052000000;
    uint64_t v16 = sub_100193380;
    __int16 v17 = sub_100193390;
    uint64_t v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100196E50;
    v12[3] = &unk_1003A8BC0;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = v19;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v12);
    if (v14[5])
    {
      v3 = +[SSWeakReference weakReferenceWithObject:self];
      if ([(id)v14[5] useRemoteAuthentication])
      {
        id v4 = (void *)v14[5];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        void v11[2] = sub_100197254;
        v11[3] = &unk_1003A8BE8;
        v11[4] = v3;
        v11[5] = v19;
        [v4 setRemoteAuthenticationHandler:v11];
      }
      id v5 = (void *)v14[5];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001972B0;
      v10[3] = &unk_1003A8C10;
      v10[4] = v3;
      v10[5] = v19;
      [v5 setPurchaseBlock:v10];
      id v6 = [(id)v14[5] purchase];
      id v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v6, "uniqueIdentifier"));
      purchasingIdentifiers = self->_purchasingIdentifiers;
      if (!purchasingIdentifiers)
      {
        purchasingIdentifiers = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        self->_purchasingIdentifiers = purchasingIdentifiers;
      }
      [(NSMutableSet *)purchasingIdentifiers addObject:v7];

      if ([v6 displaysOnLockScreen]) {
        GSEventResetIdleTimer();
      }
      id v9 = [(PurchaseController *)self _purchaseOperationQueue];
      [v9 addOperation:v14[5]];
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v19, 8);
  }
}

- (void)_filterPurchases:(id)a3 withTransaction:(id)a4 block:(id)a5
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id obj = a3;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v13 = [a4 existingDownloadForPurchase:v11];
        [v13 valueForProperty:@"kind"];
        if (SSDebugShouldUseAppstored()) {
          char IsSoftwareKind = SSDownloadKindIsSoftwareKind();
        }
        else {
          char IsSoftwareKind = 0;
        }
        if (SSDownloadKindIsBookToShimKind())
        {
          id v15 = +[SSLogConfig sharedDaemonConfig];
          if (!v15) {
            id v15 = +[SSLogConfig sharedConfig];
          }
          unsigned int v16 = [v15 shouldLog];
          if ([v15 shouldLogToDisk]) {
            v16 |= 2u;
          }
          if (os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_INFO)) {
            int v17 = v16;
          }
          else {
            int v17 = v16 & 2;
          }
          if (v17)
          {
            v31[0] = 0;
            LODWORD(v26) = 2;
            uint64_t v25 = (NSString *)v31;
            uint64_t v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              char v19 = (void *)v18;
              uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, v31, v26);
              free(v19);
              uint64_t v25 = v20;
              SSFileLog();
            }
          }
LABEL_23:
          objc_msgSend(v29, "addObject:", v11, v25);
          goto LABEL_28;
        }
        char v21 = IsSoftwareKind ^ 1;
        if (!v13) {
          char v21 = 0;
        }
        if ((v21 & 1) == 0) {
          goto LABEL_23;
        }
        id v22 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v13, "databaseID"));
        id v23 = [v6 objectForKey:v22];
        if (v23)
        {
          [v23 addObject:v11];
        }
        else
        {
          id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v11, 0);
          [v6 setObject:v24 forKey:v22];
        }
LABEL_28:
      }
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }
  (*((void (**)(id, id, id))a5 + 2))(a5, v29, v6);
}

- (void)_finishAuthenticationRequestForBatchIdentifier:(int64_t)a3 client:(id)a4 withAccountID:(id)a5 error:(id)a6
{
  +[NSNumber numberWithBool:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001976E4;
  v10[3] = &unk_1003A3F90;
  v10[4] = a5;
  v10[5] = self;
  v10[7] = a4;
  v10[8] = a3;
  void v10[6] = SSErrorBySettingUserInfoValue();
  [(PurchaseController *)self _dispatchAsync:v10];
}

- (void)_sendAuthenticateRequestForClientUniqueID:(int64_t)a3 withContext:(id)a4 responseHandler:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100197B40;
  v5[3] = &unk_1003A8C58;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  v5[7] = a3;
  [(PurchaseController *)self _dispatchAsync:v5];
}

- (void)_finishPurchaseRequestForClientUniqueID:(int64_t)a3 withResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100197BF0;
  v4[3] = &unk_1003A6488;
  void v4[5] = a4;
  void v4[6] = a3;
  v4[4] = self;
  [(PurchaseController *)self _dispatchAsync:v4];
}

- (void)_garbageCollectInflightPurchases
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100198224;
  v2[3] = &unk_1003A89B8;
  v2[4] = self;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingPurchaseTransactionBlock:", v2);
}

- (id)_newEncodedPurchaseEntityPropertiesWithResponse:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ([a3 error])
  {
    [a3 error];
    uint64_t ArchivableData = SSCodingCreateArchivableData();
    if (ArchivableData)
    {
      id v6 = (void *)ArchivableData;
      [v4 setObject:ArchivableData forKey:@"encoded_error"];
    }
  }
  id v7 = objc_msgSend(objc_msgSend(a3, "URLResponse"), "databaseEncoding");
  if (v7) {
    [v4 setObject:v7 forKey:@"encoded_response"];
  }
  return v4;
}

- (id)_newPurchaseIdentifiersFromEncodedArray:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_1001988BC;
    applier[3] = &unk_1003A40A8;
    applier[4] = v4;
    xpc_array_apply(a3, applier);
  }
  return v4;
}

- (id)_newPurchasesFromEncodedArray:(id)a3 client:(id)a4
{
  if (!a3 || xpc_get_type(a3) != (xpc_type_t)&_xpc_type_array) {
    return 0;
  }
  id v7 = [a4 userAgent];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100198A08;
  void v9[3] = &unk_1003A8968;
  v9[4] = v7;
  v9[5] = v6;
  xpc_array_apply(a3, v9);
  return v6;
}

- (id)_placeholderAppPathForBundleIdentifier:(id)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), @"com.apple.iTunesStore", a3, 0);
  id v4 = [+[NSString pathWithComponents:v3] stringByAppendingPathExtension:@"app"];

  return v4;
}

- (id)_purchaseOperationQueue
{
  id result = self->_purchaseOperationQueue;
  if (!result)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    self->_purchaseOperationQueue = v4;
    [(ISOperationQueue *)v4 setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)self->_purchaseOperationQueue setName:@"com.apple.itunesstored.PurchaseController.purchase"];
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", self->_purchaseOperationQueue);
    return self->_purchaseOperationQueue;
  }
  return result;
}

- (void)_showNotEnoughDiskSpaceDialogForPurchases:(id)a3
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v5 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_TITLE" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v5);
  id v6 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"OK" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v6);
  id v7 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_SETTINGS" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v7);
  CFDictionarySetValue(Mutable, SBUserNotificationDefaultButtonTag, +[NSNumber numberWithInt:1]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = SSDownloadPropertyTitle;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) valueForDownloadProperty:v11];
        if (v13)
        {
          long long v14 = v13;
          goto LABEL_11;
        }
      }
      id v9 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_11:
  id v15 = (char *)[a3 count];
  if ([v14 length])
  {
    if (v15 == (char *)2)
    {
      unsigned int v16 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v17 = @"NOT_ENOUGH_SPACE_SPECIFIC_PLUS_ONE_%@";
    }
    else
    {
      if (v15 != (char *)1)
      {
        uint64_t v20 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_SPECIFIC_PLURAL_%@_%ld" value:&stru_1003B9B00 table:0];
        id v23 = v15 - 1;
        goto LABEL_20;
      }
      unsigned int v16 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v17 = @"NOT_ENOUGH_SPACE_SPECIFIC_%@";
    }
    uint64_t v20 = [(NSBundle *)v16 localizedStringForKey:v17 value:&stru_1003B9B00 table:0];
LABEL_20:
    char v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v14, v23);
    goto LABEL_23;
  }
  uint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v15 == (char *)1) {
    CFStringRef v19 = @"NOT_ENOUGH_SPACE_SINGULAR";
  }
  else {
    CFStringRef v19 = @"NOT_ENOUGH_SPACE_PLURAL";
  }
  char v21 = [(NSBundle *)v18 localizedStringForKey:v19 value:&stru_1003B9B00 table:0];
LABEL_23:
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v21);
  id v22 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  objc_msgSend(+[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"), "showUserNotification:withCompletionBlock:", v22, &stru_1003A8D10);

  CFRelease(Mutable);
}

- (void)_showPurchasesFailedDialogWithFirstTitle:(id)a3 count:(int64_t)a4
{
  id v12 = objc_alloc_init((Class)ISDialog);
  id v6 = [a3 length];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v6)
  {
    objc_msgSend(v12, "setTitle:", -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", @"GENERIC_PURCHASE_ERROR", &stru_1003B9B00, 0));
    goto LABEL_10;
  }
  objc_msgSend(v12, "setTitle:", -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", @"SPECIFIC_PURCHASE_ERROR_TITLE", &stru_1003B9B00, 0));
  if (a4 == 2)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v9 = @"SPECIFIC_PURCHASE_ERROR_BODY_PLUS_ONE_%@";
  }
  else
  {
    if (a4 != 1)
    {
      uint64_t v10 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"SPECIFIC_PURCHASE_ERROR_BODY_PLURAL_%@_%ld" value:&stru_1003B9B00 table:0];
      int64_t v11 = a4 - 1;
      goto LABEL_9;
    }
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v9 = @"SPECIFIC_PURCHASE_ERROR_BODY_%@";
  }
  uint64_t v10 = [(NSBundle *)v8 localizedStringForKey:v9 value:&stru_1003B9B00 table:0];
LABEL_9:
  [v12 setMessage:+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, a3, v11)];
LABEL_10:
  objc_msgSend(v12, "setButtons:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OK", &stru_1003B9B00, 0))));
  objc_msgSend(+[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"), "showDialog:withCompletionBlock:", v12, 0);
}

@end