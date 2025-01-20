@interface CBDRemoteDeviceConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceConnection:(id)a3;
- (CBDRemoteDeviceConnection)initWithRemoteDevice:(id)a3;
- (NSDictionary)properties;
- (NSString)name;
- (NSString)osVersion;
- (NSString)productType;
- (NSUUID)uuid;
- (OS_dispatch_queue)serviceDiscoveryQueue;
- (OS_remote_device)remoteDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)invalidate;
- (void)setName:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setServiceDiscoveryQueue:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CBDRemoteDeviceConnection

- (CBDRemoteDeviceConnection)initWithRemoteDevice:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CBDRemoteDeviceConnection;
  v6 = [(CBDRemoteDeviceConnection *)&v33 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteDevice, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.deviceconnection.handshake", 0);
    serviceDiscoveryQueue = v7->_serviceDiscoveryQueue;
    v7->_serviceDiscoveryQueue = (OS_dispatch_queue *)v8;

    v38[0] = 0;
    v38[1] = 0;
    remote_device_copy_uuid();
    v10 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:v38];
    uuid = v7->_uuid;
    v7->_uuid = v10;

    v12 = v7->_uuid;
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:@"0000000000"];
    }
    v14 = v7->_uuid;
    v7->_uuid = v13;

    uint64_t v15 = +[NSString stringWithUTF8String:remote_device_get_name()];
    name = v7->_name;
    v7->_name = (NSString *)v15;

    if (v7->_name) {
      v17 = (__CFString *)v7->_name;
    }
    else {
      v17 = @"Unknown";
    }
    objc_storeStrong((id *)&v7->_name, v17);
    v18 = (void *)remote_device_copy_properties();
    +[NSMutableDictionary dictionary];
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100007F4C;
    applier[3] = &unk_100010508;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v32 = v19;
    xpc_dictionary_apply(v18, applier);
    v20 = (NSDictionary *)[v19 copy];
    properties = v7->_properties;
    v7->_properties = v20;

    uint64_t v22 = [(NSDictionary *)v7->_properties objectForKeyedSubscript:@"ProductType"];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = @"Unknown";
    }
    objc_storeStrong((id *)&v7->_productType, v24);

    v25 = [(NSDictionary *)v7->_properties objectForKeyedSubscript:@"OSVersion"];
    CFStringRef v26 = @"0.0";
    if (v25) {
      CFStringRef v26 = v25;
    }
    v7->_osVersion = &v26->isa;

    v27 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v7->_name;
      v28 = v7->_uuid;
      *(_DWORD *)buf = 138412546;
      v35 = v28;
      __int16 v36 = 2112;
      v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Remote Device UUID: %@; name: %@",
        buf,
        0x16u);
    }
  }
  return v7;
}

- (void)invalidate
{
  v3 = [(CBDRemoteDeviceConnection *)self remoteDevice];

  if (v3)
  {
    [(CBDRemoteDeviceConnection *)self setRemoteDevice:0];
  }
}

- (void)dealloc
{
  [(CBDRemoteDeviceConnection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CBDRemoteDeviceConnection;
  [(CBDRemoteDeviceConnection *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(CBDRemoteDeviceConnection *)self uuid];
  v6 = [(CBDRemoteDeviceConnection *)self name];
  v7 = [(CBDRemoteDeviceConnection *)self productType];
  dispatch_queue_t v8 = [(CBDRemoteDeviceConnection *)self osVersion];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@, name = %@, productType = %@, osVersion = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

- (unint64_t)hash
{
  v2 = [(CBDRemoteDeviceConnection *)self uuid];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqualToDeviceConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CBDRemoteDeviceConnection *)self uuid];
  v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CBDRemoteDeviceConnection *)a3;
  unsigned __int8 v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [(CBDRemoteDeviceConnection *)self isEqualToDeviceConnection:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteDeviceConnection);
  unsigned __int8 v5 = [(CBDRemoteDeviceConnection *)self name];
  id v6 = [v5 copy];
  [(CBDRemoteDeviceConnection *)v4 setName:v6];

  v7 = [(CBDRemoteDeviceConnection *)self uuid];
  id v8 = [v7 copy];
  [(CBDRemoteDeviceConnection *)v4 setUuid:v8];

  v9 = [(CBDRemoteDeviceConnection *)self productType];
  id v10 = [v9 copy];
  [(CBDRemoteDeviceConnection *)v4 setProductType:v10];

  id v11 = objc_alloc((Class)NSDictionary);
  v12 = [(CBDRemoteDeviceConnection *)self properties];
  id v13 = [v11 initWithDictionary:v12 copyItems:1];
  [(CBDRemoteDeviceConnection *)v4 setProperties:v13];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  self->_osVersion = (NSString *)a3;
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (OS_dispatch_queue)serviceDiscoveryQueue
{
  return self->_serviceDiscoveryQueue;
}

- (void)setServiceDiscoveryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end