@interface PKBarcodeEventConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (NSData)configurationData;
- (NSString)deviceAccountIdentifier;
- (PKBarcodeEventConfigurationDataType)configurationDataType;
- (PKBarcodeEventConfigurationRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setConfigurationDataType:(int64_t)a3;
- (void)setDeviceAccountIdentifier:(id)a3;
@end

@implementation PKBarcodeEventConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  configurationData = self->_configurationData;
  id v5 = a3;
  [v5 encodeObject:configurationData forKey:@"configurationData"];
  [v5 encodeInteger:self->_configurationDataType forKey:@"configurationDataType"];
  [v5 encodeObject:self->_deviceAccountIdentifier forKey:@"deviceAccountIdentifier"];
}

- (PKBarcodeEventConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodeEventConfigurationRequest;
  id v5 = [(PKBarcodeEventConfigurationRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationData"];
    configurationData = v5->_configurationData;
    v5->_configurationData = (NSData *)v6;

    v5->_configurationDataType = [v4 decodeIntegerForKey:@"configurationDataType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAccountIdentifier"];
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t configurationDataType = self->_configurationDataType;
  if (configurationDataType > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E56E3098[configurationDataType];
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; deviceAccountIdentifier: %@, configurationDataType: %@, configurationData: %tu bytes>",
               v4,
               self,
               self->_deviceAccountIdentifier,
               v6,
               [(NSData *)self->_configurationData length]);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
}

- (PKBarcodeEventConfigurationDataType)configurationDataType
{
  return self->_configurationDataType;
}

- (void)setConfigurationDataType:(int64_t)a3
{
  self->_unint64_t configurationDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end