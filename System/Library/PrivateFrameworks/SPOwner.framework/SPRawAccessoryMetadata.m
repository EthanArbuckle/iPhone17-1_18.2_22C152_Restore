@interface SPRawAccessoryMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)accessoryCapabilities;
- (NSData)accessoryCategory;
- (NSData)batteryLevel;
- (NSData)batteryType;
- (NSData)findMyVersion;
- (NSData)firmwareVersion;
- (NSData)manufacturerName;
- (NSData)modelName;
- (NSData)productData;
- (NSData)reserved;
- (SPRawAccessoryMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCapabilities:(id)a3;
- (void)setAccessoryCategory:(id)a3;
- (void)setBatteryLevel:(id)a3;
- (void)setBatteryType:(id)a3;
- (void)setFindMyVersion:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setProductData:(id)a3;
- (void)setReserved:(id)a3;
@end

@implementation SPRawAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SPRawAccessoryMetadata);
  v5 = [(SPRawAccessoryMetadata *)self productData];
  v6 = (void *)[v5 copy];
  [(SPRawAccessoryMetadata *)v4 setProductData:v6];

  v7 = [(SPRawAccessoryMetadata *)self manufacturerName];
  v8 = (void *)[v7 copy];
  [(SPRawAccessoryMetadata *)v4 setManufacturerName:v8];

  v9 = [(SPRawAccessoryMetadata *)self modelName];
  v10 = (void *)[v9 copy];
  [(SPRawAccessoryMetadata *)v4 setModelName:v10];

  v11 = [(SPRawAccessoryMetadata *)self reserved];
  v12 = (void *)[v11 copy];
  [(SPRawAccessoryMetadata *)v4 setReserved:v12];

  v13 = [(SPRawAccessoryMetadata *)self accessoryCategory];
  v14 = (void *)[v13 copy];
  [(SPRawAccessoryMetadata *)v4 setAccessoryCategory:v14];

  v15 = [(SPRawAccessoryMetadata *)self accessoryCapabilities];
  v16 = (void *)[v15 copy];
  [(SPRawAccessoryMetadata *)v4 setAccessoryCapabilities:v16];

  v17 = [(SPRawAccessoryMetadata *)self firmwareVersion];
  v18 = (void *)[v17 copy];
  [(SPRawAccessoryMetadata *)v4 setFirmwareVersion:v18];

  v19 = [(SPRawAccessoryMetadata *)self findMyVersion];
  v20 = (void *)[v19 copy];
  [(SPRawAccessoryMetadata *)v4 setFindMyVersion:v20];

  v21 = [(SPRawAccessoryMetadata *)self batteryType];
  v22 = (void *)[v21 copy];
  [(SPRawAccessoryMetadata *)v4 setBatteryType:v22];

  v23 = [(SPRawAccessoryMetadata *)self batteryLevel];
  v24 = (void *)[v23 copy];
  [(SPRawAccessoryMetadata *)v4 setBatteryLevel:v24];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  productData = self->_productData;
  id v5 = a3;
  [v5 encodeObject:productData forKey:@"productData"];
  [v5 encodeObject:self->_manufacturerName forKey:@"manufacturerName"];
  [v5 encodeObject:self->_modelName forKey:@"modelName"];
  [v5 encodeObject:self->_reserved forKey:@"reserved"];
  [v5 encodeObject:self->_accessoryCategory forKey:@"accessoryCategory"];
  [v5 encodeObject:self->_accessoryCapabilities forKey:@"accessoryCapabilities"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"firmwareVersion"];
  [v5 encodeObject:self->_findMyVersion forKey:@"findMyVersion"];
  [v5 encodeObject:self->_batteryType forKey:@"batteryType"];
  [v5 encodeObject:self->_batteryLevel forKey:@"batteryLevel"];
}

- (SPRawAccessoryMetadata)initWithCoder:(id)a3
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

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reserved"];
  reserved = self->_reserved;
  self->_reserved = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryCategory"];
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryCapabilities"];
  accessoryCapabilities = self->_accessoryCapabilities;
  self->_accessoryCapabilities = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findMyVersion"];
  findMyVersion = self->_findMyVersion;
  self->_findMyVersion = v19;

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryType"];
  batteryType = self->_batteryType;
  self->_batteryType = v21;

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLevel"];

  batteryLevel = self->_batteryLevel;
  self->_batteryLevel = v23;

  return self;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
}

- (NSData)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSData)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSData)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
}

- (NSData)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSData)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(id)a3
{
}

- (NSData)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSData)findMyVersion
{
  return self->_findMyVersion;
}

- (void)setFindMyVersion:(id)a3
{
}

- (NSData)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(id)a3
{
}

- (NSData)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_batteryType, 0);
  objc_storeStrong((id *)&self->_findMyVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_accessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);

  objc_storeStrong((id *)&self->_productData, 0);
}

@end