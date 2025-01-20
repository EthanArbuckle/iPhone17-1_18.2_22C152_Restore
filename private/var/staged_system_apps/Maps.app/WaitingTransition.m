@interface WaitingTransition
- (BOOL)animated;
- (BOOL)isAlreadyInStack;
- (BOOL)switchContext;
- (ContaineeProtocol)oldViewController;
- (ContaineeProtocol)viewController;
- (id)completion;
- (id)postProcess;
- (unint64_t)layout;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setIsAlreadyInStack:(BOOL)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setOldViewController:(id)a3;
- (void)setPostProcess:(id)a3;
- (void)setSwitchContext:(BOOL)a3;
- (void)setViewController:(id)a3;
@end

@implementation WaitingTransition

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_postProcess, 0);
  objc_destroyWeak((id *)&self->_oldViewController);

  objc_storeStrong((id *)&self->_viewController, 0);
}

- (ContaineeProtocol)viewController
{
  return self->_viewController;
}

- (BOOL)switchContext
{
  return self->_switchContext;
}

- (void)setViewController:(id)a3
{
}

- (void)setIsAlreadyInStack:(BOOL)a3
{
  self->_isAlreadyInStack = a3;
}

- (void)setCompletion:(id)a3
{
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)animated
{
  return self->_animated;
}

- (ContaineeProtocol)oldViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oldViewController);

  return (ContaineeProtocol *)WeakRetained;
}

- (void)setOldViewController:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (void)setSwitchContext:(BOOL)a3
{
  self->_switchContext = a3;
}

- (BOOL)isAlreadyInStack
{
  return self->_isAlreadyInStack;
}

- (id)postProcess
{
  return self->_postProcess;
}

- (void)setPostProcess:(id)a3
{
}

@end