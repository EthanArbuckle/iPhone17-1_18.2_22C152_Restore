@interface TRDeviceSetupBrowser
- (TRDeviceSetupBrowser)init;
- (TRDeviceSetupBrowserDelegate)delegate;
- (TRDeviceSetupPeripheral)peripheral;
- (TRTransferBrowser)transferBrowser;
- (int64_t)state;
- (void)browser:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5;
- (void)browser:(id)a3 didStartTransferWithSendDataHandler:(id)a4;
- (void)browserDidChangeState:(id)a3;
- (void)browserDidDisconnect:(id)a3;
- (void)defer;
- (void)setDelegate:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setTransferBrowser:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TRDeviceSetupBrowser

- (TRDeviceSetupBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupBrowser;
  v2 = [(TRDeviceSetupBrowser *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TRTransferBrowser);
    transferBrowser = v2->_transferBrowser;
    v2->_transferBrowser = v3;

    [(TRTransferBrowser *)v2->_transferBrowser setDelegate:v2];
  }
  return v2;
}

- (void)browserDidChangeState:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 deviceSetupBrowserDidChangeState:self];
  }
}

- (void)browser:(id)a3 didStartTransferWithSendDataHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (self->_peripheral)
  {
    if (_TRLogEnabled == 1)
    {
      v8 = TRLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        peripheral = self->_peripheral;
        int v15 = 138412290;
        v16 = peripheral;
        _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupBrowser] Already have peripheral: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    v7[2](v7, 0);
  }
  else
  {
    v10 = objc_alloc_init(TRDeviceSetupPeripheral);
    v11 = self->_peripheral;
    self->_peripheral = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 deviceSetupBrowser:self didFindPeripheral:self->_peripheral];
    }
    [(TRDeviceSetupPeripheral *)self->_peripheral _didTapWithSendDataHandler:v7];
  }
}

- (void)browser:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5
{
}

- (void)browserDidDisconnect:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      peripheral = self->_peripheral;
      int v12 = 138412290;
      char v13 = peripheral;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupBrowser] Peripheral disconnected: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = self->_peripheral;
  [(TRDeviceSetupPeripheral *)self->_peripheral _didDisconnect];
  v8 = self->_peripheral;
  self->_peripheral = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 deviceSetupBrowser:self didRemovePeripheral:v7];
  }
}

- (void)start
{
}

- (int64_t)state
{
  return [(TRTransferBrowser *)self->_transferBrowser state];
}

- (void)defer
{
}

- (void)stop
{
}

- (TRDeviceSetupBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRDeviceSetupBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TRTransferBrowser)transferBrowser
{
  return self->_transferBrowser;
}

- (void)setTransferBrowser:(id)a3
{
}

- (TRDeviceSetupPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_transferBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end