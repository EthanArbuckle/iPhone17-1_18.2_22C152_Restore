@interface UARPStandaloneCommandManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (UARPStandaloneCommandManagerListener)initWithManager:(id)a3 dispatchQueue:(id)a4;
- (void)dealloc;
- (void)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5 reply:(id)a6;
- (void)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5 reply:(id)a6;
@end

@implementation UARPStandaloneCommandManagerListener

- (UARPStandaloneCommandManagerListener)initWithManager:(id)a3 dispatchQueue:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UARPStandaloneCommandManagerListener;
  v6 = [(UARPStandaloneCommandManagerListener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_manager = (UARPManager *)a3;
    v6->_internalQueue = (OS_dispatch_queue *)a4;
    v6->_log = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "standaloneCommandListener");
    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accessoryupdater.uarp.standaloneCommandListener"];
    v7->_listener = v8;
    [(NSXPCListener *)v8 setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
  }
  return v7;
}

- (void)dealloc
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F54;
  block[3] = &unk_10007D550;
  block[4] = self;
  block[5] = a4;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v5 = [a3 valueForEntitlement:@"com.apple.accessoryupdater.uarp.standaloneCommandListener"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    BOOL v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_10004F9D0(a3);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    v15 = "-[UARPStandaloneCommandManagerListener dynamicAssetSolicitation:modelNumber:notifyService:reply:]";
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    __int16 v20 = 2112;
    id v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: requesting asset: %@ for device (with model number: %@). Notify Service: %@", (uint8_t *)&v14, 0x2Au);
  }
  if ([a3 length] != (id)4
    || (unsigned __int8 v12 = -[UARPManager dynamicAssetSolicitation:modelNumber:notifyService:](self->_manager, "dynamicAssetSolicitation:modelNumber:notifyService:", objc_msgSend(objc_alloc((Class)UARPAssetTag), "initWithChar1:char2:char3:char4:", (char)objc_msgSend(a3, "characterAtIndex:", 0), (char)objc_msgSend(a3, "characterAtIndex:", 1), (char)objc_msgSend(a3, "characterAtIndex:", 2), (char)objc_msgSend(a3, "characterAtIndex:", 3)), a4, a5), v13 = 0, (v12 & 1) == 0))
  {
    v13 = +[NSError errorWithDomain:kUARPErrorDomain code:2 userInfo:0];
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v13);
}

- (void)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    v15 = "-[UARPStandaloneCommandManagerListener dynamicAssetSolicitation:modelNumbers:notifyService:reply:]";
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    __int16 v20 = 2112;
    id v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: requesting asset: %@ for model numbers: %@, endpoint: %@", (uint8_t *)&v14, 0x2Au);
  }
  if ([a3 length] != (id)4
    || (unsigned __int8 v12 = -[UARPManager dynamicAssetSolicitation:modelNumbers:notifyService:](self->_manager, "dynamicAssetSolicitation:modelNumbers:notifyService:", objc_msgSend(objc_alloc((Class)UARPAssetTag), "initWithChar1:char2:char3:char4:", (char)objc_msgSend(a3, "characterAtIndex:", 0), (char)objc_msgSend(a3, "characterAtIndex:", 1), (char)objc_msgSend(a3, "characterAtIndex:", 2), (char)objc_msgSend(a3, "characterAtIndex:", 3)), a4, a5), v13 = 0, (v12 & 1) == 0))
  {
    v13 = +[NSError errorWithDomain:kUARPErrorDomain code:2 userInfo:0];
  }
  (*((void (**)(id, _UNKNOWN **, NSError *))a6 + 2))(a6, &off_100086758, v13);
}

@end