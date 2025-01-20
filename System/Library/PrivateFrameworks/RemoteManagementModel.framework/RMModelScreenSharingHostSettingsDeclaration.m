@interface RMModelScreenSharingHostSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 maximumVirtualDisplays:(id)a4 portBase:(id)a5 preventCopyFilesFromHost:(id)a6 preventCopyFilesToHost:(id)a7 preventHighPerformanceConnections:(id)a8;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadMaximumVirtualDisplays;
- (NSNumber)payloadPortBase;
- (NSNumber)payloadPreventCopyFilesFromHost;
- (NSNumber)payloadPreventCopyFilesToHost;
- (NSNumber)payloadPreventHighPerformanceConnections;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadMaximumVirtualDisplays:(id)a3;
- (void)setPayloadPortBase:(id)a3;
- (void)setPayloadPreventCopyFilesFromHost:(id)a3;
- (void)setPayloadPreventCopyFilesToHost:(id)a3;
- (void)setPayloadPreventHighPerformanceConnections:(id)a3;
@end

@implementation RMModelScreenSharingHostSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.screensharing.host.settings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"MaximumVirtualDisplays";
  v6[1] = @"PortBase";
  v6[2] = @"PreventCopyFilesFromHost";
  v6[3] = @"PreventCopyFilesToHost";
  v6[4] = @"PreventHighPerformanceConnections";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
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

+ (id)buildWithIdentifier:(id)a3 maximumVirtualDisplays:(id)a4 portBase:(id)a5 preventCopyFilesFromHost:(id)a6 preventCopyFilesToHost:(id)a7 preventHighPerformanceConnections:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.screensharing.host.settings"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  [v19 setPayloadMaximumVirtualDisplays:v18];

  [v19 setPayloadPortBase:v17];
  v22 = (void *)MEMORY[0x263EFFA80];
  if (v16) {
    id v23 = v16;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setPayloadPreventCopyFilesFromHost:v23];

  if (v15) {
    id v24 = v15;
  }
  else {
    id v24 = v22;
  }
  [v19 setPayloadPreventCopyFilesToHost:v24];

  if (v14) {
    id v25 = v14;
  }
  else {
    id v25 = v22;
  }
  [v19 setPayloadPreventHighPerformanceConnections:v25];

  [v19 updateServerToken];
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.screensharing.host.settings"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerToken];

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C2538;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE848];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE860];
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
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelScreenSharingHostSettingsDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"MaximumVirtualDisplays" forKeyPath:@"payloadMaximumVirtualDisplays" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"PortBase" forKeyPath:@"payloadPortBase" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"PreventCopyFilesFromHost" forKeyPath:@"payloadPreventCopyFilesFromHost" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"PreventCopyFilesToHost" forKeyPath:@"payloadPreventCopyFilesToHost" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
        {
          BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"PreventHighPerformanceConnections" forKeyPath:@"payloadPreventHighPerformanceConnections" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
        }
      }
    }
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelScreenSharingHostSettingsDeclaration *)self payloadMaximumVirtualDisplays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"MaximumVirtualDisplays" value:v5 isRequired:0 defaultValue:0];

  v6 = [(RMModelScreenSharingHostSettingsDeclaration *)self payloadPortBase];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"PortBase" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelScreenSharingHostSettingsDeclaration *)self payloadPreventCopyFilesFromHost];
  uint64_t v8 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"PreventCopyFilesFromHost" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v9 = [(RMModelScreenSharingHostSettingsDeclaration *)self payloadPreventCopyFilesToHost];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"PreventCopyFilesToHost" value:v9 isRequired:0 defaultValue:v8];

  v10 = [(RMModelScreenSharingHostSettingsDeclaration *)self payloadPreventHighPerformanceConnections];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"PreventHighPerformanceConnections" value:v10 isRequired:0 defaultValue:v8];

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelScreenSharingHostSettingsDeclaration;
  v4 = [(RMModelDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadMaximumVirtualDisplays copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadPortBase copy];
  uint64_t v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadPreventCopyFilesFromHost copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadPreventCopyFilesToHost copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadPreventHighPerformanceConnections copy];
  id v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSNumber)payloadMaximumVirtualDisplays
{
  return self->_payloadMaximumVirtualDisplays;
}

- (void)setPayloadMaximumVirtualDisplays:(id)a3
{
}

- (NSNumber)payloadPortBase
{
  return self->_payloadPortBase;
}

- (void)setPayloadPortBase:(id)a3
{
}

- (NSNumber)payloadPreventCopyFilesFromHost
{
  return self->_payloadPreventCopyFilesFromHost;
}

- (void)setPayloadPreventCopyFilesFromHost:(id)a3
{
}

- (NSNumber)payloadPreventCopyFilesToHost
{
  return self->_payloadPreventCopyFilesToHost;
}

- (void)setPayloadPreventCopyFilesToHost:(id)a3
{
}

- (NSNumber)payloadPreventHighPerformanceConnections
{
  return self->_payloadPreventHighPerformanceConnections;
}

- (void)setPayloadPreventHighPerformanceConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPreventHighPerformanceConnections, 0);
  objc_storeStrong((id *)&self->_payloadPreventCopyFilesToHost, 0);
  objc_storeStrong((id *)&self->_payloadPreventCopyFilesFromHost, 0);
  objc_storeStrong((id *)&self->_payloadPortBase, 0);
  objc_storeStrong((id *)&self->_payloadMaximumVirtualDisplays, 0);
}

@end