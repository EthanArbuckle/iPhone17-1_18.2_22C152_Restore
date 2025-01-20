@interface SPAccessoryInformation
+ (BOOL)supportsSecureCoding;
- (NSData)productData;
- (NSString)firmwareVersion;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)protocolVersion;
- (SPAccessoryInformation)initWithCoder:(id)a3;
- (SPAccessoryInformation)initWithProductData:(id)a3 manufacturerName:(id)a4 modelName:(id)a5 firmwareVersion:(id)a6 protocolVersion:(id)a7 accessoryCategory:(unint64_t)a8 accessoryCapabilities:(unsigned int)a9 batteryType:(unsigned __int8)a10 batteryState:(unsigned __int8)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)accessoryCategory;
- (unsigned)accessoryCapabilities;
- (unsigned)batteryState;
- (unsigned)batteryType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCapabilities:(unsigned int)a3;
- (void)setAccessoryCategory:(unint64_t)a3;
- (void)setBatteryState:(unsigned __int8)a3;
- (void)setBatteryType:(unsigned __int8)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setProductData:(id)a3;
- (void)setProtocolVersion:(id)a3;
@end

@implementation SPAccessoryInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryInformation)initWithProductData:(id)a3 manufacturerName:(id)a4 modelName:(id)a5 firmwareVersion:(id)a6 protocolVersion:(id)a7 accessoryCategory:(unint64_t)a8 accessoryCapabilities:(unsigned int)a9 batteryType:(unsigned __int8)a10 batteryState:(unsigned __int8)a11
{
  id v18 = a3;
  id v19 = a4;
  id v25 = a5;
  id v24 = a6;
  id v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SPAccessoryInformation;
  v21 = [(SPAccessoryInformation *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_productData, a3);
    objc_storeStrong((id *)&v22->_manufacturerName, a4);
    objc_storeStrong((id *)&v22->_modelName, a5);
    objc_storeStrong((id *)&v22->_firmwareVersion, a6);
    objc_storeStrong((id *)&v22->_protocolVersion, a7);
    v22->_accessoryCategory = a8;
    v22->_accessoryCapabilities = a9;
    v22->_batteryType = a10;
    v22->_batteryState = a11;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAccessoryInformation alloc];
  WORD2(v6) = *(_WORD *)&self->_batteryType;
  LODWORD(v6) = self->_accessoryCapabilities;
  return -[SPAccessoryInformation initWithProductData:manufacturerName:modelName:firmwareVersion:protocolVersion:accessoryCategory:accessoryCapabilities:batteryType:batteryState:](v4, "initWithProductData:manufacturerName:modelName:firmwareVersion:protocolVersion:accessoryCategory:accessoryCapabilities:batteryType:batteryState:", self->_productData, self->_manufacturerName, self->_modelName, self->_firmwareVersion, self->_protocolVersion, self->_accessoryCategory, v6);
}

- (void)encodeWithCoder:(id)a3
{
  productData = self->_productData;
  id v5 = a3;
  [v5 encodeObject:productData forKey:@"productData"];
  [v5 encodeObject:self->_manufacturerName forKey:@"manufacturerName"];
  [v5 encodeObject:self->_modelName forKey:@"modelName"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"firmwareVersion"];
  [v5 encodeObject:self->_protocolVersion forKey:@"protocolVersion"];
  [v5 encodeInt64:self->_accessoryCategory forKey:@"accessoryCategory"];
  [v5 encodeInt32:self->_accessoryCapabilities forKey:@"accessoryCapabilities"];
  [v5 encodeInt32:self->_batteryType forKey:@"batteryType"];
  [v5 encodeInt32:self->_batteryState forKey:@"batteryState"];
}

- (SPAccessoryInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productData"];
  productData = self->_productData;
  self->_productData = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerName"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
  modelName = self->_modelName;
  self->_modelName = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protocolVersion"];
  protocolVersion = self->_protocolVersion;
  self->_protocolVersion = v13;

  self->_accessoryCategory = [v4 decodeInt64ForKey:@"accessoryCategory"];
  self->_accessoryCapabilities = [v4 decodeInt32ForKey:@"accessoryCapabilities"];
  self->_batteryType = [v4 decodeInt32ForKey:@"batteryType"];
  unsigned __int8 v15 = [v4 decodeInt32ForKey:@"batteryState"];

  self->_batteryState = v15;
  return self;
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (unint64_t)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(unint64_t)a3
{
  self->_accessoryCategory = a3;
}

- (unsigned)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(unsigned int)a3
{
  self->_accessoryCapabilities = a3;
}

- (unsigned)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(unsigned __int8)a3
{
  self->_batteryType = a3;
}

- (unsigned)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(unsigned __int8)a3
{
  self->_batteryState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);

  objc_storeStrong((id *)&self->_productData, 0);
}

@end