@interface MBURLConnection
+ (MBURLConnection)connectionWithRequest:(id)a3 properties:(id)a4;
+ (id)sendAsyncRequest:(id)a3 properties:(id)a4 block:(id)a5;
+ (id)sendSyncRequest:(id)a3 properties:(id)a4 connection:(id *)a5 response:(id *)a6 error:(id *)a7;
- (MBURLConnection)initWithRequest:(id)a3 properties:(id)a4;
- (NSString)description;
- (id)dataReceived;
- (id)failure;
- (id)finishedLoading;
- (id)responseReceived;
- (void)cancel;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)setDataReceived:(id)a3;
- (void)setFailure:(id)a3;
- (void)setFinishedLoading:(id)a3;
- (void)setResponseReceived:(id)a3;
- (void)start;
@end

@implementation MBURLConnection

+ (id)sendSyncRequest:(id)a3 properties:(id)a4 connection:(id *)a5 response:(id *)a6 error:(id *)a7
{
  v12 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3052000000;
  v36 = sub_10020385C;
  v37 = sub_10020386C;
  uint64_t v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = sub_10020385C;
  v31 = sub_10020386C;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = sub_10020385C;
  v25 = sub_10020386C;
  uint64_t v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100203878;
  v20[3] = &unk_100416860;
  v20[6] = &v27;
  v20[7] = &v21;
  v20[4] = v12;
  v20[5] = &v33;
  id v14 = +[MBURLConnection sendAsyncRequest:a3 properties:a4 block:v20];
  if (a5) {
    *a5 = v14;
  }
  MBSemaphoreWaitForever();
  if (a5) {
    *a5 = 0;
  }
  id v15 = (id)v34[5];
  id v16 = (id)v28[5];
  id v17 = (id)v22[5];
  dispatch_release(v12);
  if (a6) {
    *a6 = (id)v34[5];
  }
  if (a7) {
    *a7 = (id)v22[5];
  }
  v18 = (void *)v28[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

+ (id)sendAsyncRequest:(id)a3 properties:(id)a4 block:(id)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = sub_10020385C;
  v19 = sub_10020386C;
  v20 = 0;
  v20 = +[MBURLConnection connectionWithRequest:a3 properties:a4];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_10020385C;
  v14[4] = sub_10020386C;
  v14[5] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_10020385C;
  v12[4] = sub_10020386C;
  id v13 = 0;
  id v13 = objc_alloc_init((Class)NSMutableData);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100203BC0;
  v11[3] = &unk_100416888;
  v11[4] = v14;
  [(id)v16[5] setResponseReceived:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100203BF0;
  v10[3] = &unk_1004168B0;
  v10[5] = v12;
  v10[6] = &v15;
  v10[4] = a5;
  [(id)v16[5] setDataReceived:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100203D24;
  v9[3] = &unk_1004168D8;
  v9[5] = v14;
  v9[6] = v12;
  v9[4] = a5;
  [(id)v16[5] setFailure:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100203DA8;
  v8[3] = &unk_100416900;
  v8[4] = a5;
  v8[5] = v14;
  v8[6] = v12;
  [(id)v16[5] setFinishedLoading:v8];
  [(id)v16[5] start];
  v6 = (void *)v16[5];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

+ (MBURLConnection)connectionWithRequest:(id)a3 properties:(id)a4
{
  v4 = [[MBURLConnection alloc] initWithRequest:a3 properties:a4];
  return v4;
}

- (MBURLConnection)initWithRequest:(id)a3 properties:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MBURLConnection;
  v6 = [(MBURLConnection *)&v13 init];
  if (v6)
  {
    v6->_request = (MBURLRequest *)a3;
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, v9);
    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    [(NSOperationQueue *)v10 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10 setUnderlyingQueue:v6->_queue];
    v6->_operationQueue = v10;
    v11 = (NSURLConnection *)objc_msgSend(objc_alloc((Class)NSURLConnection), "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", objc_msgSend(a3, "NSURLRequest"), v6, 1, 0, 0, a4);
    v6->_connection = v11;
    [(NSURLConnection *)v11 setDelegateQueue:v10];
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBURLConnection;
  [(MBURLConnection *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = [(NSURL *)[(MBURLRequest *)self->_request URL] path];
  v4 = [(NSURL *)[(MBURLRequest *)self->_request URL] query];
  if (v4) {
    objc_super v3 = [(NSString *)v3 stringByAppendingFormat:@"?%@", v4];
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(MBURLRequest *)self->_request method];
    NSUInteger v7 = [(NSData *)[(MBURLRequest *)self->_request data] length];
    *(_DWORD *)buf = 138413058;
    id v16 = self;
    __int16 v17 = 2112;
    v18 = v6;
    __int16 v19 = 2112;
    v20 = v3;
    __int16 v21 = 2048;
    NSUInteger v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: starting: %@ %@ (%lu)", buf, 0x2Au);
    v8 = [(MBURLRequest *)self->_request method];
    objc_super v13 = v3;
    NSUInteger v14 = [(NSData *)[(MBURLRequest *)self->_request data] length];
    uint64_t v11 = (uint64_t)self;
    v12 = v8;
    _MBLog();
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [(MBURLRequest *)self->_request headers];
    uint64_t v10 = MBStringWithDictionary();
    *(_DWORD *)buf = 138412290;
    id v16 = (MBURLConnection *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    [(MBURLRequest *)self->_request headers];
    uint64_t v11 = MBStringWithDictionary();
    _MBLog();
  }
  [(NSURLConnection *)self->_connection start];
}

- (void)cancel
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    NSUInteger v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: canceling", buf, 0xCu);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002042C0;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a4 statusCode];
    NSUInteger v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      objc_super v13 = self;
      __int16 v14 = 2048;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = +[NSHTTPURLResponse localizedStringForStatusCode:v6];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: response received: %ld (%@)", buf, 0x20u);
      +[NSHTTPURLResponse localizedStringForStatusCode:v6];
      _MBLog();
    }
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [a4 allHeaderFields];
      uint64_t v10 = MBStringWithDictionary();
      *(_DWORD *)buf = 138412290;
      objc_super v13 = (MBURLConnection *)v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      [a4 allHeaderFields];
      MBStringWithDictionary();
      _MBLog();
    }
    (*((void (**)(id, id, uint64_t))self->_responseReceived + 2))(self->_responseReceived, a4, v9);
  }
  else
  {
    uint64_t v11 = (void (*)(void))*((void *)self->_responseReceived + 2);
    v11();
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    __int16 v9 = 2048;
    id v10 = [a4 length];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: data received (%lu bytes)", buf, 0x16u);
    [a4 length];
    _MBLog();
  }
  (*((void (**)(id, id))self->_dataReceived + 2))(self->_dataReceived, a4);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_done) {
    __assert_rtn("-[MBURLConnection connection:didFailWithError:]", "MBURLConnection.m", 197, "!_done && \"Received connection:didFailWithError: when already done\"");
  }
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: failure: %@", buf, 0x16u);
    _MBLog();
  }
  self->_done = 1;
  (*((void (**)(id, id))self->_failure + 2))(self->_failure, a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_done) {
    __assert_rtn("-[MBURLConnection connectionDidFinishLoading:]", "MBURLConnection.m", 206, "!_done && \"Received connection:didFinishLoading: when already done\"");
  }
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: finished loading", buf, 0xCu);
    _MBLog();
  }
  self->_done = 1;
  (*((void (**)(id))self->_finishedLoading + 2))(self->_finishedLoading);
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  id v6 = [a4 sender];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  if ([v5 isEqualToString:@"NSURLAuthenticationMethodXMobileMeAuthToken"])
  {
    if ((uint64_t)[a4 previousFailureCount] < 1)
    {
      id v7 = [a4 proposedCredential];
      _[v6 useCredential:v7 forAuthenticationChallenge:a4];
      return;
    }
    goto LABEL_11;
  }
  if (([v5 isEqualToString:NSURLAuthenticationMethodServerTrust] & 1) == 0
    && ![v5 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
LABEL_11:
    __int16 v9 = "cancelAuthenticationChallenge:";
    v8 = v6;
    goto LABEL_12;
  }
  v8 = v6;
  __int16 v9 = "performDefaultHandlingForAuthenticationChallenge:";
LABEL_12:
  [v8 performSelector:v9 withObject:a4];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (id)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(id)a3
{
}

- (id)dataReceived
{
  return self->_dataReceived;
}

- (void)setDataReceived:(id)a3
{
}

- (id)failure
{
  return self->_failure;
}

- (void)setFailure:(id)a3
{
}

- (id)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(id)a3
{
}

@end