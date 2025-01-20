@interface SBTestTransitionSwitcherModifier
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (void)setshouldAsyncRenderUntilDelay:(double)a3;
@end

@implementation SBTestTransitionSwitcherModifier

- (void)setshouldAsyncRenderUntilDelay:(double)a3
{
  self->_shouldAsyncRenderUntilDelay = 1;
  self->_delay = a3;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  *a3 = self->_delay;
  return self->_shouldAsyncRenderUntilDelay;
}

@end