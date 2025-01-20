@interface VSSpeechServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (VSSpeechServer)init;
- (__CFRunLoopSource)runloopSourceRef;
- (unint64_t)connectionCount;
- (void)dealloc;
- (void)resume;
- (void)scheduleBackgroundTasks;
- (void)setConnectionCount:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setRunloopSourceRef:(__CFRunLoopSource *)a3;
@end

@implementation VSSpeechServer

- (void).cxx_destruct
{
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setRunloopSourceRef:(__CFRunLoopSource *)a3
{
  self->_runloopSourceRef = a3;
}

- (__CFRunLoopSource)runloopSourceRef
{
  return self->_runloopSourceRef;
}

- (unint64_t)connectionCount
{
  return self->_connectionCount;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VSSpeechServiceDelegate];
  [v5 setRemoteObjectInterface:v6];

  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VSSpeechXPCServiceProtocol];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v8 = +[NSArray arrayWithObjects:v22 count:2];
  v9 = +[NSSet setWithArray:v8];

  [v7 setClasses:v9 forSelector:"setSubscribedVoiceAssets:withClientID:forAccessoryID:" argumentIndex:0 ofReply:0];
  [v7 setClasses:v9 forSelector:"triggerCellularDownloadedVoiceAssets:withClientID:" argumentIndex:0 ofReply:0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v10 = +[NSArray arrayWithObjects:v21 count:3];
  v11 = +[NSSet setWithArray:v10];

  [v7 setClasses:v11 forSelector:"startPresynthesizedAudioRequest:" argumentIndex:0 ofReply:0];
  [v5 setExportedInterface:v7];
  id v12 = [objc_alloc((Class)VSSpeechXPCHandler) initWithConnection:v5];
  [v5 setExportedObject:v12];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1000F05D8;
  v18 = &unk_1000FEB98;
  id v19 = v12;
  v20 = self;
  id v13 = v12;
  [v5 setInvalidationHandler:&v15];
  objc_msgSend(v5, "resume", v15, v16, v17, v18);

  [(VSSpeechServer *)self setConnectionCount:(char *)[(VSSpeechServer *)self connectionCount] + 1];
  return 1;
}

- (void)setConnectionCount:(unint64_t)a3
{
  pthread_mutex_lock(&stru_100101B00);
  self->_connectionCount = a3;
  runloopSourceRef = self->_runloopSourceRef;
  if (a3)
  {
    if (!runloopSourceRef)
    {
      runloopSourceRef = sub_1000E5848(0, 0);
      self->_runloopSourceRef = runloopSourceRef;
      if (runloopSourceRef)
      {
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, self->_runloopSourceRef, kCFRunLoopDefaultMode);
        runloopSourceRef = self->_runloopSourceRef;
      }
    }
    sub_1000E5930(runloopSourceRef, 1);
  }
  else
  {
    sub_1000E5930(runloopSourceRef, 0);
    sub_1000E5A00(self->_runloopSourceRef);
    CFRunLoopSourceInvalidate(self->_runloopSourceRef);
    CFRelease(self->_runloopSourceRef);
    self->_runloopSourceRef = 0;
  }
  pthread_mutex_unlock(&stru_100101B00);
}

- (void)scheduleBackgroundTasks
{
  if ((+[VSFeatureFlags useSiriTTSServiceV2] & 1) == 0)
  {
    xpc_activity_register("com.apple.voiced", XPC_ACTIVITY_CHECK_IN, &stru_1000FEAF0);
    xpc_activity_register("com.apple.voiced.weekly", XPC_ACTIVITY_CHECK_IN, &stru_1000FEB50);
    if (+[VSNeuralTTSUtils isANECompilationPlatform])
    {
      if ((+[VSFeatureFlags useSiriTTSService] & 1) == 0)
      {
        xpc_activity_register("com.apple.voiced.neural-compiling", XPC_ACTIVITY_CHECK_IN, &stru_1000FEB70);
      }
    }
  }
}

- (void)resume
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSSpeechServer;
  [(VSSpeechServer *)&v3 dealloc];
}

- (VSSpeechServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSSpeechServer;
  v2 = [(VSSpeechServer *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    v4 = (NSXPCListener *)[v3 initWithMachServiceName:VSTTSMachServiceName];
    listener = v2->_listener;
    v2->_listener = v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(VSSpeechServer *)v2 scheduleBackgroundTasks];
  }
  return v2;
}

@end