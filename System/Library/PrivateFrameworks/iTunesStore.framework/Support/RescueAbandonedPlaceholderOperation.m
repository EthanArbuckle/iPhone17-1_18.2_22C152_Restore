@interface RescueAbandonedPlaceholderOperation
- (BOOL)_attemptRescueForBundleID:(id)a3 error:(id *)a4;
- (BOOL)_canRescueInstallTypeForBundleID:(id)a3 proxy:(id)a4 error:(id *)a5;
- (BOOL)_isRestoreRunning;
- (RescueAbandonedPlaceholderOperation)initWithBundleIdentifier:(id)a3;
- (id)_fetchAppProxyForBundleID:(id)a3 error:(id *)a4;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation RescueAbandonedPlaceholderOperation

- (RescueAbandonedPlaceholderOperation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RescueAbandonedPlaceholderOperation;
  v5 = [(RescueAbandonedPlaceholderOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;
  }
  return v5;
}

- (id)outputBlock
{
  [(RescueAbandonedPlaceholderOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(RescueAbandonedPlaceholderOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  [(RescueAbandonedPlaceholderOperation *)self lock];
  id v5 = [v4 copy];

  id outputBlock = self->_outputBlock;
  self->_id outputBlock = v5;

  [(RescueAbandonedPlaceholderOperation *)self unlock];
}

- (void)run
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    bundleID = self->_bundleID;
    int v25 = 138412546;
    v26 = v7;
    __int16 v27 = 2112;
    v28 = bundleID;
    id v9 = v7;
    LODWORD(v21) = 22;
    v20 = &v25;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v25, v21);
    free(v10);
    v20 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  v11 = self->_bundleID;
  if (v11)
  {
    id v24 = 0;
    v12 = [(RescueAbandonedPlaceholderOperation *)self _fetchAppProxyForBundleID:v11 error:&v24];
    id v13 = v24;
    BOOL v14 = 0;
    if (!v13)
    {
      if (v12)
      {
        v15 = self->_bundleID;
        id v23 = 0;
        unsigned int v16 = [(RescueAbandonedPlaceholderOperation *)self _canRescueInstallTypeForBundleID:v15 proxy:v12 error:&v23];
        id v13 = v23;
        BOOL v14 = 0;
        if (!v13)
        {
          if (v16)
          {
            v17 = self->_bundleID;
            id v22 = 0;
            BOOL v14 = [(RescueAbandonedPlaceholderOperation *)self _attemptRescueForBundleID:v17 error:&v22];
            id v13 = v22;
          }
        }
      }
    }
  }
  else
  {
    SSError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    BOOL v14 = 0;
  }
  -[RescueAbandonedPlaceholderOperation setError:](self, "setError:", v13, v20);
  [(RescueAbandonedPlaceholderOperation *)self setSuccess:v14];
  uint64_t v18 = [(RescueAbandonedPlaceholderOperation *)self outputBlock];
  v19 = (void *)v18;
  if (v18)
  {
    (*(void (**)(uint64_t, BOOL, id))(v18 + 16))(v18, v14, v13);
    [(RescueAbandonedPlaceholderOperation *)self setOutputBlock:0];
  }
}

- (BOOL)_attemptRescueForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v26 = 138412546;
    id v27 = (id)objc_opt_class();
    __int16 v28 = 2112;
    id v29 = v6;
    id v11 = v27;
    LODWORD(v24) = 22;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_12;
    }
    v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v26, v24);
    free(v12);
    SSFileLog();
  }

LABEL_12:
  id v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v6, 0);
  BOOL v14 = [[RestoreDemotedApplicationsOperation alloc] initWithBundleIdentifiers:v13 options:0];
  id v25 = 0;
  [(RescueAbandonedPlaceholderOperation *)self runSubOperation:v14 returningError:&v25];
  id v15 = v25;
  if (!v15) {
    goto LABEL_25;
  }
  unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
  if (!v16)
  {
    unsigned int v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v16 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    v18 &= 2u;
  }
  if (!v18) {
    goto LABEL_23;
  }
  v20 = objc_opt_class();
  int v26 = 138412802;
  id v27 = v20;
  __int16 v28 = 2112;
  id v29 = v6;
  __int16 v30 = 2112;
  id v31 = v15;
  id v21 = v20;
  LODWORD(v24) = 32;
  id v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v26, v24);
    free(v22);
    SSFileLog();
LABEL_23:
  }
LABEL_25:
  if (a4) {
    *a4 = v15;
  }

  return v15 == 0;
}

- (BOOL)_canRescueInstallTypeForBundleID:(id)a3 proxy:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 installType];
  if (v9 != (id)2)
  {
    if (v9 == (id)4)
    {
      v10 = +[SSLogConfig sharedDaemonConfig];
      if (!v10)
      {
        v10 = +[SSLogConfig sharedConfig];
      }
      unsigned int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      id v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v12 &= 2u;
      }
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
LABEL_27:
    int v18 = 0;
    BOOL v19 = 1;
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (![(RescueAbandonedPlaceholderOperation *)self _isRestoreRunning]) {
    goto LABEL_27;
  }
  v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  id v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (!v15) {
    goto LABEL_23;
  }
LABEL_21:
  *(_DWORD *)id v22 = 138412546;
  *(void *)&v22[4] = objc_opt_class();
  *(_WORD *)&v22[12] = 2112;
  *(void *)&v22[14] = v8;
  id v16 = *(id *)&v22[4];
  LODWORD(v21) = 22;
  unsigned int v17 = (void *)_os_log_send_and_compose_impl();

  if (!v17) {
    goto LABEL_24;
  }
  id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
  free(v17);
  SSFileLog();
LABEL_23:

LABEL_24:
  int v18 = SSError();
  BOOL v19 = 0;
  if (a5) {
LABEL_25:
  }
    *a5 = v18;
LABEL_26:

  return v19;
}

- (id)_fetchAppProxyForBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
  if (!v6)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)id v23 = 138412546;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v5;
      id v13 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      unsigned int v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        id v8 = SSError();
        goto LABEL_30;
      }
      int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16]);
      free(v14);
      SSFileLog();
    }

    goto LABEL_17;
  }
  v7 = v6;
  if ([v6 isInstalled] && (objc_msgSend(v7, "isPlaceholder") & 1) == 0)
  {
    int v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      int v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      *(_DWORD *)id v23 = 138412546;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v5;
      id v19 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_29:

        id v8 = SSError();

LABEL_30:
        v7 = 0;
        if (!a4) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      int v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v23, v22, *(void *)v23, *(_OWORD *)&v23[8]);
      free(v20);
      SSFileLog();
    }

    goto LABEL_29;
  }
  id v8 = 0;
  if (a4) {
LABEL_31:
  }
    *a4 = v8;
LABEL_32:

  return v7;
}

- (BOOL)_isRestoreRunning
{
  id v2 = objc_alloc_init((Class)sub_1000E7CCC());
  id v3 = [v2 restoreState];
  BOOL v4 = [v3 state] == 2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end