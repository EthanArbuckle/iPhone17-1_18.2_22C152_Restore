@interface CCDURLOperation
- (BOOL)requestFailed;
- (CCDRequest)teslaRequest;
- (NSError)error;
- (NSMutableData)responseData;
- (NSString)httpResponseContentType;
- (NSTimer)timeoutTimer;
- (NSURLSession)urlSession;
- (double)retryAfterInterval;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
- (int64_t)_statusCodeFromResponse:(id)a3;
- (int64_t)requestCount;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_callCompletionBlockWithResponse:(id)a3 error:(id)a4;
- (void)_invalidateAndCancelURLSession;
- (void)_printStatusCode:(int64_t)a3;
- (void)_retryRequestIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5;
- (void)_retryRequestIfAllowedAfterDelayOrFailWithError:(id)a3;
- (void)_retryRequestOrFailWithError:(id)a3;
- (void)_sendFailureNoticeToRemote;
- (void)_sendResponseInfoToRemoteWithStatusCode:(int64_t)a3;
- (void)_startRetryTimerWithInterval:(double)a3;
- (void)_startURLRequest;
- (void)dealloc;
- (void)endOperation;
- (void)setError:(id)a3;
- (void)setHttpResponseContentType:(id)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)setRequestFailed:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setRetryAfterInterval:(double)a3;
- (void)setTeslaRequest:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)start;
- (void)timeoutTimerDidFire:(id)a3;
@end

@implementation CCDURLOperation

- (void)dealloc
{
  [(CCDURLOperation *)self _invalidateAndCancelURLSession];
  v3.receiver = self;
  v3.super_class = (Class)CCDURLOperation;
  [(CCDURLOperation *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = objc_opt_new();
  [(CCDURLOperation *)self setResponseData:v3];

  v4 = [(CCDURLOperation *)self urlSession];
  [v4 invalidateAndCancel];

  v5 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  v6 = +[NSOperationQueue mainQueue];
  v7 = +[NSURLSession sessionWithConfiguration:v5 delegate:self delegateQueue:v6];
  [(CCDURLOperation *)self setUrlSession:v7];

  [(CCDOperation *)self setOperationExecuting:1];
  [(CCDOperation *)self setOperationFinished:0];
  [(CCDURLOperation *)self setRequestCount:0];
  [(CCDURLOperation *)self setRequestFailed:0];

  [(CCDURLOperation *)self _startURLRequest];
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  return 0;
}

- (void)_invalidateAndCancelURLSession
{
  objc_super v3 = [(CCDURLOperation *)self urlSession];
  [v3 invalidateAndCancel];

  [(CCDURLOperation *)self setUrlSession:0];
}

- (void)_startURLRequest
{
  objc_super v3 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting URL Request", buf, 2u);
  }
  v4 = [(CCDURLOperation *)self teslaRequest];
  id v13 = 0;
  v5 = [v4 requestWithError:&v13];
  id v6 = v13;

  if (v5)
  {
    v7 = [(CCDURLOperation *)self urlSession];
    v8 = [v7 dataTaskWithRequest:v5];

    if (v8)
    {
      v9 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resume data task", v11, 2u);
      }
      [v8 resume];
    }
    else
    {
      [(CCDURLOperation *)self setError:v6];
      [(CCDURLOperation *)self _sendFailureNoticeToRemote];
    }
  }
  else
  {
    v10 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to build URL request", v12, 2u);
    }
    [(CCDURLOperation *)self setError:v6];
    [(CCDURLOperation *)self _sendFailureNoticeToRemote];
  }
}

- (void)_sendFailureNoticeToRemote
{
  objc_super v3 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending failure response back to client", v5, 2u);
  }
  v4 = [(CCDURLOperation *)self error];
  if (!v4)
  {
    v4 = +[CCDError internalErrorWithCode:34000];
  }
  [(CCDURLOperation *)self _callCompletionBlockWithResponse:0 error:v4];
}

- (void)endOperation
{
  [(CCDURLOperation *)self _invalidateAndCancelURLSession];
  v3.receiver = self;
  v3.super_class = (Class)CCDURLOperation;
  [(CCDOperation *)&v3 endOperation];
}

- (void)_callCompletionBlockWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ completed. Calling the completion block.", (uint8_t *)&v9, 0xCu);
  }
  [(CCDURLOperation *)self completeOperationWithResponse:v7 error:v6];

  [(CCDURLOperation *)self endOperation];
}

- (int64_t)_statusCodeFromResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 statusCode];
    if (v6 == (id)503)
    {
      id v7 = [v5 allHeaderFields];
      v8 = [v7 objectForKeyedSubscript:@"Retry-After"];

      uint64_t v9 = (uint64_t)[v8 integerValue];
      if (v9 >= 1) {
        [(CCDURLOperation *)self setRetryAfterInterval:(double)v9];
      }
      [(CCDURLOperation *)self retryAfterInterval];
      if (v10 < 2.0) {
        [(CCDURLOperation *)self setRetryAfterInterval:2.0];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (void)_sendResponseInfoToRemoteWithStatusCode:(int64_t)a3
{
  id v5 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Send response info to remote", buf, 2u);
  }
  char v12 = 0;
  id v6 = [(CCDURLOperation *)self responseData];
  id v7 = [(CCDURLOperation *)self httpResponseContentType];
  id v11 = 0;
  v8 = [(CCDURLOperation *)self responseWithResponseData:v6 contentType:v7 statusCode:a3 retryNeeded:&v12 outError:&v11];
  id v9 = v11;

  if (v9)
  {
    [(CCDURLOperation *)self setError:v9];
    [(CCDURLOperation *)self _sendFailureNoticeToRemote];
  }
  else if (v12)
  {
    double v10 = +[CCDError serviceBusyError];
    [(CCDURLOperation *)self _retryRequestOrFailWithError:v10];
  }
  else
  {
    [(CCDURLOperation *)self _callCompletionBlockWithResponse:v8 error:0];
  }
}

- (void)_printStatusCode:(int64_t)a3
{
  id v4 = +[NSString stringWithFormat:@"Response code: %ld, ", a3];
  id v5 = v4;
  if (a3 > 400)
  {
    if (a3 == 401)
    {
      CFStringRef v6 = @"Auth Failure";
      goto LABEL_11;
    }
    if (a3 == 500)
    {
      CFStringRef v6 = @"Server Exception";
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 200)
    {
      CFStringRef v6 = @"Success";
      goto LABEL_11;
    }
    if (a3 == 400)
    {
      CFStringRef v6 = @"Invalid Request";
      goto LABEL_11;
    }
  }
  CFStringRef v6 = @"Unknown Response";
LABEL_11:
  id v7 = [v4 stringByAppendingString:v6];

  v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v10 allHeaderFields];
    char v12 = v11;
    if (v11)
    {
      id v13 = [v11 objectForKeyedSubscript:@"Content-Type"];
      [(CCDURLOperation *)self setHttpResponseContentType:v13];

      v14 = [v10 allHeaderFields];
      v15 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = [v14 description];
        int v18 = 138543362;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Response Headers: %{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  v9[2](v9, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  id v7 = *(NSObject **)(DEPLogObjects() + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received actual data", buf, 2u);
    }
    id v9 = [(CCDURLOperation *)self responseData];
    [v9 appendData:v6];
  }
  else if (v8)
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No data received.", v10, 2u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    BOOL v8 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v11, 0xCu);
    }
    [(CCDURLOperation *)self _sendFailureNoticeToRemote];
  }
  else
  {
    id v9 = [a4 response];
    int64_t v10 = [(CCDURLOperation *)self _statusCodeFromResponse:v9];

    [(CCDURLOperation *)self _printStatusCode:v10];
    [(CCDURLOperation *)self _sendResponseInfoToRemoteWithStatusCode:v10];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, uint64_t, void))a6;
  id v7 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Default challange handling", v8, 2u);
  }
  v6[2](v6, 1, 0);
}

- (void)_retryRequestOrFailWithError:(id)a3
{
  id v4 = a3;
  [(CCDURLOperation *)self retryAfterInterval];
  -[CCDURLOperation _retryRequestIfAllowed:afterDelay:orFailWithError:](self, "_retryRequestIfAllowed:afterDelay:orFailWithError:", 1, v4);
}

- (void)_retryRequestIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  if (a3)
  {
    id v7 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }
    [(CCDURLOperation *)self _startRetryTimerWithInterval:a4];
  }
  else
  {
    +[CCDError maxRetriesExceededErrorWithUnderlyingError:](CCDError, "maxRetriesExceededErrorWithUnderlyingError:", a5, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(CCDURLOperation *)self _callCompletionBlockWithResponse:0 error:v8];
  }
}

- (void)_retryRequestIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4 = a3;
  [(CCDURLOperation *)self setRequestCount:(char *)[(CCDURLOperation *)self requestCount] + 1];
  [(CCDURLOperation *)self _retryRequestIfAllowed:[(CCDURLOperation *)self requestCount] < 3 afterDelay:v4 orFailWithError:2.0];
}

- (void)_startRetryTimerWithInterval:(double)a3
{
  id v5 = objc_alloc((Class)NSTimer);
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  id v7 = [v5 initWithFireDate:v6 interval:self target:"timeoutTimerDidFire:" selector:0 userInfo:0 repeats:0.0];
  [(CCDURLOperation *)self setTimeoutTimer:v7];

  id v9 = +[NSRunLoop mainRunLoop];
  id v8 = [(CCDURLOperation *)self timeoutTimer];
  [v9 addTimer:v8 forMode:NSRunLoopCommonModes];
}

- (void)timeoutTimerDidFire:(id)a3
{
  if ([(CCDURLOperation *)self requestFailed])
  {
    [(CCDURLOperation *)self _startURLRequest];
  }
}

- (CCDRequest)teslaRequest
{
  return *(CCDRequest **)(&self->_requestFailed + 3);
}

- (void)setTeslaRequest:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_teslaRequest + 3);
}

- (void)setError:(id)a3
{
}

- (NSMutableData)responseData
{
  return *(NSMutableData **)((char *)&self->_error + 3);
}

- (void)setResponseData:(id)a3
{
}

- (NSURLSession)urlSession
{
  return *(NSURLSession **)((char *)&self->_responseData + 3);
}

- (void)setUrlSession:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_urlSession + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_timeoutTimer + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_timeoutTimer + 3) = a3;
}

- (BOOL)requestFailed
{
  return *(&self->super._operationReady + 1);
}

- (void)setRequestFailed:(BOOL)a3
{
  *(&self->super._operationReady + 1) = a3;
}

- (int64_t)requestCount
{
  return *(void *)((char *)&self->_retryAfterInterval + 3);
}

- (void)setRequestCount:(int64_t)a3
{
  *(void *)((char *)&self->_retryAfterInterval + 3) = a3;
}

- (NSString)httpResponseContentType
{
  return *(NSString **)((char *)&self->_requestCount + 3);
}

- (void)setHttpResponseContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_requestCount + 3), 0);
  objc_storeStrong((id *)((char *)&self->_urlSession + 3), 0);
  objc_storeStrong((id *)((char *)&self->_responseData + 3), 0);
  objc_storeStrong((id *)((char *)&self->_error + 3), 0);
  objc_storeStrong((id *)((char *)&self->_teslaRequest + 3), 0);

  objc_storeStrong((id *)(&self->_requestFailed + 3), 0);
}

@end