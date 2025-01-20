@interface RSDRemoteNCMDevice
- (OS_nw_endpoint)endpoint;
- (RSDNCMInterface)interface;
- (const)local_address;
- (const)remote_address;
- (unsigned)interface_index;
- (void)connected;
- (void)setEndpoint:(id)a3;
- (void)setInterface:(id)a3;
@end

@implementation RSDRemoteNCMDevice

- (void)connected
{
  v3 = [(RSDRemoteDevice *)self connection];
  v4 = (OS_nw_endpoint *)xpc_remote_connection_copy_remote_endpoint();
  endpoint = self->_endpoint;
  self->_endpoint = v4;

  if (!self->_endpoint)
  {
    v6 = sub_10002D068();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003F124();
    }

    v7 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_cancel();
  }
}

- (unsigned)interface_index
{
  v2 = [(RSDRemoteNCMDevice *)self interface];
  unsigned int v3 = [v2 index];

  return v3;
}

- (const)local_address
{
  unsigned int v3 = [(RSDRemoteNCMDevice *)self interface];
  if (objc_msgSend(v3, "is_private"))
  {
    if ([(RSDRemoteDevice *)self type] == 9)
    {

LABEL_6:
      if (!self->local_address_storage.__u6_addr32[0]
        && !self->local_address_storage.__u6_addr32[1]
        && !self->local_address_storage.__u6_addr32[2]
        && !self->local_address_storage.__u6_addr32[3])
      {
        v5 = [(RSDRemoteNCMDevice *)self interface];
        *(void *)self->local_address_storage.__u6_addr8 = sub_10002D4E8((uint64_t)[v5 mac_addr]);
        *(void *)&self->local_address_storage.__u6_addr32[2] = v6;
      }
      return &self->local_address_storage;
    }
    unsigned int v4 = [(RSDRemoteDevice *)self type];

    if (v4 == 12) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v7 = [(RSDRemoteNCMDevice *)self interface];
  int v8 = sub_10001F918((const char *)[v7 name], self->local_address_storage.__u6_addr8, 1);

  if (v8)
  {
    v9 = sub_10002D068();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003E0D4();
    }
  }
  return &self->local_address_storage;
}

- (const)remote_address
{
  if ([(RSDRemoteDevice *)self state] == 2)
  {
    unsigned int v3 = [(RSDRemoteNCMDevice *)self endpoint];
    address = nw_endpoint_get_address(v3);

    if (address)
    {
      self->remote_address_storage = *(in6_addr *)&address->sa_data[6];
      return &self->remote_address_storage;
    }
    v7 = sub_10002D068();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003F1F8();
    }
LABEL_14:

    return &self->remote_address_storage;
  }
  v5 = [(RSDRemoteNCMDevice *)self interface];
  unsigned int v6 = [v5 is_private];

  if (!v6)
  {
    v7 = sub_10002D068();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003F260();
    }
    goto LABEL_14;
  }
  if (!self->remote_address_storage.__u6_addr32[0]
    && !self->remote_address_storage.__u6_addr32[1]
    && !self->remote_address_storage.__u6_addr32[2]
    && !self->remote_address_storage.__u6_addr32[3])
  {
    v7 = [(RSDRemoteNCMDevice *)self interface];
    *(void *)self->remote_address_storage.__u6_addr8 = sub_10002D4E8((uint64_t)[v7 mac_addr]);
    *(void *)&self->remote_address_storage.__u6_addr32[2] = v8;
    goto LABEL_14;
  }
  return &self->remote_address_storage;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (RSDNCMInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end