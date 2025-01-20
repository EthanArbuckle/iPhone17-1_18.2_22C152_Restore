@interface WFChangeForecastRequest
- (WFChangeForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4;
- (WFLocation)location;
- (id)completionHandler;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFChangeForecastRequest

- (WFChangeForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFChangeForecastRequest;
  v8 = [(WFTask *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    location = v8->_location;
    v8->_location = (WFLocation *)v9;

    uint64_t v11 = MEMORY[0x21D4B3DE0](v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v11;
  }
  return v8;
}

- (void)startWithService:(id)a3
{
  id v4 = a3;
  id v7 = [(WFChangeForecastRequest *)self location];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  id v6 = [(WFTask *)self identifier];
  [v4 forecast:512 forLocation:v7 locale:v5 taskIdentifier:v6];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [(WFChangeForecastRequest *)self completionHandler];

  if (v5)
  {
    id v6 = [(WFChangeForecastRequest *)self completionHandler];
    id v7 = [v4 changeForecasts];
    v8 = [v4 error];
    ((void (**)(void, void *, void *))v6)[2](v6, v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)WFChangeForecastRequest;
  [(WFTask *)&v9 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFChangeForecastRequest *)self completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFChangeForecastRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (WFLocation)location
{
  return self->_location;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end