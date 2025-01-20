@interface TITypologyLogTransferServer
+ (id)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSDevice)defaultPairedDevice;
- (IDSService)service;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serviceQueue;
- (OS_dispatch_source)timer;
- (TITypologyLogTransferServer)init;
- (id)typologyLogsFolder;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDefaultPairedDevice:(id)a3;
- (void)setListener:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)syncTypologyLogs;
@end

@implementation TITypologyLogTransferServer

+ (id)sharedServer
{
  if (qword_100026DF8 != -1) {
    dispatch_once(&qword_100026DF8, &stru_10001C860);
  }
  v2 = (void *)qword_100026DF0;
  return v2;
}

- (TITypologyLogTransferServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)TITypologyLogTransferServer;
  v2 = [(TITypologyLogTransferServer *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TextInput.TypologyLogTransferQueue", 0);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v3;

    v5 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.kbd.transfer"];
    service = v2->_service;
    v2->_service = v5;

    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_serviceQueue];
    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.TextInput.kbdTransfer"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener _setQueue:v2->_serviceQueue];
    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  int has_internal_ui = os_variant_has_internal_ui();
  if (has_internal_ui)
  {
    [v5 setExportedObject:self];
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TITypologyLogTransferServerProtocol];
    [v5 setExportedInterface:v7];

    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TITypologyLogTransferClientProtocol];
    [v5 setRemoteObjectInterface:v8];

    [v5 resume];
  }

  return has_internal_ui;
}

- (id)typologyLogsFolder
{
  v2 = NSHomeDirectory();
  v6[0] = v2;
  v6[1] = @"Library";
  v6[2] = @"Keyboard";
  v6[3] = @"Typology";
  dispatch_queue_t v3 = +[NSArray arrayWithObjects:v6 count:4];
  v4 = +[NSString pathWithComponents:v3];

  return v4;
}

- (void)syncTypologyLogs
{
  if (os_variant_has_internal_ui())
  {
    v45[0] = IDSSendMessageOptionForceLocalDeliveryKey;
    dispatch_queue_t v3 = +[NSNumber numberWithBool:1];
    v46[0] = v3;
    v45[1] = IDSSendMessageOptionBypassDuetKey;
    v4 = +[NSNumber numberWithBool:1];
    v46[1] = v4;
    v31 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

    id v5 = [(IDSService *)self->_service devices];
    id v6 = [v5 indexOfObjectPassingTest:&stru_10001C8A0];

    id v30 = v6;
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100010D54();
      }
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v7 = +[NSFileManager defaultManager];
      v8 = [(TITypologyLogTransferServer *)self typologyLogsFolder];
      v9 = [v7 subpathsAtPath:v8];

      id obj = v9;
      id v32 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v32)
      {
        id v10 = 0;
        id v11 = 0;
        uint64_t v28 = *(void *)v37;
        v29 = self;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            v13 = v11;
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            v15 = [(TITypologyLogTransferServer *)self typologyLogsFolder];
            v16 = [v15 stringByAppendingPathComponent:v14];
            v17 = +[NSURL fileURLWithPath:v16];

            service = self->_service;
            v19 = [(IDSService *)service devices];
            v20 = [v19 objectAtIndexedSubscript:v30];
            v21 = (void *)IDSCopyIDForDevice();
            v22 = +[NSSet setWithObject:v21];
            id v34 = v10;
            id v35 = v13;
            [(IDSService *)service sendResourceAtURL:v17 metadata:0 toDestinations:v22 priority:300 options:v31 identifier:&v35 error:&v34];
            id v11 = v35;

            id v23 = v34;
            if (!v11 || v23)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v26 = [v23 localizedDescription];
                *(_DWORD *)buf = 136315394;
                v41 = "-[TITypologyLogTransferServer syncTypologyLogs]";
                __int16 v42 = 2112;
                id v43 = v26;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s  typology log IDS service failed, with error %@", buf, 0x16u);
              }
              id v10 = v23;
              self = v29;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[TITypologyLogTransferServer syncTypologyLogs]";
                __int16 v42 = 2112;
                id v43 = v11;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Successfully started transfer of file with ID %@. Deleting original Typology log.", buf, 0x16u);
              }
              v24 = +[NSFileManager defaultManager];
              id v33 = 0;
              [v24 removeItemAtURL:v17 error:&v33];
              id v10 = v33;

              self = v29;
              if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v25 = [v10 localizedDescription];
                *(_DWORD *)buf = 136315394;
                v41 = "-[TITypologyLogTransferServer syncTypologyLogs]";
                __int16 v42 = 2112;
                id v43 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s  Could not delete log file. %@", buf, 0x16u);
              }
            }
          }
          id v32 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v32);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  if (os_variant_has_internal_ui())
  {
    id v11 = [v9 lastPathComponent];
    if (![v11 length]
      || ([v11 isEqualToString:@".."] & 1) != 0
      || [v11 isEqualToString:@"."])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100010DDC();
      }
    }
    else
    {
      v12 = [(TITypologyLogTransferServer *)self typologyLogsFolder];
      v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];

      uint64_t v14 = [v13 URLByAppendingPathComponent:v11];
      v15 = +[NSFileManager defaultManager];
      id v25 = 0;
      [v15 moveItemAtURL:v9 toURL:v14 error:&v25];
      id v16 = v25;

      id v17 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (v16)
        {
          v18 = [v16 localizedDescription];
        }
        else
        {
          v18 = @"NONE";
        }
        *(_DWORD *)buf = 136315650;
        v29 = "-[TITypologyLogTransferServer service:account:incomingResourceAtURL:fromID:context:]";
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Recieving file from ID %@ and putting in final location. error? %@", buf, 0x20u);
        if (v16) {
      }
        }
      v26[0] = FBSOpenApplicationOptionKeyPayloadURL;
      v19 = +[NSURL URLWithString:@"typology://filebug"];
      v27[0] = v19;
      v26[1] = FBSOpenApplicationOptionKeyUnlockDevice;
      v20 = +[NSNumber numberWithBool:1];
      v27[1] = v20;
      v26[2] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v21 = +[NSNumber numberWithBool:1];
      v27[2] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

      id v23 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      v24 = +[FBSOpenApplicationOptions optionsWithDictionary:v22];
      [v23 openApplication:@"com.apple.keyboard.TypoTracker" withOptions:v24 completion:0];
    }
  }
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (IDSDevice)defaultPairedDevice
{
  return self->_defaultPairedDevice;
}

- (void)setDefaultPairedDevice:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_defaultPairedDevice, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end