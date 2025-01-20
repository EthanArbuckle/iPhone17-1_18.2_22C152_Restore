@interface ISLogoutOperation
- (ISLogoutOperation)initWithAccount:(id)a3 logKey:(id)a4;
- (NSString)logKey;
- (SSAccount)account;
- (id)_copyAuthenticationContext;
- (id)_createDisableBookkeeperRequestPropertiesWithURL:(id)a3;
- (id)_createLogoutRequestProperties;
- (id)_sbsyncData;
- (void)_disableAutomaticDownloadKinds;
- (void)_disableBookkeeper;
- (void)_sendLogoutRequest;
- (void)run;
- (void)setAccount:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation ISLogoutOperation

- (ISLogoutOperation)initWithAccount:(id)a3 logKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ISLogoutOperation;
  v9 = [(ISOperation *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    p_logKey = (void **)&v10->_logKey;
    objc_storeStrong((id *)&v10->_logKey, a4);
    if (!v10->_logKey)
    {
      uint64_t v12 = SSGenerateLogCorrelationString();
      v13 = *p_logKey;
      *p_logKey = (void *)v12;
    }
  }

  return v10;
}

- (void)run
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  id v7 = objc_opt_class();
  id v8 = v7;
  [(ISLogoutOperation *)self logKey];
  int v11 = 138543618;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v11, v10);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  [(ISLogoutOperation *)self _disableAutomaticDownloadKinds];
  [(ISLogoutOperation *)self _disableBookkeeper];
  [(ISLogoutOperation *)self _sendLogoutRequest];
  [(ISOperation *)self setSuccess:1];
}

- (id)_copyAuthenticationContext
{
  id v3 = objc_alloc(MEMORY[0x263F7B288]);
  int v4 = [(ISLogoutOperation *)self account];
  int v5 = (void *)[v3 initWithAccount:v4];

  [v5 setPromptStyle:1000];
  v6 = (void *)[v5 copy];

  return v6;
}

- (id)_createDisableBookkeeperRequestPropertiesWithURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F7B290];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setHTTPMethod:@"POST"];
  [v5 setURL:v4];

  [v5 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = +[ISDevice sharedInstance];
  id v8 = [v7 guid];

  if (v8) {
    [v6 setObject:v8 forKey:@"guid"];
  }
  v9 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"0", @"bookkeeperDomain:com.apple.upp", 0);
  [v6 setObject:v9 forKey:@"put-parameters"];
  [v6 setObject:@"mzbookkeeper" forKey:@"notification-type"];
  [v5 setRequestParameters:v6];

  return v5;
}

- (id)_createLogoutRequestProperties
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B290]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = +[ISDevice sharedInstance];
  id v6 = [v5 guid];

  if (v6) {
    [v4 setObject:v6 forKey:@"guid"];
  }
  id v7 = [(ISLogoutOperation *)self _sbsyncData];
  if (v7) {
    [v4 setObject:v7 forKey:@"sbsync"];
  }
  if ([v4 count])
  {
    id v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:100 options:0 error:0];
    [v3 setHTTPBody:v8];
    [v3 setHTTPMethod:@"POST"];
    [v3 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  }
  [v3 setURLBagKey:@"logout"];

  return v3;
}

- (void)_disableAutomaticDownloadKinds
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v24 = 136446210;
      v25 = "-[ISLogoutOperation _disableAutomaticDownloadKinds]";
      LODWORD(v22) = 12;
      v21 = &v24;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v24, v22);
      free(v8);
      v21 = (int *)v6;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  v9 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedAccountsLogoutConfig", v21);
  if (!v9)
  {
    v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_26;
  }
  __int16 v13 = objc_opt_class();
  id v14 = v13;
  uint64_t v15 = [(ISLogoutOperation *)self logKey];
  int v24 = 138543618;
  v25 = (const char *)v13;
  __int16 v26 = 2114;
  v27 = v15;
  LODWORD(v22) = 22;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v24, v22);
    free(v16);
    SSFileLog();
LABEL_26:
  }
  v17 = (void *)SSXPCCreateMessageDictionary();
  id v18 = [(ISLogoutOperation *)self _copyAuthenticationContext];
  SSXPCDictionarySetCFObject();

  id v19 = objc_alloc(MEMORY[0x263F7B438]);
  v20 = (void *)[v19 initWithServiceName:*MEMORY[0x263F7BD68]];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__ISLogoutOperation__disableAutomaticDownloadKinds__block_invoke;
  v23[3] = &unk_264261910;
  v23[4] = self;
  [v20 sendMessage:v17 withReply:v23];
}

void __51__ISLogoutOperation__disableAutomaticDownloadKinds__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = v3;
  if (v3 != (id)MEMORY[0x263EF86A0] && v3 && MEMORY[0x2166C7F80](v3) == MEMORY[0x263EF8708])
  {
    id v20 = objc_alloc(MEMORY[0x263F087E8]);
    v21 = xpc_dictionary_get_value(v4, "0");
    int v5 = (void *)[v20 initWithXPCEncoding:v21];
  }
  else
  {
    int v5 = SSError();
  }
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
  int v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_26;
    }
    int v11 = objc_opt_class();
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = v11;
    id v14 = [v12 logKey];
    *(_DWORD *)v23 = 138543874;
    *(void *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2114;
    *(void *)&v23[14] = v14;
    *(_WORD *)&v23[22] = 2114;
    int v24 = v5;
    LODWORD(v22) = 32;
  }
  else
  {
    if (!v6)
    {
      int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_26;
    }
    v17 = objc_opt_class();
    id v18 = *(void **)(a1 + 32);
    id v13 = v17;
    id v14 = [v18 logKey];
    *(_DWORD *)v23 = 138543618;
    *(void *)&v23[4] = v17;
    *(_WORD *)&v23[12] = 2114;
    *(void *)&v23[14] = v14;
    LODWORD(v22) = 22;
  }
  id v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16]);
    free(v19);
    SSFileLog();
LABEL_26:
  }
}

- (void)_disableBookkeeper
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
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
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    int v9 = [(ISLogoutOperation *)self logKey];
    int v60 = 138543618;
    v61 = v7;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v9;
    LODWORD(v53) = 22;
    v52 = &v60;
    int v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v60, v53);
    free(v10);
    v52 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  int v11 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v12 = [(ISLogoutOperation *)self account];
  id v13 = [v12 uniqueIdentifier];
  [v11 setUserIdentifier:v13];

  id v14 = [(ISOperation *)self loadedURLBagWithContext:v11 returningError:0];
  int v15 = [v14 valueForKey:@"push-notification-types"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v16 = [v15 objectForKey:@"add-push-notification-type-url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = objc_alloc_init(ISStoreURLOperation);
      id v18 = [(ISLogoutOperation *)self _copyAuthenticationContext];
      [(ISURLOperation *)v17 setAuthenticationContext:v18];

      id v19 = +[ISDataProvider provider];
      [(ISURLOperation *)v17 setDataProvider:v19];

      id v20 = [NSURL URLWithString:v16];
      v21 = [(ISLogoutOperation *)self _createDisableBookkeeperRequestPropertiesWithURL:v20];
      [(ISURLOperation *)v17 setRequestProperties:v21];

      id v59 = 0;
      [(ISOperation *)self runSubOperation:v17 returningError:&v59];
      uint64_t v22 = v59;
      uint64_t v23 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
      int v24 = (void *)v23;
      v57 = v15;
      if (v22)
      {
        if (!v23)
        {
          int v24 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v25 = objc_msgSend(v24, "shouldLog", v52);
        if ([v24 shouldLogToDisk]) {
          v25 |= 2u;
        }
        __int16 v26 = [v24 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          int v27 = v25;
        }
        else {
          int v27 = v25 & 2;
        }
        if (!v27) {
          goto LABEL_58;
        }
        v55 = v14;
        uint64_t v28 = objc_opt_class();
        id v54 = v28;
        v29 = [(ISLogoutOperation *)self logKey];
        int v60 = 138543874;
        v61 = v28;
        __int16 v62 = 2114;
        uint64_t v63 = (uint64_t)v29;
        __int16 v64 = 2114;
        v65 = v22;
        LODWORD(v53) = 32;
        v30 = (void *)_os_log_send_and_compose_impl();

        if (v30)
        {
          __int16 v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v60, v53);
          free(v30);
          SSFileLog();
          id v14 = v55;
LABEL_58:
          int v15 = v57;

LABEL_62:
          goto LABEL_63;
        }
        id v14 = v55;
      }
      else
      {
        if (!v23)
        {
          int v24 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v46 = objc_msgSend(v24, "shouldLog", v52);
        if ([v24 shouldLogToDisk]) {
          v46 |= 2u;
        }
        __int16 v26 = [v24 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
          int v47 = v46;
        }
        else {
          int v47 = v46 & 2;
        }
        if (!v47) {
          goto LABEL_58;
        }
        v48 = objc_opt_class();
        id v56 = v48;
        uint64_t v49 = [(ISLogoutOperation *)self logKey];
        int v60 = 138543618;
        v61 = v48;
        __int16 v62 = 2114;
        uint64_t v63 = v49;
        v50 = (void *)v49;
        LODWORD(v53) = 22;
        v51 = (void *)_os_log_send_and_compose_impl();

        if (v51)
        {
          __int16 v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v60, v53);
          free(v51);
          SSFileLog();
          goto LABEL_58;
        }
      }
      int v15 = v57;
      goto LABEL_62;
    }
    v17 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
    if (!v17)
    {
      v17 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v39 = [(ISStoreURLOperation *)v17 shouldLog];
    if ([(ISStoreURLOperation *)v17 shouldLogToDisk]) {
      int v40 = v39 | 2;
    }
    else {
      int v40 = v39;
    }
    uint64_t v22 = [(ISStoreURLOperation *)v17 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      int v41 = v40;
    }
    else {
      int v41 = v40 & 2;
    }
    if (!v41) {
      goto LABEL_63;
    }
    v58 = v15;
    v42 = objc_opt_class();
    id v43 = v42;
    v44 = [(ISLogoutOperation *)self logKey];
    int v60 = 138543618;
    v61 = v42;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v44;
    LODWORD(v53) = 22;
    v45 = (void *)_os_log_send_and_compose_impl();

    if (v45)
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v60, v53);
      free(v45);
      SSFileLog();
      int v15 = v58;
LABEL_63:

      goto LABEL_64;
    }
    int v15 = v58;
LABEL_64:

    goto LABEL_65;
  }
  int v16 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
  if (!v16)
  {
    int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v31 = objc_msgSend(v16, "shouldLog", v52);
  if ([v16 shouldLogToDisk]) {
    int v32 = v31 | 2;
  }
  else {
    int v32 = v31;
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_ERROR)) {
    int v33 = v32;
  }
  else {
    int v33 = v32 & 2;
  }
  if (!v33) {
    goto LABEL_64;
  }
  v34 = v15;
  v35 = objc_opt_class();
  id v36 = v35;
  v37 = [(ISLogoutOperation *)self logKey];
  int v60 = 138543618;
  v61 = v35;
  __int16 v62 = 2114;
  uint64_t v63 = (uint64_t)v37;
  LODWORD(v53) = 22;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v60, v53);
    v17 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
    free(v38);
    SSFileLog();
    int v15 = v34;
    goto LABEL_64;
  }
  int v15 = v34;
LABEL_65:
}

- (id)_sbsyncData
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  qi864985u0(-1, (uint64_t)&v15, (uint64_t)&v13 + 4, (uint64_t)&v14, (uint64_t)&v13);
  id v3 = 0;
  if (!v4)
  {
    int v5 = [(ISLogoutOperation *)self account];
    uint64_t v6 = [v5 uniqueIdentifier];
    uint64_t v7 = [v6 unsignedLongLongValue];

    id v8 = objc_alloc_init(MEMORY[0x263F7B390]);
    id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
    int v10 = (void *)[v9 initWithBytesNoCopy:v15 length:HIDWORD(v13) freeWhenDone:0];
    id v12 = 0;
    [v8 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v7 transactionType:303 machineIDData:v10 returningSubscriptionBagData:&v12 error:0];
    id v3 = v12;
  }
  if (v15) {
    jk24uiwqrg(v15);
  }
  if (v14) {
    jk24uiwqrg(v14);
  }

  return v3;
}

- (void)_sendLogoutRequest
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
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
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(ISLogoutOperation *)self logKey];
    int v31 = 138543618;
    int v32 = v7;
    __int16 v33 = 2114;
    v34 = v9;
    LODWORD(v29) = 22;
    uint64_t v28 = &v31;
    int v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v31, v29);
    free(v10);
    uint64_t v28 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  int v11 = objc_alloc_init(ISStoreURLOperation);
  id v12 = [(ISLogoutOperation *)self _copyAuthenticationContext];
  [(ISURLOperation *)v11 setAuthenticationContext:v12];

  uint64_t v13 = +[ISDataProvider provider];
  [(ISURLOperation *)v11 setDataProvider:v13];

  uint64_t v14 = [(ISLogoutOperation *)self _createLogoutRequestProperties];
  [(ISURLOperation *)v11 setRequestProperties:v14];

  [(ISStoreURLOperation *)v11 setUseUserSpecificURLBag:1];
  id v30 = 0;
  [(ISOperation *)self runSubOperation:v11 returningError:&v30];
  id v15 = v30;
  if (!v15) {
    goto LABEL_25;
  }
  int v16 = [MEMORY[0x263F7B1F8] sharedAccountsLogoutConfig];
  if (!v16)
  {
    int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v17 = objc_msgSend(v16, "shouldLog", v28);
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  id v19 = [v16 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    v18 &= 2u;
  }
  if (!v18) {
    goto LABEL_23;
  }
  id v20 = objc_opt_class();
  id v21 = v20;
  uint64_t v22 = [(ISLogoutOperation *)self logKey];
  int v31 = 138543874;
  int v32 = v20;
  __int16 v33 = 2114;
  v34 = v22;
  __int16 v35 = 2114;
  id v36 = v15;
  LODWORD(v29) = 32;
  uint64_t v28 = &v31;
  uint64_t v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v31, v29);
    free(v23);
    uint64_t v28 = (int *)v19;
    SSFileLog();
LABEL_23:
  }
LABEL_25:
  int v24 = [(ISURLOperation *)v11 dataProvider];
  int v25 = [v24 output];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v26 = SSVSubscriptionBagForDictionary();
    if (v26)
    {
      id v27 = objc_alloc_init(MEMORY[0x263F7B390]);
      [v27 importSubscriptionKeyBagData:v26 returningError:0];
    }
  }
}

- (SSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end