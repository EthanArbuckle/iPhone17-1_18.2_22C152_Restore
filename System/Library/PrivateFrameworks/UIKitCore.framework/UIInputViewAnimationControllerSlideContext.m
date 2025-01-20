@interface UIInputViewAnimationControllerSlideContext
- (CGRect)snapshotEndFrame;
- (UIInputViewSetPlacement)endPlacement;
- (UIView)snapshot;
- (void)setEndPlacement:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSnapshotEndFrame:(CGRect)a3;
@end

@implementation UIInputViewAnimationControllerSlideContext

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (CGRect)snapshotEndFrame
{
  double x = self->_snapshotEndFrame.origin.x;
  double y = self->_snapshotEndFrame.origin.y;
  double width = self->_snapshotEndFrame.size.width;
  double height = self->_snapshotEndFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSnapshotEndFrame:(CGRect)a3
{
  self->_snapshotEndFrame = a3;
}

- (UIInputViewSetPlacement)endPlacement
{
  return self->_endPlacement;
}

- (void)setEndPlacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPlacement, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end