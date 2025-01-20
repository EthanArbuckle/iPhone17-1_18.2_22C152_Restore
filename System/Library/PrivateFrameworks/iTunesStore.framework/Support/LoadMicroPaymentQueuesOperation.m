@interface LoadMicroPaymentQueuesOperation
- (BOOL)_appendAutoRenewQueueToResponse:(id)a3 error:(id *)a4;
- (BOOL)_appendNormalQueueToResponse:(id)a3 error:(id *)a4;
- (BOOL)_appendToResponse:(id)a3 usingOperation:(id)a4 error:(id *)a5;
- (BOOL)_shouldCheckAutoRenewQueue;
- (MicroPaymentQueueResponse)paymentsResponse;
- (NSArray)userDSIDs;
- (NSDate)lastQueueCheckDate;
- (StoreKitClientIdentity)clientIdentity;
- (id)_URLBagContext;
- (int64_t)reason;
- (void)run;
- (void)setClientIdentity:(id)a3;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setPaymentsResponse:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setUserDSIDs:(id)a3;
@end

@implementation LoadMicroPaymentQueuesOperation

- (StoreKitClientIdentity)clientIdentity
{
  [(LoadMicroPaymentQueuesOperation *)self lock];
  id v3 = [(StoreKitClientIdentity *)self->_clientIdentity copy];
  [(LoadMicroPaymentQueuesOperation *)self unlock];

  return (StoreKitClientIdentity *)v3;
}

- (NSDate)lastQueueCheckDate
{
  [(LoadMicroPaymentQueuesOperation *)self lock];
  id v3 = [(NSDate *)self->_lastQueueCheckDate copy];
  [(LoadMicroPaymentQueuesOperation *)self unlock];

  return (NSDate *)v3;
}

- (void)setClientIdentity:(id)a3
{
  v6 = (StoreKitClientIdentity *)a3;
  [(LoadMicroPaymentQueuesOperation *)self lock];
  if (self->_clientIdentity != v6)
  {
    v4 = (StoreKitClientIdentity *)[(StoreKitClientIdentity *)v6 copy];
    clientIdentity = self->_clientIdentity;
    self->_clientIdentity = v4;
  }
  [(LoadMicroPaymentQueuesOperation *)self unlock];
}

- (void)setLastQueueCheckDate:(id)a3
{
  v6 = (NSDate *)a3;
  [(LoadMicroPaymentQueuesOperation *)self lock];
  if (self->_lastQueueCheckDate != v6)
  {
    v4 = (NSDate *)[(NSDate *)v6 copy];
    lastQueueCheckDate = self->_lastQueueCheckDate;
    self->_lastQueueCheckDate = v4;
  }
  [(LoadMicroPaymentQueuesOperation *)self unlock];
}

- (void)run
{
  id v3 = +[SSURLBagContext contextWithBagType:0];
  +[ISLoadURLBagOperation incrementNetworkCounterForBagContext:v3];

  v4 = objc_alloc_init(MicroPaymentQueueResponse);
  v5 = [ClaimStoreKitClientOperation alloc];
  v6 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
  v7 = [(ClaimStoreKitClientOperation *)v5 initWithClientIdentity:v6];

  if ([(LoadMicroPaymentQueuesOperation *)self runSubOperation:v7 returningError:0])
  {
    v8 = [(ClaimStoreKitClientOperation *)v7 clientIdentity];
    [(LoadMicroPaymentQueuesOperation *)self setClientIdentity:v8];
  }
  id v43 = 0;
  BOOL v9 = [(LoadMicroPaymentQueuesOperation *)self _appendNormalQueueToResponse:v4 error:&v43];
  id v10 = v43;
  if (v9)
  {
    if (![(LoadMicroPaymentQueuesOperation *)self _shouldCheckAutoRenewQueue]
      || (id v42 = v10,
          BOOL v9 = [(LoadMicroPaymentQueuesOperation *)self _appendAutoRenewQueueToResponse:v4 error:&v42], v11 = v42, v10, v10 = v11, v9))
    {
      v12 = +[SSLogConfig sharedDaemonConfig];
      if (!v12)
      {
        v12 = +[SSLogConfig sharedConfig];
      }
      id v40 = v10;
      v41 = v7;
      unsigned int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      v15 = [v12 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        int v16 = v14;
      }
      else {
        int v16 = v14 & 2;
      }
      if (v16)
      {
        v17 = objc_opt_class();
        id v39 = v17;
        v18 = [(MicroPaymentQueueResponse *)v4 appReceipt];
        unsigned int v19 = [v18 length];
        v20 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
        v21 = [v20 bundleIdentifier];
        int v44 = 138412802;
        v45 = v17;
        __int16 v46 = 1024;
        LODWORD(v47[0]) = v19;
        WORD2(v47[0]) = 2112;
        *(void *)((char *)v47 + 6) = v21;
        LODWORD(v38) = 28;
        v37 = &v44;
        v22 = (void *)_os_log_send_and_compose_impl();

        if (!v22) {
          goto LABEL_18;
        }
        v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v44, v38);
        free(v22);
        v37 = (int *)v15;
        SSFileLog();
      }

LABEL_18:
      v23 = [(MicroPaymentQueueResponse *)v4 appReceipt];
      id v24 = [v23 length];

      if (v24)
      {
        v25 = [(MicroPaymentQueueResponse *)v4 appReceipt];
        v26 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
        +[AppReceipt writeReceipt:v25 forStoreKitClient:v26];
      }
      v27 = +[SSLogConfig sharedDaemonConfig];
      if (!v27)
      {
        v27 = +[SSLogConfig sharedConfig];
      }
      unsigned int v28 = [v27 shouldLog];
      if ([v27 shouldLogToDisk]) {
        v28 |= 2u;
      }
      v29 = [v27 OSLogObject];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        int v30 = v28;
      }
      else {
        int v30 = v28 & 2;
      }
      if (v30)
      {
        v31 = objc_opt_class();
        id v32 = v31;
        v33 = [(MicroPaymentQueueResponse *)v4 payments];
        id v34 = [v33 count];
        int v44 = 138412546;
        v45 = v31;
        __int16 v46 = 2048;
        v47[0] = v34;
        LODWORD(v38) = 22;
        v37 = &v44;
        v35 = (void *)_os_log_send_and_compose_impl();

        id v10 = v40;
        if (!v35)
        {
LABEL_32:

          [(LoadMicroPaymentQueuesOperation *)self setPaymentsResponse:v4];
          BOOL v9 = 1;
          v7 = v41;
          goto LABEL_33;
        }
        v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v44, v38);
        free(v35);
        v37 = (int *)v29;
        SSFileLog();
      }
      else
      {
        id v10 = v40;
      }

      goto LABEL_32;
    }
  }
LABEL_33:
  -[LoadMicroPaymentQueuesOperation setError:](self, "setError:", v10, v37);
  [(LoadMicroPaymentQueuesOperation *)self setSuccess:v9];
  v36 = +[SSURLBagContext contextWithBagType:0];
  +[ISLoadURLBagOperation decrementNetworkCounterForBagContext:v36];
}

- (BOOL)_appendAutoRenewQueueToResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(LoadMicroPaymentQueueOperation);
  v8 = [(LoadMicroPaymentQueuesOperation *)self lastQueueCheckDate];
  [(LoadMicroPaymentQueueOperation *)v7 setLastQueueCheckDate:v8];

  [(LoadMicroPaymentQueueOperation *)v7 setQueueCountURLBagKey:@"p2-in-app-check-recurring-download-queue"];
  [(LoadMicroPaymentQueueOperation *)v7 setQueuePaymentsURLBagKey:@"p2-in-app-recurring-transactions"];
  BOOL v9 = objc_alloc_init(MicroPaymentQueueRequest);
  id v10 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
  [(MicroPaymentQueueRequest *)v9 setClientIdentity:v10];

  [(LoadMicroPaymentQueueOperation *)v7 setRequest:v9];
  id v15 = 0;
  BOOL v11 = [(LoadMicroPaymentQueuesOperation *)self _appendToResponse:v6 usingOperation:v7 error:&v15];

  id v12 = v15;
  unsigned int v13 = v12;
  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_appendNormalQueueToResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(LoadMicroPaymentQueueOperation);
  v8 = [(LoadMicroPaymentQueuesOperation *)self lastQueueCheckDate];
  [(LoadMicroPaymentQueueOperation *)v7 setLastQueueCheckDate:v8];

  [(LoadMicroPaymentQueueOperation *)v7 setQueueCountURLBagKey:@"p2-in-app-check-download-queue"];
  [(LoadMicroPaymentQueueOperation *)v7 setQueuePaymentsURLBagKey:@"p2-in-app-pending-transactions"];
  BOOL v9 = objc_alloc_init(MicroPaymentQueueRequest);
  id v10 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
  [(MicroPaymentQueueRequest *)v9 setClientIdentity:v10];

  [(LoadMicroPaymentQueueOperation *)v7 setRequest:v9];
  id v15 = 0;
  BOOL v11 = [(LoadMicroPaymentQueuesOperation *)self _appendToResponse:v6 usingOperation:v7 error:&v15];

  id v12 = v15;
  unsigned int v13 = v12;
  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_appendToResponse:(id)a3 usingOperation:(id)a4 error:(id *)a5
{
  id v30 = a3;
  id v8 = a4;
  v29 = self;
  [(LoadMicroPaymentQueuesOperation *)self userDSIDs];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    v27 = a5;
    id obj = v9;
    id v12 = 0;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      int v14 = 0;
      id v15 = v12;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v14);
        v18 = objc_alloc_init(LoadMicroPaymentQueueOperation);
        -[LoadMicroPaymentQueueOperation setExpectedCount:](v18, "setExpectedCount:", [v8 expectedCount]);
        unsigned int v19 = [v8 lastQueueCheckDate];
        [(LoadMicroPaymentQueueOperation *)v18 setLastQueueCheckDate:v19];

        v20 = [v8 queueCountURLBagKey];
        [(LoadMicroPaymentQueueOperation *)v18 setQueueCountURLBagKey:v20];

        v21 = [v8 queuePaymentsURLBagKey];
        [(LoadMicroPaymentQueueOperation *)v18 setQueuePaymentsURLBagKey:v21];

        v22 = [v8 request];
        id v23 = [v22 copy];

        [v23 setUserIdentifier:v16];
        [(LoadMicroPaymentQueueOperation *)v18 setRequest:v23];
        id v31 = v15;
        LODWORD(v22) = [(LoadMicroPaymentQueuesOperation *)v29 runSubOperation:v18 returningError:&v31];
        id v12 = v31;

        if (!v22)
        {

          id v9 = obj;

          if (v27)
          {
            id v12 = v12;
            BOOL v25 = 0;
            id *v27 = v12;
          }
          else
          {
            BOOL v25 = 0;
          }
          goto LABEL_15;
        }
        id v24 = [(LoadMicroPaymentQueueOperation *)v18 response];
        [v30 appendResponse:v24];

        int v14 = (char *)v14 + 1;
        id v15 = v12;
      }
      while (v11 != v14);
      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }

  BOOL v25 = 1;
LABEL_15:

  return v25;
}

- (BOOL)_shouldCheckAutoRenewQueue
{
  v2 = [(LoadMicroPaymentQueuesOperation *)self _URLBagContext];
  id v3 = +[ISURLBagCache sharedCache];
  v4 = [v3 URLBagForContext:v2];

  v5 = [v4 urlForKey:@"p2-in-app-check-recurring-download-queue"];
  if (v5)
  {
    id v6 = [v4 urlForKey:@"p2-in-app-recurring-transactions"];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_URLBagContext
{
  v2 = [(LoadMicroPaymentQueuesOperation *)self clientIdentity];
  unsigned int v3 = [v2 isSandboxed];

  v4 = +[SSURLBagContext contextWithBagType:v3];

  return v4;
}

- (MicroPaymentQueueResponse)paymentsResponse
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPaymentsResponse:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSArray)userDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDSIDs, 0);
  objc_storeStrong((id *)&self->_paymentsResponse, 0);
  objc_storeStrong((id *)&self->_lastQueueCheckDate, 0);

  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

@end