@interface FCCKDirectRequestOperation
- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4;
- (BOOL)validateOperation;
- (FCCKDirectRequestOperation)initWithNetworkReachability:(id)a3;
- (double)preferredTimeoutIntervalForRequest;
- (id)_bundleIDToReport;
- (id)_requestBodyData;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)_processResponseData:(id *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)resetForRetry;
- (void)setNetworkBehaviorMonitor:(uint64_t)a1;
- (void)setResultError:(uint64_t)a1;
@end

@implementation FCCKDirectRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultErrorsByRequestID, 0);
  objc_storeStrong((id *)&self->_resultResponses, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_criticalNodeFailureTest, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v10 = a3;
  v4 = [v10 domain];
  if ([v4 isEqualToString:@"FCErrorDomain"])
  {
    id v5 = v10;
  }
  else
  {
    id v5 = [v10 CKClientSuitableError];
  }
  v6 = v5;

  if (self)
  {
    id requestCompletionHandler = self->_requestCompletionHandler;
    if (requestCompletionHandler)
    {
      v8 = (void (**)(id, NSMutableArray *, NSMutableDictionary *, void *))requestCompletionHandler;
      v9 = self->_resultResponses;
      v8[2](v8, v9, self->_resultErrorsByRequestID, v6);
    }
  }
}

- (void)setNetworkBehaviorMonitor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (FCCKDirectRequestOperation)initWithNetworkReachability:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FCCKDirectRequestOperation;
  v3 = [(FCNetworkOperation *)&v9 initWithNetworkReachability:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requestType = 0;
    id v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    requestUUID = v4->_requestUUID;
    v4->_requestUUID = (NSString *)v6;

    v4->_networkEventType = 0;
  }
  return v4;
}

- (void)performOperation
{
  v2 = self;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCCKDirectRequestOperation *)self->_requests;
  }
  if ((unint64_t)[(FCCKDirectRequestOperation *)self count] < 0x191)
  {
    self;
    if (qword_1E96597F0 != -1) {
      dispatch_once(&qword_1E96597F0, &__block_literal_global_71);
    }
    id v80 = (id)qword_1E96597E8;
    if (!v2)
    {
      id v8 = 0;
      goto LABEL_61;
    }
    v7 = v2->_baseURL;
    id v8 = (id)objc_opt_new();
    FCOperationFlagsApplyToURLRequest([(FCOperation *)v2 flags], v8);
    [(FCCKDirectRequestOperation *)v2 preferredTimeoutIntervalForRequest];
    objc_msgSend(v8, "setTimeoutInterval:");
    objc_super v9 = v7;
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = [(NSURL *)v9 port];
    if (v11)
    {
      v12 = NSString;
      v13 = [(NSURL *)v9 port];
      v14 = [v12 stringWithFormat:@":%@", v13];
    }
    else
    {
      v14 = &stru_1EF8299B8;
    }

    [v10 setObject:v2->_requestUUID forKeyedSubscript:@"X-Apple-Request-UUID"];
    v15 = FCClientInfoHeaderValue();
    [v10 setObject:v15 forKeyedSubscript:@"X-MMe-Client-Info"];

    v16 = FCUserAgentHeaderValue();
    [v10 setObject:v16 forKeyedSubscript:@"User-Agent"];

    [v10 setObject:v2->_containerName forKeyedSubscript:@"X-CloudKit-ContainerId"];
    v17 = NSString;
    v18 = [(NSURL *)v9 scheme];
    v19 = [(NSURL *)v9 host];
    objc_msgSend(v17, "stringWithFormat:", @"%@; desc=\"%@://%@%@/static/protobuf/CloudDB/CloudDBClient.desc\"; messageType=RequestOperation; delimited=true",
      @"application/x-protobuf",
      v18,
      v19,
    v20 = v14);
    [v10 setObject:v20 forKeyedSubscript:@"Content-Type"];

    objc_msgSend(v10, "setObject:forKeyedSubscript:", @"client=1;comments=1;device=1;presence=1;records=1;sharing=1;subscriptions=1;users=1;",
      @"X-CloudKit-ProtocolVersion");
    [v10 setObject:@"application/x-protobuf" forKeyedSubscript:@"Accept"];
    v21 = -[FCCKDirectRequestOperation _bundleIDToReport]();
    [v10 setObject:v21 forKeyedSubscript:@"X-CloudKit-BundleId"];
    [v10 setObject:@"Public" forKeyedSubscript:@"X-CloudKit-DatabaseScope"];
    [v10 setObject:@"gzip" forKeyedSubscript:@"Content-Encoding"];
    [v10 setObject:@"no-transform" forKeyedSubscript:@"Cache-Control"];
    self;
    if (qword_1E96597F8 != -1) {
      dispatch_once(&qword_1E96597F8, &__block_literal_global_175);
    }
    if (_MergedGlobals_89) {
      [v10 setObject:@"DEBUG" forKeyedSubscript:@"X-Apple-Request-Log-Level"];
    }
    v22 = NewsCoreUserDefaults();
    v23 = [v22 stringForKey:@"cloudkit_partition_override"];

    if ([v23 length]) {
      [v10 setObject:v23 forKeyedSubscript:@"X-Requested-Partition"];
    }
    if (NFInternalBuild()) {
      [v10 setObject:@"true" forKeyedSubscript:@"X-Apple-Internal-News"];
    }
    objc_opt_class();
    self;
    if (s_newTodayFeedEnabled) {
      [v10 setObject:@"true" forKeyedSubscript:@"X-Apple-News-Feature-NewTodayFeed"];
    }
    objc_opt_class();
    self;
    if (s_newTagFeedEnabled) {
      [v10 setObject:@"true" forKeyedSubscript:@"X-Apple-News-Feature-NewTagFeed"];
    }
    if (v2->_additionalRequestHTTPHeaders) {
      objc_msgSend(v10, "addEntriesFromDictionary:");
    }

    [v8 setAllHTTPHeaderFields:v10];
    if (!v2->_edgeCacheHint)
    {
      [v8 setURL:v9];
      [v8 setHTTPMethod:@"POST"];
      v27 = -[FCCKDirectRequestOperation _requestBodyData]((uint64_t)v2);
      [v8 setHTTPBody:v27];

      [v8 setCachePolicy:1];
      goto LABEL_49;
    }
    v24 = v2->_requests;
    if ([(NSArray *)v24 count] == 1)
    {
      v25 = [(NSArray *)v2->_requests firstObject];
      v26 = -[FCCKPRequestOperation queryRetrieveRequest](v25);

      if (v26)
      {
LABEL_37:
        [v8 setHTTPMethod:@"GET"];
        v28 = -[FCCKDirectRequestOperation _requestBodyData]((uint64_t)v2);
        v29 = [v28 base64EncodedStringWithOptions:0];
        [v8 addValue:v29 forHTTPHeaderField:@"X-Apple-CloudKit-Request-Body"];

        [v8 setValue:0 forHTTPHeaderField:@"Cache-Control"];
        v30 = NSString;
        v31 = v2->_edgeCacheHint;
        v32 = [(FCEdgeCacheHint *)v31 groupName];
        v33 = [(FCEdgeCacheHint *)v2->_edgeCacheHint cacheControlKey];
        v79 = [v30 stringWithFormat:@"%@/%@", v32, v33];

        v34 = [MEMORY[0x1E4F1CA58] data];
        v35 = [(NSArray *)v2->_requests firstObject];
        v36 = -[FCCKPRequestOperation queryRetrieveRequest](v35);
        v37 = [v36 data];
        [v34 appendData:v37];

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        self;
        if (qword_1E9659808 != -1) {
          dispatch_once(&qword_1E9659808, &__block_literal_global_177_0);
        }
        id v38 = (id)qword_1E9659800;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v89 objects:buf count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v90 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v89 + 1) + 8 * i);
              v43 = [v8 allHTTPHeaderFields];
              v44 = [v43 objectForKey:v42];

              if (v44)
              {
                v45 = [v44 dataUsingEncoding:4];
                [v34 appendData:v45];
              }
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v89 objects:buf count:16];
          }
          while (v39);
        }

        v46 = objc_msgSend(v34, "fc_sha256");
        v47 = objc_msgSend(v46, "fc_URLSafeBase64EncodedStringWithOptions:", 0);
        v48 = [v79 stringByAppendingPathComponent:v47];
        v49 = [(NSURL *)v9 URLByAppendingPathComponent:v48];
        [v8 setURL:v49];

        [v8 setCachePolicy:1];
LABEL_49:
        if (v2->_edgeCacheHint)
        {
          v50 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            v51 = v50;
            v52 = [(FCOperation *)v2 shortOperationDescription];
            v53 = [v8 URL];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v53;
            _os_log_impl(&dword_1A460D000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ will issue request to CK-at-Edge with URL %{public}@", buf, 0x16u);
          }
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke;
          v86[3] = &unk_1E5B54FA0;
          v86[4] = v2;
          id v87 = v80;
          id v8 = v8;
          id v88 = v8;
          v54 = __46__FCCKDirectRequestOperation_performOperation__block_invoke((uint64_t)v86);

          if (v54)
          {
            v55 = [v54 response];
            [v55 _calculatedExpiration];
            double v57 = v56;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            if (v57 > v58)
            {

LABEL_56:
              v61 = (void *)FCOperationLog;
              if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
              {
                v62 = v61;
                v63 = [(FCOperation *)v2 shortOperationDescription];
                v64 = (void *)MEMORY[0x1E4F1C9C8];
                v65 = [v54 response];
                [v65 _calculatedExpiration];
                v66 = objc_msgSend(v64, "dateWithTimeIntervalSinceReferenceDate:");
                v67 = [v8 URL];
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v66;
                *(_WORD *)&buf[22] = 2114;
                v94 = v67;
                _os_log_impl(&dword_1A460D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ reusing locally-cached response with expiration date %@ for CK-at-Edge request with URL %{public}@", buf, 0x20u);
              }
              v68 = [v54 data];
              -[FCCKDirectRequestOperation _processResponseData:]((id *)&v2->super.super.super.super.isa, v68);

              [(FCOperation *)v2 finishedPerformingOperationWithError:v2->_resultError];
LABEL_68:

              return;
            }
            v59 = NewsCoreUserDefaults();
            int v60 = [v59 BOOLForKey:@"ignore_ttl_in_url_cache"];

            if (v60) {
              goto LABEL_56;
            }
          }
LABEL_62:
          *(void *)&long long v89 = 0;
          *((void *)&v89 + 1) = &v89;
          long long v90 = 0x2020000000uLL;
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v94 = __Block_byref_object_copy__31;
          v95 = __Block_byref_object_dispose__31;
          id v96 = 0;
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_33;
          v81[3] = &unk_1E5B54FF0;
          v84 = buf;
          v81[4] = v2;
          id v82 = v80;
          id v8 = v8;
          id v83 = v8;
          v85 = &v89;
          uint64_t v70 = [v82 dataTaskWithRequest:v8 completionHandler:v81];
          v71 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v70;

          [(FCOperation *)v2 associateChildOperation:*(void *)(*(void *)&buf[8] + 40)];
          v72 = (id)FCOperationLog;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v73 = [*(id *)(*(void *)&buf[8] + 40) longOperationDescription];
            *(_DWORD *)v97 = 138543362;
            v98 = v73;
            _os_log_impl(&dword_1A460D000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ started", v97, 0xCu);
          }
          if (v2)
          {
            id networkActivityBlock = v2->_networkActivityBlock;
            if (networkActivityBlock)
            {
              v75 = (void (**)(void))networkActivityBlock;
              v76 = v75[2]();
              objc_storeStrong((id *)&v2->_networkActivity, v76);

              v77 = v2->_networkActivity;
              [(FCNetworkActivity *)v77 attachActivityToTask:*(void *)(*(void *)&buf[8] + 40)];

              [*(id *)(*(void *)&buf[8] + 40) setDelegate:v2];
            }
          }
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          *(void *)(*((void *)&v89 + 1) + 24) = v78;
          [*(id *)(*(void *)&buf[8] + 40) resume];
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v89, 8);
          goto LABEL_68;
        }
LABEL_61:
        v54 = 0;
        goto LABEL_62;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v69 = (void *)[[NSString alloc] initWithFormat:@"only queries are supported by ck-at-the-edge"];
      *(_DWORD *)v97 = 136315906;
      v98 = "-[FCCKDirectRequestOperation generateHTTPRequest]";
      __int16 v99 = 2080;
      v100 = "FCCKDirectRequestOperation.m";
      __int16 v101 = 1024;
      int v102 = 469;
      __int16 v103 = 2114;
      v104 = v69;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v97, 0x26u);
    }
    goto LABEL_37;
  }
  v3 = (void *)MEMORY[0x1E4F1A130];
  if (v2)
  {
    v4 = v2->_requests;
    id v5 = objc_msgSend(v3, "errorWithCode:format:", 1020, @"Your request contains %ld items which is more than the maximum number of items in a single request (%ld)", -[NSArray count](v4, "count"), 400);
    objc_storeStrong((id *)&v2->_resultError, v5);

    resultError = v2->_resultError;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1A130], "errorWithCode:format:", 1020, @"Your request contains %ld items which is more than the maximum number of items in a single request (%ld)", objc_msgSend(0, "count"), 400);

    resultError = 0;
  }
  [(FCOperation *)v2 finishedPerformingOperationWithError:resultError];
}

- (double)preferredTimeoutIntervalForRequest
{
  if (!self) {
    goto LABEL_6;
  }
  int networkEventType = self->_networkEventType;
  if (networkEventType != 10)
  {
    if (networkEventType == 14)
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v7 = [v6 objectForKey:@"news.modules.today_feed.last_offline_refresh_date"];
      id v8 = FCCheckedDynamicCast(v5, (uint64_t)v7);

      [v8 doubleValue];
      double v10 = v9;

      double result = 5.0;
      if (v10 > 0.0) {
        return result;
      }
      v13 = self;
      v11 = &v13;
      goto LABEL_7;
    }
LABEL_6:
    v12 = self;
    v11 = &v12;
LABEL_7:
    v11[1] = (FCCKDirectRequestOperation *)FCCKDirectRequestOperation;
    objc_msgSendSuper2((objc_super *)v11, sel_preferredTimeoutIntervalForRequest, result, v12);
    return result;
  }
  return 15.0;
}

id __46__FCCKDirectRequestOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 378))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_2;
    v7[3] = &unk_1E5B4C840;
    v7[4] = v2;
    v3 = __46__FCCKDirectRequestOperation_performOperation__block_invoke_2((uint64_t)v7);
  }
  else
  {
    v4 = [*(id *)(a1 + 40) configuration];
    id v5 = [v4 URLCache];
    v3 = [v5 cachedResponseForRequest:*(void *)(a1 + 48)];
  }
  return v3;
}

- (id)_requestBodyData
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 384) firstObject];
  v3 = objc_opt_new();
  -[FCCKPRequestOperation setHeader:]((uint64_t)v2, v3);

  v4 = -[FCCKDirectRequestOperation _bundleIDToReport]();
  if (v2) {
    id v5 = v2[1];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  -[FCCKPRequestOperationHeader setApplicationBundle:]((uint64_t)v6, v4);

  id v7 = *(id *)(a1 + 400);
  if (v2) {
    id v8 = v2[1];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  -[FCCKPRequestOperationHeader setApplicationContainer:]((uint64_t)v9, v7);

  if (*(unsigned char *)(a1 + 376)) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  if (v2)
  {
    v11 = v2[1];
    if (v11)
    {
      v11[110] |= 0x40u;
      *((_DWORD *)v11 + 18) = v10;
    }

    v12 = v2[1];
    if (v12)
    {
      v12[110] |= 0x200u;
      *((_DWORD *)v12 + 50) = 2;
    }
  }
  else
  {
    v12 = 0;
  }

  v13 = CKProductType();
  if (v2) {
    id v14 = v2[1];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  -[FCCKPRequestOperationHeader setDeviceHardwareVersion:]((uint64_t)v15, v13);

  v16 = CKProductVersion();
  if (v2) {
    id v17 = v2[1];
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;
  -[FCCKPRequestOperationHeader setDeviceSoftwareVersion:]((uint64_t)v18, v16);

  char v19 = NFInternalBuild();
  if (v2)
  {
    char v20 = v19;
    v21 = v2[1];
    if (v21)
    {
      v21[110] |= 0x400u;
      *((unsigned char *)v21 + 216) = v20;
    }
  }
  else
  {
    v21 = 0;
  }

  v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v23 = [v22 infoDictionary];
  v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  v66 = (id *)a1;
  if (v2) {
    id v25 = v2[1];
  }
  else {
    id v25 = 0;
  }
  id v26 = v25;
  -[FCCKPRequestOperationHeader setDeviceLibraryName:]((uint64_t)v26, v24);

  v27 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];
  if (v2) {
    id v28 = v2[1];
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  -[FCCKPRequestOperationHeader setDeviceLibraryVersion:]((uint64_t)v29, v27);

  v30 = objc_opt_new();
  v67 = v4;
  v63 = v23;
  if (v2) {
    id v31 = v2[1];
  }
  else {
    id v31 = 0;
  }
  id v32 = v31;
  -[FCCKPRequestOperationHeader setLocale:]((uint64_t)v32, v30);

  v33 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v34 = [v33 firstObject];
  v35 = v34;
  if (!v34)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", v23);
    v35 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
  }
  v65 = v22;
  if (v2)
  {
    id v36 = v2[1];
    v37 = v36;
    if (v36)
    {
      id v38 = (void *)*((void *)v36 + 22);
      goto LABEL_31;
    }
  }
  else
  {
    v37 = 0;
  }
  id v38 = 0;
LABEL_31:
  id v39 = v38;
  -[FCCKPLocale setLanguageCode:]((uint64_t)v39, v35);

  if (!v34)
  {
  }
  uint64_t v40 = [MEMORY[0x1E4F1CA20] currentLocale];
  v41 = [v40 objectForKey:*MEMORY[0x1E4F1C400]];
  if (v2)
  {
    id v42 = v2[1];
    v43 = v42;
    v44 = v67;
    if (v42) {
      v45 = (void *)*((void *)v42 + 22);
    }
    else {
      v45 = 0;
    }
  }
  else
  {
    v43 = 0;
    v45 = 0;
    v44 = v67;
  }
  id v46 = v45;
  -[FCCKPLocale setRegionCode:]((uint64_t)v46, v41);

  v47 = [v66 purpose];

  if (v47 != @"unknown")
  {
    v48 = [v66 purpose];
    if (v2) {
      id v49 = v2[1];
    }
    else {
      id v49 = 0;
    }
    id v50 = v49;
    -[FCCKPRequestOperationHeader setOperationGroupName:]((uint64_t)v50, v48);
  }
  uint64_t v51 = objc_msgSend(v66[48], "lastObject", v63);
  v52 = (void *)v51;
  if (v51)
  {
    v53 = *(id *)(v51 + 32);
    if (v53)
    {
      v53[24] |= 2u;
      v53[20] = 1;
    }
  }
  else
  {
    v53 = 0;
  }

  v54 = [MEMORY[0x1E4F1CA58] data];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v55 = v66[48];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v69 != v58) {
          objc_enumerationMutation(v55);
        }
        int v60 = [*(id *)(*((void *)&v68 + 1) + 8 * i) data];
        __int16 v73 = 0;
        uint64_t v72 = 0;
        [v60 length];
        [v54 appendBytes:&v72 length:PBDataWriterWriteBareVarint()];
        [v54 appendData:v60];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v57);
  }

  v61 = objc_msgSend(v54, "fc_gzipDeflate");

  return v61;
}

- (id)_bundleIDToReport
{
  if (qword_1E9659818 != -1) {
    dispatch_once(&qword_1E9659818, &__block_literal_global_180);
  }
  v0 = (void *)qword_1E9659810;
  return v0;
}

void __46__FCCKDirectRequestOperation_performOperation__block_invoke_34(uint64_t a1)
{
  v82[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (objc_class *)objc_opt_class();
  v3 = FCCheckedDynamicCast(v2, *(void *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  if (!v4)
  {
    if ([v3 statusCode] >= 200 && objc_msgSend(v3, "statusCode") < 300)
    {
      char v20 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 48);
        v22 = v20;
        v23 = [v21 shortOperationDescription];
        v24 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) _incompleteCurrentTaskTransactionMetrics];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ received has task metrics: %{public}@", buf, 0x16u);
      }
      uint64_t v25 = *(void *)(a1 + 48);
      if (v25 && *(void *)(v25 + 432))
      {
        id v26 = [v3 allHeaderFields];
        v27 = [v26 objectForKeyedSubscript:@"X-Apple-Cache"];

        id v28 = [v3 allHeaderFields];
        id v29 = [v28 objectForKeyedSubscript:@"Last-Modified"];

        v30 = [v3 allHeaderFields];
        id v31 = [v30 objectForKeyedSubscript:@"Via"];

        id v32 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(void **)(a1 + 48);
          v34 = v32;
          v35 = [v33 shortOperationDescription];
          int v36 = [v27 BOOLValue];
          v37 = @"non-cached";
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          if (v36) {
            v37 = @"cached";
          }
          *(void *)&buf[14] = v37;
          __int16 v78 = 2114;
          v79 = v29;
          __int16 v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_1A460D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ response from CK-at-Edge with last-modified %{public}@ via %{public}@", buf, 0x2Au);
        }
        unint64_t v38 = 20 * [*(id *)(a1 + 56) length];
        id v39 = [*(id *)(a1 + 64) configuration];
        uint64_t v40 = [v39 URLCache];
        unint64_t v41 = [v40 diskCapacity];

        if (v38 > v41)
        {
          id v42 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
          {
            __int16 v73 = *(void **)(a1 + 48);
            v74 = v42;
            uint64_t v75 = [v73 shortOperationDescription];
            v76 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 56), "length"), 0);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v75;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v76;
            _os_log_error_impl(&dword_1A460D000, v74, OS_LOG_TYPE_ERROR, "%{public}@ received response that won't fit in cache due to size %{public}@", buf, 0x16u);
          }
        }
      }
      v43 = (id)FCOperationLog;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = [*(id *)(a1 + 48) shortOperationDescription];
        uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "length"));
        id v46 = (void *)v45;
        info = *(__CFString **)(a1 + 48);
        if (info) {
          info = (__CFString *)info[14].info;
        }
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v45;
        __int16 v78 = 2114;
        v79 = info;
        _os_log_impl(&dword_1A460D000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ will process response data of length %{public}@ for request UUID %{public}@", buf, 0x20u);
      }
      -[FCCKDirectRequestOperation _processResponseData:](*(id **)(a1 + 48), *(void **)(a1 + 56));
      goto LABEL_40;
    }
    id v8 = *(void **)(a1 + 48);
    if (!v8)
    {
      uint64_t v50 = 0;
      id v49 = 0;
      goto LABEL_39;
    }
    id v9 = v3;
    uint64_t v10 = [v9 statusCode];
    v11 = [v9 allHeaderFields];

    if (v10 != 503)
    {
      v82[0] = *MEMORY[0x1E4F19CA8];
      uint64_t v17 = [NSNumber numberWithInteger:v10];
      v13 = (void *)v17;
      v82[1] = *MEMORY[0x1E4F19C10];
      id v18 = (void *)MEMORY[0x1E4F1CC08];
      if (v11) {
        id v18 = v11;
      }
      *(void *)buf = v17;
      *(void *)&buf[8] = v18;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v82 count:2];
      uint64_t v19 = 2001;
      goto LABEL_38;
    }
    v12 = [v11 objectForKeyedSubscript:@"Retry-After"];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 intValue];
      if ((v14 - 0x7FFFFFFF) > 0x80000001)
      {
        v82[0] = *MEMORY[0x1E4F19C60];
        v48 = [NSNumber numberWithInt:v14];
        *(void *)buf = v48;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v82 count:1];

        goto LABEL_37;
      }
      id v15 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
      {
        long long v71 = v15;
        uint64_t v72 = [v8 shortOperationDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        __int16 v78 = 2112;
        v79 = @"Retry-After";
        _os_log_error_impl(&dword_1A460D000, v71, OS_LOG_TYPE_ERROR, "%{public}@ Invalid value (%@) for %@ header field", buf, 0x20u);
      }
    }
    v16 = 0;
LABEL_37:
    uint64_t v19 = 2022;
LABEL_38:

    id v49 = objc_msgSend(MEMORY[0x1E4F1A130], "errorWithCode:userInfo:format:", v19, v16, @"Request failed with http status code %ld", v10);

    uint64_t v50 = *(void *)(a1 + 48);
LABEL_39:
    -[FCCKDirectRequestOperation setResultError:](v50, v49);

    goto LABEL_40;
  }
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v6 = [*(id *)(a1 + 40) code];

    if (v6 == -999)
    {
      id v7 = [MEMORY[0x1E4F1A130] errorWithCode:1 format:@"Operation was cancelled"];
      -[FCCKDirectRequestOperation setResultError:](*(void *)(a1 + 48), v7);

      goto LABEL_40;
    }
  }
  else
  {
  }
  -[FCCKDirectRequestOperation setResultError:](*(void *)(a1 + 48), *(void **)(a1 + 40));
LABEL_40:
  uint64_t v51 = [FCNetworkEvent alloc];
  v52 = *(unsigned int **)(a1 + 48);
  if (v52) {
    uint64_t v53 = v52[95];
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v54 = *(void *)(a1 + 72);
  id v55 = [v52 operationID];
  uint64_t v56 = *(void **)(a1 + 48);
  if (v56) {
    uint64_t v56 = (void *)v56[57];
  }
  uint64_t v57 = v56;
  double v58 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  v59 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) _incompleteCurrentTaskTransactionMetrics];
  int v60 = *(void **)(a1 + 48);
  if (v60) {
    int v60 = (void *)v60[50];
  }
  uint64_t v61 = *(void *)(a1 + 40);
  v62 = v60;
  v63 = [(FCNetworkEvent *)v51 initWithType:v53 URLRequest:v54 operationID:v55 requestUUID:v57 startTime:v3 HTTPResponse:v59 metrics:v58 containerName:v62 error:v61];
  uint64_t v64 = *(void *)(a1 + 48);
  if (v64) {
    objc_storeStrong((id *)(v64 + 464), v63);
  }

  uint64_t v65 = *(void *)(a1 + 48);
  if (v65)
  {
    v66 = *(void **)(v65 + 424);
    uint64_t v67 = *(void *)(v65 + 464);
  }
  else
  {
    v66 = 0;
    uint64_t v67 = 0;
  }
  id v68 = v66;
  [v68 logNetworkEvent:v67];

  long long v69 = *(void **)(a1 + 48);
  if (v69) {
    uint64_t v70 = v69[63];
  }
  else {
    uint64_t v70 = 0;
  }
  [v69 finishedPerformingOperationWithError:v70];
}

void __50__FCCKDirectRequestOperation__enableDebugLogLevel__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_89 = [v0 BOOLForKey:@"enable_debug_log_level_for_cloudkit_operations"];
}

void __40__FCCKDirectRequestOperation_URLSession__block_invoke()
{
  if (FCProcessIsMemoryConstrained())
  {
    id v10 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
    [v10 setURLCache:0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    id v0 = NewsCoreUserDefaults();
    int v1 = [v0 BOOLForKey:@"increase_url_cache_size"];

    if (v1) {
      uint64_t v2 = 1024000;
    }
    else {
      uint64_t v2 = 512000;
    }
    if (v1) {
      uint64_t v3 = 200000000;
    }
    else {
      uint64_t v3 = 100000000;
    }
    v4 = [(NSURLCache *)[FCCKDirectRequestOperationURLCache alloc] initWithMemoryCapacity:v2 diskCapacity:v3 diskPath:@"CK-at-Edge-URL-Cache"];
    [v10 setURLCache:v4];
  }
  objc_msgSend(v10, "set_timingDataOptions:", objc_msgSend(v10, "_timingDataOptions") | 1);
  [v10 setHTTPCookieStorage:0];
  [v10 setURLCredentialStorage:0];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.newsd"];

  if (v7) {
    objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", @"com.apple.news");
  }
  uint64_t v8 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v10];
  id v9 = (void *)qword_1E96597E8;
  qword_1E96597E8 = v8;
}

void __46__FCCKDirectRequestOperation_performOperation__block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v12 = v10;
    v13 = [v11 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    id v31 = v13;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);
  }
  uint64_t v14 = FCDispatchQueueForQualityOfService([*(id *)(a1 + 32) qualityOfService]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_34;
  v21[3] = &unk_1E5B54FC8;
  id v22 = v8;
  id v23 = v9;
  uint64_t v28 = *(void *)(a1 + 56);
  id v15 = *(void **)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v7;
  id v26 = v15;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 64);
  id v27 = v16;
  uint64_t v29 = v17;
  id v18 = v7;
  id v19 = v9;
  id v20 = v8;
  dispatch_async(v14, v21);
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5 = a3;
  char v6 = [v5 isCloudKitReachable];
  if ((v6 & 1) == 0) {
    *a4 = [v5 offlineReason];
  }

  return v6;
}

- (void)_processResponseData:(id *)a1
{
  buf[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = v3;
    unint64_t v6 = [v5 length];
    id v22 = v5;
    [v5 bytes];
    context = (void *)MEMORY[0x1A6260FD0]();
    if (v6)
    {
      uint64_t v21 = *MEMORY[0x1E4F19CA0];
      if (v6 >= 0x7FFFFFFF)
      {
        objc_msgSend(MEMORY[0x1E4F1A130], "errorWithCode:format:", 1005, @"response data has insane length %lu", v6, v19, v20);
      }
      else
      {
        buf[0] = 0;
        if (PBReaderReadVarIntBuf())
        {
          id v7 = (void *)MEMORY[0x1E4F1A130];
          id v8 = @"next object has zero length";
        }
        else
        {
          id v7 = (void *)MEMORY[0x1E4F1A130];
          id v8 = @"Couldn't read the size of the next object from the server";
        }
        objc_msgSend(v7, "errorWithCode:format:", 1005, v8, v18, v19, v20);
      id v9 = };
      if (v9)
      {
        id v10 = v3;
        objc_storeStrong(a1 + 63, v9);
        v11 = [v9 domain];
        if ([v11 isEqualToString:v21])
        {
          uint64_t v12 = [v9 code];

          v13 = v24;
          if (v12 == 1005)
          {
            uint64_t v14 = (void *)FCOperationLog;
            if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_FAULT))
            {
              id v16 = v14;
              uint64_t v17 = [v9 localizedDescription];
              LODWORD(buf[0]) = 138543362;
              *(void *)((char *)buf + 4) = v17;
              _os_log_fault_impl(&dword_1A460D000, v16, OS_LOG_TYPE_FAULT, "Failed to parse CloudKit response with error: %{public}@", (uint8_t *)buf, 0xCu);
            }
          }
          id v3 = v10;
        }
        else
        {

          id v3 = v10;
          v13 = v24;
        }
        goto LABEL_18;
      }
    }
    else
    {
    }
    objc_storeStrong(a1 + 61, v4);
    id v15 = a1 + 62;
    v13 = v24;
    objc_storeStrong(v15, v24);
    id v9 = 0;
LABEL_18:
  }
}

void __47__FCCKDirectRequestOperation__bundleIDToReport__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  int v1 = (void *)qword_1E9659810;
  qword_1E9659810 = v0;
}

void __56__FCCKDirectRequestOperation__headersImpactingEdgeCache__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"X-CloudKit-ContainerId";
  v2[1] = @"X-Apple-Permanent-Asset-URLs";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  int v1 = (void *)qword_1E9659800;
  qword_1E9659800 = v0;
}

- (BOOL)validateOperation
{
  id v2 = self;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCCKDirectRequestOperation *)self->_requests;
  }
  uint64_t v3 = [(FCCKDirectRequestOperation *)self count];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:@"direct-ck-request must have at least one request operation"];
    int v15 = 136315906;
    id v16 = "-[FCCKDirectRequestOperation validateOperation]";
    __int16 v17 = 2080;
    uint64_t v18 = "FCCKDirectRequestOperation.m";
    __int16 v19 = 1024;
    int v20 = 149;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

    if (!v2)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)[[NSString alloc] initWithFormat:@"direct-ck-request request must have a base URL"];
        int v15 = 136315906;
        id v16 = "-[FCCKDirectRequestOperation validateOperation]";
        __int16 v17 = 2080;
        uint64_t v18 = "FCCKDirectRequestOperation.m";
        __int16 v19 = 1024;
        int v20 = 153;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
      }
      char v4 = 0;
      if (!v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else if (!v2)
  {
    goto LABEL_9;
  }
  if (!v2->_baseURL) {
    goto LABEL_9;
  }
  char v4 = 1;
LABEL_12:
  if (v2->_containerName)
  {
    char v6 = 1;
    goto LABEL_17;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"direct-ck-request request must have a container name"];
    int v15 = 136315906;
    id v16 = "-[FCCKDirectRequestOperation validateOperation]";
    __int16 v17 = 2080;
    uint64_t v18 = "FCCKDirectRequestOperation.m";
    __int16 v19 = 1024;
    int v20 = 157;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  char v6 = 0;
  if (!v2)
  {
LABEL_19:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)[[NSString alloc] initWithFormat:@"direct-ck-request request must have a request type"];
      int v15 = 136315906;
      id v16 = "-[FCCKDirectRequestOperation validateOperation]";
      __int16 v17 = 2080;
      uint64_t v18 = "FCCKDirectRequestOperation.m";
      __int16 v19 = 1024;
      int v20 = 161;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
    }
    char v7 = 0;
    if (!v2) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_17:
  if (!v2->_requestType) {
    goto LABEL_19;
  }
  char v7 = 1;
LABEL_22:
  if (v2->_networkEventType)
  {
    char v8 = 1;
    goto LABEL_27;
  }
LABEL_24:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"direct-ck-request request must have a network event type"];
    int v15 = 136315906;
    id v16 = "-[FCCKDirectRequestOperation validateOperation]";
    __int16 v17 = 2080;
    uint64_t v18 = "FCCKDirectRequestOperation.m";
    __int16 v19 = 1024;
    int v20 = 165;
    __int16 v21 = 2114;
    id v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  char v8 = 0;
LABEL_27:
  char v9 = v6 & v8 & v4 & v7;
  if (v3) {
    return v9;
  }
  else {
    return 0;
  }
}

- (void)setResultError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 504), a2);
  }
}

uint64_t __46__FCCKDirectRequestOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    char v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring local cache for CK-at-Edge request because ignoreCache=true", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)resetForRetry
{
  resultErrorsByRequestID = [MEMORY[0x1E4F29128] UUID];
  char v4 = [resultErrorsByRequestID UUIDString];
  char v6 = v4;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v5, v4, 456);

    objc_storeStrong((id *)&self->_resultResponses, 0);
    resultErrorsByRequestID = self->_resultErrorsByRequestID;
    self->_resultErrorsByRequestID = 0;
  }
  else
  {
  }
  -[FCCKDirectRequestOperation setResultError:]((uint64_t)self, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = v6;
  if (self && self->_networkActivity)
  {
    char v8 = [v6 error];

    networkActivity = self->_networkActivity;
    if (v8)
    {
      [(FCNetworkActivity *)networkActivity completeActivityWithSuccess:0];
      id v10 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_networkActivity;
        uint64_t v12 = v10;
        int v15 = 67109120;
        unsigned int v16 = [(FCNetworkActivity *)v11 label];
        v13 = "Did finish network activity with success=NO (label=%d)";
LABEL_8:
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 8u);
      }
    }
    else
    {
      [(FCNetworkActivity *)networkActivity completeActivityWithSuccess:1];
      uint64_t v14 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_networkActivity;
        uint64_t v12 = v14;
        int v15 = 67109120;
        unsigned int v16 = [(FCNetworkActivity *)v11 label];
        v13 = "Did finish network activity with success=YES (label=%d)";
        goto LABEL_8;
      }
    }
  }
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self)
  {
    networkActivity = self->_networkActivity;
    if (networkActivity)
    {
      [(FCNetworkActivity *)networkActivity attachActivityToTask:v5];
      int v7 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        char v8 = v7;
        uint64_t v9 = [v5 originalRequest];
        id v10 = [v9 URL];
        int v11 = 138543362;
        uint64_t v12 = v10;
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Did assign network activity to task (%{public}@)", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

@end