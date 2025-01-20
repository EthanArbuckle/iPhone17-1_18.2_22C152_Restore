@interface KTContextStore
- (BOOL)shouldGossip;
- (KTAccountKeyProtocol)accountKeyServer;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 settings:(id)a8 followup:(id)a9;
- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 stateMachine:(id)a8 kvs:(id)a9 settings:(id)a10 followup:(id)a11;
- (KTKVSProtocol)kvs;
- (KTPublicKeyStore)keyStore;
- (KTSMManager)stateMachine;
- (NSData)cachedGossip;
- (NSDictionary)contexts;
- (NSMutableDictionary)_contexts;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (id)createContextForApplication:(id)a3 dataStore:(id)a4 staticKeyStore:(id)a5 logClient:(id)a6 stateMachine:(id)a7;
- (id)createContextForTLT:(id)a3 staticKeyStore:(id)a4 logClient:(id)a5 stateMachine:(id)a6;
- (id)getCachedValidatePeerResults:(id)a3 application:(id)a4;
- (id)serializeTranscripts;
- (void)changeOptInState:(unint64_t)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6;
- (void)clearApplicationState:(id)a3 logClient:(id)a4 completionBlock:(id)a5;
- (void)clearContextForApplication:(id)a3;
- (void)clearGossip;
- (void)configureWithClient:(id)a3 applicationHandler:(id)a4 completionHandler:(id)a5;
- (void)configureWithClient:(id)a3 force:(BOOL)a4 applicationHandler:(id)a5 completionHandler:(id)a6;
- (void)contextForApplication:(id)a3 logClient:(id)a4 fetchState:(BOOL)a5 completionHandler:(id)a6;
- (void)failHeadDownload:(id)a3 application:(id)a4 failure:(id)a5 retry:(BOOL)a6 logClient:(id)a7;
- (void)forcedConfigure:(BOOL)a3 logClient:(id)a4 applicationHandler:(id)a5 completionHandler:(id)a6;
- (void)getKTOptInState:(id)a3 sync:(BOOL)a4 logClient:(id)a5 completionblock:(id)a6;
- (void)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 application:(id)a7 logClient:(id)a8 transparentDataHandler:(id)a9 completionHandler:(id)a10;
- (void)handlePeerStateChange:(id)a3 application:(id)a4;
- (void)ignoreFailure:(id)a3 error:(id *)a4;
- (void)ignoreFailureForResults:(id)a3 application:(id)a4 completionBlock:(id)a5;
- (void)queryForUris:(id)a3 application:(id)a4 logClient:(id)a5 userInitiated:(BOOL)a6 cachedYoungerThan:(id)a7 completionHandler:(id)a8;
- (void)receivedSTHsFromPeers:(id)a3 logClient:(id)a4 verifier:(id)a5 block:(id)a6;
- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 logClient:(id)a9 completionHandler:(id)a10;
- (void)retrieveTLTSTH:(id)a3 block:(id)a4;
- (void)rollKeyForApplication:(id)a3 logClient:(id)a4 completionBlock:(id)a5;
- (void)setAccountKeyServer:(id)a3;
- (void)setCachedGossip:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContext:(id)a3 forKey:(id)a4;
- (void)setDataStore:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setKeyStore:(id)a3;
- (void)setKvs:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)set_contexts:(id)a3;
- (void)signData:(id)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6;
- (void)storeContext:(id)a3 application:(id)a4;
- (void)validateEnrollmentRequestId:(id)a3 application:(id)a4 logClient:(id)a5 cloudOptIn:(id)a6 completionHandler:(id)a7;
- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 completionHandler:(id)a7;
- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 revalidate:(BOOL)a7 fetchNow:(BOOL)a8 completionHandler:(id)a9;
- (void)validatePeers:(id)a3 application:(id)a4 fetchNow:(BOOL)a5 logClient:(id)a6 completionBlock:(id)a7;
- (void)verifyHeadConsistencyDownload:(id)a3 application:(id)a4 logClient:(id)a5;
- (void)verifyHeadInclusionDownload:(id)a3 application:(id)a4 logClient:(id)a5;
@end

@implementation KTContextStore

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 stateMachine:(id)a8 kvs:(id)a9 settings:(id)a10 followup:(id)a11
{
  id v29 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v30.receiver = self;
  v30.super_class = (Class)KTContextStore;
  v25 = [(KTContextStore *)&v30 init];
  v26 = v25;
  if (v25)
  {
    [(KTContextStore *)v25 setKeyStore:v18];
    [(KTContextStore *)v26 setDataStore:v29];
    [(KTContextStore *)v26 setStaticKeyStore:v17];
    [(KTContextStore *)v26 setAccountKeyServer:v20];
    [(KTContextStore *)v26 setStateMachine:v21];
    [(KTContextStore *)v26 setKvs:v22];
    [(KTContextStore *)v26 setCloudRecords:v19];
    [(KTContextStore *)v26 setFollowup:v24];
    [(KTContextStore *)v26 setSettings:v23];
    v27 = +[NSMutableDictionary dictionary];
    [(KTContextStore *)v26 set_contexts:v27];
  }
  return v26;
}

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 settings:(id)a8 followup:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = +[KTKVSSoftStore sharedStore];
  id v24 = [(KTContextStore *)self initWithDataStore:v22 staticKeyStore:v21 keyStore:v20 cloudRecords:v19 accountKeyServer:v18 stateMachine:0 kvs:v23 settings:v17 followup:v16];

  return v24;
}

- (NSDictionary)contexts
{
  v3 = [(KTContextStore *)self _contexts];
  objc_sync_enter(v3);
  v4 = [(KTContextStore *)self _contexts];
  v5 = +[NSDictionary dictionaryWithDictionary:v4];

  objc_sync_exit(v3);

  return (NSDictionary *)v5;
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(KTContextStore *)self _contexts];
  objc_sync_enter(v7);
  v8 = [(KTContextStore *)self _contexts];
  [v8 setObject:v9 forKeyedSubscript:v6];

  objc_sync_exit(v7);
}

- (void)forcedConfigure:(BOOL)a3 logClient:(id)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  v13 = [(KTContextStore *)self keyStore];
  unsigned int v14 = [v13 ready];

  if (!v14 || v8)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBA10);
    }
    id v23 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v10;
      __int16 v33 = 1024;
      unsigned int v34 = v14;
      __int16 v35 = 1024;
      BOOL v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Configuring key store with log client %@, ready = %d, forced = %d", buf, 0x18u);
    }
    id v24 = [(KTContextStore *)self keyStore];
    v25 = [(KTContextStore *)self dataStore];
    [v24 configureWithClient:v10 ignoreCachedKeys:1 dataStore:v25 contextStore:self applicationHandler:v11 completionHandler:v12];
  }
  else
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBA30);
    }
    v15 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Key store configuration skipped. Using existing key stores.", buf, 2u);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = [(KTContextStore *)self keyStore];
    id v17 = [v16 applicationKeyStores];
    id v18 = [v17 allKeys];

    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          if (v11) {
            (*((void (**)(id, void, void))v11 + 2))(v11, *(void *)(*((void *)&v26 + 1) + 8 * i), 0);
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    if (v12) {
      v12[2](v12, 0);
    }
  }
}

- (void)configureWithClient:(id)a3 applicationHandler:(id)a4 completionHandler:(id)a5
{
}

- (void)configureWithClient:(id)a3 force:(BOOL)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
}

- (void)storeContext:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBA50);
    }
    BOOL v8 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KTContext initialization for application %{public}@ success", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [(KTContextStore *)self _contexts];
    objc_sync_enter(v9);
    id v10 = [(KTContextStore *)self _contexts];
    [v10 setValue:v6 forKey:v7];

    objc_sync_exit(v9);
  }
}

- (id)createContextForApplication:(id)a3 dataStore:(id)a4 staticKeyStore:(id)a5 logClient:(id)a6 stateMachine:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(KTContextStore *)self keyStore];
  id v18 = [v17 applicationKeyStores];
  id v19 = [v18 objectForKey:v12];

  if (v19)
  {
    id v20 = [(KTContextStore *)self keyStore];
    uint64_t v21 = [v20 applicationKeyStores];
    __int16 v35 = [v21 objectForKeyedSubscript:v12];

    id v22 = objc_alloc_init(KTContextDependencies);
    [(KTContextDependencies *)v22 setApplicationKeyStore:v35];
    [(KTContextDependencies *)v22 setDataStore:v13];
    id v23 = [(KTContextStore *)self stateMachine];
    id v24 = [v23 deps];
    v25 = [v24 smDataStore];
    [(KTContextDependencies *)v22 setSmDataStore:v25];

    [(KTContextDependencies *)v22 setLogClient:v15];
    [(KTContextDependencies *)v22 setStateMachine:v16];
    [(KTContextDependencies *)v22 setContextStore:self];
    long long v26 = [(KTContextStore *)self accountKeyServer];
    [(KTContextDependencies *)v22 setAccountKeyServer:v26];

    [(KTContextDependencies *)v22 setStaticKeyStore:v14];
    long long v27 = [(KTContextStore *)self kvs];
    [(KTContextDependencies *)v22 setKvs:v27];

    long long v28 = [(KTContextStore *)self cloudRecords];
    [(KTContextDependencies *)v22 setCloudRecords:v28];

    long long v29 = [(KTContextStore *)self followup];
    [(KTContextDependencies *)v22 setFollowup:v29];

    objc_super v30 = [v16 statusReporting];
    [(KTContextDependencies *)v22 setEligibilityStatusReporter:v30];

    v31 = [v16 deps];
    id v32 = [v31 tapToRadar];
    [(KTContextDependencies *)v22 setTapToRadar:v32];

    __int16 v33 = [(KTContextStore *)self settings];
    [(KTContextDependencies *)v22 setSettings:v33];

    id v19 = [[KTContext alloc] initWithApplicationID:v12 dependencies:v22];
    [(KTContextStore *)self storeContext:v19 application:v12];
  }

  return v19;
}

- (id)createContextForTLT:(id)a3 staticKeyStore:(id)a4 logClient:(id)a5 stateMachine:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(KTContextStore *)self keyStore];
  id v15 = [v14 tltKeyStore];

  id v16 = objc_alloc_init(KTContextDependencies);
  [(KTContextDependencies *)v16 setApplicationKeyStore:v15];
  [(KTContextDependencies *)v16 setDataStore:v13];

  [(KTContextDependencies *)v16 setLogClient:v11];
  [(KTContextDependencies *)v16 setStateMachine:v10];

  [(KTContextDependencies *)v16 setContextStore:self];
  id v17 = [(KTContextStore *)self accountKeyServer];
  [(KTContextDependencies *)v16 setAccountKeyServer:v17];

  [(KTContextDependencies *)v16 setStaticKeyStore:v12];
  id v18 = [(KTContextStore *)self settings];
  [(KTContextDependencies *)v16 setSettings:v18];

  id v19 = [KTContext alloc];
  uint64_t v20 = kKTApplicationIdentifierTLT;
  uint64_t v21 = [(KTContext *)v19 initWithApplicationID:kKTApplicationIdentifierTLT dependencies:v16];
  [(KTContextStore *)self storeContext:v21 application:v20];

  return v21;
}

- (void)contextForApplication:(id)a3 logClient:(id)a4 fetchState:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void))a6;
  id v13 = [(KTContextStore *)self contexts];
  id v14 = [v13 objectForKeyedSubscript:v10];

  if (v14 && [v14 ready:0])
  {
    v12[2](v12, v14, 0);
  }
  else if (v7)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBA70);
    }
    id v15 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Fetching state needed for application %@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    long long v29 = sub_10005B884;
    objc_super v30 = sub_10005B894;
    id v31 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005B89C;
    v22[3] = &unk_1002BBAB8;
    p_long long buf = &buf;
    id v23 = v10;
    id v24 = self;
    id v25 = v11;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005BA78;
    v17[3] = &unk_1002BBAE0;
    v17[4] = self;
    id v18 = v25;
    uint64_t v21 = &buf;
    uint64_t v20 = v12;
    id v19 = v23;
    [(KTContextStore *)self configureWithClient:v18 applicationHandler:v22 completionHandler:v17];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBB00);
    }
    id v16 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not fetching state needed for application %@", (uint8_t *)&buf, 0xCu);
    }
    v12[2](v12, 0, 0);
  }
}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 revalidate:(BOOL)a7 fetchNow:(BOOL)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if ([v18 ready])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005BE0C;
    v22[3] = &unk_1002BBB28;
    id v26 = v19;
    id v23 = v16;
    id v24 = v17;
    id v25 = v15;
    BOOL v27 = a7;
    BOOL v28 = a8;
    [(KTContextStore *)self contextForApplication:v24 logClient:v18 fetchState:1 completionHandler:v22];
  }
  else
  {
    uint64_t v20 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-229 description:@"log client not ready"];
    id v21 = [objc_alloc((Class)KTVerifierResult) initWithUri:v16 application:v17 ktResult:2];
    (*((void (**)(id, id, void *))v19 + 2))(v19, v21, v20);
  }
}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 completionHandler:(id)a7
{
}

- (void)validateEnrollmentRequestId:(id)a3 application:(id)a4 logClient:(id)a5 cloudOptIn:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 ready])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005C0BC;
    v18[3] = &unk_1002BBB50;
    id v22 = v16;
    id v19 = v13;
    id v20 = v12;
    id v21 = v15;
    [(KTContextStore *)self contextForApplication:v19 logClient:v14 fetchState:1 completionHandler:v18];
  }
  else
  {
    id v17 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-229 description:@"log client not ready"];
    (*((void (**)(id, uint64_t, void, void, void *))v16 + 2))(v16, 2, 0, 0, v17);
  }
}

- (void)ignoreFailure:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_100326820 != -1) {
    dispatch_once(&qword_100326820, &stru_1002BBB70);
  }
  BOOL v7 = (void *)qword_100326828;
  if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    id v9 = [v6 requestId];
    int v15 = 138543362;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving ignored failure for requestId %{public}@", (uint8_t *)&v15, 0xCu);
  }
  [v6 setVerificationResult:3];
  id v10 = [(KTContextStore *)self dataStore];
  unsigned __int8 v11 = [v10 persistWithError:a4];

  if ((v11 & 1) == 0)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBB90);
    }
    id v12 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to save updated request: %@", (uint8_t *)&v15, 0xCu);
    }
    if (a4 && *a4)
    {
      id v14 = [(KTContextStore *)self dataStore];
      [v14 reportCoreDataPersistEventForLocation:@"updateRequest" underlyingError:*a4];
    }
  }
}

- (void)clearApplicationState:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_100326820 != -1) {
    dispatch_once(&qword_100326820, &stru_1002BBBB0);
  }
  unsigned __int8 v11 = qword_100326828;
  if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Clearing KT context for application '%@'", buf, 0xCu);
  }
  id v12 = [(KTContextStore *)self dataStore];
  id v17 = 0;
  [v12 clearStateForApplication:v8 error:&v17];
  id v13 = v17;

  if (v13)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBBD0);
    }
    id v14 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed clearing managed data store: %@", buf, 0xCu);
    }
  }

  int v15 = [(KTContextStore *)self keyStore];
  uint64_t v16 = 0;
  [v15 clearApplicationState:v8 error:&v16];

  [(KTContextStore *)self configureWithClient:v9 force:1 applicationHandler:&stru_1002BBC10 completionHandler:v10];
}

- (void)clearContextForApplication:(id)a3
{
  id v6 = a3;
  v4 = [(KTContextStore *)self _contexts];
  objc_sync_enter(v4);
  v5 = [(KTContextStore *)self _contexts];
  [v5 setObject:0 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (void)verifyHeadInclusionDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005C980;
  v11[3] = &unk_1002BBC78;
  id v12 = a4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  [(KTContextStore *)self contextForApplication:v10 logClient:a5 fetchState:1 completionHandler:v11];
}

- (void)verifyHeadConsistencyDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005CBFC;
  v11[3] = &unk_1002BBC78;
  id v12 = a4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  [(KTContextStore *)self contextForApplication:v10 logClient:a5 fetchState:1 completionHandler:v11];
}

- (void)failHeadDownload:(id)a3 application:(id)a4 failure:(id)a5 retry:(BOOL)a6 logClient:(id)a7
{
  id v11 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005CEC0;
  v16[3] = &unk_1002BBCC0;
  id v17 = a4;
  id v18 = self;
  id v19 = v11;
  id v20 = a5;
  id v21 = a7;
  id v12 = v21;
  id v13 = v20;
  id v14 = v11;
  id v15 = v17;
  [(KTContextStore *)self contextForApplication:v15 logClient:v12 fetchState:1 completionHandler:v16];
}

- (id)serializeTranscripts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(KTContextStore *)self contexts];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D048;
  v7[3] = &unk_1002BBCE8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)clearGossip
{
}

- (void)retrieveTLTSTH:(id)a3 block:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  if (![(KTContextStore *)self shouldGossip])
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBD08);
    }
    id v13 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "All applications have exceeded 30 days since shutting down.", buf, 2u);
    }
    id v12 = +[TransparencyAnalytics formatEventName:@"GossipAllApplicationsShutDownAfter30Days" application:kKTApplicationIdentifierTLT];
    uint64_t v14 = kTransparencyErrorGossip;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"All applications have exceeded 30 days since shutting down.";
    id v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v16 = +[NSError errorWithDomain:v14 code:-280 userInfo:v15];

    id v17 = +[TransparencyAnalytics logger];
    [v17 logResultForEvent:v12 hardFailure:0 result:v16];

    v7[2](v7, 0, v16);
    goto LABEL_14;
  }
  id v8 = [(KTContextStore *)self cachedGossip];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(KTContextStore *)self cachedGossip];
    id v10 = +[NSData data];

    if (v9 != v10)
    {
      if (qword_100326820 != -1) {
        dispatch_once(&qword_100326820, &stru_1002BBD28);
      }
      id v11 = qword_100326828;
      if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Sending cached gossip", buf, 2u);
      }
      id v12 = [(KTContextStore *)self cachedGossip];
      ((void (**)(id, void *, void *))v7)[2](v7, v12, 0);
LABEL_14:

      goto LABEL_23;
    }
  }
  else
  {
  }
  id v18 = [(KTContextStore *)self cachedGossip];
  id v19 = +[NSData data];

  if (v18 == v19)
  {
    if (qword_100326820 != -1) {
      dispatch_once(&qword_100326820, &stru_1002BBD48);
    }
    id v21 = qword_100326828;
    if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Sending empty cached gossip", buf, 2u);
    }
    v7[2](v7, 0, 0);
  }
  else
  {
    uint64_t v20 = kKTApplicationIdentifierTLT;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005D584;
    v22[3] = &unk_1002BBDB0;
    void v22[4] = self;
    id v23 = v7;
    [(KTContextStore *)self contextForApplication:v20 logClient:v6 fetchState:1 completionHandler:v22];
  }
LABEL_23:
}

- (void)receivedSTHsFromPeers:(id)a3 logClient:(id)a4 verifier:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = kKTApplicationIdentifierTLT;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005D95C;
  v17[3] = &unk_1002BBDD8;
  id v19 = v11;
  id v20 = v12;
  id v18 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [(KTContextStore *)self contextForApplication:v13 logClient:a4 fetchState:1 completionHandler:v17];
}

- (BOOL)shouldGossip
{
  uint64_t v3 = [(KTContextStore *)self contexts];
  if (!v3) {
    return 1;
  }
  v4 = (void *)v3;
  id v5 = [(KTContextStore *)self contexts];
  id v6 = [v5 count];

  if (!v6) {
    return 1;
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v7 = [(KTContextStore *)self contexts];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005DB50;
  v10[3] = &unk_1002BBE00;
  v10[4] = &v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)signData:(id)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = kKTApplicationIdentifierTLT;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005DC70;
  v14[3] = &unk_1002BBDB0;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  [(KTContextStore *)self contextForApplication:v11 logClient:a5 fetchState:1 completionHandler:v14];
}

- (void)rollKeyForApplication:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = kKTApplicationIdentifierTLT;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005DDE4;
  v10[3] = &unk_1002BBE28;
  id v11 = v7;
  id v9 = v7;
  [(KTContextStore *)self contextForApplication:v8 logClient:a4 fetchState:1 completionHandler:v10];
}

- (void)getKTOptInState:(id)a3 sync:(BOOL)a4 logClient:(id)a5 completionblock:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005DF74;
  v12[3] = &unk_1002BBE50;
  id v13 = a3;
  id v14 = a6;
  BOOL v15 = a4;
  id v10 = v14;
  id v11 = v13;
  [(KTContextStore *)self contextForApplication:v11 logClient:a5 fetchState:1 completionHandler:v12];
}

- (void)changeOptInState:(unint64_t)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005E130;
  v13[3] = &unk_1002BBE78;
  id v16 = a6;
  unint64_t v17 = a3;
  id v14 = v10;
  BOOL v15 = self;
  id v11 = v16;
  id v12 = v10;
  [(KTContextStore *)self contextForApplication:v12 logClient:a5 fetchState:1 completionHandler:v13];
}

- (void)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 application:(id)a7 logClient:(id)a8 transparentDataHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005E3A0;
  v27[3] = &unk_1002BBEA0;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  id v32 = a10;
  id v33 = v20;
  id v21 = v20;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v32;
  [(KTContextStore *)self contextForApplication:a7 logClient:a8 fetchState:1 completionHandler:v27];
}

- (void)queryForUris:(id)a3 application:(id)a4 logClient:(id)a5 userInitiated:(BOOL)a6 cachedYoungerThan:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005E580;
  v19[3] = &unk_1002BBEE8;
  id v20 = a4;
  id v21 = v14;
  BOOL v24 = a6;
  id v22 = a7;
  id v23 = a8;
  id v15 = v22;
  id v16 = v14;
  id v17 = v23;
  id v18 = v20;
  [(KTContextStore *)self contextForApplication:v18 logClient:a5 fetchState:1 completionHandler:v19];
}

- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 logClient:(id)a9 completionHandler:(id)a10
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005E894;
  v22[3] = &unk_1002BBF10;
  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a10;
  id v16 = v27;
  id v17 = v26;
  id v18 = v25;
  id v19 = v24;
  id v20 = v23;
  id v21 = v28;
  [(KTContextStore *)self contextForApplication:a4 logClient:a9 fetchState:1 completionHandler:v22];
}

- (void)validatePeers:(id)a3 application:(id)a4 fetchNow:(BOOL)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005E9D0;
  v16[3] = &unk_1002BBF38;
  id v18 = a4;
  id v19 = a7;
  id v17 = v12;
  BOOL v20 = a5;
  id v13 = v18;
  id v14 = v12;
  id v15 = v19;
  [(KTContextStore *)self contextForApplication:v13 logClient:a6 fetchState:1 completionHandler:v16];
}

- (void)ignoreFailureForResults:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = [(KTContextStore *)self dataStore];
  id v11 = 0;
  [v9 ignoreFailureForResults:v8 error:&v11];

  id v10 = v11;
  v7[2](v7, v10);
}

- (void)handlePeerStateChange:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = [(KTContextStore *)self getCachedValidatePeerResults:v6 application:a4];
  if (qword_100326820 != -1) {
    dispatch_once(&qword_100326820, &stru_1002BBF58);
  }
  id v8 = (void *)qword_100326828;
  if (os_log_type_enabled((os_log_t)qword_100326828, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v6 componentsJoinedByString:@", "];
    int v12 = 138412290;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HandlePeerStateChange will update IDS cache for %@", (uint8_t *)&v12, 0xCu);
  }
  id v11 = [(KTContextStore *)self dataStore];
  [v11 updateIDSCacheWithResults:v7];
}

- (id)getCachedValidatePeerResults:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [(KTContextStore *)self dataStore];
        id v16 = [v15 verifierResultForPeer:v14 application:v7];

        if (v16)
        {
          [v8 addObject:v16];
        }
        else
        {
          id v17 = [objc_alloc((Class)KTVerifierResult) initUnavailableForUri:v14 application:v7];
          [v8 addObject:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

- (KTSMManager)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stateMachine);

  return (KTSMManager *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTPublicKeyStore)keyStore
{
  return (KTPublicKeyStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyStore:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettings:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (NSMutableDictionary)_contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_contexts:(id)a3
{
}

- (NSData)cachedGossip
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedGossip:(id)a3
{
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKvs:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_cachedGossip, 0);
  objc_storeStrong((id *)&self->__contexts, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_destroyWeak((id *)&self->stateMachine);
}

@end