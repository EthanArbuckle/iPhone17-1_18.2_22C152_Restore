@interface RMModelStatusServicesBackgroundTask_Launchd
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithLabel:(id)a3 program:(id)a4 checksum:(id)a5;
+ (id)buildWithLabel:(id)a3 program:(id)a4 programArguments:(id)a5 checksum:(id)a6 deviceManagement:(id)a7;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusProgramArguments;
- (NSString)statusChecksum;
- (NSString)statusLabel;
- (NSString)statusProgram;
- (RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement)statusDeviceManagement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusChecksum:(id)a3;
- (void)setStatusDeviceManagement:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStatusProgram:(id)a3;
- (void)setStatusProgramArguments:(id)a3;
@end

@implementation RMModelStatusServicesBackgroundTask_Launchd

+ (NSSet)allowedStatusKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"label";
  v6[1] = @"program";
  v6[2] = @"program-arguments";
  v6[3] = @"checksum";
  v6[4] = @"device-management";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithLabel:(id)a3 program:(id)a4 programArguments:(id)a5 checksum:(id)a6 deviceManagement:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setStatusLabel:v15];

  [v16 setStatusProgram:v14];
  [v16 setStatusProgramArguments:v13];

  [v16 setStatusChecksum:v12];
  [v16 setStatusDeviceManagement:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithLabel:(id)a3 program:(id)a4 checksum:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusLabel:v9];

  [v10 setStatusProgram:v8];
  [v10 setStatusChecksum:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelStatusServicesBackgroundTask_Launchd allowedStatusKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"label" forKeyPath:@"statusLabel" isRequired:1 defaultValue:0 error:a5]|| ![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"program" forKeyPath:@"statusProgram" isRequired:1 defaultValue:0 error:a5])
  {
    goto LABEL_6;
  }
  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"program-arguments" forKeyPath:@"statusProgramArguments" validator:&__block_literal_global_25 isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"checksum" forKeyPath:@"statusChecksum" isRequired:1 defaultValue:0 error:a5])
    {
      LOWORD(v16) = a4;
      BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"device-management" forKeyPath:@"statusDeviceManagement" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
      goto LABEL_7;
    }
LABEL_6:
    BOOL v14 = 0;
  }
LABEL_7:

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusServicesBackgroundTask_Launchd *)self statusLabel];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"label" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelStatusServicesBackgroundTask_Launchd *)self statusProgram];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"program" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelStatusServicesBackgroundTask_Launchd *)self statusProgramArguments];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"program-arguments" value:v8 itemSerializer:&__block_literal_global_191 isRequired:0 defaultValue:0];

  id v9 = [(RMModelStatusServicesBackgroundTask_Launchd *)self statusChecksum];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"checksum" value:v9 isRequired:1 defaultValue:0];

  v10 = [(RMModelStatusServicesBackgroundTask_Launchd *)self statusDeviceManagement];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke_2;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"device-management" value:v10 dictSerializer:v13 isRequired:0 defaultValue:0];

  id v11 = (void *)[v5 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelStatusServicesBackgroundTask_Launchd;
  v4 = [(RMModelPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusLabel copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusProgram copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_statusProgramArguments copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusChecksum copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement *)self->_statusDeviceManagement copy];
  signed __int16 v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (NSString)statusProgram
{
  return self->_statusProgram;
}

- (void)setStatusProgram:(id)a3
{
}

- (NSArray)statusProgramArguments
{
  return self->_statusProgramArguments;
}

- (void)setStatusProgramArguments:(id)a3
{
}

- (NSString)statusChecksum
{
  return self->_statusChecksum;
}

- (void)setStatusChecksum:(id)a3
{
}

- (RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement)statusDeviceManagement
{
  return self->_statusDeviceManagement;
}

- (void)setStatusDeviceManagement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeviceManagement, 0);
  objc_storeStrong((id *)&self->_statusChecksum, 0);
  objc_storeStrong((id *)&self->_statusProgramArguments, 0);
  objc_storeStrong((id *)&self->_statusProgram, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end