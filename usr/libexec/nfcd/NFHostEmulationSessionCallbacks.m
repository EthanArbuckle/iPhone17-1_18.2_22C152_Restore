@interface NFHostEmulationSessionCallbacks
+ (id)interface;
@end

@implementation NFHostEmulationSessionCallbacks

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFHostEmulationSessionCallbacks];
  id v3 = objc_alloc((Class)NSSet);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = [v3 initWithObjects:v4, v5, objc_opt_class(), 0];
  [v2 setClasses:v6 forSelector:"didReceiveField:" argumentIndex:0 ofReply:0];

  id v7 = objc_alloc((Class)NSSet);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = [v7 initWithObjects:v8, v9, objc_opt_class(), 0];
  [v2 setClasses:v10 forSelector:"suspensionStateUpdate:triggeredByField:" argumentIndex:1 ofReply:0];

  return v2;
}

@end