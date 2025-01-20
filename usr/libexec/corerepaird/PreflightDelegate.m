@interface PreflightDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PreflightDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a connection on com.apple.corerepair.preflightControl!", buf, 2u);
  }

  v10 = [v4 valueForEntitlement:off_10006DDD0];
  uint64_t v11 = [v4 valueForEntitlement:off_10006DDE0];
  uint64_t v12 = [v4 valueForEntitlement:off_10006DDE8];
  v13 = (void *)v12;
  if (!v10 || !(v11 | v12))
  {
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PreflightDelegate listener:shouldAcceptNewConnection:]";
      v21 = "%s: audit token does not have entitlements needed.";
      v22 = v20;
      uint32_t v23 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
LABEL_18:

LABEL_19:
    [v4 invalidate];
    BOOL v17 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[PreflightDelegate listener:shouldAcceptNewConnection:]";
      __int16 v26 = 2112;
      v27 = v10;
      v21 = "%s: format not correct: %@";
      v22 = v20;
      uint32_t v23 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (![v10 BOOLValue]
    || ([(id)v11 BOOLValue] & 1) == 0 && !objc_msgSend(v13, "BOOLValue"))
  {
    goto LABEL_19;
  }
  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairPreflightProtocol];
  [v4 setExportedInterface:v14];

  v15 = [v4 exportedInterface];
  [v15 setClasses:v8 forSelector:"challengeStrongComponents:withReply:" argumentIndex:0 ofReply:0];

  v16 = [v4 exportedInterface];
  BOOL v17 = 1;
  [v16 setClasses:v8 forSelector:"challengeStrongComponents:withReply:" argumentIndex:1 ofReply:1];

  v18 = +[CoreRepairHelper sharedInstance];
  [v4 setExportedObject:v18];
  [v4 resume];

LABEL_12:
  return v17;
}

@end