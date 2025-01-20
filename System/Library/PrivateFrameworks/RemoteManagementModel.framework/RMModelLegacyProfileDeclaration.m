@interface RMModelLegacyProfileDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 profileURL:(id)a4;
+ (id)buildWithIdentifier:(id)a3 profileURL:(id)a4;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadProfileURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadProfileURL:(id)a3;
@end

@implementation RMModelLegacyProfileDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.legacy";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProfileURL";
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

+ (id)buildWithIdentifier:(id)a3 profileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.legacy"];
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
  [v7 setPayloadProfileURL:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 profileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.legacy"];
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
  [v7 setPayloadProfileURL:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C1E90;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDBE8];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC00];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C1EA8;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC18];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC30];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C1EC0;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC48];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC60];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C1ED8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC78];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDC90];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C1EF0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDCA8];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDCC0];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C1F08;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDCD8];
  v22[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDCF0];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a3;
  v9 = [v8 allKeys];
  v10 = [v7 setWithArray:v9];

  v11 = +[RMModelLegacyProfileDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  LOBYTE(a5) = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ProfileURL" forKeyPath:@"payloadProfileURL" isRequired:1 defaultValue:0 error:a5];
  return (char)a5;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelLegacyProfileDeclaration *)self payloadProfileURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ProfileURL" value:v5 isRequired:1 defaultValue:0];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelLegacyProfileDeclaration;
  v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadProfileURL copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (NSString)payloadProfileURL
{
  return self->_payloadProfileURL;
}

- (void)setPayloadProfileURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end