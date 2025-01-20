@interface PKUIAnimationDelegate
- (id)completionHandler;
- (id)didStartHandler;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setDidStartHandler:(id)a3;
@end

@implementation PKUIAnimationDelegate

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKUIAnimationDelegate;
  [(PKUIAnimationDelegate *)&v2 dealloc];
}

- (void)animationDidStart:(id)a3
{
  id didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    v6 = (void (**)(void))_Block_copy(didStartHandler);
    id v5 = self->_didStartHandler;
    self->_id didStartHandler = 0;

    v6[2]();
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    BOOL v6 = a4;
    v8 = (void (**)(id, BOOL))_Block_copy(completionHandler);
    id v7 = self->_completionHandler;
    self->_id completionHandler = 0;

    v8[2](v8, v6);
  }
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
}

@end