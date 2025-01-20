@interface RMModelStatusManagementDeclarations
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6;
+ (id)buildWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusActivations;
- (NSArray)statusAssets;
- (NSArray)statusConfigurations;
- (NSArray)statusManagement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusActivations:(id)a3;
- (void)setStatusAssets:(id)a3;
- (void)setStatusConfigurations:(id)a3;
- (void)setStatusManagement:(id)a3;
@end

@implementation RMModelStatusManagementDeclarations

+ (NSSet)allowedStatusKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"activations";
  v6[1] = @"configurations";
  v6[2] = @"assets";
  v6[3] = @"management";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"management.declarations";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setStatusActivations:v12];

  [v13 setStatusConfigurations:v11];
  [v13 setStatusAssets:v10];

  [v13 setStatusManagement:v9];
  return v13;
}

+ (id)buildRequiredOnlyWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setStatusActivations:v12];

  [v13 setStatusConfigurations:v11];
  [v13 setStatusAssets:v10];

  [v13 setStatusManagement:v9];
  return v13;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C3480;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C03A8];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C03C0];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C3498;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C03D8];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C03F0];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C34C8;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0408];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0420];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C34B0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0438];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0450];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C34E0;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0468];
  v23[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0480];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C34F8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0498];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C04B0];
  v22[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelStatusManagementDeclarations allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v16) = a4;
  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"activations" forKeyPath:@"statusActivations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v16 error:a5])
  {
    LOWORD(v17) = a4;
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"configurations" forKeyPath:@"statusConfigurations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v17 error:a5])
    {
      LOWORD(v18) = a4;
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"assets" forKeyPath:@"statusAssets" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v18 error:a5])
      {
        LOWORD(v19) = a4;
        BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"management" forKeyPath:@"statusManagement" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v19 error:a5];
      }
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusManagementDeclarations *)self statusActivations];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke;
  v18[3] = &__block_descriptor_34_e71___NSDictionary_16__0__RMModelStatusManagementDeclarations_Declaration_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"activations" value:v6 itemSerializer:v18 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusManagementDeclarations *)self statusConfigurations];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_2;
  v16[3] = &__block_descriptor_34_e71___NSDictionary_16__0__RMModelStatusManagementDeclarations_Declaration_8l;
  signed __int16 v17 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"configurations" value:v7 itemSerializer:v16 isRequired:1 defaultValue:0];

  id v8 = [(RMModelStatusManagementDeclarations *)self statusAssets];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_3;
  v14[3] = &__block_descriptor_34_e71___NSDictionary_16__0__RMModelStatusManagementDeclarations_Declaration_8l;
  signed __int16 v15 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"assets" value:v8 itemSerializer:v14 isRequired:1 defaultValue:0];

  id v9 = [(RMModelStatusManagementDeclarations *)self statusManagement];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_4;
  v12[3] = &__block_descriptor_34_e71___NSDictionary_16__0__RMModelStatusManagementDeclarations_Declaration_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"management" value:v9 itemSerializer:v12 isRequired:1 defaultValue:0];

  id v10 = (void *)[v5 copy];
  return v10;
}

uint64_t __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __64__RMModelStatusManagementDeclarations_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelStatusManagementDeclarations;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_statusActivations copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_statusConfigurations copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_statusAssets copy];
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

- (NSArray)statusConfigurations
{
  return self->_statusConfigurations;
}

- (void)setStatusConfigurations:(id)a3
{
}

- (NSArray)statusAssets
{
  return self->_statusAssets;
}

- (void)setStatusAssets:(id)a3
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
  objc_storeStrong((id *)&self->_statusAssets, 0);
  objc_storeStrong((id *)&self->_statusConfigurations, 0);
  objc_storeStrong((id *)&self->_statusActivations, 0);
}

uint64_t __69__RMModelStatusManagementDeclarations_Declaration_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end