@interface RemoteWebViewOperation
- (BOOL)didActivate;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)alertSemaphore;
- (RemoteWebViewOperation)initWithWebViewRequest:(id)a3;
- (SSRemoteWebViewRequest)request;
- (id)activationHandler;
- (void)_sendActivationWithError:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setActivationHandler:(id)a3;
- (void)setAlertSemaphore:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation RemoteWebViewOperation

- (RemoteWebViewOperation)initWithWebViewRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RemoteWebViewOperation;
  v6 = [(RemoteWebViewOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstored.RemoteWebView", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)run
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
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
    id v8 = v7;
    v9 = [(RemoteWebViewOperation *)self request];
    v10 = [v9 URLString];
    int v44 = 138543618;
    v45 = v7;
    __int16 v46 = 2114;
    v47 = v10;
    LODWORD(v41) = 22;
    v40 = &v44;
    objc_super v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v44, v41);
    free(v11);
    v40 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  alertSemaphore = self->_alertSemaphore;
  self->_alertSemaphore = v12;

  id v14 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServiceWebViewPromptViewController"];
  id v15 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v42[0] = @"referrer";
  v16 = [(RemoteWebViewOperation *)self request];
  uint64_t v17 = [v16 referrer];
  v18 = (void *)v17;
  if (v17) {
    CFStringRef v19 = (const __CFString *)v17;
  }
  else {
    CFStringRef v19 = &stru_1003B9B00;
  }
  v42[1] = @"URLString";
  v43[0] = v19;
  v20 = [(RemoteWebViewOperation *)self request];
  uint64_t v21 = [v20 URLString];
  v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_1003B9B00;
  }
  v43[1] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v15 setUserInfo:v24];

  id v25 = +[SBSRemoteAlertHandle newHandleWithDefinition:v14 configurationContext:v15];
  v26 = v25;
  if (v25)
  {
    [v25 addObserver:self];
    [v26 activateWithContext:0];
    v27 = [(RemoteWebViewOperation *)self alertSemaphore];
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v34 = SSError();
    if (v34)
    {
      v33 = (void *)v34;
      v28 = +[SSLogConfig sharedDaemonConfig];
      if (!v28)
      {
        v28 = +[SSLogConfig sharedConfig];
      }
      unsigned int v35 = [v28 shouldLog];
      if ([v28 shouldLogToDisk]) {
        int v36 = v35 | 2;
      }
      else {
        int v36 = v35;
      }
      v30 = [v28 OSLogObject];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        v36 &= 2u;
      }
      if (v36)
      {
        v37 = objc_opt_class();
        int v44 = 138543618;
        v45 = v37;
        __int16 v46 = 2114;
        v47 = v33;
        id v38 = v37;
        LODWORD(v41) = 22;
        v39 = (void *)_os_log_send_and_compose_impl();

        if (!v39) {
          goto LABEL_31;
        }
        v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v44, v41);
        free(v39);
        SSFileLog();
      }
      goto LABEL_30;
    }
  }
  v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28)
  {
    v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    v29 |= 2u;
  }
  v30 = [v28 OSLogObject];
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    v29 &= 2u;
  }
  if (!v29)
  {
LABEL_29:
    v33 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v31 = objc_opt_class();
  int v44 = 138543362;
  v45 = v31;
  id v32 = v31;
  LODWORD(v41) = 12;
  v33 = (void *)_os_log_send_and_compose_impl();

  if (v33)
  {
    v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v44, v41);
    free(v33);
    SSFileLog();
    goto LABEL_29;
  }
LABEL_31:

  [(RemoteWebViewOperation *)self setError:v33];
  [(RemoteWebViewOperation *)self setSuccess:1];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  unsigned int v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    unsigned int v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
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
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  [(RemoteWebViewOperation *)self _sendActivationWithError:0];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  unsigned int v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    unsigned int v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
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
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  [(RemoteWebViewOperation *)self _sendActivationWithError:0];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
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
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_11;
  }
  *(_DWORD *)v13 = 138543618;
  *(void *)&v13[4] = objc_opt_class();
  *(_WORD *)&v13[12] = 2114;
  *(void *)&v13[14] = v5;
  id v10 = *(id *)&v13[4];
  LODWORD(v12) = 22;
  long long v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
    free(v11);
    SSFileLog();
LABEL_11:
  }
  [(RemoteWebViewOperation *)self _sendActivationWithError:v5];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
}

- (void)_sendActivationWithError:(id)a3
{
  unsigned int v4 = [(RemoteWebViewOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015FEF0;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (SSRemoteWebViewRequest)request
{
  return self->_request;
}

- (OS_dispatch_semaphore)alertSemaphore
{
  return self->_alertSemaphore;
}

- (void)setAlertSemaphore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_alertSemaphore, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_activationHandler, 0);
}

@end