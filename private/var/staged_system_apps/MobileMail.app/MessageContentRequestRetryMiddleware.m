@interface MessageContentRequestRetryMiddleware
+ (id)log;
- (BOOL)_shouldRetry;
- (BOOL)shouldRetryOnNetworkChange;
- (EFCancelationToken)cancellationToken;
- (EFScheduler)retryScheduler;
- (MessageContentRepresentationRequest)contentRequest;
- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 handler:(id)a4;
- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 registry:(id)a4 handler:(id)a5;
- (_MFMessageContentRequestRetryRegistry)registry;
- (id)handler;
- (void)_retry;
- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setCancellationToken:(id)a3;
- (void)setContentRequest:(id)a3;
- (void)setHandler:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setRetryScheduler:(id)a3;
- (void)setShouldRetryOnNetworkChange:(BOOL)a3;
@end

@implementation MessageContentRequestRetryMiddleware

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001338A0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699860 != -1) {
    dispatch_once(&qword_100699860, block);
  }
  v2 = (void *)qword_100699858;

  return v2;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancellationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)MessageContentRequestRetryMiddleware;
  [(MessageContentRequestRetryMiddleware *)&v3 dealloc];
}

- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[_MFMessageContentRequestRetryRegistry sharedRegistry];
  v9 = [(MessageContentRequestRetryMiddleware *)self initWithMessageContentRequest:v6 registry:v8 handler:v7];

  return v9;
}

- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 registry:(id)a4 handler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"MessageContentRequestRetryMiddleware.m", 104, @"Invalid parameter not satisfying: %@", @"contentRequest" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v35 = +[NSAssertionHandler currentHandler];
  [v35 handleFailureInMethod:a2, self, @"MessageContentRequestRetryMiddleware.m", 105, @"Invalid parameter not satisfying: %@", @"registry" object file lineNumber description];

LABEL_3:
  v47.receiver = self;
  v47.super_class = (Class)MessageContentRequestRetryMiddleware;
  v13 = [(MessageContentRequestRetryMiddleware *)&v47 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentRequest, a3);
    objc_storeStrong((id *)&v14->_registry, a4);
    id v15 = objc_retainBlock(v12);
    id handler = v14->_handler;
    v14->_id handler = v15;

    v17 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    cancellationToken = v14->_cancellationToken;
    v14->_cancellationToken = v17;

    v14->_shouldRetryOnNetworkChange = 0;
    uint64_t v19 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.MessageContentRequestRetryScheduler" qualityOfService:25];
    retryScheduler = v14->_retryScheduler;
    v14->_retryScheduler = (EFScheduler *)v19;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    contentRequest = v14->_contentRequest;
    v22 = v14->_cancellationToken;
    v23 = v14->_retryScheduler;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100133F28;
    v44[3] = &unk_100609198;
    objc_copyWeak(&v45, &location);
    id v36 = v12;
    v24 = [(MessageContentRepresentationRequest *)contentRequest onScheduler:v23 addLoadObserver:v44];
    [(EFCancelationToken *)v22 addCancelable:v24];

    v25 = +[MFNetworkController sharedInstance];
    v26 = [v25 networkObservable];
    v27 = [v26 observeOn:v14->_retryScheduler];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100133FBC;
    v42[3] = &unk_1006091C0;
    objc_copyWeak(&v43, &location);
    v28 = [v27 filter:v42];
    v29 = v14->_cancellationToken;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100134038;
    v40[3] = &unk_100607F68;
    objc_copyWeak(&v41, &location);
    v30 = +[EFObserver observerWithResultBlock:v40];
    v31 = [v28 subscribe:v30];
    [(EFCancelationToken *)v29 addCancelable:v31];

    v32 = v14->_cancellationToken;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100134158;
    v37[3] = &unk_100604618;
    id v38 = v11;
    id v39 = v10;
    [(EFCancelationToken *)v32 addCancelationBlock:v37];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    id v12 = v36;
  }

  return v14;
}

- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 ef_match];
    v8 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if ((v8[2](v8, MFMIMEErrorDomain, 2000000) & 1) != 0
      || (uint64_t v9 = EMErrorDomain, (v8[2](v8, EMErrorDomain, 2048) & 1) != 0)
      || (v8[2](v8, v9, 2050) & 1) != 0
      || (v8[2](v8, v9, 2049) & 1) != 0
      || v8[2](v8, v9, 1024))
    {
      [(MessageContentRequestRetryMiddleware *)self setShouldRetryOnNetworkChange:1];
      [(MessageContentRequestRetryMiddleware *)self _retry];
    }
    goto LABEL_8;
  }
  if (v15)
  {
    id v10 = [(MessageContentRequestRetryMiddleware *)self registry];
    id v11 = [(MessageContentRequestRetryMiddleware *)self contentRequest];
    id v12 = [v10 numberOfRetryForContentRepresentation:v11];

    v13 = [(MessageContentRequestRetryMiddleware *)self cancellationToken];
    [v13 cancel];

    if (v12)
    {
      v14 = [(MessageContentRequestRetryMiddleware *)self handler];

      if (v14)
      {
        v8 = [(MessageContentRequestRetryMiddleware *)self handler];
        ((void (*)(void))v8[2])();
LABEL_8:
      }
    }
  }
}

- (void)_retry
{
  if ([(MessageContentRequestRetryMiddleware *)self _shouldRetry])
  {
    objc_super v3 = +[MessageContentRequestRetryMiddleware log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(MessageContentRequestRetryMiddleware *)self contentRequest];
      v5 = [v4 message];
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retrying load of content request for message: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(MessageContentRequestRetryMiddleware *)self registry];
    id v7 = [(MessageContentRequestRetryMiddleware *)self contentRequest];
    [v6 logRetryForContentRequest:v7];

    v8 = [(MessageContentRequestRetryMiddleware *)self contentRequest];
    [v8 retry];
  }
}

- (BOOL)_shouldRetry
{
  objc_super v3 = [(MessageContentRequestRetryMiddleware *)self registry];
  v4 = [(MessageContentRequestRetryMiddleware *)self contentRequest];
  id v5 = [v3 numberOfRetryForContentRepresentation:v4];

  id v6 = +[MFNetworkController sharedInstance];
  unsigned __int8 v7 = [v6 isNetworkUp];

  if ((unint64_t)v5 < 3) {
    return v7;
  }
  else {
    return 0;
  }
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (_MFMessageContentRequestRetryRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (EFCancelationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
}

- (EFScheduler)retryScheduler
{
  return self->_retryScheduler;
}

- (void)setRetryScheduler:(id)a3
{
}

- (BOOL)shouldRetryOnNetworkChange
{
  return self->_shouldRetryOnNetworkChange;
}

- (void)setShouldRetryOnNetworkChange:(BOOL)a3
{
  self->_shouldRetryOnNetworkChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryScheduler, 0);
  objc_storeStrong((id *)&self->_cancellationToken, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_contentRequest, 0);
}

@end