@interface PKPassKitServicesXPCService
- (PKPassKitServicesXPCService)init;
- (id)_createConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_invalidate;
- (void)dealloc;
- (void)imageDataForRecurringPaymentMemo:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)snapshotDataForPassUniqueIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation PKPassKitServicesXPCService

- (PKPassKitServicesXPCService)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassKitServicesXPCService;
  v2 = [(PKPassKitServicesXPCService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PKPassKitServicesXPCService *)v2 _createConnection];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(PKPassKitServicesXPCService *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPassKitServicesXPCService;
  [(PKPassKitServicesXPCService *)&v3 dealloc];
}

- (void)snapshotDataForPassUniqueIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([v9 length])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __83__PKPassKitServicesXPCService_snapshotDataForPassUniqueIdentifier_size_completion___block_invoke;
      v13[3] = &unk_2647703F0;
      id v11 = v10;
      id v14 = v11;
      v12 = [(PKPassKitServicesXPCService *)self _remoteObjectProxyWithErrorHandler:v13];
      objc_msgSend(v12, "imageDataForPassUniqueIdentifier:size:completion:", v9, v11, width, height);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __83__PKPassKitServicesXPCService_snapshotDataForPassUniqueIdentifier_size_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_225C6C000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v9)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__PKPassKitServicesXPCService_imageDataForTransaction_size_completion___block_invoke;
      v14[3] = &unk_2647703F0;
      id v12 = v10;
      id v15 = v12;
      v13 = [(PKPassKitServicesXPCService *)self _remoteObjectProxyWithErrorHandler:v14];
      objc_msgSend(v13, "imageDataForTransaction:size:completion:", v9, v12, width, height);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __71__PKPassKitServicesXPCService_imageDataForTransaction_size_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_225C6C000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)imageDataForRecurringPaymentMemo:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v9)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __80__PKPassKitServicesXPCService_imageDataForRecurringPaymentMemo_size_completion___block_invoke;
      v14[3] = &unk_2647703F0;
      id v12 = v10;
      id v15 = v12;
      v13 = [(PKPassKitServicesXPCService *)self _remoteObjectProxyWithErrorHandler:v14];
      objc_msgSend(v13, "imageDataForRecurringPaymentMemo:size:completion:", v9, v12, width, height);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __80__PKPassKitServicesXPCService_imageDataForRecurringPaymentMemo_size_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_225C6C000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createConnection
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PassKitServicesXPCService"];
  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D969C70];
  [v3 setRemoteObjectInterface:v4];

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke;
  v8[3] = &unk_264770418;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_2;
  v6[3] = &unk_264770418;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  [v3 resume];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225C6C000, v2, OS_LOG_TYPE_DEFAULT, "PKPassKitServicesXPCService connection interrupted", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_23;
  block[3] = &unk_264770418;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225C6C000, v2, OS_LOG_TYPE_DEFAULT, "PKPassKitServicesXPCService connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_25;
  block[3] = &unk_264770418;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_25(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

- (void)_invalidate
{
  if (!self->_connection)
  {
    [0 invalidate];
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (void).cxx_destruct
{
}

@end