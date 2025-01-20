@interface ISMachineDataActionOperation
- (BOOL)_eraseProvisioning;
- (BOOL)_provisionWithRequest:(id)a3 error:(id *)a4;
- (BOOL)_shouldRetryAfterError:(id)a3;
- (BOOL)_syncMachineWithRequest:(id)a3 error:(id *)a4;
- (BOOL)blocksPurchaseRequests;
- (BOOL)hidesServerDrivenDialogs;
- (ISMachineDataActionOperation)initWithMachineDataRequest:(id)a3;
- (NSString)syncState;
- (NSString)userAgent;
- (SSMachineDataRequest)machineDataRequest;
- (id)resultBlock;
- (id)uniqueKey;
- (void)run;
- (void)setBlocksPurchaseRequests:(BOOL)a3;
- (void)setHidesServerDrivenDialogs:(BOOL)a3;
- (void)setResultBlock:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISMachineDataActionOperation

- (ISMachineDataActionOperation)initWithMachineDataRequest:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISMachineDataActionOperation;
  id v6 = [(ISOperation *)&v8 init];
  if (v6)
  {
    *((unsigned char *)v6 + 331) = [v5 waitsForPurchaseOperations];
    objc_storeStrong((id *)v6 + 42, a3);
  }

  return (ISMachineDataActionOperation *)v6;
}

- (BOOL)blocksPurchaseRequests
{
  [(ISOperation *)self lock];
  BOOL v3 = *(&self->super._success + 1);
  [(ISOperation *)self unlock];
  return v3;
}

- (BOOL)hidesServerDrivenDialogs
{
  [(ISOperation *)self lock];
  BOOL v3 = *(&self->super._success + 2);
  [(ISOperation *)self unlock];
  return v3;
}

- (SSMachineDataRequest)machineDataRequest
{
  return (SSMachineDataRequest *)*(id *)&self->_blocksPurchaseRequests;
}

- (id)resultBlock
{
  [(ISOperation *)self lock];
  BOOL v3 = (void *)[(SSMachineDataRequest *)self->_request copy];
  [(ISOperation *)self unlock];
  v4 = (void *)MEMORY[0x2166C7C80](v3);

  return v4;
}

- (void)setBlocksPurchaseRequests:(BOOL)a3
{
  [(ISOperation *)self lock];
  *(&self->super._success + 1) = a3;

  [(ISOperation *)self unlock];
}

- (void)setHidesServerDrivenDialogs:(BOOL)a3
{
  [(ISOperation *)self lock];
  *(&self->super._success + 2) = a3;

  [(ISOperation *)self unlock];
}

- (void)setResultBlock:(id)a3
{
  id v6 = (SSMachineDataRequest *)a3;
  [(ISOperation *)self lock];
  if (self->_request != v6)
  {
    v4 = (SSMachineDataRequest *)[(SSMachineDataRequest *)v6 copy];
    request = self->_request;
    self->_request = v4;
  }
  [(ISOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  id v6 = (NSString *)a3;
  [(ISOperation *)self lock];
  if (self->_syncState != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    syncState = self->_syncState;
    self->_syncState = v4;
  }
  [(ISOperation *)self unlock];
}

- (NSString)syncState
{
  [(NSLock *)self->super._lock lock];
  id v3 = self->_resultBlock;
  [(NSLock *)self->super._lock unlock];

  return (NSString *)v3;
}

- (NSString)userAgent
{
  [(ISOperation *)self lock];
  id v3 = self->_syncState;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    objc_super v8 = *(void **)&self->_blocksPurchaseRequests;
    int v30 = 138543618;
    v31 = v7;
    __int16 v32 = 2114;
    v33 = v8;
    id v9 = v7;
    LODWORD(v27) = 22;
    v26 = &v30;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v30, v27);
    free(v10);
    v26 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  v11 = [*(id *)&self->_blocksPurchaseRequests actionName];
  if ([v11 isEqualToString:@"SP"])
  {
    uint64_t v12 = *(void *)&self->_blocksPurchaseRequests;
    v29 = 0;
    BOOL v13 = [(ISMachineDataActionOperation *)self _provisionWithRequest:v12 error:&v29];
    v14 = v29;
LABEL_16:
    id v16 = v14;
    goto LABEL_17;
  }
  if ([v11 isEqualToString:@"SM"])
  {
    uint64_t v15 = *(void *)&self->_blocksPurchaseRequests;
    v28 = 0;
    BOOL v13 = [(ISMachineDataActionOperation *)self _syncMachineWithRequest:v15 error:&v28];
    v14 = v28;
    goto LABEL_16;
  }
  if ([v11 isEqualToString:@"RP"])
  {
    BOOL v13 = [(ISMachineDataActionOperation *)self _eraseProvisioning];
    id v16 = 0;
    goto LABEL_17;
  }
  v19 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
  if (!v19)
  {
    v19 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v20 = objc_msgSend(v19, "shouldLog", v26);
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    v21 &= 2u;
  }
  if (!v21) {
    goto LABEL_32;
  }
  v23 = objc_opt_class();
  int v30 = 138543618;
  v31 = v23;
  __int16 v32 = 2114;
  v33 = v11;
  id v24 = v23;
  LODWORD(v27) = 22;
  v26 = &v30;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v30, v27);
    free(v25);
    v26 = (int *)v22;
    SSFileLog();
LABEL_32:
  }
  SSError();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v13 = 0;
LABEL_17:
  -[ISOperation setError:](self, "setError:", v16, v26);
  [(ISOperation *)self setSuccess:v13];
  v17 = [(ISMachineDataActionOperation *)self resultBlock];
  if (v17)
  {
    v18 = [(ISMachineDataActionOperation *)self syncState];
    ((void (**)(void, BOOL, id, void *))v17)[2](v17, v13, v16, v18);

    [(ISMachineDataActionOperation *)self setResultBlock:0];
  }
}

- (id)uniqueKey
{
  if ([(ISMachineDataActionOperation *)self blocksPurchaseRequests]) {
    return @"com.apple.itunesstored.PurchaseOperation";
  }
  else {
    return 0;
  }
}

- (BOOL)_eraseProvisioning
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([*(id *)&self->_blocksPurchaseRequests protocolVersion] == 1)
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
    if (!v3)
    {
      id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = objc_opt_class();
      id v7 = *(id *)&v22[4];
      LODWORD(v21) = 12;
      objc_super v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:
        uint64_t v9 = -1;
        goto LABEL_25;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v22, v21, *(_OWORD *)v22);
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
  v10 = [*(id *)&self->_blocksPurchaseRequests accountIdentifier];
  uint64_t v9 = [v10 unsignedLongLongValue];

  id v3 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v11 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  BOOL v13 = [v3 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    v12 &= 2u;
  }
  if (v12)
  {
    v14 = objc_opt_class();
    uint64_t v15 = NSString;
    id v16 = v14;
    v17 = objc_msgSend(v15, "stringWithFormat:", @"%llu", v9);
    SSHashIfNeeded();
    *(_DWORD *)v22 = 138543618;
    *(void *)&v22[4] = v14;
    *(void *)&v22[14] = *(_WORD *)&v22[12] = 2114;
    LODWORD(v21) = 22;
    v18 = (void *)_os_log_send_and_compose_impl();

    if (v18)
    {
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, v22, v21);
      free(v18);
      SSFileLog();
    }
  }
  else
  {
  }
LABEL_25:

  return MEMORY[0x2166C7460](v9) == 0;
}

- (BOOL)_provisionWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 accountIdentifier];
  uint64_t v7 = [v6 unsignedLongLongValue];

  objc_super v8 = [v5 actionData];
  BOOL v9 = [(ISMachineDataActionOperation *)self hidesServerDrivenDialogs];
  id v10 = 0;
  uint64_t v11 = 5;
  while (1)
  {
    int v12 = [[ISMachineDataProvisioningOperation alloc] initWithAccountIdentifier:v7 provisioningData:v8];
    -[ISMachineDataProvisioningOperation setAllowsBootstrapCellularData:](v12, "setAllowsBootstrapCellularData:", [v5 allowsBootstrapCellularData]);
    [(ISMachineDataProvisioningOperation *)v12 setHidesServerDrivenDialogs:v9];
    -[ISMachineDataProvisioningOperation setProtocolVersion:](v12, "setProtocolVersion:", [v5 protocolVersion]);
    BOOL v13 = [(ISMachineDataActionOperation *)self userAgent];
    [(ISMachineDataProvisioningOperation *)v12 setUserAgent:v13];

    id v18 = 0;
    BOOL v14 = [(ISOperation *)self runSubOperation:v12 returningError:&v18];
    id v10 = v18;
    if (v14 || ![(ISMachineDataActionOperation *)self _shouldRetryAfterError:v10]) {
      break;
    }

    if (!--v11) {
      goto LABEL_7;
    }
  }

LABEL_7:
  if (a4) {
    char v15 = v14;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v10;
  }

  return v14;
}

- (BOOL)_shouldRetryAfterError:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F08570]])
  {
    BOOL v5 = 1;
  }
  else if ([v4 isEqualToString:*MEMORY[0x263F7B758]])
  {
    BOOL v5 = [v3 code] == 109;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_syncMachineWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 accountIdentifier];
  uint64_t v7 = [v6 unsignedLongLongValue];

  objc_super v8 = [v5 actionData];
  BOOL v9 = [(ISMachineDataActionOperation *)self hidesServerDrivenDialogs];
  id v10 = 0;
  uint64_t v11 = 5;
  while (1)
  {
    int v12 = [[ISMachineDataSyncOperation alloc] initWithAccountIdentifier:v7 syncData:v8];
    [(ISMachineDataSyncOperation *)v12 setHidesServerDrivenDialogs:v9];
    -[ISMachineDataSyncOperation setProtocolVersion:](v12, "setProtocolVersion:", [v5 protocolVersion]);
    BOOL v13 = [(ISMachineDataActionOperation *)self userAgent];
    [(ISMachineDataSyncOperation *)v12 setUserAgent:v13];

    id v20 = 0;
    BOOL v14 = [(ISOperation *)self runSubOperation:v12 returningError:&v20];
    id v10 = v20;
    if (v14) {
      break;
    }
    if (![(ISMachineDataActionOperation *)self _shouldRetryAfterError:v10]) {
      goto LABEL_7;
    }

    if (!--v11) {
      goto LABEL_8;
    }
  }
  [(NSLock *)self->super._lock lock];
  char v15 = [(ISMachineDataSyncOperation *)v12 syncState];
  id resultBlock = self->_resultBlock;
  self->_id resultBlock = v15;

  [(NSLock *)self->super._lock unlock];
LABEL_7:

LABEL_8:
  if (a4) {
    char v17 = v14;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a4 = v10;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_blocksPurchaseRequests, 0);
}

@end