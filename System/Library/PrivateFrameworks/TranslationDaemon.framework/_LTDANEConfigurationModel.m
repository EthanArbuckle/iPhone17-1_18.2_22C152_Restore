@interface _LTDANEConfigurationModel
- (NSDictionary)capabilities;
- (NSDictionary)root;
- (NSString)config;
- (_LTDANEConfigurationModel)initWithDictionary:(id)a3;
- (id)debugDescription;
- (id)subTypes;
- (int64_t)capabilityForSubType:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setRoot:(id)a3;
@end

@implementation _LTDANEConfigurationModel

- (_LTDANEConfigurationModel)initWithDictionary:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTDANEConfigurationModel;
  v6 = [(_LTDANEConfigurationModel *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_root, a3);
    v8 = [(NSDictionary *)v7->_root objectForKeyedSubscript:@"FamilyCapability"];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = v8;
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (char v12 = [(NSDictionary *)v11 lt_ensureTypesForKeys:v9 values:v10],
          v13 = v11,
          (v12 & 1) == 0))
    {

      v13 = (NSDictionary *)MEMORY[0x263EFFA78];
    }

    capabilities = v7->_capabilities;
    v7->_capabilities = v13;

    v15 = v7;
  }

  return v7;
}

- (int64_t)capabilityForSubType:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_capabilities objectForKeyedSubscript:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(NSDictionary *)self->_capabilities objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = v6;
  int64_t v8 = [v6 integerValue];

  return v8;
}

- (id)subTypes
{
  return [(NSDictionary *)self->_capabilities allKeys];
}

- (id)debugDescription
{
  return (id)[(NSDictionary *)self->_root debugDescription];
}

- (NSString)config
{
  return self->_config;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end