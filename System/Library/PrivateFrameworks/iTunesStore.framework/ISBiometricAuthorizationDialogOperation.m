@interface ISBiometricAuthorizationDialogOperation
- (BOOL)_runAuthkitOperationWithError:(id)a3 returningError:(id *)a4;
- (BOOL)_runSignatureOperationReturningError:(id *)a3;
- (BOOL)_shouldFallbackToAuthKitForError:(id)a3;
- (ISBiometricAuthorizationDialogOperation)initWithTouchIDDialog:(id)a3 fallbackDialog:(id)a4;
- (ISDialog)dialog;
- (ISDialog)fallbackDialog;
- (ISDialogButton)selectedButton;
- (ISTouchIDDialog)touchIDDialog;
- (NSDictionary)buyParams;
- (NSDictionary)metricsDictionary;
- (NSString)userAgent;
- (NSURL)redirectURL;
- (SSBiometricAuthenticationContext)biometricAuthenticationContext;
- (void)_findSelectedButtonForButtons:(id)a3;
- (void)_loadURLBag;
- (void)_performMetricsWithBiometricMatch:(unint64_t)a3 didBiometricsFail:(BOOL)a4;
- (void)run;
- (void)setBiometricAuthenticationContext:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setFallbackDialog:(id)a3;
- (void)setMetricsDictionary:(id)a3;
- (void)setTouchIDDialog:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISBiometricAuthorizationDialogOperation

- (ISBiometricAuthorizationDialogOperation)initWithTouchIDDialog:(id)a3 fallbackDialog:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ISBiometricAuthorizationDialogOperation;
  v9 = [(ISOperation *)&v13 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.itunesstored.ISBiometricAuthorizationDialogOperation", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_fallbackDialog, a4);
    objc_storeStrong((id *)&v9->_touchIDDialog, a3);
  }

  return v9;
}

- (void)run
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F7B128];
  v4 = [(ISBiometricAuthorizationDialogOperation *)self metricsDictionary];
  id v5 = [v3 dialogIdForMetricsDictionary:v4];

  if (v5 || (id v5 = (id)*MEMORY[0x263F7BB40]) != 0) {
    [(SSBiometricAuthenticationContext *)self->_context setDialogId:v5];
  }
  v6 = [(ISBiometricAuthorizationDialogOperation *)self userAgent];

  if (v6)
  {
    context = self->_context;
    id v8 = [(ISBiometricAuthorizationDialogOperation *)self userAgent];
    [(SSBiometricAuthenticationContext *)context setUserAgent:v8];
  }
  id v85 = 0;
  BOOL v9 = [(ISBiometricAuthorizationDialogOperation *)self _runSignatureOperationReturningError:&v85];
  id v10 = v85;
  unint64_t v11 = 0x263F7B000uLL;
  v12 = (void *)MEMORY[0x263F7B758];
  id v81 = v5;
  if (v9)
  {
    char v13 = 0;
    BOOL v14 = 1;
    uint64_t v15 = 2;
    goto LABEL_68;
  }
  v16 = ISWeakLinkedStringConstantForString("LAErrorDomain", (const void *)0x1E);
  v17 = [v10 domain];
  if (![v17 isEqualToString:v16]) {
    goto LABEL_13;
  }
  uint64_t v18 = [v10 code];
  if (v18 == -1)
  {
LABEL_12:
    char v13 = 1;
    goto LABEL_14;
  }
  if (v18 != -2)
  {
    if (v18 == -8) {
      goto LABEL_12;
    }
LABEL_13:
    char v13 = 0;
LABEL_14:
    if ([(ISBiometricAuthorizationDialogOperation *)self _shouldFallbackToAuthKitForError:v10])
    {
      goto LABEL_15;
    }
    if (![v17 isEqualToString:*v12] || objc_msgSend(v10, "code") != 16)
    {
      uint64_t v15 = 1;
      goto LABEL_32;
    }
    char v77 = v13;
    v20 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v20)
    {
      v20 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      v22 &= 2u;
    }
    if (v22)
    {
      v24 = objc_opt_class();
      int v86 = 138543362;
      v87 = v24;
      id v25 = v24;
      LODWORD(v76) = 12;
      v74 = &v86;
      v26 = (void *)_os_log_send_and_compose_impl();

      unint64_t v11 = 0x263F7B000;
      if (!v26)
      {
LABEL_30:

        uint64_t v15 = 8;
        char v13 = v77;
LABEL_32:
        v80 = v16;
        if (!objc_msgSend(v17, "isEqualToString:", v16, v74) || objc_msgSend(v10, "code") != -2) {
          goto LABEL_52;
        }
        char v78 = v13;
        v27 = [*(id *)(v11 + 504) sharediTunesStoreConfig];
        if (!v27)
        {
          v27 = [*(id *)(v11 + 504) sharedConfig];
        }
        int v28 = [v27 shouldLog];
        if ([v27 shouldLogToDisk]) {
          int v29 = v28 | 2;
        }
        else {
          int v29 = v28;
        }
        v30 = [v27 OSLogObject];
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
          v29 &= 2u;
        }
        if (v29)
        {
          v31 = objc_opt_class();
          int v86 = 138543362;
          v87 = v31;
          v32 = v17;
          unint64_t v33 = v11;
          id v34 = v31;
          LODWORD(v76) = 12;
          v74 = &v86;
          v35 = (void *)_os_log_send_and_compose_impl();

          unint64_t v11 = v33;
          v17 = v32;

          if (!v35)
          {
LABEL_45:

            uint64_t v15 = 8;
            char v13 = v78;
            goto LABEL_52;
          }
          v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v86, v76);
          free(v35);
          v74 = (int *)v30;
          SSFileLog();
        }

        goto LABEL_45;
      }
      v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v86, v76);
      free(v26);
      v74 = (int *)v23;
      SSFileLog();
    }

    goto LABEL_30;
  }
  char v13 = 0;
  if ([(ISBiometricAuthorizationDialogOperation *)self _shouldFallbackToAuthKitForError:v10])
  {
LABEL_15:
    id v84 = 0;
    BOOL v14 = [(ISBiometricAuthorizationDialogOperation *)self _runAuthkitOperationWithError:v10 returningError:&v84];
    id v19 = v84;

    if (v14)
    {
      uint64_t v15 = 4;
LABEL_66:
      id v10 = v19;
      goto LABEL_67;
    }
    v36 = [v19 domain];
    if ([v36 isEqualToString:*v12])
    {
      v37 = v17;
      char v38 = v13;
      uint64_t v39 = [v19 code];

      BOOL v40 = v39 == 140;
      char v13 = v38;
      v17 = v37;
      if (v40)
      {
        uint64_t v15 = 8;
        goto LABEL_66;
      }
    }
    else
    {
    }
    uint64_t v15 = 16;
    goto LABEL_66;
  }
  v80 = v16;
  uint64_t v15 = 8;
LABEL_52:
  char v41 = v13;
  objc_msgSend(*(id *)(v11 + 504), "sharediTunesStoreConfig", v74);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    id v19 = [*(id *)(v11 + 504) sharedConfig];
  }
  int v42 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v43 = v42 | 2;
  }
  else {
    int v43 = v42;
  }
  v44 = [v19 OSLogObject];
  if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
    v43 &= 2u;
  }
  if (v43)
  {
    v79 = v17;
    unint64_t v45 = v11;
    v46 = objc_opt_class();
    int v86 = 138543618;
    v87 = v46;
    __int16 v88 = 2114;
    id v89 = v10;
    id v47 = v46;
    LODWORD(v76) = 22;
    v74 = &v86;
    v48 = (void *)_os_log_send_and_compose_impl();

    if (!v48)
    {
      BOOL v14 = 0;
      unint64_t v11 = v45;
      char v13 = v41;
      v17 = v79;
      v16 = v80;
      goto LABEL_67;
    }
    v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, &v86, v76);
    free(v48);
    v74 = (int *)v44;
    SSFileLog();
    unint64_t v11 = v45;
    char v13 = v41;
    v17 = v79;
  }
  else
  {
    char v13 = v41;
  }

  BOOL v14 = 0;
  v16 = v80;
LABEL_67:

LABEL_68:
  v49 = [(ISBiometricAuthorizationDialogOperation *)self biometricAuthenticationContext];
  int v50 = [v49 isExtendedAction];

  if (v50)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ISBiometricAuthorizationDialogOperation_run__block_invoke;
    block[3] = &unk_264261230;
    block[4] = self;
    block[5] = v15;
    char v83 = v13;
    dispatch_async(dispatchQueue, block);
  }
  uint64_t v52 = [*(id *)(v11 + 504) sharediTunesStoreConfig];
  v53 = (void *)v52;
  if (v14)
  {
    v54 = v81;
    if (!v52)
    {
      v53 = [*(id *)(v11 + 504) sharedConfig];
    }
    int v55 = [v53 shouldLog];
    if ([v53 shouldLogToDisk]) {
      int v56 = v55 | 2;
    }
    else {
      int v56 = v55;
    }
    v57 = [v53 OSLogObject];
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
      v56 &= 2u;
    }
    if (!v56) {
      goto LABEL_91;
    }
    v58 = objc_opt_class();
    int v86 = 138543362;
    v87 = v58;
    id v59 = v58;
    LODWORD(v76) = 12;
    v75 = &v86;
  }
  else
  {
    v54 = v81;
    if (!v52)
    {
      v53 = [*(id *)(v11 + 504) sharedConfig];
    }
    int v60 = [v53 shouldLog];
    if ([v53 shouldLogToDisk]) {
      int v61 = v60 | 2;
    }
    else {
      int v61 = v60;
    }
    v57 = [v53 OSLogObject];
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      v61 &= 2u;
    }
    if (!v61) {
      goto LABEL_91;
    }
    v62 = objc_opt_class();
    int v86 = 138543618;
    v87 = v62;
    __int16 v88 = 2114;
    id v89 = v10;
    id v59 = v62;
    LODWORD(v76) = 22;
    v75 = &v86;
  }
  v63 = (void *)_os_log_send_and_compose_impl();

  if (v63)
  {
    v57 = objc_msgSend(NSString, "stringWithCString:encoding:", v63, 4, &v86, v76);
    free(v63);
    v75 = (int *)v57;
    SSFileLog();
LABEL_91:
  }
  v64 = [v10 domain];
  if (v64 != (void *)*v12 || [v10 code] != 149) {
    goto LABEL_105;
  }
  v65 = [(ISBiometricAuthorizationDialogOperation *)self biometricAuthenticationContext];
  char v66 = [v65 isExtendedAction];

  if ((v66 & 1) == 0)
  {
    v67 = [*(id *)(v11 + 504) sharedConfig];
    int v68 = [v67 shouldLog];
    if ([v67 shouldLogToDisk]) {
      int v69 = v68 | 2;
    }
    else {
      int v69 = v68;
    }
    v70 = objc_msgSend(v67, "OSLogObject", v75);
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT)) {
      v69 &= 2u;
    }
    if (v69)
    {
      v71 = objc_opt_class();
      int v86 = 138543362;
      v87 = v71;
      id v72 = v71;
      LODWORD(v76) = 12;
      v75 = &v86;
      v73 = (void *)_os_log_send_and_compose_impl();

      if (!v73)
      {
LABEL_104:

        v64 = v10;
        id v10 = 0;
LABEL_105:

        goto LABEL_106;
      }
      v70 = objc_msgSend(NSString, "stringWithCString:encoding:", v73, 4, &v86, v76);
      free(v73);
      v75 = (int *)v70;
      SSFileLog();
    }

    goto LABEL_104;
  }
LABEL_106:
  -[ISOperation setError:](self, "setError:", v10, v75);
  [(ISOperation *)self setSuccess:v14];
}

uint64_t __46__ISBiometricAuthorizationDialogOperation_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performMetricsWithBiometricMatch:*(void *)(a1 + 40) didBiometricsFail:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_findSelectedButtonForButtons:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v9, "actionType", (void)v15) == 1)
      {
        selectedButton = [v9 dictionary];
        unint64_t v11 = [selectedButton objectForKey:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [NSURL URLWithString:v11];
          redirectURL = self->_redirectURL;
          self->_redirectURL = v12;
        }
        objc_storeStrong((id *)&self->_selectedButton, v9);

        goto LABEL_15;
      }
      if ([v9 actionType] == 3)
      {
        [(SSBiometricAuthenticationContext *)self->_context setDidBuyParamsChange:1];
        BOOL v14 = v9;
        selectedButton = self->_selectedButton;
        self->_selectedButton = v14;
LABEL_15:

        goto LABEL_16;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_16:
}

- (void)_loadURLBag
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(ISLoadURLBagOperation);
  id v17 = 0;
  BOOL v4 = [(ISOperation *)self runSubOperation:v3 returningError:&v17];
  id v5 = v17;
  uint64_t v6 = v5;
  if (v4 && v5 == 0)
  {
    long long v15 = [(ISLoadURLBagOperation *)v3 URLBag];
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
  unint64_t v11 = [urlBag OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_15;
  }
  v12 = objc_opt_class();
  int v18 = 138543618;
  id v19 = v12;
  __int16 v20 = 2114;
  int v21 = v6;
  id v13 = v12;
  LODWORD(v16) = 22;
  BOOL v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    unint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
    free(v14);
    SSFileLog();
LABEL_15:
  }
LABEL_17:
}

- (void)_performMetricsWithBiometricMatch:(unint64_t)a3 didBiometricsFail:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  urlBag = self->_urlBag;
  if (urlBag
    || ([(ISBiometricAuthorizationDialogOperation *)self _loadURLBag],
        (urlBag = self->_urlBag) != 0))
  {
    uint64_t v7 = -[ISURLBag valueForKey:](urlBag, "valueForKey:", *MEMORY[0x263F7BBD0], a4);
    if ([v7 count])
    {
      id v8 = (void *)MEMORY[0x263F7B128];
      int v9 = [(ISBiometricAuthorizationDialogOperation *)self metricsDictionary];
      int v10 = [v8 dialogIdForMetricsDictionary:v9];

      if (!v10) {
        int v10 = (id)*MEMORY[0x263F7BB40];
      }
      unint64_t v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v11 setObject:v10 forKey:*MEMORY[0x263F7B480]];
      [v11 setObject:&unk_26C6B05C0 forKey:*MEMORY[0x263F7B490]];
      v12 = [NSNumber numberWithUnsignedInteger:a3];
      [v11 setObject:v12 forKey:*MEMORY[0x263F7B470]];

      id v13 = [(ISBiometricAuthorizationDialogOperation *)self buyParams];

      if (v13)
      {
        BOOL v14 = [(ISBiometricAuthorizationDialogOperation *)self buyParams];
        long long v15 = [v14 objectForKey:@"mtTopic"];

        if (v15)
        {
          [v11 setObject:v15 forKey:*MEMORY[0x263F7B4A8]];
        }
      }
      uint64_t v16 = [(ISBiometricAuthorizationDialogOperation *)self userAgent];

      if (v16)
      {
        id v17 = [(ISBiometricAuthorizationDialogOperation *)self userAgent];
        [v11 setObject:v17 forKey:*MEMORY[0x263F7B4B0]];
      }
      int v18 = +[ISDevice sharedInstance];
      uint64_t v19 = [v18 deviceBiometricStyle];

      if (v19)
      {
        if (v19 == 3)
        {
          __int16 v20 = (void *)MEMORY[0x263F7B4B8];
          goto LABEL_45;
        }
        if (v19 == 2)
        {
          __int16 v20 = (void *)MEMORY[0x263F7B4C0];
LABEL_45:
          [v11 setObject:*v20 forKey:*MEMORY[0x263F7B478]];
LABEL_58:
          v37 = objc_msgSend(MEMORY[0x263F7B128], "authorizationDialogEventForParameters:", v11, v40);
          char v38 = (void *)[objc_alloc(MEMORY[0x263F7B230]) initWithGlobalConfiguration:v7];
          id v39 = objc_alloc_init(MEMORY[0x263F7B238]);
          [v39 setGlobalConfiguration:v38];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke;
          v43[3] = &unk_264261258;
          v43[4] = self;
          [v39 insertEvent:v37 withCompletionHandler:v43];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke_21;
          v42[3] = &unk_264261258;
          v42[4] = self;
          [v39 flushUnreportedEventsWithCompletionHandler:v42];

          goto LABEL_59;
        }
        int v29 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v29)
        {
          int v29 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v33 = [v29 shouldLog];
        if ([v29 shouldLogToDisk]) {
          int v34 = v33 | 2;
        }
        else {
          int v34 = v33;
        }
        v32 = [v29 OSLogObject];
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          v34 &= 2u;
        }
        if (!v34) {
          goto LABEL_56;
        }
      }
      else
      {
        int v29 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v29)
        {
          int v29 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v30 = [v29 shouldLog];
        if ([v29 shouldLogToDisk]) {
          int v31 = v30 | 2;
        }
        else {
          int v31 = v30;
        }
        v32 = [v29 OSLogObject];
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          v31 &= 2u;
        }
        if (!v31) {
          goto LABEL_56;
        }
      }
      int v44 = 138543362;
      id v45 = (id)objc_opt_class();
      id v35 = v45;
      LODWORD(v41) = 12;
      BOOL v40 = &v44;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_57:

        goto LABEL_58;
      }
      v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v44, v41);
      free(v36);
      BOOL v40 = (int *)v32;
      SSFileLog();
LABEL_56:

      goto LABEL_57;
    }
    int v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v21 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    unint64_t v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      v22 &= 2u;
    }
    if (!v22) {
      goto LABEL_59;
    }
    int v44 = 138543362;
    id v45 = (id)objc_opt_class();
    id v23 = v45;
    LODWORD(v41) = 12;
    v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      unint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v44, v41);
      free(v24);
      SSFileLog();
LABEL_59:
    }
LABEL_60:

    goto LABEL_61;
  }
  uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v25 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v26 &= 2u;
  }
  if (!v26) {
    goto LABEL_60;
  }
  int v44 = 138543362;
  id v45 = (id)objc_opt_class();
  id v27 = v45;
  LODWORD(v41) = 12;
  int v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v44, v41);
    free(v28);
    SSFileLog();
    goto LABEL_60;
  }
LABEL_61:
}

void __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
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
    uint64_t v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      *(_DWORD *)int v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v2;
      id v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16], v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
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
    uint64_t v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      *(_DWORD *)int v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v2;
      id v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16], v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)_runAuthkitOperationWithError:(id)a3 returningError:(id *)a4
{
  uint64_t v6 = [(SSBiometricAuthenticationContext *)self->_context accountIdentifier];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:v6];
  [v7 setCanCreateNewAccount:0];
  [v7 setCanSetActiveAccount:0];
  [v7 setPromptStyle:1];
  [v7 setShouldCreateNewSession:1];
  id v8 = [(SSBiometricAuthenticationContext *)self->_context passwordEquivalentToken];

  if (v8)
  {
    uint64_t v9 = [(SSBiometricAuthenticationContext *)self->_context passwordEquivalentToken];
    [v7 setPasswordEquivalentToken:v9];
  }
  int v10 = objc_alloc_init(ISServerAuthenticationOperation);
  [(ISServerAuthenticationOperation *)v10 setAuthenticationContext:v7];
  uint64_t v11 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];
  [(ISServerAuthenticationOperation *)v10 setDialog:v11];

  [(ISServerAuthenticationOperation *)v10 setPerformsButtonAction:0];
  id v18 = 0;
  BOOL v12 = [(ISOperation *)self runSubOperation:v10 returningError:&v18];
  id v13 = v18;
  context = self->_context;
  if (!v12 || v13)
  {
    [(SSBiometricAuthenticationContext *)context setDidAuthenticate:0];
    [(SSBiometricAuthenticationContext *)self->_context setDidFallbackToPassword:1];
    if (!a4) {
      goto LABEL_11;
    }
LABEL_10:
    *a4 = v13;
    goto LABEL_11;
  }
  [(SSBiometricAuthenticationContext *)context setDidAuthenticate:1];
  [(SSBiometricAuthenticationContext *)self->_context setDidFallbackToPassword:1];
  [(SSBiometricAuthenticationContext *)self->_context setShouldSendFallbackHeader:1];
  long long v15 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];

  if (v15)
  {
    uint64_t v16 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];
    long long v15 = [v16 buttons];
  }
  [(ISBiometricAuthorizationDialogOperation *)self _findSelectedButtonForButtons:v15];
  objc_storeStrong((id *)&self->_dialog, self->_fallbackDialog);

  if (a4) {
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (BOOL)_runSignatureOperationReturningError:(id *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  int v5 = [ISBiometricSignatureOperation alloc];
  context = self->_context;
  id v7 = [(ISBiometricAuthorizationDialogOperation *)self touchIDDialog];
  id v8 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];
  uint64_t v9 = [(ISBiometricSignatureOperation *)v5 initWithBiometricAuthenticationContext:context touchIDDialog:v7 fallbackDialog:v8];

  uint64_t v42 = 0;
  int v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__6;
  uint64_t v46 = __Block_byref_object_dispose__6;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__6;
  BOOL v40 = __Block_byref_object_dispose__6;
  id v41 = 0;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__6;
  int v34 = __Block_byref_object_dispose__6;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __80__ISBiometricAuthorizationDialogOperation__runSignatureOperationReturningError___block_invoke;
  v29[3] = &unk_264261280;
  v29[4] = &v42;
  v29[5] = &v36;
  v29[6] = &v30;
  [(ISBiometricSignatureOperation *)v9 setOutputBlock:v29];
  id v28 = 0;
  BOOL v10 = [(ISOperation *)self runSubOperation:v9 returningError:&v28];
  id v11 = v28;
  if (v10 && v43[5])
  {
    [(SSBiometricAuthenticationContext *)self->_context setDidAuthenticate:1];
    [(SSBiometricAuthenticationContext *)self->_context setDidFallbackToPassword:0];
    [(SSBiometricAuthenticationContext *)self->_context setSignature:v43[5]];
    [(SSBiometricAuthenticationContext *)self->_context setPaymentTokenData:v37[5]];
    [(SSBiometricAuthenticationContext *)self->_context setFpanID:v31[5]];
    BOOL v12 = [(ISBiometricAuthorizationDialogOperation *)self touchIDDialog];

    if (v12)
    {
      id v13 = [(ISBiometricAuthorizationDialogOperation *)self touchIDDialog];
      BOOL v14 = [v13 buttons];
      long long v15 = &OBJC_IVAR___ISBiometricAuthorizationDialogOperation__touchIDDialog;
    }
    else
    {
      BOOL v14 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];

      if (!v14)
      {
LABEL_20:
        [(ISBiometricAuthorizationDialogOperation *)self _findSelectedButtonForButtons:v14];
        goto LABEL_21;
      }
      id v13 = [(ISBiometricAuthorizationDialogOperation *)self fallbackDialog];
      BOOL v14 = [v13 buttons];
      long long v15 = &OBJC_IVAR___ISBiometricAuthorizationDialogOperation__fallbackDialog;
    }

    v24 = (ISDialog *)*(id *)((char *)&self->super.super.super.isa + *v15);
    dialog = self->_dialog;
    self->_dialog = v24;

    goto LABEL_20;
  }
  uint64_t v16 = [(SSBiometricAuthenticationContext *)self->_context passwordEquivalentToken];

  if (v16)
  {
    SSError();
    BOOL v14 = v11;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  BOOL v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v14)
  {
    BOOL v14 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v17 = [v14 shouldLog];
  int v18 = [v14 shouldLogToDisk];
  uint64_t v19 = [v14 OSLogObject];
  __int16 v20 = v19;
  if (v18) {
    v17 |= 2u;
  }
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (v17)
  {
    int v21 = objc_opt_class();
    int v48 = 138543618;
    v49 = v21;
    __int16 v50 = 2114;
    id v51 = v11;
    id v22 = v21;
    LODWORD(v27) = 22;
    id v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23) {
      goto LABEL_21;
    }
    __int16 v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v48, v27);
    free(v23);
    SSFileLog();
  }

LABEL_21:
  if (a3) {
    *a3 = v11;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v10;
}

void __80__ISBiometricAuthorizationDialogOperation__runSignatureOperationReturningError___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v21 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v21)
  {
    uint64_t v12 = [v21 copy];
    uint64_t v13 = *(void *)(a1[4] + 8);
    BOOL v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  if (v9)
  {
    uint64_t v15 = [v9 copy];
    uint64_t v16 = *(void *)(a1[5] + 8);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  if (v10)
  {
    uint64_t v18 = [v10 copy];
    uint64_t v19 = *(void *)(a1[6] + 8);
    __int16 v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (BOOL)_shouldFallbackToAuthKitForError:(id)a3
{
  id v4 = a3;
  int v5 = ISWeakLinkedStringConstantForString("LAErrorDomain", (const void *)0x1E);
  uint64_t v6 = [(ISBiometricAuthorizationDialogOperation *)self biometricAuthenticationContext];
  id v7 = ISWeakLinkedStringConstantForString("MobileActivationErrorDomain", (const void *)0x25);
  uint64_t v8 = [v4 code];
  id v9 = [v4 domain];
  if ([v9 isEqualToString:v5])
  {
    LOBYTE(v11) = (~v8 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v8 == -8;
  }
  else if ([v9 isEqualToString:v7])
  {
    if ([(SSBiometricAuthenticationContext *)self->_context isExtendedAction]) {
      LOBYTE(v11) = 1;
    }
    else {
      int v11 = [(SSBiometricAuthenticationContext *)self->_context isPayment] ^ 1;
    }
  }
  else if ([v9 isEqualToString:*MEMORY[0x263F7B758]])
  {
    LOBYTE(v11) = 1;
    if (v8 != 4 && v8 != 151 && (v8 != 149 || ([v6 isExtendedAction] & 1) == 0))
    {
      uint64_t v13 = [v4 userInfo];
      BOOL v14 = [v13 objectForKey:*MEMORY[0x263F7B750]];
      if (v14) {
        int v11 = [v6 isIdentityMapInvalid] ^ 1;
      }
      else {
        LOBYTE(v11) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 360, 1);
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 376, 1);
}

- (NSDictionary)buyParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBuyParams:(id)a3
{
}

- (NSDictionary)metricsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setMetricsDictionary:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (ISDialog)fallbackDialog
{
  return (ISDialog *)objc_getProperty(self, a2, 408, 1);
}

- (void)setFallbackDialog:(id)a3
{
}

- (ISTouchIDDialog)touchIDDialog
{
  return (ISTouchIDDialog *)objc_getProperty(self, a2, 416, 1);
}

- (void)setTouchIDDialog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDialog, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end