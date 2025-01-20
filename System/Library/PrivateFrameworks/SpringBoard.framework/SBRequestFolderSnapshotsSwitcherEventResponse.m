@interface SBRequestFolderSnapshotsSwitcherEventResponse
- (BOOL)isSnapshotRequested;
- (SBRequestFolderSnapshotsSwitcherEventResponse)initWithSnapshotRequest:(BOOL)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (void)setSnapshotRequested:(BOOL)a3;
@end

@implementation SBRequestFolderSnapshotsSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBRequestFolderSnapshotsSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_snapshotRequested withName:@"snapshotRequested"];
  return v4;
}

- (int64_t)type
{
  return 26;
}

- (SBRequestFolderSnapshotsSwitcherEventResponse)initWithSnapshotRequest:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRequestFolderSnapshotsSwitcherEventResponse;
  result = [(SBChainableModifierEventResponse *)&v5 init];
  if (result) {
    result->_snapshotRequested = a3;
  }
  return result;
}

- (BOOL)isSnapshotRequested
{
  return self->_snapshotRequested;
}

- (void)setSnapshotRequested:(BOOL)a3
{
  self->_snapshotRequested = a3;
}

@end