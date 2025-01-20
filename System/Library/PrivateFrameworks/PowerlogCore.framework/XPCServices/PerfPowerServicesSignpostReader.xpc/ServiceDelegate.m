@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  NSLog(@"In the listener of the Signpost Reader XPCService");
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___XPCSignpostReaderProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  if (_os_feature_enabled_impl())
  {
    v7 = PLLogSignpostReader();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000CB28(v7);
    }

    [v4 setInterruptionHandler:&stru_1000143F0];
    [v4 setInvalidationHandler:&stru_1000143F0];
  }
  [v4 resume];

  return 1;
}

@end