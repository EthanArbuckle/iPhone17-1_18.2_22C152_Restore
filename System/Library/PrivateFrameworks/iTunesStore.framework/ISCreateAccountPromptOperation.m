@interface ISCreateAccountPromptOperation
- (BOOL)_hasActiveICloudAccount;
- (ISCreateAccountPromptOperation)init;
- (ISCreateAccountPromptOperation)initWithReason:(id)a3;
- (NSString)reason;
- (id)_newCreateAccountDialog;
- (int64_t)_mapCorrectSelectedButtonWithDialog:(id)a3;
- (int64_t)responseType;
- (void)run;
- (void)setReason:(id)a3;
- (void)setResponseType:(int64_t)a3;
@end

@implementation ISCreateAccountPromptOperation

- (ISCreateAccountPromptOperation)init
{
  return [(ISCreateAccountPromptOperation *)self initWithReason:0];
}

- (ISCreateAccountPromptOperation)initWithReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISCreateAccountPromptOperation;
  v6 = [(ISOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reason, a3);
  }

  return v7;
}

- (void)run
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  Class v3 = ISWeakLinkedClassForString(&cfstr_Mcprofileconne.isa, (const void *)0x11);
  v4 = ISWeakLinkedStringConstantForString("MCFeatureAccountModificationAllowed", (const void *)0x11);
  id v5 = [(objc_class *)v3 sharedConnection];
  int v6 = [v5 effectiveBoolValueForSetting:v4];

  if (v6 != 2)
  {
    id v7 = [(ISCreateAccountPromptOperation *)self _newCreateAccountDialog];
    v14 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
    if (!v14)
    {
      v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v50 = 138543362;
      id v51 = (id)objc_opt_class();
      id v18 = v51;
      LODWORD(v44) = 12;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_25;
      }
      v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v50, v44);
      free(v19);
      SSFileLog();
    }

LABEL_25:
    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.TestFlight", @"com.apple.iTunesU", 0);
    v21 = [MEMORY[0x263F086E0] mainBundle];
    v22 = [v21 bundleIdentifier];

    int v23 = [v20 containsObject:v22];
    v24 = off_26425FE70;
    if (!v23) {
      v24 = off_26425FD98;
    }
    v25 = [(__objc2_class *)*v24 operationWithDialog:v7];
    v26 = [MEMORY[0x263EFF8C0] arrayWithObject:@"com.apple.itunesstored.lock.createaccount"];
    [v25 setSerializationLockIdentifiers:v26];

    id v49 = 0;
    LODWORD(v26) = [(ISOperation *)self runSubOperation:v25 returningError:&v49];
    id v12 = v49;
    uint64_t v13 = 0;
    if (!v26) {
      goto LABEL_65;
    }
    int64_t v27 = [(ISCreateAccountPromptOperation *)self _mapCorrectSelectedButtonWithDialog:v25];
    v48 = v20;
    if (v27 == 1)
    {
      v28 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v28)
      {
        v28 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v34 = [v28 shouldLog];
      if ([v28 shouldLogToDisk]) {
        v34 |= 2u;
      }
      v30 = [v28 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        int v35 = v34;
      }
      else {
        int v35 = v34 & 2;
      }
      if (v35)
      {
        v36 = objc_opt_class();
        int v50 = 138543362;
        id v51 = v36;
        id v37 = v36;
        LODWORD(v45) = 12;
        v43 = &v50;
        v38 = (void *)_os_log_send_and_compose_impl();

        if (!v38)
        {
          uint64_t v13 = 3;
          goto LABEL_64;
        }
        v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v50, v45);
        free(v38);
        v43 = (int *)v30;
        SSFileLog();
      }
      uint64_t v13 = 3;
    }
    else if (v27)
    {
      v28 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v28)
      {
        v28 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v39 = [v28 shouldLog];
      if ([v28 shouldLogToDisk]) {
        v39 |= 2u;
      }
      v30 = [v28 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        int v40 = v39;
      }
      else {
        int v40 = v39 & 2;
      }
      if (v40)
      {
        v41 = objc_opt_class();
        int v50 = 138543362;
        id v51 = v41;
        id v47 = v41;
        LODWORD(v45) = 12;
        v43 = &v50;
        v42 = (void *)_os_log_send_and_compose_impl();

        if (!v42)
        {
          uint64_t v13 = 2;
          goto LABEL_64;
        }
        v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v50, v45);
        free(v42);
        v43 = (int *)v30;
        SSFileLog();
      }
      uint64_t v13 = 2;
    }
    else
    {
      v28 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v28)
      {
        v28 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v29 = [v28 shouldLog];
      if ([v28 shouldLogToDisk]) {
        v29 |= 2u;
      }
      v30 = [v28 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        int v31 = v29;
      }
      else {
        int v31 = v29 & 2;
      }
      if (v31)
      {
        v32 = objc_opt_class();
        int v50 = 138543362;
        id v51 = v32;
        id v46 = v32;
        LODWORD(v45) = 12;
        v43 = &v50;
        v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
          uint64_t v13 = 4;
          goto LABEL_64;
        }
        uint64_t v13 = 4;
        v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v50, v45);
        free(v33);
        v43 = (int *)v30;
        SSFileLog();
      }
      else
      {
        uint64_t v13 = 4;
      }
    }

LABEL_64:
    v20 = v48;
LABEL_65:

    goto LABEL_66;
  }
  id v7 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
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
  if (!v9) {
    goto LABEL_12;
  }
  int v50 = 138543362;
  id v51 = (id)objc_opt_class();
  id v11 = v51;
  LODWORD(v44) = 12;
  v43 = &v50;
  id v12 = (id)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v50, v44);
    free(v12);
    v43 = (int *)v10;
    SSFileLog();
LABEL_12:

    id v12 = 0;
  }
  uint64_t v13 = 8;
LABEL_66:

  [(ISOperation *)self setError:v12];
  [(ISCreateAccountPromptOperation *)self setResponseType:v13];
  -[ISOperation setSuccess:](self, "setSuccess:", v13 != 0, v43);
}

- (id)_newCreateAccountDialog
{
  v22[2] = *MEMORY[0x263EF8340];
  Class v3 = objc_alloc_init(ISDialog);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"USE_EXISTING_ACCOUNT" value:&stru_26C6A2310 table:0];
  int v6 = +[ISDialogButton buttonWithTitle:v5];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"CREATE_NEW_ACCOUNT" value:&stru_26C6A2310 table:0];
  int v9 = +[ISDialogButton buttonWithTitle:v8];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26C6A2310 table:0];
  id v12 = +[ISDialogButton buttonWithTitle:v11];

  if ([(ISCreateAccountPromptOperation *)self _hasActiveICloudAccount])
  {
    v22[0] = v12;
    v22[1] = v6;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    uint64_t v14 = 0;
  }
  else
  {
    v21[0] = v6;
    v21[1] = v12;
    v21[2] = v9;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    uint64_t v14 = 1;
  }
  [(ISDialog *)v3 setButtons:v13];
  [(ISDialog *)v3 setDefaultButtonIndex:v14];
  [(ISDialog *)v3 setExpectsResponse:1];
  [(ISDialog *)v3 setOneButtonPerLine:1];
  int v15 = [(ISCreateAccountPromptOperation *)self reason];
  if ([v15 length])
  {
    [(ISDialog *)v3 setMessage:v15];
    int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = v16;
    id v18 = @"SIGN_IN_WITH_REASON";
  }
  else
  {
    int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = v16;
    id v18 = @"SIGN_IN";
  }
  v19 = [v16 localizedStringForKey:v18 value:&stru_26C6A2310 table:0];
  [(ISDialog *)v3 setTitle:v19];

  return v3;
}

- (int64_t)_mapCorrectSelectedButtonWithDialog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedButton];
  if (v5)
  {
    int v6 = [v4 dialog];
    id v7 = [v6 buttons];
    uint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v9 = [(ISCreateAccountPromptOperation *)self _hasActiveICloudAccount];
  uint64_t v10 = 2 * (v8 == 1);
  if (v8 == 2) {
    uint64_t v10 = 1;
  }
  if (v9) {
    int64_t v11 = 2 * (v8 == 0);
  }
  else {
    int64_t v11 = v10;
  }

  return v11;
}

- (BOOL)_hasActiveICloudAccount
{
  id v2 = objc_alloc_init(getACAccountStoreClass());
  Class v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  id v4 = objc_msgSend(v3, "aa_personID");

  LOBYTE(v3) = [v4 length] != 0;
  return (char)v3;
}

- (int64_t)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(int64_t)a3
{
  self->_responseType = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end