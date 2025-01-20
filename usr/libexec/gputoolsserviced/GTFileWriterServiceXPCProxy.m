@interface GTFileWriterServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterServiceXPCProxy

- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTFileWriterServiceXPCProxy;
  v8 = [(GTFileWriterServiceXPCProxy *)&v19 init];
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTFileWriterService;
    v10 = [GTServiceConnection alloc];
    v11 = [v7 deviceUDID];
    v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v12;

    v14 = +[GTServiceProperties protocolMethods:v9];
    v15 = [v7 protocolMethods];
    uint64_t v16 = newSetWithArrayMinusArray(v14, v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;
  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTFileWriterServiceXPCProxy;
    BOOL v7 = [(GTFileWriterServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000FE1C;
  v26[3] = &unk_100034958;
  id v27 = v13;
  id v25 = v13;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v26];
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100010054;
  v26[3] = &unk_100034958;
  id v27 = v13;
  id v25 = v13;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v26];
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v19);

  id v22 = v18;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "path", v23);
  id v24 = v17;
  id v25 = (const char *)[v24 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v25);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v16);

  xpc_dictionary_set_uint64(empty, "sessionID", a7);
  connection = self->_connection;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000102D8;
  v28[3] = &unk_100034958;
  id v29 = v15;
  id v27 = v15;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v28];
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "data", v10);

  xpc_dictionary_set_uint64(empty, "sessionID", a4);
  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010490;
  v15[3] = &unk_100034958;
  id v16 = v9;
  id v14 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v15];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end