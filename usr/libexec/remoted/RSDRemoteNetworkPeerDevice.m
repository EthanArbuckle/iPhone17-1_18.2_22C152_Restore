@interface RSDRemoteNetworkPeerDevice
- (RSDRemoteNetworkPeerDevice)initWithGeneratedName;
- (const)local_address;
- (const)remote_address;
- (id)initClientWithRemoteAddress:(const in6_addr *)a3;
- (id)initServerWithPeerSocket:(int)a3;
- (unsigned)interface_index;
- (unsigned)type;
- (void)attach;
- (void)disconnect;
- (void)needsConnect;
- (void)serverReplacePeerSocket:(int)a3;
@end

@implementation RSDRemoteNetworkPeerDevice

- (RSDRemoteNetworkPeerDevice)initWithGeneratedName
{
  result = [(RSDRemoteNetworkPeerDevice *)self init];
  if (result)
  {
    v3 = result;
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v4;
    long long v8 = v4;
    int v5 = dword_10005B624++;
    snprintf(__str, 0x20uLL, "network-%d", v5);
    v6.receiver = v3;
    v6.super_class = (Class)RSDRemoteNetworkPeerDevice;
    return [(RSDRemoteDevice *)&v6 initWithName:__str];
  }
  return result;
}

- (id)initClientWithRemoteAddress:(const in6_addr *)a3
{
  v3 = (in6_addr *)a3;
  if (a3)
  {
    if ((a3->__u6_addr32[0] || a3->__u6_addr32[1] || a3->__u6_addr32[2] || a3->__u6_addr32[3])
      && (self = [(RSDRemoteNetworkPeerDevice *)self initWithGeneratedName]) != 0)
    {
      self->remote_address_storage = *v3;
      self->server_mode = 0;
      self = self;
      v3 = (in6_addr *)self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)initServerWithPeerSocket:(int)a3
{
  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    int v5 = [(RSDRemoteNetworkPeerDevice *)self initWithGeneratedName];
    v3 = v5;
    if (v5)
    {
      v5->peerfd = a3;
      v5->server_mode = 1;
      if (!sub_10001FBC0(a3, v5->remote_address_storage.__u6_addr8))
      {
        v3 = v3;
        objc_super v6 = v3;
        goto LABEL_7;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
        sub_10003AA98();
      }
    }
  }
  objc_super v6 = 0;
LABEL_7:

  return v6;
}

- (void)serverReplacePeerSocket:(int)a3
{
  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
      sub_10003AB00();
    }
  }
  else if (sub_10001FBC0(a3, self->remote_address_storage.__u6_addr8))
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
      sub_10003AA98();
    }
  }
  else
  {
    self->peerfd = a3;
    int v5 = [(RSDRemoteDevice *)self connection];

    if (v5)
    {
      objc_super v6 = [(RSDRemoteDevice *)self connection];
      xpc_remote_connection_cancel();

      [(RSDRemoteDevice *)self setConnection:0];
    }
    else
    {
      [(RSDRemoteNetworkPeerDevice *)self needsConnect];
    }
  }
}

- (void)attach
{
  [(id)qword_10005BE28 addObject:self];
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNetworkPeerDevice;
  [(RSDRemoteDevice *)&v3 attach];
}

- (void)disconnect
{
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNetworkPeerDevice;
  [(RSDRemoteDevice *)&v3 disconnect];
  [(id)qword_10005BE28 removeObject:self];
}

- (void)needsConnect
{
  objc_super v3 = qword_10005BE20;
  if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  if (self->server_mode)
  {
    if (self->peerfd < 0)
    {
      v9 = qword_10005BE20;
      if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for the other side to connect", buf, 0xCu);
      }
    }
    else
    {
      xpc_remote_connection_get_failsafe_version_flags();
      long long v4 = (void *)xpc_remote_connection_create_with_connected_fd();
      self->peerfd = -1;
      [(RSDRemoteDevice *)self connect:v4];
    }
  }
  else
  {
    HIDWORD(v10) = -1;
    int v5 = [(RSDRemoteNetworkPeerDevice *)self remote_address];
    uint64_t v6 = sub_10001EFB0((int *)&v10 + 1, (__n128 *)v5, 0xE5F9u, (int)[(id)qword_10005BE38 index], (uint64_t)&xmmword_100044D80);
    v7 = qword_10005BE20;
    if (v6)
    {
      uint64_t v8 = v6;
      if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
        sub_100037074((uint64_t)self, v8, v7);
      }
      [(RSDRemoteDevice *)self connect:0];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      LODWORD(v10) = HIDWORD(v10);
      -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:](self, "pollConnect:onQueue:withLog:completion:", _NSConcreteStackBlock, 3221225472, sub_10001D9B4, &unk_1000555D8, self, v10);
    }
  }
}

- (unsigned)type
{
  return 14;
}

- (unsigned)interface_index
{
  return [(id)qword_10005BE38 index];
}

- (const)local_address
{
  return (const in6_addr *)&qword_10005BE40;
}

- (const)remote_address
{
  return &self->remote_address_storage;
}

@end