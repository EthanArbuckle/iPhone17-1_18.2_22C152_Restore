@interface RCURLFetchOperation
- (BOOL)validateOperation;
- (NSData)HTTPBody;
- (NSData)responseData;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSError)error;
- (NSHTTPURLResponse)httpResponse;
- (NSNumber)maxAge;
- (NSString)HTTPMethod;
- (NSString)loggingKey;
- (NSString)requestUUID;
- (NSString)responseMIMEType;
- (NSString)urlString;
- (NSURL)URL;
- (NSURLSessionTask)requestTask;
- (OS_dispatch_queue)completionQueue;
- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration;
- (RCNetworkActivity)networkActivity;
- (double)URLRequestTimeoutDuration;
- (double)taskStartTime;
- (id)configurationCompletionHandler;
- (id)configurationDictionaryCompletionHandler;
- (id)networkEventHandler;
- (unint64_t)responseSize;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)_reportNetworkEventsForTask:(id)a3 response:(id)a4 error:(id)a5;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)resetForRetry;
- (void)setAdditionalRequestHTTPHeaders:(id)a3;
- (void)setBackgroundFetchConfiguration:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setConfigurationCompletionHandler:(id)a3;
- (void)setConfigurationDictionaryCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setHTTPBody:(id)a3;
- (void)setHTTPMethod:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setLoggingKey:(id)a3;
- (void)setMaxAge:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setNetworkEventHandler:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setRequestTask:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseMIMEType:(id)a3;
- (void)setResponseSize:(unint64_t)a3;
- (void)setTaskStartTime:(double)a3;
- (void)setURL:(id)a3;
- (void)setURLRequestTimeoutDuration:(double)a3;
- (void)setUrlString:(id)a3;
- (void)validateOperation;
@end

@implementation RCURLFetchOperation

- (void)setRelativePriority:(int64_t)a3
{
  v5 = [(RCURLFetchOperation *)self requestTask];
  [v5 setRelativePriority:a3];

  v6.receiver = self;
  v6.super_class = (Class)RCURLFetchOperation;
  [(RCOperation *)&v6 setRelativePriority:a3];
}

- (BOOL)validateOperation
{
  v2 = [(RCURLFetchOperation *)self URL];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCURLFetchOperation validateOperation]();
  }
  return v2 != 0;
}

- (void)performOperation
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E88]);
  v4 = [(RCURLFetchOperation *)self URL];
  v5 = (void *)[v3 initWithURL:v4];

  uint64_t v6 = [(RCURLFetchOperation *)self HTTPMethod];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"GET";
  }
  [v5 setHTTPMethod:v8];

  v9 = [(RCURLFetchOperation *)self HTTPBody];
  [v5 setHTTPBody:v9];

  v10 = [(RCURLFetchOperation *)self URL];
  v11 = [v10 absoluteString];
  [(RCURLFetchOperation *)self setUrlString:v11];

  v12 = [(RCURLFetchOperation *)self backgroundFetchConfiguration];
  v13 = [v12 taskIdentifier];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [v16 UUIDString];
  }
  [v5 addValue:v15 forHTTPHeaderField:@"X-Request-ID"];
  [(RCURLFetchOperation *)self setRequestUUID:v15];
  v17 = RCSharedLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(RCOperation *)self shortOperationDescription];
    v19 = [(RCURLFetchOperation *)self urlString];
    v20 = [(RCURLFetchOperation *)self requestUUID];
    *(_DWORD *)buf = 138543874;
    v76 = v18;
    __int16 v77 = 2112;
    v78 = v19;
    __int16 v79 = 2112;
    v80 = v20;
    _os_log_impl(&dword_1A4AB3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config from URL: %@ with X-Request-ID: %@", buf, 0x20u);
  }
  [(RCURLFetchOperation *)self URLRequestTimeoutDuration];
  if (v21 > 0.0)
  {
    [(RCURLFetchOperation *)self URLRequestTimeoutDuration];
    if (v22 != 1.79769313e308)
    {
      [(RCURLFetchOperation *)self URLRequestTimeoutDuration];
      objc_msgSend(v5, "setTimeoutInterval:");
      v23 = RCSharedLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(RCOperation *)self shortOperationDescription];
        [(RCURLFetchOperation *)self URLRequestTimeoutDuration];
        *(_DWORD *)buf = 138543618;
        v76 = v24;
        __int16 v77 = 2048;
        v78 = v25;
        _os_log_impl(&dword_1A4AB3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ applying URLRequestTimeoutDuration: %.1f", buf, 0x16u);
      }
    }
  }
  [v5 setCachePolicy:1];
  v64 = [MEMORY[0x1E4F1CA60] dictionary];
  v26 = [(RCURLFetchOperation *)self additionalRequestHTTPHeaders];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    v28 = [(RCURLFetchOperation *)self additionalRequestHTTPHeaders];
    [v64 addEntriesFromDictionary:v28];
  }
  [v5 setAllHTTPHeaderFields:v64];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__5;
  v73 = __Block_byref_object_dispose__5;
  id v74 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __39__RCURLFetchOperation_performOperation__block_invoke;
  v66[3] = &unk_1E5B76E28;
  v68 = &v69;
  v66[4] = self;
  id v62 = v15;
  id v67 = v62;
  v63 = (void *)MEMORY[0x1A6262080](v66);
  v29 = [(RCURLFetchOperation *)self backgroundFetchConfiguration];

  if (v29)
  {
    v30 = [(RCURLFetchOperation *)self backgroundFetchConfiguration];
    id v65 = 0;
    v31 = +[RCURLSession backgroundSessionForFetchConfig:v30 delegateReference:&v65];
    id v32 = v65;
    uint64_t v33 = [v31 downloadTaskWithRequest:v5];
    v34 = (void *)v70[5];
    v70[5] = v33;

    v35 = [(RCURLFetchOperation *)self requestUUID];
    [(id)v70[5] setTaskDescription:v35];

    v36 = [v30 earliestBeginDate];
    [(id)v70[5] setEarliestBeginDate:v36];

    v37 = [(RCURLFetchOperation *)self requestUUID];
    [v32 observeCompletionOfTaskWithIdentifier:v37 completion:v63];
  }
  else
  {
    v38 = +[RCURLSession sharedForegroundSession];
    uint64_t v39 = [v38 dataTaskWithRequest:v5 completionHandler:v63];
    v40 = (void *)v70[5];
    v70[5] = v39;

    v30 = [(RCURLFetchOperation *)self requestUUID];
    [(id)v70[5] setTaskDescription:v30];
  }

  [(RCURLFetchOperation *)self setRequestTask:v70[5]];
  int64_t v41 = [(RCOperation *)self relativePriority];
  [(id)v70[5] setRelativePriority:v41];
  [(RCOperation *)self associateChildOperation:v70[5]];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[RCURLFetchOperation setTaskStartTime:](self, "setTaskStartTime:");
  if (v29)
  {
    v42 = RCSharedLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v61 = [(RCOperation *)self shortOperationDescription];
      v60 = [(RCURLFetchOperation *)self loggingKey];
      v43 = [(RCURLFetchOperation *)self requestUUID];
      v44 = [(RCURLFetchOperation *)self urlString];
      v45 = [(RCURLFetchOperation *)self backgroundFetchConfiguration];
      v46 = [v45 earliestBeginDate];
      uint64_t v47 = objc_msgSend(v46, "rc_stringForLogging");
      v48 = (void *)v47;
      if (v47) {
        v49 = (__CFString *)v47;
      }
      else {
        v49 = @"<nil>";
      }
      v50 = [(RCURLFetchOperation *)self backgroundFetchConfiguration];
      [v50 timeout];
      *(_DWORD *)buf = 138544642;
      v76 = v61;
      __int16 v77 = 2112;
      v78 = v60;
      __int16 v79 = 2112;
      v80 = v43;
      __int16 v81 = 2112;
      v82 = v44;
      __int16 v83 = 2114;
      v84 = v49;
      __int16 v85 = 2048;
      uint64_t v86 = v51;
      _os_log_impl(&dword_1A4AB3000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ will send background request for configuration: %@ with UUID: %@, URL: %@, earliestBeginDate: %{public}@, timeout: %.2f.", buf, 0x3Eu);
    }
  }
  else
  {
    v42 = RCSharedLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [(RCOperation *)self shortOperationDescription];
      v53 = [(RCURLFetchOperation *)self loggingKey];
      v54 = [(RCURLFetchOperation *)self requestUUID];
      v55 = [(RCURLFetchOperation *)self urlString];
      *(_DWORD *)buf = 138544130;
      v76 = v52;
      __int16 v77 = 2112;
      v78 = v53;
      __int16 v79 = 2112;
      v80 = v54;
      __int16 v81 = 2112;
      v82 = v55;
      _os_log_impl(&dword_1A4AB3000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ will send foreground request for configuration: %@ with UUID: %@, URL: %@", buf, 0x2Au);
    }
  }

  v56 = RCSharedLog();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [(id)v70[5] longOperationDescription];
    *(_DWORD *)buf = 138543362;
    v76 = v57;
    _os_log_impl(&dword_1A4AB3000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }
  v58 = [(RCURLFetchOperation *)self networkActivity];

  if (v58)
  {
    [(id)v70[5] setDelegate:self];
    v59 = [(RCURLFetchOperation *)self networkActivity];
    [v59 attachActivityToTask:v70[5]];
  }
  [(id)v70[5] resume];

  _Block_object_dispose(&v69, 8);
}

void __39__RCURLFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = RCSharedLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl(&dword_1A4AB3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _reportNetworkEventsForTask:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response:v8 error:v9];
  uint64_t v12 = objc_opt_class();
  v13 = RCDynamicCast(v12, (uint64_t)v8);
  v14 = v13;
  if (v13
    && ([v13 statusCode] < 200 || objc_msgSend(v14, "statusCode") >= 300)
    && [v14 statusCode] != 304)
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [*(id *)(a1 + 32) urlString];
    [v15 setObject:v16 forKeyedSubscript:@"RCErrorHTTPURL"];

    [v15 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"RCErrorHTTPRequestUUID"];
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "statusCode"));
    [v15 setObject:v17 forKeyedSubscript:@"RCErrorHTTPStatusCode"];

    v18 = [v14 allHeaderFields];

    if (v18)
    {
      v19 = [v14 allHeaderFields];
      [v15 setObject:v19 forKeyedSubscript:@"RCErrorHTTPResponseHeaders"];
    }
    if ([v14 statusCode] >= 500 && objc_msgSend(v14, "statusCode") <= 598)
    {
      v20 = [v14 allHeaderFields];
      double v21 = [v20 objectForKeyedSubscript:@"Retry-After"];

      if (v21)
      {
        uint64_t v22 = [v21 integerValue];
        if (v22)
        {
          uint64_t v23 = [NSNumber numberWithInteger:v22];
          if (v23)
          {
            v24 = (void *)v23;
            [v15 setObject:v23 forKeyedSubscript:@"RCErrorRetryAfter"];
            [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NSErrorRCAdditionsShouldRetry"];
          }
        }
      }
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"URL request failed with status code %lu", objc_msgSend(v14, "statusCode"));
    uint64_t v27 = objc_msgSend(v25, "rc_errorWithCode:description:additionalUserInfo:", 3, v26, v15);

    id v9 = (id)v27;
  }
  v28 = [v14 allHeaderFields];
  v29 = [v28 objectForKeyedSubscript:@"Cache-Control"];
  v30 = objc_msgSend(v29, "rc_numberFollowingString:", @"max-age=");

  if (!v30 || ([v30 doubleValue], v31 == 0.0))
  {
    id v32 = RCSharedLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [*(id *)(a1 + 32) shortOperationDescription];
      v34 = [*(id *)(a1 + 32) urlString];
      *(_DWORD *)buf = 138543618;
      v37 = v33;
      __int16 v38 = 2112;
      uint64_t v39 = v34;
      _os_log_impl(&dword_1A4AB3000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ max-age missing from Cache-Control header for URL: %@", buf, 0x16u);
    }
    v30 = 0;
  }
  [*(id *)(a1 + 32) setMaxAge:v30];
  if (!v9) {
    [*(id *)(a1 + 32) setResponseData:v7];
  }
  [*(id *)(a1 + 32) setHttpResponse:v14];
  objc_msgSend(*(id *)(a1 + 32), "setResponseSize:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "countOfBytesReceived"));
  v35 = [v8 MIMEType];
  [*(id *)(a1 + 32) setResponseMIMEType:v35];

  [*(id *)(a1 + 32) setError:v9];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(RCURLFetchOperation *)self setRequestTask:0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(RCURLFetchOperation *)self taskStartTime];
  if (v4)
  {
    if (objc_msgSend(v4, "rc_isCancellationError"))
    {
      id v8 = RCSharedLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      id v9 = [(RCOperation *)self shortOperationDescription];
      v10 = [(RCURLFetchOperation *)self loggingKey];
      *(_DWORD *)buf = 138543618;
      v60 = v9;
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v10;
      _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled configuration request %@", buf, 0x16u);
    }
    else
    {
      id v15 = [v4 userInfo];
      v16 = [v15 objectForKeyedSubscript:@"RCErrorHTTPStatusCode"];

      id v8 = RCSharedLog();
      BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (!v17) {
          goto LABEL_14;
        }
        id v9 = [(RCOperation *)self shortOperationDescription];
        v18 = [(RCURLFetchOperation *)self loggingKey];
        v19 = [v4 userInfo];
        v20 = [v19 objectForKeyedSubscript:@"RCErrorHTTPStatusCode"];
        *(_DWORD *)buf = 138543874;
        v60 = v9;
        __int16 v61 = 2114;
        uint64_t v62 = (uint64_t)v18;
        __int16 v63 = 2114;
        unint64_t v64 = (unint64_t)v20;
        _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to request configuration %{public}@ with response status code: %{public}@", buf, 0x20u);

        goto LABEL_13;
      }
      if (!v17) {
        goto LABEL_14;
      }
      id v9 = [(RCOperation *)self shortOperationDescription];
      v10 = [(RCURLFetchOperation *)self loggingKey];
      double v21 = [v4 localizedDescription];
      *(_DWORD *)buf = 138543874;
      v60 = v9;
      __int16 v61 = 2114;
      uint64_t v62 = (uint64_t)v10;
      __int16 v63 = 2114;
      unint64_t v64 = (unint64_t)v21;
      _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to request configuration %{public}@ with error: %{public}@", buf, 0x20u);
    }
LABEL_13:

    goto LABEL_14;
  }
  double v11 = v7;
  id v8 = RCSharedLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(RCOperation *)self shortOperationDescription];
    v13 = [(RCURLFetchOperation *)self loggingKey];
    v14 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[RCURLFetchOperation responseSize](self, "responseSize"), 0);
    *(_DWORD *)buf = 138544130;
    v60 = v12;
    __int16 v61 = 2112;
    uint64_t v62 = (uint64_t)v13;
    __int16 v63 = 2112;
    unint64_t v64 = (unint64_t)v14;
    __int16 v65 = 2048;
    double v66 = v6 - v11;
    _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully received configuration %@ with size: %@, total time: %f", buf, 0x2Au);
  }
LABEL_14:

  uint64_t v22 = [(RCURLFetchOperation *)self completionQueue];
  uint64_t v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    v24 = RCDispatchQueueForQualityOfService([(RCURLFetchOperation *)self qualityOfService]);
  }
  v25 = v24;

  v26 = [(RCURLFetchOperation *)self configurationDictionaryCompletionHandler];

  if (v26)
  {
    uint64_t v27 = [(RCURLFetchOperation *)self responseData];
    v28 = objc_msgSend(v27, "rc_gzipInflate");

    if (v28)
    {
      id v29 = v28;
    }
    else
    {
      id v29 = [(RCURLFetchOperation *)self responseData];
    }
    double v31 = v29;
    id v58 = 0;
    id v32 = objc_msgSend(MEMORY[0x1E4F1C9E8], "rc_dictionaryFromData:error:", v29, &v58);
    id v33 = v58;
    [(RCURLFetchOperation *)self setResponseData:0];
    if (v33)
    {
      uint64_t v51 = v32;
      v34 = RCSharedLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [(RCOperation *)self shortOperationDescription];
        *(_DWORD *)buf = 138543618;
        v60 = v35;
        __int16 v61 = 2114;
        uint64_t v62 = (uint64_t)v33;
        _os_log_impl(&dword_1A4AB3000, v34, OS_LOG_TYPE_ERROR, "%{public}@ operationWillFinishWithError - JSON parsing failed with error: %{public}@", buf, 0x16u);
      }
      uint64_t v36 = objc_opt_class();
      v37 = [v33 userInfo];
      __int16 v38 = [v37 objectForKey:@"NSJSONSerializationErrorIndex"];
      uint64_t v39 = RCDynamicCast(v36, (uint64_t)v38);

      if (v39)
      {
        unint64_t v40 = [v39 unsignedIntegerValue];
        int64_t v41 = (void *)[[NSString alloc] initWithData:v31 encoding:4];
        if ([v41 length])
        {
          uint64_t v42 = [v41 length];
          unint64_t v43 = v42 - 1;
          unint64_t v44 = v40 - 200;
          if (v40 < 0xC8) {
            unint64_t v44 = 0;
          }
          if (v44 >= v43) {
            uint64_t v45 = v42 - 1;
          }
          else {
            uint64_t v45 = v44;
          }
          if (v40 + 200 < v43) {
            unint64_t v43 = v40 + 200;
          }
          unint64_t v49 = v43;
          objc_msgSend(v41, "substringWithRange:", v45, v43 - v45);
          double v50 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v46 = RCSharedLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v48 = [(RCOperation *)self shortOperationDescription];
            *(_DWORD *)buf = 138544130;
            v60 = v48;
            __int16 v61 = 2048;
            uint64_t v62 = v45;
            __int16 v63 = 2048;
            unint64_t v64 = v49;
            __int16 v65 = 2114;
            double v66 = v50;
            _os_log_impl(&dword_1A4AB3000, v46, OS_LOG_TYPE_ERROR, "%{public}@ JSON parsing failure response substring startIndex=%lu endIndex=%lu excerpt='%{public}@'", buf, 0x2Au);
          }
        }
      }
      id v32 = v51;
    }
    uint64_t v47 = [(RCURLFetchOperation *)self configurationDictionaryCompletionHandler];

    if (v47)
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke;
      v54[3] = &unk_1E5B76E50;
      v54[4] = self;
      id v55 = v32;
      id v56 = v33;
      id v57 = v4;
      dispatch_async(v25, v54);
    }
  }
  else
  {
    v30 = [(RCURLFetchOperation *)self configurationCompletionHandler];

    if (v30)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke_2;
      block[3] = &unk_1E5B75F80;
      block[4] = self;
      id v53 = v4;
      dispatch_async(v25, block);
    }
  }
}

void __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  double v6 = [*(id *)(a1 + 32) configurationDictionaryCompletionHandler];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) maxAge];
  double v5 = [*(id *)(a1 + 32) httpResponse];
  v6[2](v6, v3, v2, v4, v5, *(void *)(a1 + 56));
}

void __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke_2(uint64_t a1)
{
  double v5 = [*(id *)(a1 + 32) configurationCompletionHandler];
  uint64_t v2 = [*(id *)(a1 + 32) responseData];
  uint64_t v3 = [*(id *)(a1 + 32) maxAge];
  id v4 = [*(id *)(a1 + 32) httpResponse];
  v5[2](v5, v2, v3, v4, *(void *)(a1 + 40));
}

- (void)resetForRetry
{
  [(RCURLFetchOperation *)self setTaskStartTime:0.0];
  [(RCURLFetchOperation *)self setResponseData:0];
  [(RCURLFetchOperation *)self setHttpResponse:0];
  [(RCURLFetchOperation *)self setResponseSize:0];
  [(RCURLFetchOperation *)self setError:0];

  [(RCURLFetchOperation *)self setMaxAge:0];
}

- (void)_reportNetworkEventsForTask:(id)a3 response:(id)a4 error:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke;
    v43[3] = &unk_1E5B76C88;
    v43[4] = self;
    id v44 = v8;
    id v45 = v10;
    __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke((uint64_t)v43);
  }
  else
  {
    v34 = self;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = RCDynamicCast(v11, (uint64_t)v9);

    if (v12)
    {
      uint64_t v13 = objc_opt_class();
      v14 = RCDynamicCast(v13, (uint64_t)v9);
      if ([v14 statusCode] >= 200 && objc_msgSend(v14, "statusCode") < 300
        || [v14 statusCode] == 304)
      {
        id v33 = v14;
        id v31 = v9;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v15 = [v8 _incompleteTaskMetrics];
        v16 = [v15 transactionMetrics];

        id obj = v16;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v46 count:16];
        v18 = v34;
        if (v17)
        {
          uint64_t v19 = v17;
          uint64_t v20 = *(void *)v37;
          id v32 = v8;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if ([v22 resourceFetchType] != 3)
              {
                uint64_t v23 = [(RCURLFetchOperation *)v18 networkEventHandler];

                if (v23)
                {
                  v24 = [(RCURLFetchOperation *)v18 networkEventHandler];
                  v25 = [RCNetworkEvent alloc];
                  v26 = [v8 originalRequest];
                  uint64_t v27 = [v22 fetchStartDate];
                  v28 = [(RCOperation *)v18 operationID];
                  id v29 = [(RCURLFetchOperation *)v18 requestUUID];
                  v30 = [(RCNetworkEvent *)v25 initWithResultType:0 request:v26 startDate:v27 operationID:v28 requestID:v29 response:v33 metrics:v22 error:0];
                  ((void (**)(void, RCNetworkEvent *))v24)[2](v24, v30);

                  v18 = v34;
                  id v8 = v32;
                }
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v19);
        }

        id v10 = 0;
        id v9 = v31;
        v14 = v33;
      }
      else
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3;
        v40[3] = &unk_1E5B76C88;
        v40[4] = v34;
        id v41 = v8;
        id v42 = v14;
        __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3((uint64_t)v40);
      }
    }
  }
}

void __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkEventHandler];

  if (v2)
  {
    uint64_t v11 = [*(id *)(a1 + 32) networkEventHandler];
    uint64_t v3 = [RCNetworkEvent alloc];
    id v4 = [*(id *)(a1 + 40) originalRequest];
    double v5 = [*(id *)(a1 + 40) _incompleteTaskMetrics];
    double v6 = [v5 taskInterval];
    double v7 = [v6 startDate];
    id v8 = [*(id *)(a1 + 32) operationID];
    id v9 = [*(id *)(a1 + 32) requestUUID];
    id v10 = [(RCNetworkEvent *)v3 initWithResultType:2 request:v4 startDate:v7 operationID:v8 requestID:v9 response:0 metrics:0 error:*(void *)(a1 + 48)];
    v11[2](v11, v10);
  }
}

void __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkEventHandler];

  if (v2)
  {
    id v10 = [*(id *)(a1 + 32) networkEventHandler];
    uint64_t v3 = [RCNetworkEvent alloc];
    id v4 = [*(id *)(a1 + 40) originalRequest];
    double v5 = [*(id *)(a1 + 40) _incompleteCurrentTaskTransactionMetrics];
    double v6 = [v5 fetchStartDate];
    double v7 = [*(id *)(a1 + 32) operationID];
    id v8 = [*(id *)(a1 + 32) requestUUID];
    id v9 = [(RCNetworkEvent *)v3 initWithResultType:1 request:v4 startDate:v6 operationID:v7 requestID:v8 response:*(void *)(a1 + 48) metrics:0 error:0];
    v10[2](v10, v9);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [(RCURLFetchOperation *)self networkActivity];

  if (v7)
  {
    id v8 = [v6 error];

    id v9 = [(RCURLFetchOperation *)self networkActivity];
    id v10 = v9;
    if (v8)
    {
      [v9 completeActivityWithSuccess:0];

      uint64_t v11 = RCSharedLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(RCURLFetchOperation *)self networkActivity];
        int v14 = 67109120;
        int v15 = [v12 label];
        uint64_t v13 = "Did finish network activity with success=NO (label=%d)";
LABEL_7:
        _os_log_impl(&dword_1A4AB3000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 8u);
      }
    }
    else
    {
      [v9 completeActivityWithSuccess:1];

      uint64_t v11 = RCSharedLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(RCURLFetchOperation *)self networkActivity];
        int v14 = 67109120;
        int v15 = [v12 label];
        uint64_t v13 = "Did finish network activity with success=YES (label=%d)";
        goto LABEL_7;
      }
    }
  }
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(RCURLFetchOperation *)self networkActivity];

  if (v6)
  {
    double v7 = [(RCURLFetchOperation *)self networkActivity];
    [v7 attachActivityToTask:v5];

    id v8 = RCSharedLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 originalRequest];
      id v10 = [v9 URL];
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "Did assign network activity to task (%{public}@)", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (void)setHTTPBody:(id)a3
{
}

- (NSString)HTTPMethod
{
  return self->_HTTPMethod;
}

- (void)setHTTPMethod:(id)a3
{
}

- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration
{
  return self->_backgroundFetchConfiguration;
}

- (void)setBackgroundFetchConfiguration:(id)a3
{
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (void)setLoggingKey:(id)a3
{
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  return self->_additionalRequestHTTPHeaders;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
}

- (double)URLRequestTimeoutDuration
{
  return self->_URLRequestTimeoutDuration;
}

- (void)setURLRequestTimeoutDuration:(double)a3
{
  self->_URLRequestTimeoutDuration = a3;
}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (void)setConfigurationCompletionHandler:(id)a3
{
}

- (id)configurationDictionaryCompletionHandler
{
  return self->_configurationDictionaryCompletionHandler;
}

- (void)setConfigurationDictionaryCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (void)setNetworkEventHandler:(id)a3
{
}

- (RCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
}

- (NSURLSessionTask)requestTask
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 432, 1);
}

- (void)setRequestTask:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (double)taskStartTime
{
  return self->_taskStartTime;
}

- (void)setTaskStartTime:(double)a3
{
  self->_taskStartTime = a3;
}

- (NSString)responseMIMEType
{
  return self->_responseMIMEType;
}

- (void)setResponseMIMEType:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (void)setResponseSize:(unint64_t)a3
{
  self->_responseSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_responseMIMEType, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_requestTask, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationDictionaryCompletionHandler, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_backgroundFetchConfiguration, 0);
  objc_storeStrong((id *)&self->_HTTPMethod, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"the fetch operation must have valid URL"];
  int v1 = 136315906;
  uint64_t v2 = "-[RCURLFetchOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCURLFetchOperation.m";
  __int16 v5 = 1024;
  int v6 = 70;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end