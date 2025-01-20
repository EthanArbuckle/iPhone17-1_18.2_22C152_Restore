@interface HSFileTransfer
- (HSHostConnection)hostConnection;
- (OS_dispatch_queue)queue;
- (id)handleMessage:(id)a3;
- (void)handleError:(id)a3;
- (void)handleEvent:(id)a3 from:(id)a4;
- (void)setHostConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)startFileTransferService;
@end

@implementation HSFileTransfer

- (void)startFileTransferService
{
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(HSHostConnection);
  [(HSFileTransfer *)self setHostConnection:v3];

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.horizond.file_transfer", 0);
  [(HSFileTransfer *)self setQueue:v4];

  v5 = [(HSFileTransfer *)self hostConnection];
  v6 = off_100014C40;
  v7 = [(HSFileTransfer *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B1A0;
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
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
  v8 = [v7 lastPathComponent];
  v35 = +[NSString stringWithFormat:@"Received something from remote xpc connection."];
  sub_100009790(2, @"[%@:%d] %@\n", v9, v10, v11, v12, v13, v14, (uint64_t)v8);

  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v26 = [(HSFileTransfer *)self handleMessage:object];
    if (v26)
    {
      v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
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
      [(HSFileTransfer *)self handleError:object];
    }
    else
    {
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
      v18 = [v17 lastPathComponent];
      v36 = +[NSString stringWithFormat:@"Unrecognized message type: %@", v16, 48, v35];
      sub_100009790(4, @"[%@:%d] %@\n", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
  }
}

- (id)handleMessage:(id)a3
{
  id v3 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  string = xpc_dictionary_get_string(v3, "retrieve_file");

  id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
  v7 = [v6 lastPathComponent];
  if (string)
  {
    v53 = +[NSString stringWithFormat:@"Retrieving file from device to host..."];
    sub_100009790(2, @"[%@:%d] %@\n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);

    uint64_t v14 = +[NSString stringWithUTF8String:string];
    v15 = [v14 stringByStandardizingPath];

    if (v15 && ([v15 hasPrefix:@"/var/mobile/Media/FactoryLogs"] & 1) != 0)
    {
      xpc_type_t v16 = +[NSFileManager defaultManager];
      unsigned __int8 v17 = [v16 fileExistsAtPath:v15];

      if (v17)
      {
        v18 = +[NSFileManager defaultManager];
        uint64_t v19 = +[NSString stringWithUTF8String:string];
        id v20 = [v18 contentsAtPath:v19];

        if ((unint64_t)[v20 length] > 0xA00000)
        {
          v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
          v46 = [v45 lastPathComponent];
          v57 = +[NSString stringWithFormat:@"File to retrieve is too big. Limit is 10M."];
          sub_100009790(2, @"[%@:%d] %@\n", v47, v48, v49, v50, v51, v52, (uint64_t)v46);

          xpc_dictionary_set_string(reply, "error", "File to retrieve is too big. Limit is 10M.");
        }
        else
        {
          id v20 = v20;
          xpc_dictionary_set_data(reply, "content", [v20 bytes], (size_t)[v20 length]);
        }

        goto LABEL_8;
      }
      v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
      v38 = [v37 lastPathComponent];
      v56 = +[NSString stringWithFormat:@"File does not exist: %@.", v15, 76, v53];
      sub_100009790(2, @"[%@:%d] %@\n", v39, v40, v41, v42, v43, v44, (uint64_t)v38);

      v36 = "File does not exist";
    }
    else
    {
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
      uint64_t v29 = [v28 lastPathComponent];
      v55 = +[NSString stringWithFormat:@"Only files under /private/var/mobile/Media/FactoryLogs can be copied."];
      sub_100009790(2, @"[%@:%d] %@\n", v30, v31, v32, v33, v34, v35, (uint64_t)v29);

      v36 = "Only files under /private/var/mobile/Media/FactoryLogs can be copied.";
    }
    xpc_dictionary_set_string(reply, "error", v36);
LABEL_8:

    goto LABEL_10;
  }
  v54 = +[NSString stringWithFormat:@"Operation not supported."];
  sub_100009790(2, @"[%@:%d] %@\n", v21, v22, v23, v24, v25, v26, (uint64_t)v7);

  xpc_dictionary_set_string(reply, "error", "Operation not supported.");
LABEL_10:

  return reply;
}

- (void)handleError:(id)a3
{
  id v3 = a3;
  xpc_object_t object = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
    uint64_t v14 = [v13 lastPathComponent];
    uint64_t v21 = +[NSString stringWithFormat:@"Connection to client is invalid."];
  }
  else
  {
    if (v3 != &_xpc_error_connection_interrupted)
    {
      dispatch_queue_t v4 = xpc_copy_description(v3);
      v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v22 = +[NSString stringWithFormat:@"Unrecognized XPC error: %s", v4];
      sub_100009790(4, @"[%@:%d] %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

      free(v4);
      goto LABEL_7;
    }
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
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