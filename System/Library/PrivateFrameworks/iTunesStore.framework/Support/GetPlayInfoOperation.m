@interface GetPlayInfoOperation
- (GetPlayInfoOperation)initWithPlayInfoRequestContext:(id)a3;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSPlayInfoRequestContext)playInfoContext;
- (SSPlayInfoResponse)playInfoResponse;
- (id)_copyRequestBody:(id *)a3;
- (void)_failWithError:(id)a3;
- (void)_setPlayInfoResponse:(id)a3;
- (void)_setResponseForOutput:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation GetPlayInfoOperation

- (GetPlayInfoOperation)initWithPlayInfoRequestContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GetPlayInfoOperation;
  v4 = [(GetPlayInfoOperation *)&v6 init];
  if (v4) {
    v4->_context = (SSPlayInfoRequestContext *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GetPlayInfoOperation;
  [(GetPlayInfoOperation *)&v3 dealloc];
}

- (NSString)clientIdentifierHeader
{
  [(GetPlayInfoOperation *)self lock];
  objc_super v3 = self->_clientIdentifierHeader;
  [(GetPlayInfoOperation *)self unlock];
  return v3;
}

- (SSPlayInfoRequestContext)playInfoContext
{
  id v2 = [(SSPlayInfoRequestContext *)self->_context copy];

  return (SSPlayInfoRequestContext *)v2;
}

- (SSPlayInfoResponse)playInfoResponse
{
  [(GetPlayInfoOperation *)self lock];
  objc_super v3 = self->_response;
  [(GetPlayInfoOperation *)self unlock];
  return v3;
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(GetPlayInfoOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  [(GetPlayInfoOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  [(GetPlayInfoOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(GetPlayInfoOperation *)self unlock];
}

- (NSString)userAgent
{
  [(GetPlayInfoOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(GetPlayInfoOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v31 = 0;
  id v3 = [(GetPlayInfoOperation *)self _copyRequestBody:&v31];
  if (!v3)
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (!v13) {
      goto LABEL_24;
    }
LABEL_22:
    uint64_t v17 = objc_opt_class();
    int v32 = 138412546;
    uint64_t v33 = v17;
    __int16 v34 = 2112;
    uint64_t v35 = v31;
    LODWORD(v30) = 22;
    uint64_t v18 = _os_log_send_and_compose_impl();
    if (v18)
    {
      v19 = (void *)v18;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v32, v30);
      free(v19);
      SSFileLog();
    }
LABEL_24:
    [(GetPlayInfoOperation *)self _failWithError:SSErrorWithUnderlyingError()];
    goto LABEL_40;
  }
  v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:&v31];
  if (!v4)
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v5 = v4;
  id v6 = objc_alloc_init((Class)ISStoreURLOperation);
  v7 = [(GetPlayInfoOperation *)self userAgent];
  id v8 = [v3 objectForKey:@"dsid"];
  if (v8)
  {
    id v9 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:v8];
    uint64_t v10 = SSHTTPHeaderUserAgent;
    [v9 setValue:v7 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    [v6 setAuthenticationContext:v9];
  }
  else
  {
    uint64_t v10 = SSHTTPHeaderUserAgent;
  }
  v20 = objc_alloc_init(DaemonProtocolDataProvider);
  [v6 setDataProvider:v20];
  id v21 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v21 setCachePolicy:1];
  objc_msgSend(v21, "setClientIdentifier:", -[GetPlayInfoOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  [v21 setHTTPBody:v5];
  [v21 setHTTPMethod:@"POST"];
  [v21 setURLBagKey:@"get-play-info"];
  [v21 setValue:v7 forHTTPHeaderField:v10];
  [v6 setRequestProperties:v21];

  id v22 = +[SSLogConfig sharedDaemonConfig];
  if (!v22) {
    id v22 = +[SSLogConfig sharedConfig];
  }
  unsigned int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    int v24 = v23 | 2;
  }
  else {
    int v24 = v23;
  }
  if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_INFO)) {
    v24 &= 2u;
  }
  if (v24)
  {
    uint64_t v25 = objc_opt_class();
    int v32 = 138412290;
    uint64_t v33 = v25;
    LODWORD(v30) = 12;
    v29 = &v32;
    uint64_t v26 = _os_log_send_and_compose_impl();
    if (v26)
    {
      v27 = (void *)v26;
      v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v32, v30);
      free(v27);
      v29 = (int *)v28;
      SSFileLog();
    }
  }
  if (-[GetPlayInfoOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, &v31, v29))[(GetPlayInfoOperation *)self _setResponseForOutput:[(DaemonProtocolDataProvider *)v20 output]]; {
  else
  }
    [(GetPlayInfoOperation *)self _failWithError:v31];

LABEL_40:
}

- (id)_copyRequestBody:(id *)a3
{
  v37 = 0;
  id v5 = [(SSPlayInfoRequestContext *)self->_context sinfs];
  if ([v5 count]) {
    id v6 = [[SinfsArray alloc] initWithSINFs:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = [(SSPlayInfoRequestContext *)self->_context accountIdentifier];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8) {
    id v7 = [(SinfsArray *)v6 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:&v37];
  }
  if (v7)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [v9 setObject:v7 forKey:@"dsid"];
    id v10 = [(SSPlayInfoRequestContext *)self->_context contentIdentifier];
    if (v10)
    {
      [v9 setObject:v10 forKey:@"content-id"];
    }
    else
    {
      id v17 = [(SinfsArray *)v6 copyValueForProperty:@"SinfPropertyFairPlayKeyIdentifier" error:&v37];
      if (v17)
      {
        uint64_t v18 = v17;
        id v19 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v17, 0);
        id v20 = [(SinfsArray *)v6 copyValueForProperty:@"SinfPropertyRentalInformation" error:0];
        if (v20) {
          CFStringRef v21 = @"rental-ids";
        }
        else {
          CFStringRef v21 = @"key-ids";
        }
        [v9 setObject:v19 forKey:v21];
      }
      else
      {
        id v28 = +[SSLogConfig sharedDaemonConfig];
        if (!v28) {
          id v28 = +[SSLogConfig sharedConfig];
        }
        unsigned int v29 = [v28 shouldLog];
        if ([v28 shouldLogToDisk]) {
          int v30 = v29 | 2;
        }
        else {
          int v30 = v29;
        }
        if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v30 &= 2u;
        }
        if (v30)
        {
          uint64_t v31 = objc_opt_class();
          int v38 = 138412546;
          uint64_t v39 = v31;
          __int16 v40 = 2112;
          v41 = v37;
          LODWORD(v36) = 22;
          uint64_t v35 = &v38;
          uint64_t v32 = _os_log_send_and_compose_impl();
          if (v32)
          {
            uint64_t v33 = (void *)v32;
            __int16 v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v38, v36);
            free(v33);
            uint64_t v35 = (int *)v34;
            SSFileLog();
          }
        }
      }
    }
    id v22 = [(SSPlayInfoRequestContext *)self->_context playbackType];
    if (v22) {
      [v9 setObject:v22 forKey:@"subPlayType"];
    }
    id v23 = [+[ISDevice sharedInstance] guid];
    if (v23) {
      [v9 setObject:v23 forKey:@"guid"];
    }
    id v24 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
    if (v24) {
      [v9 setObject:v24 forKey:@"hw.model"];
    }
    id v25 = [(SSPlayInfoRequestContext *)self->_context playerGUID];
    if (v25) {
      [v9 setObject:v25 forKey:@"player-guid"];
    }
    id v26 = [(SSPlayInfoRequestContext *)self->_context SICData];
    if (v26) {
      [v9 setObject:v26 forKey:@"sic"];
    }
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      int v38 = 138412546;
      uint64_t v39 = v14;
      __int16 v40 = 2112;
      v41 = v37;
      LODWORD(v36) = 22;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        int v16 = (void *)v15;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v38, v36);
        free(v16);
        SSFileLog();
      }
    }
    id v9 = 0;
  }

  if (v37)
  {

    id v9 = 0;
  }
  if (a3) {
    *a3 = v37;
  }
  return v9;
}

- (void)_failWithError:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (!a3) {
    uint64_t v3 = SSError();
  }
  id v5 = [objc_alloc((Class)SSPlayInfoResponse) initWithPlayInfoData:0 error:v3];
  [(GetPlayInfoOperation *)self _setPlayInfoResponse:v5];
  [(GetPlayInfoOperation *)self setError:v3];
}

- (void)_setPlayInfoResponse:(id)a3
{
  [(GetPlayInfoOperation *)self lock];
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSPlayInfoResponse *)a3;
  }

  [(GetPlayInfoOperation *)self unlock];
}

- (void)_setResponseForOutput:(id)a3
{
  id v5 = [a3 objectForKey:@"status"];
  if (v5 && (id v6 = v5, (objc_opt_respondsToSelector() & 1) != 0) && [v6 intValue])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v17 = 138412546;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2112;
      id v20 = v6;
      LODWORD(v15) = 22;
      uint64_t v14 = &v17;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        id v11 = (void *)v10;
        unsigned int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v17, v15);
        free(v11);
        uint64_t v14 = (int *)v12;
        SSFileLog();
      }
    }
    objc_msgSend(v6, "intValue", v14);
    [(GetPlayInfoOperation *)self _failWithError:SSError()];
  }
  else
  {
    id v13 = [a3 objectForKey:@"play-info"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v13 = 0;
    }
    id v16 = [objc_alloc((Class)SSPlayInfoResponse) initWithPlayInfoData:v13 error:0];
    -[GetPlayInfoOperation _setPlayInfoResponse:](self, "_setPlayInfoResponse:");
    [(GetPlayInfoOperation *)self setSuccess:1];
  }
}

@end