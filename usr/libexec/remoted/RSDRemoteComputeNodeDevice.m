@interface RSDRemoteComputeNodeDevice
+ (id)tlsOidsRequiredOfPeer;
- (RSDNetworkInterface)interface;
- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerConnection:(id)a4 endpoint:(id)a5;
- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerSocket:(int)a4;
- (const)local_address;
- (const)remote_address;
- (unsigned)interface_index;
- (unsigned)type;
- (void)attach;
- (void)disconnect;
- (void)needsConnect;
- (void)replacePeerConnection:(id)a3;
- (void)replacePeerSocket:(int)a3;
@end

@implementation RSDRemoteComputeNodeDevice

- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerSocket:(int)a4
{
  id v7 = a3;
  if ((a4 & 0x80000000) == 0)
  {
    v8 = [(RSDRemoteDevice *)self initWithName:"cctrl"];
    self = v8;
    if (v8)
    {
      uint64_t v9 = sub_10001FBC0(a4, v8->remote_address_storage.__u6_addr8);
      if (!v9)
      {
        objc_storeStrong((id *)&self->_interface, a3);
        self->peerfd = a4;
        self = self;
        v18 = self;
        goto LABEL_7;
      }
      uint64_t v10 = v9;
      v11 = qword_10005BDC0;
      if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
        sub_100039148(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerConnection:(id)a4 endpoint:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  uint64_t v12 = [(RSDRemoteDevice *)self initWithName:"cctrl"];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->peer_connection, a4);
    v13->peerfd = -1;
    v13->remote_address_storage = *(in6_addr *)&nw_endpoint_get_address(v11)->sa_data[6];
    uint64_t v14 = v13;
  }

  return v13;
}

- (void)replacePeerSocket:(int)a3
{
  if ((a3 & 0x80000000) == 0)
  {
    self->peerfd = a3;
    v4 = [(RSDRemoteDevice *)self connection];

    if (v4)
    {
      v5 = [(RSDRemoteDevice *)self connection];
      xpc_remote_connection_cancel();

      [(RSDRemoteDevice *)self setConnection:0];
    }
    else
    {
      [(RSDRemoteComputeNodeDevice *)self needsConnect];
    }
  }
}

- (void)replacePeerConnection:(id)a3
{
  objc_storeStrong((id *)&self->peer_connection, a3);
  v4 = [(RSDRemoteDevice *)self connection];

  if (v4)
  {
    v5 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_cancel();

    [(RSDRemoteDevice *)self setConnection:0];
  }
  else
  {
    [(RSDRemoteComputeNodeDevice *)self needsConnect];
  }
}

- (unsigned)type
{
  return 15;
}

- (unsigned)interface_index
{
  return [(RSDNetworkInterface *)self->_interface index];
}

- (const)local_address
{
  return [(RSDNetworkInterface *)self->_interface local_address];
}

- (const)remote_address
{
  return &self->remote_address_storage;
}

- (void)attach
{
  v2.receiver = self;
  v2.super_class = (Class)RSDRemoteComputeNodeDevice;
  [(RSDRemoteDevice *)&v2 attach];
}

- (void)disconnect
{
  v2.receiver = self;
  v2.super_class = (Class)RSDRemoteComputeNodeDevice;
  [(RSDRemoteDevice *)&v2 disconnect];
}

+ (id)tlsOidsRequiredOfPeer
{
  objc_super v2 = +[NSMutableSet setWithArray:&off_100056F58];
  if (sub_100016F3C()) {
    [v2 addObject:@"1.2.840.113635.100.6.85"];
  }
  id v3 = [v2 copy];

  return v3;
}

- (void)needsConnect
{
  id v3 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017E28;
  v4[3] = &unk_1000550D0;
  v4[4] = self;
  sub_10001A5FC(&off_100056F70, v4);
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->peer_connection, 0);

  objc_storeStrong((id *)&self->address_endpoint, 0);
}

@end