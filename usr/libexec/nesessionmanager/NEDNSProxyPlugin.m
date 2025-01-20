@interface NEDNSProxyPlugin
- (id)remotePluginInterface;
@end

@implementation NEDNSProxyPlugin

- (id)remotePluginInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEDNSProxyPluginDriver];
  uint64_t v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"setSystemDNSSettings:" argumentIndex:0 ofReply:0];

  return v2;
}

@end