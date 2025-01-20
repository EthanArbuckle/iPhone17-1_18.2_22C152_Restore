@interface WFFavoriteLocationRequest
- (WFFavoriteLocationRequest)initWithResultHandler:(id)a3;
- (id)resultHandler;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFFavoriteLocationRequest

- (WFFavoriteLocationRequest)initWithResultHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFavoriteLocationRequest;
  v5 = [(WFTask *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id resultHandler = v5->_resultHandler;
    v5->_id resultHandler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)startWithService:(id)a3
{
  id v4 = [(WFFavoriteLocationRequest *)self resultHandler];

  if (v4)
  {
    uint64_t v6 = [(WFFavoriteLocationRequest *)self resultHandler];
    v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 15);
    v6[2](v6, 0, v5);
  }
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [(WFFavoriteLocationRequest *)self resultHandler];

  if (v5)
  {
    uint64_t v6 = [(WFFavoriteLocationRequest *)self resultHandler];
    v7 = [v4 favoriteLocations];
    v8 = [v4 error];
    ((void (**)(void, void *, void *))v6)[2](v6, v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)WFFavoriteLocationRequest;
  [(WFTask *)&v9 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFFavoriteLocationRequest *)self resultHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFFavoriteLocationRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  v3 = [(WFFavoriteLocationRequest *)self resultHandler];

  if (v3)
  {
    id v4 = [(WFFavoriteLocationRequest *)self resultHandler];
    v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)WFFavoriteLocationRequest;
  [(WFTask *)&v6 handleCancellation];
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
}

@end