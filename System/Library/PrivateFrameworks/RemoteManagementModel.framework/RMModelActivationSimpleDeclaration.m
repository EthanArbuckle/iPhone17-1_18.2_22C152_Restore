@interface RMModelActivationSimpleDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 standardConfigurations:(id)a4;
+ (id)buildWithIdentifier:(id)a3 standardConfigurations:(id)a4 predicate:(id)a5;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadStandardConfigurations;
- (NSString)payloadPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadPredicate:(id)a3;
- (void)setPayloadStandardConfigurations:(id)a3;
@end

@implementation RMModelActivationSimpleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.activation.simple";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"StandardConfigurations";
  v6[1] = @"Predicate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 standardConfigurations:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.activation.simple"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadStandardConfigurations:v9];

  [v10 setPayloadPredicate:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 standardConfigurations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.activation.simple"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadStandardConfigurations:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C1830;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCFA0];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCFB8];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C1848;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCFD0];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCFE8];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C1860;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD000];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD018];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C1878;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD030];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD048];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C1890;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD060];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD078];
  v23[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C18A8;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD090];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD0A8];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelActivationSimpleDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"StandardConfigurations" forKeyPath:@"payloadStandardConfigurations" validator:&__block_literal_global_7 isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Predicate" forKeyPath:@"payloadPredicate" isRequired:0 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __88__RMModelActivationSimpleDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelActivationSimpleDeclaration *)self payloadStandardConfigurations];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"StandardConfigurations" value:v5 itemSerializer:&__block_literal_global_70 isRequired:1 defaultValue:0];

  id v6 = [(RMModelActivationSimpleDeclaration *)self payloadPredicate];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Predicate" value:v6 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

id __63__RMModelActivationSimpleDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelActivationSimpleDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadStandardConfigurations copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPredicate copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSArray)payloadStandardConfigurations
{
  return self->_payloadStandardConfigurations;
}

- (void)setPayloadStandardConfigurations:(id)a3
{
}

- (NSString)payloadPredicate
{
  return self->_payloadPredicate;
}

- (void)setPayloadPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPredicate, 0);
  objc_storeStrong((id *)&self->_payloadStandardConfigurations, 0);
}

@end