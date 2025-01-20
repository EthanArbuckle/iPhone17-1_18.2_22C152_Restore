@interface NRGFullSyncRequestOperation
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)requestExecuting;
- (BOOL)requestFinished;
- (BOOL)shouldReset;
- (NRGCompanionDaemon)daemon;
- (NRGFullSyncRequestOperation)init;
- (NRGFullSyncRequestOperation)initWithRequest:(id)a3;
- (NRGPBFullSyncRequest)request;
- (NSArray)iconVariants;
- (NSError)error;
- (_opaque_pthread_mutex_t)requestLock;
- (id)completionHandler;
- (id)requestSentHandler;
- (void)destroy;
- (void)handleFullSyncResponse:(id)a3 url:(id)a4 iconVersionTracker:(id)a5;
- (void)main;
- (void)requestComplete:(id)a3 error:(id)a4;
- (void)requestSent:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setError:(id)a3;
- (void)setIconVariants:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestExecuting:(BOOL)a3;
- (void)setRequestFinished:(BOOL)a3;
- (void)setRequestLock:(_opaque_pthread_mutex_t *)a3;
- (void)setRequestSentHandler:(id)a3;
- (void)setShouldReset:(BOOL)a3;
- (void)start;
- (void)withLock:(id)a3;
@end

@implementation NRGFullSyncRequestOperation

- (NRGFullSyncRequestOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRGFullSyncRequestOperation;
  v6 = [(NRGFullSyncRequestOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v7->_requestExecuting = 0;
    v7->_requestFinished = 0;
    pthread_mutex_init(&v7->_requestLock, 0);
  }

  return v7;
}

- (NRGFullSyncRequestOperation)init
{
  return [(NRGFullSyncRequestOperation *)self initWithRequest:0];
}

- (void)destroy
{
}

- (void)withLock:(id)a3
{
  p_requestLock = &self->_requestLock;
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(p_requestLock);
  v4[2](v4);

  pthread_mutex_unlock(p_requestLock);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  if ([(NRGFullSyncRequestOperation *)self isCancelled])
  {
    [(NRGFullSyncRequestOperation *)self willChangeValueForKey:@"isFinished"];
    [(NRGFullSyncRequestOperation *)self setRequestFinished:1];
    [(NRGFullSyncRequestOperation *)self didChangeValueForKey:@"isFinished"];
    id v3 = +[NRGFullSyncError errorWithCode:1 description:@"operation cancelled"];
    [(NRGFullSyncRequestOperation *)self requestComplete:0 error:v3];
  }
  else
  {
    [(NRGFullSyncRequestOperation *)self willChangeValueForKey:@"isExecuting"];
    +[NSThread detachNewThreadSelector:"main" toTarget:self withObject:0];
    [(NRGFullSyncRequestOperation *)self setRequestExecuting:1];
    [(NRGFullSyncRequestOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (void)setIconVariants:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011328;
  v4[3] = &unk_100020658;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRGFullSyncRequestOperation *)v5 withLock:v4];
}

- (void)setRequestSentHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011408;
  v4[3] = &unk_100020B00;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRGFullSyncRequestOperation *)v5 withLock:v4];
}

- (void)setCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000114E8;
  v4[3] = &unk_100020B00;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRGFullSyncRequestOperation *)v5 withLock:v4];
}

- (void)main
{
  if (!self->_request)
  {
    id v3 = (NRGPBFullSyncRequest *)objc_opt_new();
    request = self->_request;
    self->_request = v3;

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000116FC;
    v12[3] = &unk_1000205E0;
    v12[4] = self;
    [(NRGFullSyncRequestOperation *)self withLock:v12];
  }
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v6 = self->_request;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011814;
  v9[3] = &unk_100020A88;
  objc_copyWeak(&v10, &location);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011908;
  v7[3] = &unk_100020B28;
  objc_copyWeak(&v8, &location);
  [WeakRetained sendFullSyncRequest:v6 requestHandler:v9 responseHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)handleFullSyncResponse:(id)a3 url:(id)a4 iconVersionTracker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = nrg_daemon_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received full sync response for %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if ([(NRGFullSyncRequestOperation *)self shouldReset]) {
    [v10 reset];
  }
  v12 = [[NRGIconCatalog alloc] initWithURL:v9 readonly:1];
  v13 = NRGGetActivePairedDeviceStorePath();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100011CE4;
  v18[3] = &unk_100020B50;
  p_long long buf = &buf;
  id v14 = v10;
  id v19 = v14;
  id v15 = v13;
  id v20 = v15;
  [(NRGIconCatalog *)v12 readIcons:v18];
  if (*(void *)(*((void *)&buf + 1) + 24))
  {
    [v14 commit];
    v16 = nrg_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)v22 = 134218242;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "found %ld icons in %@", v22, 0x16u);
    }
  }
  else
  {
    v16 = nrg_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000153B0((uint64_t)v9, v16);
    }
  }

  [(NRGFullSyncRequestOperation *)self requestComplete:v8 error:0];
  _Block_object_dispose(&buf, 8);
}

- (void)requestSent:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nrg_daemon_log();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100015428();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "full sync request %{public}@ sent successfully", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012004;
  v11[3] = &unk_100020658;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(NRGFullSyncRequestOperation *)self withLock:v11];
}

- (void)requestComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nrg_daemon_log();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100015490();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "full sync request %{public}@ complete", buf, 0xCu);
  }

  [(NRGFullSyncRequestOperation *)self setError:v7];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100012270;
  v16 = &unk_100020658;
  uint64_t v17 = self;
  id v18 = v7;
  id v10 = v7;
  [(NRGFullSyncRequestOperation *)self withLock:&v13];
  unsigned int v11 = [(NRGFullSyncRequestOperation *)self requestExecuting];
  unsigned __int8 v12 = [(NRGFullSyncRequestOperation *)self requestFinished];
  if ((v12 & 1) == 0) {
    [(NRGFullSyncRequestOperation *)self willChangeValueForKey:@"isFinished"];
  }
  if (v11)
  {
    [(NRGFullSyncRequestOperation *)self willChangeValueForKey:@"isExecuting"];
    [(NRGFullSyncRequestOperation *)self setRequestExecuting:0];
    [(NRGFullSyncRequestOperation *)self setRequestFinished:1];
    [(NRGFullSyncRequestOperation *)self didChangeValueForKey:@"isExecuting"];
    if (v12) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [(NRGFullSyncRequestOperation *)self setRequestExecuting:0];
  [(NRGFullSyncRequestOperation *)self setRequestFinished:1];
  if ((v12 & 1) == 0) {
LABEL_12:
  }
    [(NRGFullSyncRequestOperation *)self didChangeValueForKey:@"isFinished"];
LABEL_13:
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NRGCompanionDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (NRGCompanionDaemon *)WeakRetained;
}

- (void)setDaemon:(id)a3
{
}

- (NSArray)iconVariants
{
  return self->_iconVariants;
}

- (BOOL)shouldReset
{
  return self->_shouldReset;
}

- (void)setShouldReset:(BOOL)a3
{
  self->_shouldReset = a3;
}

- (id)requestSentHandler
{
  return self->_requestSentHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)requestExecuting
{
  return self->_requestExecuting;
}

- (void)setRequestExecuting:(BOOL)a3
{
  self->_requestExecuting = a3;
}

- (BOOL)requestFinished
{
  return self->_requestFinished;
}

- (void)setRequestFinished:(BOOL)a3
{
  self->_requestFinished = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setError:(id)a3
{
}

- (_opaque_pthread_mutex_t)requestLock
{
  long long v3 = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setRequestLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__opaque[40];
  long long v5 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_requestLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_requestLock.__opaque[40] = v3;
  *(_OWORD *)&self->_requestLock.__sig = v5;
  *(_OWORD *)&self->_requestLock.__opaque[8] = v4;
}

- (NRGPBFullSyncRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_requestSentHandler, 0);
  objc_storeStrong((id *)&self->_iconVariants, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end