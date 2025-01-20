@interface NFSecureElementReaderSessionInterface
+ (id)interface;
+ (void)_configureInterface:(id)a3;
@end

@implementation NFSecureElementReaderSessionInterface

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFSecureElementReaderSessionInterface];
  +[NFSecureElementReaderSessionInterface _configureInterface:v2];

  return v2;
}

+ (void)_configureInterface:(id)a3
{
  id v3 = a3;
  id v14 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
  id v4 = objc_alloc((Class)NSSet);
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 initWithObjects:v5, objc_opt_class(), 0];
  [v3 setClasses:v6 forSelector:"selectApplets:completion:" argumentIndex:0 ofReply:0];

  [v3 setClasses:v14 forSelector:"connect:completion:" argumentIndex:0 ofReply:0];
  id v7 = objc_alloc((Class)NSSet);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = [v7 initWithObjects:v8, v9, v10, v11, v12, objc_opt_class(), 0];
  [v3 setClasses:v13 forSelector:"performVAS:select:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v13 forSelector:"performVAS:select:completion:" argumentIndex:1 ofReply:1];
}

@end