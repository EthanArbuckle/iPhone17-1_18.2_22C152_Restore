@interface PCCBridgeEndpoint
+ (BOOL)isSupportedRemoteDeviceType:(unsigned int)a3;
+ (id)UDIDForRemoteDevice:(id)a3;
+ (id)identifierForRemoteDevice:(id)a3;
+ (id)remoteDeviceForIdentifier:(id)a3;
+ (void)addSenderToMessage:(id)a3;
- (BOOL)isDeviceNearby:(id)a3;
- (PCCBridgeEndpoint)init;
- (id)connectionForIdentifier:(id)a3;
- (id)deviceIds;
- (id)identifierForTarget:(id)a3;
- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)send:(id)a3 message:(id)a4 error:(id *)a5;
- (id)synchronize:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)enterInterruptedStateFrom:(id)a3;
- (void)exitInterruptedStateFrom:(id)a3;
- (void)init;
- (void)runWithDelegate:(id)a3;
- (void)setupDeviceStateChangeHandler;
- (void)setupIncomingEventListener;
- (void)setupOutgoingConnection:(id)a3;
- (void)stashCrashReporterKeyForIdentifier:(id)a3;
@end

@implementation PCCBridgeEndpoint

- (PCCBridgeEndpoint)init
{
  v2 = self;
  if (MEMORY[0x1E4F95E10]) {
    BOOL v3 = MEMORY[0x1E4F95E20] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    || MEMORY[0x1E4F95E38] == 0
    || MEMORY[0x1E4F95E48] == 0
    || MEMORY[0x1E4F95E50] == 0
    || MEMORY[0x1E4F95E58] == 0
    || MEMORY[0x1E4F95E60] == 0
    || MEMORY[0x1E4F95E68] == 0
    || MEMORY[0x1E4F95E70] == 0
    || MEMORY[0x1E4F95E78] == 0
    || MEMORY[0x1E4F95E80] == 0
    || MEMORY[0x1E4F95FA0] == 0
    || MEMORY[0x1E4F95FA8] == 0
    || MEMORY[0x1E4F95FB0] == 0
    || MEMORY[0x1E4F95FC0] == 0
    || MEMORY[0x1E4F95FC8] == 0
    || MEMORY[0x1E4F95FD0] == 0
    || MEMORY[0x1E4F95FD8] == 0)
  {
    BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v20) {
      [(PCCBridgeEndpoint *)v20 init];
    }
    goto LABEL_62;
  }
  v50.receiver = self;
  v50.super_class = (Class)PCCBridgeEndpoint;
  v28 = [(PCCBridgeEndpoint *)&v50 init];
  v2 = v28;
  if (v28)
  {
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.initialization", 0);
    initializationQueue = v2->_initializationQueue;
    v2->_initializationQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_t v31 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.events", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    remoteDevices = v2->_remoteDevices;
    v2->_remoteDevices = (NSMutableDictionary *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
    remoteCRKeys = v2->_remoteCRKeys;
    v2->_remoteCRKeys = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
    outgoingConnections = v2->_outgoingConnections;
    v2->_outgoingConnections = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
    interruptedDevices = v2->_interruptedDevices;
    v2->_interruptedDevices = (NSMutableSet *)v39;
  }
  if ((OSAIsRSDHost() & 1) == 0 && (OSAIsRSDDevice() & 1) == 0)
  {
    BOOL v41 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v41) {
      [(PCCBridgeEndpoint *)v41 init];
    }
LABEL_62:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = self->_outgoingConnections;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    v8 = MEMORY[0x1E4F14500];
    *(void *)&long long v5 = 138412290;
    long long v12 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          uint64_t v19 = v10;
          _os_log_impl(&dword_1DBFFE000, v8, OS_LOG_TYPE_DEFAULT, "canceling remote connection with %@", buf, 0xCu);
        }
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v10, v12);
        xpc_remote_connection_cancel();

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  if (self->_listeningConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "canceling listening connection", buf, 2u);
    }
    xpc_remote_connection_cancel();
  }
  if (self->_device_browser) {
    remote_device_browser_cancel();
  }
  v13.receiver = self;
  v13.super_class = (Class)PCCBridgeEndpoint;
  [(PCCBridgeEndpoint *)&v13 dealloc];
}

- (void)runWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PCCBridgeEndpoint;
  [(PCCEndpoint *)&v4 runWithDelegate:a3];
  [(PCCBridgeEndpoint *)self setupDeviceStateChangeHandler];
  [(PCCBridgeEndpoint *)self setupIncomingEventListener];
}

- (void)setupIncomingEventListener
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, MEMORY[0x1E4F14500], v0, "Couldn't create the listener connection for %s", v1, v2, v3, v4, v5);
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)MEMORY[0x1E4F14528];
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "incoming connection from %s is DOWN", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "incoming connection from %s is UP", buf, 0xCu);
    }
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
  }
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1E0197DA0]();
  if (v4 != MEMORY[0x1E4F145A8])
  {
    if (v4 != MEMORY[0x1E4F14590])
    {
      BOOL v5 = "received unknown event";
LABEL_32:
      uint64_t v25 = (void *)MEMORY[0x1E0197CE0](v3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_13_cold_1((uint64_t)v5);
      }
      if (v25) {
        free(v25);
      }
      goto LABEL_36;
    }
    v8 = (void *)MEMORY[0x1E0197840]();
    uint64_t v9 = xpc2ns();
    uint64_t v10 = [v9 objectForKeyedSubscript:@"kOSASender"];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_queue_t v31 = 0;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Registering new sender from incoming message.", v31, 2u);
      }
      v11 = *(void **)(*(void *)(a1 + 32) + 56);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_17;
      v28[3] = &unk_1E6C29960;
      id v29 = v10;
      v30 = buf;
      [v11 enumerateKeysAndObjectsUsingBlock:v28];
      if (!*(void *)(*(void *)&buf[8] + 40)
        || (objc_msgSend(*(id *)(a1 + 32), "exitInterruptedStateFrom:"), !*(void *)(*(void *)&buf[8] + 40))
        || (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKeyedSubscript:"),
            long long v12 = objc_claimAutoreleasedReturnValue(),
            BOOL v13 = v12 == 0,
            v12,
            v13))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)dispatch_queue_t v31 = 0;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "UNEXPECTED: incoming msg BEFORE outgoing connection established! *** consider deferring listener initialization ***", v31, 2u);
        }
      }
    }
    long long v14 = [v9 objectForKeyedSubscript:@"messageType"];
    if ([v14 isEqualToString:@"<file>"])
    {
      long long v15 = NSTemporaryDirectory();
      long long v16 = [v15 stringByAppendingPathComponent:@"bridge-xfer.XXXXXX"];

      xpc_object_t reply = v16;
      v18 = (const char *)[reply fileSystemRepresentation];
      size_t v19 = strlen(v18);
      BOOL v20 = (char *)malloc_type_malloc(v19 + 1, 0x4BDC5B76uLL);
      uint64_t v21 = strcpy(v20, v18);
      if (mkstemp(v21) < 0)
      {
        free(v20);
      }
      else
      {
        uint64_t v22 = xpc_dictionary_get_value(v3, "<file_xfer>");
        id v26 = v9;
        id v27 = v3;
        xpc_file_transfer_write_to_fd();
      }
      goto LABEL_29;
    }
    if ([v14 isEqualToString:@"kOSAFetchCrashReporterKey"])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_queue_t v31 = 0;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Handling request to fetch crash reporter key", v31, 2u);
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      if (!reply)
      {
        BOOL v5 = "failed to create reply message to fetch crash reporter key";
        goto LABEL_30;
      }
      uint64_t v23 = [MEMORY[0x1E4F83948] sharedInstance];
      id v24 = [v23 crashReporterKey];
      xpc_dictionary_set_string(reply, "crashReporterKey", (const char *)[v24 UTF8String]);

      xpc_dictionary_send_reply();
LABEL_29:
      BOOL v5 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_13_cold_2();
      }
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        xpc_object_t reply = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        [reply handleMessage:v9 from:*(void *)(*(void *)&buf[8] + 40)];
        goto LABEL_29;
      }
      BOOL v5 = "received message with missing/unknown sender";
    }
    else
    {
      BOOL v5 = "received unknown dictionary";
    }
LABEL_31:

    _Block_object_dispose(buf, 8);
    if (!v5) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = string;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "incoming connection from %s ERROR %s\n", buf, 0x16u);
  }
LABEL_36:
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_17(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_29(uint64_t a1, int a2)
{
  if (!a2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:*(void *)(a1 + 64) isDirectory:0 relativeToURL:0];
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"fileMetadata"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_29_cold_2(v3);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [WeakRetained handleFile:v3 from:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) metadata:v4];

      goto LABEL_12;
    }
    uint64_t v6 = (void *)MEMORY[0x1E0197CE0](*(void *)(a1 + 48));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_29_cold_1((uint64_t)v4);
      if (!v6) {
        goto LABEL_12;
      }
    }
    else if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    free(v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to write tmp remote file", v7, 2u);
  }
LABEL_13:
  unlink(*(const char **)(a1 + 64));
  free(*(void **)(a1 + 64));
}

- (void)setupDeviceStateChangeHandler
{
  if (self->_device_browser)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Browser is already up; skipping setup",
        buf,
        2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Browser is down; proceeding with setup",
        buf,
        2u);
    }
    started = (OS_remote_device_browser *)remote_device_start_browsing();
    device_browser = self->_device_browser;
    self->_device_browser = started;
  }
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a3)
  {
    if (v5)
    {
      uint64_t type = remote_device_get_type();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t description = remote_device_type_get_description();
        uint64_t name = remote_device_get_name();
        remote_device_get_state();
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = description;
        __int16 v20 = 2080;
        uint64_t v21 = name;
        __int16 v22 = 2080;
        uint64_t v23 = remote_device_state_get_description();
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Browser found %s-%s: %s", buf, 0x20u);
      }
      if (+[PCCBridgeEndpoint isSupportedRemoteDeviceType:type])
      {
        remote_device_set_connected_callback();
        long long v12 = dispatch_get_global_queue(0, 0);
        remote_device_set_disconnected_callback();

        goto LABEL_15;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      uint64_t v17 = remote_device_type_get_description();
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = v17;
      BOOL v13 = MEMORY[0x1E4F14500];
      long long v14 = "Ignoring device of type %s";
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      BOOL v13 = MEMORY[0x1E4F14500];
      long long v14 = "Got a NULL device from the remote device browser";
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 2;
    }
    _os_log_impl(&dword_1DBFFE000, v13, v15, v14, buf, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Browser was canceled", buf, 2u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;

LABEL_15:
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  remote_device_get_type();
  uint64_t description = remote_device_type_get_description();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = description;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device '%s' in connected state; attempting to establish service",
      (uint8_t *)&v5,
      0xCu);
  }
  [*(id *)(a1 + 32) setupOutgoingConnection:v3];
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t name = remote_device_get_name();
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device %s is disconnected", buf, 0xCu);
  }
  uint64_t v4 = +[PCCBridgeEndpoint identifierForRemoteDevice:v3];
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Tearing down connections for disconnected device %@.", buf, 0xCu);
    }
    int v5 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v4];

    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "removing registered device", buf, 2u);
      }
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:v4];
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device %@ disconnected before registration.", buf, 0xCu);
    }
    os_log_type_t v15 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v4];

    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t name = (uint64_t)v4;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "canceling remote connection for %@.", buf, 0xCu);
      }
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v4];
      xpc_remote_connection_cancel();

      [*(id *)(*(void *)(a1 + 32) + 72) setObject:0 forKeyedSubscript:v4];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(NSObject **)(v18 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_50;
      v20[3] = &unk_1E6C29A00;
      v20[4] = v18;
      id v21 = v4;
      dispatch_async(v19, v20);
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device %@ disconnected before outgoing connections were set up.", buf, 0xCu);
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7) {
      __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_49_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained handleConnection:0 from:*(void *)(a1 + 40)];
}

- (id)deviceIds
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_remoteDevices;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v24[0] = @"uuid";
        v24[1] = @"nearby";
        v25[0] = v8;
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PCCBridgeEndpoint isDeviceNearby:](self, "isDeviceNearby:", v8));
        v25[1] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
        uint64_t v11 = (void *)[v10 mutableCopy];

        [(PCCBridgeEndpoint *)self stashCrashReporterKeyForIdentifier:v8];
        uint64_t v12 = [(NSMutableDictionary *)self->_remoteCRKeys objectForKeyedSubscript:v8];
        [v11 setObject:v12 forKeyedSubscript:@"crashreporter_key"];

        uint64_t v13 = +[PCCBridgeEndpoint remoteDeviceForIdentifier:v8];
        if (v13)
        {
          uint64_t name = remote_device_get_name();
          if (name)
          {
            os_log_type_t v15 = [NSString stringWithUTF8String:name];
            [v11 setObject:v15 forKeyedSubscript:@"name"];
          }
        }
        BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v11];
        [v3 addObject:v16];
      }
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }

  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v17;
}

- (BOOL)isDeviceNearby:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)synchronize:(id)a3 withOptions:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PCCBridgeEndpoint *)self identifierForTarget:v5];
  if (v6)
  {
    BOOL v7 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v6];

    if (!v7)
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_remoteDevices objectForKeyedSubscript:v6];

      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      if (v8)
      {
        uint64_t v15 = *MEMORY[0x1E4F28568];
        BOOL v16 = @"No remote device found";
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        uint64_t v11 = v9;
        uint64_t v12 = 4;
      }
      else
      {
        uint64_t v17 = *MEMORY[0x1E4F28568];
        v18[0] = @"No remote connection to target device";
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        uint64_t v11 = v9;
        uint64_t v12 = 1;
      }
      uint64_t v13 = [v11 errorWithDomain:@"ProxyBridgeErrorDomain" code:v12 userInfo:v10];

      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[PCCBridgeEndpoint synchronize:withOptions:]();
  }
  uint64_t v13 = 0;
LABEL_10:

  return v13;
}

- (void)enterInterruptedStateFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_interruptedDevices containsObject:v4])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ is already in interruped state; passing",
        buf,
        0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ is entering interrupted state; disconnecting",
        buf,
        0xCu);
    }
    [(NSMutableSet *)self->_interruptedDevices addObject:v4];
    eventQueue = self->_eventQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke;
    v6[3] = &unk_1E6C29A00;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(eventQueue, v6);
  }
}

void __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained handleConnection:0 from:*(void *)(a1 + 40)];
}

- (void)exitInterruptedStateFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_interruptedDevices containsObject:v4])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ is exiting interruped state; reconnecting",
        buf,
        0xCu);
    }
    [(NSMutableSet *)self->_interruptedDevices removeObject:v4];
    eventQueue = self->_eventQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke;
    v6[3] = &unk_1E6C29A00;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(eventQueue, v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ is not in interruped state; passing",
      buf,
      0xCu);
  }
}

void __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained handleConnection:1 from:*(void *)(a1 + 40)];
}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PCCBridgeEndpoint *)self identifierForTarget:v8];
  if (v10)
  {
    uint64_t v11 = [(PCCBridgeEndpoint *)self connectionForIdentifier:v10];

    if (v11)
    {
      uint64_t v12 = ns2xpc();
      +[PCCBridgeEndpoint addSenderToMessage:v12];
      uint64_t v13 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v10];
      xpc_remote_connection_send_message();

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v9 objectForKeyedSubscript:@"messageType"];
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v14;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sent %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v9 objectForKeyedSubscript:@"messageType"];
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 2112;
        id v29 = v15;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "No connection to %@ on which to send message of type %@", buf, 0x16u);
      }
      if (a5)
      {
        BOOL v16 = [(NSMutableDictionary *)self->_remoteDevices objectForKeyedSubscript:v10];

        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        if (v16)
        {
          uint64_t v24 = *MEMORY[0x1E4F28568];
          uint64_t v25 = @"No remote connection to target device";
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          uint64_t v19 = v17;
          uint64_t v20 = 1;
        }
        else
        {
          uint64_t v22 = *MEMORY[0x1E4F28568];
          long long v23 = @"No remote device found";
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          uint64_t v19 = v17;
          uint64_t v20 = 4;
        }
        *a5 = [v19 errorWithDomain:@"ProxyBridgeErrorDomain" code:v20 userInfo:v18];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[PCCBridgeEndpoint synchronize:withOptions:]();
  }

  return 0;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PCCBridgeEndpoint *)self identifierForTarget:v10];
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PCCBridgeEndpoint synchronize:withOptions:]();
    }
    goto LABEL_27;
  }
  uint64_t v14 = [(PCCBridgeEndpoint *)self connectionForIdentifier:v13];

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v13;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "No connection to %@ on which to send file", buf, 0xCu);
    }
    if (a6)
    {
      uint64_t v17 = [(NSMutableDictionary *)self->_remoteDevices objectForKeyedSubscript:v13];

      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      if (v17)
      {
        uint64_t v41 = *MEMORY[0x1E4F28568];
        uint64_t v42 = @"No remote connection to target device";
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        uint64_t v20 = v18;
        uint64_t v21 = 1;
      }
      else
      {
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40 = @"No remote device found";
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        uint64_t v20 = v18;
        uint64_t v21 = 4;
      }
      *a6 = [v20 errorWithDomain:@"ProxyBridgeErrorDomain" code:v21 userInfo:v19];
    }
LABEL_27:
    id v27 = 0;
    goto LABEL_28;
  }
  uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
  BOOL v16 = [v15 UUIDString];

  if (v12) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
  }
  else {
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v34 = a6;
  if (OSAIsRSDDisplay()) {
    [v22 setObject:@"display" forKeyedSubscript:@"deviceType"];
  }
  v49[0] = @"messageType";
  v49[1] = @"fileMetadata";
  v50[0] = @"<file>";
  v50[1] = v22;
  id v35 = v22;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  uint64_t v24 = ns2xpc();

  id v25 = v11;
  [v25 fileSystemRepresentation];
  id v26 = v25;
  uint64_t v36 = v26;
  id v27 = v16;
  uint64_t v37 = v27;
  id v28 = v13;
  v38 = v28;
  id v29 = (void *)xpc_file_transfer_create_with_path();
  if (v29)
  {
    xpc_dictionary_set_value(v24, "<file_xfer>", v29);
    +[PCCBridgeEndpoint addSenderToMessage:v24];
    uint64_t v30 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v28];
    xpc_remote_connection_send_message();

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v46 = v26;
      __int16 v47 = 2114;
      id v48 = v27;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "sent %{public}@, tracking: %{public}@", buf, 0x16u);
    }
  }
  else
  {

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v26;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to create xpc file xfer object for %{public}@", buf, 0xCu);
    }
    if (v34)
    {
      dispatch_queue_t v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      uint64_t v44 = @"Unable to transfer file";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id *v34 = [v31 errorWithDomain:@"ProxyBridgeErrorDomain" code:3 userInfo:v32];
    }
    id v27 = 0;
  }

LABEL_28:
  return v27;
}

void __46__PCCBridgeEndpoint_send_file_metadata_error___block_invoke(void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v4;
      __int16 v17 = 2080;
      uint64_t v18 = strerror(a2);
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to transfer log file at %@, error: %s", buf, 0x16u);
    }
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", strerror(a2), v13);
    uint64_t v14 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:@"ProxyBridgeErrorDomain" code:2 userInfo:v7];

    id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
    [WeakRetained ack:a1[6] result:0 error:v8];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)(a1[5] + 8));
    [v10 ack:a1[6] result:1 error:0];

    id v11 = (void *)a1[5];
    uint64_t v12 = a1[7];
    [v11 exitInterruptedStateFrom:v12];
  }
}

+ (BOOL)isSupportedRemoteDeviceType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F3613630, 0);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v4 addObject:&unk_1F3613648];
  [v5 addObject:&unk_1F3613660];
  if (OSAIsDebugEnabledForRSD())
  {
    [v4 addObject:&unk_1F3613678];
    [v5 addObject:&unk_1F3613690];
  }
  if (OSAIsRSDHost())
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
    id v7 = v4;
  }
  else
  {
    if (!OSAIsRSDDevice())
    {
      char v8 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
    id v7 = v5;
  }
  char v8 = [v7 containsObject:v6];

LABEL_9:
  return v8;
}

+ (id)remoteDeviceForIdentifier:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Bridge"])
  {
    uint64_t v4 = (void *)remote_device_copy_unique_of_type();
  }
  else
  {
    v7[0] = 0;
    v7[1] = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
    [v5 getUUIDBytes:v7];
    uint64_t v4 = (void *)remote_device_copy_device_with_uuid();
  }
  return v4;
}

+ (id)identifierForRemoteDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uu = 0;
      id v5 = MEMORY[0x1E4F14500];
      uint64_t v6 = "Remote device was NULL";
      id v7 = uu;
LABEL_9:
      _os_log_impl(&dword_1DBFFE000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  if (remote_device_get_type() == 3)
  {
    uint64_t v4 = @"Bridge";
    goto LABEL_11;
  }
  *(void *)uu = 0;
  uint64_t v12 = 0;
  remote_device_copy_uuid();
  if (uuid_is_null(uu))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v5 = MEMORY[0x1E4F14500];
      uint64_t v6 = "Got a NULL UUID; remote device may not be connected.";
      id v7 = (unsigned __int8 *)&v10;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  uint64_t v4 = [v9 UUIDString];

LABEL_11:
  return v4;
}

+ (id)UDIDForRemoteDevice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)remote_device_copy_property();
    id v5 = v4;
    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        id v7 = [NSString stringWithUTF8String:string_ptr];
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        char v8 = MEMORY[0x1E4F14500];
        id v9 = "UDID string was not available in property";
        __int16 v10 = buf;
        goto LABEL_12;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      char v8 = MEMORY[0x1E4F14500];
      id v9 = "Failed to copy UDID property from remote device.";
      __int16 v10 = (uint8_t *)&v13;
LABEL_12:
      _os_log_impl(&dword_1DBFFE000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
    id v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to fetch UDID: remote device was NULL.", v12, 2u);
  }
  id v7 = 0;
LABEL_15:

  return v7;
}

- (id)identifierForTarget:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    goto LABEL_22;
  }
  if (OSAIsRSDHost())
  {
    id v7 = (void *)remote_device_copy_unique_of_type();
    if (!v7)
    {
      BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v26) {
        -[PCCBridgeEndpoint identifierForTarget:](v26, v27, v28, v29, v30, v31, v32, v33);
      }
      id v6 = 0;
      goto LABEL_18;
    }
    uint64_t v8 = +[PCCBridgeEndpoint identifierForRemoteDevice:v7];
LABEL_17:
    id v6 = (id)v8;
LABEL_18:

    goto LABEL_22;
  }
  if (OSAIsRSDDevice())
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_outgoingConnections count];
    if (v9 == 1)
    {
      id v7 = [(NSMutableDictionary *)self->_outgoingConnections allKeys];
      uint64_t v8 = [v7 firstObject];
      goto LABEL_17;
    }
    if (v9)
    {
      BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v34) {
        -[PCCBridgeEndpoint identifierForTarget:](v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v10) {
        -[PCCBridgeEndpoint identifierForTarget:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v18) {
      -[PCCBridgeEndpoint identifierForTarget:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  id v6 = 0;
LABEL_22:

  return v6;
}

- (void)setupOutgoingConnection:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PCCBridgeEndpoint identifierForRemoteDevice:v4];
  uint64_t v6 = +[PCCBridgeEndpoint UDIDForRemoteDevice:v4];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9) {
        -[PCCBridgeEndpoint setupOutgoingConnection:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else if (v9)
    {
      -[PCCBridgeEndpoint setupOutgoingConnection:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    uint64_t v17 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v5];

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v5;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Outgoing connection to %@ is already valid", buf, 0xCu);
      }
    }
    else
    {
      if (OSAIsRSDHost()) {
        BOOL v18 = "com.apple.osanalytics.logTransfer";
      }
      else {
        BOOL v18 = "com.apple.osanalytics.logRelay";
      }
      uint64_t v19 = (void *)remote_device_copy_service();
      if (v19)
      {
        uint64_t v20 = (void *)xpc_remote_connection_create_with_remote_service();
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v5;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Registering connection to remote device: %@", buf, 0xCu);
          }
          [(NSMutableDictionary *)self->_outgoingConnections setObject:v20 forKeyedSubscript:v5];
          [(NSMutableDictionary *)self->_remoteDevices setObject:v7 forKeyedSubscript:v5];
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          uint64_t v27 = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke;
          uint64_t v28 = &unk_1E6C29A78;
          uint64_t v31 = v18;
          uint64_t v29 = self;
          id v21 = v5;
          id v30 = v21;
          xpc_remote_connection_set_event_handler();
          xpc_remote_connection_activate();
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "remote connection active", buf, 2u);
          }
          eventQueue = self->_eventQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_96;
          block[3] = &unk_1E6C29A00;
          block[4] = self;
          id v24 = v21;
          dispatch_async(eventQueue, block);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[PCCBridgeEndpoint setupOutgoingConnection:]();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint setupOutgoingConnection:]();
      }
    }
  }
}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 != (id)MEMORY[0x1E4F14520])
  {
    if (v3 == (id)MEMORY[0x1E4F14528])
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v8 = *(void *)(a1 + 48);
      int v14 = 136315138;
      uint64_t v15 = v8;
      BOOL v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "Got XPC_ERROR_CONNECTION_INVALID from %s\n";
      uint32_t v11 = 12;
    }
    else
    {
      if (MEMORY[0x1E0197DA0](v3) != MEMORY[0x1E4F145A8])
      {
        id v5 = (char *)MEMORY[0x1E0197CE0](v4);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 48);
          int v14 = 136315394;
          uint64_t v15 = v6;
          __int16 v16 = 2080;
          uint64_t v17 = v5;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got unexpected xpc message from %s: %s\n", (uint8_t *)&v14, 0x16u);
        }
        if (v5) {
          free(v5);
        }
        goto LABEL_16;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
      int v14 = 136315394;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      uint64_t v17 = string;
      BOOL v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "Got xpc error message from %s: %s\n";
      uint32_t v11 = 22;
    }
    _os_log_impl(&dword_1DBFFE000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v11);
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v14 = 136315138;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got XPC_ERROR_CONNECTION_INTERRUPTED from %s\n", (uint8_t *)&v14, 0xCu);
  }
  [*(id *)(a1 + 32) enterInterruptedStateFrom:*(void *)(a1 + 40)];
LABEL_16:
}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_96(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained handleConnection:1 from:*(void *)(a1 + 40)];
}

- (id)connectionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  initializationQueue = self->_initializationQueue;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke;
  block[3] = &unk_1E6C29AA0;
  id v10 = v4;
  uint32_t v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(initializationQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "objectForKeyedSubscript:");

    if (!v2)
    {
      id v3 = +[PCCBridgeEndpoint remoteDeviceForIdentifier:*(void *)(a1 + 32)];
      if (v3) {
        [*(id *)(a1 + 40) setupOutgoingConnection:v3];
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 72) objectForKeyedSubscript:*(void *)(a1 + 32)];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v4) {
      __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

+ (void)addSenderToMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id v3 = (id) MGCopyAnswer();
  BOOL v4 = (const char *)[v3 UTF8String];

  xpc_dictionary_set_string(xdict, "kOSASender", v4);
}

- (void)stashCrashReporterKeyForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_remoteCRKeys objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v6 = +[PCCBridgeEndpoint remoteDeviceForIdentifier:v4];
    if (v6 && remote_device_get_type() == 3)
    {
      [(NSMutableDictionary *)self->_remoteCRKeys setObject:@"Bridge" forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v7 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v4];

      if (v7)
      {
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
        xpc_object_t empty = xpc_dictionary_create_empty();
        xpc_dictionary_set_string(empty, (const char *)[@"messageType" UTF8String], "kOSAFetchCrashReporterKey");
        +[PCCBridgeEndpoint addSenderToMessage:empty];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v4;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sending request to stash crash reporter key for %@", buf, 0xCu);
        }
        uint64_t v10 = [(NSMutableDictionary *)self->_outgoingConnections objectForKeyedSubscript:v4];
        id v13 = v4;
        uint64_t v11 = v8;
        xpc_remote_connection_send_message_with_reply();

        dispatch_time_t v12 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v11, v12) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:]();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:]();
      }
    }
  }
}

intptr_t __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1E0197DA0]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v3, "crashReporterKey");

    if (string)
    {
      uint64_t v6 = [NSString stringWithUTF8String:string];
      [*(id *)(*(void *)(a1 + 32) + 64) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E0197CE0](v3);

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2(a1);
      if (!v4) {
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      }
      goto LABEL_4;
    }
    if (v4) {
LABEL_4:
    }
      free(v4);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptedDevices, 0);
  objc_storeStrong((id *)&self->_listeningConnection, 0);
  objc_storeStrong((id *)&self->_outgoingConnections, 0);
  objc_storeStrong((id *)&self->_remoteCRKeys, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong((id *)&self->_initializationQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_device_browser, 0);
}

- (void)init
{
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_13_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = a1;
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s '%s'", (uint8_t *)&v1, 0x16u);
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_13_cold_2()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "received message '%@'", v0, 0xCu);
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_29_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = a1;
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unexpected metadata from RemoteXPC: '%@'\nOriginal xpc message %s", (uint8_t *)&v1, 0x16u);
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_29_cold_2(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = [a1 path];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "received file '%@'", v2, 0xCu);
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_49_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)synchronize:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, MEMORY[0x1E4F14500], v0, "Identifier not available for %@", v1, v2, v3, v4, v5);
}

- (void)identifierForTarget:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupOutgoingConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, MEMORY[0x1E4F14500], v0, "Failed to copy remote service %s of connected device", v1, v2, v3, v4, v5);
}

- (void)setupOutgoingConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, MEMORY[0x1E4F14500], v0, "Failed to connect to remote service %s", v1, v2, v3, v4, v5);
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stashCrashReporterKeyForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, MEMORY[0x1E4F14500], v0, "Failed to fetch CR key due to no outgoing connection for %@", v1, v2, v3, v4, v5);
}

- (void)stashCrashReporterKeyForIdentifier:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Timed out waiting for remote device CR key.", v0, 2u);
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  int v2 = 138412546;
  uint64_t v3 = v1;
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received unexpected reply message from %@: %s", (uint8_t *)&v2, 0x16u);
}

@end