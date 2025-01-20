@interface NFSecureElementReaderSessionCallbacks
+ (id)interface;
@end

@implementation NFSecureElementReaderSessionCallbacks

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFSecureElementReaderSessionCallbacks];
  id v3 = objc_alloc((Class)NSSet);
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 initWithObjects:v4, objc_opt_class(), 0];
  [v2 setClasses:v5 forSelector:"didDetectTags:" argumentIndex:0 ofReply:0];

  id v6 = objc_alloc((Class)NSSet);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = [v6 initWithObjects:v7, v8, v9, v10, v11, objc_opt_class(), 0];
  [v2 setClasses:v12 forSelector:"didStartSecureElementReader:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v12 forSelector:"didEndSecureElementReader:" argumentIndex:0 ofReply:0];

  return v2;
}

@end