@interface device_http_t
+ (void)deviceHTTPForSessionURL:(id)a3 completionHandler:(id)a4;
- (BOOL)trustChallengeWithTrust:(id)a3;
- (NSString)contentEncoding;
- (NSString)printerDisplayName;
- (NSURL)printerURL;
- (NSURLCredential)defaultCredential;
- (device_http_t)initWithSessionURL:(id)a3 displayNameForCertTrust:(id)a4;
- (id)description;
- (id)finishStreamedIPPRequest;
- (id)makeConnection;
- (id)performAuthenticationForDeviceHTTP;
- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3;
- (id)serverCertificateCheckForDeviceHTTP;
- (id)startStreamedIPPRequest:(const Real_IPP_Message *)a3 compression:(id)a4;
- (int64_t)writeIPPDocumentPayload:(const char *)a3 length:(unint64_t)a4;
- (void)_rememberCredentialSent:(id)a3;
- (void)_setupCredentials;
- (void)_updateInitialMessageIfDefaultCredential:(Real_IPP_Message *)a3;
- (void)clearCredential;
- (void)dealloc;
- (void)passwordChallenge:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)passwordChallengeContinue:(id)a3 completionHandler:(id)a4;
- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 completionHandler:(id)a4;
- (void)setContentEncoding:(id)a3;
- (void)setDefaultCredential:(id)a3;
- (void)setPerformAuthenticationForDeviceHTTP:(id)a3;
- (void)setServerCertificateCheckForDeviceHTTP:(id)a3;
- (void)storeCredentialBasedOnTransactionResult:(id)a3;
@end

@implementation device_http_t

- (device_http_t)initWithSessionURL:(id)a3 displayNameForCertTrust:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)device_http_t;
  v8 = [(device_http_t *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 session];
    session = v8->_session;
    v8->_session = (IPPSession *)v9;

    uint64_t v11 = [v6 url];
    printerURL = v8->_printerURL;
    v8->_printerURL = (NSURL *)v11;

    objc_storeStrong((id *)&v8->_printerDisplayName, a4);
    [(device_http_t *)v8 _setupCredentials];
  }

  return v8;
}

- (void)dealloc
{
  streamedPrinterEndpoint = self->_streamedPrinterEndpoint;
  self->_streamedPrinterEndpoint = 0;

  v4.receiver = self;
  v4.super_class = (Class)device_http_t;
  [(device_http_t *)&v4 dealloc];
}

- (void)_setupCredentials
{
  uint64_t v3 = [(NSURL *)self->_printerURL user];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(NSURL *)self->_printerURL password];

    if (v5)
    {
      id v6 = [(NSURL *)self->_printerURL user];
      id v7 = [(NSURL *)self->_printerURL password];
      v8 = +[NSURLCredential credentialWithUser:v6 password:v7 persistence:2];
      defaultCredential = self->_defaultCredential;
      self->_defaultCredential = v8;
    }
  }
  if (self->_defaultCredential
    || (printerDisplayName = self->_printerDisplayName) != 0
    && (PKGetAuthInfo(printerDisplayName, self->_printerURL),
        uint64_t v11 = (NSURLCredential *)objc_claimAutoreleasedReturnValue(),
        v12 = self->_defaultCredential,
        self->_defaultCredential = v11,
        v12,
        self->_defaultCredential))
  {
    self->_forceEncryption = 1;
  }
}

- (id)makeConnection
{
  uint64_t v3 = [(NSURL *)self->_printerURL scheme];
  objc_super v4 = v3;
  if (self->_forceEncryption && [(__CFString *)v3 isEqualToString:@"ipp"])
  {

    objc_super v4 = @"ipps";
  }
  v5 = PKURLByReplacingScheme(v4, self->_printerURL);
  id v6 = [(IPPSession *)self->_session httpWithURL:v5];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B3DC;
  v11[3] = &unk_1000A3410;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "setPass_callback:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004B4C4;
  v9[3] = &unk_1000A3438;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "setTrust_callback:", v9);
  id v7 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v15 = self;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Created connection object: %{public}@ to %{public}@", buf, 0x20u);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)trustChallengeWithTrust:(id)a3
{
  objc_super v4 = (PKSecTrustWrapper *)a3;
  v5 = [(device_http_t *)self serverCertificateCheckForDeviceHTTP];

  if (v5)
  {
    id v6 = [(device_http_t *)self serverCertificateCheckForDeviceHTTP];
    LOBYTE(v7) = ((uint64_t (**)(void, device_http_t *, PKSecTrustWrapper *))v6)[2](v6, self, v4);
  }
  else
  {
    v8 = [(NSURL *)self->_printerURL host];
    printerDisplayName = self->_printerDisplayName;
    if (printerDisplayName)
    {
      int v7 = PKUserAllowsCertTrust(v4, v8, printerDisplayName);
    }
    else
    {
      id v10 = _PKLogCategory(PKLogCategoryNetwork[0]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "trust: no name specified for device, but allowing this trust", (uint8_t *)&v15, 2u);
      }

      int v7 = 1;
    }
    uint64_t v11 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = self->_printerDisplayName;
      v13 = "false";
      int v15 = 138544130;
      if (v7) {
        v13 = "true";
      }
      __int16 v16 = v4;
      __int16 v17 = 2114;
      __int16 v18 = v8;
      __int16 v19 = 2114;
      v20 = v12;
      __int16 v21 = 2080;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "trust: %{public}@ for %{public}@ / %{public}@: %s", (uint8_t *)&v15, 0x2Au);
    }
  }
  return v7;
}

- (void)passwordChallenge:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(device_http_t *)self performAuthenticationForDeviceHTTP];

  if (v11)
  {
    id v12 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Invoking external auth handler", buf, 0xCu);
    }

    v13 = [(device_http_t *)self performAuthenticationForDeviceHTTP];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004B99C;
    v14[3] = &unk_1000A3460;
    v14[4] = self;
    id v15 = v8;
    id v16 = v10;
    ((void (**)(void, device_http_t *, id, id, void *))v13)[2](v13, self, v9, v15, v14);
  }
  else
  {
    [(device_http_t *)self passwordChallengeContinue:v8 completionHandler:v10];
  }
}

- (void)passwordChallengeContinue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if ([v6 previousFailureCount] || !self->_defaultCredential)
  {
    id v8 = [v6 proposedCredential];
    id v9 = [v8 user];

    if (v9)
    {
LABEL_27:
      objc_initWeak(location, self);
      printerDisplayName = self->_printerDisplayName;
      char v20 = self->_credentialFromPrompt == 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10004BED8;
      v21[3] = &unk_1000A3488;
      objc_copyWeak(&v23, location);
      v22 = v7;
      PKPromptAuthInfo(printerDisplayName, v9, v20, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak(location);

      goto LABEL_28;
    }
    id v10 = v6;
    uint64_t v11 = [v10 protectionSpace];
    id v12 = [v11 authenticationMethod];
    if ([v12 isEqualToString:NSURLAuthenticationMethodHTTPBasic])
    {
    }
    else
    {
      unsigned int v13 = [v12 isEqualToString:NSURLAuthenticationMethodHTTPDigest];

      if (!v13) {
        goto LABEL_15;
      }
    }
    id v14 = [v10 _createCFAuthChallenge];
    if (v14)
    {
      id v15 = CFURLAuthChallengeGetFailureResponse();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v9 = 0;
LABEL_25:
        CFRelease(v14);

        goto LABEL_26;
      }
      id v16 = [v15 valueForHTTPHeaderField:@"Www-Authenticate"];
      __int16 v17 = v16;
      if (!v16)
      {
        id v9 = 0;
LABEL_24:

        goto LABEL_25;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      *(_OWORD *)id location = 0u;
      long long v25 = 0u;
      id v18 = v16;
      if (!sub_10004CF0C((const char *)[v18 UTF8String], "username", location) || !LOBYTE(location[0]))
      {
        if (![v18 hasPrefix:@"Basic"])
        {
          id v9 = 0;
          goto LABEL_23;
        }
        id v9 = 0;
        if (!sub_10004CF0C((const char *)[v18 UTF8String], "default", location)
          || !LOBYTE(location[0]))
        {
          goto LABEL_23;
        }
      }
      id v9 = +[NSString stringWithUTF8String:location];
LABEL_23:

      goto LABEL_24;
    }
LABEL_15:
    id v9 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v7[2](v7);
LABEL_28:
}

- (void)_rememberCredentialSent:(id)a3
{
}

- (void)storeCredentialBasedOnTransactionResult:(id)a3
{
  id v6 = a3;
  objc_super v4 = self->_credentialFromPrompt;
  if (v4)
  {
    unsigned int v5 = [v6 ippStatus];
    if (v5 - 4096 < 2)
    {
LABEL_5:

      objc_super v4 = 0;
      PKStoreAuthInfo(self->_printerURL, 0);
      goto LABEL_7;
    }
    if (v5)
    {
      if (v5 != 1183) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
    PKStoreAuthInfo(self->_printerURL, v4);
  }
LABEL_7:
}

- (id)description
{
  v2 = " (streaming)";
  if (!self->_streamedPrinterEndpoint) {
    v2 = "";
  }
  if (self->_streamedPrinterEndpointConnectionLostForWriting) {
    uint64_t v3 = " (no longer  writable)";
  }
  else {
    uint64_t v3 = " (writable)";
  }
  return +[NSString stringWithFormat:@"device_http<%p> { %@%s%s}", self, self->_printerURL, v2, v3];
}

- (void)clearCredential
{
  defaultCredential = self->_defaultCredential;
  self->_defaultCredential = 0;
}

- (void)_updateInitialMessageIfDefaultCredential:(Real_IPP_Message *)a3
{
  defaultCredential = self->_defaultCredential;
  if (defaultCredential && [(NSURLCredential *)defaultCredential hasPassword])
  {
    id v6 = [(NSURLCredential *)self->_defaultCredential user];
    if (v6) {
      sub_10000B968((uint64_t)a3, v6);
    }
  }
}

- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3
{
  unsigned int v5 = [(device_http_t *)self makeConnection];
  sub_10004D114(v12, (uint64_t)a3);
  [(device_http_t *)self _updateInitialMessageIfDefaultCredential:v12];
  id v6 = sub_10004C374((uint64_t)v12);
  int v7 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Sending message sync: %{public}@", buf, 0x16u);
  }

  id v8 = [v5 sendSingleIPPRequest:v12];
  id v9 = [v8 description];
  id v10 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Received response sync: %{public}@", buf, 0x16u);
  }

  [(device_http_t *)self storeCredentialBasedOnTransactionResult:v8];
  sub_10000F138((uint64_t)v12);

  return v8;
}

- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(device_http_t *)self makeConnection];
  sub_10004D114(v13, (uint64_t)a3);
  [(device_http_t *)self _updateInitialMessageIfDefaultCredential:v13];
  id v8 = sub_10004C374((uint64_t)v13);
  id v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Sending message async: %{public}@", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C604;
  v11[3] = &unk_1000A34B0;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  [v7 sendSingleIPPRequest:v13 completionHandler:v11];

  sub_10000F138((uint64_t)v13);
}

- (id)startStreamedIPPRequest:(const Real_IPP_Message *)a3 compression:(id)a4
{
  id v6 = a4;
  if (self->_streamedPrinterEndpoint) {
    __assert_rtn("-[device_http_t startStreamedIPPRequest:compression:]", "device_http.mm", 499, "_streamedPrinterEndpoint == nil");
  }
  int v7 = [(device_http_t *)self makeConnection];
  id v8 = v7;
  if (v6) {
    [v7 setDocumentCompression:v6];
  }
  sub_10004D114(v17, (uint64_t)a3);
  [(device_http_t *)self _updateInitialMessageIfDefaultCredential:v17];
  id v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_10004C374((uint64_t)v17);
    *(_DWORD *)buf = 134218242;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Starting streamed request for %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [v8 startStreamedIPPRequest:v17];
  if ([v11 transportStatus] == 2)
  {
    id v12 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Continuing streaming request", buf, 0xCu);
    }

    unsigned int v13 = v8;
    p_super = &self->_streamedPrinterEndpoint->super;
    self->_streamedPrinterEndpoint = v13;
  }
  else
  {
    p_super = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = [v11 description];
      *(_DWORD *)buf = 134218242;
      __int16 v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "device_http<%p>: Couldn't start streaming request, %{public}@", buf, 0x16u);
    }
  }

  [(device_http_t *)self storeCredentialBasedOnTransactionResult:v11];
  sub_10000F138((uint64_t)v17);

  return v11;
}

- (int64_t)writeIPPDocumentPayload:(const char *)a3 length:(unint64_t)a4
{
  streamedPrinterEndpoint = self->_streamedPrinterEndpoint;
  if (!streamedPrinterEndpoint)
  {
    id v6 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      id v12 = self;
      int v7 = "device_http<%p>: endpoint is nil, can't write";
      goto LABEL_7;
    }
LABEL_8:

    return -1;
  }
  if (self->_streamedPrinterEndpointConnectionLostForWriting)
  {
    id v6 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      id v12 = self;
      int v7 = "device_http<%p>: already saw write error, can't write";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unint64_t v8 = a4;
  if (-[platform_http_t writeIPPDocumentPayload:length:](streamedPrinterEndpoint, "writeIPPDocumentPayload:length:", a3) == a4)return v8; {
  id v10 = _PKLogCategory(PKLogCategoryNetwork[0]);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 134218240;
    id v12 = self;
    __int16 v13 = 2048;
    unint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "device_http<%p>: unable to write %ld bytes", (uint8_t *)&v11, 0x16u);
  }

  self->_streamedPrinterEndpointConnectionLostForWriting = 1;
  return -1;
}

- (id)finishStreamedIPPRequest
{
  streamedPrinterEndpoint = self->_streamedPrinterEndpoint;
  if (streamedPrinterEndpoint)
  {
    objc_super v4 = [(platform_http_t *)streamedPrinterEndpoint finishStreamedIPPRequest];
    unsigned int v5 = self->_streamedPrinterEndpoint;
    self->_streamedPrinterEndpoint = 0;

    id v6 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device_http<%p>: completed stream request - %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [(device_http_t *)self storeCredentialBasedOnTransactionResult:v4];
  }
  else
  {
    int v7 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "device_http<%p>: completed stream request - error ocurred", (uint8_t *)&v9, 0xCu);
    }

    objc_super v4 = [[http_ipp_response_t alloc] initWithTransportStatus:1];
    [(device_http_t *)self storeCredentialBasedOnTransactionResult:v4];
  }

  return v4;
}

+ (void)deviceHTTPForSessionURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  unsigned int v5 = (void (**)(id, device_http_t *))a4;
  id v6 = [[device_http_t alloc] initWithSessionURL:v7 displayNameForCertTrust:0];
  v5[2](v5, v6);
}

- (NSURL)printerURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)printerDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSURLCredential)defaultCredential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultCredential:(id)a3
{
}

- (NSString)contentEncoding
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContentEncoding:(id)a3
{
}

- (id)serverCertificateCheckForDeviceHTTP
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setServerCertificateCheckForDeviceHTTP:(id)a3
{
}

- (id)performAuthenticationForDeviceHTTP
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setPerformAuthenticationForDeviceHTTP:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performAuthenticationForDeviceHTTP, 0);
  objc_storeStrong(&self->_serverCertificateCheckForDeviceHTTP, 0);
  objc_storeStrong((id *)&self->_contentEncoding, 0);
  objc_storeStrong((id *)&self->_printerDisplayName, 0);
  objc_storeStrong((id *)&self->_printerURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_streamedPrinterEndpoint, 0);
  objc_storeStrong((id *)&self->_defaultCredential, 0);

  objc_storeStrong((id *)&self->_credentialFromPrompt, 0);
}

@end