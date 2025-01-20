@interface PBBProtoRemoteAccountForDevice
- (BOOL)hasSerializedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSerializedDevice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoRemoteAccountForDevice

- (BOOL)hasSerializedDevice
{
  return self->_serializedDevice != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoRemoteAccountForDevice;
  v4 = [(PBBProtoRemoteAccountForDevice *)&v8 description];
  v5 = [(PBBProtoRemoteAccountForDevice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  serializedDevice = self->_serializedDevice;
  if (serializedDevice) {
    [v3 setObject:serializedDevice forKey:@"serializedDevice"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoRemoteAccountForDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_serializedDevice) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  serializedDevice = self->_serializedDevice;
  if (serializedDevice) {
    [a3 setSerializedDevice:serializedDevice];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_serializedDevice copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    serializedDevice = self->_serializedDevice;
    if ((unint64_t)serializedDevice | v4[1]) {
      char v6 = -[NSData isEqual:](serializedDevice, "isEqual:");
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
  return [(NSData *)self->_serializedDevice hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoRemoteAccountForDevice setSerializedDevice:](self, "setSerializedDevice:");
  }
}

- (NSData)serializedDevice
{
  return self->_serializedDevice;
}

- (void)setSerializedDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end