@interface CNTokenAuthenticator
+ (id)sessionConfiguration;
+ (id)tokenAuthServerDiscoveryURL;
- (BOOL)parseChallenge:(id)a3 outRealm:(id *)a4 outErrorCode:(id *)a5 outErrorDescription:(id *)a6;
- (CNTokenAuthenticator)initWithURLString:(id)a3 token:(id)a4 queue:(id)a5 responseHandler:(id)a6;
- (NSData)token;
- (NSMutableData)receivedData;
- (NSOperationQueue)opQueue;
- (NSString)interfaceName;
- (NSString)userAgent;
- (NSURL)url;
- (NSURLSession)session;
- (NSURLSessionDataTask)loginDataTask;
- (id)authResult:(id)a3;
- (id)credentialForBearerChallenge:(id)a3;
- (id)locationFromResponse:(id)a3;
- (id)responseHandler;
- (unsigned)resultCodeFromError:(id)a3;
- (unsigned)timeoutSeconds;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)dealloc;
- (void)handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)handleChallengeResponse:(id)a3;
- (void)handleRedirectResponse:(id)a3;
- (void)handleResponse:(unsigned int)a3 result:(id)a4;
- (void)handleTaskCompletion;
- (void)login;
- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4;
- (void)setInterfaceName:(id)a3;
- (void)setLoginDataTask:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeoutSeconds:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)start;
@end

@implementation CNTokenAuthenticator

- (CNTokenAuthenticator)initWithURLString:(id)a3 token:(id)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNTokenAuthenticator;
  v14 = [(CNTokenAuthenticator *)&v23 init];
  if (!v14) {
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_5;
  }
  v15 = +[NSURL URLWithString:v10];
  [(CNTokenAuthenticator *)v14 setUrl:v15];

  v16 = [(CNTokenAuthenticator *)v14 url];
  v17 = [v16 scheme];
  id v18 = [v17 compare:@"https" options:1];

  if (v18)
  {
LABEL_4:
    v19 = 0;
  }
  else
  {
LABEL_5:
    [(CNTokenAuthenticator *)v14 setToken:v11];
    id v20 = objc_alloc_init((Class)NSOperationQueue);
    [(CNTokenAuthenticator *)v14 setOpQueue:v20];

    v21 = [(CNTokenAuthenticator *)v14 opQueue];
    [v21 setUnderlyingQueue:v12];

    [(CNTokenAuthenticator *)v14 setResponseHandler:v13];
    *(_WORD *)&v14->_isAuthorized = 0;
    v19 = v14;
  }

  return v19;
}

- (void)dealloc
{
  v3 = sub_100001810();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "dealloced", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CNTokenAuthenticator;
  [(CNTokenAuthenticator *)&v5 dealloc];
}

- (void)login
{
  if (!self->_session)
  {
    v3 = +[CNTokenAuthenticator sessionConfiguration];
    os_log_type_t v4 = [(CNTokenAuthenticator *)self opQueue];
    objc_super v5 = +[NSURLSession sessionWithConfiguration:v3 delegate:self delegateQueue:v4];
    session = self->_session;
    self->_session = v5;
  }
  v7 = [(CNTokenAuthenticator *)self url];
  if ([(CNTokenAuthenticator *)self timeoutSeconds]) {
    double v8 = (double)[(CNTokenAuthenticator *)self timeoutSeconds];
  }
  else {
    double v8 = 60.0;
  }
  v9 = +[NSMutableURLRequest requestWithURL:v7 cachePolicy:4 timeoutInterval:v8];

  id v10 = [(CNTokenAuthenticator *)self userAgent];
  [v9 setValue:v10 forHTTPHeaderField:@"User-Agent"];

  id v11 = [(CNTokenAuthenticator *)self interfaceName];
  [v9 setBoundInterfaceIdentifier:v11];

  id v12 = [(NSURLSession *)self->_session dataTaskWithRequest:v9];
  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = v12;

  v14 = sub_100001810();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  v16 = v14;
  if (os_log_type_enabled(v16, v15))
  {
    v17 = [(CNTokenAuthenticator *)self url];
    id v18 = [v17 absoluteString];
    int v19 = 138412546;
    id v20 = self;
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, v15, "%@ starting token based captive portal authentication with url: [%@]", (uint8_t *)&v19, 0x16u);
  }
  [(NSURLSessionDataTask *)self->_loginDataTask resume];
}

- (void)start
{
  v3 = [(CNTokenAuthenticator *)self url];
  if (v3) {
    [(CNTokenAuthenticator *)self url];
  }
  else {
  os_log_type_t v4 = +[CNTokenAuthenticator tokenAuthServerDiscoveryURL];
  }
  [(CNTokenAuthenticator *)self setUrl:v4];

  [(CNTokenAuthenticator *)self login];
}

- (void)cancel
{
  session = self->_session;
  if (session)
  {
    [(NSURLSession *)session invalidateAndCancel];
    os_log_type_t v4 = self->_session;
    self->_session = 0;
  }
  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = 0;
}

+ (id)sessionConfiguration
{
  v2 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v2 setHTTPCookieStorage:0];
  [v2 setURLCache:0];
  [v2 setURLCredentialStorage:0];
  [v2 set_enableOAuthBearerTokenChallenges:1];

  return v2;
}

+ (id)tokenAuthServerDiscoveryURL
{
  return +[NSURL URLWithString:@"http://captive.apple.com/hotspot-detect.html"];
}

- (id)locationFromResponse:(id)a3
{
  v3 = [a3 allHeaderFields];
  os_log_type_t v4 = [v3 objectForKey:@"Location"];

  return v4;
}

- (void)handleRedirectResponse:(id)a3
{
  os_log_type_t v4 = [(CNTokenAuthenticator *)self locationFromResponse:a3];
  objc_super v5 = sub_100001810();
  if (v4)
  {
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      os_log_type_t v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ task received HTTP Redirect with location header: [%@]", (uint8_t *)&v12, 0x16u);
    }

    objc_super v5 = +[NSURL URLWithString:v4];
    v7 = [v5 scheme];
    id v8 = [v7 compare:@"https" options:1];

    if (v8)
    {
      v9 = sub_100001810();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v10))
      {
        int v12 = 138412290;
        id v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ task found location without https scheme", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v11))
    {
      int v12 = 138412290;
      id v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, v11, "%@ task received HTTP Redirect without location header", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (unsigned)resultCodeFromError:(id)a3
{
  id v3 = a3;
  os_log_type_t v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 domain];
    unsigned int v6 = [v5 isEqualToString:NSURLErrorDomain];

    if (v6)
    {
      id v7 = [v4 code];
      switch((unint64_t)v7)
      {
        case 0xFFFFFFFFFFFFFC0FLL:
        case 0xFFFFFFFFFFFFFC13:
          unsigned int v8 = 8;
          break;
        case 0xFFFFFFFFFFFFFC10:
        case 0xFFFFFFFFFFFFFC11:
        case 0xFFFFFFFFFFFFFC14:
        case 0xFFFFFFFFFFFFFC16:
          goto LABEL_9;
        case 0xFFFFFFFFFFFFFC12:
        case 0xFFFFFFFFFFFFFC15:
          unsigned int v8 = 7;
          break;
        case 0xFFFFFFFFFFFFFC17:
          unsigned int v8 = 6;
          break;
        default:
          if (v7 != (id)-1202) {
            goto LABEL_9;
          }
          unsigned int v8 = 15;
          break;
      }
    }
    else
    {
LABEL_9:
      unsigned int v8 = 13;
    }
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = [(CNTokenAuthenticator *)self responseHandler];

  if (v6)
  {
    id v7 = [(CNTokenAuthenticator *)self responseHandler];
    ((void (**)(void, uint64_t, id))v7)[2](v7, v4, v8);
  }
  [(CNTokenAuthenticator *)self cancel];
}

- (void)handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  v9 = (void (**)(id, uint64_t, void))a5;
  v41 = v8;
  os_log_type_t v10 = [v8 protectionSpace];
  os_log_type_t v11 = [v10 authenticationMethod];
  int v12 = sub_100001810();
  os_log_type_t v13 = _SC_syslog_os_log_mapping();
  __int16 v14 = v12;
  if (os_log_type_enabled(v14, v13))
  {
    *(_DWORD *)buf = 138412546;
    id v47 = (id)objc_opt_class();
    __int16 v48 = 2114;
    v49 = v11;
    id v15 = v47;
    _os_log_impl((void *)&_mh_execute_header, v14, v13, "%@ received authentication challenege with %{public}@", buf, 0x16u);
  }
  v16 = [v42 currentRequest];
  v17 = [v16 URL];
  id v18 = [v17 scheme];
  unsigned int v19 = [v18 isEqualToString:@"https"];

  unsigned int v20 = [v11 isEqualToString:NSURLAuthenticationMethodOAuthBearerToken];
  int v21 = v20 ^ 1;
  if (!self->_tokenAuthAttempted && (v21 & 1) == 0 && ((v19 ^ 1) & 1) == 0)
  {
    uint64_t v22 = [(CNTokenAuthenticator *)self credentialForBearerChallenge:v41];
    goto LABEL_7;
  }
  if (![v11 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    int v36 = 17;
    goto LABEL_28;
  }
  v30 = sub_100001810();
  os_log_type_t v31 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v30, v31))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = self;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ received authentication challenege to trust server certificate", buf, 0xCu);
  }

  BOOL v32 = SecTrustEvaluateWithError((SecTrustRef)[v10 serverTrust], 0);
  v33 = sub_100001810();
  os_log_type_t v34 = _SC_syslog_os_log_mapping();
  BOOL v35 = os_log_type_enabled(v33, v34);
  if (!v32)
  {
    if (v35)
    {
      *(_DWORD *)buf = 138412290;
      id v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ failed to trust server certificate", buf, 0xCu);
    }

    int v36 = 15;
LABEL_28:
    objc_super v23 = 0;
    if ((v19 | v21))
    {
LABEL_32:
      v9[2](v9, 2, 0);
      objc_initWeak((id *)buf, self);
      v39 = [(CNTokenAuthenticator *)self opQueue];
      v40 = [v39 underlyingQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004330;
      block[3] = &unk_100010750;
      objc_copyWeak(&v44, (id *)buf);
      int v45 = v36;
      dispatch_async(v40, block);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
      goto LABEL_33;
    }
LABEL_29:
    v37 = sub_100001810();
    os_log_type_t v38 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v37, v38))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "insecure token based authentication is not supported", buf, 2u);
    }

    int v36 = 18;
    goto LABEL_32;
  }
  if (v35)
  {
    *(_DWORD *)buf = 138412290;
    id v47 = self;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ server certificate is trusted", buf, 0xCu);
  }

  uint64_t v22 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v10 serverTrust]);
LABEL_7:
  objc_super v23 = (void *)v22;
  if (v22) {
    unsigned int v24 = v19;
  }
  else {
    unsigned int v24 = 0;
  }
  if (v24 != 1)
  {
    if ((v19 | v21))
    {
      v9[2](v9, 1, 0);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  v25 = sub_100001810();
  os_log_type_t v26 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v25, v26))
  {
    *(_DWORD *)buf = 138477827;
    id v47 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "responding to challenge using credential %{private}@ for challenge", buf, 0xCu);
  }

  ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v23);
  if (v20)
  {
    self->_tokenAuthAttempted = 1;
    v27 = [v42 currentRequest];
    v28 = [v27 URL];
    url = self->_url;
    self->_url = v28;
  }
LABEL_33:
}

- (id)credentialForBearerChallenge:(id)a3
{
  id v4 = a3;
  if (![(NSData *)self->_token length]) {
    goto LABEL_4;
  }
  id v5 = objc_alloc((Class)NSString);
  unsigned int v6 = [(CNTokenAuthenticator *)self token];
  id v7 = [v5 initWithData:v6 encoding:4];

  id v8 = [v4 protectionSpace];
  [v8 realm];
  OAuth2 = (const void *)_CFURLCredentialCreateOAuth2();

  if (OAuth2)
  {
    id v10 = [objc_alloc((Class)NSURLCredential) _initWithCFURLCredential:OAuth2];
    CFRelease(OAuth2);
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }

  return v10;
}

- (void)handleResponse:(unsigned int)a3 result:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(CNTokenAuthenticator *)self opQueue];
  id v8 = [v7 underlyingQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004584;
  v10[3] = &unk_100010778;
  objc_copyWeak(&v12, &location);
  unsigned int v13 = a3;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)parseChallenge:(id)a3 outRealm:(id *)a4 outErrorCode:(id *)a5 outErrorDescription:(id *)a6
{
  id v9 = a3;
  id v10 = v9;
  if (!v9
    || (unint64_t)[v9 length] < 0xE
    || [v10 rangeOfString:@"Bearer"] == (id)0x7FFFFFFFFFFFFFFFLL
    || [v10 rangeOfString:@"realm="] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = 0;
  }
  else
  {
    *a6 = 0;
    *a5 = 0;
    *a4 = 0;
    unsigned int v13 = [v10 rangeOfString:@"realm="];
    id v15 = [v10 substringWithRange:&v13[v14], (unsigned char *)[v10 length] - &v13[v14]];
    if ((unint64_t)[v15 length] >= 3)
    {
      v16 = +[NSRegularExpression regularExpressionWithPattern:@"^(\").*(\")" options:1 error:0];
      if (v16)
      {
        id v18 = [v16 rangeOfFirstMatchInString:v15 options:0 range:[v15 length]];
        if (v18 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0, v17))
        {
          [v15 substringWithRange:v18, v17];
          id v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        if ((unint64_t)objc_msgSend(v19, "length", v18) >= 3)
        {
          id v19 = v19;
          *a4 = v19;
          unsigned int v20 = [v15 rangeOfString:@"error="];
          if (v20 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v11 = 1;
          }
          else
          {
            uint64_t v22 = [v15 substringWithRange:&v20[v21] length:([v15 length] - &v20[v21])];
            if ((unint64_t)[v22 length] < 3) {
              goto LABEL_23;
            }
            id v23 = [v16 rangeOfFirstMatchInString:v22 options:0 range:NSMakeRange(0, [v22 length])];
            uint64_t v25 = v24;

            if (v23 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0, v25))
            {
              [v22 substringWithRange:v23, v25];
              id v19 = (id)objc_claimAutoreleasedReturnValue();
              NSLog(@"substringForFirstMatch: [%@]", v19);
            }
            if ((unint64_t)[v19 length] >= 3)
            {
              id v19 = v19;
              *a5 = v19;
              os_log_type_t v26 = [v22 rangeOfString:@"error_description="];
              v28 = [v22 substringWithRange:&v26[v27], [v22 length] - &v26[v27]];
              if ((unint64_t)[v28 length] < 3) {
                goto LABEL_29;
              }
              id v29 = [v16 rangeOfFirstMatchInString:v28 options:0 range:[v28 length]];
              uint64_t v31 = v30;

              if (v29 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0, v31))
              {
                [v28 substringWithRange:v29, v31];
                id v19 = (id)objc_claimAutoreleasedReturnValue();
                NSLog(@"substringForFirstMatch: [%@]", v19);
              }
              if ((unint64_t)[v19 length] >= 3)
              {
                id v19 = v19;
                *a6 = v19;
                BOOL v11 = 1;
              }
              else
              {
LABEL_29:
                BOOL v11 = 0;
              }
            }
            else
            {
LABEL_23:
              BOOL v11 = 0;
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (void)handleChallengeResponse:(id)a3
{
  id v4 = [a3 allHeaderFields];
  if (![v4 count]
    || ([v4 objectForKey:@"WWW-Authenticate"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v11 = sub_100001810();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v19))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      CFStringRef v27 = @"WWW-Authenticate";
      _os_log_impl((void *)&_mh_execute_header, v11, v19, "%@ login data task did not receive response with [%@] header", buf, 0x16u);
    }
    id v6 = 0;
    id v10 = 0;
    id v9 = 0;
    id v8 = 0;
    goto LABEL_18;
  }
  id v6 = (void *)v5;
  id v22 = 0;
  id v23 = 0;
  id v21 = 0;
  unsigned __int8 v7 = [(CNTokenAuthenticator *)self parseChallenge:v5 outRealm:&v23 outErrorCode:&v22 outErrorDescription:&v21];
  id v8 = v23;
  id v9 = (__CFString *)v22;
  id v10 = (__CFString *)v21;
  if ((v7 & 1) == 0)
  {
    BOOL v11 = sub_100001810();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v20))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      CFStringRef v27 = @"WWW-Authenticate";
      id v15 = "%@ login data task received response with invalid [%@] header";
      v16 = v11;
      os_log_type_t v17 = v20;
      uint32_t v18 = 22;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (self->_tokenAuthAttempted)
  {
    BOOL v11 = sub_100001810();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      CFStringRef v13 = @"none";
      if (v9) {
        CFStringRef v14 = v9;
      }
      else {
        CFStringRef v14 = @"none";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      if (v10) {
        CFStringRef v13 = v10;
      }
      CFStringRef v27 = v14;
      __int16 v28 = 2112;
      CFStringRef v29 = v13;
      id v15 = "%@ token authentication failed error code: [%@], error description:[%@]";
      v16 = v11;
      os_log_type_t v17 = v12;
      uint32_t v18 = 32;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (id)authResult:(id)a3
{
  id v4 = a3;
  if (v4 && self->_isAuthorized)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = +[NSNumber numberWithBool:self->_tokenAuthAttempted];
    [v5 setObject:v6 forKeyedSubscript:off_100014FD0];

    unsigned __int8 v7 = [v4 objectForKeyedSubscript:off_100014FE8];
    id v8 = v7;
    if (self->_tokenAuthAttempted && [v7 length])
    {
      id v9 = [v8 dataUsingEncoding:4];
    }
    else
    {
      id v9 = 0;
    }
    if ([v9 length]) {
      [v5 setObject:v9 forKeyedSubscript:off_100014FD8];
    }
    BOOL v11 = [v4 objectForKeyedSubscript:off_100014FF0];
    [v5 setObject:v11 forKeyedSubscript:off_100014FE0];

    url = self->_url;
    if (url)
    {
      CFStringRef v13 = [(NSURL *)url absoluteString];
      [v5 setObject:v13 forKeyedSubscript:off_100014FC8];
    }
    id v10 = v5;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)handleTaskCompletion
{
  NSUInteger v3 = [(NSMutableData *)self->_receivedData length];
  id v4 = sub_100001810();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  BOOL v6 = os_log_type_enabled(v4, v5);
  if (v3)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      uint32_t v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ handleTaskCompletion: received non-zero data", buf, 0xCu);
    }

    receivedData = self->_receivedData;
    id v16 = 0;
    id v8 = +[NSJSONSerialization JSONObjectWithData:receivedData options:0 error:&v16];
    id v4 = v16;
    if (v4)
    {
      id v9 = sub_100001810();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412290;
        uint32_t v18 = (CNTokenAuthenticator *)v4;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "JSON parsing failed, error: %@", buf, 0xCu);
      }
      BOOL v11 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }
      CFStringRef v13 = sub_100001810();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138543362;
        uint32_t v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Token Authentication server sent : %{public}@", buf, 0xCu);
      }

      BOOL v11 = [(CNTokenAuthenticator *)self authResult:v8];
      id v9 = sub_100001810();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v15))
      {
        *(_DWORD *)buf = 138543362;
        uint32_t v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, v15, "Token Authentication Result : %{public}@", buf, 0xCu);
      }
    }

LABEL_9:
    goto LABEL_13;
  }
  if (v6)
  {
    *(_DWORD *)buf = 138412290;
    uint32_t v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ handleTaskCompletion: did not receive data", buf, 0xCu);
  }
  BOOL v11 = 0;
LABEL_13:

  if (self->_isAuthorized) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 19;
  }
  [(CNTokenAuthenticator *)self handleResponse:v12 result:v11];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_type_t v14 = sub_100001810();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ didReceiveChallenge", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v16 = [(CNTokenAuthenticator *)self opQueue];
  os_log_type_t v17 = [v16 underlyingQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100005258;
  v21[3] = &unk_1000107A0;
  objc_copyWeak(&v25, (id *)buf);
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v18 = v13;
  id v19 = v11;
  id v20 = v12;
  dispatch_async(v17, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  id v10 = sub_100001810();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    int v25 = 138412290;
    __int16 v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ didReceiveResponse", (uint8_t *)&v25, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    id v13 = sub_100001810();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      id v16 = (CNTokenAuthenticator *)[v12 statusCode];
      int v25 = 134217984;
      __int16 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, v14, "login data task received response with status code %lu", (uint8_t *)&v25, 0xCu);
    }

    if ([v12 statusCode] == (id)200)
    {
      self->_isAuthorized = 1;
LABEL_17:
      v9[2](v9, 1);
LABEL_22:

      goto LABEL_23;
    }
    if (self->_tokenAuthAttempted && [v12 statusCode] == (id)401)
    {
      id v19 = sub_100001810();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        int v25 = 138412290;
        __int16 v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ token authentication failed", (uint8_t *)&v25, 0xCu);
      }

      self->_isAuthorized = 0;
      [(CNTokenAuthenticator *)self handleChallengeResponse:v12];
      v9[2](v9, 0);
      id v21 = self;
      uint64_t v22 = 19;
    }
    else
    {
      if ([v12 statusCode] == (id)401) {
        goto LABEL_17;
      }
      id v23 = sub_100001810();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        int v25 = 138412290;
        __int16 v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ login data task received response with unexpected status code", (uint8_t *)&v25, 0xCu);
      }

      v9[2](v9, 0);
      id v21 = self;
      uint64_t v22 = 1;
    }
    [(CNTokenAuthenticator *)v21 handleResponse:v22 result:0];
    goto LABEL_22;
  }
  os_log_type_t v17 = sub_100001810();
  os_log_type_t v18 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v17, v18))
  {
    int v25 = 138412290;
    __int16 v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ login data task received invalid response", (uint8_t *)&v25, 0xCu);
  }

  v9[2](v9, 0);
  [(CNTokenAuthenticator *)self handleResponse:1 result:0];
LABEL_23:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a6;
  os_log_type_t v11 = (void (**)(id, void *))a7;
  id v12 = a5;
  id v13 = sub_100001810();
  os_log_type_t v14 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v13, v14))
  {
    int v40 = 138412290;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ willPerformHTTPRedirection", (uint8_t *)&v40, 0xCu);
  }

  [(CNTokenAuthenticator *)self handleRedirectResponse:v12];
  id v15 = v10;
  id v16 = v15;
  if (!self->_tokenAuthAttempted)
  {
    id v17 = objc_alloc((Class)NSURLComponents);
    os_log_type_t v18 = [v15 URL];
    id v19 = [v18 absoluteString];
    id v20 = [v17 initWithString:v19];

    id v16 = v15;
    if (!v20)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v21 = sub_100001810();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    id v23 = v21;
    if (os_log_type_enabled(v23, v22))
    {
      os_log_type_t v24 = [v20 string];
      int v40 = 138412546;
      v41 = self;
      __int16 v42 = 2112;
      v43 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, v22, "%@ Current URL String: [%@]", (uint8_t *)&v40, 0x16u);
    }
    int v25 = [v20 queryItems];
    id v26 = [v25 count];

    if (v26)
    {
      CFStringRef v27 = [v20 queryItems];
      id v28 = [v27 mutableCopy];

      id v16 = v15;
      if ([v28 indexOfObjectPassingTest:&stru_1000107E0] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      id v28 = objc_alloc_init((Class)NSMutableArray);
    }
    id v29 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"authorized" value:@"true"];
    [v28 addObject:v29];
    [v20 setQueryItems:v28];
    id v30 = objc_alloc((Class)NSURL);
    uint64_t v31 = [v20 string];
    id v32 = [v30 initWithString:v31];

    v33 = sub_100001810();
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    BOOL v35 = v33;
    if (os_log_type_enabled(v35, v34))
    {
      int v36 = [v20 string];
      int v40 = 138412546;
      v41 = self;
      __int16 v42 = 2112;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, v34, "%@ New URL String: [%@]", (uint8_t *)&v40, 0x16u);
    }
    if ([(CNTokenAuthenticator *)self timeoutSeconds]) {
      double v37 = (double)[(CNTokenAuthenticator *)self timeoutSeconds];
    }
    else {
      double v37 = 60.0;
    }
    id v16 = +[NSMutableURLRequest requestWithURL:v32 cachePolicy:4 timeoutInterval:v37];
    os_log_type_t v38 = [(CNTokenAuthenticator *)self userAgent];
    [v16 setValue:v38 forHTTPHeaderField:@"User-Agent"];

    v39 = [(CNTokenAuthenticator *)self interfaceName];
    [v16 setBoundInterfaceIdentifier:v39];

    goto LABEL_17;
  }
LABEL_19:
  v11[2](v11, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  unsigned __int8 v7 = sub_100001810();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, v8))
  {
    int v12 = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ didReceiveData", (uint8_t *)&v12, 0xCu);
  }

  if (self->_isAuthorized && [v6 length])
  {
    receivedData = self->_receivedData;
    if (!receivedData)
    {
      id v10 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      os_log_type_t v11 = self->_receivedData;
      self->_receivedData = v10;

      receivedData = self->_receivedData;
    }
    [(NSMutableData *)receivedData appendData:v6];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  unsigned __int8 v7 = sub_100001810();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, v8))
  {
    int v15 = 138412290;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ didCompleteWithError", (uint8_t *)&v15, 0xCu);
  }

  if (v6
    && ([v6 domain],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isEqualToString:NSURLErrorDomain],
        v9,
        v10))
  {
    os_log_type_t v11 = sub_100001810();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      int v15 = 138412546;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ session task completed with error %@", (uint8_t *)&v15, 0x16u);
    }

    switch((unint64_t)[v6 code])
    {
      case 0xFFFFFFFFFFFFFC0FLL:
      case 0xFFFFFFFFFFFFFC13:
        id v13 = self;
        uint64_t v14 = 8;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC12:
      case 0xFFFFFFFFFFFFFC15:
        id v13 = self;
        uint64_t v14 = 7;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC17:
        id v13 = self;
        uint64_t v14 = 6;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC19:
        break;
      default:
        id v13 = self;
        uint64_t v14 = 13;
LABEL_13:
        [(CNTokenAuthenticator *)v13 handleResponse:v14 result:0];
        break;
    }
  }
  else
  {
    [(CNTokenAuthenticator *)self handleTaskCompletion];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100001810();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v6, v7))
  {
    int v10 = 138412290;
    os_log_type_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ didBecomeInvalidWithError", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
  {
    os_log_type_t v8 = sub_100001810();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = 138412546;
      os_log_type_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ session invalidated with error %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionDataTask)loginDataTask
{
  return self->_loginDataTask;
}

- (void)setLoginDataTask:(id)a3
{
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_loginDataTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end