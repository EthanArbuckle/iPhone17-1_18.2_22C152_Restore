@interface TRServerConnection
- (SFService)service;
- (TRServerConnection)initWithService:(id)a3;
- (void)invalidate;
- (void)sendEvent:(id)a3;
- (void)sendRequest:(id)a3;
- (void)sendResponse:(id)a3;
- (void)setService:(id)a3;
@end

@implementation TRServerConnection

- (TRServerConnection)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRServerConnection;
  v5 = [(TRServerConnection *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

- (void)sendEvent:(id)a3
{
  p_service = &self->_service;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  [WeakRetained sendEvent:v4];
}

- (void)sendRequest:(id)a3
{
  p_service = &self->_service;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  [WeakRetained sendRequest:v4];
}

- (void)sendResponse:(id)a3
{
  p_service = &self->_service;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  [WeakRetained sendResponse:v4];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_service, 0);
  v3 = [(TRConnection *)self invalidationHandler];

  if (v3)
  {
    id v4 = [(TRConnection *)self invalidationHandler];
    v4[2]();
  }
}

- (SFService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (SFService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end