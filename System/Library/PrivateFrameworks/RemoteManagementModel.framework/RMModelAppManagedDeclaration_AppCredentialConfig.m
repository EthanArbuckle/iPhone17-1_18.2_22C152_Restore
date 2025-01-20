@interface RMModelAppManagedDeclaration_AppCredentialConfig
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithAppIdentifier:(id)a3 assetReference:(id)a4;
+ (id)buildWithAppIdentifier:(id)a3 assetReference:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadAppIdentifier;
- (NSString)payloadAssetReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAppIdentifier:(id)a3;
- (void)setPayloadAssetReference:(id)a3;
@end

@implementation RMModelAppManagedDeclaration_AppCredentialConfig

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AppIdentifier";
  v6[1] = @"AssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAppIdentifier:(id)a3 assetReference:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadAppIdentifier:v6];

  [v7 setPayloadAssetReference:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithAppIdentifier:(id)a3 assetReference:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadAppIdentifier:v6];

  [v7 setPayloadAssetReference:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAppManagedDeclaration_AppCredentialConfig allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AppIdentifier" forKeyPath:@"payloadAppIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AssetReference" forKeyPath:@"payloadAssetReference" isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelAppManagedDeclaration_AppCredentialConfig *)self payloadAppIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AppIdentifier" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelAppManagedDeclaration_AppCredentialConfig *)self payloadAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AssetReference" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelAppManagedDeclaration_AppCredentialConfig;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAppIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAssetReference copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadAppIdentifier
{
  return self->_payloadAppIdentifier;
}

- (void)setPayloadAppIdentifier:(id)a3
{
}

- (NSString)payloadAssetReference
{
  return self->_payloadAssetReference;
}

- (void)setPayloadAssetReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAppIdentifier, 0);
}

@end