@interface HSMessaging
- (HSHostConnection)hostConnection;
- (OS_dispatch_queue)queue;
- (id)handleMessage:(id)a3;
- (void)handleError:(id)a3;
- (void)handleEvent:(id)a3 from:(id)a4;
- (void)setHostConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)startMessaging;
@end

@implementation HSMessaging

- (void)startMessaging
{
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(HSHostConnection);
  [(HSMessaging *)self setHostConnection:v3];

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.horizond.messaging", 0);
  [(HSMessaging *)self setQueue:v4];

  v5 = [(HSMessaging *)self hostConnection];
  v6 = off_100014C38;
  v7 = [(HSMessaging *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000692C;
  v8[3] = &unk_100010658;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [v5 acceptConnectionsForService:v6 InQueue:v7 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleEvent:(id)a3 from:(id)a4
{
  xpc_object_t object = a3;
  id v6 = a4;
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  v8 = [v7 lastPathComponent];
  v35 = +[NSString stringWithFormat:@"Received something from remote xpc connection."];
  sub_100009790(2, @"[%@:%d] %@\n", v9, v10, v11, v12, v13, v14, (uint64_t)v8);

  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v26 = [(HSMessaging *)self handleMessage:object];
    if (v26)
    {
      v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      v28 = [v27 lastPathComponent];
      v37 = +[NSString stringWithFormat:@"Server replying."];
      sub_100009790(2, @"[%@:%d] %@\n", v29, v30, v31, v32, v33, v34, (uint64_t)v28);

      xpc_remote_connection_send_message();
    }
  }
  else
  {
    xpc_type_t v16 = type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      [(HSMessaging *)self handleError:object];
    }
    else
    {
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      v18 = [v17 lastPathComponent];
      v36 = +[NSString stringWithFormat:@"Unrecognized message type: %@", v16, 102, v35];
      sub_100009790(4, @"[%@:%d] %@\n", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
  }
}

- (id)handleMessage:(id)a3
{
  id v3 = a3;
  size_t length = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  data = xpc_dictionary_get_data(v3, (const char *)[@"SerializedMessage" UTF8String], &length);
  if (data)
  {
    id v6 = data;
    v7 = objc_alloc_init(HSMessageProcessor);
    v8 = +[NSData dataWithBytes:v6 length:length];
    uint64_t v9 = sub_100003874(v8);
    uint64_t v10 = [v9 objectForKey:@"Command"];

    if (v10)
    {
      id v110 = 0;
      unsigned int v11 = [(HSMessageProcessor *)v7 processMessage:v9 response:&v110];
      id v12 = v110;
      uint64_t v13 = v12;
      if (!v11 && v12) {
        goto LABEL_5;
      }
      v82 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      v83 = [v82 lastPathComponent];
      v105 = +[NSString stringWithFormat:@"Process message failed."];
      sub_100009790(4, @"[%@:%d] %@\n", v84, v85, v86, v87, v88, v89, (uint64_t)v83);

      if (v13) {
        goto LABEL_5;
      }
    }
    else
    {
      v74 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      v75 = [v74 lastPathComponent];
      v104 = +[NSString stringWithFormat:@"Cannot find command from in-coming message."];
      sub_100009790(4, @"[%@:%d] %@\n", v76, v77, v78, v79, v80, v81, (uint64_t)v75);
    }
    v90 = +[NSNumber numberWithInt:6];
    uint64_t v13 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v90, @"Status", @"Failed to get a response from the device.", @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];

LABEL_5:
    uint64_t v14 = sub_100003A38(v13);

    v15 = (const char *)[@"SerializedMessage" UTF8String];
    id v16 = v14;
    xpc_dictionary_set_data(reply, v15, [v16 bytes], (size_t)[v16 length]);

LABEL_6:
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v3, (const char *)[@"Command" UTF8String]);
  if (string)
  {
    v18 = string;
    uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    uint64_t v20 = [v19 lastPathComponent];
    v100 = +[NSString stringWithFormat:@"Received a horizon command: %s", v18];
    sub_100009790(2, @"[%@:%d] %@\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

    xpc_dictionary_set_BOOL(reply, "done", 1);
    goto LABEL_20;
  }
  v27 = xpc_dictionary_get_string(v3, (const char *)[@"Query" UTF8String]);
  if (!v27)
  {
    if (xpc_dictionary_get_data(v3, (const char *)[@"SerializedObject" UTF8String], &length))
    {
      v108 = objc_alloc_init(HSMessageProcessor);
      uint64_t v107 = objc_opt_class();
      uint64_t v106 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      uint64_t v47 = objc_opt_class();
      uint64_t v48 = objc_opt_class();
      uint64_t v49 = objc_opt_class();
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = objc_opt_class();
      uint64_t v52 = objc_opt_class();
      uint64_t v53 = objc_opt_class();
      v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v107, v106, v46, v47, v48, v49, v50, v51, v52, v53, objc_opt_class(), 0);
      v55 = +[NSKeyedUnarchiver unarchiveXPCObject:v3 allowedClasses:v54];
      if (sub_100006768() == 1) {
        CFStringRef v56 = @"Ramdisk";
      }
      else {
        CFStringRef v56 = @"NonUI";
      }
      [v55 setDeviceEnvironment:v56];
      id v109 = 0;
      [(HSMessageProcessor *)v108 processMessagev1:v55 response:&v109];
      id v57 = v109;
      v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      v59 = [v58 lastPathComponent];
      v102 = +[NSString stringWithFormat:@"Archiving Message Received from XPC Pluging"];
      sub_100009790(2, @"[%@:%d] %@\n", v60, v61, v62, v63, v64, v65, (uint64_t)v59);

      +[NSKeyedArchiver archiveObject:v57 to:reply];
      goto LABEL_20;
    }
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    v67 = [(HSMessageProcessor *)v7 lastPathComponent];
    v103 = +[NSString stringWithFormat:@"Invalid message from host."];
    sub_100009790(2, @"[%@:%d] %@\n", v68, v69, v70, v71, v72, v73, (uint64_t)v67);

    goto LABEL_6;
  }
  v28 = v27;
  uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  uint64_t v30 = [v29 lastPathComponent];
  v101 = +[NSString stringWithFormat:@"Got a query: %s", v28];
  sub_100009790(2, @"[%@:%d] %@\n", v31, v32, v33, v34, v35, v36, (uint64_t)v30);

  v37 = +[NSString stringWithUTF8String:v28];
  if (([&off_100011F98 containsObject:v37] & 1) == 0)
  {
    v91 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    v92 = [v91 lastPathComponent];
    v99 = +[NSString stringWithFormat:@"Reading gestalt key %@ is not allowed.", v37, 169, v101];
LABEL_29:
    sub_100009790(2, @"[%@:%d] %@\n", v93, v94, v95, v96, v97, v98, (uint64_t)v92);

    v39 = 0;
    goto LABEL_13;
  }
  uint64_t v38 = MGCopyAnswer();
  if (!v38)
  {
    v91 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    v92 = [v91 lastPathComponent];
    v99 = +[NSString stringWithFormat:@"Cannot read gestalt key %@", v37, 169, v101];
    goto LABEL_29;
  }
  v39 = (void *)v38;
  v40 = +[NSNumber numberWithInt:0];
  v41 = +[NSDictionary dictionaryWithObjectsAndKeys:v40, @"Status", &stru_1000108C8, @"Error", &stru_1000108C8, @"Output", v39, @"Data", 0];

  if (!v41)
  {
LABEL_13:
    v42 = +[NSNumber numberWithInt:4];
    v41 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v42, @"Status", @"Failed to read gestalt key.", @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];
  }
  v43 = sub_100003A38(v41);
  v44 = (const char *)[@"SerializedMessage" UTF8String];
  id v45 = v43;
  xpc_dictionary_set_data(reply, v44, [v45 bytes], (size_t)[v45 length]);

LABEL_20:

  return reply;
}

- (void)handleError:(id)a3
{
  id v3 = a3;
  xpc_object_t object = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    uint64_t v14 = [v13 lastPathComponent];
    uint64_t v21 = +[NSString stringWithFormat:@"Connection to client is invalid."];
  }
  else
  {
    if (v3 != &_xpc_error_connection_interrupted)
    {
      dispatch_queue_t v4 = xpc_copy_description(v3);
      v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v22 = +[NSString stringWithFormat:@"Unrecognized XPC error: %s", v4];
      sub_100009790(4, @"[%@:%d] %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

      free(v4);
      goto LABEL_7;
    }
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
    uint64_t v14 = [v13 lastPathComponent];
    uint64_t v21 = +[NSString stringWithFormat:@"Connection to client interrupted."];
  }
  sub_100009790(4, @"[%@:%d] %@\n", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

LABEL_7:
}

- (HSHostConnection)hostConnection
{
  return (HSHostConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHostConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_hostConnection, 0);
}

@end