@interface FCEndpointConnection
+ (id)errorForStatus:(int64_t)a3 url:(id)a4;
- (FCEndpointConnection)init;
- (FCEndpointConnection)initWithNetworkBehaviorMonitor:(id)a3;
- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3;
- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3 networkBehaviorMonitor:(id)a4;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCNetworkReachabilityType)networkReachability;
- (NFLazy)lazySession;
- (id)session;
- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12;
- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 callbackQueue:(id)a9 completion:(id)a10;
- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 networkEventType:(int)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12;
- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 requiresAuthKitHeaders:(BOOL)a10 networkEventType:(int)a11 callbackQueue:(id)a12 completion:(id)a13;
- (void)setLazySession:(id)a3;
@end

@implementation FCEndpointConnection

- (FCEndpointConnection)initWithNetworkBehaviorMonitor:(id)a3
{
  return [(FCEndpointConnection *)self initWithSourceApplicationBundleIdentifier:0 networkBehaviorMonitor:a3];
}

void __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)[*(id *)(a1 + 32) mutableCopy];
    v8 = v7;
    id v24 = v6;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v12 = v9;

    v41[0] = v5;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v12 setObject:v13 forKeyedSubscript:@"X-Apple-GS-Token"];

    v15 = *(void **)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 56);
    int v17 = *MEMORY[0x1E4F18CF0];
    int v18 = *(_DWORD *)(a1 + 96);
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 80);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_3;
    v25[3] = &unk_1E5B56618;
    char v34 = *(unsigned char *)(a1 + 104);
    v25[4] = v15;
    id v26 = v14;
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 56);
    id v29 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 72);
    int v33 = *(_DWORD *)(a1 + 100);
    id v31 = *(id *)(a1 + 80);
    id v32 = *(id *)(a1 + 88);
    HIDWORD(v22) = v18;
    LOBYTE(v22) = 1;
    LODWORD(v21) = v17;
    objc_msgSend(v15, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", v26, v12, v23, v16, v20, 1, v21, v22, v19, v25);

    id v6 = v24;
  }
  else
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_2;
    v38 = &unk_1E5B4C7C0;
    id v10 = *(id *)(a1 + 88);
    id v40 = v10;
    id v11 = v6;
    id v39 = v11;
    if (v10)
    {
      (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v11);
      id v11 = v39;
    }

    v12 = v40;
  }
}

- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11
{
  LODWORD(v11) = 0;
  -[FCEndpointConnection performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:networkEventType:callbackQueue:completion:](self, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:networkEventType:callbackQueue:completion:", a3, a4, a5, a6, a7, a9, v11, a10, a11);
}

- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a11;
  id v24 = a12;
  v25 = +[FCAppleAccount sharedAccount];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke;
  v34[3] = &unk_1E5B56640;
  id v35 = v19;
  uint64_t v36 = self;
  id v37 = v18;
  id v38 = v20;
  id v39 = v21;
  id v40 = v22;
  int v43 = a10;
  id v41 = v23;
  id v42 = v24;
  BOOL v45 = a9;
  float v44 = a8;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v18;
  id v31 = v19;
  id v32 = v24;
  [v25 getGSTokenWithCompletionHandler:v34];
}

- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3 networkBehaviorMonitor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCEndpointConnection;
  v8 = [(FCEndpointConnection *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_networkBehaviorMonitor, a4);
    objc_initWeak(&location, v9);
    id v10 = objc_alloc(MEMORY[0x1E4F81BD0]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__FCEndpointConnection_initWithSourceApplicationBundleIdentifier_networkBehaviorMonitor___block_invoke;
    v14[3] = &unk_1E5B519B0;
    id v15 = v6;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = [v10 initWithConstructor:v14];
    lazySession = v9->_lazySession;
    v9->_lazySession = (NFLazy *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (FCEndpointConnection)init
{
  return [(FCEndpointConnection *)self initWithSourceApplicationBundleIdentifier:0];
}

- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3
{
  return [(FCEndpointConnection *)self initWithSourceApplicationBundleIdentifier:a3 networkBehaviorMonitor:0];
}

+ (id)errorForStatus:(int64_t)a3 url:(id)a4
{
  return NSErrorForHTTPStatusCode(a3, a4);
}

id __89__FCEndpointConnection_initWithSourceApplicationBundleIdentifier_networkBehaviorMonitor___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  v3 = v2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:");
  }
  if (FCProcessIsMemoryConstrained()) {
    [v3 setURLCache:0];
  }
  [v3 setNetworkServiceType:0];
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v3, "setHTTPMaximumConnectionsPerHost:", 2 * objc_msgSend(v4, "processorCount"));

  objc_msgSend(v3, "set_timingDataOptions:", objc_msgSend(v3, "_timingDataOptions") | 1);
  id v5 = (void *)MEMORY[0x1E4F18DC0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v5 sessionWithConfiguration:v3 delegate:WeakRetained delegateQueue:0];

  return v7;
}

- (id)session
{
  v2 = [(FCEndpointConnection *)self lazySession];
  v3 = [v2 value];

  return v3;
}

- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 callbackQueue:(id)a9 completion:(id)a10
{
  LOBYTE(v10) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, MEMORY[0x1E4F1CC08], a4, a5, a6, a8, v10, a9, a10);
}

- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 networkEventType:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  HIDWORD(v11) = a9;
  LOBYTE(v11) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, 0, a4, a5, a6, a8, v11, a10, a11);
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11
{
  LOBYTE(v11) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, a4, a5, a6, a7, a9, v11, a10, a11);
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12
{
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 requiresAuthKitHeaders:(BOOL)a10 networkEventType:(int)a11 callbackQueue:(id)a12 completion:(id)a13
{
  BOOL v13 = a9;
  id v45 = a3;
  id v44 = a4;
  id v19 = a5;
  id v20 = a6;
  id v43 = a7;
  id v21 = a12;
  id v22 = a13;
  id v23 = (__CFString *)v19;
  id v24 = v23;
  if (v13)
  {
    if ([(__CFString *)v23 isEqualToString:@"Signed_GET"])
    {
      v25 = @"GET";

      uint64_t v26 = [@"SIGNATURE-MESSAGE" dataUsingEncoding:4];

      id v20 = (id)v26;
    }
    else
    {
      v25 = v24;
    }
    if ([(__CFString *)v24 isEqualToString:@"Signed_DELETE"])
    {
      id v27 = @"DELETE";

      uint64_t v28 = [@"SIGNATURE-MESSAGE" dataUsingEncoding:4];

      v25 = v27;
      id v20 = (id)v28;
    }
  }
  else
  {
    v25 = v23;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke;
  aBlock[3] = &unk_1E5B53D30;
  id v29 = v21;
  id v65 = v29;
  id v30 = v22;
  id v66 = v30;
  id v31 = _Block_copy(aBlock);
  id v32 = NewsCoreUserDefaults();
  if (![v32 BOOLForKey:@"simulate_retryable_analytics_upload_failure"])
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_3;
    v52[3] = &unk_1E5B565C8;
    id v41 = v45;
    id v53 = v41;
    BOOL v62 = a10;
    v54 = v25;
    id v55 = v43;
    id v56 = v44;
    BOOL v63 = v13;
    v57 = v24;
    v58 = self;
    int v60 = a11;
    id v33 = v31;
    id v59 = v33;
    float v61 = a8;
    char v34 = (void (**)(void))_Block_copy(v52);
    id v35 = v34;
    if (v20)
    {
      if (v13)
      {
        if ([v32 BOOLForKey:@"simulate_bad_analytics_mescal_signature"])
        {
          id v39 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v36 = [v39 description];
          id v40 = [v36 dataUsingEncoding:4];
        }
        else
        {
          id v40 = v20;
        }
        id v38 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v38, OS_LOG_TYPE_DEFAULT, "Endpoint connection will generate Mescal signature", buf, 2u);
        }
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_28;
        v46[3] = &unk_1E5B565F0;
        v46[4] = self;
        id v47 = v41;
        id v49 = v33;
        v50 = v35;
        id v48 = v20;
        +[FCMescalSignature signatureFromData:v40 completion:v46];

        goto LABEL_21;
      }
      id v37 = v34[2];
    }
    else
    {
      id v37 = v34[2];
    }
    v37();
LABEL_21:

    goto LABEL_22;
  }
  (*((void (**)(void *, void, void, void))v31 + 2))(v31, 0, 0, 0);
LABEL_22:
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = *(void **)(a1 + 32);
  if (v10)
  {
    unsigned int v11 = v10;
  }
  else
  {
    unsigned int v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
  BOOL v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2;
    v14[3] = &unk_1E5B4F0D0;
    id v18 = v13;
    id v15 = v7;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v11, v14);
  }
}

uint64_t __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(a1 + 32)];
  id v8 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    unsigned int v10 = [v7 HTTPUserAgent];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_INFO, "Client request: %@, current userAgent: %@", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 96))
  {
    objc_msgSend(v7, "ak_addDeviceUDIDHeader");
    objc_msgSend(v7, "ak_addClientInfoHeader");
    objc_msgSend(v7, "ak_addAnisetteHeaders");
  }
  [v7 setHTTPMethod:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    [v7 addValue:v11 forHTTPHeaderField:@"Content-Type"];
  }
  id v12 = *(void **)(a1 + 56);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_11;
  v34[3] = &unk_1E5B54648;
  id v13 = v7;
  id v35 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v34];
  v14 = +[FCAppleAccount sharedAccount];
  id v15 = [v14 endpointConnectionClientID];
  [v13 addValue:v15 forHTTPHeaderField:@"X-CLIENT-ID"];

  if (v6)
  {
    [v13 addValue:v6 forHTTPHeaderField:@"X-Apple-ActionSignature"];
    if (([*(id *)(a1 + 64) isEqualToString:@"Signed_GET"] & 1) != 0
      || [*(id *)(a1 + 64) isEqualToString:@"Signed_DELETE"])
    {
      [v13 addValue:@"SIGNATURE-MESSAGE" forHTTPHeaderField:@"X-SIGNATURE-MESSAGE"];
      goto LABEL_15;
    }
  }
  else if (*(unsigned char *)(a1 + 97) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"Shouldn't be here if the request requires Mescal signing"];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentTyp"
                         "e:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completi"
                         "on:]_block_invoke_3";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCEndpointConnection.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = 285;
    WORD2(v37) = 2114;
    *(void *)((char *)&v37 + 6) = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [v13 setHTTPBody:v5];
LABEL_15:
  id v16 = FCAnalyticsLog;
  if (os_log_type_enabled((os_log_t)FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_INFO, "Client request: %@, signature: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&long long v37 = __Block_byref_object_copy__42;
  *((void *)&v37 + 1) = __Block_byref_object_dispose__42;
  id v38 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v18 = v17;
  id v19 = [*(id *)(a1 + 72) session];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_22;
  v27[3] = &unk_1E5B565A0;
  int v33 = *(_DWORD *)(a1 + 88);
  id v20 = v13;
  uint64_t v32 = v18;
  id v31 = buf;
  uint64_t v21 = *(void *)(a1 + 72);
  id v22 = *(void **)(a1 + 80);
  id v28 = v20;
  uint64_t v29 = v21;
  id v30 = v22;
  uint64_t v23 = [v19 dataTaskWithRequest:v20 completionHandler:v27];
  id v24 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v23;

  LODWORD(v25) = *(_DWORD *)(a1 + 92);
  [*(id *)(*(void *)&buf[8] + 40) setPriority:v25];
  [*(id *)(*(void *)&buf[8] + 40) resume];

  _Block_object_dispose(buf, 8);
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2_12;
  v7[3] = &unk_1E5B50F30;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

uint64_t __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addValue:a2 forHTTPHeaderField:*(void *)(a1 + 40)];
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a2;
  id v9 = NSErrorByUpdatingRetryStatusForError(a4);
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = v7;
    }
    else {
      unsigned int v10 = 0;
    }
  }
  else
  {
    unsigned int v10 = 0;
  }
  id v11 = v10;

  if (*(_DWORD *)(a1 + 72))
  {
    id v12 = [FCNetworkEvent alloc];
    uint64_t v13 = *(unsigned int *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 32);
    double v15 = *(double *)(a1 + 64);
    id v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _incompleteCurrentTaskTransactionMetrics];
    uint64_t v17 = [(FCNetworkEvent *)v12 initWithType:v13 URLRequest:v14 operationID:0 requestUUID:0 startTime:v11 HTTPResponse:v16 metrics:v15 containerName:0 error:v9];

    uint64_t v18 = [*(id *)(a1 + 40) networkBehaviorMonitor];
    [v18 logNetworkEvent:v17];
  }
  id v19 = FCAnalyticsLog;
  if (os_log_type_enabled((os_log_t)FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_INFO, "Endpoint response: %@, error: %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_28(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Failed to sign analytics data with Mescal", v11, 2u);
    }
    id v8 = +[FCNetworkReachability sharedNetworkReachability];
    char v9 = [v8 isNetworkReachable];

    if (v9)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      unsigned int v10 = [(id)objc_opt_class() errorForStatus:0 url:a1[5]];
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
}

uint64_t __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v7 statusCode] != 401 && objc_msgSend(v7, "statusCode") != 434;
  if (!*(unsigned char *)(a1 + 100) || v9)
  {
    uint64_t v12 = *(void *)(a1 + 88);
    if (v12) {
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v13, v7, v8);
    }
  }
  else
  {
    unsigned int v10 = +[FCAppleAccount sharedAccount];
    [v10 invalidateGSTokenCache];

    LODWORD(v11) = *(_DWORD *)(a1 + 96);
    [*(id *)(a1 + 32) performAuthenticatedHTTPRequestWithURL:*(void *)(a1 + 40) valuesByHTTPHeaderField:*(void *)(a1 + 48) method:*(void *)(a1 + 56) data:*(void *)(a1 + 64) contentType:*(void *)(a1 + 72) priority:0 reauthenticateIfNeeded:v11 callbackQueue:*(void *)(a1 + 80) completion:*(void *)(a1 + 88)];
  }
}

- (NFLazy)lazySession
{
  return self->_lazySession;
}

- (void)setLazySession:(id)a3
{
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_lazySession, 0);
}

@end