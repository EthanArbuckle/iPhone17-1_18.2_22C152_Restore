@interface SUSUIControllerServer
+ (id)sharedInstance;
- (BOOL)createKeybagWithSecret:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)getPasscodePolicy:(id)a3;
- (void)run;
@end

@implementation SUSUIControllerServer

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&unk_70478;
  id location = 0;
  objc_storeStrong(&location, &stru_61060);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_70470;

  return v2;
}

- (void)run
{
  v7[2] = self;
  v7[1] = (id)a2;
  v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  v5 = sub_3D4F8;
  v6 = &unk_5CC30;
  v7[0] = self;
  v9 = (dispatch_once_t *)&unk_70480;
  id location = 0;
  objc_storeStrong(&location, &v2);
  if (*v9 != -1) {
    dispatch_once(v9, location);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v10 = [v16 valueForEntitlement:@"com.apple.softwareupdateservices.ui.client.allowed"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
    [v16 _setQueue:v18->_queue];
    objc_msgSend(v16, "setInterruptionHandler:");
    [v16 setInvalidationHandler:0];
    id v5 = v16;
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUSUIControllerServerInterface];
    objc_msgSend(v5, "setRemoteObjectInterface:");

    id v7 = v16;
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUSUIControllerServerInterface];
    objc_msgSend(v7, "setExportedInterface:");

    [v16 setExportedObject:v18];
    [v16 resume];
    id v12 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v20, (uint64_t)v16);
      _os_log_impl(&def_46F0, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Adding plugin client: %@", v20, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    char v19 = 1;
    int v13 = 1;
  }
  else
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v21, (uint64_t)v16);
      _os_log_impl(&def_46F0, (os_log_t)v15, v14, "Ignoring plugin client: %@", v21, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    char v19 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (BOOL)createKeybagWithSecret:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v4 = +[SUSUISoftwareUpdateController sharedInstance];
  unsigned __int8 v5 = [(SUSUISoftwareUpdateController *)v4 _createAutoInstallKeybagWithPasscode:location[0]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)getPasscodePolicy:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    int v3 = (void (**)(id, id))location[0];
    int v4 = +[SUSUISoftwareUpdateController sharedInstance];
    v3[2](v3, (id)[(SUSUISoftwareUpdateController *)v4 _getPasscodePolicy]);
  }
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end