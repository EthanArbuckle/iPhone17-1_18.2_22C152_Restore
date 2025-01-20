@interface MZKeyValueStoreController
- (BOOL)AMSURLSession:(id)a3 shouldHandleAuthenticationForAccount:(id)a4 dialogDictionary:(id)a5;
- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5;
- (BOOL)_authenticationCanProcessTransaction:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_clampsCanScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4;
- (BOOL)_isEnabledForTransaction:(id)a3 error:(id *)a4;
- (BOOL)_isTransactionValid:(id)a3 error:(id *)a4;
- (BOOL)canRequestStoreSignIn;
- (BOOL)enabled;
- (BOOL)isEnabled;
- (BOOL)isIdle;
- (BOOL)isResolvingError;
- (IMURLRequestService)urlRequestService;
- (MZKeyValueStoreAuthenticationController)authenticationController;
- (MZKeyValueStoreController)initWithDomain:(id)a3 baseURLForGETAll:(id)a4 baseURLForPUTAll:(id)a5;
- (MZKeyValueStoreControllerDelegate)delegate;
- (MZKeyValueStoreDeserializer)currentDeserializer;
- (MZKeyValueStoreTransaction)currentTransaction;
- (MZTaskAssertion)backgroundTaskAssertion;
- (NSMutableArray)pendingTransactions;
- (NSString)defaultDomain;
- (NSURL)defaultGetURL;
- (NSURL)defaultSetURL;
- (OS_dispatch_queue)dispatchQueue;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)_requestForTransaction:(id)a3;
- (id)_scheduleTransactionWithType:(int)a3 sinceDomainVersion:(id)a4 URL:(id)a5 keys:(id)a6 processor:(id)a7;
- (id)clampsController;
- (id)scheduleApnSubscriptionTransactionWithPushSubscriptionRequest:(id)a3;
- (id)scheduleGetAllTransactionWithSinceDomainVersion:(id)a3 processor:(id)a4;
- (id)scheduleGetTransactionWithKeys:(id)a3 processor:(id)a4;
- (id)scheduleSetTransactionWithKeys:(id)a3 processor:(id)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)_addPendingTransaction:(id)a3;
- (void)_beginBackgroundTask;
- (void)_cancelAllPendingTransactions:(id)a3;
- (void)_cancelTransaction:(id)a3 error:(id)a4;
- (void)_currentTransactionDidFinish;
- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4;
- (void)_delegateTransactionDidFinish:(id)a3;
- (void)_endBackgroundTask;
- (void)_enqueueStoreRequest:(id)a3 withUrlRequest:(id)a4;
- (void)_errorResolutionCancel:(id)a3 transaction:(id)a4;
- (void)_errorResolutionDefault:(id)a3 transaction:(id)a4;
- (void)_errorResolutionRetry:(id)a3 transaction:(id)a4;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_processCurrentTransaction;
- (void)_processOperationOutput:(id)a3 forRequest:(id)a4;
- (void)_processPendingTransactions;
- (void)_resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5;
- (void)_scheduleTransaction:(id)a3;
- (void)_transactionDidCancel:(id)a3 withError:(id)a4;
- (void)_transactionDidFail:(id)a3 withError:(id)a4;
- (void)cancelAllTransactions;
- (void)cancelAllTransactionsCancelCode:(int64_t)a3;
- (void)cancelScheduledTransaction:(id)a3;
- (void)dealloc;
- (void)deserializeOperationDidFinish:(id)a3 shouldReschedule:(BOOL)a4;
- (void)keyValueStoreOperation:(id)a3 scheduleURLRequest:(id)a4;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)reset;
- (void)resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5;
- (void)scheduleTransaction:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setBackgroundTaskAssertion:(id)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setCurrentDeserializer:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDefaultDomain:(id)a3;
- (void)setDefaultGetURL:(id)a3;
- (void)setDefaultSetURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setResolvingError:(BOOL)a3;
- (void)setUrlRequestService:(id)a3;
@end

@implementation MZKeyValueStoreController

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v5 = [(MZKeyValueStoreController *)self dispatchQueue];
  dispatch_async(v5, v4);
}

- (MZKeyValueStoreController)initWithDomain:(id)a3 baseURLForGETAll:(id)a4 baseURLForPUTAll:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MZKeyValueStoreController;
  v12 = [(MZKeyValueStoreController *)&v28 init];
  v13 = v12;
  if (v12)
  {
    v12->_enabled = 1;
    v12->_canRequestStoreSignIn = 1;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MZKeyValueStoreController", 0);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v14;

    v16 = (IMURLRequestService *)[objc_alloc((Class)IMURLRequestService) initWithConcurrentOperationCount:1 requestEncodingType:0];
    urlRequestService = v13->_urlRequestService;
    v13->_urlRequestService = v16;

    [(IMURLRequestService *)v13->_urlRequestService setUrlSessionDelegate:v13];
    [(IMURLRequestService *)v13->_urlRequestService setPersonalizeRequests:1];
    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingTransactions = v13->_pendingTransactions;
    v13->_pendingTransactions = v18;

    v20 = objc_alloc_init(MZKeyValueStoreAuthenticationController);
    authenticationController = v13->_authenticationController;
    v13->_authenticationController = v20;

    v22 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v13->_cloudSyncBugReporter;
    v13->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v22;

    objc_storeStrong((id *)&v13->_defaultDomain, a3);
    objc_storeStrong((id *)&v13->_defaultGetURL, a4);
    objc_storeStrong((id *)&v13->_defaultSetURL, a5);
    v24 = +[NSNotificationCenter defaultCenter];
    uint64_t v25 = IMNetworkTypeChangedNotification;
    v26 = +[IMNetworkObserver sharedInstance];
    [v24 addObserver:v13 selector:"_networkTypeChangedNotification:" name:v25 object:v26];
  }
  return v13;
}

- (void)setDelegate:(id)a3
{
}

- (void)reset
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006924;
  v2[3] = &unk_10054D570;
  v2[4] = self;
  [(MZKeyValueStoreController *)self performBlock:v2];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)clampsController
{
  return +[MZKeyValueStoreClampsController sharedClampsController];
}

- (void)dealloc
{
  [(MZKeyValueStoreController *)self _endBackgroundTask];
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = IMNetworkTypeChangedNotification;
  v5 = +[IMNetworkObserver sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)MZKeyValueStoreController;
  [(MZKeyValueStoreController *)&v6 dealloc];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDefaultDomain:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_defaultDomain, "isEqualToString:"))
  {
    uint64_t v4 = (NSString *)[v6 copy];
    defaultDomain = self->_defaultDomain;
    self->_defaultDomain = v4;

    [(MZKeyValueStoreController *)self reset];
  }
}

- (void)setDefaultGetURL:(id)a3
{
  id v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultGetURL, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = (NSURL *)[v6 copy];
    defaultGetURL = self->_defaultGetURL;
    self->_defaultGetURL = v4;

    [(MZKeyValueStoreController *)self reset];
  }
}

- (void)setDefaultSetURL:(id)a3
{
  id v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultSetURL, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = (NSURL *)[v6 copy];
    defaultSetURL = self->_defaultSetURL;
    self->_defaultSetURL = v4;

    [(MZKeyValueStoreController *)self reset];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000A6DE8;
    v3[3] = &unk_10054D570;
    v3[4] = self;
    [(MZKeyValueStoreController *)self performBlock:v3];
  }
}

- (void)_networkTypeChangedNotification:(id)a3
{
  uint64_t v4 = [(MZKeyValueStoreController *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6FAC;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)scheduleGetAllTransactionWithSinceDomainVersion:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MZKeyValueStoreController *)self defaultGetURL];
  id v9 = [(MZKeyValueStoreController *)self _scheduleTransactionWithType:1 sinceDomainVersion:v7 URL:v8 keys:0 processor:v6];

  return v9;
}

- (id)scheduleGetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MZKeyValueStoreController *)self defaultGetURL];
  id v9 = [(MZKeyValueStoreController *)self _scheduleTransactionWithType:1 sinceDomainVersion:0 URL:v8 keys:v7 processor:v6];

  return v9;
}

- (id)scheduleSetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MZKeyValueStoreController *)self defaultSetURL];
  id v9 = [(MZKeyValueStoreController *)self _scheduleTransactionWithType:2 sinceDomainVersion:0 URL:v8 keys:v7 processor:v6];

  return v9;
}

- (void)scheduleTransaction:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unsigned int v5 = [(MZKeyValueStoreController *)self _delegateShouldScheduleTransaction:v4 error:&v11];
  id v6 = v11;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A7324;
    v9[3] = &unk_10054D9B0;
    v9[4] = self;
    id v10 = v4;
    [(MZKeyValueStoreController *)self performBlock:v9];
  }
  else
  {
    id v7 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [(MZKeyValueStoreController *)self currentTransaction];
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ Did not schedule transaction - %@", buf, 0x16u);
    }
    [(MZKeyValueStoreController *)self _transactionDidFail:v4 withError:v6];
  }
}

- (void)cancelScheduledTransaction:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A73C4;
  v4[3] = &unk_10054D9B0;
  unsigned int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MZKeyValueStoreController *)v5 performBlock:v4];
}

- (void)cancelAllTransactions
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000A7498;
  v2[3] = &unk_10054D570;
  v2[4] = self;
  [(MZKeyValueStoreController *)self performBlock:v2];
}

- (void)cancelAllTransactionsCancelCode:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A75D0;
  v3[3] = &unk_10054EB68;
  v3[4] = self;
  void v3[5] = a3;
  [(MZKeyValueStoreController *)self performBlock:v3];
}

- (void)resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A7768;
  v9[3] = &unk_10054FBB0;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  int v13 = a5;
  id v7 = v12;
  id v8 = v11;
  [(MZKeyValueStoreController *)v10 performBlock:v9];
}

- (BOOL)isIdle
{
  id v3 = [(MZKeyValueStoreController *)self pendingTransactions];
  objc_sync_enter(v3);
  id v4 = [(MZKeyValueStoreController *)self currentTransaction];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(MZKeyValueStoreController *)self pendingTransactions];
    BOOL v5 = [v6 count] == 0;
  }
  objc_sync_exit(v3);

  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MZKeyValueStoreController *)self dispatchQueue];
  dispatch_sync(v5, v4);
}

- (void)_cancelAllPendingTransactions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MZKeyValueStoreController *)self pendingTransactions];
  objc_sync_enter(v5);
  id v6 = [(MZKeyValueStoreController *)self pendingTransactions];
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        id v13 = [v4 copy:v17];
        __int16 v14 = [v12 description];
        [v13 setTransactionDescription:v14];

        [(MZKeyValueStoreController *)self _cancelTransaction:v12 error:v13];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [(MZKeyValueStoreController *)self pendingTransactions];
  objc_sync_enter(v15);
  v16 = [(MZKeyValueStoreController *)self pendingTransactions];
  [v16 removeAllObjects];

  objc_sync_exit(v15);
}

- (void)_cancelTransaction:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = [(MZKeyValueStoreController *)self currentTransaction];

    if (!v6)
    {
      id v6 = +[MZKeyValueStoreError transactionCancelledErrorWithTransaction:0 underlyingError:0];
    }
    id v8 = [v11 description];
    [v6 setTransactionDescription:v8];

    if (v7 == v11)
    {
      [(IMURLRequestService *)self->_urlRequestService cancelAllRequests];
      [(MZKeyValueStoreController *)self setCurrentTransaction:0];
    }
    if ([(MZKeyValueStoreController *)self isResolvingError]) {
      [(MZKeyValueStoreController *)self _transactionDidCancel:v11 withError:v6];
    }
    else {
      [(MZKeyValueStoreController *)self _transactionDidFail:v11 withError:v6];
    }
    id v9 = [(MZKeyValueStoreController *)self pendingTransactions];
    objc_sync_enter(v9);
    uint64_t v10 = [(MZKeyValueStoreController *)self pendingTransactions];
    [v10 removeObject:v11];

    objc_sync_exit(v9);
    [(MZKeyValueStoreController *)self _processPendingTransactions];
  }
}

- (void)_processPendingTransactions
{
  id v3 = [(MZKeyValueStoreController *)self currentTransaction];

  if (!v3)
  {
    id v4 = [(MZKeyValueStoreController *)self pendingTransactions];
    objc_sync_enter(v4);
    BOOL v5 = [(MZKeyValueStoreController *)self pendingTransactions];
    id v6 = [v5 firstObject];

    if (v6)
    {
      [(MZKeyValueStoreController *)self setCurrentTransaction:v6];

      objc_sync_exit(v4);
      [(MZKeyValueStoreController *)self _processCurrentTransaction];
    }
    else
    {
      objc_sync_exit(v4);

      [(MZKeyValueStoreController *)self _endBackgroundTask];
    }
  }
}

- (void)_processCurrentTransaction
{
  id v3 = [(MZKeyValueStoreController *)self currentTransaction];
  id v13 = 0;
  unsigned int v4 = [(MZKeyValueStoreController *)self _authenticationCanProcessTransaction:v3 error:&v13];
  id v5 = v13;

  id v6 = _MTLogCategoryCloudSync();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MZKeyValueStoreController *)self currentTransaction];
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Processing transaction", buf, 0xCu);
    }
    id v9 = [(MZKeyValueStoreController *)self currentTransaction];
    uint64_t v10 = [(MZKeyValueStoreController *)self _requestForTransaction:v9];

    [(MZKeyValueStoreController *)self _beginBackgroundTask];
    [v10 start];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(MZKeyValueStoreController *)self currentTransaction];
      *(_DWORD *)buf = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ Authentication cannot process transaction - %@", buf, 0x16u);
    }
    id v12 = [(MZKeyValueStoreController *)self clampsController];
    [v12 setDSIDCheckTimestamp];

    uint64_t v10 = [(MZKeyValueStoreController *)self currentTransaction];
    [(MZKeyValueStoreController *)self _transactionDidFail:v10 withError:v5];
  }
}

- (id)_requestForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MZKeyValueStoreRequest);
  [(MZKeyValueStoreRequest *)v5 setTransaction:v4];

  [(MZKeyValueStoreRequest *)v5 setDelegate:self];
  id v6 = [(MZKeyValueStoreController *)self authenticationController];
  -[MZKeyValueStoreRequest setShouldAuthenticate:](v5, "setShouldAuthenticate:", [v6 shouldAuthenticate]);

  id v7 = [(MZKeyValueStoreController *)self authenticationController];
  id v8 = [v7 DSID];
  [(MZKeyValueStoreRequest *)v5 setDSID:v8];

  return v5;
}

- (void)_scheduleTransaction:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  unsigned int v5 = [(MZKeyValueStoreController *)self _canScheduleTransaction:v4 error:&v9];
  id v6 = v9;
  id v7 = _MTLogCategoryCloudSync();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Scheduling transaction", buf, 0xCu);
    }

    [(MZKeyValueStoreController *)self _addPendingTransaction:v4];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ Did not schedule transaction - %@", buf, 0x16u);
    }

    [(MZKeyValueStoreController *)self _transactionDidFail:v4 withError:v6];
  }
}

- (void)_addPendingTransaction:(id)a3
{
  id v7 = a3;
  id v4 = [(MZKeyValueStoreController *)self pendingTransactions];
  objc_sync_enter(v4);
  unsigned int v5 = [(MZKeyValueStoreController *)self clampsController];
  [v5 setTimestampForTransaction:v7];

  id v6 = [(MZKeyValueStoreController *)self pendingTransactions];
  [v6 addObject:v7];

  objc_sync_exit(v4);
  [(MZKeyValueStoreController *)self _processPendingTransactions];
}

- (BOOL)_canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MZKeyValueStoreController *)self _isEnabledForTransaction:v6 error:a4]
    && [(MZKeyValueStoreController *)self _isTransactionValid:v6 error:a4])
  {
    BOOL v7 = [(MZKeyValueStoreController *)self _clampsCanScheduleTransaction:v6 error:a4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isEnabledForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(MZKeyValueStoreController *)self isEnabled];
  BOOL v8 = v7;
  if (a4 && (v7 & 1) == 0)
  {
    *a4 = +[MZKeyValueStoreError keyValueStoreDisabledErrorWithTransaction:v6 underlyingError:0];
  }

  return v8;
}

- (BOOL)_isTransactionValid:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 URL];

  if (!v6)
  {
    if (a4)
    {
      id v9 = +[MZKeyValueStoreError transactionMissingURLErrorWithTransaction:v5 underlyingError:0];
LABEL_8:
      BOOL v8 = 0;
      *a4 = v9;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v7 = [v5 domain];

  if (!v7)
  {
    if (a4)
    {
      id v9 = +[MZKeyValueStoreError transactionMissingDomainErrorWithTransaction:v5 underlyingError:0];
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_clampsCanScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(MZKeyValueStoreController *)self clampsController];
  LOBYTE(a4) = [v7 canScheduleTransaction:v6 error:a4];

  return (char)a4;
}

- (BOOL)_authenticationCanProcessTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(MZKeyValueStoreController *)self clampsController];
  unsigned __int8 v8 = [v7 hasUserRecentlyAcceptedSync];

  if ((v8 & 1) != 0
    || ([(MZKeyValueStoreController *)self authenticationController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isAuthenticationValidForTransaction:v6 error:a4],
        v9,
        v10))
  {
    id v11 = [(MZKeyValueStoreController *)self authenticationController];
    if ([v11 shouldAuthenticate])
    {
      __int16 v12 = [(MZKeyValueStoreController *)self clampsController];
      unsigned __int8 v13 = [v12 hasAuthenticatedTooRecentlyForTransaction:v6 error:a4];

      char v14 = v13 ^ 1;
    }
    else
    {

      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)_scheduleTransactionWithType:(int)a3 sinceDomainVersion:(id)a4 URL:(id)a5 keys:(id)a6 processor:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  __int16 v16 = [MZKeyValueStoreTransaction alloc];
  id v17 = [(MZKeyValueStoreController *)self defaultDomain];
  long long v18 = [(MZKeyValueStoreTransaction *)v16 initWithType:v10 domain:v17 URL:v14 keys:v13];

  [(MZKeyValueStoreTransaction *)v18 setSinceDomainVersion:v15];
  [(MZKeyValueStoreTransaction *)v18 setProcessor:v12];

  [(MZKeyValueStoreController *)self scheduleTransaction:v18];

  return v18;
}

- (void)_currentTransactionDidFinish
{
  id v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MZKeyValueStoreController *)self currentTransaction];
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transaction did finish %@", (uint8_t *)&v9, 0xCu);
  }
  [(MZKeyValueStoreController *)self _endBackgroundTask];
  id v5 = [(MZKeyValueStoreController *)self currentTransaction];
  [(MZKeyValueStoreController *)self _delegateTransactionDidFinish:v5];

  id v6 = [(MZKeyValueStoreController *)self pendingTransactions];
  objc_sync_enter(v6);
  unsigned __int8 v7 = [(MZKeyValueStoreController *)self pendingTransactions];
  unsigned __int8 v8 = [(MZKeyValueStoreController *)self currentTransaction];
  [v7 removeObject:v8];

  [(MZKeyValueStoreController *)self setCurrentTransaction:0];
  objc_sync_exit(v6);

  [(MZKeyValueStoreController *)self _processPendingTransactions];
}

- (void)_transactionDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MZKeyValueStoreController *)self currentTransaction];
  if (v8)
  {
    int v9 = (void *)v8;
    id v10 = [(MZKeyValueStoreController *)self currentTransaction];

    if (v10 == v6) {
      [(MZKeyValueStoreController *)self _endBackgroundTask];
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8848;
  block[3] = &unk_10054E708;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_transactionDidCancel:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MZKeyValueStoreController *)self currentTransaction];
  if (v8)
  {
    int v9 = (void *)v8;
    id v10 = [(MZKeyValueStoreController *)self currentTransaction];

    if (v10 == v6) {
      [(MZKeyValueStoreController *)self _endBackgroundTask];
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A89AC;
  block[3] = &unk_10054E708;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_processOperationOutput:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 DSID];
  int v9 = [(MZKeyValueStoreController *)self authenticationController];
  id v10 = [v9 DSID];

  if ([v10 isEqualToString:v8])
  {
    id v11 = [(MZKeyValueStoreController *)self currentTransaction];
    if (v11 && [(MZKeyValueStoreController *)self isEnabled])
    {
      id v12 = [v7 transaction];
      if (v12 != v11)
      {
        _MTLogCategoryCloudSync();
        id v13 = (MZKeyValueStoreDeserializer *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v12;
          __int16 v51 = 2112;
          v52 = v11;
          _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_ERROR, "Ignoring BK response for transaction %@ while current transaction is %@", buf, 0x16u);
        }
        goto LABEL_41;
      }
      id v13 = [[MZKeyValueStoreDeserializer alloc] initWithTransaction:v11 response:v6];
      [(MZKeyValueStoreDeserializer *)v13 setDelegate:self];
      if ([(MZKeyValueStoreDeserializer *)v13 success]
        || [(MZKeyValueStoreDeserializer *)v13 versionMismatch])
      {
        id v14 = [(MZKeyValueStoreController *)self authenticationController];
        [v14 resetAcceptedCredentials];

        id v15 = [(MZKeyValueStoreController *)self authenticationController];
        [v15 setShouldAuthenticate:0];

        [(MZKeyValueStoreController *)self setCurrentDeserializer:v13];
        [(MZKeyValueStoreDeserializer *)v13 deserialize];
LABEL_41:

        goto LABEL_42;
      }
      if ([(MZKeyValueStoreDeserializer *)v13 hasBackoff])
      {
        __int16 v16 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = [(MZKeyValueStoreController *)self currentTransaction];
          v42 = [(MZKeyValueStoreDeserializer *)v13 requestError];
          *(_DWORD *)buf = 138412546;
          v50 = v17;
          __int16 v51 = 2112;
          v52 = v42;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ Deserializer has backoff - %@", buf, 0x16u);
        }
        long long v18 = [(MZKeyValueStoreController *)self clampsController];
        [v18 backOffForTimeInterval:-[MZKeyValueStoreDeserializer retrySeconds](v13, "retrySeconds")];

        double v19 = (double)[(MZKeyValueStoreDeserializer *)v13 retrySeconds];
        long long v20 = [(MZKeyValueStoreDeserializer *)v13 requestError];
        uint64_t v21 = +[MZKeyValueStoreError serverClampErrorWithTransaction:v11 retrySeconds:v20 underlyingError:v19];
      }
      else
      {
        if (![(MZKeyValueStoreDeserializer *)v13 unsupportedClient])
        {
          if ([(MZKeyValueStoreDeserializer *)v13 genericError])
          {
            v26 = _MTLogCategoryCloudSync();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = [(MZKeyValueStoreController *)self currentTransaction];
              v44 = [(MZKeyValueStoreDeserializer *)v13 requestError];
              *(_DWORD *)buf = 138412546;
              v50 = v27;
              __int16 v51 = 2112;
              v52 = v44;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@ Got generic deserializer error - %@", buf, 0x16u);
            }
            long long v20 = [(MZKeyValueStoreDeserializer *)v13 requestError];
            uint64_t v28 = +[MZKeyValueStoreError storeGenericErrorWithTransaction:v11 underlyingError:v20];
          }
          else if ([(MZKeyValueStoreDeserializer *)v13 validationError])
          {
            v29 = _MTLogCategoryCloudSync();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = [(MZKeyValueStoreController *)self currentTransaction];
              v45 = [(MZKeyValueStoreDeserializer *)v13 requestError];
              *(_DWORD *)buf = 138412546;
              v50 = v30;
              __int16 v51 = 2112;
              v52 = v45;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ Got validation error - %@", buf, 0x16u);
            }
            long long v20 = [(MZKeyValueStoreDeserializer *)v13 requestError];
            uint64_t v28 = +[MZKeyValueStoreError storeValidationErrorWithTransaction:v11 underlyingError:v20];
          }
          else
          {
            if ([(MZKeyValueStoreDeserializer *)v13 authenticationError])
            {
              if ([(MZKeyValueStoreController *)self canRequestStoreSignIn])
              {
                v31 = [(MZKeyValueStoreController *)self authenticationController];
                unsigned __int8 v32 = [v31 shouldAuthenticate];

                if ((v32 & 1) == 0)
                {
                  v39 = [(MZKeyValueStoreController *)self clampsController];
                  [v39 clearAuthenticationRequest];

                  v40 = [(MZKeyValueStoreController *)self authenticationController];
                  [v40 setShouldAuthenticate:1];

                  [(MZKeyValueStoreController *)self _processCurrentTransaction];
                  goto LABEL_41;
                }
              }
              v33 = _MTLogCategoryCloudSync();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = [(MZKeyValueStoreController *)self currentTransaction];
                v46 = [(MZKeyValueStoreDeserializer *)v13 requestError];
                *(_DWORD *)buf = 138412546;
                v50 = v34;
                __int16 v51 = 2112;
                v52 = v46;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@ Got authentication error - %@", buf, 0x16u);
              }
              v35 = [(MZKeyValueStoreDeserializer *)v13 requestError];
              uint64_t v47 = +[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:v11 underlyingError:v35];

              v41 = [(MZKeyValueStoreController *)self cloudSyncBugReporter];
              v36 = [(MZKeyValueStoreController *)self currentTransaction];
              long long v20 = (void *)v47;
              [v41 reportSyncAuthenticationErrorFor:v36 error:v47];

              [(MZKeyValueStoreController *)self _transactionDidFail:v11 withError:v47];
              goto LABEL_40;
            }
            v37 = _MTLogCategoryCloudSync();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v38 = [(MZKeyValueStoreController *)self currentTransaction];
              v48 = [(MZKeyValueStoreDeserializer *)v13 requestError];
              *(_DWORD *)buf = 138412546;
              v50 = v38;
              __int16 v51 = 2112;
              v52 = v48;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@ Got unknown error - %@", buf, 0x16u);
            }
            long long v20 = [(MZKeyValueStoreDeserializer *)v13 requestError];
            uint64_t v28 = +[MZKeyValueStoreError unknownErrorWithTransaction:v11 underlyingError:v20];
          }
          uint64_t v25 = (void *)v28;
          [(MZKeyValueStoreController *)self _transactionDidFail:v11 withError:v28];
LABEL_39:

LABEL_40:
          goto LABEL_41;
        }
        v22 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = [(MZKeyValueStoreController *)self currentTransaction];
          v43 = [(MZKeyValueStoreDeserializer *)v13 requestError];
          *(_DWORD *)buf = 138412546;
          v50 = v23;
          __int16 v51 = 2112;
          v52 = v43;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ Got unsupported client error - %@", buf, 0x16u);
        }
        v24 = [(MZKeyValueStoreController *)self clampsController];
        [v24 setNetworkingBlocked];

        long long v20 = [(MZKeyValueStoreDeserializer *)v13 requestError];
        uint64_t v21 = +[MZKeyValueStoreError killSwitchErrorWithTransaction:v11 underlyingError:v20];
      }
      uint64_t v25 = (void *)v21;
      [(MZKeyValueStoreController *)self _cancelAllPendingTransactions:v21];
      goto LABEL_39;
    }
  }
  else
  {
    id v11 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v8;
      __int16 v51 = 2112;
      v52 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ignoring BK response for dsid = %@ while currentDsid = %@", buf, 0x16u);
    }
  }
LABEL_42:
}

- (void)_enqueueStoreRequest:(id)a3 withUrlRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  urlRequestService = self->_urlRequestService;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A92E8;
  v10[3] = &unk_10054FBD8;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [(IMURLRequestService *)urlRequestService performUrlRequest:v7 callback:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  id v13 = a3;
  id v8 = a4;
  [(MZKeyValueStoreController *)self setResolvingError:1];
  if (([v13 isTransactionCancelledError] & 1) == 0)
  {
    uint64_t v9 = [(MZKeyValueStoreController *)self currentTransaction];
    if ((id)v9 == v8)
    {
    }
    else
    {
      id v10 = (void *)v9;
      id v11 = [(MZKeyValueStoreController *)self currentTransaction];

      if (v11) {
        goto LABEL_7;
      }
    }
    id v12 = [(MZKeyValueStoreController *)self clampsController];
    [v12 clearDSIDCheckTimestamp];

LABEL_7:
    if (a5 == 2)
    {
      [(MZKeyValueStoreController *)self _errorResolutionCancel:v13 transaction:v8];
    }
    else if (a5 == 1)
    {
      [(MZKeyValueStoreController *)self _errorResolutionRetry:v13 transaction:v8];
    }
    else
    {
      [(MZKeyValueStoreController *)self _errorResolutionDefault:v13 transaction:v8];
    }
  }
  [(MZKeyValueStoreController *)self setResolvingError:0];
}

- (void)_errorResolutionRetry:(id)a3 transaction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 isAccountsChangedError])
  {
    id v7 = [(MZKeyValueStoreController *)self clampsController];
    [v7 setUserAcceptedSyncTimestamp];
LABEL_5:

    [(MZKeyValueStoreController *)self _processCurrentTransaction];
    goto LABEL_7;
  }
  unsigned int v8 = [v11 isAuthenticationError];
  uint64_t v9 = [(MZKeyValueStoreController *)self clampsController];
  id v10 = v9;
  if (v8)
  {
    [v9 setUserAcceptedSyncTimestamp];

    id v7 = [(MZKeyValueStoreController *)self authenticationController];
    [v7 resetAcceptedCredentials];
    goto LABEL_5;
  }
  [v9 clearTimestampForTransaction:v6];

  [(MZKeyValueStoreController *)self scheduleTransaction:v6];
LABEL_7:
}

- (void)_errorResolutionCancel:(id)a3 transaction:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  if ([v6 isAuthenticationError]) {
    [(MZKeyValueStoreController *)self _cancelAllPendingTransactions:v6];
  }
  else {
    [(MZKeyValueStoreController *)self _cancelTransaction:v7 error:v6];
  }
}

- (void)_errorResolutionDefault:(id)a3 transaction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![v11 isAuthenticationError]) {
    goto LABEL_5;
  }
  id v7 = [(MZKeyValueStoreController *)self currentTransaction];
  if (v7 != v6)
  {

LABEL_5:
    uint64_t v10 = 2;
    goto LABEL_6;
  }
  unsigned int v8 = [(MZKeyValueStoreController *)self authenticationController];
  unsigned int v9 = [v8 shouldAuthenticate];

  if (v9) {
    goto LABEL_5;
  }
  uint64_t v10 = 1;
LABEL_6:
  [(MZKeyValueStoreController *)self _resolveError:v11 transaction:v6 resolution:v10];
}

- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MZKeyValueStoreController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(MZKeyValueStoreController *)self delegate];
    unsigned __int8 v10 = [v9 keyValueStoreController:self shouldScheduleTransaction:v6];

    if (a4 && (v10 & 1) == 0)
    {
      +[MZKeyValueStoreError delegateCancelledErrorWithTransaction:v6 underlyingError:0];
      unsigned __int8 v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MZKeyValueStoreController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    unsigned __int8 v10 = [(MZKeyValueStoreController *)self delegate];
    unsigned __int8 v11 = [v10 keyValueStoreController:self transaction:v6 didFailWithError:v7];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MZKeyValueStoreController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(MZKeyValueStoreController *)self delegate];
    [v9 keyValueStoreController:self transaction:v10 didCancelWithError:v6];
  }
}

- (void)_delegateTransactionDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(MZKeyValueStoreController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A9A54;
    v7[3] = &unk_10054D9B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)_beginBackgroundTask
{
  id v3 = [(MZKeyValueStoreController *)self backgroundTaskAssertion];

  if (!v3)
  {
    id v4 = [(MZKeyValueStoreController *)self currentTransaction];
    id v5 = [v4 assertionName];
    char v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[NSString stringWithFormat:@"[%@ _beginBackgroundTask] - No transaction", self];
    }
    id v8 = v7;

    objc_initWeak(&location, self);
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    __int16 v16 = sub_100056F6C;
    id v17 = sub_100057280;
    id v18 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A9C74;
    v11[3] = &unk_10054FC00;
    objc_copyWeak(&v12, &location);
    v11[4] = &v13;
    id v9 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:v11 debugInfo:v8];
    id v10 = (void *)v14[5];
    v14[5] = (uint64_t)v9;

    [(MZKeyValueStoreController *)self setBackgroundTaskAssertion:v14[5]];
    _Block_object_dispose(&v13, 8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_endBackgroundTask
{
  id v3 = [(MZKeyValueStoreController *)self backgroundTaskAssertion];
  [(MZKeyValueStoreController *)self setBackgroundTaskAssertion:0];
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A9DA0;
    block[3] = &unk_10054D570;
    id v5 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == (id)511)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A9E88;
    v10[3] = &unk_10054D570;
    void v10[4] = self;
    [(MZKeyValueStoreController *)self performBlock:v10];
  }
  v9[2](v9, 1);
}

- (BOOL)AMSURLSession:(id)a3 shouldHandleAuthenticationForAccount:(id)a4 dialogDictionary:(id)a5
{
  char v6 = [(MZKeyValueStoreController *)self currentTransaction];
  +[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:v6 underlyingError:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AA074;
  v10[3] = &unk_10054E708;
  void v10[4] = self;
  id v11 = v6;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v12;
  id v8 = v6;
  [(MZKeyValueStoreController *)self performBlock:v10];

  return 0;
}

- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5
{
  id v6 = a5;
  id v7 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(MZKeyValueStoreController *)self currentTransaction];
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ AMSURLSession server failure - %@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(MZKeyValueStoreController *)self currentTransaction];
  id v10 = +[MZKeyValueStoreError unknownErrorWithTransaction:v9 underlyingError:v6];

  id v11 = [(MZKeyValueStoreController *)self currentTransaction];
  [(MZKeyValueStoreController *)self _transactionDidFail:v11 withError:v10];

  return 1;
}

- (void)keyValueStoreOperation:(id)a3 scheduleURLRequest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MZKeyValueStoreController *)self clampsController];
  unsigned __int8 v8 = [v7 isNetworkingBlocked];

  if ((v8 & 1) == 0) {
    [(MZKeyValueStoreController *)self _enqueueStoreRequest:v9 withUrlRequest:v6];
  }
}

- (void)deserializeOperationDidFinish:(id)a3 shouldReschedule:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MZKeyValueStoreController *)self currentDeserializer];

  if (v7 == v6)
  {
    if (v4) {
      [(MZKeyValueStoreController *)self _processCurrentTransaction];
    }
    else {
      [(MZKeyValueStoreController *)self _currentTransactionDidFinish];
    }
    unsigned __int8 v8 = [(MZKeyValueStoreController *)self currentDeserializer];
    [v8 setDelegate:0];

    [(MZKeyValueStoreController *)self setCurrentDeserializer:0];
  }
}

- (MZKeyValueStoreControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MZKeyValueStoreControllerDelegate *)WeakRetained;
}

- (NSURL)defaultGetURL
{
  return self->_defaultGetURL;
}

- (NSURL)defaultSetURL
{
  return self->_defaultSetURL;
}

- (NSString)defaultDomain
{
  return self->_defaultDomain;
}

- (MZKeyValueStoreAuthenticationController)authenticationController
{
  return (MZKeyValueStoreAuthenticationController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAuthenticationController:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
}

- (MZKeyValueStoreTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (BOOL)isResolvingError
{
  return self->_resolvingError;
}

- (void)setResolvingError:(BOOL)a3
{
  self->_resolvingError = a3;
}

- (MZKeyValueStoreDeserializer)currentDeserializer
{
  return self->_currentDeserializer;
}

- (void)setCurrentDeserializer:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (MZTaskAssertion)backgroundTaskAssertion
{
  return self->_backgroundTaskAssertion;
}

- (void)setBackgroundTaskAssertion:(id)a3
{
}

- (IMURLRequestService)urlRequestService
{
  return self->_urlRequestService;
}

- (void)setUrlRequestService:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_urlRequestService, 0);
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentDeserializer, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_defaultDomain, 0);
  objc_storeStrong((id *)&self->_defaultSetURL, 0);

  objc_storeStrong((id *)&self->_defaultGetURL, 0);
}

- (id)scheduleApnSubscriptionTransactionWithPushSubscriptionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [MTApnsDictionaryProcessor alloc];
  id v6 = [v4 parameters];
  id v7 = [(MTApnsDictionaryProcessor *)v5 initWithDictionary:v6];

  unsigned __int8 v8 = [MTApnsTransaction alloc];
  id v9 = [(MZKeyValueStoreController *)self defaultDomain];
  id v10 = [(MZKeyValueStoreController *)self defaultSetURL];
  id v11 = [v4 parameters];

  id v12 = [v11 allKeys];
  int v13 = [(MZKeyValueStoreTransaction *)v8 initWithType:2 domain:v9 URL:v10 keys:v12];

  [(MZKeyValueStoreTransaction *)v13 setSinceDomainVersion:@"0"];
  [(MZKeyValueStoreTransaction *)v13 setProcessor:v7];
  [(MZKeyValueStoreController *)self scheduleTransaction:v13];

  return v13;
}

@end