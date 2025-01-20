@interface StreamingUnzipServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation StreamingUnzipServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  __chkstk_darwin(self, a2, a3, a4);
  v5 = v4;
  id v7 = v6;
  id v8 = v5;
  v9 = @"com.apple.private.SZExtractor.privileged";
  v10 = [v8 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
    id v12 = [v8 processIdentifier];
    int v13 = proc_pidpath((int)v12, &buffer, 0x1000u);
    if (v13 < 1)
    {
      v16 = +[NSString stringWithFormat:@"Unknown Process Name (pid %d)", v12];
    }
    else
    {
      id v14 = [objc_alloc((Class)NSString) initWithBytes:&buffer length:v13 encoding:4];
      v15 = [v14 lastPathComponent];
      v16 = +[NSString stringWithFormat:@"%@ (pid %d)", v15, v12];
    }
    v17 = sub_100003788();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    uint64_t v18 = qos_class_self();
    if ((int)v18 > 20)
    {
      switch(v18)
      {
        case 0x15:
          v19 = @"DEFAULT";
          goto LABEL_21;
        case 0x21:
          v19 = @"USER_INTERACTIVE";
          goto LABEL_21;
        case 0x19:
          v19 = @"USER_INITIATED";
          goto LABEL_21;
      }
    }
    else
    {
      switch(v18)
      {
        case 0:
          v19 = @"UNSPECIFIED";
          goto LABEL_21;
        case 9:
          v19 = @"BACKGROUND";
          goto LABEL_21;
        case 0x11:
          v19 = @"UTILITY";
LABEL_21:
          int buffer = 138412546;
          v28 = v16;
          __int16 v29 = 2112;
          v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Got connection from process %@ at qos %@", (uint8_t *)&buffer, 0x16u);

LABEL_22:
          v20 = sub_100018E18();
          [v8 setExportedInterface:v20];

          id v21 = [[StreamingUnzipper alloc] initForClient:v16 connection:v8];
          [v8 setExportedObject:v21];
          v22 = sub_100018894();
          [v8 setRemoteObjectInterface:v22];

          [v21 setXpcConnection:v8];
          [v8 setInterruptionHandler:&stru_1000286E8];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000037DC;
          v25[3] = &unk_100028C10;
          id v26 = v21;
          id v23 = v21;
          [v8 setInvalidationHandler:v25];
          [v8 resume];

          goto LABEL_23;
      }
    }
    v19 = +[NSString stringWithFormat:@"UNKNOWN_QOS: 0x%x", v18];
    goto LABEL_21;
  }
  [v8 invalidate];
LABEL_23:

  return v11;
}

@end