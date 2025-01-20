@interface CCDDeviceUploadRequest
- (CCDDeviceUploadRequest)requestWithError:(id *)a3;
- (DEPDeviceUploadCredentials)userCredentials;
- (NSDictionary)requestBody;
- (NSString)endpointPath;
- (NSString)httpMethod;
- (id)_contentType;
- (id)_endpointURL;
- (id)_requestBodyData;
- (id)_requestHeader;
- (int64_t)requestType;
- (void)setUserCredentials:(id)a3;
@end

@implementation CCDDeviceUploadRequest

- (NSString)endpointPath
{
  return 0;
}

- (NSString)httpMethod
{
  return 0;
}

- (NSDictionary)requestBody
{
  return 0;
}

- (id)_contentType
{
  return @"application/json";
}

- (id)_requestHeader
{
  v3 = objc_opt_new();
  v4 = [(CCDDeviceUploadRequest *)self userCredentials];

  if (v4)
  {
    v5 = [(CCDDeviceUploadRequest *)self userCredentials];
    v6 = [v5 dsid];
    [v3 setObject:v6 forKeyedSubscript:kDEPDeviceUploadUserDsidHeaderKey];

    v7 = [(CCDDeviceUploadRequest *)self userCredentials];
    v8 = [v7 dsToken];
    v9 = [@"myacinfo=" stringByAppendingString:v8];
    [v3 setObject:v9 forKeyedSubscript:kDEPDeviceUploadCookieHeaderKey];
  }
  id v10 = [v3 copy];

  return v10;
}

- (id)_endpointURL
{
  v3 = [(CCDDeviceUploadRequest *)self endpointPath];

  if (v3)
  {
    v4 = [(CCDDeviceUploadRequest *)self endpointPath];
    v5 = [@"https://eesupportapp.isu.apple.com" stringByAppendingString:v4];
    v6 = +[NSURL URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_requestBodyData
{
  v3 = [(CCDDeviceUploadRequest *)self requestBody];

  if (v3)
  {
    v4 = [(CCDDeviceUploadRequest *)self requestBody];
    id v9 = 0;
    v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v9];
    id v6 = v9;

    if (v6)
    {
      v7 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error serializing data: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CCDDeviceUploadRequest)requestWithError:(id *)a3
{
  id v4 = objc_alloc((Class)NSMutableURLRequest);
  v5 = [(CCDDeviceUploadRequest *)self _endpointURL];
  id v6 = [v4 initWithURL:v5 cachePolicy:0 timeoutInterval:30.0];

  v7 = [(CCDDeviceUploadRequest *)self httpMethod];
  [v6 setHTTPMethod:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [(CCDDeviceUploadRequest *)self _requestHeader];
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [(CCDDeviceUploadRequest *)self _requestHeader];
        v15 = [v14 objectForKeyedSubscript:v13];
        [v6 setValue:v15 forHTTPHeaderField:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v16 = [(CCDDeviceUploadRequest *)self _contentType];

  if (v16)
  {
    v17 = [(CCDDeviceUploadRequest *)self _contentType];
    [v6 setValue:v17 forHTTPHeaderField:@"Content-Type"];
  }
  v18 = [(CCDDeviceUploadRequest *)self _requestBodyData];

  if (v18)
  {
    v19 = [(CCDDeviceUploadRequest *)self _requestBodyData];
    [v6 setHTTPBody:v19];
  }

  return (CCDDeviceUploadRequest *)v6;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (DEPDeviceUploadCredentials)userCredentials
{
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
}

- (void).cxx_destruct
{
}

@end