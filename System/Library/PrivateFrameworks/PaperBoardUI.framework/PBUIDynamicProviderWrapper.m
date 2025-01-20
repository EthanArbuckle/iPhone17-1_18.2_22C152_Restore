@interface PBUIDynamicProviderWrapper
- (NSString)identifier;
- (PBUIDynamicProviderWrapper)initWithRootObject:(id)a3 portalProvider:(id)a4 snapshotProvider:(id)a5;
- (id)_portalProvider;
- (id)_snapshotProvider;
- (id)portalSourceForReplicaView:(id)a3;
- (id)registerPortalSourceObserver:(id)a3;
- (id)registerSnapshotSourceObserver:(id)a3;
- (id)rootObject;
- (id)snapshotSourceForObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setRootObject:(id)a3;
@end

@implementation PBUIDynamicProviderWrapper

- (void)setRootObject:(id)a3
{
  id v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong(&self->_rootObject, a3);
    portalObserver = self->_portalObserver;
    if (portalObserver)
    {
      [(BSInvalidatable *)portalObserver invalidate];
      v6 = [(PBUIDynamicProviderWrapper *)self _portalProvider];
      v7 = [v6 registerPortalSourceObserver:self->_portalObservers];
      v8 = self->_portalObserver;
      self->_portalObserver = v7;

      [(PBUIReplicaSourceObserverBox *)self->_portalObservers setNeedsSourceUpdate];
    }
    snapshotObserver = self->_snapshotObserver;
    if (snapshotObserver)
    {
      [(BSInvalidatable *)snapshotObserver invalidate];
      v10 = [(PBUIDynamicProviderWrapper *)self _snapshotProvider];
      v11 = [v10 registerSnapshotSourceObserver:self->_snapshotObservers];
      v12 = self->_snapshotObserver;
      self->_snapshotObserver = v11;

      [(PBUIReplicaSourceObserverBox *)self->_snapshotObservers setNeedsSourceUpdate];
    }
  }
}

- (id)snapshotSourceForObserver:(id)a3
{
  id v4 = a3;
  v5 = [(PBUIDynamicProviderWrapper *)self _snapshotProvider];
  v6 = [v5 snapshotSourceForObserver:v4];

  return v6;
}

- (id)_snapshotProvider
{
  if (self->_rootObject)
  {
    makeSnapshotProvider = (void (**)(void))self->_makeSnapshotProvider;
    if (makeSnapshotProvider)
    {
      makeSnapshotProvider[2]();
      makeSnapshotProvider = (void (**)(void))objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    makeSnapshotProvider = 0;
  }
  return makeSnapshotProvider;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  id v4 = a3;
  if (!self->_snapshotObserver)
  {
    v5 = [(PBUIDynamicProviderWrapper *)self _snapshotProvider];
    v6 = [v5 registerSnapshotSourceObserver:self->_snapshotObservers];
    snapshotObserver = self->_snapshotObserver;
    self->_snapshotObserver = v6;
  }
  v8 = [(PBUIReplicaSourceObserverBox *)self->_snapshotObservers registerSourceObserver:v4];

  return v8;
}

- (PBUIDynamicProviderWrapper)initWithRootObject:(id)a3 portalProvider:(id)a4 snapshotProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PBUIDynamicProviderWrapper;
  v12 = [(PBUIDynamicProviderWrapper *)&v23 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_rootObject, a3);
    uint64_t v14 = MEMORY[0x1C1872570](v10);
    id makePortalProvider = v13->_makePortalProvider;
    v13->_id makePortalProvider = (id)v14;

    uint64_t v16 = MEMORY[0x1C1872570](v11);
    id makeSnapshotProvider = v13->_makeSnapshotProvider;
    v13->_id makeSnapshotProvider = (id)v16;

    v18 = [[PBUIReplicaSourceObserverBox alloc] initWithIdentifier:@"DynamicPortalBox"];
    portalObservers = v13->_portalObservers;
    v13->_portalObservers = v18;

    v20 = [[PBUIReplicaSourceObserverBox alloc] initWithIdentifier:@"DynamicSnapshotBox"];
    snapshotObservers = v13->_snapshotObservers;
    v13->_snapshotObservers = v20;
  }
  return v13;
}

- (void)dealloc
{
  [(PBUIDynamicProviderWrapper *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIDynamicProviderWrapper;
  [(PBUIDynamicProviderWrapper *)&v3 dealloc];
}

- (id)_portalProvider
{
  if (self->_rootObject)
  {
    id makePortalProvider = (void (**)(void))self->_makePortalProvider;
    if (makePortalProvider)
    {
      makePortalProvider[2]();
      id makePortalProvider = (void (**)(void))objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id makePortalProvider = 0;
  }
  return makePortalProvider;
}

- (id)registerPortalSourceObserver:(id)a3
{
  id v4 = a3;
  if (!self->_portalObserver)
  {
    v5 = [(PBUIDynamicProviderWrapper *)self _portalProvider];
    v6 = [v5 registerPortalSourceObserver:self->_portalObservers];
    portalObserver = self->_portalObserver;
    self->_portalObserver = v6;
  }
  v8 = [(PBUIReplicaSourceObserverBox *)self->_portalObservers registerSourceObserver:v4];

  return v8;
}

- (id)portalSourceForReplicaView:(id)a3
{
  id v4 = a3;
  v5 = [(PBUIDynamicProviderWrapper *)self _portalProvider];
  v6 = [v5 portalSourceForReplicaView:v4];

  return v6;
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_portalObserver invalidate];
  [(BSInvalidatable *)self->_snapshotObserver invalidate];
  [(PBUIReplicaSourceObserverBox *)self->_portalObservers invalidate];
  snapshotObservers = self->_snapshotObservers;
  [(PBUIReplicaSourceObserverBox *)snapshotObservers invalidate];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)rootObject
{
  return self->_rootObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong(&self->_makeSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_portalObserver, 0);
  objc_storeStrong((id *)&self->_portalObservers, 0);
  objc_storeStrong(&self->_makePortalProvider, 0);
}

@end