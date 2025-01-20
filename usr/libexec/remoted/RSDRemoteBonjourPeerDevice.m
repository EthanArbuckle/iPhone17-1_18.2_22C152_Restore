@interface RSDRemoteBonjourPeerDevice
- (BOOL)suspended;
- (OS_nw_connection)peerconn;
- (OS_nw_endpoint)address_endpoint;
- (OS_nw_endpoint)bonjour_endpoint;
- (RSDRemoteBonjourPeerDevice)initWithBrowsedEndpointUUID:(id)a3 uuid:(unsigned __int8)a4[16];
- (RSDRemoteBonjourPeerDevice)initWithGeneratedName;
- (RSDRemoteBonjourPeerDevice)initWithIncomingEndpoint:(id)a3;
- (const)local_address;
- (const)remote_address;
- (unsigned)interface_index;
- (unsigned)remoteUUID;
- (unsigned)type;
- (void)attach;
- (void)connected;
- (void)disconnect;
- (void)needsConnect;
- (void)setAddress_endpoint:(id)a3;
- (void)setBonjour_endpoint:(id)a3;
- (void)setPeerconn:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation RSDRemoteBonjourPeerDevice

- (RSDRemoteBonjourPeerDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B630++;
  snprintf(__str, 0x20uLL, "peer-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteBonjourPeerDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteBonjourPeerDevice)initWithIncomingEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [(RSDRemoteBonjourPeerDevice *)self initWithGeneratedName];
  objc_super v6 = v5;
  if (v5)
  {
    [(RSDRemoteBonjourPeerDevice *)v5 setAddress_endpoint:v4];
    v6->saysHelloFirst = 0;
    v7 = v6;
  }

  return v6;
}

- (RSDRemoteBonjourPeerDevice)initWithBrowsedEndpointUUID:(id)a3 uuid:(unsigned __int8)a4[16]
{
  objc_super v6 = a3;
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_bonjour_service) {
    sub_10003DD78(&v11, v12);
  }
  v7 = [(RSDRemoteBonjourPeerDevice *)self initWithGeneratedName];
  long long v8 = v7;
  if (v7)
  {
    [(RSDRemoteBonjourPeerDevice *)v7 setBonjour_endpoint:v6];
    uuid_copy(v8->remote_device_uuid, a4);
    if (uuid_is_null(v8->remote_device_uuid)) {
      sub_10003DD0C(&v11, v12);
    }
    v8->saysHelloFirst = uuid_compare((const unsigned __int8 *)&xmmword_10005C020, v8->remote_device_uuid) > 0;
    v9 = v8;
  }

  return v8;
}

- (void)attach
{
  [(id)qword_10005BF78 addObject:self];
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteBonjourPeerDevice;
  [(RSDRemoteDevice *)&v3 attach];
}

- (void)disconnect
{
  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteBonjourPeerDevice;
  [(RSDRemoteDevice *)&v4 disconnect];
  peerconn = self->_peerconn;
  self->_peerconn = 0;

  [(id)qword_10005BF78 removeObject:self];
}

- (void)connected
{
  objc_super v3 = [(RSDRemoteDevice *)self connection];
  objc_super v4 = (void *)xpc_remote_connection_copy_remote_endpoint();
  [(RSDRemoteBonjourPeerDevice *)self setAddress_endpoint:v4];

  v5 = [(RSDRemoteBonjourPeerDevice *)self address_endpoint];
  if (!v5) {
    sub_10003DDE4(&v6, v7);
  }

  uuid_copy(self->remote_device_uuid, (const unsigned __int8 *)[(RSDRemoteDevice *)self uuid]);
  if (uuid_is_null(self->remote_device_uuid)) {
    sub_10003DE50(&v6, v7);
  }
  if (byte_10005BF80)
  {
    sub_10002A07C((unsigned int *)self->remote_device_uuid);
  }
}

- (void)needsConnect
{
  objc_super v3 = sub_10002A5A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }

  if (uuid_is_null(self->remote_device_uuid)) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->remote_device_uuid];
  }
  BOOL saysHelloFirst = self->saysHelloFirst;
  uint64_t v6 = sub_10002A5A8();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!saysHelloFirst)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> local device uuid < remote device uuid: waiting for remote device to connect", buf, 0xCu);
    }

    if (self->_peerconn)
    {
      v19 = [(RSDRemoteDevice *)self connection];

      peerconn = sub_10002A5A8();
      BOOL v20 = os_log_type_enabled(peerconn, OS_LOG_TYPE_DEFAULT);
      if (!v19)
      {
        if (v20)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, peerconn, OS_LOG_TYPE_DEFAULT, "%{public}@> using established peer connection", buf, 0xCu);
        }

        v18 = self->_peerconn;
        peerconn = self->_peerconn;
        self->_peerconn = 0;
LABEL_38:

        if (v18)
        {
          xpc_remote_connection_get_failsafe_version_flags();
          peerconn = xpc_remote_connection_create_with_nw_connection();
        }
        else
        {
          peerconn = 0;
        }
        [(RSDRemoteDevice *)self connect:peerconn];

        goto LABEL_42;
      }
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        v21 = "%{public}@> wait for current connection to invalidate before applying reestablished connection";
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, peerconn, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v4 && ([(id)qword_10005BF88 containsObject:v4] & 1) == 0)
      {
        v22 = sub_10002A5A8();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        v23 = "%{public}@> attempting to wait for connection from peer but bonjour endpoint previously gone away so discarding device";
        goto LABEL_25;
      }
      peerconn = sub_10002A5A8();
      if (os_log_type_enabled(peerconn, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        v21 = "%{public}@> waiting for connection from peer";
        goto LABEL_34;
      }
    }
LABEL_42:

    goto LABEL_43;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> local device uuid > remote device uuid: attaching and connecting to remote device", buf, 0xCu);
  }

  if (!v4 || ([(id)qword_10005BF88 containsObject:v4] & 1) != 0)
  {
    long long v8 = sub_10002A5A8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> connecting to remote remoted", buf, 0xCu);
    }

    v9 = [(RSDRemoteBonjourPeerDevice *)self bonjour_endpoint];
    if (!v9) {
      sub_10003DF28(&v25, buf);
    }

    v10 = [(RSDRemoteBonjourPeerDevice *)self bonjour_endpoint];
    uint64_t v11 = (void *)nw_endpoint_copy_interface();

    v12 = v11;
    if (!v12) {
      sub_10003DF94(&v25, buf);
    }
    peerconn = v12;

    uint32_t index = nw_interface_get_index(peerconn);
    uint64_t v15 = sub_10002A5FC(index);
    if (!v15)
    {
      v24 = sub_10002A5A8();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_10003E000();
      }

      goto LABEL_42;
    }
    v16 = v15;
    v17 = [(RSDRemoteBonjourPeerDevice *)self bonjour_endpoint];
    v18 = (OS_nw_connection *)nw_connection_create(v17, v16);

    goto LABEL_38;
  }
  v22 = sub_10002A5A8();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    v23 = "%{public}@> attempting hello but bonjour endpoint previously gone away so discarding device";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }
LABEL_26:

  [(RSDRemoteBonjourPeerDevice *)self disconnect];
LABEL_43:
}

- (unsigned)type
{
  return 7;
}

- (unsigned)interface_index
{
  return [(id)qword_10005BF98 index];
}

- (const)local_address
{
  p_local_address_storage = &self->local_address_storage;
  if (!self->local_address_storage.__u6_addr32[0]
    && !self->local_address_storage.__u6_addr32[1]
    && !self->local_address_storage.__u6_addr32[2]
    && !self->local_address_storage.__u6_addr32[3]
    && sub_10001F918((const char *)[(id)qword_10005BF98 name], p_local_address_storage, 1))
  {
    objc_super v3 = sub_10002A5A8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003E0D4();
    }
  }
  return p_local_address_storage;
}

- (const)remote_address
{
  v2 = [(RSDRemoteBonjourPeerDevice *)self address_endpoint];
  address = nw_endpoint_get_address(v2);

  return (const in6_addr *)&address->sa_data[6];
}

- (unsigned)remoteUUID
{
  return (unsigned __int8 (*)[16])self->remote_device_uuid;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (OS_nw_endpoint)address_endpoint
{
  return self->_address_endpoint;
}

- (void)setAddress_endpoint:(id)a3
{
}

- (OS_nw_endpoint)bonjour_endpoint
{
  return self->_bonjour_endpoint;
}

- (void)setBonjour_endpoint:(id)a3
{
}

- (OS_nw_connection)peerconn
{
  return self->_peerconn;
}

- (void)setPeerconn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerconn, 0);
  objc_storeStrong((id *)&self->_bonjour_endpoint, 0);

  objc_storeStrong((id *)&self->_address_endpoint, 0);
}

@end