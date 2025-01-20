@interface ISBiometricOptInOperation
- (BOOL)_performOptInDialogOperationWithError:(id *)a3;
- (BOOL)_performPasscodeDialogOperationWithError:(id *)a3;
- (BOOL)promptUser;
- (ISBiometricOptInOperation)init;
- (NSString)topicName;
- (NSString)userAgent;
- (id)_newSourceByStartingTimeoutTimer;
- (id)resultBlock;
- (void)_loadURLBag;
- (void)_performOptInDialogMetricsWithResult:(BOOL)a3 error:(id)a4;
- (void)_updateTouchIDSettingsForAccount:(id)a3;
- (void)run;
- (void)setPromptUser:(BOOL)a3;
- (void)setResultBlock:(id)a3;
- (void)setTopicName:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISBiometricOptInOperation

- (ISBiometricOptInOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISBiometricOptInOperation;
  v2 = [(ISOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.ISBiometricOptInOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)promptUser
{
  [(ISOperation *)self lock];
  BOOL promptUser = self->_promptUser;
  [(ISOperation *)self unlock];
  return promptUser;
}

- (id)resultBlock
{
  [(ISOperation *)self lock];
  dispatch_queue_t v3 = (void *)[self->_resultBlock copy];
  [(ISOperation *)self unlock];
  v4 = (void *)MEMORY[0x2166C7C80](v3);

  return v4;
}

- (void)setPromptUser:(BOOL)a3
{
  BOOL v3 = a3;
  [(ISOperation *)self lock];
  if (self->_promptUser != v3) {
    self->_BOOL promptUser = v3;
  }

  [(ISOperation *)self unlock];
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  [(ISOperation *)self lock];
  if (self->_resultBlock != v6)
  {
    v4 = (void *)[v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }
  [(ISOperation *)self unlock];
}

- (void)run
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![(ISBiometricOptInOperation *)self promptUser])
  {
    v5 = 0;
    goto LABEL_15;
  }
  id v27 = 0;
  BOOL v3 = [(ISBiometricOptInOperation *)self _performOptInDialogOperationWithError:&v27];
  id v4 = v27;
  v5 = v4;
  if (v3)
  {
    id v26 = v4;
    BOOL v6 = [(ISBiometricOptInOperation *)self _performPasscodeDialogOperationWithError:&v26];
    id v7 = v26;

    v5 = v7;
    if (v6)
    {
LABEL_15:
      v15 = [MEMORY[0x263F7B0E8] defaultStore];
      v8 = [v15 activeAccount];

      if (v8)
      {
        [(ISBiometricOptInOperation *)self _updateTouchIDSettingsForAccount:v8];
        uint64_t v16 = 1;
        goto LABEL_30;
      }
      v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v11)
      {
        v11 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v17 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      v19 = [v11 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        v18 &= 2u;
      }
      if (v18)
      {
        v20 = objc_opt_class();
        int v28 = 138543362;
        v29 = v20;
        id v21 = v20;
        LODWORD(v25) = 12;
        v22 = (void *)_os_log_send_and_compose_impl();

        if (!v22) {
          goto LABEL_28;
        }
        v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v28, v25);
        free(v22);
        SSFileLog();
      }

      goto LABEL_28;
    }
  }
  v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v8)
  {
    v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_28;
  }
  v12 = objc_opt_class();
  int v28 = 138543362;
  v29 = v12;
  id v13 = v12;
  LODWORD(v25) = 12;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v28, v25);
    free(v14);
    SSFileLog();
LABEL_28:
  }
  uint64_t v16 = 0;
LABEL_30:

  [(ISOperation *)self setError:v5];
  [(ISOperation *)self setSuccess:v16];
  uint64_t v23 = [(ISBiometricOptInOperation *)self resultBlock];
  v24 = (void *)v23;
  if (v23) {
    (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v16, v5);
  }
}

- (void)_loadURLBag
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(ISLoadURLBagOperation);
  id v17 = 0;
  BOOL v4 = [(ISOperation *)self runSubOperation:v3 returningError:&v17];
  id v5 = v17;
  BOOL v6 = v5;
  if (v4 && v5 == 0)
  {
    v15 = [(ISLoadURLBagOperation *)v3 URLBag];
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_17;
  }
  urlBag = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!urlBag)
  {
    urlBag = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [urlBag shouldLog];
  if ([urlBag shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [urlBag OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_15;
  }
  v12 = objc_opt_class();
  int v18 = 138543618;
  v19 = v12;
  __int16 v20 = 2114;
  id v21 = v6;
  id v13 = v12;
  LODWORD(v16) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
    free(v14);
    SSFileLog();
LABEL_15:
  }
LABEL_17:
}

- (void)_performOptInDialogMetricsWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  urlBag = self->_urlBag;
  if (urlBag || ([(ISBiometricOptInOperation *)self _loadURLBag], (urlBag = self->_urlBag) != 0))
  {
    v8 = [(ISURLBag *)urlBag valueForKey:*MEMORY[0x263F7BBD0]];
    if ([v8 count])
    {
      int v9 = +[ISDevice sharedInstance];
      uint64_t v10 = [v9 deviceBiometricStyle];

      if (v10 == 3)
      {
        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = v11;
        id v13 = @"BIO_OPT_IN_FACE_EXPLANATION";
        goto LABEL_19;
      }
      if (v10 == 2)
      {
        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = v11;
        id v13 = @"BIO_OPT_IN_EXPLANATION";
LABEL_19:
        v14 = [v11 localizedStringForKey:v13 value:&stru_26C6A2310 table:@"Mesa"];

LABEL_32:
        id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v26 setObject:*MEMORY[0x263F7BB48] forKey:*MEMORY[0x263F7B480]];
        [v26 setObject:&unk_26C6B05D8 forKey:*MEMORY[0x263F7B490]];
        if (v4) {
          uint64_t v27 = MEMORY[0x263EFFA88];
        }
        else {
          uint64_t v27 = MEMORY[0x263EFFA80];
        }
        objc_msgSend(v26, "setObject:forKey:", v27, *MEMORY[0x263F7B4A0], v39);
        if (v6) {
          [v26 setObject:v6 forKey:*MEMORY[0x263F7B488]];
        }
        if (v14) {
          [v26 setObject:v14 forKey:*MEMORY[0x263F7B498]];
        }
        int v28 = [(ISBiometricOptInOperation *)self topicName];

        if (v28)
        {
          v29 = [(ISBiometricOptInOperation *)self topicName];
          [v26 setObject:v29 forKey:*MEMORY[0x263F7B4A8]];
        }
        uint64_t v30 = [(ISBiometricOptInOperation *)self userAgent];

        if (v30)
        {
          v31 = [(ISBiometricOptInOperation *)self userAgent];
          [v26 setObject:v31 forKey:*MEMORY[0x263F7B4B0]];
        }
        v32 = [MEMORY[0x263F7B128] authorizationDialogEventForParameters:v26];
        v33 = (void *)[objc_alloc(MEMORY[0x263F7B230]) initWithGlobalConfiguration:v8];
        id v34 = objc_alloc_init(MEMORY[0x263F7B238]);
        [v34 setGlobalConfiguration:v33];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke;
        v42[3] = &unk_264261258;
        v42[4] = self;
        [v34 insertEvent:v32 withCompletionHandler:v42];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke_26;
        v41[3] = &unk_264261258;
        v41[4] = self;
        [v34 flushUnreportedEventsWithCompletionHandler:v41];

        goto LABEL_44;
      }
      __int16 v20 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v20)
      {
        __int16 v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      uint64_t v23 = [v20 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        v22 &= 2u;
      }
      if (v22)
      {
        int v43 = 138543362;
        id v44 = (id)objc_opt_class();
        id v24 = v44;
        LODWORD(v40) = 12;
        v39 = &v43;
        uint64_t v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
        {
LABEL_31:

          v14 = 0;
          goto LABEL_32;
        }
        uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v43, v40);
        free(v25);
        v39 = (int *)v23;
        SSFileLog();
      }

      goto LABEL_31;
    }
    v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
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
    id v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_17;
    }
    int v43 = 138543362;
    id v44 = (id)objc_opt_class();
    id v18 = v44;
    LODWORD(v40) = 12;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      id v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v43, v40);
      free(v19);
      SSFileLog();
LABEL_17:
    }
  }
  else
  {
    v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v35 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v36 = v35 | 2;
    }
    else {
      int v36 = v35;
    }
    v14 = [v8 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v36 &= 2u;
    }
    if (v36)
    {
      int v43 = 138543362;
      id v44 = (id)objc_opt_class();
      id v37 = v44;
      LODWORD(v40) = 12;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38) {
        goto LABEL_45;
      }
      v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v43, v40);
      free(v38);
      SSFileLog();
    }
  }
LABEL_44:

LABEL_45:
}

void __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v3)
    {
      BOOL v3 = [MEMORY[0x263F7B1F8] sharedConfig];
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
      *(_DWORD *)uint64_t v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v2;
      id v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16], v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v3)
    {
      BOOL v3 = [MEMORY[0x263F7B1F8] sharedConfig];
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
      *(_DWORD *)uint64_t v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v2;
      id v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16], v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)_performPasscodeDialogOperationWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__13;
  int v35 = __Block_byref_object_dispose__13;
  id v36 = 0;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  if (SSIsDaemon())
  {
    int v4 = +[ISDevice sharedInstance];
    uint64_t v5 = [v4 deviceBiometricStyle];

    if (v5 == 2)
    {
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"PASSCODE_TITLE" value:&stru_26C6A2310 table:@"Mesa"];
      goto LABEL_6;
    }
    if (v5 == 3)
    {
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"PASSCODE_TITLE_FACE" value:&stru_26C6A2310 table:@"Mesa"];
LABEL_6:
      v8 = (__CFString *)v7;
LABEL_19:

      if (*((unsigned char *)v28 + 24))
      {
        do
        {
          id v17 = [(ISBiometricOptInOperation *)self _newSourceByStartingTimeoutTimer];
          id v18 = (void *)[objc_alloc(NSClassFromString(&cfstr_Devicepasscode.isa)) initWithTitle:v8 message:0];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __70__ISBiometricOptInOperation__performPasscodeDialogOperationWithError___block_invoke;
          v26[3] = &unk_264261718;
          v26[4] = &v37;
          v26[5] = &v27;
          v26[6] = &v31;
          [v18 setTokenBlock:v26];
          v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          __int16 v20 = [v19 localizedStringForKey:@"PASSCODE_INCORRECT" value:&stru_26C6A2310 table:@"Mesa"];

          [(ISOperation *)self runSubOperation:v18 returningError:0];
          dispatch_source_cancel(v17);

          v8 = v20;
        }
        while (*((unsigned char *)v28 + 24));
      }
      else
      {
        __int16 v20 = v8;
      }

      goto LABEL_24;
    }
    id v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v6 shouldLog];
    int v10 = [v6 shouldLogToDisk];
    uint64_t v11 = [v6 OSLogObject];
    v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      int v13 = v9;
    }
    else {
      int v13 = v9 & 2;
    }
    if (v13)
    {
      v14 = objc_opt_class();
      int v41 = 138543362;
      v42 = v14;
      id v15 = v14;
      LODWORD(v24) = 12;
      uint64_t v23 = &v41;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_18:
        v8 = &stru_26C6A2310;
        goto LABEL_19;
      }
      v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v41, v24);
      free(v16);
      uint64_t v23 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_24:
  if (a3) {
    *a3 = (id) v32[5];
  }
  BOOL v21 = v38[3] == 1;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v21;
}

uint64_t __70__ISBiometricOptInOperation__performPasscodeDialogOperationWithError___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2 == 2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a4 copy];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_performOptInDialogOperationWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  BOOL v3 = +[ISDevice sharedInstance];
  uint64_t v4 = [v3 deviceBiometricStyle];

  if (v4 == 3)
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    uint64_t v7 = @"BIO_OPT_IN_FACE_EXPLANATION";
    goto LABEL_5;
  }
  if (v4 != 2)
  {
    int v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v9)
    {
      int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v47 = 138543362;
      id v48 = (id)objc_opt_class();
      id v13 = v48;
      LODWORD(v38) = 12;
      uint64_t v37 = &v47;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        uint64_t v8 = 0;
        goto LABEL_18;
      }
      v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v47, v38);
      free(v14);
      uint64_t v37 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_17;
  }
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  uint64_t v7 = @"BIO_OPT_IN_EXPLANATION";
LABEL_5:
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26C6A2310 table:@"Mesa"];

LABEL_18:
  uint64_t v39 = (void *)v8;
  id v15 = [[ISDialog alloc] initWithTitle:v8 message:0];
  int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"BIO_OPT_IN_NOT_NOW" value:&stru_26C6A2310 table:@"Mesa"];
  id v18 = +[ISDialogButton buttonWithTitle:v17];

  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v20 = [v19 localizedStringForKey:@"BIO_OPT_IN_OK" value:&stru_26C6A2310 table:@"Mesa"];
  BOOL v21 = +[ISDialogButton buttonWithTitle:v20];

  v46[0] = v18;
  v46[1] = v21;
  int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  [(ISDialog *)v15 setButtons:v22];

  [(ISDialog *)v15 setDefaultButtonIndex:1];
  uint64_t v23 = objc_opt_new();
  uint64_t v24 = self;
  uint64_t v25 = [(ISBiometricOptInOperation *)self _newSourceByStartingTimeoutTimer];
  id v26 = +[ISDialogOperation operationWithDialog:v15];
  id v45 = 0;
  BOOL v27 = [(ISOperation *)self runSubOperation:v26 returningError:&v45];
  id v28 = v45;
  if (v27 && ([v26 selectedButton], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v30 = (void *)v29;
    uint64_t v31 = [(ISDialog *)v15 buttons];
    uint64_t v32 = [v31 indexOfObjectIdenticalTo:v30];

    uint64_t v24 = self;
    dispatch_source_cancel(v25);
    if (v32 == 1)
    {
      BOOL v33 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_source_cancel(v25);
  }
  objc_msgSend(v23, "setBiometricState:", 1, v37);
  BOOL v33 = 0;
LABEL_24:
  dispatchQueue = v24->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ISBiometricOptInOperation__performOptInDialogOperationWithError___block_invoke;
  block[3] = &unk_264261740;
  block[4] = v24;
  BOOL v44 = v33;
  id v35 = v28;
  id v43 = v35;
  dispatch_async(dispatchQueue, block);
  if (a3) {
    *a3 = v35;
  }

  return v33;
}

uint64_t __67__ISBiometricOptInOperation__performOptInDialogOperationWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performOptInDialogMetricsWithResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_updateTouchIDSettingsForAccount:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v3 stringWithFormat:@"%@", objc_opt_class()];
  id v6 = [v4 uniqueIdentifier];

  uint64_t v7 = [[ISBiometricUpdateTouchIDSettingsOperation alloc] initWithAccountIdentifier:v6];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__ISBiometricOptInOperation__updateTouchIDSettingsForAccount___block_invoke;
  v19[3] = &unk_264261768;
  id v8 = v5;
  id v20 = v8;
  [(ISBiometricUpdateTouchIDSettingsOperation *)v7 setResultBlock:v19];
  int v9 = +[ISOperationQueue mainQueue];
  [v9 addOperation:v7];

  int v10 = objc_opt_new();
  [v10 setBiometricState:2];
  [v10 saveIdentityMapForAccountIdentifier:v6];
  [v10 registerAccountIdentifier:v6];
  int v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v11)
  {
    int v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_11;
  }
  id v15 = objc_opt_class();
  int v21 = 138543618;
  int v22 = v15;
  __int16 v23 = 2112;
  uint64_t v24 = v6;
  id v16 = v15;
  LODWORD(v18) = 22;
  id v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v21, v18);
    free(v17);
    SSFileLog();
LABEL_11:
  }
}

void __62__ISBiometricOptInOperation__updateTouchIDSettingsForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
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
    if (!v9)
    {

      goto LABEL_24;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    [NSNumber numberWithInteger:a2];
    int v18 = 138543874;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v22 = 2114;
    id v23 = v5;
    LODWORD(v17) = 32;
    int v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v13 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  id v15 = [v7 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  [NSNumber numberWithInteger:0];
  int v18 = 138543618;
  uint64_t v19 = v16;
  __int16 v20 = 2114;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 22;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
LABEL_21:
    id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v18, v17);
    free(v12);
    SSFileLog();
LABEL_22:
  }
LABEL_24:
}

- (id)_newSourceByStartingTimeoutTimer
{
  BOOL v3 = dispatch_get_global_queue(0, 0);
  id v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);

  dispatch_time_t v5 = dispatch_time(0, 180000000000);
  dispatch_source_set_timer(v4, v5, 0, 0);
  uint64_t v6 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __61__ISBiometricOptInOperation__newSourceByStartingTimeoutTimer__block_invoke;
  handler[3] = &unk_264260B08;
  id v10 = v6;
  id v7 = v6;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  return v4;
}

void __61__ISBiometricOptInOperation__newSourceByStartingTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) object];
  id v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2)
  {
    id v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  dispatch_time_t v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v9) = 138543362;
  *(void *)((char *)&v9 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    dispatch_time_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  [v1 cancel];
}

- (NSString)topicName
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTopicName:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_topicName, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_resultBlock, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end