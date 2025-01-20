@interface SystemDiagnosticIDS
+ (id)getIDSCaseString:(int)a3;
+ (id)getIDSCommandString:(int)a3;
+ (id)sharedInstance;
+ (void)setTestingMode:(BOOL)a3;
- (BOOL)isPaired;
- (BOOL)sendFileAtPath:(id)a3 forDiagnosticID:(id)a4 withCase:(int)a5;
- (BOOL)sendFilenamePair:(id)a3;
- (BOOL)sendMessage:(int)a3;
- (BOOL)sendMessage:(int)a3 WithData:(id)a4;
- (BOOL)sendMessage:(int)a3 WithString:(id)a4;
- (BOOL)sendRemoteArchiveMessage:(id)a3;
- (BOOL)sendTransferSize:(unint64_t)a3;
- (BOOL)startCoSysdiagnoseForFilename:(id)a3;
- (IDSService)service;
- (NSMutableDictionary)executionGroupDictionary;
- (NSMutableDictionary)localGroupDictionary;
- (NSMutableDictionary)localTupleDictionary;
- (NSString)transferIdentifier;
- (OS_dispatch_queue)run_queue;
- (SystemDiagnosticIDS)init;
- (id)getDispatchGroupForDiagnostic:(id)a3;
- (id)stringFromProtobuf:(id)a3;
- (unint64_t)transfer_size;
- (void)SDList_Complete:(id)a3;
- (void)SDRemote_Complete:(id)a3;
- (void)SDStart:(id)a3;
- (void)SDStop;
- (void)SDTransfer_Size:(id)a3;
- (void)sendWatchListWithDiagnosticId:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setExecutionGroupDictionary:(id)a3;
- (void)setLocalGroupDictionary:(id)a3;
- (void)setLocalTupleDictionary:(id)a3;
- (void)setPreferredWifi:(BOOL)a3;
- (void)setRun_queue:(id)a3;
- (void)setService:(id)a3;
- (void)setTransferIdentifier:(id)a3;
- (void)setTransfer_size:(unint64_t)a3;
@end

@implementation SystemDiagnosticIDS

+ (void)setTestingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting IDS testing mode to %d", (uint8_t *)v4, 8u);
  }
  byte_1000BD950 = v3;
}

+ (id)sharedInstance
{
  if (byte_1000BD950)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS testing mode enabled, return nil for object", v4, 2u);
    }
    id v2 = 0;
  }
  else
  {
    if (qword_1000BD960 != -1) {
      dispatch_once(&qword_1000BD960, &stru_10009E198);
    }
    id v2 = (id)qword_1000BD958;
  }

  return v2;
}

+ (id)getIDSCaseString:(int)a3
{
  if (a3 > 5) {
    return @"Invalid SD_IDSCase";
  }
  else {
    return (id)*((void *)&off_10009E1F8 + a3);
  }
}

+ (id)getIDSCommandString:(int)a3
{
  if (a3 > 9) {
    return @"Invalid IDSCommand";
  }
  else {
    return (id)*((void *)&off_10009E228 + a3);
  }
}

- (SystemDiagnosticIDS)init
{
  if (objc_opt_class())
  {
    v23.receiver = self;
    v23.super_class = (Class)SystemDiagnosticIDS;
    BOOL v3 = [(SystemDiagnosticIDS *)&v23 init];
    if (v3)
    {
      v4 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sysdiagnose"];
      service = v3->_service;
      v3->_service = v4;

      if (!v3->_service) {
        sub_100066000();
      }
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.sysdiagnose.idsqueue", 0);
      run_queue = v3->_run_queue;
      v3->_run_queue = (OS_dispatch_queue *)v6;

      v8 = v3->_run_queue;
      v9 = dispatch_get_global_queue(2, 0);
      dispatch_set_target_queue(v8, v9);

      uint64_t v10 = +[NSMutableDictionary dictionary];
      localGroupDictionary = v3->_localGroupDictionary;
      v3->_localGroupDictionary = (NSMutableDictionary *)v10;

      uint64_t v12 = +[NSMutableDictionary dictionary];
      localTupleDictionary = v3->_localTupleDictionary;
      v3->_localTupleDictionary = (NSMutableDictionary *)v12;

      uint64_t v14 = +[NSMutableDictionary dictionary];
      executionGroupDictionary = v3->_executionGroupDictionary;
      v3->_executionGroupDictionary = (NSMutableDictionary *)v14;

      v16 = v3->_run_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005E138;
      block[3] = &unk_10009CFE0;
      v22 = v3;
      dispatch_async(v16, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS service initialized.", v20, 2u);
      }
      v17 = +[SDResourceManager sharedResourceManager];
      [v17 log:@"IDS service initialized."];
    }
    self = v3;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isPaired
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(IDSService *)self->_service devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        dispatch_queue_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          if ([v6 isActive]) {
            LOBYTE(v3) = [v6 isConnected];
          }
          else {
            LOBYTE(v3) = 0;
          }
          goto LABEL_13;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (id)getDispatchGroupForDiagnostic:(id)a3
{
  localGroupDictionary = self->_localGroupDictionary;
  if (localGroupDictionary)
  {
    localGroupDictionary = [localGroupDictionary objectForKey:a3];
  }

  return localGroupDictionary;
}

- (void)setPreferredWifi:(BOOL)a3
{
}

- (BOOL)sendFileAtPath:(id)a3 forDiagnosticID:(id)a4 withCase:(int)a5
{
  return 0;
}

- (BOOL)sendMessage:(int)a3 WithString:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v4 = *(void *)&a3;
  dispatch_queue_t v6 = [a4 dataUsingEncoding:4];
  LOBYTE(v4) = [(SystemDiagnosticIDS *)self sendMessage:v4 WithData:v6];

  return v4;
}

- (BOOL)sendMessage:(int)a3 WithData:(id)a4
{
  BOOL v4 = 0;
  if (a3 && self->_service)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v22 = IDSSendMessageOptionTimeoutKey;
    objc_super v23 = &off_1000B13A0;
    id v7 = a4;
    long long v8 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v9 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v7 type:(unsigned __int16)v6 isResponse:0];

    service = self->_service;
    long long v11 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v18 = 0;
    id v19 = 0;
    [(IDSService *)service sendProtobuf:v9 toDestinations:v11 priority:300 options:v8 identifier:&v19 error:&v18];
    id v12 = v19;
    id v13 = v18;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = +[SystemDiagnosticIDS getIDSCommandString:v6];
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS sendMessage: %@", buf, 0xCu);
    }
    v15 = +[SDResourceManager sharedResourceManager];
    v16 = +[SystemDiagnosticIDS getIDSCommandString:v6];
    [v15 log:@"IDS sendMessage: %@", v16];

    BOOL v4 = [v12 length] != 0;
  }
  return v4;
}

- (BOOL)sendFilenamePair:(id)a3
{
  BOOL v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  LOBYTE(self) = [(SystemDiagnosticIDS *)self sendMessage:5 WithData:v4];

  return (char)self;
}

- (id)stringFromProtobuf:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = [v3 data];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 data];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_alloc((Class)NSString);
    id v9 = [v4 data];
    id v5 = [v8 initWithData:v9 encoding:4];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)SDStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EA1C;
  block[3] = &unk_10009D788;
  id v10 = v5;
  long long v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)SDStop
{
  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 clearAllResources];

  +[SDTaskDepot signalStopTasks];
}

- (void)SDTransfer_Size:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 data];

    if (v6)
    {
      uint64_t v9 = 0;
      id v7 = [v5 data];
      [v7 getBytes:&v9 length:8];

      [(SystemDiagnosticIDS *)self setTransfer_size:v9];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfersize %zu", buf, 0xCu);
      }
      id v8 = +[SDResourceManager sharedResourceManager];
      [v8 log:@"Transfersize %zu", v9];
    }
  }
}

- (void)SDRemote_Complete:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 data];

    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
      id v12 = [v5 data];
      id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v12 error:0];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (id v14 = v13) != 0)
      {
        v15 = v14;
        v16 = [v14 allKeys];
        v17 = [v16 firstObject];

        uint64_t v18 = [v15 objectForKey:v17];
        if (!v18
          || (id v19 = (void *)v18,
              [v15 objectForKey:v17],
              v20 = objc_claimAutoreleasedReturnValue(),
              unsigned int v21 = [v20 isEqual:&__kCFBooleanFalse],
              v20,
              v19,
              v21))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer of remote archive failed", buf, 2u);
          }
          uint64_t v22 = [(SystemDiagnosticIDS *)self executionGroupDictionary];
          objc_super v23 = [v22 objectForKey:v17];
          dispatch_group_leave(v23);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No dictionary from the protobuff.", v25, 2u);
        }
        v15 = 0;
      }
    }
  }
}

- (void)sendWatchListWithDiagnosticId:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  [(SystemDiagnosticIDS *)self sendMessage:6 WithData:v4];
}

- (void)SDList_Complete:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 data], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    id v12 = [v5 data];
    id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v12 error:0];

    objc_opt_class();
    id v14 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v15 = v13;
      id v14 = v15;
      if (v15)
      {
        if ([v15 count])
        {
          v16 = [v14 firstObject];
          v17 = [(SystemDiagnosticIDS *)self executionGroupDictionary];
          uint64_t v18 = [v17 objectForKey:v16];

          if ((unint64_t)[v14 count] < 2)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No archives on the watch", buf, 2u);
            }
          }
          else
          {
            id v19 = [v14 subarrayWithRange:1, (char *)[v14 count] - 1];
            v20 = [(SystemDiagnosticIDS *)self executionGroupDictionary];
            [v20 setObject:v19 forKey:v16];

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = v19;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received watch archive list: %@", buf, 0xCu);
            }
          }
          if (v18) {
            dispatch_group_leave(v18);
          }
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not received any data from the watch", buf, 2u);
  }
}

- (BOOL)sendMessage:(int)a3
{
  return [(SystemDiagnosticIDS *)self sendMessage:*(void *)&a3 WithData:0];
}

- (BOOL)sendTransferSize:(unint64_t)a3
{
  return 0;
}

- (BOOL)sendRemoteArchiveMessage:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  LOBYTE(self) = [(SystemDiagnosticIDS *)self sendMessage:8 WithData:v4];

  return (char)self;
}

- (BOOL)startCoSysdiagnoseForFilename:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  LOBYTE(self) = [(SystemDiagnosticIDS *)self sendMessage:1 WithData:v4];

  return (char)self;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v154 = a7;
  id v17 = a8;
  uint64_t v18 = +[SDCacheEnumerator sysdiagnoseDirectory];
  v158 = [v15 path];
  v157 = +[NSFileManager defaultManager];
  id v19 = [v16 objectForKey:@"SDREMOTE"];
  v155 = v16;
  v156 = v18;
  v153 = v17;
  if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28 = [v16 objectForKey:@"SDCASE"];

    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v29 = [v16 objectForKey:@"SDCASE"];
      id v30 = [v29 unsignedIntValue];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v31 = +[SystemDiagnosticIDS getIDSCaseString:v30];
        *(_DWORD *)buf = 138412290;
        id v179 = v31;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Target case %@", buf, 0xCu);
      }
      v32 = +[SDResourceManager sharedResourceManager];
      unsigned int v150 = v30;
      v33 = +[SystemDiagnosticIDS getIDSCaseString:v30];
      [v32 log:@"Target case %@", v33];

      v28 = 0;
      id v16 = v155;
    }
    else
    {
      unsigned int v150 = 2;
    }
    v34 = [v16 objectForKey:@"SDLOCATION"];

    id v149 = v15;
    if (v34)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v34;
        uint64_t v36 = v150;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v179 = v35;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Target location %@", buf, 0xCu);
        }
        +[SDResourceManager sharedResourceManager];
        v38 = id v37 = v35;
        [v38 log:@"Target location %@", v37];

        v39 = v37;
        v152 = 0;
        v40 = v37;
        goto LABEL_80;
      }
    }
    v152 = v34;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive arrived without local target.", buf, 2u);
    }
    v41 = +[SDResourceManager sharedResourceManager];
    [v41 log:@"Archive arrived without local target."];

    if (!v13
      || ([v13 devices],
          v42 = objc_claimAutoreleasedReturnValue(),
          id v43 = [v42 count],
          v42,
          !v43))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting to watch-only", buf, 2u);
      }
      v39 = +[SDResourceManager sharedResourceManager];
      [v39 log:@"Setting to watch-only"];
      v40 = 0;
      uint64_t v36 = 2;
LABEL_80:

      v91 = [v158 lastPathComponent];
      v92 = [v91 lastPathComponent];
      if ([v92 rangeOfString:@".tar.gz"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v91 lastPathComponent];
        v93 = v40;
        id v94 = v15;
        id v95 = v14;
        id v96 = v13;
        v98 = uint64_t v97 = v36;
        id v99 = [v98 rangeOfString:@".log."];

        uint64_t v36 = v97;
        id v13 = v96;
        id v14 = v95;
        id v15 = v94;
        v40 = v93;

        BOOL v100 = v99 == (id)0x7FFFFFFFFFFFFFFFLL;
        uint64_t v18 = v156;
        if (v100)
        {
LABEL_86:
          v65 = v157;
          unsigned int v21 = [v91 stringByDeletingPathExtension];

          v160 = v40;
          if (v36 != 2)
          {
            if (v36 == 5 || v36 == 3)
            {
              id v148 = v14;
              v102 = [@"co-" stringByAppendingString:v40];
              v103 = [v18 stringByAppendingPathComponent:v102];

              v104 = [v103 stringByAppendingPathExtension:@"tar"];
              if ([v157 fileExistsAtPath:v103])
              {
                id v105 = 0;
              }
              else
              {
                NSFileAttributeKey v186 = NSFilePosixPermissions;
                v187 = &off_1000B13B8;
                v109 = +[NSDictionary dictionaryWithObjects:&v187 forKeys:&v186 count:1];
                id v165 = 0;
                unsigned __int8 v110 = [v157 createDirectoryAtPath:v103 withIntermediateDirectories:1 attributes:v109 error:&v165];
                id v105 = v165;

                if ((v110 & 1) == 0) {
                  sub_100066074((uint64_t)v103, v105);
                }
              }
              v111 = [v158 lastPathComponent];
              v112 = [v103 stringByAppendingPathComponent:v111];

              v113 = [v158 lastPathComponent];
              id v114 = [v113 rangeOfString:@".log."];

              if (v114 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v115 = [v112 stringByDeletingPathExtension];

                v112 = (void *)v115;
              }
              uint64_t v116 = +[SystemDiagnosticIDS sharedInstance];
              v117 = [(id)v116 getDispatchGroupForDiagnostic:v40];

              id v164 = v105;
              LOBYTE(v116) = [v157 moveItemAtPath:v158 toPath:v112 error:&v164];
              id v118 = v164;

              BOOL v119 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              if (v116)
              {
                if (v119)
                {
                  *(_DWORD *)buf = 138412290;
                  id v179 = v112;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully dropped %@", buf, 0xCu);
                }
                v120 = +[SDResourceManager sharedResourceManager];
                [v120 log:@"Successfully dropped %@", v112];
              }
              else
              {
                if (v119)
                {
                  v129 = [v118 localizedDescription];
                  *(_DWORD *)buf = 138412802;
                  id v179 = v158;
                  __int16 v180 = 2112;
                  v181 = v112;
                  __int16 v182 = 2112;
                  v183 = v129;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move watch directory from %@ to %@ with error %@", buf, 0x20u);
                }
                v120 = +[SDResourceManager sharedResourceManager];
                v130 = [v118 localizedDescription];
                [v120 log:@"Could not move watch directory from %@ to %@ with error %@", v158, v112, v130];
              }
              id v14 = v148;

              if (v117)
              {
                dispatch_group_leave(v117);
              }
              else
              {
                id v144 = v13;
                v131 = [v40 stringByAppendingPathExtension:@"tar.gz"];
                v132 = [v156 stringByAppendingPathComponent:v131];

                v133 = [v132 lastPathComponent];
                v134 = [v103 stringByAppendingPathComponent:v133];

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  id v179 = v132;
                  __int16 v180 = 2112;
                  v181 = v134;
                  __int16 v182 = 2112;
                  v183 = v104;
                  __int16 v184 = 2112;
                  v185 = v103;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Local tarball: %@, newpath: %@, co-sysdiagnose tarball: %@, co-sysdiagnose path: %@", buf, 0x2Au);
                }
                v135 = +[SDResourceManager sharedResourceManager];
                [v135 log:@"Local tarball: %@, newpath: %@, co-sysdiagnose tarball: %@, co-sysdiagnose path: %@", v132, v134, v104, v103];

                id v163 = v118;
                unsigned int v136 = [v157 moveItemAtPath:v132 toPath:v134 error:&v163];
                id v137 = v163;

                if (v136) {
                  sub_1000270A8(v103, v104, 0x10u, 0);
                }

                id v118 = v137;
                id v13 = v144;
                id v14 = v148;
              }
              goto LABEL_124;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v106 = +[SystemDiagnosticIDS getIDSCaseString:v36];
              *(_DWORD *)buf = 138412290;
              id v179 = v106;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote sysdiagnose was in %@ unexpectedly", buf, 0xCu);
            }
            v107 = +[SDResourceManager sharedResourceManager];
            v108 = +[SystemDiagnosticIDS getIDSCaseString:v36];
            [v107 log:@"Remote sysdiagnose was in %@ unexpectedly", v108];

            v65 = v157;
          }
          v104 = [v158 lastPathComponent];
          v103 = [v18 stringByAppendingPathComponent:v104];
          if ([v65 fileExistsAtPath:v18])
          {
            id v26 = 0;
          }
          else
          {
            NSFileAttributeKey v176 = NSFilePosixPermissions;
            v177 = &off_1000B13B8;
            uint64_t v121 = +[NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];
            v122 = v65;
            v123 = (void *)v121;
            id v162 = 0;
            unsigned __int8 v124 = [v122 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:v121 error:&v162];
            id v26 = v162;

            if ((v124 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v125 = [v26 localizedDescription];
                *(_DWORD *)buf = 138412290;
                id v179 = v125;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose directory did not exist and could not be created with error: %@", buf, 0xCu);
              }
              v126 = +[SDResourceManager sharedResourceManager];
              v127 = [v26 localizedDescription];
              [v126 log:@"Sysdiagnose directory did not exist and could not be created with error: %@", v127];
            }
            uint64_t v18 = v156;
            v65 = v157;
          }
          if (![v65 fileExistsAtPath:v158 isDirectory:0]) {
            goto LABEL_126;
          }
          id v161 = v26;
          unsigned __int8 v128 = [v65 moveItemAtPath:v158 toPath:v103 error:&v161];
          id v118 = v161;

          if (v128)
          {
            id v26 = v118;
            id v15 = v149;
LABEL_125:
            v65 = v157;
LABEL_126:

            [(SystemDiagnosticIDS *)self setPreferredWifi:0];
            v62 = [v21 dataUsingEncoding:4];
            [(SystemDiagnosticIDS *)self sendMessage:3 WithData:v62];
            v64 = v160;
            goto LABEL_127;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v138 = [v103 lastPathComponent];
            v139 = [v118 localizedDescription];
            *(_DWORD *)buf = 138412546;
            id v179 = v138;
            __int16 v180 = 2112;
            v181 = v139;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move watch directory %@ with error %@", buf, 0x16u);
          }
          v112 = +[SDResourceManager sharedResourceManager];
          v117 = [v103 lastPathComponent];
          v140 = [v118 localizedDescription];
          [v112 log:@"Could not move watch directory %@ with error %@", v117, v140];

LABEL_124:
          id v26 = v118;
          id v15 = v149;
          uint64_t v18 = v156;
          goto LABEL_125;
        }
      }
      else
      {
      }
      uint64_t v101 = [v91 stringByDeletingPathExtension];

      v91 = (void *)v101;
      goto LABEL_86;
    }
    v44 = [v13 devices];
    v45 = [v44 objectAtIndexedSubscript:0];

    v145 = [v45 productBuildVersion];
    v141 = v45;
    if (v150 != 5 && v150 != 3 || [v145 rangeOfString:@"14S"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive arrived without target diagnosticID when one was expected. Setting to watch-only.", buf, 2u);
      }
      v46 = +[SDResourceManager sharedResourceManager];
      [v46 log:@"Archive arrived without target diagnosticID when one was expected. Setting to watch-only."];

      v47 = +[NSURL fileURLWithPath:v18 isDirectory:1];
      v48 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, 0);
      v49 = [v157 enumeratorAtURL:v47 includingPropertiesForKeys:v48 options:7 errorHandler:&stru_10009E1D8];

      long long v168 = 0u;
      long long v169 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      id v50 = v49;
      id v51 = [v50 countByEnumeratingWithState:&v166 objects:v188 count:16];
      if (v51)
      {
        id v52 = v51;
        uint64_t v53 = *(void *)v167;
        do
        {
          for (i = 0; i != v52; i = (char *)i + 1)
          {
            if (*(void *)v167 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*((void *)&v166 + 1) + 8 * i);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v56 = [v55 lastPathComponent];
              *(_DWORD *)buf = 138412290;
              id v179 = v56;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Candidate: %@", buf, 0xCu);
            }
            v57 = +[SDResourceManager sharedResourceManager];
            v58 = [v55 lastPathComponent];
            [v57 log:@"Candidate: %@", v58];
          }
          id v52 = [v50 countByEnumeratingWithState:&v166 objects:v188 count:16];
        }
        while (v52);
      }

      v40 = 0;
      uint64_t v36 = 2;
LABEL_79:
      uint64_t v18 = v156;

      v39 = v141;
      goto LABEL_80;
    }
    v66 = +[SystemDiagnosticIDS sharedInstance];
    v67 = [v66 localGroupDictionary];
    id v68 = [v67 count];

    BOOL v69 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v68)
    {
      if (v69)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using exisiting dgroup", buf, 2u);
      }
      v70 = +[SDResourceManager sharedResourceManager];
      [v70 log:@"Using exisiting dgroup"];

      v71 = +[SystemDiagnosticIDS sharedInstance];
      v72 = [v71 localGroupDictionary];
      v73 = [v72 allKeys];
      v40 = [v73 objectAtIndexedSubscript:0];
      goto LABEL_75;
    }
    id v147 = v14;
    id v143 = v13;
    if (v69)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using best-guess based existing files.", buf, 2u);
    }
    v74 = +[SDResourceManager sharedResourceManager];
    [v74 log:@"Using best-guess based existing files."];

    v142 = +[NSMutableArray array];
    v75 = +[NSURL fileURLWithPath:v18 isDirectory:1];
    v76 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, 0);
    v77 = [v157 enumeratorAtURL:v75 includingPropertiesForKeys:v76 options:7 errorHandler:&stru_10009E1B8];

    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    id v78 = v77;
    id v79 = [v78 countByEnumeratingWithState:&v170 objects:v189 count:16];
    id v146 = v78;
    if (!v79)
    {
LABEL_73:

      v71 = v142;
      if (![v142 count])
      {
        id v13 = v143;
        id v14 = v147;
        id v15 = v149;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Best guess approach failed, defaulting to watch-only.", buf, 2u);
        }
        v73 = +[SDResourceManager sharedResourceManager];
        [v73 log:@"Best guess approach failed, defaulting to watch-only."];
        v40 = 0;
        uint64_t v36 = 2;
        v72 = v146;
        goto LABEL_76;
      }
      [v142 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
      v73 = v72 = v78;
      v40 = [v73 objectAtIndexedSubscript:0];
      id v13 = v143;
      id v14 = v147;
      id v15 = v149;
LABEL_75:
      uint64_t v36 = v150;
LABEL_76:

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v179 = v145;
        __int16 v180 = 2112;
        v181 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer from legacy device with build %@ detected. Setting to group %@", buf, 0x16u);
      }
      id v50 = +[SDResourceManager sharedResourceManager];
      [v50 log:@"Transfer from legacy device with build %@ detected. Setting to group %@", v145, v40];
      goto LABEL_79;
    }
    id v80 = v79;
    CFStringRef v81 = @"sysdiagnose";
    uint64_t v82 = *(void *)v171;
LABEL_58:
    uint64_t v83 = 0;
    while (1)
    {
      if (*(void *)v171 != v82) {
        objc_enumerationMutation(v78);
      }
      v84 = *(void **)(*((void *)&v170 + 1) + 8 * v83);
      v85 = [v84 absoluteString];
      if ([v85 rangeOfString:v81] == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_70;
      }
      v86 = [v84 absoluteString];
      if ([v86 rangeOfString:@"watch"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {

        goto LABEL_70;
      }
      CFStringRef v87 = v81;
      v88 = [v84 absoluteString];
      if ([v88 rangeOfString:@"incomplete"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_69;
      }
      v89 = [v84 absoluteString];
      if ([v89 rangeOfString:@".tmp"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v90 = [v84 absoluteString];
      id v159 = [v90 rangeOfString:@"co-sysdiagnose"];

      id v78 = v146;
      CFStringRef v81 = v87;
      if (v159 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v85 = [v84 absoluteString];
        [v142 addObject:v85];
        goto LABEL_70;
      }
LABEL_71:
      if (v80 == (id)++v83)
      {
        id v80 = [v78 countByEnumeratingWithState:&v170 objects:v189 count:16];
        if (!v80) {
          goto LABEL_73;
        }
        goto LABEL_58;
      }
    }

LABEL_69:
    CFStringRef v81 = v87;
LABEL_70:

    goto LABEL_71;
  }
  v152 = v19;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v179 = v158;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received file %@ successfully for Remote transfer request", buf, 0xCu);
  }
  v20 = [v158 lastPathComponent];
  unsigned int v21 = [v18 stringByAppendingPathComponent:v20];

  uint64_t v22 = v157;
  id v23 = 0;
  if (([v157 fileExistsAtPath:v18 isDirectory:0] & 1) == 0)
  {
    NSFileAttributeKey v190 = NSFilePosixPermissions;
    v191 = &off_1000B13B8;
    v24 = +[NSDictionary dictionaryWithObjects:&v191 forKeys:&v190 count:1];
    id v175 = 0;
    [v157 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:v24 error:&v175];
    id v23 = v175;

    uint64_t v22 = v157;
  }
  id v174 = v23;
  unsigned __int8 v25 = [v22 moveItemAtPath:v158 toPath:v21 error:&v174];
  id v26 = v174;

  BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer of remote archive success", buf, 2u);
    }
  }
  else if (v27)
  {
    v59 = [v26 localizedDescription];
    *(_DWORD *)buf = 138412802;
    id v179 = v158;
    __int16 v180 = 2112;
    v181 = v21;
    __int16 v182 = 2112;
    v183 = v59;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't move file from %@ to %@, error: %@", buf, 0x20u);
  }
  v60 = [(SystemDiagnosticIDS *)self executionGroupDictionary];
  v61 = [v158 lastPathComponent];
  v62 = [v60 objectForKey:v61];

  if (v62)
  {
    uint64_t v18 = v156;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v63 = [v158 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      id v179 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Leaving dispatch group for %@", buf, 0xCu);
    }
    dispatch_group_leave(v62);
    v64 = 0;
    v65 = v157;
  }
  else
  {
    v64 = 0;
    uint64_t v18 = v156;
    v65 = v157;
  }
LABEL_127:
}

- (NSMutableDictionary)localGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalGroupDictionary:(id)a3
{
}

- (NSMutableDictionary)executionGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExecutionGroupDictionary:(id)a3
{
}

- (NSMutableDictionary)localTupleDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalTupleDictionary:(id)a3
{
}

- (unint64_t)transfer_size
{
  return self->_transfer_size;
}

- (void)setTransfer_size:(unint64_t)a3
{
  self->_transfer_size = a3;
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRun_queue:(id)a3
{
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_localTupleDictionary, 0);
  objc_storeStrong((id *)&self->_executionGroupDictionary, 0);

  objc_storeStrong((id *)&self->_localGroupDictionary, 0);
}

@end