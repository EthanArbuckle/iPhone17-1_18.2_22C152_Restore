@interface AWDWAAssociatedAPInfo
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
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeviceNameData:(id)a3;
- (void)setDeviceNameElement:(id)a3;
- (void)setManufacturerElement:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWAAssociatedAPInfo

- (void)dealloc
{
  [(AWDWAAssociatedAPInfo *)self setManufacturerElement:0];
  [(AWDWAAssociatedAPInfo *)self setModelName:0];
  [(AWDWAAssociatedAPInfo *)self setModelNumber:0];
  [(AWDWAAssociatedAPInfo *)self setDeviceNameElement:0];
  [(AWDWAAssociatedAPInfo *)self setDeviceNameData:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWAAssociatedAPInfo;
  [(AWDWAAssociatedAPInfo *)&v3 dealloc];
}

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
  v3.receiver = self;
  v3.super_class = (Class)AWDWAAssociatedAPInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWAAssociatedAPInfo description](&v3, sel_description), -[AWDWAAssociatedAPInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
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
  return AWDWAAssociatedAPInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_manufacturerElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceNameElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceNameData)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_manufacturerElement) {
    [a3 setManufacturerElement:];
  }
  if (self->_modelName) {
    [a3 setModelName:];
  }
  if (self->_modelNumber) {
    [a3 setModelNumber:];
  }
  if (self->_deviceNameElement) {
    [a3 setDeviceNameElement:];
  }
  if (self->_deviceNameData)
  {
    [a3 setDeviceNameData:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_opt_class() allocWithZone:a3];

  v5[3] = (id)[(NSString *)self->_manufacturerElement copyWithZone:a3];
  v5[4] = (id)[(NSString *)self->_modelName copyWithZone:a3];

  v5[5] = (id)[(NSString *)self->_modelNumber copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_deviceNameElement copyWithZone:a3];

  v5[1] = (id)[(NSString *)self->_deviceNameData copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    manufacturerElement = self->_manufacturerElement;
    if (!((unint64_t)manufacturerElement | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](manufacturerElement, "isEqual:")) != 0)
    {
      modelName = self->_modelName;
      if (!((unint64_t)modelName | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](modelName, "isEqual:")) != 0)
      {
        modelNumber = self->_modelNumber;
        if (!((unint64_t)modelNumber | *((void *)a3 + 5))
          || (int v5 = -[NSString isEqual:](modelNumber, "isEqual:")) != 0)
        {
          deviceNameElement = self->_deviceNameElement;
          if (!((unint64_t)deviceNameElement | *((void *)a3 + 2))
            || (int v5 = -[NSString isEqual:](deviceNameElement, "isEqual:")) != 0)
          {
            deviceNameData = self->_deviceNameData;
            if ((unint64_t)deviceNameData | *((void *)a3 + 1))
            {
              LOBYTE(v5) = -[NSString isEqual:](deviceNameData, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
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
  if (*((void *)a3 + 3)) {
    -[AWDWAAssociatedAPInfo setManufacturerElement:](self, "setManufacturerElement:");
  }
  if (*((void *)a3 + 4)) {
    -[AWDWAAssociatedAPInfo setModelName:](self, "setModelName:");
  }
  if (*((void *)a3 + 5)) {
    -[AWDWAAssociatedAPInfo setModelNumber:](self, "setModelNumber:");
  }
  if (*((void *)a3 + 2)) {
    -[AWDWAAssociatedAPInfo setDeviceNameElement:](self, "setDeviceNameElement:");
  }
  if (*((void *)a3 + 1))
  {
    -[AWDWAAssociatedAPInfo setDeviceNameData:](self, "setDeviceNameData:");
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

@end