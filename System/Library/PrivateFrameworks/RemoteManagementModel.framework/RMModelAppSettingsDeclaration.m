@interface RMModelAppSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 marketplaces:(id)a4;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (RMModelAppSettingsDeclaration_Marketplaces)payloadMarketplaces;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadMarketplaces:(id)a3;
@end

@implementation RMModelAppSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.app.settings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Marketplaces";
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

+ (id)buildWithIdentifier:(id)a3 marketplaces:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.app.settings"];
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
  [v7 setPayloadMarketplaces:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.app.settings"];
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
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = &unk_2708C1980;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD270];
  v13[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD288];
  v13[1] = v3;
  v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD2A0];
  v13[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  v14[1] = &unk_2708C19C8;
  v15[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD2B8];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD2D0];
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD2E8];
  v12[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  v15[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = a3;
  v10 = [v9 allKeys];
  long long v11 = [v8 setWithArray:v10];

  long long v12 = +[RMModelAppSettingsDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  long long v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v15) = a4;
  LOBYTE(self) = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v9 usingKey:@"Marketplaces" forKeyPath:@"payloadMarketplaces" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v15 error:a5];

  return (char)self;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelAppSettingsDeclaration *)self payloadMarketplaces];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__RMModelAppSettingsDeclaration_serializePayloadWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v10 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Marketplaces" value:v6 dictSerializer:v9 isRequired:0 defaultValue:0];

  uint64_t v7 = (void *)[v5 copy];
  return v7;
}

uint64_t __58__RMModelAppSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v7 = [(RMModelAppSettingsDeclaration *)self payloadMarketplaces];
  id v5 = [v4 payloadMarketplaces];

  uint64_t v6 = +[RMModelConfigurationBase combineDictionary:v7 other:v5];
  [(RMModelAppSettingsDeclaration *)self setPayloadMarketplaces:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelAppSettingsDeclaration;
  id v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RMModelAppSettingsDeclaration_Marketplaces *)self->_payloadMarketplaces copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (RMModelAppSettingsDeclaration_Marketplaces)payloadMarketplaces
{
  return self->_payloadMarketplaces;
}

- (void)setPayloadMarketplaces:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __89__RMModelAppSettingsDeclaration_Marketplaces_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __89__RMModelAppSettingsDeclaration_Marketplaces_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __64__RMModelAppSettingsDeclaration_Marketplaces_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __64__RMModelAppSettingsDeclaration_Marketplaces_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

@end