@interface GTURLAccessProviderXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProviderXPCProxy

- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = &OBJC_PROTOCOL___GTURLAccessProvider;
  v9 = [v7 protocolName];
  v10 = NSStringFromProtocol((Protocol *)v8);
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)GTURLAccessProviderXPCProxy;
    v12 = [(GTURLAccessProviderXPCProxy *)&v23 init];
    if (v12)
    {
      v13 = [GTServiceConnection alloc];
      v14 = [v7 deviceUDID];
      v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, [v7 servicePort]);
      connection = v12->_connection;
      v12->_connection = (GTXPCConnection *)v15;

      v17 = +[GTServiceProperties protocolMethods:v8];
      v18 = [v7 protocolMethods];
      uint64_t v19 = newSetWithArrayMinusArray(v17, v18);
      ignoreMethods = v12->_ignoreMethods;
      v12->_ignoreMethods = (NSSet *)v19;
    }
    self = v12;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
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
    v9.super_class = (Class)GTURLAccessProviderXPCProxy;
    BOOL v7 = [(GTURLAccessProviderXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v8);

  *(_OWORD *)task_info_out = 0u;
  long long v17 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (!task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt)) {
    xpc_dictionary_set_data(empty, "auditToken", task_info_out, 0x20uLL);
  }
  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000AD10;
  v13[3] = &unk_100034958;
  id v14 = v7;
  id v12 = v7;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v13];
}

- (id)makeURL:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v5);
  id v8 = [(GTXPCConnection *)self->_connection connection];
  xpc_connection_get_audit_token();

  id v9 = v5;
  [v9 fileSystemRepresentation];

  v10 = (const char *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    unsigned int v11 = (char *)v10;
    xpc_dictionary_set_string(empty, "sandboxExtension", v10);
    free(v11);
  }
  id v12 = -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0, 0, 0, 0, 0);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v12, "identifier", v13);
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B0E0;
  v18[3] = &unk_100034958;
  id v19 = v9;
  id v17 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v18];
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B2B4;
  v18[3] = &unk_100034958;
  id v19 = v9;
  id v17 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v18];
}

- (id)urlForPath:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = v5;
  id v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(empty, "path", v9);
  id v10 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v10, "result", v11);
    string = xpc_dictionary_get_string(v10, "sandboxExtension");
    if (string)
    {
      id v14 = +[NSData dataWithBytes:string length:strlen(string) + 1];
      _CFURLAttachSecurityScopeToFileURL();
    }
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end