@interface SBAppSwitcherSnapshotCacheEntry
- (BOOL)_matchesAppLayout:(id)a3 displayItem:(id)a4;
- (BOOL)fromFullSizeSnapshotRequest;
- (BOOL)needsUpdate;
- (SBAppLayout)appLayout;
- (SBDisplayItem)displayItem;
- (UIImage)snapshotImage;
- (XBApplicationSnapshot)snapshot;
- (id)description;
- (int64_t)role;
- (void)setAppLayout:(id)a3;
- (void)setDisplayItem:(id)a3;
- (void)setFromFullSizeSnapshotRequest:(BOOL)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setSnapshot:(id)a3;
- (void)setSnapshotImage:(id)a3;
@end

@implementation SBAppSwitcherSnapshotCacheEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_appLayout withName:@"appLayout" skipIfNil:0];
  id v5 = (id)[v3 appendObject:self->_displayItem withName:@"displayItem" skipIfNil:0];
  id v6 = (id)[v3 appendObject:self->_snapshot withName:@"snapshot" skipIfNil:0];
  id v7 = (id)[v3 appendObject:self->_snapshotImage withName:@"snapshotImage" skipIfNil:0];
  id v8 = (id)[v3 appendBool:self->_fromFullSizeSnapshotRequest withName:@"fromFullSizeSnapshot"];
  id v9 = (id)[v3 appendBool:self->_needsUpdate withName:@"needsUpdate"];
  v10 = [v3 build];

  return v10;
}

- (int64_t)role
{
  v3 = [(SBAppSwitcherSnapshotCacheEntry *)self appLayout];
  id v4 = [(SBAppSwitcherSnapshotCacheEntry *)self displayItem];
  int64_t v5 = [v3 layoutRoleForItem:v4];

  return v5;
}

- (BOOL)_matchesAppLayout:(id)a3 displayItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBAppSwitcherSnapshotCacheEntry *)self appLayout];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = [(SBAppSwitcherSnapshotCacheEntry *)self displayItem];
    char v11 = [v10 isEqual:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void)setDisplayItem:(id)a3
{
}

- (XBApplicationSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
}

- (BOOL)fromFullSizeSnapshotRequest
{
  return self->_fromFullSizeSnapshotRequest;
}

- (void)setFromFullSizeSnapshotRequest:(BOOL)a3
{
  self->_fromFullSizeSnapshotRequest = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotImage, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end