@interface MomentsIntelligenceServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MomentsIntelligenceServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = _mo_log_facility_get_os_log(&MOLogFacilityIntelligence);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = [v4 processIdentifier];
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MIService,Accepting connection from process %d (%@)", buf, 0x12u);
  }

  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MomentsIntelligenceServiceProtocol];
  [v4 setExportedInterface:v6];
  v7 = objc_opt_new();
  [v4 setExportedObject:v7];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __73__MomentsIntelligenceServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_100004140;
  id v8 = v7;
  id v17 = v8;
  [v4 setInterruptionHandler:v16];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = __73__MomentsIntelligenceServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v14 = &unk_100004140;
  id v15 = v8;
  id v9 = v8;
  [v4 setInvalidationHandler:&v11];
  objc_msgSend(v4, "resume", v11, v12, v13, v14);

  return 1;
}

id __73__MomentsIntelligenceServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interruptionHandler];
}

id __73__MomentsIntelligenceServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidationHandler];
}

@end