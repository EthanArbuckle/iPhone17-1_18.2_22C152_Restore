@interface KTForceSyncKVSOperation
- (KTForceSyncKVSOperation)initWithDependencies:(id)a3 timeout:(unint64_t)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (unint64_t)timeout;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation KTForceSyncKVSOperation

- (KTForceSyncKVSOperation)initWithDependencies:(id)a3 timeout:(unint64_t)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)KTForceSyncKVSOperation;
  v14 = [(KTGroupOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_timeout = a4;
    objc_storeStrong((id *)&v15->_intendedState, a5);
    objc_storeStrong((id *)&v15->_nextState, a6);
  }

  return v15;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(KTForceSyncKVSOperation *)self setFinishedOp:v3];

  if (qword_10032EC60 != -1) {
    dispatch_once(&qword_10032EC60, &stru_1002C30F8);
  }
  v4 = qword_10032EC68;
  if (os_log_type_enabled((os_log_t)qword_10032EC68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "ForceSyncKVS start", buf, 2u);
  }
  v5 = objc_alloc_init(KTResultOperation);
  id v6 = [(KTResultOperation *)v5 timeout:[(KTForceSyncKVSOperation *)self timeout]];
  v7 = [(KTForceSyncKVSOperation *)self finishedOp];
  [(KTResultOperation *)v5 addDependency:v7];

  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v5];
  v8 = [(KTGroupOperation *)self operationQueue];
  [v8 addOperation:v5];

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v9 = [(KTForceSyncKVSOperation *)self deps];
  v10 = [v9 kvs];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10016C458;
  v11[3] = &unk_1002C3160;
  objc_copyWeak(&v12, (id *)buf);
  [v10 forceSync:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
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

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end