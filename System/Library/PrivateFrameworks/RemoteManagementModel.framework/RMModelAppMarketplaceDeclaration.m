@interface RMModelAppMarketplaceDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 distributorID:(id)a4 marketplaceURL:(id)a5;
+ (id)buildWithIdentifier:(id)a3 distributorID:(id)a4 marketplaceURL:(id)a5;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadDistributorID;
- (NSString)payloadMarketplaceURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadDistributorID:(id)a3;
- (void)setPayloadMarketplaceURL:(id)a3;
@end

@implementation RMModelAppMarketplaceDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.app.marketplace";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DistributorID";
  v6[1] = @"MarketplaceURL";
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

+ (id)buildWithIdentifier:(id)a3 distributorID:(id)a4 marketplaceURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.app.marketplace"];
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
  [v10 setPayloadDistributorID:v9];

  [v10 setPayloadMarketplaceURL:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 distributorID:(id)a4 marketplaceURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.app.marketplace"];
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
  [v10 setPayloadDistributorID:v9];

  [v10 setPayloadMarketplaceURL:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = &unk_2708C1920;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD1E0];
  v13[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD1F8];
  v13[1] = v3;
  v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD210];
  v13[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  v14[1] = &unk_2708C1968;
  v15[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD228];
  v12[0] = v6;
  id v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD240];
  v12[1] = v7;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD258];
  v12[2] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  v15[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAppMarketplaceDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DistributorID" forKeyPath:@"payloadDistributorID" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"MarketplaceURL" forKeyPath:@"payloadMarketplaceURL" isRequired:1 defaultValue:0 error:a5];
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
  v5 = [(RMModelAppMarketplaceDeclaration *)self payloadDistributorID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DistributorID" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAppMarketplaceDeclaration *)self payloadMarketplaceURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"MarketplaceURL" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelAppMarketplaceDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDistributorID copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadMarketplaceURL copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadDistributorID
{
  return self->_payloadDistributorID;
}

- (void)setPayloadDistributorID:(id)a3
{
}

- (NSString)payloadMarketplaceURL
{
  return self->_payloadMarketplaceURL;
}

- (void)setPayloadMarketplaceURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMarketplaceURL, 0);
  objc_storeStrong((id *)&self->_payloadDistributorID, 0);
}

@end