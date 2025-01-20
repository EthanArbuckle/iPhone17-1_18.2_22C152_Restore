@interface RSDRemoteComputeControllerDevice
+ (id)tlsOidsRequiredOfPeer;
- (RSDNetworkInterface)interface;
- (RSDRemoteComputeControllerDevice)initWithGeneratedName:(const char *)a3;
- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 address:(const in6_addr *)a4;
- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 endpoint:(id)a4 bonjourUUID:(unsigned __int8)a5[16];
- (const)local_address;
- (const)remote_address;
- (uint64_t)tlsRequirement;
- (unsigned)bonjourUUID;
- (unsigned)interface_index;
- (unsigned)type;
- (void)attach;
- (void)connected;
- (void)disconnect;
- (void)needsConnect;
@end

@implementation RSDRemoteComputeControllerDevice

- (RSDRemoteComputeControllerDevice)initWithGeneratedName:(const char *)a3
{
  result = [(RSDRemoteComputeControllerDevice *)self init];
  if (result)
  {
    v5 = result;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v6;
    long long v10 = v6;
    int v7 = dword_10005B620++;
    snprintf(__str, 0x20uLL, "%s-%d", a3, v7);
    v8.receiver = v5;
    v8.super_class = (Class)RSDRemoteComputeControllerDevice;
    return [(RSDRemoteDevice *)&v8 initWithName:__str];
  }
  return result;
}

- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 address:(const in6_addr *)a4
{
  id v7 = a3;
  objc_super v8 = 0;
  if (v7 && a4)
  {
    if ((a4->__u6_addr32[0] || a4->__u6_addr32[1] || a4->__u6_addr32[2] || a4->__u6_addr32[3])
      && (v9 = [(RSDRemoteComputeControllerDevice *)self initWithGeneratedName:"cnode"],
          (self = v9) != 0))
    {
      objc_storeStrong((id *)&v9->_interface, a3);
      self->remote_address_storage = *a4;
      self = self;
      objc_super v8 = self;
    }
    else
    {
      objc_super v8 = 0;
    }
  }

  return v8;
}

- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 endpoint:(id)a4 bonjourUUID:(unsigned __int8)a5[16]
{
  id v9 = a3;
  id v10 = a4;
  if (v9
    && !uuid_is_null(a5)
    && (v13 = [(RSDRemoteComputeControllerDevice *)self initWithGeneratedName:"cnode"],
        (self = v13) != 0))
  {
    objc_storeStrong((id *)&v13->_interface, a3);
    uuid_copy(self->bonjour_uuid, a5);
    if (uuid_is_null(self->bonjour_uuid)) {
      sub_100038514(&v14, v15);
    }
    objc_storeStrong((id *)&self->bonjour_endpoint, a4);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)type
{
  return 16;
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

- (unsigned)bonjourUUID
}

- (void)attach
{
  [(id)qword_10005BDB0 addObject:self];
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteComputeControllerDevice;
  [(RSDRemoteDevice *)&v3 attach];
}

- (void)disconnect
{
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteComputeControllerDevice;
  [(RSDRemoteDevice *)&v3 disconnect];
  [(id)qword_10005BDB0 removeObject:self];
}

- (void)connected
{
  objc_super v3 = [(RSDRemoteDevice *)self connection];
  v4 = (OS_nw_endpoint *)xpc_remote_connection_copy_remote_endpoint();
  address_endpoint = self->address_endpoint;
  self->address_endpoint = v4;

  long long v6 = self->address_endpoint;
  if (v6)
  {
    self->remote_address_storage = *(in6_addr *)&nw_endpoint_get_address((nw_endpoint_t)v6)->sa_data[6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_100038580();
    }
    id v7 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_cancel();
  }
}

+ (id)tlsOidsRequiredOfPeer
{
  return +[NSSet setWithArray:&off_100056F28];
}

- (void)needsConnect
{
  objc_super v3 = qword_10005BD98;
  if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016044;
  v4[3] = &unk_1000550D0;
  v4[4] = self;
  sub_1000159A8(v4);
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->address_endpoint, 0);

  objc_storeStrong((id *)&self->bonjour_endpoint, 0);
}

- (uint64_t)tlsRequirement
{
  v0 = sub_100029098();
  uint64_t v1 = sub_1000194AC(v0, @"rsd_compute_platform_tls_requirement", @"compute-platform-tls-requirement");

  if (v1)
  {
    v2 = "";
  }
  else
  {
    if (sub_10000EFF8()) {
      v2 = " by default on hactivated devices";
    }
    else {
      v2 = " by default";
    }
    uint64_t v1 = 1;
  }
  objc_super v3 = sub_100029098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    long long v6 = sub_100018FBC(v1);
    __int16 v7 = 2080;
    objc_super v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TLS is %s for compute peers%s", (uint8_t *)&v5, 0x16u);
  }

  return v1;
}

@end