@interface DaemonBiometricOptInOperation
- (BOOL)_updateTouchIDSettingsForAccount:(id)a3;
- (BOOL)requiresStoreAuthentication;
- (DaemonBiometricOptInOperation)init;
- (id)_authenticateWithAccount:(id)a3 error:(id *)a4;
- (id)resultBlock;
- (void)run;
- (void)setRequiresStoreAuthentication:(BOOL)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation DaemonBiometricOptInOperation

- (DaemonBiometricOptInOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)DaemonBiometricOptInOperation;
  result = [(DaemonBiometricOptInOperation *)&v3 init];
  if (result) {
    result->_requiresStoreAuthentication = 1;
  }
  return result;
}

- (BOOL)requiresStoreAuthentication
{
  [(DaemonBiometricOptInOperation *)self lock];
  BOOL requiresStoreAuthentication = self->_requiresStoreAuthentication;
  [(DaemonBiometricOptInOperation *)self unlock];
  return requiresStoreAuthentication;
}

- (id)resultBlock
{
  [(DaemonBiometricOptInOperation *)self lock];
  id v3 = [self->_resultBlock copy];
  [(DaemonBiometricOptInOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setRequiresStoreAuthentication:(BOOL)a3
{
  [(DaemonBiometricOptInOperation *)self lock];
  self->_BOOL requiresStoreAuthentication = a3;

  [(DaemonBiometricOptInOperation *)self unlock];
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  [(DaemonBiometricOptInOperation *)self lock];
  if (self->_resultBlock != v6)
  {
    id v4 = [v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }
  [(DaemonBiometricOptInOperation *)self unlock];
}

- (void)run
{
  id v3 = objc_alloc_init(DaemonBiometricStore);
  if (![(DaemonBiometricStore *)v3 canPerformBiometricOptIn])
  {
    v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
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
      int v27 = 138543362;
      id v28 = (id)objc_opt_class();
      id v13 = v28;
      LODWORD(v25) = 12;
      v24 = &v27;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

        SSError();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v8 = 0;
        goto LABEL_31;
      }
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v27, v25);
      free(v14);
      v24 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_16;
  }
  id v4 = +[SSAccountStore defaultStore];
  v5 = [v4 activeAccount];

  if (![(DaemonBiometricOptInOperation *)self requiresStoreAuthentication])
  {
    id v7 = 0;
    if (v5) {
      goto LABEL_4;
    }
LABEL_18:
    v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      v19 = objc_opt_class();
      int v27 = 138543362;
      id v28 = v19;
      id v20 = v19;
      LODWORD(v25) = 12;
      v24 = &v27;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_29:

        BOOL v8 = 0;
        goto LABEL_30;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v27, v25);
      free(v21);
      v24 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_29;
  }
  id v26 = 0;
  uint64_t v6 = [(DaemonBiometricOptInOperation *)self _authenticateWithAccount:v5 error:&v26];
  id v7 = v26;

  v5 = (void *)v6;
  if (!v6) {
    goto LABEL_18;
  }
LABEL_4:
  BOOL v8 = [(DaemonBiometricOptInOperation *)self _updateTouchIDSettingsForAccount:v5];
LABEL_30:

LABEL_31:
  -[DaemonBiometricOptInOperation setError:](self, "setError:", v7, v24);
  [(DaemonBiometricOptInOperation *)self setSuccess:v8];
  uint64_t v22 = [(DaemonBiometricOptInOperation *)self resultBlock];
  v23 = (void *)v22;
  if (v22) {
    (*(void (**)(uint64_t, BOOL, id))(v22 + 16))(v22, v8, v7);
  }
}

- (id)_authenticateWithAccount:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v4];
  [v5 setCanCreateNewAccount:0];
  [v5 setCanSetActiveAccount:v4 == 0];
  [v5 setPromptStyle:1];
  uint64_t v6 = [v4 accountName];
  uint64_t v7 = [v4 uniqueIdentifier];

  BOOL v8 = (void *)v7;
  v9 = objc_opt_new();
  id v10 = [v9 biometricState];
  v78 = v9;
  id v11 = [v9 tokenAvailabilityForAccountIdentifier:v8];
  v12 = +[ISDevice sharedInstance];
  id v13 = [v12 deviceBiometricStyle];

  if (v11 == (id)2)
  {
    if ([v6 length])
    {
      if (v13 == (id)3)
      {
        v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v15 = v14;
        CFStringRef v16 = @"PROMPT_REASON_NEW_FACE_FORMAT_%@";
        goto LABEL_15;
      }
      if (v13 == (id)2)
      {
        v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v15 = v14;
        CFStringRef v16 = @"PROMPT_REASON_NEW_FINGERS_FORMAT_%@";
LABEL_15:
        uint64_t v22 = [v14 localizedStringForKey:v16 value:&stru_1003B9B00 table:@"Mesa"];
        v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v6);

LABEL_28:
LABEL_42:
        objc_msgSend(v5, "setReasonDescription:", v23, v73);
LABEL_43:

        goto LABEL_44;
      }
      v24 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v24)
      {
        v24 = +[SSLogConfig sharedConfig];
      }
      unsigned int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      int v27 = [v24 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        int v28 = v26;
      }
      else {
        int v28 = v26 & 2;
      }
      if (!v28) {
        goto LABEL_40;
      }
LABEL_38:
      int v79 = 138543362;
      id v80 = (id)objc_opt_class();
      id v32 = v80;
      LODWORD(v75) = 12;
      v73 = &v79;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_41:

        v23 = 0;
        goto LABEL_42;
      }
      int v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v79, v75);
      free(v33);
      v73 = (int *)v27;
      SSFileLog();
LABEL_40:

      goto LABEL_41;
    }
    if (v13 == (id)3)
    {
      id v20 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = v20;
      CFStringRef v21 = @"PROMPT_REASON_NEW_FACE_ANONYMOUS";
    }
    else
    {
      if (v13 != (id)2)
      {
        v24 = +[SSLogConfig sharedAccountsAuthenticationConfig];
        if (!v24)
        {
          v24 = +[SSLogConfig sharedConfig];
        }
        unsigned int v29 = [v24 shouldLog];
        if ([v24 shouldLogToDisk]) {
          int v30 = v29 | 2;
        }
        else {
          int v30 = v29;
        }
        int v27 = [v24 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          int v31 = v30;
        }
        else {
          int v31 = v30 & 2;
        }
        if (!v31) {
          goto LABEL_40;
        }
        goto LABEL_38;
      }
      id v20 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = v20;
      CFStringRef v21 = @"PROMPT_REASON_NEW_FINGERS_ANONYMOUS";
    }
    v23 = [v20 localizedStringForKey:v21 value:&stru_1003B9B00 table:@"Mesa"];
    goto LABEL_28;
  }
  if (v10 != (id)2 && [v6 length])
  {
    if (v13 == (id)2)
    {
      int v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      CFStringRef v19 = @"PROMPT_REASON_GENERIC";
    }
    else
    {
      if (v13 != (id)3)
      {
        v23 = +[SSLogConfig sharedAccountsAuthenticationConfig];
        if (!v23)
        {
          v23 = +[SSLogConfig sharedConfig];
        }
        unsigned int v66 = [v23 shouldLog];
        if ([v23 shouldLogToDisk]) {
          int v67 = v66 | 2;
        }
        else {
          int v67 = v66;
        }
        v68 = [v23 OSLogObject];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
          int v69 = v67;
        }
        else {
          int v69 = v67 & 2;
        }
        if (v69)
        {
          int v79 = 138543362;
          id v80 = (id)objc_opt_class();
          id v70 = v80;
          LODWORD(v75) = 12;
          v73 = &v79;
          v71 = (void *)_os_log_send_and_compose_impl();

          if (!v71) {
            goto LABEL_43;
          }
          v68 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v71, 4, &v79, v75);
          free(v71);
          v73 = (int *)v68;
          SSFileLog();
        }

        goto LABEL_43;
      }
      int v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      CFStringRef v19 = @"PROMPT_REASON_FACE_GENERIC";
    }
    v64 = [v17 localizedStringForKey:v19 value:&stru_1003B9B00 table:@"Mesa"];
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v64, v6);
    [v5 setReasonDescription:v65];
  }
LABEL_44:
  v34 = +[SSLogConfig sharedAccountsAuthenticationConfig];
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
  if (!v38) {
    goto LABEL_55;
  }
  v39 = objc_opt_class();
  int v79 = 138543362;
  id v80 = v39;
  id v40 = v39;
  LODWORD(v75) = 12;
  v74 = &v79;
  v41 = (void *)_os_log_send_and_compose_impl();

  if (v41)
  {
    v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v79, v75);
    free(v41);
    v74 = (int *)v37;
    SSFileLog();
LABEL_55:
  }
  id v42 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v5];
  v43 = [v42 run];
  v44 = [v43 error];

  if (v44 || (unint64_t v46 = (unint64_t)[v43 authenticateResponseType], v46 > 8))
  {
    v45 = 0;
    goto LABEL_101;
  }
  v77 = v8;
  v47 = v6;
  if (((1 << v46) & 0x1CF) != 0)
  {
    v48 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v48)
    {
      v48 = +[SSLogConfig sharedConfig];
    }
    unsigned int v49 = objc_msgSend(v48, "shouldLog", v74);
    if ([v48 shouldLogToDisk]) {
      int v50 = v49 | 2;
    }
    else {
      int v50 = v49;
    }
    v51 = [v48 OSLogObject];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
      int v52 = v50;
    }
    else {
      int v52 = v50 & 2;
    }
    if (v52)
    {
      v53 = objc_opt_class();
      id v54 = v53;
      v55 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v43 authenticateResponseType]);
      int v79 = 138543618;
      id v80 = v53;
      __int16 v81 = 2114;
      v82 = v55;
      LODWORD(v75) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      uint64_t v6 = v47;
      BOOL v8 = v77;
      v9 = v78;
      if (!v56)
      {
LABEL_73:

        v45 = 0;
        goto LABEL_101;
      }
      v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v79, v75);
      free(v56);
      SSFileLog();
    }
    else
    {
      uint64_t v6 = v47;
      BOOL v8 = v77;
      v9 = v78;
    }

    goto LABEL_73;
  }
  v57 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v57)
  {
    v57 = +[SSLogConfig sharedConfig];
  }
  unsigned int v58 = objc_msgSend(v57, "shouldLog", v74);
  if ([v57 shouldLogToDisk]) {
    v58 |= 2u;
  }
  v59 = [v57 OSLogObject];
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
    int v60 = v58;
  }
  else {
    int v60 = v58 & 2;
  }
  if (!v60)
  {
    uint64_t v6 = v47;
    BOOL v8 = v77;
    v9 = v78;
    goto LABEL_99;
  }
  v61 = objc_opt_class();
  id v76 = v61;
  v62 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v43 authenticateResponseType]);
  int v79 = 138543618;
  id v80 = v61;
  __int16 v81 = 2114;
  v82 = v62;
  LODWORD(v75) = 22;
  v63 = (void *)_os_log_send_and_compose_impl();

  uint64_t v6 = v47;
  BOOL v8 = v77;
  v9 = v78;
  if (v63)
  {
    v59 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, &v79, v75);
    free(v63);
    SSFileLog();
LABEL_99:
  }
  v45 = [v43 authenticatedAccount];
LABEL_101:

  return v45;
}

- (BOOL)_updateTouchIDSettingsForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  id v5 = [v3 uniqueIdentifier];

  id v6 = [objc_alloc((Class)ISBiometricUpdateTouchIDSettingsOperation) initWithAccountIdentifier:v5];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100066E50;
  v20[3] = &unk_1003A4B38;
  id v7 = v4;
  id v21 = v7;
  [v6 setResultBlock:v20];
  BOOL v8 = +[ISOperationQueue mainQueue];
  [v8 addOperation:v6];

  v9 = objc_alloc_init(DaemonBiometricStore);
  [(DaemonBiometricStore *)v9 setBiometricState:2];
  id v10 = [(DaemonBiometricStore *)v9 identityMap];
  [(DaemonBiometricStore *)v9 saveIdentityMap:v10 forAccountIdentifier:v5];

  [(DaemonBiometricStore *)v9 registerAccountIdentifier:v5];
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_11;
  }
  v15 = objc_opt_class();
  int v22 = 138412546;
  v23 = v15;
  __int16 v24 = 2112;
  unsigned int v25 = v5;
  id v16 = v15;
  LODWORD(v19) = 22;
  int v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v22, v19);
    free(v17);
    SSFileLog();
LABEL_11:
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);

  objc_storeStrong((id *)&self->_authToken, 0);
}

@end