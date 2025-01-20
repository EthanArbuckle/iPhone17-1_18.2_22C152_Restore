@interface UASimulator
+ (UASimulator)simulatorWithController:(id)a3 pairedPort:(unsigned int)a4 childSimPid:(int)a5 childVersion:(unint64_t)a6;
+ (UASimulator)simulatorWithController:(id)a3 parentSimulatorPortName:(id)a4;
- (BOOL)active;
- (BOOL)activitiesShouldCrossover;
- (BOOL)reconnectToParentSimulator;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSSet)notifiedItems;
- (NSString)bootstrapName;
- (OS_dispatch_queue)dispatchQ;
- (SFPeerDevice)ourDevice;
- (SFPeerDevice)peeredDevice;
- (UASimulator)initWithController:(id)a3;
- (UASimulatorAdvertisementCreator)creator;
- (UASimulatorAdvertiser)advertiser;
- (UASimulatorController)controller;
- (UASimulatorReceiver)receiver;
- (id)statusString;
- (unsigned)commandPort;
- (unsigned)pairedClientPort;
- (void)dealloc;
- (void)setNotifiedItems:(id)a3;
- (void)setOurDevice:(id)a3;
- (void)setPeeredDevice:(id)a3;
- (void)setSimulatorInFront:(BOOL)a3;
@end

@implementation UASimulator

- (UASimulator)initWithController:(id)a3
{
  id v5 = a3;
  v6 = [v5 manager];
  v33.receiver = self;
  v33.super_class = (Class)UASimulator;
  v7 = [(UACornerActionManagerHandler *)&v33 initWithManager:v6 name:@"SimController"];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_controller, a3);
    uint64_t v8 = +[SFPeerDevice peerForSelf];
    ourDevice = v7->_ourDevice;
    v7->_ourDevice = (SFPeerDevice *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("simQ", 0);
    dispatchQ = v7->_dispatchQ;
    v7->_dispatchQ = (OS_dispatch_queue *)v10;

    if (!mach_port_allocate(mach_task_self_, 1u, &v7->_commandPort))
    {
      sub_10007310C([(UASimulator *)v7 commandPort], v7);
      uintptr_t v12 = [(UASimulator *)v7 commandPort];
      v13 = dispatch_get_global_queue(0, 0);
      dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v12, 0, v13);

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000731F0;
      handler[3] = &unk_1000C4DD0;
      v15 = v7;
      v31 = v15;
      dispatch_source_t v32 = v14;
      v16 = v14;
      dispatch_source_set_event_handler(v16, handler);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000732F0;
      v28[3] = &unk_1000C4D40;
      v29 = v15;
      dispatch_source_set_cancel_handler(v16, v28);
      dispatch_resume(v16);
    }
    v17 = [[UASimulatorAdvertiser alloc] initWithSimulator:v7];
    advertiser = v7->_advertiser;
    v7->_advertiser = v17;

    v19 = [[UASimulatorReceiver alloc] initWithSimulator:v7];
    receiver = v7->_receiver;
    v7->_receiver = v19;

    v21 = [(UASimulator *)v7 controller];
    v22 = [v21 manager];
    v23 = [(UASimulator *)v7 advertiser];
    [v22 addAdvertiser:v23];

    v24 = [(UASimulator *)v7 controller];
    v25 = [v24 manager];
    v26 = [(UASimulator *)v7 receiver];
    [v25 addReceiver:v26];
  }
  return v7;
}

+ (UASimulator)simulatorWithController:(id)a3 pairedPort:(unsigned int)a4 childSimPid:(int)a5 childVersion:(unint64_t)a6
{
  return 0;
}

+ (UASimulator)simulatorWithController:(id)a3 parentSimulatorPortName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SIMULATOR: Creating UASimulator to talk to real useractivityd in OSX, portName=%{public}@", buf, 0xCu);
  }

  id v8 = [objc_alloc((Class)objc_opt_class()) initWithController:v5];
  v9 = (int *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 16, a4);
    id v10 = [v9 bootstrapName];
    v11 = (const char *)[v10 cStringUsingEncoding:4];
    uintptr_t v12 = [v5 dispatchQ];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007361C;
    handler[3] = &unk_1000C5170;
    v15 = v9;
    notify_register_dispatch(v11, v9 + 13, v12, handler);
  }

  return (UASimulator *)v9;
}

- (void)dealloc
{
  sub_10007310C([(UASimulator *)self commandPort], 0);
  mach_port_name_t pairedClientPort = self->_pairedClientPort;
  if (pairedClientPort) {
    mach_port_mod_refs(mach_task_self_, pairedClientPort, 0, -1);
  }
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)UASimulator;
  [(UASimulator *)&v5 dealloc];
}

- (BOOL)reconnectToParentSimulator
{
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Looking up parent port in order to talk to useractivity in OSX", buf, 2u);
  }

  int v38 = 0;
  id v4 = [(UASimulator *)self bootstrapName];
  [v4 cStringUsingEncoding:4];
  int v5 = bootstrap_look_up2();

  if (v5) {
    return 0;
  }
  long long v45 = 0uLL;
  v7 = [(UACornerActionManagerHandler *)self uuid];
  [v7 getUUIDBytes:&v45];

  id v8 = [(UASimulator *)self ourDevice];
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  uint64_t v36 = 0;
  uint64_t v37 = 0;
  id v10 = self;
  objc_sync_enter(v10);
  uint64_t v35 = 0;
  int v11 = [(UASimulator *)v10 commandPort];
  id v12 = v9;
  int v13 = sub_10007D000(v38, &v45, v11, (uint64_t)[v12 bytes], (int)objc_msgSend(v12, "length"), 2, &v36, &v37, (_DWORD *)&v36 + 1, &v35);
  dispatch_source_t v14 = sub_10000BA18(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v40 = v13;
    __int16 v41 = 2048;
    uint64_t v42 = v35;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "UASimRegisterWithParentWithVersion()=%ld parentVersion=%ld", buf, 0x16u);
  }

  BOOL v6 = v13 == 0;
  if (!v13)
  {
    id v15 = objc_alloc((Class)NSKeyedUnarchiver);
    v16 = +[NSData dataWithBytes:v37 length:HIDWORD(v36)];
    id v17 = [v15 initForReadingFromData:v16 error:0];

    if (HIDWORD(v36))
    {
      v18 = [v17 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
      if (v18)
      {
        v19 = sub_10000BA18(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          unint64_t v40 = (unint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SIMULATOR: Changing peer device info to %{private}@", buf, 0xCu);
        }

        [(UASimulator *)v10 setPeeredDevice:v18];
      }
      [v17 finishDecoding];
    }
    v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [(UASimulator *)v10 commandPort];
      uint64_t v22 = v36;
      v23 = [(UASimulator *)v10 peeredDevice];
      *(_DWORD *)buf = 134218498;
      unint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2114;
      v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Paired with parent simulator, commandPort=%ld pairedPort=%ld pairedPeer=%{public}@", buf, 0x20u);
    }
    uintptr_t v24 = v36;
    v10->_mach_port_name_t pairedClientPort = v36;
    v25 = [(UASimulator *)v10 controller];
    v26 = [v25 dispatchQ];
    dispatch_source_t v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_send, v24, 1uLL, v26);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100073CE4;
    handler[3] = &unk_1000C61A8;
    int v34 = v36;
    void handler[4] = v10;
    dispatch_source_t v33 = v27;
    v28 = v27;
    dispatch_source_set_event_handler(v28, handler);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100073F14;
    v30[3] = &unk_1000C61C8;
    int v31 = v36;
    dispatch_source_set_cancel_handler(v28, v30);
    dispatch_resume(v28);
  }
  objc_sync_exit(v10);

  return v6;
}

- (unsigned)pairedClientPort
{
  return self->_pairedClientPort;
}

- (NSSet)notifiedItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_notifiedItems copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setNotifiedItems:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  [(NSMutableSet *)v5->_notifiedItems removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          -[NSMutableSet addObject:](v5->_notifiedItems, "addObject:", v10, (void)v11);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)active
{
  unsigned int v3 = [(UASimulator *)self commandPort];
  if (v3) {
    LOBYTE(v3) = self->_pairedClientPort != 0;
  }
  return v3;
}

- (void)setSimulatorInFront:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"not in front";
    if (v3) {
      CFStringRef v6 = @"IN FRONT";
    }
    int v11 = 138543362;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Simulator application is %{public}@", (uint8_t *)&v11, 0xCu);
  }

  self->_activitiesShouldCrossover = v3;
  id v7 = [(UASimulator *)self controller];
  uint64_t v8 = [v7 manager];
  [v8 scheduleUpdatingAdvertisableItems];

  v9 = [(UASimulator *)self controller];
  uint64_t v10 = [v9 manager];
  [v10 scheduleBestAppDetermination];
}

- (BOOL)resume
{
  v8.receiver = self;
  v8.super_class = (Class)UASimulator;
  BOOL v3 = [(UACornerActionManagerHandler *)&v8 resume];
  if (v3)
  {
    id v4 = [(UASimulator *)self advertiser];
    [v4 resume];

    int v5 = [(UASimulator *)self receiver];
    [v5 resume];

    CFStringRef v6 = [(UASimulator *)self creator];
    [v6 resume];
  }
  return v3;
}

- (BOOL)suspend
{
  v8.receiver = self;
  v8.super_class = (Class)UASimulator;
  BOOL v3 = [(UACornerActionManagerHandler *)&v8 suspend];
  if (v3)
  {
    id v4 = [(UASimulator *)self advertiser];
    [v4 suspend];

    int v5 = [(UASimulator *)self receiver];
    [v5 suspend];

    CFStringRef v6 = [(UASimulator *)self creator];
    [v6 suspend];
  }
  return v3;
}

- (BOOL)terminate
{
  v17.receiver = self;
  v17.super_class = (Class)UASimulator;
  BOOL v3 = [(UACornerActionManagerHandler *)&v17 terminate];
  if (v3)
  {
    id v4 = [(UASimulator *)self advertiser];
    [v4 terminate];

    int v5 = [(UASimulator *)self receiver];
    [v5 terminate];

    CFStringRef v6 = [(UASimulator *)self creator];
    [v6 terminate];

    id v7 = [(UASimulator *)self controller];
    objc_super v8 = [v7 manager];
    v9 = [(UASimulator *)self advertiser];
    [v8 removeAdvertiser:v9];

    uint64_t v10 = [(UASimulator *)self controller];
    int v11 = [v10 manager];
    CFStringRef v12 = [(UASimulator *)self receiver];
    [v11 removeReceiver:v12];

    long long v13 = [(UASimulator *)self controller];
    long long v14 = [v13 manager];
    id v15 = [(UASimulator *)self creator];
    [v14 removeClient:v15];

    mach_port_mod_refs(mach_task_self_, [(UASimulator *)self commandPort], 1u, -1);
    mach_port_mod_refs(mach_task_self_, self->_pairedClientPort, 0, -1);
    self->_commandPort = 0;
    self->_mach_port_name_t pairedClientPort = 0;
  }
  return v3;
}

- (id)statusString
{
  v2 = [(UASimulator *)self peeredDevice];
  BOOL v3 = [v2 name];
  id v4 = +[NSString stringWithFormat:@" - SIMULATOR:%@", v3];

  return v4;
}

- (UASimulatorController)controller
{
  return (UASimulatorController *)objc_getProperty(self, a2, 72, 1);
}

- (SFPeerDevice)ourDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOurDevice:(id)a3
{
}

- (SFPeerDevice)peeredDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPeeredDevice:(id)a3
{
}

- (UASimulatorAdvertiser)advertiser
{
  return (UASimulatorAdvertiser *)objc_getProperty(self, a2, 96, 1);
}

- (UASimulatorReceiver)receiver
{
  return (UASimulatorReceiver *)objc_getProperty(self, a2, 104, 1);
}

- (UASimulatorAdvertisementCreator)creator
{
  return (UASimulatorAdvertisementCreator *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)activitiesShouldCrossover
{
  return self->_activitiesShouldCrossover;
}

- (unsigned)commandPort
{
  return self->_commandPort;
}

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)bootstrapName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootstrapName, 0);
  objc_storeStrong((id *)&self->_dispatchQ, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_peeredDevice, 0);
  objc_storeStrong((id *)&self->_ourDevice, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_notifiedItems, 0);
}

@end