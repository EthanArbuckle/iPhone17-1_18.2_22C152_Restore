@interface SBCAAnimationBlockDelegate
- (id)animationDidStartHandler;
- (id)animationDidStopHandler;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAnimationDidStartHandler:(id)a3;
- (void)setAnimationDidStopHandler:(id)a3;
@end

@implementation SBCAAnimationBlockDelegate

- (void)animationDidStart:(id)a3
{
  animationDidStartHandler = (void (**)(id, id))self->_animationDidStartHandler;
  if (animationDidStartHandler)
  {
    animationDidStartHandler[2](animationDidStartHandler, a3);
    id v5 = self->_animationDidStartHandler;
    self->_animationDidStartHandler = 0;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  animationDidStopHandler = (void (**)(id, id, BOOL))self->_animationDidStopHandler;
  if (animationDidStopHandler)
  {
    animationDidStopHandler[2](animationDidStopHandler, a3, a4);
    id v6 = self->_animationDidStopHandler;
    self->_animationDidStopHandler = 0;
  }
}

- (id)animationDidStartHandler
{
  return self->_animationDidStartHandler;
}

- (void)setAnimationDidStartHandler:(id)a3
{
}

- (id)animationDidStopHandler
{
  return self->_animationDidStopHandler;
}

- (void)setAnimationDidStopHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidStopHandler, 0);
  objc_storeStrong(&self->_animationDidStartHandler, 0);
}

@end