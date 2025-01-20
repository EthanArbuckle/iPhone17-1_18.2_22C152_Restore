@interface WFAggregateForecastRequest
- (WFAggregateForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4;
- (WFLocation)location;
- (id)completionHandler;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation WFAggregateForecastRequest

- (WFAggregateForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAggregateForecastRequest;
    v10 = [(WFTask *)&v13 init];
    v11 = v10;
    if (v10)
    {
      [(WFAggregateForecastRequest *)v10 setLocation:v6];
      [(WFAggregateForecastRequest *)v11 setCompletionHandler:v8];
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [(WFAggregateForecastRequest *)self completionHandler];

  if (v5)
  {
    id v6 = [(WFAggregateForecastRequest *)self completionHandler];
    id v7 = [v4 forecasts];
    v8 = [v4 error];
    ((void (**)(void, void *, void *))v6)[2](v6, v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)WFAggregateForecastRequest;
  [(WFTask *)&v9 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFAggregateForecastRequest *)self completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAggregateForecastRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  v3 = [(WFAggregateForecastRequest *)self completionHandler];

  if (v3)
  {
    id v4 = [(WFAggregateForecastRequest *)self completionHandler];
    v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)WFAggregateForecastRequest;
  [(WFTask *)&v6 handleCancellation];
}

- (void)cleanup
{
  [(WFAggregateForecastRequest *)self setCompletionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)WFAggregateForecastRequest;
  [(WFTask *)&v3 cleanup];
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
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
  objc_storeStrong((id *)&self->_location, 0);
}

@end