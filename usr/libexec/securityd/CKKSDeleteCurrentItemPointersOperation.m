@interface CKKSDeleteCurrentItemPointersOperation
- (CKKSDeleteCurrentItemPointersOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 accessGroup:(id)a5 identifiers:(id)a6 ckoperationGroup:(id)a7;
- (CKKSKeychainViewState)viewState;
- (CKKSOperationDependencies)deps;
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (CKOperationGroup)ckoperationGroup;
- (NSArray)identifiers;
- (NSString)accessGroup;
- (void)groupStart;
- (void)setAccessGroup:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setDeps:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setModifyRecordsOperation:(id)a3;
@end

@implementation CKKSDeleteCurrentItemPointersOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_modifyRecordsOperation, 0);

  objc_storeStrong((id *)&self->_viewState, 0);
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)identifiers
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 144, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 136, 1);
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(CKKSDeleteCurrentItemPointersOperation *)self deps];
  v4 = [v3 databaseProvider];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100152928;
  v5[3] = &unk_1003053F8;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [v4 dispatchSyncWithSQLTransaction:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CKKSDeleteCurrentItemPointersOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 accessGroup:(id)a5 identifiers:(id)a6 ckoperationGroup:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKKSDeleteCurrentItemPointersOperation;
  v17 = [(CKKSGroupOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_viewState, a4);
    objc_storeStrong((id *)&v18->_accessGroup, a5);
    objc_storeStrong((id *)&v18->_identifiers, a6);
    objc_storeStrong((id *)&v18->_ckoperationGroup, a7);
  }

  return v18;
}

@end