@interface KTFetchKTSelfOperation
- (KTFetchKTSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTResultOperation)finishedOp;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSString)application;
- (OS_dispatch_queue)uriQueue;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setUriQueue:(id)a3;
@end

@implementation KTFetchKTSelfOperation

- (KTFetchKTSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)KTFetchKTSelfOperation;
  v15 = [(KTGroupOperation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a4);
    objc_storeStrong((id *)&v16->_application, a3);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("FetchKTSelf_URIWaiter", v17);
    [(KTFetchKTSelfOperation *)v16 setUriQueue:v18];
  }
  return v16;
}

- (void)groupStart
{
  id location = 0;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017E28C;
  v10[3] = &unk_1002B72D8;
  objc_copyWeak(&v11, &location);
  v3 = +[KTResultOperation blockOperationWithBlock:v10];
  [(KTFetchKTSelfOperation *)self setFinishedOp:v3];

  v4 = [(KTFetchKTSelfOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(KTFetchKTSelfOperation *)self deps];
  v6 = [v5 smDataStore];
  v7 = [(KTFetchKTSelfOperation *)self application];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017E400;
  v8[3] = &unk_1002B9070;
  objc_copyWeak(&v9, &location);
  [v6 fetchSelfVerificationInfoForApplication:v7 complete:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setApplication:(id)a3
{
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUriQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uriQueue, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end