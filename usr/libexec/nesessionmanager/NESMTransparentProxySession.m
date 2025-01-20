@interface NESMTransparentProxySession
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)setConfigurationWithCompletionHandler:(id)a3;
@end

@implementation NESMTransparentProxySession

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(NESMSession *)self server];
  v11 = [v10 primaryPhysicalInterface];
  v12 = [v11 interfaceName];
  sub_100018AA4(v9, v12);

  id v13 = [(NESMVPNSession *)self stateHandler];
  [v13 handlePlugin:v9 didStartWithPID:v5 error:v8];
}

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NESMVPNSession *)self pluginConfigurationEntities];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100081B3C;
  v14[3] = &unk_1000C67F8;
  objc_copyWeak(&v18, &location);
  id v6 = v4;
  id v17 = v6;
  id v7 = v5;
  id v15 = v7;
  v16 = self;
  id v8 = objc_retainBlock(v14);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Plugin configuration is not a NETransparentProxyNetworkSettings object", buf, 0xCu);
    }

    v11 = v6;
    goto LABEL_7;
  }
  unsigned int v10 = [v7 isFullyTransparent];
  v11 = v8;
  if (v10)
  {
LABEL_7:
    ((void (*)(void *, void))v11[2])(v11, isKindOfClass & 1);
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)NESMTransparentProxySession;
  [(NESMFlowDivertSession *)&v13 setConfigurationWithCompletionHandler:v8];
LABEL_8:

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

@end