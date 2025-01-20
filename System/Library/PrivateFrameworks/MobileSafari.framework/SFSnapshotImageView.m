@interface SFSnapshotImageView
- (BOOL)isTransparentFocusItem;
@end

@implementation SFSnapshotImageView

- (BOOL)isTransparentFocusItem
{
  if ([(SFSnapshotImageView *)self isHidden]) {
    return 1;
  }
  [(SFSnapshotImageView *)self alpha];
  if (v3 < 0.01) {
    return 1;
  }
  v5 = [(SFSnapshotImageView *)self image];
  BOOL v4 = v5 == 0;

  return v4;
}

@end