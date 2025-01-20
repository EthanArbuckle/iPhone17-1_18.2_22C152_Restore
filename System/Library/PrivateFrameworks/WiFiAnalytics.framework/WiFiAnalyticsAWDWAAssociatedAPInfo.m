@interface WiFiAnalyticsAWDWAAssociatedAPInfo
- (BOOL)hasDeviceNameData;
- (BOOL)hasDeviceNameElement;
- (BOOL)hasManufacturerElement;
- (BOOL)hasModelName;
- (BOOL)hasModelNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceNameData;
- (NSString)deviceNameElement;
- (NSString)manufacturerElement;
- (NSString)modelName;
- (NSString)modelNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceNameData:(id)a3;
- (void)setDeviceNameElement:(id)a3;
- (void)setManufacturerElement:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWAAssociatedAPInfo

- (BOOL)hasManufacturerElement
{
  return self->_manufacturerElement != 0;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (BOOL)hasDeviceNameElement
{
  return self->_deviceNameElement != 0;
}

- (BOOL)hasDeviceNameData
{
  return self->_deviceNameData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWAAssociatedAPInfo;
  v4 = [(WiFiAnalyticsAWDWAAssociatedAPInfo *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWAAssociatedAPInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  manufacturerElement = self->_manufacturerElement;
  if (manufacturerElement) {
    [v3 setObject:manufacturerElement forKey:@"ManufacturerElement"];
  }
  modelName = self->_modelName;
  if (modelName) {
    [v4 setObject:modelName forKey:@"ModelName"];
  }
  modelNumber = self->_modelNumber;
  if (modelNumber) {
    [v4 setObject:modelNumber forKey:@"ModelNumber"];
  }
  deviceNameElement = self->_deviceNameElement;
  if (deviceNameElement) {
    [v4 setObject:deviceNameElement forKey:@"DeviceNameElement"];
  }
  deviceNameData = self->_deviceNameData;
  if (deviceNameData) {
    [v4 setObject:deviceNameData forKey:@"DeviceNameData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWAAssociatedAPInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_manufacturerElement)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceNameElement)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceNameData)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_manufacturerElement)
  {
    objc_msgSend(v4, "setManufacturerElement:");
    id v4 = v5;
  }
  if (self->_modelName)
  {
    objc_msgSend(v5, "setModelName:");
    id v4 = v5;
  }
  if (self->_modelNumber)
  {
    objc_msgSend(v5, "setModelNumber:");
    id v4 = v5;
  }
  if (self->_deviceNameElement)
  {
    objc_msgSend(v5, "setDeviceNameElement:");
    id v4 = v5;
  }
  if (self->_deviceNameData)
  {
    objc_msgSend(v5, "setDeviceNameData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_manufacturerElement copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_modelName copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_modelNumber copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_deviceNameElement copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSString *)self->_deviceNameData copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((manufacturerElement = self->_manufacturerElement, !((unint64_t)manufacturerElement | v4[3]))
     || -[NSString isEqual:](manufacturerElement, "isEqual:"))
    && ((modelName = self->_modelName, !((unint64_t)modelName | v4[4]))
     || -[NSString isEqual:](modelName, "isEqual:"))
    && ((modelNumber = self->_modelNumber, !((unint64_t)modelNumber | v4[5]))
     || -[NSString isEqual:](modelNumber, "isEqual:"))
    && ((deviceNameElement = self->_deviceNameElement, !((unint64_t)deviceNameElement | v4[2]))
     || -[NSString isEqual:](deviceNameElement, "isEqual:")))
  {
    deviceNameData = self->_deviceNameData;
    if ((unint64_t)deviceNameData | v4[1]) {
      char v10 = -[NSString isEqual:](deviceNameData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_manufacturerElement hash];
  NSUInteger v4 = [(NSString *)self->_modelName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_modelNumber hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceNameElement hash];
  return v6 ^ [(NSString *)self->_deviceNameData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setManufacturerElement:](self, "setManufacturerElement:");
  }
  if (v4[4]) {
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setModelName:](self, "setModelName:");
  }
  if (v4[5]) {
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setModelNumber:](self, "setModelNumber:");
  }
  if (v4[2]) {
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setDeviceNameElement:](self, "setDeviceNameElement:");
  }
  if (v4[1]) {
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setDeviceNameData:](self, "setDeviceNameData:");
  }
}

- (NSString)manufacturerElement
{
  return self->_manufacturerElement;
}

- (void)setManufacturerElement:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)deviceNameElement
{
  return self->_deviceNameElement;
}

- (void)setDeviceNameElement:(id)a3
{
}

- (NSString)deviceNameData
{
  return self->_deviceNameData;
}

- (void)setDeviceNameData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerElement, 0);
  objc_storeStrong((id *)&self->_deviceNameElement, 0);
  objc_storeStrong((id *)&self->_deviceNameData, 0);
}

@end