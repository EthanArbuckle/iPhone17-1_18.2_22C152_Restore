@interface ISProtocolDataProvider
- (BOOL)_processFailureTypeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)_shouldAttemptPasswordPaymentSheetForError:(id)a3;
- (BOOL)_shouldFailWithTokenErrorForDialog:(id)a3 dictionary:(id)a4 error:(id *)a5;
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (BOOL)processDialogFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)processDictionary:(id)a3 error:(id *)a4;
- (BOOL)shouldPostFooterSectionChanged;
- (BOOL)shouldProcessAccount;
- (BOOL)shouldProcessAuthenticationDialogs;
- (BOOL)shouldProcessDialogs;
- (BOOL)shouldProcessDialogsOutsideDaemon;
- (BOOL)shouldProcessProtocol;
- (BOOL)shouldProcessTouchIDDialogs;
- (BOOL)shouldTriggerDownloads;
- (ISProtocolDataProvider)init;
- (NSString)presentingSceneIdentifier;
- (id)_metricsDictionaryForResponse:(id)a3;
- (id)_touchIDDialogForResponse:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_checkBiometricFailureForResponse:(id)a3;
- (void)_checkDownloadQueues;
- (void)_checkInAppPurchaseQueueForAction:(id)a3;
- (void)_performActionsForResponse:(id)a3;
- (void)_presentDialog:(id)a3;
- (void)_refreshSubscriptionStatus;
- (void)_selectFooterSection:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setShouldPostFooterSectionChanged:(BOOL)a3;
- (void)setShouldProcessAccount:(BOOL)a3;
- (void)setShouldProcessAuthenticationDialogs:(BOOL)a3;
- (void)setShouldProcessDialogs:(BOOL)a3;
- (void)setShouldProcessDialogsOutsideDaemon:(BOOL)a3;
- (void)setShouldProcessProtocol:(BOOL)a3;
- (void)setShouldTriggerDownloads:(BOOL)a3;
@end

@implementation ISProtocolDataProvider

- (ISProtocolDataProvider)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISProtocolDataProvider;
  result = [(ISDataProvider *)&v4 init];
  if (result)
  {
    result->_shouldPostFooterSectionChanged = 1;
    result->_shouldProcessAccount = 1;
    result->_shouldProcessAuthenticationDialogs = 1;
    result->_shouldProcessDialogs = 1;
    result->_shouldProcessDialogsOutsideDaemon = 0;
    result->_shouldProcessProtocol = 1;
    result->_shouldTriggerDownloads = 1;
  }
  return result;
}

- (BOOL)processDialogFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v61 = a3;
  v6 = [(ISDataProvider *)self authenticationContext];
  v7 = (void *)[v6 mutableCopy];

  v8 = (void *)MEMORY[0x263F7B0E8];
  v9 = [(ISDataProvider *)self response];
  objc_msgSend(v7, "setAllowsSilentAuthentication:", objc_msgSend(v8, "URLResponseAllowsSilentAuthentication:", v9));

  LODWORD(v8) = [(ISProtocolDataProvider *)self shouldProcessAuthenticationDialogs];
  BOOL v58 = [(ISProtocolDataProvider *)self shouldProcessTouchIDDialogs];
  if (!v8) {
    goto LABEL_4;
  }
  if (v7)
  {
    if ([v7 promptStyle] == 1000)
    {
LABEL_4:
      int v56 = 0;
      goto LABEL_8;
    }
    int v10 = [v7 shouldSuppressDialogs] ^ 1;
  }
  else
  {
    int v10 = 1;
  }
  int v56 = v10;
LABEL_8:
  if ([(ISProtocolDataProvider *)self shouldProcessDialogs]) {
    int v57 = [v7 shouldSuppressDialogs] ^ 1;
  }
  else {
    int v57 = 0;
  }
  v64 = (void *)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:v61];
  [v64 actionsWithActionType:*MEMORY[0x263F7BC48]];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v63)
  {
    v65 = self;
    v55 = a4;
    id v11 = 0;
    uint64_t v62 = *(void *)v72;
    v59 = v7;
LABEL_13:
    uint64_t v12 = 0;
    id v13 = v11;
    while (1)
    {
      if (*(void *)v72 != v62) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v71 + 1) + 8 * v12);
      v15 = -[ISProtocolDataProvider _metricsDictionaryForResponse:](v65, "_metricsDictionaryForResponse:", v64, v53, v54);
      v16 = [MEMORY[0x263F7B128] dialogIdForMetricsDictionary:v15];
      v17 = [v14 dialog];
      v18 = [ISDialog alloc];
      v19 = [v17 dialogDictionary];
      v20 = [(ISDialog *)v18 initWithDialogDictionary:v19 authenticationContext:v7];

      v21 = [(ISDialog *)v20 paymentSheet];
      [v21 setDialogId:v16];

      v22 = [(ISDialog *)v20 paymentSheet];
      [v22 setPresentingSceneIdentifier:v65->_presentingSceneIdentifier];

      if (!v20)
      {
        int v31 = 1;
LABEL_33:
        id v11 = v13;
        goto LABEL_49;
      }
      id v70 = v13;
      BOOL v23 = [(ISProtocolDataProvider *)v65 _shouldFailWithTokenErrorForDialog:v20 dictionary:v61 error:&v70];
      id v11 = v70;

      if (v23) {
        break;
      }
      if ([(ISDialog *)v20 kind] != 1)
      {
        if (v57) {
          [(ISProtocolDataProvider *)v65 _presentDialog:v20];
        }
LABEL_48:
        int v31 = 1;
        goto LABEL_49;
      }
      if (!v58)
      {
        if (!v56) {
          goto LABEL_48;
        }
        v40 = [(ISDataProvider *)v65 biometricSessionDelegate];
        char v41 = objc_opt_respondsToSelector();

        if (v41)
        {
          v42 = [(ISDataProvider *)v65 biometricSessionDelegate];
          [v42 sender:v65 didFallbackToPassword:1];
        }
        id v66 = v11;
        int v31 = [(ISDataProvider *)v65 runAuthorizationDialog:v20 error:&v66];
        id v13 = v66;

        goto LABEL_33;
      }
      v32 = v65;
      v33 = [(ISProtocolDataProvider *)v65 _touchIDDialogForResponse:v64];
      v34 = [v33 paymentSheet];
      [v34 setDialogId:v16];

      v35 = [v33 paymentSheet];
      v36 = v33;
      [v35 setPresentingSceneIdentifier:v65->_presentingSceneIdentifier];

      [(ISProtocolDataProvider *)v65 _checkBiometricFailureForResponse:v61];
      id v69 = v11;
      int v37 = [(ISDataProvider *)v65 runTouchIDAuthorizationDialog:v33 fallbackDialog:v20 metricsDictionary:v15 error:&v69];
      id v38 = v69;

      if (v38) {
        int v39 = 1;
      }
      else {
        int v39 = v37;
      }
      if ((v39 | v56 ^ 1))
      {
        if (v37)
        {
          id v11 = v38;
LABEL_58:

          int v31 = 1;
          goto LABEL_31;
        }
        v32 = v65;
        if (([(ISProtocolDataProvider *)v65 _shouldAttemptPasswordPaymentSheetForError:v38] & v56) == 1)
        {
          id v67 = v38;
          BOOL v44 = [(ISDataProvider *)v65 runAuthorizationDialog:v20 error:&v67];
          id v11 = v67;

          if (v44)
          {
LABEL_56:
            v45 = [(ISDataProvider *)v32 biometricAuthenticationContext];
            [v45 setDidFallbackToPassword:1];

            v46 = [(ISDataProvider *)v32 biometricSessionDelegate];
            char v47 = objc_opt_respondsToSelector();

            if (v47)
            {
              v48 = [(ISDataProvider *)v65 biometricSessionDelegate];
              [v48 sender:v65 didFallbackToPassword:1];
            }
            goto LABEL_58;
          }
        }
        else
        {
          id v11 = v38;
        }
      }
      else
      {
        id v68 = 0;
        BOOL v43 = [(ISDataProvider *)v65 runAuthorizationDialog:v20 error:&v68];
        id v11 = v68;
        if (v43) {
          goto LABEL_56;
        }
      }

LABEL_30:
      int v31 = 0;
LABEL_31:
      v7 = v59;
LABEL_49:

      if (!v31)
      {
        v50 = obj;

        if (v55)
        {
          id v11 = v11;
          BOOL v51 = 0;
          id *v55 = v11;
        }
        else
        {
          BOOL v51 = 0;
        }
        goto LABEL_68;
      }
      ++v12;
      id v13 = v11;
      if (v63 == v12)
      {
        uint64_t v49 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
        uint64_t v63 = v49;
        if (v49) {
          goto LABEL_13;
        }
        goto LABEL_66;
      }
    }
    v24 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v24)
    {
      v24 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    v27 = [v24 OSLogObject];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      v26 &= 2u;
    }
    if (v26)
    {
      v28 = objc_opt_class();
      int v75 = 138543618;
      v76 = v28;
      __int16 v77 = 2112;
      id v78 = v11;
      id v29 = v28;
      LODWORD(v54) = 22;
      v53 = &v75;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_29:

        goto LABEL_30;
      }
      v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v75, v54);
      free(v30);
      v53 = (int *)v27;
      SSFileLog();
    }

    goto LABEL_29;
  }
  id v11 = 0;
LABEL_66:
  v50 = obj;

  BOOL v51 = 1;
LABEL_68:

  return v51;
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(ISProtocolDataProvider *)self shouldProcessProtocol])
  {
    id v13 = 0;
    BOOL v14 = 1;
    goto LABEL_46;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:v6];
  v45 = a4;
  id v46 = v6;
  if (([v7 isSupportedProtocolVersion] & 1) == 0)
  {
    int v10 = [v7 versionMismatchURL];
    v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      int v19 = v17;
    }
    else {
      int v19 = v17 & 2;
    }
    if (v19)
    {
      int v55 = 138412546;
      id v56 = (id)objc_opt_class();
      __int16 v57 = 2112;
      BOOL v58 = v10;
      id v20 = v56;
      LODWORD(v41) = 22;
      int v39 = &v55;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_18:

        [(ISDataProvider *)self setRedirectURL:v10];
        id v12 = 0;
        BOOL v11 = v10 != 0;
        goto LABEL_19;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v55, v41);
      free(v21);
      int v39 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_18;
  }
  id v53 = 0;
  BOOL v8 = [(ISProtocolDataProvider *)self processDialogFromDictionary:v6 error:&v53];
  id v9 = v53;
  int v10 = v9;
  if (!v8)
  {
    id v43 = v9;
    BOOL v42 = 0;
    goto LABEL_21;
  }
  [(ISProtocolDataProvider *)self _performActionsForResponse:v7];
  id v52 = v10;
  BOOL v11 = [(ISProtocolDataProvider *)self _processFailureTypeFromDictionary:v6 error:&v52];
  id v12 = v52;
LABEL_19:
  BOOL v42 = v11;

  id v43 = v12;
LABEL_21:
  BOOL v44 = v7;
  objc_msgSend(v7, "pingURLs", v39);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v22) {
    goto LABEL_40;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v49 != v24) {
        objc_enumerationMutation(obj);
      }
      int v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      v27 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v40);
      if (!v27)
      {
        v27 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v28 = [v27 shouldLog];
      if ([v27 shouldLogToDisk]) {
        int v29 = v28 | 2;
      }
      else {
        int v29 = v28;
      }
      v30 = [v27 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        int v31 = v29;
      }
      else {
        int v31 = v29 & 2;
      }
      if (v31)
      {
        v32 = objc_opt_class();
        int v55 = 138412546;
        id v56 = v32;
        __int16 v57 = 2112;
        BOOL v58 = v26;
        id v33 = v32;
        LODWORD(v41) = 22;
        v40 = &v55;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34) {
          goto LABEL_38;
        }
        v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v55, v41);
        free(v34);
        v40 = (int *)v30;
        SSFileLog();
      }

LABEL_38:
      v35 = +[ISOperationQueue mainQueue];
      v36 = +[ISStoreURLOperation pingOperationWithUrl:v26];
      [v35 addOperation:v36];
    }
    uint64_t v23 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  }
  while (v23);
LABEL_40:

  BOOL v14 = v42;
  if (v45) {
    char v37 = v42;
  }
  else {
    char v37 = 1;
  }
  if (v37)
  {
    id v6 = v46;
    id v13 = v43;
  }
  else
  {
    id v13 = v43;
    BOOL v14 = 0;
    id *v45 = v13;
    id v6 = v46;
  }
LABEL_46:

  return v14;
}

- (BOOL)shouldProcessTouchIDDialogs
{
  v2 = [(ISDataProvider *)self biometricAuthenticationContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(ISDataProvider *)self contentType];
  BOOL v8 = v7;
  BOOL v9 = v7 != 0;
  if (v7 && [v7 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = 0;
    id v11 = 0;
  }
  else
  {
    id v41 = 0;
    int v10 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v41];
    id v11 = v41;
    if (v9) {
      goto LABEL_8;
    }
  }
  if (!v10)
  {
    if (v6)
    {
      id v40 = 0;
      int v10 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v40];
      id v12 = v40;

      id v11 = v12;
      goto LABEL_8;
    }
    uint64_t v22 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v22)
    {
      uint64_t v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    int v25 = [v22 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (v24)
    {
      int v26 = objc_opt_class();
      int v42 = 138412290;
      id v43 = v26;
      id v27 = v26;
      LODWORD(v38) = 12;
      char v37 = &v42;
      int v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_33:

LABEL_34:
        int v29 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v37);
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
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          v31 &= 2u;
        }
        if (v31)
        {
          id v33 = objc_opt_class();
          int v42 = 138412546;
          id v43 = v33;
          __int16 v44 = 2112;
          id v45 = v11;
          id v34 = v33;
          LODWORD(v38) = 22;
          v35 = (void *)_os_log_send_and_compose_impl();

          if (!v35)
          {
LABEL_45:

            SSError();
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            int v10 = 0;
            goto LABEL_46;
          }
          v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v42, v38);
          free(v35);
          SSFileLog();
        }

        goto LABEL_45;
      }
      int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v42, v38);
      free(v28);
      char v37 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_33;
  }
LABEL_8:
  if (!v10) {
    goto LABEL_34;
  }
  id v39 = v11;
  BOOL v13 = [(ISProtocolDataProvider *)self processDictionary:v10 error:&v39];
  id v14 = v39;

  if (v13)
  {
    [(ISDataProvider *)self setOutput:v10];
    BOOL v15 = 1;
    goto LABEL_49;
  }
  id v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v11)
  {
    id v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v11 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (v17)
  {
    int v19 = objc_opt_class();
    int v42 = 138412546;
    id v43 = v19;
    __int16 v44 = 2112;
    id v45 = v14;
    id v20 = v19;
    LODWORD(v38) = 22;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_46;
    }
    v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v42, v38);
    free(v21);
    SSFileLog();
  }

LABEL_46:
  [(ISDataProvider *)self setOutput:v10];
  if (a4)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a4 = v14;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_49:

  return v15;
}

- (void)_presentDialog:(id)a3
{
  id v6 = a3;
  if ((SSIsDaemon() & 1) != 0
    || [(ISProtocolDataProvider *)self shouldProcessDialogsOutsideDaemon])
  {
    objc_super v4 = +[ISOperationQueue mainQueue];
    v5 = +[ISDialogOperation operationWithDialog:v6];
    [v4 addOperation:v5];
  }
  else
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"ISDialogReceivedNotification" object:v6];
  }
}

- (void)_checkDownloadQueues
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(ISProtocolDataProvider *)self shouldTriggerDownloads])
  {
    v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v2)
    {
      v2 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      v4 &= 2u;
    }
    if (v4)
    {
      LODWORD(v9) = 138412290;
      *(void *)((char *)&v9 + 4) = objc_opt_class();
      id v6 = *(id *)((char *)&v9 + 4);
      LODWORD(v8) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        [MEMORY[0x263F7B178] _triggerDownloads];
        return;
      }
      v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
      free(v7);
      SSFileLog();
    }

    goto LABEL_13;
  }
}

- (void)_checkBiometricFailureForResponse:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  int v4 = (void *)MEMORY[0x263F7B1F8];
  id v5 = a3;
  id v6 = [v4 sharediTunesStoreConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  long long v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (v8)
  {
    *(_DWORD *)int v55 = 138543362;
    *(void *)&v55[4] = objc_opt_class();
    id v10 = *(id *)&v55[4];
    LODWORD(v54) = 12;
    id v52 = v55;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    long long v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v55, v54, *(_OWORD *)v55);
    free(v11);
    id v52 = v9;
    SSFileLog();
  }

LABEL_12:
  id v12 = [v5 objectForKeyedSubscript:@"dialog"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v13 = [v12 objectForKeyedSubscript:@"okButtonAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v13 objectForKeyedSubscript:@"buyParams"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v15 = (void *)[NSURL copyDictionaryForQueryString:v14 unescapedValues:1];
        int v16 = [v15 objectForKeyedSubscript:@"hasFailedTouchIDChallenge"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v17 = [v16 lowercaseString];
          uint64_t v18 = [v17 isEqualToString:@"true"];
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  int v19 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v52);
  if (!v19)
  {
    int v19 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    v21 &= 2u;
  }
  if (v21)
  {
    int v23 = objc_opt_class();
    int v24 = NSNumber;
    id v25 = v23;
    int v26 = [v24 numberWithBool:v18];
    *(_DWORD *)int v55 = 138543618;
    *(void *)&v55[4] = v23;
    *(_WORD *)&v55[12] = 2114;
    *(void *)&v55[14] = v26;
    LODWORD(v54) = 22;
    id v53 = v55;
    id v27 = (void *)_os_log_send_and_compose_impl();

    if (!v27) {
      goto LABEL_35;
    }
    uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, v55, v54);
    free(v27);
    id v53 = v22;
    SSFileLog();
  }

LABEL_35:
  if (v18)
  {
    int v28 = [MEMORY[0x263F7B0E8] defaultStore];
    int v29 = [v28 activeAccount];

    int v30 = [(ISDataProvider *)self biometricAuthenticationContext];
    int v31 = [v30 accountName];

    if (v31) {
      goto LABEL_49;
    }
    v32 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v32)
    {
      v32 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v33 = objc_msgSend(v32, "shouldLog", v53);
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    v35 = [v32 OSLogObject];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      v34 &= 2u;
    }
    if (v34)
    {
      v36 = objc_opt_class();
      *(_DWORD *)int v55 = 138543362;
      *(void *)&v55[4] = v36;
      id v37 = v36;
      LODWORD(v54) = 12;
      id v53 = v55;
      uint64_t v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_48:

        id v39 = [(ISDataProvider *)self biometricAuthenticationContext];
        id v40 = [v29 accountName];
        [v39 setAccountName:v40];

LABEL_49:
        id v41 = [(ISDataProvider *)self biometricAuthenticationContext];
        int v42 = [v41 accountIdentifier];

        if (v42)
        {
LABEL_62:

          goto LABEL_63;
        }
        id v43 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v43)
        {
          id v43 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v44 = [v43 shouldLog];
        if ([v43 shouldLogToDisk]) {
          int v45 = v44 | 2;
        }
        else {
          int v45 = v44;
        }
        uint64_t v46 = [v43 OSLogObject];
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          v45 &= 2u;
        }
        if (v45)
        {
          char v47 = objc_opt_class();
          *(_DWORD *)int v55 = 138543362;
          *(void *)&v55[4] = v47;
          id v48 = v47;
          LODWORD(v54) = 12;
          long long v49 = (void *)_os_log_send_and_compose_impl();

          if (!v49)
          {
LABEL_61:

            long long v50 = [(ISDataProvider *)self biometricAuthenticationContext];
            long long v51 = [v29 uniqueIdentifier];
            [v50 setAccountIdentifier:v51];

            goto LABEL_62;
          }
          uint64_t v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v49, 4, v55, v54);
          free(v49);
          SSFileLog();
        }

        goto LABEL_61;
      }
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, v55, v54);
      free(v38);
      id v53 = v35;
      SSFileLog();
    }

    goto LABEL_48;
  }
LABEL_63:
}

- (void)_checkInAppPurchaseQueueForAction:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7B358]);
  objc_msgSend(v5, "setBagType:", objc_msgSend(v4, "URLBagType"));
  id v6 = [(ISDataProvider *)self authenticationContext];
  int v7 = [v6 requiredUniqueIdentifier];
  [v5 setUserIdentifier:v7];

  int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v8)
  {
    int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_11;
  }
  id v12 = objc_opt_class();
  id v13 = v12;
  uint64_t v14 = [v5 bagType];
  [v4 clientIdentifier];
  int v18 = 138412802;
  int v19 = v12;
  __int16 v20 = 2048;
  uint64_t v21 = v14;
  __int16 v22 = 2112;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 32;
  BOOL v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v18, v17);
    free(v15);
    SSFileLog();
LABEL_11:
  }
  int v16 = [v4 clientIdentifier];
  SSCheckInAppPurchaseQueue();
}

- (id)_metricsDictionaryForResponse:(id)a3
{
  int v3 = [a3 responseDictionary];
  id v4 = [v3 objectForKey:@"metrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)_performActionsForResponse:(id)a3
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v4 = [a3 actions];
  unint64_t v5 = 0x263F7B000uLL;
  if ([v4 count])
  {
    id v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v118 = 138412546;
      id v119 = (id)objc_opt_class();
      __int16 v120 = 2112;
      v121 = v4;
      id v10 = v119;
      LODWORD(v91) = 22;
      v89 = &v118;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v118, v91);
      free(v11);
      v89 = (int *)v9;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v114 objects:v124 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v115;
    uint64_t v109 = *MEMORY[0x263F7BC08];
    uint64_t v105 = *MEMORY[0x263F7BC10];
    uint64_t v102 = *MEMORY[0x263F7BC18];
    CFStringRef name = (const __CFString *)*MEMORY[0x263F7BDB0];
    uint64_t v111 = *MEMORY[0x263F7BC20];
    uint64_t v108 = *MEMORY[0x263F7BC28];
    uint64_t v104 = *MEMORY[0x263F7BC30];
    uint64_t v100 = *MEMORY[0x263F7BC38];
    uint64_t v99 = *MEMORY[0x263F7BC40];
    uint64_t v16 = *MEMORY[0x263F7BBF8];
    uint64_t v96 = *MEMORY[0x263F7BC00];
    id v103 = v12;
    uint64_t v106 = *(void *)v115;
    uint64_t v107 = *MEMORY[0x263F7BBF8];
    do
    {
      uint64_t v17 = 0;
      uint64_t v110 = v14;
      do
      {
        if (*(void *)v115 != v15) {
          objc_enumerationMutation(v12);
        }
        int v18 = *(void **)(*((void *)&v114 + 1) + 8 * v17);
        int v19 = objc_msgSend(v18, "actionType", v89);
        if ([v19 isEqualToString:v16])
        {
          [(ISProtocolDataProvider *)self _checkDownloadQueues];
          goto LABEL_58;
        }
        if (![v19 isEqualToString:v109])
        {
          if (![v19 isEqualToString:v105])
          {
            if (![v19 isEqualToString:v102]) {
              goto LABEL_58;
            }
            v35 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
            if (!v35)
            {
              v35 = [*(id *)(v5 + 504) sharedConfig];
            }
            int v36 = [v35 shouldLog];
            if ([v35 shouldLogToDisk]) {
              v36 |= 2u;
            }
            id v37 = [v35 OSLogObject];
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              v36 &= 2u;
            }
            if (v36)
            {
              uint64_t v38 = objc_opt_class();
              id v39 = v38;
              id v40 = [v18 URL];
              int v118 = 138412546;
              id v119 = v38;
              __int16 v120 = 2112;
              v121 = v40;
              LODWORD(v91) = 22;
              v90 = &v118;
              id v41 = (void *)_os_log_send_and_compose_impl();

              id v12 = v103;
              unint64_t v5 = 0x263F7B000uLL;

              if (v41)
              {
                id v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v118, v91);
                free(v41);
                v90 = (int *)v37;
                SSFileLog();
                goto LABEL_55;
              }
            }
            else
            {
LABEL_55:
            }
            int v42 = [v18 URL];
            id v43 = +[ISOpenURLRequest openURLRequestWithURL:v42];

            [v43 setITunesStoreURL:0];
            int v44 = [[ISOpenURLOperation alloc] initWithOpenURLRequest:v43];
            int v45 = +[ISOperationQueue mainQueue];
            [v45 addOperation:v44];

            uint64_t v15 = v106;
            goto LABEL_57;
          }
          int v28 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
          if (!v28)
          {
            int v28 = [*(id *)(v5 + 504) sharedConfig];
          }
          int v29 = [v28 shouldLog];
          if ([v28 shouldLogToDisk]) {
            v29 |= 2u;
          }
          int v30 = [v28 OSLogObject];
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            v29 &= 2u;
          }
          if (v29)
          {
            int v31 = objc_opt_class();
            int v118 = 138412290;
            id v119 = v31;
            id v32 = v31;
            LODWORD(v91) = 12;
            v90 = &v118;
            int v33 = (void *)_os_log_send_and_compose_impl();

            uint64_t v15 = v106;
            if (v33)
            {
              int v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v118, v91);
              free(v33);
              v90 = (int *)v30;
              SSFileLog();
              goto LABEL_43;
            }
          }
          else
          {
LABEL_43:
          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
          goto LABEL_57;
        }
        __int16 v20 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
        if (!v20)
        {
          __int16 v20 = [*(id *)(v5 + 504) sharedConfig];
        }
        int v21 = [v20 shouldLog];
        if ([v20 shouldLogToDisk]) {
          v21 |= 2u;
        }
        __int16 v22 = [v20 OSLogObject];
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          v21 &= 2u;
        }
        if (!v21) {
          goto LABEL_31;
        }
        id v23 = objc_opt_class();
        id v24 = v23;
        id v25 = [v18 URL];
        int v118 = 138412546;
        id v119 = v23;
        id v12 = v103;
        __int16 v120 = 2112;
        v121 = v25;
        LODWORD(v91) = 22;
        v90 = &v118;
        int v26 = (void *)_os_log_send_and_compose_impl();

        unint64_t v5 = 0x263F7B000;
        uint64_t v15 = v106;

        if (v26)
        {
          __int16 v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v118, v91);
          free(v26);
          v90 = (int *)v22;
          SSFileLog();
LABEL_31:
        }
        id v27 = [v18 URL];
        [(ISDataProvider *)self setRedirectURL:v27];

LABEL_57:
        uint64_t v14 = v110;
        uint64_t v16 = v107;
LABEL_58:
        if (objc_msgSend(v19, "isEqualToString:", v111, v90))
        {
          [(ISProtocolDataProvider *)self _refreshSubscriptionStatus];
          goto LABEL_120;
        }
        if ([v19 isEqualToString:v108])
        {
          [MEMORY[0x263F7B178] retryAllRestoreDownloads];
          goto LABEL_120;
        }
        if ([v19 isEqualToString:v104])
        {
          uint64_t v46 = [v18 footerSection];
          [(ISProtocolDataProvider *)self _selectFooterSection:v46];

          goto LABEL_120;
        }
        if ([v19 isEqualToString:v100])
        {
          if (![(ISProtocolDataProvider *)self shouldProcessAccount]) {
            goto LABEL_120;
          }
          char v47 = [v18 account];
          id v48 = [v18 creditsString];
          [v47 setCreditsString:v48];

          long long v49 = [MEMORY[0x263F7B0E8] defaultStore];
          id v113 = 0;
          [v49 saveAccount:v47 verifyCredentials:0 error:&v113];
          id v50 = v113;

          if (v50)
          {
            long long v51 = [*(id *)(v5 + 504) sharedAccountsConfig];
            if (!v51)
            {
              long long v51 = [*(id *)(v5 + 504) sharedConfig];
            }
            int v52 = [v51 shouldLog];
            if ([v51 shouldLogToDisk]) {
              v52 |= 2u;
            }
            id v53 = [v51 OSLogObject];
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              v52 &= 2u;
            }
            if (v52)
            {
              uint64_t v54 = objc_opt_class();
              id v94 = v54;
              int v55 = [v47 accountName];
              SSHashIfNeeded();
              uint64_t v56 = v97 = v50;
              int v118 = 138543618;
              id v119 = v54;
              uint64_t v15 = v106;
              __int16 v120 = 2114;
              v121 = v56;
              LODWORD(v91) = 22;
              v89 = &v118;
              __int16 v57 = (void *)_os_log_send_and_compose_impl();

              unint64_t v5 = 0x263F7B000;
              id v50 = v97;

              if (v57)
              {
                id v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v57, 4, &v118, v91);
                free(v57);
                v89 = (int *)v53;
                SSFileLog();
                goto LABEL_76;
              }
            }
            else
            {
LABEL_76:
            }
            id v12 = v103;
            uint64_t v14 = v110;
          }

LABEL_119:
          uint64_t v16 = v107;
          goto LABEL_120;
        }
        if ([v19 isEqualToString:v99])
        {
          if (![(ISProtocolDataProvider *)self shouldProcessAccount]) {
            goto LABEL_120;
          }
          BOOL v58 = [v18 account];
          [v58 setActive:1];
          uint64_t v59 = [*(id *)(v5 + 504) sharedAccountsConfig];
          if (!v59)
          {
            uint64_t v59 = [*(id *)(v5 + 504) sharedConfig];
          }
          int v60 = [v59 shouldLog];
          if ([v59 shouldLogToDisk]) {
            v60 |= 2u;
          }
          id v61 = [v59 OSLogObject];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
            int v62 = v60;
          }
          else {
            int v62 = v60 & 2;
          }
          v98 = v58;
          if (v62)
          {
            uint64_t v63 = objc_opt_class();
            id v64 = v63;
            v65 = [v58 accountName];
            id v66 = SSHashIfNeeded();
            int v118 = 138543618;
            id v119 = v63;
            __int16 v120 = 2114;
            v121 = v66;
            LODWORD(v91) = 22;
            v89 = &v118;
            id v67 = (void *)_os_log_send_and_compose_impl();

            unint64_t v5 = 0x263F7B000uLL;
            BOOL v58 = v98;

            if (v67)
            {
              id v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v67, 4, &v118, v91);
              free(v67);
              v89 = (int *)v61;
              SSFileLog();
              goto LABEL_91;
            }
          }
          else
          {
LABEL_91:
          }
          id v68 = [MEMORY[0x263F7B0E8] defaultStore];
          id v112 = 0;
          int v69 = [v68 saveAccount:v58 verifyCredentials:0 error:&v112];
          id v70 = v112;

          uint64_t v71 = [*(id *)(v5 + 504) sharedAccountsConfig];
          long long v72 = (void *)v71;
          v95 = v70;
          if (v69)
          {
            if (!v71)
            {
              long long v72 = [*(id *)(v5 + 504) sharedConfig];
            }
            int v73 = objc_msgSend(v72, "shouldLog", v89);
            if ([v72 shouldLogToDisk]) {
              v73 |= 2u;
            }
            long long v74 = [v72 OSLogObject];
            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO)) {
              int v75 = v73;
            }
            else {
              int v75 = v73 & 2;
            }
            if (v75)
            {
              v76 = objc_opt_class();
              id v77 = v76;
              id v78 = [v58 accountName];
              v79 = SSHashIfNeeded();
              int v118 = 138543618;
              id v119 = v76;
              __int16 v120 = 2114;
              v121 = v79;
              LODWORD(v91) = 22;
              v89 = &v118;
              uint64_t v80 = _os_log_send_and_compose_impl();

              if (v80)
              {
                long long v74 = objc_msgSend(NSString, "stringWithCString:encoding:", v80, 4, &v118, v91);
                v81 = (void *)v80;
                goto LABEL_115;
              }
LABEL_117:
              unint64_t v5 = 0x263F7B000;
              id v12 = v103;
              uint64_t v15 = v106;
              uint64_t v14 = v110;
LABEL_118:

              goto LABEL_119;
            }
          }
          else
          {
            if (!v71)
            {
              long long v72 = [*(id *)(v5 + 504) sharedConfig];
            }
            int v82 = objc_msgSend(v72, "shouldLog", v89);
            if ([v72 shouldLogToDisk]) {
              v82 |= 2u;
            }
            long long v74 = [v72 OSLogObject];
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              int v83 = v82;
            }
            else {
              int v83 = v82 & 2;
            }
            if (v83)
            {
              v84 = objc_opt_class();
              id v93 = v84;
              v92 = [v98 accountName];
              v85 = SSHashIfNeeded();
              v86 = [v70 description];
              v87 = SSHashIfNeeded();
              int v118 = 138543874;
              id v119 = v84;
              __int16 v120 = 2114;
              v121 = v85;
              __int16 v122 = 2114;
              v123 = v87;
              LODWORD(v91) = 32;
              v89 = &v118;
              uint64_t v88 = _os_log_send_and_compose_impl();

              if (!v88) {
                goto LABEL_117;
              }
              long long v74 = objc_msgSend(NSString, "stringWithCString:encoding:", v88, 4, &v118, v91);
              v81 = (void *)v88;
LABEL_115:
              free(v81);
              v89 = (int *)v74;
              SSFileLog();
              unint64_t v5 = 0x263F7B000;
            }
          }
          id v12 = v103;
          uint64_t v15 = v106;
          uint64_t v14 = v110;

          goto LABEL_118;
        }
        if ([v19 isEqualToString:v96]) {
          [(ISProtocolDataProvider *)self _checkInAppPurchaseQueueForAction:v18];
        }
LABEL_120:

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v114 objects:v124 count:16];
    }
    while (v14);
  }
}

- (BOOL)_processFailureTypeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a3 objectForKey:@"failureType"];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 intValue];
    if ((v6 - 1001) <= 3 && v6 != 1002)
    {
      uint64_t v19 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      __int16 v20 = (void *)v19;
      if (!v19)
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
      id v23 = [v20 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        v22 &= 2u;
      }
      if (v22)
      {
        id v24 = objc_opt_class();
        id v25 = v24;
        int v28 = 138543618;
        int v29 = v24;
        __int16 v30 = 1024;
        int v31 = [v5 intValue];
        LODWORD(v27) = 18;
        int v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
        {
LABEL_35:

          [v5 intValue];
          uint64_t v15 = SSError();
LABEL_36:
          uint64_t v16 = (void *)v15;
          BOOL v17 = 0;
          if (!a4) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        id v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v28, v27);
        free(v26);
        SSFileLog();
      }

      goto LABEL_35;
    }
    if (v6 == 2034 || v6 == 2002)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v8)
      {
        int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      id v11 = [v8 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (v10)
      {
        id v12 = objc_opt_class();
        id v13 = v12;
        int v28 = 138543618;
        int v29 = v12;
        __int16 v30 = 1024;
        int v31 = [v5 intValue];
        LODWORD(v27) = 18;
        uint64_t v14 = (void *)_os_log_send_and_compose_impl();

        if (!v14)
        {
LABEL_20:

          uint64_t v15 = ISError(18, 0, 0);
          goto LABEL_36;
        }
        id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v28, v27);
        free(v14);
        SSFileLog();
      }

      goto LABEL_20;
    }
  }
  uint64_t v16 = 0;
  BOOL v17 = 1;
  if (a4) {
LABEL_22:
  }
    *a4 = v16;
LABEL_23:

  return v17;
}

- (void)_refreshSubscriptionStatus
{
  if ((SSIsDaemon() & 1) == 0)
  {
    id v2 = objc_alloc(NSDictionary);
    id v4 = objc_msgSend(v2, "initWithObjectsAndKeys:", MEMORY[0x263EFFA80], *MEMORY[0x263F7BD00], MEMORY[0x263EFFA88], *MEMORY[0x263F7BD08], 0);
    int v3 = [MEMORY[0x263F7B3E8] sharedCoordinator];
    [v3 getStatusWithOptions:v4 statusBlock:0];
  }
}

- (void)_selectFooterSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ISProtocolDataProvider *)self shouldPostFooterSectionChanged])
  {
    unint64_t v5 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5)
    {
      unint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v14 = 138412546;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2112;
      id v17 = v4;
      id v9 = v15;
      LODWORD(v11) = 22;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__ISProtocolDataProvider__selectFooterSection___block_invoke;
        block[3] = &unk_264260B08;
        id v13 = v4;
        dispatch_async(MEMORY[0x263EF83A0], block);

        goto LABEL_14;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v14, v11);
      free(v10);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __47__ISProtocolDataProvider__selectFooterSection___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", *(void *)(a1 + 32), @"ISProtocolKeySection", 0);
  [v3 postNotificationName:@"ISProtocolNotificationSelectFooterSection" object:0 userInfo:v2];
}

- (BOOL)_shouldAttemptPasswordPaymentSheetForError:(id)a3
{
  id v3 = a3;
  id v4 = ISWeakLinkedStringConstantForString("MobileActivationErrorDomain", (const void *)0x25);
  unint64_t v5 = [v3 domain];
  char v6 = [v5 isEqualToString:v4];

  int v7 = [v3 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F7B758]])
  {
    uint64_t v8 = [v3 code];

    if (v8 == 147) {
      char v6 = 1;
    }
  }
  else
  {
  }
  return v6;
}

- (BOOL)_shouldFailWithTokenErrorForDialog:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [(ISDataProvider *)self contentType];
  uint64_t v9 = [v8 rangeOfString:@"json" options:1];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  int v10 = [v7 objectForKey:@"errorNumber"];
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v10 integerValue] != 2055)
  {

LABEL_8:
    BOOL v12 = 0;
    id v11 = 0;
    goto LABEL_9;
  }
  SSError();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    id v11 = v11;
    *a5 = v11;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (id)_touchIDDialogForResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 actionsWithActionType:*MEMORY[0x263F7BC50]];
  if ([v4 count])
  {
    unint64_t v5 = [v4 objectAtIndex:0];
    char v6 = [v5 dialog];

    id v7 = [ISTouchIDDialog alloc];
    uint64_t v8 = [v6 dialogDictionary];
    uint64_t v9 = [(ISTouchIDDialog *)v7 initWithDialogDictionary:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = [v3 actionsWithActionType:*MEMORY[0x263F7BC48]];
  if ([v10 count])
  {
    id v11 = [v10 objectAtIndex:0];
    BOOL v12 = [v11 dialog];

    if (v9)
    {
      id v13 = [v12 message];
      if (v13) {
        [(ISTouchIDDialog *)v9 setFallbackExplanation:v13];
      }
      int v14 = [v12 title];
      if (v14) {
        [(ISTouchIDDialog *)v9 setFallbackMessage:v14];
      }
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ISProtocolDataProvider;
  unint64_t v5 = -[ISDataProvider copyWithZone:](&v11, sel_copyWithZone_);
  v5[112] = [(ISProtocolDataProvider *)self shouldPostFooterSectionChanged];
  v5[113] = [(ISProtocolDataProvider *)self shouldProcessAccount];
  v5[114] = [(ISProtocolDataProvider *)self shouldProcessAuthenticationDialogs];
  v5[115] = [(ISProtocolDataProvider *)self shouldProcessDialogs];
  v5[117] = [(ISProtocolDataProvider *)self shouldProcessProtocol];
  v5[118] = [(ISProtocolDataProvider *)self shouldProcessTouchIDDialogs];
  v5[119] = [(ISProtocolDataProvider *)self shouldTriggerDownloads];
  uint64_t v6 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext copyWithZone:a3];
  id v7 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v6;

  uint64_t v8 = [(NSString *)self->_presentingSceneIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v8;

  return v5;
}

- (BOOL)shouldPostFooterSectionChanged
{
  return self->_shouldPostFooterSectionChanged;
}

- (void)setShouldPostFooterSectionChanged:(BOOL)a3
{
  self->_shouldPostFooterSectionChanged = a3;
}

- (BOOL)shouldProcessAccount
{
  return self->_shouldProcessAccount;
}

- (void)setShouldProcessAccount:(BOOL)a3
{
  self->_shouldProcessAccount = a3;
}

- (BOOL)shouldProcessAuthenticationDialogs
{
  return self->_shouldProcessAuthenticationDialogs;
}

- (void)setShouldProcessAuthenticationDialogs:(BOOL)a3
{
  self->_shouldProcessAuthenticationDialogs = a3;
}

- (BOOL)shouldProcessDialogs
{
  return self->_shouldProcessDialogs;
}

- (void)setShouldProcessDialogs:(BOOL)a3
{
  self->_shouldProcessDialogs = a3;
}

- (BOOL)shouldProcessProtocol
{
  return self->_shouldProcessProtocol;
}

- (void)setShouldProcessProtocol:(BOOL)a3
{
  self->_shouldProcessProtocol = a3;
}

- (BOOL)shouldTriggerDownloads
{
  return self->_shouldTriggerDownloads;
}

- (void)setShouldTriggerDownloads:(BOOL)a3
{
  self->_shouldTriggerDownloads = a3;
}

- (NSString)presentingSceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (BOOL)shouldProcessDialogsOutsideDaemon
{
  return self->_shouldProcessDialogsOutsideDaemon;
}

- (void)setShouldProcessDialogsOutsideDaemon:(BOOL)a3
{
  self->_shouldProcessDialogsOutsideDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);

  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
}

@end