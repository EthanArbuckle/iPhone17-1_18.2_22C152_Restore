@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received a connection!", buf, 2u);
  }

  v6 = [v4 valueForEntitlement:off_10006DDD0];
  if (!v6)
  {
    v30 = handleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v31 = "%s: audit token does not have entitlements needed.";
      v32 = v30;
      uint32_t v33 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
LABEL_29:
    v8 = 0;
    v7 = 0;
LABEL_36:

    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = handleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v37 = 2112;
      v38 = v6;
      v31 = "%s: format not correct: %@";
      v32 = v30;
      uint32_t v33 = 22;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  if (![v6 BOOLValue])
  {
    v8 = 0;
    v7 = 0;
LABEL_37:
    [v4 invalidate];
    BOOL v28 = 0;
    goto LABEL_23;
  }
  v7 = [v4 valueForEntitlement:off_10006DDD8];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = handleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
        __int16 v37 = 2112;
        v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: format not correct: %@", buf, 0x16u);
      }
      v8 = 0;
      goto LABEL_36;
    }
  }
  v8 = [v4 valueForEntitlement:off_10006DDE0];
  if (!v8)
  {
LABEL_14:
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
    v26 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
    [v4 setExportedInterface:v26];

    if (v7 && ([v7 BOOLValue] & 1) != 0)
    {
      v21 = handleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRFactoryHelper instance for factory service", buf, 2u);
      }
      v22 = &off_100058818;
    }
    else
    {
      v21 = handleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CoreRepairHelper instance", buf, 2u);
      }
      v22 = &off_100058880;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = handleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v37 = 2112;
      v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: format not correct: %@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if (![v8 BOOLValue]) {
    goto LABEL_14;
  }
  v34 = v6;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRAttestationProtocol];
  [v4 setExportedInterface:v17];

  v18 = [v4 exportedInterface];
  [v18 setClasses:v16 forSelector:"challengeComponentsWith:withReply:" argumentIndex:0 ofReply:0];

  v19 = [v4 exportedInterface];
  [v19 setClasses:v16 forSelector:"challengeComponentsWith:withReply:" argumentIndex:1 ofReply:1];

  v20 = [v4 exportedInterface];
  [v20 setClasses:v16 forSelector:"getStrongComponentsWithReply:" argumentIndex:1 ofReply:1];

  v21 = handleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRCAttestationHandler instance", buf, 2u);
  }
  v22 = (__objc2_class **)CRAttestationHandler_ptr;
  v6 = v34;
LABEL_22:

  v27 = [(__objc2_class *)*v22 sharedInstance];

  [v4 setExportedObject:v27];
  [v4 resume];

  BOOL v28 = 1;
LABEL_23:

  return v28;
}

@end