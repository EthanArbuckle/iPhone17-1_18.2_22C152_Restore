@interface TabSnapshotCacheEntry
- (BOOL)fitsInCache;
- (BOOL)isGroup;
- (BOOL)isPendingUpdate;
- (BOOL)isUpdatingState;
- (BOOL)stateUpdateCancelled;
- (NSMutableSet)groupMembers;
- (NSUUID)identifier;
- (TabSnapshotCacheEntry)initWithIdentifier:(id)a3 isGroup:(BOOL)a4;
- (TabSnapshotCacheEntryStateObserving)stateObserver;
- (UIImage)snapshot;
- (id)debugDescription;
- (int64_t)state;
- (void)setFitsInCache:(BOOL)a3;
- (void)setSnapshot:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateObserver:(id)a3;
- (void)setStateUpdateCancelled:(BOOL)a3;
- (void)setUpdatingState:(BOOL)a3;
@end

@implementation TabSnapshotCacheEntry

- (void)setStateObserver:(id)a3
{
}

- (TabSnapshotCacheEntry)initWithIdentifier:(id)a3 isGroup:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TabSnapshotCacheEntry;
  v8 = [(TabSnapshotCacheEntry *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_group = v4;
    if (v4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
      groupMembers = v9->_groupMembers;
      v9->_groupMembers = (NSMutableSet *)v10;
    }
    v9->_state = 0;
    v12 = v9;
  }

  return v9;
}

- (void)setStateUpdateCancelled:(BOOL)a3
{
  self->_stateUpdateCancelled = a3;
}

- (id)debugDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  identifier = self->_identifier;
  snapshot = self->_snapshot;
  unint64_t state = self->_state;
  if (state > 3) {
    v9 = @"Empty";
  }
  else {
    v9 = off_1E6D7F2D0[state];
  }
  if (self->_updatingState) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_stateUpdateCancelled) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if (self->_group) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = v11;
  objc_super v14 = v10;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = %@; snapshot = %@; unint64_t state = %@; isUpdatingState = %@; stateUpdateCancelled = %@; isGroup = %@>",
    v5,
    self,
    identifier,
    snapshot,
    v9,
    v14,
    v13,
  v15 = v12);

  return v15;
}

- (BOOL)stateUpdateCancelled
{
  return self->_stateUpdateCancelled;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_unint64_t state = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
    [WeakRetained tabSnapshotCacheEntryDidUpdateState:self];
  }
}

- (void)setUpdatingState:(BOOL)a3
{
  if (self->_updatingState != a3)
  {
    self->_updatingState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
    [WeakRetained tabSnapshotCacheEntryDidUpdateState:self];
  }
}

- (BOOL)isPendingUpdate
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 3) < 2) {
    return 0;
  }
  if (state == 1) {
    return self->_updatingState;
  }
  return 1;
}

- (void)setFitsInCache:(BOOL)a3
{
  self->_fitsInCache = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isGroup
{
  return self->_group;
}

- (BOOL)fitsInCache
{
  return self->_fitsInCache;
}

- (BOOL)isUpdatingState
{
  return self->_updatingState;
}

- (int64_t)state
{
  return self->_state;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (NSMutableSet)groupMembers
{
  return self->_groupMembers;
}

- (void)setSnapshot:(id)a3
{
}

- (TabSnapshotCacheEntryStateObserving)stateObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
  return (TabSnapshotCacheEntryStateObserving *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateObserver);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_groupMembers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end