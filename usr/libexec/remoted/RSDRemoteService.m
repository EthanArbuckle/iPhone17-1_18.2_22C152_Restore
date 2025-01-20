@interface RSDRemoteService
- (OS_xpc_object)properties;
- (OS_xpc_object)service_listener;
- (RSDRemoteDevice)device;
- (RSDRemoteService)initWithName:(const char *)a3 description:(id)a4;
- (char)entitlement;
- (char)name;
- (char)port;
- (id)copyClientDescription;
- (id)description;
- (int)getSocketWithTcpOption:(id *)a3;
- (void)cancel;
- (void)dealloc;
- (void)setDevice:(id)a3;
- (void)setEntitlement:(char *)a3;
- (void)setName:(char *)a3;
- (void)setPort:(char *)a3;
- (void)setProperties:(id)a3;
- (void)setService_listener:(id)a3;
- (void)updateWithDescription:(id)a3;
@end

@implementation RSDRemoteService

- (RSDRemoteService)initWithName:(const char *)a3 description:(id)a4
{
  id v6 = a4;
  v7 = [(RSDRemoteService *)self init];
  if (v7)
  {
    [(RSDRemoteService *)v7 setName:strdup(a3)];
    v8 = xpc_dictionary_get_value(v6, "Port");
    v9 = v8;
    if (v8)
    {
      if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_string)
      {
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
          sub_100034EB8();
        }
        v10 = 0;
        goto LABEL_25;
      }
      string_ptr = xpc_string_get_string_ptr(v9);
      [(RSDRemoteService *)v7 setPort:strdup(string_ptr)];
    }
    v12 = xpc_dictionary_get_value(v6, "EntitlementOverride");
    v13 = v12;
    if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_string)
    {
      v16 = xpc_string_get_string_ptr(v13);
      [(RSDRemoteService *)v7 setEntitlement:strdup(v16)];
    }
    else
    {
      v14 = xpc_dictionary_get_value(v6, "Entitlement");
      v15 = v14;
      if (!v14 || xpc_get_type(v14) != (xpc_type_t)&_xpc_type_string)
      {
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
          sub_100034E1C();
        }
LABEL_21:
        v10 = 0;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v17 = xpc_string_get_string_ptr(v15);
      [(RSDRemoteService *)v7 setEntitlement:strdup(v17)];
    }
    v18 = xpc_dictionary_get_value(v6, "Properties");
    v15 = v18;
    if (v18)
    {
      if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
          sub_100034E84();
        }
        goto LABEL_21;
      }
      [(RSDRemoteService *)v7 setProperties:v15];
    }
    v10 = v7;
    goto LABEL_24;
  }
  v10 = 0;
LABEL_26:

  return v10;
}

- (void)updateWithDescription:(id)a3
{
  v4 = xpc_dictionary_get_value(a3, "Port");
  v5 = v4;
  if (v4)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
    {
      free([(RSDRemoteService *)self port]);
      string_ptr = xpc_string_get_string_ptr(v5);
      [(RSDRemoteService *)self setPort:strdup(string_ptr)];
    }
    else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
    {
      sub_100034EB8();
    }
  }
}

- (void)cancel
{
  v3 = [(RSDRemoteService *)self service_listener];

  if (v3)
  {
    v4 = [(RSDRemoteService *)self service_listener];
    xpc_connection_cancel(v4);

    [(RSDRemoteService *)self setService_listener:0];
  }
}

- (void)dealloc
{
  free(self->_name);
  free(self->_port);
  free(self->_entitlement);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteService;
  [(RSDRemoteService *)&v3 dealloc];
}

- (int)getSocketWithTcpOption:(id *)a3
{
  v5 = [(RSDRemoteService *)self device];
  unsigned int v6 = [v5 state];

  if (v6 == 5) {
    sub_100034EEC(&v10, v11);
  }
  v7 = [(RSDRemoteService *)self device];
  int v8 = [v7 connectToService:-[RSDRemoteService port](self, "port") withTcpOption:a3];

  return v8;
}

- (id)description
{
  objc_super v3 = [(RSDRemoteService *)self device];
  v4 = [NSString stringWithFormat:@"%s/%s", objc_msgSend(v3, "device_name"), -[RSDRemoteService name](self, "name")];

  return v4;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (char)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(char *)a3
{
  self->_entitlement = a3;
}

- (char)port
{
  return self->_port;
}

- (void)setPort:(char *)a3
{
  self->_port = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (RSDRemoteDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (RSDRemoteDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (OS_xpc_object)service_listener
{
  return self->_service_listener;
}

- (void)setService_listener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service_listener, 0);
  objc_destroyWeak((id *)&self->_device);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)copyClientDescription
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "name", [(RSDRemoteService *)self name]);
  v4 = [(RSDRemoteService *)self properties];

  if (v4)
  {
    v5 = [(RSDRemoteService *)self properties];
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
  }
  unsigned int v6 = v5;
  xpc_dictionary_set_value(v3, "properties", v5);

  v7 = [(RSDRemoteService *)self service_listener];

  if (!v7)
  {
    int v8 = (void *)qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      *(_DWORD *)buf = 136446210;
      v17 = [(RSDRemoteService *)self name];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating service listener for \"%{public}s\"", buf, 0xCu);
    }
    xpc_connection_t v10 = xpc_connection_create(0, (dispatch_queue_t)qword_10005BED8);
    [(RSDRemoteService *)self setService_listener:v10];

    v11 = [(RSDRemoteService *)self service_listener];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100020A1C;
    handler[3] = &unk_100054F08;
    handler[4] = self;
    xpc_connection_set_event_handler(v11, handler);

    v12 = [(RSDRemoteService *)self service_listener];
    xpc_connection_activate(v12);
  }
  v13 = [(RSDRemoteService *)self service_listener];
  xpc_dictionary_set_connection(v3, "endpoint", v13);

  return v3;
}

@end