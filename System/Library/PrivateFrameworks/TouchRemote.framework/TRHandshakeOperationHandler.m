@interface TRHandshakeOperationHandler
- (TRHandshakeOperationHandler)initWithHandshakeHandler:(id)a3;
- (id)handshakeHandler;
- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setHandshakeHandler:(id)a3;
@end

@implementation TRHandshakeOperationHandler

- (TRHandshakeOperationHandler)initWithHandshakeHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRHandshakeOperationHandler;
  v5 = [(TRHandshakeOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handshakeHandler = v5->_handshakeHandler;
    v5->_id handshakeHandler = (id)v6;
  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__TRHandshakeOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_264220738;
  v4[4] = self;
  id v3 = a3;
  [v3 setRequestHandler:v4 forRequestClass:objc_opt_class()];
}

uint64_t __65__TRHandshakeOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleHandshakeRequest:a2 withResponseHandler:a3];
}

- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_handshakeHandler)
  {
    v13 = @"TRHandshakeOperationHandlerParamKeyProtocolVersion";
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "protocolVersion"));
    v14[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    id handshakeHandler = (void (**)(id, void *, void *))self->_handshakeHandler;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__TRHandshakeOperationHandler__handleHandshakeRequest_withResponseHandler___block_invoke;
    v11[3] = &unk_264221038;
    id v12 = v6;
    handshakeHandler[2](handshakeHandler, v8, v11);
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v6 + 2))(v6, v10, 0);
  }
}

void __75__TRHandshakeOperationHandler__handleHandshakeRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(TRHandshakeResponse);
  [(TRHandshakeResponse *)v4 setProtocolVersion:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)handshakeHandler
{
  return self->_handshakeHandler;
}

- (void)setHandshakeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end