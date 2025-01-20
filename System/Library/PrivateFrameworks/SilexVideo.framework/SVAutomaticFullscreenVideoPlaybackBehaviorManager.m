@interface SVAutomaticFullscreenVideoPlaybackBehaviorManager
- (BOOL)fullscreenPlaybackRequiredForCurrentConditions;
- (CGRect)videoBounds;
- (SVAutomaticFullscreenVideoPlaybackBehaviorManagerDelegate)delegate;
- (unint64_t)behavior;
- (void)conditionsChanged;
- (void)setBehavior:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setVideoBounds:(CGRect)a3;
@end

@implementation SVAutomaticFullscreenVideoPlaybackBehaviorManager

- (void)setVideoBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_videoBounds))
  {
    self->_videoBounds.origin.CGFloat x = x;
    self->_videoBounds.origin.CGFloat y = y;
    self->_videoBounds.size.CGFloat width = width;
    self->_videoBounds.size.CGFloat height = height;
    [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self conditionsChanged];
  }
}

- (void)setBehavior:(unint64_t)a3
{
  if (self->_behavior != a3)
  {
    self->_behavior = a3;
    [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self conditionsChanged];
  }
}

- (BOOL)fullscreenPlaybackRequiredForCurrentConditions
{
  BOOL v3 = [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self behavior] == 2;
  if ([(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self behavior] == 1)
  {
    [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self videoBounds];
    if (!CGRectIsEmpty(v6))
    {
      [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self videoBounds];
      double Width = CGRectGetWidth(v7);
      [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self videoBounds];
      return Width / CGRectGetHeight(v8) < 0.95;
    }
  }
  return v3;
}

- (void)conditionsChanged
{
  if ([(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self fullscreenPlaybackRequiredForCurrentConditions])
  {
    BOOL v3 = [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)self delegate];
      [v5 fullscreenBehaviorManagerRequiresFullscreenPlayback:self];
    }
  }
}

- (CGRect)videoBounds
{
  double x = self->_videoBounds.origin.x;
  double y = self->_videoBounds.origin.y;
  double width = self->_videoBounds.size.width;
  double height = self->_videoBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (SVAutomaticFullscreenVideoPlaybackBehaviorManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVAutomaticFullscreenVideoPlaybackBehaviorManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end