@interface RMModelDiskManagementSettingsDeclaration_Restrictions
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithExternalStorage:(id)a3 networkStorage:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadExternalStorage;
- (NSString)payloadNetworkStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadExternalStorage:(id)a3;
- (void)setPayloadNetworkStorage:(id)a3;
@end

@implementation RMModelDiskManagementSettingsDeclaration_Restrictions

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ExternalStorage";
  v6[1] = @"NetworkStorage";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithExternalStorage:(id)a3 networkStorage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadExternalStorage:v6];

  [v7 setPayloadNetworkStorage:v5];
  return v7;
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
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelDiskManagementSettingsDeclaration_Restrictions allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ExternalStorage" forKeyPath:@"payloadExternalStorage" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"NetworkStorage" forKeyPath:@"payloadNetworkStorage" isRequired:0 defaultValue:0 error:a5];
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self payloadExternalStorage];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ExternalStorage" value:v5 isRequired:0 defaultValue:0];

  id v6 = [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self payloadNetworkStorage];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"NetworkStorage" value:v6 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (void)combineWithOther:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self payloadExternalStorage];
  id v6 = [v4 payloadExternalStorage];
  v14[0] = @"Allowed";
  v14[1] = @"ReadOnly";
  v14[2] = @"Disallowed";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  v8 = +[RMModelConfigurationBase combineEnumLast:v5 other:v6 enums:v7];
  [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self setPayloadExternalStorage:v8];

  v9 = [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self payloadNetworkStorage];
  v10 = [v4 payloadNetworkStorage];

  v13[0] = @"Allowed";
  v13[1] = @"ReadOnly";
  v13[2] = @"Disallowed";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  v12 = +[RMModelConfigurationBase combineEnumLast:v9 other:v10 enums:v11];
  [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self setPayloadNetworkStorage:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelDiskManagementSettingsDeclaration_Restrictions;
  id v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadExternalStorage copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadNetworkStorage copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadExternalStorage
{
  return self->_payloadExternalStorage;
}

- (void)setPayloadExternalStorage:(id)a3
{
}

- (NSString)payloadNetworkStorage
{
  return self->_payloadNetworkStorage;
}

- (void)setPayloadNetworkStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNetworkStorage, 0);
  objc_storeStrong((id *)&self->_payloadExternalStorage, 0);
}

@end