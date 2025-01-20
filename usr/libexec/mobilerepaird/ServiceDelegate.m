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
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received a connection!", v15, 2u);
  }

  v6 = [v4 valueForEntitlement:off_10001E8D0];
  if (!v6)
  {
    v11 = handleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315138;
      *(void *)&v15[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v12 = "%s: audit token does not have entitlements needed.";
      v13 = v11;
      uint32_t v14 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, v15, v14);
    }
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = handleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315394;
      *(void *)&v15[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&v15[12] = 2112;
      *(void *)&v15[14] = v6;
      v12 = "%s: format not correct: %@";
      v13 = v11;
      uint32_t v14 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (![v6 BOOLValue])
  {
LABEL_14:
    [v4 invalidate:*(_OWORD *)v15, *(void *)&v15[16]];
    BOOL v9 = 0;
    goto LABEL_7;
  }
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRSystemHealthProtocol];
  [v4 setExportedInterface:v7];

  v8 = +[MRComponentHealthHandler sharedInstance];
  [v4 setExportedObject:v8];
  [v4 resume];

  BOOL v9 = 1;
LABEL_7:

  return v9;
}

@end