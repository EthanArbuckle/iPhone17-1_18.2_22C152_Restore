@interface NFReaderSessionInterface
+ (id)interface;
+ (void)_configureInterface:(id)a3;
@end

@implementation NFReaderSessionInterface

+ (id)interface
{
  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFReaderSessionInterface];
  [a1 _configureInterface:v3];

  return v3;
}

+ (void)_configureInterface:(id)a3
{
  id v3 = a3;
  id v12 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
  id v4 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
  [v3 setClasses:v12 forSelector:"connect:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v12 forSelector:"connect:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v12 forSelector:"transceive:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ndefWrite:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v4 forSelector:"ndefReadWithCompletion:" argumentIndex:1 ofReply:1];
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = [v5 initWithObjects:v6, v7, v8, v9, v10, objc_opt_class(), 0];
  [v3 setClasses:v11 forSelector:"performVAS:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v11 forSelector:"performVAS:completion:" argumentIndex:1 ofReply:1];
}

@end