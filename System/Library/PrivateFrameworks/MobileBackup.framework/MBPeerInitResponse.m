@interface MBPeerInitResponse
- (MBPeerInitResponse)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerInitResponse)initWithSourceDeviceUDID:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 buildVersion:(id)a6 productVersion:(id)a7;
- (NSNumber)sourceProtocolVersion;
- (NSString)description;
- (NSString)sourceBuildVersion;
- (NSString)sourceDeviceClass;
- (NSString)sourceDeviceName;
- (NSString)sourceDeviceUDID;
- (NSString)sourceProductVersion;
- (NSString)sourceRequiredProductVersion;
- (id)dictionaryRepresentation;
- (void)setSourceRequiredProductVersion:(id)a3;
@end

@implementation MBPeerInitResponse

- (id)dictionaryRepresentation
{
  v13[0] = @"MBProtocolVersion";
  v3 = [(MBPeerInitResponse *)self sourceProtocolVersion];
  v14[0] = v3;
  v13[1] = @"MBDeviceUDID";
  v4 = [(MBPeerInitResponse *)self sourceDeviceUDID];
  v14[1] = v4;
  v13[2] = @"MBDeviceName";
  v5 = [(MBPeerInitResponse *)self sourceDeviceName];
  v14[2] = v5;
  v13[3] = @"MBDeviceClass";
  v6 = [(MBPeerInitResponse *)self sourceDeviceClass];
  v14[3] = v6;
  v13[4] = @"MBBuildVersion";
  v7 = [(MBPeerInitResponse *)self sourceBuildVersion];
  v14[4] = v7;
  v13[5] = @"MBProductVersion";
  v8 = [(MBPeerInitResponse *)self sourceProductVersion];
  v14[5] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  v10 = [(MBPeerInitResponse *)self sourceRequiredProductVersion];
  if (v10)
  {
    id v11 = [v9 mutableCopy];
    [v11 setObject:v10 forKeyedSubscript:@"MBRequiredProductVersion"];

    v9 = v11;
  }

  return v9;
}

- (MBPeerInitResponse)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MBPeerInitResponse;
  v7 = [(MBPeerInitResponse *)&v24 init];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"MBProtocolVersion"];
  sourceProtocolVersion = v7->_sourceProtocolVersion;
  v7->_sourceProtocolVersion = (NSNumber *)v8;

  uint64_t v10 = [v6 objectForKeyedSubscript:@"MBDeviceUDID"];
  sourceDeviceUDID = v7->_sourceDeviceUDID;
  v7->_sourceDeviceUDID = (NSString *)v10;

  uint64_t v12 = [v6 objectForKeyedSubscript:@"MBDeviceName"];
  sourceDeviceName = v7->_sourceDeviceName;
  v7->_sourceDeviceName = (NSString *)v12;

  uint64_t v14 = [v6 objectForKeyedSubscript:@"MBDeviceClass"];
  sourceDeviceClass = v7->_sourceDeviceClass;
  v7->_sourceDeviceClass = (NSString *)v14;

  uint64_t v16 = [v6 objectForKeyedSubscript:@"MBBuildVersion"];
  sourceBuildVersion = v7->_sourceBuildVersion;
  v7->_sourceBuildVersion = (NSString *)v16;

  uint64_t v18 = [v6 objectForKeyedSubscript:@"MBProductVersion"];
  sourceProductVersion = v7->_sourceProductVersion;
  v7->_sourceProductVersion = (NSString *)v18;

  uint64_t v20 = [v6 objectForKeyedSubscript:@"MBRequiredProductVersion"];
  sourceRequiredProductVersion = v7->_sourceRequiredProductVersion;
  v7->_sourceRequiredProductVersion = (NSString *)v20;

  if (!v7->_sourceProtocolVersion) {
    goto LABEL_9;
  }
  if (v7->_sourceDeviceUDID
    && v7->_sourceDeviceName
    && v7->_sourceDeviceClass
    && v7->_sourceProductVersion
    && v7->_sourceBuildVersion)
  {
LABEL_8:
    v22 = v7;
  }
  else
  {
LABEL_9:
    if (a4)
    {
      +[MBError errorWithCode:11, @"Failed to decode response. Missing property in dictionary %@", v6 format];
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (MBPeerInitResponse)initWithSourceDeviceUDID:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 buildVersion:(id)a6 productVersion:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MBPeerInitResponse;
  v17 = [(MBPeerInitResponse *)&v22 init];
  uint64_t v18 = v17;
  if (v17)
  {
    sourceProtocolVersion = v17->_sourceProtocolVersion;
    v17->_sourceProtocolVersion = (NSNumber *)&off_100439F90;

    objc_storeStrong((id *)&v18->_sourceDeviceUDID, a3);
    objc_storeStrong((id *)&v18->_sourceDeviceName, a4);
    objc_storeStrong((id *)&v18->_sourceDeviceClass, a5);
    objc_storeStrong((id *)&v18->_sourceBuildVersion, a6);
    objc_storeStrong((id *)&v18->_sourceProductVersion, a7);
  }

  return v18;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  v5 = [(MBPeerInitResponse *)self sourceProtocolVersion];
  id v6 = [v5 unsignedLongValue];
  v7 = [(MBPeerInitResponse *)self sourceDeviceUDID];
  uint64_t v8 = [(MBPeerInitResponse *)self sourceDeviceName];
  v9 = [(MBPeerInitResponse *)self sourceDeviceClass];
  uint64_t v10 = [(MBPeerInitResponse *)self sourceProductVersion];
  id v11 = [(MBPeerInitResponse *)self sourceBuildVersion];
  uint64_t v12 = [(MBPeerInitResponse *)self sourceRequiredProductVersion];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; protocol=%lu, deviceUDID=%@, deviceName=\"%@\", deviceClass=%@, productVersion=%@, buildVersion=%@, requiredProductVersion=%@>",
    Name,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
  id v13 = v12);

  return (NSString *)v13;
}

- (NSNumber)sourceProtocolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)sourceDeviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sourceDeviceClass
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)sourceDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)sourceBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)sourceProductVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)sourceRequiredProductVersion
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourceRequiredProductVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRequiredProductVersion, 0);
  objc_storeStrong((id *)&self->_sourceProductVersion, 0);
  objc_storeStrong((id *)&self->_sourceBuildVersion, 0);
  objc_storeStrong((id *)&self->_sourceDeviceName, 0);
  objc_storeStrong((id *)&self->_sourceDeviceClass, 0);
  objc_storeStrong((id *)&self->_sourceDeviceUDID, 0);
  objc_storeStrong((id *)&self->_sourceProtocolVersion, 0);
}

@end