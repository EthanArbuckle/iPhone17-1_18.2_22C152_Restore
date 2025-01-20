@interface AUServiceAdapter
+ (id)sharedInstance;
- (BOOL)hasActiveConnection;
- (FudPlugin)updater;
- (NSXPCConnection)activeConnection;
- (id)_init;
- (void)accessoryDisconnected:(id)a3;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)deviceClassAttached:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)issueNotification:(id)a3;
- (void)log:(int)a3 format:(id)a4;
- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5;
- (void)personalizationRequest:(id)a3;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)progress:(double)a3;
- (void)queryDeviceList:(id)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)setActiveConnection:(id)a3;
@end

@implementation AUServiceAdapter

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)AUServiceAdapter;
  v2 = [(AUServiceAdapter *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_activeConnection = 0;
  }
  else {
    NSLog(&cfstr_SErrorCouldNot.isa, "-[AUServiceAdapter _init]");
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__AUServiceAdapter_sharedInstance__block_invoke;
  block[3] = &unk_2647FC938;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_sharedInstance;
}

uint64_t __34__AUServiceAdapter_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _init];
  sharedInstance_sharedInstance = result;
  return result;
}

- (BOOL)hasActiveConnection
{
  return self->_activeConnection != 0;
}

- (void)deviceClassAttached:(id)a3 options:(id)a4 withReply:(id)a5
{
  uint64_t v12 = 0;
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "principalClass");
  if ([(objc_class *)v9 conformsToProtocol:&unk_26DB3D378])
  {
    updater = (FudPlugin *)[[v9 alloc] initWithDeviceClass:a3 delegate:self info:&v12 options:a4];
    self->_updater = updater;
    uint64_t v11 = v12;
  }
  else
  {
    NSLog(&cfstr_SErrorPrincipa.isa, "-[AUServiceAdapter deviceClassAttached:options:withReply:]");
    uint64_t v11 = 0;
    updater = self->_updater;
  }
  (*((void (**)(id, BOOL, uint64_t))a5 + 2))(a5, updater != 0, v11);
}

- (void)bootstrapWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater bootstrapWithOptions:a3];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, "-[AUServiceAdapter bootstrapWithOptions:]");
  }
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater findFirmwareWithOptions:a3 remote:a4];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, a4, "-[AUServiceAdapter findFirmwareWithOptions:remote:]");
  }
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater downloadFirmwareWithOptions:a3];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, "-[AUServiceAdapter downloadFirmwareWithOptions:]");
  }
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater prepareFirmwareWithOptions:a3];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, "-[AUServiceAdapter prepareFirmwareWithOptions:]");
  }
}

- (void)applyFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater applyFirmwareWithOptions:a3];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, "-[AUServiceAdapter applyFirmwareWithOptions:]");
  }
}

- (void)finishWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater)
  {
    [(FudPlugin *)updater finishWithOptions:a3];
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, "-[AUServiceAdapter finishWithOptions:]");
  }
}

- (void)queryDeviceList:(id)a3
{
  uint64_t v8 = 0;
  updater = self->_updater;
  if (!updater)
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, "-[AUServiceAdapter queryDeviceList:]");
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  if (([(FudPlugin *)updater conformsToProtocol:&unk_26DB3D3D8] & 1) == 0)
  {
    NSLog(&cfstr_SPluginDoesSup.isa, v6, "-[AUServiceAdapter queryDeviceList:]");
    goto LABEL_7;
  }
  [(FudPlugin *)self->_updater queryDeviceList:&v8];
  uint64_t v7 = v8;
LABEL_4:
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  updater = self->_updater;
  if (updater)
  {
    if ([(FudPlugin *)updater conformsToProtocol:&unk_26DB3D438])
    {
      v14 = self->_updater;
      [(FudPlugin *)v14 personalizationResponse:a3 response:a4 status:a5];
    }
    else
    {
      NSLog(&cfstr_SPluginDoesSup_0.isa, v10, v11, v12, v13, "-[AUServiceAdapter personalizationResponse:response:status:]");
    }
  }
  else
  {
    NSLog(&cfstr_SPluginNotLoad.isa, a2, a3, a4, a5, "-[AUServiceAdapter personalizationResponse:response:status:]");
  }
}

- (void)accessoryDisconnected:(id)a3
{
  id v4 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v4 accessoryDisconnected:a3];
}

void __42__AUServiceAdapter_accessoryDisconnected___block_invoke()
{
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_170];
  [v8 didBootstrap:v7 info:a4 error:a5];
}

void __44__AUServiceAdapter_didBootstrap_info_error___block_invoke()
{
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v11 = a3;
  id v12 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_172];
  [v12 didFind:v11 info:a4 updateAvailable:v9 needsDownload:v8 error:a7];
}

void __69__AUServiceAdapter_didFind_info_updateAvailable_needsDownload_error___block_invoke()
{
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_174];
  [v8 didDownload:v7 info:a4 error:a5];
}

void __43__AUServiceAdapter_didDownload_info_error___block_invoke()
{
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_176];
  [v8 didPrepare:v7 info:a4 error:a5];
}

void __42__AUServiceAdapter_didPrepare_info_error___block_invoke()
{
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_178];
  [v8 didApply:v7 info:a4 error:a5];
}

void __40__AUServiceAdapter_didApply_info_error___block_invoke()
{
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v8 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_180];
  [v8 didFinish:v7 info:a4 error:a5];
}

void __41__AUServiceAdapter_didFinish_info_error___block_invoke()
{
}

- (void)personalizationRequest:(id)a3
{
  id v4 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_182];
  [v4 personalizationRequest:a3];
}

void __43__AUServiceAdapter_personalizationRequest___block_invoke()
{
}

- (void)progress:(double)a3
{
  id v4 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_184];
  [v4 progress:a3];
}

void __29__AUServiceAdapter_progress___block_invoke()
{
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
  id v6 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_186];
  [v6 reportAnalytics:a3 info:a4];
}

void __41__AUServiceAdapter_reportAnalytics_info___block_invoke()
{
}

- (void)issueNotification:(id)a3
{
  id v4 = [(NSXPCConnection *)self->_activeConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_188];
  [v4 issueNotification:a3];
}

void __38__AUServiceAdapter_issueNotification___block_invoke()
{
}

- (void)log:(int)a3 format:(id)a4
{
  [(AUServiceAdapter *)self logv:*(void *)&a3 format:a4 arguments:&v4];
}

- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5
{
}

- (FudPlugin)updater
{
  return self->_updater;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  self->_activeConnection = (NSXPCConnection *)a3;
}

@end