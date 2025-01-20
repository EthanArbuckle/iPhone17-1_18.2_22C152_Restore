@interface WFTemperatureUnitRequest
- (BOOL)requiresResponse;
- (WFTemperatureUnitRequest)initWithResultHandler:(id)a3;
- (id)resultHandler;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFTemperatureUnitRequest

- (WFTemperatureUnitRequest)initWithResultHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTemperatureUnitRequest;
  v5 = [(WFTask *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WFTemperatureUnitRequest *)v5 setResultHandler:v4];
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
  [v4 temperatureUnitWithIdentifier:v5];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WFTemperatureUnitRequest *)self resultHandler];

    if (v5)
    {
      v6 = [(WFTemperatureUnitRequest *)self resultHandler];

      if (v6)
      {
        v7 = [(WFTemperatureUnitRequest *)self resultHandler];
        uint64_t v8 = [v4 temperatureUnit];
        v9 = [v4 error];
        ((void (**)(void, uint64_t, void *))v7)[2](v7, v8, v9);
      }
      v10.receiver = self;
      v10.super_class = (Class)WFTemperatureUnitRequest;
      [(WFTask *)&v10 handleResponse:v4];
    }
  }
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFTemperatureUnitRequest *)self resultHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFTemperatureUnitRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  v3 = [(WFTemperatureUnitRequest *)self resultHandler];

  if (v3)
  {
    id v4 = [(WFTemperatureUnitRequest *)self resultHandler];
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFTemperatureUnitRequest;
  [(WFTask *)&v7 handleCancellation];
}

- (void)cleanup
{
  [(WFTemperatureUnitRequest *)self setResultHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)WFTemperatureUnitRequest;
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