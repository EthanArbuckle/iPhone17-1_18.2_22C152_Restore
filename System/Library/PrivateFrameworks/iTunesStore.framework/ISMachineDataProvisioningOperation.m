@interface ISMachineDataProvisioningOperation
- (BOOL)_finishProvisioningWithResponse:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesServerDrivenDialogs;
- (ISMachineDataProvisioningOperation)initWithAccountIdentifier:(unint64_t)a3 provisioningData:(id)a4;
- (NSString)userAgent;
- (id)_newFinishProvisioningOperationWithData:(id)a3;
- (int64_t)protocolVersion;
- (void)run;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setHidesServerDrivenDialogs:(BOOL)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISMachineDataProvisioningOperation

- (ISMachineDataProvisioningOperation)initWithAccountIdentifier:(unint64_t)a3 provisioningData:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISMachineDataProvisioningOperation;
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

- (NSString)userAgent
{
  [(ISOperation *)self lock];
  v3 = self->_userAgent;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  unint64_t accountID = self->_accountID;
  if ([(ISMachineDataProvisioningOperation *)self protocolVersion] == 1) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = accountID;
  }
  int v5 = SSVAnisetteProvisioningStart();
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
  v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
    {
      v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v14 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v7 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      v18 = objc_opt_class();
      v19 = NSString;
      id v20 = v18;
      v21 = objc_msgSend(v19, "stringWithFormat:", @"%llu", v4);
      v22 = SSHashIfNeeded();
      int v60 = 138543874;
      id v61 = v18;
      __int16 v62 = 2114;
      v63 = v22;
      __int16 v64 = 2048;
      uint64_t v65 = v58;
      LODWORD(v52) = 32;
      v51 = &v60;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_27;
      }
      v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v60, v52);
      free(v23);
      v51 = (int *)v16;
      SSFileLog();
    }

LABEL_27:
    v24 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v59 length:HIDWORD(v58) freeWhenDone:0];
    id v25 = [(ISMachineDataProvisioningOperation *)self _newFinishProvisioningOperationWithData:v24];
    id v57 = 0;
    BOOL v26 = [(ISOperation *)self runSubOperation:v25 returningError:&v57];
    id v27 = v57;
    v28 = v27;
    id v55 = v25;
    if (v26)
    {
      v29 = [v25 dataProvider];
      v30 = [v29 output];
      id v56 = v28;
      BOOL v31 = [(ISMachineDataProvisioningOperation *)self _finishProvisioningWithResponse:v30 sessionID:v58 error:&v56];
      id v32 = v56;

      if (v31)
      {
        v33 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
        if (!v33)
        {
          v33 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v34 = objc_msgSend(v33, "shouldLog", v51);
        if ([v33 shouldLogToDisk]) {
          int v35 = v34 | 2;
        }
        else {
          int v35 = v34;
        }
        v36 = [v33 OSLogObject];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          int v37 = v35;
        }
        else {
          int v37 = v35 & 2;
        }
        if (v37)
        {
          v38 = objc_opt_class();
          v39 = NSString;
          id v53 = v38;
          v40 = objc_msgSend(v39, "stringWithFormat:", @"%llu", v4);
          v41 = SSHashIfNeeded();
          int v60 = 138543874;
          id v61 = v38;
          __int16 v62 = 2114;
          v63 = v41;
          __int16 v64 = 2048;
          uint64_t v65 = v58;
          LODWORD(v52) = 32;
          v51 = &v60;
          v42 = (void *)_os_log_send_and_compose_impl();

          if (!v42)
          {
            uint64_t v43 = 1;
            id v25 = v55;
            goto LABEL_58;
          }
          v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v60, v52);
          free(v42);
          v51 = (int *)v36;
          SSFileLog();
        }
        uint64_t v43 = 1;
        goto LABEL_55;
      }
      id v25 = v55;
    }
    else
    {
      id v32 = v27;
    }
    v33 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedFairPlayAnisetteConfig", v51);
    if (!v33)
    {
      v33 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v44 = [v33 shouldLog];
    if ([v33 shouldLogToDisk]) {
      v44 |= 2u;
    }
    v36 = [v33 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      int v45 = v44;
    }
    else {
      int v45 = v44 & 2;
    }
    if (!v45)
    {
      uint64_t v43 = 0;
      goto LABEL_57;
    }
    v54 = v24;
    v46 = objc_opt_class();
    v47 = NSString;
    id v48 = v46;
    v49 = objc_msgSend(v47, "stringWithFormat:", @"%llu", v4);
    v50 = SSHashIfNeeded();
    int v60 = 138544130;
    id v61 = v46;
    __int16 v62 = 2114;
    v63 = v50;
    __int16 v64 = 2048;
    uint64_t v65 = v58;
    __int16 v66 = 2114;
    id v67 = v32;
    LODWORD(v52) = 42;
    v51 = &v60;
    uint64_t v43 = _os_log_send_and_compose_impl();

    if (!v43)
    {
      v24 = v54;
      id v25 = v55;
      goto LABEL_58;
    }
    v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v60, v52);
    free((void *)v43);
    v51 = (int *)v36;
    SSFileLog();
    uint64_t v43 = 0;
    v24 = v54;
LABEL_55:
    id v25 = v55;
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  if (!v6)
  {
    v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v60 = 138543618;
    id v61 = (id)objc_opt_class();
    __int16 v62 = 2048;
    v63 = (void *)v5;
    id v11 = v61;
    LODWORD(v52) = 22;
    v51 = &v60;
    objc_super v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v60, v52);
      v13 = (int *)objc_claimAutoreleasedReturnValue();
      free(v12);
      v51 = v13;
      SSFileLog();
    }
  }
  else
  {
  }
  SSError();
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = 0;
LABEL_59:
  if (v59) {
    MEMORY[0x2166C7490]();
  }
  if (v58) {
    MEMORY[0x2166C7470]();
  }
  -[ISOperation setError:](self, "setError:", v32, v51);
  [(ISOperation *)self setSuccess:v43];
}

- (BOOL)_finishProvisioningWithResponse:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = [v7 objectForKey:@"transportKey"];
  int v9 = [v7 objectForKey:@"keybag"];
  v10 = [v7 objectForKey:@"settingInfo"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
    if (!v21)
    {
      v21 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (!v23) {
      goto LABEL_36;
    }
    int v45 = 138543618;
    id v46 = (id)objc_opt_class();
    __int16 v47 = 2114;
    unint64_t v48 = (unint64_t)v10;
    id v25 = v46;
    LODWORD(v42) = 22;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
    if (!v21)
    {
      v21 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v26 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      v27 &= 2u;
    }
    if (!v27) {
      goto LABEL_36;
    }
    int v45 = 138543618;
    id v46 = (id)objc_opt_class();
    __int16 v47 = 2114;
    unint64_t v48 = (unint64_t)v8;
    id v25 = v46;
    LODWORD(v42) = 22;
LABEL_34:
    v28 = (void *)_os_log_send_and_compose_impl();

    if (!v28)
    {
LABEL_37:

      v29 = 0;
      goto LABEL_38;
    }
    v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v45, v42);
    free(v28);
    SSFileLog();
LABEL_36:

    goto LABEL_37;
  }
  if ([v9 length] && (SSVFairPlayImportKeybagData() & 1) == 0)
  {
    BOOL v31 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
    if (!v31)
    {
      BOOL v31 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    int v34 = [v31 OSLogObject];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      v33 &= 2u;
    }
    if (v33)
    {
      int v45 = 138543362;
      id v46 = (id)objc_opt_class();
      id v35 = v46;
      LODWORD(v42) = 12;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_53:

        v29 = SSError();
LABEL_38:
        BOOL v13 = 0;
        if (!a5) {
          goto LABEL_41;
        }
        goto LABEL_39;
      }
      int v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v45, v42);
      free(v36);
      SSFileLog();
    }

    goto LABEL_53;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];
  uint64_t v43 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
  int v44 = (void *)v11;
  int v12 = SSVAnisetteProvisioningEnd();
  BOOL v13 = v12 == 0;
  uint64_t v14 = [MEMORY[0x263F7B1F8] sharedFairPlayAnisetteConfig];
  int v15 = (void *)v14;
  if (!v12)
  {
    if (!v14)
    {
      int v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v37 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    v39 = [v15 OSLogObject];
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      v38 &= 2u;
    }
    if (v38)
    {
      int v45 = 138543618;
      id v46 = (id)objc_opt_class();
      __int16 v47 = 2048;
      unint64_t v48 = a4;
      id v40 = v46;
      LODWORD(v42) = 22;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_65:

        v29 = 0;
        goto LABEL_68;
      }
      v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v45, v42);
      free(v41);
      SSFileLog();
    }

    goto LABEL_65;
  }
  if (!v14)
  {
    int v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    v16 |= 2u;
  }
  int v17 = [v15 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    v16 &= 2u;
  }
  if (v16)
  {
    int v45 = 138543618;
    id v46 = (id)objc_opt_class();
    __int16 v47 = 2048;
    unint64_t v48 = v12;
    id v18 = v46;
    LODWORD(v42) = 22;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      id v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v45, v42);
      free(v19);
      SSFileLog();
    }
  }
  else
  {
  }
  v29 = SSError();
LABEL_68:

  if (!a5) {
    goto LABEL_41;
  }
LABEL_39:
  if (!v13) {
    *a5 = v29;
  }
LABEL_41:

  return v13;
}

- (id)_newFinishProvisioningOperationWithData:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(ISStoreURLOperation);
  [(ISStoreURLOperation *)v5 setShouldSendXTokenHeader:1];
  [(ISStoreURLOperation *)v5 setUseUserSpecificURLBag:1];
  BOOL v6 = [(ISMachineDataProvisioningOperation *)self hidesServerDrivenDialogs];
  id v7 = [(ISMachineDataProvisioningOperation *)self userAgent];
  int v8 = +[ISDataProvider provider];
  BOOL v9 = !v6;
  [v8 setShouldProcessAuthenticationDialogs:!v6];
  [v8 setShouldProcessDialogs:!v6];
  [(ISURLOperation *)v5 setDataProvider:v8];
  id v10 = objc_alloc(MEMORY[0x263F7B288]);
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
  int v12 = (void *)[v10 initWithAccountIdentifier:v11];

  if (!v9)
  {
    [v12 setPromptStyle:1000];
    [v12 setShouldSuppressDialogs:1];
  }
  objc_msgSend(v12, "setAllowsBootstrapCellularData:", -[ISMachineDataProvisioningOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  uint64_t v13 = *MEMORY[0x263F7B788];
  [v12 setValue:v7 forHTTPHeaderField:*MEMORY[0x263F7B788]];
  [(ISURLOperation *)v5 setAuthenticationContext:v12];
  id v14 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v14 setAllowedRetryCount:0];
  objc_msgSend(v14, "setAllowsBootstrapCellularData:", -[ISMachineDataProvisioningOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  [v14 setHTTPMethod:@"POST"];
  [v14 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v14 setValue:v7 forHTTPHeaderField:v13];
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v16 = [v4 base64EncodedStringWithOptions:0];

  [v15 setObject:v16 forKey:@"clientData"];
  int v17 = +[ISDevice sharedInstance];
  id v18 = [v17 guid];

  if (v18) {
    [v15 setObject:v18 forKey:@"guid"];
  }
  int64_t v19 = [(ISMachineDataProvisioningOperation *)self protocolVersion];
  if (v19 == 1)
  {
    [v14 setURLBagKey:@"amd-finish-provisioning"];
  }
  else if (!v19)
  {
    id v20 = (void *)SSVFairPlayCopyKeyBagSyncData();
    if (v20) {
      [v15 setObject:v20 forKey:@"kbsync"];
    }
    v21 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
    [v15 setObject:v21 forKey:@"dsId"];

    [v14 setURLBagKey:@"md-finish-provisioning"];
  }
  int v22 = [MEMORY[0x263F08AC0] dataWithPropertyList:v15 format:100 options:0 error:0];
  [v14 setHTTPBody:v22];

  [(ISURLOperation *)v5 setRequestProperties:v14];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);

  objc_storeStrong((id *)&self->_inputData, 0);
}

@end