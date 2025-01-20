@interface RedeemCodesOperation
- (BOOL)_canPerformExtendedBiometricActions;
- (BOOL)_didUserCancelWithError:(id)a3;
- (BOOL)_fetchRedeemCodeMetadataWithError:(id *)a3;
- (BOOL)_processDictionary:(id)a3 dialog:(id *)a4 error:(id *)a5;
- (BOOL)_useLegacyRedeem;
- (BOOL)cameraRecognized;
- (BOOL)headless;
- (NSArray)redeemCodes;
- (NSDictionary)params;
- (NSString)logCorrelationKey;
- (NSString)userAgent;
- (RedeemCodesOperation)initWithRedeemCodes:(id)a3;
- (SSAuthenticationContext)authenticationContext;
- (SSRedeemCodesResponse)redeemResponse;
- (id)_authenticateAppleAccount:(id)a3 withTitle:(id)a4 error:(id *)a5;
- (id)_installedExternalVersionForRedeemCodeMetadata:(id)a3;
- (id)_newURLRequestPropertiesForCode:(id)a3;
- (id)_newURLRequestPropertiesForServiceActionButton:(id)a3;
- (void)_postNotificationWithResponse:(id)a3;
- (void)_runHeadless;
- (void)_runNonHeadless;
- (void)operation:(id)a3 selectedButton:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setCameraRecognized:(BOOL)a3;
- (void)setHeadless:(BOOL)a3;
- (void)setLogCorrelationKey:(id)a3;
- (void)setParams:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation RedeemCodesOperation

- (RedeemCodesOperation)initWithRedeemCodes:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RedeemCodesOperation;
  v5 = [(RedeemCodesOperation *)&v13 init];
  if (v5)
  {
    v6 = (ISBiometricStore *)objc_alloc_init((Class)ISBiometricStore);
    biometricStore = v5->_biometricStore;
    v5->_biometricStore = v6;

    v8 = (NSArray *)[v4 copy];
    redeemCodes = v5->_redeemCodes;
    v5->_redeemCodes = v8;

    v5->_headless = 1;
    uint64_t v10 = AMSGenerateLogCorrelationKey();
    logCorrelationKey = v5->_logCorrelationKey;
    v5->_logCorrelationKey = (NSString *)v10;
  }
  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  [(RedeemCodesOperation *)self lock];
  v3 = self->_authenticationContext;
  [(RedeemCodesOperation *)self unlock];

  return v3;
}

- (NSArray)redeemCodes
{
  return self->_redeemCodes;
}

- (SSRedeemCodesResponse)redeemResponse
{
  [(RedeemCodesOperation *)self lock];
  v3 = self->_redeemResponse;
  [(RedeemCodesOperation *)self unlock];

  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  [(RedeemCodesOperation *)self lock];
  if (self->_authenticationContext != v6)
  {
    id v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(RedeemCodesOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  v6 = (NSString *)a3;
  [(RedeemCodesOperation *)self lock];
  if (self->_userAgent != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }
  [(RedeemCodesOperation *)self unlock];
}

- (NSString)userAgent
{
  [(RedeemCodesOperation *)self lock];
  v3 = self->_userAgent;
  [(RedeemCodesOperation *)self unlock];

  return v3;
}

- (void)run
{
  if (self->_headless) {
    [(RedeemCodesOperation *)self _runHeadless];
  }
  else {
    [(RedeemCodesOperation *)self _runNonHeadless];
  }
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
}

- (id)_authenticateAppleAccount:(id)a3 withTitle:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v8, "aa_altDSID");
  uint64_t v10 = objc_msgSend(v8, "aa_personID");
  uint64_t v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 longLongValue]);

  uint64_t v12 = [v8 username];

  objc_super v13 = +[SSAccountStore defaultStore];
  id v14 = [v13 accountWithAltDSID:v9 uniqueIdentifier:v11 accountName:v12];

  if (!v14)
  {
    id v14 = objc_alloc_init((Class)SSAccount);
    [v14 setAccountName:v12];
    [v14 setAltDSID:v9];
    [v14 setUniqueIdentifier:v11];
  }
  v64 = (void *)v12;
  v65 = (void *)v11;
  v67 = v9;
  id v15 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v14];
  [v15 setCanSetActiveAccount:0];
  [v15 setPromptStyle:1];
  [v15 setPromptTitle:v7];

  [v15 setValue:@"1" forHTTPHeaderField:SSHTTPHeaderXAppleAllowLiteAccountConversion];
  v16 = +[SSLogConfig sharedDaemonConfig];
  if (!v16)
  {
    v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  v62 = self;
  v63 = v14;
  if (!v20) {
    goto LABEL_14;
  }
  v21 = objc_opt_class();
  id v22 = v21;
  v23 = [(RedeemCodesOperation *)self logCorrelationKey];
  v24 = [v14 hashedDescription];
  int v68 = 138543874;
  v69 = v21;
  __int16 v70 = 2114;
  v71 = v23;
  __int16 v72 = 2114;
  v73 = v24;
  LODWORD(v59) = 32;
  v58 = &v68;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v68, v59);
    free(v25);
    v58 = (int *)v19;
    SSFileLog();
LABEL_14:
  }
  id v26 = objc_alloc_init((Class)SSPromise);
  id v27 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v15];
  v28 = [v26 completionHandlerAdapter];
  [v27 startWithAuthenticateResponseBlock:v28];

  v29 = [v26 resultWithError:0];
  v30 = [v29 error];
  v31 = [v30 domain];
  if ([v31 isEqualToString:SSErrorDomain] && objc_msgSend(v30, "code") == (id)140)
  {

    goto LABEL_20;
  }
  v32 = objc_msgSend(v30, "domain", v58);
  if ([v32 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {
    id v33 = [v30 code];

    if (v33 == (id)-7003)
    {
LABEL_20:
      v34 = +[SSLogConfig sharedDaemonConfig];
      if (!v34)
      {
        v34 = +[SSLogConfig sharedConfig];
      }
      unsigned int v35 = [v34 shouldLog];
      if ([v34 shouldLogToDisk]) {
        int v36 = v35 | 2;
      }
      else {
        int v36 = v35;
      }
      v37 = [v34 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        int v38 = v36;
      }
      else {
        int v38 = v36 & 2;
      }
      if (v38)
      {
        id v39 = v15;
        v40 = v29;
        id v41 = v27;
        id v42 = v26;
        v43 = objc_opt_class();
        id v60 = v43;
        v44 = [(RedeemCodesOperation *)v62 logCorrelationKey];
        int v68 = 138543874;
        v69 = v43;
        id v26 = v42;
        id v27 = v41;
        v29 = v40;
        id v15 = v39;
        __int16 v70 = 2114;
        v71 = v44;
        __int16 v72 = 2114;
        v73 = v30;
        LODWORD(v59) = 32;
        v58 = &v68;
        v45 = (void *)_os_log_send_and_compose_impl();

        v9 = v67;
        if (!v45)
        {
LABEL_46:

          SSError();
          v30 = v46 = v30;
          v54 = v64;
          goto LABEL_50;
        }
        v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v68, v59);
        free(v45);
        v58 = (int *)v37;
        SSFileLog();
      }
      else
      {
        v9 = v67;
      }

      goto LABEL_46;
    }
  }
  else
  {
  }
  if (!v30)
  {
    v54 = v64;
    v55 = v65;
    goto LABEL_51;
  }
  v46 = +[SSLogConfig sharedDaemonConfig];
  if (!v46)
  {
    v46 = +[SSLogConfig sharedConfig];
  }
  unsigned int v47 = [v46 shouldLog];
  if ([v46 shouldLogToDisk]) {
    int v48 = v47 | 2;
  }
  else {
    int v48 = v47;
  }
  v49 = [v46 OSLogObject];
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
    v48 &= 2u;
  }
  if (v48)
  {
    id v61 = v27;
    v50 = objc_opt_class();
    id v51 = v50;
    v52 = [(RedeemCodesOperation *)v62 logCorrelationKey];
    int v68 = 138543874;
    v69 = v50;
    __int16 v70 = 2114;
    v71 = v52;
    __int16 v72 = 2114;
    v73 = v30;
    LODWORD(v59) = 32;
    v58 = &v68;
    v53 = (void *)_os_log_send_and_compose_impl();

    if (!v53)
    {
      v9 = v67;
      v54 = v64;
      id v27 = v61;
      goto LABEL_50;
    }
    v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v68, v59);
    free(v53);
    v58 = (int *)v49;
    SSFileLog();
    v9 = v67;
    v54 = v64;
    id v27 = v61;
  }
  else
  {
    v54 = v64;
  }

LABEL_50:
  v55 = v65;
LABEL_51:
  if (a5) {
    *a5 = v30;
  }
  v56 = objc_msgSend(v29, "authenticatedAccount", v58);

  return v56;
}

- (void)_runHeadless
{
  id v68 = objc_alloc_init((Class)NSMutableDictionary);
  id v67 = objc_alloc_init((Class)NSMutableDictionary);
  id v78 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [(RedeemCodesOperation *)self userAgent];
  __int16 v72 = self;
  id v4 = [(RedeemCodesOperation *)self authenticationContext];
  id v5 = [v4 mutableCopy];

  v76 = v5;
  v77 = (void *)v3;
  uint64_t v75 = SSHTTPHeaderUserAgent;
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v3);
  v6 = &syslog_ptr;
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v12 = objc_opt_class();
  id v13 = v12;
  id v14 = [(RedeemCodesOperation *)v72 logCorrelationKey];
  NSUInteger v15 = [(NSArray *)v72->_redeemCodes count];
  int v85 = 138543874;
  v86 = v12;
  __int16 v87 = 2114;
  v88 = v14;
  __int16 v89 = 2048;
  NSUInteger v90 = v15;
  LODWORD(v63) = 32;
  v62 = &v85;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v85, v63);
    free(v16);
    v62 = (int *)v10;
    SSFileLog();
LABEL_12:
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  unsigned int v17 = (id *)v72;
  obj = v72->_redeemCodes;
  id v18 = v68;
  id v74 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (!v74) {
    goto LABEL_60;
  }
  uint64_t v66 = kISDialogKey;
  uint64_t v73 = *(void *)v82;
  do
  {
    v19 = 0;
    do
    {
      if (*(void *)v82 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v81 + 1) + 8 * (void)v19);
      id v21 = objc_alloc_init((Class)ISStoreURLOperation);
      [v21 setAuthenticationContext:v76];
      uint64_t v22 = +[DaemonProtocolDataProvider provider];
      [v21 setDataProvider:v22];

      objc_msgSend(v21, "setNeedsAuthentication:", objc_msgSend(v17, "_canPerformExtendedBiometricActions") ^ 1);
      id v23 = objc_alloc_init((Class)SSMutableURLRequestProperties);
      [v23 setValue:v20 forRequestParameter:@"certId"];
      [v23 setURLBagKey:@"p2-headless-redemption"];
      [v23 setValue:v77 forHTTPHeaderField:v75];
      [v21 setRequestProperties:v23];
      id v80 = 0;
      LOBYTE(v22) = [v17 runSubOperation:v21 returningError:&v80];
      id v24 = v80;
      if (v22)
      {
        v25 = [v21 dataProvider];
        id v26 = [v25 output];

        id v27 = v26;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v69 = v26;
          id v28 = v26;
          v29 = [v28 objectForKey:@"failureType"];
          BOOL v70 = v29 == 0;
          if (v29)
          {
            if (objc_opt_respondsToSelector()) {
              [v29 integerValue];
            }
            unsigned int v35 = objc_msgSend(v28, "objectForKey:", @"customerMessage", v62);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v36 = [v28 objectForKey:v66];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v65 = [objc_alloc((Class)ISDialog) initWithDialogDictionary:v36];
                uint64_t v64 = [v65 title];

                unsigned int v35 = (void *)v64;
              }
            }
            uint64_t v37 = SSError();

            id v24 = (id)v37;
          }
          int v38 = objc_msgSend(v28, "objectForKey:", @"cancel-purchase-batch", v62);
          if (objc_opt_respondsToSelector()) {
            unsigned int v30 = [v38 BOOLValue];
          }
          else {
            unsigned int v30 = 0;
          }

          id v18 = v68;
          id v27 = v69;
          int v34 = v70;
        }
        else
        {
          id v28 = 0;
          unsigned int v30 = 0;
          int v34 = 1;
        }

        [v78 setObject:v28 forKey:v20];
        v31 = v79;
        if (v34)
        {
          unsigned int v17 = (id *)v72;
          if (v28)
          {
            [(RedeemCodesOperation *)v72 _postNotificationWithResponse:v28];
            v32 = v67;
            id v33 = v28;
            goto LABEL_41;
          }
        }
        else
        {
          unsigned int v17 = (id *)v72;
        }
      }
      else
      {
        [v78 setObject:0 forKey:v20];
        unsigned int v30 = 0;
        id v28 = 0;
        v31 = v79;
      }
      if (v24)
      {
        v30 |= ISErrorIsEqual();
      }
      else
      {
        SSError();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v18;
      id v33 = v24;
LABEL_41:
      objc_msgSend(v32, "setObject:forKey:", v33, v20, v62);

      if (v30)
      {
        v6 = &syslog_ptr;
        v40 = +[SSLogConfig sharedDaemonConfig];
        if (!v40)
        {
          v40 = +[SSLogConfig sharedConfig];
        }
        unsigned int v41 = [v40 shouldLog];
        if ([v40 shouldLogToDisk]) {
          int v42 = v41 | 2;
        }
        else {
          int v42 = v41;
        }
        v43 = [v40 OSLogObject];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          int v44 = v42;
        }
        else {
          int v44 = v42 & 2;
        }
        if (v44)
        {
          v45 = objc_opt_class();
          id v46 = v45;
          unsigned int v47 = [v17 logCorrelationKey];
          int v85 = 138543618;
          v86 = v45;
          __int16 v87 = 2114;
          v88 = v47;
          LODWORD(v63) = 22;
          v62 = &v85;
          int v48 = (void *)_os_log_send_and_compose_impl();

          if (!v48)
          {
LABEL_59:

            goto LABEL_60;
          }
          v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v48, 4, &v85, v63);
          free(v48);
          v62 = (int *)v43;
          SSFileLog();
        }

        goto LABEL_59;
      }
      v19 = (char *)v19 + 1;
    }
    while (v74 != v19);
    id v39 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v93 count:16];
    v6 = &syslog_ptr;
    id v74 = v39;
  }
  while (v39);
LABEL_60:

  v49 = [v6[405] sharedDaemonConfig];
  if (!v49)
  {
    v49 = [v6[405] sharedConfig];
  }
  unsigned int v50 = objc_msgSend(v49, "shouldLog", v62);
  if ([v49 shouldLogToDisk]) {
    int v51 = v50 | 2;
  }
  else {
    int v51 = v50;
  }
  v52 = [v49 OSLogObject];
  if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
    v51 &= 2u;
  }
  if (v51)
  {
    v53 = objc_opt_class();
    id v54 = v53;
    v55 = [v17 logCorrelationKey];
    id v56 = [v67 count];
    v57 = v68;
    id v58 = [v68 count];
    int v85 = 138544130;
    v86 = v53;
    __int16 v87 = 2114;
    v88 = v55;
    __int16 v89 = 2048;
    NSUInteger v90 = (NSUInteger)v56;
    unsigned int v17 = (id *)v72;
    __int16 v91 = 2048;
    id v92 = v58;
    LODWORD(v63) = 42;
    uint64_t v59 = (void *)_os_log_send_and_compose_impl();

    if (v59)
    {
      v52 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v59, 4, &v85, v63);
      free(v59);
      SSFileLog();
      goto LABEL_71;
    }
  }
  else
  {
    v57 = v68;
LABEL_71:
  }
  [v17 lock];
  id v60 = objc_alloc_init((Class)SSRedeemCodesResponse);
  id v61 = v17[20];
  v17[20] = v60;

  [v17[20] setCodeResponses:v78];
  [v17[20] setFailedCodes:v57];
  [v17[20] setRedeemedCodes:v67];
  [v17 unlock];
  [v17 setSuccess:1];
}

- (void)_runNonHeadless
{
  id v99 = objc_alloc_init((Class)NSMutableDictionary);
  id v97 = objc_alloc_init((Class)NSMutableDictionary);
  id v101 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [(RedeemCodesOperation *)self userAgent];
  id v4 = [(RedeemCodesOperation *)self authenticationContext];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)SSMutableAuthenticationContext);
  }
  v108 = v5;
  [v5 setValue:v3 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  v107 = self;
  v95 = (void *)v3;
  if (![(RedeemCodesOperation *)self _useLegacyRedeem])
  {
    id v96 = 0;
LABEL_27:
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21)
    {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    id v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      v25 = objc_opt_class();
      id v26 = v25;
      id v27 = [(RedeemCodesOperation *)v107 logCorrelationKey];
      NSUInteger v28 = [(NSArray *)v107->_redeemCodes count];
      int v127 = 138543874;
      v128 = v25;
      __int16 v129 = 2114;
      v130 = v27;
      __int16 v131 = 2048;
      NSUInteger v132 = v28;
      LODWORD(v94) = 32;
      v93 = &v127;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_38:

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        unsigned int v30 = (id *)v107;
        obj = v107->_redeemCodes;
        id v102 = [(NSArray *)obj countByEnumeratingWithState:&v118 objects:v135 count:16];
        if (!v102) {
          goto LABEL_92;
        }
        uint64_t v100 = *(void *)v119;
        while (1)
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v119 != v100) {
              objc_enumerationMutation(obj);
            }
            uint64_t v104 = v31;
            v106 = *(void **)(*((void *)&v118 + 1) + 8 * v31);
            id v32 = 0;
            id v33 = 0;
            id v34 = 0;
            while (1)
            {

              id v35 = objc_alloc_init((Class)ISStoreURLOperation);
              [v35 setAuthenticationContext:v108];
              int v36 = +[RedeemCodesProtocolDataProvider provider];
              [v36 setShouldProcessDialogs:0];
              [v35 setDataProvider:v36];
              id v110 = [v30 _newURLRequestPropertiesForCode:v106];
              objc_msgSend(v35, "setRequestProperties:");
              id v117 = 0;
              unsigned int v37 = [v30 runSubOperation:v35 returningError:&v117];
              id v32 = v117;
              if (v37)
              {
                int v38 = [v35 dataProvider];
                id v39 = [v38 output];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v33 = v39;
                  id v115 = v32;
                  id v116 = 0;
                  unsigned int v40 = [(RedeemCodesOperation *)v107 _processDictionary:v33 dialog:&v116 error:&v115];
                  id v34 = v116;
                  id v41 = v115;

                  unsigned int v42 = v40;
                  id v43 = v41;
                  unsigned int v30 = (id *)v107;
                  id v32 = v43;
                }
                else
                {
                  unsigned int v42 = 0;
                  id v34 = 0;
                  id v33 = 0;
                  unsigned int v30 = (id *)v107;
                }
              }
              else
              {
                unsigned int v42 = 0;
                id v34 = 0;
                id v33 = 0;
              }
              int v44 = v36;
              uint64_t v45 = objc_msgSend(v36, "dialogButton", v93, v94);
              id v46 = v30[15];
              v30[15] = (id)v45;

              unsigned int v105 = v42;
              if (v42 || [v32 code] != (id)3580) {
                break;
              }
              unsigned int v47 = v34;
              id v109 = v33;
              int v48 = +[SSVAppleAccountStore sharedAccountStore];
              v49 = [v48 primaryAppleAccount];

              [v32 userInfo];
              int v51 = v50 = v32;
              v52 = [v51 objectForKeyedSubscript:NSLocalizedDescriptionKey];
              id v114 = 0;
              v53 = [v30 _authenticateAppleAccount:v49 withTitle:v52 error:&v114];
              id v54 = v114;

              if (v53)
              {
                id v55 = v50;
                unsigned int v50 = [v53 uniqueIdentifier];
                [v108 setRequiredUniqueIdentifier:v50];
              }
              else
              {

                unsigned int v47 = 0;
                id v55 = v54;
              }

              unsigned int v30 = (id *)v107;
              id v33 = v109;
              id v34 = v47;
              id v32 = v55;
              if (!v53) {
                goto LABEL_58;
              }
            }

LABEL_58:
            unsigned int v56 = v105 != 0;
            if (v34 && [v34 kind] != (id)1)
            {
              v57 = +[ISDialogOperation operationWithDialog:v34];
              [v57 setDelegate:v30];
              id v113 = v32;
              [v30 runSubOperation:v57 returningError:&v113];
              id v58 = v113;

              id v32 = v58;
              unsigned int v30 = (id *)v107;
            }
            id v59 = v30[15];
            if (v59)
            {
              if ([v59 actionType] == 10)
              {
                id v60 = [v30 _newURLRequestPropertiesForServiceActionButton:v30[15]];
                id v61 = objc_alloc_init((Class)ISStoreURLOperation);
                [v61 setAuthenticationContext:v108];
                v62 = +[DaemonProtocolDataProvider provider];
                [v61 setDataProvider:v62];

                [v61 setRequestProperties:v60];
                id v112 = v32;
                LODWORD(v62) = [v30 runSubOperation:v61 returningError:&v112];
                id v63 = v112;

                if (v62)
                {
                  uint64_t v64 = [v61 dataProvider];
                  id v65 = [v64 output];

                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v66 = v65;

                    id v111 = v63;
                    unsigned int v56 = [v30 _processDictionary:v66 dialog:0 error:&v111];
                    id v67 = v111;

                    id v33 = v66;
                    id v63 = v67;
                    unsigned int v30 = (id *)v107;
                  }
                }
                char v68 = 0;
                id v32 = v63;
              }
              else
              {
                [v30[15] performDefaultActionForDialog:v34];
                char v68 = 1;
              }
            }
            else
            {
              char v68 = 0;
            }
            [v101 setObject:v33 forKey:v106];
            if (v56 && v33)
            {
              [v30 _postNotificationWithResponse:v33];
              [v97 setObject:v33 forKey:v106];
              goto LABEL_90;
            }
            if (v32)
            {
              if ((v68 & 1) == 0) {
                goto LABEL_77;
              }
            }
            else
            {
              SSError();
              id v32 = (id)objc_claimAutoreleasedReturnValue();
              if ((v68 & 1) == 0)
              {
LABEL_77:
                if (!ISErrorIsEqual()) {
                  goto LABEL_79;
                }
              }
            }
            uint64_t v69 = SSErrorBySettingUserInfoValue();

            id v32 = (id)v69;
LABEL_79:
            [v99 setObject:v32 forKey:v106];
            BOOL v70 = +[SSLogConfig sharedDaemonConfig];
            if (!v70)
            {
              BOOL v70 = +[SSLogConfig sharedConfig];
            }
            unsigned int v71 = [v70 shouldLog];
            if ([v70 shouldLogToDisk]) {
              v71 |= 2u;
            }
            __int16 v72 = [v70 OSLogObject];
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
              v71 &= 2u;
            }
            if (!v71) {
              goto LABEL_88;
            }
            uint64_t v73 = objc_opt_class();
            id v74 = v32;
            id v75 = v73;
            v76 = [(RedeemCodesOperation *)v107 logCorrelationKey];
            v77 = AMSLogableError();
            int v127 = 138544130;
            v128 = v73;
            __int16 v129 = 2114;
            v130 = v76;
            __int16 v131 = 2112;
            unsigned int v30 = (id *)v107;
            NSUInteger v132 = (NSUInteger)v106;
            __int16 v133 = 2114;
            id v134 = v77;
            LODWORD(v94) = 42;
            v93 = &v127;
            id v78 = (void *)_os_log_send_and_compose_impl();

            id v32 = v74;
            if (v78)
            {
              __int16 v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v78, 4, &v127, v94);
              free(v78);
              v93 = (int *)v72;
              SSFileLog();
LABEL_88:
            }
LABEL_90:

            uint64_t v31 = v104 + 1;
          }
          while ((id)(v104 + 1) != v102);
          id v102 = [(NSArray *)obj countByEnumeratingWithState:&v118 objects:v135 count:16];
          if (!v102) {
            goto LABEL_92;
          }
        }
      }
      id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v127, v94, v95);
      free(v29);
      v93 = (int *)v24;
      SSFileLog();
    }

    goto LABEL_38;
  }
  id v126 = 0;
  unsigned __int8 v6 = [(RedeemCodesOperation *)self _fetchRedeemCodeMetadataWithError:&v126];
  id v96 = v126;
  if (v6) {
    goto LABEL_27;
  }
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v12;
    id v14 = [(RedeemCodesOperation *)v107 logCorrelationKey];
    NSUInteger v15 = AMSLogableError();
    int v127 = 138543874;
    v128 = v12;
    __int16 v129 = 2114;
    v130 = v14;
    __int16 v131 = 2114;
    NSUInteger v132 = (NSUInteger)v15;
    LODWORD(v94) = 32;
    v93 = &v127;
    v16 = (void *)_os_log_send_and_compose_impl();

    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v127, v94, v95);
    free(v16);
    v93 = (int *)v10;
    SSFileLog();
  }

LABEL_17:
  if (v96)
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v123 = 0u;
    long long v122 = 0u;
    obj = v107->_redeemCodes;
    id v17 = [(NSArray *)obj countByEnumeratingWithState:&v122 objects:v136 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v123;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v123 != v19) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(v99, "setObject:forKey:", v96, *(void *)(*((void *)&v122 + 1) + 8 * i), v93);
        }
        id v18 = [(NSArray *)obj countByEnumeratingWithState:&v122 objects:v136 count:16];
      }
      while (v18);
    }
LABEL_92:
  }
  else
  {
    id v96 = 0;
  }
  v79 = +[SSLogConfig sharedDaemonConfig];
  if (!v79)
  {
    v79 = +[SSLogConfig sharedConfig];
  }
  unsigned int v80 = [v79 shouldLog];
  if ([v79 shouldLogToDisk]) {
    int v81 = v80 | 2;
  }
  else {
    int v81 = v80;
  }
  long long v82 = [v79 OSLogObject];
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
    int v83 = v81;
  }
  else {
    int v83 = v81 & 2;
  }
  if (!v83)
  {
    long long v84 = (id *)v107;
    goto LABEL_105;
  }
  long long v84 = (id *)v107;
  int v85 = objc_opt_class();
  id v86 = v85;
  __int16 v87 = [(RedeemCodesOperation *)v107 logCorrelationKey];
  id v88 = [v97 count];
  id v89 = [v99 count];
  int v127 = 138544130;
  v128 = v85;
  __int16 v129 = 2114;
  v130 = v87;
  __int16 v131 = 2048;
  NSUInteger v132 = (NSUInteger)v88;
  __int16 v133 = 2048;
  id v134 = v89;
  LODWORD(v94) = 42;
  NSUInteger v90 = (void *)_os_log_send_and_compose_impl();

  if (v90)
  {
    long long v82 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v90, 4, &v127, v94);
    free(v90);
    SSFileLog();
LABEL_105:
  }
  [v84 lock];
  id v91 = objc_alloc_init((Class)SSRedeemCodesResponse);
  id v92 = v84[20];
  v84[20] = v91;

  [v84[20] setCodeResponses:v101];
  [v84[20] setFailedCodes:v99];
  [v84[20] setRedeemedCodes:v97];
  [v84 unlock];
  [v84 setSuccess:1];
}

- (BOOL)_processDictionary:(id)a3 dialog:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  unsigned int v8 = [v7 objectForKey:@"status"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v10 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = (uint64_t)[v8 integerValue];
  BOOL v10 = v9 >= 0;
  if (v9 < 0)
  {
    int v11 = [v7 objectForKey:@"userPresentableErrorMessage"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    unsigned int v8 = [v7 objectForKey:@"errorNumber"];

    if (objc_opt_respondsToSelector())
    {
      [v8 integerValue];
      if (!a5) {
        goto LABEL_12;
      }
    }
    else if (!a5)
    {
LABEL_12:

      goto LABEL_13;
    }
    SSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  id v13 = v8;
  unsigned int v8 = [v7 objectForKey:kISDialogKey];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0) {
    *a4 = [objc_alloc((Class)ISDialog) initWithDialogDictionary:v8];
  }
LABEL_16:

  return v10;
}

- (id)_newURLRequestPropertiesForCode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned __int8 v6 = +[ISDevice sharedInstance];
  id v7 = [v6 guid];
  [v5 setObject:v7 forKeyedSubscript:@"guid"];

  [v5 setObject:v4 forKeyedSubscript:@"code"];
  [v5 setObject:@"application/json" forKeyedSubscript:@"response-content-type"];
  unsigned int v8 = +[NSNumber numberWithBool:self->_cameraRecognized];
  [v5 setObject:v8 forKeyedSubscript:@"cameraRecognizedCode"];

  if ([(RedeemCodesOperation *)self _useLegacyRedeem])
  {
    uint64_t v9 = [(NSDictionary *)self->_redeemMetadataByCode valueForKey:v4];
    BOOL v10 = [(RedeemCodesOperation *)self _installedExternalVersionForRedeemCodeMetadata:v9];
    if (v10) {
      [v5 setObject:v10 forKeyedSubscript:@"installed-version"];
    }
  }
  if (self->_params) {
    objc_msgSend(v5, "addEntriesFromDictionary:");
  }
  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  id v12 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:0];
  [v11 setHTTPBody:v12];

  [v11 setHTTPMethod:@"POST"];
  [v11 setURLBagKey:@"redeemCodeSrv"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v13 = [(RedeemCodesOperation *)self userAgent];
  [v11 setValue:v13 forHTTPHeaderField:SSHTTPHeaderUserAgent];

  return v11;
}

- (id)_newURLRequestPropertiesForServiceActionButton:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dictionary];
  unsigned __int8 v6 = [v5 objectForKey:@"url"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
  if (!v7)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_6;
  }
  unsigned int v8 = [v4 dictionary];
  uint64_t v9 = [v8 objectForKey:@"dialogData"];

  id v10 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v7];
  id v11 = +[NSJSONSerialization dataWithJSONObject:v9 options:0 error:0];
  [v10 setHTTPBody:v11];

  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v12 = [(RedeemCodesOperation *)self userAgent];
  [v10 setValue:v12 forHTTPHeaderField:SSHTTPHeaderUserAgent];

LABEL_6:
  return v10;
}

- (BOOL)_canPerformExtendedBiometricActions
{
  [(RedeemCodesOperation *)self lock];
  uint64_t v3 = [(SSAuthenticationContext *)self->_authenticationContext requiredUniqueIdentifier];
  unsigned __int8 v4 = [(ISBiometricStore *)self->_biometricStore canPerformExtendedBiometricActionsForAccountIdentifier:v3];
  [(RedeemCodesOperation *)self unlock];

  return v4;
}

- (BOOL)_didUserCancelWithError:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = ISWeakLinkedStringConstantForString();
  if (ISErrorIsEqual()) {
    char IsEqual = 1;
  }
  else {
    char IsEqual = ISErrorIsEqual();
  }

  return IsEqual;
}

- (BOOL)_fetchRedeemCodeMetadataWithError:(id *)a3
{
  id v101 = objc_alloc_init((Class)NSMutableDictionary);
  id v119 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [(RedeemCodesOperation *)self userAgent];
  id v5 = [(RedeemCodesOperation *)self authenticationContext];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = SSHTTPHeaderUserAgent;
  id v114 = (void *)v4;
  [v6 setValue:v4 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  id v122 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    unsigned int v8 = +[SSLogConfig sharedConfig];
  }
  uint64_t v104 = v7;
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    v9 |= 2u;
  }
  id v10 = [v8 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  id v116 = self;
  if (!v9) {
    goto LABEL_10;
  }
  id v11 = objc_opt_class();
  redeemCodes = v116->_redeemCodes;
  id v13 = v11;
  int v138 = 138543618;
  v139 = v11;
  self = v116;
  __int16 v140 = 2050;
  NSUInteger v141 = [(NSArray *)redeemCodes count];
  LODWORD(v99) = 22;
  id v97 = &v138;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v138, v99);
    free(v14);
    id v97 = (int *)v10;
    SSFileLog();
LABEL_10:
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  obj = self->_redeemCodes;
  id v103 = v6;
  NSUInteger v15 = &syslog_ptr;
  id v112 = [(NSArray *)obj countByEnumeratingWithState:&v133 objects:v145 count:16];
  if (!v112)
  {
    id v105 = 0;
    char v102 = 1;
    goto LABEL_62;
  }
  id v105 = 0;
  char v102 = 1;
  uint64_t v109 = SSVRedeemCodeMetadataQueryParameterRedeemCode;
  uint64_t v110 = *(void *)v134;
  uint64_t v108 = SSVRedeemCodeMetadataURLBagKey;
  uint64_t v16 = v104;
  while (2)
  {
    for (i = 0; i != v112; i = (char *)i + 1)
    {
      if (*(void *)v134 != v110) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v133 + 1) + 8 * i);
      id v20 = objc_alloc_init((Class)ISStoreURLOperation);
      [v20 setAuthenticationContext:v6];
      id v21 = +[DaemonProtocolDataProvider provider];
      [v20 setDataProvider:v21];

      objc_msgSend(v20, "setNeedsAuthentication:", -[RedeemCodesOperation _canPerformExtendedBiometricActions](self, "_canPerformExtendedBiometricActions") ^ 1);
      id v22 = objc_alloc_init((Class)SSMutableURLRequestProperties);
      [v22 setValue:v18 forRequestParameter:v109];
      [v22 setURLBagKey:v108];
      [v22 setValue:v114 forHTTPHeaderField:v16];
      id v117 = v22;
      [v20 setRequestProperties:v22];
      id v132 = 0;
      LODWORD(v22) = [(RedeemCodesOperation *)self runSubOperation:v20 returningError:&v132];
      id v23 = v132;
      id v120 = v23;
      if (v22)
      {
        id v24 = [v20 dataProvider];
        v25 = [v24 output];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unsigned int v28 = 0;
          goto LABEL_46;
        }
        id v115 = v19;
        id v26 = v25;
        id v27 = [v26 objectForKey:@"failureType"];
        if (v27)
        {
        }
        else
        {
          id v34 = [objc_alloc((Class)SSVRedeemCodeMetadata) initWithRedeemCodeDictionary:v26];
          if (v34)
          {
            id v35 = v34;
            [v101 setObject:v34 forKey:v18];
            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            int v36 = [v35 items];
            id v37 = [v36 countByEnumeratingWithState:&v128 objects:v144 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v129;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(void *)v129 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  id v41 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * (void)j), "itemIdentifier", v97));
                  [v122 addObject:v41];
                }
                id v38 = [v36 countByEnumeratingWithState:&v128 objects:v144 count:16];
              }
              while (v38);
            }

            unsigned int v28 = 0;
            v25 = v26;
LABEL_43:
            id v6 = v103;
            uint64_t v16 = v104;
LABEL_44:

            goto LABEL_45;
          }
        }
        unsigned int v28 = 0;
        v25 = v26;
        goto LABEL_44;
      }
      unsigned int v28 = [(RedeemCodesOperation *)self _didUserCancelWithError:v23];
      if (v28)
      {
        v29 = SSError();

        SSErrorBySettingUserInfoValue();
        id v105 = (id)objc_claimAutoreleasedReturnValue();

        char v102 = 0;
      }
      id v115 = v19;
      v25 = +[SSLogConfig sharedDaemonConfig];
      if (!v25)
      {
        v25 = +[SSLogConfig sharedConfig];
      }
      unsigned int v30 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        v30 |= 2u;
      }
      id v26 = [v25 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        v30 &= 2u;
      }
      if (!v30) {
        goto LABEL_44;
      }
      uint64_t v31 = objc_opt_class();
      id v106 = v31;
      id v32 = AMSLogableError();
      int v138 = 138543874;
      v139 = v31;
      __int16 v140 = 2112;
      NSUInteger v141 = (NSUInteger)v18;
      __int16 v142 = 2114;
      v143 = v32;
      LODWORD(v99) = 32;
      id v97 = &v138;
      id v33 = (void *)_os_log_send_and_compose_impl();

      if (v33)
      {
        id v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v138, v99);
        free(v33);
        id v97 = (int *)v26;
        SSFileLog();
        goto LABEL_43;
      }
      id v6 = v103;
      uint64_t v16 = v104;
LABEL_45:
      uint64_t v19 = v115;
LABEL_46:

      if (v28)
      {
        NSUInteger v15 = &syslog_ptr;
        unsigned int v42 = +[SSLogConfig sharedDaemonConfig];
        if (!v42)
        {
          unsigned int v42 = +[SSLogConfig sharedConfig];
        }
        unsigned int v43 = objc_msgSend(v42, "shouldLog", v97);
        if ([v42 shouldLogToDisk]) {
          v43 |= 2u;
        }
        int v44 = [v42 OSLogObject];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
          v43 &= 2u;
        }
        if (v43)
        {
          uint64_t v45 = objc_opt_class();
          int v138 = 138543362;
          v139 = v45;
          id v46 = v45;
          LODWORD(v99) = 12;
          id v97 = &v138;
          unsigned int v47 = (void *)_os_log_send_and_compose_impl();

          if (!v47)
          {
LABEL_60:

            self = v116;
            goto LABEL_62;
          }
          int v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v138, v99);
          free(v47);
          id v97 = (int *)v44;
          SSFileLog();
        }

        goto LABEL_60;
      }
      self = v116;
    }
    NSUInteger v15 = &syslog_ptr;
    id v112 = [(NSArray *)obj countByEnumeratingWithState:&v133 objects:v145 count:16];
    if (v112) {
      continue;
    }
    break;
  }
LABEL_62:

  int v48 = [v15[405] sharedDaemonConfig];
  if (!v48)
  {
    int v48 = [v15[405] sharedConfig];
  }
  unsigned int v49 = objc_msgSend(v48, "shouldLog", v97);
  if ([v48 shouldLogToDisk]) {
    v49 |= 2u;
  }
  unsigned int v50 = [v48 OSLogObject];
  if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
    v49 &= 2u;
  }
  int v51 = &off_10031F000;
  if (v49)
  {
    v52 = objc_opt_class();
    int v138 = 138543362;
    v139 = v52;
    id v53 = v52;
    LODWORD(v99) = 12;
    v98 = &v138;
    id v54 = (void *)_os_log_send_and_compose_impl();

    self = v116;
    if (v54)
    {
      unsigned int v50 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v54, 4, &v138, v99);
      free(v54);
      v98 = (int *)v50;
      SSFileLog();
      goto LABEL_71;
    }
  }
  else
  {
LABEL_71:
  }
  id v55 = [[SoftwareLibraryLookupOperation alloc] initWithItemIdentifiers:v122];
  id v127 = 0;
  unsigned int v56 = [(RedeemCodesOperation *)self runSubOperation:v55 returningError:&v127];
  id v113 = v127;
  if (!v56) {
    goto LABEL_117;
  }
  id v111 = v55;
  [(SoftwareLibraryLookupOperation *)v55 softwareLibraryItems];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v121 = (id)objc_claimAutoreleasedReturnValue();
  id v57 = [v121 countByEnumeratingWithState:&v123 objects:v137 count:16];
  if (!v57) {
    goto LABEL_116;
  }
  id v58 = v57;
  uint64_t v59 = *(void *)v124;
  uint64_t v60 = SSSoftwareLibraryItemPropertyITunesItemIdentifier;
  uint64_t v61 = SSSoftwareLibraryItemPropertyITunesVersionIdentifier;
  uint64_t v118 = *(void *)v124;
  while (2)
  {
    uint64_t v62 = 0;
    while (2)
    {
      if (*(void *)v124 != v59) {
        objc_enumerationMutation(v121);
      }
      id v63 = *(void **)(*((void *)&v123 + 1) + 8 * v62);
      uint64_t v64 = objc_msgSend(v63, "valueForProperty:", v60, v98, v99);
      uint64_t v65 = [v63 valueForProperty:v61];
      id v66 = (void *)v65;
      if (v64) {
        BOOL v67 = v65 == 0;
      }
      else {
        BOOL v67 = 1;
      }
      if (!v67)
      {
        [v119 setObject:v65 forKey:v64];
        goto LABEL_114;
      }
      if (!v64)
      {
        char v68 = [v15[405] sharedDaemonConfig];
        if (!v68)
        {
          char v68 = [v15[405] sharedConfig];
        }
        unsigned int v69 = [v68 shouldLog];
        if ([v68 shouldLogToDisk]) {
          int v70 = v69 | 2;
        }
        else {
          int v70 = v69;
        }
        unsigned int v71 = [v68 OSLogObject];
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
          int v72 = v70;
        }
        else {
          int v72 = v70 & 2;
        }
        if (v72)
        {
          uint64_t v73 = objc_opt_class();
          int v138 = 138543362;
          v139 = v73;
          id v74 = v73;
          LODWORD(v99) = 12;
          v98 = &v138;
          id v75 = (void *)_os_log_send_and_compose_impl();

          uint64_t v59 = v118;
          if (!v75) {
            goto LABEL_99;
          }
          unsigned int v71 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v75, 4, &v138, v99);
          free(v75);
          v98 = (int *)v71;
          SSFileLog();
        }
        else
        {
          uint64_t v59 = v118;
        }

LABEL_99:
        NSUInteger v15 = &syslog_ptr;
        if (!v66) {
          goto LABEL_100;
        }
        goto LABEL_114;
      }
      if (!v65)
      {
LABEL_100:
        v76 = objc_msgSend(v15[405], "sharedDaemonConfig", v98);
        if (!v76)
        {
          v76 = [v15[405] sharedConfig];
        }
        unsigned int v77 = [v76 shouldLog];
        if ([v76 shouldLogToDisk]) {
          int v78 = v77 | 2;
        }
        else {
          int v78 = v77;
        }
        v79 = [v76 OSLogObject];
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
          int v80 = v78;
        }
        else {
          int v80 = v78 & 2;
        }
        if (v80)
        {
          int v81 = objc_opt_class();
          int v138 = 138543362;
          v139 = v81;
          id v82 = v81;
          LODWORD(v99) = 12;
          v98 = &v138;
          int v83 = (void *)_os_log_send_and_compose_impl();

          uint64_t v59 = v118;
          if (v83)
          {
            v79 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v83, 4, &v138, v99);
            free(v83);
            v98 = (int *)v79;
            SSFileLog();
            goto LABEL_112;
          }
        }
        else
        {
          uint64_t v59 = v118;
LABEL_112:
        }
        NSUInteger v15 = &syslog_ptr;
      }
LABEL_114:

      if (v58 != (id)++v62) {
        continue;
      }
      break;
    }
    id v58 = [v121 countByEnumeratingWithState:&v123 objects:v137 count:16];
    if (v58) {
      continue;
    }
    break;
  }
LABEL_116:

  id v6 = v103;
  self = v116;
  int v51 = &off_10031F000;
  id v55 = v111;
LABEL_117:
  long long v84 = objc_msgSend(v15[405], "sharedDaemonConfig", v98);
  if (!v84)
  {
    long long v84 = [v15[405] sharedConfig];
  }
  unsigned int v85 = [v84 shouldLog];
  if ([v84 shouldLogToDisk]) {
    v85 |= 2u;
  }
  id v86 = [v84 OSLogObject];
  if (!os_log_type_enabled(v86, OS_LOG_TYPE_INFO)) {
    v85 &= 2u;
  }
  if (v85)
  {
    __int16 v87 = objc_opt_class();
    id v88 = v55;
    id v89 = v87;
    id v90 = [v101 count];
    int v138 = *((void *)v51 + 235);
    v139 = v87;
    self = v116;
    __int16 v140 = 2050;
    NSUInteger v141 = (NSUInteger)v90;
    LODWORD(v99) = 22;
    id v91 = (void *)_os_log_send_and_compose_impl();

    id v55 = v88;
    if (v91)
    {
      id v86 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v91, 4, &v138, v99);
      free(v91);
      SSFileLog();
      goto LABEL_126;
    }
  }
  else
  {
LABEL_126:
  }
  [(RedeemCodesOperation *)self lock];
  id v92 = (NSDictionary *)[v101 copy];
  redeemMetadataByCode = self->_redeemMetadataByCode;
  self->_redeemMetadataByCode = v92;

  uint64_t v94 = (NSDictionary *)[v119 copy];
  installedExternalVersionByiTunesIdentifier = self->_installedExternalVersionByiTunesIdentifier;
  self->_installedExternalVersionByiTunesIdentifier = v94;

  [(RedeemCodesOperation *)self unlock];
  if (a3 && v105) {
    *a3 = v105;
  }

  return v102 & 1;
}

- (id)_installedExternalVersionForRedeemCodeMetadata:(id)a3
{
  uint64_t v4 = [a3 items];
  id v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 itemIdentifier]);
    uint64_t v7 = [(NSDictionary *)self->_installedExternalVersionByiTunesIdentifier objectForKey:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_useLegacyRedeem
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  id v3 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v2];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100181ADC;
  v20[3] = &unk_1003A3140;
  uint64_t v4 = dispatch_semaphore_create(0);
  id v21 = v4;
  [v3 setCompletionBlock:v20];
  id v5 = +[ISOperationQueue mainQueue];
  [v5 addOperation:v3];

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v4, v6))
  {
    uint64_t v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      int v22 = 138543362;
      id v23 = v11;
      id v12 = v11;
      LODWORD(v19) = 12;
      id v18 = &v22;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v22, v19);
      free(v13);
      id v18 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  id v14 = objc_msgSend(v3, "URLBag", v18);
  NSUInteger v15 = [v14 valueForKey:@"redeemCodeLanding"];
  BOOL v16 = v15 == 0;

  return v16;
}

- (void)_postNotificationWithResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v25 = 138543362;
    id v26 = (id)objc_opt_class();
    id v8 = v26;
    LODWORD(v21) = 12;
    id v20 = &v25;
    int v9 = (void *)_os_log_send_and_compose_impl();

    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v25, v21);
    free(v9);
    id v20 = (int *)v7;
    SSFileLog();
  }

LABEL_12:
  id v22 = 0;
  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v22];

  id v11 = v22;
  if (!v11)
  {
    CFStringRef v23 = @"response";
    id v24 = v10;
    CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, kSSPurchaseRequestSucceededNotification, 0, v12, 1u);
    NSUInteger v15 = +[EventDispatcher eventDispatcher];
    [v15 postEventWithName:SSEventNamePurchaseSucceeded userInfo:v12];
    goto LABEL_24;
  }
  CFDictionaryRef v12 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v12)
  {
    CFDictionaryRef v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [(__CFDictionary *)v12 shouldLog];
  if ([(__CFDictionary *)v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  NSUInteger v15 = [(__CFDictionary *)v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_24;
  }
  BOOL v16 = objc_opt_class();
  int v25 = 138543618;
  id v26 = v16;
  __int16 v27 = 2114;
  id v28 = v11;
  id v17 = v16;
  LODWORD(v21) = 22;
  id v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    NSUInteger v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v25, v21);
    free(v18);
    SSFileLog();
LABEL_24:
  }
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (NSString)logCorrelationKey
{
  return self->_logCorrelationKey;
}

- (void)setLogCorrelationKey:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_logCorrelationKey, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_redeemResponse, 0);
  objc_storeStrong((id *)&self->_redeemMetadataByCode, 0);
  objc_storeStrong((id *)&self->_redeemCodes, 0);
  objc_storeStrong((id *)&self->_installedExternalVersionByiTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogButton, 0);
  objc_storeStrong((id *)&self->_biometricStore, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end