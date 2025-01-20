@interface CKServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation CKServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.siriknowledged"];

  if (v5)
  {
    v6 = +[_TtC13CoreKnowledge21CoreKnowledgeXPCUtils CKServiceXPCInterface];
    [v4 setExportedInterface:v6];

    v7 = +[CKDaemon sharedDaemon];
    [v4 setExportedObject:v7];

    [v4 resume];
    v8 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      int v13 = 136315394;
      v14 = "-[CKServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v15 = 1024;
      unsigned int v16 = [v4 processIdentifier];
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s New connection established to process %d", (uint8_t *)&v13, 0x12u);
    }
  }
  else
  {
    v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v12 = v10;
      int v13 = 136315650;
      v14 = "-[CKServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v15 = 1024;
      unsigned int v16 = [v4 processIdentifier];
      __int16 v17 = 2112;
      CFStringRef v18 = @"com.apple.siriknowledged";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Trying to establish a connection from a process (%d) not entitled for %@", (uint8_t *)&v13, 0x1Cu);
    }
  }

  return v5 != 0;
}

@end