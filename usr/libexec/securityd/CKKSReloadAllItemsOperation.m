@interface CKKSReloadAllItemsOperation
- (CKKSOperationDependencies)deps;
- (CKKSReloadAllItemsOperation)init;
- (CKKSReloadAllItemsOperation)initWithOperationDependencies:(id)a3;
- (void)main;
- (void)setDeps:(id)a3;
@end

@implementation CKKSReloadAllItemsOperation

- (void).cxx_destruct
{
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 80, 1);
}

- (void)main
{
  v3 = [(CKKSReloadAllItemsOperation *)self deps];
  v4 = [v3 databaseProvider];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(CKKSReloadAllItemsOperation *)self deps];
  v6 = [v5 activeManagedViews];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10009C458;
        v12[3] = &unk_100305670;
        v12[4] = self;
        v12[5] = v11;
        [v4 dispatchSyncWithSQLTransaction:v12];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (CKKSReloadAllItemsOperation)initWithOperationDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSReloadAllItemsOperation;
  v6 = [(CKKSResultOperation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deps, a3);
  }

  return v7;
}

- (CKKSReloadAllItemsOperation)init
{
  return 0;
}

@end