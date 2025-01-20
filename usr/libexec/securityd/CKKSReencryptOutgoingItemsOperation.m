@interface CKKSReencryptOutgoingItemsOperation
- (CKKSKeychainView)ckks;
- (CKKSOperationDependencies)deps;
- (CKKSReencryptOutgoingItemsOperation)init;
- (CKKSReencryptOutgoingItemsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 holdOperation:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSReencryptOutgoingItemsOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ckks);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setCkks:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckks);

  return (CKKSKeychainView *)WeakRetained;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)main
{
  v3 = [(CKKSReencryptOutgoingItemsOperation *)self deps];
  v4 = [v3 databaseProvider];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B057C;
  v5[3] = &unk_100306A88;
  v5[4] = self;
  [v4 dispatchSyncWithSQLTransaction:v5];
}

- (CKKSReencryptOutgoingItemsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 holdOperation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSReencryptOutgoingItemsOperation;
  v15 = [(CKKSResultOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    [(CKKSReencryptOutgoingItemsOperation *)v16 addNullableDependency:v14];
  }

  return v16;
}

- (CKKSReencryptOutgoingItemsOperation)init
{
  return 0;
}

@end