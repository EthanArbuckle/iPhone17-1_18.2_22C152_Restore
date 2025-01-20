@interface RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithDownload:(id)a3 installOSUpdates:(id)a4 installSecurityUpdate:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadDownload;
- (NSString)payloadInstallOSUpdates;
- (NSString)payloadInstallSecurityUpdate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadDownload:(id)a3;
- (void)setPayloadInstallOSUpdates:(id)a3;
- (void)setPayloadInstallSecurityUpdate:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Download";
  v6[1] = @"InstallOSUpdates";
  v6[2] = @"InstallSecurityUpdate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDownload:(id)a3 installOSUpdates:(id)a4 installSecurityUpdate:(id)a5
{
  v7 = (__CFString *)a5;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a3;
  v10 = objc_opt_new();
  v11 = v10;
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"Allowed";
  }
  [v10 setPayloadDownload:v12];

  if (v8) {
    v13 = v8;
  }
  else {
    v13 = @"Allowed";
  }
  [v11 setPayloadInstallOSUpdates:v13];

  if (v7) {
    v14 = v7;
  }
  else {
    v14 = @"Allowed";
  }
  [v11 setPayloadInstallSecurityUpdate:v14];

  return v11;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Download" forKeyPath:@"payloadDownload" isRequired:0 defaultValue:@"Allowed" error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"InstallOSUpdates" forKeyPath:@"payloadInstallOSUpdates" isRequired:0 defaultValue:@"Allowed" error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"InstallSecurityUpdate" forKeyPath:@"payloadInstallSecurityUpdate" isRequired:0 defaultValue:@"Allowed" error:a5];
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadDownload];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Download" value:v5 isRequired:0 defaultValue:@"Allowed"];

  v6 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadInstallOSUpdates];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"InstallOSUpdates" value:v6 isRequired:0 defaultValue:@"Allowed"];

  id v7 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadInstallSecurityUpdate];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"InstallSecurityUpdate" value:v7 isRequired:0 defaultValue:@"Allowed"];

  v8 = (void *)[v4 copy];
  return v8;
}

- (void)combineWithOther:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadDownload];
  v6 = [v4 payloadDownload];
  v19[0] = @"Allowed";
  v19[1] = @"AlwaysOn";
  v19[2] = @"AlwaysOff";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  v8 = +[RMModelConfigurationBase combineEnumLast:v5 other:v6 enums:v7];
  [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self setPayloadDownload:v8];

  v9 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadInstallOSUpdates];
  v10 = [v4 payloadInstallOSUpdates];
  v18[0] = @"Allowed";
  v18[1] = @"AlwaysOn";
  v18[2] = @"AlwaysOff";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v12 = +[RMModelConfigurationBase combineEnumLast:v9 other:v10 enums:v11];
  [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self setPayloadInstallOSUpdates:v12];

  BOOL v13 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self payloadInstallSecurityUpdate];
  v14 = [v4 payloadInstallSecurityUpdate];

  v17[0] = @"Allowed";
  v17[1] = @"AlwaysOn";
  v17[2] = @"AlwaysOff";
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v16 = +[RMModelConfigurationBase combineEnumLast:v13 other:v14 enums:v15];
  [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self setPayloadInstallSecurityUpdate:v16];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions;
  id v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDownload copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadInstallOSUpdates copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadInstallSecurityUpdate copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadDownload
{
  return self->_payloadDownload;
}

- (void)setPayloadDownload:(id)a3
{
}

- (NSString)payloadInstallOSUpdates
{
  return self->_payloadInstallOSUpdates;
}

- (void)setPayloadInstallOSUpdates:(id)a3
{
}

- (NSString)payloadInstallSecurityUpdate
{
  return self->_payloadInstallSecurityUpdate;
}

- (void)setPayloadInstallSecurityUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInstallSecurityUpdate, 0);
  objc_storeStrong((id *)&self->_payloadInstallOSUpdates, 0);
  objc_storeStrong((id *)&self->_payloadDownload, 0);
}

@end