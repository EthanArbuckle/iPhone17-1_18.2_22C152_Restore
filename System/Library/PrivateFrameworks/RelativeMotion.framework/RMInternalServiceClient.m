@interface RMInternalServiceClient
- (OS_dispatch_queue)queue;
- (RMConnectionClient)spiClient;
- (RMInternalServiceClient)initWithQueue:(id)a3;
- (void)disconnectAllClientsWithReply:(id)a3;
- (void)disconnectClient:(id)a3 withReply:(id)a4;
- (void)getNumClientsWithReply:(id)a3;
- (void)handleSpiIncomingMessage:(id)a3 data:(id)a4 replyBlock:(id)a5;
- (void)invalidate;
- (void)listClientsWithReply:(id)a3;
- (void)parseSpiErrorReply:(id)a3 forMessage:(id)a4;
- (void)setQueue:(id)a3;
- (void)setSpiClient:(id)a3;
@end

@implementation RMInternalServiceClient

- (RMInternalServiceClient)initWithQueue:(id)a3
{
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RMInternalServiceClient;
  v5 = [(RMInternalServiceClient *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(RMInternalServiceClient *)v5 setQueue:v4];
    v7 = [RMConnectionClient alloc];
    v8 = [(RMInternalServiceClient *)v6 queue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __41__RMInternalServiceClient_initWithQueue___block_invoke;
    v14[3] = &unk_264CACC60;
    v9 = v6;
    v15 = v9;
    v10 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)&v7->super.isa, v8, @"com.apple.relatived.internal", v14);
    [(RMInternalServiceClient *)v9 setSpiClient:v10];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__RMInternalServiceClient_initWithQueue___block_invoke_2;
    v12[3] = &unk_264CACA08;
    v13 = v9;
    dispatch_async(v4, v12);
  }
  return v6;
}

uint64_t __41__RMInternalServiceClient_initWithQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) handleSpiIncomingMessage:a2 data:a3 replyBlock:a4];
}

void __41__RMInternalServiceClient_initWithQueue___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spiClient];
  -[RMConnectionClient connect]((uint64_t)v1);
}

- (void)invalidate
{
  v3 = [(RMInternalServiceClient *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(RMInternalServiceClient *)self spiClient];
  -[RMConnectionClient invalidate]((uint64_t)v4);

  [(RMInternalServiceClient *)self setSpiClient:0];
}

- (void)handleSpiIncomingMessage:(id)a3 data:(id)a4 replyBlock:(id)a5
{
  v5 = [(RMInternalServiceClient *)self queue];
  dispatch_assert_queue_V2(v5);
}

- (void)parseSpiErrorReply:(id)a3 forMessage:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v11 = 0;
    v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
    id v8 = v11;
    if (v7)
    {
      if (onceToken_InternalService_Default != -1) {
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      }
      v9 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v6;
        __int16 v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_ERROR, "Error recived to SPI %@: %@", buf, 0x16u);
      }

      goto LABEL_13;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (onceToken_InternalService_Default != -1) {
    dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
  }
  v10 = logObject_InternalService_Default;
  if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_ERROR, "Can't unarchive the SPI error data: %@", buf, 0xCu);
  }
LABEL_13:
}

- (void)getNumClientsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(RMInternalServiceClient *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke;
  v7[3] = &unk_264CACCB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spiClient];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke_2;
  v4[3] = &unk_264CACC88;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, @"RMSpiGetNumClients", 0, v4);
}

void __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a2 isEqualToString:@"RMSpiError"])
  {
    if (v5) {
      [*(id *)(a1 + 32) parseSpiErrorReply:v5 forMessage:@"RMSpiGetNumClients"];
    }
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1) {
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    }
    v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_ERROR, "No data in getNumClients reply", buf, 2u);
    }
    goto LABEL_11;
  }
  id v11 = 0;
  id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v6 integerValue]);
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1) {
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      }
      v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_ERROR, "Error received from GetNumClients: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)disconnectAllClientsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(RMInternalServiceClient *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke;
  v7[3] = &unk_264CACCB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spiClient];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke_2;
  v4[3] = &unk_264CACC88;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, @"RMSpiDisconnectAllClients", 0, v4);
}

void __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a2 isEqualToString:@"RMSpiError"])
  {
    if (v5) {
      [*(id *)(a1 + 32) parseSpiErrorReply:v5 forMessage:@"RMSpiDisconnectAllClients"];
    }
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1) {
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    }
    v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_ERROR, "No data in disconnectAllClients reply", buf, 2u);
    }
    goto LABEL_11;
  }
  id v11 = 0;
  id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v6 integerValue]);
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1) {
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      }
      v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_ERROR, "Error received from disconnectClient: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)disconnectClient:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RMInternalServiceClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke;
  block[3] = &unk_264CACCD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spiClient];
  v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:*(void *)(a1 + 40) requiringSecureCoding:1 error:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke_2;
  v4[3] = &unk_264CACC88;
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, @"RMSpiDisconnectClient", v3, v4);
}

void __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a2 isEqualToString:@"RMSpiError"])
  {
    if (v5) {
      [*(id *)(a1 + 32) parseSpiErrorReply:v5 forMessage:@"RMSpiGetNumClients"];
    }
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1) {
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    }
    id v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_ERROR, "No data in disconnectClient reply", buf, 2u);
    }
    goto LABEL_11;
  }
  id v11 = 0;
  id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v6 integerValue]);
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1) {
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      }
      id v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_ERROR, "Error received from disconnectClient: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)listClientsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(RMInternalServiceClient *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__RMInternalServiceClient_listClientsWithReply___block_invoke;
  v7[3] = &unk_264CACCB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__RMInternalServiceClient_listClientsWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spiClient];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__RMInternalServiceClient_listClientsWithReply___block_invoke_2;
  v4[3] = &unk_264CACC88;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, @"RMSpiListClients", 0, v4);
}

void __48__RMInternalServiceClient_listClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a2 isEqualToString:@"RMSpiError"])
  {
    if (v5) {
      [*(id *)(a1 + 32) parseSpiErrorReply:v5 forMessage:@"RMSpiGetNumClients"];
    }
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1) {
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    }
    id v13 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23673D000, v13, OS_LOG_TYPE_ERROR, "No data in listClientsWithReply reply", buf, 2u);
    }
    goto LABEL_11;
  }
  id v6 = (void *)MEMORY[0x263F08928];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v15 = 0;
  id v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v15];
  id v11 = v15;

  if (v10)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v11)
    {
      if (onceToken_InternalService_Default != -1) {
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      }
      uint64_t v14 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_23673D000, v14, OS_LOG_TYPE_ERROR, "Error received from listClientsWithReply: %@", buf, 0xCu);
      }
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();

LABEL_19:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RMConnectionClient)spiClient
{
  return self->_spiClient;
}

- (void)setSpiClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spiClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end