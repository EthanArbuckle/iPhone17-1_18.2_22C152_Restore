@interface RMModelManagementStatusSubscriptionsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 statusItems:(id)a4;
+ (id)buildWithIdentifier:(id)a3 statusItems:(id)a4;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadStatusItems;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadStatusItems:(id)a3;
@end

@implementation RMModelManagementStatusSubscriptionsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.management.status-subscriptions";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"StatusItems";
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

+ (id)buildWithIdentifier:(id)a3 statusItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.management.status-subscriptions"];
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
  [v7 setPayloadStatusItems:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 statusItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.management.status-subscriptions"];
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
  [v7 setPayloadStatusItems:v6];

  [v7 updateServerToken];
  return v7;
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
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C20D0;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE068];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE080];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C20E8;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE098];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE0B0];
  v26[1] = v17;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C2118;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE0C8];
  v25[0] = v15;
  long long v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE0E0];
  v25[1] = v14;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C2100;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE0F8];
  v24[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE110];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C2130;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE128];
  v23[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE140];
  v23[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C2148;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE158];
  v22[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE170];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = a3;
  v10 = [v9 allKeys];
  long long v11 = [v8 setWithArray:v10];

  long long v12 = +[RMModelManagementStatusSubscriptionsDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  long long v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v15) = a4;
  LOBYTE(self) = [(RMModelPayloadBase *)self loadArrayFromDictionary:v9 usingKey:@"StatusItems" forKeyPath:@"payloadStatusItems" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v15 error:a5];

  return (char)self;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelManagementStatusSubscriptionsDeclaration *)self payloadStatusItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__RMModelManagementStatusSubscriptionsDeclaration_serializePayloadWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e82___NSDictionary_16__0__RMModelManagementStatusSubscriptionsDeclaration_StatusItem_8l;
  signed __int16 v10 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"StatusItems" value:v6 itemSerializer:v9 isRequired:1 defaultValue:0];

  uint64_t v7 = (void *)[v5 copy];
  return v7;
}

uint64_t __76__RMModelManagementStatusSubscriptionsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v7 = [(RMModelManagementStatusSubscriptionsDeclaration *)self payloadStatusItems];
  id v5 = [v4 payloadStatusItems];

  uint64_t v6 = +[RMModelConfigurationBase combineSetUnion:v7 other:v5];
  [(RMModelManagementStatusSubscriptionsDeclaration *)self setPayloadStatusItems:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelManagementStatusSubscriptionsDeclaration;
  id v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadStatusItems copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (NSArray)payloadStatusItems
{
  return self->_payloadStatusItems;
}

- (void)setPayloadStatusItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end