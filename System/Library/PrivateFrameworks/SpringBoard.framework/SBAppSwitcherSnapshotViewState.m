@interface SBAppSwitcherSnapshotViewState
@end

@implementation SBAppSwitcherSnapshotViewState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheEntry, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end