@interface _DASContinuedProcessingTaskUIClient
+ (id)sharedClient;
+ (void)initialize;
- (BSServiceConnectionClient)connection;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (SLAPKActivityProgressUIServer)server;
- (_DASContinuedProcessingTaskUIClient)init;
- (void)activateConnection;
- (void)cancelActivities:(id)a3;
- (void)dealloc;
- (void)invalidateConnection;
- (void)resetConnection;
- (void)setConnection:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServer:(id)a3;
- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8;
- (void)updateProgress:(id)a3 forIdentifier:(id)a4;
- (void)updateTitle:(id)a3 andDescription:(id)a4 forIdentifier:(id)a5 playHaptics:(BOOL)a6;
@end

@implementation _DASContinuedProcessingTaskUIClient

+ (void)initialize
{
  [sub_1000A03E8() load];
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)qword_1001C4340;
  uint64_t v8 = qword_1001C4340;
  if (!qword_1001C4340)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000A1218;
    v4[3] = &unk_100175628;
    v4[4] = &v5;
    sub_1000A1218((uint64_t)v4);
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);
  [v3 load];
}

- (_DASContinuedProcessingTaskUIClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DASContinuedProcessingTaskUIClient;
  v2 = [(_DASContinuedProcessingTaskUIClient *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.progressuiqueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.duetactivityscheduler", "ContinuedProgress");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    [(_DASContinuedProcessingTaskUIClient *)v2 activateConnection];
  }
  return v2;
}

+ (id)sharedClient
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0614;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4320 != -1) {
    dispatch_once(&qword_1001C4320, block);
  }
  v2 = (void *)qword_1001C4328;

  return v2;
}

- (SLAPKActivityProgressUIServer)server
{
  v2 = self;
  objc_sync_enter(v2);
  server = v2->_server;
  if (!server)
  {
    [(_DASContinuedProcessingTaskUIClient *)v2 resetConnection];
    server = v2->_server;
  }
  dispatch_queue_t v4 = server;
  objc_sync_exit(v2);

  return v4;
}

- (void)resetConnection
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Connection was previously invalidated, re-establishing connection", v4, 2u);
  }
  [(_DASContinuedProcessingTaskUIClient *)self invalidateConnection];
  [(_DASContinuedProcessingTaskUIClient *)self activateConnection];
}

- (void)activateConnection
{
  id v3 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.activityprogress.activityprogressui.session-service"];
  dispatch_queue_t v4 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___SLAPKActivityProgressUIServer];
  [v3 setServer:v4];

  uint64_t v5 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___SLAPKActivityProgressUIClient];
  [v3 setClient:v5];

  os_log_t v6 = +[BSServiceConnectionEndpoint endpointForMachName:@"com.apple.activityprogress.activityprogressui.services" service:@"com.apple.activityprogress.activityprogressui.session-service" instance:0];
  uint64_t v7 = +[BSServiceConnection connectionWithEndpoint:v6];
  connection = self->_connection;
  self->_connection = v7;

  objc_super v9 = self->_connection;
  if (v9)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000A09A8;
    v20 = &unk_1001777B0;
    id v21 = v3;
    v22 = self;
    [(BSServiceConnectionClient *)v9 configureConnection:&v17];
    [(BSServiceConnectionClient *)self->_connection activate];
    v10 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
    v11 = self->_connection;
    v23 = v10;
    v12 = +[NSArray arrayWithObjects:&v23 count:1];
    v13 = [(BSServiceConnectionClient *)v11 remoteTargetWithLaunchingAssertionAttributes:v12];
    server = self->_server;
    self->_server = v13;

    if (!self->_server)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_1000FCFFC((uint64_t *)&self->_connection, log);
      }
      [(_DASContinuedProcessingTaskUIClient *)self invalidateConnection];
    }
  }
  else
  {
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_1000FCFB8((os_log_t)v16);
    }
    [(_DASContinuedProcessingTaskUIClient *)self invalidateConnection];
  }
}

- (void)invalidateConnection
{
  [(BSServiceConnectionClient *)self->_connection invalidate];
  server = self->_server;
  self->_server = 0;

  connection = self->_connection;
  self->_connection = 0;
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DASContinuedProcessingTaskUIClient;
  [(_DASContinuedProcessingTaskUIClient *)&v3 dealloc];
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a5;
  id v20 = objc_alloc((Class)sub_1000A03E8());
  id v21 = v20;
  if (v18)
  {
    id v22 = [v20 initWithProgress:v18];
  }
  else
  {
    id v23 = objc_alloc_init((Class)NSProgress);
    id v22 = [v21 initWithProgress:v23];
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138413058;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Starting activity %@ %@ %@, bundleIdentifier: %@", (uint8_t *)&v26, 0x2Au);
  }
  v25 = [(_DASContinuedProcessingTaskUIClient *)self server];
  [v25 startActivityForIdentifier:v14 bundleIdentifier:v15 imageUTI:v19 activityName:v16 activityDescription:v17 progress:v22];
}

- (void)updateTitle:(id)a3 andDescription:(id)a4 forIdentifier:(id)a5 playHaptics:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v16 = @"Disabled";
    *(_DWORD *)id v17 = 138413058;
    *(void *)&v17[4] = v10;
    if (v6) {
      CFStringRef v16 = @"Enabled";
    }
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    CFStringRef v21 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Updating title to %@ and description to %@ for %@ (haptics %@)", v17, 0x2Au);
  }
  id v14 = [(_DASContinuedProcessingTaskUIClient *)self server];
  id v15 = +[NSNumber numberWithBool:v6];
  [v14 updateActivityName:v10 activityDescription:v11 withHaptic:v15 forIdentifier:v12];
}

- (void)updateProgress:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)sub_1000A03E8()) initWithProgress:v6];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000FD0BC((uint64_t)v7, (uint64_t)v6, (os_log_t)log);
  }
  id v10 = [(_DASContinuedProcessingTaskUIClient *)self server];
  [v10 updateProgress:v8 forIdentifier:v7];
}

- (void)cancelActivities:(id)a3
{
  id v4 = [a3 taskIdentifiers];
  objc_super v3 = +[_DASDaemon sharedInstance];
  [v3 suspendActivitiesWithIdentifiers:v4];
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setServer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end