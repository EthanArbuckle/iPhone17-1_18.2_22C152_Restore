@interface SPDiscoveredAccessoryMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)productData;
- (NSString)firmwareVersion;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)protocolVersion;
- (SPDiscoveredAccessoryMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)accessoryCategory;
- (unint64_t)capabilities;
- (unsigned)accessoryCapabilities;
- (unsigned)batteryState;
- (unsigned)batteryType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCapabilities:(unsigned int)a3;
- (void)setAccessoryCategory:(unint64_t)a3;
- (void)setBatteryState:(unsigned __int8)a3;
- (void)setBatteryType:(unsigned __int8)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setProductData:(id)a3;
- (void)setProtocolVersion:(id)a3;
@end

@implementation SPDiscoveredAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPDiscoveredAccessoryMetadata *)self productData];
  v6 = (void *)[v5 copy];
  [v4 setProductData:v6];

  v7 = [(SPDiscoveredAccessoryMetadata *)self manufacturerName];
  v8 = (void *)[v7 copy];
  [v4 setManufacturerName:v8];

  v9 = [(SPDiscoveredAccessoryMetadata *)self modelName];
  v10 = (void *)[v9 copy];
  [v4 setModelName:v10];

  v11 = [(SPDiscoveredAccessoryMetadata *)self firmwareVersion];
  v12 = (void *)[v11 copy];
  [v4 setFirmwareVersion:v12];

  v13 = [(SPDiscoveredAccessoryMetadata *)self protocolVersion];
  v14 = (void *)[v13 copy];
  [v4 setProtocolVersion:v14];

  objc_msgSend(v4, "setAccessoryCategory:", -[SPDiscoveredAccessoryMetadata accessoryCategory](self, "accessoryCategory"));
  objc_msgSend(v4, "setAccessoryCapabilities:", -[SPDiscoveredAccessoryMetadata accessoryCapabilities](self, "accessoryCapabilities"));
  objc_msgSend(v4, "setBatteryType:", -[SPDiscoveredAccessoryMetadata batteryType](self, "batteryType"));
  objc_msgSend(v4, "setBatteryState:", -[SPDiscoveredAccessoryMetadata batteryState](self, "batteryState"));
  objc_msgSend(v4, "setCapabilities:", -[SPDiscoveredAccessoryMetadata capabilities](self, "capabilities"));
  return v4;
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
  id v6 = [NSNumber numberWithUnsignedInteger:self->_capabilities];
  [v5 encodeObject:v6 forKey:@"capabilities"];
}

- (SPDiscoveredAccessoryMetadata)initWithCoder:(id)a3
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
  self->_batteryState = [v4 decodeInt32ForKey:@"batteryState"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];

  self->_capabilities = [v15 unsignedIntegerValue];
  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPDiscoveredAccessoryMetadata *)self manufacturerName];
  id v6 = [(SPDiscoveredAccessoryMetadata *)self modelName];
  v7 = [(SPDiscoveredAccessoryMetadata *)self firmwareVersion];
  v8 = [v3 stringWithFormat:@"<%@: %p manufacturer: %@ model: %@ fwVersion: %@ capabilities: %u>", v4, self, v5, v6, v7, -[SPDiscoveredAccessoryMetadata accessoryCapabilities](self, "accessoryCapabilities")];

  return v8;
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

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
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