@interface STConcretePrimitiveRemoteViewService
- (NSXPCListenerEndpoint)listenerEndpoint;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (STConcretePrimitiveRemoteViewService)initWithServiceDescription:(id)a3 listenerEndpoint:(id)a4;
- (STRemoteViewServiceDescription)serviceDescription;
- (void)activate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
@end

@implementation STConcretePrimitiveRemoteViewService

- (STConcretePrimitiveRemoteViewService)initWithServiceDescription:(id)a3 listenerEndpoint:(id)a4
{
  v6 = (NSXPCListenerEndpoint *)a4;
  v13.receiver = self;
  v13.super_class = (Class)STConcretePrimitiveRemoteViewService;
  id v7 = a3;
  v8 = [(STConcretePrimitiveRemoteViewService *)&v13 init];
  v9 = (STRemoteViewServiceDescription *)objc_msgSend(v7, "copy", v13.receiver, v13.super_class);

  serviceDescription = v8->_serviceDescription;
  v8->_serviceDescription = v9;

  listenerEndpoint = v8->_listenerEndpoint;
  v8->_listenerEndpoint = v6;

  return v8;
}

- (void)activate
{
  id v13 = [(STConcretePrimitiveRemoteViewService *)self serviceDescription];
  id v3 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v4 = [v13 serviceName];
  v5 = [v13 viewControllerClassName];
  id v6 = [v3 initWithServiceName:v4 viewControllerClassName:v5];

  id v7 = objc_opt_new();
  v8 = [v13 configurationContextUserInfo];
  [v7 setUserInfo:v8];

  v9 = [(STConcretePrimitiveRemoteViewService *)self listenerEndpoint];
  v10 = [v9 _endpoint];
  [v7 setXpcEndpoint:v10];

  id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:v7];
  v12 = objc_opt_new();
  [v11 registerObserver:self];
  [v11 activateWithContext:v12];
  [(STConcretePrimitiveRemoteViewService *)self setRemoteAlertHandle:v11];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  v4 = +[STLog remoteViewService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did activate service: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v3 = a3;
  v4 = +[STLog remoteViewService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did deactivate service: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[STLog remoteViewService];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10025C9D8((uint64_t)v5, (uint64_t)v6, v7);
  }
}

- (STRemoteViewServiceDescription)serviceDescription
{
  return (STRemoteViewServiceDescription *)objc_getProperty(self, a2, 8, 1);
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return (SBSRemoteAlertHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

@end