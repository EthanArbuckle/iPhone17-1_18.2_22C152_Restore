@interface RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithActivations:(id)a3 assets:(id)a4 configurations:(id)a5 management:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusActivations;
- (NSArray)statusAssets;
- (NSArray)statusConfigurations;
- (NSArray)statusManagement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusActivations:(id)a3;
- (void)setStatusAssets:(id)a3;
- (void)setStatusConfigurations:(id)a3;
- (void)setStatusManagement:(id)a3;
@end

@implementation RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations

+ (NSSet)allowedStatusKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"activations";
  v6[1] = @"assets";
  v6[2] = @"configurations";
  v6[3] = @"management";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithActivations:(id)a3 assets:(id)a4 configurations:(id)a5 management:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setStatusActivations:v12];

  [v13 setStatusAssets:v11];
  [v13 setStatusConfigurations:v10];

  [v13 setStatusManagement:v9];
  return v13;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations allowedStatusKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"activations" forKeyPath:@"statusActivations" validator:&__block_literal_global_166_0 isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"assets" forKeyPath:@"statusAssets" validator:&__block_literal_global_171 isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"configurations" forKeyPath:@"statusConfigurations" validator:&__block_literal_global_176 isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"management" forKeyPath:@"statusManagement" validator:&__block_literal_global_181 isRequired:0 defaultValue:0 error:a5];
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations *)self statusActivations];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"activations" value:v5 itemSerializer:&__block_literal_global_183 isRequired:0 defaultValue:0];

  v6 = [(RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations *)self statusAssets];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"assets" value:v6 itemSerializer:&__block_literal_global_185 isRequired:0 defaultValue:0];

  id v7 = [(RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations *)self statusConfigurations];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"configurations" value:v7 itemSerializer:&__block_literal_global_187 isRequired:0 defaultValue:0];

  v8 = [(RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations *)self statusManagement];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"management" value:v8 itemSerializer:&__block_literal_global_189 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_statusActivations copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_statusAssets copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_statusConfigurations copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_statusManagement copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)statusActivations
{
  return self->_statusActivations;
}

- (void)setStatusActivations:(id)a3
{
}

- (NSArray)statusAssets
{
  return self->_statusAssets;
}

- (void)setStatusAssets:(id)a3
{
}

- (NSArray)statusConfigurations
{
  return self->_statusConfigurations;
}

- (void)setStatusConfigurations:(id)a3
{
}

- (NSArray)statusManagement
{
  return self->_statusManagement;
}

- (void)setStatusManagement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusManagement, 0);
  objc_storeStrong((id *)&self->_statusConfigurations, 0);
  objc_storeStrong((id *)&self->_statusAssets, 0);
  objc_storeStrong((id *)&self->_statusActivations, 0);
}

@end