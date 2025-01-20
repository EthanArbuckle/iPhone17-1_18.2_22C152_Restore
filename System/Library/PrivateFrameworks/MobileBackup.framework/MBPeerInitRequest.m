@interface MBPeerInitRequest
- (MBPeerInitRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerInitRequest)initWithTargetDeviceUDID:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 buildVersion:(id)a6 productVersion:(id)a7;
- (NSNumber)targetProtocolVersion;
- (NSString)description;
- (NSString)targetBuildVersion;
- (NSString)targetDeviceClass;
- (NSString)targetDeviceName;
- (NSString)targetDeviceUDID;
- (NSString)targetProductVersion;
- (id)dictionaryRepresentation;
@end

@implementation MBPeerInitRequest

- (id)dictionaryRepresentation
{
  v11[0] = @"MBProtocolVersion";
  v3 = [(MBPeerInitRequest *)self targetProtocolVersion];
  v12[0] = v3;
  v11[1] = @"MBDeviceUDID";
  v4 = [(MBPeerInitRequest *)self targetDeviceUDID];
  v12[1] = v4;
  v11[2] = @"MBDeviceClass";
  v5 = [(MBPeerInitRequest *)self targetDeviceClass];
  v12[2] = v5;
  v11[3] = @"MBDeviceName";
  v6 = [(MBPeerInitRequest *)self targetDeviceName];
  v12[3] = v6;
  v11[4] = @"MBBuildVersion";
  v7 = [(MBPeerInitRequest *)self targetBuildVersion];
  v12[4] = v7;
  v11[5] = @"MBProductVersion";
  v8 = [(MBPeerInitRequest *)self targetProductVersion];
  v12[5] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (MBPeerInitRequest)initWithTargetDeviceUDID:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 buildVersion:(id)a6 productVersion:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MBPeerInitRequest;
  v17 = [(MBPeerInitRequest *)&v22 init];
  v18 = v17;
  if (v17)
  {
    targetProtocolVersion = v17->_targetProtocolVersion;
    v17->_targetProtocolVersion = (NSNumber *)&off_100439F90;

    objc_storeStrong((id *)&v18->_targetDeviceUDID, a3);
    objc_storeStrong((id *)&v18->_targetDeviceName, a4);
    objc_storeStrong((id *)&v18->_targetDeviceClass, a5);
    objc_storeStrong((id *)&v18->_targetBuildVersion, a6);
    objc_storeStrong((id *)&v18->_targetProductVersion, a7);
  }

  return v18;
}

- (MBPeerInitRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MBPeerInitRequest;
  v7 = [(MBPeerInitRequest *)&v22 init];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"MBProtocolVersion"];
  targetProtocolVersion = v7->_targetProtocolVersion;
  v7->_targetProtocolVersion = (NSNumber *)v8;

  uint64_t v10 = [v6 objectForKeyedSubscript:@"MBDeviceUDID"];
  targetDeviceUDID = v7->_targetDeviceUDID;
  v7->_targetDeviceUDID = (NSString *)v10;

  uint64_t v12 = [v6 objectForKeyedSubscript:@"MBDeviceName"];
  targetDeviceName = v7->_targetDeviceName;
  v7->_targetDeviceName = (NSString *)v12;

  uint64_t v14 = [v6 objectForKeyedSubscript:@"MBDeviceClass"];
  targetDeviceClass = v7->_targetDeviceClass;
  v7->_targetDeviceClass = (NSString *)v14;

  uint64_t v16 = [v6 objectForKeyedSubscript:@"MBBuildVersion"];
  targetBuildVersion = v7->_targetBuildVersion;
  v7->_targetBuildVersion = (NSString *)v16;

  uint64_t v18 = [v6 objectForKeyedSubscript:@"MBProductVersion"];
  targetProductVersion = v7->_targetProductVersion;
  v7->_targetProductVersion = (NSString *)v18;

  if (!v7->_targetProtocolVersion) {
    goto LABEL_9;
  }
  if (v7->_targetDeviceUDID
    && v7->_targetDeviceName
    && v7->_targetDeviceClass
    && v7->_targetProductVersion
    && v7->_targetBuildVersion)
  {
LABEL_8:
    v20 = v7;
  }
  else
  {
LABEL_9:
    if (a4)
    {
      +[MBError errorWithCode:11, @"Failed to decode request. Missing property in dictionary %@", v6 format];
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  v5 = [(MBPeerInitRequest *)self targetProtocolVersion];
  id v6 = [v5 unsignedLongValue];
  v7 = [(MBPeerInitRequest *)self targetDeviceUDID];
  uint64_t v8 = [(MBPeerInitRequest *)self targetDeviceName];
  v9 = [(MBPeerInitRequest *)self targetDeviceClass];
  uint64_t v10 = [(MBPeerInitRequest *)self targetProductVersion];
  v11 = [(MBPeerInitRequest *)self targetBuildVersion];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; protocol=%lu, deviceUDID=%@, deviceName=\"%@\", deviceClass=%@, productVersion=%@, buildVersion=%@>",
    Name,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return (NSString *)v12;
}

- (NSNumber)targetProtocolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)targetDeviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)targetDeviceClass
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)targetDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)targetBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)targetProductVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetProductVersion, 0);
  objc_storeStrong((id *)&self->_targetBuildVersion, 0);
  objc_storeStrong((id *)&self->_targetDeviceName, 0);
  objc_storeStrong((id *)&self->_targetDeviceClass, 0);
  objc_storeStrong((id *)&self->_targetDeviceUDID, 0);
  objc_storeStrong((id *)&self->_targetProtocolVersion, 0);
}

@end