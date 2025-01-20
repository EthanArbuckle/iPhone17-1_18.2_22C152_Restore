@interface SESRKESessionInterface
+ (id)interface;
@end

@implementation SESRKESessionInterface

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SESRKESessionInterface];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:"getVehicleReports:" argumentIndex:0 ofReply:1];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:"sign:readerIdentifier:reply:" argumentIndex:0 ofReply:1];

  return v2;
}

@end