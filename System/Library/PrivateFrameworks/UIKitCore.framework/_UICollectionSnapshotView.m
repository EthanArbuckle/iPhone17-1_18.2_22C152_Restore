@interface _UICollectionSnapshotView
- (BOOL)_disableRasterizeInAnimations;
@end

@implementation _UICollectionSnapshotView

- (BOOL)_disableRasterizeInAnimations
{
  return self->_snapshottedViewDisablesRasterizationInAnimations;
}

@end