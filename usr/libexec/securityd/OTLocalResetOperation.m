@interface OTLocalResetOperation
- (NSOperation)finishedOp;
- (OTLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTLocalResetOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon-local-reset");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting local cuttlefish", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTLocalResetOperation *)self setFinishedOp:v4];

  v5 = [(OTLocalResetOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v6 = [(OTLocalResetOperation *)self deps];
  v7 = [v6 cuttlefishXPCWrapper];
  v8 = [(OTLocalResetOperation *)self deps];
  v9 = [v8 activeAccount];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100040390;
  v10[3] = &unk_100307258;
  objc_copyWeak(&v11, (id *)buf);
  [v7 localResetWithSpecificUser:v9 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (OTLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTLocalResetOperation;
  v12 = [(CKKSGroupOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
    objc_storeStrong((id *)&v13->_deps, a3);
  }

  return v13;
}

@end