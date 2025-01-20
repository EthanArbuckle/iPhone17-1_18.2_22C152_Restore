@interface VolumeManagerNSXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LiveFSVolumeManager)server;
- (void)setServer:(id)a3;
@end

@implementation VolumeManagerNSXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000049DC(v8, v7);
  }
  v9 = [v7 valueForEntitlement:@"com.apple.private.LiveFS.connection"];
  v10 = v9;
  if (v9 && [v9 BOOLValue])
  {
    v11 = (void *)qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
      sub_100004948(v11, v7);
    }
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LiveFSVolumeManager];
    [v7 setExportedInterface:v12];

    v13 = [(VolumeManagerNSXPCListenerDelegate *)self server];
    [v7 setExportedObject:v13];

    [v7 resume];
    BOOL v14 = 1;
  }
  else
  {
    v15 = (void *)qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
      sub_1000048A4(v15, v7);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (LiveFSVolumeManager)server
{
  return (LiveFSVolumeManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end