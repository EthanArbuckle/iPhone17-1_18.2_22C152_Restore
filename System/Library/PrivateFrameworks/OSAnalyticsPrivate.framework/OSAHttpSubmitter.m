@interface OSAHttpSubmitter
- (OSAHttpSubmitter)initWithEndpoint:(int)a3;
- (id)submissionURL;
- (void)abort;
- (void)cleanupConnectionAndDisable:(id)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)connectionDidFinishLoading:(id)a3;
- (void)postContent:(id)a3 withHeaders:(id)a4;
- (void)startConnection:(id)a3;
@end

@implementation OSAHttpSubmitter

- (OSAHttpSubmitter)initWithEndpoint:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)OSAHttpSubmitter;
  v4 = [(OSASubmitter *)&v14 init];
  if (v4)
  {
    if (a3 == 1
      && ([MEMORY[0x1E4F83948] sharedInstance],
          v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 appleInternal],
          v5,
          v6))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = @"https://iphonesubmissions-uat.corp.apple.com/convert.jsp";
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using debug/UAT submission URL: '%@'", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x1E4F1CB10];
      v8 = @"https://iphonesubmissions-uat.corp.apple.com/convert.jsp";
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CB10];
      v8 = @"https://iphonesubmissions.apple.com/convert.jsp";
    }
    uint64_t v9 = [v7 URLWithString:v8];
    submissionURL = v4->_submissionURL;
    v4->_submissionURL = (NSURL *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    submissionSem = v4->_submissionSem;
    v4->_submissionSem = (OS_dispatch_semaphore *)v11;
  }
  return v4;
}

- (id)submissionURL
{
  return self->_submissionURL;
}

- (void)postContent:(id)a3 withHeaders:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  response = self->_response;
  self->_response = 0;

  v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  payload = self->_payload;
  self->_payload = v8;

  self->_thoughput_warnings = 0;
  self->_last_thoughput_check = 0.0;
  responseError = self->super._responseError;
  self->super._responseError = 0;

  dispatch_semaphore_t v11 = [MEMORY[0x1E4F28E88] requestWithURL:self->_submissionURL cachePolicy:1 timeoutInterval:60.0];
  [v11 setNetworkServiceType:5];
  [v11 setHTTPShouldHandleCookies:0];
  [v11 setHTTPMethod:@"POST"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v18 = [v12 objectForKeyedSubscript:v17];
        [v11 setValue:v18 forHTTPHeaderField:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  [v11 setHTTPBody:v22];
  [(OSAHttpSubmitter *)self performSelectorOnMainThread:sel_startConnection_ withObject:v11 waitUntilDone:1];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_submissionSem, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&self->super._responseData, self->_payload);
  v19 = self->_response;
  if (v19)
  {
    self->super._responseCode = [(NSHTTPURLResponse *)v19 statusCode];
    v20 = [(NSHTTPURLResponse *)self->_response allHeaderFields];
    responseHeaders = self->super._responseHeaders;
    self->super._responseHeaders = v20;
  }
}

- (void)abort
{
}

- (void)startConnection:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29090];
  id v5 = a3;
  id v6 = (NSURLConnection *)[[v4 alloc] _initWithRequest:v5 delegate:self usesCache:0 maxContentLength:0 startImmediately:0 connectionProperties:0];

  connection = self->_connection;
  self->_connection = v6;

  v8 = self->_connection;
  [(NSURLConnection *)v8 start];
}

- (void)cleanupConnectionAndDisable:(id)a3
{
  connection = self->_connection;
  if (connection)
  {
    [(NSURLConnection *)connection cancel];
    id v5 = self->_connection;
    self->_connection = 0;

    submissionSem = self->_submissionSem;
    dispatch_semaphore_signal(submissionSem);
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
}

- (void)connectionDidFinishLoading:(id)a3
{
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (NSError *)[v5 copy];
  responseError = self->super._responseError;
  self->super._responseError = v6;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Connection failed: %@", (uint8_t *)&v9, 0xCu);
  }
  v8 = [NSNumber numberWithBool:1];
  [(OSAHttpSubmitter *)self cleanupConnectionAndDisable:v8];
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  int v7 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3);
  double v11 = v10;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSAHttpSubmitter connection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:](a4, v7, a6);
  }
  double last_thoughput_check = self->_last_thoughput_check;
  if (last_thoughput_check != 0.0)
  {
    double v13 = v11 - last_thoughput_check;
    double v14 = (double)a4 * 0.0009765625 / (pow((double)a6 * 0.0009765625, 0.4) * 0.5);
    unsigned int v15 = v13 <= v14 ? 0 : self->_thoughput_warnings + 1;
    self->_unsigned int thoughput_warnings = v15;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      double v20 = v11 - self->_last_thoughput_check;
      unsigned int thoughput_warnings = self->_thoughput_warnings;
      *(_DWORD *)buf = 134218496;
      double v25 = v20;
      __int16 v26 = 2048;
      double v27 = v14;
      __int16 v28 = 1024;
      unsigned int v29 = thoughput_warnings;
      _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "  deltat: %.5f, threshold: %.1f (warnings %d)", buf, 0x1Cu);
    }
  }
  self->_double last_thoughput_check = v11;
  if (self->_thoughput_warnings >= 2)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    long long v23 = @"Throughput threshold violation";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v18 = [v16 errorWithDomain:@"OSAHttpSubmitter" code:1 userInfo:v17];
    responseError = self->super._responseError;
    self->super._responseError = v18;

    [(OSAHttpSubmitter *)self abort];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionSem, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_submissionURL, 0);
}

- (void)connection:(int)a3 didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:.cold.1(int a1, int a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109632;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  __int16 v6 = 1024;
  int v7 = a3;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "didSendBodyData %d (total %d of %d)", (uint8_t *)v3, 0x14u);
}

@end