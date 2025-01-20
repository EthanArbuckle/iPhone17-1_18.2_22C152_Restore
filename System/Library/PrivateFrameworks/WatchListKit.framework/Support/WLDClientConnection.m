@interface WLDClientConnection
- (NSString)clientIdentifier;
- (NSXPCConnection)connection;
- (WLDClientConnection)initWithConnection:(id)a3 clientIdentifier:(id)a4;
- (WLDClientConnectionDelegate)delegate;
- (void)_didInvalidate;
- (void)checkPendingPlaybackReports;
- (void)clearOffers:(id)a3;
- (void)deletePlaybackActivityWithIdentifier:(id)a3 bundleID:(id)a4;
- (void)endPlaybackSession:(id)a3;
- (void)fetchApplications:(id)a3;
- (void)fetchLocationAuthorizationStatus:(id)a3;
- (void)fetchOffers:(BOOL)a3 completion:(id)a4;
- (void)fetchSettings:(id)a3;
- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(int)a4 completion:(id)a5;
- (void)performSportsFavoritesAction:(unint64_t)a3 favoritesSyncEnabled:(BOOL)a4 caller:(id)a5 completion:(id)a6;
- (void)performSportsFavoritesAction:(unint64_t)a3 ids:(id)a4 caller:(id)a5 completion:(id)a6;
- (void)ping;
- (void)postSettings:(id)a3 replyHandler:(id)a4;
- (void)prewarm;
- (void)readSettingsStore:(id)a3;
- (void)refreshSubscriptionData:(BOOL)a3;
- (void)removeOfferByBadgeId:(id)a3 completionHandler:(id)a4;
- (void)reportFederatedPunchout:(id)a3;
- (void)reportPlayback:(id)a3 completion:(id)a4;
- (void)reportPlayback:(id)a3 sessionID:(id)a4 completion:(id)a5;
- (void)requestConsentForBundleID:(id)a3 forceAuth:(BOOL)a4 replyHandler:(id)a5;
- (void)requestDecoratedNowPlayingSummaries:(id)a3;
- (void)requestNowPlayingSummaries:(id)a3;
- (void)saveOffer:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)vppaConsentedBundleIDsWithCompletion:(id)a3;
- (void)writeSettingsStore:(id)a3 replyHandler:(id)a4;
@end

@implementation WLDClientConnection

- (void)ping
{
}

void __46__WLDClientConnection_fetchOffers_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a2;
    v7 = +[WLKSanitizer sanitizeError:a3];
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v7);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)fetchApplications:(id)a3
{
  if (a3)
  {
    v3 = (void (**)(id, void *))a3;
    id v6 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchApplications"];
    uint64_t v4 = +[WLKAppLibrary defaultAppLibrary];
    v5 = [v4 allAppProxiesPerCategory];
    v3[2](v3, v5);
  }
}

- (void)checkPendingPlaybackReports
{
  id v2 = +[WLDPlaybackManager sharedManager];
  [v2 checkPendingReports];
}

- (void)fetchOffers:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  id v12 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchOffers"];
  id v6 = +[WLKOfferManager defaultOfferManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __46__WLDClientConnection_fetchOffers_completion___block_invoke;
  v8[3] = &unk_100044CF0;
  id v7 = v5;
  id v9 = v7;
  v10 = v11;
  [v6 fetchOffers:v4 completion:v8];

  _Block_object_dispose(v11, 8);
}

- (void)clearOffers:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchOffers"];
  BOOL v4 = +[WLKOfferManager defaultOfferManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __35__WLDClientConnection_clearOffers___block_invoke;
  v6[3] = &unk_100044CC8;
  id v5 = v3;
  id v7 = v5;
  uint64_t v8 = v9;
  [v4 clearOffers:v6];

  _Block_object_dispose(v9, 8);
}

- (void)readSettingsStore:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.readSettingsStore"];
  BOOL v4 = +[WLKSettingsStore sharedSettings];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __41__WLDClientConnection_readSettingsStore___block_invoke;
  v6[3] = &unk_100044B58;
  id v5 = v3;
  id v7 = v5;
  uint64_t v8 = v9;
  [v4 _dictionaryOnDisk:v6];

  _Block_object_dispose(v9, 8);
}

void __35__WLDClientConnection_clearOffers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    BOOL v4 = +[WLKSanitizer sanitizeError:a2];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(int)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchSubscriptionData"];
  uint64_t v8 = +[WLDSubscriptionStore sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __72__WLDClientConnection_fetchSubscriptionData_callerProcessID_completion___block_invoke;
  v10[3] = &unk_100044D18;
  id v9 = v7;
  id v11 = v9;
  id v12 = v13;
  [v8 fetchSubscriptionData:v6 callerProcessID:a4 completion:v10];

  _Block_object_dispose(v13, 8);
}

void __72__WLDClientConnection_fetchSubscriptionData_callerProcessID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempt to xpc encode SubscriptionData which has wrong type.", buf, 2u);
        }

        id v5 = 0;
      }
    }
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempt to xpc encode SubscriptionData error which has wrong type.", v12, 2u);
        }

        id v6 = 0;
      }
    }
    id v9 = +[WLKSanitizer sanitizeError:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)setDelegate:(id)a3
{
}

- (WLDClientConnection)initWithConnection:(id)a3 clientIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)WLDClientConnection;
  id v9 = [(WLDClientConnection *)&v27 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    id v11 = (NSString *)[v8 copy];
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = v11;

    connection = v10->_connection;
    id v14 = WLKConnectionClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v14];

    uint64_t v15 = [(NSXPCConnection *)v10->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global];
    remoteObjectProxy = v10->_remoteObjectProxy;
    v10->_remoteObjectProxy = (WLKConnectionClientProtocol *)v15;

    v17 = v10->_connection;
    v18 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v17 setExportedInterface:v18];

    [(NSXPCConnection *)v10->_connection setExportedObject:v10];
    objc_initWeak(&location, v10);
    v19 = v10->_connection;
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = __59__WLDClientConnection_initWithConnection_clientIdentifier___block_invoke_2;
    v24 = &unk_100044AE0;
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v19 setInvalidationHandler:&v21];
    [(NSXPCConnection *)v10->_connection resume];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __41__WLDClientConnection_readSettingsStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __59__WLDClientConnection_initWithConnection_clientIdentifier___block_invoke(id a1, NSError *a2)
{
}

void __59__WLDClientConnection_initWithConnection_clientIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didInvalidate];
    id WeakRetained = v2;
  }
}

- (void)deletePlaybackActivityWithIdentifier:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.deletePlaybackActivityWithIdentifier"];
  if (v5 && v6)
  {
    NSLog(@"Delete requested for content ID: %@, bundle ID: %@", v5, v6);
    id v7 = [objc_alloc((Class)WLKPlayHistoryRemoveRequest) initWithBundleID:v6 externalID:v5];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __69__WLDClientConnection_deletePlaybackActivityWithIdentifier_bundleID___block_invoke;
    v8[3] = &unk_100044B08;
    void v8[4] = &v9;
    [v7 makeRequestWithCompletion:v8];
  }
  else
  {
    NSLog(@"Invalid delete requested for content ID: %@, bundle ID: %@. Ignoring.", v5, v6);
    id v7 = (id)v10[5];
    v10[5] = 0;
  }

  _Block_object_dispose(&v9, 8);
}

void __69__WLDClientConnection_deletePlaybackActivityWithIdentifier_bundleID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)requestNowPlayingSummaries:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.requestNowPlayingSummaries"];
  BOOL v4 = +[WLDPlaybackManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __50__WLDClientConnection_requestNowPlayingSummaries___block_invoke;
  v6[3] = &unk_100044B30;
  id v5 = v3;
  id v7 = v5;
  id v8 = v9;
  [v4 fetchNowPlayingSummaries:v6];

  _Block_object_dispose(v9, 8);
}

void __50__WLDClientConnection_requestNowPlayingSummaries___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)requestDecoratedNowPlayingSummaries:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.requestDecoratedNowPlayingSummaries"];
  BOOL v4 = +[WLDPlaybackManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __59__WLDClientConnection_requestDecoratedNowPlayingSummaries___block_invoke;
  v6[3] = &unk_100044B58;
  id v5 = v3;
  id v7 = v5;
  id v8 = v9;
  [v4 fetchDecoratedNowPlayingSummaries:v6];

  _Block_object_dispose(v9, 8);
}

void __59__WLDClientConnection_requestDecoratedNowPlayingSummaries___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)reportPlayback:(id)a3 completion:(id)a4
{
}

- (void)reportPlayback:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.reportPlayback"];
  uint64_t v11 = [(WLDClientConnection *)self connection];
  uint64_t v12 = WLKEntitlementPlaybackReport;
  BOOL HasBoolValueForEntitlement = WLDConnectionHasBoolValueForEntitlement(v11, WLKEntitlementPlaybackReport);

  if (HasBoolValueForEntitlement)
  {
    id v14 = +[WLDPlaybackManager sharedManager];
    [v14 handleDirectPlaybackSummary:v17 sessionID:v8];

    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
  else
  {
    uint64_t v15 = +[NSString stringWithFormat:@"Ignoring reportPlayback request from client lacking the entitlement: %@", v12];
    NSLog(@"Error: %@", v15);
    if (v9)
    {
      v16 = WLKError();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v16);
    }
  }
}

- (void)endPlaybackSession:(id)a3
{
  id v3 = a3;
  id v4 = +[WLDPlaybackManager sharedManager];
  [v4 endDirectPlaybackSession:v3];
}

- (void)requestConsentForBundleID:(id)a3 forceAuth:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6)
  {
    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_34);
  }
  id v10 = objc_alloc_init(WLDPlaybackManager);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __72__WLDClientConnection_requestConsentForBundleID_forceAuth_replyHandler___block_invoke_3;
  v12[3] = &unk_100044C00;
  id v13 = v8;
  id v11 = v8;
  [(WLDPlaybackManager *)v10 requestToPromptForBundleID:v7 completionHandler:v12];
}

void __72__WLDClientConnection_requestConsentForBundleID_forceAuth_replyHandler___block_invoke(id a1)
{
  NSLog(@"Start auth");
  id v1 = objc_alloc((Class)AMSAuthenticateTask);
  uint64_t v2 = +[ACAccountStore ams_sharedAccountStore];
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  id v5 = [v1 initWithAccount:v3 options:0];

  id v4 = [v5 performAuthentication];
  [v4 addFinishBlock:&__block_literal_global_42];
}

void __72__WLDClientConnection_requestConsentForBundleID_forceAuth_replyHandler___block_invoke_2(id a1, AMSAuthenticateResult *a2, NSError *a3)
{
}

uint64_t __72__WLDClientConnection_requestConsentForBundleID_forceAuth_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)writeSettingsStore:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  void v12[4] = __Block_byref_object_dispose_;
  id v13 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.writeSettingsStore"];
  id v7 = +[WLKSettingsStore sharedSettings];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __55__WLDClientConnection_writeSettingsStore_replyHandler___block_invoke;
  v9[3] = &unk_100044C28;
  id v8 = v6;
  id v10 = v8;
  id v11 = v12;
  [v7 _writeToDisk:v5 completion:v9];

  _Block_object_dispose(v12, 8);
}

void __55__WLDClientConnection_writeSettingsStore_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)postSettings:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  id v12 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.postSettings"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__WLDClientConnection_postSettings_replyHandler___block_invoke;
  v8[3] = &unk_100044C50;
  id v7 = v6;
  id v9 = v7;
  id v10 = v11;
  +[WLKSettingsCloudUtilities _postChangeDictionaryToCloud:v5 completion:v8];

  _Block_object_dispose(v11, 8);
}

void __49__WLDClientConnection_postSettings_replyHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[WLKSanitizer sanitizeError:](WLKSanitizer, "sanitizeError:");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)fetchSettings:(id)a3
{
  id v3 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy_;
  void v8[4] = __Block_byref_object_dispose_;
  id v9 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchSettings"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __37__WLDClientConnection_fetchSettings___block_invoke;
  v5[3] = &unk_100044C78;
  id v4 = v3;
  id v6 = v4;
  id v7 = v8;
  +[WLKSettingsCloudUtilities _fetchSyncDictionary:v5];

  _Block_object_dispose(v8, 8);
}

void __37__WLDClientConnection_fetchSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a2;
    id v6 = +[WLKSanitizer sanitizeError:a3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)fetchLocationAuthorizationStatus:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  void v9[4] = __Block_byref_object_dispose_;
  id v10 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.fetchLocationAuthorizationStatus"];
  id v4 = +[WLKLocationManager defaultLocationManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __56__WLDClientConnection_fetchLocationAuthorizationStatus___block_invoke;
  v6[3] = &unk_100044CA0;
  id v5 = v3;
  id v7 = v5;
  id v8 = v9;
  [v4 _locationAuthorizationStatus:v6];

  _Block_object_dispose(v9, 8);
}

void __56__WLDClientConnection_fetchLocationAuthorizationStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)prewarm
{
  id v3 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.prewarm"];
  uint64_t v2 = +[TVAppBag app];
  [v2 prewarm];
}

- (void)saveOffer:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  void v12[4] = __Block_byref_object_dispose_;
  id v13 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.saveOffer"];
  id v7 = +[WLKOfferManager defaultOfferManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __51__WLDClientConnection_saveOffer_completionHandler___block_invoke;
  v9[3] = &unk_100044CC8;
  id v8 = v6;
  id v10 = v8;
  id v11 = v12;
  [v7 saveOffer:v5 completionHandler:v9];

  _Block_object_dispose(v12, 8);
}

void __51__WLDClientConnection_saveOffer_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = +[WLKSanitizer sanitizeError:a2];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)removeOfferByBadgeId:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  void v12[4] = __Block_byref_object_dispose_;
  id v13 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.removeOffer"];
  id v7 = +[WLKOfferManager defaultOfferManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__WLDClientConnection_removeOfferByBadgeId_completionHandler___block_invoke;
  v9[3] = &unk_100044CC8;
  id v8 = v6;
  id v10 = v8;
  id v11 = v12;
  [v7 removeOfferByBadgeId:v5 completionHandler:v9];

  _Block_object_dispose(v12, 8);
}

void __62__WLDClientConnection_removeOfferByBadgeId_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = +[WLKSanitizer sanitizeError:a2];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)reportFederatedPunchout:(id)a3
{
  id v3 = a3;
  id v4 = +[WLDFederatedPunchoutReporter sharedFederatedPunchoutReporter];
  [v4 recordPunchout:v3];
}

- (void)refreshSubscriptionData:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy_;
  void v6[4] = __Block_byref_object_dispose_;
  id v7 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.refreshSubscriptionData"];
  id v4 = +[WLDSubscriptionStore sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __47__WLDClientConnection_refreshSubscriptionData___block_invoke;
  v5[3] = &unk_100044D40;
  void v5[4] = v6;
  [v4 fetchSubscriptionData:v3 callerProcessID:_WLKSystemSubscriptionPID completion:v5];

  _Block_object_dispose(v6, 8);
}

void __47__WLDClientConnection_refreshSubscriptionData___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)vppaConsentedBundleIDsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[WLDChannelManager defaultChannelManager];
  [v4 vppaConsentedBundleIDsWithCompletion:v3];
}

- (void)performSportsFavoritesAction:(unint64_t)a3 ids:(id)a4 caller:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  id v18 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.performSportsFavoritesAction"];
  id v12 = +[WLKSportsFavoriteManager defaultManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __74__WLDClientConnection_performSportsFavoritesAction_ids_caller_completion___block_invoke;
  v14[3] = &unk_100044D68;
  id v13 = v11;
  id v15 = v13;
  v16 = v17;
  [v12 _performAction:a3 withIDs:v9 caller:v10 completion:v14];

  _Block_object_dispose(v17, 8);
}

void __74__WLDClientConnection_performSportsFavoritesAction_ids_caller_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v15), "ID", (void)v21);
        [v10 addObject:v16];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = [v10 allObjects];
  (*(void (**)(uint64_t, void *, id, id))(v17 + 16))(v17, v18, v8, v9);

  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = 0;
}

- (void)performSportsFavoritesAction:(unint64_t)a3 favoritesSyncEnabled:(BOOL)a4 caller:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v17 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDClientConnection.performSportsFavoritesAction"];
  id v11 = +[WLKSportsFavoriteManager defaultManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __91__WLDClientConnection_performSportsFavoritesAction_favoritesSyncEnabled_caller_completion___block_invoke;
  v13[3] = &unk_100044C50;
  id v12 = v10;
  id v14 = v12;
  id v15 = v16;
  [v11 _performUserSettingsAction:a3 setFavoritesSyncEnabled:v7 caller:v9 completion:v13];

  _Block_object_dispose(v16, 8);
}

void __91__WLDClientConnection_performSportsFavoritesAction_favoritesSyncEnabled_caller_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_didInvalidate
{
  NSLog(@"Connection invalidated for client: %@", a2, self->_clientIdentifier);
  connection = self->_connection;
  self->_connection = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 clientConnectionDidInvalidate:self];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (WLDClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLDClientConnectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
}

@end