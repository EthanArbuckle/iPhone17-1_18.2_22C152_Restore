@interface PBDruidRemotePasteNotifier
- (void)notifyDeniedPaste;
- (void)notifyPaste:(id)a3;
@end

@implementation PBDruidRemotePasteNotifier

- (void)notifyPaste:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSXPCConnection);
  id v7 = [v4 initWithMachServiceName:DRPasteAnnouncementServiceName options:0];
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DRPasteAnnouncing];
  [v7 setRemoteObjectInterface:v5];

  v6 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&stru_100031BB0];
  [v7 resume];
  [v6 announcePaste:v3];

  [v7 invalidate];
}

- (void)notifyDeniedPaste
{
  id v2 = objc_alloc((Class)NSXPCConnection);
  id v5 = [v2 initWithMachServiceName:DRPasteAnnouncementServiceName options:0];
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DRPasteAnnouncing];
  [v5 setRemoteObjectInterface:v3];

  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_100031BD0];
  [v5 resume];
  [v4 announceDeniedPaste];
  [v5 invalidate];
}

@end