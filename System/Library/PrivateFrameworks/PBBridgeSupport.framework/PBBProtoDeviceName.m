@interface PBBProtoDeviceName
- (BOOL)hasDeviceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoDeviceName

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoDeviceName;
  v4 = [(PBBProtoDeviceName *)&v8 description];
  v5 = [(PBBProtoDeviceName *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoDeviceNameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  deviceName = self->_deviceName;
  if (deviceName) {
    [a3 setDeviceName:deviceName];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    deviceName = self->_deviceName;
    if ((unint64_t)deviceName | v4[1]) {
      char v6 = -[NSString isEqual:](deviceName, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_deviceName hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoDeviceName setDeviceName:](self, "setDeviceName:");
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end