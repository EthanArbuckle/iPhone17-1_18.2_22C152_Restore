@interface CKKSFixupFetchAllTLKShares
- (CKKSFixupFetchAllTLKShares)initWithOperationDependencies:(id)a3 ckoperationGroup:(id)a4;
- (CKKSOperationDependencies)deps;
- (CKOperationGroup)group;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setGroup:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSFixupFetchAllTLKShares

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setGroup:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
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
  v3 = [(CKKSFixupFetchAllTLKShares *)self deps];
  v4 = [v3 databaseProvider];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(CKKSFixupFetchAllTLKShares *)self deps];
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
        v12[2] = sub_10015F4DC;
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

- (id)description
{
  v2 = [(CKKSFixupFetchAllTLKShares *)self deps];
  v3 = [v2 views];
  v4 = +[NSString stringWithFormat:@"<CKKSFixup:FetchAllTLKShares (%@)>", v3];

  return v4;
}

- (CKKSFixupFetchAllTLKShares)initWithOperationDependencies:(id)a3 ckoperationGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSFixupFetchAllTLKShares;
  uint64_t v9 = [(CKKSGroupOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    objc_storeStrong((id *)&v10->_group, a4);
    objc_storeStrong((id *)&v10->_intendedState, @"fixup_local_reload");
    objc_storeStrong((id *)&v10->_nextState, @"error");
  }

  return v10;
}

@end