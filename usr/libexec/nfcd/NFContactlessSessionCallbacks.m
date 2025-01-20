@interface NFContactlessSessionCallbacks
+ (id)interface;
@end

@implementation NFContactlessSessionCallbacks

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFContactlessSessionCallbacks];
  id v3 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
  [v2 setClasses:v3 forSelector:"didDetectFieldNotification:" argumentIndex:0 ofReply:0];

  id v16 = objc_alloc((Class)NSSet);
  uint64_t v15 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = [v16 initWithObjects:v15, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0];
  [v2 setClasses:v13 forSelector:"didFelicaStateChange:" argumentIndex:0 ofReply:0];

  return v2;
}

@end