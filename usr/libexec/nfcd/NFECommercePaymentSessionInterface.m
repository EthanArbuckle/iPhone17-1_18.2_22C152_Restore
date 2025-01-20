@interface NFECommercePaymentSessionInterface
+ (id)interface;
@end

@implementation NFECommercePaymentSessionInterface

+ (id)interface
{
  id v2 = objc_alloc((Class)NSSet);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = [v2 initWithObjects:v3, v4, objc_opt_class(), 0];
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFECommercePaymentSessionInterface];
  [v6 setClasses:v5 forSelector:"getAppletsWithCompletion:" argumentIndex:0 ofReply:1];

  return v6;
}

@end