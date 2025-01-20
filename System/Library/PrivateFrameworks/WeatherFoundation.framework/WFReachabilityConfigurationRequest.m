@interface WFReachabilityConfigurationRequest
- (BOOL)requiresResponse;
- (WFReachabilityConfigurationRequest)initWithResultHandler:(id)a3;
- (id)resultHandler;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFReachabilityConfigurationRequest

- (WFReachabilityConfigurationRequest)initWithResultHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFReachabilityConfigurationRequest;
  v5 = [(WFTask *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WFReachabilityConfigurationRequest *)v5 setResultHandler:v4];
  }

  return v6;
}

- (BOOL)requiresResponse
{
  return 1;
}

- (void)startWithService:(id)a3
{
  id v4 = a3;
  id v5 = [(WFTask *)self identifier];
  [v4 reachabilityConfigurationForIdentifier:v5];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WFReachabilityConfigurationRequest *)self resultHandler];

    if (v5)
    {
      v6 = [(WFReachabilityConfigurationRequest *)self resultHandler];

      if (v6)
      {
        v7 = [(WFReachabilityConfigurationRequest *)self resultHandler];
        objc_super v8 = [v4 pathEvaluator];
        ((void (**)(void, void *, void))v7)[2](v7, v8, 0);
      }
      v9.receiver = self;
      v9.super_class = (Class)WFReachabilityConfigurationRequest;
      [(WFTask *)&v9 handleResponse:v4];
    }
  }
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WFReachabilityConfigurationRequest *)self resultHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFReachabilityConfigurationRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  v3 = [(WFReachabilityConfigurationRequest *)self resultHandler];

  if (v3)
  {
    id v4 = [(WFReachabilityConfigurationRequest *)self resultHandler];
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFReachabilityConfigurationRequest;
  [(WFTask *)&v7 handleCancellation];
}

- (void)cleanup
{
  [(WFReachabilityConfigurationRequest *)self setResultHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)WFReachabilityConfigurationRequest;
  [(WFTask *)&v3 cleanup];
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end