@interface MXDeviceInfo
- (BOOL)hasDeviceName;
- (BOOL)hasDeviceVersion;
- (BOOL)hasSystemBuild;
- (BOOL)hasSystemName;
- (BOOL)hasSystemVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceName;
- (NSString)deviceVersion;
- (NSString)systemBuild;
- (NSString)systemName;
- (NSString)systemVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setSystemName:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXDeviceInfo

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceVersion
{
  return self->_deviceVersion != 0;
}

- (BOOL)hasSystemName
{
  return self->_systemName != 0;
}

- (BOOL)hasSystemVersion
{
  return self->_systemVersion != 0;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXDeviceInfo;
  v4 = [(MXDeviceInfo *)&v8 description];
  v5 = [(MXDeviceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"device_name"];
  }
  deviceVersion = self->_deviceVersion;
  if (deviceVersion) {
    [v4 setObject:deviceVersion forKey:@"device_version"];
  }
  systemName = self->_systemName;
  if (systemName) {
    [v4 setObject:systemName forKey:@"system_name"];
  }
  systemVersion = self->_systemVersion;
  if (systemVersion) {
    [v4 setObject:systemVersion forKey:@"system_version"];
  }
  systemBuild = self->_systemBuild;
  if (systemBuild) {
    [v4 setObject:systemBuild forKey:@"system_build"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_systemName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_systemVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceName)
  {
    objc_msgSend(v4, "setDeviceName:");
    id v4 = v5;
  }
  if (self->_deviceVersion)
  {
    objc_msgSend(v5, "setDeviceVersion:");
    id v4 = v5;
  }
  if (self->_systemName)
  {
    objc_msgSend(v5, "setSystemName:");
    id v4 = v5;
  }
  if (self->_systemVersion)
  {
    objc_msgSend(v5, "setSystemVersion:");
    id v4 = v5;
  }
  if (self->_systemBuild)
  {
    objc_msgSend(v5, "setSystemBuild:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_deviceVersion copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_systemName copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_systemVersion copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSString *)self->_systemBuild copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deviceName = self->_deviceName, !((unint64_t)deviceName | v4[1]))
     || -[NSString isEqual:](deviceName, "isEqual:"))
    && ((deviceVersion = self->_deviceVersion, !((unint64_t)deviceVersion | v4[2]))
     || -[NSString isEqual:](deviceVersion, "isEqual:"))
    && ((systemName = self->_systemName, !((unint64_t)systemName | v4[4]))
     || -[NSString isEqual:](systemName, "isEqual:"))
    && ((systemVersion = self->_systemVersion, !((unint64_t)systemVersion | v4[5]))
     || -[NSString isEqual:](systemVersion, "isEqual:")))
  {
    systemBuild = self->_systemBuild;
    if ((unint64_t)systemBuild | v4[3]) {
      char v10 = -[NSString isEqual:](systemBuild, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceName hash];
  NSUInteger v4 = [(NSString *)self->_deviceVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_systemName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_systemVersion hash];
  return v6 ^ [(NSString *)self->_systemBuild hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[MXDeviceInfo setDeviceName:](self, "setDeviceName:");
  }
  if (v4[2]) {
    -[MXDeviceInfo setDeviceVersion:](self, "setDeviceVersion:");
  }
  if (v4[4]) {
    -[MXDeviceInfo setSystemName:](self, "setSystemName:");
  }
  if (v4[5]) {
    -[MXDeviceInfo setSystemVersion:](self, "setSystemVersion:");
  }
  if (v4[3]) {
    -[MXDeviceInfo setSystemBuild:](self, "setSystemBuild:");
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end