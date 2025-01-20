@interface SUSUIFullScreenScheduleUpdateAlert
- (SUSUIFullScreenScheduleUpdateAlert)initWithDescriptor:(id)a3 completionBlock:(id)a4;
- (id)configurationContext;
- (id)getAction;
- (id)remoteDefinition;
- (id)viewControllerClassName;
@end

@implementation SUSUIFullScreenScheduleUpdateAlert

- (SUSUIFullScreenScheduleUpdateAlert)initWithDescriptor:(id)a3 completionBlock:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)SUSUIFullScreenScheduleUpdateAlert;
  v15 = [(SUSUIFullScreenScheduleUpdateAlert *)&v16 init];
  v19 = v15;
  objc_storeStrong((id *)&v19, v15);
  if (v15)
  {
    id v12 = objc_alloc((Class)SBSRemoteAlertDefinition);
    id v13 = [(SUSUIFullScreenScheduleUpdateAlert *)v19 viewControllerClassName];
    v5 = (SBSRemoteAlertDefinition *)objc_msgSend(v12, "initWithServiceName:viewControllerClassName:", @"com.apple.susuiservice");
    definition = v19->_definition;
    v19->_definition = v5;

    id v7 = objc_alloc((Class)SUSUILaggardsUIAlertAction);
    v8 = (SUSUILaggardsUIAlertAction *)[v7 initWithDescriptor:location[0] completionBlock:v17];
    alertAction = v19->_alertAction;
    v19->_alertAction = v8;
  }
  v11 = v19;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v11;
}

- (id)remoteDefinition
{
  return self->_definition;
}

- (id)configurationContext
{
  id v7 = self;
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
  return @"SUSUIRemoteScheduleUpdateContainerController";
}

- (void).cxx_destruct
{
}

@end