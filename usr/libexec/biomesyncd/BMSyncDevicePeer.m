@interface BMSyncDevicePeer
- (BMSyncDevicePeer)initWithDeviceIdentifier:(id)a3 metadata:(id)a4 protocolVersion:(unint64_t)a5;
- (BMSyncDevicePeer)initWithFMResultSet:(id)a3;
- (BMSyncDevicePeerMetadata)metadata;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)idsDeviceIdentifier;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (void)setIdsDeviceIdentifier:(id)a3;
- (void)setProtocolVersion:(unint64_t)a3;
@end

@implementation BMSyncDevicePeer

- (BMSyncDevicePeer)initWithFMResultSet:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringForColumn:@"device_identifier"];
  v6 = [v4 stringForColumn:@"ids_device_identifier"];
  v7 = [v4 stringForColumn:@"name"];
  v8 = [v4 stringForColumn:@"model"];
  uint64_t v9 = (int)[v4 intForColumn:@"platform"];
  signed int v10 = [v4 intForColumn:@"protocol_version"];

  v11 = [[BMSyncDevicePeerMetadata alloc] initWithName:v7 model:v8 platform:v9];
  v12 = [[BMSyncDevicePeer alloc] initWithDeviceIdentifier:v5 metadata:v11 protocolVersion:v10];
  [(BMSyncDevicePeer *)v12 setIdsDeviceIdentifier:v6];

  return v12;
}

- (BMSyncDevicePeer)initWithDeviceIdentifier:(id)a3 metadata:(id)a4 protocolVersion:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSyncDevicePeer;
  v11 = [(BMSyncDevicePeer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    v12->_protocolVersion = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    deviceIdentifier = self->_deviceIdentifier;
    v7 = [v5 deviceIdentifier];
    if ([(NSString *)deviceIdentifier isEqualToString:v7])
    {
      metadata = self->_metadata;
      id v9 = [v5 metadata];
      if ([(BMSyncDevicePeerMetadata *)metadata isEqual:v9])
      {
        id protocolVersion = self->_protocolVersion;
        BOOL v11 = protocolVersion == [v5 protocolVersion];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceIdentifier hash];
  unint64_t v4 = [(BMSyncDevicePeerMetadata *)self->_metadata hash] ^ v3;
  id v5 = +[NSNumber numberWithUnsignedInteger:self->_protocolVersion];
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"deviceIdentifier"];
  unint64_t v6 = [BMSyncDevicePeerMetadata alloc];
  v7 = [v4 objectForKeyedSubscript:@"deviceMetadata"];
  id v8 = [(BMSyncDevicePeerMetadata *)v6 initFromDictionary:v7];

  id v9 = [v4 objectForKeyedSubscript:@"protocolVersion"];

  id v10 = [v9 unsignedIntegerValue];
  BOOL v11 = [(BMSyncDevicePeer *)self initWithDeviceIdentifier:v5 metadata:v8 protocolVersion:v10];

  return v11;
}

- (id)dictionaryRepresentation
{
  v8[0] = self->_deviceIdentifier;
  v7[0] = @"deviceIdentifier";
  v7[1] = @"deviceMetadata";
  NSUInteger v3 = [(BMSyncDevicePeerMetadata *)self->_metadata dictionaryRepresentation];
  v8[1] = v3;
  v7[2] = @"protocolVersion";
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_protocolVersion];
  v8[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
}

- (BMSyncDevicePeerMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_id protocolVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end