@interface TVRMSBeginPairingMessage
- (BOOL)hasAppName;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceName;
- (BOOL)hasPasscode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)passcode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPasscode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSBeginPairingMessage

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasPasscode
{
  return self->_passcode != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSBeginPairingMessage;
  v4 = [(TVRMSBeginPairingMessage *)&v8 description];
  v5 = [(TVRMSBeginPairingMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v4 setObject:deviceName forKey:@"deviceName"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v4 setObject:deviceModel forKey:@"deviceModel"];
  }
  passcode = self->_passcode;
  if (passcode) {
    [v4 setObject:passcode forKey:@"passcode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSBeginPairingMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_appName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_passcode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_appName)
  {
    objc_msgSend(v4, "setAppName:");
    id v4 = v5;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v5, "setDeviceName:");
    id v4 = v5;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v5, "setDeviceModel:");
    id v4 = v5;
  }
  if (self->_passcode)
  {
    objc_msgSend(v5, "setPasscode:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_deviceName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_passcode copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appName = self->_appName, !((unint64_t)appName | v4[1]))
     || -[NSString isEqual:](appName, "isEqual:"))
    && ((deviceName = self->_deviceName, !((unint64_t)deviceName | v4[3]))
     || -[NSString isEqual:](deviceName, "isEqual:"))
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[2]))
     || -[NSString isEqual:](deviceModel, "isEqual:")))
  {
    passcode = self->_passcode;
    if ((unint64_t)passcode | v4[4]) {
      char v9 = -[NSString isEqual:](passcode, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appName hash];
  NSUInteger v4 = [(NSString *)self->_deviceName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deviceModel hash];
  return v4 ^ v5 ^ [(NSString *)self->_passcode hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[TVRMSBeginPairingMessage setAppName:](self, "setAppName:");
  }
  if (v4[3]) {
    -[TVRMSBeginPairingMessage setDeviceName:](self, "setDeviceName:");
  }
  if (v4[2]) {
    -[TVRMSBeginPairingMessage setDeviceModel:](self, "setDeviceModel:");
  }
  if (v4[4]) {
    -[TVRMSBeginPairingMessage setPasscode:](self, "setPasscode:");
  }
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end