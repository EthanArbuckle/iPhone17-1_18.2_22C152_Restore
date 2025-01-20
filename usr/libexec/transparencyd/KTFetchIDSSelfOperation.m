@interface KTFetchIDSSelfOperation
+ (id)lastSelfIDSFetch:(id)a3;
- (KTFetchIDSSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (NSString)application;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFetchIDSSelfOperation

- (KTFetchIDSSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTFetchIDSSelfOperation;
  v15 = [(KTGroupOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a4);
    objc_storeStrong((id *)&v16->_application, a3);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
  }

  return v16;
}

+ (id)lastSelfIDSFetch:(id)a3
{
  v3 = [a3 smDataStore];
  v4 = [v3 getSettingsDate:@"KTIDSLastSelfFetch"];

  return v4;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(KTFetchIDSSelfOperation *)self setFinishedOp:v3];

  v4 = [(KTFetchIDSSelfOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(KTFetchIDSSelfOperation *)self deps];
  v6 = [v5 idsOperations];
  v7 = [(KTFetchIDSSelfOperation *)self application];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C0A64;
  v8[3] = &unk_1002C64B0;
  objc_copyWeak(&v9, &location);
  [v6 fetchSelfVerificationInfo:v7 completionBlock:v8];

  objc_destroyWeak(&v9);
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end