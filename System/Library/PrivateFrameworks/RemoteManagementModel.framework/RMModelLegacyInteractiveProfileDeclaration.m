@interface RMModelLegacyInteractiveProfileDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 profileURL:(id)a4 visibleName:(id)a5;
+ (id)buildWithIdentifier:(id)a3 profileURL:(id)a4 visibleName:(id)a5;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadProfileURL;
- (NSString)payloadVisibleName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadProfileURL:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelLegacyInteractiveProfileDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.legacy.interactive";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProfileURL";
  v6[1] = @"VisibleName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
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

+ (id)buildWithIdentifier:(id)a3 profileURL:(id)a4 visibleName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.legacy.interactive"];
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
  [v10 setPayloadProfileURL:v9];

  [v10 setPayloadVisibleName:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 profileURL:(id)a4 visibleName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.legacy.interactive"];
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
  [v10 setPayloadProfileURL:v9];

  [v10 setPayloadVisibleName:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C1E30;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB28];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB40];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1E48;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB58];
  v18[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB70];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C1E60;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDB88];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDBA0];
  v17[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C1E78;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDBB8];
  v16[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDBD0];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelLegacyInteractiveProfileDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ProfileURL" forKeyPath:@"payloadProfileURL" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelLegacyInteractiveProfileDeclaration *)self payloadProfileURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ProfileURL" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelLegacyInteractiveProfileDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VisibleName" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelLegacyInteractiveProfileDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadProfileURL copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadVisibleName copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadProfileURL
{
  return self->_payloadProfileURL;
}

- (void)setPayloadProfileURL:(id)a3
{
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
  objc_storeStrong((id *)&self->_payloadProfileURL, 0);
}

@end