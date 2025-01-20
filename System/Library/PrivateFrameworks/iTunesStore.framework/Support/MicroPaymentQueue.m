@interface MicroPaymentQueue
+ (id)paymentQueue;
- (BOOL)_inAppReviewEnabled;
- (MicroPaymentQueue)init;
- (id)_beginManagedContextSession;
- (id)_clientForConnection:(id)a3 paymentQueueClient:(id)a4;
- (id)_clientForObjectID:(id)a3;
- (id)_clientForPayment:(id)a3;
- (id)_clients;
- (id)_copyDownloadsIDsFromMessage:(id)a3 key:(const char *)a4;
- (id)_firstReadyPaymentInContext:(id)a3;
- (id)_inAppReviewRequestConstants;
- (id)_newPaymentQueueClientWithMessage:(id)a3 connection:(id)a4 parameter:(const char *)a5;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)_enumerateDownloadsForIdentifiers:(id)a3 context:(id)a4 usingBlock:(id)a5;
- (void)_finishPaymentOperationForPaymentID:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)_networkTypeChanged:(id)a3;
- (void)_refreshDidFinishNotification:(id)a3;
- (void)_sendPurchaseIntentsForApp:(id)a3 storeKitClient:(id)a4 force:(BOOL)a5;
- (void)_setActivePaymentID:(id)a3;
- (void)_startFirstReadyPayment;
- (void)addInAppReviewRequestWithMessage:(id)a3 connection:(id)a4;
- (void)addPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)addPurchaseIntentWithMessage:(id)a3 connection:(id)a4;
- (void)addPurchaseIntentWithProductIdentifier:(id)a3 productName:(id)a4 appBundleId:(id)a5 appName:(id)a6;
- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)cancelRequestWithMessage:(id)a3 connection:(id)a4;
- (void)checkQueueForClientWithIdentifier:(id)a3 URLBagContext:(id)a4;
- (void)checkQueueForClientWithMessage:(id)a3 connection:(id)a4;
- (void)connectedAppEnteredForegroundWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)failDownloadsWithIdentifiers:(id)a3;
- (void)finishDownloadsWithIdentifiers:(id)a3;
- (void)finishPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)forceSandboxWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPInfoInternalWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)getTransactionsWithMessage:(id)a3 connection:(id)a4;
- (void)installSheetStateUpdatedWithMessage:(id)a3 connection:(id)a4;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 ofDownloadID:(int64_t)a4;
- (void)observeXPCServer:(id)a3;
- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)productsRequestWithMessage:(id)a3 connection:(id)a4;
- (void)registerClientWithMessage:(id)a3 connection:(id)a4;
- (void)resetInAppReviewRequestsWithMessage:(id)a3 connection:(id)a4;
- (void)restoreCompletedTransactionsWithMessage:(id)a3 connection:(id)a4;
- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4;
- (void)setPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)start;
- (void)startDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)startFirstReadyPayment;
- (void)updateDeferredPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)updateInAppReviewRequestWithMessage:(id)a3 connection:(id)a4;
- (void)updateWithPurchaseResponse:(id)a3;
@end

@implementation MicroPaymentQueue

- (MicroPaymentQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)MicroPaymentQueue;
  v2 = [(MicroPaymentQueue *)&v8 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunestored.MicroPaymentQueue", 0);
    v2->_purchaseActionsDBQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunestored.MicroPaymentQueue.PurchaseActionsDBQueue", 0);
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MicroPaymentQueueAlive", kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      uint64_t v4 = AppIntegerValue;
    }
    else {
      uint64_t v4 = -1;
    }
    v2->_aliveState = v4;
    v5 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v5 addObserver:v2 selector:"_refreshDidFinishNotification:" name:@"StoreKitClientRefreshDidFinishNotification" object:0];
    [(NSNotificationCenter *)v5 addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:@"StoreKitClientRefreshDidFinishNotification" object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  purchaseActionsDBQueue = self->_purchaseActionsDBQueue;
  if (purchaseActionsDBQueue) {
    dispatch_release(purchaseActionsDBQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)MicroPaymentQueue;
  [(MicroPaymentQueue *)&v6 dealloc];
}

+ (id)paymentQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037C88;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401C98 != -1) {
    dispatch_once(&qword_100401C98, block);
  }
  return (id)qword_100401C90;
}

- (void)addPurchaseIntentWithProductIdentifier:(id)a3 productName:(id)a4 appBundleId:(id)a5 appName:(id)a6
{
  if (!a5)
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
    if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v27 &= 2u;
    }
    if (!v27) {
      return;
    }
    int v39 = 138543618;
    uint64_t v40 = objc_opt_class();
    __int16 v41 = 2112;
    id v42 = a3;
    LODWORD(v37) = 22;
    uint64_t v28 = _os_log_send_and_compose_impl();
    if (!v28) {
      return;
    }
LABEL_32:
    v29 = (void *)v28;
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v39, v37);
    free(v29);
LABEL_54:
    SSFileLog();
    return;
  }
  id v10 = +[SSLogConfig sharedDaemonConfig];
  id v11 = v10;
  if (!a3)
  {
    if (!v10) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v31 = v30 | 2;
    }
    else {
      int v31 = v30;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v31 &= 2u;
    }
    if (!v31) {
      return;
    }
    int v39 = 138543618;
    uint64_t v40 = objc_opt_class();
    __int16 v41 = 2112;
    id v42 = a5;
    LODWORD(v37) = 22;
    uint64_t v28 = _os_log_send_and_compose_impl();
    if (!v28) {
      return;
    }
    goto LABEL_32;
  }
  if (!v10) {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    int v39 = 138544386;
    uint64_t v40 = objc_opt_class();
    __int16 v41 = 2114;
    id v42 = a3;
    __int16 v43 = 2114;
    id v44 = a4;
    __int16 v45 = 2114;
    id v46 = a5;
    __int16 v47 = 2114;
    id v48 = a6;
    LODWORD(v37) = 52;
    v36 = &v39;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v39, v37);
      free(v15);
      v36 = (int *)v16;
      SSFileLog();
    }
  }
  v17 = objc_alloc_init(PurchaseIntent);
  [(PurchaseIntent *)v17 setProductIdentifier:a3];
  [(PurchaseIntent *)v17 setProductName:a4];
  [(PurchaseIntent *)v17 setAppBundleId:a5];
  [(PurchaseIntent *)v17 setAppName:a6];
  [+[NSDate date] timeIntervalSince1970];
  [(PurchaseIntent *)v17 setTimestamp:+[NSNumber numberWithLongLong:(uint64_t)v18]];
  [+[PurchaseActionsManager sharedInstance] insertPurchaseIntent:v17];

  v38 = 0;
  [+[SpringBoardUtility sharedInstance] launchApplicationWithIdentifier:a5 options:0 error:&v38];
  v19 = v38;
  id v20 = +[SSLogConfig sharedDaemonConfig];
  id v21 = v20;
  if (v19)
  {
    if (!v20) {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = objc_msgSend(v21, "shouldLog", v36);
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (v23)
    {
      uint64_t v24 = objc_opt_class();
      int v39 = 138543874;
      uint64_t v40 = v24;
      __int16 v41 = 2114;
      id v42 = a5;
      __int16 v43 = 2114;
      id v44 = v38;
      LODWORD(v37) = 32;
LABEL_52:
      v35 = (void *)_os_log_send_and_compose_impl();
      if (!v35) {
        return;
      }
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v39, v37);
      free(v35);
      goto LABEL_54;
    }
  }
  else
  {
    if (!v20) {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = objc_msgSend(v21, "shouldLog", v36);
    if ([v21 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v33 &= 2u;
    }
    if (v33)
    {
      uint64_t v34 = objc_opt_class();
      int v39 = 138543618;
      uint64_t v40 = v34;
      __int16 v41 = 2114;
      id v42 = a5;
      LODWORD(v37) = 22;
      goto LABEL_52;
    }
  }
}

- (void)checkQueueForClientWithIdentifier:(id)a3 URLBagContext:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003831C;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = self;
  v4[6] = a3;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)failDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000386AC;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(MicroPaymentQueue *)self _dispatchAsync:v3];
}

- (void)finishDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100038D3C;
  v3[3] = &unk_1003A3380;
  v3[4] = self;
  v3[5] = a3;
  [(MicroPaymentQueue *)self _dispatchAsync:v3];
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 ofDownloadID:(int64_t)a4
{
  id v7 = [a3 objectForKey:SSDownloadExternalPropertyPercentComplete];
  id v8 = [a3 objectForKey:SSDownloadPropertyDownloadPhase];
  id v9 = [a3 objectForKey:SSDownloadExternalPropertyEstimatedTimeRemaining];
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10 || v8 != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000398B8;
    v12[3] = &unk_1003A3F90;
    v12[7] = v9;
    v12[8] = a4;
    v12[4] = self;
    v12[5] = v8;
    v12[6] = v7;
    [(MicroPaymentQueue *)self _dispatchAsync:v12];
  }
}

- (void)observeXPCServer:(id)a3
{
  [a3 addObserver:self selector:"addPaymentWithMessage:connection:" forMessage:10000];
  [a3 addObserver:self selector:"cancelDownloadsWithMessage:connection:" forMessage:10007];
  [a3 addObserver:self selector:"cancelRequestWithMessage:connection:" forMessage:10003];
  [a3 addObserver:self selector:"checkQueueForClientWithMessage:connection:" forMessage:83];
  [a3 addObserver:self selector:"connectedAppEnteredForegroundWithMessage:connection:" forMessage:10012];
  [a3 addObserver:self selector:"finishPaymentWithMessage:connection:" forMessage:10001];
  [a3 addObserver:self selector:"getTransactionsWithMessage:connection:" forMessage:10006];
  [a3 addObserver:self selector:"pauseDownloadsWithMessage:connection:" forMessage:10008];
  [a3 addObserver:self selector:"productsRequestWithMessage:connection:" forMessage:10004];
  [a3 addObserver:self selector:"registerClientWithMessage:connection:" forMessage:10005];
  [a3 addObserver:self selector:"restoreCompletedTransactionsWithMessage:connection:" forMessage:10002];
  [a3 addObserver:self selector:"resumeDownloadsWithMessage:connection:" forMessage:10009];
  [a3 addObserver:self selector:"startDownloadsWithMessage:connection:" forMessage:10010];
  [a3 addObserver:self selector:"updateDeferredPaymentWithMessage:connection:" forMessage:143];
  [a3 addObserver:self selector:"addInAppReviewRequestWithMessage:connection:" forMessage:188];
  [a3 addObserver:self selector:"updateInAppReviewRequestWithMessage:connection:" forMessage:189];
  [a3 addObserver:self selector:"resetInAppReviewRequestsWithMessage:connection:" forMessage:190];
  [a3 addObserver:self selector:"addPurchaseIntentWithMessage:connection:" forMessage:10013];
  [a3 addObserver:self selector:"getPromotedIAPOrderWithMessage:connection:" forMessage:10014];
  [a3 addObserver:self selector:"setPromotedIAPOrderWithMessage:connection:" forMessage:10015];
  [a3 addObserver:self selector:"getPromotedIAPVisibilityWithMessage:connection:" forMessage:10016];
  [a3 addObserver:self selector:"setPromotedIAPVisibilityWithMessage:connection:" forMessage:10017];
  [a3 addObserver:self selector:"getPromotedIAPInfoInternalWithMessage:connection:" forMessage:10018];
  [a3 addObserver:self selector:"installSheetStateUpdatedWithMessage:connection:" forMessage:10019];

  [a3 addObserver:self selector:"forceSandboxWithMessage:connection:" forMessage:10020];
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100039D70;
  v2[3] = &unk_1003A33A8;
  v2[4] = self;
  [(MicroPaymentQueue *)self _dispatchAsync:v2];
}

- (void)startFirstReadyPayment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100039DF0;
  v2[3] = &unk_1003A33A8;
  v2[4] = self;
  [(MicroPaymentQueue *)self _dispatchAsync:v2];
}

- (void)updateWithPurchaseResponse:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039E64;
  v3[3] = &unk_1003A3380;
  v3[4] = a3;
  v3[5] = self;
  [(MicroPaymentQueue *)self _dispatchAsync:v3];
}

- (void)addPaymentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A1AC;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)addPurchaseIntentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A358;
  v4[3] = &unk_1003A3410;
  v4[4] = a3;
  v4[5] = self;
  v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A4E0;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)cancelRequestWithMessage:(id)a3 connection:(id)a4
{
  v5 = +[StoreKitRequestQueue sharedInstance];

  [(RequestQueue *)v5 cancelOperationForConnection:a4];
}

- (void)checkQueueForClientWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v7 = (id)SSXPCDictionaryCopyCFObjectWithClass();
    id v6 = objc_msgSend(objc_alloc((Class)SSURLBagContext), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "2"));
    [(MicroPaymentQueue *)self checkQueueForClientWithIdentifier:v7 URLBagContext:v6];
  }
}

- (void)connectedAppEnteredForegroundWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A6FC;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)forceSandboxWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A930;
  v4[3] = &unk_1003A3380;
  v4[4] = a4;
  v4[5] = a3;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)finishPaymentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003AA84;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)getTransactionsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003AB6C;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)installSheetStateUpdatedWithMessage:(id)a3 connection:(id)a4
{
  if (xpc_dictionary_get_uint64(a3, "2")) {
    CFDictionaryRef v6 = sub_10010B088(a3, "1");
  }
  else {
    CFDictionaryRef v6 = 0;
  }
  [+[PurchaseActionsManager sharedInstance] setAppBundleIdForCurrentInstallSheet:v6];

  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_connection_send_message((xpc_connection_t)a4, reply);

  xpc_release(reply);
}

- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003AD88;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)productsRequestWithMessage:(id)a3 connection:(id)a4
{
  CFDictionaryRef v6 = +[StoreKitRequestQueue sharedInstance];

  [(StoreKitRequestQueue *)v6 requestProductsWithMessage:a3 connection:a4];
}

- (void)registerClientWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003AED0;
  v4[3] = &unk_1003A3410;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)restoreCompletedTransactionsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B1E0;
  v4[3] = &unk_1003A3410;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B2E4;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)startDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B3E4;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)updateDeferredPaymentWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement() & 1) != 0 || SSXPCConnectionHasEntitlement())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003B530;
    v6[3] = &unk_1003A3380;
    v6[4] = a3;
    v6[5] = self;
    [(MicroPaymentQueue *)self _dispatchAsync:v6];
  }
}

- (void)getPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BCE0;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)setPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C24C;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)getPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C8FC;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)setPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CEDC;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)getPromotedIAPInfoInternalWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D5CC;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)addInAppReviewRequestWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DB78;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = self;
  void v4[6] = a3;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (id)_inAppReviewRequestConstants
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:&off_1003C8F70 forKey:@"inAppReviewRequestLimitWindow"];
  [v2 setObject:&off_1003C8F88 forKey:@"inAppReviewRequestsPerWindow"];
  [v2 setObject:&off_1003C8F70 forKey:@"inAppReviewRequiredDaysAfterReview"];
  [v2 setObject:&__kCFBooleanTrue forKey:@"inAppReviewRequireNewVersionAfterReview"];
  id v3 = objc_msgSend(objc_alloc((Class)ISLoadURLBagOperation), "initWithBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0));
  uint64_t v4 = dispatch_semaphore_create(0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003E694;
  v6[3] = &unk_1003A3410;
  v6[4] = v3;
  v6[5] = v2;
  void v6[6] = v4;
  [v3 setCompletionBlock:v6];
  objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v3);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  return v2;
}

- (void)updateInAppReviewRequestWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E850;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  [(MicroPaymentQueue *)self _dispatchAsync:v4];
}

- (void)resetInAppReviewRequestsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement() & 1) != 0 || SSXPCConnectionHasEntitlement())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003EB30;
    v6[3] = &unk_1003A3380;
    v6[4] = a4;
    v6[5] = self;
    [(MicroPaymentQueue *)self _dispatchAsync:v6];
  }
}

- (BOOL)_inAppReviewEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyInAppReviewEnabled, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
}

- (void)_clientDisconnectNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003ED7C;
  v3[3] = &unk_1003A3380;
  uint64_t v4 = self;
  id v5 = [a3 object];
  [(MicroPaymentQueue *)v4 _dispatchAsync:v3];
}

- (void)_networkTypeChanged:(id)a3
{
  if ([+[ISNetworkObserver sharedInstance] networkType])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003F024;
    v4[3] = &unk_1003A33A8;
    v4[4] = self;
    [(MicroPaymentQueue *)self _dispatchAsync:v4];
  }
}

- (void)_refreshDidFinishNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003F108;
  v3[3] = &unk_1003A33A8;
  void v3[4] = self;
  [(MicroPaymentQueue *)self _dispatchAsync:v3];
}

- (id)_beginManagedContextSession
{
  if (!self->_clients)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003F1A4;
    v3[3] = &unk_1003A33A8;
    void v3[4] = self;
    [(id)sub_10004BA8C(0) checkIntegrityWithInitializationBlock:v3];
  }
  return +[NSThread beginManagedContextSession];
}

- (id)_clientForConnection:(id)a3 paymentQueueClient:(id)a4
{
  id v7 = [(MicroPaymentQueue *)self _clients];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      unsigned int v12 = *(StoreKitClient **)(*((void *)&v16 + 1) + 8 * v11);
      if ([(StoreKitClient *)v12 isEqualToXPCConnection:a3 paymentQueueClient:a4])
      {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v12) {
      goto LABEL_12;
    }
  }
LABEL_11:
  unsigned int v12 = objc_alloc_init(StoreKitClient);
  [(NSMutableArray *)self->_clients addObject:v12];
  int v13 = v12;
LABEL_12:
  if (a4) {
    [(StoreKitClient *)v12 setPaymentQueueClient:a4];
  }
  if (![(StoreKitClient *)v12 XPCClient])
  {
    uint64_t v14 = [[XPCClient alloc] initWithInputConnection:a3];
    [(StoreKitClient *)v12 setXPCClient:v14];
  }
  return v12;
}

- (id)_clientForObjectID:(id)a3
{
  id v5 = [(MicroPaymentQueue *)self _clients];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(StoreKitClient **)(*((void *)&v13 + 1) + 8 * v9);
      if ([(NSManagedObjectID *)[(StoreKitClient *)v10 microPaymentClientID] isEqual:a3])break; {
      if (v7 == (id)++v9)
      }
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v10) {
      return v10;
    }
  }
LABEL_11:
  uint64_t v10 = [[StoreKitClient alloc] initWithMicroPaymentClientID:a3];
  [(NSMutableArray *)self->_clients addObject:v10];
  uint64_t v11 = v10;
  return v10;
}

- (id)_clientForPayment:(id)a3
{
  id result = objc_msgSend(objc_msgSend(a3, "client"), "objectID");
  if (result)
  {
    return [(MicroPaymentQueue *)self _clientForObjectID:result];
  }
  return result;
}

- (id)_clients
{
  id result = self->_clients;
  if (!result)
  {
    self->_clients = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v4 = [(MicroPaymentQueue *)self _beginManagedContextSession];
    id v5 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v5, "setEntity:", +[MicroPaymentClient entityForContext:](MicroPaymentClient, "entityForContext:", v4));
    v75 = 0;
    v59 = v4;
    v57 = v5;
    id v6 = &syslog_ptr;
    id obj = [v4 executeFetchRequest:v5 error:&v75];
    if (obj)
    {
      CFStringRef v7 = (const __CFString *)kSSUserDefaultsIdentifier;
      if (!CFPreferencesGetAppBooleanValue(@"MicroPaymentQueueCleanupClients", kSSUserDefaultsIdentifier, 0))
      {
        CFStringRef applicationID = v7;
        id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(obj, "count"));
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v61 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
        if (v61)
        {
          uint64_t v60 = *(void *)v72;
          id v58 = v8;
          do
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(void *)v72 != v60) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              unsigned int v11 = objc_msgSend(objc_msgSend(v10, "usesIdentityAttributes"), "BOOLValue");
              id v12 = objc_alloc((Class)NSArray);
              id v13 = [v10 identifier];
              if (v11) {
                id v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_msgSend(v10, "bundleVersion"), objc_msgSend(v10, "storeIdentifier"), objc_msgSend(v10, "storeVersion"), objc_msgSend(v10, "sandboxed"), 0);
              }
              else {
                id v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_msgSend(v10, "sandboxed"), 0, v53, v54, v55);
              }
              long long v15 = v14;
              long long v16 = [[ArrayHash alloc] initWithArray:v14];

              id v17 = [v8 objectForKey:v16];
              if (v17)
              {
                id v18 = v17;
                id v19 = [v6[405] sharedDaemonConfig];
                if (!v19) {
                  id v19 = [v6[405] sharedConfig];
                }
                id v20 = v6;
                unsigned int v21 = [v19 shouldLog];
                if ([v19 shouldLogToDisk]) {
                  v21 |= 2u;
                }
                if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                  v21 &= 2u;
                }
                if (v21)
                {
                  uint64_t v22 = objc_opt_class();
                  int v78 = 138412802;
                  uint64_t v79 = v22;
                  __int16 v80 = 2112;
                  id v81 = v10;
                  __int16 v82 = 2112;
                  id v83 = v18;
                  LODWORD(v52) = 32;
                  v51 = &v78;
                  uint64_t v23 = _os_log_send_and_compose_impl();
                  if (v23)
                  {
                    uint64_t v24 = (void *)v23;
                    id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v78, v52);
                    free(v24);
                    v51 = (int *)v25;
                    SSFileLog();
                  }
                }
                id v26 = objc_msgSend(objc_msgSend(v10, "payments", v51), "copy");
                long long v67 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id v27 = [v26 countByEnumeratingWithState:&v67 objects:v77 count:16];
                if (v27)
                {
                  id v28 = v27;
                  uint64_t v29 = *(void *)v68;
                  do
                  {
                    for (j = 0; j != v28; j = (char *)j + 1)
                    {
                      if (*(void *)v68 != v29) {
                        objc_enumerationMutation(v26);
                      }
                      [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) setClient:v18];
                    }
                    id v28 = [v26 countByEnumeratingWithState:&v67 objects:v77 count:16];
                  }
                  while (v28);
                }
                [v59 deleteObject:v10];

                id v6 = v20;
                id v8 = v58;
              }
              else
              {
                [v8 setObject:v10 forKey:v16];
              }
            }
            id v61 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
          }
          while (v61);
        }
        sub_10004BBA0(v59);
        id obj = [v8 allValues];

        CFPreferencesSetAppValue(@"MicroPaymentQueueCleanupClients", +[NSNumber numberWithBool:1], applicationID);
        CFPreferencesAppSynchronize(kITunesStoreDaemonDefaultsID);
      }
      id v31 = [v6[405] sharedDaemonConfig];
      if (!v31) {
        id v31 = [v6[405] sharedConfig];
      }
      unsigned int v32 = [v31 shouldLog];
      if ([v31 shouldLogToDisk]) {
        int v33 = v32 | 2;
      }
      else {
        int v33 = v32;
      }
      if (os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_INFO)) {
        int v34 = v33;
      }
      else {
        int v34 = v33 & 2;
      }
      if (v34)
      {
        uint64_t v35 = objc_opt_class();
        id v36 = [obj count];
        int v78 = 138412546;
        uint64_t v79 = v35;
        __int16 v80 = 2048;
        id v81 = v36;
        LODWORD(v52) = 22;
        v51 = &v78;
        uint64_t v37 = _os_log_send_and_compose_impl();
        if (v37)
        {
          v38 = (void *)v37;
          int v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v78, v52);
          free(v38);
          v51 = (int *)v39;
          SSFileLog();
        }
      }
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16, v51);
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v64;
        do
        {
          for (k = 0; k != v41; k = (char *)k + 1)
          {
            if (*(void *)v64 != v42) {
              objc_enumerationMutation(obj);
            }
            id v44 = -[StoreKitClient initWithMicroPaymentClientID:]([StoreKitClient alloc], "initWithMicroPaymentClientID:", [*(id *)(*((void *)&v63 + 1) + 8 * (void)k) objectID]);
            [(NSMutableArray *)self->_clients addObject:v44];
          }
          id v41 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
        }
        while (v41);
      }
    }
    else
    {
      id v45 = +[SSLogConfig sharedDaemonConfig];
      if (!v45) {
        id v45 = +[SSLogConfig sharedConfig];
      }
      unsigned int v46 = [v45 shouldLog];
      if ([v45 shouldLogToDisk]) {
        int v47 = v46 | 2;
      }
      else {
        int v47 = v46;
      }
      if (!os_log_type_enabled((os_log_t)[v45 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v47 &= 2u;
      }
      if (v47)
      {
        uint64_t v48 = objc_opt_class();
        int v78 = 138412546;
        uint64_t v79 = v48;
        __int16 v80 = 2112;
        id v81 = v75;
        LODWORD(v52) = 22;
        uint64_t v49 = _os_log_send_and_compose_impl();
        if (v49)
        {
          v50 = (void *)v49;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v78, v52);
          free(v50);
          SSFileLog();
        }
      }
    }

    +[NSThread endManagedContextSession];
    return self->_clients;
  }
  return result;
}

- (id)_copyDownloadsIDsFromMessage:(id)a3 key:(const char *)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  xpc_object_t value = xpc_dictionary_get_value(a3, a4);
  if (value)
  {
    id v8 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_array)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_10003FDE4;
      applier[3] = &unk_1003A40A8;
      applier[4] = v6;
      xpc_array_apply(v8, applier);
    }
  }
  return v6;
}

- (void)_dispatchAsync:(id)a3
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.MicroPaymentQueue");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FEFC;
  block[3] = &unk_1003A40D0;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_enumerateDownloadsForIdentifiers:(id)a3 context:(id)a4 usingBlock:(id)a5
{
  id v18 = +[MicroPaymentDownload downloadEntityFromContext:a4];
  id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"downloadID", @"payment", 0);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)NSFetchRequest);
        [v14 setEntity:v18];
        [v14 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"downloadID=%@", v12)];
        [v14 setPropertiesToFetch:v7];
        id v15 = [a4 executeFetchRequest:v14 error:0];
        id v16 = [v15 count];
        id v17 = 0;
        if (v16 == (id)1) {
          id v17 = [v15 objectAtIndex:0];
        }
        (*((void (**)(id, uint64_t, id))a5 + 2))(a5, v12, v17);
      }
      id v9 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)_finishPaymentOperationForPaymentID:(id)a3 result:(BOOL)a4 error:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100040194;
  v5[3] = &unk_1003A40F8;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v5, a4, a5);
}

- (id)_firstReadyPaymentInContext:(id)a3
{
  id v4 = [(MicroPaymentQueue *)self _clients];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) firstReadyPaymentID];
        if (v9) {
          return [a3 objectWithID:v9];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)_newPaymentQueueClientWithMessage:(id)a3 connection:(id)a4 parameter:(const char *)a5
{
  if ((SSXPCConnectionHasEntitlement() & 1) == 0 && !SSXPCConnectionHasEntitlement()) {
    return 0;
  }
  id v7 = objc_alloc((Class)sub_100174E00());
  xpc_object_t value = xpc_dictionary_get_value(a3, a5);

  return [v7 initWithXPCEncoding:value];
}

- (void)_sendPurchaseIntentsForApp:(id)a3 storeKitClient:(id)a4 force:(BOOL)a5
{
  id v8 = dispatch_semaphore_create(0);
  dispatch_retain(v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004049C;
  v10[3] = &unk_1003A4120;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = v8;
  v10[7] = a4;
  [+[PurchaseActionsManager sharedInstance] getPurchaseIntentsForApp:a3 completionHandler:v10];
  dispatch_time_t v9 = dispatch_time(0, 90000000000);
  dispatch_semaphore_wait(v8, v9);
  dispatch_release(v8);
}

- (void)_setActivePaymentID:(id)a3
{
  activePaymentID = self->_activePaymentID;
  if (activePaymentID != a3)
  {
    if (!activePaymentID)
    {
      objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.MicroPaymentQueue");
      activePaymentID = self->_activePaymentID;
    }

    id v6 = (NSManagedObjectID *)a3;
    self->_activePaymentID = v6;
    if (!v6)
    {
      id v7 = +[Daemon daemon];
      [v7 releaseKeepAliveAssertion:@"com.apple.itunesstored.MicroPaymentQueue"];
    }
  }
}

- (void)_startFirstReadyPayment
{
  activePaymentID = self->_activePaymentID;
  if (!activePaymentID)
  {
    id v4 = [(MicroPaymentQueue *)self _firstReadyPaymentInContext:[(MicroPaymentQueue *)self _beginManagedContextSession]];
    if (v4)
    {
      id v5 = v4;
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
        int v19 = 138412546;
        uint64_t v20 = objc_opt_class();
        __int16 v21 = 2112;
        long long v22 = v5;
        LODWORD(v17) = 22;
        id v16 = &v19;
        uint64_t v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          long long v10 = (void *)v9;
          long long v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v19, v17);
          free(v10);
          id v16 = (int *)v11;
          SSFileLog();
        }
      }
      id v12 = objc_msgSend(v5, "objectID", v16);
      [(MicroPaymentQueue *)self _setActivePaymentID:v12];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100040B68;
      v18[3] = &unk_1003A4148;
      v18[4] = +[SSWeakReference weakReferenceWithObject:self];
      v18[5] = v12;
      objc_msgSend(-[MicroPaymentQueue _clientForPayment:](self, "_clientForPayment:", v5), "startPaymentWithObjectID:withCompletionBlock:", v12, v18);
    }
    +[NSThread endManagedContextSession];
    activePaymentID = self->_activePaymentID;
  }
  int64_t v13 = activePaymentID != 0;
  if (self->_aliveState != v13)
  {
    id v14 = [objc_alloc((Class)NSNumber) initWithInteger:v13];
    self->_aliveState = v13;
    CFStringRef v15 = (const __CFString *)kSSUserDefaultsIdentifier;
    CFPreferencesSetAppValue(@"MicroPaymentQueueAlive", v14, kSSUserDefaultsIdentifier);
    CFPreferencesAppSynchronize(v15);
  }
}

@end