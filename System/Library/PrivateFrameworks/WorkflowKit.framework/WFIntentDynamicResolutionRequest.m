@interface WFIntentDynamicResolutionRequest
- (BOOL)isCancelled;
- (WFIntentDynamicResolutionRequest)init;
- (id)resolutionBlock;
- (void)cancel;
- (void)setResolutionBlock:(id)a3;
@end

@implementation WFIntentDynamicResolutionRequest

- (void).cxx_destruct
{
}

- (void)setResolutionBlock:(id)a3
{
}

- (id)resolutionBlock
{
  return self->_resolutionBlock;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (WFIntentDynamicResolutionRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFIntentDynamicResolutionRequest;
  v2 = [(WFIntentDynamicResolutionRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v4 = v2;
  }

  return v3;
}

@end