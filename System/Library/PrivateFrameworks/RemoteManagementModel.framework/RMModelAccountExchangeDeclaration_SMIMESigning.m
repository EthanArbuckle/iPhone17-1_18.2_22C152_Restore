@interface RMModelAccountExchangeDeclaration_SMIMESigning
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithEnabled:(id)a3;
+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadEnabled;
- (NSNumber)payloadIdentityUserOverrideable;
- (NSNumber)payloadUserOverrideable;
- (NSString)payloadIdentityAssetReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadEnabled:(id)a3;
- (void)setPayloadIdentityAssetReference:(id)a3;
- (void)setPayloadIdentityUserOverrideable:(id)a3;
- (void)setPayloadUserOverrideable:(id)a3;
@end

@implementation RMModelAccountExchangeDeclaration_SMIMESigning

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enabled";
  v6[1] = @"IdentityAssetReference";
  v6[2] = @"UserOverrideable";
  v6[3] = @"IdentityUserOverrideable";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadEnabled:v12];

  [v13 setPayloadIdentityAssetReference:v11];
  v14 = (void *)MEMORY[0x263EFFA80];
  if (v10) {
    id v15 = v10;
  }
  else {
    id v15 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadUserOverrideable:v15];

  if (v9) {
    id v16 = v9;
  }
  else {
    id v16 = v14;
  }
  [v13 setPayloadIdentityUserOverrideable:v16];

  return v13;
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
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelAccountExchangeDeclaration_SMIMESigning allowedPayloadKeys];
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
        BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"IdentityUserOverrideable" forKeyPath:@"payloadIdentityUserOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
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
  v5 = [(RMModelAccountExchangeDeclaration_SMIMESigning *)self payloadEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enabled" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAccountExchangeDeclaration_SMIMESigning *)self payloadIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"IdentityAssetReference" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAccountExchangeDeclaration_SMIMESigning *)self payloadUserOverrideable];
  uint64_t v8 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"UserOverrideable" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v9 = [(RMModelAccountExchangeDeclaration_SMIMESigning *)self payloadIdentityUserOverrideable];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"IdentityUserOverrideable" value:v9 isRequired:0 defaultValue:v8];

  id v10 = (void *)[v4 copy];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelAccountExchangeDeclaration_SMIMESigning;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnabled copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadIdentityAssetReference copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadUserOverrideable copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadIdentityUserOverrideable copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentityUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end