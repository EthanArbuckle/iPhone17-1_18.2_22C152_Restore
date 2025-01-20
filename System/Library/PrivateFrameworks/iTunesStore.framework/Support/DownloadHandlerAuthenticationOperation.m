@interface DownloadHandlerAuthenticationOperation
- (DownloadHandlerAuthenticationOperation)initWithSessionProperties:(id)a3;
- (DownloadSessionProperties)sessionProperties;
- (NSURLCredential)URLCredential;
- (id)_openSession;
- (id)outputBlock;
- (int64_t)downloadSessionState;
- (void)_setState:(int64_t)a3;
- (void)_setURLCredential:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation DownloadHandlerAuthenticationOperation

- (DownloadHandlerAuthenticationOperation)initWithSessionProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadHandlerAuthenticationOperation;
  v4 = [(DownloadHandlerAuthenticationOperation *)&v6 init];
  if (v4)
  {
    v4->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v4->_sessionProperties = (DownloadSessionProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  semaphore = self->_semaphore;
  if (semaphore) {
    dispatch_release(semaphore);
  }

  v4.receiver = self;
  v4.super_class = (Class)DownloadHandlerAuthenticationOperation;
  [(DownloadHandlerAuthenticationOperation *)&v4 dealloc];
}

- (int64_t)downloadSessionState
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  int64_t state = self->_state;
  [(DownloadHandlerAuthenticationOperation *)self unlock];
  return state;
}

- (id)outputBlock
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(DownloadHandlerAuthenticationOperation *)self unlock];

  return v3;
}

- (DownloadSessionProperties)sessionProperties
{
  id v2 = [(DownloadSessionProperties *)self->_sessionProperties copy];

  return (DownloadSessionProperties *)v2;
}

- (void)setOutputBlock:(id)a3
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  [(DownloadHandlerAuthenticationOperation *)self unlock];
}

- (NSURLCredential)URLCredential
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  id v3 = self->_urlCredential;
  [(DownloadHandlerAuthenticationOperation *)self unlock];
  return v3;
}

- (void)cancel
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  int64_t sessionID = self->_sessionID;
  [(DownloadHandlerAuthenticationOperation *)self unlock];
  if (sessionID) {
    objc_msgSend(+[DownloadHandlerManager handlerManager](DownloadHandlerManager, "handlerManager"), "cancelSessionWithID:", sessionID);
  }
  v4.receiver = self;
  v4.super_class = (Class)DownloadHandlerAuthenticationOperation;
  [(DownloadHandlerAuthenticationOperation *)&v4 cancel];
}

- (void)run
{
  id v3 = +[DownloadHandlerManager handlerManager];
  [v3 addHandlerObserver:self];
  id v4 = 0;
  id v5 = 0;
  while (v5)
  {
LABEL_5:
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    int64_t v10 = [(DownloadHandlerAuthenticationOperation *)self downloadSessionState];
    if (v10)
    {
      if (v10 != 7) {
        goto LABEL_21;
      }
      if (v4)
      {
        [v3 endBackgroundTaskForSessionWithID:v5 identifier:v4];
      }
      [(DownloadHandlerAuthenticationOperation *)self lock];
      self->_int64_t sessionID = 0;
      [(DownloadHandlerAuthenticationOperation *)self unlock];
      +[NSThread sleepForTimeInterval:10.0];
      id v4 = 0;
      id v5 = 0;
    }
  }
  id v6 = [(DownloadHandlerAuthenticationOperation *)self _openSession];
  if (v6)
  {
    v7 = v6;
    [(DownloadHandlerAuthenticationOperation *)self lock];
    id v5 = [v7 sessionID];
    self->_int64_t sessionID = (int64_t)v5;
    [(DownloadHandlerAuthenticationOperation *)self unlock];
    v8 = +[SSWeakReference weakReferenceWithObject:self];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10016A5D4;
    v22[3] = &unk_1003A33A8;
    v22[4] = v8;
    id v4 = [v3 beginBackgroundTaskForSessionWithID:v5 reason:10 expirationBlock:v22];
    id v9 = v4;
    [v3 beginSessionWithID:v5];
    goto LABEL_5;
  }
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11) {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v13 &= 2u;
  }
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    sessionProperties = self->_sessionProperties;
    int v23 = 138412546;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    v26 = sessionProperties;
    LODWORD(v21) = 22;
    v20 = &v23;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v23, v21);
      free(v17);
      v20 = (int *)v18;
      SSFileLog();
    }
  }
  -[DownloadHandlerAuthenticationOperation _setState:](self, "_setState:", 10, v20);
  id v5 = 0;
LABEL_21:
  v19 = [(DownloadHandlerAuthenticationOperation *)self outputBlock];
  if (v19)
  {
    v19[2](v19, [(DownloadHandlerAuthenticationOperation *)self downloadSessionState], [(DownloadHandlerAuthenticationOperation *)self URLCredential]);
    [(DownloadHandlerAuthenticationOperation *)self setOutputBlock:0];
  }
  if (v4)
  {
    [v3 endBackgroundTaskForSessionWithID:v5 identifier:v4];
  }
  [v3 removeHandlerObserver:self];
}

- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  id sessionID = self->_sessionID;
  [(DownloadHandlerAuthenticationOperation *)self unlock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 sessionID] == sessionID)
        {
          id v12 = [v11 sessionState];
          -[DownloadHandlerAuthenticationOperation setError:](self, "setError:", [v11 error]);
          [(DownloadHandlerAuthenticationOperation *)self setSuccess:v12 != (id)8];
          -[DownloadHandlerAuthenticationOperation _setURLCredential:](self, "_setURLCredential:", [v11 URLCredential]);
          [(DownloadHandlerAuthenticationOperation *)self _setState:v12];
          return;
        }
      }
      id v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
}

- (id)_openSession
{
  id v3 = +[DownloadHandlerManager handlerManager];
  id v4 = [(DownloadSessionProperties *)self->_sessionProperties clientIdentifier];
  id result = [v3 openSessionWithProperties:self->_sessionProperties];
  if (result) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v20 = FBSOpenApplicationOptionKeyActivateSuspended;
    uint64_t v21 = &__kCFBooleanTrue;
    unsigned int v7 = [+[SpringBoardUtility sharedInstance](SpringBoardUtility, "sharedInstance") launchApplicationWithIdentifier:v4 options:+[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1] error:0];
    id result = 0;
    if (v7)
    {
      id v8 = +[SSLogConfig sharedDaemonConfig];
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      unsigned int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
        v10 &= 2u;
      }
      if (v10)
      {
        int v16 = 138412546;
        uint64_t v17 = objc_opt_class();
        __int16 v18 = 2112;
        v19 = v4;
        LODWORD(v15) = 22;
        long long v14 = &v16;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          id v12 = (void *)v11;
          long long v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v16, v15);
          free(v12);
          long long v14 = (int *)v13;
          SSFileLog();
        }
      }
      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 10.0, v14);
      return [v3 openSessionWithProperties:self->_sessionProperties];
    }
  }
  return result;
}

- (void)_setState:(int64_t)a3
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  }

  [(DownloadHandlerAuthenticationOperation *)self unlock];
}

- (void)_setURLCredential:(id)a3
{
  [(DownloadHandlerAuthenticationOperation *)self lock];
  urlCredential = self->_urlCredential;
  if (urlCredential != a3)
  {

    self->_urlCredential = (NSURLCredential *)a3;
  }

  [(DownloadHandlerAuthenticationOperation *)self unlock];
}

@end