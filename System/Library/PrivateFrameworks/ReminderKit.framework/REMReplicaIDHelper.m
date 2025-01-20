@interface REMReplicaIDHelper
+ (id)nonEditingReplicaUUID;
+ (id)replicaUUIDForCreation;
- (NSString)crdtID;
- (NSUUID)acquiredReplicaUUID;
- (REMReplicaClockProviding)replicaClockProvider;
- (REMReplicaIDHelper)initWithReplicaIDSource:(id)a3 owner:(id)a4 replicaClockProvider:(id)a5;
- (REMReplicaIDHelperOwner)owner;
- (REMReplicaIDSource)replicaIDSource;
- (REMReplicaManager)replicaManager;
- (REMReplicaManagerProviding)lazilyCachedReplicaManagerProvider;
- (id)clockElementListForReplicaUUID:(id)a3;
- (void)dealloc;
- (void)didSerialize;
- (void)setAcquiredReplicaUUID:(id)a3;
- (void)setLazilyCachedReplicaManagerProvider:(id)a3;
- (void)setOwner:(id)a3;
- (void)setReplicaClockProvider:(id)a3;
- (void)setReplicaIDSource:(id)a3;
- (void)willEdit;
@end

@implementation REMReplicaIDHelper

+ (id)replicaUUIDForCreation
{
  return (id)[MEMORY[0x1E4F29128] UUID];
}

+ (id)nonEditingReplicaUUID
{
  if (nonEditingReplicaUUID_onceToken != -1) {
    dispatch_once(&nonEditingReplicaUUID_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)nonEditingReplicaUUID_replicaUUID;

  return v2;
}

uint64_t __43__REMReplicaIDHelper_nonEditingReplicaUUID__block_invoke()
{
  nonEditingReplicaUUID_replicaUUID = [MEMORY[0x1E4F29128] UUID];

  return MEMORY[0x1F41817F8]();
}

- (REMReplicaIDHelper)initWithReplicaIDSource:(id)a3 owner:(id)a4 replicaClockProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMReplicaIDHelper;
  v12 = [(REMReplicaIDHelper *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeWeak((id *)&v13->_owner, v10);
    objc_storeStrong((id *)&v13->_replicaClockProvider, a5);
  }

  return v13;
}

- (void)dealloc
{
  if (self->_acquiredReplicaUUID)
  {
    v3 = [(REMReplicaIDHelper *)self replicaManager];
    [v3 returnReplicaForClient:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)REMReplicaIDHelper;
  [(REMReplicaIDHelper *)&v4 dealloc];
}

- (void)willEdit
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!self.owner) -- Editting REMReplicaIDHelper without an owner {replicaIDHelper: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)didSerialize
{
  uint64_t v3 = [(REMReplicaIDHelper *)self acquiredReplicaUUID];

  if (v3)
  {
    id v4 = [(REMReplicaIDHelper *)self replicaManager];
    [v4 updateVersionForClient:self];
  }
}

- (REMReplicaManager)replicaManager
{
  uint64_t v3 = [(REMReplicaIDHelper *)self lazilyCachedReplicaManagerProvider];
  if (!v3)
  {
    id v4 = [(REMReplicaIDHelper *)self owner];
    uint64_t v3 = [v4 replicaManagerProvider];

    if (!v3) {
      uint64_t v3 = [[_REMDefaultReplicaManagerProvider alloc] initWithStore:0];
    }
    [(REMReplicaIDHelper *)self setLazilyCachedReplicaManagerProvider:v3];
  }
  v5 = [(REMReplicaIDHelper *)self replicaIDSource];
  v6 = [v5 accountID];
  v7 = [(_REMDefaultReplicaManagerProvider *)v3 replicaManagerForAccountID:v6];

  return (REMReplicaManager *)v7;
}

- (NSString)crdtID
{
  int v2 = [(REMReplicaIDHelper *)self replicaIDSource];
  uint64_t v3 = [v2 crdtID];

  return (NSString *)v3;
}

- (id)clockElementListForReplicaUUID:(id)a3
{
  id v4 = a3;
  v5 = [(REMReplicaIDHelper *)self replicaClockProvider];
  v6 = [v5 clockElementListForReplicaUUID:v4];

  return v6;
}

- (REMReplicaClockProviding)replicaClockProvider
{
  return self->_replicaClockProvider;
}

- (void)setReplicaClockProvider:(id)a3
{
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
}

- (REMReplicaIDHelperOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (REMReplicaIDHelperOwner *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (NSUUID)acquiredReplicaUUID
{
  return self->_acquiredReplicaUUID;
}

- (void)setAcquiredReplicaUUID:(id)a3
{
}

- (REMReplicaManagerProviding)lazilyCachedReplicaManagerProvider
{
  return self->_lazilyCachedReplicaManagerProvider;
}

- (void)setLazilyCachedReplicaManagerProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazilyCachedReplicaManagerProvider, 0);
  objc_storeStrong((id *)&self->_acquiredReplicaUUID, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);

  objc_storeStrong((id *)&self->_replicaClockProvider, 0);
}

@end