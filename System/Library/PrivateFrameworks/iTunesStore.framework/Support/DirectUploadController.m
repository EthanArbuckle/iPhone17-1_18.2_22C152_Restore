@interface DirectUploadController
+ (BOOL)_isConnectionEntitled:(id)a3;
+ (id)_copyPersistentIdentifiersArrayWithXPCArray:(id)a3;
+ (id)_orderedPostQueryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)_orderedUploadQueryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)sharedController;
+ (void)_sendAccessDeniedErrorWithMessage:(id)a3 connection:(id)a4;
+ (void)_setupDatabase:(id)a3;
+ (void)cancelUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)getUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)pauseUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4;
+ (void)resumeUploadsWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_cancelUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_pauseUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_resumeUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 resetFailureCount:(BOOL)a5 error:(id *)a6;
- (DirectUploadController)init;
- (id)_authenticationCoordinator;
- (id)_database;
- (id)_databaseIfExists;
- (id)_errorCoordinator;
- (id)_newAddUploadsMessageWithDatabase:(id)a3 hydratedUploadIDs:(id)a4;
- (id)_newSSVDirectUploadWithProgress:(id)a3 state:(int64_t)a4;
- (id)_pollingCoordinator;
- (id)_postOperationQueue;
- (id)_sessionController;
- (void)_cleanupPendingUploads:(id)a3 database:(id)a4;
- (void)_cleanupSessionController;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_enqueueNextReadyMediaSocialPostOperationWithDatabase:(id)a3;
- (void)_enumerateSSVDirectUploadsWithQuery:(id)a3 block:(id)a4;
- (void)_finishPostWithPostIdentifier:(int64_t)a3 response:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_operationDidFinishForPostIdentifier:(int64_t)a3 response:(id)a4;
- (void)_registerObserverWithMessage:(id)a3 connection:(id)a4;
- (void)_retryFailedEntities;
- (void)_sendChangeUploadsMessageWithUploads:(id)a3;
- (void)_sendRemoveUploadsMessageWithUploadIdentifiers:(id)a3;
- (void)addMediaSocialPostWithDescription:(id)a3 client:(id)a4;
- (void)authenticationCoordinator:(id)a3 didFinishAuthenticationWithResponse:(id)a4;
- (void)dealloc;
- (void)mediaSocialErrorCoordinator:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)pollingCoordinator:(id)a3 didPollWithResponses:(id)a4;
- (void)start;
- (void)uploadSessionController:(id)a3 uploadDidBeginTransferWithDatabaseID:(int64_t)a4;
- (void)uploadSessionController:(id)a3 uploadDidFailWithDatabaseID:(int64_t)a4 error:(id)a5;
- (void)uploadSessionController:(id)a3 uploadDidFinishWithDatabaseID:(int64_t)a4 response:(id)a5;
- (void)uploadSessionController:(id)a3 uploadProgressDidChange:(id)a4;
@end

@implementation DirectUploadController

- (DirectUploadController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DirectUploadController;
  v2 = [(DirectUploadController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DirectUploadController", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  if (self->_backgroundTaskObserver)
  {
    v4 = +[Daemon daemon];
    [v4 removeBackgroundTaskObserver:self->_backgroundTaskObserver];
  }
  [(MediaSocialAuthenticationCoordinator *)self->_authenticationCoordinator setDelegate:0];
  [(MediaSocialErrorCoordinator *)self->_errorCoordinator setDelegate:0];
  [(MediaSocialStatusPollingCoordinator *)self->_pollingCoordinator setDelegate:0];
  [(DirectUploadSessionController *)self->_sessionController setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)DirectUploadController;
  [(DirectUploadController *)&v5 dealloc];
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000557E4;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401CE0 != -1) {
    dispatch_once(&qword_100401CE0, block);
  }
  v2 = (void *)qword_100401CD8;

  return v2;
}

- (void)addMediaSocialPostWithDescription:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000558E4;
  block[3] = &unk_1003A4298;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)start
{
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = +[Daemon daemon];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056214;
  v8[3] = &unk_1003A4510;
  objc_copyWeak(&v9, &location);
  v4 = [v3 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.DirectUploadController.retry" withBlock:v8];
  id backgroundTaskObserver = self->_backgroundTaskObserver;
  self->_id backgroundTaskObserver = v4;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000562B8;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (void)cancelUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    v8 = (void *)SSXPCConnectionCopyClientIdentifier();
    id v9 = [a1 sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000565C4;
    v12[3] = &unk_1003A4560;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }
  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)getUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    [a1 sharedController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005692C;
    v9[3] = &unk_1003A45D8;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = a1;
    id v8 = v10;
    [v8 _handleMessage:v6 connection:v7 usingReplyBlock:v9];
  }
  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"cancelUploadsWithMessage:connection:" forMessage:154];
  [v4 addObserver:a1 selector:"getUploadsWithMessage:connection:" forMessage:155];
  [v4 addObserver:a1 selector:"pauseUploadsWithMessage:connection:" forMessage:156];
  [v4 addObserver:a1 selector:"registerObserverWithMessage:connection:" forMessage:157];
  [v4 addObserver:a1 selector:"resumeUploadsWithMessage:connection:" forMessage:158];
}

+ (void)pauseUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier();
    id v9 = [a1 sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100056CE8;
    v12[3] = &unk_1003A4560;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }
  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    [a1 sharedController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100057018;
    v9[3] = &unk_1003A4298;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v6;
    id v12 = v7;
    id v8 = v10;
    [v8 _handleMessage:v11 connection:v12 usingBlock:v9];
  }
  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)resumeUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier();
    id v9 = [a1 sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100057154;
    v12[3] = &unk_1003A4560;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }
  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

- (void)uploadSessionController:(id)a3 uploadDidBeginTransferWithDatabaseID:(int64_t)a4
{
  [(DirectUploadController *)self _database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000574A8;
  v11[3] = &unk_1003A4600;
  int64_t v13 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  [v6 performTransactionWithBlock:v11];
  if ([(NSMutableArray *)self->_clients count])
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
    id v8 = [(NSMutableDictionary *)self->_progressDictionary objectForKey:v7];
    id v9 = [(DirectUploadController *)self _newSSVDirectUploadWithProgress:v8 state:1];
    [v9 setPersistentIdentifier:a4];
    id v10 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v9, 0);
    [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v10];
  }
}

- (void)uploadSessionController:(id)a3 uploadDidFailWithDatabaseID:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100055BE8;
  v34 = sub_100055BF8;
  id v35 = 0;
  int IsEqual = ISErrorIsEqual();
  [(DirectUploadController *)self _database];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_1000577A8;
  v22 = &unk_1003A4628;
  int64_t v28 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  v25 = self;
  char v29 = IsEqual;
  v26 = &v30;
  v27 = &v36;
  [v11 performTransactionWithBlock:&v19];
  if (IsEqual)
  {
    int64_t v13 = [(DirectUploadController *)self _authenticationCoordinator];
    [v13 authenticateForUploadWithIdentifier:a4 accountIdentifier:v31[5]];
  }
  else if (*((unsigned char *)v37 + 24))
  {
    [(DirectUploadController *)self _scheduleDelayedRetry];
  }
  if ([(NSMutableArray *)self->_clients count])
  {
    id v14 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
    id v15 = [(NSMutableDictionary *)self->_progressDictionary objectForKey:v14];
    id v16 = [(DirectUploadController *)self _newSSVDirectUploadWithProgress:v15 state:4];
    [v16 setError:v12];
    [v16 setPersistentIdentifier:a4];
    id v17 = objc_alloc((Class)NSArray);
    id v18 = objc_msgSend(v17, "initWithObjects:", v16, 0, v19, v20, v21, v22, v23);
    [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v18];
  }
  [(DirectUploadController *)self _cleanupSessionController];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

- (void)uploadSessionController:(id)a3 uploadDidFinishWithDatabaseID:(int64_t)a4 response:(id)a5
{
  id v7 = a5;
  [(DirectUploadController *)self _database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100057BA0;
  v15[3] = &unk_1003A45B0;
  int64_t v19 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v18 = self;
  [v8 performTransactionWithBlock:v15];
  id v10 = [v9 countOfBytesSent];
  id v11 = objc_alloc_init(DirectUploadProgress);
  [(DirectUploadProgress *)v11 setCountOfBytesExpectedToSend:v10];
  [(DirectUploadProgress *)v11 setCountOfBytesSent:v10];
  [(DirectUploadProgress *)v11 setUploadDatabaseIdentifier:a4];
  id v12 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
  [(NSMutableDictionary *)self->_progressDictionary setObject:v11 forKey:v12];
  if ([(NSMutableArray *)self->_clients count])
  {
    id v13 = [(DirectUploadController *)self _newSSVDirectUploadWithProgress:v11 state:2];
    id v14 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v13, 0);
    [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v14];
  }
  [(DirectUploadController *)self _cleanupSessionController];
}

- (void)uploadSessionController:(id)a3 uploadProgressDidChange:(id)a4
{
  id v5 = a4;
  if ([(NSMutableArray *)self->_clients count]) {
    id v6 = objc_alloc_init((Class)NSMutableArray);
  }
  else {
    id v6 = 0;
  }
  if (!self->_progressDictionary)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    progressDictionary = self->_progressDictionary;
    self->_progressDictionary = v7;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v15 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v14, "uploadDatabaseIdentifier", (void)v17));
        [(NSMutableDictionary *)self->_progressDictionary setObject:v14 forKey:v15];
        if (v6)
        {
          id v16 = [(DirectUploadController *)self _newSSVDirectUploadWithProgress:v14 state:1];
          [v6 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v6];
}

- (void)authenticationCoordinator:(id)a3 didFinishAuthenticationWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 authenticateResponse];
  id v9 = [v8 authenticatedAccount];
  id v10 = [v9 uniqueIdentifier];

  id v11 = [v7 accountIdentifier];
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v12 = [(DirectUploadController *)self _database];
  long long v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  long long v20 = sub_100057F80;
  v21 = &unk_1003A4678;
  id v13 = v11;
  id v22 = v13;
  id v14 = v12;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  v25 = self;
  id v16 = v8;
  id v26 = v16;
  v27 = &v28;
  [v14 performTransactionWithBlock:&v18];
  if ([(MediaSocialAuthenticationCoordinator *)self->_authenticationCoordinator isFinished])
  {
    [(MediaSocialAuthenticationCoordinator *)self->_authenticationCoordinator setDelegate:0];
    authenticationCoordinator = self->_authenticationCoordinator;
    self->_authenticationCoordinator = 0;
  }
  if (*((unsigned char *)v29 + 24)) {
    [(DirectUploadController *)self _scheduleDelayedRetry];
  }

  _Block_object_dispose(&v28, 8);
}

- (void)mediaSocialErrorCoordinator:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 postIdentifiers];
  id v8 = [v6 uploadIdentifiers];

  if (a4 == 1)
  {
    id v16 = [(DirectUploadController *)self _database];
    long long v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    long long v20 = sub_100058E30;
    v21 = &unk_1003A46A0;
    id v10 = (id *)v22;
    v22[0] = v7;
    v22[1] = self;
    id v11 = &v23;
    id v23 = v16;
    uint64_t v12 = &v24;
    id v24 = v8;
    id v13 = v16;
    id v14 = v13;
    id v15 = &v18;
    goto LABEL_5;
  }
  if (!a4)
  {
    id v9 = [(DirectUploadController *)self _database];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000587B8;
    v25[3] = &unk_1003A46A0;
    id v10 = (id *)v26;
    v26[0] = v7;
    v26[1] = self;
    id v11 = &v27;
    v27 = v9;
    uint64_t v12 = &v28;
    id v28 = v8;
    id v13 = v9;
    id v14 = v13;
    id v15 = (void ***)v25;
LABEL_5:
    objc_msgSend(v13, "performTransactionWithBlock:", v15, v18, v19, v20, v21);
  }
  [(MediaSocialErrorCoordinator *)self->_errorCoordinator setDelegate:0];
  errorCoordinator = self->_errorCoordinator;
  self->_errorCoordinator = 0;
}

- (void)pollingCoordinator:(id)a3 didPollWithResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [(DirectUploadController *)self _database];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005947C;
  v23[3] = &unk_1003A46C8;
  id v10 = v7;
  id v24 = v10;
  id v11 = v8;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  [v12 performTransactionWithBlock:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[DirectUploadController _finishPostWithPostIdentifier:response:](self, "_finishPostWithPostIdentifier:response:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "postIdentifier", (void)v19), *(void *)(*((void *)&v19 + 1) + 8 * (void)v17));
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  if (![v6 numberOfPollRequests])
  {
    [(MediaSocialStatusPollingCoordinator *)self->_pollingCoordinator setDelegate:0];
    pollingCoordinator = self->_pollingCoordinator;
    self->_pollingCoordinator = 0;
  }
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059684;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

+ (id)_copyPersistentIdentifiersArrayWithXPCArray:(id)a3
{
  id v3 = a3;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100059974;
  applier[3] = &unk_1003A4180;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v7 = v4;
  xpc_array_apply(v3, applier);

  return v4;
}

+ (BOOL)_isConnectionEntitled:(id)a3
{
  id v3 = a3;
  if (SSXPCConnectionHasEntitlement()) {
    char HasEntitlement = 1;
  }
  else {
    char HasEntitlement = SSXPCConnectionHasEntitlement();
  }

  return HasEntitlement;
}

+ (id)_orderedPostQueryWithDatabase:(id)a3 predicate:(id)a4
{
  CFStringRef v10 = @"creation_time";
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = +[MediaSocialPostEntity queryWithDatabase:predicate:orderingProperties:](MediaSocialPostEntity, "queryWithDatabase:predicate:orderingProperties:", v6, v5, v7, v10);

  return v8;
}

+ (id)_orderedUploadQueryWithDatabase:(id)a3 predicate:(id)a4
{
  CFStringRef v10 = @"creation_time";
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = +[DirectUploadEntity queryWithDatabase:predicate:orderingProperties:](DirectUploadEntity, "queryWithDatabase:predicate:orderingProperties:", v6, v5, v7, v10);

  return v8;
}

+ (void)_sendAccessDeniedErrorWithMessage:(id)a3 connection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    CFStringRef v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v14) = 138412290;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12) {
        goto LABEL_14;
      }
      CFStringRef v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v14, v13, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v7 = SSError();
  SSXPCDictionarySetObject();
  xpc_connection_send_message(v5, reply);
LABEL_14:
}

+ (void)_setupDatabase:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059EA8;
  v4[3] = &unk_1003A3118;
  id v5 = a3;
  id v3 = v5;
  [v3 performTransactionWithBlock:v4];
}

- (id)_authenticationCoordinator
{
  authenticationCoordinator = self->_authenticationCoordinator;
  if (!authenticationCoordinator)
  {
    id v4 = [[MediaSocialAuthenticationCoordinator alloc] initWithDispatchQueue:self->_dispatchQueue];
    id v5 = self->_authenticationCoordinator;
    self->_authenticationCoordinator = v4;

    [(MediaSocialAuthenticationCoordinator *)self->_authenticationCoordinator setDelegate:self];
    authenticationCoordinator = self->_authenticationCoordinator;
  }

  return authenticationCoordinator;
}

- (BOOL)_cancelUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  [(DirectUploadController *)self _database];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005A168;
  v25[3] = &unk_1003A4718;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v10;
  id v11 = v7;
  id v27 = v11;
  id v28 = self;
  id v12 = v8;
  id v29 = v12;
  id v13 = v9;
  id v30 = v13;
  [v10 performTransactionWithBlock:v25];
  if ([v13 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        long long v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableDictionary removeObjectForKey:](self->_progressDictionary, "removeObjectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v18), (void)v21);
          long long v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v16);
    }

    long long v19 = [(DirectUploadController *)self _sessionController];
    [v19 cancelUploadTasksWithDatabaseIdentifiers:v14];

    [(DirectUploadController *)self _sendRemoveUploadsMessageWithUploadIdentifiers:v14];
  }

  return 1;
}

- (void)_cleanupSessionController
{
  if (![(DirectUploadSessionController *)self->_sessionController numberOfTasks])
  {
    [(DirectUploadSessionController *)self->_sessionController setDelegate:0];
    [(DirectUploadSessionController *)self->_sessionController invalidURLSessions];
    sessionController = self->_sessionController;
    self->_sessionController = 0;
  }
}

- (void)_cleanupPendingUploads:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = objc_opt_new();
  CFStringRef v71 = @"creation_time";
  id v10 = +[NSArray arrayWithObjects:&v71 count:1];
  id v53 = v6;
  id v11 = +[DirectUploadEntity queryWithDatabase:v7 predicate:v6 orderingProperties:v10];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10005ABC0;
  v61[3] = &unk_1003A4740;
  id v12 = v7;
  id v62 = v12;
  id v13 = v8;
  id v63 = v13;
  v64 = self;
  id v14 = v9;
  id v65 = v14;
  [v11 enumeratePersistentIDsUsingBlock:v61];
  id v15 = &syslog_ptr;
  if ([v13 count])
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    long long v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      id v21 = v14;
      long long v22 = objc_opt_class();
      id obja = v22;
      id v23 = [v13 count];
      int v67 = 138412546;
      v68 = v22;
      id v14 = v21;
      id v15 = &syslog_ptr;
      __int16 v69 = 2048;
      id v70 = v23;
      LODWORD(v48) = 22;
      v46 = &v67;
      long long v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_14:

        [(DirectUploadController *)self _sendRemoveUploadsMessageWithUploadIdentifiers:v13];
        goto LABEL_15;
      }
      long long v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v67, v48);
      free(v24);
      v46 = (int *)v19;
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  id v25 = v53;
  if (objc_msgSend(v14, "count", v46))
  {
    id v50 = v13;
    id v51 = v12;
    v52 = v11;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v49 = v14;
    id obj = v14;
    id v26 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (!v26) {
      goto LABEL_37;
    }
    id v27 = v26;
    uint64_t v28 = *(void *)v58;
    while (1)
    {
      id v29 = 0;
      id v54 = v27;
      do
      {
        if (*(void *)v58 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v29);
        char v31 = objc_msgSend(v30, "activityIdentifier", v47);
        id v32 = [v31 length];

        if (v32)
        {
          v33 = [v15[405] sharedDaemonConfig];
          if (!v33)
          {
            v33 = [v15[405] sharedConfig];
          }
          unsigned int v34 = [v33 shouldLog];
          if ([v33 shouldLogToDisk]) {
            int v35 = v34 | 2;
          }
          else {
            int v35 = v34;
          }
          uint64_t v36 = [v33 OSLogObject];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
            int v37 = v35;
          }
          else {
            int v37 = v35 & 2;
          }
          if (v37)
          {
            uint64_t v38 = objc_opt_class();
            uint64_t v39 = v28;
            v40 = v15;
            v41 = self;
            id v42 = v38;
            id v43 = [v30 postIdentifier];
            int v67 = 138412546;
            v68 = v38;
            __int16 v69 = 2048;
            id v70 = v43;
            LODWORD(v48) = 22;
            v47 = &v67;
            v44 = (void *)_os_log_send_and_compose_impl();

            self = v41;
            id v15 = v40;
            uint64_t v28 = v39;
            id v27 = v54;

            if (v44)
            {
              uint64_t v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v67, v48);
              free(v44);
              v47 = (int *)v36;
              SSFileLog();
              goto LABEL_33;
            }
          }
          else
          {
LABEL_33:
          }
          v45 = [(DirectUploadController *)self _pollingCoordinator];
          [v45 addPollRequest:v30];
        }
        id v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      id v27 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (!v27)
      {
LABEL_37:

        id v11 = v52;
        id v25 = v53;
        id v13 = v50;
        id v12 = v51;
        id v14 = v49;
        break;
      }
    }
  }
}

- (id)_database
{
  database = self->_database;
  if (!database)
  {
    id v4 = +[DirectUploadDatabaseSchema databasePath];
    id v5 = objc_alloc_init((Class)NSFileManager);
    id v6 = [v4 stringByDeletingLastPathComponent];
    [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

    id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v4 isDirectory:0];
    id v8 = (SSSQLiteDatabase *)[objc_alloc((Class)SSSQLiteDatabase) initWithDatabaseURL:v7 readOnly:0 protectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
    id v9 = self->_database;
    self->_database = v8;

    [(SSSQLiteDatabase *)self->_database setSetupBlock:&stru_1003A4760];
    database = self->_database;
  }

  return database;
}

- (id)_databaseIfExists
{
  database = self->_database;
  if (database)
  {
    id v3 = database;
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSFileManager);
    id v6 = +[DirectUploadDatabaseSchema databasePath];
    unsigned int v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

    id v3 = 0;
    if (v7)
    {
      id v3 = [(DirectUploadController *)self _database];
    }
  }

  return v3;
}

- (void)_enqueueNextReadyMediaSocialPostOperationWithDatabase:(id)a3
{
  id v17 = a3;
  val = self;
  id v4 = [(DirectUploadController *)self _postOperationQueue];
  if (![v4 operationCount])
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = sub_100055BE8;
    uint64_t v39 = sub_100055BF8;
    id v40 = (id)objc_opt_new();
    id v5 = [(id)objc_opt_class() _orderedPostQueryWithDatabase:v17 predicate:0];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10005B524;
    v32[3] = &unk_1003A4788;
    id v33 = v17;
    unsigned int v34 = &v35;
    [v5 enumeratePersistentIDsUsingBlock:v32];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)v36[5];
    id v6 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v6)
    {
      uint64_t v20 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v9 = [v8 persistentID];
          id v10 = [v4 operations];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v11 = v10;
          id v12 = [(MediaSocialPostOperation *)v11 countByEnumeratingWithState:&v24 objects:v41 count:16];
          id v13 = v5;
          if (v12)
          {
            uint64_t v14 = *(void *)v25;
            while (2)
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                if ([*(id *)(*((void *)&v24 + 1) + 8 * (void)j) postID] == v9)
                {
                  id v16 = v11;
                  id v5 = v13;
                  goto LABEL_17;
                }
              }
              id v12 = [(MediaSocialPostOperation *)v11 countByEnumeratingWithState:&v24 objects:v41 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          id v5 = v13;
          id v16 = [[MediaSocialPostOperation alloc] initWithPostEntity:v8];
          objc_initWeak(&location, val);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10005B59C;
          v21[3] = &unk_1003A47D8;
          objc_copyWeak(v22, &location);
          v21[4] = val;
          v22[1] = v9;
          [(MediaSocialPostOperation *)v16 setResultBlock:v21];
          [v4 addOperation:v16];
          objc_destroyWeak(v22);
          objc_destroyWeak(&location);
LABEL_17:
        }
        id v6 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(&v35, 8);
  }
}

- (void)_enumerateSSVDirectUploadsWithQuery:(id)a3 block:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B708;
  v6[3] = &unk_1003A4800;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [a3 enumerateSSVDirectUploadsUsingBlock:v6];
}

- (void)_finishPostWithPostIdentifier:(int64_t)a3 response:(id)a4
{
  id v6 = a4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_100055BE8;
  id v40 = sub_100055BF8;
  id v41 = 0;
  if ([v6 result] == (id)5)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    unsigned int v9 = [v7 shouldLogToDisk];
    id v10 = [v7 OSLogObject];
    id v11 = v10;
    if (v9) {
      v8 |= 2u;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (!v8) {
      goto LABEL_20;
    }
    id v12 = objc_opt_class();
    int v43 = 138412546;
    v44 = v12;
    __int16 v45 = 2048;
    int64_t v46 = a3;
    id v13 = v12;
    LODWORD(v26) = 22;
    long long v25 = &v43;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_21;
    }
  }
  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v7 shouldLog];
    unsigned int v16 = [v7 shouldLogToDisk];
    id v17 = [v7 OSLogObject];
    id v11 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      v15 &= 2u;
    }
    if (!v15) {
      goto LABEL_20;
    }
    int v18 = objc_opt_class();
    int v43 = 138412546;
    v44 = v18;
    __int16 v45 = 2048;
    int64_t v46 = a3;
    id v19 = v18;
    LODWORD(v26) = 22;
    long long v25 = &v43;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_21;
    }
  }
  id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v43, v26);
  free(v14);
  long long v25 = (int *)v11;
  SSFileLog();
LABEL_20:

LABEL_21:
  [(DirectUploadController *)self _database];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10005BC90;
  v31[3] = &unk_1003A4828;
  int64_t v35 = a3;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = self;
  unsigned int v34 = &v36;
  id v32 = v20;
  [v20 performTransactionWithBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = (id)v37[5];
  id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v21);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_progressDictionary, "removeObjectForKey:", *(void *)(*((void *)&v27 + 1) + 8 * i), v25);
      }
      id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v22);
  }

  [(DirectUploadController *)self _sendRemoveUploadsMessageWithUploadIdentifiers:v37[5]];
  _Block_object_dispose(&v36, 8);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v6 = a5;
  id v7 = +[Daemon daemon];
  [v7 takeKeepAliveAssertion:@"DirectUploadController"];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BDC8;
  block[3] = &unk_1003A31C8;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[Daemon daemon];
  [v11 takeKeepAliveAssertion:@"DirectUploadController"];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BF3C;
  block[3] = &unk_1003A4850;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(dispatchQueue, block);
}

- (id)_errorCoordinator
{
  errorCoordinator = self->_errorCoordinator;
  if (!errorCoordinator)
  {
    id v4 = [[MediaSocialErrorCoordinator alloc] initWithDispatchQueue:self->_dispatchQueue];
    id v5 = self->_errorCoordinator;
    self->_errorCoordinator = v4;

    [(MediaSocialErrorCoordinator *)self->_errorCoordinator setDelegate:self];
    errorCoordinator = self->_errorCoordinator;
  }

  return errorCoordinator;
}

- (id)_newAddUploadsMessageWithDatabase:(id)a3 hydratedUploadIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)SSXPCCreateMessageDictionary();
  xpc_object_t v9 = xpc_array_create(0, 0);
  id v10 = [(id)objc_opt_class() _orderedUploadQueryWithDatabase:v6 predicate:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  id v22[2] = sub_10005C278;
  v22[3] = &unk_1003A3A80;
  id v11 = v9;
  id v23 = v11;
  [v10 enumeratePersistentIDsUsingBlock:v22];

  xpc_dictionary_set_value(v8, "1", v11);
  xpc_object_t v12 = xpc_array_create(0, 0);
  id v13 = [v7 count];
  uint64_t v14 = SSSQLEntityPropertyPersistentID;
  if (v13 == (id)1)
  {
    uint64_t v15 = [v7 firstObject];

    unsigned int v16 = +[SSSQLiteComparisonPredicate predicateWithProperty:v14 equalToValue:v15];
    id v7 = (id)v15;
  }
  else
  {
    unsigned int v16 = +[SSSQLiteContainsPredicate containsPredicateWithProperty:SSSQLEntityPropertyPersistentID values:v7];
  }

  id v17 = [(id)objc_opt_class() _orderedUploadQueryWithDatabase:v6 predicate:v16];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005C288;
  v20[3] = &unk_1003A4588;
  id v21 = v12;
  id v18 = v12;
  [(DirectUploadController *)self _enumerateSSVDirectUploadsWithQuery:v17 block:v20];

  xpc_dictionary_set_value(v8, "2", v18);
  return v8;
}

- (id)_newSSVDirectUploadWithProgress:(id)a3 state:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)SSVDirectUpload);
  objc_msgSend(v6, "setCountOfBytesExpectedToSend:", objc_msgSend(v5, "countOfBytesExpectedToSend"));
  objc_msgSend(v6, "setCountOfBytesSent:", objc_msgSend(v5, "countOfBytesSent"));
  id v7 = [v5 uploadDatabaseIdentifier];

  [v6 setPersistentIdentifier:v7];
  [v6 setState:a4];
  return v6;
}

- (void)_operationDidFinishForPostIdentifier:(int64_t)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = [(DirectUploadController *)self _database];
  switch((unint64_t)[v6 result])
  {
    case 0uLL:
      uint64_t v18 = 0;
      id v19 = &v18;
      uint64_t v20 = 0x2020000000;
      LOBYTE(v21) = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10005CB6C;
      v24[3] = &unk_1003A4878;
      int64_t v29 = a3;
      id v8 = v7;
      id v25 = v8;
      uint64_t v26 = self;
      id v27 = v6;
      long long v28 = &v18;
      [v8 performTransactionWithBlock:v24];
      if (*((unsigned char *)v19 + 24)) {
        [(DirectUploadController *)self _scheduleDelayedRetry];
      }

      _Block_object_dispose(&v18, 8);
      break;
    case 1uLL:
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10005C930;
      v30[3] = &unk_1003A45B0;
      int64_t v34 = a3;
      id v31 = v7;
      id v32 = self;
      id v33 = v6;
      [v31 performTransactionWithBlock:v30];

      id v9 = v31;
      goto LABEL_11;
    case 2uLL:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10005C6F4;
      v35[3] = &unk_1003A45B0;
      int64_t v39 = a3;
      id v36 = v7;
      uint64_t v37 = self;
      id v38 = v6;
      [v36 performTransactionWithBlock:v35];

      id v9 = v36;
      goto LABEL_11;
    case 3uLL:
      uint64_t v18 = 0;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = sub_100055BE8;
      id v22 = sub_100055BF8;
      id v23 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10005CE10;
      v13[3] = &unk_1003A48A0;
      int64_t v17 = a3;
      id v14 = v7;
      id v15 = v6;
      unsigned int v16 = &v18;
      [v14 performTransactionWithBlock:v13];
      id v10 = [(id)v19[5] activityIdentifier];
      id v11 = [v10 length];

      if (v11)
      {
        xpc_object_t v12 = [(DirectUploadController *)self _pollingCoordinator];
        [v12 addPollRequest:v19[5]];
      }
      _Block_object_dispose(&v18, 8);
      id v9 = v23;
LABEL_11:

      break;
    default:
      [(DirectUploadController *)self _finishPostWithPostIdentifier:a3 response:v6];
      break;
  }
}

- (BOOL)_pauseUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableArray *)self->_clients count]) {
    id v10 = objc_alloc_init((Class)NSMutableArray);
  }
  else {
    id v10 = 0;
  }
  [(DirectUploadController *)self _database];
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_10005D0A8;
  id v21 = &unk_1003A48F0;
  id v22 = self;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v7;
  id v11 = v9;
  id v25 = v11;
  id v26 = v10;
  id v27 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v7;
  id v15 = v23;
  [v15 performTransactionWithBlock:&v18];
  if (objc_msgSend(v11, "count", v18, v19, v20, v21, v22))
  {
    unsigned int v16 = [(DirectUploadController *)self _sessionController];
    [v16 pauseUploadTasksWithDatabaseIdentifiers:v11];
  }
  [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v13];

  return 1;
}

- (id)_pollingCoordinator
{
  pollingCoordinator = self->_pollingCoordinator;
  if (!pollingCoordinator)
  {
    id v4 = [[MediaSocialStatusPollingCoordinator alloc] initWithDispatchQueue:self->_dispatchQueue];
    id v5 = self->_pollingCoordinator;
    self->_pollingCoordinator = v4;

    [(MediaSocialStatusPollingCoordinator *)self->_pollingCoordinator setDelegate:self];
    pollingCoordinator = self->_pollingCoordinator;
  }

  return pollingCoordinator;
}

- (id)_postOperationQueue
{
  postOperationQueue = self->_postOperationQueue;
  if (!postOperationQueue)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    id v5 = self->_postOperationQueue;
    self->_postOperationQueue = v4;

    [(ISOperationQueue *)self->_postOperationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)self->_postOperationQueue setName:@"com.apple.itunesstored.DirectUploadController.post"];
    postOperationQueue = self->_postOperationQueue;
  }

  return postOperationQueue;
}

- (void)_registerObserverWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_value(a3, "2");
  id v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_endpoint)
  {
    id v9 = xpc_connection_create_from_endpoint(v8);
    if (!v9) {
      goto LABEL_31;
    }
    id v12 = [[XPCClient alloc] initWithInputConnection:v6];
    [(XPCClient *)v12 setOutputConnectionWithConnection:v9];
    id v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      id v30 = v19;
      uint64_t v20 = [(XPCClient *)v12 clientIdentifier];
      int v31 = 138412546;
      id v32 = v19;
      __int16 v33 = 2112;
      int64_t v34 = v20;
      LODWORD(v29) = 22;
      long long v28 = &v31;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_25:

        if (![(NSMutableArray *)self->_clients count])
        {
          id v22 = +[NSNotificationCenter defaultCenter];
          [v22 addObserver:self selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
        }
        clients = self->_clients;
        if (!clients)
        {
          id v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          id v25 = self->_clients;
          self->_clients = v24;

          clients = self->_clients;
        }
        -[NSMutableArray addObject:](clients, "addObject:", v12, v28);
        xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
        id v27 = [(XPCClient *)v12 outputConnection];
        [v27 sendMessage:v26];

        goto LABEL_30;
      }
      uint64_t v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v31, v29);
      free(v21);
      long long v28 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_25;
  }
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_30;
  }
  int v31 = 138412290;
  id v32 = (id)objc_opt_class();
  id v13 = v32;
  LODWORD(v29) = 12;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v31, v29);
    id v12 = (XPCClient *)objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_30:
  }
LABEL_31:
}

- (BOOL)_resumeUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 resetFailureCount:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableArray *)self->_clients count]) {
    id v12 = objc_alloc_init((Class)NSMutableArray);
  }
  else {
    id v12 = 0;
  }
  [(DirectUploadController *)self _database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005DA54;
  v20[3] = &unk_1003A4940;
  void v20[4] = self;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v9;
  BOOL v26 = a5;
  id v13 = v11;
  id v23 = v13;
  id v24 = v12;
  id v25 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v9;
  id v17 = v21;
  [v17 performTransactionWithBlock:v20];
  if ([v13 count])
  {
    uint64_t v18 = [(DirectUploadController *)self _sessionController];
    [v18 addUploadTasksWithRequests:v13];
  }
  [(DirectUploadController *)self _sendChangeUploadsMessageWithUploads:v15];

  return 1;
}

- (void)_retryFailedEntities
{
  [(MediaSocialErrorCoordinator *)self->_errorCoordinator dismissAllDialogs];
  [(MediaSocialErrorCoordinator *)self->_errorCoordinator setDelegate:0];
  errorCoordinator = self->_errorCoordinator;
  self->_errorCoordinator = 0;

  [(DirectUploadController *)self _databaseIfExists];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005DF48;
  v5[3] = &unk_1003A4538;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [v4 performTransactionWithBlock:v5];
}

- (void)_sendChangeUploadsMessageWithUploads:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableArray count](self->_clients, "count"))
  {
    id v5 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetObject();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_clients;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "outputConnection", (void)v12);
          [v11 sendMessage:v5];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_sendRemoveUploadsMessageWithUploadIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableArray count](self->_clients, "count"))
  {
    id v5 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetObject();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_clients;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "outputConnection", (void)v12);
          [v11 sendMessage:v5];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)_sessionController
{
  sessionController = self->_sessionController;
  if (!sessionController)
  {
    id v4 = [[DirectUploadSessionController alloc] initWithDispatchQueue:self->_dispatchQueue];
    id v5 = self->_sessionController;
    self->_sessionController = v4;

    [(DirectUploadSessionController *)self->_sessionController setDelegate:self];
    sessionController = self->_sessionController;
  }

  return sessionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_progressDictionary, 0);
  objc_storeStrong((id *)&self->_postOperationQueue, 0);
  objc_storeStrong((id *)&self->_pollingCoordinator, 0);
  objc_storeStrong((id *)&self->_errorCoordinator, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_backgroundTaskObserver, 0);

  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
}

@end