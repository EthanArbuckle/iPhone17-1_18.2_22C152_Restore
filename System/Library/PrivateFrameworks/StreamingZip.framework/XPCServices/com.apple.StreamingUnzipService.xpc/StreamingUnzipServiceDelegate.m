@interface StreamingUnzipServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation StreamingUnzipServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  __chkstk_darwin(self, a2, a3, a4);
  id v5 = v4;
  id v6 = [v5 processIdentifier];
  int v7 = proc_pidpath((int)v6, &buffer, 0x1000u);
  if (v7 < 1)
  {
    v10 = +[NSString stringWithFormat:@"Unknown Process Name (pid %d)", v6];
  }
  else
  {
    id v8 = [objc_alloc((Class)NSString) initWithBytes:&buffer length:v7 encoding:4];
    v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:@"%@ (pid %d)", v9, v6];
  }
  v11 = sub_100003788();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = qos_class_self();
    if ((int)v12 > 20)
    {
      switch(v12)
      {
        case 0x15:
          v13 = @"DEFAULT";
          goto LABEL_19;
        case 0x21:
          v13 = @"USER_INTERACTIVE";
          goto LABEL_19;
        case 0x19:
          v13 = @"USER_INITIATED";
          goto LABEL_19;
      }
    }
    else
    {
      switch(v12)
      {
        case 0:
          v13 = @"UNSPECIFIED";
          goto LABEL_19;
        case 9:
          v13 = @"BACKGROUND";
          goto LABEL_19;
        case 0x11:
          v13 = @"UTILITY";
LABEL_19:
          int buffer = 138412546;
          v22 = v10;
          __int16 v23 = 2112;
          v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Got connection from process %@ at qos %@", (uint8_t *)&buffer, 0x16u);

          goto LABEL_20;
      }
    }
    v13 = +[NSString stringWithFormat:@"UNKNOWN_QOS: 0x%x", v12];
    goto LABEL_19;
  }
LABEL_20:

  v14 = sub_100018E18();
  [v5 setExportedInterface:v14];

  id v15 = [[StreamingUnzipper alloc] initForClient:v10 connection:v5];
  [v5 setExportedObject:v15];
  v16 = sub_100018894();
  [v5 setRemoteObjectInterface:v16];

  [v15 setXpcConnection:v5];
  [v5 setInterruptionHandler:&stru_1000286E8];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000037DC;
  v19[3] = &unk_100028C10;
  id v20 = v15;
  id v17 = v15;
  [v5 setInvalidationHandler:v19];
  [v5 resume];

  return 1;
}

@end