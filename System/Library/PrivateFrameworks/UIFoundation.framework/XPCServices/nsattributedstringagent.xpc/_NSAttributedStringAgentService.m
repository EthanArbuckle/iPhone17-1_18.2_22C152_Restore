@interface _NSAttributedStringAgentService
+ (id)sharedApplication;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_NSAttributedStringAgentService)init;
- (void)start;
@end

@implementation _NSAttributedStringAgentService

+ (id)sharedApplication
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)qword_100008858;
  uint64_t v10 = qword_100008858;
  if (!qword_100008858)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100001E9C;
    v6[3] = &unk_1000041C8;
    v6[4] = &v7;
    sub_100001E9C((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 sharedApplication];

  return v4;
}

- (_NSAttributedStringAgentService)init
{
  v6.receiver = self;
  v6.super_class = (Class)_NSAttributedStringAgentService;
  v2 = [(_NSAttributedStringAgentService *)&v6 init];
  id v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.textkit.nsattributedstringagent"];
  listener = v2->_listener;
  v2->_listener = v3;

  [(NSXPCListener *)v2->_listener setDelegate:v2];
  return v2;
}

- (void)start
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSAttributedString _allowedTokensClasses];
  objc_super v6 = +[NSAttributedString _allowedOptionClasses];
  uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____NSAttributedStringAgentProtocol];
  [v7 setClasses:v6 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:1 ofReply:0];
  [v7 setClasses:v5 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:2 ofReply:0];
  [v7 setClasses:v6 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:0 ofReply:1];
  [v7 setClasses:v6 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:2 ofReply:0];
  [v7 setClasses:v5 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:3 ofReply:0];
  [v7 setClasses:v6 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:1 ofReply:1];
  [v4 setExportedInterface:v7];
  v8 = objc_opt_new();
  [v4 setExportedObject:v8];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end