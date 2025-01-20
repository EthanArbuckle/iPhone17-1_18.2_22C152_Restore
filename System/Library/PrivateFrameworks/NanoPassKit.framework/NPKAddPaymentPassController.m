@interface NPKAddPaymentPassController
+ (BOOL)canAddPaymentPass;
- (BOOL)didFinishCallbackSent;
- (NPKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4;
- (PKAddPaymentPassRequestConfiguration)configuration;
- (PKXPCService)remoteService;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_sendDidFinishWithPass:(id)a3 error:(id)a4;
- (void)didFinishWithPass:(id)a3 error:(id)a4;
- (void)dismissWithCompletion:(id)a3;
- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6;
- (void)presentWithCompletion:(id)a3;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setDidFinishCallbackSent:(BOOL)a3;
- (void)setRemoteService:(id)a3;
@end

@implementation NPKAddPaymentPassController

+ (BOOL)canAddPaymentPass
{
  return PKSecureElementIsAvailable() != 0;
}

- (NPKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPKAddPaymentPassController;
  v8 = [(PKAddPaymentPassController *)&v15 initWithRequestConfiguration:v7 delegate:a4];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F5C2F0]);
    v10 = NPKAddPaymentPassControllerServerExportedInterface();
    v11 = NPKAddPaymentPassControllerClientExportedInterface();
    uint64_t v12 = [v9 initWithMachServiceName:@"com.apple.NanoPassKit.AddPaymentPass" remoteObjectInterface:v10 exportedObjectInterface:v11 exportedObject:v8];
    remoteService = v8->_remoteService;
    v8->_remoteService = (PKXPCService *)v12;

    objc_storeStrong((id *)&v8->_configuration, a3);
    [(PKXPCService *)v8->_remoteService setDelegate:v8];
  }

  return v8;
}

- (void)presentWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke;
  v11[3] = &unk_2644D2B90;
  id v5 = v4;
  id v12 = v5;
  v6 = [(NPKAddPaymentPassController *)self _remoteObjectProxyWithErrorHandler:v11];
  configuration = self->_configuration;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_47;
  v9[3] = &unk_2644D2E58;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 setConfiguration:configuration completionHandler:v9];
}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for set configuration invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_47(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_2;
  v6[3] = &unk_2644D2B90;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 _remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_48;
  v4[3] = &unk_2644D4150;
  id v5 = *(id *)(a1 + 40);
  [v3 presentWithCompletion:v4];
}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present add payment pass invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

uint64_t __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_48(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke;
  v10[3] = &unk_2644D2B90;
  id v5 = v4;
  id v11 = v5;
  v6 = [(NPKAddPaymentPassController *)self _remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke_51;
  v8[3] = &unk_2644D2B10;
  id v9 = v5;
  id v7 = v5;
  [v6 dismissWithCompletion:v8];
}

void __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for dismiss add payment pass invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

uint64_t __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke_51(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  id v6 = a4;
  BOOL v5 = PKDisplayableErrorForCommonType();
  [(NPKAddPaymentPassController *)self _sendDidFinishWithPass:0 error:v5];

  [v6 invalidate];
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Forwarding generate request to delegate", buf, 2u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__NPKAddPaymentPassController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke;
  block[3] = &unk_2644D4178;
  block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __106__NPKAddPaymentPassController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 addPaymentPassController:*(void *)(a1 + 32) generateRequestWithCertificateChain:*(void *)(a1 + 40) nonce:*(void *)(a1 + 48) nonceSignature:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Forwarding did finish to delegate", v11, 2u);
    }
  }
  [(NPKAddPaymentPassController *)self _sendDidFinishWithPass:v6 error:v7];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return (id)[(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (void)_sendDidFinishWithPass:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NPKAddPaymentPassController__sendDidFinishWithPass_error___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__NPKAddPaymentPassController__sendDidFinishWithPass_error___block_invoke(void *a1)
{
  id v2 = (unsigned char *)a1[4];
  if (!v2[24])
  {
    id v3 = [v2 delegate];
    [v3 addPaymentPassController:a1[4] didFinishAddingPaymentPass:a1[5] error:a1[6]];
  }
}

- (PKAddPaymentPassRequestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (BOOL)didFinishCallbackSent
{
  return self->_didFinishCallbackSent;
}

- (void)setDidFinishCallbackSent:(BOOL)a3
{
  self->_didFinishCallbackSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end