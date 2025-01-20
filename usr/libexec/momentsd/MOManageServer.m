@interface MOManageServer
- (BOOL)clientConnection:(id)a3 hasInternalEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MODaemonSPINotifier)notifier;
- (MOManageServer)initWithUniverse:(id)a3;
- (id)client;
- (id)getInternalEntitlementsForConnection:(id)a3;
- (id)getNotifier;
- (void)getNotifier;
@end

@implementation MOManageServer

- (MOManageServer)initWithUniverse:(id)a3
{
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)MOManageServer;
  v5 = [(MOManageServer *)&v97 init];
  if (v5)
  {
    v6 = [[MODaemonClient alloc] initWithUniverse:v4];
    client = v5->_client;
    v5->_client = v6;

    [(MODaemonClient *)v5->_client setEntitlementDelegate:v5];
    uint64_t v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MOMomentsXPCProtocol];
    interface = v5->interface;
    v5->interface = (NSXPCInterface *)v8;

    v10 = v5->interface;
    if (v10)
    {
      id v95 = v4;
      v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MODatabaseUpgradeCompletionDelegateProtocol];
      [(NSXPCInterface *)v10 setInterface:v11 forSelector:"scheduleDatabaseUpgradeWithContext:andDelegate:" argumentIndex:1 ofReply:0];

      v12 = v5->interface;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
      [(NSXPCInterface *)v12 setClasses:v17 forSelector:"storeEvents:withContext:andHandler:" argumentIndex:0 ofReply:0];

      v18 = v5->interface;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, v21, v22, objc_opt_class(), 0);
      [(NSXPCInterface *)v18 setClasses:v23 forSelector:"analyzeTrendsInEvents:withContext:andRefreshVariant:andHandler:" argumentIndex:0 ofReply:0];

      v24 = v5->interface;
      uint64_t v25 = objc_opt_class();
      v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
      [(NSXPCInterface *)v24 setClasses:v26 forSelector:"didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:" argumentIndex:0 ofReply:0];

      v27 = v5->interface;
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v28, v29, objc_opt_class(), 0);
      [(NSXPCInterface *)v27 setClasses:v30 forSelector:"didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:" argumentIndex:3 ofReply:0];

      v31 = v5->interface;
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, v33, v34, v35, objc_opt_class(), 0);
      [(NSXPCInterface *)v31 setClasses:v36 forSelector:"setupMomentsNotificationsWithSchedule:options:handler:" argumentIndex:0 ofReply:0];

      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      v42 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v37, v38, v39, v40, v41, objc_opt_class(), 0);
      [(NSXPCInterface *)v5->interface setClasses:v42 forSelector:"logEngagementEvent:timestamp:withContext:" argumentIndex:2 ofReply:0];
      [(NSXPCInterface *)v5->interface setClasses:v42 forSelector:"logPerformanceEvent:timestamp:withContext:" argumentIndex:2 ofReply:0];
      [(NSXPCInterface *)v5->interface setClasses:v42 forSelector:"logUsageEvent:timestamp:withContext:" argumentIndex:2 ofReply:0];
      v43 = v5->interface;
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      v47 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
      [(NSXPCInterface *)v43 setClasses:v47 forSelector:"getOnboardingFlowCompletionStatusWithHandler:" argumentIndex:0 ofReply:0];

      v48 = v5->interface;
      uint64_t v49 = objc_opt_class();
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = objc_opt_class();
      v52 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
      [(NSXPCInterface *)v48 setClasses:v52 forSelector:"setOnboardingFlowCompletionStatus:" argumentIndex:0 ofReply:0];

      v53 = v5->interface;
      uint64_t v54 = objc_opt_class();
      uint64_t v55 = objc_opt_class();
      uint64_t v56 = objc_opt_class();
      v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0);
      [(NSXPCInterface *)v53 setClasses:v57 forSelector:"getOnboardingFlowRefreshCompletionStatusWithHandler:" argumentIndex:0 ofReply:0];

      v58 = v5->interface;
      uint64_t v59 = objc_opt_class();
      uint64_t v60 = objc_opt_class();
      uint64_t v61 = objc_opt_class();
      v62 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v59, v60, v61, objc_opt_class(), 0);
      [(NSXPCInterface *)v58 setClasses:v62 forSelector:"getStateForSetting:withHandler:" argumentIndex:0 ofReply:0];

      v63 = v5->interface;
      uint64_t v64 = objc_opt_class();
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = objc_opt_class();
      v67 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v64, v65, v66, objc_opt_class(), 0);
      [(NSXPCInterface *)v63 setClasses:v67 forSelector:"getStateForSettingFast:withHandler:" argumentIndex:0 ofReply:0];

      v68 = v5->interface;
      uint64_t v69 = objc_opt_class();
      uint64_t v70 = objc_opt_class();
      uint64_t v71 = objc_opt_class();
      v72 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v69, v70, v71, objc_opt_class(), 0);
      [(NSXPCInterface *)v68 setClasses:v72 forSelector:"setState:forSetting:" argumentIndex:0 ofReply:0];

      v73 = v5->interface;
      uint64_t v74 = objc_opt_class();
      v75 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v74, objc_opt_class(), 0);
      [(NSXPCInterface *)v73 setClasses:v75 forSelector:"getDiagnosticReporterConfiguration:" argumentIndex:0 ofReply:0];

      v76 = v5->interface;
      uint64_t v77 = objc_opt_class();
      uint64_t v78 = objc_opt_class();
      v79 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v77, v78, objc_opt_class(), 0);
      [(NSXPCInterface *)v76 setClasses:v79 forSelector:"getApplicationsWithDataAccess:" argumentIndex:0 ofReply:0];

      v80 = v5->interface;
      uint64_t v81 = objc_opt_class();
      v82 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v81, objc_opt_class(), 0);
      [(NSXPCInterface *)v80 setClasses:v82 forSelector:"registerApplicationsForDataAccess:" argumentIndex:0 ofReply:0];

      id v83 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.momentsd"];
      v84 = v83;
      if (v83)
      {
        [v83 setDelegate:v5];
        [v84 resume];
        v85 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "initiate managerSever", buf, 2u);
        }

        v86 = v5;
      }
      else
      {
        v86 = 0;
      }

      id v4 = v95;
    }
    else
    {
      v42 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[MOManageServer initWithUniverse:](v42, v87, v88, v89, v90, v91, v92, v93);
      }
      v86 = 0;
    }
  }
  else
  {
    v86 = 0;
  }

  return v86;
}

- (id)getInternalEntitlementsForConnection:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.momentsd.internal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(MOManageServer *)self getInternalEntitlementsForConnection:v5];
  id v7 = [v6 count];

  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109378;
      v11[1] = [v5 processIdentifier];
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New XPC connection from process %d (%@)", (uint8_t *)v11, 0x12u);
    }

    [v5 setExportedInterface:self->interface];
    [v5 setExportedObject:self->_client];
    [v5 setInterruptionHandler:&__block_literal_global_0];
    [v5 setInvalidationHandler:&__block_literal_global_223];
    [v5 resume];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOManageServer listener:shouldAcceptNewConnection:](v5, v9);
    }

    [v5 invalidate];
  }

  return v7 != 0;
}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  v1 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_221(id a1)
{
  v1 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Invalidated", v2, 2u);
  }
}

- (id)getNotifier
{
  client = self->_client;
  if (client)
  {
    uint64_t v5 = [(MODaemonClient *)client notifier];
    if (v5) {
      goto LABEL_10;
    }
    uint64_t v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOManageServer getNotifier](v6);
    }

    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOManageServer.m" lineNumber:170 description:@"No daemon notifier (in %s:%d)", "-[MOManageServer getNotifier]", 170];
  }
  else
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(MOManageServer *)v8 getNotifier];
    }

    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOManageServer.m" lineNumber:168 description:@"Invalid parameter not satisfying: _client"];
    uint64_t v5 = 0;
  }

LABEL_10:

  return v5;
}

- (id)client
{
  return self->_client;
}

- (BOOL)clientConnection:(id)a3 hasInternalEntitlement:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MOManageServer *)self getInternalEntitlementsForConnection:a3];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (MODaemonSPINotifier)notifier
{
  return self->_notifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->interfaceOnboardingAndSettings, 0);
  objc_storeStrong((id *)&self->interface, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  v4[0] = 67109378;
  v4[1] = [a1 processIdentifier];
  __int16 v5 = 2112;
  id v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Rejecting connection from process %d (%@)", (uint8_t *)v4, 0x12u);
}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getNotifier
{
  int v1 = 136315394;
  uint64_t v2 = "-[MOManageServer getNotifier]";
  __int16 v3 = 1024;
  int v4 = 170;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No daemon notifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end