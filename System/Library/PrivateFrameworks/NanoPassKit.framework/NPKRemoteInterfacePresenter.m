@interface NPKRemoteInterfacePresenter
- (NPKRemoteInterfacePresenter)init;
- (NPKRemoteInterfacePresenterDelegate)delegate;
- (NSXPCConnection)xpcConnection;
- (void)clearInAppInterfaceForSkeletonPeerPaymentQuote:(id)a3 withError:(id)a4;
- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5;
- (void)presentContinuityPaymentInterfaceWithRemotePaymentRequest:(id)a3 completion:(id)a4;
- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 forHostApplicationName:(id)a4 hostBundleIdentifier:(id)a5 hostProcessIdentifier:(int)a6 hostIdentifier:(id)a7 orientation:(id)a8 completion:(id)a9;
- (void)presentPasscodeUpgradeRequestWithChangeType:(unint64_t)a3 completion:(id)a4;
- (void)presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier:(id)a3 continuityType:(id)a4 transferToken:(id)a5 completion:(id)a6;
- (void)presentSetupApplePayAlert:(id)a3;
- (void)presentTransitTopUpValueSelectionForPassWithUniqueIdentifier:(id)a3 balanceField:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)showInAppInterfaceWithSkeletonPeerPaymentQuote:(id)a3 completion:(id)a4;
- (void)tearDownPasscodeUpgradeRequestWithPasscodeChanged:(BOOL)a3 error:(id)a4;
@end

@implementation NPKRemoteInterfacePresenter

- (NPKRemoteInterfacePresenter)init
{
  v14.receiver = self;
  v14.super_class = (Class)NPKRemoteInterfacePresenter;
  v2 = [(NPKRemoteInterfacePresenter *)&v14 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.NPKInAppPaymentServer" options:4096];
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D09F918];
    [(NSXPCConnection *)v3 setRemoteObjectInterface:v4];
    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke;
    v11[3] = &unk_2644D29A8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v3 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke_82;
    v9[3] = &unk_2644D29A8;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v3 setInvalidationHandler:v9];
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v6 = dispatch_queue_create("NPKRemoteInterfacePresenterQueue", v5);
    [(NSXPCConnection *)v3 _setQueue:v6];
    [(NSXPCConnection *)v3 resume];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v3;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Remote interface presenter connection interrupted", (uint8_t *)v8, 2u);
    }
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(WeakRetained + 1);
    [v7 remoteInterfacePresenterConnectionInterrupted:v6];
  }
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke_82(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Remote interface presenter connection invalidated", buf, 2u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke_83;
  block[3] = &unk_2644D29A8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 forHostApplicationName:(id)a4 hostBundleIdentifier:(id)a5 hostProcessIdentifier:(int)a6 hostIdentifier:(id)a7 orientation:(id)a8 completion:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a4;
  v21 = pk_General_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v23 = pk_General_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v15;
      _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Request to present in-app payment interface for host application: %@ payment request: %@", buf, 0x16u);
    }
  }
  xpcConnection = self->_xpcConnection;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __182__NPKRemoteInterfacePresenter_presentInAppPaymentInterfaceWithPaymentRequest_forHostApplicationName_hostBundleIdentifier_hostProcessIdentifier_hostIdentifier_orientation_completion___block_invoke;
  v30 = &unk_2644D2B90;
  id v31 = v17;
  id v25 = v17;
  v26 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&v27];
  objc_msgSend(v26, "showInAppInterfaceWithPaymentRequest:forHostApplicationName:hostBundleIdentifier:hostProcessIdentifier:hostIdentifier:orientation:activationHandler:", v15, v20, v16, v11, v19, v18, v25, v27, v28, v29, v30);
}

void __182__NPKRemoteInterfacePresenter_presentInAppPaymentInterfaceWithPaymentRequest_forHostApplicationName_hostBundleIdentifier_hostProcessIdentifier_hostIdentifier_orientation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present in-app payment interface invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v3);
  }
}

- (void)presentContinuityPaymentInterfaceWithRemotePaymentRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to present continuity payment interface for remote payment request: %@", buf, 0xCu);
    }
  }
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__NPKRemoteInterfacePresenter_presentContinuityPaymentInterfaceWithRemotePaymentRequest_completion___block_invoke;
  v14[3] = &unk_2644D2B90;
  id v15 = v7;
  id v12 = v7;
  v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 showInAppInterfaceWithRemotePaymentRequest:v6 activationHandler:v12];
}

void __100__NPKRemoteInterfacePresenter_presentContinuityPaymentInterfaceWithRemotePaymentRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present continuity payment interface invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)showInAppInterfaceWithSkeletonPeerPaymentQuote:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to present in-app interface for skeleton peer payment quote: %@", buf, 0xCu);
    }
  }
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__NPKRemoteInterfacePresenter_showInAppInterfaceWithSkeletonPeerPaymentQuote_completion___block_invoke;
  v14[3] = &unk_2644D2B90;
  id v15 = v7;
  id v12 = v7;
  v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 showInAppInterfaceWithSkeletonPeerPaymentQuote:v6 activationHandler:v12];
}

void __89__NPKRemoteInterfacePresenter_showInAppInterfaceWithSkeletonPeerPaymentQuote_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present in-app interface for skeleton peer payment quote invoked: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)clearInAppInterfaceForSkeletonPeerPaymentQuote:(id)a3 withError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to clear skeleton peer payment quote: %@ error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v11 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  [v11 clearInAppInterfaceForSkeletonPeerPaymentQuote:v6 withError:v7];
}

void __88__NPKRemoteInterfacePresenter_clearInAppInterfaceForSkeletonPeerPaymentQuote_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for clear peer payment quote invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)presentSetupApplePayAlert:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKey:@"AppName"];
  }
  int v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Request to present set up Apple Pay alert for %@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v9 = [MEMORY[0x263F087C8] defaultCenter];
  [v9 postNotificationName:@"com.apple.NanoPassKit.PresentApplePaySetupAlert" object:0 userInfo:v5];
}

- (void)presentPasscodeUpgradeRequestWithChangeType:(unint64_t)a3 completion:(id)a4
{
  xpcConnection = self->_xpcConnection;
  id v6 = a4;
  id v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_89];
  [v7 presentPasscodeUpgradeRequestWithChangeType:a3 completion:v6];
}

void __86__NPKRemoteInterfacePresenter_presentPasscodeUpgradeRequestWithChangeType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present passcode upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)tearDownPasscodeUpgradeRequestWithPasscodeChanged:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  xpcConnection = self->_xpcConnection;
  id v6 = a4;
  id v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_91];
  [v7 tearDownPasscodeUpgradeRequestWithPasscodeChanged:v4 error:v6];
}

void __87__NPKRemoteInterfacePresenter_tearDownPasscodeUpgradeRequestWithPasscodeChanged_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for tear down passcode upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5
{
  xpcConnection = self->_xpcConnection;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_93];
  [v10 presentContactlessInterfaceForPassWithUniqueIdentifier:v9 fromSource:a4 completion:v8];
}

void __108__NPKRemoteInterfacePresenter_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present contactless interface upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier:(id)a3 continuityType:(id)a4 transferToken:(id)a5 completion:(id)a6
{
  xpcConnection = self->_xpcConnection;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_95];
  [v14 presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier:v13 continuityType:v12 transferToken:v11 completion:v10];
}

void __137__NPKRemoteInterfacePresenter_presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier_continuityType_transferToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present provisioning continuity car key interface invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)presentTransitTopUpValueSelectionForPassWithUniqueIdentifier:(id)a3 balanceField:(id)a4 completion:(id)a5
{
  xpcConnection = self->_xpcConnection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_97];
  [v11 presentTransitTopUpValueSelectionForPassWithUniqueIdentifier:v10 balanceField:v9 completion:v8];
}

void __116__NPKRemoteInterfacePresenter_presentTransitTopUpValueSelectionForPassWithUniqueIdentifier_balanceField_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present top up value selection interface invoked: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (NPKRemoteInterfacePresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKRemoteInterfacePresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end