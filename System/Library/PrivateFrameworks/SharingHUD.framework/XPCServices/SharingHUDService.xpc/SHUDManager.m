@interface SHUDManager
- (NSXPCConnection)xpcConnection;
- (SHUDManager)init;
- (SUIHUDHostProtocol)remoteObject;
- (id)bannerRequestHandler;
- (id)currentBannerRequest;
- (id)dismissBannerHandler;
- (id)updatePairedUnlockHandler;
- (void)bannerButtonTappedWithType:(int64_t)a3;
- (void)bannerDismissedWithType:(int64_t)a3;
- (void)dismissBanner;
- (void)setBannerRequestHandler:(id)a3;
- (void)setDismissBannerHandler:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setUpdatePairedUnlockHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)showBanner:(id)a3;
- (void)updatePairedUnlockBannerToUnlocked;
@end

@implementation SHUDManager

- (SHUDManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SHUDManager;
  v2 = [(SHUDManager *)&v8 init];
  v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.sharing.HUD" options:0];
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = v3;

  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUIHUDHostProtocol];
  [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

  [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUIHUDClientProtocol];
  [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v6];

  [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&stru_100014610];
  [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&stru_100014630];
  [(NSXPCConnection *)v2->_xpcConnection resume];
  return v2;
}

- (SUIHUDHostProtocol)remoteObject
{
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&stru_100014670];
    v5 = self->_remoteObject;
    self->_remoteObject = v4;

    remoteObject = self->_remoteObject;
  }
  return remoteObject;
}

- (id)currentBannerRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10000B7BC;
  v10 = sub_10000B7CC;
  id v11 = 0;
  v2 = [(SHUDManager *)self remoteObject];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B7D4;
  v5[3] = &unk_100014698;
  v5[4] = &v6;
  [v2 currentBannerRequestWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)bannerDismissedWithType:(int64_t)a3
{
  id v4 = [(SHUDManager *)self remoteObject];
  [v4 bannerDidDismissWithType:a3];
}

- (void)bannerButtonTappedWithType:(int64_t)a3
{
  id v4 = [(SHUDManager *)self remoteObject];
  [v4 bannerButtonTappedWithType:a3];
}

- (void)showBanner:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested to display paired unlock banner", v8, 2u);
    }
  }
  uint64_t v6 = [(SHUDManager *)self bannerRequestHandler];

  if (v6)
  {
    v7 = [(SHUDManager *)self bannerRequestHandler];
    ((void (**)(void, id))v7)[2](v7, v4);
  }
}

- (void)updatePairedUnlockBannerToUnlocked
{
  id v3 = [(SHUDManager *)self updatePairedUnlockHandler];

  if (v3)
  {
    id v4 = [(SHUDManager *)self updatePairedUnlockHandler];
    v4[2]();
  }
}

- (void)dismissBanner
{
  id v3 = [(SHUDManager *)self dismissBannerHandler];

  if (v3)
  {
    id v4 = [(SHUDManager *)self dismissBannerHandler];
    v4[2]();
  }
}

- (id)bannerRequestHandler
{
  return self->_bannerRequestHandler;
}

- (void)setBannerRequestHandler:(id)a3
{
}

- (id)updatePairedUnlockHandler
{
  return self->_updatePairedUnlockHandler;
}

- (void)setUpdatePairedUnlockHandler:(id)a3
{
}

- (id)dismissBannerHandler
{
  return self->_dismissBannerHandler;
}

- (void)setDismissBannerHandler:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_dismissBannerHandler, 0);
  objc_storeStrong(&self->_updatePairedUnlockHandler, 0);
  objc_storeStrong(&self->_bannerRequestHandler, 0);
}

@end