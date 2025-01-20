@interface _UIFocusEngineScrollableContainerOffsets
- (BOOL)adjustsTargetsOnContentOffsetChanges;
- (CGPoint)lastContentOffset;
- (CGPoint)lastRoundedOffset;
- (CGPoint)lastVelocity;
- (CGPoint)startContentOffset;
- (CGPoint)targetContentOffset;
- (UIScrollViewDelegate)scrollDelegate;
- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer;
- (double)convergenceRate;
- (id)completion;
- (void)setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setConvergenceRate:(double)a3;
- (void)setEnvironmentScrollableContainer:(id)a3;
- (void)setLastContentOffset:(CGPoint)a3;
- (void)setLastRoundedOffset:(CGPoint)a3;
- (void)setLastVelocity:(CGPoint)a3;
- (void)setScrollDelegate:(id)a3;
- (void)setStartContentOffset:(CGPoint)a3;
- (void)setTargetContentOffset:(CGPoint)a3;
@end

@implementation _UIFocusEngineScrollableContainerOffsets

- (BOOL)adjustsTargetsOnContentOffsetChanges
{
  return self->_adjustsTargetsOnContentOffsetChanges;
}

- (void)setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3
{
  self->_adjustsTargetsOnContentOffsetChanges = a3;
}

- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer
{
  return self->_environmentScrollableContainer;
}

- (void)setEnvironmentScrollableContainer:(id)a3
{
}

- (UIScrollViewDelegate)scrollDelegate
{
  return self->_scrollDelegate;
}

- (void)setScrollDelegate:(id)a3
{
}

- (CGPoint)startContentOffset
{
  double x = self->_startContentOffset.x;
  double y = self->_startContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartContentOffset:(CGPoint)a3
{
  self->_startContentOffset = a3;
}

- (CGPoint)lastContentOffset
{
  double x = self->_lastContentOffset.x;
  double y = self->_lastContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastContentOffset:(CGPoint)a3
{
  self->_lastContentOffset = a3;
}

- (CGPoint)lastRoundedOffset
{
  double x = self->_lastRoundedOffset.x;
  double y = self->_lastRoundedOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastRoundedOffset:(CGPoint)a3
{
  self->_lastRoundedOffset = a3;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (double)convergenceRate
{
  return self->_convergenceRate;
}

- (void)setConvergenceRate:(double)a3
{
  self->_convergenceRate = a3;
}

- (CGPoint)lastVelocity
{
  double x = self->_lastVelocity.x;
  double y = self->_lastVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastVelocity:(CGPoint)a3
{
  self->_lastVelocitdouble y = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_scrollDelegate, 0);
  objc_storeStrong((id *)&self->_environmentScrollableContainer, 0);
}

@end