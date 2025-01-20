@interface MRExternalDeviceTransportConnectionHandle
- (MRDeviceInfo)deviceInfo;
- (MRExternalDeviceTransportConnection)connection;
- (MRExternalDeviceTransportConnectionHandle)initWithConnection:(id)a3 deviceInfo:(id)a4;
- (id)description;
@end

@implementation MRExternalDeviceTransportConnectionHandle

- (MRExternalDeviceTransportConnectionHandle)initWithConnection:(id)a3 deviceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRExternalDeviceTransportConnectionHandle;
  v9 = [(MRExternalDeviceTransportConnectionHandle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_deviceInfo, a4);
  }

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  connection = self->_connection;
  v6 = [(MRDeviceInfo *)self->_deviceInfo WHAIdentifier];
  id v7 = [(MRDeviceInfo *)self->_deviceInfo name];
  id v8 = (void *)[v3 initWithFormat:@"<%@ %@ %@-%@>", v4, connection, v6, v7];

  return v8;
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end