@interface OspreyMethodCall
- (OspreyMethodCall)callWithMessageReceived:(id)a3 completion:(id)a4;
- (OspreyMethodCall)callWithRequestBuilder:(id)a3 messageReceived:(id)a4 completion:(id)a5;
- (OspreyMethodCall)initWithMethodName:(id)a3 channel:(id)a4 serializeRequest:(id)a5 deserializeResponse:(id)a6 defaultRequestBuilder:(id)a7;
@end

@implementation OspreyMethodCall

- (OspreyMethodCall)initWithMethodName:(id)a3 channel:(id)a4 serializeRequest:(id)a5 deserializeResponse:(id)a6 defaultRequestBuilder:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)OspreyMethodCall;
  v17 = [(OspreyMethodCall *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    methodName = v17->_methodName;
    v17->_methodName = (NSString *)v18;

    objc_storeStrong((id *)&v17->_channel, a4);
    uint64_t v20 = [v14 copy];
    id serializeRequest = v17->_serializeRequest;
    v17->_id serializeRequest = (id)v20;

    uint64_t v22 = [v15 copy];
    id deserializeResponse = v17->_deserializeResponse;
    v17->_id deserializeResponse = (id)v22;

    uint64_t v24 = [v16 copy];
    id defaultRequestBuilder = v17->_defaultRequestBuilder;
    v17->_id defaultRequestBuilder = (id)v24;
  }
  return v17;
}

- (OspreyMethodCall)callWithMessageReceived:(id)a3 completion:(id)a4
{
  return [(OspreyMethodCall *)self callWithRequestBuilder:0 messageReceived:a3 completion:a4];
}

- (OspreyMethodCall)callWithRequestBuilder:(id)a3 messageReceived:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self->_deserializeResponse);
  v11 = (void *)MEMORY[0x1C189D2A0](v8);
  if (self->_defaultRequestBuilder)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke;
    v22[3] = &unk_1E63CC0E8;
    v22[4] = self;
    id v23 = v8;
    uint64_t v12 = MEMORY[0x1C189D2A0](v22);

    v11 = (void *)v12;
  }
  methodName = self->_methodName;
  channel = self->_channel;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke_2;
  v19[3] = &unk_1E63CC110;
  id v15 = v9;
  id v20 = v15;
  objc_copyWeak(&v21, &location);
  id v16 = [(OspreyRPC *)channel bidirectionalStreamingRequestWithMethodName:methodName requestBuilder:v11 streamingResponseHandler:v19 completion:v10];
  v17 = [[OspreyMessageProducer alloc] initWithMessageSerializer:self->_serializeRequest streamingContext:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return (OspreyMethodCall *)v17;
}

void __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

    if (WeakRetained)
    {
      id v4 = (void (**)(id, id))objc_loadWeakRetained((id *)(a1 + 40));
      v5 = v4[2](v4, v6);

      if (v5) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultRequestBuilder, 0);
  objc_storeStrong(&self->_deserializeResponse, 0);
  objc_storeStrong(&self->_serializeRequest, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_methodName, 0);
}

@end