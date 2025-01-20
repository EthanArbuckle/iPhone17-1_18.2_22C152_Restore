@interface MODataExportManager
+ (BOOL)isServiceAvailable;
- (MODataExportManager)init;
- (void)_initConnectionToService;
- (void)_scheduleSendBarrierBlock:(id)a3;
- (void)addBundlesToDataExportSession:(id)a3;
- (void)addEventsToDataExportSession:(id)a3;
- (void)addMetadataToDataExportSession:(id)a3;
- (void)addRankingModelToDataExportSession:(id)a3;
- (void)dealloc;
- (void)endSessionAndUploadAsync;
- (void)endSessionSyncWithReply:(id)a3;
- (void)startDataExportSession;
@end

@implementation MODataExportManager

- (MODataExportManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MODataExportManager;
  v2 = [(MODataExportManager *)&v4 init];
  if (v2)
  {
    v2->_isAvailable = +[MOPlatformInfo isInternalBuild];
    [(MODataExportManager *)v2 _initConnectionToService];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_isAvailable)
  {
    connection = self->connection;
    if (connection) {
      [(NSXPCConnection *)connection invalidate];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MODataExportManager;
  [(MODataExportManager *)&v4 dealloc];
}

- (void)_initConnectionToService
{
  if (self->_isAvailable)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MomentsDataExportService"];
    connection = self->connection;
    self->connection = v3;

    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MomentsDataExportServiceProtocol];
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    [v5 setClasses:v7 forSelector:"addEventsToDataExportSession:" argumentIndex:0 ofReply:0];

    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    [v5 setClasses:v9 forSelector:"addBundlesToDataExportSession:" argumentIndex:0 ofReply:0];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    [v5 setClasses:v12 forSelector:"addRankingModelToDataExportSession:" argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->connection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)self->connection setInterruptionHandler:&__block_literal_global_10];
    [(NSXPCConnection *)self->connection setInvalidationHandler:&__block_literal_global_124];
    [(NSXPCConnection *)self->connection activate];
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Initialized connection to service", buf, 2u);
    }
  }
}

void __47__MODataExportManager__initConnectionToService__block_invoke(id a1)
{
  v1 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection to XPC service interrupted", v2, 2u);
  }
}

void __47__MODataExportManager__initConnectionToService__block_invoke_122(id a1)
{
  v1 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection to XPC service invalidated", v2, 2u);
  }
}

+ (BOOL)isServiceAvailable
{
  return +[MOPlatformInfo isInternalBuild];
}

- (void)_scheduleSendBarrierBlock:(id)a3
{
  v3 = (void (**)(void))a3;
  objc_super v4 = +[NSXPCConnection currentConnection];
  id v5 = v4;
  if (v4) {
    [v4 scheduleSendBarrierBlock:v3];
  }
  else {
    v3[2](v3);
  }
}

- (void)startDataExportSession
{
  if (self->_isAvailable)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting session", v5, 2u);
    }

    objc_super v4 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v4 startDataExportSession];
  }
}

- (void)addEventsToDataExportSession:(id)a3
{
  if (self->_isAvailable)
  {
    id v4 = a3;
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding events to session session", v7, 2u);
    }

    uint64_t v6 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v6 addEventsToDataExportSession:v4];

    [(MODataExportManager *)self _scheduleSendBarrierBlock:&__block_literal_global_126];
  }
}

- (void)addBundlesToDataExportSession:(id)a3
{
  if (self->_isAvailable)
  {
    id v4 = a3;
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding bundles to session session", v7, 2u);
    }

    uint64_t v6 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v6 addBundlesToDataExportSession:v4];

    [(MODataExportManager *)self _scheduleSendBarrierBlock:&__block_literal_global_128];
  }
}

- (void)addMetadataToDataExportSession:(id)a3
{
  if (self->_isAvailable)
  {
    id v4 = a3;
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding metadata to session", v7, 2u);
    }

    uint64_t v6 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v6 addMetadataToDataExportSession:v4];

    [(MODataExportManager *)self _scheduleSendBarrierBlock:&__block_literal_global_130];
  }
}

- (void)addRankingModelToDataExportSession:(id)a3
{
  if (self->_isAvailable)
  {
    id v4 = a3;
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding ranking model to session", v7, 2u);
    }

    uint64_t v6 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v6 addRankingModelToDataExportSession:v4];

    [(MODataExportManager *)self _scheduleSendBarrierBlock:&__block_literal_global_132];
  }
}

- (void)endSessionAndUploadAsync
{
  if (self->_isAvailable)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ending session", v5, 2u);
    }

    id v4 = [(NSXPCConnection *)self->connection remoteObjectProxy];
    [v4 endSessionAndUploadAsync];
  }
}

- (void)endSessionSyncWithReply:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (self->_isAvailable)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__12;
    v14 = __Block_byref_object_dispose__12;
    id v15 = 0;
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ending session", buf, 2u);
    }

    uint64_t v6 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_135];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __47__MODataExportManager_endSessionSyncWithReply___block_invoke_136;
    v8[3] = &unk_1002C9568;
    v8[4] = &v10;
    [v6 endSessionSyncWithReply:v8];

    v4[2](v4, v11[5], 0);
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Completed request for data export", buf, 2u);
    }

    _Block_object_dispose(&v10, 8);
  }
}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  v3 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47__MODataExportManager_endSessionSyncWithReply___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke_136(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (void).cxx_destruct
{
}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to invoke synchronous API: %@", (uint8_t *)&v2, 0xCu);
}

@end