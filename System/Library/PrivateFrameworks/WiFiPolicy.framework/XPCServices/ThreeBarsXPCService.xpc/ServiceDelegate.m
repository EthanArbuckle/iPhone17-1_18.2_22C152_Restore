@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TBXPCServiceProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  [v4 resume];

  NSLog(@"%s: new connection has resumed", "-[ServiceDelegate listener:shouldAcceptNewConnection:]");
  return 1;
}

@end