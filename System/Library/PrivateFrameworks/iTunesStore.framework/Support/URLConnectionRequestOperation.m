@interface URLConnectionRequestOperation
- (BOOL)_shouldSendMachineDataHeadersForProperties:(id)a3;
- (BOOL)sendsResponseForHTTPFailures;
- (BOOL)shouldMescalSign;
- (NSURL)destinationFileURL;
- (SSAuthenticationContext)authenticationContext;
- (SSURLConnectionResponse)URLResponse;
- (SSURLRequestProperties)requestProperties;
- (URLConnectionRequestOperation)initWithRequestProperties:(id)a3;
- (id)_accountIdentifier;
- (id)_metricsPageEventWithResponse:(id)a3 performance:(id)a4;
- (id)_newStoreURLOperationWithProperties:(id)a3;
- (void)_addKBSyncDataToRequestProperties:(id)a3 forAccountID:(id)a4;
- (void)_importKeybagFromDictionary:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setDestinationFileURL:(id)a3;
- (void)setSendsResponseForHTTPFailures:(BOOL)a3;
- (void)setShouldMescalSign:(BOOL)a3;
@end

@implementation URLConnectionRequestOperation

- (URLConnectionRequestOperation)initWithRequestProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)URLConnectionRequestOperation;
  v4 = [(URLConnectionRequestOperation *)&v6 init];
  if (v4) {
    v4->_properties = (SSURLRequestProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)URLConnectionRequestOperation;
  [(URLConnectionRequestOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(URLConnectionRequestOperation *)self lock];
  objc_super v3 = self->_authenticationContext;
  [(URLConnectionRequestOperation *)self unlock];
  return v3;
}

- (NSURL)destinationFileURL
{
  [(URLConnectionRequestOperation *)self lock];
  objc_super v3 = (NSURL *)[(NSURL *)self->_destinationFileURL copy];
  [(URLConnectionRequestOperation *)self unlock];
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  v2 = self->_properties;

  return v2;
}

- (BOOL)sendsResponseForHTTPFailures
{
  [(URLConnectionRequestOperation *)self lock];
  BOOL sendsResponseForHTTPFailures = self->_sendsResponseForHTTPFailures;
  [(URLConnectionRequestOperation *)self unlock];
  return sendsResponseForHTTPFailures;
}

- (void)setAuthenticationContext:(id)a3
{
  [(URLConnectionRequestOperation *)self lock];
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  [(URLConnectionRequestOperation *)self unlock];
}

- (void)setDestinationFileURL:(id)a3
{
  [(URLConnectionRequestOperation *)self lock];
  destinationFileURL = self->_destinationFileURL;
  if (destinationFileURL != a3)
  {

    self->_destinationFileURL = (NSURL *)[a3 copy];
  }

  [(URLConnectionRequestOperation *)self unlock];
}

- (void)setSendsResponseForHTTPFailures:(BOOL)a3
{
  [(URLConnectionRequestOperation *)self lock];
  self->_BOOL sendsResponseForHTTPFailures = a3;

  [(URLConnectionRequestOperation *)self unlock];
}

- (void)setShouldMescalSign:(BOOL)a3
{
  [(URLConnectionRequestOperation *)self lock];
  self->_shouldMescalSign = a3;

  [(URLConnectionRequestOperation *)self unlock];
}

- (BOOL)shouldMescalSign
{
  [(URLConnectionRequestOperation *)self lock];
  BOOL shouldMescalSign = self->_shouldMescalSign;
  [(URLConnectionRequestOperation *)self unlock];
  return shouldMescalSign;
}

- (SSURLConnectionResponse)URLResponse
{
  [(URLConnectionRequestOperation *)self lock];
  objc_super v3 = self->_response;
  [(URLConnectionRequestOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v20 = 0;
  objc_super v3 = [(URLConnectionRequestOperation *)self destinationFileURL];
  v4 = v3;
  if (!v3)
  {
    v7 = self->_properties;
    goto LABEL_6;
  }
  unsigned int v5 = [(NSURL *)v3 isFileURL];
  objc_super v6 = self->_properties;
  v7 = v6;
  if (!v5)
  {
LABEL_6:
    int v8 = 0;
    goto LABEL_7;
  }
  if ([(SSURLRequestProperties *)v6 shouldDecodeResponse])
  {
    int v8 = 1;
  }
  else
  {
    id v18 = [(SSURLRequestProperties *)v7 mutableCopy];
    int v8 = 1;
    [v18 setShouldDecodeResponse:1];

    v7 = (SSURLRequestProperties *)v18;
  }
LABEL_7:
  if (([(SSURLRequestProperties *)v7 isITunesStoreRequest] & 1) != 0
    || [(URLConnectionRequestOperation *)self shouldMescalSign])
  {
    id v9 = [(URLConnectionRequestOperation *)self _newStoreURLOperationWithProperties:v7];
    if (!v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v9 = objc_alloc_init((Class)ISURLOperation);
  objc_msgSend(v9, "setDataProvider:", +[ISDataProvider provider](ISDataProvider, "provider"));
  [v9 setRequestProperties:v7];
  if (v8)
  {
LABEL_10:
    v10 = [(NSURL *)v4 path];
    id v11 = objc_alloc_init((Class)NSFileManager);
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSString stringByDeletingLastPathComponent](v10, "stringByDeletingLastPathComponent"), 1, 0, 0);

    id v12 = +[ISHashedDownloadProvider provider];
    [v12 setLocalFilePath:v10];
    [v9 setDataProvider:v12];
  }
LABEL_11:
  [v9 setDelegate:self];
  objc_msgSend(v9, "_setLoadsHTTPFailures:", -[URLConnectionRequestOperation sendsResponseForHTTPFailures](self, "sendsResponseForHTTPFailures"));
  [v9 setTracksPerformanceMetrics:1];
  id v13 = [(URLConnectionRequestOperation *)self runSubOperation:v9 returningError:&v20];
  id v14 = [v9 response];
  if (v13)
  {
    id v15 = v14;
    v16 = (NSData *)objc_msgSend(objc_msgSend(v9, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(SSURLRequestProperties *)v7 isITunesStoreRequest]
        && [(SSURLRequestProperties *)v7 KBSyncType])
      {
        [(URLConnectionRequestOperation *)self _importKeybagFromDictionary:v16];
      }
      v16 = +[NSPropertyListSerialization dataWithPropertyList:v16 format:100 options:0 error:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(SSURLRequestProperties *)v7 isITunesStoreRequest])
        {
          if ([(SSURLRequestProperties *)v7 KBSyncType])
          {
            id v17 = objc_msgSend(+[SSVURLProtocolConsumer consumer](SSVURLProtocolConsumer, "consumer"), "objectForData:response:error:", v16, v15, 0);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(URLConnectionRequestOperation *)self _importKeybagFromDictionary:v17];
            }
          }
        }
      }
      else
      {
        v16 = 0;
      }
    }
    [(URLConnectionRequestOperation *)self lock];

    v19 = (SSURLConnectionResponse *)[objc_alloc((Class)SSURLConnectionResponse) initWithURLResponse:v15 bodyData:v16];
    self->_response = v19;
    -[SSURLConnectionResponse setMetricsPageEvent:](v19, "setMetricsPageEvent:", -[URLConnectionRequestOperation _metricsPageEventWithResponse:performance:](self, "_metricsPageEventWithResponse:performance:", v15, [v9 performanceMetrics]));
    [(URLConnectionRequestOperation *)self unlock];
  }

  [v9 setDelegate:0];
  [(URLConnectionRequestOperation *)self setError:v20];
  [(URLConnectionRequestOperation *)self setSuccess:v13];
}

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
  id v6 = [a3 _requestProperties];

  [(URLConnectionRequestOperation *)self _addKBSyncDataToRequestProperties:v6 forAccountID:a4];
}

- (id)_accountIdentifier
{
  id result = [(SSAuthenticationContext *)[(URLConnectionRequestOperation *)self authenticationContext] requiredUniqueIdentifier];
  if (!result)
  {
    id v3 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
    return [v3 uniqueIdentifier];
  }
  return result;
}

- (void)_addKBSyncDataToRequestProperties:(id)a3 forAccountID:(id)a4
{
  id v6 = [a3 KBSyncType];
  if (a4 && v6)
  {
    if (v6 == (id)2) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 9;
    }
    CFDataRef v8 = sub_10002D24C((uint64_t)[a4 unsignedLongLongValue], v7);
    if ([(__CFData *)v8 length])
    {
      [(__CFData *)v8 bytes];
      [(__CFData *)v8 length];
      uint64_t v9 = ISCopyEncodedBase64();
      if (v9)
      {
        v10 = (void *)v9;
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
        if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_INFO)) {
          v13 &= 2u;
        }
        if (v13)
        {
          int v19 = 138413058;
          uint64_t v20 = objc_opt_class();
          __int16 v21 = 2112;
          id v22 = a4;
          __int16 v23 = 2048;
          uint64_t v24 = v7;
          __int16 v25 = 2048;
          id v26 = [v10 length];
          LODWORD(v18) = 42;
          id v17 = &v19;
          uint64_t v14 = _os_log_send_and_compose_impl();
          if (v14)
          {
            id v15 = (void *)v14;
            v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v19, v18);
            free(v15);
            id v17 = (int *)v16;
            SSFileLog();
          }
        }
        objc_msgSend(a3, "setValue:forRequestParameter:", v10, @"kbsync", v17);
      }
    }
  }
}

- (void)_importKeybagFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"keybag"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    sub_10002E31C(v3);
  }
}

- (id)_metricsPageEventWithResponse:(id)a3 performance:(id)a4
{
  id v6 = objc_alloc_init((Class)SSMetricsPageEvent);
  objc_msgSend(v6, "setPageURL:", objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString"));
  [a4 startTime];
  double v8 = v7;
  [+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:") timeIntervalSince1970];
  objc_msgSend(v6, "setRequestStartTime:");
  [a4 receivedResponseInterval];
  [+[NSDate dateWithTimeIntervalSinceReferenceDate:v8 + v9] timeIntervalSince1970];
  objc_msgSend(v6, "setResponseStartTime:");
  [a4 finishInterval];
  [+[NSDate dateWithTimeIntervalSinceReferenceDate:v8 + v10] timeIntervalSince1970];
  objc_msgSend(v6, "setResponseEndTime:");
  [a3 allHeaderFields];
  [v6 setServerApplicationInstance:ISDictionaryValueForCaseInsensitiveString()];
  [v6 setServerTiming:ISDictionaryValueForCaseInsensitiveString()];

  return v6;
}

- (id)_newStoreURLOperationWithProperties:(id)a3
{
  id v5 = objc_alloc_init((Class)ISStoreURLOperation);
  unsigned int v6 = [a3 shouldProcessProtocol];
  double v7 = (id *)&off_1003A1760;
  if (!v6) {
    double v7 = (id *)ISDataProvider_ptr;
  }
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(*v7, "provider"));
  if ([a3 shouldSendSecureToken]) {
    [v5 setShouldSendXTokenHeader:1];
  }
  objc_msgSend(v5, "setAuthenticationContext:", -[URLConnectionRequestOperation authenticationContext](self, "authenticationContext"));
  id v8 = [a3 mutableCopy];
  [(URLConnectionRequestOperation *)self _addKBSyncDataToRequestProperties:v8 forAccountID:[(URLConnectionRequestOperation *)self _accountIdentifier]];
  if ([(URLConnectionRequestOperation *)self _shouldSendMachineDataHeadersForProperties:v8])
  {
    uint64_t v9 = 1;
LABEL_8:
    [v5 setMachineDataStyle:v9];
    goto LABEL_9;
  }
  uint64_t v9 = (uint64_t)[v8 machineDataStyle];
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  [v5 setRequestProperties:v8];

  objc_msgSend(v5, "_setShouldSetCookies:", objc_msgSend(a3, "shouldSetCookies"));
  return v5;
}

- (BOOL)_shouldSendMachineDataHeadersForProperties:(id)a3
{
  id v4 = [a3 URLBagKey];
  if (!v4)
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString");
    BOOL v6 = 1;
    if ([v7 rangeOfString:@"buyProduct" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v6 = 1;
      if ([v7 rangeOfString:@"redeemCodeSrv" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
        return [v7 rangeOfString:@"giftBuySrv" options:1] != (id)0x7FFFFFFFFFFFFFFFLL;
      }
    }
    return v6;
  }
  id v5 = v4;
  if (([v4 isEqualToString:@"buyProduct"] & 1) != 0
    || ([v5 isEqualToString:@"redeemCodeSrv"] & 1) != 0)
  {
    return 1;
  }

  return [v5 isEqualToString:@"giftBuySrv"];
}

@end