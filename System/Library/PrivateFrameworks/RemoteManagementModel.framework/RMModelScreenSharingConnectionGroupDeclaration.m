@interface RMModelScreenSharingConnectionGroupDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6;
+ (id)buildWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadMembers;
- (NSString)payloadConnectionGroupUUID;
- (NSString)payloadGroupName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadConnectionGroupUUID:(id)a3;
- (void)setPayloadGroupName:(id)a3;
- (void)setPayloadMembers:(id)a3;
@end

@implementation RMModelScreenSharingConnectionGroupDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.screensharing.connection.group";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ConnectionGroupUUID";
  v6[1] = @"GroupName";
  v6[2] = @"Members";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
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

+ (id)buildWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.screensharing.connection.group"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadConnectionGroupUUID:v12];

  [v13 setPayloadGroupName:v11];
  [v13 setPayloadMembers:v10];

  [v13 updateServerToken];
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.screensharing.connection.group"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadConnectionGroupUUID:v12];

  [v13 setPayloadGroupName:v11];
  [v13 setPayloadMembers:v10];

  [v13 updateServerToken];
  return v13;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C24D8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE818];
  v7[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE830];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelScreenSharingConnectionGroupDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, @"ConnectionGroupUUID", @"payloadConnectionGroupUUID", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, @"GroupName", @"payloadGroupName", 1, 0, a5)&& -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self,
          "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:",
          v7,
          @"Members",
          @"payloadMembers",
          &__block_literal_global_17,
          1,
          0,
          a5);

  return v13;
}

uint64_t __100__RMModelScreenSharingConnectionGroupDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelScreenSharingConnectionGroupDeclaration *)self payloadConnectionGroupUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ConnectionGroupUUID" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelScreenSharingConnectionGroupDeclaration *)self payloadGroupName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"GroupName" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelScreenSharingConnectionGroupDeclaration *)self payloadMembers];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"Members" value:v7 itemSerializer:&__block_literal_global_42 isRequired:1 defaultValue:0];

  v8 = (void *)[v4 copy];
  return v8;
}

id __75__RMModelScreenSharingConnectionGroupDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelScreenSharingConnectionGroupDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadConnectionGroupUUID copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadGroupName copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadMembers copy];
  id v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadConnectionGroupUUID
{
  return self->_payloadConnectionGroupUUID;
}

- (void)setPayloadConnectionGroupUUID:(id)a3
{
}

- (NSString)payloadGroupName
{
  return self->_payloadGroupName;
}

- (void)setPayloadGroupName:(id)a3
{
}

- (NSArray)payloadMembers
{
  return self->_payloadMembers;
}

- (void)setPayloadMembers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMembers, 0);
  objc_storeStrong((id *)&self->_payloadGroupName, 0);
  objc_storeStrong((id *)&self->_payloadConnectionGroupUUID, 0);
}

@end