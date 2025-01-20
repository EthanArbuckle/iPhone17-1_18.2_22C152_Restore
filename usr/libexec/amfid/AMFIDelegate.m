@interface AMFIDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation AMFIDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(AMFIService);
  v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[AMFIDelegate listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: received NSXPC Connection", (uint8_t *)&v9, 0xCu);
  }
  [(AMFIService *)v5 setConnection:v4];
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AMFIProtocol];
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:v5];
  [v4 resume];

  return 1;
}

@end