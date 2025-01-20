@interface SBUISystemApertureElementTransitionContext
- (BOOL)isUserInitiated;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (int64_t)fromLayoutMode;
- (void)setFromLayoutMode:(int64_t)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SBUISystemApertureElementTransitionContext

- (int64_t)fromLayoutMode
{
  return self->_fromLayoutMode;
}

- (void)setFromLayoutMode:(int64_t)a3
{
  self->_fromLayoutMode = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end