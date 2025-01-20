@interface PurchaseProtocolDataProvider
- (BOOL)_processBuyFailuresFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (BOOL)processDictionary:(id)a3 error:(id *)a4;
- (NSString)redirectActionParameters;
- (void)_performActionsForButton:(id)a3 withDialog:(id)a4;
- (void)setRedirectActionParameters:(id)a3;
@end

@implementation PurchaseProtocolDataProvider

- (void)_performActionsForButton:(id)a3 withDialog:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int v7 = [v9 actionType];
  switch(v7)
  {
    case 1u:
      if ([v9 urlType] != (id)1) {
        break;
      }
      goto LABEL_6;
    case 4u:
LABEL_6:
      [v9 performDefaultActionForDialog:v6];
      break;
    case 3u:
      v8 = [v9 parameter];
      [(PurchaseProtocolDataProvider *)self setRedirectActionParameters:v8];

      break;
  }
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PurchaseProtocolDataProvider;
  id v15 = 0;
  unsigned int v7 = [(DaemonProtocolDataProvider *)&v14 processDictionary:v6 error:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v13 = v8;
    BOOL v10 = [(PurchaseProtocolDataProvider *)self _processBuyFailuresFromDictionary:v6 error:&v13];
    id v11 = v13;

    id v9 = v11;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v10) {
    *a4 = v9;
  }
LABEL_7:

  return v10;
}

- (BOOL)_processBuyFailuresFromDictionary:(id)a3 error:(id *)a4
{
  v5 = [a3 objectForKey:kISFailureTypeKey];
  if (objc_opt_respondsToSelector())
  {
    switch([v5 intValue])
    {
      case 0xF3Cu:
        id v6 = +[SSLogConfig sharedDaemonConfig];
        if (!v6)
        {
          id v6 = +[SSLogConfig sharedConfig];
        }
        unsigned int v7 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v8 = v7 | 2;
        }
        else {
          int v8 = v7;
        }
        id v9 = [v6 OSLogObject];
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          v8 &= 2u;
        }
        if (!v8) {
          goto LABEL_13;
        }
        BOOL v10 = objc_opt_class();
        id v11 = v10;
        int v36 = 138543618;
        v37 = v10;
        __int16 v38 = 1024;
        unsigned int v39 = [v5 intValue];
        LODWORD(v35) = 18;
        v12 = (void *)_os_log_send_and_compose_impl();

        if (v12)
        {
          id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v36, v35);
          free(v12);
          SSFileLog();
LABEL_13:
        }
        break;
      case 0xF3Du:
        id v6 = +[SSLogConfig sharedDaemonConfig];
        if (!v6)
        {
          id v6 = +[SSLogConfig sharedConfig];
        }
        unsigned int v15 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        v17 = [v6 OSLogObject];
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          v16 &= 2u;
        }
        if (!v16) {
          goto LABEL_26;
        }
        v18 = objc_opt_class();
        id v19 = v18;
        int v36 = 138543618;
        v37 = v18;
        __int16 v38 = 1024;
        unsigned int v39 = [v5 intValue];
        LODWORD(v35) = 18;
        v20 = (void *)_os_log_send_and_compose_impl();

        if (v20)
        {
          v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v36, v35);
          free(v20);
          SSFileLog();
LABEL_26:
        }
        break;
      case 0xF3Eu:
        id v6 = +[SSLogConfig sharedDaemonConfig];
        if (!v6)
        {
          id v6 = +[SSLogConfig sharedConfig];
        }
        unsigned int v21 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v22 = v21 | 2;
        }
        else {
          int v22 = v21;
        }
        v23 = [v6 OSLogObject];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          v22 &= 2u;
        }
        if (!v22) {
          goto LABEL_38;
        }
        v24 = objc_opt_class();
        id v25 = v24;
        int v36 = 138543618;
        v37 = v24;
        __int16 v38 = 1024;
        unsigned int v39 = [v5 intValue];
        LODWORD(v35) = 18;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (v26)
        {
          v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v36, v35);
          free(v26);
          SSFileLog();
LABEL_38:
        }
        break;
      case 0xF3Fu:
        id v6 = +[SSLogConfig sharedDaemonConfig];
        if (!v6)
        {
          id v6 = +[SSLogConfig sharedConfig];
        }
        unsigned int v27 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v28 = v27 | 2;
        }
        else {
          int v28 = v27;
        }
        v29 = [v6 OSLogObject];
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          v28 &= 2u;
        }
        if (!v28) {
          goto LABEL_50;
        }
        v30 = objc_opt_class();
        id v31 = v30;
        int v36 = 138543618;
        v37 = v30;
        __int16 v38 = 1024;
        unsigned int v39 = [v5 intValue];
        LODWORD(v35) = 18;
        v32 = (void *)_os_log_send_and_compose_impl();

        if (v32)
        {
          v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v36, v35);
          free(v32);
          SSFileLog();
LABEL_50:
        }
        break;
      default:
        goto LABEL_15;
    }

    v33 = SSError();
    id v13 = v33;
    if (a4)
    {
      id v13 = v33;
      BOOL v14 = 0;
      *a4 = v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
LABEL_15:
    id v13 = 0;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v87 = 0;
  v88 = (id *)&v87;
  uint64_t v89 = 0x3032000000;
  v90 = sub_10004DB38;
  v91 = sub_10004DB48;
  id v92 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  [v5 setPerformsButtonAction:0];
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = sub_10004DB38;
  v77 = sub_10004DB48;
  id v78 = 0;
  v64 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  id v6 = [v5 dialog];
  unsigned int v7 = [v6 paymentSheet];

  if (!v7)
  {
LABEL_47:
    v41 = v88;
    id obj = v88[5];
    unsigned __int8 v42 = -[PurchaseProtocolDataProvider runSubOperation:error:](self, "runSubOperation:error:", v5, &obj, v60);
    objc_storeStrong(v41 + 5, obj);
    *((unsigned char *)v84 + 24) = v42;
    goto LABEL_48;
  }
  v62 = [v5 authenticationContext];
  int v8 = [[DisplayPaymentSheetOperation alloc] initWithPaymentSheet:v7];
  id v9 = [v62 requiredUniqueIdentifier];
  [(DisplayPaymentSheetOperation *)v8 setAccountIdentifier:v9];

  BOOL v10 = [v7 defaultAuthKitAuthenticationContext];
  [(DisplayPaymentSheetOperation *)v8 setAuthenticationContext:v10];

  id v11 = [v7 dialogId];
  [(DisplayPaymentSheetOperation *)v8 setDialogId:v11];

  v12 = [*(id *)&self->super.ISProtocolDataProvider_opaque[OBJC_IVAR___ISDataProvider__authenticationContext] accountName];
  [(DisplayPaymentSheetOperation *)v8 setAccountName:v12];

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10004DB50;
  v67[3] = &unk_1003A42C0;
  id v13 = v64;
  id v68 = v13;
  v69 = &v87;
  v70 = &v79;
  v71 = &v73;
  v72 = &v83;
  [(DisplayPaymentSheetOperation *)v8 setCompletionHandler:v67];
  BOOL v14 = [[DisplayPaymentSheetContainerOperation alloc] initWithDisplayPaymentSheetOperation:v8];
  if (!v14)
  {
    v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    unsigned int v28 = [v26 shouldLogToDisk];
    v29 = [v26 OSLogObject];
    v30 = v29;
    if (v28) {
      v27 |= 2u;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      int v31 = v27;
    }
    else {
      int v31 = v27 & 2;
    }
    if (v31)
    {
      int v93 = 138543362;
      id v94 = v13;
      LODWORD(v61) = 12;
      v60 = &v93;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32)
      {
        v23 = 0;
        goto LABEL_40;
      }
      v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v93, v61);
      free(v32);
      v60 = (int *)v30;
      SSFileLog();
    }
    v23 = 0;
    goto LABEL_39;
  }
  unsigned int v15 = +[SSLogConfig sharedDaemonConfig];
  if (!v15)
  {
    unsigned int v15 = +[SSLogConfig sharedConfig];
  }
  unsigned int v16 = [v15 shouldLog];
  unsigned int v17 = [v15 shouldLogToDisk];
  v18 = [v15 OSLogObject];
  id v19 = v18;
  if (v17) {
    v16 |= 2u;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    int v20 = v16;
  }
  else {
    int v20 = v16 & 2;
  }
  if (v20)
  {
    int v93 = 138543362;
    id v94 = v13;
    LODWORD(v61) = 12;
    v60 = &v93;
    unsigned int v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_14;
    }
    id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v93, v61);
    free(v21);
    v60 = (int *)v19;
    SSFileLog();
  }

LABEL_14:
  id v66 = 0;
  [(PurchaseProtocolDataProvider *)self runSubOperation:v14 error:&v66];
  id v22 = v66;
  v23 = v22;
  if (!v22) {
    goto LABEL_41;
  }
  v24 = [v22 domain];
  if ([v24 isEqualToString:SSErrorDomain])
  {
    BOOL v25 = [v23 code] == (id)140;

    if (v25) {
      *((unsigned char *)v80 + 24) = 1;
    }
  }
  else
  {
  }
  v26 = +[SSLogConfig sharedDaemonConfig];
  if (!v26)
  {
    v26 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = [v26 shouldLog];
  unsigned int v34 = [v26 shouldLogToDisk];
  uint64_t v35 = [v26 OSLogObject];
  v30 = v35;
  if (v34) {
    v33 |= 2u;
  }
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    v33 &= 2u;
  }
  if (!v33) {
    goto LABEL_39;
  }
  int v36 = objc_opt_class();
  int v93 = 138543618;
  id v94 = v36;
  __int16 v95 = 2114;
  v96 = v23;
  id v37 = v36;
  LODWORD(v61) = 22;
  v60 = &v93;
  __int16 v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v93, v61);
    free(v38);
    v60 = (int *)v30;
    SSFileLog();
LABEL_39:
  }
LABEL_40:

LABEL_41:
  if (*((unsigned char *)v84 + 24))
  {
    unsigned int v39 = [v5 authenticationContext];
    id v40 = [v39 mutableCopy];

    if (v74[5])
    {
      objc_msgSend(v40, "setPasswordEquivalentToken:");
      [v5 setAuthenticationContext:v40];
    }
  }
  if (!v14 || !*((unsigned char *)v80 + 24)) {
    goto LABEL_47;
  }
LABEL_48:
  v43 = objc_msgSend(v5, "selectedButton", v60);
  if (!*((unsigned char *)v84 + 24))
  {
    v47 = +[SSLogConfig sharedDaemonConfig];
    if (!v47)
    {
      v47 = +[SSLogConfig sharedConfig];
    }
    unsigned int v48 = [v47 shouldLog];
    unsigned int v49 = [v47 shouldLogToDisk];
    v50 = [v47 OSLogObject];
    v51 = v50;
    if (v49) {
      v48 |= 2u;
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      int v52 = v48;
    }
    else {
      int v52 = v48 & 2;
    }
    if (v52)
    {
      v53 = objc_opt_class();
      id v54 = v88[5];
      int v93 = 138543618;
      id v94 = v53;
      __int16 v95 = 2114;
      v96 = v54;
      id v55 = v53;
      LODWORD(v61) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_61:

        v46 = [v5 dialog];
        [v43 performDefaultActionForDialog:v46];
        goto LABEL_62;
      }
      v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v93, v61);
      free(v56);
      SSFileLog();
    }

    goto LABEL_61;
  }
  v44 = [v5 dialog];
  [(PurchaseProtocolDataProvider *)self _performActionsForButton:v43 withDialog:v44];

  -[PurchaseProtocolDataProvider setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", [v5 authenticatedAccountCredentialSource]);
  v45 = [v5 authenticatedAccountDSID];
  [(PurchaseProtocolDataProvider *)self setAuthenticatedAccountDSID:v45];

  v46 = [v5 redirectURL];
  [(PurchaseProtocolDataProvider *)self setRedirectURL:v46];
LABEL_62:

  int v57 = *((unsigned __int8 *)v84 + 24);
  if (a4 && !*((unsigned char *)v84 + 24))
  {
    *a4 = v88[5];
    int v57 = *((unsigned __int8 *)v84 + 24);
  }
  BOOL v58 = v57 != 0;

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  return v58;
}

- (NSString)redirectActionParameters
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRedirectActionParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end