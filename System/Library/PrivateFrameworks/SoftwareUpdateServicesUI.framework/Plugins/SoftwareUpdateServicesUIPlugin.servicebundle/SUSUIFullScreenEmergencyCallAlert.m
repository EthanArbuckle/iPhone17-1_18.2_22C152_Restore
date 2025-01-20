@interface SUSUIFullScreenEmergencyCallAlert
- (SUSUIFullScreenEmergencyCallAlert)initWithCompletionBlock:(id)a3;
- (id)configurationContext;
- (id)getAction;
- (id)remoteDefinition;
- (id)viewControllerClassName;
@end

@implementation SUSUIFullScreenEmergencyCallAlert

- (SUSUIFullScreenEmergencyCallAlert)initWithCompletionBlock:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v21;
  v21 = 0;
  v19.receiver = v3;
  v19.super_class = (Class)SUSUIFullScreenEmergencyCallAlert;
  v15 = [(SUSUIFullScreenEmergencyCallAlert *)&v19 init];
  v21 = v15;
  objc_storeStrong((id *)&v21, v15);
  if (v15)
  {
    id v18 = (id)SUSUILogEmergencyCallUI();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      log = v18;
      os_log_type_t type = v17;
      sub_5A1C(v16);
      _os_log_impl(&def_46F0, log, type, "initializing SUSUIFullScreenEmergencyCallAlert", v16, 2u);
    }
    objc_storeStrong(&v18, 0);
    id v11 = objc_alloc((Class)SBSRemoteAlertDefinition);
    id v12 = [(SUSUIFullScreenEmergencyCallAlert *)v21 viewControllerClassName];
    v4 = (SBSRemoteAlertDefinition *)objc_msgSend(v11, "initWithServiceName:viewControllerClassName:", @"com.apple.susuiservice");
    definition = v21->_definition;
    v21->_definition = v4;

    id v6 = objc_alloc((Class)SUSUIRemoteEmergencyCallAlertAction);
    v7 = (SUSUIRemoteEmergencyCallAlertAction *)[v6 initWithCompletionBlock:location[0]];
    alertAction = v21->_alertAction;
    v21->_alertAction = v7;
  }
  v10 = v21;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v10;
}

- (id)remoteDefinition
{
  return self->_definition;
}

- (id)configurationContext
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v3 = v6[0];
  v4 = +[NSSet setWithObject:v7->_alertAction];
  objc_msgSend(v3, "setActions:");

  id v5 = v6[0];
  objc_storeStrong(v6, 0);

  return v5;
}

- (id)getAction
{
  return self->_alertAction;
}

- (id)viewControllerClassName
{
  return @"SUSUIRemoteEmergencyCallContainerViewController";
}

- (void).cxx_destruct
{
}

@end