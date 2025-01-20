@interface RMModelSoftwareUpdateEnforcementSpecificDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetLocalDateTime:(id)a5;
+ (id)buildWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetBuildVersion:(id)a5 targetLocalDateTime:(id)a6 detailsURL:(id)a7;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadDetailsURL;
- (NSString)payloadTargetBuildVersion;
- (NSString)payloadTargetLocalDateTime;
- (NSString)payloadTargetOSVersion;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadDetailsURL:(id)a3;
- (void)setPayloadTargetBuildVersion:(id)a3;
- (void)setPayloadTargetLocalDateTime:(id)a3;
- (void)setPayloadTargetOSVersion:(id)a3;
@end

@implementation RMModelSoftwareUpdateEnforcementSpecificDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.softwareupdate.enforcement.specific";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"TargetOSVersion";
  v6[1] = @"TargetBuildVersion";
  v6[2] = @"TargetLocalDateTime";
  v6[3] = @"DetailsURL";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
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

+ (id)buildWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetBuildVersion:(id)a5 targetLocalDateTime:(id)a6 detailsURL:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.softwareupdate.enforcement.specific"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadTargetOSVersion:v15];

  [v16 setPayloadTargetBuildVersion:v14];
  [v16 setPayloadTargetLocalDateTime:v13];

  [v16 setPayloadDetailsURL:v12];
  [v16 updateServerToken];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetLocalDateTime:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.softwareupdate.enforcement.specific"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadTargetOSVersion:v9];

  [v10 setPayloadTargetLocalDateTime:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C2790;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEC80];
  v15[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEC98];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C27A8;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BECB0];
  v14[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BECC8];
  v14[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C27D8;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BECE0];
  v13[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BECF8];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSoftwareUpdateEnforcementSpecificDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"TargetOSVersion" forKeyPath:@"payloadTargetOSVersion" isRequired:1 defaultValue:0 error:a5])goto LABEL_5; {
  BOOL v13 = 0;
  }
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"TargetBuildVersion" forKeyPath:@"payloadTargetBuildVersion" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"TargetLocalDateTime" forKeyPath:@"payloadTargetLocalDateTime" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DetailsURL" forKeyPath:@"payloadDetailsURL" isRequired:0 defaultValue:0 error:a5];
      goto LABEL_6;
    }
LABEL_5:
    BOOL v13 = 0;
  }
LABEL_6:

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelSoftwareUpdateEnforcementSpecificDeclaration *)self payloadTargetOSVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"TargetOSVersion" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelSoftwareUpdateEnforcementSpecificDeclaration *)self payloadTargetBuildVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"TargetBuildVersion" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelSoftwareUpdateEnforcementSpecificDeclaration *)self payloadTargetLocalDateTime];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"TargetLocalDateTime" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelSoftwareUpdateEnforcementSpecificDeclaration *)self payloadDetailsURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DetailsURL" value:v8 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelSoftwareUpdateEnforcementSpecificDeclaration;
  v4 = [(RMModelDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadTargetOSVersion copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadTargetBuildVersion copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadTargetLocalDateTime copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadDetailsURL copy];
  id v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (NSString)payloadTargetOSVersion
{
  return self->_payloadTargetOSVersion;
}

- (void)setPayloadTargetOSVersion:(id)a3
{
}

- (NSString)payloadTargetBuildVersion
{
  return self->_payloadTargetBuildVersion;
}

- (void)setPayloadTargetBuildVersion:(id)a3
{
}

- (NSString)payloadTargetLocalDateTime
{
  return self->_payloadTargetLocalDateTime;
}

- (void)setPayloadTargetLocalDateTime:(id)a3
{
}

- (NSString)payloadDetailsURL
{
  return self->_payloadDetailsURL;
}

- (void)setPayloadDetailsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDetailsURL, 0);
  objc_storeStrong((id *)&self->_payloadTargetLocalDateTime, 0);
  objc_storeStrong((id *)&self->_payloadTargetBuildVersion, 0);
  objc_storeStrong((id *)&self->_payloadTargetOSVersion, 0);
}

@end