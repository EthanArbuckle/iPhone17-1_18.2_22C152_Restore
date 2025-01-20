@interface DDXPCServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation DDXPCServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[DDXPCServiceDelegate listener:shouldAcceptNewConnection:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v8 = +[DDMain sharedInstance];
  [v6 setExportedObject:v8];

  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DAIDSMessageSender];
  [v6 setExportedInterface:v9];

  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DAIDSMessageReceiver];
  [v6 setRemoteObjectInterface:v10];

  objc_initWeak((id *)buf, v6);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100003AC8;
  v18[3] = &unk_100018678;
  objc_copyWeak(&v19, (id *)buf);
  [v6 setInterruptionHandler:v18];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100003BB8;
  v16 = &unk_100018678;
  objc_copyWeak(&v17, (id *)buf);
  [v6 setInvalidationHandler:&v13];
  objc_msgSend(v6, "resume", v13, v14, v15, v16);
  v11 = +[DDMain sharedInstance];
  [v11 addConnection:v6];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end