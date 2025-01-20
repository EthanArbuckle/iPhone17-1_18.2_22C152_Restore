@interface _REMDACalDAVSyncReplicaManagerProvider
+ (id)replicaManagerForAccountID:(id)a3 withStore:(id)a4;
+ (id)unsavedReplicaManagersForAccountIDs:(id)a3;
- (REMStore)store;
- (_REMDACalDAVSyncReplicaManagerProvider)initWithStore:(id)a3;
- (id)replicaManagerForAccountID:(id)a3;
- (id)unsavedReplicaManagersForAccountIDs:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation _REMDACalDAVSyncReplicaManagerProvider

+ (id)replicaManagerForAccountID:(id)a3 withStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79___REMDACalDAVSyncReplicaManagerProvider_replicaManagerForAccountID_withStore___block_invoke;
  v12[3] = &unk_1E61DC9C0;
  id v7 = v5;
  id v13 = v7;
  v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  v9 = (void (**)(void))MEMORY[0x1BA9DBBC0](v12);
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v9[2](v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke;
  v7[3] = &unk_1E61DC9E8;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (_REMDACalDAVSyncReplicaManagerProvider)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMDACalDAVSyncReplicaManagerProvider;
  id v6 = [(_REMDACalDAVSyncReplicaManagerProvider *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)replicaManagerForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(_REMDACalDAVSyncReplicaManagerProvider *)self store];
  id v6 = +[_REMDACalDAVSyncReplicaManagerProvider replicaManagerForAccountID:v4 withStore:v5];

  return v6;
}

- (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  return +[_REMDACalDAVSyncReplicaManagerProvider unsavedReplicaManagersForAccountIDs:a3];
}

- (REMStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end