@interface MBSBackupAttributes
- (BOOL)hasDeviceClass;
- (BOOL)hasDeviceColor;
- (BOOL)hasDeviceEnclosureColor;
- (BOOL)hasHardwareModel;
- (BOOL)hasMarketingName;
- (BOOL)hasProductType;
- (BOOL)hasSerialNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)hardwareModel;
- (NSString)marketingName;
- (NSString)productType;
- (NSString)serialNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setMarketingName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSBackupAttributes

- (void)dealloc
{
  [(MBSBackupAttributes *)self setDeviceClass:0];
  [(MBSBackupAttributes *)self setProductType:0];
  [(MBSBackupAttributes *)self setSerialNumber:0];
  [(MBSBackupAttributes *)self setDeviceColor:0];
  [(MBSBackupAttributes *)self setHardwareModel:0];
  [(MBSBackupAttributes *)self setMarketingName:0];
  [(MBSBackupAttributes *)self setDeviceEnclosureColor:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSBackupAttributes;
  [(MBSBackupAttributes *)&v3 dealloc];
}

- (BOOL)hasDeviceClass
{
  return self->_deviceClass != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0;
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (BOOL)hasMarketingName
{
  return self->_marketingName != 0;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSBackupAttributes;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSBackupAttributes *)&v3 description], [(MBSBackupAttributes *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  deviceClass = self->_deviceClass;
  if (deviceClass) {
    [v3 setObject:deviceClass forKey:@"deviceClass"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKey:@"serialNumber"];
  }
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v4 setObject:deviceColor forKey:@"deviceColor"];
  }
  hardwareModel = self->_hardwareModel;
  if (hardwareModel) {
    [v4 setObject:hardwareModel forKey:@"hardwareModel"];
  }
  marketingName = self->_marketingName;
  if (marketingName) {
    [v4 setObject:marketingName forKey:@"marketingName"];
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor) {
    [v4 setObject:deviceEnclosureColor forKey:@"deviceEnclosureColor"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000104D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_productType) {
    PBDataWriterWriteStringField();
  }
  if (self->_serialNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_marketingName) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceEnclosureColor)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_deviceClass) {
    [a3 setDeviceClass:];
  }
  if (self->_productType) {
    [a3 setProductType:];
  }
  if (self->_serialNumber) {
    [a3 setSerialNumber:];
  }
  if (self->_deviceColor) {
    [a3 setDeviceColor:];
  }
  if (self->_hardwareModel) {
    [a3 setHardwareModel:];
  }
  if (self->_marketingName) {
    [a3 setMarketingName:];
  }
  if (self->_deviceEnclosureColor)
  {
    [a3 setDeviceEnclosureColor:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[1] = [(NSString *)self->_deviceClass copyWithZone:a3];
  v5[6] = [(NSString *)self->_productType copyWithZone:a3];

  v5[7] = [(NSString *)self->_serialNumber copyWithZone:a3];
  v5[2] = [(NSString *)self->_deviceColor copyWithZone:a3];

  v5[4] = [(NSString *)self->_hardwareModel copyWithZone:a3];
  v5[5] = [(NSString *)self->_marketingName copyWithZone:a3];

  v5[3] = [(NSString *)self->_deviceEnclosureColor copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    deviceClass = self->_deviceClass;
    if (!((unint64_t)deviceClass | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSString isEqual:](deviceClass, "isEqual:")) != 0)
    {
      productType = self->_productType;
      if (!((unint64_t)productType | *((void *)a3 + 6))
        || (unsigned int v5 = -[NSString isEqual:](productType, "isEqual:")) != 0)
      {
        serialNumber = self->_serialNumber;
        if (!((unint64_t)serialNumber | *((void *)a3 + 7))
          || (unsigned int v5 = -[NSString isEqual:](serialNumber, "isEqual:")) != 0)
        {
          deviceColor = self->_deviceColor;
          if (!((unint64_t)deviceColor | *((void *)a3 + 2))
            || (unsigned int v5 = -[NSString isEqual:](deviceColor, "isEqual:")) != 0)
          {
            hardwareModel = self->_hardwareModel;
            if (!((unint64_t)hardwareModel | *((void *)a3 + 4))
              || (unsigned int v5 = -[NSString isEqual:](hardwareModel, "isEqual:")) != 0)
            {
              marketingName = self->_marketingName;
              if (!((unint64_t)marketingName | *((void *)a3 + 5))
                || (unsigned int v5 = -[NSString isEqual:](marketingName, "isEqual:")) != 0)
              {
                deviceEnclosureColor = self->_deviceEnclosureColor;
                if ((unint64_t)deviceEnclosureColor | *((void *)a3 + 3))
                {
                  LOBYTE(v5) = -[NSString isEqual:](deviceEnclosureColor, "isEqual:");
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
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceClass hash];
  unint64_t v4 = [(NSString *)self->_productType hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_serialNumber hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_deviceColor hash];
  NSUInteger v7 = [(NSString *)self->_hardwareModel hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_marketingName hash];
  return v6 ^ v8 ^ [(NSString *)self->_deviceEnclosureColor hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSBackupAttributes setDeviceClass:](self, "setDeviceClass:");
  }
  if (*((void *)a3 + 6)) {
    -[MBSBackupAttributes setProductType:](self, "setProductType:");
  }
  if (*((void *)a3 + 7)) {
    -[MBSBackupAttributes setSerialNumber:](self, "setSerialNumber:");
  }
  if (*((void *)a3 + 2)) {
    -[MBSBackupAttributes setDeviceColor:](self, "setDeviceColor:");
  }
  if (*((void *)a3 + 4)) {
    -[MBSBackupAttributes setHardwareModel:](self, "setHardwareModel:");
  }
  if (*((void *)a3 + 5)) {
    -[MBSBackupAttributes setMarketingName:](self, "setMarketingName:");
  }
  if (*((void *)a3 + 3))
  {
    -[MBSBackupAttributes setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
  }
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

@end