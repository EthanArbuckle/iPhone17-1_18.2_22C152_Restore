@interface KTSignalIDSOperation
- (KTOperationDependencies)deps;
- (KTSMSelfValidationResult)selfValidationResult;
- (KTSignalIDSOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 selfValidationResult:(id)a6 stateMachine:(id)a7;
- (KTStateMachine)stateMachine;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSelfValidationResult:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation KTSignalIDSOperation

- (KTSignalIDSOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 selfValidationResult:(id)a6 stateMachine:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)KTSignalIDSOperation;
  v17 = [(KTGroupOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_nextState, a5);
    objc_storeStrong((id *)&v18->_selfValidationResult, a6);
    objc_storeStrong((id *)&v18->_stateMachine, a7);
  }

  return v18;
}

- (void)groupStart
{
  v3 = [(KTSignalIDSOperation *)self selfValidationResult];
  [(KTSignalIDSOperation *)self setSelfValidationResult:0];
  uint64_t v4 = [v3 application];
  v5 = (void *)v4;
  v6 = (void *)kKTApplicationIdentifierIDS;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = [(KTSignalIDSOperation *)self deps];
  v9 = [v8 publicKeyStore];
  v10 = [v9 applicationPublicKeyStore:v7];

  v11 = [(KTSignalIDSOperation *)self deps];
  v12 = [v11 stateMonitor];
  unsigned int v13 = [v12 treeStateUnstable:v7 logBeginTime:[v10 patLogBeginningMs]];

  if (v13)
  {
    if (qword_10032F128 != -1) {
      dispatch_once(&qword_10032F128, &stru_1002C6E98);
    }
    id v14 = qword_10032F130;
    if (os_log_type_enabled((os_log_t)qword_10032F130, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "KTSignalIDSOperation skipping repair trigger due to unstable tree state", buf, 2u);
    }
  }
  else
  {
    id v15 = objc_alloc_init((Class)NSOperation);
    [(KTSignalIDSOperation *)self setFinishedOp:v15];

    id v16 = [(KTSignalIDSOperation *)self finishedOp];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v16];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v17 = [(KTSignalIDSOperation *)self deps];
    v18 = [v17 idsOperations];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001CCBC0;
    v19[3] = &unk_1002C6EC0;
    objc_copyWeak(&v20, (id *)buf);
    [v18 triggerIDSCheck:v7 selfValidationResult:v3 complete:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
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

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSelfValidationResult:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_selfValidationResult, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end