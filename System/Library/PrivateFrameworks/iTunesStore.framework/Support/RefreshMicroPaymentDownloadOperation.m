@interface RefreshMicroPaymentDownloadOperation
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (BOOL)_updateDownload:(id)a3 withDictionary:(id)a4;
- (RefreshMicroPaymentDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_newIdentityForPayment:(id)a3;
- (id)_newRequestWithIdentity:(id)a3 transactionID:(id)a4;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshMicroPaymentDownloadOperation

- (RefreshMicroPaymentDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RefreshMicroPaymentDownloadOperation;
  result = [(RefreshMicroPaymentDownloadOperation *)&v5 init];
  if (result) {
    result->_downloadID = a3;
  }
  return result;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadID;
}

- (void)run
{
  uint64_t v23 = 0;
  id v3 = +[NSThread beginManagedContextSession];
  id v4 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v4, "setEntity:", +[MicroPaymentDownload downloadEntityFromContext:](MicroPaymentDownload, "downloadEntityFromContext:", v3));
  objc_msgSend(v4, "setPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"downloadID=%lld", self->_downloadID));
  id v5 = [v3 executeFetchRequest:v4 error:&v23];
  if (!v5 || (v6 = v5, [v5 count] != (id)1))
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
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v18 = objc_opt_class();
      int64_t downloadID = self->_downloadID;
      int v24 = 138412802;
      uint64_t v25 = v18;
      __int16 v26 = 2048;
      int64_t v27 = downloadID;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      LODWORD(v22) = 32;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v24, v22);
        free(v21);
        SSFileLog();
      }
    }
    goto LABEL_25;
  }
  if (!-[RefreshMicroPaymentDownloadOperation _refreshDownload:error:](self, "_refreshDownload:error:", [v6 objectAtIndex:0], &v23))
  {
LABEL_25:
    uint64_t v14 = 0;
    goto LABEL_26;
  }
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
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    int64_t v11 = self->_downloadID;
    int v24 = 138412546;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = v11;
    LODWORD(v22) = 22;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v24, v22);
      free(v13);
      SSFileLog();
    }
  }
  sub_10004BBA0(v3);
  uint64_t v14 = 1;
LABEL_26:

  +[NSThread endManagedContextSession];
  [(RefreshMicroPaymentDownloadOperation *)self setError:v23];
  [(RefreshMicroPaymentDownloadOperation *)self setSuccess:v14];
}

- (id)_newIdentityForPayment:(id)a3
{
  id v4 = [a3 client];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if (objc_msgSend(objc_msgSend(v4, "usesIdentityAttributes"), "BOOLValue"))
  {
    v6 = objc_alloc_init(StoreKitClientIdentity);
    -[StoreKitClientIdentity setAccountIdentifier:](v6, "setAccountIdentifier:", [a3 userDSID]);
    -[StoreKitClientIdentity setBundleIdentifier:](v6, "setBundleIdentifier:", [v5 identifier]);
    -[StoreKitClientIdentity setBundleVersion:](v6, "setBundleVersion:", [v5 bundleVersion]);
    id v7 = [v5 storeIdentifier];
    id v8 = [v5 storeVersion];
    [(StoreKitClientIdentity *)v6 setStoreIdentifier:v7];
    [(StoreKitClientIdentity *)v6 setStoreVersion:v8];
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v10 = v9;
    [(StoreKitClientIdentity *)v6 setSandboxed:v10];
  }
  else
  {
    id v12 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", [v5 identifier]);
    if (v12)
    {
      id v13 = v12;
      v6 = objc_alloc_init(StoreKitClientIdentity);
      [(StoreKitClientIdentity *)v6 setValuesWithSoftwareApplicationProxy:v13];
      -[StoreKitClientIdentity setSandboxed:](v6, "setSandboxed:", objc_msgSend(objc_msgSend(v5, "sandboxed"), "BOOLValue"));
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)_newRequestWithIdentity:(id)a3 transactionID:(id)a4
{
  v6 = objc_alloc_init(MicroPaymentQueueRequest);
  [(MicroPaymentQueueRequest *)v6 setClientIdentity:a3];
  -[MicroPaymentQueueRequest setUserIdentifier:](v6, "setUserIdentifier:", [a3 accountIdentifier]);
  id v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(a4, "longLongValue"));
  [(MicroPaymentQueueRequest *)v6 setRangeEndIdentifier:v7];
  [(MicroPaymentQueueRequest *)v6 setRangeStartIdentifier:v7];

  return v6;
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  v45 = 0;
  id v7 = [a3 payment];
  id v8 = [v7 transactionIdentifier];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(RefreshMicroPaymentDownloadOperation *)self _newIdentityForPayment:v7];
    if (v10)
    {
      int64_t v11 = v10;
      id v12 = [(RefreshMicroPaymentDownloadOperation *)self _newRequestWithIdentity:v10 transactionID:v9];
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
        uint64_t v16 = objc_opt_class();
        int64_t downloadID = self->_downloadID;
        int v46 = 138412802;
        uint64_t v47 = v16;
        __int16 v48 = 2048;
        int64_t v49 = downloadID;
        __int16 v50 = 2112;
        int64_t v51 = (int64_t)v9;
        LODWORD(v44) = 32;
        v43 = &v46;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v46, v44);
          free(v19);
          v43 = (int *)v20;
          SSFileLog();
        }
      }
      v21 = objc_alloc_init(LoadMicroPaymentQueuePaymentsOperation);
      [(LoadMicroPaymentQueuePaymentsOperation *)v21 setRequest:v12];
      [(LoadMicroPaymentQueuePaymentsOperation *)v21 setURLBagKey:@"p2-in-app-pending-transactions"];
      if ([(RefreshMicroPaymentDownloadOperation *)self runSubOperation:v21 returningError:&v45])
      {
        uint64_t v22 = [(MicroPaymentQueueResponse *)[(LoadMicroPaymentQueuePaymentsOperation *)v21 response] payments];
        if ((id)[(NSArray *)v22 count] == (id)1)
        {
          LOBYTE(self) = [(RefreshMicroPaymentDownloadOperation *)self _updateDownload:a3 withDictionary:[(NSArray *)v22 objectAtIndex:0]];
          goto LABEL_59;
        }
        id v36 = +[SSLogConfig sharedDaemonConfig];
        if (!v36) {
          id v36 = +[SSLogConfig sharedConfig];
        }
        unsigned int v37 = objc_msgSend(v36, "shouldLog", v43);
        if ([v36 shouldLogToDisk]) {
          int v38 = v37 | 2;
        }
        else {
          int v38 = v37;
        }
        if (!os_log_type_enabled((os_log_t)[v36 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v38 &= 2u;
        }
        if (!v38) {
          goto LABEL_58;
        }
        uint64_t v39 = objc_opt_class();
        NSUInteger v40 = [(NSArray *)v22 count];
        int64_t v41 = self->_downloadID;
        int v46 = 138412802;
        uint64_t v47 = v39;
        __int16 v48 = 2048;
        int64_t v49 = v40;
        __int16 v50 = 2048;
        int64_t v51 = v41;
        LODWORD(v44) = 32;
      }
      else
      {
        id v31 = +[SSLogConfig sharedDaemonConfig];
        if (!v31) {
          id v31 = +[SSLogConfig sharedConfig];
        }
        unsigned int v32 = objc_msgSend(v31, "shouldLog", v43);
        if ([v31 shouldLogToDisk]) {
          int v33 = v32 | 2;
        }
        else {
          int v33 = v32;
        }
        if (!os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v33 &= 2u;
        }
        if (!v33) {
          goto LABEL_58;
        }
        uint64_t v34 = objc_opt_class();
        int64_t v35 = self->_downloadID;
        int v46 = 138412802;
        uint64_t v47 = v34;
        __int16 v48 = 2048;
        int64_t v49 = v35;
        __int16 v50 = 2112;
        int64_t v51 = (int64_t)v45;
        LODWORD(v44) = 32;
      }
      self = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl();
      if (!self) {
        goto LABEL_59;
      }
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", self, 4, &v46, v44);
      free(self);
      SSFileLog();
LABEL_58:
      LOBYTE(self) = 0;
LABEL_59:

      if (!a4) {
        return (char)self;
      }
      goto LABEL_60;
    }
    id v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26) {
      id v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    if (!os_log_type_enabled((os_log_t)[v26 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (!v28) {
      goto LABEL_35;
    }
  }
  else
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
    if (!v25) {
      goto LABEL_35;
    }
  }
  uint64_t v29 = objc_opt_class();
  int64_t v30 = self->_downloadID;
  int v46 = 138412546;
  uint64_t v47 = v29;
  __int16 v48 = 2048;
  int64_t v49 = v30;
  LODWORD(v44) = 22;
  self = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl();
  if (!self) {
    goto LABEL_36;
  }
  +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", self, 4, &v46, v44);
  free(self);
  SSFileLog();
LABEL_35:
  LOBYTE(self) = 0;
LABEL_36:
  if (!a4) {
    return (char)self;
  }
LABEL_60:
  if ((self & 1) == 0) {
    *a4 = v45;
  }
  return (char)self;
}

- (BOOL)_updateDownload:(id)a3 withDictionary:(id)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v7 = [a3 payment];
  [v7 mergeValuesFromResponse:a4];
  id v8 = -[Download initWithMicroPaymentDownload:clientID:]([Download alloc], "initWithMicroPaymentDownload:clientID:", a3, objc_msgSend(objc_msgSend(v7, "client"), "identifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018D8A8;
  v10[3] = &unk_1003A8698;
  v10[5] = v8;
  v10[6] = &v11;
  v10[4] = self;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v10);

  LOBYTE(self) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

@end