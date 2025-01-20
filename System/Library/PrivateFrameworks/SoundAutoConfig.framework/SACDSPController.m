@interface SACDSPController
- (SACDSPController)init;
- (SACDSPDelegate)delegate;
- (void)getDSPInfoByKey:(id)a3 withReply:(id)a4;
- (void)handleServiceCrash;
- (void)setDSPConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startServiceConnection;
@end

@implementation SACDSPController

- (SACDSPController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SACDSPController;
  v2 = [(SACDSPController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    mServiceConnection = v2->mServiceConnection;
    v2->mServiceConnection = 0;

    mProxyInterface = v3->mProxyInterface;
    v3->mProxyInterface = 0;

    [(SACDSPController *)v3 startServiceConnection];
  }
  return v3;
}

- (void)startServiceConnection
{
  v17[2] = *(id *)MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SACDSPController startServiceConnection]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "com.apple.internal.soundautoconfigservice";
    _os_log_impl(&dword_237609000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s Starting xpc conn with: %s\n", buf, 0x16u);
  }
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.internal.soundautoconfigservice"];
  mServiceConnection = self->mServiceConnection;
  self->mServiceConnection = v3;

  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EA57EC8];
  [(NSXPCConnection *)self->mServiceConnection setRemoteObjectInterface:v5];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3042000000;
  v15 = sub_23760A090;
  v16 = sub_23760A09C;
  objc_initWeak(v17, self);
  v6 = self->mServiceConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23760A0A4;
  v13[3] = &unk_264CD9F30;
  v13[4] = buf;
  [(NSXPCConnection *)v6 setInterruptionHandler:v13];
  objc_super v7 = self->mServiceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23760A108;
  v12[3] = &unk_264CD9F30;
  v12[4] = buf;
  [(NSXPCConnection *)v7 setInvalidationHandler:v12];
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EA57690];
  [(NSXPCConnection *)self->mServiceConnection setExportedInterface:v8];

  [(NSXPCConnection *)self->mServiceConnection setExportedObject:self];
  [(NSXPCConnection *)self->mServiceConnection resume];
  uint64_t v9 = [(NSXPCConnection *)self->mServiceConnection remoteObjectProxy];
  mProxyInterface = self->mProxyInterface;
  p_mProxyInterface = (id *)&self->mProxyInterface;
  id *p_mProxyInterface = (id)v9;

  [*p_mProxyInterface registerAsClientWithConnectionType:0];
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v17);
}

- (void)handleServiceCrash
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237609000, &_os_log_internal, OS_LOG_TYPE_INFO, "Delaying checking in with service a few seconds...\n", buf, 2u);
  }
  mServiceConnection = self->mServiceConnection;
  if (mServiceConnection)
  {
    self->mServiceConnection = 0;
  }
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23760A24C;
  block[3] = &unk_264CD9F58;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

- (void)setDSPConfig:(id)a3
{
  id v7 = a3;
  dispatch_time_t v4 = [(SACDSPController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SACDSPController *)self delegate];
    [v6 setDSPConfig:v7];
  }
}

- (void)getDSPInfoByKey:(id)a3 withReply:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, void *))a4;
  id v7 = [(SACDSPController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(SACDSPController *)self delegate];
    v10 = [v9 getDSPInfoByKey:v11];
    v6[2](v6, v10);
  }
}

- (SACDSPDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SACDSPDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSACDSPDelegate, 0);
  objc_storeStrong((id *)&self->mProxyInterface, 0);

  objc_storeStrong((id *)&self->mServiceConnection, 0);
}

@end