@interface _SBAppSwitcherSnapshotImageCacheRequest
- (BOOL)loadFullSizeSnapshot;
- (NSString)description;
- (SBAppLayout)appLayout;
- (SBDisplayItem)displayItem;
- (XBApplicationSnapshot)snapshot;
- (_SBAppSwitcherSnapshotImageCacheRequest)initWithSequenceID:(unint64_t)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)sequenceID;
- (void)setAppLayout:(id)a3;
- (void)setDisplayItem:(id)a3;
- (void)setLoadFullSizeSnapshot:(BOOL)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation _SBAppSwitcherSnapshotImageCacheRequest

- (_SBAppSwitcherSnapshotImageCacheRequest)initWithSequenceID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBAppSwitcherSnapshotImageCacheRequest;
  result = [(_SBAppSwitcherSnapshotImageCacheRequest *)&v5 init];
  if (result) {
    result->_sequenceID = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(_SBAppSwitcherSnapshotImageCacheRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBAppSwitcherSnapshotImageCacheRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(_SBAppSwitcherSnapshotImageCacheRequest *)self displayItem];
  objc_super v5 = [v4 uniqueIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"displayID"];

  v7 = [(_SBAppSwitcherSnapshotImageCacheRequest *)self snapshot];
  id v8 = (id)[v3 appendObject:v7 withName:@"snapshot"];

  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[_SBAppSwitcherSnapshotImageCacheRequest sequenceID](self, "sequenceID"), @"sequenceID");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBAppSwitcherSnapshotImageCacheRequest loadFullSizeSnapshot](self, "loadFullSizeSnapshot"), @"loadFullSizeSnapshot");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBAppSwitcherSnapshotImageCacheRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (BOOL)loadFullSizeSnapshot
{
  return self->_loadFullSizeSnapshot;
}

- (void)setLoadFullSizeSnapshot:(BOOL)a3
{
  self->_loadFullSizeSnapshot = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end