@interface SUSUIFullScreenAuthenticationAlert
- (SUSUIFullScreenAuthenticationAlert)initWithDescriptor:(id)a3 autoInstallForecast:(id)a4 forInstallTonight:(BOOL)a5 canDeferInstallation:(BOOL)a6 completionQueue:(id)a7 completionBlock:(id)a8;
- (SUSUIFullScreenAuthenticationAlert)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (id)configurationContext;
- (id)getAction;
- (id)remoteDefinition;
- (id)viewControllerClassName;
@end

@implementation SUSUIFullScreenAuthenticationAlert

- (SUSUIFullScreenAuthenticationAlert)initWithDescriptor:(id)a3 autoInstallForecast:(id)a4 forInstallTonight:(BOOL)a5 canDeferInstallation:(BOOL)a6 completionQueue:(id)a7 completionBlock:(id)a8
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  BOOL v28 = a5;
  BOOL v27 = a6;
  id v26 = 0;
  objc_storeStrong(&v26, a7);
  id v25 = 0;
  objc_storeStrong(&v25, a8);
  v8 = v31;
  v31 = 0;
  v24.receiver = v8;
  v24.super_class = (Class)SUSUIFullScreenAuthenticationAlert;
  v23 = [(SUSUIFullScreenAuthenticationAlert *)&v24 init];
  v31 = v23;
  objc_storeStrong((id *)&v31, v23);
  if (v23)
  {
    id v16 = objc_alloc((Class)SBSRemoteAlertDefinition);
    id v17 = [(SUSUIFullScreenAuthenticationAlert *)v31 viewControllerClassName];
    v9 = (SBSRemoteAlertDefinition *)objc_msgSend(v16, "initWithServiceName:viewControllerClassName:", @"com.apple.susuiservice");
    definition = v31->_definition;
    v31->_definition = v9;

    id v11 = objc_alloc((Class)SUSUIAuthenticationAlertAction);
    v12 = (SUSUIAuthenticationAlertAction *)[v11 initWithDescriptor:location[0] autoInstallForecast:v29 forInstallTonight:v28 canDeferInstallation:v27 completionQueue:v26 completionBlock:v25];
    alertAction = v31->_alertAction;
    v31->_alertAction = v12;
  }
  v15 = v31;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v31, 0);
  return v15;
}

- (SUSUIFullScreenAuthenticationAlert)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  v6 = v25;
  id v25 = 0;
  v20.receiver = v6;
  v20.super_class = (Class)SUSUIFullScreenAuthenticationAlert;
  v19 = [(SUSUIFullScreenAuthenticationAlert *)&v20 init];
  id v25 = v19;
  objc_storeStrong((id *)&v25, v19);
  if (v19)
  {
    id v14 = objc_alloc((Class)SBSRemoteAlertDefinition);
    id v15 = [(SUSUIFullScreenAuthenticationAlert *)v25 viewControllerClassName];
    v7 = (SBSRemoteAlertDefinition *)objc_msgSend(v14, "initWithServiceName:viewControllerClassName:", @"com.apple.susuiservice");
    definition = v25->_definition;
    v25->_definition = v7;

    id v9 = objc_alloc((Class)SUSUIAuthenticationAlertAction);
    v10 = (SUSUIAuthenticationAlertAction *)[v9 initWithRollbackDescriptor:location[0] canDeferInstallation:v23 completionQueue:v22 completionBlock:v21];
    alertAction = v25->_alertAction;
    v25->_alertAction = v10;
  }
  v13 = v25;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v13;
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
  return @"SUSUIRemoteAuthenticationContainerViewController";
}

- (void).cxx_destruct
{
}

@end