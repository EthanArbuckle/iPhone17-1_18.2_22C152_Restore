@interface RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithEnable:(id)a3 enableRollback:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadEnable;
- (NSNumber)payloadEnableRollback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadEnable:(id)a3;
- (void)setPayloadEnableRollback:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enable";
  v6[1] = @"EnableRollback";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnable:(id)a3 enableRollback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = v7;
  v9 = (void *)MEMORY[0x263EFFA88];
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA88];
  }
  [v7 setPayloadEnable:v10];

  if (v5) {
    id v11 = v5;
  }
  else {
    id v11 = v9;
  }
  [v8 setPayloadEnableRollback:v11];

  return v8;
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
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Enable" forKeyPath:@"payloadEnable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"EnableRollback" forKeyPath:@"payloadEnableRollback" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5];
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self payloadEnable];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enable" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  id v7 = [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self payloadEnableRollback];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"EnableRollback" value:v7 isRequired:0 defaultValue:v6];

  v8 = (void *)[v4 copy];
  return v8;
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v5 = [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self payloadEnable];
  uint64_t v6 = [v4 payloadEnable];
  id v7 = +[RMModelConfigurationBase combineBooleanAnd:v5 other:v6];
  [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self setPayloadEnable:v7];

  id v10 = [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self payloadEnableRollback];
  v8 = [v4 payloadEnableRollback];

  v9 = +[RMModelConfigurationBase combineBooleanAnd:v10 other:v8];
  [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self setPayloadEnableRollback:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse;
  id v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnable copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadEnableRollback copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSNumber)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
}

- (NSNumber)payloadEnableRollback
{
  return self->_payloadEnableRollback;
}

- (void)setPayloadEnableRollback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableRollback, 0);
  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end