@interface LookupRequestOperation
- (BOOL)_performJSSignLookupWithURLBag:(id)a3 error:(id *)a4;
- (BOOL)_performLocationLookup:(id *)a3;
- (BOOL)_performPlatformLookup:(id *)a3;
- (BOOL)shouldSuppressCookies;
- (LookupRequestOperation)initWithLookupProperties:(id)a3;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSAuthenticationContext)authenticationContext;
- (SSLookupProperties)lookupProperties;
- (SSLookupResponse)lookupResponse;
- (id)_URLBagContext;
- (id)_authenticationContext;
- (id)_newLookupResponseWithResultsFromOperation:(id)a3;
- (id)_newStoreURLOperationWithBagKey:(id)a3;
- (int64_t)personalizationStyle;
- (void)_setAccountID:(id)a3;
- (void)_setLookupResponse:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setShouldSuppressCookies:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation LookupRequestOperation

- (LookupRequestOperation)initWithLookupProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LookupRequestOperation;
  v4 = [(LookupRequestOperation *)&v6 init];
  if (v4) {
    v4->_properties = (SSLookupProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LookupRequestOperation;
  [(LookupRequestOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(LookupRequestOperation *)self lock];
  objc_super v3 = self->_authenticationContext;
  [(LookupRequestOperation *)self unlock];
  return v3;
}

- (NSString)clientIdentifierHeader
{
  [(LookupRequestOperation *)self lock];
  objc_super v3 = self->_clientIdentifierHeader;
  [(LookupRequestOperation *)self unlock];
  return v3;
}

- (SSLookupProperties)lookupProperties
{
  id v2 = [(SSLookupProperties *)self->_properties copy];

  return (SSLookupProperties *)v2;
}

- (SSLookupResponse)lookupResponse
{
  [(LookupRequestOperation *)self lock];
  objc_super v3 = self->_response;
  [(LookupRequestOperation *)self unlock];
  return v3;
}

- (int64_t)personalizationStyle
{
  [(LookupRequestOperation *)self lock];
  int64_t personalizationStyle = self->_personalizationStyle;
  [(LookupRequestOperation *)self unlock];
  return personalizationStyle;
}

- (void)setAuthenticationContext:(id)a3
{
  [(LookupRequestOperation *)self lock];
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  [(LookupRequestOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(LookupRequestOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  [(LookupRequestOperation *)self unlock];
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  [(LookupRequestOperation *)self lock];
  self->_int64_t personalizationStyle = a3;

  [(LookupRequestOperation *)self unlock];
}

- (void)setShouldSuppressCookies:(BOOL)a3
{
  [(LookupRequestOperation *)self lock];
  self->_shouldSuppressCookies = a3;

  [(LookupRequestOperation *)self unlock];
}

- (BOOL)shouldSuppressCookies
{
  [(LookupRequestOperation *)self lock];
  BOOL shouldSuppressCookies = self->_shouldSuppressCookies;
  [(LookupRequestOperation *)self unlock];
  return shouldSuppressCookies;
}

- (void)setUserAgent:(id)a3
{
  [(LookupRequestOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(LookupRequestOperation *)self unlock];
}

- (NSString)userAgent
{
  [(LookupRequestOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(LookupRequestOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v16 = 0;
  id v3 = [(LookupRequestOperation *)self loadedURLBagWithContext:[(LookupRequestOperation *)self _URLBagContext] returningError:&v16];
  if (v3)
  {
    id v4 = v3;
    if ([(SSLookupProperties *)self->_properties location])
    {
      BOOL v5 = [(LookupRequestOperation *)self _performLocationLookup:&v16];
    }
    else if ((id)[(LookupRequestOperation *)self personalizationStyle] == (id)2)
    {
      BOOL v5 = [(LookupRequestOperation *)self _performJSSignLookupWithURLBag:v4 error:&v16];
    }
    else
    {
      BOOL v5 = [(LookupRequestOperation *)self _performPlatformLookup:&v16];
    }
    BOOL v13 = v5;
  }
  else
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      int v17 = 138412546;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      LODWORD(v15) = 22;
      v14 = &v17;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v17, v15);
        free(v11);
        v14 = (int *)v12;
        SSFileLog();
      }
    }
    BOOL v13 = 0;
  }
  -[LookupRequestOperation setError:](self, "setError:", v16, v14);
  [(LookupRequestOperation *)self setSuccess:v13];
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v7 setLocale:v5];
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
  id v6 = objc_msgSend(v7, "stringFromDate:", +[NSDate date](NSDate, "date"));
  if (v6) {
    [a4 setValue:v6 forHTTPHeaderField:@"X-Request-TimeStamp"];
  }
}

- (id)_authenticationContext
{
  id v3 = [(LookupRequestOperation *)self authenticationContext];
  id v4 = [(SSAuthenticationContext *)v3 HTTPHeaders];
  uint64_t v5 = SSHTTPHeaderUserAgent;
  if ([v4 objectForKey:SSHTTPHeaderUserAgent]) {
    return v3;
  }
  id v7 = [(LookupRequestOperation *)self userAgent];
  if (!v7) {
    return v3;
  }
  int v8 = v7;
  id v9 = [(SSAuthenticationContext *)v3 mutableCopy];
  [v9 setValue:v8 forHTTPHeaderField:v5];

  return v9;
}

- (id)_newLookupResponseWithResultsFromOperation:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)SSLookupResponse), "initWithResponseDictionary:", objc_msgSend(objc_msgSend(a3, "dataProvider"), "output"));
  id v5 = [a3 response];
  if (v5)
  {
    objc_msgSend(v5, "itunes_expirationInterval");
    if (v6 >= 0.0) {
      objc_msgSend(v4, "setExpirationDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));
    }
  }
  return v4;
}

- (id)_newStoreURLOperationWithBagKey:(id)a3
{
  id v5 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v5, "setAuthenticationContext:", -[LookupRequestOperation authenticationContext](self, "authenticationContext"));
  [v5 setCanSendGUIDParameter:0];
  objc_msgSend(v5, "setDataProvider:", +[ISJSONDataProvider provider](ISJSONDataProvider, "provider"));
  id v6 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v6, "setClientIdentifier:", -[LookupRequestOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  [v6 setURLBagKey:a3];
  id v7 = [(SSLookupProperties *)self->_properties timeoutInterval];
  if (v7)
  {
    int v8 = v7;
    [v6 setAllowedRetryCount:0];
    [v8 doubleValue];
    objc_msgSend(v6, "setTimeoutInterval:");
  }
  else
  {
    [v6 setAllowedRetryCount:2];
  }
  id v9 = [(LookupRequestOperation *)self userAgent];
  if (!v9)
  {
    if (a3 != @"nearby-apps") {
      goto LABEL_7;
    }
    id v9 = (NSString *)objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "userAgentWithClientName:version:", @"AppStore", @"2.0");
  }
  [v6 setValue:v9 forHTTPHeaderField:SSHTTPHeaderUserAgent];
LABEL_7:
  id v10 = [(SSLookupProperties *)self->_properties copyRequestParameters];
  [v6 setRequestParameters:v10];

  [v5 setRequestProperties:v6];
  return v5;
}

- (BOOL)_performJSSignLookupWithURLBag:(id)a3 error:(id *)a4
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = sub_1001279B0;
  v21 = sub_1001279C0;
  uint64_t v22 = 0;
  id v7 = objc_msgSend(objc_alloc((Class)SSVPlatformContext), "initWithBagDictionary:", objc_msgSend(a3, "URLBagDictionary"));
  if ([v7 unpersonalizedLookupURLString])
  {
    id v8 = [objc_alloc((Class)SSVPlatformRequestOperation) initWithPlatformContext:v7];
    objc_msgSend(v8, "setKeyProfile:", -[SSLookupProperties keyProfile](self->_properties, "keyProfile"));
    objc_msgSend(v8, "setStoreFrontSuffix:", objc_msgSend(a3, "valueForKey:", @"storefront-header-suffix"));
    objc_msgSend(v8, "_setUserAgent:", -[LookupRequestOperation userAgent](self, "userAgent"));
    if ((id)[(LookupRequestOperation *)self personalizationStyle] == (id)2) {
      [v8 setShouldSuppressUserInfo:1];
    }
    objc_msgSend(v8, "setShouldSuppressCookies:", -[LookupRequestOperation shouldSuppressCookies](self, "shouldSuppressCookies"));
    id v9 = [(SSLookupProperties *)self->_properties copyRequestParameters];
    [v9 removeObjectForKey:SSLookupParameterKeyProfile];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001279CC;
    v16[3] = &unk_1003A7190;
    v16[4] = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v16];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100127AA8;
    v15[3] = &unk_1003A71B8;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = &v23;
    [v8 setResponseBlock:v15];
    [v8 main];
    id v10 = (id)v18[5];
  }
  else
  {
    v18[5] = SSError();
  }

  v11 = v24;
  int v12 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id)v18[5];
    int v12 = *((unsigned __int8 *)v11 + 24);
  }
  BOOL v13 = v12 != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v13;
}

- (BOOL)_performLocationLookup:(id *)a3
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  v27 = sub_1001279B0;
  v28 = sub_1001279C0;
  uint64_t v29 = 0;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  unsigned int v7 = [v5 shouldLogToDisk];
  id v8 = [v5 OSLogObject];
  if (v7) {
    v6 |= 2u;
  }
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v9 = objc_opt_class();
    int v34 = 138412290;
    uint64_t v35 = v9;
    LODWORD(v22) = 12;
    v21 = &v34;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v34, v22);
      free(v11);
      v21 = (int *)v12;
      SSFileLog();
    }
  }
  id v13 = [(LookupRequestOperation *)self _URLBagContext];
  id v14 = objc_msgSend(-[LookupRequestOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v13, v25 + 5), "valueForKey:", @"nearby-apps");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_msgSend(objc_alloc((Class)SSVLoadNearbyAppsOperation), "initWithBaseURL:location:", v14, -[SSLookupProperties location](self->_properties, "location"));
    objc_msgSend(v15, "setPointOfInterestIdentifier:", -[SSLookupProperties valueForRequestParameter:](self->_properties, "valueForRequestParameter:", SSLookupParameterPointOfInterestIdentifier));
    objc_msgSend(v15, "setPointOfInterestProviderIdentifier:", -[SSLookupProperties valueForRequestParameter:](self->_properties, "valueForRequestParameter:", SSLookupParameterPointOfInterestProviderIdentifier));
    objc_msgSend(v15, "setPointOfInterestProviderURL:", -[SSLookupProperties valueForRequestParameter:](self->_properties, "valueForRequestParameter:", SSLookupParameterPointOfInterestProviderURLString));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100127E9C;
    v23[3] = &unk_1003A71B8;
    v23[4] = self;
    v23[5] = &v24;
    v23[6] = &v30;
    [v15 setResponseBlock:v23];
    [v15 main];
    id v16 = (id)v25[5];
  }
  uint64_t v17 = v31;
  int v18 = *((unsigned __int8 *)v31 + 24);
  if (a3 && !*((unsigned char *)v31 + 24))
  {
    *a3 = (id)v25[5];
    int v18 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  return v19;
}

- (BOOL)_performPlatformLookup:(id *)a3
{
  v54 = 0;
  id v5 = [(LookupRequestOperation *)self _newStoreURLOperationWithBagKey:@"storeplatform-lookup-url"];
  [v5 setDelegate:self];
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v55 = 138412290;
    uint64_t v56 = objc_opt_class();
    LODWORD(v51) = 12;
    v48 = &v55;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v55, v51);
      free(v10);
      v48 = (int *)v11;
      SSFileLog();
    }
  }
  unsigned int v12 = -[LookupRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v54, v48);
  if (v12)
  {
    id v13 = [(LookupRequestOperation *)self _newLookupResponseWithResultsFromOperation:v5];
    [(LookupRequestOperation *)self _setLookupResponse:v13];
    id v14 = [v13 valueForProperty:SSLookupPropertyIsAuthenticated];
    if ((id)[(LookupRequestOperation *)self personalizationStyle] == (id)1
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v14 BOOLValue] & 1) == 0)
    {
      id v15 = +[SSLogConfig sharedDaemonConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_INFO)) {
        v17 &= 2u;
      }
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        int v55 = 138412290;
        uint64_t v56 = v18;
        LODWORD(v51) = 12;
        v49 = &v55;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v55, v51);
          free(v20);
          v49 = (int *)v21;
          SSFileLog();
        }
      }
      id v53 = 0;
      v52 = 0;
      unsigned __int8 v22 = [(LookupRequestOperation *)self copyAccountID:&v53 credentialSource:0 byAuthenticatingWithContext:[(LookupRequestOperation *)self _authenticationContext] returningError:&v52];
      id v23 = +[SSLogConfig sharedDaemonConfig];
      id v24 = v23;
      if (v22)
      {
        if (!v23) {
          id v24 = +[SSLogConfig sharedConfig];
        }
        unsigned int v25 = [v24 shouldLog];
        if ([v24 shouldLogToDisk]) {
          int v26 = v25 | 2;
        }
        else {
          int v26 = v25;
        }
        if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_INFO)) {
          v26 &= 2u;
        }
        if (v26)
        {
          uint64_t v27 = objc_opt_class();
          int v55 = 138412546;
          uint64_t v56 = v27;
          __int16 v57 = 2112;
          id v58 = v53;
          LODWORD(v51) = 22;
          v49 = &v55;
          uint64_t v28 = _os_log_send_and_compose_impl();
          if (v28)
          {
            uint64_t v29 = (void *)v28;
            uint64_t v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v55, v51);
            free(v29);
            v49 = (int *)v30;
            SSFileLog();
          }
        }
        -[LookupRequestOperation _setAccountID:](self, "_setAccountID:", v53, v49);
        id v31 = [(LookupRequestOperation *)self _newStoreURLOperationWithBagKey:@"storeplatform-lookup-url"];
        [v31 setDelegate:self];
        id v32 = +[SSLogConfig sharedDaemonConfig];
        if (!v32) {
          id v32 = +[SSLogConfig sharedConfig];
        }
        unsigned int v33 = [v32 shouldLog];
        if ([v32 shouldLogToDisk]) {
          int v34 = v33 | 2;
        }
        else {
          int v34 = v33;
        }
        if (!os_log_type_enabled((os_log_t)[v32 OSLogObject], OS_LOG_TYPE_INFO)) {
          v34 &= 2u;
        }
        if (v34)
        {
          uint64_t v35 = objc_opt_class();
          int v55 = 138412290;
          uint64_t v56 = v35;
          LODWORD(v51) = 12;
          v50 = &v55;
          uint64_t v36 = _os_log_send_and_compose_impl();
          if (v36)
          {
            v37 = (void *)v36;
            v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v55, v51);
            free(v37);
            v50 = (int *)v38;
            SSFileLog();
          }
        }
        if (-[LookupRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v31, 0, v50))
        {
          id v39 = [(LookupRequestOperation *)self _newLookupResponseWithResultsFromOperation:v31];
          [(LookupRequestOperation *)self _setLookupResponse:v39];
        }
        [v31 setDelegate:0];
      }
      else
      {
        if (!v23) {
          id v24 = +[SSLogConfig sharedConfig];
        }
        unsigned int v40 = [v24 shouldLog];
        if ([v24 shouldLogToDisk]) {
          int v41 = v40 | 2;
        }
        else {
          int v41 = v40;
        }
        if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v41 &= 2u;
        }
        if (v41)
        {
          uint64_t v42 = objc_opt_class();
          int v55 = 138412546;
          uint64_t v56 = v42;
          __int16 v57 = 2112;
          id v58 = v52;
          LODWORD(v51) = 22;
          v49 = &v55;
          uint64_t v43 = _os_log_send_and_compose_impl();
          if (v43)
          {
            v44 = (void *)v43;
            v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v55, v51);
            free(v44);
            v49 = (int *)v45;
            SSFileLog();
          }
        }
      }
    }
  }
  objc_msgSend(v5, "setDelegate:", 0, v49);

  if (a3) {
    char v46 = v12;
  }
  else {
    char v46 = 1;
  }
  if ((v46 & 1) == 0) {
    *a3 = v54;
  }
  return v12;
}

- (void)_setAccountID:(id)a3
{
  id v5 = [(LookupRequestOperation *)self authenticationContext];
  if ((objc_msgSend(a3, "isEqual:", -[SSAuthenticationContext requiredUniqueIdentifier](v5, "requiredUniqueIdentifier")) & 1) == 0)
  {
    id v6 = [(SSAuthenticationContext *)v5 mutableCopy];
    if (!v6) {
      id v6 = objc_alloc_init((Class)SSMutableAuthenticationContext);
    }
    id v7 = v6;
    [v6 setRequiredUniqueIdentifier:a3];
    [(LookupRequestOperation *)self setAuthenticationContext:v7];
  }
}

- (void)_setLookupResponse:(id)a3
{
  [(LookupRequestOperation *)self lock];
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSLookupResponse *)a3;
  }

  [(LookupRequestOperation *)self unlock];
}

- (id)_URLBagContext
{
  id v3 = +[SSURLBagContext contextWithBagType:0];
  id v4 = [(LookupRequestOperation *)self userAgent];
  [(SSURLBagContext *)v3 setValue:v4 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  return v3;
}

@end