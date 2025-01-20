@interface MRDMediaRemoteClient
- ($115C4C562B26FF47E01F9F4EA65B5887)realToken;
- (BOOL)_isAllowedAccessToDataFromPlayerPath:(id)a3;
- (BOOL)canBeNowPlaying;
- (BOOL)declaringAirplayActive;
- (BOOL)hasRequestedLegacyNowPlayingInfo;
- (BOOL)hasRequestedSupportedCommands;
- (BOOL)isActive;
- (BOOL)isAllowedAccessToDataFromPlayerPath:(id)a3;
- (BOOL)isEntitledFor:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInCriticalSection;
- (BOOL)isMediaRemoteDaemon;
- (BOOL)keepAlive;
- (BOOL)notificationRequiresTaskAssertionForPlayerPath:(id)a3;
- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3;
- (BOOL)takeAssertion:(int64_t)a3 forReason:(id)a4 duration:(double)a5;
- (BOOL)takeAssertionAndBlessForReason:(id)a3;
- (MRDMediaRemoteClient)initWithConnection:(id)a3;
- (MRDMediaRemoteUIService)remoteUIService;
- (MRDPairingHandler)pairingHandler;
- (MRDTaskAssertion)currentTaskAssertion;
- (MRDXPCMessageHandling)messageHandler;
- (MRPlaybackQueueClient)playbackQueueRequests;
- (MRPlayerPath)nowPlayingAirPlaySession;
- (MRXPCConnection)connection;
- (NSArray)applicationPickedRoutes;
- (NSData)auditToken;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)processName;
- (id)_runAssertionName;
- (id)createNowPlayingClient;
- (int)pid;
- (unint64_t)entitlements;
- (unint64_t)routeDiscoveryCount;
- (unsigned)euid;
- (unsigned)hardwareRemoteBehavior;
- (unsigned)outputDeviceDiscoveryMode;
- (unsigned)routeDiscoveryMode;
- (void)_handleXPCMessage:(id)a3;
- (void)_invalidate;
- (void)_postNotification:(id)a3;
- (void)_relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5;
- (void)_resumeConnection;
- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4;
- (void)connectionDidResume:(id)a3;
- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3;
- (void)invalidateCriticalSectionAssertionForRequestID:(id)a3;
- (void)pauseNotifications;
- (void)postNotification:(id)a3;
- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4;
- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5;
- (void)resumeNotifications;
- (void)sendRemoteControlCommand:(id)a3 withCompletionBlock:(id)a4;
- (void)setApplicationPickedRoutes:(id)a3;
- (void)setCurrentTaskAssertion:(id)a3;
- (void)setDeclaringAirplayActive:(BOOL)a3;
- (void)setHardwareRemoteBehavior:(unsigned int)a3;
- (void)setHasRequestedLegacyNowPlayingInfo:(BOOL)a3;
- (void)setHasRequestedSupportedCommands:(BOOL)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setMessageHandler:(id)a3;
- (void)setNowPlayingAirPlaySession:(id)a3;
- (void)setOutputDeviceDiscoveryMode:(unsigned int)a3;
- (void)setPairingHandler:(id)a3;
- (void)setRemoteUIService:(id)a3;
- (void)setRouteDiscoveryMode:(unsigned int)a3;
- (void)setWantsAssertionsForNotificationsWithPlayerPath:(id)a3;
- (void)takeCriticalSectionAssertionForRequestID:(id)a3 completion:(id)a4;
@end

@implementation MRDMediaRemoteClient

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  v6 = +[NSString stringWithFormat:@"<%@ %p, bundleIdentifier = %@, pid = %ld>", v4, self, v5, [(MRDMediaRemoteClient *)self pid]];

  return (NSString *)v6;
}

- (BOOL)isInCriticalSection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D09C;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_handleXPCMessage:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageHandler);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_messageHandler);
    [v5 handleXPCMessage:v6 fromClient:self];
  }
}

- (void)resumeNotifications
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100152F58;
  v17 = sub_100152F68;
  id v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C188;
  block[3] = &unk_100415940;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MRDMediaRemoteClient _postNotification:](self, "_postNotification:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (BOOL)isMediaRemoteDaemon
{
  unsigned int v2 = [(MRDMediaRemoteClient *)self pid];
  return v2 == getpid();
}

- (int)pid
{
  return [(MRXPCConnection *)self->_connection pid];
}

- (MRDMediaRemoteClient)initWithConnection:(id)a3
{
  id v69 = a3;
  v90.receiver = self;
  v90.super_class = (Class)MRDMediaRemoteClient;
  v70 = [(MRDMediaRemoteClient *)&v90 init];
  if (!v70) {
    goto LABEL_56;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  xpc_connection_get_audit_token();
  *(_OWORD *)location = 0u;
  long long v87 = 0u;
  uint64_t v4 = sub_100008ACC(location);
  bundleIdentifier = v70->_bundleIdentifier;
  v70->_bundleIdentifier = (NSString *)v4;

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100010588;
  v84[3] = &unk_10041EAB0;
  uint64_t v6 = v70;
  v85 = v6;
  v68 = objc_retainBlock(v84);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100152704;
  block[3] = &unk_100415CC8;
  val = v6;
  v83 = val;
  if (qword_10047E3D8 != -1) {
    dispatch_once(&qword_10047E3D8, block);
  }
  id v7 = objc_alloc((Class)MRXPCConnection);
  id v8 = [v7 initWithConnection:v69 queue:qword_10047E3D0 defaultReplyQueue:qword_10047E3D0];
  id v9 = val[20];
  val[20] = v8;

  long long v10 = (const char *)((uint64_t (*)(void *, const __CFString *))v68[2])(v68, @"serialQueue");
  long long v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
  id v13 = val[2];
  val[2] = v12;

  objc_storeStrong(val + 3, (id)qword_10047E3C8);
  id v14 = [objc_alloc((Class)MRPlaybackQueueClient) initWithQueue:val[2]];
  id v15 = val[26];
  val[26] = v14;

  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = val[7];
  val[7] = v16;

  id v18 = objc_alloc_init((Class)NSOperationQueue);
  id v19 = val[8];
  val[8] = v18;

  [val[8] setMaxConcurrentOperationCount:1];
  *((unsigned char *)val + 104) = 0;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v21 = val[14];
  val[14] = v20;

  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  id v23 = val[15];
  val[15] = v22;

  v24 = [MRXPCConnectionMonitor alloc];
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = [(MRXPCConnectionMonitor *)v24 initWithXPCConnection:v69 label:v26];
  id v28 = val[12];
  val[12] = v27;

  [val[12] setDelegate:val];
  objc_initWeak(location, val);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10000C3C0;
  v80[3] = &unk_10041EAD8;
  v65 = &v81;
  objc_copyWeak(&v81, location);
  [val[20] setMessageHandler:v80];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100152830;
  v78[3] = &unk_10041EAD8;
  v67 = &v79;
  objc_copyWeak(&v79, location);
  [val[20] setInvalidationHandler:v78];
  v29 = (void *)xpc_copy_entitlement_for_token();

  if (v29) {
    goto LABEL_7;
  }
  v30 = objc_msgSend(val, "bundleIdentifier", &v81, &v79);
  unsigned __int8 v31 = [v30 isEqualToString:@"com.apple.AssistantServices"];

  if ((v31 & 1) != 0
    || ([val bundleIdentifier],
        v32 = objc_claimAutoreleasedReturnValue(),
        unsigned int v33 = [v32 isEqualToString:@"com.apple.lskdd"],
        v32,
        v33))
  {
LABEL_7:
    val[9] = (id)((unint64_t)val[9] | 2);
  }
  v34 = (void *)xpc_copy_entitlement_for_token();

  if (v34) {
    val[9] = (id)((unint64_t)val[9] | 8);
  }
  v35 = (void *)xpc_copy_entitlement_for_token();

  if (v35) {
    val[9] = (id)((unint64_t)val[9] | 0x10);
  }
  v36 = (void *)xpc_copy_entitlement_for_token();

  if (v36
    || (+[MRUserSettings currentSettings],
        v37 = objc_claimAutoreleasedReturnValue(),
        unsigned int v38 = [v37 supportMultiplayerHost],
        v37,
        v38))
  {
    val[9] = (id)((unint64_t)val[9] | 0x20);
  }
  v39 = (void *)xpc_copy_entitlement_for_token();

  if (v39) {
    val[9] = (id)((unint64_t)val[9] | 0x80);
  }
  v40 = (void *)xpc_copy_entitlement_for_token();

  if (v40) {
    val[9] = (id)((unint64_t)val[9] | 0x100);
  }
  v41 = (void *)xpc_copy_entitlement_for_token();

  if (v41) {
    val[9] = (id)((unint64_t)val[9] | 0x800);
  }
  v42 = (void *)xpc_copy_entitlement_for_token();

  if (v42) {
    val[9] = (id)((unint64_t)val[9] | 0x200);
  }
  v43 = (void *)xpc_copy_entitlement_for_token();

  if (v43) {
    val[9] = (id)((unint64_t)val[9] | 0x600);
  }
  v44 = (void *)xpc_copy_entitlement_for_token();

  if (v44) {
    val[9] = (id)((unint64_t)val[9] | 0x1000);
  }
  v45 = (void *)xpc_copy_entitlement_for_token();
  if (v45)
  {
  }
  else
  {
    v46 = +[MRUserSettings currentSettings];
    unsigned __int8 v47 = [v46 supportsNativeThirdPartyApps];

    if (v47) {
      goto LABEL_31;
    }
  }
  val[9] = (id)((unint64_t)val[9] | 0x2000);
LABEL_31:
  v48 = (void *)xpc_copy_entitlement_for_token();

  if (v48) {
    val[9] = (id)((unint64_t)val[9] | 0x4000);
  }
  v49 = (void *)xpc_copy_entitlement_for_token();
  if (v49)
  {
  }
  else
  {
    v50 = +[MRUserSettings currentSettings];
    unsigned __int8 v51 = [v50 supportsNativeThirdPartyApps];

    if (v51) {
      goto LABEL_37;
    }
  }
  val[9] = (id)((unint64_t)val[9] | 0x18000);
LABEL_37:
  xpc_object_t xdict = (xpc_object_t)xpc_copy_entitlement_for_token();
  if (xdict)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v52 = [&off_100438680 countByEnumeratingWithState:&v74 objects:v91 count:16];
    if (v52)
    {
      int v53 = 0;
      uint64_t v72 = *(void *)v75;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v75 != v72) {
            objc_enumerationMutation(&off_100438680);
          }
          id v55 = *(id *)(*((void *)&v74 + 1) + 8 * i);
          v56 = xpc_dictionary_get_array(xdict, (const char *)[v55 UTF8String]);
          v57 = v56;
          if (v56)
          {
            int count = xpc_array_get_count(v56);
            if (count >= 1)
            {
              size_t v59 = 0;
              uint64_t v60 = count;
              while (1)
              {
                v61 = +[NSString stringWithUTF8String:xpc_array_get_string(v57, v59)];
                unsigned __int8 v62 = [v61 isEqualToString:@"com.apple.PairingManager"];

                if (v62) {
                  break;
                }
                if (v60 == ++v59) {
                  goto LABEL_51;
                }
              }
              ++v53;
            }
          }
          else
          {
            v53 += xpc_dictionary_get_BOOL(xdict, (const char *)[v55 UTF8String]);
          }
LABEL_51:
        }
        id v52 = [&off_100438680 countByEnumeratingWithState:&v74 objects:v91 count:16];
      }
      while (v52);
      if (v53 == 4) {
        val[9] = (id)((unint64_t)val[9] | 4);
      }
    }
  }
  objc_msgSend(val[20], "connection", v65);
  v63 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_resume(v63);

  objc_destroyWeak(v67);
  objc_destroyWeak(v66);
  objc_destroyWeak(location);

LABEL_56:
  return v70;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSData)auditToken
{
  [(MRDMediaRemoteClient *)self realToken];
  unsigned int v2 = +[NSData dataWithBytes:&v4 length:32];

  return (NSData *)v2;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  id v4 = [(MRXPCConnection *)self->_connection connection];
  xpc_connection_get_audit_token();

  return result;
}

- (void)setMessageHandler:(id)a3
{
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (unsigned)euid
{
  return [(MRXPCConnection *)self->_connection uid];
}

- (NSString)displayName
{
  char v3 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  id v4 = +[NSString stringWithFormat:@"%@-%ld", v3, [(MRDMediaRemoteClient *)self pid]];

  return (NSString *)v4;
}

- (NSString)processName
{
  processName = self->_processName;
  if (!processName)
  {
    int v4 = proc_pidpath([(MRDMediaRemoteClient *)self pid], buffer, 0x1000u);
    if (v4 >= 1)
    {
      id v5 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v4 encoding:4];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = (NSString *)[v6 copy];
      id v8 = self->_processName;
      self->_processName = v7;
    }
    processName = self->_processName;
  }

  return processName;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  uint64_t v5 = [(MRDMediaRemoteClient *)self pid];
  uint64_t v6 = [(MRDMediaRemoteClient *)self euid];
  connection = self->_connection;
  id v8 = MRCreateIndentedDebugDescriptionFromObject();
  id v9 = +[NSMutableString stringWithFormat:@"<%@ %p {\n    bundle identifier = %@\n    pid = %ld\n    euid = %ld\n    xpc connection = %@\n    connection monitor = %@\n", v3, self, v4, v5, v6, connection, v8];

  if (self->_currentTaskAssertion) {
    [v9 appendFormat:@"    current task assertion = %@\n", self->_currentTaskAssertion];
  }
  if ([(NSMutableArray *)self->_assertions count])
  {
    long long v10 = MRCreateIndentedDebugDescriptionFromArray();
    [v9 appendFormat:@"    assertions = %@\n", v10];
  }
  if (self->_routeDiscoveryMode)
  {
    long long v11 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
    [v9 appendFormat:@"    route discovery mode = %@\n", v11];
  }
  if ([(NSArray *)self->_applicationPickedRoutes count]) {
    [v9 appendFormat:@"    application picked routes = %@\n", self->_applicationPickedRoutes];
  }
  if (self->_hardwareRemoteBehavior)
  {
    dispatch_queue_t v12 = (void *)MRMediaRemoteCopyHardwareRemoteBehaviorDescription();
    [v9 appendFormat:@"    hardware remote behavior = %@\n", v12];
  }
  if (self->_hasRequestedLegacyNowPlayingInfo) {
    objc_msgSend(v9, "appendFormat:", @"    has requested legacy nowPlayingInfo = %s\n", "YES");
  }
  if (self->_hasRequestedSupportedCommands) {
    objc_msgSend(v9, "appendFormat:", @"    has requested supported commands = %s\n", "YES");
  }
  if (self->_declaringAirplayActive) {
    [v9 appendFormat:@"    declaringAirplayActive = YES\n"];
  }
  if (self->_nowPlayingAirPlaySession) {
    [v9 appendFormat:@"    nowPlayingAirPlaySession = %@\n", self->_nowPlayingAirPlaySession];
  }
  if ([(NSMutableArray *)self->_subscribedWakingPlayerPaths count])
  {
    id v13 = MRCreateIndentedDebugDescriptionFromArray();
    [v9 appendFormat:@"    subscribedWakingPlayerPaths = %@\n", v13];
  }
  if (self->_playbackQueueRequests)
  {
    id v14 = MRCreateIndentedDebugDescriptionFromObject();
    [v9 appendFormat:@"    playbackQueueRequests = %@\n", v14];
  }
  [v9 appendString:@"}\n"];
  [v9 appendFormat:@"}>"];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(MRDMediaRemoteClient *)self pid];
    unsigned int v7 = [v5 pid];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setRouteDiscoveryMode:(unsigned int)a3
{
  if (self->_routeDiscoveryMode != a3)
  {
    self->_routeDiscoveryMode = a3;
    id v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client switched route discovery mode to: %lu", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setOutputDeviceDiscoveryMode:(unsigned int)a3
{
  if (self->_outputDeviceDiscoveryMode != a3)
  {
    self->_outputDeviceDiscoveryMode = a3;
    id v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client switched output device discovery mode to: %lu", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (NSArray)applicationPickedRoutes
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100152F58;
  long long v10 = sub_100152F68;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100152F70;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setApplicationPickedRoutes:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100153054;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (MRDPairingHandler)pairingHandler
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100152F58;
  long long v10 = sub_100152F68;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100153188;
  v5[3] = &unk_100415940;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDPairingHandler *)v3;
}

- (void)setRemoteUIService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIService, a3);
  id v5 = a3;
  [(MRDMediaRemoteUIService *)self->_remoteUIService setBundleIdentifier:self->_bundleIdentifier];
}

- (void)setKeepAlive:(BOOL)a3
{
  if (self->_keepAlive != a3) {
    self->_keepAlive = a3;
  }
}

- (BOOL)hasRequestedLegacyNowPlayingInfo
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100153314;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canBeNowPlaying
{
  char v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];
  id v5 = +[MROrigin localOrigin];
  uint64_t v6 = [v4 originClientForOrigin:v5];

  unsigned int v7 = objc_msgSend(v6, "existingNowPlayingClientForPid:", -[MRDMediaRemoteClient pid](self, "pid"));
  LOBYTE(v3) = [v7 canBeNowPlaying];

  return (char)v3;
}

- (void)setDeclaringAirplayActive:(BOOL)a3
{
  if (self->_declaringAirplayActive != a3)
  {
    self->_declaringAirplayActive = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"MRDMediaRemoteClientDeclaringAirplayActiveDidChange" object:self];
  }
}

- (BOOL)isEntitledFor:(unint64_t)a3
{
  if ((a3 & ~self->_entitlements) != 0) {
    return [(MRDMediaRemoteClient *)self isMediaRemoteDaemon];
  }
  else {
    return 1;
  }
}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001535DC;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015374C;
  block[3] = &unk_100416870;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = sub_100152F58;
    id v22 = sub_100152F68;
    id v23 = 0;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001539FC;
    block[3] = &unk_100415CF0;
    void block[4] = self;
    void block[5] = &v18;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)v19[5];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "first", (void)v13);
          id v12 = [v10 second];
          v4[2](v4, v11, v12);
        }
        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (BOOL)_isAllowedAccessToDataFromPlayerPath:(id)a3
{
  return 1;
}

- (BOOL)isAllowedAccessToDataFromPlayerPath:(id)a3
{
  id v4 = a3;
  if ([(MRDMediaRemoteClient *)self isEntitledFor:1024]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(MRDMediaRemoteClient *)self _isAllowedAccessToDataFromPlayerPath:v4];
  }

  return v5;
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  if ([(MRDMediaRemoteClient *)self isMediaRemoteDaemon])
  {
    BOOL v5 = [v4 notification];
    id v6 = [v4 userInfo];
    id v7 = +[MRMediaRemoteServiceClient sharedServiceClient];
    MRNotificationServiceClientPostNotificationCallback();
  }
  else
  {
    objc_initWeak(&location, self);
    connectionMonitor = self->_connectionMonitor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100153C08;
    v9[3] = &unk_10041EB00;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    id v10 = v4;
    [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)pauseNotifications
{
  if (![(MRDMediaRemoteClient *)self isInCriticalSection])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100153DCC;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (BOOL)notificationRequiresTaskAssertionForPlayerPath:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100153E98;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  if (a3) {
    LOBYTE(a3) = *((unsigned char *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

- (void)setWantsAssertionsForNotificationsWithPlayerPath:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100153F70;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (BOOL)takeAssertion:(int64_t)a3 forReason:(id)a4 duration:(double)a5
{
  id v8 = a4;
  objc_initWeak(&location, self);
  uint64_t v9 = [MRDTaskAssertion alloc];
  uint64_t v10 = [(MRDMediaRemoteClient *)self pid];
  id v11 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001541A4;
  v23[3] = &unk_10041EB28;
  objc_copyWeak(&v24, &location);
  id v12 = [(MRDTaskAssertion *)v9 initWithType:a3 pid:v10 bundleID:v11 name:v8 invalidationHandler:v23];

  if ([(MRDTaskAssertion *)v12 invalidateInDuration:a5])
  {
    serialQueue = self->_serialQueue;
    long long v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_100154268;
    id v19 = &unk_10041EB50;
    objc_copyWeak(v22, &location);
    id v20 = v8;
    v22[1] = *(id *)&a5;
    id v21 = v12;
    dispatch_async((dispatch_queue_t)serialQueue, &v16);

    objc_destroyWeak(v22);
  }
  unsigned __int8 v14 = [(MRDTaskAssertion *)v12 isValid];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v14;
}

- (BOOL)takeAssertionAndBlessForReason:(id)a3
{
  if ([(MRDMediaRemoteClient *)self takeAssertion:4 forReason:a3 duration:30.0])
  {
    id v4 = [(MRDMediaRemoteClient *)self bundleIdentifier];
    unsigned __int8 v5 = sub_100169F18(v4);

    if (v5) {
      return 1;
    }
    uint64_t v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100330E30((uint64_t)self, v7);
    }
  }
  else
  {
    uint64_t v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100330EA8((uint64_t)self, v7);
    }
  }

  return 0;
}

- (void)takeCriticalSectionAssertionForRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001545D8;
  block[3] = &unk_10041AB68;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)invalidateCriticalSectionAssertionForRequestID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100154974;
  block[3] = &unk_1004182A8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendRemoteControlCommand:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSDate now];
  id v9 = [v6 playerPath];
  v58 = [v9 client];
  id v10 = [v9 origin];
  unsigned int v11 = [v10 isLocal];

  if (v11) {
    goto LABEL_29;
  }
  id v12 = [v9 origin];
  unsigned int v13 = [v12 isLocallyHosted];

  if (v13)
  {
    id v14 = [v58 bundleIdentifier];
    id v15 = [(MRDMediaRemoteClient *)self bundleIdentifier];
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
LABEL_29:
      if (![v58 processIdentifier]) {
        objc_msgSend(v58, "setProcessIdentifier:", -[MRDMediaRemoteClient pid](self, "pid"));
      }
    }
  }
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_100152F58;
  v86 = sub_100152F68;
  id v87 = 0;
  id v17 = objc_alloc((Class)NSMutableString);
  uint64_t v18 = [v6 commandID];
  id v19 = [v17 initWithFormat:@"%@<%@>", @"sendRemoteControlCommand", v18];

  if (v9) {
    [v19 appendFormat:@" for %@", v9];
  }
  id v20 = _MRLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v89 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1001554A0;
  v77[3] = &unk_10041EBA0;
  id v21 = v6;
  id v78 = v21;
  id v54 = v8;
  id v79 = v54;
  id v53 = v7;
  id v80 = v53;
  id v81 = &v82;
  id v22 = objc_retainBlock(v77);
  id v23 = objc_alloc((Class)MRBlockGuard);
  id v24 = [v21 description];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1001556FC;
  v75[3] = &unk_100415FA8;
  v25 = v22;
  id v76 = v25;
  id v26 = [v23 initWithTimeout:v24 reason:v75 handler:0.0];

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10015577C;
  v72[3] = &unk_100416848;
  id v56 = v26;
  id v73 = v56;
  id v55 = v25;
  id v74 = v55;
  v57 = objc_retainBlock(v72);
  if ([(MRDMediaRemoteClient *)self isMediaRemoteDaemon])
  {
    [v21 commandType];
    v27 = [v21 options];
    MRServiceClientRemoteCommandCallback();
    goto LABEL_26;
  }
  uint64_t v50 = +[RBSProcessIdentifier identifierWithPid:[(MRDMediaRemoteClient *)self pid]];
  +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:");
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1001557E0;
  v69[3] = &unk_10041EBF0;
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  id v70 = v49;
  unsigned __int8 v51 = v57;
  id v71 = v51;
  uint64_t v28 = +[RBSProcessMonitor monitorWithConfiguration:v69];
  v29 = (void *)v83[5];
  v83[5] = v28;

  v30 = [v9 origin];
  if ([v30 isLocallyHosted])
  {
    unsigned int v31 = [v21 shouldImplicitlyLaunchApplication];

    if (!v31) {
      goto LABEL_18;
    }
    v32 = [(MRDMediaRemoteClient *)self bundleIdentifier];
    unsigned int v33 = sub_100169F18(v32);

    if (!v33) {
      goto LABEL_18;
    }
    v30 = _MRLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [v21 commandID];
      *(_DWORD *)buf = 138543362;
      id v89 = v34;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Set AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute for command %{public}@", buf, 0xCu);
    }
  }

LABEL_18:
  xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v35, "MRXPC_MESSAGE_ID_KEY", 0x800000000000001uLL);
  xpc_dictionary_set_uint64(v35, "MRXPC_COMMAND_KEY", [v21 commandType]);
  id v52 = [v21 optionsData];
  if (v52)
  {
    id v36 = v52;
    xpc_dictionary_set_data(v35, "MRXPC_COMMAND_OPTIONS_KEY", [v36 bytes], (size_t)objc_msgSend(v36, "length"));
  }
  MRAddPlayerPathToXPCMessage();
  objc_initWeak((id *)buf, self);
  v37 = [v21 commandID];
  unsigned int v38 = +[NSString stringWithFormat:@"Sending remote control command %@", v37];

  v39 = [MRDTaskAssertion alloc];
  uint64_t v40 = [(MRDMediaRemoteClient *)self pid];
  v41 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100155A0C;
  v67[3] = &unk_10041EB28;
  objc_copyWeak(&v68, (id *)buf);
  v42 = [(MRDTaskAssertion *)v39 initWithType:1 pid:v40 bundleID:v41 name:v38 invalidationHandler:v67];

  if ([(MRDTaskAssertion *)v42 invalidateInDuration:10.0])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100155AD0;
    block[3] = &unk_1004182A8;
    objc_copyWeak(&v66, (id *)buf);
    v65 = v42;
    dispatch_async((dispatch_queue_t)serialQueue, block);

    objc_destroyWeak(&v66);
  }
  v44 = _MRLogForCategory();
  v45 = [v21 commandID];
  v46 = (char *)[v45 hash];

  if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)v63 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v46, "SendCommandXPCToApp", "", v63, 2u);
  }

  kdebug_trace();
  unsigned __int8 v47 = [(MRXPCConnection *)self->_connection connection];
  workerQueue = self->_workerQueue;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100155B24;
  v59[3] = &unk_10041EC18;
  id v60 = v21;
  v61 = self;
  unsigned __int8 v62 = v51;
  sub_100167A5C(v47, v35, workerQueue, v59);

  objc_destroyWeak(&v68);
  objc_destroyWeak((id *)buf);

  v27 = (void *)v50;
LABEL_26:

  _Block_object_dispose(&v82, 8);
}

- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4
{
}

- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  relayingMessages = self->_relayingMessages;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100155E10;
  v13[3] = &unk_10041EC40;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  BOOL v17 = a4;
  id v12 = v9;
  id v15 = v12;
  [(NSOperationQueue *)relayingMessages addOperationWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MRXPCConnection *)self->_connection connection];

  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "MRXPC_MESSAGE_ID_KEY");
    if (uint64 == 0x700000000000002)
    {
      CFStringRef v12 = @"RequestPlaybackQueue";
    }
    else if (uint64 == 0x500000000000001)
    {
      CFStringRef v12 = @"BeginLoadingBrowsableContent";
    }
    else
    {
      CFStringRef v12 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%llu", uint64);
    }
    id v24 = (__CFString *)v12;
    unsigned int v13 = +[NSString stringWithFormat:@"Relaying XPC message %@ to client %@", v12, self];
    id v14 = [MRDTaskAssertion alloc];
    uint64_t v15 = [(MRDMediaRemoteClient *)self pid];
    id v16 = [(MRDMediaRemoteClient *)self bundleIdentifier];
    BOOL v17 = [(MRDTaskAssertion *)v14 initWithType:2 pid:v15 bundleID:v16 name:v13];

    double v18 = 10.0;
    if (v6) {
      double v18 = 29.0;
    }
    if ([(MRDTaskAssertion *)v17 invalidateInDuration:v18])
    {
      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100156230;
      block[3] = &unk_1004158D8;
      void block[4] = self;
      unsigned int v33 = v17;
      dispatch_sync((dispatch_queue_t)serialQueue, block);
    }
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    sub_1001677D8(v20, v8);
    objc_initWeak(&location, self);
    id v21 = [(MRXPCConnection *)self->_connection connection];
    id v22 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10015639C;
    v25[3] = &unk_10041EC68;
    id v28 = v9;
    BOOL v30 = v6;
    id v26 = v8;
    objc_copyWeak(&v29, &location);
    id v23 = v17;
    v27 = v23;
    sub_100167A5C(v21, v20, &_dispatch_main_q, v25);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    sub_10001432C(v8, (uint64_t)"MRXPC_ERROR_CODE_KEY", 1, 4, 0);
  }
}

- (id)createNowPlayingClient
{
  id v3 = objc_alloc((Class)MRClient);
  uint64_t v4 = [(MRDMediaRemoteClient *)self pid];
  unsigned __int8 v5 = [(MRDMediaRemoteClient *)self bundleIdentifier];
  id v6 = [v3 initWithProcessIdentifier:v4 bundleIdentifier:v5];

  return v6;
}

- (void)connectionDidResume:(id)a3
{
}

- (void)_invalidate
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MRDMediaRemoteClientDidInvalidate" object:self];
}

- (id)_runAssertionName
{
  return +[NSString stringWithFormat:@"%@-%@", objc_opt_class(), self->_bundleIdentifier];
}

- (void)_resumeConnection
{
  id v3 = [(MRXPCConnection *)self->_connection connection];
  uint64_t v4 = MRCreateXPCMessage();
  xpc_connection_send_message(v3, v4);

  unsigned __int8 v5 = +[MRDMediaRemoteServer server];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100156720;
  v6[3] = &unk_10041EC90;
  v6[4] = self;
  [v5 restoreClientState:self handler:v6];
}

- (void)_postNotification:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 userInfo];
  unsigned __int8 v5 = MRGetPlayerPathFromUserInfo();

  if ([(MRDMediaRemoteClient *)self isAllowedAccessToDataFromPlayerPath:v5])
  {
    id v6 = [v12 userInfo];
    id v7 = MRGetPlayerPathFromUserInfo();
    unsigned int v8 = [(MRDMediaRemoteClient *)self notificationRequiresTaskAssertionForPlayerPath:v7];

    if (v8)
    {
      id v9 = +[MRUserSettings currentSettings];
      [v9 wakingPlayerPathAssertionDuration];
      -[MRDMediaRemoteClient takeAssertion:forReason:duration:](self, "takeAssertion:forReason:duration:", 4, @"WakingPlayerPathNotification");
    }
    id v10 = [(MRXPCConnection *)self->_connection connection];
    id v11 = [v12 xpcMessage];
    xpc_connection_send_message(v10, v11);
  }
}

- (MRDXPCMessageHandling)messageHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageHandler);

  return (MRDXPCMessageHandling *)WeakRetained;
}

- (MRXPCConnection)connection
{
  return self->_connection;
}

- (MRDTaskAssertion)currentTaskAssertion
{
  return self->_currentTaskAssertion;
}

- (void)setCurrentTaskAssertion:(id)a3
{
}

- (unsigned)hardwareRemoteBehavior
{
  return self->_hardwareRemoteBehavior;
}

- (void)setHardwareRemoteBehavior:(unsigned int)a3
{
  self->_hardwareRemoteBehavior = a3;
}

- (unint64_t)routeDiscoveryCount
{
  return self->_routeDiscoveryCount;
}

- (unsigned)routeDiscoveryMode
{
  return self->_routeDiscoveryMode;
}

- (unsigned)outputDeviceDiscoveryMode
{
  return self->_outputDeviceDiscoveryMode;
}

- (MRDMediaRemoteUIService)remoteUIService
{
  return self->_remoteUIService;
}

- (void)setPairingHandler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (void)setHasRequestedLegacyNowPlayingInfo:(BOOL)a3
{
  self->_hasRequestedLegacyNowPlayingInfo = a3;
}

- (BOOL)hasRequestedSupportedCommands
{
  return self->_hasRequestedSupportedCommands;
}

- (void)setHasRequestedSupportedCommands:(BOOL)a3
{
  self->_hasRequestedSupportedCommands = a3;
}

- (BOOL)declaringAirplayActive
{
  return self->_declaringAirplayActive;
}

- (MRPlayerPath)nowPlayingAirPlaySession
{
  return self->_nowPlayingAirPlaySession;
}

- (void)setNowPlayingAirPlaySession:(id)a3
{
}

- (MRPlaybackQueueClient)playbackQueueRequests
{
  return self->_playbackQueueRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueRequests, 0);
  objc_storeStrong((id *)&self->_nowPlayingAirPlaySession, 0);
  objc_storeStrong((id *)&self->_pairingHandler, 0);
  objc_storeStrong((id *)&self->_remoteUIService, 0);
  objc_storeStrong((id *)&self->_currentTaskAssertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_messageHandler);
  objc_storeStrong((id *)&self->_criticalSectionAssertions, 0);
  objc_storeStrong((id *)&self->_queuedNotifications, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_subscribedWakingPlayerPaths, 0);
  objc_storeStrong((id *)&self->_pendingPlaybackSessionMigrateEvents, 0);
  objc_storeStrong((id *)&self->_relayingMessages, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationPickedRoutes, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end