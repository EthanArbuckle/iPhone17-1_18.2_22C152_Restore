@interface FPCTLOpenDelegate
- (id)completionHandler;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation FPCTLOpenDelegate

- (void)openResourceOperationDidComplete:(id)a3
{
  completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, 0);
  }
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a4);
  }
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
}

@end