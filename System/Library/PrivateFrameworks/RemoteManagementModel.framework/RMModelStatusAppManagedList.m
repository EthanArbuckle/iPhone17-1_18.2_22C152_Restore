@interface RMModelStatusAppManagedList
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 name:(id)a6 externalVersionId:(id)a7 version:(id)a8 shortVersion:(id)a9 state:(id)a10 updateState:(id)a11 reasons:(id)a12;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusReasons;
- (NSNumber)statusExternalVersionId;
- (NSNumber)statusRemoved;
- (NSString)statusDeclarationIdentifier;
- (NSString)statusIdentifier;
- (NSString)statusName;
- (NSString)statusShortVersion;
- (NSString)statusState;
- (NSString)statusUpdateState;
- (NSString)statusVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusDeclarationIdentifier:(id)a3;
- (void)setStatusExternalVersionId:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusName:(id)a3;
- (void)setStatusReasons:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusShortVersion:(id)a3;
- (void)setStatusState:(id)a3;
- (void)setStatusUpdateState:(id)a3;
- (void)setStatusVersion:(id)a3;
@end

@implementation RMModelStatusAppManagedList

+ (NSSet)allowedStatusKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"declaration-identifier";
  v6[3] = @"name";
  v6[4] = @"external-version-id";
  v6[5] = @"version";
  v6[6] = @"short-version";
  v6[7] = @"state";
  v6[8] = @"update-state";
  v6[9] = @"reasons";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"app.managed.list";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 name:(id)a6 externalVersionId:(id)a7 version:(id)a8 shortVersion:(id)a9 state:(id)a10 updateState:(id)a11 reasons:(id)a12
{
  id v31 = a12;
  id v29 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  [v26 setStatusIdentifier:v25];

  if (v24) {
    id v27 = v24;
  }
  else {
    id v27 = (id)MEMORY[0x263EFFA80];
  }
  objc_msgSend(v26, "setStatusRemoved:", v27, v29);

  [v26 setStatusDeclarationIdentifier:v23];
  [v26 setStatusName:v22];

  [v26 setStatusExternalVersionId:v21];
  [v26 setStatusVersion:v20];

  [v26 setStatusShortVersion:v19];
  [v26 setStatusState:v18];

  [v26 setStatusUpdateState:v30];
  [v26 setStatusReasons:v31];

  return v26;
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
  v18[3] = *MEMORY[0x263EF8340];
  v17[0] = &unk_2708C2C10;
  v13 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF3A0];
  v16[0] = v13;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF3B8];
  v16[1] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF3D0];
  v16[2] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v18[0] = v4;
  v17[1] = &unk_2708C2C28;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF3E8];
  v15[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF400];
  v15[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v18[1] = v7;
  v17[2] = &unk_2708C2C58;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF418];
  v14[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF430];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v18[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelStatusAppManagedList allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"declaration-identifier" forKeyPath:@"statusDeclarationIdentifier" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"name" forKeyPath:@"statusName" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"external-version-id" forKeyPath:@"statusExternalVersionId" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"version" forKeyPath:@"statusVersion" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"short-version" forKeyPath:@"statusShortVersion" isRequired:0 defaultValue:0 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"state" forKeyPath:@"statusState" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"update-state" forKeyPath:@"statusUpdateState" isRequired:0 defaultValue:0 error:a5])
                  {
                    LOWORD(v16) = a4;
                    BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"reasons" forKeyPath:@"statusReasons" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v16 error:a5];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusAppManagedList *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"identifier" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusAppManagedList *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"_removed" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v8 = [(RMModelStatusAppManagedList *)self statusDeclarationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"declaration-identifier" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelStatusAppManagedList *)self statusName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"name" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelStatusAppManagedList *)self statusExternalVersionId];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"external-version-id" value:v10 isRequired:0 defaultValue:0];

  v11 = [(RMModelStatusAppManagedList *)self statusVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"version" value:v11 isRequired:0 defaultValue:0];

  v12 = [(RMModelStatusAppManagedList *)self statusShortVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"short-version" value:v12 isRequired:0 defaultValue:0];

  v13 = [(RMModelStatusAppManagedList *)self statusState];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"state" value:v13 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelStatusAppManagedList *)self statusUpdateState];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"update-state" value:v14 isRequired:0 defaultValue:0];

  v15 = [(RMModelStatusAppManagedList *)self statusReasons];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__RMModelStatusAppManagedList_serializePayloadWithType___block_invoke;
  v18[3] = &__block_descriptor_34_e43___NSDictionary_16__0__RMModelStatusReason_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"reasons" value:v15 itemSerializer:v18 isRequired:0 defaultValue:0];

  uint64_t v16 = (void *)[v5 copy];
  return v16;
}

uint64_t __56__RMModelStatusAppManagedList_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RMModelStatusAppManagedList;
  v4 = [(RMModelPayloadBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusDeclarationIdentifier copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusName copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_statusExternalVersionId copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusVersion copy];
  uint64_t v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusShortVersion copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_statusState copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSString *)self->_statusUpdateState copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSArray *)self->_statusReasons copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

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

- (NSString)statusDeclarationIdentifier
{
  return self->_statusDeclarationIdentifier;
}

- (void)setStatusDeclarationIdentifier:(id)a3
{
}

- (NSString)statusName
{
  return self->_statusName;
}

- (void)setStatusName:(id)a3
{
}

- (NSNumber)statusExternalVersionId
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

- (NSString)statusUpdateState
{
  return self->_statusUpdateState;
}

- (void)setStatusUpdateState:(id)a3
{
}

- (NSArray)statusReasons
{
  return self->_statusReasons;
}

- (void)setStatusReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReasons, 0);
  objc_storeStrong((id *)&self->_statusUpdateState, 0);
  objc_storeStrong((id *)&self->_statusState, 0);
  objc_storeStrong((id *)&self->_statusShortVersion, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusExternalVersionId, 0);
  objc_storeStrong((id *)&self->_statusName, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end