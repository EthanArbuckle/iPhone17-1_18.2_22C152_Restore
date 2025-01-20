@interface KTLogClient
+ (id)formatEventName:(id)a3 application:(id)a4 state:(id)a5;
+ (id)formatEventName:(id)a3 state:(id)a4;
+ (id)requiredBagKeys;
- (BOOL)configured;
- (BOOL)shouldUseReversePush:(BOOL)a3;
- (KTLogClient)init;
- (KTLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6;
- (KTLogClient)initWithSettings:(id)a3;
- (KTSMTriggerInterface)triggerInterface;
- (NSURL)consistencyProofURI;
- (NSURL)publicKeysURI;
- (TransparencyConfigBag)configBag;
- (double)idmsFetchTime;
- (double)overrideIDMSFetchTime;
- (id)batchQueryURI;
- (id)copyConfigurationBag:(id *)a3;
- (id)queryURI;
- (id)reportToAppleURI;
- (id)revisionLogProofURI;
- (unint64_t)batchQueryMaxURIs;
- (unint64_t)consistencyMaxProofs;
- (unint64_t)currentEnvironment;
- (unint64_t)revisionLogMaxProofs;
- (unint64_t)userReversePushPercentage;
- (unint64_t)xpcActivityReversePushPercentage;
- (void)clearState:(id *)a3;
- (void)configure:(id)a3;
- (void)configureFromNetwork:(id)a3;
- (void)fetchBatchQueries:(id)a3 userInitiated:(BOOL)a4 responseHandler:(id)a5 completionHandler:(id)a6;
- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchConfigBag:(id)a3 completionHandler:(id)a4;
- (void)fetchConsistencyProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchMessage:(id)a3 uri:(id)a4 uuid:(id)a5 application:(id)a6 userInitiated:(BOOL)a7 completionHandler:(id)a8;
- (void)fetchPublicKeys:(id)a3 completionHandler:(id)a4;
- (void)fetchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchRevisionLogInclusionProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)postReport:(id)a3 uuid:(id)a4 application:(id)a5 completionHandler:(id)a6;
- (void)setConfigBag:(id)a3;
- (void)setCurrentEnvironment:(unint64_t)a3;
- (void)setOverrideIDMSFetchTime:(double)a3;
- (void)setTriggerInterface:(id)a3;
- (void)triggerConfigBagFetch:(double)a3;
@end

@implementation KTLogClient

+ (id)requiredBagKeys
{
  v4[0] = @"build-version";
  v5[0] = objc_opt_class();
  v4[1] = @"rest-query";
  v5[1] = objc_opt_class();
  v4[2] = @"rest-batch-query";
  v5[2] = objc_opt_class();
  v4[3] = @"batch-query-max-uris";
  v5[3] = objc_opt_class();
  v4[4] = @"batch-log-inclusion-max-proofs";
  v5[4] = objc_opt_class();
  v4[5] = @"batch-consistency-max-proofs";
  v5[5] = objc_opt_class();
  v4[6] = @"rest-consistency-proof";
  v5[6] = objc_opt_class();
  v4[7] = @"rest-public-keys";
  v5[7] = objc_opt_class();
  v4[8] = @"rest-revision-log-inclusion-proof";
  v5[8] = objc_opt_class();
  v4[9] = @"rest-report-to-apple";
  v5[9] = objc_opt_class();
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];

  return v2;
}

- (KTLogClient)init
{
  id v3 = objc_alloc_init((Class)TransparencySettings);
  v4 = [(KTLogClient *)self initWithSettings:v3];

  return v4;
}

- (KTLogClient)initWithSettings:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KTLogClient;
  v5 = [(KTLogClient *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(KTLogClient *)v5 setOverrideIDMSFetchTime:604800.0];
    [(TransparencyLogClient *)v6 setSettings:v4];
    v7 = [(TransparencyLogClient *)v6 settings];
    -[KTLogClient setCurrentEnvironment:](v6, "setCurrentEnvironment:", [v7 getEnvironment]);

    v8 = [TransparencyConfigBag alloc];
    v9 = +[KTLogClient requiredBagKeys];
    v10 = [(TransparencyLogClient *)v6 settings];
    v11 = +[TransparencyFileSupport transparencyFilesPath:0];
    v12 = [(TransparencyConfigBag *)v8 initWithRequiredKeys:v9 settings:v10 directory:v11 configApp:1];
    [(KTLogClient *)v6 setConfigBag:v12];
  }
  return v6;
}

- (KTLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KTLogClient;
  v11 = [(TransparencyLogClient *)&v19 initWithBackgroundSession:a3 transparencyAnalytics:a4 dataStore:a5 settings:v10];
  v12 = v11;
  if (v11)
  {
    [(KTLogClient *)v11 setOverrideIDMSFetchTime:604800.0];
    v13 = [(TransparencyLogClient *)v12 settings];
    -[KTLogClient setCurrentEnvironment:](v12, "setCurrentEnvironment:", [v13 getEnvironment]);

    objc_super v14 = [TransparencyConfigBag alloc];
    v15 = +[KTLogClient requiredBagKeys];
    v16 = +[TransparencyFileSupport transparencyFilesPath:0];
    v17 = [(TransparencyConfigBag *)v14 initWithRequiredKeys:v15 settings:v10 directory:v16 configApp:1];
    [(KTLogClient *)v12 setConfigBag:v17];
  }
  return v12;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  v5 = [(KTLogClient *)self configBag];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C4A5C;
  v7[3] = &unk_1002B9FC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureWithFetcher:self completionHandler:v7];
}

- (void)configureFromNetwork:(id)a3
{
  id v4 = a3;
  v5 = [(KTLogClient *)self configBag];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C4B98;
  v7[3] = &unk_1002B9FC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureFromNetworkWithFetcher:self completionHandler:v7];
}

- (BOOL)configured
{
  v2 = [(KTLogClient *)self configBag];
  unsigned __int8 v3 = [v2 configured];

  return v3;
}

- (void)clearState:(id *)a3
{
  id v4 = [(KTLogClient *)self configBag];
  [v4 clearState:a3];
}

- (void)fetchConfigBag:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C4D50;
  v7[3] = &unk_1002C67E8;
  id v8 = a4;
  id v6 = v8;
  [(TransparencyLogClient *)self fetch:a3 allowEmptyData:0 useReversePush:0 completionHandler:v7];
}

- (void)triggerConfigBagFetch:(double)a3
{
  id v4 = [(KTLogClient *)self triggerInterface];
  [v4 triggerConfigBagFetch:a3];
}

+ (id)formatEventName:(id)a3 state:(id)a4
{
  return +[NSString stringWithFormat:@"%@-%@", a3, a4];
}

+ (id)formatEventName:(id)a3 application:(id)a4 state:(id)a5
{
  return +[NSString stringWithFormat:@"kt%@%@-%@", a4, a3, a5];
}

- (double)idmsFetchTime
{
  [(KTLogClient *)self overrideIDMSFetchTime];
  return result;
}

- (id)copyConfigurationBag:(id *)a3
{
  id v4 = [(KTLogClient *)self configBag];
  id v5 = [v4 copyConfigurationBag:a3];

  return v5;
}

- (unint64_t)userReversePushPercentage
{
  unsigned __int8 v3 = [(KTLogClient *)self configBag];
  unsigned int v4 = [v3 overrideReversePushConfig];

  id v5 = [(KTLogClient *)self configBag];
  id v6 = v5;
  if (v4) {
    id v7 = [v5 overrideReversePushPercentage];
  }
  else {
    id v7 = [v5 percentageForKey:@"reverse-push-user-action-percent"];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)xpcActivityReversePushPercentage
{
  unsigned __int8 v3 = [(KTLogClient *)self configBag];
  unsigned int v4 = [v3 overrideReversePushConfig];

  id v5 = [(KTLogClient *)self configBag];
  id v6 = v5;
  if (v4) {
    id v7 = [v5 overrideReversePushPercentage];
  }
  else {
    id v7 = [v5 percentageForKey:@"reverse-push-nightly-task-percent"];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)batchQueryMaxURIs
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 uintegerForKey:@"batch-query-max-uris"];

  return (unint64_t)v3;
}

- (unint64_t)consistencyMaxProofs
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 uintegerForKey:@"batch-consistency-max-proofs"];

  return (unint64_t)v3;
}

- (unint64_t)revisionLogMaxProofs
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 uintegerForKey:@"batch-log-inclusion-max-proofs"];

  return (unint64_t)v3;
}

- (id)queryURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-query"];

  return v3;
}

- (id)batchQueryURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-batch-query"];

  return v3;
}

- (NSURL)consistencyProofURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-consistency-proof"];

  return (NSURL *)v3;
}

- (NSURL)publicKeysURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-public-keys"];

  return (NSURL *)v3;
}

- (id)revisionLogProofURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-revision-log-inclusion-proof"];

  return v3;
}

- (id)reportToAppleURI
{
  v2 = [(KTLogClient *)self configBag];
  id v3 = [v2 urlForKey:@"rest-report-to-apple"];

  return v3;
}

- (BOOL)shouldUseReversePush:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = [(KTLogClient *)self userReversePushPercentage];
  }
  else {
    unint64_t v3 = [(KTLogClient *)self xpcActivityReversePushPercentage];
  }
  unint64_t v4 = v3;
  if (v3 == 100)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6828);
    }
    id v7 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Reverse push enabled by config bag", (uint8_t *)&v12, 2u);
    }
    return 1;
  }
  else if (v3)
  {
    uint32_t v8 = arc4random();
    double v9 = (double)v4 * 4294967300.0 / 100.0;
    BOOL v6 = v9 > (double)v8;
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6848);
    }
    id v10 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218496;
      unint64_t v13 = v4;
      __int16 v14 = 1024;
      uint32_t v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = v9 > (double)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Reverse push percentage: %lu; die roll: %u; decision: %d",
        (uint8_t *)&v12,
        0x18u);
    }
  }
  else
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6808);
    }
    id v5 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Reverse push disabled by config bag", (uint8_t *)&v12, 2u);
    }
    return 0;
  }
  return v6;
}

- (void)fetchPublicKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint32_t v8 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v9 = [v8 ktDisable];

  if (v9)
  {
    id v10 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchPublicKeys not permitted when kt disabled"];
    v7[2](v7, 0, v10);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001C5634;
    v11[3] = &unk_1002C68D8;
    __int16 v14 = v7;
    id v12 = v6;
    unint64_t v13 = self;
    [(KTLogClient *)self configure:v11];
  }
}

- (void)postReport:(id)a3 uuid:(id)a4 application:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (void (**)(id, void *))a6;
  __int16 v14 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v15 = [v14 ktDisable];

  if (v15)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C68F8);
    }
    __int16 v16 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "postReport not permitted when kt disabled", buf, 2u);
    }
    BOOL v17 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"postReport not permitted when kt disabled"];
    v13[2](v13, v17);
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001C5EF4;
    v18[3] = &unk_1002C6948;
    v22 = v13;
    v18[4] = self;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    [(KTLogClient *)self configure:v18];

    BOOL v17 = v22;
  }
}

- (void)fetchMessage:(id)a3 uri:(id)a4 uuid:(id)a5 application:(id)a6 userInitiated:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v20 = [KTLogNetworkRequest alloc];
  id v21 = [v18 data];

  id v22 = [(KTLogNetworkRequest *)v20 initPOSTWithURL:v17 data:v21 uuid:v14 application:v15];
  [v22 setAdditionalHeaders:&off_1002DA420];
  BOOL v23 = [(KTLogClient *)self shouldUseReversePush:v9];
  [v22 setAuthenticated:1];
  [v22 setUseReversePush:v23];
  if (v9) {
    +[TransparencySettings defaultNetworkTimeout];
  }
  else {
    +[TransparencySettings backgroundNetworkTimeout];
  }
  [v22 setTimeout:];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001C6334;
  v27[3] = &unk_1002C69D8;
  BOOL v32 = v23;
  v27[4] = self;
  id v28 = v15;
  id v29 = v14;
  id v30 = v16;
  CFAbsoluteTime v31 = Current;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  [(TransparencyLogClient *)self fetchRequest:v22 completionHandler:v27];
}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v14 = [v13 ktDisable];

  if (v14)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C69F8);
    }
    id v15 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchBatchQuery not permitted when kt disabled", buf, 2u);
    }
    id v16 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchBatchQuery not permitted when kt disabled"];
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v16);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001C6C00;
    v17[3] = &unk_1002B8508;
    id v21 = v12;
    id v18 = v10;
    id v19 = self;
    id v20 = v11;
    BOOL v22 = a5;
    [(KTLogClient *)self configure:v17];

    id v16 = v21;
  }
}

- (void)fetchBatchQueries:(id)a3 userInitiated:(BOOL)a4 responseHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  unint64_t v13 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v14 = [v13 ktDisable];

  if (v14)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6A40);
    }
    id v15 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchBatchQueries not permitted when kt disabled", buf, 2u);
    }
    v12[2](v12);
  }
  else
  {
    v34 = v12;
    id v16 = dispatch_group_create();
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    queue = dispatch_queue_create("com.apple.transparencyd.batchQueue", v17);

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v10;
    id obj = v10;
    id v18 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        id v21 = 0;
        do
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v21);
          BOOL v22 = +[NSUUID UUID];
          if (qword_10032F0F8 != -1) {
            dispatch_once(&qword_10032F0F8, &stru_1002C6A60);
          }
          BOOL v23 = (void *)qword_10032F100;
          if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = v23;
            [v37 uriArray];
            id v25 = v16;
            id v26 = v19;
            uint64_t v27 = v20;
            id v28 = self;
            BOOL v29 = v8;
            v31 = id v30 = v11;
            *(_DWORD *)buf = 138543874;
            v49 = v22;
            __int16 v50 = 2160;
            uint64_t v51 = 1752392040;
            __int16 v52 = 2112;
            v53 = v31;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fetching batch query response with fetchId %{public}@ for uris %{mask.hash}@", buf, 0x20u);

            id v11 = v30;
            BOOL v8 = v29;
            self = v28;
            uint64_t v20 = v27;
            id v19 = v26;
            id v16 = v25;
          }
          dispatch_group_enter(v16);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1001C73DC;
          v40[3] = &unk_1002C6A88;
          id v43 = v11;
          id v41 = v22;
          v42 = v16;
          id v32 = v22;
          [(KTLogClient *)self fetchBatchQuery:v37 uuid:v32 userInitiated:v8 completionHandler:v40];

          id v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v19);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C7428;
    block[3] = &unk_1002BB048;
    id v12 = v34;
    v39 = v34;
    dispatch_group_notify(v16, queue, block);

    id v10 = v35;
  }
}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6AA8);
    }
    unint64_t v13 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchBatchQuery not permitted when kt disabled", v15, 2u);
    }
    unsigned int v14 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchBatchQuery not permitted when kt disabled"];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v14);
  }
  else
  {
    [(KTLogClient *)self fetchBatchQuery:v8 uuid:v9 userInitiated:0 completionHandler:v10];
  }
}

- (void)fetchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, void, void *))a6;
  unint64_t v13 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v14 = [v13 ktDisable];

  if (v14)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6AC8);
    }
    id v15 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchQuery not permitted when kt disabled", buf, 2u);
    }
    id v16 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchQuery not permitted when kt disabled"];
    v12[2](v12, 0, v16);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001C77D8;
    v17[3] = &unk_1002B8508;
    id v21 = v12;
    id v18 = v10;
    id v19 = self;
    id v20 = v11;
    BOOL v22 = a5;
    [(KTLogClient *)self configure:v17];

    id v16 = v21;
  }
}

- (void)fetchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6AE8);
    }
    unint64_t v13 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchQuery not permitted when kt disabled", v15, 2u);
    }
    unsigned int v14 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchQuery not permitted when kt disabled"];
    v10[2](v10, 0, v14);
  }
  else
  {
    [(KTLogClient *)self fetchQuery:v8 uuid:v9 userInitiated:0 completionHandler:v10];
  }
}

- (void)fetchConsistencyProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6B08);
    }
    unint64_t v13 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchConsistencyProof not permitted when kt disabled", buf, 2u);
    }
    unsigned int v14 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchConsistencyProof not permitted when kt disabled"];
    v10[2](v10, 0, v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C7E6C;
    v15[3] = &unk_1002C6B30;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [(KTLogClient *)self configure:v15];

    unsigned int v14 = v18;
  }
}

- (void)fetchRevisionLogInclusionProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(TransparencyLogClient *)self idsConfigBag];
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_10032F0F8 != -1) {
      dispatch_once(&qword_10032F0F8, &stru_1002C6B50);
    }
    unint64_t v13 = qword_10032F100;
    if (os_log_type_enabled((os_log_t)qword_10032F100, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchRevisionLogInclusionProof not permitted when kt disabled", buf, 2u);
    }
    unsigned int v14 = +[TransparencyError errorWithDomain:kTransparencyErrorKTDisabled code:-390 description:@"fetchRevisionLogInclusionProof not permitted when kt disabled"];
    v10[2](v10, 0, v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C8314;
    v15[3] = &unk_1002C6B30;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [(KTLogClient *)self configure:v15];

    unsigned int v14 = v18;
  }
}

- (unint64_t)currentEnvironment
{
  return self->currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->currentEnvironment = a3;
}

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTriggerInterface:(id)a3
{
}

- (TransparencyConfigBag)configBag
{
  return (TransparencyConfigBag *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfigBag:(id)a3
{
}

- (double)overrideIDMSFetchTime
{
  return self->_overrideIDMSFetchTime;
}

- (void)setOverrideIDMSFetchTime:(double)a3
{
  self->_overrideIDMSFetchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configBag, 0);

  objc_storeStrong((id *)&self->_triggerInterface, 0);
}

@end