@interface PCCProxyingDevice
- (BOOL)isFilenameReasonable:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PCCProxyingDevice)initWithEndpoint:(id)a3;
- (double)requestTimeout;
- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)addRequest:(id)a3 event:(id)a4 type:(id)a5 onComplete:(id)a6;
- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6;
- (void)diagnosticResultsEvent:(id)a3 type:(id)a4 result:(id)a5;
- (void)finishRequest:(id)a3 result:(id)a4;
- (void)finishRequestWithMessage:(id)a3 result:(id)a4;
- (void)handleConnection:(BOOL)a3 from:(id)a4;
- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)listDevices:(id)a3;
- (void)request:(id)a3 logList:(id)a4;
- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6;
- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4;
- (void)setRequestTimeout:(double)a3;
- (void)startRequest:(id)a3 message:(id)a4 onComplete:(id)a5;
- (void)startTimer;
- (void)summarizeLog:(id)a3 reason:(id)a4;
- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5;
- (void)updateProxiedDeviceMetadata:(id)a3 from:(id)a4;
@end

@implementation PCCProxyingDevice

- (PCCProxyingDevice)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PCCProxyingDevice;
  v6 = [(PCCProxyingDevice *)&v21 init];
  v7 = v6;
  if (v6)
  {
    v6->_requestTimeout = 1200.0;
    uint64_t v8 = objc_opt_new();
    reqById = v7->_reqById;
    v7->_reqById = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    reqByTracker = v7->_reqByTracker;
    v7->_reqByTracker = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ProxiedCrashCopier.request_queue", 0);
    request_queue = v7->_request_queue;
    v7->_request_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.OSASyncProxy.conn_queue", 0);
    sync_proxy_queue = v7->_sync_proxy_queue;
    v7->_sync_proxy_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    [(PCCEndpoint *)v7->_endpoint runWithDelegate:v7];
    uint64_t v16 = objc_opt_new();
    sync_summary = v7->_sync_summary;
    v7->_sync_summary = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    tasking_summary = v7->_tasking_summary;
    v7->_tasking_summary = (NSMutableDictionary *)v18;
  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_1F3616BC8];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 _setQueue:self->_sync_proxy_queue];
  [v6 resume];

  return 1;
}

- (void)listDevices:(id)a3
{
  endpoint = self->_endpoint;
  id v5 = a3;
  id v6 = [(PCCEndpoint *)endpoint deviceIds];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  v11 = [(PCCEndpoint *)self->_endpoint synchronize:v8 withOptions:v9];
  dispatch_queue_t v12 = [v9 objectForKeyedSubscript:@"remote"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v49 = *(double *)&v9;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "requesting remote synchronization with options: %@", buf, 0xCu);
    }
    v46[0] = @"messageType";
    v46[1] = @"options";
    v47[0] = @"synchronize";
    v47[1] = v9;
    dispatch_queue_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
    [(PCCProxyingDevice *)self startRequest:v8 message:v14 onComplete:v10];
LABEL_17:

    goto LABEL_18;
  }
  v15 = [v9 objectForKeyedSubscript:@"status"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    v44[0] = @"requesting";
    v40 = [(NSMutableDictionary *)self->_reqById allValues];
    v39 = [v40 valueForKey:@"description"];
    v45[0] = v39;
    v44[1] = @"tracking";
    v38 = [(NSMutableDictionary *)self->_reqByTracker allKeys];
    v45[1] = v38;
    v44[2] = @"timeout";
    v37 = [NSNumber numberWithDouble:self->_requestTimeout];
    v45[2] = v37;
    v44[3] = @"timer";
    v36 = [NSNumber numberWithInt:self->_expiryTimer != 0];
    v45[3] = v36;
    v44[4] = @"transaction";
    v35 = [NSNumber numberWithInt:self->_txn != 0];
    v45[4] = v35;
    v44[5] = @"files";
    v17 = [NSNumber numberWithInt:self->file_count];
    v45[5] = v17;
    v44[6] = @"msgs";
    [NSNumber numberWithInt:self->msg_count];
    v19 = uint64_t v18 = v11;
    v45[6] = v19;
    v44[7] = @"connections";
    v20 = [NSNumber numberWithInt:self->up_count];
    v45[7] = v20;
    v44[8] = @"requests";
    objc_super v21 = [NSNumber numberWithInt:self->request_count];
    v45[8] = v21;
    v44[9] = @"expirations";
    v22 = [NSNumber numberWithInt:self->expire_count];
    v45[9] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:10];
    ((void (**)(id, void *, void *))v10)[2](v10, v23, v18);

    v11 = v18;
    v24 = v40;
LABEL_7:

    goto LABEL_18;
  }
  v25 = [v9 objectForKey:@"set-expire"];

  if (v25)
  {
    v26 = [v9 objectForKeyedSubscript:@"set-expire"];
    int v27 = [v26 intValue];

    if (v27 <= 5) {
      int v28 = 5;
    }
    else {
      int v28 = v27;
    }
    if (v28 >= 0xE10) {
      int v28 = 3600;
    }
    self->_double requestTimeout = (double)v28;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      double requestTimeout = self->_requestTimeout;
      *(_DWORD *)buf = 134217984;
      double v49 = requestTimeout;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "requestTimeout set to %.0f secs", buf, 0xCu);
    }
    dispatch_queue_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"requestTimeout set to %.0f secs", *(void *)&self->_requestTimeout);
    ((void (**)(id, void *, void *))v10)[2](v10, v14, v11);
    goto LABEL_17;
  }
  v30 = [v9 objectForKeyedSubscript:@"test-expire"];
  int v31 = [v30 BOOLValue];

  BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v32)
    {
      double v33 = self->_requestTimeout / 60.0;
      *(_DWORD *)buf = 134217984;
      double v49 = v33;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "starting bogus request; wait for expiration in %.1f mins",
        buf,
        0xCu);
    }
    [(PCCProxyingDevice *)self startRequest:v8 message:&unk_1F3613748 onComplete:0];
    request_queue = self->_request_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke;
    block[3] = &unk_1E6C29C28;
    v43 = v10;
    block[4] = self;
    id v42 = v11;
    dispatch_async(request_queue, block);

    v24 = v43;
    goto LABEL_7;
  }
  if (v32)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "local synchronization", buf, 2u);
  }
  ((void (**)(id, void *, void *))v10)[2](v10, @"local-Ok", v11);
LABEL_18:
}

void __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  id v4 = [*(id *)(a1[4] + 32) allValues];
  v3 = [v4 valueForKey:@"description"];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, a1[5]);
}

- (void)handleConnection:(BOOL)a3 from:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    ++self->up_count;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      v7 = MEMORY[0x1E4F14500];
      id v8 = "remote ProxiedDevice connected";
      id v9 = (uint8_t *)&v11;
LABEL_6:
      _os_log_impl(&dword_1DBFFE000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    v7 = MEMORY[0x1E4F14500];
    id v8 = "remote ProxiedDevice disconnected";
    id v9 = (uint8_t *)&v10;
    goto LABEL_6;
  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  ++self->msg_count;
  id v8 = [v6 objectForKeyedSubscript:@"messageType"];
  if ([v8 isEqualToString:@"updateProxiedDeviceMetadata"])
  {
    id v9 = [v6 objectForKeyedSubscript:@"deviceMetadata"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "updateProxiedDeviceMetadata:\n%@", buf, 0xCu);
    }
    if (!v9) {
      -[PCCProxyingDevice handleMessage:from:]();
    }
    [(PCCProxyingDevice *)self updateProxiedDeviceMetadata:v9 from:v7];
    [(PCCProxyingDevice *)self finishRequestWithMessage:v6 result:v9];
  }
  else if ([v8 isEqualToString:@"jobStatus"])
  {
    __int16 v10 = [v6 objectForKeyedSubscript:@"error_domain"];
    if (!v10) {
      goto LABEL_12;
    }
    __int16 v11 = (void *)MEMORY[0x1E4F28C58];
    dispatch_queue_t v12 = [v6 objectForKeyedSubscript:@"error_code"];
    uint64_t v13 = (int)[v12 intValue];
    dispatch_queue_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:", @"error_info", *MEMORY[0x1E4F28568]);
    v20 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    int v16 = [v11 errorWithDomain:v10 code:v13 userInfo:v15];

    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = v17;
    }
    else
    {
LABEL_12:
      id v17 = [v6 objectForKeyedSubscript:@"content"];
      uint64_t v18 = 0;
    }
    [(PCCProxyingDevice *)self finishRequestWithMessage:v6 result:v17];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }
}

- (void)summarizeLog:(id)a3 reason:(id)a4
{
  id v10 = a4;
  sync_summary = self->_sync_summary;
  id v7 = (__CFString *)a3;
  id v8 = [(NSMutableDictionary *)sync_summary objectForKeyedSubscript:v10];
  if (!v8)
  {
    id v8 = objc_opt_new();
    [(NSMutableDictionary *)self->_sync_summary setObject:v8 forKeyedSubscript:v10];
  }
  if ([(__CFString *)v7 length]) {
    id v9 = v7;
  }
  else {
    id v9 = @"unknown";
  }
  [v8 _accumulateKey:v9 value:1];
}

- (BOOL)isFilenameReasonable:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 stringByStandardizingPath];
  id v5 = [v4 pathComponents];

  uint64_t v6 = [v5 count];
  if (v6 != 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "FAILED untrusted filename validation '%{public}@'", (uint8_t *)&v8, 0xCu);
  }

  return v6 == 1;
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v92 = a4;
  id v9 = a5;
  ++self->file_count;
  id v10 = objc_alloc(MEMORY[0x1E4F83930]);
  v94 = v8;
  __int16 v11 = [v8 path];
  dispatch_queue_t v12 = [MEMORY[0x1E4F83948] sharedInstance];
  uint64_t v13 = (void *)[v10 initWithPath:v11 forRouting:@"<sync>" usingConfig:v12 options:&unk_1F3613770 error:0];

  [v13 closeFileStream];
  v93 = v13;
  dispatch_queue_t v14 = [v13 bugType];
  id v96 = v9;
  if (![v14 isEqualToString:@"211"]) {
    goto LABEL_7;
  }
  v15 = [MEMORY[0x1E4F83948] sharedInstance];
  if (([v15 optInApple] & 1) != 0
    || ([v9 objectForKeyedSubscript:@"device_class"],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_7:
    goto LABEL_8;
  }
  id v17 = (void *)v16;
  uint64_t v18 = [v9 objectForKeyedSubscript:@"device_class"];
  int v19 = [v18 intValue];

  id v9 = v96;
  if (v19 != 7)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v104 = *MEMORY[0x1E4F28568];
    v105 = @"failed opt-out";
    objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    id v22 = [v20 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v21];

    [(PCCProxyingDevice *)self summarizeLog:@"211" reason:@"failed-opt-out"];
    v95 = 0;
    goto LABEL_50;
  }
LABEL_8:
  uint64_t v23 = [v9 objectForKeyedSubscript:@"proxied_dev"];
  v24 = [@"ProxiedDevice-" stringByAppendingString:v23];

  if ([(PCCProxyingDevice *)self isFilenameReasonable:v24])
  {
    v25 = [v9 objectForKeyedSubscript:@"name"];
    if ([(PCCProxyingDevice *)self isFilenameReasonable:v25])
    {
      uint64_t v26 = [v9 objectForKeyedSubscript:@"subdir"];
      int v27 = (void *)MEMORY[0x1E4F83948];
      int v28 = [MEMORY[0x1E4F83948] sharedInstance];
      v29 = [v28 pathSubmission];
      if (v26) {
        v30 = (__CFString *)v26;
      }
      else {
        v30 = &stru_1F360EEC0;
      }
      int v31 = objc_msgSend(v24, "stringByAppendingPathComponent:", v30, v26);
      uint64_t v121 = *MEMORY[0x1E4F83A10];
      v122[0] = MEMORY[0x1E4F1CC38];
      BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:&v121 count:1];
      double v33 = [v27 ensureUsablePath:v29 component:v31 options:v32];

      v91 = v33;
      if (v33)
      {
        uint64_t v34 = [v33 stringByAppendingPathComponent:v25];
        v35 = NSString;
        v36 = [MEMORY[0x1E4F83948] sharedInstance];
        v37 = [v36 pathSubmission];
        v120[0] = v37;
        v120[1] = v24;
        v120[2] = @"Retired";
        v120[3] = v25;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:4];
        [v35 pathWithComponents:v38];
        uint64_t v40 = v39 = v25;

        v41 = [MEMORY[0x1E4F28CB8] defaultManager];
        v119[0] = v34;
        v95 = (void *)v34;
        id v42 = (void *)v34;
        v43 = (void *)v40;
        v25 = v39;
        v44 = [v42 stringByAppendingPathExtension:@"synced"];
        v119[1] = v44;
        v119[2] = v43;
        v45 = [v43 stringByAppendingPathExtension:@"synced"];
        v119[3] = v45;
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:4];

        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v98 objects:v118 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v99;
LABEL_16:
          uint64_t v51 = 0;
          while (1)
          {
            if (*(void *)v99 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v98 + 1) + 8 * v51);
            if ([v41 fileExistsAtPath:v52]) {
              break;
            }
            if (v49 == ++v51)
            {
              uint64_t v49 = [v47 countByEnumeratingWithState:&v98 objects:v118 count:16];
              if (v49) {
                goto LABEL_16;
              }
              goto LABEL_33;
            }
          }
          v57 = [v95 pathExtension];
          int v58 = [v57 isEqualToString:@"ips"];

          BOOL v59 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
          if (v58)
          {
            if (v59)
            {
              *(_DWORD *)buf = 138543362;
              v113 = v52;
              _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Duplicate log detected at %{public}@", buf, 0xCu);
            }
            id v60 = v52;

            [(PCCProxyingDevice *)self summarizeLog:v25 reason:@"failed-duplicate"];
            id v22 = 0;
            v61 = @"<unknown>";
            v95 = v60;
            id v9 = v96;
            goto LABEL_45;
          }
          if (v59)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v52;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "overwriting file at %{public}@", buf, 0xCu);
          }
          [v41 removeItemAtPath:v52 error:0];
        }
LABEL_33:

        v65 = [v94 path];
        id v97 = 0;
        int v66 = [v41 moveItemAtPath:v65 toPath:v95 error:&v97];
        id v22 = v97;

        BOOL v67 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v67)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v95;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "incoming log %{public}@", buf, 0xCu);
          }
          [v93 rename:v95];
          id v68 = v25;
          v69 = [v68 pathExtension];
          int v70 = [v69 isEqualToString:@"synced"];

          if (v70)
          {
            uint64_t v71 = [v68 stringByDeletingPathExtension];

            id v68 = (id)v71;
          }
          v72 = [v68 pathExtension];
          int v73 = [&unk_1F3613838 containsObject:v72];

          if (v73)
          {
            v61 = [v93 bugType];
            id v9 = v96;
            [(PCCProxyingDevice *)self receivedReport:v93 from:v92 metadata:v96];
          }
          else
          {
            v61 = [v68 pathExtension];
            id v9 = v96;
          }
          [(PCCProxyingDevice *)self summarizeLog:v61 reason:@"received"];

LABEL_45:
          v64 = v90;
        }
        else
        {
          id v9 = v96;
          v64 = v90;
          if (v67)
          {
            *(_DWORD *)buf = 138543874;
            v113 = v94;
            __int16 v114 = 2114;
            v115 = v95;
            __int16 v116 = 2114;
            id v117 = v22;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "FAILED to activate %{public}@ -> %{public}@ : %{public}@", buf, 0x20u);
          }
          [(PCCProxyingDevice *)self summarizeLog:v25 reason:@"failed-move"];
          v61 = @"<unknown>";
        }
      }
      else
      {
        v62 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v110 = *MEMORY[0x1E4F28568];
        v111 = @"failed untrusted path validation";
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        id v22 = [v62 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v63];

        [(PCCProxyingDevice *)self summarizeLog:v25 reason:@"failed-path"];
        v95 = 0;
        id v9 = v96;
        v64 = v90;
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v108 = *MEMORY[0x1E4F28568];
      v109 = @"failed untrusted filename validation";
      v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      id v22 = [v55 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v56];

      [(PCCProxyingDevice *)self summarizeLog:@"<untrusted>" reason:@"failed-filename"];
      v95 = 0;
    }
  }
  else
  {
    v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v106 = *MEMORY[0x1E4F28568];
    v107 = @"failed untrusted proxy validation";
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    id v22 = [v53 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v54];

    [(PCCProxyingDevice *)self summarizeLog:@"<untrusted>" reason:@"failed-proxy-data"];
    v95 = 0;
  }

LABEL_50:
  v74 = [MEMORY[0x1E4F1C9C8] date];
  lastTouch = self->_lastTouch;
  self->_lastTouch = v74;

  if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PCCProxyingDevice handleFile:from:metadata:]((uint64_t)v94, (uint64_t)v92, (uint64_t)v22);
  }
  v76 = [v9 objectForKeyedSubscript:@"jobId"];
  v77 = [v9 objectForKeyedSubscript:@"jobEvent"];
  v78 = [v9 objectForKeyedSubscript:@"jobType"];
  v79 = [v9 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v80 = [v79 objectForKeyedSubscript:@"jobStatus"];
  }
  else
  {
    v80 = 0;
  }
  if ([v80 BOOLValue])
  {
    v81 = @"<unsolicited>";
    v102[0] = @"jobId";
    v102[1] = @"jobType";
    v82 = @"xfer-file";
    if (v76) {
      v81 = v76;
    }
    if (v78) {
      v82 = v78;
    }
    v103[0] = v81;
    v103[1] = v82;
    v102[2] = @"jobEvent";
    v83 = @"<legacy>";
    if (v77) {
      v83 = v77;
    }
    v103[2] = v83;
    v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
    v85 = v95;
    if (v22) {
      id v86 = v22;
    }
    else {
      id v86 = v95;
    }
    [(PCCProxyingDevice *)self finishRequestWithMessage:v84 result:v86];

    v87 = v96;
  }
  else
  {
    v85 = v95;
    v87 = v96;
    if (v76)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[PCCProxyingDevice handleFile:from:metadata:]((uint64_t)v79);
      }
      if (v77) {
        v88 = v77;
      }
      else {
        v88 = @"unsolicited";
      }
      if (v78) {
        v89 = v78;
      }
      else {
        v89 = @"xfer-group";
      }
      [(PCCProxyingDevice *)self addRequest:v76 event:v88 type:v89 onComplete:0];
    }
  }
}

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  request_queue = self->_request_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__PCCProxyingDevice_ack_result_error___block_invoke;
  v13[3] = &unk_1E6C29B88;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(request_queue, v13);
}

void __38__PCCProxyingDevice_ack_result_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v4 = [v3 type];
        id v5 = [v3 jid];
        int v6 = 138412546;
        id v7 = v4;
        __int16 v8 = 2112;
        id v9 = v5;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "request %@ (%@) acknowledged", (uint8_t *)&v6, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) finishRequest:v3 result:*(void *)(a1 + 48)];
    }
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)updateProxiedDeviceMetadata:(id)a3 from:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [v6 objectForKeyedSubscript:@"crashreporter_key"];
  v43 = self;
  if ([(PCCProxyingDevice *)self isFilenameReasonable:v8])
  {
    id v9 = (void *)MEMORY[0x1E4F83948];
    uint64_t v10 = [MEMORY[0x1E4F83948] sharedInstance];
    id v11 = [v10 pathSubmission];
    if ([v7 isEqualToString:@"Bridge"]) {
      id v12 = @"Bridge";
    }
    else {
      id v12 = v8;
    }
    uint64_t v13 = [@"ProxiedDevice-" stringByAppendingString:v12];
    uint64_t v61 = *MEMORY[0x1E4F83A10];
    v62[0] = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v15 = [v9 ensureUsablePath:v11 component:v13 options:v14];

    if (v15)
    {
      BOOL v16 = [v15 stringByAppendingPathComponent:@"deviceMetadata.proxy"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "writing: %@", buf, 0xCu);
      }
      id v17 = (void *)[v6 mutableCopy];
      uint64_t v18 = NSNumber;
      int v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSince1970];
      v20 = objc_msgSend(v18, "numberWithDouble:");
      [v17 setObject:v20 forKeyedSubscript:@"proxyingDeviceTimeAtLastUpdate"];

      if (([v17 writeToFile:v16 atomically:1] & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "FAILED to write metadata update: %@", buf, 0xCu);
      }
      if ((OSAIsRSDHost() & 1) == 0)
      {
        v38 = v17;
        v39 = v16;
        uint64_t v40 = v8;
        v46 = [MEMORY[0x1E4F28CB8] defaultManager];
        objc_super v21 = [v6 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
        id v22 = [v21 allKeys];

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id obj = v22;
        uint64_t v23 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v45 = *(void *)v49;
          id v41 = v6;
          id v42 = v15;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v49 != v45) {
                objc_enumerationMutation(obj);
              }
              uint64_t v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              int v27 = [v6 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
              int v28 = [v27 objectForKeyedSubscript:v26];

              v29 = [v15 stringByAppendingPathComponent:@"tasking"];
              v30 = [v29 stringByAppendingPathExtension:v26];
              int v31 = [v30 stringByAppendingPathExtension:@"proxy"];

              char v47 = 0;
              if ([v46 fileExistsAtPath:v31 isDirectory:&v47]) {
                BOOL v32 = v47 == 0;
              }
              else {
                BOOL v32 = 0;
              }
              if (v32)
              {
                double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v31];
                uint64_t v34 = [v33 objectForKeyedSubscript:@"taskingID"];
                v35 = v34;
                if (v34 && ([v34 isEqualToString:v28] & 1) == 0)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v55 = v26;
                    __int16 v56 = 2112;
                    v57 = v35;
                    __int16 v58 = 2112;
                    BOOL v59 = v28;
                    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "updated staged tasking %@ '%@ <- %@'", buf, 0x20u);
                  }
                  v36 = [v33 objectForKeyedSubscript:@"payload"];
                  [(PCCProxyingDevice *)v43 deliver:v7 tasking:v26 taskId:v35 fromBlob:v36];

                  v52[0] = @"action";
                  v52[1] = @"taskId";
                  v53[0] = @"delivered";
                  v53[1] = v35;
                  v52[2] = @"blob";
                  v53[2] = v31;
                  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
                  [(NSMutableDictionary *)v43->_tasking_summary setObject:v37 forKeyedSubscript:v26];

                  id v6 = v41;
                  id v15 = v42;
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v26;
                  __int16 v56 = 2112;
                  v57 = v28;
                  _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no change staged tasking %@ '%@'", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v26;
                _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no staged tasking %@", buf, 0xCu);
              }
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v24);
        }

        BOOL v16 = v39;
        __int16 v8 = v40;
        id v17 = v38;
      }
    }
  }
}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  v23[0] = @"messageType";
  v23[1] = @"forRouting";
  v23[2] = @"withTaskingId";
  v24[0] = @"acceptTasking";
  id v14 = @"-1";
  if (v12) {
    id v14 = v12;
  }
  v24[1] = v11;
  v24[2] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  BOOL v16 = (void *)[v15 mutableCopy];

  if (v12)
  {
    char v17 = [(__CFString *)v12 isEqualToString:@"-1"];
    if (v13)
    {
      if ((v17 & 1) == 0) {
        [v16 setObject:v13 forKeyedSubscript:@"settings"];
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    v20 = @"acceptTasking";
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "posted %@-%@", (uint8_t *)&v19, 0x16u);
  }
  id v18 = [(PCCEndpoint *)self->_endpoint send:v10 message:v16 error:0];
}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 objectForKeyedSubscript:@"allFiles"];
  uint64_t v12 = [v11 BOOLValue];

  v18[0] = @"initiateLogTransfer";
  v17[0] = @"messageType";
  v17[1] = @"allFiles";
  id v13 = [NSNumber numberWithBool:v12];
  v18[1] = v13;
  v17[2] = @"jobEvent";
  id v14 = [v8 objectForKeyedSubscript:@"event"];
  if (v14)
  {
    id v15 = [v8 objectForKeyedSubscript:@"event"];
  }
  else
  {
    id v15 = @"<unknown>";
  }
  v18[2] = v15;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  [(PCCProxyingDevice *)self startRequest:v10 message:v16 onComplete:v9];

  if (v14) {
}
  }

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "transferLog options %@", buf, 0xCu);
  }
  id v14 = objc_msgSend(v12, "objectForKeyedSubscript:", @"event", @"messageType", @"logFile", @"jobEvent", @"initiateLogTransfer", v11);
  if (v14)
  {
    id v15 = [v12 objectForKeyedSubscript:@"event"];
  }
  else
  {
    id v15 = @"<unknown>";
  }
  v18[2] = v15;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:3];
  [(PCCProxyingDevice *)self startRequest:v10 message:v16 onComplete:v13];

  if (v14) {
}
  }

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a4 objectForKeyedSubscript:@"path"];
  id v11 = (void *)v10;
  v14[0] = @"messageType";
  v14[1] = @"path";
  id v12 = &stru_1F360EEC0;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  v15[0] = @"initiateLogList";
  v15[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(PCCProxyingDevice *)self startRequest:v9 message:v13 onComplete:v8];
}

- (void)request:(id)a3 logList:(id)a4
{
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
}

- (void)startRequest:(id)a3 message:(id)a4 onComplete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  request_queue = self->_request_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke;
  void v15[3] = &unk_1E6C29C50;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(request_queue, v15);
}

void __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 92);
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  id v3 = [MEMORY[0x1E4F29128] UUID];
  BOOL v4 = [v3 UUIDString];

  id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v5 setObject:v4 forKeyedSubscript:@"jobId"];
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(a1 + 48);
  id v17 = 0;
  id v8 = [v6 send:v7 message:v5 error:&v17];
  id v9 = v17;
  if (!v9)
  {
    id v11 = [[PCCRequest alloc] initWithMessage:v5 options:0];
    id v12 = *(void **)(a1 + 56);
    if (v12)
    {
      id v13 = (void *)[v12 copy];
      [(PCCRequest *)v11 setCallback:v13];
    }
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v11 forKeyedSubscript:v4];
    if (v8)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v11 forKeyedSubscript:v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(PCCRequest *)v11 type];
        *(_DWORD *)buf = 138412546;
        int v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v4;
        id v15 = MEMORY[0x1E4F14500];
        id v16 = "request %@ (%@) enroute";
LABEL_11:
        _os_log_impl(&dword_1DBFFE000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(PCCRequest *)v11 type];
      *(_DWORD *)buf = 138412546;
      int v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      id v15 = MEMORY[0x1E4F14500];
      id v16 = "request %@ (%@) sent";
      goto LABEL_11;
    }
    [*(id *)(a1 + 32) startTimer];

    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v9);
  }
LABEL_13:
}

- (void)addRequest:(id)a3 event:(id)a4 type:(id)a5 onComplete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke;
  block[3] = &unk_1E6C29C78;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(request_queue, block);
}

void __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v3)
  {
    BOOL v4 = [PCCRequest alloc];
    long long v9 = *(_OWORD *)(a1 + 40);
    v8[0] = @"jobId";
    v8[1] = @"jobEvent";
    v8[2] = @"jobType";
    uint64_t v10 = *(void *)(a1 + 56);
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:v8 count:3];
    id v3 = [(PCCRequest *)v4 initWithMessage:v5 options:0];

    id v6 = *(void **)(a1 + 64);
    if (v6)
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PCCRequest *)v3 setCallback:v7];
    }
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) startTimer];
  }
}

- (void)finishRequest:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke;
  block[3] = &unk_1E6C29B60;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(request_queue, block);
}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) type];
    BOOL v4 = [*(id *)(a1 + 32) jid];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = *(__CFString **)(a1 + 40);
    }
    else {
      id v5 = @"Ok";
    }
    *(_DWORD *)buf = 138412802;
    id v23 = v3;
    __int16 v24 = 2112;
    v25 = v4;
    __int16 v26 = 2112;
    int v27 = v5;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "request %@ (%@) complete %@", buf, 0x20u);
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) event];
  id v8 = [*(id *)(a1 + 32) type];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = @"error";
  }
  else {
    id v9 = @"success";
  }
  [v6 diagnosticResultsEvent:v7 type:v8 result:v9];

  id v10 = *(void **)(*(void *)(a1 + 48) + 32);
  uint64_t v11 = [*(id *)(a1 + 32) jid];
  [v10 removeObjectForKey:v11];

  id v12 = [*(id *)(a1 + 32) callback];
  if (v12)
  {
    id v13 = dispatch_get_global_queue(0, 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke_416;
    v19[3] = &unk_1E6C29CA0;
    id v20 = *(id *)(a1 + 40);
    id v21 = v12;
    dispatch_async(v13, v19);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "no handler installed?", buf, 2u);
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (*(void *)(v14 + 48) && ![*(id *)(v14 + 32) count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no outstanding requests; releasing transaction",
        buf,
        2u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 48) + 48));
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(v15 + 48);
    *(void *)(v15 + 48) = 0;

    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = *(void **)(v17 + 56);
    *(void *)(v17 + 56) = 0;
  }
}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke_416(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  objc_opt_class();
  objc_opt_isKindOfClass();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)finishRequestWithMessage:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke;
  block[3] = &unk_1E6C29B60;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(request_queue, block);
}

void __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobId"];
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"<unsolicited>"])
    {
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobType"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v6 = *(__CFString **)(a1 + 40);
        }
        else {
          id v6 = @"Ok";
        }
        int v17 = 138412802;
        id v18 = v4;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "job %@ %@ completed %@", (uint8_t *)&v17, 0x20u);
      }
      uint64_t v14 = *(void **)(a1 + 48);
      uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobEvent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = @"error";
      }
      else {
        id v16 = @"success";
      }
      [v14 diagnosticResultsEvent:v15 type:v5 result:v16];

      goto LABEL_23;
    }
    id v5 = [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:v4];
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unknown job id %@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_10:
    [*(id *)(a1 + 48) finishRequest:v5 result:*(void *)(a1 + 40)];
LABEL_23:

    goto LABEL_24;
  }
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
  int v8 = [v7 isEqualToString:@"updateProxiedDeviceMetadata"];

  if (v8)
  {
    id v5 = [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:@"<unsolicited>"];
    if (!v5) {
      goto LABEL_23;
    }
    goto LABEL_10;
  }
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
  int v10 = [v9 isEqualToString:@"initiateLogList"];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
    char v12 = [v11 isEqualToString:@"synchronize"];

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *(void **)(a1 + 32);
      int v17 = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unknown finishing message %@", (uint8_t *)&v17, 0xCu);
    }
  }
LABEL_24:
}

- (void)diagnosticResultsEvent:(id)a3 type:(id)a4 result:(id)a5
{
  v36[4] = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  if (([(__CFString *)v9 isEqualToString:@"xfer-group"] & 1) != 0
    || ([(__CFString *)v9 isEqualToString:@"xfer-all"] & 1) != 0
    || [(__CFString *)v9 isEqualToString:@"xfer-file"])
  {
    uint64_t v11 = [MEMORY[0x1E4F83948] sharedInstance];
    int v12 = [v11 appleInternal];

    if (v12)
    {
      int v31 = [MEMORY[0x1E4F1C9C8] date];
      v36[0] = v31;
      v35[0] = @"time";
      v35[1] = @"version";
      id v13 = [MEMORY[0x1E4F83948] sharedInstance];
      uint64_t v14 = [v13 buildVersion];
      uint64_t v15 = (void *)v14;
      id v16 = @"<unknown>";
      if (v8) {
        int v17 = v8;
      }
      else {
        int v17 = @"<unknown>";
      }
      v36[1] = v14;
      v36[2] = v17;
      v35[2] = @"event";
      v35[3] = @"transfer";
      if (v9) {
        id v16 = v9;
      }
      v33[0] = @"type";
      v33[1] = @"result";
      v34[0] = v16;
      v34[1] = v10;
      id v30 = v10;
      v33[2] = @"summary";
      v34[2] = self->_sync_summary;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
      v36[3] = v18;
      __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
      id v20 = (void *)[v19 mutableCopy];

      if ([(NSMutableDictionary *)self->_tasking_summary count]) {
        [v20 setObject:self->_tasking_summary forKeyedSubscript:@"taskings"];
      }
      __int16 v21 = [MEMORY[0x1E4F83948] sharedInstance];
      id v22 = [v21 pathDiagnostics];
      uint64_t v23 = NSString;
      __int16 v24 = OSANSDateFormat();
      v25 = [v23 stringWithFormat:@"transfer-%@", v24];
      __int16 v26 = [v22 stringByAppendingPathComponent:v25];
      int v27 = [v26 stringByAppendingPathExtension:@"results"];

      if ([v20 writeToFile:v27 atomically:1])
      {
        id v10 = v30;
      }
      else
      {
        id v10 = v30;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to write results file, saving as txt", buf, 2u);
        }
        uint64_t v28 = [v27 stringByAppendingPathExtension:@"txt"];

        v29 = [v20 description];
        [v29 writeToFile:v28 atomically:1 encoding:4 error:0];

        int v27 = (void *)v28;
      }
    }
    [(NSMutableDictionary *)self->_sync_summary removeAllObjects];
    [(NSMutableDictionary *)self->_tasking_summary removeAllObjects];
  }
}

- (void)startTimer
{
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PCCProxyingDevice_startTimer__block_invoke;
  block[3] = &unk_1E6C29C00;
  void block[4] = self;
  dispatch_async(request_queue, block);
}

void __31__PCCProxyingDevice_startTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E0197840]();
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 48))
  {
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v6 + 24));
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 48);
    dispatch_time_t v12 = dispatch_walltime(0, (uint64_t)(*(double *)(v10 + 112) * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(v13 + 48);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __31__PCCProxyingDevice_startTimer__block_invoke_2;
    handler[3] = &unk_1E6C29C00;
    handler[4] = v13;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
    if (*(void *)(*(void *)(a1 + 32) + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        uint64_t v15 = MEMORY[0x1E4F14500];
        id v16 = "re-starting request timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_1DBFFE000, v15, OS_LOG_TYPE_DEFAULT, v16, v20, 2u);
      }
    }
    else
    {
      uint64_t v17 = os_transaction_create();
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        uint64_t v15 = MEMORY[0x1E4F14500];
        id v16 = "starting request timer and creating transaction";
        goto LABEL_7;
      }
    }
  }
}

void __31__PCCProxyingDevice_startTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) timeIntervalSinceNow];
  uint64_t v3 = *(void *)(a1 + 32);
  if (fabs(v2) >= *(double *)(v3 + 112))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [*(id *)(v3 + 32) allValues];
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          ++*(_DWORD *)(*(void *)(a1 + 32) + 96);
          uint64_t v15 = *(void **)(a1 + 32);
          id v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v31 = v12;
          BOOL v32 = @"expired due to lack of progress";
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          uint64_t v18 = [v16 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:5 userInfo:v17];
          [v15 finishRequest:v14 result:v18];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v10);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    __int16 v19 = MEMORY[0x1E4F14500];
    id v20 = "request expiration event; releasing transaction";
    goto LABEL_17;
  }
  uint64_t v4 = [*(id *)(v3 + 32) count];
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
    {
LABEL_18:
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(v21 + 56);
      *(void *)(v21 + 56) = 0;

      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 48));
      uint64_t v23 = *(void *)(a1 + 32);
      __int16 v24 = *(void **)(v23 + 48);
      *(void *)(v23 + 48) = 0;

      return;
    }
    *(_WORD *)buf = 0;
    __int16 v19 = MEMORY[0x1E4F14500];
    id v20 = "request expiration event (with no outstanding requests!); releasing transaction";
LABEL_17:
    _os_log_impl(&dword_1DBFFE000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_18;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "re-starting request timer thereby extending transaction", buf, 2u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_source_t v7 = *(NSObject **)(v6 + 48);
  dispatch_time_t v8 = dispatch_walltime(0, (uint64_t)(*(double *)(v6 + 112) * 1000000000.0));
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_double requestTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sync_proxy_queue, 0);
  objc_storeStrong((id *)&self->_tasking_summary, 0);
  objc_storeStrong((id *)&self->_sync_summary, 0);
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_reqByTracker, 0);
  objc_storeStrong((id *)&self->_reqById, 0);
  objc_storeStrong((id *)&self->_request_queue, 0);
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)handleMessage:from:.cold.1()
{
}

- (void)handleFile:(uint64_t)a1 from:metadata:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "file status update %@", (uint8_t *)&v1, 0xCu);
}

- (void)handleFile:(uint64_t)a1 from:(uint64_t)a2 metadata:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error handling %{public}@ from proxying device (%{public}@): %{public}@", (uint8_t *)&v3, 0x20u);
}

@end