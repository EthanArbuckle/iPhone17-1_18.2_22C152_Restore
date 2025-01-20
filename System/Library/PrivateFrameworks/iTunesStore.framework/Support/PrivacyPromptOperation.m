@interface PrivacyPromptOperation
- (NSString)privacyIdentifier;
- (OS_dispatch_semaphore)privacyPromptSemaphore;
- (PrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3;
- (id)_privacyAcknowledgementURLString;
- (id)completion;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setCompletion:(id)a3;
- (void)setPrivacyIdentifier:(id)a3;
- (void)setPrivacyPromptSemaphore:(id)a3;
@end

@implementation PrivacyPromptOperation

- (PrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PrivacyPromptOperation;
  v6 = [(PrivacyPromptOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privacyIdentifier, a3);
  }

  return v7;
}

- (void)run
{
  int v3 = MKBGetDeviceLockState();
  if (!v3 || v3 == 3)
  {
    v4 = [(PrivacyPromptOperation *)self privacyIdentifier];
    if (!+[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:v4])
    {
      v34 = 0;
      uint64_t v26 = 2;
LABEL_79:

      goto LABEL_80;
    }
    id v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    privacyPromptSemaphore = self->_privacyPromptSemaphore;
    self->_privacyPromptSemaphore = v5;

    *(void *)v80 = 0;
    *(void *)&v80[8] = v80;
    *(void *)&v80[16] = 0x2020000000;
    LOBYTE(v81) = 0;
    id v73 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePrivacyPromptViewController"];
    id v7 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    id v8 = objc_alloc_init((Class)BSMutableSettings);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10012EEF8;
    v75[3] = &unk_1003A69A0;
    v75[4] = self;
    v75[5] = v80;
    id v9 = [objc_alloc((Class)BSAction) initWithInfo:v8 timeout:0 forResponseOnQueue:v75 withHandler:0.0];
    v10 = +[NSSet setWithObject:v9];
    [v7 setActions:v10];
    v71 = v8;
    v72 = v9;
    v74 = v7;

    uint64_t v11 = [(PrivacyPromptOperation *)self _privacyAcknowledgementURLString];
    v12 = (void *)v11;
    if (v4) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    int v14 = !v13;
    HIDWORD(v70) = v14;
    if (!v13)
    {
      v76[0] = @"privacyIdentifier";
      v76[1] = @"privacyAcknowledgementUrlString";
      v77[0] = v4;
      v77[1] = v11;
      v15 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
      [v7 setUserInfo:v15];

      id v16 = +[SBSRemoteAlertHandle newHandleWithDefinition:v73 configurationContext:v7];
      if (v16)
      {
        v17 = +[SSLogConfig sharedDaemonConfig];
        if (!v17)
        {
          v17 = +[SSLogConfig sharedConfig];
        }
        unsigned int v18 = [v17 shouldLog];
        unsigned int v19 = [v17 shouldLogToDisk];
        v20 = [v17 OSLogObject];
        v21 = v20;
        if (v19) {
          v18 |= 2u;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          v18 &= 2u;
        }
        if (v18)
        {
          v22 = objc_opt_class();
          int v78 = 138543362;
          v79 = v22;
          id v23 = v22;
          LODWORD(v70) = 12;
          v69 = &v78;
          v24 = (void *)_os_log_send_and_compose_impl();

          if (!v24)
          {
LABEL_22:

            [v16 addObserver:self];
            [v16 activateWithContext:0];
            dispatch_semaphore_wait((dispatch_semaphore_t)self->_privacyPromptSemaphore, 0xFFFFFFFFFFFFFFFFLL);
            if (!*(unsigned char *)(*(void *)&v80[8] + 24))
            {
              uint64_t v26 = 0;
              goto LABEL_62;
            }
            v25 = +[NSURL URLWithString:v12];
            +[SSPrivacyController acknowledgePrivacyLinkWithIdentifier:v4 URL:v25];
            uint64_t v26 = 1;
LABEL_61:

LABEL_62:
            v34 = 0;
            goto LABEL_78;
          }
          v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v78, v70, v71, v72);
          free(v24);
          v69 = (int *)v21;
          SSFileLog();
        }

        goto LABEL_22;
      }
      v51 = +[SSLogConfig sharedDaemonConfig];
      if (!v51)
      {
        v51 = +[SSLogConfig sharedConfig];
      }
      unsigned int v52 = [v51 shouldLog];
      unsigned int v53 = [v51 shouldLogToDisk];
      v54 = [v51 OSLogObject];
      v55 = v54;
      if (v53) {
        v52 |= 2u;
      }
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        v52 &= 2u;
      }
      if (v52)
      {
        v56 = objc_opt_class();
        int v78 = 138543362;
        v79 = v56;
        id v57 = v56;
        LODWORD(v70) = 12;
        v69 = &v78;
        v58 = (void *)_os_log_send_and_compose_impl();

        if (!v58)
        {
LABEL_75:

          v34 = SSError();
          goto LABEL_77;
        }
        v55 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v78, v70, v71, v72);
        free(v58);
        v69 = (int *)v55;
        SSFileLog();
      }

      goto LABEL_75;
    }
    if (v4)
    {
LABEL_47:
      if (v12)
      {
LABEL_59:
        id v16 = [(PrivacyPromptOperation *)self completion];
        if (v16)
        {
          v25 = SSError();
          uint64_t v26 = 3;
          (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, 3, v25);
          goto LABEL_61;
        }
        v34 = 0;
LABEL_77:
        uint64_t v26 = 3;
LABEL_78:

        _Block_object_dispose(v80, 8);
        if ((v70 & 0x100000000) == 0) {
          goto LABEL_94;
        }
        goto LABEL_79;
      }
      v43 = +[SSLogConfig sharedDaemonConfig];
      if (!v43)
      {
        v43 = +[SSLogConfig sharedConfig];
      }
      unsigned int v44 = objc_msgSend(v43, "shouldLog", v69);
      unsigned int v45 = [v43 shouldLogToDisk];
      v46 = [v43 OSLogObject];
      v47 = v46;
      if (v45) {
        v44 |= 2u;
      }
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        v44 &= 2u;
      }
      if (v44)
      {
        v48 = objc_opt_class();
        int v78 = 138543362;
        v79 = v48;
        id v49 = v48;
        LODWORD(v70) = 12;
        v69 = &v78;
        v50 = (void *)_os_log_send_and_compose_impl();

        if (!v50)
        {
LABEL_58:

          goto LABEL_59;
        }
        v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4, &v78, v70);
        free(v50);
        v69 = (int *)v47;
        SSFileLog();
      }

      goto LABEL_58;
    }
    v35 = +[SSLogConfig sharedDaemonConfig];
    if (!v35)
    {
      v35 = +[SSLogConfig sharedConfig];
    }
    unsigned int v36 = [v35 shouldLog];
    unsigned int v37 = [v35 shouldLogToDisk];
    v38 = [v35 OSLogObject];
    v39 = v38;
    if (v37) {
      v36 |= 2u;
    }
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      v36 &= 2u;
    }
    if (v36)
    {
      v40 = objc_opt_class();
      int v78 = 138543362;
      v79 = v40;
      id v41 = v40;
      LODWORD(v70) = 12;
      v69 = &v78;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42)
      {
LABEL_46:

        goto LABEL_47;
      }
      v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v78, v70, v71, v72);
      free(v42);
      v69 = (int *)v39;
      SSFileLog();
    }

    goto LABEL_46;
  }
  v27 = +[SSLogConfig sharedDaemonConfig];
  if (!v27)
  {
    v27 = +[SSLogConfig sharedConfig];
  }
  unsigned int v28 = [v27 shouldLog];
  if ([v27 shouldLogToDisk]) {
    int v29 = v28 | 2;
  }
  else {
    int v29 = v28;
  }
  v30 = [v27 OSLogObject];
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    v29 &= 2u;
  }
  if (v29)
  {
    *(_DWORD *)v80 = 138543362;
    *(void *)&v80[4] = objc_opt_class();
    id v31 = *(id *)&v80[4];
    LODWORD(v70) = 12;
    v69 = (int *)v80;
    v32 = (void *)_os_log_send_and_compose_impl();

    if (v32)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, v80, v70);
      v33 = (int *)objc_claimAutoreleasedReturnValue();
      free(v32);
      v69 = v33;
      SSFileLog();
    }
  }
  else
  {
  }
  v34 = SSError();
  uint64_t v26 = 3;
LABEL_80:
  -[PrivacyPromptOperation setError:](self, "setError:", v34, v69);
  [(PrivacyPromptOperation *)self setSuccess:(unint64_t)(v26 - 1) < 2];
  v59 = +[SSLogConfig sharedDaemonConfig];
  if (!v59)
  {
    v59 = +[SSLogConfig sharedConfig];
  }
  unsigned int v60 = [v59 shouldLog];
  if ([v59 shouldLogToDisk]) {
    int v61 = v60 | 2;
  }
  else {
    int v61 = v60;
  }
  v62 = [v59 OSLogObject];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
    int v63 = v61;
  }
  else {
    int v63 = v61 & 2;
  }
  if (v63)
  {
    v64 = objc_opt_class();
    id v65 = v64;
    v66 = +[NSNumber numberWithUnsignedInteger:v26];
    *(_DWORD *)v80 = 138543874;
    *(void *)&v80[4] = v64;
    *(_WORD *)&v80[12] = 2114;
    *(void *)&v80[14] = v66;
    *(_WORD *)&v80[22] = 2114;
    v81 = v34;
    LODWORD(v70) = 32;
    v67 = (void *)_os_log_send_and_compose_impl();

    if (!v67) {
      goto LABEL_92;
    }
    v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, v80, v70);
    free(v67);
    SSFileLog();
  }

LABEL_92:
  uint64_t v68 = [(PrivacyPromptOperation *)self completion];
  v4 = (void *)v68;
  if (v68) {
    (*(void (**)(uint64_t, uint64_t, void *))(v68 + 16))(v68, v26, v34);
  }
LABEL_94:
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  LODWORD(v11) = 138543362;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v8 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  int v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    int v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_11;
  }
  *(_DWORD *)BOOL v13 = 138543618;
  *(void *)&v13[4] = objc_opt_class();
  *(_WORD *)&v13[12] = 2114;
  *(void *)&v13[14] = v5;
  id v10 = *(id *)&v13[4];
  LODWORD(v12) = 22;
  long long v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
    free(v11);
    SSFileLog();
LABEL_11:
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (id)_privacyAcknowledgementURLString
{
  id v3 = objc_alloc((Class)ISLoadURLBagOperation);
  v4 = +[SSURLBagContext contextWithBagType:0];
  id v5 = [v3 initWithBagContext:v4];

  id v21 = 0;
  unsigned int v6 = [(PrivacyPromptOperation *)self runSubOperation:v5 returningError:&v21];
  id v7 = v21;
  int v8 = v7;
  if (v6)
  {
    id v9 = [v5 URLBag];
    goto LABEL_17;
  }
  if (v7)
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    BOOL v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v14 = objc_opt_class();
      int v22 = 138543362;
      id v23 = v14;
      id v15 = v14;
      LODWORD(v20) = 12;
      unsigned int v19 = &v22;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      BOOL v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v22, v20);
      free(v16);
      unsigned int v19 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  id v9 = 0;
LABEL_17:
  v17 = objc_msgSend(v9, "valueForKey:", @"privacyAcknowledgementUrl", v19);

  return v17;
}

- (id)completion
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
}

- (OS_dispatch_semaphore)privacyPromptSemaphore
{
  return self->_privacyPromptSemaphore;
}

- (void)setPrivacyPromptSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPromptSemaphore, 0);
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end