@interface RMModelAccountMailDeclaration_SMIMEEncryption
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithEnabled:(id)a3;
+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6 perMessageSwitchEnabled:(id)a7;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadEnabled;
- (NSNumber)payloadIdentityUserOverrideable;
- (NSNumber)payloadPerMessageSwitchEnabled;
- (NSNumber)payloadUserOverrideable;
- (NSString)payloadIdentityAssetReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadEnabled:(id)a3;
- (void)setPayloadIdentityAssetReference:(id)a3;
- (void)setPayloadIdentityUserOverrideable:(id)a3;
- (void)setPayloadPerMessageSwitchEnabled:(id)a3;
- (void)setPayloadUserOverrideable:(id)a3;
@end

@implementation RMModelAccountMailDeclaration_SMIMEEncryption

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enabled";
  v6[1] = @"IdentityAssetReference";
  v6[2] = @"UserOverrideable";
  v6[3] = @"IdentityUserOverrideable";
  v6[4] = @"PerMessageSwitchEnabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6 perMessageSwitchEnabled:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadEnabled:v15];

  [v16 setPayloadIdentityAssetReference:v14];
  v17 = (void *)MEMORY[0x263EFFA80];
  if (v13) {
    id v18 = v13;
  }
  else {
    id v18 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setPayloadUserOverrideable:v18];

  if (v12) {
    id v19 = v12;
  }
  else {
    id v19 = v17;
  }
  [v16 setPayloadIdentityUserOverrideable:v19];

  if (v11) {
    id v20 = v11;
  }
  else {
    id v20 = v17;
  }
  [v16 setPayloadPerMessageSwitchEnabled:v20];

  return v16;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadEnabled:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelAccountMailDeclaration_SMIMEEncryption allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Enabled" forKeyPath:@"payloadEnabled" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"IdentityAssetReference" forKeyPath:@"payloadIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"UserOverrideable" forKeyPath:@"payloadUserOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"IdentityUserOverrideable" forKeyPath:@"payloadIdentityUserOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
        {
          BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"PerMessageSwitchEnabled" forKeyPath:@"payloadPerMessageSwitchEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
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

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAccountMailDeclaration_SMIMEEncryption *)self payloadEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enabled" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAccountMailDeclaration_SMIMEEncryption *)self payloadIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"IdentityAssetReference" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAccountMailDeclaration_SMIMEEncryption *)self payloadUserOverrideable];
  uint64_t v8 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"UserOverrideable" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v9 = [(RMModelAccountMailDeclaration_SMIMEEncryption *)self payloadIdentityUserOverrideable];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"IdentityUserOverrideable" value:v9 isRequired:0 defaultValue:v8];

  v10 = [(RMModelAccountMailDeclaration_SMIMEEncryption *)self payloadPerMessageSwitchEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"PerMessageSwitchEnabled" value:v10 isRequired:0 defaultValue:v8];

  id v11 = (void *)[v4 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelAccountMailDeclaration_SMIMEEncryption;
  v4 = [(RMModelPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnabled copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadIdentityAssetReference copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadUserOverrideable copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadIdentityUserOverrideable copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadPerMessageSwitchEnabled copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
}

- (NSString)payloadIdentityAssetReference
{
  return self->_payloadIdentityAssetReference;
}

- (void)setPayloadIdentityAssetReference:(id)a3
{
}

- (NSNumber)payloadUserOverrideable
{
  return self->_payloadUserOverrideable;
}

- (void)setPayloadUserOverrideable:(id)a3
{
}

- (NSNumber)payloadIdentityUserOverrideable
{
  return self->_payloadIdentityUserOverrideable;
}

- (void)setPayloadIdentityUserOverrideable:(id)a3
{
}

- (NSNumber)payloadPerMessageSwitchEnabled
{
  return self->_payloadPerMessageSwitchEnabled;
}

- (void)setPayloadPerMessageSwitchEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPerMessageSwitchEnabled, 0);
  objc_storeStrong((id *)&self->_payloadIdentityUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end