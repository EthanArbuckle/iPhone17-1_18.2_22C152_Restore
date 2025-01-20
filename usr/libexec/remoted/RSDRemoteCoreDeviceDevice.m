@interface RSDRemoteCoreDeviceDevice
- (OS_nw_connection)client_connection;
- (OS_nw_endpoint)address_endpoint;
- (OS_nw_endpoint)client_endpoint;
- (OS_nw_listener)server_listener;
- (OS_xpc_object)control_peer;
- (RSDRemoteCoreDeviceDevice)initWithClientEndpoint:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 connectTimeout:(unsigned int)a6;
- (RSDRemoteCoreDeviceDevice)initWithGeneratedName;
- (RSDRemoteCoreDeviceDevice)initWithServerListener:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 interfaceIndex:(unsigned int)a6 connectTimeout:(unsigned int)a7;
- (char)if_name;
- (const)local_address;
- (const)remote_address;
- (unint64_t)tlsRequirement;
- (unsigned)connect_timeout;
- (unsigned)if_index;
- (unsigned)type;
- (void)attach;
- (void)cancelListener;
- (void)connected;
- (void)dealloc;
- (void)disconnect;
- (void)needsConnect;
- (void)setAddress_endpoint:(id)a3;
- (void)setClient_connection:(id)a3;
- (void)setClient_endpoint:(id)a3;
- (void)setConnect_timeout:(unsigned int)a3;
- (void)setControl_peer:(id)a3;
- (void)setIf_index:(unsigned int)a3;
- (void)setIf_name:(char *)a3;
- (void)setServer_listener:(id)a3;
@end

@implementation RSDRemoteCoreDeviceDevice

- (unint64_t)tlsRequirement
{
  return 1;
}

- (RSDRemoteCoreDeviceDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B608++;
  snprintf(__str, 0x20uLL, "coredevice-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteCoreDeviceDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteCoreDeviceDevice)initWithClientEndpoint:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 connectTimeout:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v12 = [(RSDRemoteCoreDeviceDevice *)self initWithGeneratedName];
  v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  [(RSDRemoteCoreDeviceDevice *)v12 setControl_peer:v11];
  [(RSDRemoteCoreDeviceDevice *)v13 setClient_endpoint:v10];
  [(RSDRemoteCoreDeviceDevice *)v13 setIf_name:strdup(a5)];
  [(RSDRemoteCoreDeviceDevice *)v13 setConnect_timeout:v6];
  v14 = [(RSDRemoteCoreDeviceDevice *)v13 client_endpoint];
  if (v14)
  {
    uint64_t v15 = [(RSDRemoteCoreDeviceDevice *)v13 control_peer];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(RSDRemoteCoreDeviceDevice *)v13 if_name];

      if (v17)
      {
        v14 = v13;
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_7:
    v14 = 0;
  }
LABEL_8:

  return v14;
}

- (RSDRemoteCoreDeviceDevice)initWithServerListener:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 interfaceIndex:(unsigned int)a6 connectTimeout:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  v14 = [(RSDRemoteCoreDeviceDevice *)self initWithGeneratedName];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  [(RSDRemoteCoreDeviceDevice *)v14 setControl_peer:v13];
  [(RSDRemoteCoreDeviceDevice *)v15 setServer_listener:v12];
  [(RSDRemoteCoreDeviceDevice *)v15 setIf_name:strdup(a5)];
  [(RSDRemoteCoreDeviceDevice *)v15 setIf_index:v8];
  [(RSDRemoteCoreDeviceDevice *)v15 setConnect_timeout:v7];
  v16 = [(RSDRemoteCoreDeviceDevice *)v15 server_listener];
  if (v16)
  {
    v17 = [(RSDRemoteCoreDeviceDevice *)v15 control_peer];
    if (v17 && [(RSDRemoteCoreDeviceDevice *)v15 if_name])
    {
      unsigned int v18 = [(RSDRemoteCoreDeviceDevice *)v15 if_index];

      if (v18)
      {
        v16 = v15;
        goto LABEL_9;
      }
    }
    else
    {
    }
LABEL_8:
    v16 = 0;
  }
LABEL_9:

  return v16;
}

- (void)attach
{
  [(RSDRemoteDevice *)self setBackendProperty:"InterfaceName" withString:[(RSDRemoteCoreDeviceDevice *)self if_name]];
  if ([(RSDRemoteCoreDeviceDevice *)self if_index]) {
    [(RSDRemoteDevice *)self setBackendProperty:"InterfaceIndex" withUint:[(RSDRemoteCoreDeviceDevice *)self if_index]];
  }
  [(id)qword_10005BCB8 addObject:self];
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteCoreDeviceDevice;
  [(RSDRemoteDevice *)&v3 attach];
}

- (void)disconnect
{
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteCoreDeviceDevice;
  [(RSDRemoteDevice *)&v5 disconnect];
  objc_super v3 = [(RSDRemoteCoreDeviceDevice *)self client_connection];

  if (v3)
  {
    int v4 = [(RSDRemoteCoreDeviceDevice *)self client_connection];
    nw_connection_cancel(v4);

    [(RSDRemoteCoreDeviceDevice *)self setClient_connection:0];
  }
  [(id)qword_10005BCB8 removeObject:self];
}

- (void)cancelListener
{
  objc_super v3 = [(RSDRemoteCoreDeviceDevice *)self server_listener];

  if (v3)
  {
    int v4 = [(RSDRemoteCoreDeviceDevice *)self server_listener];
    nw_listener_cancel(v4);

    [(RSDRemoteCoreDeviceDevice *)self setServer_listener:0];
  }
}

- (void)dealloc
{
  objc_super v3 = [(RSDRemoteCoreDeviceDevice *)self server_listener];

  if (v3)
  {
    int v4 = [(RSDRemoteCoreDeviceDevice *)self server_listener];
    nw_listener_cancel(v4);
  }
  free([(RSDRemoteCoreDeviceDevice *)self if_name]);
  [(RSDRemoteCoreDeviceDevice *)self setIf_name:0];
  [(RSDRemoteCoreDeviceDevice *)self setControl_peer:0];
  [(RSDRemoteCoreDeviceDevice *)self setClient_endpoint:0];
  [(RSDRemoteCoreDeviceDevice *)self setServer_listener:0];
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteCoreDeviceDevice;
  [(RSDRemoteDevice *)&v5 dealloc];
}

- (void)connected
{
  objc_super v3 = [(RSDRemoteDevice *)self connection];
  int v4 = (void *)xpc_remote_connection_copy_remote_endpoint();
  [(RSDRemoteCoreDeviceDevice *)self setAddress_endpoint:v4];

  objc_super v5 = [(RSDRemoteCoreDeviceDevice *)self address_endpoint];

  if (!v5)
  {
    uint64_t v6 = sub_100004818();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000330F0();
    }
  }
}

- (void)needsConnect
{
  objc_super v3 = sub_100004818();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = 138543362;
    uint64_t v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v14, 0xCu);
  }

  int v4 = [(RSDRemoteCoreDeviceDevice *)self server_listener];

  if (v4)
  {
    objc_super v5 = [(RSDRemoteCoreDeviceDevice *)self client_connection];

    uint64_t v6 = sub_100004818();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        unsigned int v14 = 138543362;
        uint64_t v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> server using established client connection", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v8 = [(RSDRemoteCoreDeviceDevice *)self client_connection];
      [(RSDRemoteCoreDeviceDevice *)self setClient_connection:0];
      if (v8)
      {
LABEL_8:
        xpc_remote_connection_get_failsafe_version_flags();
        v9 = xpc_remote_connection_create_with_nw_connection();
LABEL_16:
        [(RSDRemoteDevice *)self connect:v9];

LABEL_17:
        return;
      }
LABEL_15:
      v9 = 0;
      goto LABEL_16;
    }
    if (v7)
    {
      unsigned int v14 = 138543362;
      uint64_t v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> server waiting for connection from client", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v10 = [(RSDRemoteCoreDeviceDevice *)self client_endpoint];

    id v11 = sub_100004818();
    uint64_t v6 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = 138543362;
        uint64_t v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> client connecting to remote remoted", (uint8_t *)&v14, 0xCu);
      }

      unsigned int v14 = 0;
      v9 = sub_100004B48([(RSDRemoteCoreDeviceDevice *)self if_name], 2, &v14);
      if (!v9 || !v14)
      {
        id v13 = sub_100004818();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100033158();
        }

        goto LABEL_17;
      }
      -[RSDRemoteCoreDeviceDevice setIf_index:](self, "setIf_index:");
      id v12 = [(RSDRemoteCoreDeviceDevice *)self client_endpoint];
      uint64_t v8 = nw_connection_create(v12, v9);

      if (v8) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100033124();
    }
  }
}

- (unsigned)type
{
  v2 = [(RSDRemoteCoreDeviceDevice *)self client_endpoint];

  if (v2) {
    return 10;
  }
  else {
    return 13;
  }
}

- (const)local_address
{
  p_local_address_storage = &self->local_address_storage;
  if (!self->local_address_storage.__u6_addr32[0]
    && !self->local_address_storage.__u6_addr32[1]
    && !self->local_address_storage.__u6_addr32[2]
    && !self->local_address_storage.__u6_addr32[3]
    && sub_10001F918([(RSDRemoteCoreDeviceDevice *)self if_name], p_local_address_storage, 0))
  {
    objc_super v3 = sub_100004818();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100033278();
    }
  }
  return p_local_address_storage;
}

- (const)remote_address
{
  v2 = [(RSDRemoteCoreDeviceDevice *)self address_endpoint];
  address = nw_endpoint_get_address(v2);

  return (const in6_addr *)&address->sa_data[6];
}

- (OS_xpc_object)control_peer
{
  return self->_control_peer;
}

- (void)setControl_peer:(id)a3
{
}

- (OS_nw_endpoint)address_endpoint
{
  return self->_address_endpoint;
}

- (void)setAddress_endpoint:(id)a3
{
}

- (OS_nw_endpoint)client_endpoint
{
  return self->_client_endpoint;
}

- (void)setClient_endpoint:(id)a3
{
}

- (OS_nw_listener)server_listener
{
  return self->_server_listener;
}

- (void)setServer_listener:(id)a3
{
}

- (unsigned)connect_timeout
{
  return self->_connect_timeout;
}

- (void)setConnect_timeout:(unsigned int)a3
{
  self->_connect_timeout = a3;
}

- (char)if_name
{
  return self->_if_name;
}

- (void)setIf_name:(char *)a3
{
  self->_if_name = a3;
}

- (unsigned)if_index
{
  return self->_if_index;
}

- (void)setIf_index:(unsigned int)a3
{
  self->_if_index = a3;
}

- (OS_nw_connection)client_connection
{
  return self->_client_connection;
}

- (void)setClient_connection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client_connection, 0);
  objc_storeStrong((id *)&self->_server_listener, 0);
  objc_storeStrong((id *)&self->_client_endpoint, 0);
  objc_storeStrong((id *)&self->_address_endpoint, 0);

  objc_storeStrong((id *)&self->_control_peer, 0);
}

@end