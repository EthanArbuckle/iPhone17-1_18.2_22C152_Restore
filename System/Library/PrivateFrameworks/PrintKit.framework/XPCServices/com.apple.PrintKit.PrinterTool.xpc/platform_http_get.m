@interface platform_http_get
- (NSString)debugDescription;
- (id)getLogCategory;
- (platform_http_get)initWithSession:(id)a3 url:(id)a4 callback:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)start;
@end

@implementation platform_http_get

- (platform_http_get)initWithSession:(id)a3 url:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)platform_http_get;
  v12 = [(platform_http_get *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    id v14 = objc_retainBlock(v11);
    id cb = v13->_cb;
    v13->_id cb = v14;
  }
  return v13;
}

- (id)getLogCategory
{
  return PKLogCategoryNetwork[0];
}

- (void)start
{
  id v6 = +[NSMutableURLRequest requestWithURL:self->_url];
  id v3 = sub_10000A670(v6);
  v4 = [(IPPSession *)self->_session URLSession];
  v5 = [v4 dataTaskWithRequest:v6];

  [v5 setDelegate:self];
  [v5 resume];
}

- (NSString)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)platform_http_get;
  id v3 = [(platform_http_get *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@ { session %@, endpoint %@ }", v3, self->_session, self->_url];

  return (NSString *)v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  v8 = (void (**)(id, void, void *))a6;
  id v9 = [v7 protectionSpace];
  id v10 = [v9 authenticationMethod];

  if ([v10 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    id v11 = [v7 protectionSpace];
    id v12 = [v11 serverTrust];

    if (v12)
    {
      CFErrorRef error = 0;
      v13 = [[PKSecTrustWrapper alloc] initWithTrust:v12];
      SecTrustEvaluateWithError([(PKSecTrustWrapper *)v13 trustRef], &error);
      if (error)
      {
        id v14 = _PKLogCategory(PKLogCategoryDefault[0]);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v19 = v10;
          __int16 v20 = 2114;
          CFErrorRef v21 = error;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "challenge %{public}@ has error %{public}@ but allowing", buf, 0x16u);
        }

        CFRelease(error);
        CFErrorRef error = 0;
      }
      v15 = +[NSURLCredential credentialForTrust:[(PKSecTrustWrapper *)v13 trustRef]];
      v8[2](v8, 0, v15);
    }
    else
    {
      v8[2](v8, 3, 0);
    }
  }
  else
  {
    v16 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "challenge %{public}@ not handled", buf, 0xCu);
    }

    v8[2](v8, 1, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  v8 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = v10;
  if (v10 && [v10 statusCode] == (id)200)
  {
    uint64_t v12 = 1;
  }
  else
  {
    v13 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "not using response", v14, 2u);
    }

    uint64_t v12 = 0;
  }
  v8[2](v8, v12);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v10 = a5;
  NSUInteger v6 = [(NSMutableData *)self->_data length];
  if ((unint64_t)[v10 length] + v6 <= 0x100000)
  {
    data = self->_data;
    if (data)
    {
      [(NSMutableData *)data appendData:v10];
    }
    else
    {
      v8 = (NSMutableData *)[v10 mutableCopy];
      id v9 = self->_data;
      self->_data = v8;
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSUInteger v6 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(NSMutableData *)self->_data length];
    v12[0] = 67109120;
    v12[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetch completed with %d bytes", (uint8_t *)v12, 8u);
  }

  id cb = (void (**)(void))self->_cb;
  p_id cb = &self->_cb;
  cb[2]();
  id v10 = *p_cb;
  *p_id cb = 0;

  id v11 = p_cb[1];
  p_cb[1] = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_cb, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end