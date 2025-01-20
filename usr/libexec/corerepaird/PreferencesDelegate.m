@interface PreferencesDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PreferencesDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received a connection com.apple.corerepair.intentControl !", v19, 2u);
  }

  v6 = [v4 valueForEntitlement:off_10006DDD0];
  uint64_t v7 = [v4 valueForEntitlement:off_10006DDF0];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v15 = handleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315138;
      *(void *)&v19[4] = "-[PreferencesDelegate listener:shouldAcceptNewConnection:]";
      v16 = "%s: audit token does not have entitlements needed.";
      v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_19;
    }
LABEL_20:

LABEL_21:
    [v4 invalidate:*(_OWORD *)v19, *(void *)&v19[16]];
    BOOL v13 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v15 = handleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315394;
      *(void *)&v19[4] = "-[PreferencesDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v6;
      v16 = "%s: format not correct: %@";
      v17 = v15;
      uint32_t v18 = 22;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, v19, v18);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (![v6 BOOLValue] || !objc_msgSend(v8, "BOOLValue")) {
    goto LABEL_21;
  }
  v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRBootIntentHelper instance", v19, 2u);
  }

  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairBootIntentProtocol];
  [v4 setExportedInterface:v11];

  v12 = objc_opt_new();
  [v4 setExportedObject:v12];
  [v4 resume];

  BOOL v13 = 1;
LABEL_14:

  return v13;
}

@end