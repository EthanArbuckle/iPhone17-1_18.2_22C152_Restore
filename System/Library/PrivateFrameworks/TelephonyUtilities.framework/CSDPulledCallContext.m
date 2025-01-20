@interface CSDPulledCallContext
- (CSDProviderCall)call;
- (id)completionHandler;
- (void)setCall:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation CSDPulledCallContext

- (CSDProviderCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
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

  objc_storeStrong((id *)&self->_call, 0);
}

@end