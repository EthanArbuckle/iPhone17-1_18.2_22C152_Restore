@interface LoadCompletedMicroPaymentsOperation
- (BOOL)isPartialFailure;
- (NSString)applicationUsername;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyResponseForIdentity:(id)a3 startID:(id)a4 endID:(id)a5 returningError:(id *)a6;
- (id)_newFetchOperationForIdentity:(id)a3 startID:(id)a4 endID:(id)a5;
- (id)paymentBatchBlock;
- (void)_runForIdentity:(id)a3;
- (void)run;
- (void)setApplicationUsername:(id)a3;
- (void)setClientIdentity:(id)a3;
- (void)setPaymentBatchBlock:(id)a3;
@end

@implementation LoadCompletedMicroPaymentsOperation

- (NSString)applicationUsername
{
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  id v3 = [(NSString *)self->_applicationUsername copy];
  [(LoadCompletedMicroPaymentsOperation *)self unlock];

  return (NSString *)v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  id v3 = [(StoreKitClientIdentity *)self->_clientIdentity copy];
  [(LoadCompletedMicroPaymentsOperation *)self unlock];

  return (StoreKitClientIdentity *)v3;
}

- (BOOL)isPartialFailure
{
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  BOOL partialFailure = self->_partialFailure;
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
  return partialFailure;
}

- (id)paymentBatchBlock
{
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  id v3 = [self->_paymentBatchBlock copy];
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setApplicationUsername:(id)a3
{
  v6 = (NSString *)a3;
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  if (self->_applicationUsername != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    applicationUsername = self->_applicationUsername;
    self->_applicationUsername = v4;
  }
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
}

- (void)setClientIdentity:(id)a3
{
  v6 = (StoreKitClientIdentity *)a3;
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  if (self->_clientIdentity != v6)
  {
    id v4 = (StoreKitClientIdentity *)[(StoreKitClientIdentity *)v6 copy];
    clientIdentity = self->_clientIdentity;
    self->_clientIdentity = v4;
  }
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
}

- (void)setPaymentBatchBlock:(id)a3
{
  id v6 = a3;
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  if (self->_paymentBatchBlock != v6)
  {
    id v4 = [v6 copy];
    id paymentBatchBlock = self->_paymentBatchBlock;
    self->_id paymentBatchBlock = v4;
  }
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
}

- (void)run
{
  id v3 = [(LoadCompletedMicroPaymentsOperation *)self clientIdentity];
  if (![v3 usesIdentityAttributes])
  {
    id v4 = [v3 bundleIdentifier];
    v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    id v6 = [v5 appState];
    unsigned __int8 v7 = [v6 isValid];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:v4];

      v5 = (void *)v8;
    }
    if (v5)
    {
      v9 = [v5 itemID];
      if ([v9 integerValue])
      {

LABEL_9:
        id v12 = [v3 copy];
        [v12 setValuesWithSoftwareApplicationProxy:v5];
        [(LoadCompletedMicroPaymentsOperation *)self _runForIdentity:v12];
LABEL_22:

        goto LABEL_23;
      }
      v10 = [v5 bundleIdentifier];
      id v11 = [v10 length];

      if (v11) {
        goto LABEL_9;
      }
    }
    v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      *(_DWORD *)v21 = 138412546;
      *(void *)&v21[4] = objc_opt_class();
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v4;
      id v17 = *(id *)&v21[4];
      LODWORD(v20) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_21:

        sub_100174DB0();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        v19 = ISErrorWithDomain();
        [(LoadCompletedMicroPaymentsOperation *)self setError:v19];

        goto LABEL_22;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
      free(v18);
      SSFileLog();
    }

    goto LABEL_21;
  }
  [(LoadCompletedMicroPaymentsOperation *)self _runForIdentity:v3];
LABEL_23:
}

- (id)_copyResponseForIdentity:(id)a3 startID:(id)a4 endID:(id)a5 returningError:(id *)a6
{
  id v8 = [(LoadCompletedMicroPaymentsOperation *)self _newFetchOperationForIdentity:a3 startID:a4 endID:a5];
  [v8 setDelegate:self];
  v9 = objc_alloc_init(DaemonProtocolDataProvider);
  [v8 setDataProvider:v9];
  id v20 = 0;
  unsigned int v10 = [(LoadCompletedMicroPaymentsOperation *)self runSubOperation:v8 returningError:&v20];
  id v11 = v20;
  if (v10)
  {
    id v12 = [[MicroPaymentQueueResponse alloc] initWithRequestType:1];
    v13 = [v8 authenticatedAccountDSID];
    if (!v13)
    {
      unsigned int v14 = +[SSAccountStore defaultStore];
      int v15 = [v14 activeAccount];
      v13 = [v15 uniqueIdentifier];
    }
    [(MicroPaymentQueueResponse *)v12 setUserIdentifier:v13];
    v16 = [(DaemonProtocolDataProvider *)v9 output];
    unsigned __int8 v17 = [(MicroPaymentQueueResponse *)v12 loadFromPropertyList:v16];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = ISErrorWithDomain();

      id v12 = 0;
      id v11 = (id)v18;
    }
  }
  else
  {
    id v12 = 0;
  }
  [v8 setDelegate:0];
  if (a6 && !v12) {
    *a6 = v11;
  }

  return v12;
}

- (id)_newFetchOperationForIdentity:(id)a3 startID:(id)a4 endID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)ISStoreURLOperation);
  if (![v8 isSandboxed])
  {
    v13 = +[SSAccountStore defaultStore];
    id v14 = [v13 activeAccount];
    goto LABEL_5;
  }
  id v12 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  v13 = objc_msgSend(v12, "ams_activeiTunesAccount");

  if (v13)
  {
    id v14 = [objc_alloc((Class)SSAccount) initWithBackingAccount:v13];
LABEL_5:
    id v15 = v14;
    goto LABEL_7;
  }
  id v15 = 0;
LABEL_7:

  v33 = v15;
  id v16 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v15];
  objc_msgSend(v16, "setAllowsBootstrapCellularData:", objc_msgSend(v8, "allowsBootstrapCellularData"));
  [v16 setTokenType:1];
  [v11 setAuthenticationContext:v16];
  id v17 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v17 setAllowedRetryCount:0];
  objc_msgSend(v17, "setAllowsBootstrapCellularData:", objc_msgSend(v8, "allowsBootstrapCellularData"));
  [v17 setCachePolicy:1];
  [v17 setHTTPMethod:@"POST"];
  [v17 setShouldDecodeResponse:0];
  [v17 setURLBagKey:@"p2-in-app-regrant-purchase-history"];
  if ([v8 isSandboxed]) {
    [v17 setURLBagType:1];
  }
  uint64_t v18 = sub_1000616A4(v8);
  v19 = (char *)[v10 itemIdentifierValue];

  id v20 = (char *)[v9 itemIdentifierValue];
  if (v19 - 1 < v20)
  {
    v21 = +[NSString stringWithFormat:@"%llu", v19];
    [v18 setObject:v21 forKey:kISLoadMoreStartIDParameter];

    v22 = +[NSString stringWithFormat:@"%llu", v20];
    [v18 setObject:v22 forKey:kISLoadMoreEndIDParameter];

    [v16 setPromptStyle:0];
  }
  v23 = [v8 accountIdentifier];
  v24 = v23;
  if (v23)
  {
    v25 = [v23 stringValue];
    [v18 setObject:v25 forKey:@"appDsid"];
  }
  v26 = +[ISDevice sharedInstance];
  v27 = [v26 guid];

  if (v27) {
    [v18 setObject:v27 forKey:@"guid"];
  }
  v28 = +[ISDevice sharedInstance];
  v29 = [v28 serialNumber];

  if (v29) {
    [v18 setObject:v29 forKey:@"serialNumber"];
  }
  v30 = [v8 vendorIdentifier];
  if (v30) {
    [v18 setObject:v30 forKey:@"vid"];
  }
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  applicationUsername = self->_applicationUsername;
  if (applicationUsername) {
    [v18 setObject:applicationUsername forKey:@"applicationUsername"];
  }
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
  [v17 setRequestParameters:v18];
  [v11 setRequestProperties:v17];

  return v11;
}

- (void)_runForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = +[NSNumber numberWithUnsignedLongLong:0];
  unsigned __int8 v7 = +[NSNumber numberWithUnsignedLongLong:0];
  id v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  v56 = [(LoadCompletedMicroPaymentsOperation *)self paymentBatchBlock];
  v62 = v4;
  id v9 = [[ClaimStoreKitClientOperation alloc] initWithClientIdentity:v4];
  v52 = v9;
  if ([(LoadCompletedMicroPaymentsOperation *)self runSubOperation:v9 returningError:0])
  {
    uint64_t v10 = [(ClaimStoreKitClientOperation *)v9 clientIdentity];

    v62 = (void *)v10;
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    char v11 = 0;
    char v53 = 0;
    id v57 = 0;
    id v12 = &syslog_ptr;
    v54 = self;
    id v58 = v8;
    while (1)
    {
      if ([(LoadCompletedMicroPaymentsOperation *)self isCancelled]) {
        goto LABEL_56;
      }
      uint64_t v13 = [v8 objectAtIndex:0];
      uint64_t v63 = [v8 objectAtIndex:1];
      id v14 = [v12[405] sharedDaemonConfig];
      if (!v14)
      {
        id v14 = [v12[405] sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      id v17 = [v14 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        int v18 = v16;
      }
      else {
        int v18 = v16 & 2;
      }
      if (v18)
      {
        v19 = objc_opt_class();
        int v65 = 138412802;
        v66 = v19;
        __int16 v67 = 2112;
        *(void *)v68 = v13;
        *(_WORD *)&v68[8] = 2112;
        id v20 = (void *)v63;
        *(void *)&v68[10] = v63;
        id v21 = v19;
        LODWORD(v51) = 32;
        v50 = &v65;
        v22 = (void *)_os_log_send_and_compose_impl();

        id v12 = &syslog_ptr;
        if (!v22) {
          goto LABEL_19;
        }
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v65, v51);
        free(v22);
        v50 = (int *)v17;
        SSFileLog();
      }
      else
      {
        id v20 = (void *)v63;
      }

LABEL_19:
      id v64 = 0;
      v61 = (void *)v13;
      id v23 = [(LoadCompletedMicroPaymentsOperation *)self _copyResponseForIdentity:v62 startID:v13 endID:v20 returningError:&v64];
      id v24 = v64;
      id v25 = v24;
      if (v23)
      {
        v26 = [v23 rangesToLoad];
        if (v26) {
          [v8 addObjectsFromArray:v26];
        }
        v59 = v25;
        v27 = objc_msgSend(v12[405], "sharedDaemonConfig", v50);
        if (!v27)
        {
          v27 = [v12[405] sharedConfig];
        }
        unsigned int v28 = [v27 shouldLog];
        if ([v27 shouldLogToDisk]) {
          int v29 = v28 | 2;
        }
        else {
          int v29 = v28;
        }
        v30 = [v27 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          int v31 = v29;
        }
        else {
          int v31 = v29 & 2;
        }
        if (v31)
        {
          v32 = objc_opt_class();
          id v55 = v32;
          v33 = [v23 appReceipt];
          unsigned int v34 = [v33 length];
          v35 = [v62 bundleIdentifier];
          int v65 = 138412802;
          v66 = v32;
          __int16 v67 = 1024;
          *(_DWORD *)v68 = v34;
          *(_WORD *)&v68[4] = 2112;
          *(void *)&v68[6] = v35;
          LODWORD(v51) = 28;
          v50 = &v65;
          v36 = (void *)_os_log_send_and_compose_impl();

          id v20 = (void *)v63;
          if (v36)
          {
            v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v65, v51);
            free(v36);
            v50 = (int *)v30;
            SSFileLog();
            goto LABEL_33;
          }
        }
        else
        {
LABEL_33:
        }
        v37 = [v23 appReceipt];
        id v38 = [v37 length];

        if (v38)
        {
          v39 = [v23 appReceipt];
          +[AppReceipt writeReceipt:v39 forStoreKitClient:v62];
        }
        self = v54;
        id v8 = v58;
        id v12 = &syslog_ptr;
        if (v56) {
          v56[2]();
        }
        char v11 = 1;
        v40 = v59;
        goto LABEL_53;
      }
      v41 = v24;
      v42 = [v12[405] sharedDaemonConfig];
      if (!v42)
      {
        v42 = [v12[405] sharedConfig];
      }
      unsigned int v43 = objc_msgSend(v42, "shouldLog", v50);
      if ([v42 shouldLogToDisk]) {
        int v44 = v43 | 2;
      }
      else {
        int v44 = v43;
      }
      v45 = [v42 OSLogObject];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
        int v46 = v44;
      }
      else {
        int v46 = v44 & 2;
      }
      if (!v46)
      {
        id v8 = v58;
        id v20 = (void *)v63;
        goto LABEL_51;
      }
      v47 = objc_opt_class();
      int v65 = 138413058;
      v66 = v47;
      __int16 v67 = 2112;
      *(void *)v68 = v61;
      *(_WORD *)&v68[8] = 2112;
      id v20 = (void *)v63;
      *(void *)&v68[10] = v63;
      __int16 v69 = 2112;
      v70 = v41;
      id v48 = v47;
      LODWORD(v51) = 42;
      v50 = &v65;
      v49 = (void *)_os_log_send_and_compose_impl();

      id v8 = v58;
      if (v49)
      {
        v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v65, v51);
        free(v49);
        v50 = (int *)v45;
        SSFileLog();
LABEL_51:
      }
      v40 = v41;
      v26 = v57;
      char v53 = 1;
      id v57 = [v41 copy];
LABEL_53:

      objc_msgSend(v8, "removeObjectsInRange:", 0, 2);
      if ((unint64_t)[v8 count] <= 1) {
        goto LABEL_56;
      }
    }
  }
  id v57 = 0;
  char v53 = 0;
  char v11 = 0;
LABEL_56:
  [(LoadCompletedMicroPaymentsOperation *)self lock];
  self->_BOOL partialFailure = v11 & 1 & v53;
  [(LoadCompletedMicroPaymentsOperation *)self unlock];
  [(LoadCompletedMicroPaymentsOperation *)self setError:v57];
  [(LoadCompletedMicroPaymentsOperation *)self setSuccess:v11 & 1];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_paymentBatchBlock, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_applicationUsername, 0);
}

@end