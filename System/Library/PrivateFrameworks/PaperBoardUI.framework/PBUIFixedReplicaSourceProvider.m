@interface PBUIFixedReplicaSourceProvider
- (NSString)identifier;
- (PBUIFixedReplicaSourceProvider)init;
- (PBUIReplicaPortalSource)portalSource;
- (PBUIReplicaSnapshotSource)snapshotSource;
- (id)registerPortalSourceObserver:(id)a3;
- (id)registerSnapshotSourceObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setPortalSource:(id)a3;
- (void)setSnapshotSource:(id)a3;
@end

@implementation PBUIFixedReplicaSourceProvider

- (PBUIFixedReplicaSourceProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIFixedReplicaSourceProvider;
  v2 = [(PBUIFixedReplicaSourceProvider *)&v6 init];
  if (v2)
  {
    v3 = [[PBUIReplicaSourceObserverBox alloc] initWithIdentifier:@"FixedSourceProvider"];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(PBUIFixedReplicaSourceProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIFixedReplicaSourceProvider;
  [(PBUIFixedReplicaSourceProvider *)&v3 dealloc];
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return [(PBUIReplicaSourceObserverBox *)self->_observers registerSourceObserver:a3];
}

- (id)registerPortalSourceObserver:(id)a3
{
  return [(PBUIReplicaSourceObserverBox *)self->_observers registerSourceObserver:a3];
}

- (void)setPortalSource:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_portalSource, a3);
    [(PBUIReplicaSourceObserverBox *)self->_observers setNeedsSourceUpdate];
  }
}

- (void)setSnapshotSource:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapshotSource, a3);
    [(PBUIReplicaSourceObserverBox *)self->_observers setNeedsSourceUpdate];
  }
}

- (void)invalidate
{
}

- (PBUIReplicaPortalSource)portalSource
{
  return self->_portalSource;
}

- (PBUIReplicaSnapshotSource)snapshotSource
{
  return self->_snapshotSource;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
  objc_storeStrong((id *)&self->_portalSource, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end