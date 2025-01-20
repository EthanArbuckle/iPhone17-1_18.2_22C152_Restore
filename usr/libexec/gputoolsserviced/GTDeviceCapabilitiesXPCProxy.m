@interface GTDeviceCapabilitiesXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)daemonDeviceCapabilities;
- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3;
- (id)gpuToolsVersionQuery;
- (id)inferiorEnvironment:(id)a3;
@end

@implementation GTDeviceCapabilitiesXPCProxy

- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
  v8 = [(GTDeviceCapabilitiesXPCProxy *)&v19 init];
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTDeviceCapabilities;
    v10 = [GTServiceConnection alloc];
    v11 = [v7 deviceUDID];
    v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = v12;

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
    v9.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
    BOOL v7 = [(GTDeviceCapabilitiesXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (id)daemonDeviceCapabilities
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v6)
  {
    id v7 = objc_alloc((Class)NSSet);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = [v7 initWithObjects:v8, v9, v10, v11, objc_opt_class(), nil];
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v6, "returnValue", v12);
  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "heapDescriptors", (uint64_t)v5);

  uint64_t v8 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v8)
  {
    id v9 = objc_alloc((Class)NSSet);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = [v9 initWithObjects:v10, v11, v12, v13, objc_opt_class(), 0];
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "returnValue", v14);
  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)gpuToolsVersionQuery
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  id v7 = v6;
  if (v6) {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v6, "returnValue");
  }
  else {
    id nsdictionary_any = 0;
  }

  return nsdictionary_any;
}

- (id)inferiorEnvironment:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "launchDictionary", (uint64_t)v5);

  uint64_t v8 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    nsdictionary = (void *)xpc_dictionary_get_nsdictionary(v8, "environment", v9, v10);
  }
  else
  {
    nsdictionary = 0;
  }

  return nsdictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end