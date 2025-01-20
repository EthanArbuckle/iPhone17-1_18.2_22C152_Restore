@interface RMModelStatusMDMApp
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 name:(id)a5 externalVersionId:(id)a6 version:(id)a7 shortVersion:(id)a8 state:(id)a9;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)statusRemoved;
- (NSString)statusExternalVersionId;
- (NSString)statusIdentifier;
- (NSString)statusName;
- (NSString)statusShortVersion;
- (NSString)statusState;
- (NSString)statusVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusExternalVersionId:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusName:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusShortVersion:(id)a3;
- (void)setStatusState:(id)a3;
- (void)setStatusVersion:(id)a3;
@end

@implementation RMModelStatusMDMApp

+ (NSSet)allowedStatusKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"name";
  v6[3] = @"external-version-id";
  v6[4] = @"version";
  v6[5] = @"short-version";
  v6[6] = @"state";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"mdm.app";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 name:(id)a5 externalVersionId:(id)a6 version:(id)a7 shortVersion:(id)a8 state:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setStatusIdentifier:v21];

  if (v20) {
    id v23 = v20;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA80];
  }
  [v22 setStatusRemoved:v23];

  [v22 setStatusName:v19];
  [v22 setStatusExternalVersionId:v18];

  [v22 setStatusVersion:v17];
  [v22 setStatusShortVersion:v16];

  [v22 setStatusState:v15];
  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusIdentifier:v3];

  return v4;
}

+ (id)supportedOS
{
  v25[5] = *MEMORY[0x263EF8340];
  v24[0] = &unk_2708C35A0;
  id v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0678];
  v23[0] = v18;
  id v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0690];
  v23[1] = v17;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v25[0] = v16;
  v24[1] = &unk_2708C35E8;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C06A8];
  v22[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C06C0];
  v22[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v25[1] = v13;
  v24[2] = &unk_2708C35D0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C06D8];
  v21[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C06F0];
  v21[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v25[2] = v4;
  v24[3] = &unk_2708C3600;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0708];
  v20[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0720];
  v20[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v25[3] = v7;
  v24[4] = &unk_2708C3618;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0738];
  v19[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0750];
  v19[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v25[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusMDMApp allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"name" forKeyPath:@"statusName" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"external-version-id" forKeyPath:@"statusExternalVersionId" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"version" forKeyPath:@"statusVersion" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"short-version" forKeyPath:@"statusShortVersion" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"state" forKeyPath:@"statusState" isRequired:0 defaultValue:0 error:a5];
            }
          }
        }
      }
    }
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
  v5 = [(RMModelStatusMDMApp *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"identifier" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusMDMApp *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"_removed" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelStatusMDMApp *)self statusName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"name" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelStatusMDMApp *)self statusExternalVersionId];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"external-version-id" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelStatusMDMApp *)self statusVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"version" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelStatusMDMApp *)self statusShortVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"short-version" value:v10 isRequired:0 defaultValue:0];

  v11 = [(RMModelStatusMDMApp *)self statusState];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"state" value:v11 isRequired:0 defaultValue:0];

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RMModelStatusMDMApp;
  v4 = [(RMModelPayloadBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusExternalVersionId copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusVersion copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusShortVersion copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusState copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

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

- (NSString)statusName
{
  return self->_statusName;
}

- (void)setStatusName:(id)a3
{
}

- (NSString)statusExternalVersionId
{
  return self->_statusExternalVersionId;
}

- (void)setStatusExternalVersionId:(id)a3
{
}

- (NSString)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(id)a3
{
}

- (NSString)statusShortVersion
{
  return self->_statusShortVersion;
}

- (void)setStatusShortVersion:(id)a3
{
}

- (NSString)statusState
{
  return self->_statusState;
}

- (void)setStatusState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusState, 0);
  objc_storeStrong((id *)&self->_statusShortVersion, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusExternalVersionId, 0);
  objc_storeStrong((id *)&self->_statusName, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end