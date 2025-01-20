@interface CSRemoteXPCProxy
+ (BOOL)isDeviceWithUUIDAvailable:(id)a3;
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (id)getRemoteDeviceForUUIDStr:(id)a3;
+ (id)getService:(const char *)a3 forDevice:(id)a4;
+ (id)getUUIDStrForRemoteDevice:(id)a3;
+ (void)handleClientEvent:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5;
+ (void)handleRemoteConnection:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5;
+ (void)initRemoteServers;
+ (void)receiveFileFromRemote:(id)a3 forDiagnosticID:(id)a4 withCompletionBlock:(id)a5;
+ (void)remoteSendFile:(id)a3 toPeer:(id)a4 withTimeoutTarget:(unint64_t)a5;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3 forServiceName:(const char *)a4;
- (CSRemoteXPCProxy)init;
- (OS_dispatch_group)remoteGroup;
- (OS_remote_device)device;
- (OS_xpc_remote_connection)connection;
- (id)_initWithDevice:(id)a3 forDiagnosticID:(id)a4;
- (unint64_t)getTimeoutSec;
- (unint64_t)getTimeoutTarget;
- (void)cancelConnection;
- (void)handleRemoteResponse:(id)a3;
- (void)safeLeaveRemoteGroup;
- (void)setConnection:(id)a3;
- (void)setDevice:(id)a3;
- (void)setRemoteGroup:(id)a3;
- (void)transferFileToHost:(id)a3;
- (void)waitToReceiveCoSysdiagnose;
@end

@implementation CSRemoteXPCProxy

- (CSRemoteXPCProxy)init
{
}

- (id)_initWithDevice:(id)a3 forDiagnosticID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v24.receiver = self;
    v24.super_class = (Class)CSRemoteXPCProxy;
    v9 = [(CSProxy *)&v24 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_device, a3);
      connection = v10->_connection;
      v10->_connection = 0;

      remoteGroup = v10->_remoteGroup;
      v10->_remoteGroup = 0;

      [(CSProxy *)v10 setDiagnosticID:v8];
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = +[CSCoordinator sharedInstance];
    v15 = [v14 logSubsystem];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100063290(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[CSCoordinator sharedInstance];
  v6 = [v5 getRemoteUUIDsForDiagnosticID:v3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:](CSRemoteXPCProxy, "getRemoteDeviceForUUIDStr:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v12)
        {
          id v13 = [[CSRemoteXPCProxy alloc] _initWithDevice:v12 forDiagnosticID:v3];
          [v4 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  v14 = +[CSCoordinator sharedInstance];
  v15 = [v14 logSubsystem];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v4 count];
    *(_DWORD *)buf = 134217984;
    id v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: getProxies found total: %lu", buf, 0xCu);
  }

  id v17 = [v4 copy];

  return v17;
}

- (void)safeLeaveRemoteGroup
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(CSRemoteXPCProxy *)obj remoteGroup];

  if (v2)
  {
    id v3 = [(CSRemoteXPCProxy *)obj remoteGroup];
    dispatch_group_leave(v3);
  }
  [(CSRemoteXPCProxy *)obj setRemoteGroup:0];
  objc_sync_exit(obj);
}

+ (id)getRemoteDeviceForUUIDStr:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    memset(uu, 0, sizeof(uu));
    id v5 = v3;
    int v6 = uuid_parse((const char *)[v5 UTF8String], uu);
    if (v6)
    {
      int v7 = v6;
      id v8 = +[CSCoordinator sharedInstance];
      id v9 = [v8 logSubsystem];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = (const char *)v5;
        __int16 v17 = 2048;
        uint64_t v18 = (unsigned __int8 *)v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: uuid_parse failed to parse '%@' and returned %lu. Returning NULL for remote device", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v10 = 0;
LABEL_6:

      goto LABEL_11;
    }
    uint64_t v10 = (void *)remote_device_copy_device_with_uuid();
    if (!v10)
    {
      v14 = +[CSCoordinator sharedInstance];
      id v9 = [v14 logSubsystem];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = (const char *)v5;
        __int16 v17 = 2080;
        uint64_t v18 = uu;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: remote_device_copy_device_with_uuid failed for UUID '%@' (uuid_t '%s'). Returning NULL", (uint8_t *)&v15, 0x16u);
      }
      goto LABEL_6;
    }
  }
  else
  {
    v11 = +[CSCoordinator sharedInstance];
    v12 = [v11 logSubsystem];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "+[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: nil UUID str given to %s, returning NULL for remote device", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = 0;
  }
LABEL_11:

  return v10;
}

+ (id)getUUIDStrForRemoteDevice:(id)a3
{
  *(void *)uuid_t uu = 0;
  uint64_t v14 = 0;
  remote_device_copy_uuid();
  id v3 = (char *)malloc_type_calloc(0x25uLL, 1uLL, 0x100004077774924uLL);
  if (v3)
  {
    id v4 = v3;
    uuid_unparse(uu, v3);
    if (!strncmp(v4, "00000000-0000-0000-0000-000000000000", 0x25uLL))
    {
      id v8 = +[CSCoordinator sharedInstance];
      id v9 = [v8 logSubsystem];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to parse device uuid - not appending remote UUID", (uint8_t *)&v11, 2u);
      }

      id v5 = 0;
    }
    else
    {
      id v5 = +[NSString stringWithUTF8String:v4];
    }
    free(v4);
  }
  else
  {
    int v6 = +[CSCoordinator sharedInstance];
    int v7 = [v6 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "+[CSRemoteXPCProxy getUUIDStrForRemoteDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to allocate uuidStr in %s", (uint8_t *)&v11, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)isDeviceWithUUIDAvailable:(id)a3
{
  id v3 = +[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isHost
{
  if (+[CSDisplayProxy isHost]
    || +[CSCoreDeviceProxy isHost])
  {
    return 1;
  }

  return sub_100048CE4();
}

+ (id)description
{
  if (+[CSRemoteXPCProxy isHost]) {
    v2 = @"RemoteXPCProxyRemote";
  }
  else {
    v2 = @"RemoteXPCProxyHost";
  }

  return v2;
}

- (unint64_t)getTimeoutSec
{
  v2 = +[CSCoordinator sharedInstance];
  id v3 = [v2 logSubsystem];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 900;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 900;
}

- (unint64_t)getTimeoutTarget
{
  id v3 = +[SDTaskDepot sharedTaskDepot];
  unsigned int v4 = [v3 noTimeout];

  if (v4)
  {
    int v5 = +[CSCoordinator sharedInstance];
    uint64_t v6 = [v5 logSubsystem];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: timeout target requested. noTimeout is set - using DISPATCH_TIME_FOREVER", v9, 2u);
    }

    return dispatch_time(0, -1);
  }
  else
  {
    int64_t v8 = 1000000000 * [(CSRemoteXPCProxy *)self getTimeoutSec];
    return dispatch_time(0, v8);
  }
}

+ (void)handleClientEvent:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  id v7 = a3;
  int64_t v8 = (char *)a4;
  if (xpc_dictionary_get_BOOL(v8, "initiatedByRemoteHost") && !a5)
  {
    if (sub_100048C78())
    {
      id v9 = +[CSCoordinator sharedInstance];
      uint64_t v10 = [v9 logSubsystem];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on an Apple Display";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }
    }
    else
    {
      if (!sub_100024854())
      {
        if (qword_1000BD870 != -1) {
          dispatch_once(&qword_1000BD870, &stru_10009DB30);
        }
        if (dword_1000BD868)
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_1000BD868, @"stress-rack", 0, 0);
          if (CFProperty)
          {
            CFRelease(CFProperty);
            uint64_t v14 = +[CSCoordinator sharedInstance];
            uint64_t v10 = [v14 logSubsystem];

            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              int v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on a stress rack device";
              goto LABEL_24;
            }
            goto LABEL_25;
          }
        }
        else
        {
          int v15 = +[CSCoordinator sharedInstance];
          id v16 = [v15 logSubsystem];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v32 = "BOOL isStressRackDevice(void)";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: NVRAM is not supported on this system. Returning NO for %s", buf, 0xCu);
          }
        }
        if (!sub_100048CE4())
        {
          int v18 = sub_1000490F0();
          long long v19 = +[CSCoordinator sharedInstance];
          uint64_t v10 = [v19 logSubsystem];

          BOOL v20 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          if (!v18)
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Returning default value of NO for RSD invocation", buf, 2u);
            }

            v27 = +[CSCoordinator sharedInstance];
            v25 = [v27 logSubsystem];

            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_31;
            }
            *(_DWORD *)buf = 138412290;
            v32 = v8;
            v26 = "CSRemoteXPCProxy: Can't act as remote device. Rejecting request for message: %@";
            goto LABEL_30;
          }
          if (!v20) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          int v11 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module C";
          goto LABEL_24;
        }
        __int16 v17 = +[CSCoordinator sharedInstance];
        uint64_t v10 = [v17 logSubsystem];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v11 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module B";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v12 = +[CSCoordinator sharedInstance];
      uint64_t v10 = [v12 logSubsystem];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on a darwinOS iOS VM";
        goto LABEL_24;
      }
    }
LABEL_25:
  }
  long long v21 = +[CSCoordinator sharedInstance];
  unsigned __int8 v22 = [v21 tryStartRemoteInitiatedFlowForMsg:v8];

  if ((v22 & 1) == 0)
  {
    id v24 = +[CSCoordinator sharedInstance];
    v25 = [v24 logSubsystem];

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

      xpc_remote_connection_cancel();
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    v26 = "CSRemoteXPCProxy: Failed to start remote initiated flow. Cancelling connection for message: %@";
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
    goto LABEL_31;
  }
  v23 = dispatch_get_global_queue(0, 0);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002F8C0;
  v28[3] = &unk_10009D2B8;
  v29 = v8;
  id v30 = v7;
  dispatch_async(v23, v28);

LABEL_32:
}

+ (void)handleRemoteConnection:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v8, "MSG_TYPE");
  unsigned __int16 v10 = xpc_dictionary_get_uint64(v8, "RESPONSE_TYPE");
  if (!uint64)
  {
    int v11 = +[CSCoordinator sharedInstance];
    v12 = [v11 logSubsystem];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Unknown message type. Mismatched os versions.", buf, 2u);
    }

    if (v10 - 1 >= 2) {
      unsigned __int16 uint64 = 1;
    }
    else {
      unsigned __int16 uint64 = 2;
    }
  }
  int v13 = uint64;
  uint64_t v14 = +[CSCoordinator sharedInstance];
  int v15 = v14;
  if (v13 == 1)
  {
    id v16 = [v14 logSubsystem];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced msg type: Request, triggering local sysdiagnose", v24, 2u);
    }

    +[CSRemoteXPCProxy handleClientEvent:v7 forMsg:v8 isTrusted:v5];
  }
  else
  {
    unsigned int v17 = [v14 isHost];

    if (v13 == 2 && v17)
    {
      uint64_t v18 = v10;
      long long v19 = +[CSCoordinator sharedInstance];
      BOOL v20 = [v19 logSubsystem];

      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18 == 1)
      {
        if (v21)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced response type: success. Asking for file from remote", v23, 2u);
        }

        +[CSRemoteXPCProxy receiveFileFromRemote:v8 forDiagnosticID:0 withCompletionBlock:&stru_10009DA78];
      }
      else
      {
        if (v21)
        {
          *(_WORD *)unsigned __int8 v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced response type: failure", v22, 2u);
        }
      }
    }
  }
}

+ (void)initRemoteServers
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSRemoteXPCProxy", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener();
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
  unsigned int v4 = +[CSCoordinator sharedInstance];
  BOOL v5 = [v4 logSubsystem];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Remote server initialized.", v6, 2u);
  }
}

+ (void)receiveFileFromRemote:(id)a3 forDiagnosticID:(id)a4 withCompletionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  unsigned __int16 v10 = xpc_dictionary_get_value(v7, "FILE_TX");
  if (v10)
  {
    id v11 = v7;
    string = xpc_dictionary_get_string(v11, "FILE_NAME");
    if (!string)
    {
      v28 = +[CSCoordinator sharedInstance];
      v29 = [v28 logSubsystem];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100063374(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      v37 = 0;
      goto LABEL_27;
    }
    int v13 = +[NSString stringWithUTF8String:string];
    uint64_t v14 = [v13 lastPathComponent];

    if (!sub_1000306BC(v14))
    {
      int v15 = xpc_dictionary_get_string(v11, "udid");
      if (v15)
      {
        id v16 = v15;
        unsigned int v17 = (void *)remote_device_copy_device_with_name();
        id v59 = v8;
        if (!v17)
        {
          v40 = +[CSCoordinator sharedInstance];
          v41 = [v40 logSubsystem];

          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v67 = (char *)v16;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to fetch device for UDID '%s'. Not appending remote UUID", buf, 0xCu);
          }

          v29 = v14;
          goto LABEL_26;
        }
        uint64_t v18 = +[CSRemoteXPCProxy getUUIDStrForRemoteDevice:v17];
        v58 = (void *)v18;
        if (v18)
        {
          uint64_t v19 = v18;
          BOOL v20 = [v14 stringByDeletingPathExtension];
          BOOL v21 = [v20 stringByDeletingPathExtension];

          uint64_t v14 = [v21 stringByAppendingFormat:@"_%@.tar.gz", v19];

          unsigned __int8 v22 = +[CSCoordinator sharedInstance];
          v23 = [v22 logSubsystem];

          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = (char *)v14;
            id v24 = "CSRemoteXPCProxy: Found remote UUID. New tarball name: %@";
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
          }
        }
        else
        {
          v42 = +[CSCoordinator sharedInstance];
          v23 = [v42 logSubsystem];

          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v67 = (char *)v16;
            id v24 = "CSRemoteXPCProxy: Failed to fetch uuidStr for device with UDID '%s'. Not appending remote UUID";
            goto LABEL_24;
          }
        }

        v29 = v14;
LABEL_26:
        id v8 = v59;

        v37 = v29;
        goto LABEL_27;
      }
      v38 = +[CSCoordinator sharedInstance];
      v39 = [v38 logSubsystem];

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = (char *)v14;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: UDID not found in xpc dict for name: %@ - assuming legacy client and not appending remote UUID", buf, 0xCu);
      }
    }
    v29 = v14;
    v37 = v29;
LABEL_27:

    v43 = +[CSCoordinator sharedInstance];
    id v44 = [v43 waitForHostOutputDirForDiagnosticID:v8];

    if (v44)
    {
      if (!sub_1000306BC(v37))
      {
        id v60 = v8;
        v45 = +[NSFileManager defaultManager];
        v46 = [v44 stringByAppendingPathComponent:@"/co-sysdiagnoses/"];
        NSFileAttributeKey v64 = NSFilePosixPermissions;
        v65 = &off_1000B11C0;
        v47 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        id v63 = 0;
        unsigned int v48 = [v45 createDirectoryAtPath:v46 withIntermediateDirectories:1 attributes:v47 error:&v63];
        id v49 = v63;

        if (v48)
        {
          v50 = v44;
          id v44 = v46;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000632C8((uint64_t)v46, v49);
          }
          v53 = +[SDResourceManager sharedResourceManager];
          v54 = [v49 localizedDescription];
          [v53 stderrWrite:@"Unable to create co-sysdiagnose directory at: %@ with error: %@", v46, v54];

          v50 = +[SDResourceManager sharedResourceManager];
          v55 = [v49 localizedDescription];
          [v50 log:@"Unable to create co-sysdiagnose directory at: %@ with error: %@", v46, v55];
        }
        id v8 = v60;
      }
      id v56 = [v44 stringByAppendingPathComponent:v37];
      [v56 fileSystemRepresentation];
      v61 = v56;
      v62 = v9;
      id v57 = v56;
      xpc_file_transfer_write_to_path();
    }
    else
    {
      v51 = +[CSCoordinator sharedInstance];
      v52 = [v51 logSubsystem];

      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = (char *)v37;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to write remote archive %@ because host dir is not set", buf, 0xCu);
      }

      v9[2](v9);
    }

    goto LABEL_40;
  }
  v25 = xpc_copy_description(v7);
  v26 = +[CSCoordinator sharedInstance];
  v27 = [v26 logSubsystem];

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v67 = v25;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Did not receive any file transfer object. Got xpc response: %s", buf, 0xCu);
  }

  free(v25);
  v9[2](v9);
LABEL_40:
}

+ (void)remoteSendFile:(id)a3 toPeer:(id)a4 withTimeoutTarget:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[CSCoordinator sharedInstance];
  unsigned __int16 v10 = [v9 logSubsystem];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Transferring %@ to host", buf, 0xCu);
  }

  dispatch_group_t v11 = dispatch_group_create();
  id v12 = v7;
  int v13 = basename((char *)[v12 fileSystemRepresentation]);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v15, "MSG_TYPE", 2uLL);
    xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 1uLL);
    xpc_dictionary_set_string(v15, "FILE_NAME", v14);
    id v16 = sub_100024A9C();
    unsigned int v17 = v16;
    if (v16) {
      xpc_dictionary_set_string(v15, "udid", (const char *)[v16 UTF8String]);
    }
    [v12 fileSystemRepresentation];
    uint64_t v18 = v11;
    uint64_t v32 = v18;
    uint64_t v19 = (void *)xpc_file_transfer_create_with_path();
    if (v19)
    {
      dispatch_group_enter(v18);
      xpc_dictionary_set_value(v15, "FILE_TX", v19);
      xpc_remote_connection_send_message();
      if (!a5 || !dispatch_group_wait(v18, a5)) {
        goto LABEL_17;
      }
      BOOL v20 = +[CSCoordinator sharedInstance];
      BOOL v21 = [v20 logSubsystem];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v22 = "CSRemoteXPCProxy: Timed out waiting to send file to host";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      }
    }
    else
    {
      uint64_t v31 = +[CSCoordinator sharedInstance];
      BOOL v21 = [v31 logSubsystem];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v22 = "CSRemoteXPCProxy: Couldn't create transfer object. Skipping file transfer";
        goto LABEL_15;
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  v23 = +[CSCoordinator sharedInstance];
  int v15 = [v23 logSubsystem];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000633AC(v15, v24, v25, v26, v27, v28, v29, v30);
  }
LABEL_18:
}

+ (id)getService:(const char *)a3 forDevice:(id)a4
{
  id v5 = a4;
  uint64_t name = remote_device_get_name();
  if (remote_device_get_state() == 2)
  {
    id v7 = remote_device_copy_service();
    id v8 = +[CSCoordinator sharedInstance];
    id v9 = [v8 logSubsystem];

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        int v14 = 136315394;
        int v15 = a3;
        __int16 v16 = 2080;
        uint64_t v17 = name;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Found service '%s' on connected device '%s'. Device is usable", (uint8_t *)&v14, 0x16u);
      }

      id v7 = v7;
      dispatch_group_t v11 = v7;
    }
    else
    {
      if (v10)
      {
        int v14 = 136315394;
        int v15 = a3;
        __int16 v16 = 2080;
        uint64_t v17 = name;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Service '%s' not found for device %s", (uint8_t *)&v14, 0x16u);
      }

      dispatch_group_t v11 = 0;
    }
  }
  else
  {
    id v12 = +[CSCoordinator sharedInstance];
    id v7 = [v12 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      int v15 = (const char *)name;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Device %s not connected", (uint8_t *)&v14, 0xCu);
    }
    dispatch_group_t v11 = 0;
  }

  return v11;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3 forServiceName:(const char *)a4
{
  id v6 = a3;
  id v7 = [(CSRemoteXPCProxy *)self device];
  remote_device_get_type();

  uint64_t description = remote_device_type_get_description();
  id v9 = [(CSRemoteXPCProxy *)self device];
  BOOL v10 = +[CSRemoteXPCProxy getService:a4 forDevice:v9];

  if (!v10)
  {
    uint64_t v29 = +[CSCoordinator sharedInstance];
    uint64_t v30 = [v29 logSubsystem];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: device is not usable", buf, 2u);
    }

    goto LABEL_18;
  }
  dispatch_group_t v11 = dispatch_get_global_queue(25, 0);
  id v12 = (void *)xpc_remote_connection_create_with_remote_service();
  [(CSRemoteXPCProxy *)self setConnection:v12];

  int v13 = [(CSRemoteXPCProxy *)self connection];

  int v14 = +[CSCoordinator sharedInstance];
  int v15 = [v14 logSubsystem];

  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: failed to create remote xpc connection", buf, 2u);
    }

LABEL_18:
    BOOL v28 = 0;
    goto LABEL_19;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Triggering co-sysdiagnose", buf, 2u);
  }

  [(CSRemoteXPCProxy *)self safeLeaveRemoteGroup];
  dispatch_group_t v17 = dispatch_group_create();
  [(CSRemoteXPCProxy *)self setRemoteGroup:v17];

  uint64_t v18 = [(CSRemoteXPCProxy *)self remoteGroup];
  dispatch_group_enter(v18);

  uint64_t v19 = [(CSRemoteXPCProxy *)self connection];
  xpc_remote_connection_set_event_handler();

  BOOL v20 = [(CSRemoteXPCProxy *)self connection];
  xpc_remote_connection_activate();

  BOOL v21 = +[CSCoordinator sharedInstance];
  LODWORD(v19) = [v21 isHost];

  if (v19)
  {
    unsigned __int8 v22 = +[CSCoordinator sharedInstance];
    v23 = [v22 logSubsystem];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Forcing remote to not act as host", buf, 2u);
    }

    xpc_dictionary_set_BOOL(v6, "initiatedByRemoteHost", 1);
  }
  xpc_dictionary_set_uint64(v6, "MSG_TYPE", 1uLL);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 1uLL);
  uint64_t v24 = xpc_copy_description(v6);
  uint64_t v25 = +[CSCoordinator sharedInstance];
  uint64_t v26 = [v25 logSubsystem];

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Forwarding to remote device: %s", buf, 0xCu);
  }

  free(v24);
  uint64_t v27 = [(CSRemoteXPCProxy *)self connection];
  xpc_remote_connection_send_message();

  BOOL v28 = 1;
LABEL_19:

  return v28;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return [(CSRemoteXPCProxy *)self triggerCoSysdiagnoseWithParams:a3 forServiceName:"com.apple.sysdiagnose.remote"];
}

- (void)cancelConnection
{
  id v3 = [(CSRemoteXPCProxy *)self connection];

  if (v3)
  {
    unsigned int v4 = [(CSRemoteXPCProxy *)self connection];
    xpc_remote_connection_cancel();
  }

  [(CSRemoteXPCProxy *)self setConnection:0];
}

- (void)handleRemoteResponse:(id)a3
{
  id v4 = a3;
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v4, "REQUEST_TYPE");
  unsigned __int16 v6 = xpc_dictionary_get_uint64(v4, "RESPONSE_TYPE");
  id v7 = +[CSCoordinator sharedInstance];
  id v8 = [v7 logSubsystem];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_100024D80(v6);
    BOOL v10 = sub_100024D58(uint64);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    BOOL v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Received response: %@ from remote for request: %@", buf, 0x16u);
  }
  if (v6 == 2)
  {
    uint64_t v12 = xpc_dictionary_get_uint64(v4, "FAILURE_REASON");
    int v13 = +[CSCoordinator sharedInstance];
    int v14 = [v13 logSubsystem];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = sub_100023FB0(v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed response from remote, error: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (v6 != 1)
  {
    BOOL v16 = +[CSCoordinator sharedInstance];
    int v14 = [v16 logSubsystem];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Unknown response type received: %d", buf, 8u);
    }
LABEL_10:

    [(CSRemoteXPCProxy *)self safeLeaveRemoteGroup];
    goto LABEL_11;
  }
  dispatch_group_t v11 = [(CSProxy *)self diagnosticID];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000317B0;
  v17[3] = &unk_10009CFE0;
  v17[4] = self;
  +[CSRemoteXPCProxy receiveFileFromRemote:v4 forDiagnosticID:v11 withCompletionBlock:v17];

LABEL_11:
}

- (void)waitToReceiveCoSysdiagnose
{
  id v3 = [(CSRemoteXPCProxy *)self remoteGroup];

  if (v3)
  {
    id v4 = [(CSRemoteXPCProxy *)self connection];

    if (v4)
    {
      id v5 = [(CSRemoteXPCProxy *)self remoteGroup];
      intptr_t v6 = dispatch_group_wait(v5, [(CSRemoteXPCProxy *)self getTimeoutTarget]);

      if (!v6) {
        return;
      }
      id v7 = +[CSCoordinator sharedInstance];
      id v8 = [v7 logSubsystem];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v9 = "CSRemoteXPCProxy: Timed out waiting for remote co-sysdiagnose";
        BOOL v10 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      uint64_t v12 = +[CSCoordinator sharedInstance];
      id v8 = [v12 logSubsystem];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v9 = "CSRemoteXPCProxy: self.connection is nil - connection has been cancelled. Skipping waiting";
        BOOL v10 = buf;
        goto LABEL_10;
      }
    }
  }
  else
  {
    dispatch_group_t v11 = +[CSCoordinator sharedInstance];
    id v8 = [v11 logSubsystem];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v9 = "CSRemoteXPCProxy: Remote sysdiagnose wasn't triggered or is done transferring. Skipping waiting";
      BOOL v10 = (uint8_t *)&v15;
      goto LABEL_10;
    }
  }
}

- (void)transferFileToHost:(id)a3
{
  id v4 = a3;
  id v5 = [(CSRemoteXPCProxy *)self connection];

  if (v5)
  {
    intptr_t v6 = [(CSRemoteXPCProxy *)self connection];
    +[CSRemoteXPCProxy remoteSendFile:v4 toPeer:v6 withTimeoutTarget:[(CSRemoteXPCProxy *)self getTimeoutTarget]];
  }
  else
  {
    id v7 = +[CSCoordinator sharedInstance];
    id v8 = [v7 logSubsystem];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Didn't create connection to host - stopping file transfer", v9, 2u);
    }
  }
}

- (OS_dispatch_group)remoteGroup
{
  return self->_remoteGroup;
}

- (void)setRemoteGroup:(id)a3
{
}

- (OS_remote_device)device
{
  return (OS_remote_device *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (OS_xpc_remote_connection)connection
{
  return (OS_xpc_remote_connection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_remoteGroup, 0);
}

@end