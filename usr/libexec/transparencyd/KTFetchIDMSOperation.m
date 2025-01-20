@interface KTFetchIDMSOperation
- (KTFetchIDMSOperation)initWithDependencies:(id)a3 specificUser:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTSpecificUser)specificUser;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSpecificUser:(id)a3;
@end

@implementation KTFetchIDMSOperation

- (KTFetchIDMSOperation)initWithDependencies:(id)a3 specificUser:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KTFetchIDMSOperation;
  v15 = [(KTGroupOperation *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_specificUser, a4);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
    v17 = v16;
  }

  return v16;
}

- (void)groupStart
{
  v3 = [(KTFetchIDMSOperation *)self specificUser];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSOperation);
    [(KTFetchIDMSOperation *)self setFinishedOp:v4];

    v5 = objc_alloc_init(KTResultOperation);
    id v6 = [(KTResultOperation *)v5 timeout:30000000000];
    v7 = [(KTFetchIDMSOperation *)self finishedOp];
    [(KTResultOperation *)v5 addDependency:v7];

    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v5];
    v8 = [(KTGroupOperation *)self operationQueue];
    [v8 addOperation:v5];

    id location = 0;
    objc_initWeak(&location, self);
    v9 = [(KTFetchIDMSOperation *)self deps];
    v10 = [v9 idmsOperations];
    id v11 = [(KTFetchIDMSOperation *)self specificUser];
    id v12 = [v11 altDSID];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001951FC;
    v14[3] = &unk_1002C49D0;
    objc_copyWeak(&v15, &location);
    [v10 refreshDeviceList:v12 complete:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = +[NSError errorWithDomain:kTransparencyErrorInternal code:-392 userInfo:0];
    [(KTResultOperation *)self setError:v13];
  }
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpecificUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end