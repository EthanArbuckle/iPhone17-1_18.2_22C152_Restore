@interface RMModelDiskManagementSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 restrictions:(id)a4;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (RMModelDiskManagementSettingsDeclaration_Restrictions)payloadRestrictions;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadRestrictions:(id)a3;
@end

@implementation RMModelDiskManagementSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.diskmanagement.settings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Restrictions";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  v2 = objc_opt_new();
  return v2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 restrictions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.diskmanagement.settings"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadRestrictions:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.diskmanagement.settings"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerToken];

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "combineWithOther:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = &unk_2708C1DD0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDAF8];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB10];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = a3;
  v10 = [v9 allKeys];
  long long v11 = [v8 setWithArray:v10];

  long long v12 = +[RMModelDiskManagementSettingsDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  long long v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v15) = a4;
  LOBYTE(self) = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v9 usingKey:@"Restrictions" forKeyPath:@"payloadRestrictions" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v15 error:a5];

  return (char)self;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelDiskManagementSettingsDeclaration *)self payloadRestrictions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __69__RMModelDiskManagementSettingsDeclaration_serializePayloadWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v10 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Restrictions" value:v6 dictSerializer:v9 isRequired:0 defaultValue:0];

  uint64_t v7 = (void *)[v5 copy];
  return v7;
}

uint64_t __69__RMModelDiskManagementSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v7 = [(RMModelDiskManagementSettingsDeclaration *)self payloadRestrictions];
  id v5 = [v4 payloadRestrictions];

  uint64_t v6 = +[RMModelConfigurationBase combineDictionary:v7 other:v5];
  [(RMModelDiskManagementSettingsDeclaration *)self setPayloadRestrictions:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelDiskManagementSettingsDeclaration;
  id v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RMModelDiskManagementSettingsDeclaration_Restrictions *)self->_payloadRestrictions copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (RMModelDiskManagementSettingsDeclaration_Restrictions)payloadRestrictions
{
  return self->_payloadRestrictions;
}

- (void)setPayloadRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end