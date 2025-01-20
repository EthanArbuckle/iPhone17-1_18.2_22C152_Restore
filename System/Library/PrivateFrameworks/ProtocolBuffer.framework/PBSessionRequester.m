@interface PBSessionRequester
+ (BOOL)usesEncodedMessages;
- (BOOL)ignoresResponse;
- (BOOL)isPaused;
- (BOOL)readResponsePreamble:(id)a3;
- (BOOL)shouldHandleCookies;
- (NSArray)clientCertificates;
- (NSArray)requests;
- (NSDictionary)httpRequestHeaders;
- (NSDictionary)httpResponseHeaders;
- (NSString)apsRelayTopic;
- (NSString)logRequestToFile;
- (NSString)logResponseToFile;
- (NSURL)URL;
- (NSURLSession)session;
- (NSURLSessionTask)currentTask;
- (PBSessionRequester)initWithURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (PBSessionRequesterDelegate)delegate;
- (double)timeoutSeconds;
- (id)_cancelNoNotify;
- (id)decodeResponseData:(id)a3;
- (id)internalRequests;
- (id)newMutableURLRequestWithURL:(id)a3;
- (id)newSessionTaskOnSession:(id)a3 withURLRequest:(id)a4;
- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4;
- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4 connectionProperties:(id)a5;
- (id)requestPreamble;
- (id)responseForInternalRequest:(id)a3;
- (id)responseForRequest:(id)a3;
- (id)tryReadResponseData:(id)a3 forRequest:(id)a4 forResponseClass:(Class)a5;
- (uint64_t)_cleanup;
- (uint64_t)_newSessionWithDelegate:(void *)a3 delegateQueue:(void *)a4 connectionProperties:;
- (uint64_t)_tryParseData;
- (unint64_t)downloadPayloadSize;
- (unint64_t)nwActivityDomain;
- (unint64_t)nwActivityLabel;
- (unint64_t)requestResponseTime;
- (unint64_t)uploadPayloadSize;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_failWithError:(uint64_t)a1;
- (void)_failWithErrorDomain:(uint64_t)a3 errorCode:(void *)a4 userInfo:;
- (void)_serializePayload:(uint64_t)a1;
- (void)_start;
- (void)addInternalRequest:(id)a3;
- (void)addRequest:(id)a3;
- (void)cancel;
- (void)cancelWithErrorCode:(int64_t)a3;
- (void)cancelWithErrorCode:(void *)a3 description:;
- (void)clearRequests;
- (void)dealloc;
- (void)encodeRequestData:(id)a3 startRequestCallback:(id)a4;
- (void)pause;
- (void)resume;
- (void)setApsRelayTopic:(id)a3;
- (void)setClientCertificates:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setHttpRequestHeader:(id)a3 forKey:(id)a4;
- (void)setHttpRequestHeaders:(id)a3;
- (void)setHttpResponseHeaders:(id)a3;
- (void)setIgnoresResponse:(BOOL)a3;
- (void)setLogRequestToFile:(id)a3;
- (void)setLogResponseToFile:(id)a3;
- (void)setNeedsCancel;
- (void)setNwActivityDomain:(unint64_t)a3;
- (void)setNwActivityLabel:(unint64_t)a3;
- (void)setSession:(id)a3;
- (void)setShouldHandleCookies:(BOOL)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setURL:(id)a3;
- (void)startWithConnectionProperties:(id)a3;
- (void)writeRequest:(id)a3 into:(id)a4;
@end

@implementation PBSessionRequester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsRelayTopic, 0);
  objc_storeStrong((id *)&self->_connectionProperties, 0);
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong((id *)&self->_logResponseToFile, 0);
  objc_storeStrong((id *)&self->_logRequestToFile, 0);
  objc_storeStrong((id *)&self->_httpRequestHeaders, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);
  objc_storeStrong((id *)&self->_internalResponses, 0);
  objc_storeStrong((id *)&self->_internalRequests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_dataReader, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sessionDelegateQ, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)setNwActivityLabel:(unint64_t)a3
{
  self->_nwActivityLabel = a3;
}

- (unint64_t)nwActivityLabel
{
  return self->_nwActivityLabel;
}

- (void)setNwActivityDomain:(unint64_t)a3
{
  self->_nwActivityDomain = a3;
}

- (unint64_t)nwActivityDomain
{
  return self->_nwActivityDomain;
}

- (void)setApsRelayTopic:(id)a3
{
}

- (NSString)apsRelayTopic
{
  return self->_apsRelayTopic;
}

- (void)setShouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (BOOL)shouldHandleCookies
{
  return self->_shouldHandleCookies;
}

- (void)setClientCertificates:(id)a3
{
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (unint64_t)downloadPayloadSize
{
  return self->_downloadPayloadSize;
}

- (unint64_t)uploadPayloadSize
{
  return self->_uploadPayloadSize;
}

- (void)setLogResponseToFile:(id)a3
{
}

- (NSString)logResponseToFile
{
  return self->_logResponseToFile;
}

- (void)setLogRequestToFile:(id)a3
{
}

- (NSString)logRequestToFile
{
  return self->_logRequestToFile;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setHttpResponseHeaders:(id)a3
{
}

- (NSDictionary)httpResponseHeaders
{
  return self->_httpResponseHeaders;
}

- (void)setCurrentTask:(id)a3
{
}

- (NSURLSessionTask)currentTask
{
  return self->_currentTask;
}

- (void)setSession:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (PBSessionRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBSessionRequesterDelegate *)WeakRetained;
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)startWithConnectionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProperties, a3);
  -[PBSessionRequester _start]((uint64_t)self);
}

- (void)_start
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __28__PBSessionRequester__start__block_invoke;
    v3[3] = &unk_1E5D72A60;
    v3[4] = a1;
    v2 = (void *)MEMORY[0x1AD0EB950](v3);
    -[PBSessionRequester _serializePayload:](a1, v2);
  }
}

void __28__PBSessionRequester__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    -[PBSessionRequester _failWithError:](v4, a3);
    return;
  }
  id v6 = a2;
  if (!v3) {
    goto LABEL_41;
  }
  v7 = (void *)*((void *)v3 + 5);
  if (v7)
  {
    [v7 cancel];
    v8 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = 0;
  }
  v9 = (void *)*((void *)v3 + 4);
  if (v9)
  {
    [v9 invalidateAndCancel];
    v10 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = 0;
  }
  v11 = (void *)*((void *)v3 + 7);
  if (v11)
  {
    *((void *)v3 + 7) = 0;
  }
  v12 = (void *)*((void *)v3 + 16);
  if (v12 && (*((_WORD *)v3 + 124) & 0x400) == 0)
  {
    *((void *)v3 + 16) = 0;
  }
  v13 = (void *)*((void *)v3 + 18);
  if (v13)
  {
    *((void *)v3 + 18) = 0;
  }
  v14 = (void *)*((void *)v3 + 8);
  if (v14)
  {
    *((void *)v3 + 8) = 0;
  }
  *((void *)v3 + 9) = 0;
  *((void *)v3 + 10) = 0;
  *((_WORD *)v3 + 124) &= ~0x10u;
  v15 = (void *)MEMORY[0x1AD0EB790]();
  *((void *)v3 + 10) = [v6 length];
  *((_WORD *)v3 + 124) |= 2u;
  *((void *)v3 + 12) = mach_absolute_time();
  if (!*((void *)v3 + 1))
  {
    v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PBRequesterErrorDomain" code:6004 userInfo:0];
LABEL_41:
    char v38 = 0;
    goto LABEL_47;
  }
  v43 = v15;
  id v44 = v6;
  v16 = objc_msgSend(v3, "newMutableURLRequestWithURL:");
  if ([*((id *)v3 + 25) count]) {
    [v16 setCachePolicy:1];
  }
  double v17 = *((double *)v3 + 21);
  if (v17 == -1.0) {
    double v17 = 60.0;
  }
  [v16 setTimeoutInterval:v17];
  [v16 setHTTPMethod:@"POST"];
  [v16 setHTTPShouldHandleCookies:v3[216]];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v18 = [v3 httpRequestHeaders];
  v19 = [v18 allKeys];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v25 = [v3 httpRequestHeaders];
        v26 = [v25 objectForKeyedSubscript:v24];
        [v16 setValue:v26 forHTTPHeaderField:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v21);
  }

  id v6 = v44;
  [v16 setHTTPBody:v44];
  uint64_t v27 = [v3 newSessionWithDelegate:v3 delegateQueue:*((void *)v3 + 6) connectionProperties:*((void *)v3 + 26)];
  v28 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v27;

  uint64_t v29 = [v3 newSessionTaskOnSession:*((void *)v3 + 4) withURLRequest:v16];
  v30 = (void *)*((void *)v3 + 5);
  *((void *)v3 + 5) = v29;

  if (*((void *)v3 + 28)) {
    objc_msgSend(*((id *)v3 + 5), "set_APSRelayTopic:");
  }
  if (!*((void *)v3 + 29) || !*((void *)v3 + 30))
  {
    objc_msgSend(*((id *)v3 + 5), "set_nw_activity:", 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8FD5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "pbSessionRequester, activity, nil", buf, 2u);
    }
    goto LABEL_46;
  }
  v31 = (void *)nw_activity_create();
  v32 = (void *)*((void *)v3 + 5);
  if (v31)
  {
    objc_msgSend(v32, "set_nw_activity:", v31);
    nw_activity_activate();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *((void *)v3 + 29);
      uint64_t v34 = *((void *)v3 + 30);
      *(_DWORD *)buf = 67109376;
      int v50 = v33;
      __int16 v51 = 1024;
      int v52 = v34;
      v35 = MEMORY[0x1E4F14500];
      v36 = "pbSessionRequester, activity, activate, %d, %d";
      os_log_type_t v37 = OS_LOG_TYPE_INFO;
LABEL_44:
      _os_log_impl(&dword_1A8FD5000, v35, v37, v36, buf, 0xEu);
    }
  }
  else
  {
    objc_msgSend(v32, "set_nw_activity:", 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *((void *)v3 + 29);
      uint64_t v40 = *((void *)v3 + 30);
      *(_DWORD *)buf = 67109376;
      int v50 = v39;
      __int16 v51 = 1024;
      int v52 = v40;
      v35 = MEMORY[0x1E4F14500];
      v36 = "pbSessionRequester, activity, createnil, %d, %d";
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_44;
    }
  }

LABEL_46:
  [*((id *)v3 + 5) resume];

  v3 = 0;
  char v38 = 1;
LABEL_47:

  v41 = v3;
  v42 = v41;
  if ((v38 & 1) == 0 && v41) {
    -[PBSessionRequester _failWithError:](*(void *)(a1 + 32), v41);
  }
}

- (void)_serializePayload:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_alloc_init(PBDataWriter);
    v5 = [(id)a1 requestPreamble];
    if (v5) {
      [(PBDataWriter *)v4 writeData:v5];
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v6 = *(id *)(a1 + 136);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          [(id)a1 writeRequest:*(void *)(*((void *)&v41 + 1) + 8 * v10++) into:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v8);
    }

    id v11 = *(id *)(a1 + 120);
    if ((*(_WORD *)(a1 + 248) & 0x400) != 0)
    {
      uint64_t v12 = [*(id *)(a1 + 128) count];
      uint64_t v13 = objc_msgSend(v11, "subarrayWithRange:", v12, objc_msgSend(*(id *)(a1 + 120), "count") - v12);

      id v11 = (id)v13;
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          [(id)a1 writeRequest:*(void *)(*((void *)&v37 + 1) + 8 * v18++) into:v4];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v16);
    }

    v19 = [(id)a1 logRequestToFile];

    if (v19)
    {
      uint64_t v20 = [(PBDataWriter *)v4 immutableData];
      uint64_t v21 = [(id)a1 logRequestToFile];
      [v20 writeToFile:v21 atomically:0];

      uint64_t v22 = [*(id *)(a1 + 120) count];
      v23 = *(void **)(a1 + 120);
      if (v22 == 1)
      {
        uint64_t v24 = [v23 objectAtIndex:0];
        v25 = [(id)a1 logRequestToFile];
        v26 = [v25 stringByAppendingString:@".txt"];

        uint64_t v27 = NSString;
        v28 = [(id)a1 URL];
        uint64_t v29 = [v24 formattedText];
        v30 = [v27 stringWithFormat:@"URL: %@\n\n%@", v28, v29, (void)v37];

        [v30 writeToFile:v26 atomically:0 encoding:4 error:0];
      }
      else if ([v23 count])
      {
        unint64_t v31 = 0;
        do
        {
          v32 = [*(id *)(a1 + 120) objectAtIndex:v31];
          uint64_t v33 = [(id)a1 logRequestToFile];
          uint64_t v34 = objc_msgSend(v33, "stringByAppendingFormat:", @".part_%d.txt", v31);

          v35 = [v32 formattedText];
          [v35 writeToFile:v34 atomically:0 encoding:4 error:0];

          ++v31;
        }
        while (v31 < [*(id *)(a1 + 120) count]);
      }
    }
    [(PBDataWriter *)v4 immutableData];

    if ([(id)objc_opt_class() usesEncodedMessages])
    {
      v36 = [(PBDataWriter *)v4 immutableData];
      [(id)a1 encodeRequestData:v36 startRequestCallback:v3];
    }
    else
    {
      v36 = [(PBDataWriter *)v4 immutableData];
      v3[2](v3, v36, 0);
    }
  }
}

- (void)_failWithError:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && !*(unsigned char *)(a1 + 192))
  {
    *(unsigned char *)(a1 + 192) = 1;
    id v5 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v5 code];
      uint64_t v7 = [(id)a1 currentTask];
      uint64_t v8 = [v7 description];
      *(_DWORD *)buf = 134349314;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1A8FD5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, didFailWithError, %{public}ld, %{public}@", buf, 0x16u);
    }
    if ((*(_WORD *)(a1 + 248) & 0x100) != 0)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __37__PBSessionRequester__failWithError___block_invoke;
      id v14 = &unk_1E5D72A88;
      uint64_t v15 = a1;
      id v16 = v5;
      [*(id *)(a1 + 24) addOperationWithBlock:&v11];
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_nw_activity", v11, v12, v13, v14, v15);

    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A8FD5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, activity, failure", buf, 2u);
      }
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "_nw_activity");
      nw_activity_complete_with_reason();
    }
  }
}

void __37__PBSessionRequester__failWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requester:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (id)newSessionTaskOnSession:(id)a3 withURLRequest:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4 connectionProperties:(id)a5
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]((uint64_t)self, a3, a4, a5);
}

- (uint64_t)_newSessionWithDelegate:(void *)a3 delegateQueue:(void *)a4 connectionProperties:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F290F0];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v6 ephemeralSessionConfiguration];
  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19160]];
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v22 = v8;
      id v12 = v11;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        uint64_t v16 = *MEMORY[0x1E4F19118];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v18 isEqualToString:v16])
            {
              __int16 v19 = [v12 objectForKeyedSubscript:v18];
              objc_msgSend(v10, "set_sourceApplicationAuditTokenData:", v19);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }

      id v8 = v22;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v10 delegate:v9 delegateQueue:v8];

  return v20;
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]((uint64_t)self, a3, a4, 0);
}

- (id)newMutableURLRequestWithURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)decodeResponseData:(id)a3
{
  return a3;
}

- (void)encodeRequestData:(id)a3 startRequestCallback:(id)a4
{
}

- (unint64_t)requestResponseTime
{
  if (requestResponseTime_onceToken != -1) {
    dispatch_once(&requestResponseTime_onceToken, &__block_literal_global_490);
  }
  return (self->_timeResponseReceived - self->_timeRequestSent)
       * requestResponseTime_sTimebaseInfo
       / (1000000
        * (unint64_t)*(unsigned int *)algn_1E97AF90C);
}

uint64_t __41__PBSessionRequester_requestResponseTime__block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&requestResponseTime_sTimebaseInfo);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v14 = (void (**)(id, uint64_t, void))a5;
  id v7 = (void *)*MEMORY[0x1E4F28968];
  id v8 = [a4 protectionSpace];
  id v9 = [v8 authenticationMethod];
  if (v7 != v9)
  {

LABEL_3:
    v14[2](v14, 1, 0);
    goto LABEL_6;
  }
  NSUInteger v10 = [(NSArray *)self->_clientCertificates count];

  if (!v10) {
    goto LABEL_3;
  }
  uint64_t v11 = [(NSArray *)self->_clientCertificates objectAtIndexedSubscript:0];

  id v12 = -[NSArray subarrayWithRange:](self->_clientCertificates, "subarrayWithRange:", 1, [(NSArray *)self->_clientCertificates count] - 1);
  uint64_t v13 = [MEMORY[0x1E4F29098] credentialWithIdentity:v11 certificates:v12 persistence:1];
  ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v13);

LABEL_6:
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void))a6;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    [(PBSessionRequester *)self cancel];
    v13[2](v13, 0);
  }
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  long long v26 = __Block_byref_object_dispose_;
  id v14 = v12;
  id v27 = v14;
  uint64_t v15 = [(PBSessionRequester *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [(PBSessionRequester *)self delegate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
    v18[3] = &unk_1E5D72B00;
    v18[4] = self;
    uint64_t v20 = v13;
    id v19 = v14;
    uint64_t v21 = &v22;
    [v17 requesterWillSendRequestForEstablishedConnection:self callback:v18];
  }
  else
  {
    v13[2](v13, v23[5]);
  }
  _Block_object_dispose(&v22, 8);
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5D72B00;
  v6[4] = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v9 = v5;
  [v3 addOperationWithBlock:v6];
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40) || (*(_WORD *)(v2 + 248) & 4) != 0)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5D72AD8;
    v7[4] = v2;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    id v8 = v3;
    uint64_t v9 = v4;
    uint64_t v5 = (void *)MEMORY[0x1AD0EB950](v7);
    -[PBSessionRequester _serializePayload:](*(void *)(a1 + 32), v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    -[PBSessionRequester _failWithError:](*(void *)(a1 + 32), a3);
  }
  else
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v5 setHTTPBody:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = (NSURLSession *)a3;
  uint64_t v9 = (NSURLSessionTask *)a4;
  id v10 = a5;
  id v11 = v10;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    [(PBSessionRequester *)self cancel];
  }
  else if (self->_session == v8 && self->_currentTask == v9 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    if (v10)
    {
      -[PBSessionRequester _failWithError:]((uint64_t)self, v10);
LABEL_28:
      -[PBSessionRequester _cleanup]((uint64_t)self);
      goto LABEL_9;
    }
    self->_downloadPayloadSize = [(NSMutableData *)self->_data length];
    self->_timeResponseReceived = mach_absolute_time();
    if ([(id)objc_opt_class() usesEncodedMessages])
    {
      id v12 = (void *)MEMORY[0x1AD0EB790]();
      uint64_t v13 = [(PBSessionRequester *)self decodeResponseData:self->_data];
      if (v13)
      {
        id v14 = [(PBSessionRequester *)self logResponseToFile];

        if (v14)
        {
          uint64_t v15 = [(PBSessionRequester *)self logResponseToFile];
          [v13 writeToFile:v15 atomically:0];
        }
        char v16 = [[PBDataReader alloc] initWithData:v13];
        dataReader = self->_dataReader;
        self->_dataReader = v16;

        if (![(PBSessionRequester *)self readResponsePreamble:self->_dataReader]) {
          goto LABEL_19;
        }
        if ([(PBDataReader *)self->_dataReader hasError]) {
          goto LABEL_19;
        }
        *(_WORD *)&self->_flags |= 0x10u;
        self->_lastGoodDataOffset = [(PBDataReader *)self->_dataReader offset];
        while ((-[PBSessionRequester _tryParseData]((uint64_t)self) & 1) != 0)
          ;
        if (!self->_didNotifyRequestCompleted)
        {
LABEL_19:

LABEL_22:
          if ((*(_WORD *)&self->_flags & 0x10) != 0
            && (uint64_t v21 = [(NSMutableArray *)self->_responses count],
                v21 == [(NSMutableArray *)self->_requests count]))
          {
            uint64_t v22 = [(PBSessionRequester *)self logResponseToFile];

            if (v22)
            {
              uint64_t v23 = [(NSMutableArray *)self->_responses count];
              responses = self->_responses;
              if (v23 == 1)
              {
                long long v25 = [(NSMutableArray *)responses objectAtIndex:0];
                long long v26 = [(PBSessionRequester *)self logResponseToFile];
                id v27 = [v26 stringByAppendingString:@".txt"];

                uint64_t v28 = [v25 formattedText];
                [v28 writeToFile:v27 atomically:0 encoding:4 error:0];
              }
              else if ([(NSMutableArray *)responses count])
              {
                unint64_t v29 = 0;
                do
                {
                  v30 = [(NSMutableArray *)self->_responses objectAtIndex:v29];
                  unint64_t v31 = [(PBSessionRequester *)self logResponseToFile];
                  v32 = objc_msgSend(v31, "stringByAppendingFormat:", @".part_%d.txt", v29);

                  uint64_t v33 = [v30 formattedText];
                  [v33 writeToFile:v32 atomically:0 encoding:4 error:0];

                  ++v29;
                }
                while (v29 < [(NSMutableArray *)self->_responses count]);
              }
            }
            [(PBDataReader *)self->_dataReader data];

            if (!self->_didNotifyRequestCompleted)
            {
              self->_didNotifyRequestCompleted = 1;
              if ((*(_WORD *)&self->_flags & 0x40) != 0)
              {
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke;
                v37[3] = &unk_1E5D72A38;
                v37[4] = self;
                [(NSOperationQueue *)self->_delegateQueue addOperationWithBlock:v37];
              }
              uint64_t v34 = [(NSURLSessionTask *)self->_currentTask _nw_activity];

              if (v34)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A8FD5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "pbSessionRequester, activity, success", buf, 2u);
                }
                v35 = [(NSURLSessionTask *)self->_currentTask _nw_activity];
                nw_activity_complete_with_reason();
              }
            }
          }
          else
          {
            -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, @"PBRequesterErrorDomain", 6001, 0);
          }
          goto LABEL_28;
        }
      }
      else
      {
        -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6003, @"Decryption failed.");
      }
      -[PBSessionRequester _cleanup]((uint64_t)self);

      goto LABEL_9;
    }
    uint64_t v18 = [(PBSessionRequester *)self logResponseToFile];

    if (v18)
    {
      data = self->_data;
      uint64_t v20 = [(PBSessionRequester *)self logResponseToFile];
      [(NSMutableData *)data writeToFile:v20 atomically:0];
    }
    goto LABEL_22;
  }
LABEL_9:
}

- (uint64_t)_cleanup
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 40);
    *(void *)(result + 40) = 0;

    [*(id *)(v1 + 32) invalidateAndCancel];
    id v3 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = 0;

    uint64_t v4 = *(void **)(v1 + 56);
    *(void *)(v1 + 56) = 0;

    uint64_t v5 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0;

    result = [(id)v1 setHttpResponseHeaders:0];
    *(_WORD *)(v1 + 248) &= 0xF9F1u;
  }
  return result;
}

- (void)cancelWithErrorCode:(void *)a3 description:
{
  id v5 = a3;
  if (a1)
  {
    id v7 = v5;
    if ([v5 length])
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F1D140]];
    }
    else
    {
      uint64_t v6 = 0;
    }
    -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:](a1, @"PBRequesterErrorDomain", a2, v6);
    -[PBSessionRequester _cancelNoNotify]((id *)a1);
    *(_WORD *)(a1 + 248) &= 0xFFF9u;

    id v5 = v7;
  }
}

- (uint64_t)_tryParseData
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 64)) {
    return 0;
  }
  unint64_t v2 = [*(id *)(a1 + 144) count];
  unint64_t v3 = [*(id *)(a1 + 136) count];
  uint64_t v4 = [*(id *)(a1 + 120) count];
  if (v4 == [*(id *)(a1 + 128) count]) {
    return 0;
  }
  [*(id *)(a1 + 64) seekToOffset:*(void *)(a1 + 72)];
  uint64_t v6 = 128;
  if (v2 >= v3)
  {
    uint64_t v7 = 120;
  }
  else
  {
    uint64_t v6 = 144;
    uint64_t v7 = 136;
  }
  id v8 = objc_msgSend(*(id *)(a1 + v7), "objectAtIndex:", objc_msgSend(*(id *)(a1 + v6), "count"));
  uint64_t v9 = (void *)[v8 responseClass];
  if (([v9 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    id v11 = [NSString stringWithFormat:@"Request (%@) provided an invalid response class (needs to be a subclass of PBCodable): %@", v8, objc_msgSend(v8, "responseClass")];
    id v12 = [v10 exceptionWithName:@"InvalidResponseClass" reason:v11 userInfo:0];
    [v12 raise];
  }
  uint64_t v13 = [(id)a1 tryReadResponseData:*(void *)(a1 + 64) forRequest:v8 forResponseClass:v9];
  if (v13 && ([*(id *)(a1 + 64) hasError] & 1) == 0)
  {
    id v14 = objc_alloc_init((Class)v9);
    uint64_t v15 = [[PBDataReader alloc] initWithData:v13];
    uint64_t v5 = [v14 readFrom:v15];
    if (v5)
    {
      if (v2 >= v3)
      {
        id v19 = *(void **)(a1 + 128);
        if (!v19)
        {
          uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
          uint64_t v21 = *(void **)(a1 + 128);
          *(void *)(a1 + 128) = v20;

          id v19 = *(void **)(a1 + 128);
        }
        [v19 addObject:v14];
        *(void *)(a1 + 72) = [*(id *)(a1 + 64) offset];
        if ((*(_WORD *)(a1 + 248) & 0x20) != 0)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __35__PBSessionRequester__tryParseData__block_invoke;
          v23[3] = &unk_1E5D72AB0;
          v23[4] = a1;
          id v24 = v14;
          id v25 = v8;
          [*(id *)(a1 + 24) addOperationWithBlock:v23];
        }
      }
      else
      {
        char v16 = *(void **)(a1 + 144);
        if (!v16)
        {
          uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
          uint64_t v18 = *(void **)(a1 + 144);
          *(void *)(a1 + 144) = v17;

          char v16 = *(void **)(a1 + 144);
        }
        [v16 addObject:v14];
        *(void *)(a1 + 72) = [*(id *)(a1 + 64) offset];
        [(id)a1 handleResponse:v14 forInternalRequest:v8];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_failWithErrorDomain:(uint64_t)a3 errorCode:(void *)a4 userInfo:
{
  if (a1)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F28C58];
    id v8 = a4;
    id v9 = a2;
    id v10 = (id)[[v7 alloc] initWithDomain:v9 code:a3 userInfo:v8];

    -[PBSessionRequester _failWithError:](a1, v10);
  }
}

void __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requesterDidFinish:*(void *)(a1 + 32)];
}

void __35__PBSessionRequester__tryParseData__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requester:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48)];
}

- (id)_cancelNoNotify
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    [result[5] cancel];
    -[PBSessionRequester _cleanup](v1);
    if ([*(id *)(v1 + 128) count]) {
      [*(id *)(v1 + 128) removeAllObjects];
    }
    result = *(id **)(v1 + 144);
    if (result)
    {
      return (id *)[result removeAllObjects];
    }
  }
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v19 = (NSURLSession *)a3;
  id v8 = (NSURLSessionTask *)a4;
  id v9 = a5;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    [(PBSessionRequester *)self cancel];
  }
  else if (self->_session == v19 && self->_currentTask == v8 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1AD0EB790]();
    int v11 = [(id)objc_opt_class() usesEncodedMessages];
    data = self->_data;
    if (v11)
    {
      if (data)
      {
        [(NSMutableData *)data appendData:v9];
      }
      else
      {
        uint64_t v13 = (NSMutableData *)[v9 mutableCopy];
        id v14 = self->_data;
        self->_data = v13;
      }
    }
    else
    {
      if (data)
      {
        [(NSMutableData *)data appendData:v9];
        [(PBDataReader *)self->_dataReader updateData:self->_data];
      }
      else
      {
        uint64_t v15 = (NSMutableData *)[v9 mutableCopy];
        char v16 = self->_data;
        self->_data = v15;

        uint64_t v17 = [[PBDataReader alloc] initWithData:self->_data];
        dataReader = self->_dataReader;
        self->_dataReader = v17;
      }
      if ((*(_WORD *)&self->_flags & 0x10) == 0)
      {
        [(PBDataReader *)self->_dataReader seekToOffset:self->_lastGoodDataOffset];
        if ([(PBSessionRequester *)self readResponsePreamble:self->_dataReader])
        {
          if (![(PBDataReader *)self->_dataReader hasError])
          {
            self->_lastGoodDataOffset = [(PBDataReader *)self->_dataReader offset];
            *(_WORD *)&self->_flags |= 0x10u;
          }
        }
      }
      if ((*(_WORD *)&self->_flags & 0x10) != 0)
      {
        while ((-[PBSessionRequester _tryParseData]((uint64_t)self) & 1) != 0)
          ;
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v23 = a5;
  id v10 = a6;
  int v11 = v10;
  if (*(_OWORD *)&self->_session != __PAIR128__((unint64_t)a4, (unint64_t)a3))
  {
    id v12 = (void (*)(void))*((void *)v10 + 2);
LABEL_3:
    v12();
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v23 allHeaderFields];
    [(PBSessionRequester *)self setHttpResponseHeaders:v13];

    int64_t v14 = [v23 statusCode];
    int64_t v15 = v14;
    if ((unint64_t)(v14 - 400) > 0xFFFFFFFFFFFFFED3)
    {
      __int16 flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
        self->_responseStatusCode = v14;
        *(_WORD *)&self->___int16 flags = flags | 8;
      }
      id v12 = (void (*)(void))v11[2];
      goto LABEL_3;
    }
    ((void (*)(void *, void))v11[2])(v11, 0);
    char v16 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v17 = [v23 URL];
    id v18 = [v17 absoluteString];
    fprintf(v16, "%s:%d server (%s) returned error: %zd\n", "/Library/Caches/com.apple.xbs/Sources/ProtocolBuffer/Runtime/PBSessionRequester.m", 795, (const char *)[v18 UTF8String], objc_msgSend(v23, "statusCode"));

    id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v20 = [NSNumber numberWithInteger:v15];
    uint64_t v21 = objc_msgSend(v19, "initWithObjectsAndKeys:", v20, @"PBHTTPStatusCode", 0);

    -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, (void *)*MEMORY[0x1E4F289A0], -1011, v21);
    -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
    *(_WORD *)&self->_flags &= 0xFFF9u;
  }
  else
  {
    ((void (*)(void *, void))v11[2])(v11, 0);
    -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, (void *)*MEMORY[0x1E4F289A0], -1011, 0);
    -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
    *(_WORD *)&self->_flags &= 0xFFF9u;
  }
LABEL_4:
}

- (id)tryReadResponseData:(id)a3 forRequest:(id)a4 forResponseClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 readBigEndianFixed32];
  if (([v7 hasError] & 1) == 0)
  {
    if (v9 == [v8 requestTypeCode])
    {
      id v10 = [v7 readProtoBuffer];
      goto LABEL_6;
    }
    int v11 = objc_msgSend(NSString, "stringWithFormat:", @"Incorrect requestTypeCode: %i (expected %i).", v9, objc_msgSend(v8, "requestTypeCode"));
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001, v11);
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)readResponsePreamble:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 readBigEndianFixed16];
  char v6 = [v4 hasError];

  if ((v6 & 1) == 0)
  {
    if (v5 == 1) {
      return 1;
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Incorrect protocol version: %i (expected %i).", v5, 1);
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001, v8);
  }
  return 0;
}

- (void)cancelWithErrorCode:(int64_t)a3
{
}

- (void)resume
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xF9FF | 0x400;
    [(PBSessionRequester *)self start];
    *(_WORD *)&self->_flags &= ~0x400u;
  }
}

- (BOOL)isPaused
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (void)pause
{
  if ((*(_WORD *)&self->_flags & 0x206) == 2)
  {
    uint64_t v3 = [(NSMutableArray *)self->_responses count];
    if (v3 == [(NSMutableArray *)self->_requests count])
    {
      *(_WORD *)&self->_flags |= 0x200u;
      [(NSURLSessionTask *)self->_currentTask cancel];
      currentTask = self->_currentTask;
      self->_currentTask = 0;

      [(NSURLSession *)self->_session invalidateAndCancel];
      session = self->_session;
      self->_session = 0;

      [(NSMutableArray *)self->_internalResponses removeAllObjects];
      data = self->_data;
      self->_data = 0;

      dataReader = self->_dataReader;
      self->_dataReader = 0;

      [(PBSessionRequester *)self setHttpResponseHeaders:0];
      *(_WORD *)&self->_flags &= ~8u;
    }
  }
}

- (void)cancel
{
  uint64_t v3 = [MEMORY[0x1E4F28F08] currentQueue];
  sessionDelegateQ = self->_sessionDelegateQ;

  if (v3 == sessionDelegateQ)
  {
    -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
    if (!self->_didNotifyRequestCompleted)
    {
      self->_didNotifyRequestCompleted = 1;
      if ((*(_WORD *)&self->_flags & 0x80) != 0)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __28__PBSessionRequester_cancel__block_invoke_2;
        v9[3] = &unk_1E5D72A38;
        v9[4] = self;
        [(NSOperationQueue *)self->_delegateQueue addOperationWithBlock:v9];
      }
      char v6 = [(NSURLSessionTask *)self->_currentTask _nw_activity];

      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_1A8FD5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, activity, cancelled", v8, 2u);
        }
        id v7 = [(NSURLSessionTask *)self->_currentTask _nw_activity];
        nw_activity_complete_with_reason();
      }
    }
  }
  else
  {
    unsigned int v5 = self->_sessionDelegateQ;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__PBSessionRequester_cancel__block_invoke;
    v10[3] = &unk_1E5D72A38;
    v10[4] = self;
    [(NSOperationQueue *)v5 addOperationWithBlock:v10];
  }
}

uint64_t __28__PBSessionRequester_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __28__PBSessionRequester_cancel__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requesterDidCancel:*(void *)(a1 + 32)];
}

- (void)writeRequest:(id)a3 into:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v5, "writeBigEndianFixed32:", objc_msgSend(v6, "requestTypeCode"));
  id v8 = objc_alloc_init(PBDataWriter);
  [v6 writeTo:v8];

  id v7 = [(PBDataWriter *)v8 immutableData];
  [v5 writeProtoBuffer:v7];
}

- (id)requestPreamble
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PBSessionRequester_requestPreamble__block_invoke;
  block[3] = &unk_1E5D72A38;
  block[4] = self;
  if (requestPreamble__once == -1)
  {
    if (self) {
      goto LABEL_3;
    }
LABEL_14:
    id v9 = 0;
    goto LABEL_9;
  }
  dispatch_once(&requestPreamble__once, block);
  if (!self) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v3 count]
    && ([v3 objectAtIndex:0], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F1C400]];

    if ([v7 length])
    {
      id v8 = [NSString stringWithFormat:@"%@_%@", v5, v7];
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v8 = [v7 localeIdentifier];
    id v5 = 0;
  }

  id v9 = v8;
LABEL_9:
  id v10 = objc_alloc_init(PBDataWriter);
  [(PBDataWriter *)v10 writeBigEndianFixed16:1];
  [(PBDataWriter *)v10 writeBigEndianShortThenString:v9];
  [(PBDataWriter *)v10 writeBigEndianShortThenString:requestPreamble_applicationID];
  [(PBDataWriter *)v10 writeBigEndianShortThenString:requestPreamble_osVersion];
  int v11 = [(PBDataWriter *)v10 immutableData];

  return v11;
}

void __37__PBSessionRequester_requestPreamble__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)requestPreamble_applicationID;
  requestPreamble_applicationID = v3;

  if (*(void *)(a1 + 32))
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    id v6 = [v5 objectForKey:@"ProductVersion"];
    id v7 = [v5 objectForKey:@"ProductBuildVersion"];
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v6, v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (void *)requestPreamble_osVersion;
  requestPreamble_osVersion = v8;
}

- (void)setHttpRequestHeader:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    httpRequestHeaders = self->_httpRequestHeaders;
    if (!httpRequestHeaders)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = self->_httpRequestHeaders;
      self->_httpRequestHeaders = v8;

      httpRequestHeaders = self->_httpRequestHeaders;
    }
    [(NSMutableDictionary *)httpRequestHeaders setObject:v10 forKey:v6];
  }
}

- (void)setHttpRequestHeaders:(id)a3
{
  if (self->_httpRequestHeaders != a3)
  {
    self->_httpRequestHeaders = (NSMutableDictionary *)[a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSDictionary)httpRequestHeaders
{
  return (NSDictionary *)self->_httpRequestHeaders;
}

- (id)responseForInternalRequest:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_internalRequests count]
    || (unint64_t v5 = [(NSMutableArray *)self->_internalRequests indexOfObject:v4], v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v6 = v5, v5 >= [(NSMutableArray *)self->_internalResponses count]))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_internalResponses objectAtIndex:v6];
  }

  return v7;
}

- (void)addInternalRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    internalRequests = self->_internalRequests;
    id v8 = v4;
    if (!internalRequests)
    {
      unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_internalRequests;
      self->_internalRequests = v6;

      internalRequests = self->_internalRequests;
    }
    [(NSMutableArray *)internalRequests addObject:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (id)internalRequests
{
  return self->_internalRequests;
}

- (id)responseForRequest:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_requests count]
    || (unint64_t v5 = [(NSMutableArray *)self->_requests indexOfObject:v4], v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v6 = v5, v5 >= [(NSMutableArray *)self->_responses count]))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_responses objectAtIndex:v6];
  }

  return v7;
}

- (void)addRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    requests = self->_requests;
    id v8 = v4;
    if (!requests)
    {
      unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_requests;
      self->_requests = v6;

      requests = self->_requests;
    }
    [(NSMutableArray *)requests addObject:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)clearRequests
{
}

- (NSArray)requests
{
  return (NSArray *)self->_requests;
}

- (void)setNeedsCancel
{
  if (self) {
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (void)setIgnoresResponse:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)ignoresResponse
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)dealloc
{
  [(NSURLSessionTask *)self->_currentTask cancel];
  [(NSURLSession *)self->_session invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)PBSessionRequester;
  [(PBSessionRequester *)&v3 dealloc];
}

- (PBSessionRequester)initWithURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PBSessionRequester;
  id v12 = [(PBSessionRequester *)&v23 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_delegateQueue, a5);
    id v14 = objc_loadWeakRetained((id *)&v13->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 32;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v13->___int16 flags = *(_WORD *)&v13->_flags & 0xFFDF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 64;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v13->___int16 flags = *(_WORD *)&v13->_flags & 0xFFBF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 128;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v13->___int16 flags = *(_WORD *)&v13->_flags & 0xFF7F | v17;
    char v18 = objc_opt_respondsToSelector();

    if (v18) {
      __int16 v19 = 256;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v13->___int16 flags = *(_WORD *)&v13->_flags & 0xFEFF | v19;

    v13->_timeoutSeconds = -1.0;
    uint64_t v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    sessionDelegateQ = v13->_sessionDelegateQ;
    v13->_sessionDelegateQ = v20;

    [(NSOperationQueue *)v13->_sessionDelegateQ setMaxConcurrentOperationCount:1];
  }

  return v13;
}

+ (BOOL)usesEncodedMessages
{
  return 0;
}

@end