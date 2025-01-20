@interface ISMachineDataSyncOperation
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesServerDrivenDialogs;
- (ISMachineDataSyncOperation)initWithAccountIdentifier:(unint64_t)a3 syncData:(id)a4;
- (NSString)syncState;
- (NSString)userAgent;
- (id)_newSyncOperationWithClientData:(id)a3 machineIDData:(id)a4;
- (int64_t)protocolVersion;
- (void)run;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setHidesServerDrivenDialogs:(BOOL)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISMachineDataSyncOperation

- (ISMachineDataSyncOperation)initWithAccountIdentifier:(unint64_t)a3 syncData:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISMachineDataSyncOperation;
  v7 = [(ISOperation *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_accountID = a3;
    uint64_t v9 = [v6 copy];
    inputData = v8->_inputData;
    v8->_inputData = (NSData *)v9;
  }
  return v8;
}

- (BOOL)allowsBootstrapCellularData
{
  [(ISOperation *)self lock];
  BOOL allowsBootstrapCellularData = self->_allowsBootstrapCellularData;
  [(ISOperation *)self unlock];
  return allowsBootstrapCellularData;
}

- (BOOL)hidesServerDrivenDialogs
{
  [(ISOperation *)self lock];
  BOOL hidesServerDrivenDialogs = self->_hidesServerDrivenDialogs;
  [(ISOperation *)self unlock];
  return hidesServerDrivenDialogs;
}

- (int64_t)protocolVersion
{
  [(ISOperation *)self lock];
  int64_t protocolVersion = self->_protocolVersion;
  [(ISOperation *)self unlock];
  return protocolVersion;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_BOOL allowsBootstrapCellularData = a3;

  [(ISOperation *)self unlock];
}

- (void)setHidesServerDrivenDialogs:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_BOOL hidesServerDrivenDialogs = a3;

  [(ISOperation *)self unlock];
}

- (void)setProtocolVersion:(int64_t)a3
{
  [(ISOperation *)self lock];
  self->_int64_t protocolVersion = a3;

  [(ISOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  id v6 = (NSString *)a3;
  [(ISOperation *)self lock];
  if (self->_userAgent != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }
  [(ISOperation *)self unlock];
}

- (NSString)syncState
{
  [(NSLock *)self->super._lock lock];
  v3 = self->_syncState;
  [(NSLock *)self->super._lock unlock];

  return v3;
}

- (NSString)userAgent
{
  [(ISOperation *)self lock];
  v3 = self->_userAgent;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  unsigned int v33 = 0;
  uint64_t v32 = 0;
  unsigned int v31 = 0;
  if (self->_protocolVersion == 1) {
    unint64_t accountID = -1;
  }
  else {
    unint64_t accountID = self->_accountID;
  }
  int v4 = SSVAnisetteSynchronize();
  uint64_t v5 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      v7 |= 2u;
    }
    v8 = [v6 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v35 = 138412546;
      id v36 = (id)objc_opt_class();
      __int16 v37 = 2048;
      unint64_t v38 = v4;
      id v10 = v36;
      LODWORD(v29) = 22;
      v28 = &v35;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (v11)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v35, v29);
        objc_super v12 = (int *)objc_claimAutoreleasedReturnValue();
        free(v11);
        v28 = v12;
        SSFileLog();
      }
    }
    else
    {
    }
    SSError();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v21 = 0;
    goto LABEL_35;
  }
  if (!v5)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v13 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  v15 = [v6 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_25;
  }
  int v35 = 138412546;
  id v36 = (id)objc_opt_class();
  __int16 v37 = 2048;
  unint64_t v38 = accountID;
  id v16 = v36;
  LODWORD(v29) = 22;
  v28 = &v35;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v35, v29);
    free(v17);
    v28 = (int *)v15;
    SSFileLog();
LABEL_25:
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v32 length:v31 freeWhenDone:0];
  v19 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v34 length:v33 freeWhenDone:0];
  id v20 = [(ISMachineDataSyncOperation *)self _newSyncOperationWithClientData:v18 machineIDData:v19];
  id v30 = 0;
  BOOL v21 = [(ISOperation *)self runSubOperation:v20 returningError:&v30];
  id v22 = v30;
  if (v21)
  {
    v23 = [v20 dataProvider];
    v24 = [v23 output];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [v24 objectForKey:@"syncState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NSLock *)self->super._lock lock];
        v26 = (NSString *)[v25 copy];
        syncState = self->_syncState;
        self->_syncState = v26;

        [(NSLock *)self->super._lock unlock];
      }
    }
  }

LABEL_35:
  if (v34) {
    MEMORY[0x2166C7490]();
  }
  if (v32) {
    MEMORY[0x2166C7490]();
  }
  -[ISOperation setError:](self, "setError:", v22, v28);
  [(ISOperation *)self setSuccess:v21];
}

- (id)_newSyncOperationWithClientData:(id)a3 machineIDData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(ISStoreURLOperation);
  [(ISStoreURLOperation *)v8 setUseUserSpecificURLBag:1];
  BOOL v9 = [(ISMachineDataSyncOperation *)self hidesServerDrivenDialogs];
  id v10 = [(ISMachineDataSyncOperation *)self userAgent];
  v11 = +[ISDataProvider provider];
  BOOL v12 = !v9;
  [v11 setShouldProcessAuthenticationDialogs:!v9];
  [v11 setShouldProcessDialogs:!v9];
  [(ISURLOperation *)v8 setDataProvider:v11];
  id v13 = objc_alloc(MEMORY[0x263F7B288]);
  int v14 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
  v15 = (void *)[v13 initWithAccountIdentifier:v14];

  if (!v12)
  {
    [v15 setPromptStyle:1000];
    [v15 setShouldSuppressDialogs:1];
  }
  objc_msgSend(v15, "setAllowsBootstrapCellularData:", -[ISMachineDataSyncOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  uint64_t v16 = *MEMORY[0x263F7B788];
  [v15 setValue:v10 forHTTPHeaderField:*MEMORY[0x263F7B788]];
  [(ISURLOperation *)v8 setAuthenticationContext:v15];
  id v17 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v17 setAllowedRetryCount:0];
  objc_msgSend(v17, "setAllowsBootstrapCellularData:", -[ISMachineDataSyncOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  [v17 setHTTPMethod:@"POST"];
  [v17 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v17 setValue:v10 forHTTPHeaderField:v16];
  v18 = [v7 base64EncodedStringWithOptions:0];

  [v17 setValue:v18 forRequestParameter:@"clientData"];
  v19 = [v6 base64EncodedStringWithOptions:0];

  [v17 setValue:v19 forRequestParameter:@"machineId"];
  int64_t v20 = [(ISMachineDataSyncOperation *)self protocolVersion];
  if (v20 == 1)
  {
    [v17 setURLBagKey:@"amd-sync-machine"];
  }
  else if (!v20)
  {
    [v17 setURLBagKey:@"md-sync-machine"];
    BOOL v21 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
    [v17 setValue:v21 forRequestParameter:@"dsId"];
  }
  [(ISURLOperation *)v8 setRequestProperties:v17];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_syncState, 0);

  objc_storeStrong((id *)&self->_inputData, 0);
}

@end