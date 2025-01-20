@interface ICSystemPaperExtensionHostViewController
- (BOOL)didFinish;
- (ICSystemPaperExtensionHostViewController)initWithConfiguration:(id)a3;
- (ICSystemPaperPresentationDelegate)presentationDelegate;
- (NSData)userActivityData;
- (NSXPCConnection)connection;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)startHostingBlock;
- (void)_finishAndNotifyDelegateWithError:(id)a3;
- (void)_invokeAndReleaseStartHostingBlock;
- (void)addChildViewController:(id)a3;
- (void)dismissViewControllerCancelled:(BOOL)a3;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDidFinish:(BOOL)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setStartHostingBlock:(id)a3;
- (void)setUserActivityData:(id)a3;
- (void)teardown;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ICSystemPaperExtensionHostViewController

- (ICSystemPaperExtensionHostViewController)initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperExtensionHostViewController;
  v3 = [(_EXHostViewController *)&v6 initWithConfiguration:a3];
  v4 = v3;
  if (v3) {
    [(_EXHostViewController *)v3 setDelegate:v3];
  }
  return v4;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  v2 = [(ICSystemPaperExtensionHostViewController *)self childViewControllers];
  v3 = [v2 firstObject];

  return (_UIRemoteViewController *)v3;
}

- (void)addChildViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperExtensionHostViewController;
  id v4 = a3;
  [(ICSystemPaperExtensionHostViewController *)&v6 addChildViewController:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(ICSystemPaperExtensionHostViewController *)self _invokeAndReleaseStartHostingBlock];
  }
}

- (void)_invokeAndReleaseStartHostingBlock
{
  v3 = [(ICSystemPaperExtensionHostViewController *)self startHostingBlock];

  if (v3)
  {
    id v4 = [(ICSystemPaperExtensionHostViewController *)self startHostingBlock];
    v4[2]();

    [(ICSystemPaperExtensionHostViewController *)self setStartHostingBlock:0];
  }
}

- (void)_finishAndNotifyDelegateWithError:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICSystemPaperExtensionHostViewController *)self _invokeAndReleaseStartHostingBlock];
  if (![(ICSystemPaperExtensionHostViewController *)self didFinish])
  {
    [(ICSystemPaperExtensionHostViewController *)self setDidFinish:1];
    id v4 = [(ICSystemPaperExtensionHostViewController *)self presentationDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [(ICSystemPaperExtensionHostViewController *)self presentationDelegate];
      [v6 systemPaperDidFinishWithError:v7];
    }
    else
    {
      objc_super v6 = [(ICSystemPaperExtensionHostViewController *)self presentingViewController];
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICSystemPaperExtensionHostViewController;
  [(_EXHostViewController *)&v5 viewDidDisappear:a3];
  if (![(ICSystemPaperExtensionHostViewController *)self didFinish])
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    [(ICSystemPaperExtensionHostViewController *)self _finishAndNotifyDelegateWithError:v4];
  }
  [(ICSystemPaperExtensionHostViewController *)self teardown];
}

- (void)teardown
{
  v3 = [(ICSystemPaperExtensionHostViewController *)self connection];
  [v3 invalidate];

  [(ICSystemPaperExtensionHostViewController *)self setConnection:0];
  [(_EXHostViewController *)self setConfiguration:0];

  [(ICSystemPaperExtensionHostViewController *)self setPresentationDelegate:0];
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  objc_super v5 = [(_EXHostViewController *)self makeXPCConnectionWithError:&v21];
  id v6 = v21;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x263F08D80], "ic_hostInterface");
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    v8 = objc_msgSend(MEMORY[0x263F08D80], "ic_extensionInterface");
    [v5 setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    [v5 setInterruptionHandler:&__block_literal_global_1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16;
    v18[3] = &unk_264E7BBC8;
    objc_copyWeak(&v19, &location);
    [v5 setInvalidationHandler:v18];
    [v5 resume];
    v9 = [(ICSystemPaperExtensionHostViewController *)self userActivityData];
    v10 = ICSystemPaperExtensionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICSystemPaperExtensionHostViewController hostViewControllerDidActivate:]();
    }

    v11 = [v5 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18;
    v15[3] = &unk_264E7BBF0;
    id v12 = v9;
    id v16 = v12;
    id v13 = v5;
    id v17 = v13;
    [v11 checkInWithReply:v15];

    [(ICSystemPaperExtensionHostViewController *)self setConnection:v13];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = ICSystemPaperExtensionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICSystemPaperExtensionHostViewController hostViewControllerDidActivate:]((uint64_t)v6, v14);
    }
  }
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke()
{
  v0 = ICSystemPaperExtensionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23CA54000, v0, OS_LOG_TYPE_DEFAULT, "Connection to extension interrupted", v1, 2u);
  }
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16(uint64_t a1)
{
  v2 = ICSystemPaperExtensionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23CA54000, v2, OS_LOG_TYPE_DEFAULT, "Connection to extension invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_17;
  block[3] = &unk_264E7BBC8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18(uint64_t a1)
{
  v2 = ICSystemPaperExtensionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18_cold_2();
  }

  if (*(void *)(a1 + 32))
  {
    v3 = ICSystemPaperExtensionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18_cold_1();
    }

    id v4 = [*(id *)(a1 + 40) remoteObjectProxy];
    [v4 addUserActivityData:*(void *)(a1 + 32)];
  }
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
}

- (void)dismissViewControllerCancelled:(BOOL)a3
{
  objc_super v5 = ICSystemPaperExtensionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICSystemPaperExtensionHostViewController dismissViewControllerCancelled:]();
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__ICSystemPaperExtensionHostViewController_dismissViewControllerCancelled___block_invoke;
  v6[3] = &unk_264E7BC18;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __75__ICSystemPaperExtensionHostViewController_dismissViewControllerCancelled___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 32) _finishAndNotifyDelegateWithError:v2];
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = ICSystemPaperExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICSystemPaperExtensionHostViewController openURL:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke;
  v17[3] = &unk_264E7BC40;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v19 = v7;
  id v10 = v7;
  v11 = (void *)MEMORY[0x23ECEF220](v17);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_20;
  block[3] = &unk_264E7BC68;
  id v15 = v9;
  id v16 = v11;
  id v12 = v11;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = ICSystemPaperExtensionLog();
  objc_super v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _finishAndNotifyDelegateWithError:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_2(a1, v5);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x263F1D020];
  if ([(id)*MEMORY[0x263F1D020] canOpenURL:*(void *)(a1 + 32)])
  {
    id v3 = *v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 _openURL:v4 originatingView:0 completionHandler:v5];
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)startHostingBlock
{
  return self->_startHostingBlock;
}

- (void)setStartHostingBlock:(id)a3
{
}

- (ICSystemPaperPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (ICSystemPaperPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong(&self->_startHostingBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)hostViewControllerDidActivate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA54000, a2, OS_LOG_TYPE_ERROR, "Error creating XPC connection to extension: %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)hostViewControllerDidActivate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Checking in with extension", v2, v3, v4, v5, v6);
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Sending user activity data", v2, v3, v4, v5, v6);
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_18_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Got reply from extension", v2, v3, v4, v5, v6);
}

- (void)dismissViewControllerCancelled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Received -dismissViewController from extension", v2, v3, v4, v5, v6);
}

- (void)openURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Received -openURL:completion: from extension", v2, v3, v4, v5, v6);
}

void __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23CA54000, v0, v1, "Opened URL", v2, v3, v4, v5, v6);
}

void __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23CA54000, a2, OS_LOG_TYPE_ERROR, "Failed to open URL: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end