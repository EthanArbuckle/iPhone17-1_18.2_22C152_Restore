@interface CKKSLocalSynchronizeOperation
- (CKKSKeychainView)ckks;
- (CKKSLocalSynchronizeOperation)init;
- (CKKSLocalSynchronizeOperation)initWithCKKSKeychainView:(id)a3 operationDependencies:(id)a4;
- (CKKSOperationDependencies)deps;
- (int)restartCount;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setRestartCount:(int)a3;
@end

@implementation CKKSLocalSynchronizeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 4), 0);

  objc_destroyWeak((id *)(&self->_restartCount + 1));
}

- (void)setRestartCount:(int)a3
{
  self->_restartCount = a3;
}

- (int)restartCount
{
  return self->_restartCount;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140, 1);
}

- (void)setCkks:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->_restartCount + 1));

  return (CKKSKeychainView *)WeakRetained;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [(CKKSLocalSynchronizeOperation *)self ckks];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009B8C4;
  v4[3] = &unk_1002F8B88;
  v4[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  objc_copyWeak(&v6, &location);
  [v3 dispatchSyncWithSQLTransaction:v4];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

- (CKKSLocalSynchronizeOperation)initWithCKKSKeychainView:(id)a3 operationDependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSLocalSynchronizeOperation;
  v8 = [(CKKSGroupOperation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
    v10 = [v6 holdLocalSynchronizeOperation];
    [v9 addNullableDependency:v10];
  }
  return (CKKSLocalSynchronizeOperation *)v9;
}

- (CKKSLocalSynchronizeOperation)init
{
  return 0;
}

@end