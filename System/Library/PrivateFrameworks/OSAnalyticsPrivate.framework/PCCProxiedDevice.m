@interface PCCProxiedDevice
- (BOOL)doWork:(id)a3;
- (BOOL)preserveFiles;
- (PCCProxiedDevice)initWithEndpoint:(id)a3;
- (double)jobTimeout;
- (void)acceptTaskingPayload:(id)a3 forRouting:(id)a4 withId:(id)a5;
- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)finish:(id)a3 target:(id)a4 event:(id)a5 type:(id)a6 result:(id)a7;
- (void)handleConnection:(BOOL)a3 from:(id)a4;
- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)initiate:(id)a3 transferGroupWithOptions:(id)a4 job:(id)a5;
- (void)initiate:(id)a3 transferLog:(id)a4 withOptions:(id)a5 job:(id)a6;
- (void)sendDeviceMetadata:(id)a3;
- (void)setJobTimeout:(double)a3;
- (void)setPreserveFiles:(BOOL)a3;
- (void)startTimer;
@end

@implementation PCCProxiedDevice

- (PCCProxiedDevice)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PCCProxiedDevice;
  v6 = [(PCCProxiedDevice *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_jobTimeout = 1200.0;
    uint64_t v8 = objc_opt_new();
    jobByTracker = v7->_jobByTracker;
    v7->_jobByTracker = (NSMutableDictionary *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ProxiedCrashCopier.job_queue", 0);
    job_queue = v7->_job_queue;
    v7->_job_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    [(PCCEndpoint *)v7->_endpoint runWithDelegate:v7];
  }

  return v7;
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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "remote ProxyingDevice connected, initiating group xfer", buf, 2u);
    }
    [(PCCProxiedDevice *)self initiate:v6 transferGroupWithOptions:&unk_1F3613720 job:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "remote ProxyingDevice disconnected", v7, 2u);
  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  v109[3] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  ++self->msg_count;
  uint64_t v8 = [(__CFString *)v6 objectForKeyedSubscript:@"messageType"];
  if ([v8 isEqualToString:@"initiateMetadataUpdate"])
  {
    v9 = v6;
    dispatch_queue_t v10 = [(__CFString *)v6 objectForKeyedSubscript:@"jobId"];
    v109[0] = @"updateProxiedDeviceMetadata";
    v108[0] = @"messageType";
    v108[1] = @"deviceMetadata";
    v11 = [MEMORY[0x1E4F83948] sharedInstance];
    uint64_t v12 = [v11 metadata];
    objc_super v13 = (void *)v12;
    v108[2] = @"jobId";
    v14 = @"<unknown-job>";
    if (v10) {
      v14 = v10;
    }
    v109[1] = v12;
    v109[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:3];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v99 = @"initiateMetadataUpdate";
      __int16 v100 = 2112;
      v101 = v10;
      __int16 v102 = 2112;
      v103 = @"updateProxiedDeviceMetadata";
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "received request %@ (%@); posting %@",
        buf,
        0x20u);
    }
    id v16 = [(PCCEndpoint *)self->_endpoint send:v7 message:v15 error:0];

    id v6 = v9;
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"acceptTasking"])
  {
    v17 = [(__CFString *)v6 objectForKeyedSubscript:@"forRouting"];
    v18 = [(__CFString *)v6 objectForKeyedSubscript:@"withTaskingId"];
    v19 = [(__CFString *)v6 objectForKeyedSubscript:@"settings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v99 = @"acceptTasking";
      __int16 v100 = 2112;
      v101 = v17;
      __int16 v102 = 2112;
      v103 = v18;
      __int16 v104 = 2112;
      id v105 = (id)objc_opt_class();
      __int16 v106 = 2048;
      v107 = v19;
      id v20 = v105;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "received request %@-%@ '%@' payload %@ %p", buf, 0x34u);
    }
    [(PCCProxiedDevice *)self acceptTaskingPayload:v19 forRouting:v17 withId:v18];

LABEL_23:
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"initiateLogTransfer"])
  {
    v17 = [(__CFString *)v6 objectForKeyedSubscript:@"jobId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v99 = @"initiateLogTransfer";
      __int16 v100 = 2112;
      v101 = v17;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "received request %@ (%@)", buf, 0x16u);
    }
    v18 = [(__CFString *)v6 objectForKeyedSubscript:@"logFile"];
    if (v18) {
      [(PCCProxiedDevice *)self initiate:v7 transferLog:v18 withOptions:v6 job:v17];
    }
    else {
      [(PCCProxiedDevice *)self initiate:v7 transferGroupWithOptions:v6 job:v17];
    }
    goto LABEL_23;
  }
  if ([v8 isEqualToString:@"initiateLogList"])
  {
    uint64_t v21 = [(__CFString *)v6 objectForKeyedSubscript:@"jobId"];
    v22 = objc_opt_new();
    v73 = v6;
    v23 = [(__CFString *)v6 objectForKeyedSubscript:@"path"];
    id v75 = v7;
    v71 = v23;
    if ([v23 length])
    {
      uint64_t v96 = *MEMORY[0x1E4F83A00];
      v97 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    }
    else
    {
      uint64_t v24 = 0;
    }
    v38 = (void *)MEMORY[0x1E4F83930];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke;
    v83[3] = &unk_1E6C29B38;
    id v39 = v22;
    id v84 = v39;
    v70 = (void *)v24;
    [v38 iterateLogsWithOptions:v24 usingBlock:v83];
    v40 = (void *)v21;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)[v39 count];
      *(_DWORD *)buf = 138413058;
      v99 = @"initiateLogList";
      __int16 v100 = 2112;
      v101 = (__CFString *)v21;
      __int16 v102 = 2112;
      v103 = @"jobStatus";
      __int16 v104 = 2048;
      id v105 = v41;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "received request %@ (%@); posting %@ %lu logs",
        buf,
        0x2Au);
    }
    v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v43 = v39;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v80 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [*(id *)(*((void *)&v79 + 1) + 8 * i) path];
          [v42 addObject:v48];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }
      while (v45);
    }

    v93[0] = @"messageType";
    v93[1] = @"jobType";
    v94[0] = @"jobStatus";
    v94[1] = @"initiateLogList";
    v93[2] = @"jobId";
    v93[3] = @"content";
    v94[2] = v40;
    v94[3] = v42;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:4];
    id v7 = v75;
    id v50 = [(PCCEndpoint *)self->_endpoint send:v75 message:v49 error:0];

    id v6 = v73;
  }
  else if ([v8 isEqualToString:@"synchronize"])
  {
    v25 = [(__CFString *)v6 objectForKeyedSubscript:@"jobId"];
    v74 = [(__CFString *)v6 objectForKeyedSubscript:@"options"];
    v26 = [v74 objectForKeyedSubscript:@"status"];
    int v27 = [v26 BOOLValue];

    v72 = v25;
    if (v27)
    {
      v91[0] = @"messageType";
      v91[1] = @"jobType";
      v92[0] = @"jobStatus";
      v92[1] = @"synchronize";
      v92[2] = v25;
      v91[2] = @"jobId";
      v91[3] = @"content";
      v89[0] = @"tracking";
      v69 = [(NSMutableDictionary *)self->_jobByTracker allValues];
      v68 = [v69 valueForKey:@"description"];
      v90[0] = v68;
      v89[1] = @"timeout";
      v67 = [NSNumber numberWithDouble:self->_jobTimeout];
      v90[1] = v67;
      v89[2] = @"timer";
      v66 = [NSNumber numberWithInt:self->_expiryTimer != 0];
      v90[2] = v66;
      v89[3] = @"transaction";
      v65 = [NSNumber numberWithInt:self->_txn != 0];
      v90[3] = v65;
      v89[4] = @"files";
      v64 = [NSNumber numberWithInt:self->file_count];
      v90[4] = v64;
      v89[5] = @"msgs";
      v28 = [NSNumber numberWithInt:self->msg_count];
      v90[5] = v28;
      v89[6] = @"connections";
      v29 = [NSNumber numberWithInt:self->up_count];
      v90[6] = v29;
      v89[7] = @"jobs";
      [NSNumber numberWithInt:self->job_count];
      v31 = v30 = v6;
      v90[7] = v31;
      v89[8] = @"expirations";
      v32 = [NSNumber numberWithInt:self->expire_count];
      v90[8] = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:9];
      v92[3] = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:4];

      id v6 = v30;
      id v35 = [(PCCEndpoint *)self->_endpoint send:v7 message:v34 error:0];

      v37 = v72;
      v36 = v74;
    }
    else
    {
      v51 = [v74 objectForKey:@"set-expire"];

      if (v51)
      {
        v52 = [v74 objectForKeyedSubscript:@"set-expire"];
        int v53 = [v52 intValue];

        if (v53 <= 5) {
          int v54 = 5;
        }
        else {
          int v54 = v53;
        }
        if (v54 >= 0xE10) {
          int v54 = 3600;
        }
        self->_double jobTimeout = (double)v54;
        v87[0] = @"messageType";
        v87[1] = @"jobType";
        v88[0] = @"jobStatus";
        v88[1] = @"synchronize";
        v37 = v25;
        v88[2] = v25;
        v87[2] = @"jobId";
        v87[3] = @"content";
        v55 = objc_msgSend(NSString, "stringWithFormat:", @"jobTimeout set to %.0f secs", (double)v54);
        v88[3] = v55;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:4];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          double jobTimeout = self->_jobTimeout;
          *(_DWORD *)buf = 134217984;
          v99 = *(__CFString **)&jobTimeout;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "jobTimeout set to %.0f secs", buf, 0xCu);
        }
        id v58 = [(PCCEndpoint *)self->_endpoint send:v7 message:v56 error:0];

        v36 = v74;
      }
      else
      {
        v36 = v74;
        v59 = [v74 objectForKeyedSubscript:@"test-expire"];
        int v60 = [v59 BOOLValue];

        if (v60)
        {
          job_queue = self->_job_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke_118;
          block[3] = &unk_1E6C29B60;
          block[4] = self;
          v37 = v25;
          id v77 = v25;
          id v78 = v7;
          dispatch_async(job_queue, block);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "remote synchronization", buf, 2u);
          }
          v85[0] = @"messageType";
          v85[1] = @"jobType";
          v86[0] = @"jobStatus";
          v86[1] = @"synchronize";
          v85[2] = @"jobId";
          v85[3] = @"content";
          v37 = v25;
          v86[2] = v25;
          v86[3] = @"remote-Ok";
          v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:4];
          id v63 = [(PCCEndpoint *)self->_endpoint send:v7 message:v62 error:0];
        }
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v6;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }
LABEL_24:
}

uint64_t __39__PCCProxiedDevice_handleMessage_from___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __39__PCCProxiedDevice_handleMessage_from___block_invoke_118(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    double v2 = *(double *)(*(void *)(a1 + 32) + 80) / 60.0;
    *(_DWORD *)buf = 134217984;
    double v11 = v2;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "starting bogus job; wait for expiration in %.1f mins",
      buf,
      0xCu);
  }
  v3 = [[PCCJob alloc] initWithID:*(void *)(a1 + 40) forTarget:*(void *)(a1 + 48) options:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:@"<bogus-tracker>"];
  [*(id *)(a1 + 32) startTimer];
  BOOL v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "allValues", @"messageType", @"jobType", @"jobId", @"content", @"jobStatus", @"synchronize", *(void *)(a1 + 40));
  id v5 = [v4 valueForKey:@"description"];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:4];

  id v7 = (id)[*(id *)(*(void *)(a1 + 32) + 8) send:*(void *)(a1 + 48) message:v6 error:0];
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PCCProxiedDevice handleFile:from:metadata:]();
  }
}

- (void)sendDeviceMetadata:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = @"messageType";
  v11[1] = @"deviceMetadata";
  v12[0] = @"updateProxiedDeviceMetadata";
  id v5 = [MEMORY[0x1E4F83948] sharedInstance];
  id v6 = [v5 metadata];
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    dispatch_queue_t v10 = @"updateProxiedDeviceMetadata";
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "posted %@ (unsolicited)", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(PCCEndpoint *)self->_endpoint send:v4 message:v7 error:0];
}

- (void)acceptTaskingPayload:(id)a3 forRouting:(id)a4 withId:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (OSAIsRSDDevice()) {
    goto LABEL_2;
  }
  if ([@"-1" isEqualToString:v9]) {
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"ca1"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_2:
      id v10 = v7;
      id v7 = v10;
LABEL_5:
      id v11 = (id)[MEMORY[0x1E4F83950] applyTasking:v8 taskId:v9 fromBlob:v10];
      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unknown payload format for ca1 routing", buf, 2u);
    }
LABEL_4:
    id v10 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18[0] = @"PayloadContent";
    v18[1] = @"PayloadType";
    v19[0] = v7;
    v19[1] = @"Configuration";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

    id v7 = (id)v12;
  }
  id v15 = 0;
  uint64_t v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v15];
  id v14 = v15;
  id v10 = v14;
  if (v13)
  {

    id v10 = (id)v13;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v10;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Serialization of settings to plist failed: %@", buf, 0xCu);
  }
LABEL_6:
}

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    job_queue = self->_job_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __37__PCCProxiedDevice_ack_result_error___block_invoke;
    v11[3] = &unk_1E6C29B88;
    v11[4] = self;
    id v12 = v8;
    BOOL v14 = a4;
    id v13 = v9;
    dispatch_async(job_queue, v11);
  }
}

void __37__PCCProxiedDevice_ack_result_error___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E0197840]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
    [v3 registerResult:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) doWork:v3];
  }
}

- (void)initiate:(id)a3 transferGroupWithOptions:(id)a4 job:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = @"<unsolicited>";
  if (a5) {
    id v10 = (__CFString *)a5;
  }
  id v11 = v10;
  job_queue = self->_job_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke;
  v16[3] = &unk_1E6C29BB0;
  id v17 = v9;
  v18 = self;
  v19 = v11;
  id v20 = v8;
  id v13 = v8;
  BOOL v14 = v11;
  id v15 = v9;
  dispatch_async(job_queue, v16);
}

void __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E0197840]();
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"allFiles"];
  int v4 = [v3 BOOLValue];

  if (*(void *)(*(void *)(a1 + 40) + 24))
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"event"];
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v7 = [v6 objectForKeyedSubscript:@"event"];
    }
    else
    {
      id v12 = [v6 objectForKeyedSubscript:@"jobEvent"];
      if (v12)
      {
        id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobEvent"];
      }
      else
      {
        id v7 = @"<unknown>";
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = [*(id *)(*(void *)(a1 + 40) + 24) jid];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "declining job %{public}@; group transfer already in progress (%{public}@)",
        buf,
        0x16u);
    }
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    if (v4) {
      id v20 = @"xfer-all";
    }
    else {
      id v20 = @"xfer-group";
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = @"group transfer already in progress";
    BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = [v21 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:5 userInfo:v14];
    [v17 finish:v18 target:v19 event:v7 type:v20 result:v22];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"standard";
      uint64_t v9 = *(void *)(a1 + 48);
      if (v4) {
        id v8 = @"all";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "starting job %{public}@, transfer group '%@'", buf, 0x16u);
    }
    ++*(_DWORD *)(*(void *)(a1 + 40) + 68);
    id v7 = (__CFString *)*(id *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(a1 + 40) + 76))
    {
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        id v11 = (__CFString *)[v10 mutableCopy];
      }
      else {
        id v11 = (__CFString *)objc_opt_new();
      }
      id v13 = v11;
      [(__CFString *)v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"<preserve>"];

      id v7 = v13;
    }
    BOOL v14 = [[PCCGroupJob alloc] initWithID:*(void *)(a1 + 48) forTarget:*(void *)(a1 + 56) options:v7];
    if ([*(id *)(a1 + 40) doWork:v14])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v14);
      [*(id *)(a1 + 40) startTimer];
    }
  }
}

- (void)initiate:(id)a3 transferLog:(id)a4 withOptions:(id)a5 job:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = @"<unsolicited>";
  if (a6) {
    id v13 = (__CFString *)a6;
  }
  BOOL v14 = v13;
  job_queue = self->_job_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke;
  block[3] = &unk_1E6C29BD8;
  block[4] = self;
  id v21 = v12;
  v22 = v14;
  id v23 = v10;
  id v24 = v11;
  id v16 = v11;
  id v17 = v10;
  uint64_t v18 = v14;
  id v19 = v12;
  dispatch_async(job_queue, block);
}

void __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E0197840]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 68);
  id v3 = *(id *)(a1 + 40);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 76))
  {
    int v4 = *(void **)(a1 + 40);
    if (v4) {
      id v5 = (void *)[v4 mutableCopy];
    }
    else {
      id v5 = objc_opt_new();
    }
    id v6 = v5;
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"<preserve>"];

    id v3 = v6;
  }
  id v7 = [[PCCJob alloc] initWithID:*(void *)(a1 + 48) forTarget:*(void *)(a1 + 56) options:v3 forFile:*(void *)(a1 + 64)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [(PCCJob *)v7 type];
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    BOOL v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "starting job %{public}@, %{public}@ '%{public}@'", (uint8_t *)&v11, 0x20u);
  }
  if ([*(id *)(a1 + 32) doWork:v7]) {
    [*(id *)(a1 + 32) startTimer];
  }
}

- (BOOL)doWork:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  int v4 = (PCCGroupJob *)a3;
  id v5 = [(PCCJob *)v4 nextFilepath];

  if (v5)
  {
    ++self->file_count;
    id v6 = [(PCCJob *)v4 options];
    id v7 = [v6 objectForKeyedSubscript:@"allFiles"];
    if ([v7 BOOLValue]) {
      uint64_t v8 = 1200;
    }
    else {
      uint64_t v8 = 0;
    }
    [(PCCEndpoint *)self->_endpoint setFileTimeout:v8];

    endpoint = self->_endpoint;
    uint64_t v10 = [(PCCJob *)v4 target];
    int v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [(PCCJob *)v4 nextFilepath];
    __int16 v13 = [v11 fileURLWithPath:v12];
    BOOL v14 = [(PCCJob *)v4 metadata];
    id v31 = 0;
    __int16 v15 = [(PCCEndpoint *)endpoint send:v10 file:v13 metadata:v14 error:&v31];
    id v16 = v31;

    if (v15)
    {
      [(NSMutableDictionary *)self->_jobByTracker setObject:v4 forKeyedSubscript:v15];
      uint64_t v17 = v4;
    }
    else
    {
      if (!v16)
      {
        id v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = @"no send tracking id";
        id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        id v16 = [v23 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:4 userInfo:v24];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v25 = [(PCCJob *)v4 jid];
        *(_DWORD *)buf = 138412546;
        v33 = v25;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "aborting job %@; file send failure: %@",
          buf,
          0x16u);
      }
      uint64_t v26 = [(PCCJob *)v4 jid];
      __int16 v27 = [(PCCJob *)v4 target];
      v28 = [(PCCJob *)v4 event];
      uint64_t v29 = [(PCCGroupJob *)v4 type];
      [(PCCProxiedDevice *)self finish:v26 target:v27 event:v28 type:v29 result:v16];

      if (self->_groupXferJob == v4)
      {
        self->_groupXferJob = 0;
      }
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v18 = [(PCCJob *)v4 jid];
    id v19 = [(PCCJob *)v4 target];
    id v20 = [(PCCJob *)v4 event];
    id v21 = [(PCCGroupJob *)v4 type];
    v22 = [(PCCGroupJob *)v4 result];
    [(PCCProxiedDevice *)self finish:v18 target:v19 event:v20 type:v21 result:v22];

    if (self->_groupXferJob == v4)
    {
      self->_groupXferJob = 0;
    }
    uint64_t v17 = 0;
  }
  return v17 != 0;
}

- (void)finish:(id)a3 target:(id)a4 event:(id)a5 type:(id)a6 result:(id)a7
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (__CFString *)a7;
  if (v16)
  {
    v34[0] = @"messageType";
    v34[1] = @"jobId";
    v35[0] = @"jobStatus";
    v35[1] = v12;
    v34[2] = @"jobEvent";
    v34[3] = @"jobType";
    v35[2] = v14;
    v35[3] = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    uint64_t v18 = (void *)[v17 mutableCopy];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v16;
      id v20 = [(__CFString *)v19 domain];
      [v18 setObject:v20 forKeyedSubscript:@"error_domain"];

      id v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString code](v19, "code"));
      [v18 setObject:v21 forKeyedSubscript:@"error_code"];

      v22 = [(__CFString *)v19 userInfo];

      [v18 setObject:v22 forKeyedSubscript:@"error_info"];
    }
    else
    {
      [v18 setObject:v16 forKeyedSubscript:@"content"];
    }
    id v23 = [(PCCEndpoint *)self->_endpoint send:v13 message:v18 error:0];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v25 = @"Ok";
    if (isKindOfClass) {
      v25 = v16;
    }
    int v30 = 138412546;
    id v31 = v12;
    __int16 v32 = 2112;
    v33 = v25;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "completed job %@: %@", (uint8_t *)&v30, 0x16u);
  }
  if (![(NSMutableDictionary *)self->_jobByTracker count])
  {
    expiryTimer = self->_expiryTimer;
    BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (expiryTimer)
    {
      if (v27)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no outstanding jobs; releasing transaction",
          (uint8_t *)&v30,
          2u);
      }
      dispatch_source_cancel((dispatch_source_t)self->_expiryTimer);
      v28 = self->_expiryTimer;
      self->_expiryTimer = 0;

      txn = self->_txn;
      self->_txn = 0;
    }
    else if (v27)
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no outstanding jobs (and no transactions were in play)", (uint8_t *)&v30, 2u);
    }
  }
}

- (void)startTimer
{
  job_queue = self->_job_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PCCProxiedDevice_startTimer__block_invoke;
  block[3] = &unk_1E6C29C00;
  block[4] = self;
  dispatch_async(job_queue, block);
}

void __30__PCCProxiedDevice_startTimer__block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E0197840]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 40))
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v3 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 40);
    dispatch_time_t v9 = dispatch_walltime(0, (uint64_t)(*(double *)(v7 + 80) * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(NSObject **)(v10 + 40);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__PCCProxiedDevice_startTimer__block_invoke_2;
    handler[3] = &unk_1E6C29C00;
    handler[4] = v10;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
    if (*(void *)(*(void *)(a1 + 32) + 48))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        id v12 = MEMORY[0x1E4F14500];
        id v13 = "re-starting job timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_1DBFFE000, v12, OS_LOG_TYPE_DEFAULT, v13, v17, 2u);
      }
    }
    else
    {
      uint64_t v14 = os_transaction_create();
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 48);
      *(void *)(v15 + 48) = v14;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        id v12 = MEMORY[0x1E4F14500];
        id v13 = "starting job timer and creating transaction";
        goto LABEL_7;
      }
    }
  }
}

void __30__PCCProxiedDevice_startTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  v28 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(*(void *)(v1 + 32) + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    uint64_t v26 = v1;
    uint64_t v27 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        dispatch_time_t v9 = [*(id *)(*(void *)(v1 + 32) + 32) objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 lastTouch];
        [v10 timeIntervalSinceNow];
        double v12 = fabs(v11);
        double v13 = *(double *)(*(void *)(v1 + 32) + 80);

        if (v12 > v13)
        {
          ++*(_DWORD *)(*(void *)(v1 + 32) + 72);
          [v28 addObject:v8];
          int v30 = *(void **)(v1 + 32);
          uint64_t v14 = [v9 jid];
          uint64_t v15 = [v9 target];
          id v16 = [v9 event];
          uint64_t v17 = [v9 type];
          uint64_t v18 = v6;
          id v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v36 = v27;
          v37 = @"job expired due to lack of progress";
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          v21 = uint64_t v20 = v5;
          v22 = [v19 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:5 userInfo:v21];
          [v30 finish:v14 target:v15 event:v16 type:v17 result:v22];

          uint64_t v6 = v18;
          uint64_t v1 = v26;

          uint64_t v5 = v20;
          uint64_t v23 = *(void *)(v26 + 32);
          if (v9 == *(void **)(v23 + 24))
          {
            *(void *)(v23 + 24) = 0;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(v1 + 32) + 32) removeObjectsForKeys:v28];
  if ([*(id *)(*(void *)(v1 + 32) + 32) count])
  {
    [*(id *)(v1 + 32) startTimer];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "job expiration event; releasing transaction",
        buf,
        2u);
    }
    uint64_t v24 = *(void *)(v1 + 32);
    v25 = *(void **)(v24 + 48);
    *(void *)(v24 + 48) = 0;
  }
}

- (double)jobTimeout
{
  return self->_jobTimeout;
}

- (void)setJobTimeout:(double)a3
{
  self->_double jobTimeout = a3;
}

- (BOOL)preserveFiles
{
  return self->_preserveFiles;
}

- (void)setPreserveFiles:(BOOL)a3
{
  self->_preserveFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_jobByTracker, 0);
  objc_storeStrong((id *)&self->_groupXferJob, 0);
  objc_storeStrong((id *)&self->_job_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)handleFile:from:metadata:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PCCProxiedDevice unexpectedly asked to handle a file. This is a no-op", v0, 2u);
}

@end