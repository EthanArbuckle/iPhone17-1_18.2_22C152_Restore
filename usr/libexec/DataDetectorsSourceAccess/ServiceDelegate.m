@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DataDetectorsSourceAccessProtocol];
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v5 setClasses:v7 forSelector:"filesForSourceRead:resourceType:withReply:" argumentIndex:0 ofReply:0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);

  [v5 setClasses:v10 forSelector:"filesForSourceRead:resourceType:withReply:" argumentIndex:0 ofReply:1];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);

  [v5 setClasses:v14 forSelector:"writeSourceFromRawData:source:signature:withReply:" argumentIndex:0 ofReply:0];
  [v4 setExportedInterface:v5];
  v15 = objc_opt_new();
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  v17[0] = v18;
  v17[1] = v19;
  [v15 setAuditToken:v17];
  [v15 setProcessIdentifier:[v4 processIdentifier]];
  [v15 setUserIdentifier:[v4 effectiveUserIdentifier]];
  [v4 setExportedObject:v15];
  [v4 resume];

  return 1;
}

@end