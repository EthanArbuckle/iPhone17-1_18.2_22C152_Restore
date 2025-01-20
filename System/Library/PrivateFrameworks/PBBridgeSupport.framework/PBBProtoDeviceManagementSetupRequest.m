@interface PBBProtoDeviceManagementSetupRequest
- (BOOL)hasConfigurationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)configurationData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoDeviceManagementSetupRequest

- (BOOL)hasConfigurationData
{
  return self->_configurationData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoDeviceManagementSetupRequest;
  v4 = [(PBBProtoDeviceManagementSetupRequest *)&v8 description];
  v5 = [(PBBProtoDeviceManagementSetupRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  configurationData = self->_configurationData;
  if (configurationData) {
    [v3 setObject:configurationData forKey:@"configurationData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoDeviceManagementSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_configurationData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  configurationData = self->_configurationData;
  if (configurationData) {
    [a3 setConfigurationData:configurationData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_configurationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    configurationData = self->_configurationData;
    if ((unint64_t)configurationData | v4[1]) {
      char v6 = -[NSData isEqual:](configurationData, "isEqual:");
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
  return [(NSData *)self->_configurationData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoDeviceManagementSetupRequest setConfigurationData:](self, "setConfigurationData:");
  }
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end