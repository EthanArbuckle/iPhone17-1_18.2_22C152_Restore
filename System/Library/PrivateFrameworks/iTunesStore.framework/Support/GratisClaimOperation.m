@interface GratisClaimOperation
- (BOOL)suppressesErrorDialogs;
- (GratisClaimOperation)initWithPurchase:(id)a3;
- (GratisClaimOperation)initWithRequestBody:(id)a3;
- (NSData)clientAuditTokenData;
- (NSDictionary)rawOutput;
- (NSString)authenticationReasonDescription;
- (SSURLConnectionResponse)URLResponse;
- (id)_accountID;
- (id)_authenticationContext;
- (id)_bodyData;
- (id)_newDefaultRequestProperties;
- (id)_newRetryRequestPropertiesWithURL:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)run;
- (void)setAuthenticationReasonDescription:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setSuppressesErrorDialogs:(BOOL)a3;
@end

@implementation GratisClaimOperation

- (GratisClaimOperation)initWithPurchase:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GratisClaimOperation;
  v4 = [(GratisClaimOperation *)&v10 init];
  if (v4)
  {
    v4->_accountID = (NSNumber *)[a3 accountIdentifier];
    v4->_defaultRequestProperties = (SSURLRequestProperties *)[a3 requestProperties];
    v4->_suppressesErrorDialogs = objc_msgSend(objc_msgSend(a3, "valueForDownloadProperty:", SSDownloadPropertyShouldSuppressErrorDialogs), "BOOLValue");
    v5 = (SSVGratisRequestBody *)[objc_alloc((Class)SSVGratisRequestBody) initWithRequestStyle:1];
    v4->_requestBody = v5;
    [(SSVGratisRequestBody *)v5 setAccountIdentifier:v4->_accountID];
    id v6 = [a3 gratisIdentifiers];
    if ([v6 count])
    {
      [v6 objectAtIndex:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      requestBody = v4->_requestBody;
      if (isKindOfClass) {
        [(SSVGratisRequestBody *)requestBody setItemIdentifiers:v6];
      }
      else {
        [(SSVGratisRequestBody *)requestBody setBundleIdentifiers:v6];
      }
    }
  }
  return v4;
}

- (GratisClaimOperation)initWithRequestBody:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GratisClaimOperation;
  v4 = [(GratisClaimOperation *)&v6 init];
  if (v4)
  {
    v4->_accountID = (NSNumber *)objc_msgSend(objc_msgSend(a3, "accountIdentifier"), "copy");
    v4->_requestBody = (SSVGratisRequestBody *)[a3 copy];
    v4->_suppressesErrorDialogs = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GratisClaimOperation;
  [(GratisClaimOperation *)&v3 dealloc];
}

- (NSString)authenticationReasonDescription
{
  [(GratisClaimOperation *)self lock];
  objc_super v3 = self->_authenticationReasonDescription;
  [(GratisClaimOperation *)self unlock];

  return v3;
}

- (NSData)clientAuditTokenData
{
  [(GratisClaimOperation *)self lock];
  objc_super v3 = self->_clientAuditTokenData;
  [(GratisClaimOperation *)self unlock];

  return v3;
}

- (NSDictionary)rawOutput
{
  [(GratisClaimOperation *)self lock];
  objc_super v3 = self->_rawOutput;
  [(GratisClaimOperation *)self unlock];

  return v3;
}

- (void)setAuthenticationReasonDescription:(id)a3
{
  [(GratisClaimOperation *)self lock];
  authenticationReasonDescription = self->_authenticationReasonDescription;
  if (authenticationReasonDescription != a3)
  {

    self->_authenticationReasonDescription = (NSString *)[a3 copy];
  }

  [(GratisClaimOperation *)self unlock];
}

- (void)setClientAuditTokenData:(id)a3
{
  [(GratisClaimOperation *)self lock];
  clientAuditTokenData = self->_clientAuditTokenData;
  if (clientAuditTokenData != a3)
  {

    self->_clientAuditTokenData = (NSData *)a3;
  }

  [(GratisClaimOperation *)self unlock];
}

- (void)setSuppressesErrorDialogs:(BOOL)a3
{
  [(GratisClaimOperation *)self lock];
  self->_suppressesErrorDialogs = a3;

  [(GratisClaimOperation *)self unlock];
}

- (BOOL)suppressesErrorDialogs
{
  [(GratisClaimOperation *)self lock];
  BOOL suppressesErrorDialogs = self->_suppressesErrorDialogs;
  [(GratisClaimOperation *)self unlock];
  return suppressesErrorDialogs;
}

- (SSURLConnectionResponse)URLResponse
{
  [(GratisClaimOperation *)self lock];
  objc_super v3 = self->_urlResponse;
  [(GratisClaimOperation *)self unlock];

  return v3;
}

- (void)run
{
  id v3 = [(GratisClaimOperation *)self _newDefaultRequestProperties];
  v4 = &syslog_ptr;
  p_cache = AppReceiptController.cache;
  objc_super v6 = &syslog_ptr;
  do
  {
    id v7 = objc_alloc_init((Class)v4[263]);
    [v7 setDelegate:self];
    [v7 setShouldSendXTokenHeader:1];
    id v8 = [(GratisClaimOperation *)self _authenticationContext];
    [v7 setAuthenticationContext:v8];
    id v9 = [p_cache + 28 provider];
    [v9 setAuthenticationContext:v8];
    [v7 setDataProvider:v9];
    [v7 setRequestProperties:v3];
    id v10 = [v6[405] sharedDaemonConfig];
    if (!v10) {
      id v10 = [v6[405] sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      requestBody = self->_requestBody;
      *(_DWORD *)v33 = 138412546;
      *(void *)&v33[4] = v12;
      __int16 v34 = 2112;
      v35 = requestBody;
      LODWORD(v30) = 22;
      v29 = (NSString *)v33;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v33, v30);
        free(v15);
        v29 = v16;
        SSFileLog();
      }
    }
    *(void *)v33 = 0;
    id v17 = -[GratisClaimOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, v33, v29);
    id v18 = [v9 redirectedClaimURL];
    if (v18)
    {

      id v3 = [(GratisClaimOperation *)self _newRetryRequestPropertiesWithURL:v18];
    }
    else
    {
      [(GratisClaimOperation *)self lock];
      id v19 = [v9 output];
      if (v19)
      {
        v20 = v19;
        v31 = +[NSPropertyListSerialization dataWithPropertyList:v19 format:100 options:0 error:0];
        self->_rawOutput = (NSDictionary *)v20;
        id v21 = v3;
        v22 = v6;
        v23 = p_cache;
        v24 = v4;
        id v25 = objc_alloc((Class)SSURLConnectionResponse);
        id v26 = [v7 response];
        v27 = v25;
        v4 = v24;
        p_cache = v23;
        objc_super v6 = v22;
        id v3 = v21;
        self->_urlResponse = (SSURLConnectionResponse *)[v27 initWithURLResponse:v26 bodyData:v31];
        id v28 = [v20 objectForKey:@"duAnonymousPings"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          +[PurchaseOperation reportAnonymousPings:v28];
        }
      }
      [(GratisClaimOperation *)self unlock];
      [(GratisClaimOperation *)self setError:*(void *)v33];
      [(GratisClaimOperation *)self setSuccess:v17];
    }
    [v7 setDelegate:0];
  }
  while (v18);
}

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
  [(GratisClaimOperation *)self lock];

  self->_accountID = (NSNumber *)[a4 copy];
  [(GratisClaimOperation *)self unlock];
  id v7 = [(GratisClaimOperation *)self _authenticationContext];
  objc_msgSend(objc_msgSend(a3, "dataProvider"), "setAuthenticationContext:", v7);
  [a3 setAuthenticationContext:v7];
  id v8 = [a3 _requestProperties];
  id v9 = [(GratisClaimOperation *)self _bodyData];

  [v8 setHTTPBody:v9];
}

- (id)_accountID
{
  [(GratisClaimOperation *)self lock];
  id v3 = self->_accountID;
  [(GratisClaimOperation *)self unlock];
  if (v3) {
    return v3;
  }
  id v3 = (NSNumber *)[(SSVGratisRequestBody *)self->_requestBody accountIdentifier];
  if (v3) {
    return v3;
  }
  id v5 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");

  return [v5 uniqueIdentifier];
}

- (id)_authenticationContext
{
  id v3 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccountIdentifier:", -[GratisClaimOperation _accountID](self, "_accountID"));
  if ([(GratisClaimOperation *)self suppressesErrorDialogs])
  {
    [v3 setPromptStyle:1000];
    [v3 setShouldSuppressDialogs:1];
  }
  objc_msgSend(v3, "setReasonDescription:", -[GratisClaimOperation authenticationReasonDescription](self, "authenticationReasonDescription"));
  id v4 = [(SSURLRequestProperties *)self->_defaultRequestProperties HTTPHeaders];
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", objc_msgSend(v4, "objectForKey:", SSHTTPHeaderUserAgent), SSHTTPHeaderUserAgent);

  return v3;
}

- (id)_bodyData
{
  id v3 = [(SSVGratisRequestBody *)self->_requestBody copy];
  id v4 = [(GratisClaimOperation *)self _accountID];
  [v3 setAccountIdentifier:v4];
  if (v4)
  {
    CFDataRef v5 = sub_10002D24C((uint64_t)[v4 unsignedLongLongValue], 1);
    id v6 = [(__CFData *)v5 base64EncodedStringWithOptions:0];
    if (v6) {
      [v3 setValue:v6 forBodyParameter:@"kbsync"];
    }
  }
  id v7 = [v3 propertyListBodyData];

  return v7;
}

- (id)_newDefaultRequestProperties
{
  id v3 = [(SSURLRequestProperties *)self->_defaultRequestProperties mutableCopy];
  if (!v3) {
    id v3 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  }
  [v3 setAllowedRetryCount:0];
  objc_msgSend(v3, "setClientAuditTokenData:", -[GratisClaimOperation clientAuditTokenData](self, "clientAuditTokenData"));
  [v3 setITunesStoreRequest:1];
  objc_msgSend(v3, "setHTTPBody:", -[GratisClaimOperation _bodyData](self, "_bodyData"));
  [v3 setHTTPMethod:@"POST"];
  [v3 setURLBagKey:@"up-to-date-claim"];
  [v3 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  id v4 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "thinnedApplicationVariantIdentifier");
  if (v4) {
    [v3 setValue:v4 forHTTPHeaderField:SSHTTPHeaderXAppleTADevice];
  }
  return v3;
}

- (id)_newRetryRequestPropertiesWithURL:(id)a3
{
  id v4 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:a3];
  [v4 setAllowedRetryCount:0];
  objc_msgSend(v4, "setHTTPHeaders:", -[SSURLRequestProperties HTTPHeaders](self->_defaultRequestProperties, "HTTPHeaders"));
  [v4 setITunesStoreRequest:1];
  return v4;
}

@end