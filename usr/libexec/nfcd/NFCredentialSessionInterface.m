@interface NFCredentialSessionInterface
+ (id)interface;
@end

@implementation NFCredentialSessionInterface

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFCredentialSessionInterface];
  uint64_t v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"requestApplets:selectOnStart:AIDAllowList:externalAuth:mode:completion:" argumentIndex:0 ofReply:0];
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:"requestApplets:selectOnStart:AIDAllowList:externalAuth:mode:completion:" argumentIndex:1 ofReply:0];

  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:"requestApplets:selectOnStart:AIDAllowList:externalAuth:mode:completion:" argumentIndex:2 ofReply:0];

  [v2 setClasses:v4 forSelector:"deleteApplets:completion:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:"listAppletsAndRefreshCache:completion:" argumentIndex:0 ofReply:1];

  return v2;
}

@end