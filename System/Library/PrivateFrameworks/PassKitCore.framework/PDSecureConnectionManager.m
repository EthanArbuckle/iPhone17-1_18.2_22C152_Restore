@interface PDSecureConnectionManager
- (NSURLRequest)request;
- (id)failureHandler;
- (id)successHandler;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)_sendFailure:(id)a3;
- (void)_sendSuccess;
- (void)cancel;
- (void)setFailureHandler:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSuccessHandler:(id)a3;
- (void)start;
@end

@implementation PDSecureConnectionManager

- (void)start
{
  if (!self->_started && !self->_canceled)
  {
    self->_started = 1;
    id v10 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    uint64_t v3 = PKServiceBundleIdentifier;
    objc_msgSend(v10, "set_attributedBundleIdentifier:", PKServiceBundleIdentifier);
    objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", v3);
    v4 = +[NSOperationQueue mainQueue];
    v5 = +[NSURLSession sessionWithConfiguration:v10 delegate:self delegateQueue:v4];
    urlSession = self->_urlSession;
    self->_urlSession = v5;

    v7 = self->_urlSession;
    if (v7)
    {
      v8 = [(NSURLSession *)v7 dataTaskWithRequest:self->_request];
      task = self->_task;
      self->_task = v8;

      [(NSURLSessionTask *)self->_task resume];
    }
    else
    {
      [(PDSecureConnectionManager *)self _sendFailure:0];
    }
  }
}

- (void)cancel
{
  if (!self->_canceled)
  {
    self->_canceled = 1;
    [(NSURLSession *)self->_urlSession invalidateAndCancel];
  }
}

- (void)_sendSuccess
{
  uint64_t v3 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD7C0;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_sendFailure:(id)a3
{
  id v4 = a3;
  v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CD8E0;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a4 description];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session did become invalid with error %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = (void (**)(id, uint64_t, void))a5;
  int v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = a4;
    v17 = [v8 protectionSpace];
    v9 = [v17 realm];
    v16 = [v8 protectionSpace];
    id v10 = [v16 host];
    v11 = [v8 protectionSpace];
    v12 = [v11 protocol];
    v13 = [v8 protectionSpace];
    v14 = [v13 authenticationMethod];
    v15 = [v8 proposedCredential];

    *(_DWORD *)buf = 138413314;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received authentication challenge:\n  ---->Protection Space: <Realm: %@, Host: %@, Protocol: %@, Method: %@>\n  ---->Proposed Credential: %@\n  Performing default handling.", buf, 0x34u);
  }
  v6[2](v6, 1, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  request = self->_request;
  id v7 = a5;
  id v9 = [(NSURLRequest *)request HTTPBody];
  id v8 = +[NSInputStream inputStreamWithData:v9];
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5) {
    -[PDSecureConnectionManager _sendFailure:](self, "_sendFailure:", a5, a4);
  }
  else {
    [(PDSecureConnectionManager *)self _sendSuccess];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_response, a5);
    [(NSMutableData *)self->_data setLength:0];
    uint64_t v11 = 1;
  }
  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Connection received non-http URL response";
    v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = +[NSError errorWithDomain:NSURLErrorDomain code:-1011 userInfo:v12];
    [(PDSecureConnectionManager *)self _sendFailure:v13];

    uint64_t v11 = 0;
  }
  v10[2](v10, v11);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  data = self->_data;
  if (!data)
  {
    v12 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:0];
    v13 = self->_data;
    self->_data = v12;

    data = self->_data;
  }
  NSErrorUserInfoKey v14 = [(NSMutableData *)data length];
  if (&v14[(void)[v10 length]] > (char *)0xF00000)
  {
    [v9 cancel];
    CFStringRef v15 = +[NSString stringWithFormat:@"Connection received response data in excess of %g megabyte limit", 0x402E000000000000];
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v17 = +[NSError errorWithDomain:NSURLErrorDomain code:-1103 userInfo:v16];
    [(PDSecureConnectionManager *)self _sendFailure:v17];
  }
  else
  {
    [(NSMutableData *)self->_data appendData:v10];
  }
}

- (id)successHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSuccessHandler:(id)a3
{
}

- (id)failureHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setFailureHandler:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_successHandler, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end