@interface SPDiscoveredAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isBatteryTooLow;
- (BOOL)isEqual:(id)a3;
- (NSData)macAddress;
- (NSUUID)identifier;
- (SPDiscoveredAccessory)initWithCoder:(id)a3;
- (SPDiscoveredAccessoryMetadata)discoveredMetadata;
- (SPDiscoveredAccessoryProductInformation)productInformation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscoveredMetadata:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsBatteryTooLow:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setProductInformation:(id)a3;
@end

@implementation SPDiscoveredAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPDiscoveredAccessory *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPDiscoveredAccessory *)self identifier];
      v7 = [(SPDiscoveredAccessory *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SPDiscoveredAccessory *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPDiscoveredAccessory *)self identifier];
  v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  v7 = [(SPDiscoveredAccessory *)self macAddress];
  char v8 = (void *)[v7 copy];
  [v4 setMacAddress:v8];

  v9 = [(SPDiscoveredAccessory *)self discoveredMetadata];
  v10 = (void *)[v9 copy];
  [v4 setDiscoveredMetadata:v10];

  v11 = [(SPDiscoveredAccessory *)self productInformation];
  v12 = (void *)[v11 copy];
  [v4 setProductInformation:v12];

  objc_msgSend(v4, "setIsBatteryTooLow:", -[SPDiscoveredAccessory isBatteryTooLow](self, "isBatteryTooLow"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_macAddress forKey:@"macAddress"];
  [v5 encodeObject:self->_discoveredMetadata forKey:@"discoveredMetadata"];
  [v5 encodeObject:self->_productInformation forKey:@"productInformation"];
  [v5 encodeBool:self->_isBatteryTooLow forKey:@"isBatteryTooLow"];
}

- (SPDiscoveredAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"macAddress"];
  macAddress = self->_macAddress;
  self->_macAddress = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveredMetadata"];
  discoveredMetadata = self->_discoveredMetadata;
  self->_discoveredMetadata = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productInformation"];
  productInformation = self->_productInformation;
  self->_productInformation = v11;

  char v13 = [v4 decodeBoolForKey:@"isBatteryTooLow"];
  self->_isBatteryTooLow = v13;
  return self;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPDiscoveredAccessory *)self identifier];
  v6 = [(SPDiscoveredAccessory *)self macAddress];
  v7 = objc_msgSend(v6, "fm_hexString");
  char v8 = [(SPDiscoveredAccessory *)self discoveredMetadata];
  v9 = [(SPDiscoveredAccessory *)self productInformation];
  v10 = [v3 stringWithFormat:@"<%@: %p %@ [%@] %@ %@>", v4, self, v5, v7, v8, v9];

  return v10;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (SPDiscoveredAccessoryMetadata)discoveredMetadata
{
  return self->_discoveredMetadata;
}

- (void)setDiscoveredMetadata:(id)a3
{
}

- (SPDiscoveredAccessoryProductInformation)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
}

- (BOOL)isBatteryTooLow
{
  return self->_isBatteryTooLow;
}

- (void)setIsBatteryTooLow:(BOOL)a3
{
  self->_isBatteryTooLow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_discoveredMetadata, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end