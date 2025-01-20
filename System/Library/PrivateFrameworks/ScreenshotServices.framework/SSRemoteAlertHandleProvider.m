@interface SSRemoteAlertHandleProvider
- (BOOL)isActive;
- (SSRemoteAlertHandleProvider)init;
- (SSRemoteAlertHandleProviderDelegate)delegate;
- (id)_screenshotServicesServiceAlertDefinition;
- (id)screenshotServicesAlertHandle;
- (void)_callDelegate:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)preheat;
- (void)prepare;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSRemoteAlertHandleProvider

- (SSRemoteAlertHandleProvider)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSRemoteAlertHandleProvider;
  v2 = [(SSRemoteAlertHandleProvider *)&v4 init];
  [(SSRemoteAlertHandleProvider *)v2 prepare];
  return v2;
}

- (void)activate
{
  handle = self->_handle;
  if (!handle || ([(SBSRemoteAlertHandle *)handle isValid] & 1) == 0)
  {
    [(SSRemoteAlertHandleProvider *)self invalidate];
    [(SSRemoteAlertHandleProvider *)self prepare];
  }
  objc_super v4 = self->_handle;
  [(SBSRemoteAlertHandle *)v4 activateWithContext:0];
}

- (BOOL)isActive
{
  return [(SBSRemoteAlertHandle *)self->_handle isActive];
}

- (void)preheat
{
  handle = self->_handle;
  if (!handle || ([(SBSRemoteAlertHandle *)handle isValid] & 1) == 0)
  {
    [(SSRemoteAlertHandleProvider *)self invalidate];
    [(SSRemoteAlertHandleProvider *)self prepare];
  }
}

- (void)prepare
{
  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Preparing remote alert handle", v8, 2u);
  }

  handle = self->_handle;
  if (handle)
  {
    [(SBSRemoteAlertHandle *)handle invalidate];
    v5 = self->_handle;
    self->_handle = 0;
  }
  v6 = [(SSRemoteAlertHandleProvider *)self screenshotServicesAlertHandle];
  v7 = self->_handle;
  self->_handle = v6;
}

- (void)invalidate
{
  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Invalidating remote alert handle", v6, 2u);
  }

  [(SBSRemoteAlertHandle *)self->_handle invalidate];
  handle = self->_handle;
  self->_handle = 0;

  v5 = [(SSRemoteAlertHandleProvider *)self delegate];
  [v5 remoteAlertHandleProvider:self didInvalidateWithError:0];
}

- (void)_callDelegate:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SSRemoteAlertHandleProvider__callDelegate___block_invoke;
  block[3] = &unk_2644ED758;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__SSRemoteAlertHandleProvider__callDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v4, OS_LOG_TYPE_INFO, "Remote alert handle activated", buf, 2u);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SSRemoteAlertHandleProvider_remoteAlertHandleDidActivate___block_invoke;
  v5[3] = &unk_2644EDB30;
  v5[4] = self;
  [(SSRemoteAlertHandleProvider *)self _callDelegate:v5];
}

void __60__SSRemoteAlertHandleProvider_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteAlertHandleProviderDidActivate:*(void *)(a1 + 32)];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v4, OS_LOG_TYPE_INFO, "Remote alert handle deactivated", buf, 2u);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SSRemoteAlertHandleProvider_remoteAlertHandleDidDeactivate___block_invoke;
  v5[3] = &unk_2644EDB30;
  v5[4] = self;
  [(SSRemoteAlertHandleProvider *)self _callDelegate:v5];
}

void __62__SSRemoteAlertHandleProvider_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteAlertHandleProviderDidDeactivate:*(void *)(a1 + 32)];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SSRemoteAlertHandleProvider remoteAlertHandle:didInvalidateWithError:]((uint64_t)v5, v6);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__SSRemoteAlertHandleProvider_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_2644ED8E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(SSRemoteAlertHandleProvider *)self _callDelegate:v8];
}

void __72__SSRemoteAlertHandleProvider_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteAlertHandleProvider:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

- (id)_screenshotServicesServiceAlertDefinition
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.ScreenshotServicesService" viewControllerClassName:@"SSSDittoRemoteAlertViewController"];
  [v2 setPrefersEmbeddedDisplayPresentation:1];
  return v2;
}

- (id)screenshotServicesAlertHandle
{
  id v3 = (void *)MEMORY[0x263F79428];
  id v4 = [(SSRemoteAlertHandleProvider *)self _screenshotServicesServiceAlertDefinition];
  id v5 = [v3 lookupHandlesForDefinition:v4 creatingIfNone:1];
  id v6 = [v5 firstObject];

  [v6 addObserver:self];
  return v6;
}

- (SSRemoteAlertHandleProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSRemoteAlertHandleProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21ECED000, a2, OS_LOG_TYPE_ERROR, "Remote alert handle invalidated with error %@", (uint8_t *)&v2, 0xCu);
}

@end