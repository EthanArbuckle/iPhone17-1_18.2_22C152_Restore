@interface CheckinRentalOperation
- (BOOL)_handleCheckinAckResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_runCheckinAckOperationWithResponseData:(id)a3 error:(id *)a4;
- (CheckinRentalOperation)init;
- (CheckinRentalOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (CheckinRentalOperation)initWithCheckinRequest:(id)a3;
- (CheckinRentalOperation)initWithSinfs:(id)a3;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (id)_bodyData;
- (id)_bodyDataWithCheckinAckResponseData:(id)a3;
- (void)_run;
- (void)dealloc;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CheckinRentalOperation

- (CheckinRentalOperation)init
{
  return [(CheckinRentalOperation *)self initWithAccountIdentifier:0 rentalKeyIdentifier:0];
}

- (CheckinRentalOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  if (![a3 unsignedLongLongValue] || !objc_msgSend(a4, "unsignedLongLongValue")) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CheckinRentalOperation.m" lineNumber:55 description:@"Must have account and rental key identifier"];
  }
  v10.receiver = self;
  v10.super_class = (Class)CheckinRentalOperation;
  v8 = [(CheckinRentalOperation *)&v10 init];
  if (v8)
  {
    v8->_accountIdentifier = (NSNumber *)[a3 copy];
    v8->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
  }
  return v8;
}

- (CheckinRentalOperation)initWithSinfs:(id)a3
{
  if (![a3 count]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CheckinRentalOperation.m" lineNumber:64 description:@"Must have sinfs"];
  }
  v10.receiver = self;
  v10.super_class = (Class)CheckinRentalOperation;
  v6 = [(CheckinRentalOperation *)&v10 init];
  if (v6)
  {
    v7 = (NSArray *)[a3 copy];
    v6->_sinfs = v7;
    if (v7)
    {
      v8 = [[SinfsArray alloc] initWithSINFs:v6->_sinfs];
      v6->_accountIdentifier = (NSNumber *)[(SinfsArray *)v8 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0];
      v6->_rentalKeyIdentifier = (NSNumber *)[(SinfsArray *)v8 copyValueForProperty:@"SinfPropertyFairPlayKeyIdentifier" error:0];
    }
  }
  return v6;
}

- (CheckinRentalOperation)initWithCheckinRequest:(id)a3
{
  id v5 = [a3 accountIdentifier];
  id v6 = [a3 rentalKeyIdentifier];
  id v7 = [a3 sinfs];
  if (v5 && v6)
  {
    return [(CheckinRentalOperation *)self initWithAccountIdentifier:v5 rentalKeyIdentifier:v6];
  }
  else if (v7)
  {
    return [(CheckinRentalOperation *)self initWithSinfs:v7];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CheckinRentalOperation;
  [(CheckinRentalOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountIdentifier;

  return v2;
}

- (NSString)clientIdentifierHeader
{
  [(CheckinRentalOperation *)self lock];
  objc_super v3 = self->_clientIdentifierHeader;
  [(CheckinRentalOperation *)self unlock];
  return v3;
}

- (NSNumber)rentalKeyIdentifier
{
  v2 = self->_rentalKeyIdentifier;

  return v2;
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(CheckinRentalOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  [(CheckinRentalOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  [(CheckinRentalOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(CheckinRentalOperation *)self unlock];
}

- (SSURLConnectionResponse)URLResponse
{
  [(CheckinRentalOperation *)self lock];
  objc_super v3 = self->_urlResponse;
  [(CheckinRentalOperation *)self unlock];
  return v3;
}

- (NSString)userAgent
{
  [(CheckinRentalOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(CheckinRentalOperation *)self unlock];

  return v3;
}

- (void)run
{
}

- (id)_bodyData
{
  if (![(NSNumber *)self->_accountIdentifier unsignedLongLongValue]
    || ![(NSNumber *)self->_rentalKeyIdentifier unsignedLongLongValue])
  {
LABEL_28:
    v4 = 0;
    id v32 = 0;
    id v33 = 0;
    goto LABEL_29;
  }
  id v3 = sub_10002D778();
  if (!v3)
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v34 = 138412290;
      uint64_t v35 = objc_opt_class();
      LODWORD(v31) = 12;
      v30 = &v34;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v34, v31);
        free(v16);
        v30 = (int *)v17;
        SSFileLog();
      }
    }
    goto LABEL_28;
  }
  v4 = v3;
  id v32 = 0;
  id v33 = 0;
  if ((sub_10002D9F0(&v33, &v32) & 1) == 0)
  {
    id v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23) {
      id v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = [v23 shouldLog];
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    if (!os_log_type_enabled((os_log_t)[v23 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v25 &= 2u;
    }
    if (v25)
    {
      uint64_t v26 = objc_opt_class();
      int v34 = 138412290;
      uint64_t v35 = v26;
      LODWORD(v31) = 12;
      v30 = &v34;
      uint64_t v27 = _os_log_send_and_compose_impl();
      if (v27)
      {
        v28 = (void *)v27;
        v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v34, v31);
        free(v28);
        v30 = (int *)v29;
        SSFileLog();
      }
    }
LABEL_29:
    id v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18) {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      uint64_t v21 = objc_opt_class();
      int v34 = 138412290;
      uint64_t v35 = v21;
      LODWORD(v31) = 12;
      v11 = (NSData *)_os_log_send_and_compose_impl();
      if (!v11) {
        goto LABEL_40;
      }
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v34, v31);
      free(v11);
      SSFileLog();
    }
    v11 = 0;
    goto LABEL_40;
  }
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = v5;
  if (v33) {
    [v5 setObject:v33 forKey:@"device-diversity"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v6 setObject:accountIdentifier forKey:@"dsid"];
  }
  id v8 = [+[ISDevice sharedInstance] guid];
  if (v8) {
    [v6 setObject:v8 forKey:@"guid"];
  }
  id v9 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
  if (v9) {
    [v6 setObject:v9 forKey:@"hw.model"];
  }
  if (v32) {
    [v6 setObject:v32 forKey:@"rbsync"];
  }
  [v6 setObject:v4 forKey:@"rental-bag"];
  rentalKeyIdentifier = self->_rentalKeyIdentifier;
  if (rentalKeyIdentifier) {
    [v6 setObject:rentalKeyIdentifier forKey:@"rental-id"];
  }
  v11 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:0];

LABEL_40:
  return v11;
}

- (id)_bodyDataWithCheckinAckResponseData:(id)a3
{
  if ([(NSNumber *)self->_accountIdentifier unsignedLongLongValue]
    && [(NSNumber *)self->_rentalKeyIdentifier unsignedLongLongValue]
    && [a3 length])
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = v5;
    if (a3) {
      [v5 setObject:a3 forKey:@"checkin-ack-sar"];
    }
    accountIdentifier = self->_accountIdentifier;
    if (accountIdentifier) {
      [v6 setObject:accountIdentifier forKey:@"dsid"];
    }
    id v8 = [+[ISDevice sharedInstance] guid];
    if (v8) {
      [v6 setObject:v8 forKey:@"guid"];
    }
    id v9 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
    if (v9) {
      [v6 setObject:v9 forKey:@"hw.model"];
    }
    rentalKeyIdentifier = self->_rentalKeyIdentifier;
    if (rentalKeyIdentifier) {
      [v6 setObject:rentalKeyIdentifier forKey:@"rental-id"];
    }
    v11 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:0];

    return v11;
  }
  else
  {
    id v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class();
      LODWORD(v18) = 12;
      uint64_t v16 = _os_log_send_and_compose_impl();
      if (v16)
      {
        v17 = (void *)v16;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v19, v18);
        free(v17);
        SSFileLog();
      }
    }
    return 0;
  }
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  unsigned int v24 = 0;
  id v7 = [a3 objectForKey:kISFailureTypeKey];
  if (v7)
  {
    id v8 = v7;
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)int v25 = 138412546;
      *(void *)&v25[4] = objc_opt_class();
      __int16 v26 = 2112;
      uint64_t v27 = v8;
      LODWORD(v23) = 22;
      v22 = (NSString *)v25;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        id v13 = (void *)v12;
        unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v25, v23);
        free(v13);
        v22 = v14;
        SSFileLog();
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v20 = (id)ISError();
      goto LABEL_22;
    }
    [v8 intValue];
    int v15 = (void *)SSError();
  }
  else
  {
    *(void *)int v25 = 0;
    id v16 = [a3 objectForKey:@"rental-bag-response"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [a3 objectForKey:@"checkin-sar"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && sub_10002E628(v16, v17))
      {
        unsigned __int8 v18 = [(CheckinRentalOperation *)self _runCheckinAckOperationWithResponseData:*(void *)v25 error:&v24];

        if (v18)
        {
          BOOL result = 1;
          goto LABEL_23;
        }
      }
    }
    int v15 = (void *)ISError();
  }
  id v20 = objc_msgSend(v15, "errorBySettingFatalError:", 1, v22);
LABEL_22:
  id v21 = v20;
  BOOL result = 0;
  unsigned int v24 = v21;
LABEL_23:
  if (a4) {
    *a4 = v24;
  }
  return result;
}

- (BOOL)_handleCheckinAckResponse:(id)a3 error:(id *)a4
{
  id v5 = [a3 objectForKey:kISFailureTypeKey];
  id v6 = v5;
  if (v5)
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
      int v14 = 138412546;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2112;
      id v17 = v6;
      LODWORD(v13) = 22;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        int v11 = (void *)v10;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v14, v13);
        free(v11);
        SSFileLog();
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v5 = (id)ISError();
      if (!a4) {
        return v6 == 0;
      }
      goto LABEL_15;
    }
    id v5 = [(id)ISError() errorBySettingFatalError:1];
  }
  if (a4) {
LABEL_15:
  }
    *a4 = v5;
  return v6 == 0;
}

- (void)_run
{
  uint64_t v20 = 0;
  id v3 = [(CheckinRentalOperation *)self _bodyData];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)ISStoreURLOperation);
    id v5 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountIdentifier];
    [v4 setAuthenticationContext:v5];

    id v6 = objc_alloc_init(DaemonProtocolDataProvider);
    [v4 setDataProvider:v6];
    [(DaemonProtocolDataProvider *)v6 setShouldProcessDialogs:0];
    id v7 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    [v7 setCachePolicy:1];
    objc_msgSend(v7, "setClientIdentifier:", -[CheckinRentalOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
    [v7 setHTTPBody:v3];
    [v7 setHTTPMethod:@"POST"];
    [v7 setURLBagKey:@"rental-checkin"];
    unsigned int v8 = [(CheckinRentalOperation *)self userAgent];
    [v7 setValue:v8 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    [v4 setRequestProperties:v7];

    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v21 = 138412290;
      uint64_t v22 = objc_opt_class();
      LODWORD(v19) = 12;
      unsigned __int8 v18 = &v21;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v21, v19);
        free(v13);
        unsigned __int8 v18 = (int *)v14;
        SSFileLog();
      }
    }
    if (-[CheckinRentalOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v4, &v20, v18))
    {
      id v15 = [(DaemonProtocolDataProvider *)v6 output];
      id v3 = (id)[(CheckinRentalOperation *)self _handleResponse:v15 error:&v20];
      __int16 v16 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:100 options:0 error:0];
      [(CheckinRentalOperation *)self lock];

      self->_urlResponse = (SSURLConnectionResponse *)objc_msgSend(objc_alloc((Class)SSURLConnectionResponse), "initWithURLResponse:bodyData:", objc_msgSend(v4, "response"), v16);
      [(CheckinRentalOperation *)self unlock];
    }
    else
    {
      id v3 = 0;
    }

    uint64_t v17 = v20;
  }
  else
  {
    uint64_t v17 = ISError();
    uint64_t v20 = v17;
  }
  [(CheckinRentalOperation *)self setError:v17];
  [(CheckinRentalOperation *)self setSuccess:v3];
}

- (BOOL)_runCheckinAckOperationWithResponseData:(id)a3 error:(id *)a4
{
  uint64_t v23 = 0;
  id v6 = [(CheckinRentalOperation *)self _bodyDataWithCheckinAckResponseData:a3];
  if (!v6)
  {
    BOOL v19 = 0;
    uint64_t v23 = (void *)ISError();
    if (!a4) {
      return v19;
    }
    goto LABEL_18;
  }
  id v7 = v6;
  id v8 = objc_alloc_init((Class)ISStoreURLOperation);
  id v9 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountIdentifier];
  [v8 setAuthenticationContext:v9];

  unsigned int v10 = objc_alloc_init(DaemonProtocolDataProvider);
  [v8 setDataProvider:v10];
  [(DaemonProtocolDataProvider *)v10 setShouldProcessDialogs:0];
  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v11 setCachePolicy:1];
  objc_msgSend(v11, "setClientIdentifier:", -[CheckinRentalOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  [v11 setHTTPBody:v7];
  [v11 setHTTPMethod:@"POST"];
  [v11 setURLBagKey:@"rental-ack-checkin"];
  uint64_t v12 = [(CheckinRentalOperation *)self userAgent];
  [v11 setValue:v12 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  [v8 setRequestProperties:v11];

  id v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v24 = 138412290;
    uint64_t v25 = objc_opt_class();
    LODWORD(v22) = 12;
    int v21 = &v24;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      unsigned __int8 v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v24, v22);
      free(v17);
      int v21 = (int *)v18;
      SSFileLog();
    }
  }
  if (-[CheckinRentalOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v8, &v23, v21))BOOL v19 = [(CheckinRentalOperation *)self _handleCheckinAckResponse:[(DaemonProtocolDataProvider *)v10 output] error:&v23]; {
  else
  }
    BOOL v19 = 0;

  if (a4) {
LABEL_18:
  }
    *a4 = v23;
  return v19;
}

@end