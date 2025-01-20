@interface _MRAirPlayLeaderInfoProtobuf
- (BOOL)hasDeviceInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRDeviceInfoMessageProtobuf)deviceInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAirPlayLeaderInfoProtobuf

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAirPlayLeaderInfoProtobuf;
  v4 = [(_MRAirPlayLeaderInfoProtobuf *)&v8 description];
  v5 = [(_MRAirPlayLeaderInfoProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v5 = [(_MRDeviceInfoMessageProtobuf *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"deviceInfo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAirPlayLeaderInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceInfo) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    [a3 setDeviceInfo:deviceInfo];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfo copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    deviceInfo = self->_deviceInfo;
    if ((unint64_t)deviceInfo | v4[1]) {
      char v6 = -[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfo, "isEqual:");
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
  return [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfo hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  deviceInfo = self->_deviceInfo;
  uint64_t v6 = v4[1];
  if (deviceInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    deviceInfo = (_MRDeviceInfoMessageProtobuf *)-[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    deviceInfo = (_MRDeviceInfoMessageProtobuf *)-[_MRAirPlayLeaderInfoProtobuf setDeviceInfo:](self, "setDeviceInfo:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](deviceInfo, v4);
}

- (_MRDeviceInfoMessageProtobuf)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end