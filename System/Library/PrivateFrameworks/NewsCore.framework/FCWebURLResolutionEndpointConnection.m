@interface FCWebURLResolutionEndpointConnection
+ (id)_bloomFilterScheduler;
+ (id)_sharedProxyingScheduler;
- (FCCoreConfigurationManager)configurationManager;
- (FCNetworkReachabilityType)networkReachability;
- (FCWebURLResolutionEndpointConnection)init;
- (FCWebURLResolutionEndpointConnection)initWithConfigurationManager:(id)a3 cachesDirectoryURL:(id)a4 networkReachability:(id)a5;
- (NBHashBucketer)bucketer;
- (NBURLCanonicalizer)canonicalizer;
- (NBURLHasher)hasher;
- (NFLazy)lazyStoreFrontIDPromise;
- (NSURL)cachesDirectoryURL;
- (id)_articleIDWithHash:(id)a3 lists:(id)a4 storeFrontID:(id)a5;
- (id)_bloomFilterError;
- (id)_fetchBloomFilterInfoPromiseWithQualityOfService:(int64_t)a3;
- (id)_fetchConfigIfNeededPromiseWithCoreConfiguration:(id)a3 qualityOfService:(int64_t)a4;
- (id)_fetchConfigPromiseWithQualityOfService:(int64_t)a3;
- (id)_fetchCoreConfigurationIfNeededPromiseWithQualityOfService:(int64_t)a3;
- (id)_fetchListsPromiseWithConfig:(id)a3 coreConfiguration:(id)a4 hash:(id)a5 qualityOfService:(int64_t)a6;
- (id)_hashOfURLWithWebURL:(id)a3 config:(id)a4;
- (void)_fetchListsPromiseThroughProxy:(BOOL)a3 withResourceURL:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)fetchWebURLBloomFilterInfoWithQualityOfService:(int64_t)a3 completion:(id)a4;
- (void)resolveWebURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCWebURLResolutionEndpointConnection

- (FCWebURLResolutionEndpointConnection)initWithConfigurationManager:(id)a3 cachesDirectoryURL:(id)a4 networkReachability:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    __int16 v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v33 = 1024;
    int v34 = 52;
    __int16 v35 = 2114;
    v36 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "cachesDirectoryURL");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    __int16 v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v33 = 1024;
    int v34 = 53;
    __int16 v35 = 2114;
    v36 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    __int16 v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v33 = 1024;
    int v34 = 54;
    __int16 v35 = 2114;
    v36 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v28.receiver = self;
  v28.super_class = (Class)FCWebURLResolutionEndpointConnection;
  v12 = [(FCWebURLResolutionEndpointConnection *)&v28 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configurationManager, a3);
    uint64_t v14 = [v10 copy];
    cachesDirectoryURL = v13->_cachesDirectoryURL;
    v13->_cachesDirectoryURL = (NSURL *)v14;

    objc_storeStrong((id *)&v13->_networkReachability, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_156];
    lazyStoreFrontIDPromise = v13->_lazyStoreFrontIDPromise;
    v13->_lazyStoreFrontIDPromise = (NFLazy *)v16;

    uint64_t v18 = objc_opt_new();
    canonicalizer = v13->_canonicalizer;
    v13->_canonicalizer = (NBURLCanonicalizer *)v18;

    uint64_t v20 = objc_opt_new();
    hasher = v13->_hasher;
    v13->_hasher = (NBURLHasher *)v20;

    uint64_t v22 = objc_opt_new();
    bucketer = v13->_bucketer;
    v13->_bucketer = (NBHashBucketer *)v22;
  }
  return v13;
}

- (FCWebURLResolutionEndpointConnection)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCWebURLResolutionEndpointConnection init]";
    __int16 v9 = 2080;
    id v10 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCWebURLResolutionEndpointConnection init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithResolver:&__block_literal_global_17_1];
  return v0;
}

void __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "determining storefront ID", buf, 2u);
  }
  uint64_t v4 = +[FCAppleAccount sharedAccount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_19;
  v7[3] = &unk_1E5B4C7C0;
  id v8 = v4;
  id v9 = v2;
  id v5 = v4;
  id v6 = v2;
  [v5 loadStoreFrontWithCompletionHandler:v7];
}

void __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_19(uint64_t a1)
{
  id v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "loaded storefront ID", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) contentStoreFrontID];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)resolveWebURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "resolving web URL %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__66;
  v47 = __Block_byref_object_dispose__66;
  id v48 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__66;
  v42[4] = __Block_byref_object_dispose__66;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__66;
  v40[4] = __Block_byref_object_dispose__66;
  id v41 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke;
  v39[3] = &unk_1E5B4E758;
  v39[4] = self;
  __int16 v11 = [MEMORY[0x1E4F81BF0] firstly:v39];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2;
  v38[3] = &unk_1E5B59C90;
  v38[4] = self;
  v38[5] = &buf;
  v38[6] = a4;
  int v12 = [v11 then:v38];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_3;
  v34[3] = &unk_1E5B59CB8;
  id v13 = v8;
  id v35 = v13;
  v36 = self;
  int64_t v37 = a4;
  uint64_t v14 = [v12 then:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_27;
  v33[3] = &unk_1E5B59CE0;
  v33[4] = self;
  v33[5] = v42;
  v33[6] = a4;
  uint64_t v15 = [v14 then:v33];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_29;
  v28[3] = &unk_1E5B59D08;
  v30 = v40;
  v28[4] = self;
  id v16 = v13;
  id v29 = v16;
  __int16 v31 = v42;
  int64_t v32 = a4;
  v17 = [v15 then:v28];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_31;
  v24[3] = &unk_1E5B59D30;
  v24[4] = self;
  v26 = v40;
  p_long long buf = &buf;
  id v18 = v9;
  id v25 = v18;
  v19 = [v17 then:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_33;
  v22[3] = &unk_1E5B558F0;
  v22[4] = self;
  id v20 = v18;
  id v23 = v20;
  id v21 = (id)[v19 error:v22];

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&buf, 8);
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) lazyStoreFrontIDPromise];
  id v2 = [v1 value];

  return v2;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) _fetchBloomFilterInfoPromiseWithQualityOfService:*(void *)(a1 + 48)];

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "fc_maybeContainsURL:", *(void *)(a1 + 32)))
  {
    uint64_t v3 = [*(id *)(a1 + 40) _fetchCoreConfigurationIfNeededPromiseWithQualityOfService:*(void *)(a1 + 48)];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4;
    v5[3] = &unk_1E5B4E758;
    v5[4] = *(void *)(a1 + 40);
    uint64_t v3 = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4((uint64_t)v5);
  }
  return v3;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4(uint64_t a1)
{
  id v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "bloom filter did not contain domain", v7, 2u);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
  id v4 = [*(id *)(a1 + 32) _bloomFilterError];
  id v5 = (void *)[v3 initWithError:v4];

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_27(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) _fetchConfigIfNeededPromiseWithCoreConfiguration:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) qualityOfService:*(void *)(a1 + 48)];

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_29(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "querying bucket", v15, 2u);
  }
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  v7 = [v3 bucketGroupConfig];
  uint64_t v8 = [v5 _hashOfURLWithWebURL:v6 config:v7];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  __int16 v11 = (void *)a1[4];
  int v12 = [v3 bucketGroupConfig];
  id v13 = [v11 _fetchListsPromiseWithConfig:v12 coreConfiguration:*(void *)(*(void *)(a1[7] + 8) + 40) hash:*(void *)(*(void *)(a1[6] + 8) + 40) qualityOfService:a1[8]];

  return v13;
}

uint64_t __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _articleIDWithHash:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lists:a2 storeFrontID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 0;
}

void __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _bloomFilterError];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = *(id *)(a1 + 40);
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_3_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWebURLBloomFilterInfoWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
    *(_DWORD *)long long buf = 136315906;
    v19 = "-[FCWebURLResolutionEndpointConnection fetchWebURLBloomFilterInfoWithQualityOfService:completion:]";
    __int16 v20 = 2080;
    id v21 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v22 = 1024;
    int v23 = 130;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke;
  v17[3] = &unk_1E5B51D58;
  v17[4] = self;
  v17[5] = a3;
  v7 = [MEMORY[0x1E4F81BF0] firstly:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_2;
  v15[3] = &unk_1E5B59D58;
  id v8 = v6;
  id v16 = v8;
  uint64_t v9 = [v7 then:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_3;
  v13[3] = &unk_1E5B4EF68;
  id v14 = v8;
  id v10 = v8;
  id v11 = (id)[v9 error:v13];
}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchBloomFilterInfoPromiseWithQualityOfService:*(void *)(a1 + 40)];
}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_2(uint64_t a1)
{
  return 0;
}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_sharedProxyingScheduler
{
  if (qword_1EB5D1A70 != -1) {
    dispatch_once(&qword_1EB5D1A70, &__block_literal_global_38_2);
  }
  id v2 = (void *)_MergedGlobals_210;
  return v2;
}

void __64__FCWebURLResolutionEndpointConnection__sharedProxyingScheduler__block_invoke()
{
  v0 = +[FCAssetDownloadOperation sharedURLSession];
  v1 = [v0 configuration];
  id v7 = (id)[v1 copy];

  objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", @"com.apple.news");
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.news.urlresolution");
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v2 setName:@"FCWebURLResolutionEndpointConnection.bucketDownloadCallbackQueue"];
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v2, "setMaxConcurrentOperationCount:", objc_msgSend(v3, "processorCount"));

  id v4 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v7 delegate:0 delegateQueue:v2];
  int v5 = [[FCURLRequestScheduler alloc] initWithURLSession:v4];
  id v6 = (void *)_MergedGlobals_210;
  _MergedGlobals_210 = (uint64_t)v5;
}

+ (id)_bloomFilterScheduler
{
  if (qword_1EB5D1A80 != -1) {
    dispatch_once(&qword_1EB5D1A80, &__block_literal_global_51_3);
  }
  id v2 = (void *)qword_1EB5D1A78;
  return v2;
}

void __61__FCWebURLResolutionEndpointConnection__bloomFilterScheduler__block_invoke()
{
  v0 = +[FCAssetDownloadOperation sharedURLSession];
  v1 = [v0 configuration];
  id v6 = (id)[v1 copy];

  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F18D78]) initWithMemoryCapacity:0 diskCapacity:10000000 directoryURL:0];
  [v6 setURLCache:v2];

  [v6 setRequestCachePolicy:0];
  id v3 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v6 delegate:0 delegateQueue:0];
  id v4 = [[FCURLRequestScheduler alloc] initWithURLSession:v3];
  int v5 = (void *)qword_1EB5D1A78;
  qword_1EB5D1A78 = (uint64_t)v4;
}

- (id)_fetchCoreConfigurationIfNeededPromiseWithQualityOfService:(int64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke;
  v7[3] = &unk_1E5B4EEF0;
  void v7[4] = self;
  int v5 = (void *)[v4 initWithResolver:v7];
  return v5;
}

void __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) configurationManager];
  int v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke_2;
  v7[3] = &unk_1E5B4EEC8;
  id v8 = v3;
  id v6 = v3;
  [v4 fetchConfigurationIfNeededWithCompletionQueue:v5 completion:v7];
}

uint64_t __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_fetchConfigIfNeededPromiseWithCoreConfiguration:(id)a3 qualityOfService:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "coreConfiguration");
    *(_DWORD *)long long buf = 136315906;
    *(void *)__int16 v33 = "-[FCWebURLResolutionEndpointConnection _fetchConfigIfNeededPromiseWithCoreConfiguration:qualityOfService:]";
    *(_WORD *)&v33[8] = 2080;
    *(void *)&v33[10] = "FCWebURLResolutionEndpointConnection.m";
    *(_WORD *)&v33[18] = 1024;
    *(_DWORD *)&v33[20] = 187;
    __int16 v34 = 2114;
    id v35 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v7 = [(FCWebURLResolutionEndpointConnection *)self cachesDirectoryURL];
  id v8 = [v7 URLByAppendingPathComponent:@"bucketGroupConfigResponse3"];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F829E0]) initWithData:v9];
  id v11 = v10;
  if (!v10)
  {
    __int16 v24 = FCWebURLResolutionLog;
    if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "fetching new bucket group config because we have no cached data", buf, 2u);
    }
    goto LABEL_15;
  }
  objc_super v28 = self;
  int64_t v12 = a4;
  id v13 = [v10 bucketGroupConfig];
  uint64_t v14 = [v13 validUntilDate];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", v14);
  id v16 = [v11 bucketGroupConfig];
  int v17 = [v16 version];

  uint64_t v18 = [v6 minimumBucketGroupConfigVersion];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  int v20 = objc_msgSend(v19, "fc_isEarlierThan:", v15);

  id v21 = FCWebURLResolutionLog;
  BOOL v22 = os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT);
  if (!v20 || v18 > v17)
  {
    a4 = v12;
    if (v22)
    {
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)__int16 v33 = v17;
      *(_WORD *)&v33[4] = 2114;
      *(void *)&v33[6] = v15;
      *(_WORD *)&v33[14] = 2048;
      *(void *)&v33[16] = v18;
      _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "fetching new bucket group config of version %d because expiration date %{public}@ was in the past or cached version did not meet or exceed minimum version of %lld", buf, 0x1Cu);
    }

    self = v28;
LABEL_15:
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke;
    v31[3] = &unk_1E5B51D58;
    v31[4] = self;
    v31[5] = a4;
    id v25 = [MEMORY[0x1E4F81BF0] firstly:v31];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke_2;
    v29[3] = &unk_1E5B59D80;
    id v30 = v8;
    int v23 = [v25 then:v29];

    goto LABEL_16;
  }
  if (v22)
  {
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)__int16 v33 = v17;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v15;
    *(_WORD *)&v33[14] = 2048;
    *(void *)&v33[16] = v18;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "using cached bucket group config of version %d because expiration date %{public}@ was not in the past and cached version met or exceeded minimum version of %lld", buf, 0x1Cu);
  }

  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v11];
LABEL_16:

  return v23;
}

uint64_t __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchConfigPromiseWithQualityOfService:*(void *)(a1 + 40)];
}

id __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 data];
  [v4 writeToURL:*(void *)(a1 + 32) atomically:1];

  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v3];
  return v5;
}

- (id)_fetchConfigPromiseWithQualityOfService:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  id v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = FCNewsAssetServerHostName();
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"https://%@/owl-bucket-groups/currentBucketGroupConfig", v7];
    uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    id v10 = [FCAssetDownloadOperation alloc];
    id v11 = [*(id *)(a1 + 32) networkReachability];
    int64_t v12 = [(FCAssetDownloadOperation *)v10 initWithNetworkReachability:v11];

    [(FCAssetDownloadOperation *)v12 setURL:v9];
    [(FCAssetDownloadOperation *)v12 setLoggingKey:@"webURLResolution:config"];
    [(FCOperation *)v12 setQualityOfService:*(void *)(a1 + 40)];
    [(FCAssetDownloadOperation *)v12 setDownloadDestination:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_3;
    v15[3] = &unk_1E5B59DA8;
    id v16 = v6;
    id v17 = v5;
    id v13 = v6;
    [(FCAssetDownloadOperation *)v12 setDataDownloadCompletionHandler:v15];
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v14 addOperation:v12];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2;
    v18[3] = &unk_1E5B4CA88;
    id v19 = v6;
    id v8 = v6;
    __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2((uint64_t)v18);
    uint64_t v9 = v19;
  }
}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:8 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void (**)(id, id))[objc_alloc(MEMORY[0x1E4F829E0]) initWithData:v6];
    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5;
      v9[3] = &unk_1E5B4CA88;
      id v10 = *(id *)(a1 + 32);
      __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5((uint64_t)v9);
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_4;
    uint64_t v14 = &unk_1E5B4C7C0;
    id v16 = (void (**)(id, id))*(id *)(a1 + 32);
    id v15 = v7;
    v16[2](v16, v15);

    id v8 = v16;
  }
}

uint64_t __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:13 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_fetchBloomFilterInfoPromiseWithQualityOfService:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  id v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = FCNewsAssetServerHostName();
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"https://%@/open-web-links/domainBloomFilter", v7];
    uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    id v10 = [(id)objc_opt_class() _bloomFilterScheduler];
    uint64_t v11 = [FCAssetDownloadOperation alloc];
    uint64_t v12 = [*(id *)(a1 + 32) networkReachability];
    id v13 = [(FCAssetDownloadOperation *)v11 initWithNetworkReachability:v12 URLRequestScheduler:v10];

    [(FCAssetDownloadOperation *)v13 setURL:v9];
    [(FCAssetDownloadOperation *)v13 setLoggingKey:@"webURLResolution:bloomFilter"];
    [(FCOperation *)v13 setQualityOfService:*(void *)(a1 + 40)];
    [(FCAssetDownloadOperation *)v13 setCachePolicy:0];
    [(FCAssetDownloadOperation *)v13 setDownloadDestination:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_3;
    v16[3] = &unk_1E5B59DA8;
    id v17 = v6;
    id v18 = v5;
    id v14 = v6;
    [(FCAssetDownloadOperation *)v13 setDataDownloadCompletionHandler:v16];
    id v15 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v15 addOperation:v13];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2;
    v19[3] = &unk_1E5B4CA88;
    id v20 = v6;
    id v8 = v6;
    __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2((uint64_t)v19);
    uint64_t v9 = v20;
  }
}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:8 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void (**)(id, id))[objc_alloc(MEMORY[0x1E4F829D8]) initWithData:v6];
    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5;
      v9[3] = &unk_1E5B4CA88;
      id v10 = *(id *)(a1 + 32);
      __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5((uint64_t)v9);
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_4;
    id v14 = &unk_1E5B4C7C0;
    id v16 = (void (**)(id, id))*(id *)(a1 + 32);
    id v15 = v7;
    v16[2](v16, v15);

    id v8 = v16;
  }
}

uint64_t __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:13 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_hashOfURLWithWebURL:(id)a3 config:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "webURL");
    *(_DWORD *)long long buf = 136315906;
    id v18 = "-[FCWebURLResolutionEndpointConnection _hashOfURLWithWebURL:config:]";
    __int16 v19 = 2080;
    id v20 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v21 = 1024;
    int v22 = 311;
    __int16 v23 = 2114;
    __int16 v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "config");
    *(_DWORD *)long long buf = 136315906;
    id v18 = "-[FCWebURLResolutionEndpointConnection _hashOfURLWithWebURL:config:]";
    __int16 v19 = 2080;
    id v20 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v21 = 1024;
    int v22 = 312;
    __int16 v23 = 2114;
    __int16 v24 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v8 = [(FCWebURLResolutionEndpointConnection *)self canonicalizer];
  uint64_t v9 = [v8 canonicalizedURLForURL:v6];

  id v10 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138739971;
    id v18 = v9;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "canonicalized URL is %{sensitive}@", buf, 0xCu);
  }
  uint64_t v11 = [(FCWebURLResolutionEndpointConnection *)self hasher];
  objc_msgSend(v11, "hashForURL:maxLength:", v9, objc_msgSend(v7, "byteCount"));
  uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();

  id v13 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    id v18 = v12;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "hash is %{private}@", buf, 0xCu);
  }

  return v12;
}

- (id)_fetchListsPromiseWithConfig:(id)a3 coreConfiguration:(id)a4 hash:(id)a5 qualityOfService:(int64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "config");
    *(_DWORD *)long long buf = 136315906;
    __int16 v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    __int16 v32 = 2080;
    __int16 v33 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 326;
    __int16 v36 = 2114;
    int64_t v37 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "coreConfiguration");
    *(_DWORD *)long long buf = 136315906;
    __int16 v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    __int16 v32 = 2080;
    __int16 v33 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 327;
    __int16 v36 = 2114;
    int64_t v37 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "hash");
    *(_DWORD *)long long buf = 136315906;
    __int16 v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    __int16 v32 = 2080;
    __int16 v33 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 328;
    __int16 v36 = 2114;
    int64_t v37 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v13 = [(FCWebURLResolutionEndpointConnection *)self bucketer];
  uint64_t v14 = objc_msgSend(v13, "bucketForHash:bucketCount:", v12, objc_msgSend(v10, "numberOfBuckets"));

  id v15 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    __int16 v31 = (const char *)v14;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "bucket is %ld", buf, 0xCu);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke;
  v24[3] = &unk_1E5B59DF8;
  id v25 = v10;
  uint64_t v26 = self;
  uint64_t v28 = v14;
  int64_t v29 = a6;
  id v27 = v11;
  id v17 = v11;
  id v18 = v10;
  __int16 v19 = (void *)[v16 initWithResolver:v24];

  return v19;
}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = FCNewsAssetServerHostName();
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"https://%@/owl-bucket-groups/%d/index/%zd", v7, objc_msgSend(*(id *)(a1 + 32), "version"), *(void *)(a1 + 56)];
    uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_3;
    aBlock[3] = &unk_1E5B59DD0;
    aBlock[4] = *(void *)(a1 + 40);
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 64);
    id v22 = v10;
    uint64_t v25 = v11;
    id v23 = v6;
    id v12 = v5;
    id v24 = v12;
    id v13 = (void (**)(void))_Block_copy(aBlock);
    if ([*(id *)(a1 + 48) shouldProxyURLBucketFetch])
    {
      uint64_t v14 = FCWebURLResolutionLog;
      if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "trying fetch for lists through proxy", buf, 2u);
      }
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 64);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_86;
      v17[3] = &unk_1E5B514F8;
      id v18 = v12;
      __int16 v19 = v13;
      [v15 _fetchListsPromiseThroughProxy:1 withResourceURL:v10 qualityOfService:v16 completion:v17];
    }
    else
    {
      v13[2](v13);
    }
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2;
    v26[3] = &unk_1E5B4CA88;
    id v27 = v6;
    __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2((uint64_t)v26);
    id v8 = v27;
  }
}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:8 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_3(uint64_t a1)
{
  id v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "trying fetch for lists directly", buf, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_83;
  v6[3] = &unk_1E5B514F8;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 _fetchListsPromiseThroughProxy:0 withResourceURL:v4 qualityOfService:v5 completion:v6];
}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_83(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v6 = (void (**)(id, id))*(id *)(a1 + 32);
    id v5 = v4;
    v6[2](v6, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2_84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_fetchListsPromiseThroughProxy:(BOOL)a3 withResourceURL:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "resourceURL");
    *(_DWORD *)long long buf = 136315906;
    id v23 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:]";
    __int16 v24 = 2080;
    uint64_t v25 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v26 = 1024;
    int v27 = 395;
    __int16 v28 = 2114;
    int64_t v29 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
    *(_DWORD *)long long buf = 136315906;
    id v23 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:]";
    __int16 v24 = 2080;
    uint64_t v25 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v26 = 1024;
    int v27 = 396;
    __int16 v28 = 2114;
    int64_t v29 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v8)
  {
    id v12 = [(id)objc_opt_class() _sharedProxyingScheduler];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [FCAssetDownloadOperation alloc];
  uint64_t v14 = [(FCWebURLResolutionEndpointConnection *)self networkReachability];
  id v15 = [(FCAssetDownloadOperation *)v13 initWithNetworkReachability:v14 URLRequestScheduler:v12];

  [(FCAssetDownloadOperation *)v15 setURL:v10];
  [(FCAssetDownloadOperation *)v15 setLoggingKey:@"webURLResolution:lists"];
  [(FCOperation *)v15 setQualityOfService:a5];
  [(FCAssetDownloadOperation *)v15 setDownloadDestination:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke;
  v20[3] = &unk_1E5B59E20;
  id v21 = v11;
  id v16 = v11;
  [(FCAssetDownloadOperation *)v15 setDataDownloadCompletionHandler:v20];
  id v17 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v17 addOperation:v15];
}

void __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F829A0]) initWithData:v6];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [v8 articleInfoLists];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3;
      v12[3] = &unk_1E5B4CA88;
      id v13 = *(id *)(a1 + 32);
      __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3((uint64_t)v12);
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_2;
    id v17 = &unk_1E5B4C7C0;
    __int16 v19 = (void (**)(id, void, id))*(id *)(a1 + 32);
    id v18 = v7;
    v19[2](v19, 0, v18);

    uint64_t v9 = v19;
  }
}

uint64_t __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:13 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_articleIDWithHash:(id)a3 lists:(id)a4 storeFrontID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "hash");
    *(_DWORD *)long long buf = 136315906;
    id v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    __int16 v23 = 2080;
    __int16 v24 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v25 = 1024;
    int v26 = 424;
    __int16 v27 = 2114;
    __int16 v28 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "lists");
    *(_DWORD *)long long buf = 136315906;
    id v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    __int16 v23 = 2080;
    __int16 v24 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v25 = 1024;
    int v26 = 425;
    __int16 v27 = 2114;
    __int16 v28 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storeFrontID");
    *(_DWORD *)long long buf = 136315906;
    id v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    __int16 v23 = 2080;
    __int16 v24 = "FCWebURLResolutionEndpointConnection.m";
    __int16 v25 = 1024;
    int v26 = 426;
    __int16 v27 = 2114;
    __int16 v28 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v10 = objc_msgSend(v8, "fc_objectInSortedOrderedCollectionWithFeature:usingFeatureProvider:comparator:", v7, &__block_literal_global_96_1, &__block_literal_global_99);
  id v11 = [v10 articleInfos];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_3;
  v19[3] = &unk_1E5B59E88;
  id v20 = v9;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "fc_firstObjectPassingTest:", v19);

  uint64_t v14 = [v13 articleId];

  return v14;
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 urlHash];
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_bigEndianCompareAsUnsignedInteger:");
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 storeFrontId];
  if (v4)
  {
    id v5 = [v3 storeFrontId];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)_bloomFilterError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"bloomfilter" code:0 userInfo:0];
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NFLazy)lazyStoreFrontIDPromise
{
  return self->_lazyStoreFrontIDPromise;
}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NBURLCanonicalizer)canonicalizer
{
  return self->_canonicalizer;
}

- (NBURLHasher)hasher
{
  return self->_hasher;
}

- (NBHashBucketer)bucketer
{
  return self->_bucketer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketer, 0);
  objc_storeStrong((id *)&self->_hasher, 0);
  objc_storeStrong((id *)&self->_canonicalizer, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_cachesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lazyStoreFrontIDPromise, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end