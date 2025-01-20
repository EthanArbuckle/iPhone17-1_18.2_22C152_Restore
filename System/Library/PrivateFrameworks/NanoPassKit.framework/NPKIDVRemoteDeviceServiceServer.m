@interface NPKIDVRemoteDeviceServiceServer
- (NPKIDVRemoteDeviceServiceServer)initWithConnection:(id)a3 delegate:(id)a4;
- (NPKIDVRemoteDeviceServiceServerDelegate)delegate;
- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4 ackHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation NPKIDVRemoteDeviceServiceServer

- (NPKIDVRemoteDeviceServiceServer)initWithConnection:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NPKIDVRemoteDeviceServiceServer;
  v7 = [(PDXPCService *)&v10 initWithConnection:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4 ackHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(void))a5;
  objc_super v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      int v15 = 138412546;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Receive event: %@ from remote device with ID:%@", (uint8_t *)&v15, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained identityRemoteDeviceServiceServer:self didReceiveEvent:a3 & 0x3F fromRemoteDeviceWithID:v8];

  v9[2](v9);
}

- (NPKIDVRemoteDeviceServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKIDVRemoteDeviceServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end