@interface KTConfigBagFetchOperation
- (KTConfigBagFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 triggerInterface:(id)a6;
- (KTOperationDependencies)deps;
- (KTSMTriggerInterface)triggerInterface;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setTriggerInterface:(id)a3;
@end

@implementation KTConfigBagFetchOperation

- (KTConfigBagFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 triggerInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTConfigBagFetchOperation;
  v15 = [(KTGroupOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_triggerInterface, a6);
  }

  return v16;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(KTConfigBagFetchOperation *)self setFinishedOp:v3];

  v4 = [(KTConfigBagFetchOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(KTConfigBagFetchOperation *)self deps];
  v6 = [v5 logClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100195694;
  v7[3] = &unk_1002C3160;
  objc_copyWeak(&v8, &location);
  [v6 configureFromNetwork:v7];

  objc_destroyWeak(&v8);
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTriggerInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerInterface, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end