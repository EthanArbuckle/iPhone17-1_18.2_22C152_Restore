@interface NFReaderSessionInternalCallbacks
+ (id)interface;
@end

@implementation NFReaderSessionInternalCallbacks

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFReaderSessionInternalCallbacks];
  id v3 = objc_alloc((Class)NSSet);
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 initWithObjects:v4, objc_opt_class(), 0];
  [v2 setClasses:v5 forSelector:"didDetectTags:connectedTagIndex:" argumentIndex:0 ofReply:0];

  id v6 = objc_alloc((Class)NSSet);
  uint64_t v7 = objc_opt_class();
  id v8 = [v6 initWithObjects:v7, objc_opt_class(), nil];
  [v2 setClasses:v8 forSelector:"didDetectNDEFMessages:fromTags:connectedTagIndex:updateUICallback:" argumentIndex:0 ofReply:0];

  id v9 = objc_alloc((Class)NSSet);
  uint64_t v10 = objc_opt_class();
  id v11 = [v9 initWithObjects:v10, objc_opt_class(), 0];
  [v2 setClasses:v11 forSelector:"didDetectNDEFMessages:fromTags:connectedTagIndex:updateUICallback:" argumentIndex:1 ofReply:0];

  id v12 = objc_alloc((Class)NSSet);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v15 = [v12 initWithObjects:v13, v14, objc_opt_class(), 0];
  [v2 setClasses:v15 forSelector:"didDetectExternalReaderWithNotification:" argumentIndex:0 ofReply:0];

  return v2;
}

@end