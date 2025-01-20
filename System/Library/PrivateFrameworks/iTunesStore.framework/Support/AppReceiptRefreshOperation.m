@interface AppReceiptRefreshOperation
- (AppReceiptRefreshOperation)initWithOptions:(id)a3;
- (BOOL)_handleResponse:(id)a3 forApp:(id)a4 options:(id)a5;
- (BOOL)_preformMigrationCheckForApp:(id)a3;
- (BOOL)_refreshReceiptForApplication:(id)a3 withOptions:(id)a4 vppState:(int64_t)a5 error:(id *)a6;
- (id)_optionsWithVPPState:(int64_t)a3;
- (id)_postBodyDataWithApplication:(id)a3 options:(id)a4 vppState:(int64_t)a5 error:(id *)a6;
- (id)receiptExpirationDateForProxy:(id)a3;
- (void)run;
- (void)setResultsBlock:(id)a3;
@end

@implementation AppReceiptRefreshOperation

- (AppReceiptRefreshOperation)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(AppReceiptRefreshOperation *)self init];
  if (v5)
  {
    v6 = objc_alloc_init(AppReceiptOperationResult);
    operationResult = v5->_operationResult;
    v5->_operationResult = v6;

    if (v4)
    {
      v8 = (AppReceiptRefreshOperationOptions *)[v4 copy];
      options = v5->_options;
      v5->_options = v8;
    }
    else
    {
      v10 = objc_alloc_init(AppReceiptRefreshOperationOptions);
      v11 = v5->_options;
      v5->_options = v10;

      [(AppReceiptRefreshOperationOptions *)v5->_options setAuthenticationPromptStyle:1000];
      [(AppReceiptRefreshOperationOptions *)v5->_options setPerformSinfMirartionCheckBeforeFailing:1];
    }
  }

  return v5;
}

- (void)run
{
  v3 = objc_alloc_init(FamilyCircleOperation);
  if ([(AppReceiptRefreshOperation *)self runSubOperation:v3 returningError:0])
  {
    id v4 = [(FamilyCircleOperation *)v3 familyCircle];

    if (v4)
    {
      v5 = [(FamilyCircleOperation *)v3 familyCircle];
      v6 = [v5 allITunesIdentifiers];
      v7 = [v6 allObjects];
      v8 = (NSArray *)[v7 mutableCopy];

      v9 = +[SSAccountStore defaultStore];
      v10 = [v9 activeAccount];
      v11 = [v10 uniqueIdentifier];

      if (v11) {
        [(NSArray *)v8 removeObject:v11];
      }
      familyAccountIDs = self->_familyAccountIDs;
      self->_familyAccountIDs = v8;
    }
  }

  v13 = [(AppReceiptRefreshOperationOptions *)self->_options bundleIdentifier];
  if (v13)
  {
    v15 = +[LSApplicationProxy applicationProxyForIdentifier:v13];
    if (v15
      || (+[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:v13], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(AppReceiptRefreshOperation *)self _refreshReceiptForApplication:v15 withOptions:self->_options vppState:(int)+[SSPurchaseReceipt vppStateFlagsWithProxy:v15] error:0];
    }
  }
  else
  {
    v16 = +[SSURLBagContext contextWithBagType:0];
    v17 = +[ISURLBagCache sharedCache];
    v18 = [v17 URLBagForContext:v16];

    v19 = [v18 valueForKey:@"receipt-max-lookup-count"];
    if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v20 = (uint64_t)[v19 integerValue];
    }
    else {
      uint64_t v20 = 10;
    }
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v21 = +[LSApplicationWorkspace defaultWorkspace];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000FAFE4;
    v26[3] = &unk_1003A6730;
    v26[5] = v27;
    v26[6] = v20;
    v26[4] = self;
    [v21 enumerateApplicationsOfType:0 block:v26];

    _Block_object_dispose(v27, 8);
  }
  [(AppReceiptRefreshOperation *)self lock];
  v22 = self->_operationResult;
  v23 = (void (**)(id, AppReceiptOperationResult *))objc_retainBlock(self->_resultsBlock);
  operationResult = self->_operationResult;
  self->_operationResult = 0;

  id resultsBlock = self->_resultsBlock;
  self->_id resultsBlock = 0;

  [(AppReceiptRefreshOperation *)self unlock];
  if (v23) {
    v23[2](v23, v22);
  }
}

- (void)setResultsBlock:(id)a3
{
  id v6 = a3;
  [(AppReceiptRefreshOperation *)self lock];
  if (self->_resultsBlock != v6)
  {
    id v4 = [v6 copy];
    id resultsBlock = self->_resultsBlock;
    self->_id resultsBlock = v4;
  }
  [(AppReceiptRefreshOperation *)self unlock];
}

- (id)receiptExpirationDateForProxy:(id)a3
{
  v3 = +[SSPurchaseReceipt receiptPathForProxy:a3];
  if (v3)
  {
    id v4 = [objc_alloc((Class)SSPurchaseReceipt) initWithContentsOfFile:v3];
    v5 = [v4 expirationDate];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_handleResponse:(id)a3 forApp:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 objectForKey:@"status"];
  v12 = v11;
  if (!v11 || ![v11 integerValue])
  {
    v13 = [v8 objectForKey:@"receipt"];
    unint64_t v19 = (unint64_t)[v10 receiptFlags];
    if (![v13 length])
    {
      v24 = +[SSLogConfig sharedDaemonConfig];
      if (!v24)
      {
        v24 = +[SSLogConfig sharedConfig];
      }
      unsigned int v39 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v40 = v39 | 2;
      }
      else {
        int v40 = v39;
      }
      v31 = [v24 OSLogObject];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        v40 &= 2u;
      }
      if (!v40) {
        goto LABEL_98;
      }
      int v81 = 138543618;
      id v82 = (id)objc_opt_class();
      __int16 v83 = 2114;
      id v84 = v9;
      id v41 = v82;
      LODWORD(v67) = 22;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42) {
        goto LABEL_99;
      }
      v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v81, v67);
      free(v42);
      SSFileLog();
      goto LABEL_98;
    }
    uint64_t v20 = [v9 bundleIdentifier];
    unsigned __int8 v21 = +[AppReceipt writeReceipt:v13 forBundleIdentifier:v20 style:(v19 >> 2) & 1];

    if (v21)
    {
      [(AppReceiptOperationResult *)self->_operationResult addRefreshed:v9];
      unsigned __int8 v22 = +[SSPurchaseReceipt vppStateFlagsWithProxy:v9];
      v23 = [v8 objectForKey:@"revoked"];
      v24 = v23;
      if (v23)
      {
        if ([v23 BOOLValue])
        {
          if (!-[AppReceiptRefreshOperationOptions performSinfMirartionCheckBeforeFailing](self->_options, "performSinfMirartionCheckBeforeFailing")|| ([v9 hasMIDBasedSINF] & 1) != 0|| (v22 & 8) == 0)
          {
LABEL_32:
            -[AppReceiptOperationResult addRevoked:](self->_operationResult, "addRevoked:", v9, v66);
            v31 = +[SSLogConfig sharedDaemonConfig];
            if (!v31)
            {
              v31 = +[SSLogConfig sharedConfig];
            }
            unsigned int v32 = [v31 shouldLog];
            if ([v31 shouldLogToDisk]) {
              int v33 = v32 | 2;
            }
            else {
              int v33 = v32;
            }
            v34 = [v31 OSLogObject];
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
              v33 &= 2u;
            }
            if (v33)
            {
              id v75 = v10;
              v35 = objc_opt_class();
              id v78 = v35;
              v36 = [v9 itemName];
              id v37 = [v13 length];
              int v81 = 138544130;
              id v82 = v35;
              __int16 v83 = 2114;
              id v84 = v36;
              __int16 v85 = 2114;
              id v86 = v9;
              __int16 v87 = 2048;
              id v88 = v37;
              LODWORD(v67) = 42;
              v38 = (void *)_os_log_send_and_compose_impl();

              if (!v38)
              {
                id v10 = v75;
                goto LABEL_98;
              }
              v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v81, v67);
              free(v38);
              SSFileLog();
              id v10 = v75;
            }
            goto LABEL_97;
          }
          unsigned int v77 = [(AppReceiptRefreshOperation *)self _preformMigrationCheckForApp:v9];
          v25 = +[SSLogConfig sharedDaemonConfig];
          if (!v25)
          {
            v25 = +[SSLogConfig sharedConfig];
          }
          v26 = v25;
          unsigned int v27 = [v25 shouldLog];
          if ([v26 shouldLogToDisk]) {
            v27 |= 2u;
          }
          v74 = v26;
          v28 = [v26 OSLogObject];
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            v27 &= 2u;
          }
          if (v27)
          {
            v70 = v28;
            v29 = objc_opt_class();
            id v72 = v29;
            v68 = [v9 bundleIdentifier];
            int v81 = 138543874;
            id v82 = v29;
            __int16 v83 = 2114;
            id v84 = v68;
            __int16 v85 = 1024;
            LODWORD(v86) = v77;
            LODWORD(v67) = 28;
            v66 = &v81;
            v30 = (void *)_os_log_send_and_compose_impl();

            if (!v30) {
              goto LABEL_31;
            }
            v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v81, v67);
            free(v30);
            v66 = (int *)v28;
            SSFileLog();
          }

LABEL_31:
          if ((v77 & 1) == 0) {
            goto LABEL_32;
          }
LABEL_99:
          LOBYTE(v18) = 1;
          goto LABEL_100;
        }
        v31 = +[SSLogConfig sharedDaemonConfig];
        if (!v31)
        {
          v31 = +[SSLogConfig sharedConfig];
        }
        unsigned int v62 = [v31 shouldLog];
        if ([v31 shouldLogToDisk]) {
          int v63 = v62 | 2;
        }
        else {
          int v63 = v62;
        }
        v34 = [v31 OSLogObject];
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          v63 &= 2u;
        }
        if (!v63)
        {
LABEL_97:

          goto LABEL_98;
        }
        v64 = objc_opt_class();
        id v80 = v64;
        int v81 = 138543874;
        id v82 = v64;
        __int16 v83 = 2114;
        id v84 = v9;
        __int16 v85 = 2048;
        id v86 = [v13 length];
        LODWORD(v67) = 32;
        v61 = (void *)_os_log_send_and_compose_impl();
        goto LABEL_95;
      }
      if ((v22 & 8) == 0) {
        goto LABEL_99;
      }
      if (!-[AppReceiptRefreshOperationOptions performSinfMirartionCheckBeforeFailing](self->_options, "performSinfMirartionCheckBeforeFailing")|| ([v9 hasMIDBasedSINF] & 1) != 0)
      {
LABEL_77:
        -[AppReceiptOperationResult addRevoked:](self->_operationResult, "addRevoked:", v9, v66);
        v31 = +[SSLogConfig sharedDaemonConfig];
        if (!v31)
        {
          v31 = +[SSLogConfig sharedConfig];
        }
        unsigned int v54 = [v31 shouldLog];
        if ([v31 shouldLogToDisk]) {
          int v55 = v54 | 2;
        }
        else {
          int v55 = v54;
        }
        v34 = [v31 OSLogObject];
        BOOL v56 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        int v57 = v55 & 2;
        if (v56) {
          int v57 = v55;
        }
        if (!v57) {
          goto LABEL_97;
        }
        v58 = objc_opt_class();
        id v80 = v58;
        v59 = [v9 itemName];
        id v60 = [v13 length];
        int v81 = 138413058;
        id v82 = v58;
        __int16 v83 = 2114;
        id v84 = v59;
        __int16 v85 = 2114;
        id v86 = v9;
        __int16 v87 = 2048;
        id v88 = v60;
        LODWORD(v67) = 42;
        v61 = (void *)_os_log_send_and_compose_impl();

LABEL_95:
        if (v61)
        {
          v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v61, 4, &v81, v67);
          free(v61);
          SSFileLog();
          goto LABEL_97;
        }
LABEL_98:

        goto LABEL_99;
      }
      unsigned int v79 = [(AppReceiptRefreshOperation *)self _preformMigrationCheckForApp:v9];
      v48 = +[SSLogConfig sharedDaemonConfig];
      if (!v48)
      {
        v48 = +[SSLogConfig sharedConfig];
      }
      v49 = v48;
      unsigned int v50 = [v48 shouldLog];
      if ([v49 shouldLogToDisk]) {
        v50 |= 2u;
      }
      v76 = v49;
      v51 = [v49 OSLogObject];
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
        v50 &= 2u;
      }
      if (v50)
      {
        v71 = v51;
        v52 = objc_opt_class();
        id v73 = v52;
        v69 = [v9 bundleIdentifier];
        int v81 = 138543874;
        id v82 = v52;
        __int16 v83 = 2114;
        id v84 = v69;
        __int16 v85 = 1024;
        LODWORD(v86) = v79;
        LODWORD(v67) = 28;
        v66 = &v81;
        v53 = (void *)_os_log_send_and_compose_impl();

        if (!v53) {
          goto LABEL_76;
        }
        v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v81, v67);
        free(v53);
        v66 = (int *)v51;
        SSFileLog();
      }

LABEL_76:
      if (v79) {
        goto LABEL_99;
      }
      goto LABEL_77;
    }
    v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v43 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v44 = v43 | 2;
    }
    else {
      int v44 = v43;
    }
    v45 = [v24 OSLogObject];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      v44 &= 2u;
    }
    if (v44)
    {
      v46 = objc_opt_class();
      id v47 = v46;
      int v81 = 138543874;
      id v82 = v46;
      __int16 v83 = 2114;
      id v84 = v9;
      __int16 v85 = 2048;
      id v86 = [v13 length];
      LODWORD(v67) = 32;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_100:

        goto LABEL_101;
      }
      v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v81, v67);
      free(v18);
      SSFileLog();
    }

    LOBYTE(v18) = 0;
    goto LABEL_100;
  }
  v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13)
  {
    v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  v16 = [v13 OSLogObject];
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    v15 &= 2u;
  }
  if (!v15) {
    goto LABEL_13;
  }
  int v81 = 138543618;
  id v82 = (id)objc_opt_class();
  __int16 v83 = 2114;
  id v84 = v8;
  id v17 = v82;
  LODWORD(v67) = 22;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v81, v67);
    free(v18);
    SSFileLog();
LABEL_13:

    LOBYTE(v18) = 0;
  }
LABEL_101:

  return (char)v18;
}

- (BOOL)_preformMigrationCheckForApp:(id)a3
{
  return 0;
}

- (id)_optionsWithVPPState:(int64_t)a3
{
  if ((a3 & 2) != 0)
  {
    id v3 = [(AppReceiptRefreshOperationOptions *)self->_options copy];
    objc_msgSend(v3, "setReceiptFlags:", (unint64_t)objc_msgSend(v3, "receiptFlags") | 8);
    id v4 = v3;
    uint64_t v5 = 0;
  }
  else
  {
    if ((a3 & 0x40000000) == 0)
    {
      id v3 = 0;
      goto LABEL_7;
    }
    id v3 = [(AppReceiptRefreshOperationOptions *)self->_options copy];
    objc_msgSend(v3, "setReceiptFlags:", (unint64_t)objc_msgSend(v3, "receiptFlags") & 0xFFFFFFFFFFFFFFF7);
    id v4 = v3;
    uint64_t v5 = 1;
  }
  [v4 setNeedsAuthentication:v5];
LABEL_7:

  return v3;
}

- (id)_postBodyDataWithApplication:(id)a3 options:(id)a4 vppState:(int64_t)a5 error:(id *)a6
{
  char v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  if (([v10 receiptFlags] & 4) != 0)
  {
    int v15 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
    v16 = objc_msgSend(v15, "ams_activeiTunesAccount");

    id v13 = [objc_alloc((Class)SSAccount) initWithBackingAccount:v16];
    unsigned int v14 = objc_msgSend(v16, "ams_DSID");
  }
  else
  {
    v12 = +[SSAccountStore defaultStore];
    id v13 = [v12 activeAccount];

    unsigned int v14 = [v9 purchaserDSID];
  }
  if (v14) {
    BOOL v17 = v13 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v81 = v13;
  id v82 = v10;
  if (!v17)
  {
    familyAccountIDs = self->_familyAccountIDs;
    if (familyAccountIDs)
    {
      if ([(NSArray *)familyAccountIDs containsObject:v14])
      {
        unint64_t v19 = [v9 storeFront];
        char v20 = objc_opt_respondsToSelector();

        if (v20)
        {
          unsigned __int8 v21 = [v9 storeFront];
          id v80 = [v21 stringValue];
        }
        else
        {
          id v80 = 0;
        }
        unsigned __int8 v22 = [v13 storeFrontIdentifier];
        unsigned int v79 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v22 integerValue]);

        uint64_t v23 = [v13 uniqueIdentifier];
        id v78 = (void *)v23;
        if (!v23 || !v80 || (v24 = (void *)v23, ![v79 isEqualToString:v80]))
        {
          unsigned int v77 = v9;
          v34 = v14;
          v26 = +[SSLogConfig sharedDaemonConfig];
          if (!v26)
          {
            v26 = +[SSLogConfig sharedConfig];
          }
          unsigned int v35 = [v26 shouldLog];
          if ([v26 shouldLogToDisk]) {
            int v36 = v35 | 2;
          }
          else {
            int v36 = v35;
          }
          id v37 = [v26 OSLogObject];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
            int v38 = v36;
          }
          else {
            int v38 = v36 & 2;
          }
          if (v38)
          {
            unsigned int v39 = objc_opt_class();
            id v75 = v39;
            int v40 = [v77 bundleIdentifier];
            int v85 = 138544386;
            id v86 = v39;
            __int16 v87 = 2114;
            id v88 = v34;
            __int16 v89 = 2114;
            v90 = v40;
            __int16 v91 = 2114;
            v92 = v80;
            __int16 v93 = 2114;
            v94 = v79;
            LODWORD(v74) = 52;
            id v73 = &v85;
            id v41 = (void *)_os_log_send_and_compose_impl();

            if (v41)
            {
              +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v85, v74);
              v42 = (int *)objc_claimAutoreleasedReturnValue();
              free(v41);
              id v73 = v42;
              SSFileLog();
            }
            id v25 = v34;
          }
          else
          {

            id v25 = v34;
          }
          id v9 = v77;
          goto LABEL_42;
        }
        id v25 = [v24 copy];

        v26 = +[SSLogConfig sharedDaemonConfig];
        if (!v26)
        {
          v26 = +[SSLogConfig sharedConfig];
        }
        unsigned int v27 = [v26 shouldLog];
        if ([v26 shouldLogToDisk]) {
          int v28 = v27 | 2;
        }
        else {
          int v28 = v27;
        }
        v29 = [v26 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          int v30 = v28;
        }
        else {
          int v30 = v28 & 2;
        }
        if (v30)
        {
          v31 = objc_opt_class();
          id v76 = v31;
          unsigned int v32 = [v9 bundleIdentifier];
          int v85 = 138544130;
          id v86 = v31;
          __int16 v87 = 2114;
          id v88 = v25;
          __int16 v89 = 2114;
          v90 = v32;
          __int16 v91 = 2114;
          v92 = v79;
          LODWORD(v74) = 42;
          id v73 = &v85;
          int v33 = (void *)_os_log_send_and_compose_impl();

          if (!v33)
          {
LABEL_42:

            unsigned int v14 = v25;
            id v10 = v82;
            goto LABEL_43;
          }
          v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v85, v74);
          free(v33);
          id v73 = (int *)v29;
          SSFileLog();
        }

        goto LABEL_42;
      }
    }
  }
LABEL_43:
  if (objc_opt_respondsToSelector())
  {
    [v10 setTargetAccount:v14];
    unsigned int v43 = [v14 stringValue];
    [v11 setObject:v43 forKey:@"dsid"];
  }
  int v44 = +[ISDevice sharedInstance];
  v45 = [v44 guid];

  if (v45) {
    [v11 setObject:v45 forKey:@"guid"];
  }
  v46 = [v9 bundleIdentifier];

  if (v46) {
    [v11 setObject:v46 forKey:@"bundle-id"];
  }
  id v47 = [v9 bundleVersion];

  if (v47) {
    [v11 setObject:v47 forKey:@"version-id"];
  }
  v48 = +[ISDevice sharedInstance];
  v49 = [v48 serialNumber];

  if (v49) {
    [v11 setObject:v49 forKey:@"serialNumber"];
  }
  unsigned int v50 = [v10 receiptFlags] & 1;
  if (v50) {
    [v11 setObject:&__kCFBooleanTrue forKey:@"want-expired"];
  }
  if (([v10 receiptFlags] & 2) != 0)
  {
    [v11 setObject:&__kCFBooleanTrue forKey:@"want-revoked"];
    unsigned int v50 = 1;
  }
  int v51 = v50 | ((unint64_t)[v10 receiptFlags] >> 3) & 1;
  if (v51 == 1) {
    [v11 setObject:&__kCFBooleanTrue forKey:@"want-vpp"];
  }
  if ((v6 & 8) != 0) {
    [v11 setObject:&__kCFBooleanTrue forKey:@"revoked"];
  }
  v52 = [v9 itemID];

  if (v52)
  {
    v53 = [v52 stringValue];
    if (v51) {
      CFStringRef v54 = @"appAdamId";
    }
    else {
      CFStringRef v54 = @"adam-id";
    }
    [v11 setObject:v53 forKey:v54];
  }
  int v55 = v9;
  BOOL v56 = [v9 externalVersionIdentifier];

  if (v56)
  {
    int v57 = [v56 stringValue];
    if (v51) {
      CFStringRef v58 = @"appExtVrsId";
    }
    else {
      CFStringRef v58 = @"software-version-external-identifier";
    }
    [v11 setObject:v57 forKey:v58];
  }
  v59 = v14;
  id v60 = [v55 deviceIdentifierForVendor];
  v61 = [v60 UUIDString];

  if (v61) {
    [v11 setObject:v61 forKey:@"vid"];
  }
  id v84 = 0;
  unsigned int v62 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:100 options:0 error:&v84];
  id v63 = v84;
  if (v63)
  {
    v64 = +[SSLogConfig sharedDaemonConfig];
    if (!v64)
    {
      v64 = +[SSLogConfig sharedConfig];
    }
    unsigned int v65 = [v64 shouldLog];
    if ([v64 shouldLogToDisk]) {
      int v66 = v65 | 2;
    }
    else {
      int v66 = v65;
    }
    uint64_t v67 = [v64 OSLogObject];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      int v68 = v66;
    }
    else {
      int v68 = v66 & 2;
    }
    if (v68)
    {
      v69 = objc_opt_class();
      int v85 = 138543618;
      id v86 = v69;
      __int16 v87 = 2114;
      id v88 = v63;
      id v70 = v69;
      LODWORD(v74) = 22;
      v71 = (void *)_os_log_send_and_compose_impl();

      if (!v71)
      {
LABEL_86:

        goto LABEL_87;
      }
      uint64_t v67 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v71, 4, &v85, v74);
      free(v71);
      SSFileLog();
    }

    goto LABEL_86;
  }
LABEL_87:
  if (a6 && !v62) {
    *a6 = v63;
  }

  return v62;
}

- (BOOL)_refreshReceiptForApplication:(id)a3 withOptions:(id)a4 vppState:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v58 = 0;
  v12 = [(AppReceiptRefreshOperation *)self _postBodyDataWithApplication:v10 options:v11 vppState:a5 error:&v58];
  id v13 = v58;
  if (v12)
  {
    BOOL v56 = a6;
    id v14 = objc_alloc_init((Class)ISStoreURLOperation);
    objc_msgSend(v14, "setNeedsAuthentication:", objc_msgSend(v11, "needsAuthentication"));
    int v15 = +[DaemonProtocolDataProvider provider];
    [v14 setDataProvider:v15];
    id v16 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    [v16 setAllowedRetryCount:0];
    int v55 = v12;
    [v16 setHTTPBody:v12];
    [v16 setHTTPMethod:@"POST"];
    BOOL v17 = [v11 URLBagKey];
    [v16 setURLBagKey:v17];

    [v16 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
    v18 = [v11 targetAccount];

    id v19 = objc_alloc((Class)SSMutableAuthenticationContext);
    if (v18) {
      [v11 targetAccount];
    }
    else {
    unsigned __int8 v21 = [v10 purchaserDSID];
    }
    id v22 = [v19 initWithAccountIdentifier:v21];

    objc_msgSend(v22, "setPromptStyle:", objc_msgSend(v11, "authenticationPromptStyle"));
    if (([v11 receiptFlags] & 4) != 0)
    {
      [v22 setAccountScope:1];
      [v16 setURLBagType:1];
    }
    CFStringRef v54 = v22;
    [v14 setAuthenticationContext:v22];
    [v14 setRequestProperties:v16];
    uint64_t v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      uint64_t v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = [v23 shouldLog];
    if ([v23 shouldLogToDisk]) {
      v24 |= 2u;
    }
    id v25 = [v23 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      v24 &= 2u;
    }
    if (v24)
    {
      v26 = objc_opt_class();
      int v59 = 138543618;
      id v60 = v26;
      __int16 v61 = 2114;
      id v62 = v10;
      id v52 = v13;
      id v27 = v11;
      id v28 = v16;
      v29 = self;
      id v30 = v14;
      id v31 = v10;
      unsigned int v32 = v15;
      id v33 = v26;
      LODWORD(v51) = 22;
      v49 = &v59;
      v34 = (void *)_os_log_send_and_compose_impl();

      int v15 = v32;
      id v10 = v31;
      id v14 = v30;
      self = v29;
      id v16 = v28;
      id v11 = v27;
      id v13 = v52;

      if (!v34)
      {
LABEL_19:

        id v57 = v13;
        unsigned int v35 = [(AppReceiptRefreshOperation *)self runSubOperation:v14 returningError:&v57];
        id v36 = v57;

        if (v35)
        {
          id v37 = [v15 output];
          unsigned __int8 v38 = [(AppReceiptRefreshOperation *)self _handleResponse:v37 forApp:v10 options:v11];

          if (v38)
          {
            BOOL v20 = 1;
            a6 = v56;
            goto LABEL_39;
          }
        }
        unsigned int v39 = +[SSLogConfig sharedDaemonConfig];
        if (!v39)
        {
          unsigned int v39 = +[SSLogConfig sharedConfig];
        }
        id v53 = v14;
        unsigned int v40 = [v39 shouldLog];
        if ([v39 shouldLogToDisk]) {
          v40 |= 2u;
        }
        id v41 = [v39 OSLogObject];
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          v40 &= 2u;
        }
        if (v40)
        {
          v42 = objc_opt_class();
          int v59 = 138543874;
          id v60 = v42;
          __int16 v61 = 2114;
          id v43 = v10;
          id v62 = v10;
          __int16 v63 = 2114;
          id v64 = v36;
          int v44 = v15;
          id v45 = v42;
          LODWORD(v51) = 32;
          unsigned int v50 = &v59;
          v46 = (void *)_os_log_send_and_compose_impl();

          int v15 = v44;
          if (!v46)
          {
LABEL_33:

            id v47 = [(AppReceiptOperationResult *)self->_operationResult resultingError];

            if (v47)
            {
              BOOL v20 = 0;
              a6 = v56;
              id v10 = v43;
            }
            else
            {
              id v10 = v43;
              if (!v36)
              {
                id v36 = +[NSError errorWithDomain:SSErrorDomain code:100 userInfo:0];
              }
              -[AppReceiptOperationResult setResultingError:](self->_operationResult, "setResultingError:", v36, v50);
              BOOL v20 = 0;
              a6 = v56;
            }
            id v14 = v53;
LABEL_39:

            id v13 = v36;
            v12 = v55;
            if (!a6) {
              goto LABEL_42;
            }
            goto LABEL_40;
          }
          id v41 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v59, v51);
          free(v46);
          unsigned int v50 = (int *)v41;
          SSFileLog();
        }
        else
        {
          id v43 = v10;
        }

        goto LABEL_33;
      }
      id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v59, v51);
      free(v34);
      v49 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_19;
  }
  BOOL v20 = 0;
  if (!a6) {
    goto LABEL_42;
  }
LABEL_40:
  if (!v20) {
    *a6 = v13;
  }
LABEL_42:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_operationResult, 0);

  objc_storeStrong((id *)&self->_familyAccountIDs, 0);
}

@end