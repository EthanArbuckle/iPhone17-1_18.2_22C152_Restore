@interface PKPassIngestionProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCustomizedSettings;
- (PKPassIngestionProperties)initWithCoder:(id)a3;
- (PKPassProvisioningMetadata)provisioningMetadata;
- (unint64_t)settings;
- (void)encodeWithCoder:(id)a3;
- (void)setHasCustomizedSettings:(BOOL)a3;
- (void)setProvisioningMetadata:(id)a3;
- (void)setSettings:(unint64_t)a3;
@end

@implementation PKPassIngestionProperties

- (void)setHasCustomizedSettings:(BOOL)a3
{
  if (((!self->_hasCustomizedSettings ^ a3) & 1) == 0)
  {
    self->_hasCustomizedSettings = a3;
    if (!a3) {
      self->_settings = 0;
    }
  }
}

- (void)setSettings:(unint64_t)a3
{
  if (self->_settings != a3)
  {
    self->_settings = a3;
    self->_hasCustomizedSettings = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassIngestionProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassIngestionProperties;
  v5 = [(PKPassIngestionProperties *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningMetadata"];
    provisioningMetadata = v5->_provisioningMetadata;
    v5->_provisioningMetadata = (PKPassProvisioningMetadata *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasCustomizedSettings"];
    v5->_hasCustomizedSettings = [v8 BOOLValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settings"];
    v5->_settings = [v9 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  provisioningMetadata = self->_provisioningMetadata;
  id v5 = a3;
  [v5 encodeObject:provisioningMetadata forKey:@"provisioningMetadata"];
  uint64_t v6 = [NSNumber numberWithBool:self->_hasCustomizedSettings];
  [v5 encodeObject:v6 forKey:@"hasCustomizedSettings"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_settings];
  [v5 encodeObject:v7 forKey:@"settings"];
}

- (PKPassProvisioningMetadata)provisioningMetadata
{
  return self->_provisioningMetadata;
}

- (void)setProvisioningMetadata:(id)a3
{
}

- (BOOL)hasCustomizedSettings
{
  return self->_hasCustomizedSettings;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end