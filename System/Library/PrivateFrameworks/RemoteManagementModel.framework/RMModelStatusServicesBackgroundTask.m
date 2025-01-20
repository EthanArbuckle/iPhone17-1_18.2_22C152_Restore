@interface RMModelStatusServicesBackgroundTask
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 uid:(id)a4 path:(id)a5 state:(id)a6 type:(id)a7;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 codeSignature:(id)a5 uid:(id)a6 path:(id)a7 state:(id)a8 type:(id)a9 launchd:(id)a10;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)statusRemoved;
- (NSNumber)statusUid;
- (NSString)statusCodeSignature;
- (NSString)statusIdentifier;
- (NSString)statusPath;
- (NSString)statusState;
- (NSString)statusType;
- (RMModelStatusServicesBackgroundTask_Launchd)statusLaunchd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusCodeSignature:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusLaunchd:(id)a3;
- (void)setStatusPath:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusState:(id)a3;
- (void)setStatusType:(id)a3;
- (void)setStatusUid:(id)a3;
@end

@implementation RMModelStatusServicesBackgroundTask

+ (NSSet)allowedStatusKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"code-signature";
  v6[3] = @"uid";
  v6[4] = @"path";
  v6[5] = @"state";
  v6[6] = @"type";
  v6[7] = @"launchd";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"services.background-task";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 codeSignature:(id)a5 uid:(id)a6 path:(id)a7 state:(id)a8 type:(id)a9 launchd:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setStatusIdentifier:v23];

  if (v22) {
    id v25 = v22;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setStatusRemoved:v25];

  [v24 setStatusCodeSignature:v21];
  [v24 setStatusUid:v20];

  [v24 setStatusPath:v19];
  [v24 setStatusState:v18];

  [v24 setStatusType:v17];
  [v24 setStatusLaunchd:v16];

  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 uid:(id)a4 path:(id)a5 state:(id)a6 type:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_opt_new();
  [v16 setStatusIdentifier:v15];

  [v16 setStatusUid:v14];
  [v16 setStatusPath:v13];

  [v16 setStatusState:v12];
  [v16 setStatusType:v11];

  return v16;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C3840;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A38];
  v7[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A50];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelStatusServicesBackgroundTask allowedStatusKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])goto LABEL_9; {
  BOOL v14 = 0;
  }
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"code-signature" forKeyPath:@"statusCodeSignature" isRequired:0 defaultValue:0 error:a5])
    {
      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"uid", @"statusUid", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"path", @"statusPath", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
             "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
             v8,
             @"state",
             @"statusState",
             1,
             0,
             a5)
        && [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"type" forKeyPath:@"statusType" isRequired:1 defaultValue:0 error:a5])
      {
        LOWORD(v16) = a4;
        BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"launchd" forKeyPath:@"statusLaunchd" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
        goto LABEL_10;
      }
LABEL_9:
      BOOL v14 = 0;
    }
  }
LABEL_10:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusServicesBackgroundTask *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"identifier" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusServicesBackgroundTask *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"_removed" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v8 = [(RMModelStatusServicesBackgroundTask *)self statusCodeSignature];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"code-signature" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelStatusServicesBackgroundTask *)self statusUid];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"uid" value:v9 isRequired:1 defaultValue:0];

  v10 = [(RMModelStatusServicesBackgroundTask *)self statusPath];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"path" value:v10 isRequired:1 defaultValue:0];

  id v11 = [(RMModelStatusServicesBackgroundTask *)self statusState];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"state" value:v11 isRequired:1 defaultValue:0];

  id v12 = [(RMModelStatusServicesBackgroundTask *)self statusType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"type" value:v12 isRequired:1 defaultValue:0];

  id v13 = [(RMModelStatusServicesBackgroundTask *)self statusLaunchd];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__RMModelStatusServicesBackgroundTask_serializePayloadWithType___block_invoke;
  v16[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v17 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"launchd" value:v13 dictSerializer:v16 isRequired:0 defaultValue:0];

  BOOL v14 = (void *)[v5 copy];
  return v14;
}

uint64_t __64__RMModelStatusServicesBackgroundTask_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)RMModelStatusServicesBackgroundTask;
  v4 = [(RMModelPayloadBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusCodeSignature copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_statusUid copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusPath copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusState copy];
  uint64_t v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusType copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(RMModelStatusServicesBackgroundTask_Launchd *)self->_statusLaunchd copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
}

- (NSString)statusCodeSignature
{
  return self->_statusCodeSignature;
}

- (void)setStatusCodeSignature:(id)a3
{
}

- (NSNumber)statusUid
{
  return self->_statusUid;
}

- (void)setStatusUid:(id)a3
{
}

- (NSString)statusPath
{
  return self->_statusPath;
}

- (void)setStatusPath:(id)a3
{
}

- (NSString)statusState
{
  return self->_statusState;
}

- (void)setStatusState:(id)a3
{
}

- (NSString)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(id)a3
{
}

- (RMModelStatusServicesBackgroundTask_Launchd)statusLaunchd
{
  return self->_statusLaunchd;
}

- (void)setStatusLaunchd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLaunchd, 0);
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_statusState, 0);
  objc_storeStrong((id *)&self->_statusPath, 0);
  objc_storeStrong((id *)&self->_statusUid, 0);
  objc_storeStrong((id *)&self->_statusCodeSignature, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

uint64_t __90__RMModelStatusServicesBackgroundTask_Launchd_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end