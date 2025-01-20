@interface NFContactlessSessionInterface
+ (id)interface;
@end

@implementation NFContactlessSessionInterface

+ (id)interface
{
  id v2 = objc_alloc((Class)NSSet);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = [v2 initWithObjects:v3, v4, objc_opt_class(), 0];
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFContactlessSessionInterface];
  [v7 setClasses:v6 forSelector:"setActiveApplet:completion:" argumentIndex:0 ofReply:0];
  [v7 setClasses:v6 forSelector:"setActiveApplet:completion:" argumentIndex:0 ofReply:1];
  [v7 setClasses:v5 forSelector:"getAppletsWithCompletion:" argumentIndex:0 ofReply:1];
  [v7 setClasses:v6 forSelector:"getAppletsWithCompletion:" argumentIndex:1 ofReply:1];

  return v7;
}

@end