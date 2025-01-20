@interface PKPassProvisioningMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)localizedSourceDeviceDescription;
- (PKPassProvisioningMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sourceDeviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedSourceDeviceDescription:(id)a3;
- (void)setSourceDeviceType:(unint64_t)a3;
@end

@implementation PKPassProvisioningMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassProvisioningMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassProvisioningMetadata;
  v5 = [(PKPassProvisioningMetadata *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDeviceType"];
    v5->_sourceDeviceType = PKPassProvisioningMetadataSourceDeviceTypeFromString(v6);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSourceDeviceDescription"];
    localizedSourceDeviceDescription = v5->_localizedSourceDeviceDescription;
    v5->_localizedSourceDeviceDescription = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_sourceDeviceType == 1) {
    id v4 = @"transfer";
  }
  else {
    id v4 = @"none";
  }
  id v5 = a3;
  [v5 encodeObject:v4 forKey:@"sourceDeviceType"];
  [v5 encodeObject:self->_localizedSourceDeviceDescription forKey:@"localizedSourceDeviceDescription"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(PKPassProvisioningMetadata);
  v5->_sourceDeviceType = self->_sourceDeviceType;
  uint64_t v6 = [(NSString *)self->_localizedSourceDeviceDescription copyWithZone:a3];
  localizedSourceDeviceDescription = v5->_localizedSourceDeviceDescription;
  v5->_localizedSourceDeviceDescription = (NSString *)v6;

  return v5;
}

- (unint64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (void)setSourceDeviceType:(unint64_t)a3
{
  self->_sourceDeviceType = a3;
}

- (NSString)localizedSourceDeviceDescription
{
  return self->_localizedSourceDeviceDescription;
}

- (void)setLocalizedSourceDeviceDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end