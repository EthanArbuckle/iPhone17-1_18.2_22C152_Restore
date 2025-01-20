@interface SBFluidDismissalState
- (CGRect)contentRect;
- (CGRect)homeGrabberContentRect;
- (double)backgroundWeighting;
- (double)contentWeighting;
- (int64_t)dismissalType;
- (int64_t)transitionPhase;
- (void)setBackgroundWeighting:(double)a3;
- (void)setContentRect:(CGRect)a3;
- (void)setContentWeighting:(double)a3;
- (void)setDismissalType:(int64_t)a3;
- (void)setHomeGrabberContentRect:(CGRect)a3;
- (void)setTransitionPhase:(int64_t)a3;
@end

@implementation SBFluidDismissalState

- (double)backgroundWeighting
{
  return self->_backgroundWeighting;
}

- (void)setBackgroundWeighting:(double)a3
{
  self->_backgroundWeighting = a3;
}

- (double)contentWeighting
{
  return self->_contentWeighting;
}

- (void)setContentWeighting:(double)a3
{
  self->_contentWeighting = a3;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->_contentRect = a3;
}

- (CGRect)homeGrabberContentRect
{
  double x = self->_homeGrabberContentRect.origin.x;
  double y = self->_homeGrabberContentRect.origin.y;
  double width = self->_homeGrabberContentRect.size.width;
  double height = self->_homeGrabberContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHomeGrabberContentRect:(CGRect)a3
{
  self->_homeGrabberContentRect = a3;
}

- (int64_t)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(int64_t)a3
{
  self->_dismissalType = a3;
}

- (int64_t)transitionPhase
{
  return self->_transitionPhase;
}

- (void)setTransitionPhase:(int64_t)a3
{
  self->_transitionPhase = a3;
}

@end