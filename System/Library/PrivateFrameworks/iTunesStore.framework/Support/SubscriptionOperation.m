@interface SubscriptionOperation
- (BOOL)isRequestingOfflineSlot;
- (NSString)userAgent;
- (SSAuthenticationContext)authenticationContext;
- (SSVSubscriptionResponse)response;
- (id)_newMachineDataOperationWithAccount:(id)a3 response:(id)a4;
- (id)_requestPropertiesWithAccount:(id)a3 syncState:(id)a4 fairPlaySubscriptionController:(id)a5;
- (int64_t)operationType;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setRequestingOfflineSlot:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SubscriptionOperation

- (SSAuthenticationContext)authenticationContext
{
  [(SubscriptionOperation *)self lock];
  id v3 = [(SSAuthenticationContext *)self->_authenticationContext copy];
  [(SubscriptionOperation *)self unlock];

  return (SSAuthenticationContext *)v3;
}

- (BOOL)isRequestingOfflineSlot
{
  [(SubscriptionOperation *)self lock];
  BOOL requestingOfflineSlot = self->_requestingOfflineSlot;
  [(SubscriptionOperation *)self unlock];
  return requestingOfflineSlot;
}

- (int64_t)operationType
{
  [(SubscriptionOperation *)self lock];
  int64_t operationType = self->_operationType;
  [(SubscriptionOperation *)self unlock];
  return operationType;
}

- (SSVSubscriptionResponse)response
{
  [(SubscriptionOperation *)self lock];
  id v3 = [(SSVSubscriptionResponse *)self->_response copy];
  [(SubscriptionOperation *)self unlock];

  return (SSVSubscriptionResponse *)v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  [(SubscriptionOperation *)self lock];
  if (self->_authenticationContext != v6)
  {
    v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(SubscriptionOperation *)self unlock];
}

- (void)setOperationType:(int64_t)a3
{
  [(SubscriptionOperation *)self lock];
  self->_int64_t operationType = a3;

  [(SubscriptionOperation *)self unlock];
}

- (void)setRequestingOfflineSlot:(BOOL)a3
{
  [(SubscriptionOperation *)self lock];
  self->_BOOL requestingOfflineSlot = a3;

  [(SubscriptionOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  v6 = (NSString *)a3;
  [(SubscriptionOperation *)self lock];
  if (self->_userAgent != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }
  [(SubscriptionOperation *)self unlock];
}

- (NSString)userAgent
{
  [(SubscriptionOperation *)self lock];
  id v3 = [(NSString *)self->_userAgent copy];
  [(SubscriptionOperation *)self unlock];

  return (NSString *)v3;
}

- (void)run
{
  v64 = [(SubscriptionOperation *)self authenticationContext];
  [v64 requiredUniqueIdentifier];
  v66 = v65 = 0;
  char v62 = 0;
  id v3 = 0;
  char v4 = 1;
  v5 = &syslog_ptr;
  do
  {
    v6 = +[SSAccountStore defaultStore];
    if (![v66 longLongValue]
      || ([v6 accountWithUniqueIdentifier:v66], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v7 = [v6 activeAccount];
    }
    v67 = v6;
    id v8 = objc_alloc_init((Class)ISStoreURLOperation);
    [v8 setAuthenticationContext:v64];
    v9 = +[DaemonProtocolDataProvider provider];
    [v8 setDataProvider:v9];

    [v8 setDelegate:self];
    [v8 setMachineDataStyle:0];
    [v8 setUseUserSpecificURLBag:1];
    id v68 = objc_alloc_init((Class)SSVFairPlaySubscriptionController);
    v69 = (void *)v7;
    v70 = -[SubscriptionOperation _requestPropertiesWithAccount:syncState:fairPlaySubscriptionController:](self, "_requestPropertiesWithAccount:syncState:fairPlaySubscriptionController:", v7, v65);
    objc_msgSend(v8, "setRequestProperties:");
    v10 = [v5[405] sharedDaemonConfig];
    if (!v10)
    {
      v10 = [v5[405] sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      v11 |= 2u;
    }
    v12 = [v10 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v14 = objc_opt_class();
      id v15 = v14;
      [v70 URLBagKey];
      v17 = char v16 = v4;
      int v74 = 138412546;
      v75 = v14;
      __int16 v76 = 2112;
      id v77 = v17;
      LODWORD(v61) = 22;
      v60 = &v74;
      v18 = (void *)_os_log_send_and_compose_impl();

      char v4 = v16;
      v5 = &syslog_ptr;

      if (!v18) {
        goto LABEL_16;
      }
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v74, v61);
      free(v18);
      v60 = (int *)v12;
      SSFileLog();
    }

LABEL_16:
    id v73 = v3;
    unsigned __int8 v19 = [(SubscriptionOperation *)self runSubOperation:v8 returningError:&v73];
    id v20 = v73;

    if (v19)
    {
      v21 = [v8 dataProvider];
      v22 = [v21 output];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_49;
      }
      v23 = SSVSubscriptionBagForDictionary();
      if (v23)
      {
        [v68 importSubscriptionKeyBagData:v23 returningError:0];
        id v24 = objc_alloc_init((Class)SSVSubscriptionResponse);
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_1000AD7F0;
        v71[3] = &unk_1003A5830;
        id v25 = v24;
        id v72 = v25;
        [v68 enumerateAccountSubscriptionStatusUsingBlock:v71];
        uint64_t v26 = OBJC_IVAR___ISOperation__lock;
        [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__lock] lock];
        response = self->_response;
        self->_response = (SSVSubscriptionResponse *)v25;
        id v28 = v25;

        [*(id *)&self->ISOperation_opaque[v26] unlock];
      }
      v29 = objc_msgSend(v22, "objectForKey:", @"statusCode", v60);
      v63 = v29;
      if ((objc_opt_respondsToSelector() & 1) == 0 || [v29 integerValue])
      {
        v30 = [v5[405] sharedDaemonConfig];
        if (!v30)
        {
          v30 = [v5[405] sharedConfig];
        }
        unsigned int v31 = [v30 shouldLog];
        if ([v30 shouldLogToDisk]) {
          v31 |= 2u;
        }
        v32 = [v30 OSLogObject];
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          v31 &= 2u;
        }
        if (v31)
        {
          v33 = objc_opt_class();
          int v74 = 138412546;
          v75 = v33;
          __int16 v76 = 2112;
          id v77 = v63;
          char v34 = v4;
          id v35 = v33;
          LODWORD(v61) = 22;
          v60 = &v74;
          v36 = (void *)_os_log_send_and_compose_impl();

          char v4 = v34;
          if (!v36)
          {
LABEL_32:

            v37 = [v8 response];
            id v38 = [(SubscriptionOperation *)self _newMachineDataOperationWithAccount:v69 response:v37];

            if (v38)
            {
              unsigned __int8 v39 = [(SubscriptionOperation *)self runSubOperation:v38 returningError:0];
              uint64_t v40 = [v38 syncState];

              v5 = &syslog_ptr;
              if ((v39 & 1) != 0 || (v65 = 0, v40))
              {

                v41 = [v8 authenticatedAccountDSID];
                v23 = v41;
                if (!v41)
                {
                  int v42 = 1;
                  v65 = (void *)v40;
                  goto LABEL_66;
                }
                v23 = v41;
                int v42 = 1;
                v43 = v66;
                v65 = (void *)v40;
                v66 = v23;
                v44 = v43;
                goto LABEL_65;
              }
            }
            else
            {
              v5 = &syslog_ptr;
            }
            v44 = v63;
            if (v63) {
              [v63 integerValue];
            }
            uint64_t v51 = SSError();

            int v42 = 0;
            id v20 = (id)v51;
LABEL_65:

            goto LABEL_66;
          }
          v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v74, v61);
          free(v36);
          v60 = (int *)v32;
          SSFileLog();
        }

        goto LABEL_32;
      }
      v52 = [v5[405] sharedDaemonConfig];
      if (!v52)
      {
        v52 = [v5[405] sharedConfig];
      }
      unsigned int v53 = [v52 shouldLog];
      if ([v52 shouldLogToDisk]) {
        v53 |= 2u;
      }
      v54 = [v52 OSLogObject];
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
        v53 &= 2u;
      }
      if (v53)
      {
        v55 = objc_opt_class();
        int v74 = 138412290;
        v75 = v55;
        char v56 = v4;
        id v57 = v55;
        LODWORD(v61) = 12;
        v60 = &v74;
        v58 = (void *)_os_log_send_and_compose_impl();

        char v4 = v56;
        if (!v58)
        {
LABEL_64:

          int v42 = 0;
          char v62 = 1;
          v5 = &syslog_ptr;
          v44 = v63;
          goto LABEL_65;
        }
        v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v74, v61);
        free(v58);
        v60 = (int *)v54;
        SSFileLog();
      }

      goto LABEL_64;
    }
    v22 = [v5[405] sharedDaemonConfig];
    if (!v22)
    {
      v22 = [v5[405] sharedConfig];
    }
    unsigned int v45 = objc_msgSend(v22, "shouldLog", v60);
    if ([v22 shouldLogToDisk]) {
      int v46 = v45 | 2;
    }
    else {
      int v46 = v45;
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      int v47 = v46;
    }
    else {
      int v47 = v46 & 2;
    }
    if (v47)
    {
      v48 = objc_opt_class();
      int v74 = 138412546;
      v75 = v48;
      __int16 v76 = 2112;
      id v77 = v20;
      id v49 = v48;
      LODWORD(v61) = 22;
      v60 = &v74;
      v50 = (void *)_os_log_send_and_compose_impl();

      if (!v50)
      {
LABEL_49:
        int v42 = 0;
        goto LABEL_67;
      }
      v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4, &v74, v61);
      free(v50);
      v60 = (int *)v23;
      SSFileLog();
    }
    int v42 = 0;
LABEL_66:

LABEL_67:
    id v3 = v20;

    [v8 setDelegate:0];
    char v59 = (v42 != 0) & v4;
    char v4 = 0;
  }
  while ((v59 & 1) != 0);
  [(SubscriptionOperation *)self setError:v20];
  [(SubscriptionOperation *)self setSuccess:v62 & 1];
}

- (id)_newMachineDataOperationWithAccount:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)SSMachineDataRequest) initWithURLResponse:v7];

  if (v8)
  {
    v9 = [v6 uniqueIdentifier];
    [v8 setAccountIdentifier:v9];

    [v8 setWaitsForPurchaseOperations:1];
    id v10 = [objc_alloc((Class)ISMachineDataActionOperation) initWithMachineDataRequest:v8];
    unsigned int v11 = [(SubscriptionOperation *)self userAgent];
    [v10 setUserAgent:v11];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_requestPropertiesWithAccount:(id)a3 syncState:(id)a4 fairPlaySubscriptionController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v48 = a5;
  id v10 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v10 setValue:@"true" forHTTPHeaderField:@"x-apple-use-amd"];
  unsigned int v11 = [(SubscriptionOperation *)self userAgent];
  [v10 setValue:v11 forHTTPHeaderField:SSHTTPHeaderUserAgent];

  unint64_t v12 = [(SubscriptionOperation *)self operationType];
  if (v12 > 2)
  {
    uint64_t v13 = 0;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v13 = dword_10031F918[v12];
  [v10 setURLBagKey:off_1003A5850[v12]];
  if (v9) {
LABEL_5:
  }
    [v10 setValue:v9 forHTTPHeaderField:SSHTTPHeaderXAppleAMDS];
LABEL_6:
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  id v15 = +[ISDevice sharedInstance];
  char v16 = [v15 guid];

  if (v16) {
    [v14 setObject:v16 forKey:@"guid"];
  }
  if ([(SubscriptionOperation *)self isRequestingOfflineSlot]) {
    [v14 setObject:&__kCFBooleanTrue forKey:@"isRequestingSlot"];
  }
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v51 = 0;
  sub_1001DC128(-1, (uint64_t)&v53, (uint64_t)&v51 + 4, (uint64_t)&v52, (uint64_t)&v51);
  if (v17)
  {
    int v18 = v17;
    unsigned __int8 v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      unsigned __int8 v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      v20 |= 2u;
    }
    v21 = [v19 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v22 = objc_opt_class();
      int v54 = 138412546;
      v55 = v22;
      __int16 v56 = 2048;
      id v57 = (id)v18;
      id v23 = v22;
      LODWORD(v44) = 22;
      v43 = &v54;
      id v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24) {
        goto LABEL_44;
      }
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v54, v44);
      free(v24);
      v43 = (int *)v21;
      SSFileLog();
    }
    goto LABEL_43;
  }
  if (HIDWORD(v51))
  {
    id v25 = objc_alloc((Class)NSData);
    id v26 = [v25 initWithBytesNoCopy:v53 length:HIDWORD(v51) freeWhenDone:0];
    unsigned __int8 v19 = v26;
    if (v26)
    {
      v27 = [v26 base64EncodedStringWithOptions:0];
      [v10 setValue:v27 forHTTPHeaderField:SSHTTPHeaderXAppleAMDM];
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }
  if (v52)
  {
    id v28 = objc_alloc((Class)NSData);
    id v29 = [v28 initWithBytesNoCopy:v52 length:v51 freeWhenDone:0];
    v30 = [v29 base64EncodedStringWithOptions:0];
    [v10 setValue:v30 forHTTPHeaderField:SSHTTPHeaderXAppleAMD];
  }
  if (v8)
  {
    unsigned int v31 = [v8 uniqueIdentifier];
    id v32 = [v31 unsignedLongLongValue];

    id v49 = 0;
    id v50 = 0;
    [v48 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v32 transactionType:v13 machineIDData:v19 returningSubscriptionBagData:&v50 error:&v49];
    v21 = v50;
    id v33 = v49;
    char v34 = v33;
    if (!v33)
    {
      id v35 = [v21 base64EncodedStringWithOptions:0];
      if (v35) {
        [v14 setObject:v35 forKey:@"sbsync"];
      }
      goto LABEL_42;
    }
    id v46 = v8;
    id v47 = v33;
    id v35 = +[SSLogConfig sharedDaemonConfig];
    if (!v35)
    {
      id v35 = +[SSLogConfig sharedConfig];
    }
    unsigned int v36 = [v35 shouldLog];
    if ([v35 shouldLogToDisk]) {
      int v37 = v36 | 2;
    }
    else {
      int v37 = v36;
    }
    id v38 = [v35 OSLogObject];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      v37 &= 2u;
    }
    if (v37)
    {
      unsigned __int8 v39 = objc_opt_class();
      int v54 = 138412546;
      v55 = v39;
      __int16 v56 = 2112;
      id v57 = v47;
      id v45 = v39;
      LODWORD(v44) = 22;
      v43 = &v54;
      uint64_t v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
        id v8 = v46;
        char v34 = v47;
        goto LABEL_42;
      }
      id v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v54, v44);
      free(v40);
      v43 = (int *)v38;
      SSFileLog();
    }
    id v8 = v46;

    char v34 = v47;
LABEL_42:

LABEL_43:
  }
LABEL_44:

  if (v53) {
    sub_1001CD9F8(v53);
  }
  if (v52) {
    sub_1001CD9F8(v52);
  }
  v41 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v14, 0, 0, v43);
  [v10 setHTTPBody:v41];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end