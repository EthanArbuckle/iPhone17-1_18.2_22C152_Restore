@interface LoadDownloadQueueOperation
+ (id)newLoadAutomaticDownloadQueueOperation;
- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4;
- (BOOL)_runMachineDataOperationWithRequest:(id)a3 syncState:(id *)a4;
- (BOOL)_shouldSendKeyBagSync;
- (BOOL)needsAuthentication;
- (LoadDownloadQueueOperation)init;
- (LoadDownloadQueueOperation)initWithRequestProperties:(id)a3;
- (NSNumber)accountIdentifier;
- (NSOrderedSet)downloads;
- (NSString)requestIdentifier;
- (SSURLRequestProperties)requestProperties;
- (id)_account;
- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4;
- (int64_t)reason;
- (void)_handleResponse:(id)a3;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation LoadDownloadQueueOperation

- (LoadDownloadQueueOperation)init
{
  return [(LoadDownloadQueueOperation *)self initWithRequestProperties:0];
}

- (LoadDownloadQueueOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LoadDownloadQueueOperation;
  v5 = [(LoadDownloadQueueOperation *)&v10 init];
  if (v5)
  {
    if (v4) {
      id v6 = [v4 copy];
    }
    else {
      id v6 = objc_alloc_init((Class)SSURLRequestProperties);
    }
    v7 = v6;
    objc_storeStrong((id *)&v5->_requestProperties, v6);

    [(LoadDownloadQueueOperation *)v5 setPowerAssertionIdentifier:@"com.apple.itunesstored.download-queue"];
    v8 = [(SSURLRequestProperties *)v5->_requestProperties URLBagKey];
    [(LoadDownloadQueueOperation *)v5 setRequestIdentifier:v8];
  }
  return v5;
}

+ (id)newLoadAutomaticDownloadQueueOperation
{
  id v2 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v2 setHTTPMethod:@"POST"];
  [v2 setURLBagURLBlock:&stru_1003A35D0];
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithRequestProperties:v2];
  [v3 setNeedsAuthentication:0];
  id v4 = +[NSString stringWithFormat:@"%@.%@", @"automatic-downloads2", @"downloads-url"];
  [v3 setRequestIdentifier:v4];

  return v3;
}

- (NSNumber)accountIdentifier
{
  [(LoadDownloadQueueOperation *)self lock];
  id v3 = self->_accountIdentifier;
  [(LoadDownloadQueueOperation *)self unlock];

  return v3;
}

- (NSOrderedSet)downloads
{
  [(LoadDownloadQueueOperation *)self lock];
  id v3 = self->_downloads;
  [(LoadDownloadQueueOperation *)self unlock];

  return (NSOrderedSet *)v3;
}

- (BOOL)needsAuthentication
{
  [(LoadDownloadQueueOperation *)self lock];
  BOOL needsAuthentication = self->_needsAuthentication;
  [(LoadDownloadQueueOperation *)self unlock];
  return needsAuthentication;
}

- (int64_t)reason
{
  [(LoadDownloadQueueOperation *)self lock];
  int64_t reason = self->_reason;
  [(LoadDownloadQueueOperation *)self unlock];
  return reason;
}

- (NSString)requestIdentifier
{
  [(LoadDownloadQueueOperation *)self lock];
  id v3 = self->_requestIdentifier;
  [(LoadDownloadQueueOperation *)self unlock];

  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setAccountIdentifier:(id)a3
{
  v5 = (NSNumber *)a3;
  [(LoadDownloadQueueOperation *)self lock];
  if (self->_accountIdentifier != v5) {
    objc_storeStrong((id *)&self->_accountIdentifier, a3);
  }
  [(LoadDownloadQueueOperation *)self unlock];
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  [(LoadDownloadQueueOperation *)self lock];
  self->_BOOL needsAuthentication = a3;

  [(LoadDownloadQueueOperation *)self unlock];
}

- (void)setReason:(int64_t)a3
{
  [(LoadDownloadQueueOperation *)self lock];
  self->_int64_t reason = a3;

  [(LoadDownloadQueueOperation *)self unlock];
}

- (void)setRequestIdentifier:(id)a3
{
  id v6 = (NSString *)a3;
  [(LoadDownloadQueueOperation *)self lock];
  if (self->_requestIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v4;
  }
  [(LoadDownloadQueueOperation *)self unlock];
}

- (void)run
{
  id v3 = +[SSURLBagContext contextWithBagType:0];
  id v36 = 0;
  unsigned __int8 v4 = [(LoadDownloadQueueOperation *)self loadURLBagWithContext:v3 returningError:&v36];
  v5 = (NSNumber *)v36;
  id v6 = v5;
  if ((v4 & 1) == 0)
  {
    v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    v27 = [v24 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      int v28 = v26;
    }
    else {
      int v28 = v26 & 2;
    }
    if (v28)
    {
      v29 = objc_opt_class();
      int v37 = 138412546;
      v38 = v29;
      __int16 v39 = 2112;
      v40 = v6;
      id v30 = v29;
      LODWORD(v33) = 22;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_33:

        [(LoadDownloadQueueOperation *)self setError:v6];
        goto LABEL_34;
      }
      v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v37, v33);
      free(v31);
      SSFileLog();
    }

    goto LABEL_33;
  }
  v35 = v5;
  id v7 = objc_alloc((Class)NSMutableArray);
  v8 = +[NSNumber numberWithUnsignedLongLong:0];
  v9 = +[NSNumber numberWithUnsignedLongLong:0];
  objc_super v10 = (NSMutableArray *)objc_msgSend(v7, "initWithObjects:", v8, v9, 0);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v10;

  if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] >= 2)
  {
    while (1)
    {
      if ([(LoadDownloadQueueOperation *)self isCancelled]) {
        goto LABEL_20;
      }
      v12 = [(NSMutableArray *)self->_rangesToLoad objectAtIndex:0];
      v13 = [(NSMutableArray *)self->_rangesToLoad objectAtIndex:1];
      if (![(LoadDownloadQueueOperation *)self _loadDownloadsFromStart:v12 toEnd:v13])
      {
        [(NSMutableArray *)self->_rangesToLoad removeAllObjects];
        goto LABEL_19;
      }
      v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14)
      {
        v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      v17 = [v14 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        int v18 = v16;
      }
      else {
        int v18 = v16 & 2;
      }
      if (!v18) {
        goto LABEL_16;
      }
      v19 = objc_opt_class();
      accountIdentifier = self->_accountIdentifier;
      int v37 = 138413058;
      v38 = v19;
      __int16 v39 = 2112;
      v40 = accountIdentifier;
      __int16 v41 = 2112;
      v42 = v12;
      __int16 v43 = 2112;
      v44 = v13;
      id v21 = v19;
      LODWORD(v34) = 42;
      v32 = &v37;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (v22) {
        break;
      }
LABEL_17:

      -[NSMutableArray removeObjectsInRange:](self->_rangesToLoad, "removeObjectsInRange:", 0, 2);
      -[LoadDownloadQueueOperation setSuccess:](self, "setSuccess:", [(NSMutableArray *)self->_rangesToLoad count] == 0, v32);
LABEL_19:

      if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] <= 1) {
        goto LABEL_20;
      }
    }
    v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v37, v34);
    free(v22);
    v32 = (int *)v17;
    SSFileLog();
LABEL_16:

    goto LABEL_17;
  }
LABEL_20:
  v23 = self->_rangesToLoad;
  self->_rangesToLoad = 0;

  id v6 = v35;
LABEL_34:
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [StoreDownloadQueueResponse alloc];
  v9 = [v7 authenticatedAccountDSID];

  objc_super v10 = [(StoreDownloadQueueResponse *)v8 initWithDictionary:v6 userIdentifier:v9];
  v11 = [(StoreDownloadQueueResponse *)v10 keybag];
  if ([v11 length])
  {
    v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12)
    {
      v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    unsigned int v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v16 = objc_opt_class();
      id v17 = v16;
      [(LoadDownloadQueueOperation *)self requestIdentifier];
      int v20 = 138412546;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 22;
      int v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_13:

        sub_10002E31C(v11);
        goto LABEL_14;
      }
      unsigned int v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v20, v19);
      free(v18);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)_account
{
  id v2 = [(LoadDownloadQueueOperation *)self accountIdentifier];
  if (!v2
    || (+[SSAccountStore defaultStore],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 accountWithUniqueIdentifier:v2],
        unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v5 = +[SSAccountStore defaultStore];
    unsigned __int8 v4 = [v5 activeAccount];
  }

  return v4;
}

- (void)_handleResponse:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [v9 rangesToLoad];
  if ([v4 count]) {
    [(NSMutableArray *)self->_rangesToLoad addObjectsFromArray:v4];
  }
  v5 = [v9 downloads];

  if (v5)
  {
    [(LoadDownloadQueueOperation *)self lock];
    downloads = self->_downloads;
    if (!downloads)
    {
      id v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      v8 = self->_downloads;
      self->_downloads = v7;

      downloads = self->_downloads;
    }
    [(NSMutableOrderedSet *)downloads unionOrderedSet:v5];
    [(LoadDownloadQueueOperation *)self unlock];
  }
}

- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4
{
  id v6 = a3;
  id v52 = a4;
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    v8 |= 2u;
  }
  id v9 = [v7 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (v10)
  {
    v11 = objc_opt_class();
    id v12 = v11;
    unsigned int v13 = [(LoadDownloadQueueOperation *)self requestIdentifier];
    int v55 = 138413314;
    v56 = v11;
    __int16 v57 = 2112;
    v58 = v13;
    __int16 v59 = 2112;
    id v60 = v6;
    __int16 v61 = 2112;
    id v62 = v52;
    __int16 v63 = 2048;
    int64_t v64 = [(LoadDownloadQueueOperation *)self reason];
    LODWORD(v48) = 52;
    v46 = &v55;
    int v14 = (void *)_os_log_send_and_compose_impl();

    if (v14)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v55, v48);
      unsigned int v15 = (int *)objc_claimAutoreleasedReturnValue();
      free(v14);
      v46 = v15;
      SSFileLog();
    }
  }
  else
  {
  }
  int v16 = 0;
  id v17 = 0;
  char v18 = 1;
  id v49 = v6;
  do
  {
    uint64_t v19 = v17;
    id v20 = -[LoadDownloadQueueOperation _newURLOperationWithStartIdentifier:endIdentifier:](self, "_newURLOperationWithStartIdentifier:endIdentifier:", v6, v52, v46);
    id v54 = v17;
    unsigned int v21 = [(LoadDownloadQueueOperation *)self runSubOperation:v20 returningError:&v54];
    id v17 = v54;

    if (!v21)
    {
      unsigned __int8 v40 = 0;
      goto LABEL_36;
    }
    v50 = v16;
    __int16 v22 = [v20 dataProvider];
    id v23 = [v22 output];

    uint64_t v24 = [(LoadDownloadQueueOperation *)self requestIdentifier];
    unsigned int v25 = (void *)v24;
    int v26 = @"unknown";
    if (v24) {
      int v26 = (__CFString *)v24;
    }
    v51 = v26;

    v27 = +[SSLogConfig sharedWriteToDiskConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    id v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      v29 &= 2u;
    }
    if (!v29) {
      goto LABEL_26;
    }
    v31 = objc_opt_class();
    int v55 = 138413314;
    v56 = v31;
    __int16 v57 = 2112;
    v58 = v51;
    __int16 v59 = 2112;
    id v60 = v6;
    __int16 v61 = 2112;
    id v62 = v52;
    __int16 v63 = 2112;
    int64_t v64 = (int64_t)v23;
    id v32 = v31;
    LODWORD(v48) = 52;
    v47 = &v55;
    uint64_t v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
    {
      id v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v55, v48);
      free(v33);
      v47 = (int *)v30;
      SSFileLog();
LABEL_26:
    }
    uint64_t v34 = [StoreDownloadQueueResponse alloc];
    v35 = [v20 authenticatedAccountDSID];
    int v16 = [(StoreDownloadQueueResponse *)v34 initWithDictionary:v23 userIdentifier:v35];

    id v36 = [(StoreDownloadQueueResponse *)v16 error];

    if (v36)
    {
      id v37 = objc_alloc((Class)SSMachineDataRequest);
      v38 = [v20 response];
      id v39 = [v37 initWithURLResponse:v38];

      if (v39)
      {
        id v53 = 0;
        unsigned __int8 v40 = [(LoadDownloadQueueOperation *)self _runMachineDataOperationWithRequest:v39 syncState:&v53];
        id v41 = v53;
        [(LoadDownloadQueueOperation *)self lock];
        v42 = (NSString *)[v41 copy];
        mdSyncState = self->_mdSyncState;
        self->_mdSyncState = v42;

        [(LoadDownloadQueueOperation *)self unlock];
        if (v41) {
          unsigned __int8 v40 = 1;
        }
      }
      else
      {
        unsigned __int8 v40 = 0;
      }
      id v6 = v49;
    }
    else
    {
      unsigned __int8 v40 = 0;
      id v6 = v49;
    }

LABEL_36:
    objc_msgSend(v20, "setDelegate:", 0, v47);

    char v44 = v40 & v18;
    char v18 = 0;
  }
  while ((v44 & 1) != 0);
  if (v21) {
    [(LoadDownloadQueueOperation *)self _handleResponse:v16];
  }
  else {
    [(LoadDownloadQueueOperation *)self setError:v17];
  }

  return v21;
}

- (BOOL)_runMachineDataOperationWithRequest:(id)a3 syncState:(id *)a4
{
  id v6 = a3;
  id v7 = [(LoadDownloadQueueOperation *)self _account];
  unsigned int v8 = [v7 uniqueIdentifier];
  [v6 setAccountIdentifier:v8];

  [v6 setWaitsForPurchaseOperations:1];
  id v9 = [objc_alloc((Class)ISMachineDataActionOperation) initWithMachineDataRequest:v6];

  unsigned __int8 v10 = [(LoadDownloadQueueOperation *)self runSubOperation:v9 returningError:0];
  if (a4)
  {
    *a4 = [v9 syncState];
  }

  return v10;
}

- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)ISStoreURLOperation);
  [v8 setDelegate:self];
  [v8 setMachineDataStyle:0];
  objc_msgSend(v8, "setNeedsAuthentication:", -[LoadDownloadQueueOperation needsAuthentication](self, "needsAuthentication"));
  [v8 setUseUserSpecificURLBag:1];
  id v9 = objc_alloc_init(DaemonProtocolDataProvider);
  [v8 setDataProvider:v9];
  unsigned __int8 v10 = [(LoadDownloadQueueOperation *)self _account];
  id v11 = [objc_alloc((Class)SSAuthenticationContext) initWithAccount:v10];
  [v8 setAuthenticationContext:v11];
  id v12 = [(SSURLRequestProperties *)self->_requestProperties mutableCopy];
  [v12 setAllowedRetryCount:0];
  [v12 setCachePolicy:1];
  [v10 accountScope];
  [v12 setURLBagType:SSURLBagTypeForAccountScope()];
  v51 = v12;
  if ((id)[(LoadDownloadQueueOperation *)self reason] != (id)1)
  {
    [v12 setHTTPMethod:@"POST"];
    unsigned int v13 = +[ISDevice sharedInstance];
    [v13 guid];
    unsigned int v15 = v14 = v6;
    [v51 setValue:v15 forRequestParameter:@"guid"];

    id v6 = v14;
    id v12 = v51;
  }
  int v16 = +[SSDevice currentDevice];
  id v17 = [v16 thinnedApplicationVariantIdentifier];

  if (v17) {
    [v12 setValue:v17 forHTTPHeaderField:SSHTTPHeaderXAppleTADevice];
  }
  [(LoadDownloadQueueOperation *)self lock];
  mdSyncState = self->_mdSyncState;
  if (mdSyncState) {
    [v12 setValue:mdSyncState forHTTPHeaderField:SSHTTPHeaderXAppleMDS];
  }
  [(LoadDownloadQueueOperation *)self unlock];
  uint64_t v19 = [v10 uniqueIdentifier];

  if (v19)
  {
    id v20 = [v10 uniqueIdentifier];
    MachineDataAddHeadersToRequestProperties();
  }
  unsigned int v21 = v6;
  __int16 v22 = (char *)[v6 itemIdentifierValue];
  id v23 = (char *)[v7 itemIdentifierValue];

  if (v22 - 1 < v23)
  {
    +[NSString stringWithFormat:@"%llu", v22];
    id v24 = v8;
    unsigned int v25 = v17;
    int v26 = v10;
    id v27 = v11;
    v29 = unsigned int v28 = v9;
    [v51 setValue:v29 forRequestParameter:kISLoadMoreStartIDParameter];

    id v9 = v28;
    id v11 = v27;
    unsigned __int8 v10 = v26;
    id v17 = v25;
    id v8 = v24;
    id v30 = +[NSString stringWithFormat:@"%llu", v23];
    [v51 setValue:v30 forRequestParameter:kISLoadMoreEndIDParameter];
  }
  if ([(LoadDownloadQueueOperation *)self _shouldSendKeyBagSync])
  {
    id v49 = v17;
    v50 = v21;
    v31 = [(LoadDownloadQueueOperation *)self _account];
    id v32 = [v31 uniqueIdentifier];
    CFDataRef v33 = sub_10002D24C((uint64_t)[v32 unsignedLongLongValue], 1);

    if (![(__CFData *)v33 length])
    {
LABEL_26:

      id v17 = v49;
      unsigned int v21 = v50;
      goto LABEL_27;
    }
    CFDataRef v34 = v33;
    [(__CFData *)v34 bytes];
    [(__CFData *)v34 length];
    v35 = (void *)ISCopyEncodedBase64();
    if (!v35)
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v48 = v9;
    id v36 = +[SSLogConfig sharedDaemonConfig];
    if (!v36)
    {
      id v36 = +[SSLogConfig sharedConfig];
    }
    unsigned int v37 = [v36 shouldLog];
    if ([v36 shouldLogToDisk]) {
      v37 |= 2u;
    }
    v38 = [v36 OSLogObject];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      v37 &= 2u;
    }
    if (v37)
    {
      v47 = v35;
      id v39 = v31;
      unsigned __int8 v40 = objc_opt_class();
      id v46 = v40;
      id v41 = [(LoadDownloadQueueOperation *)self requestIdentifier];
      int v52 = 138412546;
      id v53 = v40;
      v31 = v39;
      v35 = v47;
      __int16 v54 = 2112;
      int v55 = v41;
      LODWORD(v45) = 22;
      char v44 = &v52;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42)
      {
LABEL_24:

        [v51 setValue:v35 forRequestParameter:@"kbsync"];
        id v9 = v48;
        goto LABEL_25;
      }
      v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v52, v45);
      free(v42);
      char v44 = (int *)v38;
      SSFileLog();
    }

    goto LABEL_24;
  }
LABEL_27:
  objc_msgSend(v8, "setRequestProperties:", v51, v44);

  return v8;
}

- (BOOL)_shouldSendKeyBagSync
{
  id v2 = [(LoadDownloadQueueOperation *)self accountIdentifier];
  if (v2)
  {
    id v3 = +[SSURLBagContext contextWithBagType:0];
    unsigned __int8 v4 = +[ISURLBagCache sharedCache];
    v5 = [v4 URLBagForContext:v3];

    id v6 = [v5 valueForKey:kISURLBagAuthCanPostKey];
    if (v6)
    {
      if (objc_opt_respondsToSelector()) {
        unsigned __int8 v7 = [v6 BOOLValue];
      }
      else {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdSyncState, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_downloads, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end