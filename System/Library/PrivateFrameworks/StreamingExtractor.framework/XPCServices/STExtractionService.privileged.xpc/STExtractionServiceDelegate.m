@interface STExtractionServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation STExtractionServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  __chkstk_darwin(self, a2, a3, a4);
  id v5 = v4;
  id v6 = [v5 processIdentifier];
  int v7 = proc_pidpath((int)v6, buffer, 0x1000u);
  if (v7 < 1)
  {
    v10 = +[NSString stringWithFormat:@"Unknown Process Name (pid %d)", v6];
  }
  else
  {
    id v8 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v7 encoding:4];
    v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:@"%@ (pid %d)", v9, v6];
  }
  [v5 processIdentifier];
  memset(buffer, 0, 32);
  if (v5) {
    [v5 auditToken];
  }
  v11 = @"com.apple.private.STRemoteExtractor.privileged";
  if (v11)
  {
    v12 = [v5 valueForEntitlement:v11];
    unsigned __int8 v13 = [v12 BOOLValue];

    if (v13)
    {
      v14 = sub_1000010CC();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:

        v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STExtractionServiceProtocol];
        [v5 setExportedInterface:v19];

        id v20 = [[STExtractionService alloc] initForClient:v10 connection:v5];
        [v5 setExportedObject:v20];
        v21 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STExtractionOriginatorProtocol];
        [v5 setRemoteObjectInterface:v21];

        [v20 setXpcConnection:v5];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000190C;
        v29[3] = &unk_100008368;
        id v22 = v10;
        id v30 = v22;
        id v23 = v20;
        id v31 = v23;
        [v5 setInterruptionHandler:v29];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000019F0;
        v26[3] = &unk_100008368;
        id v27 = v22;
        id v28 = v23;
        id v24 = v23;
        [v5 setInvalidationHandler:v26];
        [v5 resume];

        BOOL v18 = 1;
        goto LABEL_33;
      }
      uint64_t v15 = qos_class_self();
      if ((int)v15 > 20)
      {
        switch(v15)
        {
          case 0x15:
            v16 = @"DEFAULT";
            goto LABEL_31;
          case 0x21:
            v16 = @"USER_INTERACTIVE";
            goto LABEL_31;
          case 0x19:
            v16 = @"USER_INITIATED";
            goto LABEL_31;
        }
      }
      else
      {
        switch(v15)
        {
          case 0:
            v16 = @"UNSPECIFIED";
            goto LABEL_31;
          case 9:
            v16 = @"BACKGROUND";
            goto LABEL_31;
          case 0x11:
            v16 = @"UTILITY";
LABEL_31:
            *(_DWORD *)buf = 136446722;
            v33 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]";
            __int16 v34 = 2112;
            v35 = v10;
            __int16 v36 = 2112;
            v37 = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Got connection from process %@ at qos %@", buf, 0x20u);

            goto LABEL_32;
        }
      }
      v16 = +[NSString stringWithFormat:@"UNKNOWN_QOS: 0x%x", v15];
      goto LABEL_31;
    }
    v17 = sub_1000010CC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100004368();
    }
  }
  else
  {
    *(_DWORD *)buf = 0;
    if (csops_audittoken())
    {
      v17 = sub_1000010CC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000042F4();
      }
    }
    else
    {
      v17 = sub_1000010CC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100004280();
      }
    }
  }

  [v5 invalidate];
  BOOL v18 = 0;
LABEL_33:

  return v18;
}

@end