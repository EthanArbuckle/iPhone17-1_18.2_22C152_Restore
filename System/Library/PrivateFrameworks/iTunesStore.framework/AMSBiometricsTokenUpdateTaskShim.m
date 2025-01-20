@interface AMSBiometricsTokenUpdateTaskShim
- (AMSBiometricsTokenUpdateTaskShim)initWithAccountIdentifier:(id)a3;
- (NSNumber)accountIdentifier;
- (void)runUpdateWithCompletionBlock:(id)a3;
- (void)setAccountIdentifier:(id)a3;
@end

@implementation AMSBiometricsTokenUpdateTaskShim

- (AMSBiometricsTokenUpdateTaskShim)initWithAccountIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSBiometricsTokenUpdateTaskShim;
  v5 = [(AMSBiometricsTokenUpdateTaskShim *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(AMSBiometricsTokenUpdateTaskShim *)v5 setAccountIdentifier:v4];
    v7 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
    if (!v7)
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
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = AMSSetLogKeyIfNeeded();
      int v18 = 138543874;
      v19 = v11;
      __int16 v20 = 2114;
      v21 = v13;
      __int16 v22 = 2114;
      id v23 = v4;
      LODWORD(v16) = 32;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        goto LABEL_14;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
      free(v14);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (void)runUpdateWithCompletionBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  v6 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
  if (!v6)
  {
    v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  int v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v23 = 138543618;
    id v24 = (id)objc_opt_class();
    __int16 v25 = 2114;
    v26 = v5;
    id v10 = v24;
    LODWORD(v19) = 22;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v19);
    free(v11);
    SSFileLog();
  }

LABEL_12:
  id v12 = [MEMORY[0x263EFB210] defaultStore];
  v13 = objc_msgSend(v12, "ams_iTunesAccountWithDSID:", self->_accountIdentifier);

  if (!v13)
  {
    v14 = [MEMORY[0x263EFB210] defaultStore];
    v13 = objc_msgSend(v14, "ams_activeiTunesAccount");
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F27B70]) initWithAccount:v13];
  uint64_t v16 = [v15 performUpdate];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__AMSBiometricsTokenUpdateTaskShim_runUpdateWithCompletionBlock___block_invoke;
  v20[3] = &unk_264261790;
  v20[4] = self;
  id v21 = v5;
  id v22 = v4;
  id v17 = v4;
  id v18 = v5;
  [v16 addFinishBlock:v20];
}

void __65__AMSBiometricsTokenUpdateTaskShim_runUpdateWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
  int v7 = (void *)v6;
  if (a2)
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
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_22;
    }
    v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 40);
    int v22 = 138543618;
    int v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    id v13 = v11;
    LODWORD(v21) = 22;
    v14 = (void *)_os_log_send_and_compose_impl();
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
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_22;
    }
    id v17 = objc_opt_class();
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = v17;
    AMSHashIfNeeded();
    int v22 = 138543874;
    int v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 32;
    v14 = (void *)_os_log_send_and_compose_impl();
  }
  if (!v14) {
    goto LABEL_23;
  }
  id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v22, v21);
  free(v14);
  SSFileLog();
LABEL_22:

LABEL_23:
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, a2, v5);
  }
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end