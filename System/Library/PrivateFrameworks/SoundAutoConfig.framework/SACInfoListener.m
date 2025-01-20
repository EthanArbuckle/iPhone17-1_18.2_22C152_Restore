@interface SACInfoListener
- (SACInfoDelegate)delegate;
- (SACInfoListener)init;
- (void)handleSACInfo:(id)a3;
- (void)handleServiceCrash;
- (void)setDelegate:(id)a3;
- (void)setListenerVerbosity:(unint64_t)a3;
- (void)startServiceConnection;
@end

@implementation SACInfoListener

- (SACInfoListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)SACInfoListener;
  v2 = [(SACInfoListener *)&v7 init];
  v3 = v2;
  if (v2)
  {
    mServiceConnection = v2->mServiceConnection;
    v2->mServiceConnection = 0;

    mProxyInterface = v3->mProxyInterface;
    v3->mProxyInterface = 0;

    v3->mVerbosity = 1;
    [(SACInfoListener *)v3 startServiceConnection];
  }
  return v3;
}

- (void)startServiceConnection
{
  NSLog(&cfstr_SStartingXpcCo_0.isa, a2, "-[SACInfoListener startServiceConnection]", "com.apple.internal.soundautoconfigservice");
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.internal.soundautoconfigservice"];
  mServiceConnection = self->mServiceConnection;
  self->mServiceConnection = v3;

  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EA57EC8];
  [(NSXPCConnection *)self->mServiceConnection setRemoteObjectInterface:v5];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3042000000;
  v13[3] = sub_23760A734;
  v13[4] = sub_23760A740;
  objc_initWeak(&v14, self);
  v6 = self->mServiceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23760A748;
  v12[3] = &unk_264CD9F30;
  v12[4] = v13;
  [(NSXPCConnection *)v6 setInterruptionHandler:v12];
  objc_super v7 = self->mServiceConnection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23760A7AC;
  v11[3] = &unk_264CD9F30;
  v11[4] = v13;
  [(NSXPCConnection *)v7 setInvalidationHandler:v11];
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EA577A8];
  [(NSXPCConnection *)self->mServiceConnection setExportedInterface:v8];

  [(NSXPCConnection *)self->mServiceConnection setExportedObject:self];
  [(NSXPCConnection *)self->mServiceConnection resume];
  v9 = [(NSXPCConnection *)self->mServiceConnection remoteObjectProxy];
  mProxyInterface = self->mProxyInterface;
  self->mProxyInterface = v9;

  [(SACServiceDelegate *)self->mProxyInterface registerAsInfoListener];
  _Block_object_dispose(v13, 8);
  objc_destroyWeak(&v14);
}

- (void)handleServiceCrash
{
  NSLog(&cfstr_DelayingChecki_0.isa, a2);
  mServiceConnection = self->mServiceConnection;
  if (mServiceConnection)
  {
    self->mServiceConnection = 0;
  }
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23760A8BC;
  block[3] = &unk_264CD9F58;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

- (void)setListenerVerbosity:(unint64_t)a3
{
  self->mVerbosity = a3;
  mProxyInterface = self->mProxyInterface;
  if (mProxyInterface) {
    MEMORY[0x270F9A6D0](mProxyInterface, sel_setVerbosityForClient_);
  }
}

- (void)handleSACInfo:(id)a3
{
  id v7 = a3;
  dispatch_time_t v4 = [(SACInfoListener *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SACInfoListener *)self delegate];
    [v6 handleSACInfo:v7];
  }
}

- (SACInfoDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->mProxyInterface, 0);

  objc_storeStrong((id *)&self->mServiceConnection, 0);
}

@end