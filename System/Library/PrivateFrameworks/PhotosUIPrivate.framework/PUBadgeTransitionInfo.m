@interface PUBadgeTransitionInfo
- (CGRect)frame;
- (UIOffset)badgesOffset;
- (UIView)snapshotView;
- (unint64_t)badgesCorner;
- (void)setBadgesCorner:(unint64_t)a3;
- (void)setBadgesOffset:(UIOffset)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSnapshotView:(id)a3;
@end

@implementation PUBadgeTransitionInfo

- (void).cxx_destruct
{
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBadgesCorner:(unint64_t)a3
{
  self->_badgesCorner = a3;
}

- (unint64_t)badgesCorner
{
  return self->_badgesCorner;
}

- (void)setBadgesOffset:(UIOffset)a3
{
  self->_badgesOffset = a3;
}

- (UIOffset)badgesOffset
{
  double horizontal = self->_badgesOffset.horizontal;
  double vertical = self->_badgesOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setSnapshotView:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

@end