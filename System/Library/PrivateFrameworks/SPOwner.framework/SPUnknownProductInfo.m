@interface SPUnknownProductInfo
+ (BOOL)supportsSecureCoding;
- (NSString)manufacturerName;
- (NSString)modelName;
- (SPUnknownProductInfo)initWithCoder:(id)a3;
- (SPUnknownProductMetadata)disableMetadata;
- (SPUnknownProductMetadata)learnModeMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)capabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setDisableMetadata:(id)a3;
- (void)setLearnModeMetadata:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
@end

@implementation SPUnknownProductInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPUnknownProductInfo *)self modelName];
  v6 = (void *)[v5 copy];
  [v4 setModelName:v6];

  v7 = [(SPUnknownProductInfo *)self manufacturerName];
  v8 = (void *)[v7 copy];
  [v4 setManufacturerName:v8];

  v9 = [(SPUnknownProductInfo *)self learnModeMetadata];
  v10 = (void *)[v9 copy];
  [v4 setLearnModeMetadata:v10];

  v11 = [(SPUnknownProductInfo *)self disableMetadata];
  v12 = (void *)[v11 copy];
  [v4 setDisableMetadata:v12];

  objc_msgSend(v4, "setCapabilities:", -[SPUnknownProductInfo capabilities](self, "capabilities"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  modelName = self->_modelName;
  id v5 = a3;
  [v5 encodeObject:modelName forKey:@"modelName"];
  [v5 encodeObject:self->_manufacturerName forKey:@"manufacturerName"];
  [v5 encodeObject:self->_learnModeMetadata forKey:@"learnModeMetadata"];
  [v5 encodeObject:self->_disableMetadata forKey:@"disableMetadata"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_capabilities];
  [v5 encodeObject:v6 forKey:@"capabilities"];
}

- (SPUnknownProductInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
  modelName = self->_modelName;
  self->_modelName = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerName"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learnModeMetadata"];
  learnModeMetadata = self->_learnModeMetadata;
  self->_learnModeMetadata = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableMetadata"];
  disableMetadata = self->_disableMetadata;
  self->_disableMetadata = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];

  self->_capabilities = [v13 unsignedIntegerValue];
  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPUnknownProductInfo *)self manufacturerName];
  id v6 = [(SPUnknownProductInfo *)self modelName];
  v7 = [v3 stringWithFormat:@"<%@: %p manufacturer: %@ model: %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (SPUnknownProductMetadata)learnModeMetadata
{
  return self->_learnModeMetadata;
}

- (void)setLearnModeMetadata:(id)a3
{
}

- (SPUnknownProductMetadata)disableMetadata
{
  return self->_disableMetadata;
}

- (void)setDisableMetadata:(id)a3
{
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
  objc_storeStrong((id *)&self->_disableMetadata, 0);
  objc_storeStrong((id *)&self->_learnModeMetadata, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);

  objc_storeStrong((id *)&self->_modelName, 0);
}

@end