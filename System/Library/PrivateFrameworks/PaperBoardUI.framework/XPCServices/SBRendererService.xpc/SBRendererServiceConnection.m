@interface SBRendererServiceConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PBUIRenderService)renderService;
- (SBImageAnalysisServer)analysisServer;
- (SBRendererServiceConnection)initWithRenderService:(id)a3 snapshotServer:(id)a4 analysisServer:(id)a5;
- (SBSnapshotServer)snapshotServer;
- (id)activateWithListener:(id)a3;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (id)executeAnalysisRequest:(id)a3 reply:(id)a4;
- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4;
- (void)cancelRequest:(id)a3;
- (void)checkinWithReply:(id)a3;
- (void)executeSnapshotRequest:(id)a3 reply:(id)a4;
- (void)fetchColorSpaceNameWithReply:(id)a3;
- (void)renderRequest:(id)a3 reply:(id)a4;
- (void)service_warmup:(id)a3;
@end

@implementation SBRendererServiceConnection

- (SBRendererServiceConnection)initWithRenderService:(id)a3 snapshotServer:(id)a4 analysisServer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(SBRendererServiceConnection *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_renderService, a3);
    objc_storeStrong((id *)&v13->_snapshotServer, a4);
    objc_storeStrong((id *)&v13->_analysisServer, a5);
  }

  return v13;
}

- (id)activateWithListener:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    [v5 setDelegate:self];
    [v6 activate];
    v7 = self;
    id v8 = objc_alloc((Class)BSSimpleAssertion);
    id v9 = [v6 description];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006428;
    v14[3] = &unk_10000C560;
    v14[4] = v7;
    id v15 = v6;
    id v10 = v6;
    id v11 = [v8 initWithIdentifier:v9 forReason:@"SBRendererServiceConnection stay-alive" invalidationBlock:v14];

    return v11;
  }
  else
  {
    v13 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"listener"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007FF4(a2, (uint64_t)self, (uint64_t)v13);
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SBMultiplexRendererService];
  v7 = +[PBUICARemoteRenderer secureCodableRequestClasses];
  [v6 setClasses:v7 forSelector:"renderRequest:reply:" argumentIndex:0 ofReply:0];

  id v8 = +[SBSnapshotServer secureCodableRequestClasses];
  [v6 setClasses:v8 forSelector:"executeSnapshotRequest:reply:" argumentIndex:0 ofReply:0];

  id v9 = +[SBSnapshotServer secureCodableRequestClasses];
  [v6 setClasses:v9 forSelector:"cachedSnapshotForRequest:reply:" argumentIndex:0 ofReply:0];

  id v10 = +[SBImageAnalysisServer secureCodableRequestClasses];
  [v6 setClasses:v10 forSelector:"executeAnalysisRequest:reply:" argumentIndex:0 ofReply:0];

  id v11 = +[SBImageAnalysisServer secureCodableResponseClasses];
  [v6 setClasses:v11 forSelector:"executeAnalysisRequest:reply:" argumentIndex:0 ofReply:1];

  v12 = +[SBImageAnalysisServer secureCodableResponseClasses];
  [v6 setClasses:v12 forSelector:"executeAnalysisRequest:reply:" argumentIndex:1 ofReply:1];

  v13 = +[SBImageAnalysisServer secureCodableRequestClasses];
  [v6 setClasses:v13 forSelector:"executeAnalysisRequest:error:" argumentIndex:0 ofReply:0];

  v14 = +[SBImageAnalysisServer secureCodableRequestClasses];
  [v6 setClasses:v14 forSelector:"executeAnalysisRequest:error:" argumentIndex:1 ofReply:0];

  id v15 = +[SBImageAnalysisServer secureCodableRequestClasses];
  [v6 setClasses:v15 forSelector:"cancelRequest:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 activate];
  v16 = SBRSLogXPC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Accepting connection from PID=%d", (uint8_t *)v18, 8u);
  }

  return 1;
}

- (void)executeSnapshotRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000067E8;
  v14 = &unk_10000C588;
  id v15 = (id)objc_opt_new();
  id v16 = v6;
  id v8 = v6;
  id v9 = v15;
  id v10 = objc_retainBlock(&v11);
  -[SBSnapshotServer executeSnapshotRequest:reply:](self->_snapshotServer, "executeSnapshotRequest:reply:", v7, v10, v11, v12, v13, v14);
}

- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100006954;
  v14 = &unk_10000C588;
  id v15 = (id)objc_opt_new();
  id v16 = v6;
  id v8 = v6;
  id v9 = v15;
  id v10 = objc_retainBlock(&v11);
  -[SBSnapshotServer cachedSnapshotForRequest:reply:](self->_snapshotServer, "cachedSnapshotForRequest:reply:", v7, v10, v11, v12, v13, v14);
}

- (id)executeAnalysisRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dword_100012078++;
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v10 = SBRSLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000080F4(v7, v10, v11, v12, v13, v14, v15, v16);
  }

  analysisServer = self->_analysisServer;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006AFC;
  v21[3] = &unk_10000C5B0;
  id v22 = v6;
  int v24 = v7;
  CFAbsoluteTime v23 = Current;
  id v18 = v6;
  v19 = [(SBImageAnalysisServer *)analysisServer executeAnalysisRequest:v8 reply:v21];

  return v19;
}

- (void)cancelRequest:(id)a3
{
  ++dword_10001207C;
  id v4 = a3;
  CFAbsoluteTimeGetCurrent();
  id v5 = SBRSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000082B8();
  }

  [(SBImageAnalysisServer *)self->_analysisServer cancelRequest:v4];
  id v6 = SBRSLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100008218();
  }
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  ++dword_100012080;
  id v6 = a3;
  CFAbsoluteTimeGetCurrent();
  uint64_t v7 = SBRSLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000083D4();
  }

  id v8 = [(SBImageAnalysisServer *)self->_analysisServer executeAnalysisRequest:v6 error:a4];

  id v9 = SBRSLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100008334();
  }

  return v8;
}

- (void)fetchColorSpaceNameWithReply:(id)a3
{
}

- (void)renderRequest:(id)a3 reply:(id)a4
{
}

- (void)checkinWithReply:(id)a3
{
}

- (void)service_warmup:(id)a3
{
}

- (PBUIRenderService)renderService
{
  return self->_renderService;
}

- (SBImageAnalysisServer)analysisServer
{
  return self->_analysisServer;
}

- (SBSnapshotServer)snapshotServer
{
  return self->_snapshotServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotServer, 0);
  objc_storeStrong((id *)&self->_analysisServer, 0);
  objc_storeStrong((id *)&self->_renderService, 0);
}

@end