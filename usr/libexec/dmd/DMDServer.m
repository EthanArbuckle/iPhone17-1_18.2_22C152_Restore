@interface DMDServer
+ (DMDServer)sharedServer;
- (CATTaskServer)taskServer;
- (DMDEmergencyModeListenerDelegate)emergencyModeListenerDelegate;
- (DMDEventStreamDispatcher)eventStreamDispatcher;
- (DMDPolicyServerListenerDelegate)policyServerListenerDelegate;
- (DMDServer)init;
- (DMDTaskServerDelegate)taskServerDelegate;
- (DMDTaskServerListenerDelegate)taskServerListenerDelegate;
- (NSXPCListener)emergencyModeListener;
- (NSXPCListener)policyServerListener;
- (NSXPCListener)taskOperationServiceListener;
- (void)invalidate;
- (void)run;
@end

@implementation DMDServer

- (DMDServer)init
{
  v30.receiver = self;
  v30.super_class = (Class)DMDServer;
  v2 = [(DMDServer *)&v30 init];
  if (v2)
  {
    +[NSFileManager dmd_createUserDMDDirectoryDataVault];
    v3 = objc_opt_new();
    v4 = objc_opt_new();
    v5 = (DMDTaskServerDelegate *)[objc_alloc((Class)objc_opt_class()) initWithPolicyPersistence:v4 activationManager:v3];
    taskServerDelegate = v2->_taskServerDelegate;
    v2->_taskServerDelegate = v5;

    v7 = objc_opt_new();
    [v7 setDelegate:v2->_taskServerDelegate];
    v8 = [[DMDTaskServerListenerDelegate alloc] initWithTaskServer:v7];
    taskServerListenerDelegate = v2->_taskServerListenerDelegate;
    v2->_taskServerListenerDelegate = v8;

    id v10 = objc_alloc((Class)NSXPCListener);
    v11 = (NSXPCListener *)[v10 initWithMachServiceName:DMFMachServiceName];
    taskOperationServiceListener = v2->_taskOperationServiceListener;
    v2->_taskOperationServiceListener = v11;

    v13 = v2->_taskOperationServiceListener;
    v14 = CATGetCatalystQueue();
    [(NSXPCListener *)v13 _setQueue:v14];

    [(NSXPCListener *)v2->_taskOperationServiceListener setDelegate:v2->_taskServerListenerDelegate];
    v15 = [[DMDPolicyServerListenerDelegate alloc] initWithPolicyPersistence:v4];
    policyServerListenerDelegate = v2->_policyServerListenerDelegate;
    v2->_policyServerListenerDelegate = v15;

    id v17 = objc_alloc((Class)NSXPCListener);
    v18 = (NSXPCListener *)[v17 initWithMachServiceName:DMFPolicyMachServiceName];
    policyServerListener = v2->_policyServerListener;
    v2->_policyServerListener = v18;

    [(NSXPCListener *)v2->_policyServerListener setDelegate:v2->_policyServerListenerDelegate];
    v20 = [[DMDEmergencyModeListenerDelegate alloc] initWithPolicyPersistence:v4];
    emergencyModeListenerDelegate = v2->_emergencyModeListenerDelegate;
    v2->_emergencyModeListenerDelegate = v20;

    id v22 = objc_alloc((Class)NSXPCListener);
    v23 = (NSXPCListener *)[v22 initWithMachServiceName:DMFEmergencyModeMachServiceName];
    emergencyModeListener = v2->_emergencyModeListener;
    v2->_emergencyModeListener = v23;

    [(NSXPCListener *)v2->_emergencyModeListener setDelegate:v2->_emergencyModeListenerDelegate];
    v25 = [DMDEventStreamDispatcher alloc];
    v31[0] = v3;
    v31[1] = v4;
    v26 = +[NSArray arrayWithObjects:v31 count:2];
    v27 = [(DMDEventStreamDispatcher *)v25 initWithListeners:v26];
    eventStreamDispatcher = v2->_eventStreamDispatcher;
    v2->_eventStreamDispatcher = v27;
  }
  return v2;
}

+ (DMDServer)sharedServer
{
  if (qword_1000FBCD8 != -1) {
    dispatch_once(&qword_1000FBCD8, &stru_1000CBD68);
  }
  v2 = (void *)qword_1000FBCD0;

  return (DMDServer *)v2;
}

- (void)run
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running Server", v7, 2u);
  }
  v3 = [(DMDServer *)self taskServerDelegate];
  [v3 run];

  v4 = [(DMDServer *)self taskOperationServiceListener];
  [v4 resume];

  v5 = [(DMDServer *)self policyServerListener];
  [v5 resume];

  v6 = [(DMDServer *)self emergencyModeListener];
  [v6 resume];
}

- (void)invalidate
{
  v3 = [(DMDServer *)self taskServer];
  [v3 invalidate];

  v4 = [(DMDServer *)self taskOperationServiceListener];
  [v4 invalidate];

  v5 = [(DMDServer *)self policyServerListener];
  [v5 invalidate];

  id v6 = [(DMDServer *)self emergencyModeListener];
  [v6 invalidate];
}

- (DMDTaskServerDelegate)taskServerDelegate
{
  return self->_taskServerDelegate;
}

- (NSXPCListener)taskOperationServiceListener
{
  return self->_taskOperationServiceListener;
}

- (DMDTaskServerListenerDelegate)taskServerListenerDelegate
{
  return self->_taskServerListenerDelegate;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (DMDPolicyServerListenerDelegate)policyServerListenerDelegate
{
  return self->_policyServerListenerDelegate;
}

- (NSXPCListener)policyServerListener
{
  return self->_policyServerListener;
}

- (DMDEmergencyModeListenerDelegate)emergencyModeListenerDelegate
{
  return self->_emergencyModeListenerDelegate;
}

- (NSXPCListener)emergencyModeListener
{
  return self->_emergencyModeListener;
}

- (DMDEventStreamDispatcher)eventStreamDispatcher
{
  return self->_eventStreamDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamDispatcher, 0);
  objc_storeStrong((id *)&self->_emergencyModeListener, 0);
  objc_storeStrong((id *)&self->_emergencyModeListenerDelegate, 0);
  objc_storeStrong((id *)&self->_policyServerListener, 0);
  objc_storeStrong((id *)&self->_policyServerListenerDelegate, 0);
  objc_storeStrong((id *)&self->_taskServer, 0);
  objc_storeStrong((id *)&self->_taskServerListenerDelegate, 0);
  objc_storeStrong((id *)&self->_taskOperationServiceListener, 0);

  objc_storeStrong((id *)&self->_taskServerDelegate, 0);
}

@end