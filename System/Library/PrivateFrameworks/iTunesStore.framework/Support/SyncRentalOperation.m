@interface SyncRentalOperation
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (SyncRentalOperation)initWithAccountIdentifier:(id)a3;
- (SyncRentalOperation)initWithSinfs:(id)a3;
- (id)_bodyData;
- (void)_run;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SyncRentalOperation

- (SyncRentalOperation)initWithSinfs:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SyncRentalOperation.m" lineNumber:34 description:@"Must have sinfs"];
  }
  v14.receiver = self;
  v14.super_class = (Class)SyncRentalOperation;
  v6 = [(SyncRentalOperation *)&v14 init];
  if (v6)
  {
    v7 = (NSArray *)[v5 copy];
    sinfs = v6->_sinfs;
    v6->_sinfs = v7;

    if (v6->_sinfs)
    {
      v9 = [[SinfsArray alloc] initWithSINFs:v6->_sinfs];
      v10 = [(SinfsArray *)v9 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0];
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = v10;
    }
  }

  return v6;
}

- (SyncRentalOperation)initWithAccountIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 unsignedLongLongValue])
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SyncRentalOperation.m" lineNumber:50 description:@"Must have account"];
  }
  v11.receiver = self;
  v11.super_class = (Class)SyncRentalOperation;
  v6 = [(SyncRentalOperation *)&v11 init];
  if (v6)
  {
    v7 = (NSNumber *)[v5 copy];
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = v7;
  }
  return v6;
}

- (void)run
{
}

- (id)_bodyData
{
  if ([(NSNumber *)self->_accountIdentifier unsignedLongLongValue])
  {
    id v3 = sub_10002D778();
    if (v3)
    {
      v4 = v3;
      id v34 = 0;
      id v35 = 0;
      char v5 = sub_10002D9F0(&v35, &v34);
      id v6 = v35;
      id v7 = v34;
      if (v5)
      {
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        v9 = v8;
        if (v6) {
          [v8 setObject:v6 forKey:@"device-diversity"];
        }
        accountIdentifier = self->_accountIdentifier;
        if (accountIdentifier) {
          [v9 setObject:accountIdentifier forKey:@"dsid"];
        }
        objc_super v11 = +[ISDevice sharedInstance];
        v12 = [v11 guid];

        if (v12) {
          [v9 setObject:v12 forKey:@"guid"];
        }
        v13 = +[SSDevice currentDevice];
        objc_super v14 = [v13 productType];

        if (v14) {
          [v9 setObject:v14 forKey:@"hw.model"];
        }
        if (v7) {
          [v9 setObject:v7 forKey:@"rbsync"];
        }
        [v9 setObject:v4 forKey:@"rental-bag"];
        v15 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:100 options:0 error:0];
        goto LABEL_51;
      }
      v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16)
      {
        v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v21 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      v23 = [v16 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        v22 &= 2u;
      }
      if (!v22) {
        goto LABEL_37;
      }
      v24 = objc_opt_class();
      int v36 = 138412290;
      id v37 = v24;
      id v25 = v24;
      LODWORD(v33) = 12;
      v32 = &v36;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v36, v33);
        free(v26);
        v32 = (int *)v23;
        SSFileLog();
LABEL_37:
      }
    }
    else
    {
      v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16)
      {
        v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      v19 = [v16 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        v18 &= 2u;
      }
      if (v18)
      {
        int v36 = 138412290;
        id v37 = (id)objc_opt_class();
        id v20 = v37;
        LODWORD(v33) = 12;
        v32 = &v36;
        id v6 = (id)_os_log_send_and_compose_impl();

        if (!v6)
        {
          v4 = 0;
          id v7 = 0;
          goto LABEL_39;
        }
        v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v36, v33);
        free(v6);
        v32 = (int *)v19;
        SSFileLog();
      }

      v4 = 0;
      id v7 = 0;
      id v6 = 0;
    }
LABEL_39:

    goto LABEL_40;
  }
  v4 = 0;
  id v7 = 0;
  id v6 = 0;
LABEL_40:
  v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v27 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v28 = v27 | 2;
  }
  else {
    int v28 = v27;
  }
  objc_super v14 = [v9 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v28 &= 2u;
  }
  if (v28)
  {
    v29 = objc_opt_class();
    int v36 = 138412290;
    id v37 = v29;
    id v30 = v29;
    LODWORD(v33) = 12;
    v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15) {
      goto LABEL_52;
    }
    objc_super v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v36, v33);
    free(v15);
    SSFileLog();
  }
  v15 = 0;
LABEL_51:

LABEL_52:

  return v15;
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v4 = a3;
  char v5 = [v4 objectForKey:kISFailureTypeKey];
  id v6 = [v4 objectForKey:@"rental-bag-response"];
  id v7 = v6;
  if (v5)
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    objc_super v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v45 = 138412546;
      id v46 = (id)objc_opt_class();
      __int16 v47 = 2112;
      id v48 = v5;
      id v12 = v46;
      LODWORD(v43) = 22;
      v42 = &v45;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 intValue] == 5102)
        {
          objc_super v14 = ISError();
          v15 = [v14 errorBySettingFatalError:1];
        }
        else
        {
          v15 = ISError();
        }
        goto LABEL_33;
      }
      objc_super v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v45, v43);
      free(v13);
      v42 = (int *)v11;
      SSFileLog();
    }

    goto LABEL_13;
  }
  if (!v6)
  {
    unsigned int v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      unsigned int v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    id v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      v29 &= 2u;
    }
    if (v29)
    {
      int v45 = 138412290;
      id v46 = (id)objc_opt_class();
      id v31 = v46;
      LODWORD(v43) = 12;
      v42 = &v45;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32)
      {
LABEL_45:

LABEL_46:
        v15 = 0;
        goto LABEL_47;
      }
      id v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v45, v43);
      free(v32);
      v42 = (int *)v30;
      SSFileLog();
    }

    goto LABEL_45;
  }
  if (!sub_10002E5AC(v6)) {
    goto LABEL_21;
  }
  v16 = [v4 objectForKey:@"device-diversity"];
  v15 = v16;
  if (v16)
  {
    BOOL v17 = sub_10002E704(v16);

    if (!v17)
    {
LABEL_21:
      int v18 = +[SSLogConfig sharedDaemonConfig];
      if (!v18)
      {
        int v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      unsigned int v21 = [v18 OSLogObject];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        v20 &= 2u;
      }
      if (v20)
      {
        int v45 = 138412290;
        id v46 = (id)objc_opt_class();
        id v22 = v46;
        LODWORD(v43) = 12;
        v42 = &v45;
        v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23)
        {
LABEL_32:

          v24 = ISError();
          id v25 = +[NSNumber numberWithBool:1];
          v15 = SSErrorBySettingUserInfoValue();

LABEL_33:
          BOOL v26 = 0;
          goto LABEL_48;
        }
        unsigned int v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v45, v43);
        free(v23);
        v42 = (int *)v21;
        SSFileLog();
      }

      goto LABEL_32;
    }
    goto LABEL_46;
  }
LABEL_47:
  BOOL v26 = 1;
LABEL_48:
  uint64_t v33 = +[SSLogConfig sharedWriteToDiskConfig];
  if (!v33)
  {
    uint64_t v33 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = [v33 shouldLog];
  if ([v33 shouldLogToDisk]) {
    int v35 = v34 | 2;
  }
  else {
    int v35 = v34;
  }
  int v36 = [v33 OSLogObject];
  if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
    v35 &= 2u;
  }
  if (v35)
  {
    id v37 = objc_opt_class();
    int v45 = 138412546;
    id v46 = v37;
    __int16 v47 = 2112;
    id v48 = v4;
    id v38 = v37;
    LODWORD(v43) = 22;
    v39 = (void *)_os_log_send_and_compose_impl();

    v40 = a4;
    if (!v39) {
      goto LABEL_60;
    }
    int v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v45, v43);
    free(v39);
    SSFileLog();
  }
  else
  {
    v40 = a4;
  }

LABEL_60:
  if (v40) {
    id *v40 = v15;
  }

  return v26;
}

- (void)_run
{
  id v3 = [(SyncRentalOperation *)self _bodyData];
  if (!v3)
  {
    ISError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = 0;
    goto LABEL_18;
  }
  id v4 = objc_alloc_init((Class)ISStoreURLOperation);
  id v27 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountIdentifier];
  objc_msgSend(v4, "setAuthenticationContext:");
  char v5 = objc_alloc_init(DaemonProtocolDataProvider);
  [v4 setDataProvider:v5];
  [(DaemonProtocolDataProvider *)v5 setShouldProcessDialogs:0];
  id v6 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v6 setCachePolicy:1];
  id v7 = [(SyncRentalOperation *)self clientIdentifierHeader];
  [v6 setClientIdentifier:v7];

  [v6 setHTTPBody:v3];
  [v6 setHTTPMethod:@"POST"];
  [v6 setURLBagKey:@"rental-sync"];
  id v8 = [(SyncRentalOperation *)self userAgent];
  [v6 setValue:v8 forHTTPHeaderField:SSHTTPHeaderUserAgent];

  [v4 setRequestProperties:v6];
  unsigned int v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    unsigned int v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (!v13) {
    goto LABEL_13;
  }
  int v30 = 138412290;
  id v31 = (id)objc_opt_class();
  id v14 = v31;
  LODWORD(v25) = 12;
  v24 = &v30;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v30, v25);
    free(v15);
    v24 = (int *)v12;
    SSFileLog();
LABEL_13:
  }
  id v29 = 0;
  id v16 = [(SyncRentalOperation *)self runSubOperation:v4 returningError:&v29];
  id v17 = v29;
  if (v16)
  {
    int v18 = [(DaemonProtocolDataProvider *)v5 output];
    id v28 = v17;
    id v16 = (id)[(SyncRentalOperation *)self _handleResponse:v18 error:&v28];
    id v26 = v28;

    unsigned int v19 = +[NSPropertyListSerialization dataWithPropertyList:v18 format:100 options:0 error:0];
    [(SyncRentalOperation *)self lock];
    id v20 = objc_alloc((Class)SSURLConnectionResponse);
    unsigned int v21 = [v4 response];
    id v22 = (SSURLConnectionResponse *)[v20 initWithURLResponse:v21 bodyData:v19];
    URLResponse = self->_URLResponse;
    self->_URLResponse = v22;

    [(SyncRentalOperation *)self unlock];
    id v17 = v26;
  }

LABEL_18:
  -[SyncRentalOperation setError:](self, "setError:", v17, v24);
  [(SyncRentalOperation *)self setSuccess:v16];
}

- (NSArray)sinfs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)clientIdentifierHeader
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setClientIdentifierHeader:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (SSURLConnectionResponse)URLResponse
{
  return (SSURLConnectionResponse *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_sinfs, 0);
}

@end