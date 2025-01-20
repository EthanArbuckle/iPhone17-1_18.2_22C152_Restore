@interface _REMDefaultReplicaManagerProvider
- (BOOL)isEqual:(id)a3;
- (REMStore)store;
- (_REMDefaultReplicaManagerProvider)initWithStore:(id)a3;
- (id)replicaManagerForAccountID:(id)a3;
- (id)unsavedReplicaManagersForAccountIDs:(id)a3;
@end

@implementation _REMDefaultReplicaManagerProvider

- (_REMDefaultReplicaManagerProvider)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMDefaultReplicaManagerProvider;
  v6 = [(_REMDefaultReplicaManagerProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)replicaManagerForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(_REMDefaultReplicaManagerProvider *)self store];
  v6 = +[REMReplicaManager replicaManagerForAccountID:v4 store:v5];

  return v6;
}

- (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  v3 = +[REMReplicaManager unsavedReplicaManagersForAccountIDs:a3];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_REMDefaultReplicaManagerProvider *)self store];
    v6 = [v4 store];
    if (v5 == v6)
    {
      char v9 = 1;
      v6 = v5;
    }
    else
    {
      v7 = [(_REMDefaultReplicaManagerProvider *)self store];
      v8 = [v4 store];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end